Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=37.205.14.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197028;
	b=Wpe0Xgu9V6+HnOFhhNjLjTkh1/ICK86OiOVQM+sXn0L/YgS0YRzHJ7AEr/BkqGLFf9Qw
	 hHJlzQJ9uIS8E3/ad/LK3LbI6c9netnkTbaF03KK4Et9p58WsBF1mDWH/sOFGhq4aLa/c
	 e7T3VcMujGeer2qi59nK6AHLbfn43aoq/ILggEN3RMPMpF97VzHW1oiNMpCXe2dJipQtP
	 5Lv4u6F5VJqLux53/s9/hfCtZldUs5/mh7/rb9QxWJqDcuRFWjTXqam978evav1DP1BJM
	 CnuTatC32Xdm/EdA7JF2/3vCjtaB4ZQvBJpP6b/LJbVWVN27sYc4Urwn6/J5PZ6ZdQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197028;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=tzRZNpW32jLg9OCCsNE1VlQLhEDJ7XFEcMmpQj9Hruk=;
	b=U85p1jkiP3aepur1HngFnaD8kbYn2+KiekHiwcE4tMM2TPC2IUyM2OXMmipIq+cxKUb0
	 2LMBWnp1HTjXYV80bjm9T2iUS3M79OrOoxZnF84UvXIrkAH1qxm1gJhhbJ1SoCuIky7Gt
	 VqXzqrCl5Ujh1wX+73srjy2vskoX+kZynA6MvwULIO46eq9BXlrBg7T9SHUyOHPyh+3ls
	 2x6Vu+KxhNw/9RCzoU3gcPSvA6ZCu6Dc7ugCfOXaqHcboWSXrSeIPnyBKbJldoVH19n08
	 Cgs4vXZ8KJH5jHmuVaPPdsg/zQ5IxjhxwZl6wS4HEHkIGjnO4aeAnMKEKJUP+h4jmdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gpxsee.org;
	spf=pass smtp.mailfrom=gpxsee.org;
	arc=none smtp.remote-ip=37.205.14.76
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2C160A2607
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 17:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B2C160A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from [192.168.4.18] (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 5B9F8B8DC8;
	Fri, 20 Nov 2026 18:50:23 +0100 (CET)
Message-ID: <63a88e20-59e3-4189-962e-c89dc1f786a0@gpxsee.org>
Date: Fri, 20 Nov 2026 18:50:22 +0100
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
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>,
 Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Michal Simek <michal.simek@amd.com>, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Martin_T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
References: <20261120172356.5858-1-tumic@gpxsee.org>
 <20261120172356.5858-2-tumic@gpxsee.org> <awCEOvNMoXnoA3XD@SMW015318>
Content-Language: en-US
From: =?UTF-8?Q?Martin_T=C5=AFma?= <tumic@gpxsee.org>
In-Reply-To: <awCEOvNMoXnoA3XD@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/20/26 6:32 PM, Frank Li wrote:
> On Fri, Nov 20, 2026 at 06:23:56PM +0100, tumic@gpxsee.org wrote:
>> From: Martin Tůma <martin.tuma@digiteqautomotive.com>
>>
>> Add the missing PM suspend/resume callbacks that properly reconfigure
>> the XDMA HW on PCIe suspend/resume.
>>
>> Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
>> ---
> 
> Put change log here when bump version. And you post 3 version today.
> Slow down, post one version at most per day.
> 

The changelog is in the cover-letter like usual in all other kernel 
mailing lists I have contributed to so far. Does the dmaengine list have 
some special rules different from all the other mailing lists?

The v2 and v3 patches are just "cosmetics" changes in response to the 
sashiko-bot review. If you think my responses are to fast, than maybe 
someone should slow down the AI bot response times ;-)

M.

