Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793125734;
	b=utO3YApZZ14GlRKrhZGEpFSGDxGvJQ5ZVnybgS9aCtaMY9iG1qnOSE3uvAI8vmAG1WH8
	 XTOIhDHurjpl8omp1IL76fyEn1USXdW8xIEfHRxXDqGM3dTObtugTILTLWHSor9IXTSIR
	 4ORUblgzag8M7Tdi7zpXOq8k39bNuzs7EyC/xawUOWkuG/xPigGSOsBUIDOw2LKx+BE5o
	 veCGJS1kl53Bh9vqNEdPWj9p/kj7iqBD17IYfCwwb33TnymMhqoObDpHs8hN+JWiBQmPX
	 MdV0OfysWFwRlc60jNfww5pY0UR6hPcAAnwQxQrKxmNVHIm1F+MDYI9M5pTffcg1KWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793125734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=BLfFNn1Qcpgkc/CE+gfkXeaI8Qpi2GlNUfZr/MSyrCY=;
	b=5g1CnXtfVOUmviW76D0mW8p1aO5/emFp7PRLGR0Vrbw1kyySRy27wXfOsV+4RYg/R0d1
	 m8T4gEYD69Sp1I3EfDP9YxGOQQ+KelnYeueXGXlfrX63CGXmAavxP9TYwvCgiUP2/D2Tk
	 xMb/6hXk2z9tWj3xGI9U9VTmAZApEsg7TqgAEArKovCJ9Cj94gGK/MWhewlhVsr04htnB
	 SuImy7ezp86S6umq6xuQGaQ0efWHlleoPHjmAA1ZDUEiVE19uGALJpcmhIMDK84ElCdaO
	 Tc2EQU0Xcqwb4I9jMr3u7dW55aqMhojE93cUtpGr9owTnwXDwM6nvCkfqfl+Pwz6XUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IzuVmn/3";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E0C606A323
	for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 18:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57E0C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IzuVmn/3
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e46e449e8so96838f8f.3
        for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 11:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793125732; x=1793730532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BLfFNn1Qcpgkc/CE+gfkXeaI8Qpi2GlNUfZr/MSyrCY=;
        b=IzuVmn/3PK9k7xpmQcANtQTaHfMbFHFVZuCQQjBOZcwHtm9l0fcAnfhVtYYXkWluIT
         w71AMui723QvIQqh5zjvS+Np2nRcHflIOKTGYdUNpV8vgv4xEyY506P7MQj6e72izXZ0
         i+E5hp1Yq6Lwl3WJ+WJ/9yIPFzgAp//w5FFtv3M0Jr4WdLpaIV78oN2QGHTbDB4dbbXu
         qjMgzh+W/tRdSMASwKyRnLFWP7gG7UXgblH8hluuvE8pzPnzU5Oa59G79Yg6Qdso0yig
         hvMsDOzfkUrikadI+u/5jNAghab5Umy3QgQxkFXyurFUkaAPLFfxgmSq9DLmKqkawzUN
         aBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793125732; x=1793730532;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BLfFNn1Qcpgkc/CE+gfkXeaI8Qpi2GlNUfZr/MSyrCY=;
        b=AYXYUJnCgPzL5fwATcySi7h/yQW/humry1SigXZqxQlo6T6TJ5KnZsWiUaM8HruEUE
         5gKRSHINrfoYTi9lEf0kSKr4z0SBBL4ceKgltOPP5jpvXJXdig/GQJj4FhLgLPSFrJaj
         uAZut86GkHnKpi5+QKoTtYUJuYYyL7NIQcKJ6aJaO+QrBTgoMBx+ayqFb/5E1hk81APo
         kUOLzCSML3DplTojQemgPPvr3KK5qKA1/nDAKoydLq41IwZyX0oHIqCxqBcTJJ7jP2HU
         1a+UwH9NOER7uLC7pO2ilRVwZHMzTEIVZ/IaK98B3G1AEZmVyZ1zMhye5Rec2CuTJSJU
         cuBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOb/gmhduq6n2zVfUETE6arrjfx57vOTuDUpVRNOAxjf+wnhd3IFWjs5OmPQHsqhL+5qx7yweYmEs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKE6y2Ecd4sbZIpSmO0TATClJ8dzPf/9tulG7Obsw7ZfMChwwRp
	CglTrJ+t4CPS45OnbTjGliXOn7F6HZjE/EH9AmB7WlKaMhuT1wo+l3R0
