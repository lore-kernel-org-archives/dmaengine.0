Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447314;
	b=3Hyz5vzZamDVG2BaLnurHo2ipZPFgzxG8hqjyu2EaXau+1kC7RHd6//ofpiXKQmQ21UK
	 2LSbLSWT9hafcG6GXrBIXR6ycdlDeiGNybZD93izw5Wmsn1N6ejoWyN69uAL6BTDXgWHb
	 RGhYa2Ts+jOmkk5YoeuldUiESPkcoNxStbaFr2WmpmptA76+ka0/3T5O4oKKOE7+YellZ
	 /k5JAE3V/B5Z1sEMq233oIuplgo8hf4bcuxFB+MVaUs4dGa6CtT0fUHu9+dHUpxFKNZAD
	 8VeXOhKwJL5s6eFYJH5DEbuov9iNzCKHzFZxwS2A8gPItD3/bzKwGFOAM4sOt/zjOSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447314;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mrz5Cv/5bHLNxxCRNfsurN4Q359d/6omBdl+BhC7vPU=;
	b=iogFPyDcIk2p4L44WjboMWV5yrs/eAMC+LKAiyvfu+59cKPMBhQtnhAcGy7hkFu1gCpn
	 YUdvjzS/ggDE/TaecA5YqIUlppMxf7butnALJtKY1tz4gdeb2dDDfII49hsY+AfJ8QvID
	 5HcZKfQR8YHyNtORqagu4q54UpKo1/N495wyjG0mI2Kw2kuSxmgkXiW97I95cizx8ONl8
	 mNuaJ/pdTuXQM6a5yzhBfLmXN3jiMCnbyhPQUn4TPezgWCt3bQtR9g+NTie4Es+CNA9mc
	 xKXi766W1qV7lmshNI5BZgkzwT3EzSUFkvwIue3faQMu+NFzr5lnYgKwCoyBrg/QgqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VUhcEc4Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A14C606A692;
	Mon, 23 Nov 2026 15:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VUhcEc4Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A21C61F000F0;
	Mon, 23 Nov 2026 15:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795447314;
	bh=mrz5Cv/5bHLNxxCRNfsurN4Q359d/6omBdl+BhC7vPU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VUhcEc4Y1mPjLPXskb5pWHWnPiZ0p07KPNG0ADMuLnVprdlhdImsNLbmZ4FGCM/R4
	 H5XKHmFx/e3I/dZfoVCp2XcpBDZEMZcyWrg55NWwiykaxwvrcy9PAN+wtjz8YSxp+d
	 0JXfm9XorTIgvL9GaK3Gq65+RGmm0swzo7HfleqY2fe1OLZdxiac+Z9Y5Hw4k6tSGO
	 scXvoGZuRelfjuOOzCu2XQRJ88t5W/jtHziyBg4fZ4/yr9GVi38JIcXhsAAW2mMzBM
	 yzvdPm18xKJWUv3pCP6Bp2kDh5TTL8w+L4AlCn1/He/9P+3Ez9z0aK+Up2nS1S9xA8
	 cZWSiTFjR8+kA==
Message-ID: <sashiko-outbox-229538@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 14/28] dmaengine: bcm2835: Use dma_map_resource() to
 translate slave addresses
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrea della Porta" <andrea.porta@suse.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261123145728.29082-15-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-15-andrea.porta@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 15:21:53 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] dmaengine: bcm2835: inverted DMA direction in
  bcm2835_dma_slave_config()
- [Medium] dmaengine: bcm2835: redundant slave remapping in
  bcm2835_dma_slave_config()
--

commit d1ee75073d9e0c52f103b1cc6d74fd59a5d9e874
Author: Andrea della Porta <andrea.porta@suse.com>

dmaengine: bcm2835: Use dma_map_resource() to translate slave addresses

This commit translates slave FIFO physical addresses in
bcm2835_dma_slave_config() via dma_map_resource(), falling back to parent
bus range translation when the peripheral window is absent from
dma-ranges.

Link: https://lore.kernel.org/linux-arm-kernel/ee19a95d-fe1e-4f3f-bc81-bdef=
38475469@arm.com/
Link: https://lore.kernel.org/all/CAPY8ntByJYzSv0kTAc1kY0Dp=3DvwrzcA0oWiPpy=
g7x7_BQwGSnA@mail.gmail.com/

> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> index f8b2202096d65..3ff30c41dc63f 100644
> --- a/drivers/dma/bcm2835-dma.c
> +++ b/drivers/dma/bcm2835-dma.c

[ ... ]

> @@ -798,11 +821,30 @@ static int bcm2835_dma_alloc_chan_resources(struct =
dma_chan *chan)
>  			   c->irq_flags, "DMA IRQ", chan);
>  }
> =20
> +static void bcm2835_dma_unmap_slave_addr(struct dma_chan *chan,
> +					 struct bcm2835_slave_addr *sa,
> +					 enum dma_data_direction dir)
> +{
> +	if (sa->mapped)
> +		dma_unmap_resource(chan->device->dev, sa->addr, sa->size, dir, 0);
> +
> +	memset(sa, 0, sizeof(*sa));
> +}
> +
> +static void bcm2835_dma_unmap_slave_addrs(struct dma_chan *chan)
> +{
> +	struct bcm2835_chan *c =3D to_bcm2835_dma_chan(chan);
> +
> +	bcm2835_dma_unmap_slave_addr(chan, &c->slave_src, DMA_FROM_DEVICE);
> +	bcm2835_dma_unmap_slave_addr(chan, &c->slave_dst, DMA_TO_DEVICE);
> +}

