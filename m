Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DE83ACEF1
	for <dmaengine@vger.kernel.org>; Tue,  4 Aug 2026 03:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785814086; cv=pass; b=DHNADeeYRo4sLBxeqEJIq2DtB50cEvImEEIxZ9SIN8DDExYgTAu2bRYOS6WI9lSZXYGuRCsrSFudjep7oLSDQzIj9+IIg0Fp931DxTfT4xZpnGpob/Sh6JR44QHbx9OIISMlDNFO0iLHpl3v2j2xYxc41o7L/X/zqmhnI8Qu4yE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785814086; c=relaxed/simple;
	bh=LMjlntpRXWgbndw4SaIeQ0QpxZvDK1DUyZIVUGtVSxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oVzXpeRoVknZSMVIRSYQhEJ/S7yHuDBXTEZxfscHqlDhf5dZjugAo2H6F7Tb9HkSq2yvPisUHtptVqGBLJkBVVzczp6dUCSoxinBjjP7u4QwlNstJ8F8HMtraxU+vgFLOTHvi76q+4/RfKyv44R9yIBvcc5Ec18/Vt4OOV7IgAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hjRO2L82; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjRO2L82"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cedda2ce6fso34248465ad.1
        for <dmaengine@vger.kernel.org>; Mon, 03 Aug 2026 20:28:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785814082; cv=none;
        d=google.com; s=arc-20260327;
        b=n5DJALuVnzETN2/9svIELQuTs4CkXCT2iTft8ThyI1BU5WEaPEglv55TcG72HehEjG
         Cmd+4nbr68oBxM8Uqa0j5varztPhWjZkOhS/IwLApQtFVsWmtKbUlqkm9VVms9U1G7pi
         fJIWJ2bj7QWGod7qNPJSvHR0lwqM7htQGXE6e9CR8EIRo2j+PpU4UncPFK+yVCYVLoiw
         qYt3fZ82mMe/kfKVmnyWm/M+zdlFhNbAZ66ADJYAuT8KisgUR+DTZZosh62Rh3grK6G8
         IPqSB+0UhZXlK+3c54P+peR4ChQ2aK+Z9hOBBPyPXktRoHDMMmvfRq+nPdkcKJnaobta
         mnyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W8TSau4BYxe4oeRUX1ulmlLoiQ4HhykvR4f60TrgSfA=;
        fh=hi/znqynqTgyG+IHvadH9LQuz2yj5M15vL8GegyL7YQ=;
        b=nUfXESqYuo5BL8X0Lm5zf2mHKH/ahmka1o4W4u4qI12TtoDYUR2gzZl5zACrUeyWw6
         GxeF2bGZdU9SKNNE5j2GJqdmuYG+nD/BXUP/KzOzjWESn6oI3Me4t4RiH1sbqCaFnq6n
         dBPAX9IqGnv4+CheIAyN0jOM3353IXkkydSmx6q5ngzmg5Ob6X66puXRxUOnvAxwN+zD
         1r+Zax6iwWIu6UJXqDKSm+E72VN5VnPChhFI7qT5QE0CVdoVfwypR5Qq6OVsc2VdFPC5
         KGsUO9sl8w73RsccIU82M97M/+e7Axh/nddWfVclc+rE0VQrgria9QuVTY6PZ7WeJZG+
         G/YA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785814082; x=1786418882; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W8TSau4BYxe4oeRUX1ulmlLoiQ4HhykvR4f60TrgSfA=;
        b=hjRO2L82EjK/UTvk+OHyMdhaQ0QisMJpLlnMlHc2aVWFoFIQgSxG1OprtEnc+Ljvmy
         CL3aCHRG/Zfz/qn8RE1m1AIU5RiS3nbSWnvi2MD6/aDFY24it7hXF4jxz0o1ObnqpBOX
         s7eiDejOi6dHgJvXb71UJtrPHgyrynEGrFuppuK8f3JeddOfxxtl1UTSv3xRawxxIi1s
         e2Egqt3htLGIyJWY4ixHOp2U6cELcd1Df3xV8rYtiq8BzCzxESZo+I5r2WXSjserMj/4
         XeYrWcfnbBhxPR1r7DnusGgu63bWoWil4lkYDr52CASB2Q159NQ/lRLPVUMbbJSA2dzL
         EObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785814082; x=1786418882;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W8TSau4BYxe4oeRUX1ulmlLoiQ4HhykvR4f60TrgSfA=;
        b=axVuebPfmnYF5zTuKvanDZAQ2BZgepcf2EYmCCiszpbEW1+ja8xqVgpx+Wt6Lk4BOC
         VMdugHdB4ymDCiehV/b7x+KlciwaqxN8U12vqVlaGRtoVSHSkTnxoN8FzfqoQ0MwZzhc
         hqYflQEj4QRwcMH0PKEQc959TsUGdRDi0A06qEooZxSRbfyvWI3Li5bU9315c7fnnDSE
         Vq/PFRkMBS4EbPDDvZkvaTC4J6sthSezz4azNn9TecUqiaT+UNeeuN4rqYuKkDwD3K5F
         UurwbMx7D0UAZ3npeJpYpq08O2tbgClWsPRkmccOCwB26RbJvpTiLZya61+IvZy5jldO
         fPYQ==
