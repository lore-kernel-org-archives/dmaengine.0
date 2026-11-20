Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=37.205.14.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195174;
	b=ihK8PtO/BHeVSEXdxZ4/ejGSMRMIzrOVNzZ51irSqle/d1isKt7nYhy4tpXMsEs9Qhs9
	 P+nOOQj12Jjd40r0DmuwO6XHqnh0arPOB9DBKngX5idxEoDL1rS3ot4kiS3sConcOiF1X
	 FmvpUvZ9HTISIhQNIHyvfBZk/jbo6LlqpnTnvuriVANo+fB2sPqhHDWJRg8x53uThtOGr
	 yGrhZMD5MQsWlYem0c9gHwuGMqgQnatn2vmImmZJtjWVEsA6C43rm/RNihBV6Kz0qCPkf
	 FMfQRexv8x2GsXHxbiU0pCLkZEu7pMUlNC8qSmjRStHfGEEZvsaI25ZFfdHQydK2Hew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195174;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=LTpEanqIs/x2VUdKV8xemUfWXMl0QdH7PU5aERK6XR8=;
	b=lYE2DV1YZPHWIkWaBtN+oZNDJ06+Bjz9z4HsNtWrqMXC4gNZbwJLMhnRyAr1WzCDh8pY
	 ENLd7tkciJ7xU8+naPjdiNpRoQiZTB1lhOxbH3NMkLYRe4ZS+eDG8+o8c+j4AjXRMQAjm
	 XmN8HNewZ9JHVJmb7f9CO166ca0cAzmzOuQPiiZd7opxu66x1Jf06BQZevKtf9Wg87NAe
	 44fvBXjoD8hErblvOFYqvyitxeegKU+eTD9x0ZziW+nRS8uqwZRKOuZU7BY/hkXoAgyDS
	 2O5PC+4/E7A3da0cPaz1Zkq5nWB8UegRe78pxkcDJPYALemj9jo42WVJk2Y6BOVrXZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gpxsee.org;
	spf=pass smtp.mailfrom=gpxsee.org;
	arc=none smtp.remote-ip=37.205.14.76
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACA360A2605
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 17:19:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ACA360A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from [192.168.4.18] (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 75176C1028;
	Fri, 20 Nov 2026 18:19:25 +0100 (CET)
Message-ID: <9da149b2-8735-4910-b1eb-70a297d34ca3@gpxsee.org>
Date: Fri, 20 Nov 2026 18:19:24 +0100
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
Subject: Re: [PATCH v2 1/1] dmaengine: xilinx: xdma: Fix broken PM
 suspend/resume
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>,
 Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Michal Simek <michal.simek@amd.com>, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Martin_T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
References: <20261120155924.5785-1-tumic@gpxsee.org>
 <20261120155924.5785-2-tumic@gpxsee.org> <awB7zvk3iRr6NmPS@SMW015318>
Content-Language: en-US
From: =?UTF-8?Q?Martin_T=C5=AFma?= <tumic@gpxsee.org>
In-Reply-To: <awB7zvk3iRr6NmPS@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/20/26 5:56 PM, Frank Li wrote:
> On Fri, Nov 20, 2026 at 04:59:24PM +0100, tumic@gpxsee.org wrote:
>> [You don't often get email from tumic@gpxsee.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> From: Martin Tůma <martin.tuma@digiteqautomotive.com>
>>
>> Add the missing PM suspend/resume callbacks that properly reconfigure
>> the XDMA HW on PCIe suspend/resume.
> 
> why need reconfigure irq ?

Because the PCIe card looses power during suspend and all configured 
FPGA registers are gone (in fact the whole FPGA configuration/LUTs is 
gone, but that's the HW's job to reconfigure the FPGA when power is 
restored like it does it on boot. From the OS point of view only the 
register reconfiguration must be restored).

M.

> 
> Frank
> 
>>
>> Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
>> ---
>>   drivers/dma/xilinx/xdma.c | 121 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 121 insertions(+)
>>
>> diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
>> index 9d827c9a1267..fa006c9bae23 100644
>> --- a/drivers/dma/xilinx/xdma.c
>> +++ b/drivers/dma/xilinx/xdma.c
>> @@ -123,6 +123,7 @@ struct xdma_desc {
>>    * @irq_start: Start IRQ assigned to device
>>    * @irq_num: Number of IRQ assigned to device
>>    * @status: Initialization status
>> + * @pm_usr_irq: User IRQ vector storage for PM suspend/resume
>>    */
>>   struct xdma_device {
>>          struct platform_device  *pdev;
>> @@ -135,6 +136,7 @@ struct xdma_device {
>>          u32                     irq_start;
>>          u32                     irq_num;
>>          u32                     status;
>> +       u32                     pm_usr_irq;
>>   };
>>
>>   #define xdma_err(xdev, fmt, args...)                                   \
>> @@ -398,6 +400,28 @@ static int xdma_xfer_stop(struct xdma_chan *xchan)
>>                              CHAN_CTRL_RUN_STOP);
>>   }
>>
>> +/**
>> + * xdma_reconfig_channels - Reconfigure DMA channels
>> + * @xdev: DMA device pointer
>> + * @chans: channels configuration
>> + * @chan_num: number of channels
>> + */
>> +static int xdma_reconfig_channels(struct xdma_device *xdev,
>> +                                 struct xdma_chan *chans,
>> +                                 u32 chan_num)
>> +{
>> +       int i, ret;
>> +
>> +       for (i = 0; i < chan_num; i++) {
>> +               /* init channel hardware */
>> +               ret = xdma_channel_init(&(chans[i]));
>> +               if (ret)
>> +                       return ret;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>>   /**
>>    * xdma_alloc_channels - Detect and allocate DMA channels
>>    * @xdev: DMA device pointer
>> @@ -1018,6 +1042,53 @@ static int xdma_set_vector_reg(struct xdma_device *xdev, u32 vec_tbl_start,
>>          return 0;
>>   }
>>
>> +/**
>> + * xdma_irq_reconfig - Reconfigure IRQs
>> + * @xdev: DMA device pointer
>> + */
>> +static int xdma_irq_reconfig(struct xdma_device *xdev)
>> +{
>> +       u32 user_irq_start;
>> +       int ret;
>> +
>> +       /* reconfigure hardware IRQ registers */
>> +       ret = xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
>> +                                 XDMA_CHAN_NUM(xdev));
>> +       if (ret) {
>> +               xdma_err(xdev, "failed to reset channel vectors: %d", ret);
>> +               return ret;
>> +       }
>> +
>> +       /* reconfigure user IRQ registers if needed */
>> +       user_irq_start = XDMA_CHAN_NUM(xdev);
>> +       if (xdev->irq_num > user_irq_start) {
>> +               ret = xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
>> +                                         user_irq_start,
>> +                                         xdev->irq_num - user_irq_start);
>> +               if (ret) {
>> +                       xdma_err(xdev, "failed to reset user vectors: %d", ret);
>> +                       return ret;
>> +               }
>> +       }
>> +
>> +       /* reenable channels interrupts */
>> +       ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
>> +       if (ret) {
>> +               xdma_err(xdev, "failed to reenable channel IRQs: %d", ret);
>> +               return ret;
>> +       }
>> +
>> +       /* reenable user interrupts */
>> +       ret = regmap_write(xdev->rmap, XDMA_IRQ_USER_INT_EN_W1S,
>> +                          xdev->pm_usr_irq);
>> +       if (ret) {
>> +               xdma_err(xdev, "failed to reenable user IRQs: %d", ret);
>> +               return ret;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>>   /**
>>    * xdma_irq_init - initialize IRQs
>>    * @xdev: DMA device pointer
>> @@ -1297,15 +1368,65 @@ static int xdma_probe(struct platform_device *pdev)
>>          return ret;
>>   }
>>
>> +/**
>> + * xdma_suspend - PM suspend callback
>> + * @dev: XDMA device pointer
>> + */
>> +static int xdma_suspend(struct device *dev)
>> +{
>> +       struct xdma_device *xdev = dev_get_drvdata(dev);
>> +       int ret;
>> +
>> +       ret = regmap_read(xdev->rmap, XDMA_IRQ_USER_INT_EN,
>> +                         &xdev->pm_usr_irq);
>> +       if (ret) {
>> +               xdma_err(xdev, "User IRQ vector backup failed: %d", ret);
>> +               return ret;
>> +       }
>> +
>> +       ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1C, ~0);
>> +       if (ret)
>> +               xdma_err(xdev, "DMA channels IRQ disable failed: %d", ret);
>> +
>> +       return ret;
>> +}
>> +
>> +/**
>> + * xdma_resume - PM resume callback
>> + * @dev: XDMA device pointer
>> + */
>> +static int xdma_resume(struct device *dev)
>> +{
>> +       struct xdma_device *xdev = dev_get_drvdata(dev);
>> +       int ret;
>> +
>> +       ret = xdma_reconfig_channels(xdev, xdev->h2c_chans, xdev->h2c_chan_num);
>> +       if (ret) {
>> +               xdma_err(xdev, "H2C channels reconfiguration failed: %d", ret);
>> +               return ret;
>> +       }
>> +
>> +       ret = xdma_reconfig_channels(xdev, xdev->c2h_chans, xdev->c2h_chan_num);
>> +       if (ret) {
>> +               xdma_err(xdev, "C2H channels reconfiguration failed: %d", ret);
>> +               return ret;
>> +       }
>> +
>> +       return xdma_irq_reconfig(xdev);
>> +}
>> +
>>   static const struct platform_device_id xdma_id_table[] = {
>>          { "xdma", 0},
>>          { },
>>   };
>>   MODULE_DEVICE_TABLE(platform, xdma_id_table);
>>
>> +static DEFINE_NOIRQ_DEV_PM_OPS(xdma_dev_pm_ops, xdma_suspend, xdma_resume);
>> +
>>   static struct platform_driver xdma_driver = {
>>          .driver         = {
>>                  .name = "xdma",
>> +               .pm = pm_sleep_ptr(&xdma_dev_pm_ops),
>>          },
>>          .id_table       = xdma_id_table,
>>          .probe          = xdma_probe,
>> --
>> 2.56.1
>>
> 

