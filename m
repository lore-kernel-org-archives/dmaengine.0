Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E3131714B
	for <dmaengine@vger.kernel.org>; Wed, 11 Mar 2026 08:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773216231; cv=none; b=eBkTCi8qs420yIkCfyBKD9mqYx1LtQTGUzS5beuJ9k8Qh0qm7Tp3vyGwNJlU4uFY9fkee7U8FAeo1G9suHT1QJ+Ssg777XLwIp11XNksYd6SYfJTY1PL+DgAa0W8sd7a2Po8yUaDKeI2lqP0wPnL1agFzzPak8s2KgsQayt2ENI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773216231; c=relaxed/simple;
	bh=rsre+xoqF4I8t3EjmEwHt5ty2n0tD2K+A5STG+RJ75I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PzzCnS3M/Y+Ak8efTdC+vUOQCWbIemjJF/ycHwVhA5WS1vbvnlZGHHXcUs9q7/usxMF5Fmw6qNDPBqkTrFeNKqomL2e9S1jOEx7+Nk4lrgncoSdhPTJrinLFKCRlUn/9QaS4U+1a47L5MAtichR0YTrQ52TxlZxbo5KPB2OWf6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KfGn8+3h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KfGn8+3h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE262C2BCB0
	for <dmaengine@vger.kernel.org>; Wed, 11 Mar 2026 08:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773216230;
	bh=rsre+xoqF4I8t3EjmEwHt5ty2n0tD2K+A5STG+RJ75I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KfGn8+3h4e+NMyMcPHyts0qH8oqHt+9fe7SodTbWjSMFtJMfxJGc5fAqgo7/gZ9Fu
	 TK6CGVYpw2V7Jn3Pk6Sr4T90twLsulLZusgTbQ8WHLqiQqNCG/q+E+lBlvaftngUjD
	 qzRacpn59BVVJOOyCqKl+2j8Yb+VDlVS150bL9AXasECFXcPa7gIIm5FhjOT8ew92L
	 nLliZhql25w3YTt9eGqZoiM/cRUgqgMRZUbiKnhpRnjxIqB9KKRQhsIDEvtHRPrgRC
	 XxTCD1T9kvH9no+l8uex8ICN8Bsmmfkewjd30/SeHhZM6Q2M5gW6DPWnQmtrn4JTUV
	 qBoPZL9pEX4hg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38a3066b68bso73857501fa.3
        for <dmaengine@vger.kernel.org>; Wed, 11 Mar 2026 01:03:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVv3tbM8fiDVfVX84zkLsaeEdn8Y2uq67gqQnNmFca30rPmB36n6ZFhAU//soj7662MQERNTGMRdQI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzoncv8MhWcc4djdvkW3qyMsEIhvqqd+p34y7qz+VjNeFCmTHd9
	P5WPuUBrTpFI077blcA+lCeEb/sLyIOEVMwPdtxT7n1OT25EVVtcxa3rCCRaqdbkcgvKB6E/Bm5
	cRD4dBSpC/xXQrXmj3793KvR5Ds/+hEr94C0fnhnbaw==
X-Received: by 2002:a2e:b8d1:0:b0:387:4ee2:1cbe with SMTP id
 38308e7fff4ca-38a67dc9220mr6423881fa.2.1773216229237; Wed, 11 Mar 2026
 01:03:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
In-Reply-To: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 11 Mar 2026 09:03:37 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdzjY2UJ3uSUgCabCLqWJcpaVq5eSx3-Ph-AZXcBf-JTw@mail.gmail.com>
X-Gm-Features: AaiRm52ABCAk0kCFZ61a8pO0V-WhkvSQun4HTuAkOrhvrkcmKuT442r4SF3useQ
Message-ID: <CAMRc=MdzjY2UJ3uSUgCabCLqWJcpaVq5eSx3-Ph-AZXcBf-JTw@mail.gmail.com>
Subject: Re: [PATCH v12 00/12] crypto/dmaengine: qce: introduce BAM locking
 and use DMA for register I/O
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Daniel Perez-Zoghbi <dperezzo@quicinc.com>, Md Sadre Alam <mdalam@qti.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 4:44=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> This iteration is built on top of the v11 RFC with remaining issues
> fixed and the mechanism for communicating the scratchpad address from
> clients to the BAM driver changed from slave config to descriptor
> metadata.
>
> However: during stress-testing I noticed that sometimes a transaction
> would end with an error. The engine was indicating that a write/read to
> the config registers was performed while the engine was busy (bit 17 of
> the STATUS register was set). It turns out that we must not just
> unconditionally append the UNLOCK descriptor to the "issued" queue, we
> must wait for the transaction to end before we queue it so this version
> takes this into account and queues the UNLOCK descriptor from the
> workqueue.
>
> With this all stress tests and benchmarks from cryptsetup work fine.
>

Mani, Stephan: sorry, I forgot to update the cover letter to Cc you.
Doing it now here.

Stephan: I tried to use READ command but it would crash on sm8650, so
I went with WRITE. :(

Bartosz
