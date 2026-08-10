Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E7132939C;
	Mon, 10 Aug 2026 15:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786377161; cv=none; b=AIiwD21X1cedYt2RfaHfyyqRti1a3Y8Av8AlcAZYa3TuPd+GVtcjrH88Ddwnv2ACcwVpJkR4t2E4iy//2rmebPjrIEM6VufFqCQpqXPBeBdmdAHPaKQCRGedSte66zvD/eE6IpT76ufIfp5/mxC/wUjB2Ux953fZdRVv2FemGpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786377161; c=relaxed/simple;
	bh=K77OqxHEjCDC8nEXItsQHCEkDsImdzOZ/aMjHnpbUBM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zcy/rE+fgqn9W4BlPuOzlGa5/1Qvrjr6C2ff2FaaGr/P3jZXcjFmFgRyNfPWyNpEA0GIfOvcJt2qXK6VHvz+xoza8MiG1ggIhJP+jySXJLQTVs91faNxCsgERn+c5N6jSuf2Y9+GlnS8QIuSwbZphRGSCieEAENXZhTVXJBpeCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yn+ZuJdQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yn+ZuJdQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 380471F00A3A;
	Mon, 10 Aug 2026 15:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786377159;
	bh=qJTi4Gw0D51cr8rSLY7R6I3QTOFMloO0mAGPZqpaEnQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yn+ZuJdQ8KdQLQni0beS9dTLRhQxZjQKFE2ysI9SajQr9/lNuOU0GOTvZOcWIKXcc
	 9ZI7huyD9MYCo0PE21mn0ztsZpVlimIU2jjw54BQP6tYzCMoKP1Lu6fRQ+BcloAJhi
	 rD0TzLUMtZCjmVr40gySwzz7rwHGhipsA+Cw7RYLYgVoUPp9CshVc7SvShLiz6s6E6
	 SGUsJGwzA1LU3QX/BCUp9BgIxnOXNzpi2Bfd36C4E32TxXlt7Af9RC6W+h6YSANjkb
	 268GlybI+DRu+/hWNRNigeyxSYosf5nXH979higfPREURIp2uiD6kC9xfcp8Yngifk
	 TlEZlZg1d+l0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 06/19] dmaengine: ti: k3-udma: move ring management
 functions to k3-udma-common.c
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260810151423.1948224-7-s-adivi@ti.com>
References: <20260810151423.1948224-1-s-adivi@ti.com>
 <20260810151423.1948224-7-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 15:52:38 +0000
Message-Id: <20260810155239.380471F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Lockless check and free of `uc->terminated_desc` in `udma_reset_ri=
ngs` races with the ring IRQ handler, leading to a double free and memory c=
orruption.
--

--- Patch [6]: [PATCH v8 06/19] dmaengine: ti: k3-udma: move ring managemen=
t functions to k3-udma-common.c ---
commit 0d8096a9286d7cd074f83a1328af2729690e353f
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma: move ring management functions to k3-udma-common.c
   =20
Relocate the ring management functions such as push, pop, and reset
from k3-udma.c to k3-udma-common.c file. These operations are
common across multiple K3 UDMA variants and will be reused by
future implementations like K3 UDMA v2. No functional changes intended.

> diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-com=
mon.c
> index 3130805a8ec40..3ec5cc932280c 100644
> --- a/drivers/dma/ti/k3-udma-common.c
> +++ b/drivers/dma/ti/k3-udma-common.c

[ ... ]

> @@ -1239,5 +1239,108 @@ void udma_desc_pre_callback(struct virt_dma_chan =
*vc,

[ ... ]

> +void udma_reset_rings(struct udma_chan *uc)
> +{
> +	struct k3_ring *ring1 =3D NULL;
> +	struct k3_ring *ring2 =3D NULL;
> +
> +	switch (uc->config.dir) {
> +	case DMA_DEV_TO_MEM:
> +		if (uc->rchan) {
> +			ring1 =3D uc->rflow->fd_ring;
> +			ring2 =3D uc->rflow->r_ring;
> +		}
> +		break;
> +	case DMA_MEM_TO_DEV:
> +	case DMA_MEM_TO_MEM:
> +		if (uc->tchan) {
> +			ring1 =3D uc->tchan->t_ring;
> +			ring2 =3D uc->tchan->tc_ring;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (ring1)
> +		k3_ringacc_ring_reset_dma(ring1,
> +					  k3_ringacc_ring_get_occ(ring1));
> +	if (ring2)
> +		k3_ringacc_ring_reset(ring2);
> +
> +	/* make sure we are not leaking memory by stalled descriptor */
> +	if (uc->terminated_desc) {
> +		udma_desc_free(&uc->terminated_desc->vd);
> +		uc->terminated_desc =3D NULL;
> +	}
> +}

[Severity: High]
This isn't a bug introduced by this patch, but does this lockless check and
free of uc->terminated_desc race with the ring irq handler?

When tearing down a channel, udma_free_chan_resources() calls
udma_terminate_all(), which initiates hardware teardown and drops uc->vc.lo=
ck.

When teardown finishes, a hardware interrupt can fire on another cpu:

drivers/dma/ti/k3-udma.c:udma_ring_irq_handler() {
    ...
    complete_all(&uc->teardown_completed);

    if (uc->terminated_desc) {
        udma_desc_free(&uc->terminated_desc->vd);
        uc->terminated_desc =3D NULL;
    }
}

Meanwhile, the first cpu can concurrently proceed to call udma_reset_rings()
locklessly:

drivers/dma/ti/k3-udma.c:udma_free_chan_resources() {
    udma_terminate_all(chan);
    if (uc->terminated_desc) {
        udma_reset_chan(uc, false);
        udma_reset_rings(uc);
    }
}

Since udma_reset_rings() also evaluates and frees uc->terminated_desc witho=
ut
holding a lock, can both threads evaluate it as true and trigger a double
free before either sets the pointer to NULL?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810151423.1948=
224-1-s-adivi@ti.com?part=3D6
