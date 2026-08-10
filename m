Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DA53AFD1E;
	Mon, 10 Aug 2026 10:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786357937; cv=none; b=hca4Q7TePIbKdXB1C+iUNAkOPuT85JNlzyLoIMeHTMHY/8QVcuXahOAg5V42MDfNXW5ZH8rjC93xxVRb9P6dt056uBQCAKJs1q3UNqS49ndASJSBQiFj+adsCtIMTxDs/BNCQIV0HYEZFjT8Fe0ej63txP2Hv7iyfaxG8Z8JHg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786357937; c=relaxed/simple;
	bh=gcVZYAVVRjiIxWsmvgOz4mjgywzDJGf7DmIfyhj6DV4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kvstnbu2Xa71fFZd0mu4Hv6ySgek8ZdONzJ4EFnykS5aWtJarmkrIPZmE/na0dK8bN8BqEgF5g5AZjXqVzbtQh7h8NsMvdU27MGNMEGS3HoeiQb1X4cGycDQJNNugxDXUUow8klfA2MySzqjAhhvouSx5I79zZvdouxYWaBtu7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BS35+SBm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BS35+SBm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510241F000E9;
	Mon, 10 Aug 2026 10:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786357935;
	bh=4XLakNdnA12f/Bj9EvdWHTKIxnrNcRr2+AAu2bcS+mg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BS35+SBme0naIFryJgDhbyV3lwJiuTma70abK+c17E0CbhYgb5PWf/WJ0Amna3xO0
	 MYZjFD7T6Rj/W69CUpcSg0CuvqiLT/lCP/WixKHyoRQDh3hy7j3leld9h8ss+7buFs
	 QFb3R31OXPDJi7stxBYjqkaRdJQoZlJeje5XpzQHAqU7kUZ3ZAddozkkKFRw4n6noW
	 /vrQU/xk4OWCijpPs1qO4cxKNNZ93asypgvMT60oOWbA9bHRLCUOjI1R8/BRcEnmd9
	 rx5bmQesZyjt80SL43Wa4Ojn99zVnpY/ko6R7kkE3fKzDFrr4hlH5JINv2iS2pMTpQ
	 RgyejymG7E8xg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: sun6i: fix use-after-free in descriptor
 error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chaithanya Lagisetty" <nagachaithanya9911@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, linux-sunxi@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260810102044.1725649-1-nagachaithanya9911@gmail.com>
References: <20260810102044.1725649-1-nagachaithanya9911@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 10:32:14 +0000
Message-Id: <20260810103215.510241F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing validation for `period_len` and `buf_len` in `sun6i_dma_pr=
ep_dma_cyclic` leads to a division by zero or a NULL pointer dereference.
- [High] Missing validation for `sg_len =3D=3D 0` in `sun6i_dma_prep_slave_=
sg` leads to hardware being programmed with physical address 0x0.
- [High] Integer truncation in the interrupt handler loop bound causes inte=
rrupts from channels >=3D 8 to be permanently ignored on SoCs with non-mult=
iple-of-8 channels (e.g., sun8i-h3).
--

--- Patch [1]: [PATCH] dmaengine: sun6i: fix use-after-free in descriptor e=
rror path ---
commit 815343fddc5f554759b857f782dbda4a7c8b1a7a
Author: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>

dmaengine: sun6i: fix use-after-free in descriptor error path

The err_lli_free cleanup loops in sun6i_dma_prep_slave_sg() and
sun6i_dma_prep_dma_cyclic() free each LLI node with dma_pool_free()
and then dereference the freed node to obtain v_lli_next and
p_lli_next for the next loop iteration.

> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index a9a254dbf8cb9..2c163ab22af5c 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -720,10 +720,10 @@ static struct dma_async_tx_descriptor *sun6i_dma_pr=
ep_slave_sg(
>  	struct sun6i_dma_dev *sdev =3D to_sun6i_dma_dev(chan->device);
>  	struct sun6i_vchan *vchan =3D to_sun6i_vchan(chan);
>  	struct dma_slave_config *sconfig =3D &vchan->cfg;
> -	struct sun6i_dma_lli *v_lli, *prev =3D NULL;
> +	struct sun6i_dma_lli *v_lli, *v_next, *prev =3D NULL;
>  	struct sun6i_desc *txd;
>  	struct scatterlist *sg;
> -	dma_addr_t p_lli;
> +	dma_addr_t p_lli, p_next;
>  	u32 lli_cfg;
>  	int i, ret;
> =20

[Severity: High]
This is a pre-existing issue, but I noticed there is no validation for
sg_len =3D=3D 0.

If a caller provides an empty scatterlist, the txd is allocated but the
for_each_sg() loop is skipped:

drivers/dma/sun6i-dma.c:sun6i_dma_prep_slave_sg() {
    ...
    for_each_sg(sgl, sg, sg_len, i) {
        ...
    }
    ...
}

This leaves txd->p_lli as 0 and txd->v_lli as NULL. When this descriptor is
executed via sun6i_dma_start_desc(), the hardware is programmed with physic=
al
address 0x0.

Could this lead to the hardware accessing physical address 0x0?

[ ... ]

> @@ -806,9 +809,9 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep=
_dma_cyclic(
>  	struct sun6i_dma_dev *sdev =3D to_sun6i_dma_dev(chan->device);
>  	struct sun6i_vchan *vchan =3D to_sun6i_vchan(chan);
>  	struct dma_slave_config *sconfig =3D &vchan->cfg;
> -	struct sun6i_dma_lli *v_lli, *prev =3D NULL;
> +	struct sun6i_dma_lli *v_lli, *v_next, *prev =3D NULL;
>  	struct sun6i_desc *txd;
> -	dma_addr_t p_lli;
> +	dma_addr_t p_lli, p_next;
>  	u32 lli_cfg;
>  	unsigned int i, periods =3D buf_len / period_len;

[Severity: High]
This is a pre-existing issue, but is it possible for period_len to be 0 her=
e,
leading to a division by zero?

Additionally, if buf_len < period_len, periods evaluates to 0, which skips
the allocation loop. This leaves prev as NULL, and causes a NULL pointer
dereference later in the function:

drivers/dma/sun6i-dma.c:sun6i_dma_prep_dma_cyclic() {
    ...
    prev->p_lli_next =3D txd->p_lli;      /* cyclic list */
    ...
}

Should we validate period_len and buf_len before performing this division?

[ ... ]

While reviewing this code, I also noticed another pre-existing issue in the
interrupt handler.

[Severity: High]
This is a pre-existing issue, but I noticed a potential truncation in the
channel group calculation for the interrupt handler.

drivers/dma/sun6i-dma.c:sun6i_dma_interrupt() {
    ...
    for (i =3D 0; i < sdev->num_pchans / DMA_IRQ_CHAN_NR; i++) {
        ...
    }
    ...
}

For SoCs with non-multiple-of-8 channel counts (like sun8i-h3 with 12
channels), 12 / 8 evaluates to 1. This causes the handler to only process
channels 0-7 and completely skip channels 8-11.

Could this result in unhandled interrupts and system hard lockups if a DMA
transfer completes on channels 8-11?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810102044.1725=
649-1-nagachaithanya9911@gmail.com?part=3D1
