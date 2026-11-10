Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794271177;
	b=w/ynjkLwGMozLCx6tjbOxYXGBwJTISuXnSAKPPZ0Sfm1T/QpD/TwToq5LM/+YXhZiv7u
	 oLrshKG7aSkndBMg/CNJ7hL4kz7aVfEgym955bXmCgMfD3Gs/P+FoXnl8HIwBqDlcKAdG
	 GzfctZbgA2z7ouEwB+GuVa8NFni06htORm/C/QyTtYOMHFFjlmOmBJWHe2hkldbda7r54
	 0dyZtcMCNLl28yPpT4Mm191Po9Y39qKgSBrOHaoCRmEg5yq2bGyYWZVkNKWdwYhunUR9I
	 jNrcwSV6X2iptl2ZLiTp/pr6065eO9yYrGAGTlvXbY0CvkQjO3aUWylNLBuxEQFVEwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794271177;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=IoWT26L+lCNjLByITvEDqGCl/vVklbh6utt0NNZqd+U=;
	b=xFSxuBWrG0DQqTVADp3vpje4oezYaBW51Z5b71c4NFwSIHXHxd5cckz5GZE5EPt4CfWH
	 k6dmKNwhzHjk7qFTwtiqJ6hGsN6G48faYFnmH1FKtAY60h2+8bxUxvX3gPzUDuTxJ95wE
	 6g6w8QmLgLrlBQJ63H2hAaEj3dPvV1hjdxtUv0nlyF2unBk++Pm32DoOVHLyp4leO+cnu
	 J87h4btd1B5PFR7J/hJuMmKsR5dJVfJ/IWvsdrY5qIqC1782gSUbzhJI5UQtERX85M6PP
	 0Mb45xMFfGzcUWQOFvAqZs4e9+3LVqmY5sG8Jk3Voy1PDrX5/EADLzs/SSfw+cRxWeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a6nYydig;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9141C606A325
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 00:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9141C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a6nYydig
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso1106762a91.1
        for <dmaengine@vger.kernel.org>; Mon, 09 Nov 2026 16:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794271176; x=1794875976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IoWT26L+lCNjLByITvEDqGCl/vVklbh6utt0NNZqd+U=;
        b=a6nYydig6QvSKo7EkEElyV2YraExoirso0hjPWfiBXMd5zbsE5V2+ys7gBTXGBgLMy
         KztL3S4lXSLQNQFXbomWBbd4uwbtyFzJ3PlMxe3uSSdlmkG5VE/Md9tv0hOKnruaYi0x
         aPiGZY/Lb/b9UIj6yOm3Bkfm7pAV+dJnpXqlq919gh7//xQg6gdoEVc1qcuuy4ZsBpqV
         bd01OkHyArnS20r2xDk3ROR//CEabXF5XGAQjI7VyXzuf/s1A2ioL/h/VL0QUAHHRZFz
         iXsyGWYm6ejppGHGdXnl0oclHQR9TKzhn0HYYCOubjWw6Rhb4LBRNRyKYxgjASXaQTqt
         k2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794271176; x=1794875976;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoWT26L+lCNjLByITvEDqGCl/vVklbh6utt0NNZqd+U=;
        b=2oM8V5yQ23Vdy1b69KcNkBDC/8ZAPdj1VyTJRar+aPqpE/8z60OWfJIHZZezweXaQc
         vFEDDZgQvFuJlLgPkx4c62l5ATNwnnS3NPFws4iova0091+yIWRmiQ4dK3mXaxx5i6wQ
         MrxeZ4ONUhuCGi3w84hSSeJ6zYXmxdrw90JZY7cgeLE9ArVkrFDdQWctA55lROE4JrDO
         wSLJIEyNE8q8yj4BPcWw7hjA1Sc2HmFHA2CH3jFij7+HebzcYtBAkN4VaC1kB27hQYZ1
         RKd2GAwB2SHAYnNxOQmzU5I0Wlab1dgp+6/FO788ebN8DBFrYRlsgo0vFosl+v1fv/ax
         PpVQ==
