Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4DD3EC804
	for <dmaengine@vger.kernel.org>; Wed,  2 Sep 2026 09:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788342022; cv=none; b=He6XOfHEMhgMAyoGGu9e+JJ4GSjLK4pEHtPEVIUcFtkpvylOoAt6pI2LdHgstbocHSQkliN5FqN5Fdi+tzn0gNEv7uEZ1rIGxs3S3KTK3mRHuHmpGEdmGWJPrCTSYziBnDshr7tLARgn0off5DmK3f5nGvTeiL4a/nTiNe2DkCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788342022; c=relaxed/simple;
	bh=lcZDjHkLsU5vVoVarZrZ0Exqq27T1FG/e6vRqdzCAl8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nqdW1H33r84HxwonFVIKsHCC8w9Z0j3JMCZ1XBJzNV+8CdHSZiZkzEj/SLRCbvZLUj3zAOEppg0v9w8c7Y0gR3sR29rM6aL6U8dMRslEBrOBS1zt1uD6U1nI5EqrVSjCDHmf/yPJVJswtf13vzfN8Ho5rCKrmGcNaeumb7J0LRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MMbgaO+6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMbgaO+6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B5FC1F000E9;
	Wed,  2 Sep 2026 09:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788342020;
	bh=8xPTxjigyTvQAHlqijAsh9talthOr5MJFLpYs0NCmXg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MMbgaO+6r0FgsCmPGpydPcyYCi4xmd9GoVE98m0bkHGgxtiwJtowBMYE0C+ALN8qm
	 PUKCnwMA7SKqkA6wwMWYS+hzYau3R+22cY+s0danhtyesNHasPbPZT9yown4ry0X6J
	 B6hBdjtTA4AK+N2A++TwbWDQCKQ7RrvqqFLQ4wfhy0Ud/Q8EJPznD9EMwvmQ8aNeHO
	 GUAfuP33DTlGV36gi7LSTlrwplvKIQ+BYJdCxKbWiF9Pf9c4cEV9MxS/CDPwym2Mo6
	 hIYV4rY1eWc34TEyNpWeKnjM1X/StC3OsBo0Zrm2Ypm7F4Ew4YbN+PHKd0L7pfwPqh
	 bCLt47TGIfbCA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] dmaengine: dw-axi-dmac: Fix CH_CFG2 channel
 priority position
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jia Wang" <wangjia@ultrarisc.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260902-dma-fix-v3-3-414c6449fbcc@ultrarisc.com>
References: <20260902-dma-fix-v3-0-414c6449fbcc@ultrarisc.com>
 <20260902-dma-fix-v3-3-414c6449fbcc@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 09:40:19 +0000
Message-Id: <20260902094020.4B5FC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The shared interrupt handler unconditionally returns `IRQ_HANDLED`=
, defeating the kernel's spurious interrupt detection mechanism.
--

commit 24abf61259a958020ffb498a11487c8d593eb9a6
Author: Jia Wang <wangjia@ultrarisc.com>

dmaengine: dw-axi-dmac: Fix CH_CFG2 channel priority position

The CH_CFG2 channel priority field occupies bits 51:47 of the 64-bit
channel configuration register, corresponding to bits 19:15 of CH_CFG2_H.

The driver currently shifts the priority value by 20, programming the
wrong bits. Use bit 15 as the field position.

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-d=
mac/dw-axi-dmac.h
> index 67cc199e24d1f..97451bb8b16a7 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> @@ -327,7 +327,7 @@ enum {
>  #define CH_CFG2_H_TT_FC_POS		0
>  #define CH_CFG2_H_HS_SEL_SRC_POS	3
>  #define CH_CFG2_H_HS_SEL_DST_POS	4
> -#define CH_CFG2_H_PRIORITY_POS		20
> +#define CH_CFG2_H_PRIORITY_POS		15
> =20
>  /**
>   * DW AXI DMA channel interrupts

[Severity: High]
This isn't a bug introduced by this patch, but there is a pre-existing issue
in the shared interrupt handler for this driver.

Does dw_axi_dma_interrupt() unconditionally return IRQ_HANDLED even if no
channel interrupt statuses were set?

Looking at drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:dw_axi_dma_interr=
upt():

static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
{
	struct axi_dma_chip *chip =3D dev_id;
...
	/* Re-enable interrupts */
	axi_dma_irq_enable(chip);

	return IRQ_HANDLED;
}

If any other device sharing the IRQ line asserts an interrupt that it fails
to clear, returning IRQ_HANDLED here unconditionally defeats the kernel's
spurious interrupt detection mechanism. Because the IRQ line is registered
with IRQF_SHARED, this converts a localized hardware or driver failure into
a complete system freeze due to an interrupt storm.

Could this function track whether any channel interrupts were actually
processed and return IRQ_NONE if none were found?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-dma-fix-v3=
-0-414c6449fbcc@ultrarisc.com?part=3D3
