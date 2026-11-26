Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703445;
	b=4Iq8znLzP/Blu9Y7P7jP0JAuvP5RY+D/yPVlYvo/voA2LzlRYUVKPSsYtIE0s8HHfVBX
	 lctybOcB0ImRfWYm18Zd8f1wmif5BaUPPk6Dgd3GmjNFNUXK3NxMB69F1UNCpbvlkN8Vr
	 v0e3sAH5pgNUC2ZvKkoOHeSYWwXKlwvA37SiLerhC5r8cOerK/5fSYObPeMRoa8urT7yt
	 gK/9v5u1ZnQiDbXWvqXRjSYS+NYdUWygx/EQLqwAYN1nzGu93S6pnU6V+v4qcl0wQI/GY
	 aKzBHQfO1CruzdzP+qJEi+MLJDCQvlFUI6tgg2jq1moABJlOQc69H40y6z51p9GFmLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ABzoEq0m6vsFJk565MhCiGTGEviQ8pU/lDbym6z/Ado=;
	b=eayLZABs6D1zST+Ey2qZ5hRwG+3cncBqQmKnT01GRqqWQ3cybT9XfpjFEf6gSi1T0Lwf
	 MqfyEEVfCP3J4k2yEkQSzVmM8D+MXiPrTd8bc6ceamhbTtRUUCUDSLL+CTR5qUpiaLu/a
	 If6af7GJyKZVwrRIUvoHOj8sWzwmCyHWGk0k1XwQ3b4mhKEVstznoomJNCKQdOw6uSFri
	 fGxV/9qPpQ8BFHVH+Yg1o82XCt2HZM4RKnP/PvIJ9TcLlFpuvh6PuVoKOYb4PNJfyW7ue
	 vptrwT1ZnwBhZcDoLUvZy28w0aCkP4Now0WO+64Sa/iMrYVL6jg3OAPqJbkgMn/QXrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FTLZu6P+;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4671606A6A5
	for <dmaengine@vger.kernel.org>; Thu, 26 Nov 2026 14:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4671606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FTLZu6P+
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso87437265e9.1
        for <dmaengine@vger.kernel.org>; Thu, 26 Nov 2026 06:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795703437; x=1796308237; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ABzoEq0m6vsFJk565MhCiGTGEviQ8pU/lDbym6z/Ado=;
        b=FTLZu6P+3j1KJHT73x9+c1vsPjYURn8Nckh7vU0GQHWO1jaJhr6TFSl0c50PMuyBpg
         DDoM3P0wJtT2QwoXHut4wdwKVyYR7ihk5CGcFhlVrI4iSzxtkk4UzyLTMMly6Vo1mfGg
         0C8751Wmes4UioGJd7HlcYxtRdf/QizDwoM1ogvczZDOtrGu0D0iZNxYzNtkNsu/z/M6
         zmWMCuZc9QtluNZdkUUWybelri/Ch0FTtXNiVeYzPt0nkUWrIEIz5ZrzyVhivmV7OY50
         LgqYpjQkVwp66gQQcqpVB9s67aG+8rfvozx91WlNLCPhji09Ufx9Q3jd+/RSsrKJrHIL
         VCUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703437; x=1796308237;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ABzoEq0m6vsFJk565MhCiGTGEviQ8pU/lDbym6z/Ado=;
        b=0V4qEut6om0w9f5LRjqV8dLc2MGyKJqk0uuMBk0A2W41MOdM+2CROOddreizLQtS6Q
         NVjOLzDdjDuiOPN9McwHSp/INNGaVfP1ch9Ys6/HsXvpd0twsyeXl6XtemuXQizNfS0i
         iZExmsXTpJEv5XxCj1E9tEB03d6otNIZyqavgosrD2LTMr3I1ZyhIv9mix61Zv42PCEV
         yEhGLKAlHH9P1CmHBPPxm1tJPQu+VGZxwVIRC4Lx+XrueibCCwy+9WOnIxJXLnbGgKoA
         Ll4IPXXaSLERNG8lUyHtLna95YVDpekvzuETl2lw3ZSpZ82aEQgD96zwXFKwJAE6tU08
         2Frw==
