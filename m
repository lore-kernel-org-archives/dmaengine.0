Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6A72E091E
	for <dmaengine@vger.kernel.org>; Thu, 18 Jun 2026 17:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781802768; cv=none; b=PJ0B5IH9BYsqo64fqpW22Hs6uPZtSiAxGwrH5o+bNJxOGAzJALAE1u3KoQto7izXWYaameebJtKahJjMYybjjZwE174uC1VNPwFGjB4/ULtDrFUOWS0V2xcYhETok3HNGwiRx8tvljyb8W02kqBnkOQSmlK+TG8tB0NLHJ8hP58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781802768; c=relaxed/simple;
	bh=XvyhWFfNg9ZTDu7ReKiTeTBhKhccySIyD/kmxK9wqcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1wKnMS376F9rSFhQyzn1euXOKdWv4IgO22zlhTI7U2as40+WFwIDV3Tt206H0GJfqQT7Bc7Nv5Rus/Q2ZUQiHkDuYdzxCBoM19fpoA/YGYDBtwB49ed6UpyDCe+n+MVsSjqTnA44px5xUhyyqeThS8GGsWCgoRVnjQHVZYHwZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HsTR2mAJ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HsTR2mAJ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-462bb734793so974810f8f.1
        for <dmaengine@vger.kernel.org>; Thu, 18 Jun 2026 10:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781802766; x=1782407566; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OPYldehot7tz8RCFgz3HrFSaMMAMdN8VU5l6kfPYI9k=;
        b=HsTR2mAJjm9QdlJPx39o94YTkPgkk9NUDyDdNzCgq5ct/UDj+Xu2fzAYas60+z+uhO
         hGFNy4Pofz1w2wbVVfXuI1d5kfVzKTuo8jcz2TNxVfHOtxAPiH0auhz2xUXxHYDjVqsz
         Y5WfNNaYrgeY7FZm6s/fbdSofNiPLj/BahOxGSfLBAgSUmmehJblTLJEDWco6+t/OTf+
         2Q1Yh+wFIlvLgtYvXrESPIpqRJyVzGGbTfDFtrTwzQuzXvL16fvzaDSSN3puXL21k13J
         fyjIgmNY3lpFUr8m1u3pVwEjzngGSkXGLYm6PdIyst48osDAI6XTfvTapKEtiEQCUFK8
         SCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781802766; x=1782407566;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OPYldehot7tz8RCFgz3HrFSaMMAMdN8VU5l6kfPYI9k=;
        b=e71rAKRTnBvFQwLcX/Kk+xh0fk8ViQGQszwpeeuL+Y1xh458mVfKnI4qOkCTBeSqTy
         b2SV65hZGOc41/6aTyffdmHAYCmwa5Z9Wv/W8KkkcE7Qea/BFmgHxXimCF5ekOgMFN3X
         AejSF7p3J877tvITttckGFzU1JgFqqmARuEirWT7eDLqsVXlG8G8nkNW306NWfKAvniO
         b+exC0Z7qBNB6piQfkz1xIbIthlA+BkRe6HIZe7hSu7SAIHmeZc0sANNDuV9CsqZ62ln
         k1mgUd1DKT7tGI+rJqyxrFTT3l0HqEOu556BS4TF9nyHAJOPZsfJ72Sdd/2kywvNgrNM
         x8Rw==
X-Forwarded-Encrypted: i=1; AFNElJ9wsXTtX0ekIrdM/tnmmln0Z1x9l6LYRI80Ku18zy/Cm6mQ0P53UF39hLt6xQCCzARsNz8MybM3nMw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr9OCssozbUtVfkji4/0sf1/WqDK+SmJSs5t4nFOi7p1L38nm6
	po9aGrggtQvFe0M1mhQRHor4dHTaoneXIV07HMsDF2Q8CbwfWVNTxXve
X-Gm-Gg: AfdE7cm+kZy0AaRh/JqfXIsv80Lipzn17IkjDk8tpOGcK/7wUdDbAEMyZ0BR8sp8AYg
	HYuLxZJFptZzbitLfAA4rhwnaP/etRDAHGO1UJaENXIc8MmXkPn7vPDyW5pXGMr2h3wnKcMli4X
	EHp0V7w7dBK/10pFE2NIdJ/auxCjbpTkcUUpdEUU/hTUqxAWJdDWc52oW+R3GGJwSxp/JeQZGW2
	u2XVh26zpeiigGdG4Z3CH/USgkN3n6+y9UelaKuSeqMbF2gE+MRMLmKss7jqtqub0TE0QPzgoD5
	f36/WmYfs8PUJUnpRxt3UpDPYJfEoNqc9hnjH/ZWfUVY/2iyml/2LY7tFBX+T5GVT3mBT5xaDbE
	IR/tuzrPKGaR1BnOENPhGOcvYH60+XXw3lZ9GZBwCEEiTTdBnPpBYwfq93gmdy056QfOpU2Np4w
	sZs8e5
X-Received: by 2002:a05:6000:46ce:b0:45e:f631:2c73 with SMTP id ffacd0b85a97d-464ffa952e2mr467310f8f.9.1781802765447;
        Thu, 18 Jun 2026 10:12:45 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650b76e7c9sm293604f8f.21.2026.06.18.10.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 10:12:45 -0700 (PDT)
Date: Thu, 18 Jun 2026 18:13:47 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: nuno.sa@analog.com, dmaengine@vger.kernel.org, 
	linux-iio@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH RFC 1/3] dmaengine: Support address bus widths of 32
 bytes and above
Message-ID: <ajQnE0e5a1JS7IWU@nsa>
References: <20260616-dmaengine-support-wider-dma-masks-v1-0-da23a8dcb756@analog.com>
 <20260616-dmaengine-support-wider-dma-masks-v1-1-da23a8dcb756@analog.com>
 <ajF3p3Vu_pOx9z_V@SMW015318>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ajF3p3Vu_pOx9z_V@SMW015318>

On Tue, Jun 16, 2026 at 11:19:51AM -0500, Frank Li wrote:
> On Tue, Jun 16, 2026 at 04:40:52PM +0100, Nuno Sá via B4 Relay wrote:
> > [You don't often get email from devnull+nuno.sa.analog.com@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > From: Nuno Sá <nuno.sa@analog.com>
> >
> > The src_addr_widths and dst_addr_widths capability masks encode each
> > supported width as a bit whose position equals the corresponding
> > enum dma_slave_buswidth value (e.g. DMA_SLAVE_BUSWIDTH_4_BYTES sets
> > bit 4). As these masks are plain u32, widths of 32 bytes and above
> > (DMA_SLAVE_BUSWIDTH_32/64/128_BYTES map to bits 32, 64 and 128) cannot
> > be represented at all.
> 
> This is problem, which should be fixed.
> 
> >
> > Introduce bitmap-based masks that span the full enum range. To allow
> > controllers and consumers to be converted incrementally, the legacy
> > u32 fields are kept alongside the new bitmaps: producers populate the
> > bitmap (mirroring the low 32 bits back into the legacy field) and
> > dma_get_slave_caps() folds a legacy-only producer's u32 into the
> > returned bitmap.
> >
> > Add dma_set_{src,dst}_addr_mask() for producers and
> > dma_slave_caps_get_{src,dst}_width_min() for consumers so that, once
> > every user is converted, the legacy u32 fields can be dropped and the
> > bitmaps renamed without further churn.
> 
> Good mirgration plan.

Cool! I'll then wait some more days and if nothing pops up will drop the
RFC and send a new series addressing some valid AI inputs and converting
more drivers.

- Nuno Sá
> 
> Frank
