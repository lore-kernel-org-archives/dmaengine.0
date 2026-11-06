Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793925590;
	b=iYQegjUVCKJFtp4g0BLITkozOIgjgVFOZFqbGbCtlkQRYawCf08icpS/JcabigHYRqOB
	 FC2dsDKWemzekMjHEgSNkPXheDCowesfFETpHS4EMKpr2Wq8sjlLJkVbWt4NIBOOpJ8lT
	 8VjhIyGG5ZzmcsSSheTeTwdKgY315czIEALjWKevga/Nd3VJkq6CsRL4PBEfBr9FKo7D8
	 0Ao7r4wug9fXfnS0yQgpN3wGpjxYQtCrTfRlWTzAB28yT29S6tegT1lBLC25Whq7ebNnF
	 EiOpkL6BbNPJSJVNAFotinI6f2eFPtsHA8kE7uFX2zaGNYLZ491fDEItoun4jGF0nsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793925590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=WL8nwJ/wMqsPR/6qL4tukpzx0z/mXpqqzRzogjQyULk=;
	b=17kD3zic68tDr5gON2476iZfzZ2zbybIWRke+spoRgaLXH+V9477we90CoLnEvYTRoha
	 Ew4N6bfX3zPHJSqbUDkYidhTmYm5awuHYIKrhQv532hidgdcga9QzlvUvuJ2rkcLxEmvB
	 SNn9ABPTAFAP7kdbUKGL8JUVuL87Q/igui9eEmUUSoHf/Hq6g1P2604ht6mXEvPHaF6hJ
	 olBFpj6SEKSjdSQWsNhP3wgFPrgvVZ2/BpT+vUcR3XvAheaeO7qh5EJsZpFHN61lwgonu
	 +IDLJoo2OfehAeOVzToME7nMyV2b+GpyGmIURB0MpQdlMlrh05oWTBqZU40EtTRXRgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="SM/lD++c";
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D14B606A328
	for <dmaengine@vger.kernel.org>; Fri,  6 Nov 2026 00:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D14B606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SM/lD++c
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc7d154ec4fso45520a12.0
        for <dmaengine@vger.kernel.org>; Thu, 05 Nov 2026 16:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793925589; x=1794530389; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WL8nwJ/wMqsPR/6qL4tukpzx0z/mXpqqzRzogjQyULk=;
        b=SM/lD++c6lirjLOLHvGOARsCbeXJx0kzVB7LOKmQZ+hXKpnJD7Le8+indVem8SmHIG
         xgiOgoZK5SSqk/+gCMRsSn7DQi8mj8YyKqldXps1yVFfqcY0+wLxEIJ1k1LvGROg0nYa
         ZiVAGyd8D2qvJ7A+vQpMmcP9Bh7sn9b8PebgkeG4+mKNUu4qSZ6gWDZ0ElTjC/CwI48+
         pVV0toREk/pTX16I520nKhw2Ds2Vwdap5BTYCVKvFg2e0kMqMuDqGTMH35OJkX4IAAZH
         bXmYSoB1BU3fmVnIgxP4Ym1DUf1D3au1/+ZNHFgSm5kPPfAPDHu2arg9fr+RdECeJ06P
         DfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793925589; x=1794530389;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WL8nwJ/wMqsPR/6qL4tukpzx0z/mXpqqzRzogjQyULk=;
        b=YQhRL8U4rWzgI/m5m/sNbo5p6kkq1bcDHe50VBZNzmXzE57ZWi7+3XwE5ZqPazt172
         ZYo36KeY09CZffkojoPTPLUumlP8uNVsSo3X2irmz4Lrs5jeRxJRWIbZbamYia+6j36X
         rtjeJkRjKPgCQWZilj5ZrKQ2yGcvMQz8uqK1KPiNYbEbvK3qhXXCpH9ksiB8Ua6nL+U2
         iOlmHyjDnLgfknVI3T2MM4elfPexcQbnFbFQFCAG4eJFui92WyNrMJfwDqPoMBHBs9cB
         Mwigjtvdl4UPnoEfI4TSwNqlDueRGDFZfJPuMZzS084/XH/N9F4o4YwlApaOs5uSxt1L
         m1gQ==
X-Forwarded-Encrypted: i=1; AKwUvBwi32NuFFvTyUiVKuQL8RDpjWAstt78xS+a/3VhLGQxnV3BGucPZGmPz5uWjZ+2ZH6QhfxhZdrrVzM=@vger.kernel.org
X-Gm-Message-State: APuU4Z92ZZ+ZG4TnjtKY63nDV3/DHqNAYvOhziQvLQWa7im1kfphdg4r
	2rZyFl+eBaLDIDW7g8CyhK4AKeBiB/5TNC6fllTwHWEVbZapdGtoONPo
