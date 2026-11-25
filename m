Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795598752;
	b=DfYMgZP+MnYi8FK1Xvb9wYILE60bKrmjajUTaltTfcNL8J3wNrb0kdyjWKZKZxeAIcyW
	 oiSgg6FC8Oy+xBp6GwRioDAejhG2H9Mt7vmqrbvBgQrGRu6h+QGrKVSLylBMs4qouXVNC
	 dZzIuKwIDM8eT5Hq4e/SKzidvRKfEXuj6qbXN8U6jHZvSSJjI78XaGncQtuX8zBgC4u98
	 EeSkESrn2o3KunZrx2JOzijtD9NGIOU4bvkZsQtL3+CvoD584OLvDbwsNov18bkIODYsh
	 NhHq/7UlFsOJ/MPHSvpVcvnfNPQ0DDIGk6X5O3tLt8M8H5iJ2EuOz2gfewwMZJUh+Ug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gYbHdRSYox47S6NtsdAA4eKslCoipRNcHNth5Q08SEs=;
	b=Z9L6ntbuqtDvTF8FgBrsPQEmO8nZSYHQrAHe7ch0WbIBnaJqvZ0mUfOv+qAIBmAz52Xz
	 mXqpRXgMUXbq0eQVv1enkGTes0W78YRMawt7T9pPzIzw/2nZWMGgMwwZIRla4YEX9OUGf
	 36qzipSpdfuuF0cSUiaBXsuk3RIMx4Z9fxFoIi6HbB+FTbEpXbJutn8D18iDUjaI2HYW0
	 C1Zv4DHgkKf2BznBqAplNQMZoljI7fDT+QTvZyvQK1ZHpard0s82GF218m5CgXuoxP8Da
	 gBN0iN43KhlJCVc83cRC35QNei/aRmme8OloajDiNP0y3CAqzJ01qtFdqcc1x8BddAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="L2X+/PXy";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E60606A330
	for <dmaengine@vger.kernel.org>; Wed, 25 Nov 2026 09:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69E60606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=L2X+/PXy
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b869ea8224so47793a12.0
        for <dmaengine@vger.kernel.org>; Wed, 25 Nov 2026 01:25:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795598751; cv=none;
        d=google.com; s=arc-20260327;
        b=iZggsMndWJ7McUGo4sP05dqztuD0gi3s9ZRt0Kh+wUxG5GGhEcsZQ3GGaGDzummPVX
         852c0mckzYmwGWLTucyJBsSKpT1Le8u8dPY2gqHtXYsw7hKVEumn/fm/DPUOZxq1Pzqw
         V4daIC+zyRYj3Pm0sfV1Z0Vaz5zS3y9AxmKnkP9cQqgcflW/R9b4QVTmgJCFx99UAo5N
         pp10NX3I7eoCvEdsxn7fS2cfv/R1a/wX9cxRwGpWupRxWg4nmDqdD8h5zjScKhB7p2f/
         L3dfRRjJ+dAwom3mLCsbXirNsJjneTyanB6JOTFA1nDWnOcrlYLpmb08DB8tJbYRxi2s
         QuPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gYbHdRSYox47S6NtsdAA4eKslCoipRNcHNth5Q08SEs=;
        fh=ChO6xjEGa7Qko2B3AXh1kbCBzSjFn/GlBDHtIVuA0Xs=;
        b=qwGSnnCazDplW4KsAk+9PkTbkoBOAAVsZwW4rNKOhaBTdtxZzmEpyeF2SNOZefrxL0
         57I0uo3f/NYzfMdywH7U3OM7+Df+QgrQbK5pbZlhN1wn2HY99d1rOYI5mMuYX/YpOIlb
         e/5uI7WmXgXSE+QNMN6JnTEmT4qfHs6z65F5BVEf9Rlj9R+pvB9NwfygI7KwhH43dbZR
         +bo+u6zKRZgb9JdA2Bw33v+xfhdz2c2aOK8dgq+g+3LrqNTQH/8IWZgHYUtEIrMZG8d3
         IMlYYuJ6QNkwk7QRbEPC5QMJembg4s9iDjuJJ+K+WBXZX1MMnsBGqXoJBcwXG2MtbnvG
         OAEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795598751; x=1796203551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gYbHdRSYox47S6NtsdAA4eKslCoipRNcHNth5Q08SEs=;
        b=L2X+/PXypC3/tKXZUwXmdoCkWUOksEtrAn7Z3N8G2KMb3Ph4Ej03Qnbh/RpnJowzZI
         UYxG888gnvRL4/mSZCmfxtJLRTZl4d5JrQNOIN6bpZADNGJv8NQhqybPCL8MPLClwrCV
         ve7lkK00QOGbrRT606HMVqpBhuNt0kFf2MP2QgAG2c50Y5KUshiM2eZLyuRJiDitXRT5
         KeNcVKLzIky3PzXwptdgA/G0K4uuO1SmTlhRTQHC3M/lP+qYGKe/V3BwlmPO9msXfSBy
         e+rFPrVucCdabm3a6pXDVOLW/82RvV84kOwdzS3uu7GgCH2MsooFQc5ro83izfGSSEMM
         IeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598751; x=1796203551;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gYbHdRSYox47S6NtsdAA4eKslCoipRNcHNth5Q08SEs=;
        b=nX5jbKSgtv4FGAUpO8vStEF2yT71nYmNoNzQox25u4XrfS7PtfZ2sVNmNBUSa3HAjz
         W+drF8KjMM2cGR2EV3N6WueE1Hay0OthFg53NT0Dnm7AhcQWQqDJkAHpIqYMknnfXkzi
         FdPFpHv+VCfi+LnAaqeuazUONwS5+QchRRbbVmJxvRkiV9z/Cx8wTpoKYt73xoqBWEp1
         vi1gZKUoTCJWLpgw8IbM2gOqyMlpCnNzPZdc+ch6zdDbL+6UUqMMjqWutQCOyuqilaEv
         RJR3yHxNab+3s7jUMCoj+scz1BE/LcUV8AzDCu6/03/FBzzFL6a46U8kAy4OdKu2bI+P
         nffA==
