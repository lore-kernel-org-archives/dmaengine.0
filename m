Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DD1385D9D
	for <dmaengine@vger.kernel.org>; Wed, 12 Aug 2026 16:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786552157; cv=none; b=fxXSacL3qop5UbLLUHgIaPUBu59bn1X+u3ce9BL+bdMIaL4oHn0V/HZFVLGaVF+TV98xN2E88PUUCfJFn6BUsUduBx+eyIcg7v9cxnakjhyea8wrs8w6F7r1eoeoyIuc5D+Qdb+nCpy9rFo0R+p/sCHg6weGGgw6df4xMyVM07w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786552157; c=relaxed/simple;
	bh=nXgilpP5xOnt+DjZOcGG/c+VyX53XJKEsWontvOHqnU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hMLwGGSua3KQK5nYsUoXXVL8GTuL1GyPhCF3HlgTRGrZsEcI8OMWZcTkwaNpaHDsoXVlna8Cl2ZcEbe7EclD5viQG9fTfy0bSeMxyt6Qt4701RQX3fyUas+LSg29ySkJNbWQalINO9IBT3x37fEnaT9P9QYYY9fGWDeT60hPKTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OdnKfD3W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OdnKfD3W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB5C1F000E9;
	Wed, 12 Aug 2026 16:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786552155;
	bh=2wMFCW/1ykTdrGqd+SmgdLnLweLH4vGouRehoqAJ/EA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OdnKfD3WKjo9GY4J81m4MU3hhQ7M4+5K3D0DUZiJMldRE0vY27dhlDBaL9SKCofVp
	 Qda+BKHlawWdYrafSJeWaHrmRWaRB598qrkkiLN7XaS1/oMw4WTShb3GDxZbAn29xd
	 bpSc7FUWtXEBJT+gbJnkUe0rfN4dUK8w6j7EcYIq3pUKyxgrxz9YeEhcue01TlciUQ
	 bLuj+Iw18ZAqgFFrVLGMrkyraFZ6E8O4Xk2FiqoD2uVi1pa2V0xHygmoyFX6V0hLJ4
	 1PZGGsxZ5Ac8umnpQbh430iISHuV4pav+5+nZuzuOCOxTyLzSoIqtp5wMMHQUyKJKo
	 zjJ1o75gVAE6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 19/24] dmaengine: dw-edma: Drain LL entries for STOP
 and PAUSE
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260812155721.2807506-20-den@valinux.co.jp>
References: <20260812155721.2807506-1-den@valinux.co.jp>
 <20260812155721.2807506-20-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 16:29:15 +0000
Message-Id: <20260812162915.6FB5C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] `dw_edma_wait_termination()` loops infinitely when the hardware is=
 undergoing teardown (e.g., driver unbind) because interrupts and rechecks =
are suppressed and the stop request is never completed.
--

--- Patch [19]: [PATCH v5 19/24] dmaengine: dw-edma: Drain LL entries for S=
TOP and PAUSE ---
commit 1e80fd5741b43db059b6d11175c2e35c684806f3
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Drain LL entries for STOP and PAUSE

An EDMA_REQ_STOP or EDMA_REQ_PAUSE can arrive while hardware still owns
published LL entries. Keep the request pending until hardware consumes
them instead of discarding the ring state immediately.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index eb0fc73a4f475..1cc9fa4866b9d 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c

[ ... ]

> @@ -1598,19 +1646,27 @@ static void dw_edma_wait_termination(struct dma_c=
han *dchan)
>  	/*
>  	 * A STOP may be deferred to a later interrupt while the channel is sti=
ll
>  	 * running. Wait until that handler completes the termination.
> +	 *
> +	 * dmaengine_synchronize() cannot report an error. Returning while
> +	 * EDMA_REQ_STOP remains pending would let callers release transfer
> +	 * resources even though hardware access cannot be ruled out. Warn
> +	 * periodically, but keep waiting.
>  	 */
> -	while (time_before(jiffies, timeout)) {
> +	for (;;) {
>  		scoped_guard(spinlock_irqsave, &chan->vc.lock)
>  			stopping =3D chan->request =3D=3D EDMA_REQ_STOP;
> =20
>  		if (!stopping)
>  			return;

[Severity: High]
Could this infinite loop cause a soft lockup during device teardown?

If a client calls dmaengine_terminate_sync() concurrently with or just
before the DMA controller is unbound, dw_edma_remove() sets
chan->dw->teardown =3D true.

When teardown is set, background workers and IRQ handlers exit early without
clearing the channel status:

drivers/dma/dw-edma/dw-edma-core.c:dw_edma_queue_irq_work() {
        if (unlikely(READ_ONCE(chan->dw->teardown)))
                return;
        ...
}

Since these handlers are the only paths that clear EDMA_REQ_STOP,
the stop request is never cleared and this loop might never exit.

> +
> +		if (time_after_eq(jiffies, timeout)) {
> +			dev_warn(chan->dw->chip->dev,
> +				 "timeout waiting for channel termination; still waiting\n");
> +			timeout =3D jiffies + msecs_to_jiffies(5000);
> +		}
> +
>  		fsleep(1000);
>  	}
> -
> -	dev_warn(chan->dw->chip->dev,
> -		 "timeout waiting for channel termination\n");
>  }
> =20
>  static void dw_edma_device_synchronize(struct dma_chan *dchan)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812155721.2807=
506-1-den@valinux.co.jp?part=3D19
