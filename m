Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA4F4CA281
	for <dmaengine@vger.kernel.org>; Wed, 29 Jul 2026 14:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785337018; cv=none; b=RPNYOYR3dimol10e0zQMcWvgh+MkknVoMqB5EVO7yH3URGSwMvPSsRX63AMJ0gfHCAOis8WyO82j7sHIJW30Q8qpQwxqbcr1cS3nfiAriJLz+oAE5iordVMf8qHDcNySb4BzqKAY+cSSxqBOYpAHVjvCtb2pN9iRP2Y1hopsMYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785337018; c=relaxed/simple;
	bh=E5QG7Z60FBMnH5Pvh/OEg8zvBzhK4sAGxbye/fAN6ao=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xmlrv+M8SyLLD1DysXrCtBZD5UdeEjMwucf2t4UnuWigf3w4uDZX8uJToi/laU3HlAZIDbDhF2ZCu9nrASVixkqsqNApN0ysNiRQj/VBAA/NRDO7QlruaDAggXtC1GmZSZFSQEuU9gY/5XkXD6Xvw7qji8h99/40neX3swWQzWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b5UNeQUA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b5UNeQUA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45351F00A3E;
	Wed, 29 Jul 2026 14:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785337017;
	bh=fs+ja1BwVlOJZWYEqwNYfZ0RLE0DHhRac/llLmYE4oM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b5UNeQUAvym2Py5wsHXxk3pw8TNj2PMbTv8vuP1CooEnGKhgkZDjESJ9M/r3ijRc4
	 0RbsxB0FI03an8zMhoIcdFqZrbKw2YGPX134AHarpq8nVTkPHWH6AvrCx9YFcBr81C
	 rFPut4x9olmE0PPXlXGZvfdNY7at85BJ7Gnuhk53v8RETgd9HLl+xlFi2afxrTu2FX
	 8gXOmYpbfw4F5YO/poUkyG3wjBsRMNOdw97wcDDhll400yuojkD7JVIn65jTx1rQqO
	 5PMy7eyYkOOAojUeMufeTXKk5vnf3704jeRzN3RpHK7CRaLIxv3o7fXy/2CSIyjDSo
	 08V+MkOOg+JfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 19/24] dmaengine: dw-edma: Drain LL entries for STOP
 and PAUSE
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260729143036.3087722-20-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
 <20260729143036.3087722-20-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 14:56:56 +0000
Message-Id: <20260729145656.B45351F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Infinite loop in dw_edma_wait_termination() leading to hung tasks =
if hardware stalls or is removed.
--

--- Patch [19]: [PATCH v4 19/24] dmaengine: dw-edma: Drain LL entries for S=
TOP and PAUSE ---
commit 7c90dd7ea15ac01e52b8a14ed044dee1a6a2bfde
Author: Koichiro Den <den@valinux.co.jp>
Subject: dmaengine: dw-edma: Drain LL entries for STOP and PAUSE

This commit changes the channel termination process to wait for the
hardware to consume all published LL entries when a STOP or PAUSE is
requested, rather than discarding the ring state immediately.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index b0e3f67d3942f..977392689205f 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c

[ ... ]

> @@ -1590,18 +1638,21 @@ static void dw_edma_wait_termination(struct dma_c=
han *dchan)
>  	 * A STOP may be deferred to a later interrupt while the channel is sti=
ll
>  	 * running. Wait until that handler completes the termination.
>  	 */
> -	while (time_before(jiffies, timeout)) {
> +	for (;;) {
>  		scoped_guard(spinlock_irqsave, &chan->vc.lock)
>  			stopping =3D chan->request =3D=3D EDMA_REQ_STOP;
> =20
>  		if (!stopping)
>  			return;
> =20
> +		if (time_after_eq(jiffies, timeout)) {
> +			dev_warn(chan->dw->chip->dev,
> +				 "timeout waiting for channel termination; still waiting\n");
> +			timeout =3D jiffies + msecs_to_jiffies(5000);
> +		}
> +
>  		fsleep(1000);
>  	}

[Severity: High]
Does this change introduce a potential infinite loop? By removing the absol=
ute
timeout and converting this to an unbounded for (;;) loop, the function will
hang forever if the hardware stalls, drops an interrupt, or is
surprise-removed.

If chan->request never transitions away from EDMA_REQ_STOP (for example, if
dw->teardown is set and no further interrupts arrive),
dmaengine_terminate_sync() will block indefinitely. This could prevent driv=
er
unbind, system suspend, or process exit.

Is there a fallback mechanism to eventually break out of this loop if the
hardware never recovers?

> -
> -	dev_warn(chan->dw->chip->dev,
> -		 "timeout waiting for channel termination\n");
>  }
> =20
>  static void dw_edma_device_synchronize(struct dma_chan *dchan)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729143036.3087=
722-1-den@valinux.co.jp?part=3D19