[ ... ]

> @@ -1019,10 +1061,87 @@ static struct dma_async_tx_descriptor *bcm2835_dm=
a_prep_dma_cyclic(
>  	return vchan_tx_prep(&c->vc, &d->vd, flags);
>  }
> =20
> +/*
> + * Device trees which do not describe the peripheral window in dma-ranges
> + * are handled by assuming that the legacy DMA channels see the peripher=
als
> + * at the same address as the bus they sit on, i.e. by reverting the
> + * translation described by the ranges property of the parent bus. This =
is
> + * how the VideoCore bus addresses have always been derived. Addresses w=
hich
> + * are not CPU physical addresses of that bus are passed through unchang=
ed,
> + * as legacy clients used to provide bus addresses.
> + */
> +static u64 bcm2835_dma_legacy_bus_addr(struct device *dev, phys_addr_t p=
hys)
> +{
> +	struct device_node *bus =3D of_get_parent(dev->of_node);
> +	struct of_range_parser parser;
> +	struct of_range range;
> +	u64 addr =3D phys;
> +
> +	if (bus && !of_range_parser_init(&parser, bus)) {
> +		for_each_of_range(&parser, &range) {
> +			if (phys >=3D range.cpu_addr &&
> +			    phys - range.cpu_addr < range.size) {
> +				addr =3D range.bus_addr + (phys - range.cpu_addr);
> +				break;
> +			}
> +		}
> +	}
> +
> +	of_node_put(bus);
> +
> +	return addr;
> +}
> +
> +static int bcm2835_dma_map_slave_addr(struct dma_chan *chan,
> +				      struct bcm2835_slave_addr *sa,
> +				      phys_addr_t phys,
> +				      enum dma_slave_buswidth width,
> +				      enum dma_data_direction dir)
> +{
> +	struct bcm2835_dmadev *od =3D to_bcm2835_dma_dev(chan->device);
> +	struct device *dev =3D chan->device->dev;
> +	size_t size =3D width ? width : DMA_SLAVE_BUSWIDTH_4_BYTES;
> +
> +	if (!phys)
> +		return 0;
> +
> +	if (!od->map_resource) {
> +		sa->addr =3D od->cfg->legacy_bus_addr(dev, phys);
> +		return 0;
> +	}
> +
> +	sa->addr =3D dma_map_resource(dev, phys, size, dir, 0);
> +	if (dma_mapping_error(dev, sa->addr)) {
> +		dev_err(dev, "failed to map slave address %pa\n", &phys);
> +		sa->addr =3D 0;
> +		return -EINVAL;
> +	}
> +
> +	sa->size =3D size;
> +	sa->mapped =3D true;
> +
> +	return 0;
> +}
> +
>  static int bcm2835_dma_slave_config(struct dma_chan *chan,
>  				    struct dma_slave_config *cfg)
>  {
>  	struct bcm2835_chan *c =3D to_bcm2835_dma_chan(chan);
> +	int ret;
> +
> +	bcm2835_dma_unmap_slave_addrs(chan);

[Severity: Medium]
Does unmapping both c->slave_src and c->slave_dst unconditionally here
cause every MMC transfer to tear down and recreate the slave mapping?

drivers/mmc/host/bcm2835.c shares one rx-tx channel and calls
dmaengine_slave_config() in bcm2835_prepare_dma() before every request,
passing either dma_cfg_rx (with dst_addr =3D 0) or dma_cfg_tx (with
src_addr =3D 0).  When !od->map_resource, every MMC request walks the parent
device tree node and parses ranges under devtree_lock in
bcm2835_dma_legacy_bus_addr(); when od->map_resource is true, every
request calls dma_unmap_resource() and dma_map_resource() again instead of
reusing the existing mapping.

> +
> +	ret =3D bcm2835_dma_map_slave_addr(chan, &c->slave_src, cfg->src_addr,
> +					 cfg->src_addr_width, DMA_FROM_DEVICE);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D bcm2835_dma_map_slave_addr(chan, &c->slave_dst, cfg->dst_addr,
> +					 cfg->dst_addr_width, DMA_TO_DEVICE);

[Severity: Medium]
Are DMA_FROM_DEVICE and DMA_TO_DEVICE swapped here and in
bcm2835_dma_unmap_slave_addrs()?

dma_map_resource() is called on the DMA controller device
(chan->device->dev), which is the DMA master.  For c->slave_src
(DMA_DEV_TO_MEM), the DMA controller reads from the slave FIFO, which is
DMA_TO_DEVICE (IOMMU_READ); for c->slave_dst (DMA_MEM_TO_DEV), the DMA
controller writes to the slave FIFO, which is DMA_FROM_DEVICE
(IOMMU_WRITE).  With an IOMMU or direction-checking DMA backend, the
inverted directions grant write-only permission to the source FIFO and
read-only permission to the destination FIFO.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123145728.2908=
2-1-andrea.porta@suse.com?part=3D14
