Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA42542669E;
	Fri, 24 Jul 2026 10:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784890411; cv=none; b=onwL1Eih+RO7v6dacDorY3+hfv6WcT28BbsEdHOoGaNiUz3x8jiAuQuY6oAyYPZ2aUBNZNqvE9yJKTtEpvCsOlTwTtj4rOn0LqNBoB/t+fcjsMQtlkErp/5zEVGViT95mJ+uPAl70dDh871T/WDExu3BE9mBLgZlxME4wZWSYiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784890411; c=relaxed/simple;
	bh=2YLdGUBGDS5TGXFj/FymFBW2oe55Qb4LUL/6HzyqkNg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZABwNyLtl51jH3trbCHAXH+GI4FH6JvkgkwaKpd6NTU7FHBcAUnfpRio4FiVeHIwhlHIJIWr16u/rnpiUbt15vOS+IQIP5pNQ7n68cLe9nkl93TDzPC57mRwYxGN75uRxfpUq1pwoUsexC21v52OOnw++4XZiCE/Fa6P8cpjPDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ny1CMdUB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ny1CMdUB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2D101F00A3E;
	Fri, 24 Jul 2026 10:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784890409;
	bh=4pzonE4wYH8E7R/qI8al88tM/eVcEiPXVJtn27qq6AU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ny1CMdUBcbJkZP2Tm+QKyLXcP9CPw18xPgskt+INiGF2cbZ7Fcj+yY2Bx4Zx15U3J
	 mroFoCH/UzjU2yfYU7t7RE36wOyBX+8Oq40dsV7tWzGJaE/dn9zsZMSJPT/pKo/EOU
	 A3SRdodq+UMWK8/6JXN/iZi9jPAlhzEzuq41qmjUqdQMOxpv1qAIip/w56QuHlPVWq
	 aadNCKR6nGDxPrn/Mh0A9QQB9ev4c3y9HwQtobTNRxIL6oUpRa6lNXMhEHRri5JVYw
	 7OZoLNtwJDX05l2kB0Db76MRbiyZW745Wacw+pCxvKwGZ1vM7DRbx5NcfYcVvahv4x
	 rcJOAJQdXWVQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 12/19] drivers: soc: ti: k3-ringacc: handle absence
 of tisci
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: robh@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260724102115.2854-13-s-adivi@ti.com>
References: <20260724102115.2854-1-s-adivi@ti.com>
 <20260724102115.2854-13-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 10:53:28 +0000
Message-Id: <20260724105328.E2D101F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] The direct register fallback path in `k3_ringacc_ring_reconfig_qmo=
de_sci` destroys the ring configuration by zeroing base addresses and sizes.
- [High] Uninitialized `cfg` and `intr` pointers for standalone rings lead =
to unconditional NULL pointer dereferences.
- [High] Driver probe fails unconditionally on platforms without TISCI firm=
ware, completely preventing initialization.
- [High] The direct register configuration path silently truncates the uppe=
r 32 bits of the ring's DMA address to 4 bits.
- [Medium] Using `wmb()` is insufficient to flush posted MMIO writes when r=
esetting the ring size.
- [Medium] Pointer arithmetic on a NULL pointer when assigning `tisci_ring_=
ops` on platforms without TISCI.
- [Medium] `k3_ringacc_ring_clear_irq` clears all interrupt status bits unc=
onditionally, causing a TOCTOU race.
--

--- Patch [12]: [PATCH v7 12/19] drivers: soc: ti: k3-ringacc: handle absen=
ce of tisci ---
commit 8ac5aa2236fab24ddafc2ffcf45db7d49490cae1
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

drivers: soc: ti: k3-ringacc: handle absence of tisci

Handle absence of tisci with direct register writes. This will support
platforms that do not have tisci firmware like AM62L.

