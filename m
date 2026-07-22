Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFFD35A397
	for <dmaengine@vger.kernel.org>; Wed, 22 Jul 2026 14:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784730062; cv=none; b=nuAc3QSF+2AwvgkpTt2Ic2NfDmysMqJK2kO/Qe2xU3WDauS6FxoleTl5583zxRjMnfrV5eXmCVTGkzYxCuieoOjCr1j/lWm4B2xu+ljWos6C34b3iusNwFw2uUPNM+0Cupmh5gOy8isIhEc5NHF0F36FfvSKSQOSriOfmb742+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784730062; c=relaxed/simple;
	bh=+fF7dWQHSuRuzFljxnSNaUBElzuZYXaOYUHtcv1srZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TlchbMIjjCKTBQR6y8TDCbsT0ffsy/uGIhLJAjSu6k8s41Z1fZCNC5iMK2QAin4o15g2w7pzm5LII8+j1vlk/Aw/h6/Wxx+ZDeHZMk1i0FaDhJbrriuSs/JeqgcPlSe9+fr6W8xt9AmSUjYf+PIuExuqFH+F60ON+X8CPDbI2DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MqUVjYnN; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MqUVjYnN"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-495590dde14so36664025e9.0
        for <dmaengine@vger.kernel.org>; Wed, 22 Jul 2026 07:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784730058; x=1785334858; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v1zNXC882j0BCwBxeji6HC1ZHjIGfjhbbSn9tIs8/0s=;
        b=MqUVjYnNHgjYx/DzQuwmlu1GBC1dk56cCPbhvAGDJSqvAwb6CbAWq1KolHgW+LAL8i
         PMXAaZ4dZN88XF8kHZEZDpnB9+7eXXjIJcoeTKbE0ZGGDm/uDNuB0bWr99sBlhM/070t
         euGFjp5OTLZ0dBKXkcVSNSilvxkwh6+Jiv4F5X1RjS/9EGDs3kzmGAinMoEXeQMyc+bU
         D6e1Y5IMvZUhYIdNZ9QnZwEQDmp3uNXIAegzoDc+ym3pBnJKQ77hGGaOZhtDbMeRsfuE
         M7FDL22IjjP8k2PCtwbtJEcUMgW/fSgEfxTMUo/pE6z4Q7LNbc5vLgYXSZ8vEho1P3/W
         x3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784730058; x=1785334858;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1zNXC882j0BCwBxeji6HC1ZHjIGfjhbbSn9tIs8/0s=;
        b=QYyNOBXaYVQ+7A5mwEqSonIafUOI7YIjBRdhTsaPJi6+2WSn1wfXSpRb8fdLi/GK+/
         5uX4f38MRCOfUO4lWtPblt7dF8cnaTA0Xry+CCVmWwI0WmQB1iOvmDAb+sLqAo0hClJ4
         ibVc/jwhZJR4CJ0mnYtzufAnc93jDkFEcP9s5lalf14ejfxmYdoWzSAF8zy9gCI/R+X/
         J7uTIMxFYdPFL75lpVgHDl1pc7sO+laBwObdwlK9FldyGOMauYLVFIT92pLK2YRkZH/q
         WH9eJLUiqlawQbB6hqlwDq4cTF3GMhWG4/nvtWQfcAp0idLemI6/6lmcdRn/f3fgVgnN
         YQRw==
X-Forwarded-Encrypted: i=1; AHgh+Rqi2yNbwuPps5LE3mSG3LKuFbFeNX+tnQgpy5kdmHgOP7fM5aVHPN8dJAPiMtXIMc2fc6fBXTjjGFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIfQ0eGYMy/8Uh7HwAKfNc2vYh6M0fP0jDaT4Me0YybkmmiE+J
	SR6ihaYIeWeNiP7On1QpH37qc2F3qtd+5+g5vMNTd+QU9K44dCg4A0mCo5zOp/Wadg8=
