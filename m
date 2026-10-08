Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C3F46A600
	for <dmaengine@vger.kernel.org>; Thu,  8 Oct 2026 09:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791452579; cv=none; b=owxicjbuhK61pl9VWK9A+pIa/zwcuZBIxp7wa04XyaFsaMF+1H94K5ZJQWQKGlaNuoR2G4NF9MdE6/pPiEvLBfKGms/5aoUj+ne1R2+LwCl5oWoFaQmaqJB8nwoeOCqzfharsKkhawTKrwStoFh7QSLFZKYuP2AG6he1ioczvpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791452579; c=relaxed/simple;
	bh=4PEpTDyDH8FzyP6bv2unyAk8MxqFrnZYOA7C7QXLA20=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=LccCM20zEAKah44ZpXcVImDRViRW+Xqt9OTXfNs3SDi+FzwA7yHvMF4RAtjw6P+WJ5tbkZFGfTEZDNYGFpbu+c3xVM4OlvcoK3AdMcB06whiNTjaScvfezG3S4yhT/yFRuO28BuJSnwPlm6P9PeqRAWrIJTKPVLTnx9m6R01RCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c6vhYHjM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c6vhYHjM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B525D1F00898;
	Thu,  8 Oct 2026 09:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791452578;
	bh=UDumlcL95e+ceCcxeWjaW4GtgXcd7q5bbg9Ugq6Muko=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c6vhYHjMFD2DT9C5xZaHgWsNF8ajJFLm+CU6JBM9D+bRxjEHvNWIn8XGP6jZXfjRj
	 ME4+aDoYk+vHc7/e/Aq7XVp6mlzTlNUqsqEvVFzzxIXCmPbHS8ZmAuRI5+VwJDwRis
	 Yy9ASyHSlwoH8tzLXphcbdy6Up2UugkbTNB4YmW7S9rC9FJwjOc8ZnA+1326O1e3t6
	 QSkE6rHiA3Ce/rlpA4bcos7GTClYYuMHUjfaPU5Zrqd/J93Oh4HBUiWWCB5AtczbDC
	 +C3KyJKgUxS+cdnfWEo2p223DOHUA0ENHD/fBWGzFCHFZGJql9GPSPhcsFhZsTaAtA
	 YrILBvHoLm6yA==
Message-ID: <sashiko-outbox-163959@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v27] dmaengine: qcom: bam_dma: free interrupt before the
 clock in error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20261008-bam-dma-free-irq-v27-1-660e70223e3c@oss.qualcomm.com>
References: <20261008-bam-dma-free-irq-v27-1-660e70223e3c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 09:42:57 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] dmaengine: qcom: bam_dma: hardcoded IRQF_TRIGGER_HIGH overrides DT
- [High] dmaengine: qcom: unclocked register access and clock double-disabl=
e in remove()
- [High] qcom/bam_dma: interrupt storm if IRQ fires before pm_runtime_enabl=
e()
--

commit 066c83fa78866b6ea0bc75cfc8548e9a56be5f96
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

dmaengine: qcom: bam_dma: free interrupt before the clock in error path

This commit replaces devm_request_irq() with request_irq() to manually free
the interrupt before disabling the clock in the error path. It also aims to
apply the same ordering to the remove path to prevent reading BAM registers
with the clock disabled.

Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-94=
5fd1cafbbc%40oss.qualcomm.com?part=3D2

> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 94cb957d4b187..a626746b5c934 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -1332,8 +1332,8 @@ static int bam_dma_probe(struct platform_device *pd=
ev)
>  	for (i =3D 0; i < bdev->num_channels; i++)
>  		bam_channel_init(bdev, &bdev->channels[i], i);
> =20
> -	ret =3D devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
> -			IRQF_TRIGGER_NONE, "bam_dma", bdev);
> +	ret =3D request_irq(bdev->irq, bam_dma_irq, IRQF_TRIGGER_HIGH,
> +			  "bam_dma", bdev);

[Severity: High]
Does hardcoding IRQF_TRIGGER_HIGH override the platform-specific Device Tree
configuration?

The original implementation used IRQF_TRIGGER_NONE, which properly delegated
the trigger configuration to the firmware or Device Tree. If this interrupt
is wired as active-low or edge-triggered on some platforms, could hardcoding
this to HIGH misconfigure the interrupt controller and lead to missed
interrupts or failure to request the IRQ?

[Severity: High]
If a pending or spurious interrupt fires immediately after request_irq(), c=
ould
it cause an interrupt storm?

bam_dma_irq() calls pm_runtime_get_sync(bdev->dev). However, pm_runtime_ena=
ble()
is not called until later in probe:

drivers/dma/qcom/bam_dma.c:bam_dma_probe() {
    ...
    ret =3D request_irq(bdev->irq, bam_dma_irq, IRQF_TRIGGER_HIGH, ...);
    ...
    pm_runtime_enable(&pdev->dev);
    ...
}

If the interrupt fires before pm_runtime_enable() is called, pm_runtime_get=
_sync()
will fail, and the handler will return IRQ_NONE without clearing the hardwa=
re
interrupt registers. Since this is a level-triggered interrupt, won't the G=
IC
immediately re-enter the handler upon exit, causing a tight infinite interr=
upt
storm until the spurious interrupt detector permanently disables the IRQ li=
ne?

[ ... ]

> @@ -1410,7 +1412,7 @@ static void bam_dma_remove(struct platform_device *=
pdev)
>  	/* mask all interrupts for this execution environment */
>  	writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
> =20
> -	devm_free_irq(bdev->dev, bdev->irq, bdev);
> +	free_irq(bdev->irq, bdev);

[Severity: High]
The commit message states this patch will "free the interrupt before disabl=
ing
the clock in error path and in remove()".

However, in bam_dma_remove(), pm_runtime_force_suspend() is called before f=
reeing
the interrupt and before accessing the hardware:

drivers/dma/qcom/bam_dma.c:bam_dma_remove() {
    pm_runtime_force_suspend(&pdev->dev);
    ...
    writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
    free_irq(bdev->irq, bdev);
    ...
    clk_disable_unprepare(bdev->bamclk);
}

Since pm_runtime_force_suspend() turns off the BAM clock, does this
writel_relaxed() access the hardware with the clock disabled, potentially
triggering a fatal bus fault or SError? Additionally, won't the uncondition=
al
clk_disable_unprepare() at the end of remove() cause a clock imbalance WARN
trace?

Could the commit message and code be out of sync here since the reordering =
in
remove() appears to have been reverted?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-bam-dma-fr=
ee-irq-v27-1-660e70223e3c@oss.qualcomm.com?part=3D1
