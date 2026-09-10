Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929EA3C3F4B
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 21:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789076214; cv=none; b=YMTPbb8VoofOHzJ2N3dKWPUWZQRSreaM2+3uw5b02ZJo56SMrYydTt3/jbFnDRc1Or1PBO5fJ3XMsrX3SEG24RXmA7dEzIq5H9UBWwG69tr/STbRYamc6Gk/8c4rHUKA7vACDurBUIo98Y4HR1JcgPkyJro91oqkoZx3quQ8Exw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789076214; c=relaxed/simple;
	bh=86ALfaBa3I0PCFcy/i2qULEp9HjWms3nRQyt4oL+lY0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Yl+gDmNPStkt5GLu8znXRRP6UO9p1TQLL+1NI/DCYIuUVE6QQ0J4LEQlPc045i1w30cJm5hk7W6/LxVETVyh/qogqtz+9R3P77putkz8j2oxGC+IFN4W2FIn4zfT6qqFn1nRHqX8i7zQs7F2eOORz/Wogs8j0B2z/NiOvDnRFyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFcyHg+e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFcyHg+e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6DF61F000FF;
	Thu, 10 Sep 2026 21:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789076211;
	bh=m20Ugtl31VOizUpg/Ir1NavgGnHjXY8jWuAaMSyUzQ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lFcyHg+eepB+YqrEGNl+F1BKqjOGbo7dUjcteXzFvB+RFlbsrhrD3XU1C+z7kCPNG
	 hA9Sdo444tcZ4Hb9RsZpjcCVl9fueln4kFw8Wqj6kWY9EJK1g0njji71QmId5flKjR
	 wIIJkDdijLjlr27MoRf7m9wTeJLKBtz9iwtHdqc64dwnL8V5HPmEM8EF69u51IN2Tg
	 RddQHWFb0WAmND7oobaF5CDJw/whBYAGb+S1KiWm6ReR0HJpfaBBQPKyFKvyWXtaK7
	 +YuHTkWiHklCitYAw5ssjxAVFBsD5qxKKrJUTx5xeMS+08KlJ9RkoseDyayV7qvBJV
	 v2+fKX4yX9AJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: ppc4xx: convert irq_of_parse_and_map to
 platform_get_irq
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260910212720.70721-1-rosenp@gmail.com>
References: <20260910212720.70721-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 21:36:51 +0000
Message-Id: <20260910213651.A6DF61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Invalid free_irq() call on error path when request_irq() fails.
--

commit b94f2fec69c0e655f6872194e27d4dbff577af31
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: ppc4xx: convert irq_of_parse_and_map to platform_get_irq

This commit replaces irq_of_parse_and_map() with platform_get_irq() for
obtaining IRQ resources. It also eliminates the corresponding
irq_dispose_mapping() calls and adjusts the error handling paths.

> diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
> index 279a431ccae38..42fc1791662ba 100644
> --- a/drivers/dma/ppc4xx/adma.c
> +++ b/drivers/dma/ppc4xx/adma.c

[ ... ]

> @@ -3956,14 +3954,13 @@ static int ppc440spe_adma_setup_irqs(struct ppc44=
0spe_adma_device *adev,
>  	return 0;
> =20
>  err_req2:
> +	if (adev->err_irq > 0)
> +		free_irq(adev->err_irq, chan);

[Severity: Medium]
Will this added free_irq() trigger a kernel warning ("Trying to free
already-free IRQ") if we reach this path because the error IRQ request
itself failed?

In ppc440spe_adma_setup_irqs(), if request_irq() fails for adev->err_irq,
the code jumps directly to err_req2:

	ret =3D request_irq(adev->err_irq, ppc440spe_adma_err_handler, ...);
	if (ret) {
		dev_err(adev->dev, "can't request irq %d\n", adev->err_irq);
		*initcode =3D PPC_ADMA_INIT_IRQ2;
		ret =3D -EIO;
		goto err_req2;
	}

Since the IRQ was not successfully requested when this failure path is take=
n,
unconditionally calling free_irq() here will attempt to free an unallocated
IRQ.

Should we track whether the IRQ was successfully requested before freeing i=
t,
or perhaps introduce a separate error label to avoid this?

>  	free_irq(adev->irq, chan);
>  err_req1:
> -	irq_dispose_mapping(adev->irq);
>  err_irq_map:
> -	if (adev->err_irq > 0) {
> -		if (atomic_dec_and_test(&ppc440spe_adma_err_irq_ref))
> -			irq_dispose_mapping(adev->err_irq);
> -	}
> +	if (adev->err_irq > 0)
> +		atomic_dec(&ppc440spe_adma_err_irq_ref);
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910212720.7072=
1-1-rosenp@gmail.com?part=3D1
