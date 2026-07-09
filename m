Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1162C1A6805
	for <dmaengine@vger.kernel.org>; Thu,  9 Jul 2026 14:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783606843; cv=none; b=CQCJeP37tCfUimiXLgLl69nOatlLKRRjos9NV7wg8zOwtxaDJivU3MCLfqHJDy+Io3o+mn5IS2PA6e7plwsqpTsrl6GkSC1KUIFEdlb+d4mit2rr6I+IyoiFHI4sAgCoMSmScYtB7qYV27oJ3tp9GSD9bIzf+QO9dVOrci5TUBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783606843; c=relaxed/simple;
	bh=tFBmDe+dfNYZMAyXZhi47FLlbJe8/efssumw08JUWuA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CsXkMngSRR1p09PF0n/+BkS6l2rWRGfP0MfgPLUD7ZYx36psPkP0txQn+z+6DUcrBQq4cbiXFCwItL16aK8QmQLdsATUtNvvuLUjrgeqYt5h3VnQYvtTI3RKezVzrEwRV9tAXyTwQo6XCHSTng+V3rcc6RGC1YNWL3K3HWDKGAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QNx1ZKFb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QNx1ZKFb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B881F00A3D;
	Thu,  9 Jul 2026 14:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783606842;
	bh=xSvcifL1DcuREpRjLOHDUfU1Kdq49V/qwpeat9PIJ2w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QNx1ZKFbjGRFBb2Jt9pHbROeuxbqUE/7nOmcDHnTUq7cHvRX/rRRc3IwJMPf97/96
	 sL0IU6M0ZuRsLqdSL8wSnuXu11YIqbhTAVRoOKfYbwj2605WntZqF86+U1Vt9bJ0wb
	 86vnBugzhV85w+YvhO3P/VXQL8P71kXRCR+tMwP6MqfyYq99jQtjisNPK7fOLp7/mi
	 NVaiJZq2MxSmnSpqZiL+4LckdYL3g9aoOiCv6Wg2PBbkd0f0p5iIwAP6PBaj/6bA6S
	 uFeWy+X/V5iDxofrzijVwRWF1JnUHircW5ZKAfGwsHpgGag9lmaFd5a90V9qewpZdo
	 rjTl8yEvj7MzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/26] dmaengine: pxa_dma: Remove redundant
 dev_err()/dev_err_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pan Chuang" <panchuang@vivo.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260709135846.97972-10-panchuang@vivo.com>
References: <20260709135846.97972-1-panchuang@vivo.com>
 <20260709135846.97972-10-panchuang@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 14:20:41 +0000
Message-Id: <20260709142041.A5B881F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The shared interrupt handler panics on `BUG_ON(!chan)` for spuriou=
s or shared interrupts.
- [High] Tasklets are not explicitly destroyed if `of_dma_controller_regist=
er()` fails, leading to a potential use-after-free.
--

--- Patch [9]: [PATCH 09/26] dmaengine: pxa_dma: Remove redundant dev_err()=
/dev_err_probe() ---
commit f2ce223752ea303da12586b72cd70a589be5a08b
Author: Pan Chuang <panchuang@vivo.com>

dmaengine: pxa_dma: Remove redundant dev_err()/dev_err_probe()

The devm_request_irq() now automatically logs detailed error messages on
failure. This eliminates the need for driver-specific dev_err() and
dev_err_probe() calls that previously printed generic messages.

> diff --git a/drivers/dma/pxa_dma.c b/drivers/dma/pxa_dma.c
> index fa2ee0b3e09f8..7bdcc5e6a3d8f 100644
> --- a/drivers/dma/pxa_dma.c
> +++ b/drivers/dma/pxa_dma.c
> @@ -1260,12 +1260,8 @@ static int pxad_init_phys(struct platform_device *=
op,
>  			ret =3D devm_request_irq(&op->dev, irq0,
>  					       pxad_int_handler,
>  					       IRQF_SHARED, "pxa-dma", pdev);
> -		if (ret) {
> -			dev_err(pdev->slave.dev,
> -				"%s(): can't request irq %d:%d\n", __func__,
> -				irq, ret);
> +		if (ret)
>  			return ret;

[Severity: High]
This isn't a bug introduced by this patch, but registering the IRQ handlers
with IRQF_SHARED exposes a potential kernel panic.

If another device sharing the IRQ line generates an interrupt, or if a
spurious interrupt occurs, the kernel calls pxad_chan_handler():

drivers/dma/pxa_dma.c:pxad_chan_handler() {
    struct pxad_phy *phy =3D dev_id;
    struct pxad_chan *chan =3D phy->vchan;
    ...
    BUG_ON(!chan);
    ...
}

If no DMA transfers are currently active, phy->vchan is NULL, leading to a
deterministic kernel panic.=20

Should the shared interrupt handler return IRQ_NONE instead of panicking
when the device has not generated an interrupt?


[Severity: High]
This is another pre-existing issue, but returning directly on failure here
or in the probe function can cause a use-after-free.

During probe, the driver exposes DMA channels by calling
dmaenginem_async_device_register() inside pxad_init_dmadev(). If the
subsequent of_dma_controller_register() call fails, it returns directly:

drivers/dma/pxa_dma.c:pxad_probe() {
    ...
    ret =3D pxad_init_dmadev(op, pdev, dma_channels, nb_requestors);
    if (ret) { ... }

    if (op->dev.of_node) {
        ret =3D of_dma_controller_register(op->dev.of_node,
                                         pxad_dma_xlate, pdev);
        if (ret < 0) {
            dev_err(pdev->slave.dev,
                "of_dma_controller_register failed\n");
            return ret;
        }
    ...
}

Because the DMA engine was temporarily registered, a concurrent non-DT
client could have requested a channel and scheduled its tasklet. When devres
automatically frees the struct pxad_chan memory upon probe failure, the
scheduled tasklet remains on the system's tasklet list.

When the tasklet executes, it will access the freed channel structure.=20

Does the error path need an explicit call to pxad_free_channels() to kill
the tasklets, similar to what is done in pxad_remove()?

> -		}
>  	}
> =20
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709135846.9797=
2-1-panchuang@vivo.com?part=3D9
