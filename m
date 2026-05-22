Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128FA41B351
	for <dmaengine@vger.kernel.org>; Fri, 22 May 2026 14:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779460642; cv=none; b=PI+6GJ78QtLH6DREkjPfoTCsh7VCLULUPIzE7cbwiaRGN82S/ZNINzMprv2zHvBacgKjOC0Kw6N9rbvioVhiay/6X2reXTsM9MhkRNSxpXSrJqE1+CNpyKpjPx/ea7jmNsCojJWpvHIOxMUSCXdyPLUF75I6AFxsjak2WpDgnr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779460642; c=relaxed/simple;
	bh=hed07dj45YzcXXNnJoUu47eLiebvuKryov40PzIC2w0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Db+Q6VyOMTV+m04jNZKJ8qwLyE48TEJ78G7nBJA+HoRhbVv6iRA3fI/s3xng5FKSSHHDROH0Bc+53+V9h3+vPc2A8L+3o4Y2CsGuzGPHhCJkIwmIxLwDJxw16DQC5dS45eQV02+AOjNjYgJTg2jUlvszkPjK83MY9AMyWG5DUiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k5gpcLaN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k5gpcLaN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 468241F000E9;
	Fri, 22 May 2026 14:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779460640;
	bh=IY4TikTi9q9E9azzQQesE32Df0kZ0esUxFr/uYNPnKM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k5gpcLaNdOCLid60HNJnJwmq5Jg5zyGEaCKcFFYjTO6hk/EHkty/FOS6Kl0TeVjxz
	 FERzljKlxhpu1xxef3CnuIn+vn2xGZA7Ct/IN0tYuWb7KVN205qsAsEEbDsawNqHos
	 QX2uW4u0BUAZEJdxFs+iGZuHUGT04fZ+9aaJEh6cYed7MfgnpukIEPLe80HbmQTccM
	 ipJe3d9hiAGppJDyto8iMDTW8bHwErMPMAaVlh0bnX00WPPPXy4DrnVFpvOfow6BNb
	 VzxjlPdL8rhY/mLrTkLAq7IuebzIByvr8rvuV2sXJcOSJs57TA9GpCvu/BHc3/xY2G
	 AHI7tGivnVY1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 03/14] dmaengine: qcom: bam_dma: convert tasklet to
 a BH workqueue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260522-qcom-qce-cmd-descr-v18-3-99103926bafc@oss.qualcomm.com>
References: <20260522-qcom-qce-cmd-descr-v18-3-99103926bafc@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 14:37:19 +0000
Message-Id: <20260522143720.468241F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Race condition during device removal can lead to unclocked registe=
r accesses and system crash because the workqueue is canceled after hardwar=
e is suspended.
--

commit b9a9d75f58c32f4c8ef9136a87ab0247a418dd26
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
dmaengine: qcom: bam_dma: convert tasklet to a BH workqueue

This commit converts the BAM DMA driver to use the high-priority variant of
the BH workqueue instead of legacy tasklets for starting DMA transactions.

> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index b3d36ea799843..1c62f845ac0b9 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
[ ... ]
> @@ -1394,7 +1394,7 @@ static void bam_dma_remove(struct platform_device *=
pdev)
>  			    bdev->channels[i].fifo_phys);
>  	}
> =20
> -	tasklet_kill(&bdev->task);
> +	cancel_work_sync(&bdev->work);

[Severity: High]
This is a pre-existing issue, but can this ordering lead to a race condition
during device removal?

Earlier in bam_dma_remove(), pm_runtime_force_suspend() is called. This
forces the device into suspend and disables its clocks without waiting for
active runtime PM references to drop.

If the work queue is executing concurrently and acquires a PM reference via
pm_runtime_get_sync() just before the forceful suspend, will it proceed to
access BAM hardware registers in bam_start_dma() after the clocks have
been disabled?

Accessing unclocked registers on ARM/QCOM platforms typically causes
asynchronous external aborts or bus errors resulting in a kernel panic.
Should the background work be explicitly canceled before shutting down the
hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-qcom-qce-c=
md-descr-v18-0-99103926bafc@oss.qualcomm.com?part=3D3