X-Gm-Gg: AYBFou2sR5uRLN3Oe7J4LsESVijSglMG96CfIEXbwT0Z8MKWzoHKtNoPYkkFZidVkrO
	GKyh3T40nJ/ZaVcZeJuAsgHtbA5j0fbLCUuNYQZT9C7Th97pC5dnE8F93Uv24QWHmM/ybNJUitP
	9UQezC78hnGYn/7c0et30K2Fb7Xf0Olrz0TnIAM8oVT40kCv5Tp0QQAf5oSqoPqNeC8P1bar7MP
	LGXX9C8i7nn49LeID05cwRFqYlIwP8pts/fSwh+yUsxltylgDqgL46nLgnGv3Fy3IxD0XfePc3+
	797iTJtdHSW7yFZNsSO7cYLno0QiVCB6FbElJiZvHJ4QRdINf/oS/nscGeaYY6VmNt/p/TcFXmM
	/fIlpTy1+jhY8x5/4LNELQMzSbg7U3O3W1LRLA6pxqvuNvj10qi+XDX8WrFH06juevN1lhxyeLT
	iOy+RND+NFsT9z/H2qutMAb8zDPcLi6BpzRGVmQkXk2DoAQVK7inN6SsqZH4Hj1oMY8p0n2K/GX
	N1eJAckeRt4UdQUgocjgNoXbzPKnY4bWvQyqcgfvAxkQWSimChe9Q7yabu0OEgp3LM/pB4XUHDX
	viC6zyObevBGfoVrCcLX6p3uLlgMQl44h8mrpwpNcZvrC79U5TZKv5N46ULSTb8GiaJ7rGALKW+
	1JJI=
X-Received: by 2002:a17:90b:3890:b0:39d:84af:a0b3 with SMTP id 98e67ed59e1d1-3b0db6bba9cmr784048a91.18.1793925589389;
        Thu, 05 Nov 2026 16:39:49 -0800 (PST)
