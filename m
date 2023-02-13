Return-Path: <dmaengine-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70AD8C636D7
	for <dmaengine@archiver.kernel.org>; Mon, 13 Feb 2023 10:09:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbjBMKJQ (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 13 Feb 2023 05:09:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbjBMKJP (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Mon, 13 Feb 2023 05:09:15 -0500
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABF8017145;
        Mon, 13 Feb 2023 02:08:50 -0800 (PST)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
        by ex01.ufhost.com (Postfix) with ESMTP id 7853124E238;
        Mon, 13 Feb 2023 18:08:42 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 13 Feb
 2023 18:08:42 +0800
Received: from [192.168.125.74] (183.27.97.168) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 13 Feb
 2023 18:08:41 +0800
Message-ID: <9f8c3242-762c-96a3-ad5b-e71e2321e7bf@starfivetech.com>
Date:   Mon, 13 Feb 2023 18:08:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v1 1/3] dt-bindings: dma: snps,dw-axi-dmac: Update resets
 and add snps,num-hs-if
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
CC:     <linux-riscv@lists.infradead.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Vinod Koul <vkoul@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        <linux-kernel@vger.kernel.org>
References: <20230206113811.23133-1-walker.chen@starfivetech.com>
 <20230206113811.23133-2-walker.chen@starfivetech.com>
 <20230207205800.GA4140140-robh@kernel.org>
From:   Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <20230207205800.GA4140140-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [183.27.97.168]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On 2023/2/8 4:58, Rob Herring wrote:
> On Mon, Feb 06, 2023 at 07:38:09PM +0800, Walker Chen wrote:
>> Add two reset items and properties 'snps,num-hs-if'.
>> The DMA controller needs to be reset before being used in JH7110 SoC.
>> Another difference from the original version is that the hardware
>> handshake number of DMA can be up to 56 while the number in original
>> version is less than 16, and different registers are selected according
>> to this.
>> 
>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
>> ---
>>  .../bindings/dma/snps,dw-axi-dmac.yaml          | 17 ++++++++++++++++-
>>  1 file changed, 16 insertions(+), 1 deletion(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>> index 67aa7bb6d36a..1a8d8c20e254 100644
>> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>> @@ -9,6 +9,7 @@ title: Synopsys DesignWare AXI DMA Controller
>>  maintainers:
>>    - Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
>>    - Jee Heng Sia <jee.heng.sia@intel.com>
>> +  - Walker Chen <walker.chen@starfivetech.com>
>>  
>>  description:
>>    Synopsys DesignWare AXI DMA Controller DT Binding
>> @@ -21,6 +22,7 @@ properties:
>>      enum:
>>        - snps,axi-dma-1.01a
>>        - intel,kmb-axi-dma
>> +      - starfive,axi-dma
> 
> This should be SoC specific.

Well, so this should be 'starfive,jh7110-axi-dma'.

> 
>>  
>>    reg:
>>      minItems: 1
>> @@ -59,7 +61,12 @@ properties:
>>      maximum: 8
>>  
>>    resets:
>> -    maxItems: 1
>> +    maxItems: 2
>> +
>> +  reset-names:
>> +    items:
>> +      - const: axi-rst
>> +      - const: ahb-rst
> 
> '-rst' is redundant.

Okay, will be drop '-rst' in next version.

> 
>>  
>>    snps,dma-masters:
>>      description: |
>> @@ -74,6 +81,14 @@ properties:
>>      $ref: /schemas/types.yaml#/definitions/uint32
>>      enum: [0, 1, 2, 3, 4, 5, 6]
>>  
>> +  snps,num-hs-if:
>> +    description: |
>> +      The number of hardware handshake. If it is more than 16,
>> +      CHx_CFG2 is used to configure the DMA transfer instead of CHx_CFG.
> 
> Can't you infer this from the compatible string?

Yeah, maybe this is also feasible from the compatible string.
Thanks.

Best regards,
Walker
