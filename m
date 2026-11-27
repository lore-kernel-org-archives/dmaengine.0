Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804308;
	b=y4EwHx52N9MU2WKgpw7IqP9XmWNtTd/aKYuI2hwJgZgvBViYMpJxosM49L7XjUb9mG4A
	 tZBDmMtVfhAAbNbGOaZiqJpfFAdlMS1XdXOzQT3X7e4UcJmvHG9o5tZjgM2vU5mM+YH9H
	 7K9a8+H9V5vqXgt+BxHwAIqwJnzERlYQMWavG6xKCobfvcwzkoQcHA15BWMfVA274k9dP
	 5JjyKnRKAZTHI1ZNUZtdnd44wiIN9d2EvNq6LUQ0pZkhr/Mc21n1FE9py66DaZBx5uxHU
	 61goRGjPvp3F1TNnRpbinZIL7chT+rhLXqCYWABQbGUvzJQqlUNm2oyoUNgiy0xt4LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804308;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=i7BETHqTkNGjMNy35oUUjwtiCKiIb/T64Nu9WGoCtDA=;
	b=xNrUjaf3T4WGs6dZf8IFNQgT8R7WiTvpIeKl3cuEIDQ8sndHstJ5tKqoPjxR8Fy02GMe
	 EvK+10Y/6K0l457sTXb5nMN375Hshbbqd8UPw4lg3ajTPjreBKfrgj0viB/3DaW/iyiDD
	 zsQjvDe7RfMYavZ9hFR6u0H7PYTO3XhSyVR/KK+wh69KTuNzawNorXZJp6/83ts30Ky6P
	 zaUGNS8TmmL1uZ62JSpc8/IwSPBKig8oPp16GgLMSSZyMwT1XZB3NQ2HjlWSgZlhPnFrU
	 z4u7RVJkYFR38nf5F2FFtyqWgHw46apUDyvpq7oPF4eGJ00gzdawWOV02XhxMYf9Y2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.net;
	spf=pass smtp.mailfrom=gmx.net;
	dkim=pass header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=MNp4XKyk;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6470606A33C
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 18:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6470606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=MNp4XKyk
DKIM2-Signature:  i=1; m=1; t=1795804305;
 mf=PHdhaHJlbnN0QGdteC5uZXQ+;
 rt=PGRtYWVuZ2luZUB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.net;
 s=s31663417:rsa-sha256:JR0Zgbt04FOLhM0rLZ/sfArceESm
   LPx2qeMGHSKd3wc+g6z+/MLRn1c+qEVO9HhNiL9Af2ghDND6fvjifY8BWh35oM9hn/xdekHRUID
   a64s4RUp/tdmsOk52DEN67cObN0K9RQ0M1sJqBlweDCZY+kiC0jNLFLv7965YiAj3EtRttUqDrz
   u/zBnBiG6I/5jgVYc7HN26MpzOPUijPzpv5K9Sl/FxWcaL83K7+PcAi4JhF+9bP3/B5lBqFAYv5
   z4eqre9d7zu0H9CdukbCkI4kurt6y1TTb4AvoJfFY3BoFCcdFurqxSvf65S8+nvSPriFctsZX4v
   Fjv80xSmKMS1Gw==;
Message-Instance:  m=1;
 h=sha256:
   ZIBGI1rI51NyTNbCGeH9fxRqRmAZW+oh1IOUGkqQZE8=:
   r9hk92AKGpn2KiYsCfFW3ZlqGKUW+s301nhN31YYG3c=,
  sha512:
   3uGNDnPjatf4A86XqyfyA9h4a5qQITSNGRNw9aVlTWyKdF8uhBHsf3AkoHBxzOLnfVeQBj9Nc1O9YWLCLNwuJg==:
   6gbKUzibp3hG8rZpgVpIeTZxTeoxWnDT8VcrHw+j9TXfoTQVRhKzw/7glS5roZfkBfboKi/9oW/OXh2Ll2o9Qg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1795804291; x=1796409091; i=wahrenst@gmx.net;
	bh=i7BETHqTkNGjMNy35oUUjwtiCKiIb/T64Nu9WGoCtDA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MNp4XKyk2DFwbZ9wqnqeAclhRl9k25yozClpHPvQSfgOyWvTU2lGw7GUaadI1dyH
	 itv/SjZZwwwASgBnYUHFdBTyhklv3TMAMoPPBpV4eKd7fxcy74fhVwNNUYWTGG9tE
	 OalzO2t1EddJAfIEkLrLVG8k4cDyM95V2Ro1niDO/raQa+lugtr9Bim4/1u9I8wRU
	 iSIZL9Ky0vfjX/o885ywvQsF3jq+VlLze4JJN4scNYh8+Ad2GRaKOujD2tdgeazXg
	 NyrNHvupMaLU0LulV6yI6vIhyywGUIYW7G8I88oWY8FecAYJ2+lZNcP6O7iDvutHq
	 mCn3WNjbPP3v1VNB9w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXp5Q-1y0gBD16xY-00SG6j; Fri, 27
 Nov 2026 19:31:31 +0100
