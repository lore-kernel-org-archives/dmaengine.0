Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795815146;
	b=zBak+1Oya43KUTH+YnR5aWyWL7e2V6hp/MwPf8waRF5NGffUDK18pJrTdBsq7Dzslnzy
	 SmVdp/CNKik7tSukin2F7mzbQy+0do0etvHlzZ7LvluDrgOFw5/2yH8hwReibjhdmR5cw
	 uoz99+bC7O5rH9D0+c2wbW1Yv+k/O3rea3P+5PoqtHIFDoujRIyEZTcK3G8cA6oawfIdS
	 R/2yxovwjxTWt/ZZhCFPT5oNYbi94UcgvEuPeIyNlMgIIKCbVcgY/dLDfXY9jotGJKmtM
	 4/dn9DiOhBGM3BWeXXIDaEilw6CraRj1j9uLXfCyKvBPfrLZIhPF7O/XP9/PbnOi2xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795815146;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=BcWNEbop8X9pAgA1aqt8kxzcuLnmPOjWaLM+6XmIGRU=;
	b=zX1qFXM327q35gYtTot62SzdSvFt1CzbjGVKfGW/sJVBht6GZwwouwVD6vYIkMMpvllP
	 nrJe/5f/+Gpm1tuvjikMTgCzvvRRlkRF5kEj39JUqXcOykmayLBoSu4UYTsK/rlAzbJcx
	 4maoVD7SLegSe0IqgMZll1Pe2jBK5xCa+4NfR+xOgwXd6ePueMfxVLMc9FwlD7CBBKAJ8
	 q5yzspi5XJfLP6ILV1QUARatffl6eI8hVGtHGJeBH3T8lrDbmHS0V40ithoiS4wouiHgE
	 3xdHPZ8jg8kcm0ujC18lwvkL+HGwRU+4EcvykegGkT5Rbm+9PiqTxNxLrkGb1bkmr9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.net;
	spf=pass smtp.mailfrom=gmx.net;
	dkim=pass header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=PScG9Bhp;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF614606A31C
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 21:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF614606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=PScG9Bhp
DKIM2-Signature:  i=1; m=1; t=1795815143;
 mf=PHdhaHJlbnN0QGdteC5uZXQ+;
 rt=PGRtYWVuZ2luZUB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.net;
 s=s31663417:rsa-sha256:IlSbkZUUtC0MYyM7ayD0IxZ/Na89
   d+j/dV2Pyqtwcr+1SW7U+kw9SJ65vw7L7V9nxXXCp9LSqSMZlbA11f/mcmSCxoUxHVookRS7j+H
   vol4HWB6CmVHtqkxvdsazfpDO2KgSEd+/GPwadxncoXXLT3khJvvazXb7xKQ7innjPakwigLq4k
   +RQccsx/+0T7WKO7kaznWMkVQ1b3FH5pUlfhVKTuTvJGUWswzn5efEDB92LE5PD8Lk+/bK3f09r
   gZ8YpenirxDyT8ufqNpWjRjMbnJcuzDahCyOnWKf6V3SE7Rblxgsu5ExJitJf1+I7FERzpBuU6p
   8JR9DL98oKIVnw==;
Message-Instance:  m=1;
 h=sha256:
   h1sOHa0ku1ngysJ7Y3fij0bajjdO16KY0cg/J6k04+s=:
   Hs5loM0Yg8o37fCg11XNmI4DGNwRcSOQ5wVKMM4Nz1k=,
  sha512:
   CgEd2KNfNkP7zpgohjevnCuLfaQmuBragH9LW9PAJSKlug2F9OwVGW/ybccaUVGM213mES3EgzVi6K2gDMOnjg==:
   +suc8X9bSIDlngfNJ7+zmR6KRiMI4wIyJe8bAAtvpI2XGQjClO6YbucA4Uo7v0XR5W3sR6rD9GTBqVZNEEXvEw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1795815109; x=1796419909; i=wahrenst@gmx.net;
	bh=BcWNEbop8X9pAgA1aqt8kxzcuLnmPOjWaLM+6XmIGRU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=PScG9Bhpf+ldOrFY1J55IZvlZrKMxba9jMu7ZCRHDfMeKTmJ5qyoM2qMoHWKnUZz
	 ySPTr0WJy4HIVSjJJQHW4EA35E6VaFpen3WlDrE47ANcU/8DxSvtdkHtGDw8Cp8vw
	 jX6PtLPe0HRR40ImKpa5RUnthmRnP+cZnzJ6tGMpg11cbl4/YF2D24vaohH5z/2kB
	 SfqpaqdAFfXrnH/N/M6tb9rskWAl2Mso1jCLkgHp4nxYkAQJSBA7MGHf7STFtCMOO
	 1NGF2XbIDvQkrRNHwSAyXFkRLJ8RLh6g1RPNCCqTNBORTza7cpjHgQsYPQqW2n2pS
	 7WTC0j5xg1EVliqjBw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MHG8m-1xkChx0xY8-00BhCH; Fri, 27
 Nov 2026 22:31:49 +0100