X-Forwarded-Encrypted: i=1; AL+hErE+ZKD+02Z7vH7e2TljyUg2CjzAru+0rCzoIgmI/M6uFXDQCX1F+fGKeN51oCOnMiKt0AEOnGwUB6E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XyELvd5FLe8+IN31+0o9QUkPfiVaOqe8pl5Re2zi/gTMHzIN1
	JK3mbew+05mM0MHQCq4L8XFkhr9GX+R1yAJIqfMZJI+1g6x7YZltr4OC
X-Gm-Gg: AYBFou3V5nyMOzwlEfq4Q9kkIsL3kjRfxH1viJr0itEn6Q445hSyueCrgyySBq40gQG
	1GVLkT+MxkyBaAVyUnKKt+KFw1m21MnWYwpnZzUwIOVa+vWf+9u9UgQ46t2otcu1Z8p9eGNL7Yh
	GL+GLTTweLzo6aWXXPE+I8U8kVVKXsPsiy6xlVqNi34tf+osHXhqzQ7jRr7BPlmyztrFj3sFmD+
	aPr2WrFY8yUlSk+oklv/ly9HWEzo40vVzdN9RSo5AjAwpJjqPMHELf1AYC5Ufodfgo/tCgOZ5jg
	PD9FMFaDUiA/06jSSm1NBaA9LxYiAiSqBBE4vpIB9yngb+0kMAtwSFBcQbUPIFBHyY9frociqmh
	kr61nDvQZQamQBo4k6mshUVPbxE/l7x8zfLNdGw7XF6xJL8mTvpXpHst94EMCKPjncDUcFQ3VqI
	AatVyDU7bVJ56S9iX7ANbmsXoimWvNU1jjdIznIQK1fbcdSbMeOtixUK3KyTYfneOdOTXEeKz0k
	8Z0ss6vfTAoDOv0rO56whWo6ZiaXsaQzyiB1KtksqfYwtsKmmWA7AWK5PziBM7OBS9oFRbu9l0m
	rWJ1wV/3wQ28ZxAt37CxLaabLkJL0/hLF8wju7eR1jGdxuTSCjNOsXistc82MnG49nKOzC2KRmT
	PZVlN
X-Received: by 2002:a17:90b:4ad0:b0:3ac:9d83:8856 with SMTP id 98e67ed59e1d1-3b166ad1ee5mr1415032a91.9.1794271175917;
        Mon, 09 Nov 2026 16:39:35 -0800 (PST)
Received: from [172.19.1.51] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16779d5c8sm1512711a91.2.2026.11.09.16.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 16:39:34 -0800 (PST)
Message-ID: <d2f451a0-33bb-47ab-b31e-aa40df9d7ab7@gmail.com>
Date: Tue, 10 Nov 2026 08:39:18 +0800
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: dma: nuvoton,ma35d1-pdma: Document
 MA35D1 PDMA controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, vkoul@kernel.org,
 Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, kees@kernel.org, gustavoars@kernel.org,
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20261109052900.2960473-1-shanchun1218@gmail.com>
 <20261109052900.2960473-2-shanchun1218@gmail.com>
 <20261109-petite-imposing-ermine-fbbbcd@quoll>
Content-Language: en-US
From: Shan-Chun Hung <shanchun1218@gmail.com>
In-Reply-To: <20261109-petite-imposing-ermine-fbbbcd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Krzysztof,

Thanks for the review

On 11/9/2026 9:16 PM, Krzysztof Kozlowski wrote:
> On Mon, Nov 09, 2026 at 01:28:59PM +0800, Shan-Chun Hung wrote:
>> Add binding for Nuvoton MA35D1 PDMA controller.
>>
>> Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>
>> ---
>>   .../bindings/dma/nuvoton,ma35d1-pdma.yaml     | 71 +++++++++++++++++++
>>   1 file changed, 71 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof

Best Regards,
Shan-Chun

