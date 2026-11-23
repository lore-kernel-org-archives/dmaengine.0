Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455480;
	b=Gl2TcaDjAyZvUZ3UVrQmSEarVoweKIHc7ukjKLOQJ4T2vzqTfNg+wBgPACaItoGws9+m
	 5M6w792k2VM029YPh3rKoG7l4Sgfqbv7pkLGY2w2kH3F5IKU1J5EK8w+I6EDeAhJIU+VB
	 Jv26xLiSe9AWbXKUFKMWkRuWsyYgLXWXmC99+ll99o3XR8nw22icelz4I0mopqCSe/Ol8
	 aLdkuFvGgHmP3U3vVUnG6IfiVBGShlRa/vW6UJfeQ276tFnf6h2qkowMfOCeTUVH0cKV4
	 uH6LwkeRY23rCet+PhMPQ2sp6OOr6VeL18H7ecU/+68R69n3dtqqGJcZm+mh1xmBtjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455480;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=Vxf0ZwZw48oALpPDULIfn1X/uGuLHUcu0pc5dHPeADI=;
	b=FqSFkER3Flu7qPFPs7YS2kltqMrKmcpsddI/zEq2p5gA+a0YJJBrPRO/Ds28PdVpVNFl
	 sRrkHBNRYBg036rYQL9OdjH1h4M8niJDWmbGrARdJRcr0ItNv1H5UslrVo59tHwOOM+2d
	 ACjktDUMv8Okpp9TdHz1c78YrbipibzkhoA/+3f8Cr5pdTEI9KJ2D0EJgoxrXEOXAgqUr
	 lg3RUjquh1XGiQst1fNA78eJeavW57nR0N9/h9+517ioDfn5HCFrtEIRb6vtgGhfWGMyM
	 JYD2xeFp0aJHHJ2yzYDoNihhbTG7Xp508+2NCjFBtk4WNmgduc9JPoBttkMmAFI9UUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.net;
	spf=pass smtp.mailfrom=gmx.net;
	dkim=pass header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=g1W+e+xS;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB17A606A31A
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 17:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB17A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=g1W+e+xS
DKIM2-Signature:  i=1; m=1; t=1795455477;
 mf=PHdhaHJlbnN0QGdteC5uZXQ+;
 rt=PGRtYWVuZ2luZUB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.net;
 s=s31663417:rsa-sha256:hYZ1B+TAi78cL94j0ayy0CAPKTyy
   knDzSA4w3U9IP3+rrEueRUlGuBGcnaCtXqsIjLXCBV1mncwHleUDvNbrsr5x2zZ8q6lDJEniPt9
   N+L3QKJmRH9d/ZZ2FWcRH9WouPRUkWb/5U97xQPyZQpsxez5bG4mfkceoPsHXEYHIkCfITp7Hv2
   WJtDEl2ZyHMWrsKHbZHvePCNlico44k9z9IMsmGV/ze7aCmGT1JqpuOb6GGYLJHcwccN6n977GC
   5lfze7i39Ut3ArQl34quEWOzY2t6EHva7oKGzJ0VzlskHyT0HlkdDisSucC15SNdndkUY2dnqex
   Ku3vNUbCrRlDYw==;
Message-Instance:  m=1;
 h=sha256:
   HCTq/zKXVzx1P1k8u/9UvH0UmFA+DJk99EapIoPGXx0=:
   VinCKcBRrPxCvmxvnIp1ajuwa8egL+tlK77KU4nwFvo=,
  sha512:
   1WYu0L8mPuWkO3j3GT/yyvanzXJDt7GB9D5q6sVxEDQ1jAxuAXy0LFd1OjNWXFJYHDpjlixAq31TST8zL/9eSg==:
   KkLl2Sdhk9nXqI89KFsBhsB2NlFcrlowCzZXVfTHX6GPb2FlPTj1hlGA0YRC+ZlDCj44id7dLhPWojc0uQwQeg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1795455460; x=1796060260; i=wahrenst@gmx.net;
	bh=Vxf0ZwZw48oALpPDULIfn1X/uGuLHUcu0pc5dHPeADI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=g1W+e+xSCayZNgl56n7TgOHYah069MWYu3R0+5pyDgMHAwmCzz22xslQPd9Asl61
	 7I6pXB+8hc8pT1hBGB8iD7K/AWMjSvYOTr/m/s31xlD9G9Y5whJx+cwoVHkAhgpfh
	 rjVxz1iSmfuOwreohQfnv1TrhX4wrPUdO+6We9I6uQvUZy5y+1cRd/+qZ0kXDgLaP
	 GsYffXIp+UkFMsTh96B1uwLhy//wX1N7Zf/Zl2X9p3UKJo4Mn0t3i0dOBieYQVJAO
	 zDnvn5HuK0MbVmLxWsQm509DzjVG5RDOpiEakxHvV+KBx1tLNJcY4BJoRiEomMBn5
	 WQ6FVohqVDHuhVcI2w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHoN2-1xi9Qo184c-00CUVq; Mon, 23
 Nov 2026 18:37:40 +0100