X-Forwarded-Encrypted: i=1; AL+hErFjct6yDi2W1TejYvziGtqh3s8+KM5wyW25MMaGTNVZ2fOiZHNazLIQG1zeMu/KbZSdeiShVJUXnIo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bHjaRjHrUrIvH7Ifi4zv4P9dLGizMtrHdcdsPmKSI9lzBHlrH
	0kW11vJ9Zs5fvm6djoOVBdhzp9FdakYE8tvQKpboHhJ/HiCWL2YC4ZAosFy5JLM9nm2YgIE+HA4
	PbWLb9HgzXs+mA5n5V4NLE1sOwrCJEoEm92cbDsAFhcBgC1b5g0jTI/TB1X0=
X-Gm-Gg: AZFdTZcx+p+PUDggcW1qtISQt/IAqRdSKDQvaLa4zDIaCfErBAwW9lSgFG6+/7QBy6c
	zKd6qdTA08ezKD4Xj3HDc4xXsAHKZmnfPvXIeuOCfTcmKoI/xhEs88Gyn4wCbTA167ZGDSWBqut
	XWFCe7AF92ZJ1mqepvkn+kJH26lZmOZdFMtTXWml4b3sz85qUTsogMqDEbU3GRH1GZSY0q8QZHg
	7lni6xOXsbLc65Fy+4Vfrh5hCNLYx5a13j60sNfQbSyU0UERFAD6Yal0S+B9rVTB2Hnk7Edpozk
	GrKgQBHNh1KAyw9ox1x9c6v5iQIIcPyGtVJx+Z0R64mLBctOWn3pvxFZ3R6dEYVMPXC/LY1JyAJ
	7xRlBTzSGLvBmc7s6Uy0y1j6FETn2p9zTFhg=
X-Received: by 2002:a05:6402:4019:b0:6b8:a64c:7bae with SMTP id
 4fb4d7f45d1cf-6ba65b60300mr446859a12.6.1795598750461; Wed, 25 Nov 2026
 01:25:50 -0800 (PST)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113142910.3477757-1-smostafa@google.com>
In-Reply-To: <20261113142910.3477757-1-smostafa@google.com>
From: Mostafa Saleh <smostafa@google.com>
Date: Wed, 25 Nov 2026 11:25:36 +0200
X-Gm-Features: Aa3M54oG49LqtysQ--8oVUvcgvyBCI2St88VzEbaL5EUBbdo06thbDvEmUWjhIM
Message-ID: <CAFgf54oB6tmmKTsD6aYvs0JSPb=heb_yXDJLxCRM-mMTPVz4NQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] dmaengine: qcom: bam_dma: Fixes for unbind
To: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
Cc: linux-arm-msm@vger.kernel.org, Frank.Li@kernel.org, 
	bartosz.golaszewski@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vinod,


On Fri, Nov 13, 2026 at 4:29=E2=80=AFPM Mostafa Saleh <smostafa@google.com>=
 wrote:
>
> On Lenovo Mini-x Gen 10 (X1P42100 based) I am using VFIO-platform [1]
> to assign the QCE/BAM to VMs.
>
> During unbind:
> echo 1dc4000.dma-controller > /sys/bus/platform/drivers/bam-dma-engine/un=
bind
> echo 1dfa000.crypto > /sys/bus/platform/drivers/qcrypto/unbind
>
> I see a system reset quite often, looking more into this,
> that seems to be related to runtime PM, with those fixes I don't
> see that anymore.
>
> [1] https://lore.kernel.org/all/20261024161902.2093581-1-smostafa@google.=
com/
>

Gentle ping on this series. Is anything else needed for it to land?
Frank and Bartosz have already reviewed it.

Thanks,
Mostafa

> Changes in v3:
> v2: https://lore.kernel.org/all/20261023101536.3965344-1-smostafa@google.=
com/
> - Rebase on 7.4-rc1
> - Collect Bartosz Rb
>
> Changes in v2:
> v1: https://lore.kernel.org/all/20261020180804.140766-1-smostafa@google.c=
om/
> - Collect Frank Rb
> - Drop call to pm_runtime_dont_use_autosuspend()
>
> Mostafa Saleh (2):
>   dmaengine: qcom: bam_dma: Take a PM ref at remove()
>   dmaengine: qcom: bam_dma: Do not touch remote BAM in remove()
>
>  drivers/dma/qcom/bam_dma.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> --
> 2.56.0.611.g1030f0b940-goog
>
