Return-Path: <dmaengine-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A2CCCE79AB
	for <dmaengine@archiver.kernel.org>; Wed, 20 Sep 2023 08:12:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbjITIMb (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 20 Sep 2023 04:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233468AbjITIM3 (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Wed, 20 Sep 2023 04:12:29 -0400
Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E42AC;
        Wed, 20 Sep 2023 01:12:18 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R241e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0VsUUPym_1695197534;
Received: from 30.97.48.72(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0VsUUPym_1695197534)
          by smtp.aliyun-inc.com;
          Wed, 20 Sep 2023 16:12:15 +0800
Message-ID: <6ac60523-6623-3d0e-d56c-b13a0a8922c9@linux.alibaba.com>
Date:   Wed, 20 Sep 2023 16:12:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH V3] dmaengine: sprd: add dma mask interface in probe
To:     Kaiwei Liu <kaiwei.liu@unisoc.com>, Vinod Koul <vkoul@kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        kaiwei liu <liukaiwei086@gmail.com>,
        Wenming Wu <wenming.wu@unisoc.com>
References: <20230919073801.25054-1-kaiwei.liu@unisoc.com>
From:   Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20230919073801.25054-1-kaiwei.liu@unisoc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org



On 9/19/2023 3:38 PM, Kaiwei Liu wrote:
> In the probe of DMA, the default addressing range is 32 bits,
> while the actual DMA hardware addressing range used is 36 bits.
> So add dma_set_mask_and_coherent function to match DMA
> addressing range.
> 
> Signed-off-by: Kaiwei Liu <kaiwei.liu@unisoc.com>

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> ---
> Change in V2:
> -Change subject line.
> Change in V3:
> -Modify error message to make it more readable.
> ---
>   drivers/dma/sprd-dma.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
> index 20c3cb1ef2f5..c371ce405f1d 100644
> --- a/drivers/dma/sprd-dma.c
> +++ b/drivers/dma/sprd-dma.c
> @@ -1115,6 +1115,15 @@ static int sprd_dma_probe(struct platform_device *pdev)
>   	u32 chn_count;
>   	int ret, i;
>   
> +	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(36));
> +	if (ret) {
> +		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> +		if (ret) {
> +			dev_err(&pdev->dev, "unable to set coherent mask to 32\n");
> +			return ret;
> +		}
> +	}
> +
>   	/* Parse new and deprecated dma-channels properties */
>   	ret = device_property_read_u32(&pdev->dev, "dma-channels", &chn_count);
>   	if (ret)