X-Gm-Gg: AR+sD10pb14BJzz+l2wc66zNPBPdoTBUN4RMnrhp2uM7TIL4i0I96/xyMqmlgmvL1Rh
	mOJbBd0nIHVklU5KxwqKd6mJaO+XnNX1cyb0x7/4uhCO2ILxAc8zL8U8/SsR3wOXbjHrpX48MP6
	2C9klw5UhoNJji2CK2HKfy3rWoFJW9cm4s5A8mF8NGN2uTMrFcX9fTn7r0FxS2B97y1A91ocbPo
	z1H4wuvs7ZB83arV57hoCKoepbc2EMUwv6R+yzjyag4zSaZ7n30MJRfSK8x+Scs1MWKf8bBuSzp
	PFoidshOKZi8XyejaOFtkMy2FjXSeFGmW9aSQWjgPegwCQb+phker702Xi8Y10uT7Oq4GdfLKNm
	FvY6ZUgGRAjn1Q8pleLcDdtlSKwv8l6Mtq+Xjd3/qgV5FjS4nP8ksfVa5ismWhMEXOUW8iA5mKT
	7P0M+jUEi7Qul1SGXIXxNw+Gc=
X-Received: by 2002:a05:600c:3b01:b0:495:4fd4:144b with SMTP id 5b1f17b1804b1-4954fd419e8mr224754385e9.21.1784730058312;
        Wed, 22 Jul 2026 07:20:58 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:7ae3:a857:e482:495])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956d475e24sm40717585e9.0.2026.07.22.07.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:20:57 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:20:52 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Udit Tiwari <quic_utiwari@quicinc.com>,
	Md Sadre Alam <mdalam@qti.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>, dmaengine@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	sashiko-reviews@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v23 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
Message-ID: <amDRxPkdvbA-iVer@linaro.org>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-6-1be02deffda9@oss.qualcomm.com>
 <20260721134853.2B2401F000E9@smtp.kernel.org>
 <amCGXUUd4VmuQRGD@linaro.org>
 <CAMRc=MfBNB0pvv1kPPcswE4Y2m7PXBO49bwJg=v0+aY=JmJKWw@mail.gmail.com>
 <amC7_M-HjVZ3sQuT@linaro.org>
 <CAMRc=MdnSyPmbK0skMx686=wSe52nnuWgCNJ0uSoKs_=HyAq-Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdnSyPmbK0skMx686=wSe52nnuWgCNJ0uSoKs_=HyAq-Q@mail.gmail.com>

