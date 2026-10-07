Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB32493D4F;
	Wed,  7 Oct 2026 11:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371588; cv=none; b=HAdKgpiRDpq5k/tXnOm0fJUZeDG7UIVbau11x21ftyZ6Wk1vkoLFk6BihwntWx76XQoOiED76kyHqcirSbQ2MI0kUPZZCOa2hE5iYxegQ/B4ZIA356Z7EbGFc7K3fLfAo7ch43cr6mHVvHh3Xtv//buSkC0XqosTuP5P+HeLBx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371588; c=relaxed/simple;
	bh=p5HX6h+CDIsJtBSDEYDv0u5BxSLvj3nvd4kc+lVkyEM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=hgIGGKatd1ARWQ4vYU7948j7OwxxhkpefJi8i7we5b4WqsfYo2A/i47CYDtrLnp8bo7zRXFY6LmmLSRr9x7NsB3Zcbkr4ql9V50kEfqrpG63POE2L8mmuRA+EoFyH8GOKFugjzStTfmlLz7jjJzAYXicK07sgu3lH4hLpB64lxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GzSIU0aA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GzSIU0aA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C60A1F0089B;
	Wed,  7 Oct 2026 11:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791371575;
	bh=HS3gcW56Dfiyp30FMgUlwtjAjhY3iTmdHAm/6aRur6M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GzSIU0aAG9WJLcLalpnshFDCOo8IA7wxJGTXqF3j8FVICSVEgpa2r4K4E/flnJwGR
	 lxhJrH3A67DRtCEMopCHId69Hvdc1/SEWdAXU88t15SVNb/FG+Mg24DxCenftEt6xp
	 NI4UY7GIshz6tof1UUdU8g7c3mQDMUn2q1Y+4bLQ+EJu0UnUXykXV3jsbJ9MfFMEUa
	 HkjV83TY76ASUeJpi9sDW6YtQp3AZtjs/u2YwpXTXrm5P17QltoMjYqd0xIMr7sGs/
	 pFOwJnDuTpk0ts/PZBuGufwOzLYJLGBbkIpaMPRxgB46bcCKYAlC311qvTJxqRfcXF
	 Uc44vkSvt3k3A==
Message-ID: <sashiko-outbox-162917@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 18/20] dmaengine: ti: k3-udma-v2: Add support for
 PKTDMA V2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20261007102936.2402427-19-s-adivi@ti.com>
References: <20261007102936.2402427-1-s-adivi@ti.com>
 <20261007102936.2402427-19-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 11:12:54 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] dmaengine: ti: hardware ring UAF on unstoppable DMA channel error =
path
- [Medium] dmaengine: ti: udma_v2_ring_irq_handler returns IRQ_NONE for val=
id RX flush
- [Medium] dmaengine: ti: DMA mapping leaks on probe and setup error paths
--

commit 49c152d7719d193b9ac7700439e03ff1c85f702b
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma-v2: Add support for PKTDMA V2

The patch adds support for PKTDMA V2 to the k3-udma driver. It introduces
changes such as static channel mapping, direct IRQs to the GIC, unified
channel space, and remote side configuration handled directly by DMA without
needing to write to PEER registers.

> diff --git a/drivers/dma/ti/k3-udma-v2.c b/drivers/dma/ti/k3-udma-v2.c
> index 0bbd7e41a8f9b..feac531a24f47 100644
> --- a/drivers/dma/ti/k3-udma-v2.c
> +++ b/drivers/dma/ti/k3-udma-v2.c
[ ... ]
> @@ -803,6 +803,155 @@ static int bcdma_v2_alloc_chan_resources(struct dma=
_chan *chan)
>  	return ret;
>  }
> =20
> +static int pktdma_v2_alloc_chan_resources(struct dma_chan *chan)
> +{
[ ... ]
> +	if (udma_is_chan_running(uc)) {
> +		dev_warn(ud->dev, "chan%d: is running!\n", uc->id);
> +		ud->reset_chan(uc, false);
> +		if (udma_is_chan_running(uc)) {
> +			dev_err(ud->dev, "chan%d: won't stop!\n", uc->id);
> +			ret =3D -EBUSY;
> +			goto err_res_free;
> +		}
> +	}
[ ... ]
> +	ret =3D request_irq(uc->irq_num_ring, udma_v2_ring_irq_handler,
> +			  IRQF_SHARED | IRQF_TRIGGER_HIGH, uc->name, uc);
> +
> +	if (ret) {

[Severity: Medium]
Will returning IRQ_NONE for a valid hardware event (like an RX flush descri=
ptor
successfully popped) break the IRQF_SHARED contract?

In udma_v2_ring_irq_handler(), if udma_pop_from_ring() returns -ENOENT, it
evaluates as true and returns IRQ_NONE:

    if (udma_pop_from_ring(uc, &paddr) || !paddr)
        return IRQ_NONE;

Since accumulating these spurious interrupts during teardown can cause the
spurious IRQ detector to permanently disable the interrupt line, does this
break all other devices sharing the IRQ?

[ ... ]
> +err_irq_free:
> +	uc->irq_num_ring =3D 0;
> +err_res_free:
> +	udma_free_tx_resources(uc);
> +	udma_free_rx_resources(uc);

[Severity: High]
Does this code free the coherent DMA memory back to the kernel pool without
disabling the hardware ring accelerator?

If the DMA channel is still running (as checked earlier in the function) and
the ring accelerator points to this freed memory, will the hardware perform
arbitrary DMA writes/reads and corrupt kernel memory?


[Severity: Medium]
Does the error path in udma_v2_probe() permanently leak coherent DMA memory?

If of_dma_controller_register() fails, it returns without calling
udma_teardown_rx_flush():

    ret =3D of_dma_controller_register(dev->of_node, udma_v2_of_xlate, ud);
    if (ret) {
        dev_err(dev, "failed to register of_dma controller\n");
        dma_async_device_unregister(&ud->ddev);
    }
    return ret;

Additionally, if dma_map_single() fails inside udma_setup_rx_flush(), does =
it
return -ENOMEM without unmapping the already-mapped resources like
rx_flush->buffer_paddr?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007102936.2402=
427-1-s-adivi@ti.com?part=3D18
