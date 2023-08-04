Return-Path: <dmaengine-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5678C0015E
	for <dmaengine@archiver.kernel.org>; Fri,  4 Aug 2023 01:13:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbjHDBNz (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 3 Aug 2023 21:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230367AbjHDBNy (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Thu, 3 Aug 2023 21:13:54 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E75804204;
        Thu,  3 Aug 2023 18:13:49 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RH71S6FsgzNmkl;
        Fri,  4 Aug 2023 09:10:20 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 09:13:46 +0800
Message-ID: <4e7a815f-b275-ad31-732a-ef340d3d2413@huawei.com>
Date:   Fri, 4 Aug 2023 09:13:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next] dmaengine: ste_dma40: Add missing IRQ check in
 d40_probe
To:     <linus.walleij@linaro.org>, <vkoul@kernel.org>,
        <akpm@linux-foundation.org>, <dan.j.williams@intel.com>,
        <srinidhi.kasagar@stericsson.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20230724144108.2582917-1-ruanjinjie@huawei.com>
Content-Language: en-US
From:   Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <20230724144108.2582917-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Ping.

On 2023/7/24 22:41, Ruan Jinjie wrote:
> From: ruanjinjie <ruanjinjie@huawei.com>
> 
> Check for the return value of platform_get_irq(): if no interrupt
> is specified, it wouldn't make sense to call request_irq().
> 
> Fixes: 8d318a50b3d7 ("DMAENGINE: Support for ST-Ericssons DMA40 block v3")
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>  drivers/dma/ste_dma40.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 825001bde42c..89e82508c133 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -3590,6 +3590,10 @@ static int __init d40_probe(struct platform_device *pdev)
>  	spin_lock_init(&base->lcla_pool.lock);
>  
>  	base->irq = platform_get_irq(pdev, 0);
> +	if (base->irq < 0) {
> +		ret = base->irq;
> +		goto destroy_cache;
> +	}
>  
>  	ret = request_irq(base->irq, d40_handle_interrupt, 0, D40_NAME, base);
>  	if (ret) {
