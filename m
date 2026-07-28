Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E72A3E0C4A
	for <dmaengine@vger.kernel.org>; Tue, 28 Jul 2026 08:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785227916; cv=none; b=TVlWfXVrXmJG3UYNQjg9vMZ7xNnn3AXyiWWNsVPvJYCpKRHDiXNjhkV1B6D/Rjdhq9tJs633ChYOW2rl1ZruTxQ4gVtcYCdksLs4e+CL+zc7Fgu+lQmwS7XLRbXlLdtu9hpYAjjHCfk56pWVqA6+XVIyfG2Jcy/Q/nAhwj3OR4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785227916; c=relaxed/simple;
	bh=MsE7kWv93Ru2CI/UP8lj5CPPu0bIHQsm0Bgg+ICPJzU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QIvkohVzzEsaTUuGeLvMXWAZmXUbx1MegmoAYovtz6lguTGzNfzYLIYV6qBgzwSB2erbF4tAUug1FBZrvjMUy8drKh50CVWFFsaUvyHobiB+s+NzAYer8og5/3Xr33Epa6wrTPRMun6fJhnce7/F3iWBwjtMKPwev/rMDZcy5HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bOH94iVm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bOH94iVm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5F91F00A3F
	for <dmaengine@vger.kernel.org>; Tue, 28 Jul 2026 08:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785227913;
	bh=jZ5KLdFG0Kj7A/1hGVR5FcdyB7fl+ixHwnKCoNYMBoQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=bOH94iVmiXTGTMKPJ2FmfAM9t0SowgeInt9/I6ZSV92z7SqJo14ivGOKf37iTZFWo
	 NAkptJHSNt/XHYRfEPjnYAJOLpAjHWAoLQuOmIwAaycDxXV43XBkeir4r6xl3IN+Dp
	 KYhslTnUBHsK2n4Vzsr9ljTg6ksadpPvnjg6ozS86BnmjaN+g9cCJlWVcSPf1Y3ZUQ
	 ZaG+1jgZczVhC++dwkEd85tBsVsTRuESVyZzb2aXUJ7+hLSzQXeSxZQrQBqYhoVBYD
	 pgCnWcx7RFPw6bgse9Bd48EO/hc7nSK5lHsiSROr1oiz4S0QRfoMwp041/nzH9tGMF
	 mY19TKoAMJZuQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so887878e87.1
        for <dmaengine@vger.kernel.org>; Tue, 28 Jul 2026 01:38:33 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxx69C/5fZnvp1r+QiXXumSWbr8B3KtgxFsX8JhPW50SDksdNll
	d1Pagd4DNMrLTcnLDihgDJn8pXhRbnIV0lyKUV8P+CBAP/YhyItb4x5N5eMScP5HLzfLFxL2mIB
	nUhg3BxjXPr9DJqZirBYYcpqPr/fS2KHBpUpjyuEcvA==
X-Received: by 2002:a05:6512:2353:b0:5b2:aaa2:1d92 with SMTP id
 2adb3069b0e04-5b2d025d23fmr274035e87.25.1785227912591; Tue, 28 Jul 2026
 01:38:32 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Jul 2026 01:38:30 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Jul 2026 01:38:30 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <b4d1a1d4b56f548e157a4d9d8bed785f507dc157.1785183549.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com> <b4d1a1d4b56f548e157a4d9d8bed785f507dc157.1785183549.git.allen.lkml@gmail.com>
Date: Tue, 28 Jul 2026 01:38:30 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdDEQ2JcQtJ0AwHq0atv9SJ1Y47W6Djzs_JGVoYkk8zFQ@mail.gmail.com>
X-Gm-Features: AUfX_mweuV2NQV2gdk5hEPPVqRK6kr4uxF3tef-qVA898oqyarmW2SDHO7pBrzw
Message-ID: <CAMRc=MdDEQ2JcQtJ0AwHq0atv9SJ1Y47W6Djzs_JGVoYkk8zFQ@mail.gmail.com>
Subject: Re: [PATCH v2 60/64] dmaengine: bam-dma: use dma_chan_kill_bh
To: Allen Pais <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-msm@vger.kernel.org, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Jul 2026 22:39:22 +0200, Allen Pais <allen.lkml@gmail.com> said:
> virt-dma now dispatches completion callbacks through per-channel BH
> work instead of its tasklet. Cancel that work during teardown before
> channel storage is released.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---
>  drivers/dma/qcom/bam_dma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 1bb26af0405f..74bc2fe445b3 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -1387,7 +1387,7 @@ static int bam_dma_probe(struct platform_device *pdev)
>  	dma_async_device_unregister(&bdev->common);
>  err_bam_channel_exit:
>  	for (i = 0; i < bdev->num_channels; i++)
> -		tasklet_kill(&bdev->channels[i].vc.task);
> +		dma_chan_kill_bh(&bdev->channels[i].vc.chan);
>  err_tasklet_kill:
>  	tasklet_kill(&bdev->task);
>  err_disable_clk:
> @@ -1413,7 +1413,7 @@ static void bam_dma_remove(struct platform_device *pdev)
>
>  	for (i = 0; i < bdev->num_channels; i++) {
>  		bam_dma_terminate_all(&bdev->channels[i].vc.chan);
> -		tasklet_kill(&bdev->channels[i].vc.task);
> +		dma_chan_kill_bh(&bdev->channels[i].vc.chan);
>
>  		if (!bdev->channels[i].fifo_virt)
>  			continue;
> --
> 2.43.0
>
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
