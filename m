Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793651902;
	b=s7O7CBpR/YDVDYolb+vQ9yhwgQiT+Oara/xAsuqaR5MJrxLPzY9d/PHpP6MOjhalPHX6
	 qNVM4RVA8D02vzImjSpwYZMsjQ7A3e8v8fGY33atMhMQk2w8NmfBz6iKlOk+oJRZ8R+Y0
	 J2dfnMEj2l2bNGfntU/CH3o9ovji9gDP+96xaZXMnH87BEGpnw85ZZDunu2IBLRpU2ujh
	 /amSAKoG/7VwXMJzjDlego6hk2WU+SDNqRgsi2990oiZROhGT52pSahEx3GMyde7yq73p
	 2xfi7q8pBH/YUR7tzS/j+ScsmFFKbcpGOH8TGD4kWHy2lkAYS1ZinTDx8Swx2k5tBVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793651902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=JqOfHGfqq8y0jqDTq9u5axpAxahHuV8gA44EpfAxrF0=;
	b=Ep+3Zyk6u9wMWJRanVWj3yVX3SHupE/0dpVpH3dWOOIKKgMOVQT6Pcu88hVJVHkNTWvm
	 vKw1T7IgbQMYTYwsXMF2eLruG+4+/yfhe1niZox6EpcV6fON1y1+NfFIJOiQr5tuR6Kev
	 402/OjatWbzRxyOsmZSVa5fzAcNuOeXvVmfvsgmnu+JNmYgVhJnNS1GlWGAAPBHzQql9a
	 EcON6zgbRhnhWD0q6yx4yLq3rBCnw1KUDfHqg7+KilbFMszyfY9xaYE2DTquafKelykFR
	 iCFhGZFKmyEYdi0LPTsNKDABRt26Oc0jariwGhmQx/MjeaVNJf9RP8m1xLu6VP6wLxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RR0lW1VF;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877E8606A327
	for <dmaengine@vger.kernel.org>; Mon,  2 Nov 2026 20:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 877E8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RR0lW1VF
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91c162febb9so41371236d6.3
        for <dmaengine@vger.kernel.org>; Mon, 02 Nov 2026 12:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793651901; x=1794256701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JqOfHGfqq8y0jqDTq9u5axpAxahHuV8gA44EpfAxrF0=;
        b=RR0lW1VFKizrAZ287W1z5EGkksIw6Qk9fnOOVuPipp5gYg8D3KBYAQBS5R6sPJVLfa
         mk05b5NHBPOkX4xozdkvRe87h06j0eFQpgzL9HakSjRx5wirQ1OUegry5AIGBeoEPUCU
         QqJ511y3CgLuCw4oljTBoj2B1SI/+xBpKBJ2/imJH2RN01EwAmRhaEa0uj7e03J4ZFVR
         34FeNhTm6dgLfIZFYhsyRSgCLDs/PmMghZjDz+QBl3dL2gdbQkaxtPSpWrgW0X4Tmhar
         /Ejwnjxii8kgC/nO4JvSbqgUWn30yhJUmSJfhOcMfqt6pvP28OKSNI4ebkNyFzRgXih8
         W2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793651901; x=1794256701;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JqOfHGfqq8y0jqDTq9u5axpAxahHuV8gA44EpfAxrF0=;
        b=Q7s8Cq2d8e+Br0Cs/SduTTe8SL6XzJBGhLmrhK1zrMQwNTQh0GMJVtwaxHQRjQL/z7
         4ibpFNkI2r2QhbyG91wX8iVA60afUylmmZ02HXpaUohjKdKE/jAKE2w/nwB08YDyD6cE
         6EaVFgAESxNswr8zCfJbOOIlJUWLwPWki3psEF754MT9dVAeCdt6HLgMJsWe6TUh+QTM
         kkXcr51jWKbIgHSy9yABR/vp2b6G7uLF2auBWfGkD1vL+yH4vXaRaeqYgPfRYqrLCfvk
         mLAVYjrN1tUOgiN8XZrXA1535pfLBs819RuHqbpaqEUNHNTcMYOrsMHL/lfYuGkQiZjq
         PIHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzorTQj8nOLfuMa3xA3iQHsBFrHJTQ8sNCg4A6cXYat2wsc+qdv5VpYmYYj7GkHmlhKKORycR4aZdo=@vger.kernel.org
X-Gm-Message-State: APuU4Z855d0pAsq3w4RLfvhiBoHX5MtbfE+cg0YRh+BLhmkNpOMgmolh
	6V5MdqkbvFUQi50Ap4clhUJ4tBjArlHCNUIXmzisxjfVmQnSCfUpi3B9
