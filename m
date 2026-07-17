Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F3837B015
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 05:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784265673; cv=none; b=CqNpUOmUqCwaFX21ZyCH8fr0IHGU0FO0IOluIY5HznDLPxGJz7m8eb3SiSuJoVtT0y5KunRO/GcxvbFkdLZb3ygzYZ8Sw6VKrcvJCzyjJ+6IbUeKA8KAXzD0XIRQUzh9Kthqf9T5MqxCWCmzpdhmEyyzXpud4gwPWmLQHQKe+Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784265673; c=relaxed/simple;
	bh=Sdobcesm7eUE++M3DYUWZxZFEXBuDXLxejjMfRSyn+4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UsbRELvlawBhSSP5BUOBPxjm2qRL9AnW3OhTRUociA1RKVpbpDsANnNrhIxPxmRBB35O4bEqJTXeGFOuHS8uxqQNNLvFFs+32J5ORIf0ULSrgr9riIK9es+lK93WkUdanG4ouSAl9dhZWKkjtHkeXKa4KbE0oaZy/+Cd12E9Wp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eILBwSN9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eILBwSN9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9CAF1F00A3E;
	Fri, 17 Jul 2026 05:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784265670;
	bh=SHg0HRkbeCLxpEif8J+xJHoDgM3AgjHfDT4pA2esmwk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eILBwSN9Rp/3Ip3IM5kycoDFVr/kGPDS/KQFd4Ttl/9g+BYPvq1i/aNmlVy9QkJAL
	 Z1RxtXn5NRY3eYf+et0A0BzW5s6NkuX/V3wClcVDBb95MFupnQk+enr97DlXnytKnf
	 AHef3elb0rseq7WXvujjGopWvSn+VqzaQsdhaW7+kwsCdbSeYyGMdInYI1oDblfaeO
	 j8Gub32TmAsXBaM4pxWHOkSru7DCmAYEaYXlEB2KlVx8Ou/sdX4DU2KNmXIYaehWAM
	 3FvdfAlb85BJSmRHNelDWVzgQgy+7F+t12zx1RvXAAEaxllMD3EBvRpiR6kSeYGvPo
	 /sO0htdttTTMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 02/14] dmaengine: dw-edma: Add per-channel interrupt
 routing control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260717050308.2144108-3-den@valinux.co.jp>
References: <20260717050308.2144108-1-den@valinux.co.jp>
 <20260717050308.2144108-3-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 05:21:09 +0000
Message-Id: <20260717052109.D9CAF1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Cross-system read-modify-write (RMW) race on the shared `int_mask`=
 register causes lost unmasks and DMA hangs. (Pre-existing)
--

--- Patch [2]: [PATCH v5 02/14] dmaengine: dw-edma: Add per-channel interru=
pt routing control ---
commit ce3c3f8c0117acd509b753117d45f3c2cf75e27d
Author: Koichiro Den <den@valinux.co.jp>
dmaengine: dw-edma: Add per-channel interrupt routing control

This patch adds per-channel interrupt routing control for the DesignWare
eDMA controller. It introduces a new routing mode to determine where a
channel should report completion and updates the interrupt masking and
generation logic accordingly.

> diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/=
dw-edma-v0-core.c
> --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
[ ... ]
> @@ -354,12 +360,17 @@ static void dw_edma_v0_core_ch_enable(struct dw_edm=
a_chan *chan)
>  			break;
>  		}
>  	}
> -	/* Interrupt unmask - done, abort */
> +	/* Interrupt mask/unmask - done, abort */
>  	raw_spin_lock_irqsave(&dw->lock, flags);
> =20
>  	tmp =3D GET_RW_32(dw, chan->dir, int_mask);
> -	tmp &=3D ~FIELD_PREP(EDMA_V0_DONE_INT_MASK, BIT(chan->id));
> -	tmp &=3D ~FIELD_PREP(EDMA_V0_ABORT_INT_MASK, BIT(chan->id));
> +	if (chan->irq_mode =3D=3D DW_EDMA_CH_IRQ_REMOTE) {
> +		tmp |=3D FIELD_PREP(EDMA_V0_DONE_INT_MASK, BIT(chan->id));
> +		tmp |=3D FIELD_PREP(EDMA_V0_ABORT_INT_MASK, BIT(chan->id));
> +	} else {
> +		tmp &=3D ~FIELD_PREP(EDMA_V0_DONE_INT_MASK, BIT(chan->id));
> +		tmp &=3D ~FIELD_PREP(EDMA_V0_ABORT_INT_MASK, BIT(chan->id));
> +	}
>  	SET_RW_32(dw, chan->dir, int_mask, tmp);

[Severity: High]
This is a pre-existing issue, but does this read-modify-write sequence on t=
he
shared int_mask register risk a race condition across the PCIe bus?

Since the PCIe Host and local endpoint drivers can independently execute
dw_edma_v0_core_ch_enable() concurrently, the local dw->lock does not
synchronize operations across the bus.

If the Host performs a read-modify-write that sets its mask bit to 1, could
this overwrite a concurrent read-modify-write by the endpoint clearing its
mask bit to 0? If the endpoint's unmask operation is reverted by the Host,
the endpoint's channel would remain masked, which appears to lead to a
lost interrupt and a DMA hang.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717050308.2144=
108-1-den@valinux.co.jp?part=3D2
