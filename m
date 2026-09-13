Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C39C351C1E
	for <dmaengine@vger.kernel.org>; Sun, 13 Sep 2026 20:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789330156; cv=none; b=apML0Fup9cGIvSDqts/H7s0ivmjgrUq/PsUK730hmntU6+Aw0Jl9IJPX+cJ1VYGpax4aifxsuDtWzvoe0vNbhWHvGUUG8IfiFchvo4dQOS3RgsyR4/QskfGMRkqK0vNzeBFo7TMEH9HgFXlDcFHE366gL5z8i3WxKRLqbQB53aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789330156; c=relaxed/simple;
	bh=Tn+0jCj0StNi26cB2wKluBCHvAT3ZLiqr3xvpJNj2H0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Iq1jnbJreh9UNTA6nAjffC+lwG9STFHY5ZThFmLXiW22UpgiZfPtLTovh25RLGkURNE31lZQJ4w1B2HK03BcBzHsxnXpg0ZiaM4dAKcTuyAHD/03w0ii1yctHF5H2WqXQTwcdTIBg+zJLOBdqNYnsfn5R5cSPNaALcxts/SYzQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FDngKZoY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FDngKZoY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A69A1F000FF;
	Sun, 13 Sep 2026 20:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789330154;
	bh=iGOCtYyNMx60YhOaxZ17TCo6N4dqFO0I+0JCwjeIa1Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FDngKZoYWw/DiN04z8Ebh38kpOrw+mmjUbquSyy+c/WWaNIEEE7424n9lrPODaxmq
	 A4k696i7bmxx3DKC8mAe0eSpOjXF5nzoBD7QlxXiXe3V+ehxPhI7B1dGhDb1la05dO
	 lnkQsEBJypS6U8uGGVWXarQ9R3bh+rnzuBspVkg6aPzNhybaT3sU37N8aGzN2MltA/
	 NgODBKGL+AE6CKIlv98S7ZAsDgOTeqFc4yGeXpjjsN2RKQLrirf58L/NUD0otR/d/O
	 KhqpnzrlqCyCCDOkQhQOLtvYdrwt6HSDKANNmwJOEkstou6RZA5DmauJxRbxx/4GrG
	 K88TH0+AqQdfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2] dmaengine: ppc4xx: convert irq_of_parse_and_map to
 platform_get_irq
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260913195547.41579-1-rosenp@gmail.com>
References: <20260913195547.41579-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 20:09:14 +0000
Message-Id: <20260913200914.9A69A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] Failure to properly handle -EPROBE_DEFER from platform_get_irq_o=
ptional(), breaking probe deferral for the error IRQ.
- [Medium] Inconsistent validation of `adev->err_irq` leads to a leaked ato=
mic reference count if IRQ 0 is returned.

Pre-existing issues:
- [High] Pre-existing memory leak of `adev->i2o_reg` virtual mappings for t=
he DMA engines on driver unbind.
- [High] Unprotected read-modify-write on the shared I2O IOPIM hardware reg=
ister.
--

commit 50a4484470a83649ae6d7a02d361e752aed3ddeb
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: ppc4xx: convert irq_of_parse_and_map to platform_get_irq

This patch replaces irq_of_parse_and_map() with platform_get_irq(), which
is the preferred way to obtain IRQ resources from platform devices, allowing
the framework to manage the mapping. It also fixes a latent bug in the error
path where the error IRQ was not freed if I2O setup failed. The device_node
np declaration is moved to a tighter scope where it is still needed.

> diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
> index 279a431ccae38..99aee726644e0 100644
> --- a/drivers/dma/ppc4xx/adma.c
> +++ b/drivers/dma/ppc4xx/adma.c
> @@ -3865,28 +3865,24 @@ static int ppc440spe_adma_setup_irqs(struct ppc44=
0spe_adma_device *adev,
>  				     int *initcode)
>  {
>  	struct platform_device *ofdev;
> -	struct device_node *np;
>  	int ret;
> =20
>  	ofdev =3D container_of(adev->dev, struct platform_device, dev);
> -	np =3D ofdev->dev.of_node;
>  	if (adev->id !=3D PPC440SPE_XOR_ID) {
> -		adev->err_irq =3D irq_of_parse_and_map(np, 1);
> -		if (!adev->err_irq) {
> +		adev->err_irq =3D platform_get_irq_optional(ofdev, 1);
> +		if (adev->err_irq < 0) {

[Severity: Medium]
Will this silently swallow the -EPROBE_DEFER error code?

If the interrupt controller is not yet ready, platform_get_irq_optional()
will return -EPROBE_DEFER. Treating all negative codes here as missing
resources prevents the driver from correctly deferring its probe.

[Severity: Medium]
Does this inconsistent validation of adev->err_irq cause a leaked atomic
reference count if IRQ 0 is returned?

If platform_get_irq_optional() returns 0, this setup path treats it as a
valid IRQ and evaluates to false, executing the else branch and incrementing
the atomic refcount.

However, as seen further down in the diff during release, the teardown path
uses if (adev->err_irq > 0) which would evaluate to false, skipping the
atomic_dec entirely and leaking the reference count.

>  			dev_warn(adev->dev, "no err irq resource?\n");
>  			*initcode =3D PPC_ADMA_INIT_IRQ2;
> -			adev->err_irq =3D -ENXIO;
>  		} else
>  			atomic_inc(&ppc440spe_adma_err_irq_ref);
>  	} else {

[ ... ]

> @@ -3987,13 +3983,10 @@ static void ppc440spe_adma_release_irqs(struct pp=
c440spe_adma_device *adev,
>  		iowrite32(mask, &adev->i2o_reg->iopim);

[Severity: High]
This is a pre-existing issue, but could this lockless read-modify-write
on the shared I2O IOPIM register cause data corruption?

Both DMA0 and DMA1 engines map the exact same ibm,i2o-440spe device tree no=
de
and access the shared physical iopim register during setup and teardown:

ppc440spe_adma_setup_irqs() {
    ...
    mask =3D ioread32(&adev->i2o_reg->iopim) & enable;
    iowrite32(mask, &adev->i2o_reg->iopim);
    ...
}

If one engine accesses ppc440spe_adma_setup_irqs() or
ppc440spe_adma_release_irqs() concurrently with the other, the lockless
ioread32() and iowrite32() sequence can race, causing one engine's updates
to silently clobber the other's and permanently break interrupts.

>  	}
>  	free_irq(adev->irq, chan);
> -	irq_dispose_mapping(adev->irq);
>  	if (adev->err_irq > 0) {
>  		free_irq(adev->err_irq, chan);
> -		if (atomic_dec_and_test(&ppc440spe_adma_err_irq_ref)) {
> -			irq_dispose_mapping(adev->err_irq);
> +		if (atomic_dec_and_test(&ppc440spe_adma_err_irq_ref))
>  			iounmap(adev->i2o_reg);

[Severity: High]
This is a pre-existing issue, but does tying the cleanup of independent
per-device allocations to a shared global refcount leak the other virtual
mappings?

Both DMA0 and DMA1 engines independently call of_iomap() in
ppc440spe_adma_setup_irqs(), allocating unique virtual mappings:

ppc440spe_adma_setup_irqs() {
    ...
    adev->i2o_reg =3D of_iomap(np, 0);
    ...
}

Because iounmap() is gated behind this shared global refcount, it only
reaches zero for the last engine released. The mapping for the first releas=
ed
engine is permanently leaked. Furthermore, if err_irq < 0, both unmaps are
bypassed entirely.

> -		}
>  	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913195547.4157=
9-1-rosenp@gmail.com?part=3D1