Message-ID: <6b8f7225-820d-4887-8651-01ecd13cff37@gmx.net>
Date: Fri, 27 Nov 2026 19:31:29 +0100
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
Subject: Re: [PATCH v3 02/28] dmaengine: bcm2835: Add support for per-channel
 flags
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Vinod Koul <vkoul@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Saenz Julienne <nsaenz@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Dom Cobley <popcornmix@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-3-andrea.porta@suse.com>
 <7258e7d8-c968-4876-bfb4-de89e2fb05e3@gmx.net> <awhIyZ2weVtCrKN6@apocalypse>
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
In-Reply-To: <awhIyZ2weVtCrKN6@apocalypse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VV+QAVpKg839NbtO7Cg69+Enf8PtbpeZieJChKDfkCbHyUusxkP
 wD1FNwOaOOjp6x3/m4DFGS2hcU3PpZWhS/Vr8eoWdLmxjwouEFg3qKhH436r/ie2m2DdB9f
 SYPz3UpQRSJBuntZUqhPH13KPaxCeKm10/60Ra1nczHZORH+Q0hOoWiCYdCh7SD3AjyWFvZ
 F3U7UvC5r5o/AJ8Tnx7hg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kmDdr8NWtmQ=;MEjK3DwgMYk2q/L1Wp8rtS0cxUD
 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

Hi Andrea,

Am 26.11.26 um 15:57 schrieb Andrea della Porta:
> Hi Stefan,
>
> On 18:37 Mon 23 Nov     , Stefan Wahren wrote:
>> Hi Andrea,
>>
>> Am 23.11.26 um 15:56 schrieb Andrea della Porta:
>>> From: Phil Elwell <phil@raspberrypi.org>
>>>
>>> Add the ability to interpret the high bits of the dreq specifier as
>>> flags to be included in the DMA_CS register. The motivation for this
>>> change is the ability to set the DISDEBUG flag for SD card transfers
>>> to avoid corruption when using the VPU debugger.
>> actually I'm not against this feature, but this seems to pad out this
>> series. Is this really necessary for BCM2711 or 40 bit support?
> The flags of patches 3-5 have in-tree users in this series: the BCM283x =
HDMI
> audio channel uses wide source reads and no write response wait (patch 2=
7),
> and the BCM2712 HDMI audio uses bursts, wide reads and the AXI priority/=
panic
> priority (patch 28), as done by the downstream device trees too.
> If you prefer, I can move them to a follow-up series together with the H=
DMI
> audio patches: in this case you'll have to wait for the upcoming new ser=
ies
> in order to have the updated audio nodes in DTBs.
my point is that only few human reviewers have the motivation to review=20
a series of 28 patches, which gets an update after one day.

Best regards
>
> Many thanks,
> Andrea
>
>> Best regards
>>> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
>>> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
>>> ---
>>>    drivers/dma/bcm2835-dma.c | 10 ++++++++--
>>>    1 file changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
>>> index b19182c6e3df..690f5ba1c439 100644
>>> --- a/drivers/dma/bcm2835-dma.c
>>> +++ b/drivers/dma/bcm2835-dma.c
>>> @@ -137,6 +137,10 @@ struct bcm2835_desc {
>>>    #define BCM2835_DMA_S_DREQ	BIT(10) /* enable SREQ for source */
>>>    #define BCM2835_DMA_S_IGNORE	BIT(11) /* ignore source reads - read =
0 */
>>>    #define BCM2835_DMA_BURST_LENGTH(x) (((x) & 15) << 12)
>>> +#define BCM2835_DMA_CS_FLAGS(x) ((x) & (BCM2835_DMA_PRIORITY(15) | \
>>> +				      BCM2835_DMA_PANIC_PRIORITY(15) | \
>>> +				      BCM2835_DMA_WAIT_FOR_WRITES | \
>>> +				      BCM2835_DMA_DIS_DEBUG))
>>>    #define BCM2835_DMA_PER_MAP(x)	(((x) & 31) << 16) /* REQ source */
>>>    #define BCM2835_DMA_WAIT(x)	(((x) & 31) << 21) /* add DMA-wait cycl=
es */
>>>    #define BCM2835_DMA_NO_WIDE_BURSTS BIT(26) /* no 2 beat write burst=
s */
>>> @@ -433,7 +437,8 @@ static void bcm2835_dma_start_desc(struct bcm2835_=
chan *c)
>>>    	c->desc =3D to_bcm2835_dma_desc(&vd->tx);
>>>    	writel(c->desc->cb_list[0].paddr, c->chan_base + BCM2835_DMA_ADDR)=
;
>>> -	writel(BCM2835_DMA_ACTIVE, c->chan_base + BCM2835_DMA_CS);
>>> +	writel(BCM2835_DMA_ACTIVE | BCM2835_DMA_CS_FLAGS(c->dreq),
>>> +	       c->chan_base + BCM2835_DMA_CS);
>>>    }
>>>    static irqreturn_t bcm2835_dma_callback(int irq, void *data)
>>> @@ -460,7 +465,8 @@ static irqreturn_t bcm2835_dma_callback(int irq, v=
oid *data)
>>>    	 * if this IRQ handler is threaded.) If the channel is finished, i=
t
>>>    	 * will remain idle despite the ACTIVE flag being set.
>>>    	 */
>>> -	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE,
>>> +	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE |
>>> +	       BCM2835_DMA_CS_FLAGS(c->dreq),
>>>    	       c->chan_base + BCM2835_DMA_CS);
>>>    	d =3D c->desc;

