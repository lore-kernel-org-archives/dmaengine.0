Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521616;
	b=GTj3gJdWnyHssjCvCzw+XH5K3OHKF3x3x1r+B6gf6YpifXVfxOSsP9ijpBRRVwDfFnih
	 nvsHDMOeu8nLv9wpW/6j9j/XcvzdaEVzj48cFR7nGfRlJ8ydSOnewW9J66BLiWxSfFwOH
	 9ngq4Lded2zaW/koZODMNequm+FHJ7Vyq6rIf7C7DqbU6DhyGDdtLlC96qg0IK5lsemn7
	 ur9V9XZI7RXgSzuh5BketuPPq/NYdDz3cSdahZizkSQVveyv+DDlbe4pNfJTbZ1Ui3SJQ
	 gYWfzPX8O8xO3HnxSm5vqwR7TcIvarfEjmGq91wv+WciHHnsWu/1WsPGEjPPcSpcV5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521616;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Dg7NUax2E5L8uEqNKvI8OvHtJ1JrlzQNOASRtWQySBY=;
	b=zdkKP56935kazYXPIhn+Zl2eYHBUYtf6+OjkX+YGEbKx+rPsxx2OP6gKO90khwuivDBq
	 eXeJV7V5dmtqOPkPI+RGY8WIpK7bY8GsaslynTrZvP4GBxQGhVKpoiBcou2mqdLH2vHCx
	 nMVU8FhKkZOd3H4WxPggmJ0UzH0cIkHjq1SttFEMLZorZCk9nyRGipgEhxzoe25BiPYVL
	 X8Vv49SNH+aKZRnGgqkOHRzUwBvd+6XK227sSFJjLTLRyYvDzhKRmarzD9b7lCbFCKgpH
	 Uwav9DL26M62zGswlnep7hLSygF+F8JJNKA3TV+pF6Izsgb6poB9m4TrUz8MLE2v3DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oTCaNjDf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D81606A326;
	Tue, 24 Nov 2026 12:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oTCaNjDf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7301F000C4;
	Tue, 24 Nov 2026 12:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795521615;
	bh=Dg7NUax2E5L8uEqNKvI8OvHtJ1JrlzQNOASRtWQySBY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oTCaNjDfQUB5hy790wJTvyhDHq9JYjyn+OvdxOkDjVmbWalhwvccqwLZaPE+pvcEl
	 S3jOQ5JGHemMBQ16sMOKjwm6LbrDn+o9Nn9Ecd4fUaYGmAkWA8DbFSqODbf62yLh5W
	 vpMxiibSMghRtc3YbMNtnDV7UTHkBRnHovAmDTMTtrkwshia8k5F9bz7VSUWs39dSw
	 KHBEaKTXtwq3oDB4DHTKGpKYMQwZP7+fzmWpX+En0Cmu9XxOg9ir5cPTlkMGD60fP5
	 3cueD9b9jmeyc+H2jxSq46DKCqrP4UOJxx6uWWgYu710Oi6JJaOnHiygLH5nIuPQK0
	 W/dFhZSTCgNVw==
Message-ID: <sashiko-outbox-231085@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 13/20] drivers: soc: ti: k3-ringacc: handle absence
 of tisci
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261124-dma-upstream-v13-v13-13-bd4251fdc6d4@ti.com>
References: <20261124-dma-upstream-v13-v13-0-bd4251fdc6d4@ti.com>
 <20261124-dma-upstream-v13-v13-13-bd4251fdc6d4@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 12:00:14 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] soc: ti: k3-ringacc: uncleaned base addr on
  k3_ringacc_ring_free_sci() timeout
- [Low] soc: ti: k3-ringacc: malformed kernel-doc header on struct
  k3_ring_intr_regs
- [Low] soc: ti: k3-ringacc: missing @base_rt kernel-doc in
  k3_ringacc_init_data
--

commit 32e44713182bbd0e2c5075fc75a42e71efe9bdf3
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

drivers: soc: ti: k3-ringacc: handle absence of tisci

This commit adds direct register access fallbacks to k3-ringacc to configur=
e,
reset, and free DMA rings and manage ring interrupts on platforms without
TISCI firmware.

