Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD13215075
	for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 17:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787248211; cv=none; b=TdmftBvfpKVCDL/swHUGBtwY8kI23t0NmzhMTganEAtGzO1qB/9a8RLr4XymMOYSgZMWqA3VJeaUz5FXl4mHDavKkwaZh7p+/bHSJt9eV9bngicJe6UwOEgtjT8rjxY6AT0DvMT63jwe4w+tV+O0M3GgwOjfpftItT/7THfjRJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787248211; c=relaxed/simple;
	bh=AizFlzdtIftuCKyZxHSYt6Ep76DwotgAbwAibwy0gxM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cpojoJFVgdr65gPy7I33Xk9Kl3kOaNaoVSNWa76Idk99CFQQpR/KaJtfxZ5bth2pbiiE1sJ7QSCZcyky26yCeX8OXUbbQeqar1jph+ed0jKD8vn3oryBH7cJww09GnO/Y+shl0J5J1e2KjD0SzkyRgkORbIIcMtkagaw7q0KAQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HmEnU5u5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HmEnU5u5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70ED01F00A3A;
	Thu, 20 Aug 2026 17:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787248209;
	bh=0x1ZRfo39zuS2fZPdbIGgpRniMM0+trf7U+HR8tQib4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HmEnU5u5/tK1n7XbFWr6oGAkRvw0EHLex64Hh/YL86WS5O0BEA/PKoPFt3Eyx+vuT
	 1V4zGDXZ/YyfJNK+41N2xFMKq8zY2rgMmZ7IkT3zbPS/TFpTg4sWarb5C31LIttqel
	 Ki6Z2jIrpODVo6Gw7Ad3uSDo7xDSKwhX/bOpihDFDcx7NGJKzie2Vfew5qyMCmw34k
	 O8Do+KyO4ja8le7NduKxcvQjGLfoOb2FoBzhXOUqjFirCwoiS6miIqRF4OHyQ314Cb
	 Qv1cu5/FGtWu3wlv++JTGSSuTXzzzFkYZabcncQmwm+YfQmDlVFuc80lkFbLHwTbvV
	 oKDZovcWPtn3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 04/10] dmaengine: dw-edma: Make DMA link list work as
 a circular buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260820173439.2004068-5-den@valinux.co.jp>
References: <20260820173439.2004068-1-den@valinux.co.jp>
 <20260820173439.2004068-5-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 17:50:09 +0000
Message-Id: <20260820175009.70ED01F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The driver explicitly rejects linked-list DMA descriptors larger t=
han the ring size, breaking support for large DMA transfers.
--

--- Patch [4]: [PATCH v6 04/10] dmaengine: dw-edma: Make DMA link list work=
 as a circular buffer ---
commit afa3e356ba74dbd5874af4d32f4fd3abdf7cbf7c
Author: Frank Li <Frank.Li@nxp.com>

dmaengine: dw-edma: Make DMA link list work as a circular buffer

This patch converts the DMA link list into a circular buffer instead of
rebuilding it for every transfer. It clears control words before first use,
rejects descriptors that exceed the usable ring capacity, and resets the
ring after termination or abort.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index a6bb68ffdfe26..1af262b6e881e 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -51,13 +51,19 @@ dw_edma_alloc_desc(struct dw_edma_chan *chan, size_t =
nburst)
>  {
>  	struct dw_edma_desc *desc;
> =20
> +	/*
> +	 * For now, a descriptor that does not fit would stall the channel
> +	 * forever: reject it up front.
> +	 */
> +	if (!chan->non_ll && nburst > chan->ll_max - 1)
> +		return NULL;
> +

[Severity: High]
Does this change break support for large DMA transfers?

By explicitly rejecting linked-list DMA descriptors larger than the ring
size, any client driver (such as storage or networking) that submits a
scatter-gather transfer larger than chan->ll_max - 1 will fail
unconditionally.

While the commit message acknowledges this as a limitation "until reclaim
support lands", that support appears to be completely missing from this
patch series.

Could this cause functional regressions for subsystems relying on this DMA
engine to submit moderately large transfers?

[ ... ]

> @@ -645,6 +708,8 @@ static void dw_edma_done_interrupt(struct dw_edma_cha=
n *chan)
>  							    DMA_TRANS_NOERROR);
>  				list_del(&vd->node);
>  				vchan_cookie_complete(vd);
> +				if (!chan->non_ll)
> +					chan->ll_done =3D chan->ll_head;
>  			}
> =20
>  			if (chan->request =3D=3D EDMA_REQ_PAUSE) {

[Severity: High]
Since ring space is only reclaimed here when an entire descriptor completes,
does this structural change prevent incrementally chunking large descriptor=
s?

Without the ability to reclaim space as partial transfers complete, this
seems to be the reason why large transfers can no longer be supported.

Could partial completions be handled here to prevent the functional regress=
ion
before the full reclaim support lands?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820173439.2004=
068-1-den@valinux.co.jp?part=3D4
