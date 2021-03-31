Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB28C433E1
	for <dmaengine@archiver.kernel.org>; Wed, 31 Mar 2021 02:49:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5FA90619E0
	for <dmaengine@archiver.kernel.org>; Wed, 31 Mar 2021 02:49:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233285AbhCaCtG (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 30 Mar 2021 22:49:06 -0400
Received: from mga04.intel.com ([192.55.52.120]:34332 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233288AbhCaCsg (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 30 Mar 2021 22:48:36 -0400
IronPort-SDR: F4MZxvILswTJXYLWx4cDwEL4Syc7SRw+C0bi5RCKZiLYG/NFxEVGtWpl6IpYN2ZE7VYk9rXjLY
 1inZMVCp6O7g==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="189663820"
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; 
   d="scan'208";a="189663820"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2021 19:48:35 -0700
IronPort-SDR: qUnxtWSRH+eSXDv2vjuzCAgB85IEzChLkaHqG4aSGWdReu49Ps2q0ib0LqTd7ZLJqvJse1Bnzy
 SYFKzKbVz4pw==
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; 
   d="scan'208";a="377074588"
Received: from djiang5-mobl1.amr.corp.intel.com (HELO [10.209.140.11]) ([10.209.140.11])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2021 19:48:34 -0700
Subject: Re: [PATCH v2] dma: Fix a double free in dma_async_device_register
To:     Lv Yunlong <lyl2019@mail.ustc.edu.cn>, vkoul@kernel.org
Cc:     dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210331014458.3944-1-lyl2019@mail.ustc.edu.cn>
From:   Dave Jiang <dave.jiang@intel.com>
Message-ID: <756f1b55-5ab8-157c-95c7-a071c572248e@intel.com>
Date:   Tue, 30 Mar 2021 19:48:33 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210331014458.3944-1-lyl2019@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org


On 3/30/2021 6:44 PM, Lv Yunlong wrote:
> In the first list_for_each_entry() macro of dma_async_device_register,
> it gets the chan from list and calls __dma_async_device_channel_register
> (..,chan). We can see that chan->local is allocated by alloc_percpu() and
> it is freed chan->local by free_percpu(chan->local) when
> __dma_async_device_channel_register() failed.
>
> But after __dma_async_device_channel_register() failed, the caller will
> goto err_out and freed the chan->local in the second time by free_percpu().
>
> The cause of this problem is forget to set chan->local to NULL when
> chan->local was freed in __dma_async_device_channel_register(). My
> patch sets chan->local to NULL when the callee failed to avoid double free.
>
> Fixes: d2fb0a0438384 ("dmaengine: break out channel registration")
> Signed-off-by: Lv Yunlong <lyl2019@mail.ustc.edu.cn>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>


> ---
>   drivers/dma/dmaengine.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index fe6a460c4373..af3ee288bc11 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -1086,6 +1086,7 @@ static int __dma_async_device_channel_register(struct dma_device *device,
>   	kfree(chan->dev);
>    err_free_local:
>   	free_percpu(chan->local);
> +	chan->local = NULL;
>   	return rc;
>   }
>   