> diff --git a/drivers/soc/ti/k3-ringacc.c b/drivers/soc/ti/k3-ringacc.c
> index 8c5f685e10f68..8094bb821f5f9 100644
> --- a/drivers/soc/ti/k3-ringacc.c
> +++ b/drivers/soc/ti/k3-ringacc.c
[ ... ]
> @@ -46,6 +47,53 @@ struct k3_ring_rt_regs {
>  	u32	hwindx;
>  };
> =20
[ ... ]
> +/**
> + * struct k3_ring_intr_regs {
> + *
> + * @enable_set: Ring Interrupt Enable Register

[Severity: Low]
This kernel-doc header has a trailing '{' instead of a '- <short descriptio=
n>',
which triggers a scripts/kernel-doc warning under W=3D1.

[ ... ]

> @@ -576,10 +665,40 @@ static void k3_ringacc_ring_free_sci(struct k3_ring=
 *ring)
>  	ring_cfg.index =3D ring->ring_id;
>  	ring_cfg.valid_params =3D TI_SCI_MSG_VALUE_RM_ALL_NO_ORDER;
> =20
> -	ret =3D ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
> -	if (ret)
> -		dev_err(ringacc->dev, "TISCI ring free fail (%d) ring_idx %d\n",
> -			ret, ring->ring_id);
> +	if (!ringacc->tisci) {
> +		u32 reg;
> +
> +		writel(K3_RINGACC_RT_INT_ENABLE_SET_COMPLETE | K3_RINGACC_RT_INT_ENABL=
E_SET_TR,
> +		       &ring->intr->clr);
> +
> +		reg =3D readl(&ring->cfg->size);
> +		reg &=3D ~K3_DMARING_CFG_SIZE_MASK;
> +		writel(reg, &ring->cfg->size);
> +
> +		ret =3D readl_poll_timeout(&ring->cfg->size, reg,
> +					  !(reg & K3_DMARING_CFG_SIZE_MASK),
> +					  1, 100);
> +		if (ret) {
> +			dev_err(ringacc->dev, "ring %d size clear timeout\n",
> +				ring->ring_id);
> +			return;
> +		}
> +
> +		reg =3D readl(&ring->cfg->size);
> +		reg |=3D ring_cfg.count & K3_DMARING_CFG_SIZE_MASK;
> +
> +		writel(reg, &ring->cfg->size);
> +
> +		writel(ring_cfg.addr_lo, &ring->cfg->ba_lo);
> +		writel((ring_cfg.addr_hi & K3_DMARING_CFG_ADDR_HI_MASK) +
> +				(ring_cfg.asel << K3_DMARING_CFG_ASEL_SHIFT),
> +				&ring->cfg->ba_hi);

[Severity: Medium]
Does returning early when readl_poll_timeout() times out leave ring->cfg->b=
a_lo
and ring->cfg->ba_hi programmed with a freed DMA address?

k3_ringacc_ring_free() unconditionally calls dma_free_coherent() right after
k3_ringacc_ring_free_sci() returns, so on timeout the hardware base address
registers continue pointing at freed coherent memory. Also, when the poll
succeeds, the second read-modify-write of ring->cfg->size is redundant since
ring_cfg.count is zero and K3_DMARING_CFG_SIZE_MASK was just confirmed to be
clear.

[ ... ]

> diff --git a/include/linux/soc/ti/k3-ringacc.h b/include/linux/soc/ti/k3-=
ringacc.h
> index 7b7fc237c08f5..2a9b7834bc430 100644
> --- a/include/linux/soc/ti/k3-ringacc.h
> +++ b/include/linux/soc/ti/k3-ringacc.h
[ ... ]
> @@ -263,6 +280,7 @@ struct k3_ringacc_init_data {
>  	const struct ti_sci_handle *tisci;
>  	u32 tisci_dev_id;
>  	u32 num_rings;
> +	void __iomem *base_rt;
>  };

[Severity: Low]
struct k3_ringacc_init_data has a kernel-doc comment above it, so adding
base_rt without a matching @base_rt description causes a kernel-doc warning.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-dma-upstre=
am-v13-v13-0-bd4251fdc6d4@ti.com?part=3D13
