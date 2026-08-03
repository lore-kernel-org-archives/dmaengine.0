Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CDD4052A7
	for <dmaengine@vger.kernel.org>; Mon,  3 Aug 2026 12:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785760449; cv=none; b=nmCowja6Q7Mjiykb5mBQfmErvyGK5gUDWWFjNVQKnFlEQzefdgKg53RWONw5zdcz6uI3uEWL6qxc0O9yrDJL7oonGbmz4GWwmy5IrDRlOMmPVIVqmsn1e5yXvpRh0npovym3UX+Xrq9OAru+DnmjkUnGpeH7CjO6DYfaF+MbqLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785760449; c=relaxed/simple;
	bh=AXct+peyhGQRc2kaBjGP1yN0sVFdplmAYVc/6HFqGmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXdbj5K0Csu53v7dZ8wPxCJ52SGxZpFfl6+uzDEYw7AsHQyPXVxCzqI9nV9To+IK+C1+O/e5WQVZYQaLcrKDrU5yoyZfj7kWLR7E/nLE7BbDFufdh/xSpr9HxaAq6rDfWY6mJSfexthPiMOUFfCsxboRFSrtPrl10WC3T0bpj48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l31AYpsZ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l31AYpsZ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so21006155e9.2
        for <dmaengine@vger.kernel.org>; Mon, 03 Aug 2026 05:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785760446; x=1786365246; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9WqscRAKEYBt39skofdEcGtg2VLcJdEYES+naCN0pIA=;
        b=l31AYpsZ/s0Nu5DXh2RzkOmGJhuy3lHKGRnF9JCBmckM/YFqSIbU16GZT70ySInYwN
         SjK+Ideerp1pR4G7hYxCQmqtKIXiVRtvOOgQREdewNPi6mrRlOX5PNZYZRPRVRVSacB1
         3P9cQH4joYSHPoxmfxRFUIzK+Hwh8Y88Q23BlwKy4IjhGAVsGoGlDJ88p+HWrwKSkBMu
         QYECWlPny4WR07c+6tq8SAyynDZXwl9/kixmAl0slUx7rQKeRYVn0z8GTXnw1Cy1eZ3g
         8FdV7R2j6NSQlCNn3OmtJuBVM+rj+eIHlYnBwGgP76JYu8in3ogqbBD2NsA9H6Alv5JF
         JDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785760446; x=1786365246;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9WqscRAKEYBt39skofdEcGtg2VLcJdEYES+naCN0pIA=;
        b=N5Ii75MVpWlL3FNszAyMOkuTTpUYK0XTcdCHcE+qEdVlF8edwCSo8696H6wjgxflTo
         Khtho0WDHDCr03j4xT47Nfzy0YZkqbvwJpXS3I2gSDeTYHWu8OYzo31IBvLcbW0VNLIM
         XOp8ZaRYbCUmTXNxH7tqPChW54JSmH1MXe96y6aA7BwwiD8OI+bOty/7S1tw4b+BygtQ
         oi2kGPd1iiJMdZqmf4MiJLGKH85Zlfi8OQODsmSTtSsDxOMo5wpEg6K4LRgEXopcOpKX
         XDwUzk6LeerX6u0zujSeKsAlpcQRCJ7SCiJBJYsr62+ERDrUL8P1C+BMaxaE9Wg/XLPp
         yntQ==
X-Forwarded-Encrypted: i=1; AHgh+RrR8RO3qYlWZxPIVbNugZxcXrl+Ik/nRfHJ8GfJu3o/EhqPcDLb9pxNx/UW+G7/mEndNiA4MVcnCow=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYxYxpYA8iSDLsKVlK7nuje8R7SsswXM0ovZ+GLlCW6jC3oMHb
	N6o5b6eTF6lPd+sIsX2AdfeRPUfCzD/Fcm24raFxiGxhTF2g+34itxNN
