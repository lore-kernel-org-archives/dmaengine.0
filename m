Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041E1165F1A
	for <dmaengine@vger.kernel.org>; Sat,  8 Aug 2026 11:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786187798; cv=none; b=aDdQaHEP8O0V3WWR3xroiC4RXU5O0FjC9wx4VrJcwAT3K7yUZ3tch8vpTMWaW+5dZHO3N2+WMF9YJR9EaM7qljTyguhF+BNuut8Fxv/p2Hq0eXi4vUkY8An8bkFFheNZKDZeJhl1qAnyQq1gmn1ctd+o7DOAKpw0SJVaH8YfnHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786187798; c=relaxed/simple;
	bh=a0cWqfnyfiAw7xF63zeFhiJmIaX0TcZLa4wRn+LtnpY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=irT1W4PmCmB3IiRQpv9MGCoM8WPSB0QM9r83uUIDbhIjJe/yykCjVSqghz3lQEInMJQ/vyOKTFg281E1DNu7tOQczsIgXgocT1+ipvwZpMVPMCNeWmdDvJo2uMaJYEPb+I91cJhC7Rct0CWVyzxg/A7bfxxA33GUG5TmXi8DEBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IPPWPfBb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IPPWPfBb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 575E21F000E9;
	Sat,  8 Aug 2026 11:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786187796;
	bh=4kSbP1r+mMY98n2tgOwS289VJGAkIZXtQtbR5hXau2I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IPPWPfBb3nRj/oIBQn8F97IliXWKuKKTClmiPEhNq3Xg8joK/yD+W6umLfIrECdMK
	 Lnh1QachwcWkFCS+VgpqzQwRZ3mVQ2/cY/zSzaDmGro2hvafBpt+p1ReWNK7jBev13
	 WE89pyxiNL8JP4ZoZ0XkyhjNhN9A14kns52XYhHDOQs+RK6shSedz7mYj8JAydi2Pl
	 vIq8TylqHQ2SqSBVZId/9rTc3j1/O7PYGcifh0DIbGp85C1xKXeAo978MZd1pbeUWI
	 cvCVL01BAH+cQlsrGLGvYZNJSt0QzCOUqu1lHj4JS3KTMXGbSLWh8HDwAXeSrl6+4W
	 Sl4aQb0UlG65g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: qcom-bam-dma: fix autosuspend cleanup during
 removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260808110642.2770355-1-lgs201920130244@gmail.com>
References: <20260808110642.2770355-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 11:16:35 +0000
Message-Id: <20260808111636.575E21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect teardown sequence in `bam_dma_remove()` causes unclocked=
 hardware accesses, tasklet races, and unbalanced clock disables.
- [High] The IRQ handler reads hardware registers before verifying the devi=
ce is active, risking a crash on spurious interrupts.
--

--- Patch [1]: [PATCH] dmaengine: qcom-bam-dma: fix autosuspend cleanup dur=
ing removal ---
commit d2172d870f372599d3763db15e5350f372805ea8
Author: Guangshuo Li <lgs201920130244@gmail.com>

dmaengine: qcom-bam-dma: fix autosuspend cleanup during removal

This commit adds a missing pm_runtime_dont_use_autosuspend() call in
bam_dma_remove() to properly drop the autosuspend usage count. This prevents
unbalanced usage counts if the autosuspend delay is set to a negative value.

> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 1bb26af0405f3..05a3b1f9e0c23 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -1401,6 +1401,7 @@ static void bam_dma_remove(struct platform_device *=
pdev)
>  	struct bam_device *bdev =3D platform_get_drvdata(pdev);
>  	u32 i;
> =20
> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  	pm_runtime_force_suspend(&pdev->dev);

[Severity: High]
This isn't a bug introduced by this patch, but does calling
pm_runtime_force_suspend() here break the teardown sequence?

If the device is active, pm_runtime_force_suspend() forcefully disables the
BAM hardware clock. The driver then immediately accesses hardware via
writel_relaxed() and bam_dma_terminate_all() in bam_dma_remove(), which
can trigger a synchronous bus error:

drivers/dma/qcom/bam_dma.c:bam_dma_remove() {
    ...
    pm_runtime_force_suspend(&pdev->dev);
    ...
    /* mask all interrupts for this execution environment */
    writel_relaxed(0, bam_addr(bdev, 0, BAM_IRQ_SRCS_MSK_EE));
    ...
}

Additionally, does this cause unbalanced clock disables?
pm_runtime_force_suspend() drops the clock enable count to 0, which would
cause the subsequent clk_disable_unprepare(bdev->bamclk) at the end of
bam_dma_remove() to decrement the count to -1 and trigger a clock
framework warning.

> =20
>  	of_dma_controller_free(pdev->dev.of_node);

[Severity: High]
This is a pre-existing issue, but does the IRQ handler read hardware regist=
ers
before verifying the device is active?

In bam_dma_irq(), process_channel_irqs() is called before pm_runtime_get_sy=
nc():

drivers/dma/qcom/bam_dma.c:bam_dma_irq() {
    ...
    srcs |=3D process_channel_irqs(bdev);
    ...
    ret =3D pm_runtime_get_sync(bdev->dev);
    ...
}

Inside process_channel_irqs(), it reads hardware registers:

drivers/dma/qcom/bam_dma.c:process_channel_irqs() {
    ...
    srcs =3D readl_relaxed(bam_addr(bdev, 0, BAM_IRQ_SRCS_EE));
    ...
}

If the IRQ handler executes due to a spurious interrupt or shared line while
the device is in a runtime-suspended state (and its clocks are off), could
reading the BAM register cause a bus fault or crash?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808110642.2770=
355-1-lgs201920130244@gmail.com?part=3D1