X-Gm-Gg: AYBFou0lQiXtm5AcAKVuvPu1jPRf/Z+RgNvjZ31JPRRv0rcyQeZl+w0EOz4gdkwV3sh
	+iHuLw8IZMUo2uPxJVe0EzQUmW+o535SlSxr1k99a8SLidag48Bgl9GgcYxtdhnU84EDTohp6Fd
	mE36YXmSjW1NgS2f43Moh0FpD+fcAioWCAiqv/OksM5J4T5IK8iBOAwujdlqPxAL0gSiC887sNt
	4M/UolyIC1wJStSik/NJaRoK7UOLzgnraoLfrevmJmXQFUmvAmIdeN8XLB9hEzrSg9KK1mui2Zn
	AQCp7WN2yBkeZa7GCWj+EtHlYIXu0roMM/HVXUpvVxVTDLD4TS4u6GI31TfW9ePtl16xgLBFQYa
	6XRlFr6Xp/HheQ14kH/oeS7gqZW/aPT1inxTJ3MQY4SrS9V9zvsbqaRhqxomW3TYvtG8K165lwW
	OYuA/hjhlfYvIrRncsoChNhwXMP/3AGyp1s1IiJAMlabVGuN5/vjigrMjQnRBhodZwf53475tu+
	rMchE1H+j6VshLL2VZoFYRPkB+7WRf3LvRqJ/+5QGJDS59AlhH1RaAojFEYq2/3hdOrZPnHxvny
	kR7QwAkAnUn1jqsCNdim4v9MTrIp8WKs1DqKzcRUEkd+hYVZB7Fwdt0=
X-Received: by 2002:a05:6214:21e5:b0:91b:5d3a:f136 with SMTP id 6a1803df08f44-91ca4b8303emr172551426d6.53.1793651901295;
        Mon, 02 Nov 2026 12:38:21 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7f26f1esm100674086d6.13.2026.11.02.12.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 12:38:20 -0800 (PST)
Message-ID: <5bd67c8d-41ee-40e7-ab75-031e1520758f@gmail.com>
Date: Mon, 2 Nov 2026 12:38:15 -0800
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
Subject: Re: [PATCH 1/9] dt-bindings: dma: brcm,bcm2835-dma: Add BCM2711 and
 BCM2712
To: Peter Robinson <pbrobinson@gmail.com>, Conor Dooley <conor@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20261102090713.896324-1-pbrobinson@gmail.com>
 <20261102090713.896324-2-pbrobinson@gmail.com>
 <20261102-email-target-d3191584d234@spud>
 <CALeDE9Ncz=6jo_1VxdCJgSVV+fCTgkUvci-=e4MQYFYo_O9M0Q@mail.gmail.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <CALeDE9Ncz=6jo_1VxdCJgSVV+fCTgkUvci-=e4MQYFYo_O9M0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 12:18, Peter Robinson wrote:
> On Mon, 2 Nov 2026 at 19:39, Conor Dooley <conor@kernel.org> wrote:
>>
>> On Mon, Nov 02, 2026 at 09:06:51AM +0000, Peter Robinson wrote:
>>> Add compatibles for the BCM2711 40-bit DMA4 channels, which are
>>> described by a separate node covering channels 11-14, and for the
>>> BCM2712 DMA controllers. The register address of a node identifies its
>>> first channel, allowing a controller to be split across nodes.
>>>
>>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>>
>>> ---
>>>   .../bindings/dma/brcm,bcm2835-dma.yaml        | 31 +++++++++++++++++--
>>>   1 file changed, 29 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
>>> index c9b9a5490826c..31d97a10a0ea9 100644
>>> --- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
>>> +++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
>>> @@ -9,18 +9,27 @@ title: BCM2835 DMA controller
>>>   maintainers:
>>>     - Nicolas Saenz Julienne <nsaenz@kernel.org>
>>>
>>> -description:
>>> +description: |
>>>     The BCM2835 DMA controller has 16 channels in total. Only the lower
>>>     13 channels have an associated IRQ. Some arbitrary channels are used by the
>>>     VideoCore firmware (1,3,6,7 in the current firmware version). The channels
>>>     0, 2 and 3 have special functionality and should not be used by the driver.
>>>
>>> +  BCM2711 channels 11 to 14 are 40-bit capable DMA4 channels, described by a
>>> +  separate brcm,bcm2711-dma node. BCM2712 has 40-bit addressing on all
>>> +  channels, with channels 6 to 11 being DMA4 channels. A controller may be
>>> +  split across several nodes, the register address identifies the first
>>> +  channel of a node.
>>
>> Uh no, a device should not be split across different nodes. This should
>> not be needed, why can't your driver handle the upper channels having
>> different capabilities?
> 
> This is the way it's done in the downstream kernel, unfortunately
> Broadcom doesn't publish the HW details so either they'd need to
> contribute the support (which they've not done since the RPi4 was
> available) or I'm not sure what the other options would be. Open to
> suggestions.

Neither here nor there, IMHO, yes it would be nice if documentation was 
published (and a customer like Raspberry Pi is probably one of the few 
that can get the needle to move there).

You have the bcm2711 and bcm2712 compatible strings which should be 
enough for you to know which channels are 40-bit capable and which are 
not, yet keep the same Device Tree node.
-- 
Florian