X-Gm-Gg: AYBFou3yVExXy4aqPskA4waC43mxdcmmWhFX7rJvJQL/NJc9eKifG3y2ZUrR/p8GOq3
	uajgFOn/ooP1ejtOgxO9z4aIE89Lcf5gbzR/SesCV+tec6tv5nDzzjQefWPd3hXw/EzWPPZcBsj
	sITwnv1hCQufjejfQjxMS5sh2gRiWYYQKgwgp2sbS3jq8h9zq0O/BvTM7ayiLGldEMOCksN8dZ9
	mh0MLzISJFeGsDRYI7CALWmR02NqA49GY6ZlvCXc2Npoe1AIxBybr0oMpM6zAKMFUSV6YyRkz6D
	Cf3OQTYMvld5ewDMPm0zPibpuU4Nqux7vg2L2TaGWJYfxzKB7DUWbDnM16nvEngSRm5PDihu+s+
	R3dJZ8xzgSlcDsHLTeBDBRdJX0IgQnL6tBdfcqK3Gz8uYjOCf/YTr5SXSLMJSnHzloGhe0h8YY2
	Ey7snm8wsQ4+rNl4AI73Yw5uS0E3nIHvuPdbJLAbOZotZDfXf0lUXxhHyCe/bcrCcU9szRH7RR0
	5DlVeOtyTr6RgiJGfXUvJbY+b0ExTOQBEWYp0lFPaGeyjhhExyUMlMPRBKxss5uFvJd3LTxa65Z
	dT8jlAJ1+sw2z0tTNlbArNJoycMUdEDC1FDycvccmckcooAjCE3Lj3jyrs02BNs8VfY=
X-Received: by 2002:a05:6000:26cc:b0:48d:ef0e:b791 with SMTP id ffacd0b85a97d-48e5d313b51mr689662f8f.54.1793125731380;
        Tue, 27 Oct 2026 11:28:51 -0700 (PDT)
Received: from [192.168.42.93] (193-154-207-67.adsl.highway.telekom.at. [193.154.207.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3555sm23765915f8f.42.2026.10.27.11.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 11:28:50 -0700 (PDT)
Message-ID: <60d0962f-8769-49e8-9674-48ec98278529@gmail.com>
Date: Tue, 27 Oct 2026 19:28:49 +0100
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
Subject: Re: [PATCH] dmaengine: pl08x: mark slave channels as DMA_PRIVATE
To: Frank Li <Frank.li@oss.nxp.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261027070037.1809112-1-andi.platschek@gmail.com>
 <auC3nGX0hA494DZL@SMW015318>
Content-Language: en-US
From: Andreas Gabriel-Platschek <andi.platschek@gmail.com>
In-Reply-To: <auC3nGX0hA494DZL@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/27/26 3:39 PM, Frank Li wrote:
> On Tue, Oct 27, 2026 at 08:00:37AM +0100, Andreas Gabriel-Platschek wrote:
>> [You don't often get email from andi.platschek@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> The pl08x slave engine channels are only ever handed out through
>> explicit requests: DT clients go via pl08x_of_xlate() and the
>> platform-data path uses dma_request_channel() with a filter, both of
>> which end up in dma_get_slave_channel(). They are not meant to be
>> published in the general-purpose channel table.
>>
>> Mark the slave device with DMA_PRIVATE at probe time so the dmaengine
>> core treats it as always-private. Without this, if a dmaengine client
>> is already active when the device is registered,
>> dma_async_device_register() takes a reference on every channel,
> Code change is okay. Are you sure the above description correct? where
> code set it active when dma_async_device_register().
>
> Frank

I do think so, because

async_damengine_get() -> dmaengine_get() is called from 
crypto/async_tx/async_tx.c and increments the dmaengine_ref_count.
This way the dmaengine_ref_count is already >=1 before the pl08x 
dmaengine probes.

dma_async_device_register() (in dmaengine.c) iterates over the channels 
inside of the following conditional:

  if (dmaengine_ref_count && !dma_has_cap(DMA_PRIVATE, device->cap_mask))

and in there a dma_chan_get() is called for each channel and increments 
the client_count. With a client_count  >=1 we fail once 
pl08x_of_xlate()->dma_get_slave_channel() is called.

setting DMA_PRIVATE prevents the client_count from being incremented by 
the core, keeping the client_count at 0 until a real client requests one

hope that makes sense?
best!
Andi
>
>> and
>> the subsequent dma_get_slave_channel() from pl08x_of_xlate() fails
>> because the channel is no longer free (client_count != 0), leaving DT
>> slave clients unable to acquire channels.
>>
>> The memcpy engine stays public as it is intended to be shared through
>> the per-CPU channel table.
>>
>> Signed-off-by: Andreas Gabriel-Platschek <andi.platschek@gmail.com>
>> ---
>>   drivers/dma/amba-pl08x.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
>> index 543c2eb8cfa8..06881d3f29a9 100644
>> --- a/drivers/dma/amba-pl08x.c
>> +++ b/drivers/dma/amba-pl08x.c
>> @@ -2775,6 +2775,7 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
>>                  pl08x->has_slave = true;
>>                  dma_cap_set(DMA_SLAVE, pl08x->slave.cap_mask);
>>                  dma_cap_set(DMA_CYCLIC, pl08x->slave.cap_mask);
>> +               dma_cap_set(DMA_PRIVATE, pl08x->slave.cap_mask);
>>                  pl08x->slave.dev = &adev->dev;
>>                  pl08x->slave.device_free_chan_resources =
>>                          pl08x_free_chan_resources;
>> --
>> 2.47.3
>>
