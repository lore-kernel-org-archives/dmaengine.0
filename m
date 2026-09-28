Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB573750A9;
	Mon, 28 Sep 2026 03:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790565310; cv=none; b=JAnkxH3LVBnumZDrPwHbcGiZHn12T1wlTlml3JhcRjosbGfBM1Rm1at3f9nP96gtSYNeLzpHUbpNg7uKxtv/8f+tyoZ1zQcLm6Xbr/xmJ7zr9NmWgjZ/Uyt0w7/4VEo4/8lIm2cBMoUDHkA8/iEoIMV2bZ75/atZHbjVq2PpL40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790565310; c=relaxed/simple;
	bh=QLAzCMSCOsD64PyWQb28VTD9mJ3Ob9kOVzpcZgiPCwc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l1IY9DdkgdbjRbE3FNYt3mK2NsT5VbwfiDHkaLhh92dwATv1V7OJSReeS+j3Me+dcHjrmJNVK5qdSQUFxDuI2X02KRnvDgE44jjTkS8hro7TtKKJ3HRsLEs23T3tcAJFsuFOhHzN8ogcaocI/PCvPqh9XERFFhKp2Gx6TTGjP84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SIcW1WP0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SIcW1WP0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD2041F000FF;
	Mon, 28 Sep 2026 03:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790565309;
	bh=Na3foWPKjT2VVdZzz/ZNURIX8QZ7/KLW9PxIW8s3nJs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SIcW1WP0SS5OnNN71PLYrCFJ7obr227N99Xinvd+mnLJU6vQL1fPrKbIUZt3Gcjax
	 9bjXBehXeKo57B/JmOKQvRFDTKFvVLYvVRxO7/SpWrsYaKvS8TGphiUULoiUjTMLh9
	 J2cLwclhnTgNyR79nhKGEq4Xk+I8AlKmJOw5DDlwIeWR0oUPJh/wqrMLl6eE9qbRFQ
	 /sRSnw1aUFeiPwS3J2WE7F+ix0sd02bOHx5TWEH4jAZRXt9iZFBUISbeq8ZmauyR4p
	 EXGcr0QdpE9jH4EdJZtA9rR/Jnn7EN6OdagPlucz+0+knhqK2j1zaV6AkTcN+bA+T0
	 k2zHRYwzCaZxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 12/19] drivers: soc: ti: k3-ringacc: handle absence
 of tisci
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, robh@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260928025749.1055383-13-s-adivi@ti.com>
References: <20260928025749.1055383-1-s-adivi@ti.com>
 <20260928025749.1055383-13-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 03:15:08 +0000
Message-Id: <20260928031508.AD2041F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dma: missing hardware synchronization in ring disable
--

commit 38d8e8375a9ffecbdf7a3fb0318fe6f0998f6f61
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

drivers: soc: ti: k3-ringacc: handle absence of tisci

This patch adds direct register write support for ring accelerator operatio=
ns
on platforms without TISCI firmware, such as AM62L. It implements alternate
paths for ring reset, configuration, and freeing when the TISCI handle is
absent.

> diff --git a/drivers/soc/ti/k3-ringacc.c b/drivers/soc/ti/k3-ringacc.c
> index 5966db4327b13..15fab94e8cad0 100644
> --- a/drivers/soc/ti/k3-ringacc.c
> +++ b/drivers/soc/ti/k3-ringacc.c

[ ... ]

> @@ -576,10 +653,28 @@ static void k3_ringacc_ring_free_sci(struct k3_ring=
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
> +		reg |=3D ring_cfg.count & K3_DMARING_CFG_SIZE_MASK;
> +
> +		writel(reg, &ring->cfg->size);
> +
> +		writel(ring_cfg.addr_lo, &ring->cfg->ba_lo);

[Severity: High]
Is it safe to clear the base addresses immediately after initiating the ring
disable here in k3_ringacc_ring_free_sci()?

When handling non-TISCI platforms, the code clears the size bits to disable
the ring but does not poll the hardware to ensure the disable is complete
before zeroing ba_lo and ba_hi.

In k3_ringacc_ring_reset_sci(), there is a 100us readl_poll_timeout() to wa=
it
for the hardware to acknowledge the disable. If the hardware is still
asynchronously tearing down the ring when k3_ringacc_ring_free() subsequent=
ly
calls dma_free_coherent() on this memory, could this lead to IOMMU faults or
memory corruption?

> +		writel((ring_cfg.addr_hi & K3_DMARING_CFG_ADDR_HI_MASK) +
> +				(ring_cfg.asel << K3_DMARING_CFG_ASEL_SHIFT),
> +				&ring->cfg->ba_hi);
> +	} else {
> +		ret =3D ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
> +		if (ret)
> +			dev_err(ringacc->dev, "TISCI ring free fail (%d) ring_idx %d\n",
> +				ret, ring->ring_id);
> +	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928025749.1055=
383-1-s-adivi@ti.com?part=3D12
