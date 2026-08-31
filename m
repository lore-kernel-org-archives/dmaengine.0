Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D022D9ECA
	for <dmaengine@vger.kernel.org>; Mon, 31 Aug 2026 14:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188327; cv=none; b=uHTn/zCC8gUyPhzEs4nvCXzo21o5aZpiaDrVugFtA/Jo3cPHKpPY6AX6bL8cbL0qBEkLTeo3ZVW9aF22LMaHTvMf/FwCHX8syiOkO2fpTnp1IXBPQdQy+V/CiccHWn4AQqu8sFdUR46Zn1uQFw/H+ZjfuU2lXXAkqg3I9qbHmb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188327; c=relaxed/simple;
	bh=YFtaKSxdy8mhN88bIknIKyV+AGsYjbIrKaCEuRIVRmQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ck0tsYeROkifOZiZuhIfI7TioDnjwAIIsBSgfXT1wvROJcUV84aqcRxJKBmJyq1ikI6Pw5VKMdh/MSEV4DDbB8z4z9xWs1IY5zX5snVni2SyXhpovso/1jqZGSOgILGCa6pjjwHqPQmxCbFmMfCa70mcckp5jH7iE90yAVNPgZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QdOTH/4/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QdOTH/4/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 054761F000E9;
	Mon, 31 Aug 2026 14:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788188326;
	bh=WiuThwSAuFjCw5SpEz/oEzIB1Ya89dnLsuB3rHVwL4w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QdOTH/4/17bqrMFs1+xjC9YaRaBSXqaUG0aTW6ySr05yweK/HR15CkQ7pvn2BOo8x
	 9ub0xNJUw1DM0S7fY0QIIrPDtKxpFvoK7/QSTEtZDHQ/HHAj/Lw4g9YtYtjoCN72Zn
	 NXX0rlkgBrOJS/O8FEMOvh8dogW9Q9PQivWYGDRxIjlFo6FXd+B5w0UjiLdYDm6Mkh
	 kOiKdQXIu0tesmATbvCknG60k3D6K3xD3SF54AZD7rLDmEWt9L3LV+CwkSRNFlLNZx
	 2Qhar3UU9958FmdKEZVvpGtRrrOXdcqnp2SmRbNgLL7yaEJLTKi6hw/samzX1edlz8
	 SyvdPHpIM6TDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-5.15] dmaengine: dw-axi-dmac: fix PM for
 system sleep and channel alloc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260831133314.4125787-209-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
 <20260831133314.4125787-209-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 14:58:45 +0000
Message-Id: <20260831145846.054761F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The shared interrupt handler accesses hardware registers without c=
hecking if the device is active, and the suspend callback fails to synchron=
ize IRQs.
--

commit 11e86e3a3829f6e35823522311eef18dacb1afef
Author: Tze Yee Ng <tze.yee.ng@altera.com>

dmaengine: dw-axi-dmac: fix PM for system sleep and channel alloc
   =20
The driver only had runtime PM callbacks. If a channel stayed allocated
across system suspend/resume, the runtime usage count could remain
non-zero while hardware state (DMAC_CFG, clocks) was lost, and
axi_dma_runtime_resume() would not run to restore it.

Add system-sleep PM ops that use pm_runtime_force_suspend() and
pm_runtime_force_resume() so suspend/resume reuses the existing
axi_dma_suspend() and axi_dma_resume() paths.

Link: https://patch.msgid.link/18bf778a3a1cc2f377ef8eb0d1508d8ac6371896.177=
9688569.git.tze.yee.ng@altera.com

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index b23536645ff7c..4fd77f5b67c47 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c

[ ... ]

> @@ -1654,6 +1659,8 @@ static void dw_remove(struct platform_device *pdev)
>  }
> =20
>  static const struct dev_pm_ops dw_axi_dma_pm_ops =3D {
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
>  	SET_RUNTIME_PM_OPS(axi_dma_runtime_suspend, axi_dma_runtime_resume, NUL=
L)
>  };

[Severity: High]
This is a pre-existing issue, but does the shared interrupt handler have a
potential race condition with device suspend?

The driver requests a shared interrupt:

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:axi_req_irqs() {
    ...
		ret =3D devm_request_irq(chip->dev, chip->irq[i], dw_axi_dma_interrupt,
				IRQF_SHARED, KBUILD_MODNAME, chip);
    ...
}

However, the interrupt handler accesses hardware registers unconditionally:

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:dw_axi_dma_interrupt() {
    ...
	axi_dma_irq_disable(chip);
    ...
}

If another device on the same shared IRQ line triggers an interrupt while t=
his
DMA controller is runtime suspended (with clocks disabled), could this caus=
e a
bus hang or system crash when accessing unclocked registers?

Additionally, the suspend routine cuts clocks without synchronizing IRQs:

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:axi_dma_suspend() {
    ...
	clk_disable_unprepare(chip->core_clk);
	clk_disable_unprepare(chip->cfgr_clk);
    ...
}

Could an in-flight IRQ handler crash when the clocks are cut mid-execution?

Should the interrupt handler use pm_runtime_get_if_active() to check if the
device is active before proceeding, and should the suspend callback call
synchronize_irq() to ensure no handler is executing before disabling the cl=
ocks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831133314.4125=
787-209-sashal@kernel.org?part=3D1
