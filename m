Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795803811;
	b=wYIssr8mnq3hyxcq9vKUhcMeu2fDpq4NsTe6Mg2QpBaJlXw02/vpsWUuFPEdE9/q5iNX
	 r8fGLSjx6bpGO1DFl7hM6aQMiAQViSkBxNJt21M85ILpZkYmpxdT3amEyYHQHTeQezNRH
	 RuEH27d1v21LJaos8IkLxw9JhBHvlYPAeScV5cl/kpoaNH39K021/b0siEcWuGOa8UWtk
	 TDiIFsPaSasYxkfCTsrgdsMLpVHtV8+3HMxlLKwSN6gat+JTuNo1+1+xthYdFYaTp+jBp
	 EwfbEy7q0WRBDKfa7ThcyEQ1rTQ2GbUBBkSQaY2BxYHXZjNYD486OfZJ5pA3dQKKz3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795803811;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=hArpq5F1RrtbjxtVhzUqm1R09/J7RgGmXgT8lmi6N98=;
	b=xRuUFD5xWpIbHuhofJFLG2A5VAP5gtS6NfixG98Lh/6T7Zz/w9VuqOg1XMirBLpZ9FHF
	 27AfH4eT5IgWiTk6zIUgZBO0hSTP1tun8BF4CAwJPYnSfFhJNe5faf6JQ8OFugnPwbzg7
	 47woncEuDzzISXB6Db6WOlhQmrfMxIKqnEhJ/bKjvzHs9IK5rMT78QW56J8uT4VTmwitP
	 yitoqPoeW/IYX6Xj8vETdgWKmLcf6rH7GQdGfdxwUPOORDMBmlDa5UW4LPBfL4IJtkyfF
	 ECl9JkFMHzhivGy69DpyV3S5GUq/k7ZAtPzsjKyvsI8PzLkuQPG55o0qrMl/31cxbDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.net;
	spf=pass smtp.mailfrom=gmx.net;
	dkim=pass header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=f8QK39dF;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FAB606A31C
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 18:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73FAB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=f8QK39dF
DKIM2-Signature:  i=1; m=1; t=1795803808;
 mf=PHdhaHJlbnN0QGdteC5uZXQ+;
 rt=PGRtYWVuZ2luZUB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.net;
 s=s31663417:rsa-sha256:YKYbRjcL7uD4hCCETqRUbLQoT882
   iafMMTyV/FtUYJIHdv6dvVfBc7TE3ogLz0Fdih0UU9ka+Ys3eLnKynoDwtX4RBc6zNaStm5v82N
   gsnPEY0Syq7TSOUhk3m4RzBokcA+LpKDlHhDl8Y0kF7A5dHDyFzVp1bLbgYx7bxtxOJoNnQtwER
   sFppUmC1rcK/72TsNI1z2uT6bAJU/UYBuKZ1NG0lrZVaaTIXsDpLhbNK66i3MLMv+WzILCzJ12u
   60ihi+iYpX4yjMjPiZcwaurqRIsimLrEr7XEz9NSe6gBU6TwIqAgvIoKzKf3v7b1kxSKJbtXWVV
   GGzpImxm6PKN3Q==;
Message-Instance:  m=1;
 h=sha256:
   hqsrG8U1IuaLDSo2FpfHfTF8ezrGhj6vagyC1O2Lxgg=:
   zr+28yEMDt4q69EDpFZZciyhk8sR9kDG99wcrKUwMxc=,
  sha512:
   mQKMz/SlcitQ0JbDomF9GwSFwttgC0NrgUeQv+yoLnMeWrKAiToHKqhMTjziPt7ag3la/4xTryH9NH7oOhj51w==:
   FPgNoIk08gO8Fi3c7LMDoKIqB8X+zcAzW+cY+bADsy4tTFsTB9dNWzyYT/9hpMO4ddfnBGHpPIvaUYfnf5l5Aw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1795803804; x=1796408604; i=wahrenst@gmx.net;
	bh=hArpq5F1RrtbjxtVhzUqm1R09/J7RgGmXgT8lmi6N98=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=f8QK39dFP4yBVb4Ye3I0jCNksDkvuySOMo1X2UwcvjZiBmMEfsd7dgrwhDuWQhu0
	 VpF339fpYUNw2IoBuQ+px/PghZovQDx6lYNvrZKDpcbTe9v6+Ihg6qsMKAOOOnGFI
	 pm5xMWVGFkMU4ju2N9//967KmG3TnAqD2g/vsIy6WTBBhJDiCTPzIpW6rUnXiwgWB
	 zQrOqZr2aCCHIfL88Zouw04+pNR/otSsy6cV1ucadhoPC/j9TadDJZeY8j1+NppbQ
	 LLkAyJvldshCdghRF1WxOndmhWrv5q7+Ri052e0CsSeaoVkjxMZEnsHx+ScfhCnjw
	 eBrrwauI8Y5ef6l7oQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MqJmF-1yJapz0uWJ-00dj9Q; Fri, 27
 Nov 2026 19:23:24 +0100
