Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A628B282F0C
	for <dmaengine@vger.kernel.org>; Thu,  8 Oct 2026 10:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454130; cv=none; b=oSArFY0f8mQjF02tKPE3fdldNnjDSd/iqQEIzLXrtBkmFpmYfD9478+3xmjMqLd3vsBrW6N9P8hgjpe1pSFasaqrXhb8lHroP5uu6831iVF85ooL1tzqyNgSYDbH9dOn9uSXE+ci3b59lL4HcdNSsatpa8IyVpo/UFQmKA3Ur/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454130; c=relaxed/simple;
	bh=vlnP5WtElQn/8xog/9gA76a0qom7ThRceiTpEaJlT+4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=iyICgReHB+rXGeKLK3io7c8n9Z6RQq7VYHqjZ4TPAY/AXqwpsMlN0GyrGO7cs3xNBhzwDzrCDLs3SPCI+iipNFff/awCE+wmbjtYpz/qPvYMvbuM586HfCtsQ0ipzFAMgNJ4katFlPKEbRz0KW539c8rtvmw5pJzwrH7omcGWxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JHfRiDcD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JHfRiDcD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437F41F000FF;
	Thu,  8 Oct 2026 10:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791454129;
	bh=Emr8e2CA71if8xKAkfuO71o0i8fWAT4WdC3HJ7mN78g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JHfRiDcDJRibmuV6F4OtnIhW0WeYZyFk+7bqvd2SQWe0MDZVHFhlcRx4SV/qk98f4
	 1q58dFufidKAtClRqqQCfkr9NkFfFZ5RInVontFwaa1ktodDL5SjeJJvCSXv02diBE
	 yeSkWAzPXpU0pMveKev92LcX5W3wuZMf6xna8+vAhMXwh7awigjuWXOS3R74kHRhq1
	 YfGkyzCqPlk9yQ+rFLSn8CZtYWudlOszeXnqEY/O+IkHoupPB1tZEeqXXpcw5kPL1+
	 kSjZuMP+4girqquw2/FkEu2yJ3sAmLjRsvdiGefY03BidxVIhvf+GBGNpvbakxHNh3
	 EwlpIUt6xjD2w==
Message-ID: <sashiko-outbox-163999@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v28] dmaengine: qcom: bam_dma: free interrupt before the
 clock in error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261008-bam-dma-free-irq-v28-1-5e5b10de441e@oss.qualcomm.com>
References: <20261008-bam-dma-free-irq-v28-1-5e5b10de441e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 10:08:48 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dmaengine: qcom: bam_dma: IRQ storm and PM usage leak due to early=
 request_irq
--

commit 6d143e987eb1a2023f5265042274ca78fbb524c0
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

dmaengine: qcom: bam_dma: free interrupt before the clock in error path

The BAM interrupt is requested with a devres helper and freed after probe()
returns, but the clock is disabled before freeing it, which can lead to
reading BAM registers with the clock disabled. This patch stops using the
devres helper and manually frees the interrupt before disabling the clock
in the error path and in remove().

Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-94=
5fd1cafbbc%40oss.qualcomm.com?part=3D2

> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 94cb957d4b187..f67a93a37d48c 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -1332,8 +1332,8 @@ static int bam_dma_probe(struct platform_device *pd=
ev)
>  	for (i =3D 0; i < bdev->num_channels; i++)
>  		bam_channel_init(bdev, &bdev->channels[i], i);
> =20
> -	ret =3D devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
> -			IRQF_TRIGGER_NONE, "bam_dma", bdev);
> +	ret =3D request_irq(bdev->irq, bam_dma_irq, IRQF_TRIGGER_NONE,
> +			  "bam_dma", bdev);

[Severity: High]
Could this request_irq() lead to an IRQ storm if an interrupt fires
immediately?

Looking at bam_dma_probe(), request_irq() is called here, but runtime PM is
configured and enabled much later in the function:

drivers/dma/qcom/bam_dma.c:bam_dma_probe() {
    ...
	pm_runtime_set_active(&pdev->dev);
	pm_runtime_enable(&pdev->dev);
    ...
}

If the BAM hardware asserts an interrupt before PM is enabled,
bam_dma_irq() will execute and call pm_runtime_get_sync():

drivers/dma/qcom/bam_dma.c:bam_dma_irq() {
    ...
	ret =3D pm_runtime_get_sync(bdev->dev);
	if (ret < 0)
		return IRQ_NONE;
    ...
}

Since PM is not active yet, pm_runtime_get_sync() will fail. The handler
returns IRQ_NONE without clearing the pending hardware interrupt, leaving
the level-triggered interrupt asserted and causing an IRQ storm.

Additionally, does this early return leak the PM runtime usage counter?
pm_runtime_get_sync() increments the usage counter even on failure, so
returning early without putting the counter would leak it on every
spurious execution.

>  	if (ret)
>  		goto err_bam_channel_exit;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-bam-dma-fr=
ee-irq-v28-1-5e5b10de441e@oss.qualcomm.com?part=3D1
