Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97E132B104
	for <dmaengine@vger.kernel.org>; Sun, 16 Aug 2026 05:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786856905; cv=none; b=jPl/mf5THEEaI9OUMOtG2/t6nFmDdc/LltBRWgt2WpmgguLf/7pDHnFgpUY/HgY6zqG57w3/oxf/27N2rmh6TLwP5I0pOWX7JGie9T9x63DZtdX3iTnpvI8arhk1XGA5JJlkzTVHEHQGeu1QVdAkJ8nOug8apmYQHgTm0q6wRjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786856905; c=relaxed/simple;
	bh=K1+6ZfM3X7b1ZXo4/aHurUoKhIdCkiaITB6aDZA59gM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=F/jDwAn3XVylWWZbyrR2lxD+3FPR43tKcYctZcwschupvxl8jw8CtVbo83m3AsKHuhujEXf/0os+cLVGFIYv6CLbAFTFFe0F43MR98sHj9RFnxoYxJaicQjRe7KyLhIB2/M4nE8Tn9nmAkfj7QF3wKHcL4jKJRkDWtMeD7DLJIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MwOOpWC0; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MwOOpWC0"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso3721299a12.0
        for <dmaengine@vger.kernel.org>; Sat, 15 Aug 2026 22:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786856902; x=1787461702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S3EGv/bCwZGVn5e0LnVQX15hxgKZ01RYRO4qrI6Efvk=;
        b=MwOOpWC0Go75EC4WJgPeqetZgu0/tHAyJuIzkOdMuHbfqsxP994NGYsfPclztgOTZn
         vvbyOoxudHpsxlVb3KvrFW2EIRp5Mxwop11xz1rkC3gTexh/78UY8k+XDn+z2bMHQIHg
         pVXGyf9qrgtO4/pQfQmYXzmpnxqPy4N7hVtKWTzksuEz9gKAJWTbYocXK7qTxNfrrSEx
         IZIlFPLMG9WMDTkrsN4Xqj8YVllJ36/8rZW7Ords0NT7r6VZQ44+gqaZH4cW+KA2J+tB
         /U60rGFR87Mbs4VeNINetfxHXRPZWnwlu+aXKnUo66cfbs5JYHEHdG1lDeMrZh/VJvA4
         ML6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786856902; x=1787461702;
        h=content-transfer-encoding:content-type:mime-version:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S3EGv/bCwZGVn5e0LnVQX15hxgKZ01RYRO4qrI6Efvk=;
        b=k7zIXzVfy6kpk92qSpr/X6fzr3q6BxeiXKLRKitEdKeg5l1gRpvtzkMCFi1vns3A+5
         CIt4l2kR17JwEhsdCe9+fe8COYFOT4mtOzLG+XaBh6XiGbapOfbR+/EYk4FZSeFAdtWQ
         f9N6XknCr9myJngdsRUHf3td6HF7KBS7tQSsE/AYzAExypll2AEb3IA4umQKSQjEea8h
         1fknW/zU1as5Qo0uJv9Yr3w+tYORJR1oeoFmWH2higdMPAaHpSFe1vZOwW5beH1B8AkK
         RfDxPnqZF6ejdoLY2QZOY+HaCQgcPgt/UOkdaZPm16unVl+adagXzf9dK3E+4z+VYJdK
         Ai2A==
X-Forwarded-Encrypted: i=1; AHgh+Ro9lgPhxG8opz5SZpEmjbZDs1D0Udtl55UKcdi3jsyHcBa2Hgy5G2Wu0O0NKst0PAHTCLChH44Z45E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUnp80S8PpmmZH02ySYOvqylx72SAucTrX+AXBRP1qc3Y1OtWj
	mTwHA0uazQflib42GGWBhZcfGrSp2R9YTWC9Ljfdsin6SADvR/75eh0S