X-Forwarded-Encrypted: i=1; AHgh+RpF5GtfjgFlVG9HHzQ77GJDtdjvBhhpwdDXxoKEucQWtf3FrsBxAFnoFtHwrQz8l0xOS8kjp84+NNU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6JIlem5dmbpqjQ66fNS7xy0gkEyrBeF4E4qxK+VgEkrI3UiRa
	eyYLsxJ7jN/l/+CcTWI6iiNLoEgiBcYWZV18kNhZtItBQQ/1qYzah08toCCDe4K43plsW1CAmM6
	2kVsOVDawIRNo1anTSy+Eue3AoxKYk6Q=
X-Gm-Gg: AR+sD10B362bfhVgPeWKgd2uvx9pcqhzvRtxK90FM0RQDUYXddHwI+s008uSt7TWQ74
	T0sCGl6IzvKnN3NT1zpT/z+BdbxgqYayGEubn8j9Du1XSa9jT+9fODd+IsxM8vTMH6kxCa7Heey
	WjXgrv4VpHXqjcmXYLpY9LF8wO0i90nrqPsm6lkge66I7FmOgZj+dcs7PyePgdqDU6t9yyBIFKV
	HPqebwaNNqCWrRWFRnnaCEYTfavAupP2lQai6sMHPcrwCFhs5nZkXFqMthScOo5mYyzhS7ZldaL
	rU15YaQnJpb2bD9FrdURBKcWFsLVYIFmZ79UPaNdpY4vUSgej/4HgBhBrpP5+AF3sW5+wphqTQy
	s2w==
X-Received: by 2002:a05:6a21:7a4c:b0:3c3:834e:89bc with SMTP id
 adf61e73a8af0-3c92a864c8emr12428683637.50.1785814082311; Mon, 03 Aug 2026
 20:28:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com> <1ffd627be7ac24478efb82f52acbdc80c46ee2e5.1785183549.git.allen.lkml@gmail.com>
 <amn2iBN8NoBvZHzT@vaman>
In-Reply-To: <amn2iBN8NoBvZHzT@vaman>
From: Allen <allen.lkml@gmail.com>
Date: Mon, 3 Aug 2026 20:32:02 -0700
X-Gm-Features: AUfX_mycXmcvyvEVhqOvx0hDOviV7rEqU8FkGy2OsjVXPue4JOw4ukJ7oPh0HDY
Message-ID: <CAOMdWSKEXhHOcL4yWFEzFHxxcH8E1MCYKTS_vHQMzhdUTAFxNg@mail.gmail.com>
Subject: Re: [PATCH v2 01/64] dmaengine: add tasklet-backed channel BH helpers
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

>
> >  void dma_release_channel(struct dma_chan *chan);
> >  int dma_get_slave_caps(struct dma_chan *chan, struct dma_slave_caps *caps);
> > +void dma_chan_init_bh(struct dma_chan *chan, dma_chan_bh_work_fn fn);
> > +bool dma_chan_schedule_bh(struct dma_chan *chan);
> > +void dma_chan_kill_bh(struct dma_chan *chan);
>
> Can you please name these as dmaengine_xxx. Yes we have mix of these
> two, but I would like to see new ones move to dmaengine_xx and then
> progressively drop dma_ everywhere
>

Thanks, Vinod.

  I will rename the new helpers to dmaengine_* in v3.

  I also see that patch 1 removes the virt-dma tasklet before all of its
  direct users are converted, leaving the intermediate tree unbuildable and
  breaking bisectability. I will fold those call-site conversions into patch
  1. The patches that contain only those conversions will then become empty,
  which will shorten the series considerably.

  Regards,
  Allen


> --
> ~Vinod