On Wed, Jul 22, 2026 at 07:11:10AM -0700, Bartosz Golaszewski wrote:
> On Wed, 22 Jul 2026 14:47:56 +0200, Stephan Gerhold
> <stephan.gerhold@linaro.org> said:
> > On Wed, Jul 22, 2026 at 02:34:52AM -0700, Bartosz Golaszewski wrote:
> >> On Wed, 22 Jul 2026 10:59:09 +0200, Stephan Gerhold
> >> <stephan.gerhold@linaro.org> said:
> >> > On Tue, Jul 21, 2026 at 01:48:52PM +0000, sashiko-bot@kernel.org wrote:
> >> >> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> >> >> - [High] State leak causing hardware misconfiguration on channel reuse due to uncleared `lock_scratchpad_addr` and hardcoded direction.
> >> >> - [High] Channel state corruption when `bam_slave_config` fails validation.
> >> >> - [High] Infinite BH workqueue loop and unratelimited log flood on memory allocation failure.
> >> >> - [High] DMA API violation: `lock_ce` buffer shares a cacheline with frequently CPU-modified struct members.
> >> >> - [Low] Unused assignment of `hdesc` in IRQ handler.
> >> >> --
> >> >>
> >> >> --- Patch [6]: [PATCH v23 06/14] dmaengine: qcom: bam_dma: add support for BAM locking ---
> >> >> commit 8b44c5e4935cbb61832adb3262df00b3b606a283
> >> >> Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >> >>
> >> >> dmaengine: qcom: bam_dma: add support for BAM locking
> >> >>
> >> >> This commit adds support for BAM pipe locking by prepending and appending
> >> >> dummy command descriptors with LOCK/UNLOCK bits when starting DMA on a TX
> >> >> channel. It uses a peripheral-local scratchpad address communicated via slave
> >> >> config for the dummy writes.
> >> >>
> >> >> > diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> >> >> > index f3e713a5259c2..411c60c4433e2 100644
> >> >> > --- a/drivers/dma/qcom/bam_dma.c
> >> >> > +++ b/drivers/dma/qcom/bam_dma.c
> >> [...]
> >> >> [ ... ]
> >> >> > @@ -1064,6 +1197,7 @@ static void bam_start_dma(struct bam_chan *bchan)
> >> >> >
> >> >> >  	lockdep_assert_held(&bchan->vc.lock);
> >> >> >
> >> >> > +	vd = vchan_next_desc(&bchan->vc);
> >> >> >  	if (!vd)
> >> >> >  		return;
> >> >> >
> >> >> > @@ -1072,6 +1206,24 @@ static void bam_start_dma(struct bam_chan *bchan)
> >> >> >  		return;
> >> >> >
> >> >> >  	while (vd && !IS_BUSY(bchan)) {
> >> >> > +		/*
> >> >> > +		 * Open a LOCK/UNLOCK bracket around each fresh sequence.
> >> >> > +		 * Sentinels inserted by bam_setup_pipe_lock() are skipped: they
> >> >> > +		 * already have bam_locked set and must not trigger a second pair.
> >> >> > +		 */
> >> >> > +		if (!bchan->bam_locked) {
> >> >> > +			ret = bam_setup_pipe_lock(bchan);
> >> >> > +			if (ret) {
> >> >> > +				dev_err_ratelimited(bdev->dev,
> >> >> > +					"failed to setup the pipe lock, deferring transfer: %d\n",
> >> >> > +					ret);
> >> >> > +				queue_work(system_bh_highpri_wq, &bdev->work);
> >> >> > +				break;
> >> >> > +			}
> >> >>
> >> >> [Severity: High]
> >> >> Does requeuing to a high-priority BH workqueue upon ENOMEM cause CPU
> >> >> starvation? Because system_bh_highpri_wq executes in softirq context,
> >> >> requeuing immediately without sleeping prevents the memory reclaim needed
> >> >> to resolve the GFP_NOWAIT failure, leading to an infinite spin loop.
> >> >>
> >> >
> >> > It looks like my suggestion to queue_work() again in the error path of
> >> > bam_start_dma() wasn't great if we end up causing an infinite spin loop.
> >> > We do need to retry somehow or report an error though, I don't think
> >> > aborting and leaving the desccriptors completely unhandled is an option
> >> > either... :(
> >> >
> >> > One option would be to try to avoid the allocation and write the lock
> >> > descriptors directly into the FIFO, but this will probably get really
> >> > messy as well, since you would need to carefully modify the FIFO
> >> > management in several functions ...
> >> >
> >> > I don't have a good spontaenous idea how to solve this right now. :/
> >> >
> >>
> >> Pre-allocate the lock descriptors (if needed) in bam_prep_slave_sg()? As in:
> >> call bam_make_lock_desc() in bam_prep_slave_sg(), store the descriptors and
> >> make bam_setup_pipe_lock() return void as it will no longer be possible for it
> >> to fail? It would just grab the preallocated descriptors.
> >>
> >
> > I considered suggesting this, but how do you know which descriptor needs
> > it in bam_prep_slave_sg()? It's just the allocation, afaict it doesn't
> > tell you anything about the order in which they will be submitted. :/
> >
> > We could always allocate the extra lock descriptors and waste the extra
> > memory for the descriptors that won't need it. That should work, but is
> > also not great ...
> >
> 
> Oh, I was thinking about having pointers to lock/unlock descriptors in struct
> bam_chan and to just grab them in bam_setup_pipe_lock() when needed and then
> next time we enter bam_slave_prep_sg(), we see we consumed them so let's
> re-allocate them. And of course: don't do it at all if pipe locking is not
> supported.
> 

Sadly, I think(?) from the API perspective it is valid to
dmaengine_prep_slave_*() a couple of buffers and them issue them
separately, e.g.:

	desc1= dmaengine_prep_slave_*();
	desc2 = dmaengine_prep_slave_*();

	dmaengine_submit(desc1);
	dma_async_issue_pending(chan);

	// do a bunch of other random stuff
	// bam_setup_pipe_lock() consumes lock descriptors

	dmaengine_submit(desc2);
	dma_async_issue_pending(chan);

In this situation, we wouldn't have any lock descriptors allocated
anymore?

Thanks,
Stephan
