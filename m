Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3196A3A1A55
	for <dmaengine@vger.kernel.org>; Tue, 23 Jun 2026 06:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782195399; cv=none; b=LJLfJxsmaN7OSwFmC3lvlP9hdrQpylgZYDxznFMtLV9Zp9QgPyuNlnXlsNGkkwo/RfSjtyoRDCAv0xUZm9fKKpas0wCTkUkg2KYmZlokgQMqncQ2Jhv4hnatWC8ZXiPnfA18fVGtvjVldaCXB2K+AxWM1ipJO8FJnU34G7OcT14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782195399; c=relaxed/simple;
	bh=dFg9rND19J9MMUPvOZwwKcJ1DALPRptL26j55aDPEo8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pcLvG1RqkXuJMHBLlJXX0JLGvWOiV5/1Hrv54RKs4shuXpGhs9MlR380MRtTpe33im0K95SNlU1bMm6zj6XmlxT4/sE/hhT3fOo/+ZtjgYuR12AqGT1jHO8YR+RPliVgTeamsuTf7b5hTT6H1EZFTYkerKV6LuNKg0L9uscNwa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ohp6WnVp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ohp6WnVp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D36061F00A3A;
	Tue, 23 Jun 2026 06:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782195398;
	bh=CwBTr9IWsN1nEq0jJvMIx7ROtEVMxCYGRXBXUeYA+Kg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ohp6WnVph6Q5OrbcbPMRfnrybFYfvV57UpVKaA8Wzkz/3nq6wr5LZ0SgpqUBe6XRX
	 H+SZFrSXx7QcMH8OghPk/q5EIcQVan1Xlr1M2YiuGU6kV01iDEtA/FKx8t7vo2oM0X
	 Y1mf5AYHd9DV+6xf6kjhLARiUcXO8Vk82luzjqCA3K6Bt+gjKPhSVIImINBS3uO2Nc
	 QvvGHPhATOg+7bnsJTVlUXWwgjmFIHCBWpIcPwsUW9AWKcxR3k38AISwG6mhW8DS+5
	 xE0p5wqbKCAIbEuK4/+gFlVfeIvu2Y1DnhFihip6s4IgPEhpUcUTnDruHA2viLNfRu
	 2j37eIncJ1jvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: altera-msgdma: fail probe when reset times
 out
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260623060554.13523-1-pengpeng@iscas.ac.cn>
References: <20260623060554.13523-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 06:16:37 +0000
Message-Id: <20260623061637.D36061F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing dma_async_device_unregister() on probe error path leads to=
 Use-After-Free
- [High] IRQ handler requested before data structures are initialized, risk=
ing NULL pointer dereference
--

commit 4e931dfaccbe922ddc5a4a0f0f0b3dd9e532e207
Author: Pengpeng Hou <pengpeng@iscas.ac.cn>

dmaengine: altera-msgdma: fail probe when reset times out

This commit updates msgdma_reset() to return an error code when the
controller fails to reset. It also modifies msgdma_probe() to abort the
probe process if the reset times out, preventing the registration of a DMA
engine backed by a stalled controller.

> diff --git a/drivers/dma/altera-msgdma.c b/drivers/dma/altera-msgdma.c
> --- a/drivers/dma/altera-msgdma.c
> +++ b/drivers/dma/altera-msgdma.c
[ ... ]
> @@ -896,7 +899,9 @@ static int msgdma_probe(struct platform_device *pdev)
>  		goto fail;
>  	}
> =20
> -	msgdma_reset(mdev);
> +	ret =3D msgdma_reset(mdev);
> +	if (ret)
> +		goto fail;

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a potential memory
issue in the error handling path just after this code. If
of_dma_controller_register() fails later in the probe, the code branches to
the fail label:

msgdma_probe() {
    ...
    ret =3D dma_async_device_register(dma_dev);
    if (ret)
        goto fail;

    ret =3D of_dma_controller_register(...);
    if (ret =3D=3D -EINVAL)
        ...
    else if (ret && ret !=3D -ENODEV)
        goto fail;
    ...
fail:
    msgdma_dev_remove(mdev);
    return ret;
}

Does msgdma_dev_remove() need to call dma_async_device_unregister() to clean
up the registered device?

Since mdev is allocated with devm_kzalloc(), the dma_device structure is
freed when the probe fails. Will leaving the device registered leave a
dangling pointer in the global dma_device_list leading to a use-after-free?

[Severity: High]
This is also a pre-existing issue, but looking at the earlier setup in
msgdma_probe(), could an interrupt fire before the required structures are
fully initialized?

msgdma_probe() {
    ...
    ret =3D devm_request_irq(&pdev->dev, mdev->irq, msgdma_irq_handler, ...=
);
    ...
    tasklet_setup(&mdev->irq_tasklet, msgdma_tasklet);
    dma_cookie_init(&mdev->dmachan);
    spin_lock_init(&mdev->lock);
    INIT_LIST_HEAD(&mdev->active_list);
    INIT_LIST_HEAD(&mdev->pending_list);
    ...
}

If the hardware is already asserting an interrupt during boot (for example,
left over from a bootloader), will the IRQ handler access uninitialized
structures like mdev->pending_list and trigger a NULL pointer dereference?

Should the interrupt be requested only after these data structures are safe=
ly
initialized?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623060554.1352=
3-1-pengpeng@iscas.ac.cn?part=3D1
