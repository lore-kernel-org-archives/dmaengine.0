Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=37.205.14.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795213280;
	b=ce3i9fd9jDVb95dQA8oZBLy8Xyxc+jAQ4+McZkQeIjv/JKNNThOYCkqfomb4TCSxJPbN
	 /7Ej8RLhymOz7PVcBMBn4xftZjEPLbZva/lOpj+6I4ycnFru/RzLWL4gkJqITmVoLCRTt
	 7UN7PaJubC1bBtT8vZ0eVBmQBzjGfAuhNFhZr52i1zGMmmnI/bC7E6a/nXyVlW+FGXS7o
	 R+f6nIcNXitNqfXYAJ61tf3R/3Hjw+ZERBdJjV2Q+tvEED9H4aAUHZ7QjcOUjcYAQ6ggY
	 B4/hsdR9yPYT14P1qickHXiDEO2aGXr+NoVx6igIZjYhTM/zkH6N7DlkHGgMGeAGnCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795213280;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=HtjsvQjuaW5XWQJwTHQ8JKbnBx5reofdO+ZDjzl6S0M=;
	b=eM30B7AqTPNcTzQAg2TO69BP8fYCGpe402aPCVb7gC7No+6JftfBBvQcQ/54iNe4l3V+
	 uRu1E1Bf8/TiGEuc3BcKnNlVRAEucvHR1VycbOIBBWRX0G3PedMdvnfoS5SWqrMuCbhJ6
	 2A6wbo7+RiNl4NlwMW6RtRQpcDNimCbmSt2Ct96DVxvvxpVfDNlfSvtuJ66CLdR6QgYkv
	 UnK1EViRUqXiQaMHANfwI371PX3dhufiGsPH/GIOblVi8rmCDDjBYPuKyQqBr/+oWFELT
	 gV7UKtc07ukQxhLSWY0IzObtZzxad2MWZR3rq5c/31X353l2qN/EKfydlyTJOwpYWXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gpxsee.org;
	spf=pass smtp.mailfrom=gpxsee.org;
	arc=none smtp.remote-ip=37.205.14.76
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F94D606A6A4
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 22:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F94D606A6A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from [192.168.1.135] (unknown [85.193.41.0])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 5F1C9C1911;
	Fri, 20 Nov 2026 23:21:12 +0100 (CET)
Message-ID: <47182dbe-018a-4ca6-b20c-f6e2afa5f474@gpxsee.org>
Date: Fri, 20 Nov 2026 23:21:12 +0100
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] dmaengine: xilinx: xdma: Fix broken PM
 suspend/resume
To: Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>,
 Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Martin_T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
References: <20261120172356.5858-1-tumic@gpxsee.org>
 <20261120172356.5858-2-tumic@gpxsee.org>
 <754c498c-7252-3f2b-54e6-3ebfdf0181ff@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Martin_T=C5=AFma?= <tumic@gpxsee.org>
In-Reply-To: <754c498c-7252-3f2b-54e6-3ebfdf0181ff@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/20/26 22:40, Lizhi Hou wrote:
> 
> On 11/20/26 09:23, tumic@gpxsee.org wrote:
>> From: Martin Tůma <martin.tuma@digiteqautomotive.com>
>>
>> Add the missing PM suspend/resume callbacks that properly reconfigure
>> the XDMA HW on PCIe suspend/resume.
> 
> Just wondering if we could destroy xdma platform device in your PCIe 
> suspend routine and re-create xdna device in PCIe resume?
> 

While this may also be theoretically possible, there are several 
arguments against this:

- Every driver using the device would have to do it instead of doing 
nothing and rely on the already established infrastructure for PM in the 
kernel. And it is not a simple "one function call" which would be needed
(and duplicated in every driver), there is some additional 
re-configuration needed, eg. the user IRQs.
- The creation/destroying of platform devices does a lot more stuff than 
just initializing some registers. It fiddles with the IRQ and memory 
allocation/deallocation which you don't want or even can't do while the 
system is in a PM suspend or PM resume state.

