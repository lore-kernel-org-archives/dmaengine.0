Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEFE48C3E5;
	Wed,  7 Oct 2026 10:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370458; cv=none; b=lxw4aBccTvLhlkjyvedSn840uhA07rjPF1LQo+w24TDu4D1+fO8Ik5kKpv8HZO9QUo27frfv9hTGcK8QIm2bi/L75q27Lke0Xa3VxH1w3ecmFnM7OiK6n2ZNRLQN24/dnzVkqyB0r5iOI58Pv3xwkFDpGQh7DM3R129PAO73xCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370458; c=relaxed/simple;
	bh=gPfrsXOhUCrnZdJNLjY+JFMVKOVLr0Q5sBBd5tb1cqY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=nmceE8sxA88tfzxPo9RGrMSWmk0BBmnTfPZGQyx0g0giiQj7q08LCYH1QZ0iLDZTlaX4Hsh52YLkt8yJhYwxVZuPEUmCMxvTsVh5EBxRU9rLXTIshUkX4ZI+2i14McCJsIv0OWRtzQ7qyqq6UTuHnhVleEbknmbD8ygRl0AYyMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTPNlIr6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTPNlIr6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3031F0089C;
	Wed,  7 Oct 2026 10:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791370429;
	bh=bjxJLrrRtaqHLsxVuslzL/UtblJFg/4i7z8xzj/YVOg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jTPNlIr6btDiCnRIGGyj/NKlpSBBPP5FEgK6gdVqQ1Tx/qACKHahMiUsFrup8xjIs
	 vHfi+gtdK9ucBgdeEChXkeJtqVTdn4sBmDxPz2uqHOOVsyq6EH8Kv+NTkuGN7By6s9
	 zftG+tgeDEra7BqrdKSfWzPUyUIOOLhdAsFNb1J7LF/iTcI4hkRnPAryQ4bags/B0f
	 F0i91KitM7inqSBScyT4NZ4EPZHKMY5Y86zF1C9u8PLd6l0hv4AaFXSt7cNvtuuvSI
	 stgXYRyXRT8spnOJyTAKpSklZUFSJ44lfy/2+JPinZtB0K2G3HQYAaYp93H/1THnPn
	 0FuB8/nv3X2bQ==
Message-ID: <sashiko-outbox-162884@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 05/20] dmaengine: ti: k3-udma: move descriptor
 management to k3-udma-common.c
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261007102936.2402427-6-s-adivi@ti.com>
References: <20261007102936.2402427-1-s-adivi@ti.com>
 <20261007102936.2402427-6-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 10:53:49 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] dmaengine: ti: k3-udma: mismatched devices in dma_alloc_coherent a=
nd dma_free_coherent
- [High] dmaengine: ti: buffer overflow due to swapped tr_size and tr_count=
 in cppi5_trdesc_calc_size
- [High] dmaengine: ti: UAF and double free in udma_desc_free() during tear=
down
- [Low] dma: ti: k3-udma-common: missing <linux/module.h> inclusion
--

commit 7926401443e76f276939e13c216c32bd4d7e7504
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma: move descriptor management to k3-udma-common.c

Refactor the K3 UDMA driver by moving all DMA descriptor handling
functions from k3-udma.c to a new common library, k3-udma-common.c.
This prepares the driver for supporting new K3 UDMA v2 variant.

> diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-com=
mon.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/dma/ti/k3-udma-common.c
> @@ -0,0 +1,1244 @@
[ ... ]
> +struct udma_desc *udma_udma_desc_from_paddr(struct udma_chan *uc,
> +					    dma_addr_t paddr)
> +{
> +	struct udma_desc *d =3D uc->terminated_desc;
> +
> +	if (d) {
> +		dma_addr_t desc_paddr =3D udma_curr_cppi5_desc_paddr(d,
> +								   d->desc_idx);

[Severity: High]
Could this result in a use-after-free? During channel teardown,
udma_reset_rings() is called locklessly from udma_synchronize() or
udma_free_chan_resources(), freeing uc->terminated_desc. If the DMA ring IRQ
fires concurrently, udma_ring_irq_handler() could access d->desc_idx here
after the descriptor has been freed.

> +
> +		if (desc_paddr !=3D paddr)
> +			d =3D NULL;
> +	}
[ ... ]
> +static void udma_free_hwdesc(struct udma_chan *uc, struct udma_desc *d)
> +{
> +	if (uc->use_dma_pool) {
[ ... ]
> +	} else if (d->hwdesc[0].cppi5_desc_vaddr) {
> +		dma_free_coherent(uc->dma_dev, d->hwdesc[0].cppi5_desc_size,
> +				  d->hwdesc[0].cppi5_desc_vaddr,
> +				  d->hwdesc[0].cppi5_desc_paddr);

[Severity: High]
Is it possible to pass mismatched device pointers to the DMA mapping API he=
re?
In udma_alloc_tr_desc(), the coherent memory is allocated using the parent
controller device uc->ud->dev. However, here it is freed using uc->dma_dev.
If the channel is configured for specific coherency, uc->dma_dev differs fr=
om
uc->ud->dev, which could cause issues during unmapping.

> +
> +		d->hwdesc[0].cppi5_desc_vaddr =3D NULL;
> +	}
> +}
[ ... ]
> +void udma_desc_free(struct virt_dma_desc *vd)
> +{
> +	struct udma_dev *ud =3D to_udma_dev(vd->tx.chan->device);
> +	struct udma_chan *uc =3D to_udma_chan(vd->tx.chan);
> +	struct udma_desc *d =3D to_udma_desc(&vd->tx);
> +	unsigned long flags;
> +
> +	if (uc->terminated_desc =3D=3D d)
> +		uc->terminated_desc =3D NULL;

[Severity: High]
Might this lead to a double-free or list corruption? Since this check is
performed locklessly, both udma_reset_rings() and udma_ring_irq_handler()
could concurrently evaluate this to true and attempt to free the same
descriptor.

> +
> +	if (uc->use_dma_pool) {
> +		udma_free_hwdesc(uc, d);
[ ... ]
> +static struct udma_desc *udma_alloc_tr_desc(struct udma_chan *uc,
> +				     size_t tr_size, int tr_count,
> +				     enum dma_transfer_direction dir)
> +{
[ ... ]
> +	if (uc->use_dma_pool) {
> +		hwdesc->cppi5_desc_size =3D uc->config.hdesc_size;
> +		hwdesc->cppi5_desc_vaddr =3D dma_pool_zalloc(uc->hdesc_pool,
> +							   GFP_NOWAIT,
> +							   &hwdesc->cppi5_desc_paddr);
> +	} else {
> +		hwdesc->cppi5_desc_size =3D cppi5_trdesc_calc_size(tr_size,
> +								 tr_count);

[Severity: High]
Can this cause an out-of-bounds DMA access? The helper
cppi5_trdesc_calc_size() expects arguments in the order of tr_count, tr_siz=
e,
but they are swapped here. Because the sizing formula scales differently, t=
his
results in a smaller allocated buffer whenever tr_count is greater than
tr_size.

> +		hwdesc->cppi5_desc_size =3D ALIGN(hwdesc->cppi5_desc_size,
> +						uc->ud->desc_align);
> +		hwdesc->cppi5_desc_vaddr =3D dma_alloc_coherent(uc->ud->dev,
> +							      hwdesc->cppi5_desc_size,
> +							      &hwdesc->cppi5_desc_paddr,
> +							      GFP_NOWAIT);
> +	}
[ ... ]
> +MODULE_DESCRIPTION("Texas Instruments K3 UDMA Common Library");
> +MODULE_LICENSE("GPL v2");

[Severity: Low]
This isn't a bug, but there seems to be a missing include for linux/module.h
which is required for module macros like MODULE_DESCRIPTION and
MODULE_LICENSE.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007102936.2402=
427-1-s-adivi@ti.com?part=3D5