X-Forwarded-Encrypted: i=1; AL+hErEoVDKuuMo+ELw7OKtQ9m/nt7S9Dwa1XF00DnnMQhqhDBisBUETCC1wQoENw2BgdEKvNXQkOm39AP4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dUTxBX2Cd1zSj5u+6LpQFO/eChG1pGE3BXJxqe1xp5tb+w8vU
	ldFNJqnvB72Rq39zD6lFMHh9PT1wiwnxHBPE5ThpQBDZqKrj+VmQgVib1G+h7oZePYM=
X-Gm-Gg: AZFdTZfWN/dL56mtJwWn8Wa+TdbD25gJHL63SgtzwtaSw/JnEQTRlD6JKDZ39LDP9/w
	Z8SFj142SWqFgRbmagwy3EFHJKF8tJ5yGKBM0fNK/D68eTNYK06wwaC8JpdAEVbqNt/Xnwx8/y0
	H0TtoWAWmVxJx9fsfei8bmZ07sMoTMmLjRITSYCZCu4+QY1wC/A7zFo9XykQmYOcgl8KI/tUp8/
	SQB5v2XU2J4jxMOa9/ZU5zordir61EGAIxGuCFIBETlOwgbRPQwOyfpDtQgXFF2NPsxW92wkRH5
	f8CeoZ7dhuiiIPgsrAWoOlWHOS8rTXBfs81QF7XYu+CpDfGuc5JNa4pG47aUfljCNCswtTb/YZq
	HK973Xt2P2bLvFWGaQrckG+ZedVB3TOPuf8KkGm4TiFMnE30UTH/+Tb0VJFvhh9sQMGpeu+UFyq
	IZs1vWRP1LZo1b8LoUTCkulwzFW3cLpyptR1RERawDWQHhumfefXG4J8ZDROmH03T8EAcS7NLXq
	0bZHXiMxoJWT+iKE6pMFlqq7ZeZ5l39oFyIni/ocjIwrCVElIq3p/hz6aST77SBcCRQZPLXZh1k
	qQDS8TLkmoW9ls4jhuzBZO+PQuyq
X-Received: by 2002:a05:600c:64c7:b0:4bb:68c4:2044 with SMTP id 5b1f17b1804b1-4bb887fe725mr403770795e9.11.1795703436933;
        Thu, 26 Nov 2026 06:30:36 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm340532965e9.0.2026.11.26.06.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:30:36 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 15:34:36 +0100
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
Subject: Re: [PATCH v3 04/28] dmaengine: bcm2835: Support dma flags for
 multi-beat burst
Message-ID: <awhDfF1HNkPPgRbR@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-5-andrea.porta@suse.com>
 <awXluqyLWzdl_Ade@lizhi-Precision-Tower-5810>
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
In-Reply-To: <awXluqyLWzdl_Ade@lizhi-Precision-Tower-5810>

Hi Frank,

On 14:30 Tue 24 Nov     , Frank Li wrote:
> On Mon, Nov 23, 2026 at 03:56:42PM +0100, Andrea della Porta wrote:
> > From: Dom Cobley <popcornmix@gmail.com>
> >
> > Add a control bit to enable a multi-beat burst on a DMA.
> > This improves DMA performance and is required for HDMI audio.
> >
> > Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/dma/bcm2835-dma.c | 16 ++++++++++++----
> >  1 file changed, 12 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> > index 118ba2f71dc8..063e1b2aabe3 100644
> > --- a/drivers/dma/bcm2835-dma.c
> > +++ b/drivers/dma/bcm2835-dma.c
> > @@ -137,6 +137,7 @@ struct bcm2835_desc {
> >  #define BCM2835_DMA_S_DREQ	BIT(10) /* enable SREQ for source */
> >  #define BCM2835_DMA_S_IGNORE	BIT(11) /* ignore source reads - read 0 */
> >  #define BCM2835_DMA_BURST_LENGTH(x) (((x) & 15) << 12)
> > +#define BCM2835_DMA_GET_BURST_LENGTH(x) (((x) >> 12) & 15)
> 
> Use FIELD_GET()

Ack.

Thanks,
Andrea

> 
> Frank
> 