> diff --git a/drivers/soc/ti/k3-ringacc.c b/drivers/soc/ti/k3-ringacc.c
> index 5966db4327b13..e81d19a9ed324 100644
> --- a/drivers/soc/ti/k3-ringacc.c
> +++ b/drivers/soc/ti/k3-ringacc.c
[ ... ]
> @@ -467,15 +518,31 @@ static void k3_ringacc_ring_reset_sci(struct k3_rin=
g *ring)
>  	struct k3_ringacc *ringacc =3D ring->parent;
>  	int ret;
> =20
> -	ring_cfg.nav_id =3D ringacc->tisci_dev_id;
> -	ring_cfg.index =3D ring->ring_id;
> -	ring_cfg.valid_params =3D TI_SCI_MSG_VALUE_RM_RING_COUNT_VALID;
> -	ring_cfg.count =3D ring->size;
> +	if (!ringacc->tisci) {
> +		u32 reg;
> =20
> -	ret =3D ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
> -	if (ret)
> -		dev_err(ringacc->dev, "TISCI reset ring fail (%d) ring_idx %d\n",
> -			ret, ring->ring_id);
> +		if (!ring->cfg)
> +			return;
> +
> +		reg =3D readl(&ring->cfg->size);
> +		reg &=3D ~K3_DMARING_CFG_SIZE_MASK;
> +		writel(reg, &ring->cfg->size);
> +
> +		/* Ensure the register clear operation completes before writing new va=
lue */
> +		wmb();
> +		reg |=3D ring->size;
> +		writel(reg, &ring->cfg->size);

[Severity: Medium]
Is wmb() sufficient to flush posted MMIO writes when resetting the ring
size?

While wmb() flushes CPU store buffers, it does not guarantee that the
interconnect has delivered the first write to the hardware peripheral before
the second is issued.

Would a dummy read-back of the register (e.g., readl(&ring->cfg->size)) be
necessary here to flush posted MMIO writes and ensure the hardware processes
the clear operation first?

[ ... ]
> @@ -501,10 +568,25 @@ static void k3_ringacc_ring_reconfig_qmode_sci(stru=
ct k3_ring *ring,
>  	ring_cfg.valid_params =3D TI_SCI_MSG_VALUE_RM_RING_MODE_VALID;
>  	ring_cfg.mode =3D mode;
> =20
> -	ret =3D ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
> -	if (ret)
> -		dev_err(ringacc->dev, "TISCI reconf qmode fail (%d) ring_idx %d\n",
> -			ret, ring->ring_id);
> +	if (!ringacc->tisci) {
> +		u32 reg;
> +
> +		writel(ring_cfg.addr_lo, &ring->cfg->ba_lo);
> +		writel((ring_cfg.addr_hi & K3_DMARING_CFG_ADDR_HI_MASK) +
> +				(ring_cfg.asel << K3_DMARING_CFG_ASEL_SHIFT),
> +				&ring->cfg->ba_hi);
> +
> +		reg =3D readl(&ring->cfg->size);
> +		reg &=3D ~K3_DMARING_CFG_SIZE_MASK;
> +		reg |=3D ring_cfg.count & K3_DMARING_CFG_SIZE_MASK;
> +
> +		writel(reg, &ring->cfg->size);

[Severity: High]
Does this fallback path in k3_ringacc_ring_reconfig_qmode_sci() overwrite
the ring configuration with zeros?

Since ring_cfg is initialized to zero at the start of the function and only
the mode field is updated, writing ring_cfg.addr_lo, ring_cfg.addr_hi, and
ring_cfg.count to the hardware registers will write zeros.

Additionally, this direct register configuration branch does not seem to
write the intended mode parameter to the hardware.

[ ... ]
> @@ -670,15 +767,30 @@ int k3_ringacc_get_ring_irq_num(struct k3_ring *rin=
g)
>  }
>  EXPORT_SYMBOL_GPL(k3_ringacc_get_ring_irq_num);
> =20
> +u32 k3_ringacc_ring_get_irq_status(struct k3_ring *ring)
> +{
> +	struct k3_ringacc *ringacc =3D ring->parent;
> +	struct k3_ring *ring2 =3D &ringacc->rings[ring->ring_id];
> +
> +	return readl(&ring2->intr->status);
> +}
> +EXPORT_SYMBOL_GPL(k3_ringacc_ring_get_irq_status);
> +
> +void k3_ringacc_ring_clear_irq(struct k3_ring *ring)
> +{
> +	struct k3_ringacc *ringacc =3D ring->parent;
> +	struct k3_ring *ring2 =3D &ringacc->rings[ring->ring_id];
> +
> +	writel(0xFF, &ring2->intr->status);

[Severity: High]
Are the cfg and intr pointers initialized for standalone rings?

It appears that ring->cfg and ring->intr are only initialized for DMA rings
in k3_ringacc_dmarings_init(). For generic or standalone rings initialized =
in
k3_ringacc_init(), these remain NULL.

If invoked for a standalone ring on a non-TISCI platform, will these
unconditional dereferences in k3_ringacc_ring_get_irq_status() and
k3_ringacc_ring_clear_irq() lead to a kernel panic from a NULL pointer
dereference?

[Severity: Medium]
Will this unconditionally clear all interrupt status bits in
k3_ringacc_ring_clear_irq()?

Writing 0xFF to a Write-1-to-Clear (W1C) register blindly clears all active
interrupt bits.

Could this risk dropping unhandled interrupts if multiple interrupts assert
simultaneously between the read and clear phases?

[ ... ]
> @@ -689,6 +801,24 @@ static int k3_ringacc_ring_cfg_sci(struct k3_ring *r=
ing)
>  	ring_cfg.size =3D ring->elm_size;
>  	ring_cfg.asel =3D ring->asel;
> =20
> +	if (!ringacc->tisci) {
> +		u32 reg;
> +
> +		writel(ring_cfg.addr_lo, &ring->cfg->ba_lo);
> +		writel((ring_cfg.addr_hi & K3_DMARING_CFG_ADDR_HI_MASK) +
> +				(ring_cfg.asel << K3_DMARING_CFG_ASEL_SHIFT),
> +				&ring->cfg->ba_hi);

[Severity: High]
Does this mask out address bits beyond the 36th bit in
k3_ringacc_ring_cfg_sci()?

K3_DMARING_CFG_ADDR_HI_MASK is defined as GENMASK(3, 0), so it only
preserves the lowest 4 bits of ring_cfg.addr_hi.

If the DMA subsystem allocates ring memory above the 36-bit boundary, will
this silently truncate the address and lead to memory corruption or IOMMU
faults?

[ ... ]
> @@ -1347,8 +1477,11 @@ static int k3_ringacc_probe_dt(struct k3_ringacc *=
ringacc)
>  		return PTR_ERR(ringacc->rm_gp_range);
>  	}
> =20
> -	return ti_sci_inta_msi_domain_alloc_irqs(ringacc->dev,
> -						 ringacc->rm_gp_range);
> +	if (IS_ENABLED(CONFIG_TI_K3_UDMA))
> +		return ti_sci_inta_msi_domain_alloc_irqs(ringacc->dev,
> +			ringacc->rm_gp_range);
> +	else
> +		return 0;
>  }

[Severity: High]
Will the driver probe fail unconditionally on platforms without TISCI
firmware?

Earlier in k3_ringacc_probe_dt(), if ti_sci_get_by_phandle() fails because
the ti,sci node is absent, it logs an error and returns the error code
immediately:

    ringacc->tisci =3D ti_sci_get_by_phandle(node, "ti,sci");
    if (IS_ERR(ringacc->tisci)) {
        ret =3D PTR_ERR(ringacc->tisci);
        ...
        return ret;
    }

Does this abort the entire probe process, preventing initialization on
platforms like AM62L and rendering the !ringacc->tisci fallback logic
added by this patch unreachable?

[ ... ]
> @@ -1499,6 +1635,10 @@ struct k3_ringacc *k3_ringacc_dmarings_init(struct=
 platform_device *pdev,
>  		struct k3_ring *ring =3D &ringacc->rings[i];
> =20
>  		ring->rt =3D base_rt + K3_DMARING_RT_REGS_STEP * i;
> +		ring->cfg =3D base_rt + K3_RINGACC_RT_CFG_REGS_OFS +
> +			    K3_DMARING_RT_REGS_STEP * i;
> +		ring->intr =3D base_rt + K3_RINGACC_RT_INT_REGS_OFS +
> +			     K3_DMARING_RT_REGS_STEP * i;
>  		ring->parent =3D ringacc;
>  		ring->ring_id =3D i;
>  		ring->proxy_id =3D K3_RINGACC_PROXY_NOT_USED;

[Severity: Medium]
Will this result in undefined behavior due to pointer arithmetic on a NULL
pointer in k3_ringacc_dmarings_init()?

On platforms without TISCI firmware, ringacc->tisci is NULL. Later in
k3_ringacc_dmarings_init(), there is an unconditional assignment:

    ringacc->tisci_ring_ops =3D &ringacc->tisci->ops.rm_ring_ops;

Evaluating the address of a member of a NULL pointer results in undefined
behavior. Should this be updated to only assign tisci_ring_ops if
ringacc->tisci is valid?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724102115.2854=
-1-s-adivi@ti.com?part=3D12
