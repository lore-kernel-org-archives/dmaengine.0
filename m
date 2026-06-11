Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C29440D573
	for <dmaengine@vger.kernel.org>; Thu, 11 Jun 2026 04:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781150626; cv=none; b=N7OSDdQ3MlOHC+tGOC1tC1wpKP9BoVxMg/iCYVPENHR+eTRdNAJjdwKsGDF9mEYik5VhtBjUXhThXxawQNlDXaF1R1o3H1jc8Gu1bA4hXHMSFv/1jKZn7WhoBClJ1H4SccJgGiN4cGqk20tk7xyCw/Xdib88DtCYiYjCUOBGcl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781150626; c=relaxed/simple;
	bh=79kWozNAQmVIUQm/+Ob9cobKiWtLVP4X91Rsi/qZoxo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AC6PjY0pK1hMW91jTcHiwTnuUUbiuJNs0aVnEdHc9zFSuAlwrd1fNDHAUFaO1ynTZpgm1upr4krdyhp+6hbZbxfkCD1J+MDt0jkkZdQ9OF0JPvxVjVHjhOroC+BnBRyZYmNeJnMrGRIS0lJNGai9tDEaLJbF3aRUxmngGDNe1xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CRF8UbYU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CRF8UbYU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 937421F00893;
	Thu, 11 Jun 2026 04:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781150624;
	bh=pka8pIhbnsM62zp8d9O7+58GhIK5vp5R4DlpO+4AA7k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CRF8UbYUgFm+TgkxgjyF2uAmyQ2wOnEwSaA/iNlv+n73yLw7BXiL5n+F1PRGaVhIS
	 izS8vFrX+kgh5h5VRFTQ2At/6e4yowLGvsQqhgh+RrcshDQQsWdYaTIg7P5TQsbYJN
	 /umW2yNO3EYnIJSUqFxuM2BLFXLhEUefyOyY23JU7ebm+QNGopNHBTL99LMrg2O4vO
	 R5jIWBNUkjnoFUmUGcAdonFRt8U81AyRULHGDPxiLh7HGwLezBCe11vflqiVtIcjkg
	 yn1FLoQBsi12H5eefENtSteq102ok8ad+cXqnjCNug0mqgusmJxWJSBRpTLYGK/oUM
	 e6U7x9DHfBfXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv4 05/15] dmaengine: fsldma: check
 dma_async_device_register() return value
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260611035245.13439-6-rosenp@gmail.com>
References: <20260611035245.13439-6-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 04:03:44 +0000
Message-Id: <20260611040344.937421F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Critical] Missing `fsldma_free_irqs()` in the new `dma_async_device_regi=
ster()` error path causes an IRQ leak and a critical Use-After-Free vulnera=
bility.

Pre-existing issues:
- [High] `fsl_dma_chan_remove` frees the channel structure without killing =
its associated tasklet.
--

commit f785c70429012a6e6c4030348e0a3906083e918d
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: fsldma: check dma_async_device_register() return value

This commit adds a check for the return value of dma_async_device_register()
in the probe path. It propagates the error instead of silently succeeding,
fixing a null pointer dereference during removal on registration failure.

> diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
> --- a/drivers/dma/fsldma.c
> +++ b/drivers/dma/fsldma.c
> @@ -1292,7 +1292,11 @@ static int fsldma_of_probe(struct platform_device =
*op)
>  		goto out_free_fdev;
>  	}
> =20
> -	dma_async_device_register(&fdev->common);
> +	err =3D dma_async_device_register(&fdev->common);
> +	if (err) {
> +		dev_err(fdev->dev, "unable to register DMA device\n");
> +		goto out_free_fdev;

[Severity: Critical]
If dma_async_device_register() fails here, we jump to out_free_fdev, but
what happens to the IRQs requested just prior in fsldma_request_irqs()?

The out_free_fdev cleanup path unmaps memory and frees the fdev structure,
but doesn't appear to call fsldma_free_irqs() or free_irq(). Will this leave
active IRQ handlers pointing to freed memory, leading to a use-after-free
if an interrupt fires on the shared line?

> +	}
>  	return 0;
> =20
>  out_free_fdev:

[Severity: High]
This is a pre-existing issue, but does fsl_dma_chan_remove() need to kill
the channel's tasklet before freeing the channel structure?

In the cleanup loop immediately following this label, fsl_dma_chan_remove()
is called to tear down each channel. Looking at fsl_dma_chan_remove(), it
unmaps memory and frees the chan struct via kfree() without calling
tasklet_kill(&chan->tasklet).

If a scheduled tasklet executes concurrently or immediately after the
channel is freed, will the tasklet handler dereference the freed chan
pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611035245.1343=
9-6-rosenp@gmail.com?part=3D1
