Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6B03328FA
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 08:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784275740; cv=none; b=lEMI3RGtttdkPndJIpw0E7A7RGXCK21Gg0BxRxvN5kUQrHJBR6hwtjl9vyw6kB0Pm+2duN6jD3TmKffJTyPj1DnOIsW+6eWejS0iX1bU9jSuSmpVTufJKk0Ob1jb6uB9KV3Y0sdRnilBHyTMHYMDVmVci1bC6zSwD8NksZWwl2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784275740; c=relaxed/simple;
	bh=Efk8T20ib1TU+anxk5s9h+6z/GBa9HbZ0owrpqerfYA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B5q/pE8rEtOSLV+kTiwSccOHmD/XUPmxBsU2XR/tCFCut2YcATugHPIlbJjWDPnFGSEH9uCJ5kruZLq6bLr8mj7gEexmwHv3jroAwdIjh3MvGGkZmjZTceC28OW7qKGxq5GbMjxJWk/Q1Xd1AtEpT6yjjrGbHa6uLv7tFHiwkQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SJMJFMal; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SJMJFMal"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C751E1F00A3F
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 08:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784275738;
	bh=dIadBkIMfc92d1GDfpRAdnJ2I4MVADdry9Rz78wXpcI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=SJMJFMal+Qz/rARkuCF+DZhrZzvT9aEH2zlfAfunhCtri3omP3VMqQcqXZArWx5dk
	 FQ4hrHxmR6iSCoIBL5QUbMaXVqRkGZDCMGjEv2toykAa201dMPjp6vVvRmLo2ouonT
	 PQBSXd3WZJCyYzEQOOmfDQ1akkfrXQxbTS4EaRka3dPnP8mfp7Tezb2GHHgh1Eji3T
	 V8oTgLjkF1p/uW23CR10ZjXD20Ml0fw8L4OblvIy0oZLE/2F9RYqiMqfa2ul+ZU8fF
	 Alq83hx0i/bpN7q27cPgT8oFfCZcR1MvJmZLOfOMiGyQDJnqgJJZor3OUdWneyD02c
	 FLO2aGpeCCWKg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39c86945164so64895771fa.1
        for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 01:08:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr6SEO4W4t3wzEPvzUEGiFWzuy9qsExegI0slJ/Wxi/8NKqXn/JV4CoYGxeMe6n/dHR6aXIsltq5v8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAcdD2cdZD2LfR7yxr02I+eT5Mm4+ugp1BB9e2LBd/oPzS2mLo
	s6XP9dBYikjrZLqerZjCsVazUM/cwlP4ZwqBv0JXF33yEfiuJ9KsBiOF5VxuwIJEKk0GE6aq9P9
	IFGwvA7FOuPWg8dDDFX3ZHvxjWcFBOABN8e1+KIMBmw==
X-Received: by 2002:a05:6512:2524:b0:5ae:baa7:5ed2 with SMTP id
 2adb3069b0e04-5b28fabc53fmr376905e87.63.1784275737391; Fri, 17 Jul 2026
 01:08:57 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jul 2026 01:08:54 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jul 2026 01:08:54 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <alYGGu7_3G6mJAzQ@linaro.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
 <20260713-qcom-qce-cmd-descr-v21-6-bc2583e18475@oss.qualcomm.com> <alYGGu7_3G6mJAzQ@linaro.org>
Date: Fri, 17 Jul 2026 01:08:54 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mdj4n_EodNvdNK31wmiF=av6eqSNuVouPc8d+LFmQHi+w@mail.gmail.com>
X-Gm-Features: AUfX_mx9FEOhptFi_3CRTp4Yaa7L94thQb83JpWfCNZjqAXnfBqalAbWqZfnado
Message-ID: <CAMRc=Mdj4n_EodNvdNK31wmiF=av6eqSNuVouPc8d+LFmQHi+w@mail.gmail.com>
Subject: Re: [PATCH v21 06/14] dmaengine: qcom: bam_dma: add support for BAM locking
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Md Sadre Alam <mdalam@qti.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@codeaurora.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dmaengine@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, brgl@kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 11:49:14 +0200, Stephan Gerhold
<stephan.gerhold@linaro.org> said:
>
>> +
>>  /**
>>   * bam_prep_slave_sg - Prep slave sg transaction
>>   *
>> [...]
>> @@ -802,6 +851,7 @@ static int bam_dma_terminate_all(struct dma_chan *chan)
>>  		}
>>
>>  		vchan_get_all_descriptors(&bchan->vc, &head);
>> +		bchan->bam_locked = false;
>
> I wonder about the implications of this. If the LOCK descriptor was
> already processed, will we cause a deadlock if we never submit the
> UNLOCK descriptor? Or I guess bam_reset_channel() might reset the lock
> as well?
>

There's nothing in the HPG that would imply it but I instrumented a test where
I excercised this situation and QCE was not locked up in any way. If there
were more execution environments doing the same, I'm not sure but this series
was tested by the NAND team and they didn't notice anything.

Bart
