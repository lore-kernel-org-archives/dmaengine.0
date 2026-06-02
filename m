Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B5936F917
	for <dmaengine@vger.kernel.org>; Tue,  2 Jun 2026 16:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780418320; cv=none; b=quXvJ/hnRPkUuINpB3yDLKUVoAUK4FI+gPUVWSsYThdynjCent6IFp6vkaVa4AQJN6WSeg3606viA109bFaUuW5RLW1V6Mq+UCplnHU/rJ91x1B+BA2BmJCm+ahOd2iX7w0GT/ZcVIet2rIgq6bX7dSCur8DUNv63YHKbbSECPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780418320; c=relaxed/simple;
	bh=SqqoX5qQzGE5eNHSgLyrNrWlqXnwPa/uOKYx/N6zAZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=deeaQWooMoyifU6zYFnBoaZgTuxuBbk9quFSXuyRJPJrbxCnzvYOkjUgOMhh9bAtU0GNERsC1iseBjqaxUqjVM8E5VqiHUi6Eh9dvgSaLRYzfau75oG05RZRL0SbtDG7+OYWjFjvXosjS76uLO3N8MyGZnX+C+OxR4P28ptWXgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dhp1RuoM; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dhp1RuoM"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b12270b3so7674135e9.1
        for <dmaengine@vger.kernel.org>; Tue, 02 Jun 2026 09:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780418318; x=1781023118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SqqoX5qQzGE5eNHSgLyrNrWlqXnwPa/uOKYx/N6zAZQ=;
        b=Dhp1RuoMIgkOz1tIgivCGlzcEfCM/F0TwNwrOlD30SOrPUP9X0pk1jKf45MVZXD2qB
         Y0U2Vh/tibUVKER8x1Wo8FLqPs+VhIPGR222R58rC2yCrEfGdyQvYBOE+pEfchOdbhkt
         pU0giNtPmGEguen+ViRMghJUGwIMgKi17GuJksCNJtyfUNChDz/NmidxQjstu3eUEQOs
         xrFrShXa3Na1mri/KdchGz82zqQrrsxTxWshTVVGcANc39kYo8SSegNQ/J3H84x6x7S4
         aphwriiQvgNf31lUKqNreRJvIPavKKUfsDPrxRkdD/3WnNff4c7FXxWQCPyX6HXerUQT
         PGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780418318; x=1781023118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SqqoX5qQzGE5eNHSgLyrNrWlqXnwPa/uOKYx/N6zAZQ=;
        b=JrsR68qsINsvXDUiCRuSY5S16R/irAGyRC9nng4KH2WSwj9enhyjKX5t22HcPZgHPE
         4RuVKGJKI/XZPxZ3YVGagJFleHmBZPgtERqCJRGV/BVXz3Ky2EXhBTbkX9X3O4Somi6s
         3Zt6Fe290jwoAGcBgki2kZUsrLhVRdTpQT9L/eJrVhp+NG201ll3XTRlDjzUYnI9wCP8
         Hdu5e1zoZEbPnsQvxwI6zIgd7hHYB89Vwm7936MSewwpx4ycOXydrNc0q42eYENaj+nf
         YZf9VXkmZD96lhLis8VOIHNqcit5vb5+mv5Kqhl/XTIsvvWIW/+HAeFF2m+lD95vUZJ5
         eBWw==
X-Forwarded-Encrypted: i=1; AFNElJ/XjjCHcA5mGss2F/cT4D3ktF1kxc33/9V6k8tfu6zVf1YcuAXMm2MMNmucDIAATTqxNZZjFIXTdgk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFXIFNeXfG68AuWNolnUkoot1WCtlLtEbTkk/5K2HfhtQq9ELs
	wASGM7d6tLu4vKki01noNnfGRcrQX2Ne9N46m0hwFC/Xi2v8e9BZAX7IstixuLL6Fts6rM6WTnm
	RZw526yE=
X-Gm-Gg: Acq92OET/YMmn5UFuGLGQG2etl9TsOPSfcjK19OlzdSSayYD0t3KWncDolHVniMw4R4
	dSFZtt9YEZgKHc4CvUi5UYU3P1Hd8nA4GXZlsp6Sr8dTwuvQhW1r2q6nhEre6BQk6WHYVbvEvkh
	VukPegKq1eE83B0YaimYlDyWG3Bmn8pcfSBRUy5u+5aLnP5lhVZxMgr0lVmOkfI6hdECC5dhdCv
	HPaFPZykmLfcDUDjiivgu3KmSlGOE7qaIyIV+gXIkViabm1vDOuMcgL5gApgn+ScPVZ2gZ19LIm
	TxZIljwgnoO9ZYXkgj4I1UMz2sdV59qaCd2r1W5YAbEEwBSDqxoUBIkY83VGFjJt4aVRGYpW51W
	svEWRJzGDGY8Lpmrhe/whoiMIdgUAjJiO50qDefZrAx32nex1FGqtWqFdc3kcqTzyfy7FcVmd13
	9bwjb1H5LunAL0yXuQqDXbEmncNwAFmVV2fsDqaY7sthjw1w==
X-Received: by 2002:a05:600c:608e:b0:48f:d1c0:5cd3 with SMTP id 5b1f17b1804b1-490b5065ee5mr8757815e9.13.1780418317804;
        Tue, 02 Jun 2026 09:38:37 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:9db1:6daa:c0a7:d3cf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm407269f8f.10.2026.06.02.09.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 09:38:37 -0700 (PDT)
Date: Tue, 2 Jun 2026 18:38:21 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Udit Tiwari <quic_utiwari@quicinc.com>,
	Md Sadre Alam <mdalam@qti.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
	Andy Gross <agross@codeaurora.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	brgl@kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v19 00/14] crypto/dmaengine: qce: introduce BAM locking
 and use DMA for register I/O
Message-ID: <ah8G_ajPS1KhgPP_@linaro.org>
References: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>

On Tue, May 26, 2026 at 03:10:48PM +0200, Bartosz Golaszewski wrote:
> I feel like I fell into the trap of trying to address pre-existing
> issues reported by sashiko and in the process provoking more reports so
> let this be the last iteration where I do this. Vinod can we get this
> queued for v7.2 now and iron out any previously existing problems in
> tree?

Thanks a lot for working on fixing all these issues!

I agree there is no point addressing all the "pre-existing issues"
pointed out by Sashiko, but have you looked through the other comments
for new issues pointed out for your patches?

Out of curiosity, I was looking a bit at the comments for [PATCH v19
06/14] dmaengine: qcom: bam_dma: add support for BAM locking [1]. There
are 8 open comments there (Critical: 1, High: 6 and Medium: 1). From a
quick look I would say most of these could be valid. The critical one
about the usage of dma_cookie_assign() sounds a bit concerning to me, if
it is true we would be basically breaking parts of the dmaengine API for
consumers by inserting the lock descriptor in front of everything else.

[1]: https://sashiko.dev/#/patchset/20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a%40oss.qualcomm.com?part=6

Thanks,
Stephan