> Frank
> 
>>   drivers/dma/xilinx/xdma.c | 147 ++++++++++++++++++++++++++++++++------
>>   1 file changed, 124 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
>> index 9d827c9a1267..d6772b38d8f7 100644
>> --- a/drivers/dma/xilinx/xdma.c
>> +++ b/drivers/dma/xilinx/xdma.c
>> @@ -123,6 +123,7 @@ struct xdma_desc {
>>    * @irq_start: Start IRQ assigned to device
>>    * @irq_num: Number of IRQ assigned to device
>>    * @status: Initialization status
>> + * @usr_irq_mask: User IRQ mask for PM suspend/resume
>>    */
>>   struct xdma_device {
>>   	struct platform_device	*pdev;
>> @@ -135,6 +136,7 @@ struct xdma_device {
>>   	u32			irq_start;
>>   	u32			irq_num;
>>   	u32			status;
>> +	u32			usr_irq_mask;
>>   };
>>
>>   #define xdma_err(xdev, fmt, args...)					\
>> @@ -398,6 +400,27 @@ static int xdma_xfer_stop(struct xdma_chan *xchan)
>>   			    CHAN_CTRL_RUN_STOP);
>>   }
>>
>> +/**
>> + * xdma_reconfig_channels - Reconfigure DMA channels
>> + * @xdev: DMA device pointer
>> + * @chans: channels configuration
>> + * @chan_num: number of channels
>> + */
>> +static int xdma_reconfig_channels(struct xdma_chan *chans,
>> +				  u32 chan_num)
>> +{
>> +	int i, ret;
>> +
>> +	for (i = 0; i < chan_num; i++) {
>> +		/* init channel hardware */
>> +		ret = xdma_channel_init(&(chans[i]));
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   /**
>>    * xdma_alloc_channels - Detect and allocate DMA channels
>>    * @xdev: DMA device pointer
>> @@ -1018,6 +1041,55 @@ static int xdma_set_vector_reg(struct xdma_device *xdev, u32 vec_tbl_start,
>>   	return 0;
>>   }
>>
>> +/**
>> + * xdma_irq_config - Configure IRQs
>> + * @xdev: DMA device pointer
>> + */
>> +static int xdma_irq_config(struct xdma_device *xdev)
>> +{
>> +	u32 user_irq_start;
>> +	int ret;
>> +
>> +	/* configure hardware IRQ registers */
>> +	ret = xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
>> +				  XDMA_CHAN_NUM(xdev));
>> +	if (ret) {
>> +		xdma_err(xdev, "failed to set channel vectors: %d", ret);
>> +		return ret;
>> +	}
>> +
>> +	/* configure user IRQ registers if needed */
>> +	user_irq_start = XDMA_CHAN_NUM(xdev);
>> +	if (xdev->irq_num > user_irq_start) {
>> +		ret = xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
>> +					  user_irq_start,
>> +					  xdev->irq_num - user_irq_start);
>> +		if (ret) {
>> +			xdma_err(xdev, "failed to set user vectors: %d", ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	/* enable channels interrupts */
>> +	ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
>> +	if (ret) {
>> +		xdma_err(xdev, "failed to enable channel IRQs: %d", ret);
>> +		return ret;
>> +	}
>> +
>> +	/* enable user interrupts if needed */
>> +	if (xdev->irq_num > user_irq_start) {
>> +		ret = regmap_write(xdev->rmap, XDMA_IRQ_USER_INT_EN_W1S,
>> +				   xdev->usr_irq_mask);
>> +		if (ret) {
>> +			xdma_err(xdev, "failed to enable user IRQs: %d", ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   /**
>>    * xdma_irq_init - initialize IRQs
>>    * @xdev: DMA device pointer
>> @@ -1025,7 +1097,6 @@ static int xdma_set_vector_reg(struct xdma_device *xdev, u32 vec_tbl_start,
>>   static int xdma_irq_init(struct xdma_device *xdev)
>>   {
>>   	u32 irq = xdev->irq_start;
>> -	u32 user_irq_start;
>>   	int i, j, ret;
>>
>>   	/* return failure if there are not enough IRQs */
>> @@ -1060,28 +1131,8 @@ static int xdma_irq_init(struct xdma_device *xdev)
>>   		irq++;
>>   	}
>>
>> -	/* config hardware IRQ registers */
>> -	ret = xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
>> -				  XDMA_CHAN_NUM(xdev));
>> -	if (ret) {
>> -		xdma_err(xdev, "failed to set channel vectors: %d", ret);
>> -		goto failed_init_c2h;
>> -	}
>> -
>> -	/* config user IRQ registers if needed */
>> -	user_irq_start = XDMA_CHAN_NUM(xdev);
>> -	if (xdev->irq_num > user_irq_start) {
>> -		ret = xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
>> -					  user_irq_start,
>> -					  xdev->irq_num - user_irq_start);
>> -		if (ret) {
>> -			xdma_err(xdev, "failed to set user vectors: %d", ret);
>> -			goto failed_init_c2h;
>> -		}
>> -	}
>> -
>> -	/* enable interrupt */
>> -	ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
>> +	/* configure all HW IRQ registers */
>> +	ret = xdma_irq_config(xdev);
>>   	if (ret)
>>   		goto failed_init_c2h;
>>
>> @@ -1297,15 +1348,65 @@ static int xdma_probe(struct platform_device *pdev)
>>   	return ret;
>>   }
>>
>> +/**
>> + * xdma_suspend - PM suspend callback
>> + * @dev: XDMA device pointer
>> + */
>> +static int xdma_suspend(struct device *dev)
>> +{
>> +	struct xdma_device *xdev = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	ret = regmap_read(xdev->rmap, XDMA_IRQ_USER_INT_EN,
>> +			  &xdev->usr_irq_mask);
>> +	if (ret) {
>> +		xdma_err(xdev, "User IRQ vector backup failed: %d", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1C, ~0);
>> +	if (ret)
>> +		xdma_err(xdev, "DMA channels IRQ disable failed: %d", ret);
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * xdma_resume - PM resume callback
>> + * @dev: XDMA device pointer
>> + */
>> +static int xdma_resume(struct device *dev)
>> +{
>> +	struct xdma_device *xdev = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	ret = xdma_reconfig_channels(xdev->h2c_chans, xdev->h2c_chan_num);
>> +	if (ret) {
>> +		xdma_err(xdev, "H2C channels reconfiguration failed: %d", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = xdma_reconfig_channels(xdev->c2h_chans, xdev->c2h_chan_num);
>> +	if (ret) {
>> +		xdma_err(xdev, "C2H channels reconfiguration failed: %d", ret);
>> +		return ret;
>> +	}
>> +
>> +	return xdma_irq_config(xdev);
>> +}
>> +
>>   static const struct platform_device_id xdma_id_table[] = {
>>   	{ "xdma", 0},
>>   	{ },
>>   };
>>   MODULE_DEVICE_TABLE(platform, xdma_id_table);
>>
>> +static DEFINE_NOIRQ_DEV_PM_OPS(xdma_dev_pm_ops, xdma_suspend, xdma_resume);
>> +
>>   static struct platform_driver xdma_driver = {
>>   	.driver		= {
>>   		.name = "xdma",
>> +		.pm = pm_sleep_ptr(&xdma_dev_pm_ops),
>>   	},
>>   	.id_table	= xdma_id_table,
>>   	.probe		= xdma_probe,
>> --
>> 2.56.1
>>
> 