M.

> Lizhi
> 
>>
>> Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
>> ---
>>   drivers/dma/xilinx/xdma.c | 147 ++++++++++++++++++++++++++++++++------
>>   1 file changed, 124 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
>> index 9d827c9a1267..d6772b38d8f7 100644
>> --- a/drivers/dma/xilinx/xdma.c
>> +++ b/drivers/dma/xilinx/xdma.c
>> @@ -123,6 +123,7 @@ struct xdma_desc {
>>    * @irq_start: Start IRQ assigned to device
>>    * @irq_num: Number of IRQ assigned to device
>>    * @status: Initialization status
>> + * @usr_irq_mask: User IRQ mask for PM suspend/resume
>>    */
>>   struct xdma_device {
>>       struct platform_device    *pdev;
>> @@ -135,6 +136,7 @@ struct xdma_device {
>>       u32            irq_start;
>>       u32            irq_num;
>>       u32            status;
>> +    u32            usr_irq_mask;
>>   };
>>   #define xdma_err(xdev, fmt, args...)                    \
>> @@ -398,6 +400,27 @@ static int xdma_xfer_stop(struct xdma_chan *xchan)
>>                   CHAN_CTRL_RUN_STOP);
>>   }
>> +/**
>> + * xdma_reconfig_channels - Reconfigure DMA channels
>> + * @xdev: DMA device pointer
>> + * @chans: channels configuration
>> + * @chan_num: number of channels
>> + */
>> +static int xdma_reconfig_channels(struct xdma_chan *chans,
>> +                  u32 chan_num)
>> +{
>> +    int i, ret;
>> +
>> +    for (i = 0; i < chan_num; i++) {
>> +        /* init channel hardware */
>> +        ret = xdma_channel_init(&(chans[i]));
>> +        if (ret)
>> +            return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   /**
>>    * xdma_alloc_channels - Detect and allocate DMA channels
>>    * @xdev: DMA device pointer
>> @@ -1018,6 +1041,55 @@ static int xdma_set_vector_reg(struct 
>> xdma_device *xdev, u32 vec_tbl_start,
>>       return 0;
>>   }
>> +/**
>> + * xdma_irq_config - Configure IRQs
>> + * @xdev: DMA device pointer
>> + */
>> +static int xdma_irq_config(struct xdma_device *xdev)
>> +{
>> +    u32 user_irq_start;
>> +    int ret;
>> +
>> +    /* configure hardware IRQ registers */
>> +    ret = xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
>> +                  XDMA_CHAN_NUM(xdev));
>> +    if (ret) {
>> +        xdma_err(xdev, "failed to set channel vectors: %d", ret);
>> +        return ret;
>> +    }
>> +
>> +    /* configure user IRQ registers if needed */
>> +    user_irq_start = XDMA_CHAN_NUM(xdev);
>> +    if (xdev->irq_num > user_irq_start) {
>> +        ret = xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
>> +                      user_irq_start,
>> +                      xdev->irq_num - user_irq_start);
>> +        if (ret) {
>> +            xdma_err(xdev, "failed to set user vectors: %d", ret);
>> +            return ret;
>> +        }
>> +    }
>> +
>> +    /* enable channels interrupts */
>> +    ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
>> +    if (ret) {
>> +        xdma_err(xdev, "failed to enable channel IRQs: %d", ret);
>> +        return ret;
>> +    }
>> +
>> +    /* enable user interrupts if needed */
>> +    if (xdev->irq_num > user_irq_start) {
>> +        ret = regmap_write(xdev->rmap, XDMA_IRQ_USER_INT_EN_W1S,
>> +                   xdev->usr_irq_mask);
>> +        if (ret) {
>> +            xdma_err(xdev, "failed to enable user IRQs: %d", ret);
>> +            return ret;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   /**
>>    * xdma_irq_init - initialize IRQs
>>    * @xdev: DMA device pointer
>> @@ -1025,7 +1097,6 @@ static int xdma_set_vector_reg(struct 
>> xdma_device *xdev, u32 vec_tbl_start,
>>   static int xdma_irq_init(struct xdma_device *xdev)
>>   {
>>       u32 irq = xdev->irq_start;
>> -    u32 user_irq_start;
>>       int i, j, ret;
>>       /* return failure if there are not enough IRQs */
>> @@ -1060,28 +1131,8 @@ static int xdma_irq_init(struct xdma_device *xdev)
>>           irq++;
>>       }
>> -    /* config hardware IRQ registers */
>> -    ret = xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
>> -                  XDMA_CHAN_NUM(xdev));
>> -    if (ret) {
>> -        xdma_err(xdev, "failed to set channel vectors: %d", ret);
>> -        goto failed_init_c2h;
>> -    }
>> -
>> -    /* config user IRQ registers if needed */
>> -    user_irq_start = XDMA_CHAN_NUM(xdev);
>> -    if (xdev->irq_num > user_irq_start) {
>> -        ret = xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
>> -                      user_irq_start,
>> -                      xdev->irq_num - user_irq_start);
>> -        if (ret) {
>> -            xdma_err(xdev, "failed to set user vectors: %d", ret);
>> -            goto failed_init_c2h;
>> -        }
>> -    }
>> -
>> -    /* enable interrupt */
>> -    ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
>> +    /* configure all HW IRQ registers */
>> +    ret = xdma_irq_config(xdev);
>>       if (ret)
>>           goto failed_init_c2h;
>> @@ -1297,15 +1348,65 @@ static int xdma_probe(struct platform_device 
>> *pdev)
>>       return ret;
>>   }
>> +/**
>> + * xdma_suspend - PM suspend callback
>> + * @dev: XDMA device pointer
>> + */
>> +static int xdma_suspend(struct device *dev)
>> +{
>> +    struct xdma_device *xdev = dev_get_drvdata(dev);
>> +    int ret;
>> +
>> +    ret = regmap_read(xdev->rmap, XDMA_IRQ_USER_INT_EN,
>> +              &xdev->usr_irq_mask);
>> +    if (ret) {
>> +        xdma_err(xdev, "User IRQ vector backup failed: %d", ret);
>> +        return ret;
>> +    }
>> +
>> +    ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1C, ~0);
>> +    if (ret)
>> +        xdma_err(xdev, "DMA channels IRQ disable failed: %d", ret);
>> +
>> +    return ret;
>> +}
>> +
>> +/**
>> + * xdma_resume - PM resume callback
>> + * @dev: XDMA device pointer
>> + */
>> +static int xdma_resume(struct device *dev)
>> +{
>> +    struct xdma_device *xdev = dev_get_drvdata(dev);
>> +    int ret;
>> +
>> +    ret = xdma_reconfig_channels(xdev->h2c_chans, xdev->h2c_chan_num);
>> +    if (ret) {
>> +        xdma_err(xdev, "H2C channels reconfiguration failed: %d", ret);
>> +        return ret;
>> +    }
>> +
>> +    ret = xdma_reconfig_channels(xdev->c2h_chans, xdev->c2h_chan_num);
>> +    if (ret) {
>> +        xdma_err(xdev, "C2H channels reconfiguration failed: %d", ret);
>> +        return ret;
>> +    }
>> +
>> +    return xdma_irq_config(xdev);
>> +}
>> +
>>   static const struct platform_device_id xdma_id_table[] = {
>>       { "xdma", 0},
>>       { },
>>   };
>>   MODULE_DEVICE_TABLE(platform, xdma_id_table);
>> +static DEFINE_NOIRQ_DEV_PM_OPS(xdma_dev_pm_ops, xdma_suspend, 
>> xdma_resume);
>> +
>>   static struct platform_driver xdma_driver = {
>>       .driver        = {
>>           .name = "xdma",
>> +        .pm = pm_sleep_ptr(&xdma_dev_pm_ops),
>>       },
>>       .id_table    = xdma_id_table,
>>       .probe        = xdma_probe,
> 

