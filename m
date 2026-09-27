Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BBC3BFAFB
	for <dmaengine@vger.kernel.org>; Sun, 27 Sep 2026 09:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790501073; cv=none; b=HC2fa/0UK8Gsnncjnq+D5cqZWnJzc3feZAgEqKE0gDeh8dP/ESrUYQnXdxZVga51m2FN5G3FfFq04iw6IxcTXwiWgUib8iHLAMtQlPdHUWFRcahW4CjbZ2agD4GV7MX2f/VbN0uCH8spy17/4hGQ8MW2Z5Ci0ASclzlNPcsE6FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790501073; c=relaxed/simple;
	bh=bni9w2qdjo8ErXd/YGtzD+ENwxNvdVLBfabq24lUnQ0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QwRT25w7YYOLVpQRrQy2/HWLZD/c0bviH7c6wiHA9+pJk6qwv48bgG8QURlvx2lOaUWenZmtd4/Pfitxz6ETU8/F74p0QOhhwYjcYp35yvwZ3S359DmesmcOW70vfFwF2yS2ZdGwHgXhC5ytELmNxU/zfzYE2GNFNSQiwiWlUKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mdiu6tcl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mdiu6tcl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0921F000FF;
	Sun, 27 Sep 2026 09:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790501072;
	bh=a67DuB11B1S15jhUJBxBzklwfB4krHKBY8MQstH2lEg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mdiu6tclYFYoJYp0LdTUuBsWUpCzLOm00+Rq6Fufi7rRq3WHN9CkpcjOF/VEFxGe6
	 /2pi7WUA+krt7mbbbc8qaTqMAOdUMbaEo9ye24kfAsLGfVzMc/ZCHb46VAPJSMOknB
	 H9TllRA22L8x/BylxBCTAVls4MdM8AfLqSqkvNW168RpIUbRsJwR0PTcKeImjalDy0
	 yMpObxG0hUwGXl7bHwP2QCEDPzq/VSYcjkCyoWahkiQ3RX7DOys8c0HX+tAnKKgVKI
	 1k+wuUzk/H8pzVCNT3kKNhqYzJvngwXT52BayOQIKh37GWFp/Ex41qKHwzNH6OwyG3
	 q6lr8n2wvHD1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 06/24] dmaengine: ste_dma40: Check runtime PM in IRQ
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260927-dma40-fixes-v7-6-89f595e8851d@kernel.org>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
 <20260927-dma40-fixes-v7-6-89f595e8851d@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 09:24:31 +0000
Message-Id: <20260927092431.DE0921F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dmaengine: ste_dma40: IRQ storm due to unhandled interrupt during =
RPM_RESUMING
--

commit 5c375e7c3c832d3f8400ed368962408e5da22738
Author: Linus Walleij <linusw@kernel.org>

dmaengine: ste_dma40: Check runtime PM in IRQ

d40_handle_interrupt() reads DMA40 interrupt registers unconditionally. A
spurious interrupt can arrive while the device is runtime suspended, after
dma40_runtime_suspend() has disabled the GCC clock. Avoid touching the
registers unless the device is runtime active by taking a conditional
runtime PM reference.

> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 1dcfeabb3f363..5e9b6342c5a9e 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -1807,6 +1807,11 @@ static irqreturn_t d40_handle_interrupt(int irq, v=
oid *data)
>  	u32 *regs =3D base->regs_interrupt;
>  	struct d40_interrupt_lookup *il =3D base->gen_dmac.il;
>  	u32 il_size =3D base->gen_dmac.il_size;
> +	int ret;
> +
> +	ret =3D pm_runtime_get_if_active(base->dev);
> +	if (IS_ENABLED(CONFIG_PM) && ret <=3D 0)
> +		return IRQ_NONE;

[Severity: High]
Does returning IRQ_NONE here cause an IRQ storm during device resume?

In dma40_runtime_resume(), the hardware clocks are enabled which immediately
asserts any pending interrupts. However, the PM core's status is still
RPM_RESUMING, causing pm_runtime_get_if_active() to return 0.

Because the interrupt handler skips acknowledging the hardware interrupt and
returns IRQ_NONE, the level-triggered interrupt remains asserted.

A similar situation can happen during system suspend when
pm_runtime_force_suspend() disables runtime PM (disable_depth > 0), causing
pm_runtime_get_if_active() to return -EINVAL.

Will this cause the kernel to eventually disable the interrupt line
("nobody cared") and permanently break the DMA controller?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927-dma40-fixe=
s-v7-0-89f595e8851d@kernel.org?part=3D6