Message-ID: <95404e33-369c-4cf3-b9ad-75d6ea8dff18@gmx.net>
Date: Fri, 27 Nov 2026 22:31:47 +0100
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
Subject: Re: [PATCH v3 06/28] dt-bindings: dma: brcm,bcm2835-dma: Document
 dma-channel-mask and DREQ flags
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 dmaengine@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Saenz Julienne <nsaenz@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Dom Cobley <popcornmix@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-7-andrea.porta@suse.com>
 <e2d27b2e-db69-4fac-b7f3-28961a9e094c@gmx.net> <awhL0itLEAIsK4HR@apocalypse>
 <ba983cd0-68d7-4184-ab75-d79f2666520c@gmx.net> <awnSy5BOabcnj73I@apocalypse>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <awnSy5BOabcnj73I@apocalypse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:z/t3xRPcPSrfrNYakv8qwSeOOECkHRheAD7HRNpMxBsNMdKfIFa
 dJlemLEgMjsjzvtXeuf75FxtHe7Zr9nSe7ND9vGGwuNDinJcqX03OZAAo+9JXOGgnsszhhN
 Wz5fbhrfDHk4e0cOmZhOSr1L5KlEcXWJfLLYW/hUnv9hblo1TFcI6wCAgRg3TyOMvsUqXQ7
 7zlS2V79hzOAdXU/M4ptA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2lQSWTbWgdk=;p5JiDylrwJu0Fb4jd2hQ5W7bFGw
 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

Hi Andrea,

Am 27.11.26 um 19:58 schrieb Andrea della Porta:
> Hi Stefan,
>
> On 19:23 Fri 27 Nov     , Stefan Wahren wrote:
>> Hi Andrea,
>>
>> Am 26.11.26 um 16:10 schrieb Andrea della Porta:
>>> Hi Stefan,
>>>
>>> On 18:49 Mon 23 Nov     , Stefan Wahren wrote:
>>>> Hi Andrea,
>>>>
>>>> Am 23.11.26 um 15:56 schrieb Andrea della Porta:
>>>>> The available channels are currently described by the vendor specific
>>>>> brcm,dma-channel-mask property, while the generic dma-channel-mask
>>>>> property from dma-common.yaml carries exactly the same information.
>>>>> Allow the generic property and mark the vendor one as deprecated,
>>>>> requiring at least one of them, so that device trees can provide both
>>>>> for compatibility with older kernels.
>>>>>
>>>>> The single specifier cell is also not limited to the DREQ number: the
>>>>> driver interprets some of the upper bits as per-channel flags (AXI
>>>>> priorities, wide accesses, burst and write-response handling). Document
>>>>> the meaning of those bits.
>>>>>
>>>>> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
>>>> this patch should before the bcm2835-dma patches which modify the dma-cell
>>>> behavior.
>>> Ack.
>>>
>>>>> ---
>>>>>     .../bindings/dma/brcm,bcm2835-dma.yaml        | 26 ++++++++++++++++---
>>>>>     1 file changed, 23 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
>>>>> index c9b9a5490826..f619e395cf0d 100644
>>>>> --- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
>>>>> +++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
>>>>> @@ -37,15 +37,30 @@ properties:
>>>>>         maxItems: 16
>>>>>       '#dma-cells':
>>>>> -    description: The single cell represents the DREQ number.
>>>>> +    description: |
>>>>> +      The single cell contains the DREQ number in bits 0-4, optionally
>>>>> +      combined with the following per-channel flags:
>>>>> +        bits 16-19: AXI priority
>>>>> +        bits 20-23: AXI panic priority
>>>>> +        bit 24: use wide (128-bit) source reads
>>>>> +        bit 25: use wide (128-bit) destination writes
>>>>> +        bit 27: do not wait for AXI write responses
>>>>> +        bit 28: wait for outstanding writes before signalling completion
>>>>> +        bit 29: do not pause the channel when the debug signal is asserted
>>>>> +        bit 30: use multi-beat bursts
>>>> No strong opinion, but mixing DREQ number with per-channel flags is ugly
>>> I agree it isn't pretty, but it is the encoding the downstream DTBs have been
>>> using for years. Switching to #dma-cells = <2> (or introducing new exotic properties)
>>> would mean supporting both formats in the driver: I'm trying to play nice here in
>>> order to not break compatibility with downstream DTBs, which I think should be wise.
>>> The header I'll add in v4 with the definitions for these flags at least makes the
>>> device trees readable.
>> as I said I don't have strong opinion about this.
>>
>> Imho adding these configuration bits to the DREQ number was a downstream
>> hack. Furthermore providing some kind of compatibility with downstream was
>> never intended and cannot be guaranteed.
> Fine then, let's move those flags to teh second dma cell.
since I'm not a maintainer, maybe we should wait for at least one of them.

Best regards
>
> Thanks,
> Andrea
>
>> Best regards
>>>>>         const: 1
>>>>> +  dma-channel-mask:
>>>>> +    maxItems: 1
>>>>> +
>>>> I think, the dma-channel-mask stuff should be a separate change.
>>> Ack.
>>>
>>> Regards,
>>> Andrea
>>>
>>>> Best regards
>>>>>       brcm,dma-channel-mask:
>>>>>         $ref: /schemas/types.yaml#/definitions/uint32
>>>>> +    deprecated: true
>>>>>         description:
>>>>>           Bitmask of available DMA channels in ascending order that are
>>>>>           not reserved by firmware and are available to the
>>>>>           kernel. i.e. first channel corresponds to LSB.
>>>>> +      Use the generic dma-channel-mask property instead.
>>>>>     unevaluatedProperties: false
>>>>> @@ -54,7 +69,12 @@ required:
>>>>>       - reg
>>>>>       - interrupts
>>>>>       - "#dma-cells"
>>>>> -  - brcm,dma-channel-mask
>>>>> +
>>>>> +anyOf:
>>>>> +  - required:
>>>>> +      - dma-channel-mask
>>>>> +  - required:
>>>>> +      - brcm,dma-channel-mask
>>>>>     examples:
>>>>>       - |
>>>>> @@ -96,7 +116,7 @@ examples:
>>>>>                             "dma14",
>>>>>                             "dma-shared-all";
>>>>>             #dma-cells = <1>;
>>>>> -        brcm,dma-channel-mask = <0x7f35>;
>>>>> +        dma-channel-mask = <0x7f35>;
>>>>>         };
>>>>>     ...