Message-ID: <ba983cd0-68d7-4184-ab75-d79f2666520c@gmx.net>
Date: Fri, 27 Nov 2026 19:23:21 +0100
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
In-Reply-To: <awhL0itLEAIsK4HR@apocalypse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dM5uen2G3gnidMdAG1y5U8/cLJQ1c7jAH2YpRTEcmR85PcwD0Lx
 zrnSdQo6fRQ+GxljQ6rVi9kVxQGFj5aDgIx1KsKedyMQZzZDC2ZWljP42xezT1cbyIOxUaZ
 6p6dgycs+MVPhqEqD2ZunVefZlQTGS2hzp/PePWoGYn9LaVgPAhKl25tyY7zGcmm0ytoVSI
 /hMvGt3xEj2xmU3kzd7Qw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TPoGZQQyHnM=;SKnMZubq+PuFbB3XxjpLV9opWmd
 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

Hi Andrea,

Am 26.11.26 um 16:10 schrieb Andrea della Porta:
> Hi Stefan,
>
> On 18:49 Mon 23 Nov     , Stefan Wahren wrote:
>> Hi Andrea,
>>
>> Am 23.11.26 um 15:56 schrieb Andrea della Porta:
>>> The available channels are currently described by the vendor specific
>>> brcm,dma-channel-mask property, while the generic dma-channel-mask
>>> property from dma-common.yaml carries exactly the same information.
>>> Allow the generic property and mark the vendor one as deprecated,
>>> requiring at least one of them, so that device trees can provide both
>>> for compatibility with older kernels.
>>>
>>> The single specifier cell is also not limited to the DREQ number: the
>>> driver interprets some of the upper bits as per-channel flags (AXI
>>> priorities, wide accesses, burst and write-response handling). Documen=
t
>>> the meaning of those bits.
>>>
>>> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
>> this patch should before the bcm2835-dma patches which modify the dma-c=
ell
>> behavior.
> Ack.
>
>>> ---
>>>    .../bindings/dma/brcm,bcm2835-dma.yaml        | 26 ++++++++++++++++=
=2D--
>>>    1 file changed, 23 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.ya=
ml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
>>> index c9b9a5490826..f619e395cf0d 100644
>>> --- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
>>> +++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
>>> @@ -37,15 +37,30 @@ properties:
>>>        maxItems: 16
>>>      '#dma-cells':
>>> -    description: The single cell represents the DREQ number.
>>> +    description: |
>>> +      The single cell contains the DREQ number in bits 0-4, optionall=
y
>>> +      combined with the following per-channel flags:
>>> +        bits 16-19: AXI priority
>>> +        bits 20-23: AXI panic priority
>>> +        bit 24: use wide (128-bit) source reads
>>> +        bit 25: use wide (128-bit) destination writes
>>> +        bit 27: do not wait for AXI write responses
>>> +        bit 28: wait for outstanding writes before signalling complet=
ion
>>> +        bit 29: do not pause the channel when the debug signal is ass=
erted
>>> +        bit 30: use multi-beat bursts
>> No strong opinion, but mixing DREQ number with per-channel flags is ugl=
y
> I agree it isn't pretty, but it is the encoding the downstream DTBs have=
 been
> using for years. Switching to #dma-cells =3D <2> (or introducing new exo=
tic properties)
> would mean supporting both formats in the driver: I'm trying to play nic=
e here in
> order to not break compatibility with downstream DTBs, which I think sho=
uld be wise.
> The header I'll add in v4 with the definitions for these flags at least =
makes the
> device trees readable.
as I said I don't have strong opinion about this.

Imho adding these configuration bits to the DREQ number was a downstream=
=20
hack. Furthermore providing some kind of compatibility with downstream=20
was never intended and cannot be guaranteed.

Best regards
>
>>>        const: 1
>>> +  dma-channel-mask:
>>> +    maxItems: 1
>>> +
>> I think, the dma-channel-mask stuff should be a separate change.
> Ack.
>
> Regards,
> Andrea
>
>> Best regards
>>>      brcm,dma-channel-mask:
>>>        $ref: /schemas/types.yaml#/definitions/uint32
>>> +    deprecated: true
>>>        description:
>>>          Bitmask of available DMA channels in ascending order that are
>>>          not reserved by firmware and are available to the
>>>          kernel. i.e. first channel corresponds to LSB.
>>> +      Use the generic dma-channel-mask property instead.
>>>    unevaluatedProperties: false
>>> @@ -54,7 +69,12 @@ required:
>>>      - reg
>>>      - interrupts
>>>      - "#dma-cells"
>>> -  - brcm,dma-channel-mask
>>> +
>>> +anyOf:
>>> +  - required:
>>> +      - dma-channel-mask
>>> +  - required:
>>> +      - brcm,dma-channel-mask
>>>    examples:
>>>      - |
>>> @@ -96,7 +116,7 @@ examples:
>>>                            "dma14",
>>>                            "dma-shared-all";
>>>            #dma-cells =3D <1>;
>>> -        brcm,dma-channel-mask =3D <0x7f35>;
>>> +        dma-channel-mask =3D <0x7f35>;
>>>        };
>>>    ...

