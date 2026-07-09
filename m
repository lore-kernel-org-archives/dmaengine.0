Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63053233921
	for <dmaengine@vger.kernel.org>; Thu,  9 Jul 2026 14:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783607404; cv=none; b=CHkc6k6clTFamlp/sy248qvE6ebq6IcTnkMzHAGTbaul+mQbeAFyGlvSXkWZH/JonXXdKR0NwfVdzjYSIRh1FfTjUECWCd+zwxmZoeB7oAuw131ZfNfTFWULfJcUtthJYgtOXqL69Di00rSyUKrWu/krkDYSK727m/vdfn+j3Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783607404; c=relaxed/simple;
	bh=/hMth07l43DslWq/nkAsG5SnSrYk6MYWVMKE2LR6Hu8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FN3SbLeaSDAd3zBHplndOWheFxQunlSGU96mbcoOvnWxgj1MfckMc31ckM7Eb13zLUsCIRquyP4dtH9gII3b1CkI9IhBA6hAGZcQZzCtqt/8VO5gYJCxueMieOA7s772IoSCCmWuMdIKkiPrLPHO4jb7HEZQn01guWXX5jqgQHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G9nhsAtj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G9nhsAtj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89541F000E9;
	Thu,  9 Jul 2026 14:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783607403;
	bh=RNAgaE0PjgGdM2V+A1VyRtQcLA8kWHDIq2n1kwTt0oU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G9nhsAtjki6wPVZ+Bsl4fZBLEpH8loXrrjR5f425s6rPLK3jwyWBgd/BxTPZux5S5
	 DtxL97InIjazi9X5a1QeGECTG1vjbKXlCVlK2l1Mfgx4KVQcKlJT2nVQwroQc1LV7i
	 9wl5gXUHm7v725FMo0jW/XaxIHtbehrz/Oo3+6jGfsq5tQWhcYnaIGe+v1/5xfX/v0
	 615+ZtHiVhLvSIOu97mxHNmKjtp7e1X9/mKN/ZgPWaSri29ZrmSRwhoFGT7i7oBfYZ
	 tnmggeCqIWJLYeKGk/raxPyIJNqziWUWfgXZpziSmSnPZv2TRwRi2OAMdyjwgnpk7u
	 15fUZAIPe1oew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 18/26] dmaengine: stm32-stm32-dma: Remove redundant
 dev_err()/dev_err_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pan Chuang" <panchuang@vivo.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260709135846.97972-19-panchuang@vivo.com>
References: <20260709135846.97972-1-panchuang@vivo.com>
 <20260709135846.97972-19-panchuang@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 14:30:02 +0000
Message-Id: <20260709143002.B89541F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Dangling pointer in `irqaction->name` leads to a Use-After-Free re=
ad when accessing `/proc/interrupts` on probe failure due to premature devi=
ce name deallocation.
--

--- Patch [18]: [PATCH 18/26] dmaengine: stm32-stm32-dma: Remove redundant =
dev_err()/dev_err_probe() ---
commit deae2b976db4b82d7a92a5e0ad3b7fc0fc39d45b
Author: Pan Chuang <panchuang@vivo.com>

dmaengine: stm32-stm32-dma: Remove redundant dev_err()/dev_err_probe()

This commit removes redundant driver-specific error logging when
devm_request_irq() fails. The core now logs detailed error messages
automatically.

> diff --git a/drivers/dma/stm32/stm32-dma.c b/drivers/dma/stm32/stm32-dma.c
> index d3ad78562a140..51cb2328a8e19 100644
> --- a/drivers/dma/stm32/stm32-dma.c
> +++ b/drivers/dma/stm32/stm32-dma.c
> @@ -1669,12 +1669,8 @@ static int stm32_dma_probe(struct platform_device =
*pdev)
>  		ret =3D devm_request_irq(&pdev->dev, chan->irq,
>  				       stm32_dma_chan_irq, 0,
>  				       dev_name(chan2dev(chan)), chan);
> -		if (ret) {
> -			dev_err(&pdev->dev,
> -				"request_irq failed with err %d channel %d\n",
> -				ret, i);
> +		if (ret)
>  			goto err_unregister;

[Severity: High]
This is a pre-existing issue, but does this error path leave a dangling
pointer in the IRQ subsystem?

In stm32_dma_probe(), the devm_request_irq() call uses
dev_name(chan2dev(chan)) as the IRQ name. The IRQ subsystem stores this
pointer directly in irqaction->name without copying the string.

If the probe function fails and jumps to err_unregister,
dma_async_device_unregister() is called:

err_unregister:
	dma_async_device_unregister(dd);

This unregisters the channel devices and frees their kobject name strings.
Since the IRQs are devm-managed, they remain active until the probe function
completely returns and devres_release_all() cleans them up.

During this window, can a concurrent read of /proc/interrupts access the
freed device name string?

> -		}
>  	}
> =20
>  	ret =3D of_dma_controller_register(pdev->dev.of_node,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709135846.9797=
2-1-panchuang@vivo.com?part=3D18