X-Gm-Gg: AR+sD13TZTzhEXVa2m37ArIsqnPaWirxfB8JjF9PM9kwgSypNXWvKl3BYuMqF2C0iDN
	a87P2U+e/Nu+YNoqSPmYiHdgcBApLSgPXu+W287b5oanaO1xHixbGy5748yVkMopxb/DsmcIQKn
	n9Xs3m5noQMRGXYjH1UkzP5QWTCWQcxbCfML5o0ImMy31dqVbFQ1/xUcM+fz99npfAJnCoLzZQ+
	WotXj7m3wq44IoG1x+clChuFoorlF/v8JCUmBxTcGG07DngwK09vqW6OaG3TJp+P2XhfWgzpTfu
	8ctRZsCsxuJUq9vvELJpW+q6SV79wRMm3+DhJxFXI/zj7JVfobrDmjQAQubz3M1PFVVXsuKIybV
	AMQB8RF1/2kjbZCrPaqa+y81Da06Uli2DSvhVysTfh0XTX2uBRhibpVJx2LgtosMl3jRT6/4UVL
	3TIICVMrjZJLZvhGOdXUAOQRrUjTTkSYZRakxpPbNxHVnQ9Drm6fS+dy9S1YLx6RS4CCo=
X-Received: by 2002:a17:907:ea93:b0:c20:f871:1018 with SMTP id a640c23a62f3a-c212a127aebmr838653266b.21.1786856901726;
        Sat, 15 Aug 2026 22:08:21 -0700 (PDT)
Received: from foxbook (bfg7.neoplus.adsl.tpnet.pl. [83.28.44.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21238700aesm296472666b.63.2026.08.15.22.08.18
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 15 Aug 2026 22:08:20 -0700 (PDT)
Date: Sun, 16 Aug 2026 07:10:44 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: frank.li@nxp.com
Cc: corbet@lwn.net, dmaengine@vger.kernel.org, hch@infradead.org,
 imx@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 lizhijian@fujitsu.com, mst@redhat.com, rdunlap@infradead.org
Subject: Re: [PATCH v2 1/1] docs: dma: correct dma_set_mask() sample code
Message-ID: <20260816071044.331a2c51.michal.pecio@gmail.com>
In-Reply-To: <20240401174159.642998-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

> There are bunch of codes in driver like
>
>        if (dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64)))
>                dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32))
>
> Actually it is wrong because if dma_set_mask_and_coherent(64) fails,
> dma_set_mask_and_coherent(32) will fail for the same reason.

I encountered similar driver code and found it similarly suspicious.
I arrived here searching for reasons to convince myself (and relevant
maintainers) that removing this is indeed the right thing to do.

But I have a few remaining questions and remarks.

> And dma_set_mask_and_coherent(64) never returns failure.

No realistic chance of the dev->dma_mask check (below) giving -EIO?

> According to the definition of dma_set_mask(), it indicates the width
> of address that device DMA can access. If it can access 64-bit
> address, it must access 32-bit address inherently. So only need set
> biggest address width.
>
> See below code fragment:
>
> dma_set_mask(mask)
> {
> 	mask = (dma_addr_t)mask;
> 
> 	if (!dev->dma_mask || !dma_supported(dev, mask))
> 		return -EIO;
> 
> 	arch_dma_set_mask(dev, mask);
> 	*dev->dma_mask = mask;
> 	return 0;
> }
>
> dma_supported() will call dma_direct_supported or iommux's
> dma_supported call back function.

Aapparently, it may also use some 'dma_map_ops' and there is a bunch
of those spread over drivers/ and arch/. But I gather they are expected
to behave similarly as the functions named above?

> --- a/Documentation/core-api/dma-api-howto.rst
> +++ b/Documentation/core-api/dma-api-howto.rst
>
> +The standard 64-bit addressing device would do something like this::
> +
> +	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64))
> +
> +dma_set_mask_and_coherent() never return fail when DMA_BIT_MASK(64). Typical
> +error code like::
> +
> +	/* Wrong code */
> +	if (dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64)))
> +		dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32))
> +
> +dma_set_mask_and_coherent() will never return failure when bigger then 32.
> +So typical code like::
> +
> +	/* Recommended code */
> +	if (support_64bit)
> +		dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
> +	else
> +		dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
> +

This text is unclear. Two sentences begin with "Typical error code",
then some code is quoted, and the sentences are cut abruptly without
actually making any statement about the code in question.

Thanks,
Michal
