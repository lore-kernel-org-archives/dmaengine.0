Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702919;
	b=UCZfVESvxpBWv+MeUUjTES3TTuf/PaRao+2TegGnpY6cuIe7X+k+9/SZWeV4L2UKjekg
	 NUcLaVaU+uasWDB+oVLwDXVmTCHOz7MqWSrZYTiWvKWvqCMndqr5OjXG1EjyWJQgPb+lO
	 wVSPG0d4M1xbiyUq/qFQy66CqSHPKW/lr9odxmAPzCQmA0UAmF46LUWexC5e6ETzyZcJm
	 gxC2u9nCZUQCJpOgu9rIilxWPXXbX/EZ2UYdmUbmjBcmijOngcyaRd6Y3CEZOlGYV39f2
	 rUdLz0AjCgE9exsfJZ5f2b5mEHmOe1Y2sKkmun0nAVsOjbM85fucEYl7+OynlLKVNjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3qO+cKDCyoLTk5ZwPdAZ2/NZCnSWYAmAoadmXtEy00E=;
	b=DOks8UXjTcZGtS8Bik4HHP13n7+KvRu2XnSKqk89gofQ7pMwprhBr7QBvuLAEkYx4Ohh
	 8hnpB2jA7uSB4yAb50uz8zt5alkISy1e8Z2GDh+NcXpYnwQJj1uFBGhlRKaPEayG3HZ9L
	 UaVpJorb+fHWRRkEzQ3kYePz9cq2cPOlrNyd1ulln6oXw5LQ1KPl35kU7ATp1H2hE8fjy
	 KZ8Q6z9HsJKJNn3WstECbFzffmVu16LLvR2KmGq7+g5cx8MUKVVLc1rxmeDGpTyfx+GCl
	 YCGXsJB5kG2zijsPjhh7/YIkAeclSCCL6+LsNNYhOjkM9xZCHCnMlTBY9UpgZcb69yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PbsRhuus;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD5E606A680
	for <dmaengine@vger.kernel.org>; Thu, 26 Nov 2026 14:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DD5E606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PbsRhuus
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so41176765e9.1
        for <dmaengine@vger.kernel.org>; Thu, 26 Nov 2026 06:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795702918; x=1796307718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3qO+cKDCyoLTk5ZwPdAZ2/NZCnSWYAmAoadmXtEy00E=;
        b=PbsRhuussMyQu1C9Z87U0zbKtI5UnEuDaxErAUa7VDsBHDhsXOGybk0MseNYgdS0WG
         3mp9KsvAeOdmhlcSsViIJgXJKbQB3ng+oNlNAGniIZcJmQMLwT2Pz3Brzw9BwMwInfSH
         1y4zlblZhDKwtkNoqvX0eFpvBJehVvQtpFK84rpdkG85M8YXQRzpnc66czzHFMN7eUWx
         /8yPAzE9EgmntLslEXnXJryayLZGqTOwnPL+BDXjTvUDgk5/y6h48xMO0FMYOAlmClxT
         hFmII7Gavou1Aaa9OnAnucLeaCSoGPc65bYTx41ZC2EB9wQ6IReFIy4vkWncwgl1ztL8
         Mltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702918; x=1796307718;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3qO+cKDCyoLTk5ZwPdAZ2/NZCnSWYAmAoadmXtEy00E=;
        b=Zp6P6Zz4TgIaEtnQdpBgOyaaFVMTfcg+YBubXr6l18Yfq/kTppgS9j6WqlAYYpiNas
         ugdkvuz6aixg8T/Yx8R1Ylc8vQKynE7rS0eoB2dkF/cLs6SXW9cPde7SJRys8xFj/1jW
         7hRsv5B5YczGSVuASJhIq0K5Z+00lJWPIEUdfr8fzt7j6GT92aD+qfal3709uaspoY46
         IJ7ZFsN/67v8E2SLC5uD+Rk6UcYXptPwgo/dvkcKcrB5OZ74kEfGxYNm9oGqLcql/iS0
         b1OdvNp06O0xqW8jswmpA5FDJaDTJ39qXbxJ7dOrQXAIF9Gzj8LPBaglJ9IAAtvPJiSf
         Qr1g==
X-Forwarded-Encrypted: i=1; AL+hErGUYl07v72lfUXyVdaIs2hA/Hx0vyQPWHqR1TMp3BaGIowbfqWBX1jmXYQjjqazhcdxjChd76IoEEQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8v8vQ3CrApYLdd6aDEDWCe9wgohtn+B7txoiLLfZX8ZB15sqYO
	updkovM9nnULmsfCWOGo/TWPL/lyOHH5+OEAPPkZFfROXVtPLc6m18p9lKOWcYFkx7o=