Message-ID: <7258e7d8-c968-4876-bfb4-de89e2fb05e3@gmx.net>
Date: Mon, 23 Nov 2026 18:37:38 +0100
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
To: Andrea della Porta <andrea.porta@suse.com>, Vinod Koul
 <vkoul@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
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
In-Reply-To: <20261123145728.29082-3-andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9cxzINb1+GvzYaILgrkYOWsboQx9jyxJnaK+5IC0QwtMDlPaT3E
 1aknWI22STx5wknISJD+JVbzrATx88xZ5pg79trDWUUoyLraaLmvw2yNPHmhuRSLU648G7X
 6pUDr2OrvTVTHrVxDK5lwe62zPryJOxbPcs0aqGxA2zvd+mBuCli1lgT4tWCvuTNsnPISqD
 Tc1VpjE67yTni48jCCVww==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rLtTGLyo378=;oghEf22T3Llcwge8qasof7E7gf9
 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
 Wpmog=

Hi Andrea,

Am 23.11.26 um 15:56 schrieb Andrea della Porta:
> From: Phil Elwell <phil@raspberrypi.org>
>
> Add the ability to interpret the high bits of the dreq specifier as
> flags to be included in the DMA_CS register. The motivation for this
> change is the ability to set the DISDEBUG flag for SD card transfers
> to avoid corruption when using the VPU debugger.
actually I'm not against this feature, but this seems to pad out this=20
series. Is this really necessary for BCM2711 or 40 bit support?

Best regards
>
> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>   drivers/dma/bcm2835-dma.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> index b19182c6e3df..690f5ba1c439 100644
> --- a/drivers/dma/bcm2835-dma.c
> +++ b/drivers/dma/bcm2835-dma.c
> @@ -137,6 +137,10 @@ struct bcm2835_desc {
>   #define BCM2835_DMA_S_DREQ	BIT(10) /* enable SREQ for source */
>   #define BCM2835_DMA_S_IGNORE	BIT(11) /* ignore source reads - read 0 *=
/
>   #define BCM2835_DMA_BURST_LENGTH(x) (((x) & 15) << 12)
> +#define BCM2835_DMA_CS_FLAGS(x) ((x) & (BCM2835_DMA_PRIORITY(15) | \
> +				      BCM2835_DMA_PANIC_PRIORITY(15) | \
> +				      BCM2835_DMA_WAIT_FOR_WRITES | \
> +				      BCM2835_DMA_DIS_DEBUG))
>   #define BCM2835_DMA_PER_MAP(x)	(((x) & 31) << 16) /* REQ source */
>   #define BCM2835_DMA_WAIT(x)	(((x) & 31) << 21) /* add DMA-wait cycles =
*/
>   #define BCM2835_DMA_NO_WIDE_BURSTS BIT(26) /* no 2 beat write bursts *=
/
> @@ -433,7 +437,8 @@ static void bcm2835_dma_start_desc(struct bcm2835_ch=
an *c)
>   	c->desc =3D to_bcm2835_dma_desc(&vd->tx);
>  =20
>   	writel(c->desc->cb_list[0].paddr, c->chan_base + BCM2835_DMA_ADDR);
> -	writel(BCM2835_DMA_ACTIVE, c->chan_base + BCM2835_DMA_CS);
> +	writel(BCM2835_DMA_ACTIVE | BCM2835_DMA_CS_FLAGS(c->dreq),
> +	       c->chan_base + BCM2835_DMA_CS);
>   }
>  =20
>   static irqreturn_t bcm2835_dma_callback(int irq, void *data)
> @@ -460,7 +465,8 @@ static irqreturn_t bcm2835_dma_callback(int irq, voi=
d *data)
>   	 * if this IRQ handler is threaded.) If the channel is finished, it
>   	 * will remain idle despite the ACTIVE flag being set.
>   	 */
> -	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE,
> +	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE |
> +	       BCM2835_DMA_CS_FLAGS(c->dreq),
>   	       c->chan_base + BCM2835_DMA_CS);
>  =20
>   	d =3D c->desc;

