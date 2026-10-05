Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB6F4CCDCB;
	Mon,  5 Oct 2026 16:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791216316; cv=none; b=IpWeJEl/zGNNiVULZEoyfhrH9W3WBdatx0eh22S603VtStEPlecqj7CBRKiz/tnJ4DY+j8bIRFqpK/wwrKyVl6INsHmCTT7NUgOv3mdJO6ZDIuwTxTXtHbgwrj4cYqJhMmCh0SqSqkjPpjF8Grt8to5lwdKrwTp71I+Hg1+U3Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791216316; c=relaxed/simple;
	bh=GPmLO0mY19ZSZuVAhtA0nv7PEpGlGGOyDTKBGsxziDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=af4SvNyzw05En4z0vQ5n8wjgBLoTXKUxHQVtCy67csd+XpPpRgwCooVX4AxAxuGcHRnyfhTi3PfsUO9Dxw0OPpoBMQzjdjvcJV6ft3sk9/sFfDec6FAjGv6v5BmuP+ZqbS3k1ZrFF8TiBEsEQB0/MZRXXet/mz3P9sFMGNmdtxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0i4Iiq9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0i4Iiq9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A511F000FF;
	Mon,  5 Oct 2026 16:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791216314;
	bh=YbL5X+/GeJAK4u6KKvcMiWqewAkh3e4GACS9RWX4Vuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A0i4Iiq9i6Jl9GeonyVXKvbcSbaLZh/zZ3+PpXUw/ggwfow4HcGNlotRWjNnMwuWX
	 by93fkR4UJDx3PFOslexDFUL57P/gZQaMWxaNNajTAU8vFHqZ9unXj6dgT5/02LpVh
	 6V0zZGmGCP+UUWtymIkLk/+Opsw+ULzIkK+4ra+0XgWU4L+TgmCxi2ucu7HYalJDqv
	 CVTf1cyWu6PbnXp9v843RcviQK2GchkWXPscbLcEBiiM2GQqpsFV8Nx7F4t9UyNG0q
	 6eEMSYL6bJVqNHFxNP8xmExqETAqFdi7HYVkhbLR8rLqDun4cvfxwIJK+FpLxaqsiH
	 EexxiKq/tIhmw==
Date: Mon, 5 Oct 2026 18:05:11 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Cc: peter.ujfalusi@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	vigneshr@ti.com, Frank.li@nxp.com, r-sharma3@ti.com,
	gehariprasath@ti.com
Subject: Re: [PATCH v11 12/19] drivers: soc: ti: k3-ringacc: handle absence
 of tisci
Message-ID: <asPKt_QuEAjey62J@parshuram>
References: <20261001084105.1692228-1-s-adivi@ti.com>
 <20261001084105.1692228-13-s-adivi@ti.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001084105.1692228-13-s-adivi@ti.com>

On 01-10-26, 14:10, Sai Sree Kartheek Adivi wrote:
> Handle absence of tisci with direct register writes. This will support
> platforms that do not have tisci firmware like AM62L.

Need ack from TI maintainers on this... I think we have dependency on
this here