X-Gm-Gg: AZFdTZdb7PL5CptDJk9G8lcUHcdbe8I5z6u2rQxStROosxVS9DoCC46L3Eka1/G9b7n
	K8ylYNBOIcpq3YXvRJA7l22r9XdsPP1dTfUAbg878s8vXdO2U4Mp177GGQHzkrqshnEBI73RQ6W
	DKwXMKOxXDPGjJH8i2JTresAuE6+WqM67cSTmbqPSmHuEIFxUYGcu6dzYtGqhLWYMgaKc9VCDPV
	61lbrD3eYXkbfJzuSqnAY/ok1QfULmzRkdUD042BrVzhoNWHk08XZqMrbc5pVInkoEJpZMsYfDK
	2UwNMgYpfhDRzxux1m5ApWBzBY/WgMk5EeCEGTuEDZiyiIRK2xUOtfTNsbjkU/0LkYClMkGgyZk
	+2F7q/DUrZesZ2WAzP+PviUIw1sSd/KJvP40dQf9cbSYHIpd1HPUGEKSjXv2XSQka+yd7d0CZT6
	CjHC98YMwjyDN2GLvLhmO4B7phmKT9gs1WefsGEBWtDV4YYd41rnIrd/Hz0QXnEaT3BTOZuTkik
	l9IcEJkTEoxmeYhYTQwUxsmKYt8NlKjhx/WYdOz8F9mMsjUxr00dm/DCeAxXjk3PZC5vXptSvT5
	g0mRahpyhvZX5Bd/+VFGN1QWfQVx
X-Received: by 2002:a05:600c:a08b:b0:4bb:6651:9eda with SMTP id 5b1f17b1804b1-4bb88922ca4mr401901655e9.14.1795702917688;
        Thu, 26 Nov 2026 06:21:57 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm831228715e9.13.2026.11.26.06.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:21:57 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 15:25:56 +0100
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/28] dmaengine: bcm2835: Fix coding style issues and
 a typo
Message-ID: <awhBdHDVnmxNhQOM@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-2-andrea.porta@suse.com>
 <awXhjjB_9-N7RRBi@lizhi-Precision-Tower-5810>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awXhjjB_9-N7RRBi@lizhi-Precision-Tower-5810>

Hi Frank,

On 14:12 Tue 24 Nov     , Frank Li wrote:
> On Mon, Nov 23, 2026 at 03:56:39PM +0100, Andrea della Porta wrote:
> > Fix the coding style issues reported by checkpatch: use u32 instead of
> > uint32_t, add the missing parentheses around macro arguments, which
> > could lead to operator precedence issues, drop superfluous parentheses
> > and long int, and align the function arguments. Also fix a typo in a
> > comment ('missmatch').
> >
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/dma/bcm2835-dma.c | 83 ++++++++++++++++++++-------------------
> >  1 file changed, 42 insertions(+), 41 deletions(-)
> >
> > diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> > index 06d830d36882..b19182c6e3df 100644
> > --- a/drivers/dma/bcm2835-dma.c
> > +++ b/drivers/dma/bcm2835-dma.c
> > @@ -51,13 +51,13 @@ struct bcm2835_dmadev {
> >  };
> >
> >  struct bcm2835_dma_cb {
> > -	uint32_t info;
> > -	uint32_t src;
> > -	uint32_t dst;
> > -	uint32_t length;
> > -	uint32_t stride;
> > -	uint32_t next;
> > -	uint32_t pad[2];
> > +	u32 info;
> > +	u32 src;
> > +	u32 dst;
> > +	u32 length;
> > +	u32 stride;
> > +	u32 next;
> > +	u32 pad[2];
> >  };
> >
> >  struct bcm2835_cb_entry {
> > @@ -116,8 +116,8 @@ struct bcm2835_desc {
> >  					       * AXI-write to ack
> >  					       */
> >  #define BCM2835_DMA_ERR		BIT(8)
> > -#define BCM2835_DMA_PRIORITY(x) ((x & 15) << 16) /* AXI priority */
> > -#define BCM2835_DMA_PANIC_PRIORITY(x) ((x & 15) << 20) /* panic priority */
> > +#define BCM2835_DMA_PRIORITY(x) (((x) & 15) << 16) /* AXI priority */
> > +#define BCM2835_DMA_PANIC_PRIORITY(x) (((x) & 15) << 20) /* panic priority */
> >  /* current value of TI.BCM2835_DMA_WAIT_RESP */
> >  #define BCM2835_DMA_WAIT_FOR_WRITES BIT(28)
> >  #define BCM2835_DMA_DIS_DEBUG	BIT(29) /* disable debug pause signal */
> > @@ -136,9 +136,9 @@ struct bcm2835_desc {
> >  #define BCM2835_DMA_S_WIDTH	BIT(9) /* 128bit writes if set */
> >  #define BCM2835_DMA_S_DREQ	BIT(10) /* enable SREQ for source */
> >  #define BCM2835_DMA_S_IGNORE	BIT(11) /* ignore source reads - read 0 */
> > -#define BCM2835_DMA_BURST_LENGTH(x) ((x & 15) << 12)
> > -#define BCM2835_DMA_PER_MAP(x)	((x & 31) << 16) /* REQ source */
> > -#define BCM2835_DMA_WAIT(x)	((x & 31) << 21) /* add DMA-wait cycles */
> > +#define BCM2835_DMA_BURST_LENGTH(x) (((x) & 15) << 12)
> > +#define BCM2835_DMA_PER_MAP(x)	(((x) & 31) << 16) /* REQ source */
> > +#define BCM2835_DMA_WAIT(x)	(((x) & 31) << 21) /* add DMA-wait cycles */
> 
> You touch these code, can you shift to use FIELD_PREP() macro ?

Done in v4: the register field macros now use FIELD_PREP.

Many thanks,
Andrea

> 
> Frank