X-Gm-Gg: AR+sD11+Bdagf0yPKNfNgRziOy/H4MNEeY0hn2WHx852DnKyaD2BkvN1HS6H48TmIvq
	PUR0/06rgLRTL+Tk0oxYDLRekyA0f/tWBo3NNO9juMJ+68vvCcVozEtzBOIlId0FU1cHgmwPKWe
	nwGpkPixGSA7e5DSib8wqV/ZXim5poklreRFtKbYgx93pa3eAI89NY3h3DLUNs98fqMujWd5jVY
	E4oqKUTFtxFidxIqOH3hh9EW7a1XAKeXd3iRgM19s60XpMIhmrrhBmca9HLKvR9DEWNS/s5EGtY
	WXTV06ZDki6Hy5r/qO3EXaFcPorssA/JScfwFNGSNc9zvudOyspE/czMooYDjmRV6OncPyhKoCY
	mJD41aXEbCJnENsrJQytvFs7SLel62tzgVrXOP5eKNotBFchZSa/amTsx+NQMpZ6ejGJE7qskZ/
	veTdydP0D/bCx8otlsLBuXkLmeEjYF9OAHRVs9La9t85oxCC51p2A+
X-Received: by 2002:a05:600c:e48a:b0:493:c337:db0e with SMTP id 5b1f17b1804b1-4980c69628fmr149527095e9.18.1785760446196;
        Mon, 03 Aug 2026 05:34:06 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b59a33sm228843055e9.1.2026.08.03.05.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 05:34:05 -0700 (PDT)
Date: Mon, 3 Aug 2026 13:35:15 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Frank Li <Frank.li@oss.nxp.com>, nuno.sa@analog.com, 
	dmaengine@vger.kernel.org, linux-iio@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH 1/9] dmaengine: Support bus widths of 32 bytes and above
Message-ID: <anCJ_mM_eygMn9ho@nsa>
References: <20260730-dmaengine-support-wider-dma-masks-v1-0-3732f1f9d9ca@analog.com>
 <20260730-dmaengine-support-wider-dma-masks-v1-1-3732f1f9d9ca@analog.com>
 <amujDsVXJQ8gaCvw@SMW015318>
 <20260801034222.45d4d479@jic23-huawei>
 <20260801034617.5dab3286@jic23-huawei>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260801034617.5dab3286@jic23-huawei>

On Sat, Aug 01, 2026 at 03:46:17AM +0100, Jonathan Cameron wrote:
> On Sat, 1 Aug 2026 03:42:22 +0100
> Jonathan Cameron <jic23@kernel.org> wrote:
> 
> > On Thu, 30 Jul 2026 14:16:30 -0500
> > Frank Li <Frank.li@oss.nxp.com> wrote:
> > 
> > > On Thu, Jul 30, 2026 at 03:23:08PM +0100, Nuno Sá via B4 Relay wrote:  
> > > > [You don't often get email from devnull+nuno.sa.analog.com@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > > >
> > > > From: Nuno Sá <nuno.sa@analog.com>
> > > >
> > > > The src_addr_widths and dst_addr_widths capability masks encode each
> > > > supported width as a bit whose position equals the corresponding
> > > > enum dma_slave_buswidth value (e.g. DMA_SLAVE_BUSWIDTH_4_BYTES sets bit
> > > > 4). As these masks are plain u32, widths of 32 bytes and above
> > > > (DMA_SLAVE_BUSWIDTH_32/64/128_BYTES map to bits 32, 64 and 128) cannot
> > > > be represented at all.
> > > >
> > > > Introduce bitmap-based bus width capabilities that span the full enum
> > > > range. To allow DMA controller producers to be converted incrementally,
> > > > keep the legacy dma_device u32 fields alongside the new bitmaps:
> > > > producers using the new helpers populate the bitmap and mirror the low
> > > > 32 bits back into the legacy field, while dma_get_slave_caps() folds a
> > > > legacy-only producer's u32 into the returned bitmap.
> > > >
> > > > Add helpers for producers and consumers so users do not need to depend
> > > > on the bitmap layout directly. Once the remaining producers are
> > > > converted, the legacy dma_device u32 fields can be dropped.
> > > >
> > > > Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> > > > ---    
> > > 
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>  
> > https://sashiko.dev/#/patchset/20260730-dmaengine-support-wider-dma-masks-v1-0-3732f1f9d9ca%40analog.com 
> > has a comment on this that smells plausible at least.
> > Looks like the stm32 driver modifies dst_bus_widths in it's device_caps()
> > callback.
> Reading on, you fix it later in series.
> 
> This is going to break bisection on that device, but not build
> so I guess maybe fair enough to do it in this sequence.

This is a bit tricky (with trying to keep things compatible throughout
the transition). But I think it should be fine because the current patch
keeps (or at least tries) the old addr_masks and even we then update the
stm controller we also act on both the new and old variables (so
consumers still work).

- Nuno Sá

> 
> J
> > 
> > Jonathan
> > 
> 
