Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA36137C90A;
	Mon,  6 Jul 2026 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350616; cv=none; b=G0OV2HzwHMw9gAugreaZSrIvDump5KgHPD5D6GWeNQ/AMIx+kQeHEdcESKHKLnd7zKiz1mPP69aFkUlUnzGhSb7O8dp525kaPpGpIQFLoBbVh7zn4W+veDHJAztmtHbeif+n0VnzFvjMatBMDhZU+6TRv0bMv/tcLlNYBXzTCoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350616; c=relaxed/simple;
	bh=wXP+btH3ALEIpYuBSBCjDUKsqpjYNemQSPBrzLpH2iA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a1o8gUGMGNCAwQloRwfu7/tOVbqfCMtWgM1yN2ym9Ct4bEHzYLXIlboJ5LUEaZS282AyyYFDd87gVg/SCPTpvMJDLUj/XN/6Pfx+yyl/9tvZYSNJ9oToWbgvFq95g03z8JVcd2/7qzi/uD/1IxF1OCaBkk6CZBoqyXBh2XGBtBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Un9uI6WW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Un9uI6WW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 269FF1F000E9;
	Mon,  6 Jul 2026 15:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783350615;
	bh=aBKrfln9Mns6ronAI2+i33llBL/Qiynl6ymEyPUIzd0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Un9uI6WW4kFrko4ptl9x3BkSmg74VhomzHbgKpONURxgpSEfNxITJlLTY4uMOcEbG
	 pZagI+YTh0acbcVPWbHU1vsUVNbsr3RvoyKquVDG9oYUY4knVr/QTVhFRezl9ywdu/
	 /jpsGSRa+gje0dZSpE9KAMoA/m1MLpER4WsiYfYQL5p4kLIrHxSTDrJ/0hcyrvK6JP
	 3b4jARH0NP784rHJaa2GbHjgkG7xaj/mehiWXztIUIhTYwQGoaF/aHShw2wn18si6C
	 4s+sb9QTX/RfKW4/nHMyzmgZbrwi9iCOW4BcVpyv6v48eUjMWBhJQfalaBVqss5+yQ
	 5DlMjHDoRCmFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: fl1-edma: Add error handling for
 devm_kasprintf
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <2026070605-frying-fling-b9c5@gregkh>
References: <2026070605-frying-fling-b9c5@gregkh>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 15:10:14 +0000
Message-Id: <20260706151015.269FF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver masks `-EPROBE_DEFER` from both `platform_get_irq()` an=
d `platform_get_irq_optional()`.
- [High] Missing explicit cleanup of `txirq_16_31` in `fsl_edma_irq_exit()`=
 creates a race condition during module removal.
- [High] Use of `BIT()` instead of `BIT_ULL()` with a `u64` bitmask causes =
shift out of bounds on 32-bit platforms.
--

commit dcca75c04a71e337392f5a5707b96105b925f750
Author: Griffin Kroah-Hartman <griffin@kroah.com>

dmaengine: fl1-edma: Add error handling for devm_kasprintf
   =20
Add error handling statement to fls_edma3_irq_init() for the
devm_kasprintf call.

> diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
> index 36155ab1602a9..d9fb717b5b53c 100644
> --- a/drivers/dma/fsl-edma-main.c
> +++ b/drivers/dma/fsl-edma-main.c
> @@ -414,6 +414,8 @@ static int fsl_edma3_irq_init(struct platform_device =
*pdev, struct fsl_edma_engi
> =20
>  		errirq_name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-err",
>  					     dev_name(&pdev->dev));
> +		if (!errirq_name)
> +			return -ENOMEM;
> =20
>  		ret =3D devm_request_irq(&pdev->dev, fsl_edma->errirq, fsl_edma3_err_h=
andler_shared,
>  				       0, errirq_name, fsl_edma);

[Severity: High]
This isn't a bug introduced by this patch, but while modifying=20
fsl_edma3_irq_init(), does the driver mask -EPROBE_DEFER from=20
platform_get_irq() and platform_get_irq_optional()?

drivers/dma/fsl-edma-main.c:fsl_edma3_irq_init() {
    ...
		fsl_chan->txirq =3D platform_get_irq(pdev, i);
		if (fsl_chan->txirq < 0)
			return  -EINVAL;
    ...
		fsl_edma->errirq =3D platform_get_irq_optional(pdev, fsl_edma->n_chans);
		if (fsl_edma->errirq < 0)
			return 0; /* dts miss err irq, treat as no err irq case */
    ...
}

If either of these functions return -EPROBE_DEFER because the IRQ controller
is not yet ready, discarding the error code converts a recoverable probe
deferral into a permanent initialization failure or a silent missing interr=
upt.

[Severity: High]
This is a pre-existing issue, but can the chan_masked check result in an=20
out-of-bounds shift on 32-bit platforms?

drivers/dma/fsl-edma-main.c:fsl_edma3_irq_init() {
    ...
	for (i =3D 0; i < fsl_edma->n_chans; i++) {
        ...
		if (fsl_edma->chan_masked & BIT(i))
			continue;
    ...
}

Since chan_masked is a u64, using BIT(i) instead of BIT_ULL(i) produces an
unsigned long.

On 32-bit architectures, this evaluates incorrectly for channels 32-63,
proceeding with initialization for channels that should have been masked of=
f.

[Severity: High]
This is a pre-existing issue, but is there a race condition during module=20
removal due to missing cleanup of txirq_16_31?

drivers/dma/fsl-edma-main.c:fsl_edma_remove() {
    ...
	fsl_edma_irq_exit(pdev, fsl_edma);
	fsl_edma_cleanup_vchan(&fsl_edma->dma_dev);
    ...
}

During fsl_edma_remove(), the driver attempts to silence interrupts
by calling devm_free_irq() in fsl_edma_irq_exit():

drivers/dma/fsl-edma-main.c:fsl_edma_irq_exit() {
    ...
    (missing explicit free of txirq_16_31)
    ...
}

If fsl_edma_irq_exit() fails to free fsl_edma->txirq_16_31, an interrupt
can fire for channels 16-31 while fsl_edma_cleanup_vchan() is tearing down
the virtual channels.

Could this cause the handler to execute on partially destroyed state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2026070605-frying-f=
ling-b9c5@gregkh?part=3D1
