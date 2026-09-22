Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E204AA591;
	Tue, 22 Sep 2026 07:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790060817; cv=none; b=utdvMFASOp3zigoXf9ROUpHx9of2lGawQGKOVHLYj4CqpYrYOT4Palk0D+K0TIPDcvVStT8Zgp2QGNK7njilSwZYCuLQ7EP6TsQpt9V3xOlCs5TNdYpSs2FL3PG7vhvPEbIj00O0EKxcAZhYXr5mmxh1efbzyIFNozuB6xGru14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790060817; c=relaxed/simple;
	bh=IqtUZr48pWoEZYfF/d/fQg7U9fzgqQXywMPH3FQ3JxQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nbICtvAhV7FkGQQfCtcpjjAVNqPwtfkmPJ++h34ewO2CkKerdgh6DDIKo+MIu0X9cEmi6g3Jsk7rPKxPoxFwLhU8PBmtpAHBKBr4xIh5n69osTv5F7y7qFfn4Y6S4Dabsj7259NAApE0QlR5V/qXdW+INjjYO1sQvrReEGllO3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3CT8dkO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3CT8dkO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58DB81F000FF;
	Tue, 22 Sep 2026 07:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790060815;
	bh=1c1E3XWF8eiju0LA9Da6x7szB1ABur1NPrEC3yhxwMo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h3CT8dkOf+xuBXZ5FBzBAQRU/8EI96Mg/B3M9I9+FURNmJjp9GxO/ZE7pV/gcHpIP
	 t9+/vU5NVYZT4i8Gi794sCOO5DhX5mB6yCkQtgv/QZfW3iPg+SmdCWjTmOfX3fxpVV
	 egHVC0RX67lxjb6UkRuZgF7vpiwwWi/IjDiBxg8Mt/Ek7AKnVScWxeW+BrEp9LWt5J
	 jjiDeuIRZ0yw9uEP4fGe6Nniap9aNJLr7AN2nQhQLpbkVG82VUJdM32FetNQbBhAlc
	 xhzwGa+uSWa1rQbv45hsFc1h0Ivtu9wBT1z2hEB32uj0HRbj6n0vdIMj4g5DBxkuD5
	 EqtpgAfHjB0pw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 12/19] drivers: soc: ti: k3-ringacc: handle absence
 of tisci
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, robh@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260922064902.2719979-13-s-adivi@ti.com>
References: <20260922064902.2719979-1-s-adivi@ti.com>
 <20260922064902.2719979-13-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 07:06:54 +0000
Message-Id: <20260922070655.58DB81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] soc: ti: k3-ringacc: base address zeroed before size in ring_free
- [Medium] soc: ti: k3-ringacc: missing interrupt disable during ring free
--

commit a7de7c5cbd863cd6f1879ceaa2a3c115f7f1b58b
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

drivers: soc: ti: k3-ringacc: handle absence of tisci

This commit adds support for platforms without tisci firmware, such as AM62=
L.
It does this by handling the absence of tisci using direct register writes =
for
ring configuration and reset.

> diff --git a/drivers/soc/ti/k3-ringacc.c b/drivers/soc/ti/k3-ringacc.c
> index 5966db4327b13..0ef07207e1dfa 100644
> --- a/drivers/soc/ti/k3-ringacc.c
> +++ b/drivers/soc/ti/k3-ringacc.c

[ ... ]

> @@ -576,10 +653,25 @@ static void k3_ringacc_ring_free_sci(struct k3_ring=
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

[Severity: Medium]
When k3_ringacc_ring_cfg_sci() configures a ring in the !tisci path, it
explicitly enables interrupts by writing to ring->intr->enable_set:

	writel(K3_RINGACC_RT_INT_ENABLE_SET_COMPLETE |=20
	       K3_RINGACC_RT_INT_ENABLE_SET_TR,
	       &ring->intr->enable_set);

Should k3_ringacc_ring_free_sci() symmetrically disable these interrupts
during teardown? Failing to disable interrupts while setting the size to 0
might leave the hardware in an inconsistent state or cause spurious IRQs if
the ring is reallocated.

> +		writel(ring_cfg.addr_lo, &ring->cfg->ba_lo);
> +		writel((ring_cfg.addr_hi & K3_DMARING_CFG_ADDR_HI_MASK) +
> +				(ring_cfg.asel << K3_DMARING_CFG_ASEL_SHIFT),
> +				&ring->cfg->ba_hi);

[Severity: High]
Does writing the base addresses before clearing the size register introduce=
 a
race condition?

Since the size is not yet updated to 0 here, the DMA engine remains technic=
ally
active. By clearing ba_lo and ba_hi first, any background transaction execu=
ting
in this narrow window could initiate a memory access at physical address 0x=
0,
potentially causing memory corruption or an IOMMU fault.

Would it be safer to clear the size register before updating the base addre=
ss
registers?

> +
> +		reg =3D readl(&ring->cfg->size);
> +		reg &=3D ~K3_DMARING_CFG_SIZE_MASK;
> +		reg |=3D ring_cfg.count & K3_DMARING_CFG_SIZE_MASK;
> +
> +		writel(reg, &ring->cfg->size);
> +	} else {
> +		ret =3D ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
> +		if (ret)
> +			dev_err(ringacc->dev, "TISCI ring free fail (%d) ring_idx %d\n",
> +				ret, ring->ring_id);
> +	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922064902.2719=
979-1-s-adivi@ti.com?part=3D12
