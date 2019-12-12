Return-Path: <SRS0=kYB8=2C=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21E41C43603
	for <dmaengine@archiver.kernel.org>; Thu, 12 Dec 2019 11:54:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E6BE922527
	for <dmaengine@archiver.kernel.org>; Thu, 12 Dec 2019 11:54:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="s4K0wXWs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729078AbfLLLyq (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 12 Dec 2019 06:54:46 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:50814 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbfLLLyq (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Thu, 12 Dec 2019 06:54:46 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCBsTJU101938;
        Thu, 12 Dec 2019 05:54:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576151669;
        bh=MieMtlbiOdyJGYgXkYjcjUbOFx+OjgCyFzqmplxD/X8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=s4K0wXWsv6Kc2sOYTYJwZitaCHo/Rsmh0I4m0CpnTTcMfvSOI1Lm2btBOp4odLat+
         tPf+yvNzogCp56q2EOGolPKE61BpSMT0X2U3+TQzEtTERLeW2l1MxfLBrG6Va3vUld
         NWeAWZPNcCPNc7qnZ0kXCweuHgvDBIOz4hHujhAI=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCBsTZa086605
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Dec 2019 05:54:29 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 05:54:29 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 05:54:29 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCBsQZb012150;
        Thu, 12 Dec 2019 05:54:27 -0600
Subject: Re: [PATCH -next] dmaengine: ti: edma: Fix error return code in
 edma_probe()
To:     Wei Yongjun <weiyongjun1@huawei.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Vinod Koul <vkoul@kernel.org>,
        Chuhong Yuan <hslester96@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        YueHaibing <yuehaibing@huawei.com>
CC:     <dmaengine@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
References: <20191212114622.127322-1-weiyongjun1@huawei.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <abdbcd13-eb2f-fb13-2f6b-a748c0b1bc7c@ti.com>
Date:   Thu, 12 Dec 2019 13:54:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191212114622.127322-1-weiyongjun1@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org



On 12/12/2019 13.46, Wei Yongjun wrote:
> Fix to return negative error code -ENOMEM from the error handling
> case instead of 0, as done elsewhere in this function.

Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

> 
> Fixes: 2a03c1314506 ("dmaengine: ti: edma: add missed operations")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/dma/ti/edma.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
> index 0628ee4bf1b4..03a7f647f7b2 100644
> --- a/drivers/dma/ti/edma.c
> +++ b/drivers/dma/ti/edma.c
> @@ -2342,8 +2342,10 @@ static int edma_probe(struct platform_device *pdev)
>  	ecc->channels_mask = devm_kcalloc(dev,
>  					   BITS_TO_LONGS(ecc->num_channels),
>  					   sizeof(unsigned long), GFP_KERNEL);
> -	if (!ecc->slave_chans || !ecc->slot_inuse || !ecc->channels_mask)
> +	if (!ecc->slave_chans || !ecc->slot_inuse || !ecc->channels_mask) {
> +		ret = -ENOMEM;
>  		goto err_disable_pm;
> +	}
>  
>  	/* Mark all channels available initially */
>  	bitmap_fill(ecc->channels_mask, ecc->num_channels);
> 
> 
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
