Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279DA1E2614;
	Fri, 14 Aug 2026 00:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786667761; cv=none; b=E+KvaWaizltSfuV8paH98u0kk+kadX7fC+Y7YKOcsdWJsCM7WYqO6qk7SQaF0JfDjgXic82/U03RiiYDgjVAAf+wB9lixk5o0DYKwCKFgsgB0T0Dj+kEF8dllIlkd81sTiHDLG4aUMf+wyXZX2XhXkx3JNMmJQSse9XgmeF8eZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786667761; c=relaxed/simple;
	bh=bf5nppdkHE+pe2Fz4Cm07YiLQ1mRTTsu0VcC2Q4g+j8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wo1u2Kj8xw7QQlNsPUhLJrkyKoQtk1Az+xSF2PZGnsJDQoFs4PEUNioZCEhN+Uv9Ve2IWx4e7mOAC2VjkIo6O4YLBx8k9ajklcYealhsm8PP3BiuntZ+9VGsG2nVaeq7WLWHR8gs/CI8lvaZB36JmFpQehwwpp10j8uNJGkUtJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=QJj9f9F5; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="QJj9f9F5"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1786667750; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=XJnVVf1j8t6EWr3rE41qTk2gXwoNoOsf5/elgYezZR8=;
	b=QJj9f9F5fWn9kmeT/ijfGRiYJBPjVm5QCzu0DzSW5SBfOcehuoCAoCI7lXCSrqmJ4l5/RqGyvuNjlL/KgOvFXOEvnpV7HYT7ONf2uxsvXHiCPDt8GS538038F7IWwUqhH3p1Ktcjivzivz7tWh2OUlk7gxr5k5HvNKJkwUaWUZ4=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R931e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0X8vXo.v_1786667749;
Received: from 30.74.144.118(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X8vXo.v_1786667749 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 14 Aug 2026 08:35:49 +0800
Message-ID: <fa32c930-3a1a-4967-935a-44156cb24b10@linux.alibaba.com>
Date: Fri, 14 Aug 2026 08:35:48 +0800
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: sprd: Fix runtime PM reference leak in probe
To: Ruoyu Wang <ruoyuw560@gmail.com>, dmaengine@vger.kernel.org
Cc: vkoul@kernel.org, Frank.Li@kernel.org, orsonzhai@gmail.com,
 zhang.lyra@gmail.com, linux-kernel@vger.kernel.org
References: <20260813153149.3953497-1-ruoyuw560@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260813153149.3953497-1-ruoyuw560@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/13/26 11:31 PM, Ruoyu Wang wrote:
> pm_runtime_get_sync() increments a device's usage counter even when it
> fails. sprd_dma_probe() currently jumps directly to controller clock
> cleanup on that error, bypassing both pm_runtime_put_noidle() and
> pm_runtime_disable(). This can happen if the preceding unchecked
> pm_runtime_set_active() fails and the following runtime-resume attempt
> also returns an error.
> 
> Enter the existing runtime-PM unwind path instead. This drops the
> reference without idling the partially initialized device, disables
> runtime PM, and then releases the controller clocks. The success path
> and propagated error code are unchanged.
> 
> This issue was found by a static analysis checker and confirmed by manual
> source review.
> 
> Fixes: 9b3b8171f7f4 ("dmaengine: sprd: Add Spreadtrum DMA driver")
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---

LGTM. Thanks.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

>   drivers/dma/sprd-dma.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
> index 087fea3af2e411..19b32a23c882de 100644
> --- a/drivers/dma/sprd-dma.c
> +++ b/drivers/dma/sprd-dma.c
> @@ -1212,7 +1212,7 @@ static int sprd_dma_probe(struct platform_device *pdev)
>   
>   	ret = pm_runtime_get_sync(&pdev->dev);
>   	if (ret < 0)
> -		goto err_rpm;
> +		goto err_register;
>   
>   	ret = dma_async_device_register(&sdev->dma_dev);
>   	if (ret < 0) {
> @@ -1234,7 +1234,6 @@ static int sprd_dma_probe(struct platform_device *pdev)
>   err_register:
>   	pm_runtime_put_noidle(&pdev->dev);
>   	pm_runtime_disable(&pdev->dev);
> -err_rpm:
>   	sprd_dma_disable(sdev);
>   	return ret;
>   }

