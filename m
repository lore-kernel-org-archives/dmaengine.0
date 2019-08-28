Return-Path: <SRS0=2FgE=WY=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D9C0C3A5A1
	for <dmaengine@archiver.kernel.org>; Wed, 28 Aug 2019 09:38:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1FA7720828
	for <dmaengine@archiver.kernel.org>; Wed, 28 Aug 2019 09:38:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="L+FLZ16U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbfH1Jig (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 28 Aug 2019 05:38:36 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44452 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbfH1Jig (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Wed, 28 Aug 2019 05:38:36 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7S9cQeI020608;
        Wed, 28 Aug 2019 04:38:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566985106;
        bh=yp8N2N5EP3yYlCK65D66DkEGfXW2eOtkjqrbcnFjoMs=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=L+FLZ16UR4FRflRPQoY9zZHDvbHrXqCTagQ+hvdtuaHzu8VwLigyugkolqG6GWpaj
         hD/QRPkTI66krSkT4vExFCwBzSk3WfUQj83sfWX2n3ALEEPW/gxyttAZa9HU0BOn34
         C7c7aOloMK1M/Kfz0dvqyUKxj0KSHFFDd4QkQp64=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7S9cQnA085208
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 28 Aug 2019 04:38:26 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 28
 Aug 2019 04:38:25 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 28 Aug 2019 04:38:25 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7S9cNJk071564;
        Wed, 28 Aug 2019 04:38:24 -0500
Subject: Re: [PATCH] dt-bindings: dmaengine: dma-common: Revise the
 dma-channel-mask property
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
CC:     "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <1566974375-32482-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <eb823985-5cf6-0d83-8613-1baeeaf7d9c8@ti.com>
 <TYAPR01MB454400436713332F1075D424D8A30@TYAPR01MB4544.jpnprd01.prod.outlook.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <3b06567c-8cfe-bfec-3973-c3e7cf71a18b@ti.com>
Date:   Wed, 28 Aug 2019 12:38:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <TYAPR01MB454400436713332F1075D424D8A30@TYAPR01MB4544.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Hi Shimoda-san,

On 28/08/2019 11.55, Yoshihiro Shimoda wrote:
> Hi Peter,
> 
>> From: Peter Ujfalusi, Sent: Wednesday, August 28, 2019 4:25 PM
>>
>> On 28/08/2019 9.39, Yoshihiro Shimoda wrote:
>>> The commit b37e3534ac42 ("dt-bindings: dmaengine: Add YAML schemas
>>> for the generic DMA bindings") changed the property from
>>> dma-channel-mask to dma-channel-masks. So, this patch revises it.
>>>
>>> Fixes: b37e3534ac42 ("dt-bindings: dmaengine: Add YAML schemas for the generic DMA bindings")
>>> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>>> ---
>>>  Documentation/devicetree/bindings/dma/dma-common.yaml | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/dma/dma-common.yaml
>> b/Documentation/devicetree/bindings/dma/dma-common.yaml
>>> index 0141af0..ed0a49a 100644
>>> --- a/Documentation/devicetree/bindings/dma/dma-common.yaml
>>> +++ b/Documentation/devicetree/bindings/dma/dma-common.yaml
>>> @@ -24,7 +24,7 @@ properties:
>>>      description:
>>>        Used to provide DMA controller specific information.
>>>
>>> -  dma-channel-masks:
>>> +  dma-channel-mask:
>>>      $ref: /schemas/types.yaml#definitions/uint32
>>
>> How this mask supposed to be used for controllers having more than 32
>> channels (64, 300+)?
> 
> I found "dma-channels" property as 40 in arch/arm/boot/dts/ste-u300.dts.
> However, since arch/arm64/boot/dts/hisilicon/hi3660.dtsi already has
> the dma-channel-mask property, I think we should not change the property name.

I'm not asking it to be changed, I just wondered how I could use this
generic property for DMA controllers having more channels than u32
bitfield could describe. An array of multiple u32 to cover the number of
channels would probably something which can be done, but it would need
update for the documentation to make sure that it is used consistently.

I'm asking this because of: https://patchwork.kernel.org/patch/11111619/

> 
> Best regards,
> Yoshihiro Shimoda
> 
>>>      description:
>>>        Bitmask of available DMA channels in ascending order that are
>>>
>>
>> - Péter
>>
>> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
>> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
