Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389B741B8D7
	for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 12:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784203751; cv=none; b=ANrP/zLXNY32IonICeApHYAkFxANF6E3CZj/8dbri1MaY7N8AFwBUJPo1/TPg7sajai6SINEqj9hXZNjv90Sy+dWoOoUbvbfWA7h92DRSr91eOn8b5mzL1PU85ldGT3o6NvK5F20FdMzgF5NYGtE7L4AX1BZAcTz9lZYJF5DFDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784203751; c=relaxed/simple;
	bh=v46bTk69zLMulo2xApc2OT7PDtDnt9k2DehnsE2f08I=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IOZUvqgb5/WEv/SkUaOvZlbLZ3Vj9GY4JFn3psdThsJYbN69YmqqmJABX6WsypnNtoZRInrI5qXkpTRUiJuCEWaQz44qY8MkoZUhI/juXhgtm1WUAXw9wAyB7axM5pZ8IV27879YlMedXibnQLI7F/X0mIvwOGrBK5A2Gw9cQ6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XwXtitMf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XwXtitMf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F22EF1F00ADB
	for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 12:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784203750;
	bh=BcuTI5XT+ttFtyPpiLZjul0l9bnDn35LDJA5ZipJT84=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=XwXtitMfyWy4UI9fgCPbtww9seHB4ha4drJ3yc1vak48vB8pfWhDeJn+KlCkZOy0J
	 dr00olUt2l3IkzuEW2jOyn+fRXva99cTxDnxUwJOIuWFVUVXzowXugwaNN4eFibhvG
	 lACyUTmtjO2nnF7PK4g4DOsvo2tlEBCyBrdRE3nqZYLDEG1CeUqsl3R7czOfNlIW+J
	 DVWkw0DLkxWN22dyOTHFlvzDtCzMVxuxzaEDMfOlFm0uwUC+gikXFdHV7WxMGlqq7X
	 ooZ9vG8bKQ5LAV6wBKWgNNG9ruHEaGz44SbWydxTiy719MHSNyP7bJRmk1YOPCmKTB
	 FvdD96SQth7aQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aeba09900bso2467083e87.2
        for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 05:09:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoNGVb4bDVL6T66A2K0Phgioxh5nkBVIIgiqO7B97SK9Jah68vcxmHz+2YznvE6Xxma1hEy4N/c23I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwklseekKQ7zlkyY49ojKzDWOpObcLLWEk2BOvXgBoOwOLGZpCh
	rN9NOppLgWFC2dXbOwFiQ0ZMMOiCfAZqxMa45JQtph8ZJgjd+9iFpmtDijDP5bZJTxwOJ08OOE0
	DBsIiTxTvmz8I2wdWiPZPiVW1Ayrp3EdaCQKZrp7dIg==
X-Received: by 2002:a05:6512:287:b0:5b0:163b:e2d6 with SMTP id
 2adb3069b0e04-5b0236bd419mr3463424e87.62.1784203748330; Thu, 16 Jul 2026
 05:09:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jul 2026 05:09:05 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jul 2026 05:09:05 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aleoVNavBOrF9r7O@vaman>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708051023.2872304-1-mukesh.savaliya@oss.qualcomm.com>
 <20260708051023.2872304-3-mukesh.savaliya@oss.qualcomm.com> <aleoVNavBOrF9r7O@vaman>
Date: Thu, 16 Jul 2026 05:09:05 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mc_4TZ6QjUgQmLehBb_6f90bamYFhE5S_6m-Poem0-u1Q@mail.gmail.com>
X-Gm-Features: AUfX_mxTc3KZzYNUMqguv9Cy5eW9ARpAh1ai_7rJA8YVyIlEo_EAMzkE55U-I6s
Message-ID: <CAMRc=Mc_4TZ6QjUgQmLehBb_6f90bamYFhE5S_6m-Poem0-u1Q@mail.gmail.com>
Subject: Re: [PATCH v8 2/4] dmaengine: qcom: gpi: Add lock/unlock TREs for
 multi-owner I2C transfers
To: Vinod Koul <vkoul@kernel.org>
Cc: viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, 
	dmitry.baryshkov@oss.qualcomm.com, linmq006@gmail.com, 
	quic_jseerapu@quicinc.com, zhengxingda@iscas.ac.cn, kees@kernel.org, 
	agross@kernel.org, linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dmaengine@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com, 
	bartosz.golaszewski@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jul 2026 17:33:40 +0200, Vinod Koul <vkoul@kernel.org> said:
> On 08-07-26, 10:40, Mukesh Kumar Savaliya wrote:
>
>> +/**
>> + * enum gpi_lock_action - request lock/unlock TRE sequencing
>> + * @GPI_LOCK_NONE: No lock/unlock TRE requested for this transfer
>> + * @GPI_LOCK_ACQUIRE: Emit a lock TRE before the transfer
>> + * @GPI_LOCK_RELEASE: Emit an unlock TRE after the transfer
>> + *
>> + * Used by protocol drivers for multi-owner controller setups (e.g. when
>> + * DeviceTree indicates the controller is shared via qcom,qup-multi-owner).
>> + */
>> +enum gpi_lock_action {
>> +	GPI_LOCK_NONE = 0,
>> +	GPI_LOCK_ACQUIRE,
>> +	GPI_LOCK_RELEASE,
>
> Can qualcomm people please align on LOCK/UNLOCK interface? This is
> second interface I am seeing now. Can you folks align internally on how
> clients should communicating lock/unlock across different qualcomm
> dmaengine drivers
>

As discussed internally - this driver should follow the pattern we established
for BAM DMA where we don't require consumers to be aware of the locking
happening to any larger degree than is absolutely required (for instance:
passing the address of the appropriate scratchpad register as is the case for
BAM DMA).

Bart
