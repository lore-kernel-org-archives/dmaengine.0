Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DDB37189C
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 08:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784796258; cv=none; b=PysK6dwnBV21PhMYwWs8Am3lSMHtF1GYhhcx4B2/kDTpe6Fv4vZxYiZxIqcllxpqljuRm6RrWvn8zoORxpnLd+r+oflD/T55vCpKl7jF7WkYsPuadTU/PyspxTjIkKHWMZpkBPJizP0BV0aonkQ2J+UtaH1kI1BKgqECbK8UtHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784796258; c=relaxed/simple;
	bh=j2EBRvjl4THMhyqlpfuX6DTQgfmPpqpfKHZum4qGV80=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=erTMuv0zH6yp1hWkwc6M1wZ8Y9rXnmqpREgKtfiw8gWDYDk1YHBR1BPv9ROR6dgtHNbLv3v/gMSLqKiZ7Nc6OhWDh6BFxe61+Cq3Hx3cS0FXCiffN/hzB8n3stfebXWldqTfLDcwKRBAyjY1D8guHXDsCg04BSJYpuEEnv9+KN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AF2H0Ivx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AF2H0Ivx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C0321F00A3D
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 08:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784796254;
	bh=j2EBRvjl4THMhyqlpfuX6DTQgfmPpqpfKHZum4qGV80=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=AF2H0Ivxkn/L+1ybDUv7MML9W8QcujyElf5e09Llo5YxQnfu0FoCb4rraYIwSyDc0
	 6hAu+dnmkpUdotPlZZOSTDSqKzcBNXcC2XIO2yIgM7AY5CxgHlIHocSq6g8HG++9pB
	 CPIFVh5yWFVkD2B7kmcEEHexB66hXrb/YY5UH8GbvdUpbJ808i/E4J4eth7FhmyRCC
	 y0pJA6iayLWo1+s/q9goJvyQIqNIvLbGgFBvoMnH+em4qvTH4STv32eYposTC0W3Xx
	 keUGtzAPyjXYiGAUYkS09WK4pj6KL4UCjiETehDL5poDC2+GfrmbZIltkjxcCtBmjM
	 y++nxkZeL+W5w==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39db07589caso2745161fa.2
        for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 01:44:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro5mY+gb3jbgyJqfJKomF19XVbqOrDK27ScD/s4HZjBwicIBaK/kIi6+iexX2yWBi+auadgAuszWx8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4B/HYi1kLGnhKcjv0+KS8nmIvei86xxwCoiIkDwiA7VpS7pXg
	VXKUNLusWuVKNw/tuHXDv28zByv0PWHnTlaWQlAMbvBtwQTBBqZTV5a00bO+JSVSu3y4J81SAA+
	Z4hSMcJbFVceWJErwHu4fZ0pChSV2dXFPeu+zP8i0iw==
X-Received: by 2002:a2e:b8d5:0:b0:39c:8124:93b3 with SMTP id
 38308e7fff4ca-39f07bcfce0mr4681721fa.9.1784796246084; Thu, 23 Jul 2026
 01:44:06 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Jul 2026 01:44:04 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Jul 2026 01:44:04 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <amDuqoRBg5qGafi2@linaro.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-6-1be02deffda9@oss.qualcomm.com>
 <20260721134853.2B2401F000E9@smtp.kernel.org> <amCGXUUd4VmuQRGD@linaro.org>
 <CAMRc=MfBNB0pvv1kPPcswE4Y2m7PXBO49bwJg=v0+aY=JmJKWw@mail.gmail.com>
 <amC7_M-HjVZ3sQuT@linaro.org> <CAMRc=MdnSyPmbK0skMx686=wSe52nnuWgCNJ0uSoKs_=HyAq-Q@mail.gmail.com>
 <amDRxPkdvbA-iVer@linaro.org> <CAMRc=Me523xQbfJvML9taJ-fR128SJurJS4eX9N9E9WtHF5W5Q@mail.gmail.com>
 <amDuqoRBg5qGafi2@linaro.org>
Date: Thu, 23 Jul 2026 01:44:04 -0700
X-Gmail-Original-Message-ID: <CAMRc=McJBVkCT+rFToY-Sn+nrLy-Sb8otz1NYWkQj1J-4-RK-A@mail.gmail.com>
X-Gm-Features: AUfX_mwJQKKrlt_uOHiEXNJho9ROwjpR_PSftHZZM5GhDPu9qwbx9QpVEO72mS0
Message-ID: <CAMRc=McJBVkCT+rFToY-Sn+nrLy-Sb8otz1NYWkQj1J-4-RK-A@mail.gmail.com>
Subject: Re: [PATCH v23 06/14] dmaengine: qcom: bam_dma: add support for BAM locking
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Md Sadre Alam <mdalam@qti.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	sashiko-reviews@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Jul 2026 18:24:10 +0200, Stephan Gerhold
<stephan.gerhold@linaro.org> said:
>
> FWIW, I couldn't stop myself trying to finish my "write lock descriptors
> directly into FIFO" idea, once I started I was curious how it would turn
> out. I think it's actually quite elegant, the loop in bam_start_dma() is
> wrapped with LOCK and UNLOCK, later process_channel_irqs() looks at the
> FIFO again and just skips over these descriptors. lock_ce is allocated
> once at channel creation time, no other allocations are needed. (Could
> probably move lock_ce allocation to slave_config() so it's allocated
> only when locking is configured for a channel).
>
> See diff below. It doesn't crash badly in a quick test, but didn't check
> in detail if the locking is actually working correctly. :')
>
> I'm okay with whatever is "free of known races" and works with the use
> cases we have, so use/adapt whatever you like best.
>
> If you want to use this, feel free to add
> Co-developed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
>
> Good luck! :D
>

Oh, neat! Thanks, I may use some of that. And that makes you have a stake in
this series now. :)

Bartosz