Received: from [172.19.1.51] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0993fb8a8sm5197377a91.4.2026.11.05.16.39.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 16:39:48 -0800 (PST)
Message-ID: <4d739128-248f-4b35-8e0c-6f6b8fbebc3b@gmail.com>
Date: Fri, 6 Nov 2026 08:39:35 +0800
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
Subject: Re: [PATCH 2/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
From: Shan-Chun Hung <shanchun1218@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, vkoul@kernel.org,
 Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, kees@kernel.org, gustavoars@kernel.org,
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20261103022202.2139674-1-shanchun1218@gmail.com>
 <20261103022202.2139674-3-shanchun1218@gmail.com>
 <20261104-airborne-vivid-caterpillar-991425@quoll>
 <de0bcd11-edfe-471b-a22d-f1e748a7fda6@gmail.com>
Content-Language: en-US
In-Reply-To: <de0bcd11-edfe-471b-a22d-f1e748a7fda6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

Sorry, I missed this comment.


On 11/5/2026 12:11 PM, Shan-Chun Hung wrote:
> Hi Krzysztof,
> 
> Thanks for your review.
> 
> On 11/4/2026 10:06 PM, Krzysztof Kozlowski wrote:
>> On Tue, Nov 03, 2026 at 10:22:02AM +0800, Shan-Chun Hung wrote:
>>> +#include <linux/align.h>
>>> +#include <linux/bitfield.h>
>>> +#include <linux/bits.h>
>>> +#include <linux/clk.h>
>>> +#include <linux/compiler_types.h>
>>> +#include <linux/container_of.h>
>>> +#include <linux/dev_printk.h>
>>> +#include <linux/device.h>
>>> +#include <linux/dma-direction.h>
>>> +#include <linux/dma-mapping.h>
>>> +#include <linux/dma/ma35d1-pdma.h>
>>> +#include <linux/dmaengine.h>
>>> +#include <linux/err.h>
>>> +#include <linux/errno.h>
>>> +#include <linux/gfp_types.h>
>>> +#include <linux/interrupt.h>
>>> +#include <linux/io.h>
>>> +#include <linux/irqreturn.h>
>>> +#include <linux/limits.h>
>>> +#include <linux/list.h>
>>> +#include <linux/math.h>
>>> +#include <linux/minmax.h>
>>> +#include <linux/mod_devicetable.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_dma.h>
>>> +#include <linux/overflow.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/scatterlist.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/spinlock.h>
>>> +#include <linux/spinlock_types.h>
>>> +#include <linux/stddef.h>
>>> +#include <linux/string.h>
>>> +#include <linux/types.h>
>>
>> Do you use all these defines?
I'll double-check the defines.>>
>> I don't see usage of header with bindings, though.
The bindings header is indeed unused and will be removed in the next 
revision.
>>
>>> +
>>> +#include "dmaengine.h"
>>> +#include "virt-dma.h"
>>> +
>>
>> ...
>>
>>> +static int ma35d1_pdma_probe(struct platform_device *pdev)
>>> +{
>>> +    int i, irq, nr_chans, ret;
>>> +    struct clk *pdma_clk;
>>> +    struct device *dev = &pdev->dev;
>>> +    struct device_node *node = dev->of_node;
>>> +    struct ma35d1_chan *ch;
>>> +    struct ma35d1_pdmadev *pdmadev;
>>> +    void __iomem *reg_base;
>>> +
>>> +    pdma_clk = devm_clk_get_enabled(dev, NULL);
>>> +    if (IS_ERR(pdma_clk))
>>> +        return dev_err_probe(dev, PTR_ERR(pdma_clk), "Failed to get 
>>> clk\n");
>>> +
>>> +    ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    irq = platform_get_irq(pdev, 0);
>>> +    if (irq < 0)
>>> +        return irq;
>>> +
>>> +    ret = of_property_read_u32(node, "dma-channels", &nr_chans);
>>> +    if (ret)
>>> +        return dev_err_probe(dev, ret, "Failed to get dma-channels\n");
>>> +
>>> +    if (nr_chans > PDMA_MAX_CHANS) {
>>> +        dev_warn(dev, "dma-channels %d exceeds max %d, clamping\n",
>>> +             nr_chans, PDMA_MAX_CHANS);
>>> +        nr_chans = PDMA_MAX_CHANS;
>>> +    }
>>> +
>>> +    pdmadev = devm_kzalloc(dev, struct_size(pdmadev, channels, 
>>> nr_chans), GFP_KERNEL);
>>> +    if (!pdmadev)
>>> +        return -ENOMEM;
>>> +
>>> +    pdmadev->nr_chans = nr_chans;
>>> +
>>> +    reg_base = devm_platform_ioremap_resource(pdev, 0);
>>> +    if (IS_ERR(reg_base))
>>> +        return dev_err_probe(dev, PTR_ERR(reg_base),
>>> +                     "Failed to map pdma global registers\n");
>>> +
>>> +    dma_cap_zero(pdmadev->ddev.cap_mask);
>>> +    dma_cap_set(DMA_SLAVE, pdmadev->ddev.cap_mask);
>>> +    dma_cap_set(DMA_PRIVATE, pdmadev->ddev.cap_mask);
>>> +    dma_cap_set(DMA_MEMCPY, pdmadev->ddev.cap_mask);
>>> +    dma_cap_set(DMA_CYCLIC, pdmadev->ddev.cap_mask);
>>> +
>>> +    pdmadev->ddev.dev = dev;
>>> +    pdmadev->ddev.src_addr_widths = PDMA_SLAVE_BUSWIDTHS;
>>> +    pdmadev->ddev.dst_addr_widths = PDMA_SLAVE_BUSWIDTHS;
>>> +    pdmadev->ddev.directions = BIT(DMA_MEM_TO_DEV) | 
>>> BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_MEM);
>>> +    pdmadev->ddev.device_prep_dma_memcpy = ma35d1_prep_dma_memcpy;
>>> +    pdmadev->ddev.device_prep_slave_sg = ma35d1_prep_slave_sg;
>>> +    pdmadev->ddev.device_prep_dma_cyclic = ma35d1_prep_dma_cyclic;
>>> +    pdmadev->ddev.device_free_chan_resources = 
>>> ma35d1_free_chan_resources;
>>> +    pdmadev->ddev.device_issue_pending = ma35d1_issue_pending;
>>> +    pdmadev->ddev.device_tx_status = ma35d1_tx_status;
>>> +    pdmadev->ddev.device_config = ma35d1_slave_config;
>>> +    pdmadev->ddev.device_terminate_all = ma35d1_terminate_all;
>>> +    pdmadev->ddev.device_synchronize = ma35d1_synchronize;
>>> +
>>> +    spin_lock_init(&pdmadev->lock);
>>> +    INIT_LIST_HEAD(&pdmadev->ddev.channels);
>>> +    for (i = 0; i < nr_chans; i++) {
>>> +        ch = &pdmadev->channels[i];
>>> +        ch->dev = dev;
>>> +        ch->pdmadev = pdmadev;
>>> +        ch->id = i;
>>> +        ch->base = reg_base;
>>> +        ch->vc.desc_free = ma35d1_pdma_desc_free;
>>> +        vchan_init(&ch->vc, &pdmadev->ddev);
>>> +    }
>>> +
>>> +    ret = devm_request_irq(dev, irq, ma35d1_pdma_interrupt, 0, pdev- 
>>> >name, pdmadev);
>>> +    if (ret)
>>> +        return dev_err_probe(dev, ret, "Failed to request IRQ\n");
>>> +
>>> +    ret = dmaenginem_async_device_register(&pdmadev->ddev);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    ret = of_dma_controller_register(node, ma35d1_of_xlate, pdmadev);
>>> +    if (ret)
>>> +        return dev_err_probe(dev, ret, "of_dma_controller_register 
>>> failed\n");
>>> +
>>> +    platform_set_drvdata(pdev, pdmadev);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void ma35d1_pdma_remove(struct platform_device *pdev)
>>> +{
>>> +    struct ma35d1_pdmadev *pdmadev = platform_get_drvdata(pdev);
>>> +    int i;
>>> +
>>> +    of_dma_controller_free(pdev->dev.of_node);
>>> +    writel(0, pdmadev->channels[0].base + PDMA_INTEN);
>>> +
>>> +    for (i = 0; i < pdmadev->nr_chans; i++)
>>> +        tasklet_kill(&pdmadev->channels[i].vc.task);
>>> +}
>>> +
>>> +static const struct of_device_id ma35d1_pdma_match[] = {
>>> +    { .compatible = "nuvoton,ma35d1-pdma" },
>>> +    { /* sentinel */ }
>>> +};
>>> +MODULE_DEVICE_TABLE(of, ma35d1_pdma_match);
>>> +
>>> +static struct platform_driver ma35d1_pdma_driver = {
>>> +    .probe = ma35d1_pdma_probe,
>>> +    .remove = ma35d1_pdma_remove,
>>> +    .driver = {
>>> +        .name = "ma35d1-pdma",
>>> +        .of_match_table = ma35d1_pdma_match,
>>> +    },
>>> +};
>>> +module_platform_driver(ma35d1_pdma_driver);
>>> +
>>> +MODULE_DESCRIPTION("PDMA controller driver for Nuvoton MA35D1");
>>> +MODULE_AUTHOR("Shan-Chun Hung <shanchun1218@gmail.com>");
>>> +MODULE_LICENSE("GPL");
>>> diff --git a/include/linux/dma/ma35d1-pdma.h b/include/linux/dma/ 
>>> ma35d1-pdma.h
>>> new file mode 100644
>>> index 000000000000..13f1410d74da
>>> --- /dev/null
>>> +++ b/include/linux/dma/ma35d1-pdma.h
>>> @@ -0,0 +1,24 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +/*
>>> + * Header file for the MA35D1 PDMA Controller driver
>>> + *
>>> + * Copyright (C) 2026 Nuvoton Technology Corp.
>>> + */
>>> +#ifndef _MA35D1_PDMA_H
>>> +#define _MA35D1_PDMA_H
>>> +
>>> +/**
>>> + * struct ma35d1_peripheral - PDMA peripheral configuration
>>> + * @prescaler: timeout prescaler value
>>> + * @counter: timeout counter value
>>> + *
>>> + * Slave device drivers fill in this structure and pass it via
>>> + * dma_slave_config.peripheral_config/peripheral_size to configure
>>> + * the MA35D1 PDMA engine's per-channel timeout detection block.
>>
>> Hm? Confusing, how is it supposed to be used? Do you just reimplement
>> board files?
> 
> Sorry, the comment did not clearly explain the intended usage.
> 
> For UART RX DMA, the UART driver calculates the PDMA timeout prescaler 
> and counter values based on the current baud rate, then passes them 
> through dma_slave_config.peripheral_config to configure the channel's 
> timeout detection. These are runtime settings.
> 
> However, I understand that passing raw prescaler and counter values 
> couples the UART driver to the MA35D1 PDMA register layout. I will 
> consider having the UART driver specify the required timeout duration 
> and letting the PDMA driver convert it into the hardware settings.
> 
> In the next revision, I will remove this timeout configuration interface 
> and revisit it together with the UART DMA support patches, so the 
> intended usage and client implementation can be reviewed together.
>>
>>> + */
>>> +struct ma35d1_peripheral {
>>> +    unsigned int prescaler;
>>> +    unsigned int counter;
>>> +};
>>> +
>>> +#endif /* _MA35D1_PDMA_H */
>>> -- 
>>> 2.25.1
>>>
> 
> Best Regards,
> Shan-Chun

Best Regards,
Shan-Chun