> 
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> ---
>  drivers/soc/ti/k3-ringacc.c       | 199 +++++++++++++++++++++++++++---
>  include/linux/soc/ti/k3-ringacc.h |  18 +++
>  2 files changed, 198 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/soc/ti/k3-ringacc.c b/drivers/soc/ti/k3-ringacc.c
> index 5966db4327b13..d52e0ab33678c 100644
> --- a/drivers/soc/ti/k3-ringacc.c
> +++ b/drivers/soc/ti/k3-ringacc.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/dma-mapping.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> @@ -46,6 +47,53 @@ struct k3_ring_rt_regs {
>  	u32	hwindx;
>  };
>  
> +#define K3_RINGACC_RT_CFG_REGS_OFS	0x40
> +#define K3_DMARING_CFG_ADDR_HI_MASK	GENMASK(3, 0)
> +#define K3_DMARING_CFG_ASEL_SHIFT	16
> +#define K3_DMARING_CFG_SIZE_MASK	GENMASK(15, 0)
> +
> +/**
> + * struct k3_ring_cfg_regs - The RA Configuration Registers region
> + *
> + * @ba_lo: Ring Base Address Low Register
> + * @ba_hi: Ring Base Address High Register
> + * @size: Ring Size Register
> + */
> +struct k3_ring_cfg_regs {
> +	u32	ba_lo;
> +	u32	ba_hi;
> +	u32	size;
> +};
> +
> +#define K3_RINGACC_RT_INT_REGS_OFS		0x140
> +#define K3_RINGACC_RT_INT_ENABLE_SET_COMPLETE	BIT(0)
> +#define K3_RINGACC_RT_INT_ENABLE_SET_TR			BIT(2)
> +
> +/**
> + * struct k3_ring_intr_regs {
> + *
> + * @enable_set: Ring Interrupt Enable Register
> + * @resv_1: Reserved
> + * @clr: Ring Interrupt Clear Register
> + * @resv_2: Reserved
> + * @status_set: Ring Interrupt Status Set Register
> + * @resv_3: Reserved
> + * @status: Ring Interrupt Status Register
> + * @resv_4: Reserved
> + * @status_masked: Ring Interrupt Status Masked Register
> + */
> +struct k3_ring_intr_regs {
> +	u32	enable_set;
> +	u32	resv_1;
> +	u32	clr;
> +	u32	resv_2;
> +	u32	status_set;
> +	u32	resv_3;
> +	u32	status;
> +	u32	resv_4;
> +	u32	status_masked;
> +};
> +
>  #define K3_RINGACC_RT_REGS_STEP			0x1000
>  #define K3_DMARING_RT_REGS_STEP			0x2000
>  #define K3_DMARING_RT_REGS_REVERSE_OFS		0x1000
> @@ -139,6 +187,8 @@ struct k3_ring_state {
>   * struct k3_ring - RA Ring descriptor
>   *
>   * @rt: Ring control/status registers
> + * @cfg: Ring config registers
> + * @intr: Ring interrupt registers
>   * @fifos: Ring queues registers
>   * @proxy: Ring Proxy Datapath registers
>   * @ring_mem_dma: Ring buffer dma address
> @@ -158,6 +208,8 @@ struct k3_ring_state {
>   */
>  struct k3_ring {
>  	struct k3_ring_rt_regs __iomem *rt;
> +	struct k3_ring_cfg_regs __iomem *cfg;
> +	struct k3_ring_intr_regs __iomem *intr;
>  	struct k3_ring_fifo_regs __iomem *fifos;
>  	struct k3_ringacc_proxy_target_regs  __iomem *proxy;
>  	dma_addr_t	ring_mem_dma;
> @@ -467,15 +519,39 @@ static void k3_ringacc_ring_reset_sci(struct k3_ring *ring)
>  	struct k3_ringacc *ringacc = ring->parent;
>  	int ret;
>  
> -	ring_cfg.nav_id = ringacc->tisci_dev_id;
> -	ring_cfg.index = ring->ring_id;
> -	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_COUNT_VALID;
> -	ring_cfg.count = ring->size;
> +	if (!ringacc->tisci) {
> +		u32 reg;
>  
> -	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
> -	if (ret)
> -		dev_err(ringacc->dev, "TISCI reset ring fail (%d) ring_idx %d\n",
> -			ret, ring->ring_id);
> +		if (!ring->cfg)
> +			return;
> +
> +		reg = readl(&ring->cfg->size);
> +		reg &= ~K3_DMARING_CFG_SIZE_MASK;
> +		writel(reg, &ring->cfg->size);
> +
> +		ret = readl_poll_timeout(&ring->cfg->size, reg,
> +					  !(reg & K3_DMARING_CFG_SIZE_MASK),
> +					  1, 100);
> +		if (ret) {
> +			dev_err(ringacc->dev, "ring %d size clear timeout\n",
> +				ring->ring_id);
> +			return;
> +		}
> +
> +		reg = readl(&ring->cfg->size);
> +		reg |= ring->size;
> +		writel(reg, &ring->cfg->size);
> +	} else {
> +		ring_cfg.nav_id = ringacc->tisci_dev_id;
> +		ring_cfg.index = ring->ring_id;
> +		ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_COUNT_VALID;
> +		ring_cfg.count = ring->size;
> +
> +		ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
> +		if (ret)
> +			dev_err(ringacc->dev, "TISCI reset ring fail (%d) ring_idx %d\n",
> +				ret, ring->ring_id);
> +	}
>  }
>  
>  void k3_ringacc_ring_reset(struct k3_ring *ring)
> @@ -501,6 +577,9 @@ static void k3_ringacc_ring_reconfig_qmode_sci(struct k3_ring *ring,
>  	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_MODE_VALID;
>  	ring_cfg.mode = mode;
>  
> +	if (!ringacc->tisci)
> +		return;
> +
>  	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
>  	if (ret)
>  		dev_err(ringacc->dev, "TISCI reconf qmode fail (%d) ring_idx %d\n",
> @@ -576,10 +655,40 @@ static void k3_ringacc_ring_free_sci(struct k3_ring *ring)
>  	ring_cfg.index = ring->ring_id;
>  	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_ALL_NO_ORDER;
>  
> -	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
> -	if (ret)
> -		dev_err(ringacc->dev, "TISCI ring free fail (%d) ring_idx %d\n",
> -			ret, ring->ring_id);
> +	if (!ringacc->tisci) {
> +		u32 reg;
> +
> +		writel(K3_RINGACC_RT_INT_ENABLE_SET_COMPLETE | K3_RINGACC_RT_INT_ENABLE_SET_TR,
> +		       &ring->intr->clr);
> +
> +		reg = readl(&ring->cfg->size);
> +		reg &= ~K3_DMARING_CFG_SIZE_MASK;
> +		writel(reg, &ring->cfg->size);
> +
> +		ret = readl_poll_timeout(&ring->cfg->size, reg,
> +					  !(reg & K3_DMARING_CFG_SIZE_MASK),
> +					  1, 100);
> +		if (ret) {
> +			dev_err(ringacc->dev, "ring %d size clear timeout\n",
> +				ring->ring_id);
> +			return;
> +		}
> +
> +		reg = readl(&ring->cfg->size);
> +		reg |= ring_cfg.count & K3_DMARING_CFG_SIZE_MASK;
> +
> +		writel(reg, &ring->cfg->size);
> +
> +		writel(ring_cfg.addr_lo, &ring->cfg->ba_lo);
> +		writel((ring_cfg.addr_hi & K3_DMARING_CFG_ADDR_HI_MASK) +
> +				(ring_cfg.asel << K3_DMARING_CFG_ASEL_SHIFT),
> +				&ring->cfg->ba_hi);
> +	} else {
> +		ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
> +		if (ret)
> +			dev_err(ringacc->dev, "TISCI ring free fail (%d) ring_idx %d\n",
> +				ret, ring->ring_id);
> +	}
>  }
>  
>  int k3_ringacc_ring_free(struct k3_ring *ring)
> @@ -670,15 +779,36 @@ int k3_ringacc_get_ring_irq_num(struct k3_ring *ring)
>  }
>  EXPORT_SYMBOL_GPL(k3_ringacc_get_ring_irq_num);
>  
> +u32 k3_ringacc_ring_get_irq_status(struct k3_ring *ring)
> +{
> +	struct k3_ringacc *ringacc = ring->parent;
> +	struct k3_ring *fwd_ring = &ringacc->rings[ring->ring_id];
> +
> +	if (!fwd_ring->intr)
> +		return 0;
> +
> +	return readl(&fwd_ring->intr->status);
> +}
> +EXPORT_SYMBOL_GPL(k3_ringacc_ring_get_irq_status);
> +
> +void k3_ringacc_ring_clear_irq(struct k3_ring *ring, u32 status)
> +{
> +	struct k3_ringacc *ringacc = ring->parent;
> +	struct k3_ring *fwd_ring = &ringacc->rings[ring->ring_id];
> +
> +	if (!fwd_ring->intr)
> +		return;
> +
> +	writel(status, &fwd_ring->intr->status);
> +}
> +EXPORT_SYMBOL_GPL(k3_ringacc_ring_clear_irq);
> +
>  static int k3_ringacc_ring_cfg_sci(struct k3_ring *ring)
>  {
>  	struct ti_sci_msg_rm_ring_cfg ring_cfg = { 0 };
>  	struct k3_ringacc *ringacc = ring->parent;
>  	int ret;
>  
> -	if (!ringacc->tisci)
> -		return -EINVAL;
> -
>  	ring_cfg.nav_id = ringacc->tisci_dev_id;
>  	ring_cfg.index = ring->ring_id;
>  	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_ALL_NO_ORDER;
> @@ -689,6 +819,24 @@ static int k3_ringacc_ring_cfg_sci(struct k3_ring *ring)
>  	ring_cfg.size = ring->elm_size;
>  	ring_cfg.asel = ring->asel;
>  
> +	if (!ringacc->tisci) {
> +		u32 reg;
> +
> +		writel(ring_cfg.addr_lo, &ring->cfg->ba_lo);
> +		writel((ring_cfg.addr_hi & K3_DMARING_CFG_ADDR_HI_MASK) +
> +				(ring_cfg.asel << K3_DMARING_CFG_ASEL_SHIFT),
> +				&ring->cfg->ba_hi);
> +
> +		reg = readl(&ring->cfg->size);
> +		reg &= ~K3_DMARING_CFG_SIZE_MASK;
> +		reg |= ring_cfg.count & K3_DMARING_CFG_SIZE_MASK;
> +
> +		writel(reg, &ring->cfg->size);
> +		writel(K3_RINGACC_RT_INT_ENABLE_SET_COMPLETE | K3_RINGACC_RT_INT_ENABLE_SET_TR,
> +		       &ring->intr->enable_set);
> +		return 0;
> +	}
> +
>  	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
>  	if (ret)
>  		dev_err(ringacc->dev, "TISCI config ring fail (%d) ring_idx %d\n",
> @@ -1347,6 +1495,11 @@ static int k3_ringacc_probe_dt(struct k3_ringacc *ringacc)
>  		return PTR_ERR(ringacc->rm_gp_range);
>  	}
>  
> +	if (!IS_ENABLED(CONFIG_TI_SCI_INTA_MSI_DOMAIN)) {
> +		dev_err(dev, "TI_SCI_INTA_MSI_DOMAIN is required for a DT-probed ringacc with ti,sci\n");
> +		return -ENODEV;
> +	}
> +
>  	return ti_sci_inta_msi_domain_alloc_irqs(ringacc->dev,
>  						 ringacc->rm_gp_range);
>  }
> @@ -1481,9 +1634,12 @@ struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
>  
>  	mutex_init(&ringacc->req_lock);
>  
> -	base_rt = devm_platform_ioremap_resource_byname(pdev, "ringrt");
> -	if (IS_ERR(base_rt))
> -		return ERR_CAST(base_rt);
> +	base_rt = data->base_rt;
> +	if (!base_rt) {
> +		base_rt = devm_platform_ioremap_resource_byname(pdev, "ringrt");
> +		if (IS_ERR(base_rt))
> +			return ERR_CAST(base_rt);
> +	}
>  
>  	ringacc->rings = devm_kzalloc(dev,
>  				      sizeof(*ringacc->rings) *
> @@ -1499,6 +1655,10 @@ struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
>  		struct k3_ring *ring = &ringacc->rings[i];
>  
>  		ring->rt = base_rt + K3_DMARING_RT_REGS_STEP * i;
> +		ring->cfg = base_rt + K3_RINGACC_RT_CFG_REGS_OFS +
> +			    K3_DMARING_RT_REGS_STEP * i;
> +		ring->intr = base_rt + K3_RINGACC_RT_INT_REGS_OFS +
> +			     K3_DMARING_RT_REGS_STEP * i;
>  		ring->parent = ringacc;
>  		ring->ring_id = i;
>  		ring->proxy_id = K3_RINGACC_PROXY_NOT_USED;
> @@ -1512,7 +1672,8 @@ struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
>  		ring->flags = K3_RING_FLAG_REVERSE;
>  	}
>  
> -	ringacc->tisci_ring_ops = &ringacc->tisci->ops.rm_ring_ops;
> +	if (ringacc->tisci)
> +		ringacc->tisci_ring_ops = &ringacc->tisci->ops.rm_ring_ops;
>  
>  	dev_info(dev, "Number of rings: %u\n", ringacc->num_rings);
>  
> diff --git a/include/linux/soc/ti/k3-ringacc.h b/include/linux/soc/ti/k3-ringacc.h
> index 39b022b925986..4b6ec925e2f2d 100644
> --- a/include/linux/soc/ti/k3-ringacc.h
> +++ b/include/linux/soc/ti/k3-ringacc.h
> @@ -158,6 +158,23 @@ u32 k3_ringacc_get_ring_id(struct k3_ring *ring);
>   */
>  int k3_ringacc_get_ring_irq_num(struct k3_ring *ring);
>  
> +/**
> + * k3_ringacc_ring_get_irq_status - Get the irq status for the ring
> + * @ring: pointer on ring
> + *
> + * Returns the interrupt status
> + */
> +u32 k3_ringacc_ring_get_irq_status(struct k3_ring *ring);
> +
> +/**
> + * k3_ringacc_ring_clear_irq - Clear the given interrupts
> + * @ring: pointer on ring
> + * @status: mask of interrupt status bits to clear
> + *
> + * Clears only the interrupt status bits set in @status on the ring
> + */
> +void k3_ringacc_ring_clear_irq(struct k3_ring *ring, u32 status);
> +
>  /**
>   * k3_ringacc_ring_cfg - ring configure
>   * @ring: pointer on ring
> @@ -262,6 +279,7 @@ struct k3_ringacc_init_data {
>  	const struct ti_sci_handle *tisci;
>  	u32 tisci_dev_id;
>  	u32 num_rings;
> +	void __iomem *base_rt;
>  };
>  
>  struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
> -- 
> 2.55.0

-- 
~Vinod
