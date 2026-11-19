Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108989;
	b=K+OTMfjaR9CESJlcj0vBv6ASECdgzhl2Z+QLennj23TfBSsZkNSKMQ5BBfS643Xigf4s
	 mXVBc1MoEX3xTSbaQW39qv07wZQzNIbvQPwpzEirBgmiMXT8N/c1YOcP0h/A4ItIwr1wD
	 LKp/fosgtzfdJtMzvlWzHynqR34BuLpZQjSk8eY4SpTOx9NpQ/0Q0JV5LHKNnqVKHd8Oq
	 iCnXvJuH6QSPVUJrylx/LwWMthSqrgicw3sCUvnMahtBPr/bDCWxdQN89D/PmJPcMfrRc
	 gpD+kFTz5p17B0iNAc46fqAvuAVKw/KYkUyg+USOH+Jc5ZUWqoOIkZnzHrJr+vUcdoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108989;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=gxN+6TQFPETycfMMUoZ7hXwCT4h94KmDPwUcAxjOXhc=;
	b=G5nJQxijVJGO72oxfOBWk8OIeqcD2DZ1Biolzls9H6f+8lTSwQKVJYztsC53qLF06DXU
	 woHwamtQtMoQ/y3hN4jTdbZpIGSFFoyFDtYWdmmj1dbp3/1KZDD0yHe/WL5Pphs0zOGo+
	 gZaqOhzeTst6GDhvjuDyE0SOcPYHUKQ8Dn4tqQyqLV7eUUIWmqzMMiz2naHWPONHMiLpX
	 QDhADn+yJNOfaCByMaTLrV8qpbuuYjcX6hIKYYleRXXEbPhyGf6Gq7/Udmd1AenD/8wEU
	 6hgnQH4+ZDwh/Ft9Lwe424KnhfQ3nPKN83Uo1nGIkcfaq3MDPrNKK+UZmrkmjQGtUkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=guGJBLKk;
	arc=none smtp.remote-ip=212.227.15.3
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F1F606A325
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 17:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78F1F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=guGJBLKk
DKIM2-Signature:  i=1; m=1; t=1795108986;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGRtYWVuZ2luZUB2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:JXKJYlWXS0jTlRDDqd6H/taWWa2z
   jGRlp6CrTjIxDr8QG6johE0tNlbzeNrUVS1VRU4m27qeftp0RnxIGpQK/NpMl6cu6jlY1Un08Xb
   8zbDmeXp6zrhB4hFg3wx33e8Oqs/UHkbUc7Dkf4TCfT4akmLyWsQSWXaxV0Gg0Xtgb+Ky2G+4Ly
   74fJ4uUkDfvfQZd+3RKR7hfAMpRLo51ybc6YKG0hwDmg9Eb9ESoC3hELzRt2c7X1kqORomhRoQG
   7sWtEPDLWI00XI1vEpUWO/ustpx/YTTEHgKovVI29XFxRqZqP66rtkGVzwyKZLEpHHdbv+S2Al6
   B3friZgmPymzhg==;
Message-Instance:  m=1;
 h=sha256:
   NDGPdmWuOB6EHFNDRTUQB+t9xYgqYB1fIFRZQWUSZSo=:
   1MMcf+odS0FpU8vkueT0s/n8o5pIsChj8PeHuIL2V30=,
  sha512:
   x6eBlvoWSP6a9dXnCoR0a3xncUgT0/okVaGv/QKcBz6D9pRFejkgKmYPDnhwEAUizYBJVKl42E0DHNzchVY8Ug==:
   K3lRBFBNmGnO815ot7ifDz7nd+crNVbEAQWsGCqr6L5JIXEqI++MiQQT4PEThLuB4Qvr7JtH+nbe3T2i54qOuw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795108963; x=1795713763; i=markus.elfring@web.de;
	bh=gxN+6TQFPETycfMMUoZ7hXwCT4h94KmDPwUcAxjOXhc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=guGJBLKkZUVbVmqEVoI47yCf0Wn/zAkwh2fgfKZXNsOUUTaY0nnR9O5wsmFL5+Yu
	 LVSfCOdas+yoV7BknQJsNz7S3PvH3+g6OzFEaan7yxXsnjj9nEp+5ere2mf/6Qzzn
	 esVdsvwrQrVxOgHcEjZhoumnAgplB60Y0Hvi1O69lUCDSz0PauMoRF+jsFOlJGbLL
	 4enIdbtJ2SIjv3Dygdy0WA8cuTzm/Cxx3PR96McoKzejbb7NHzZ4sLdrp13KVAFac
	 bzNB3T3mhvNCiwHlmih6+lmu9tVn/nGrLVAR+zBf3vUDk7mY5bIj8L7dOTDhmbAUx
	 f5x3dTke4rwYWnf4fg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M7ept-1xM7EU05XB-0091xj; Thu, 19
 Nov 2026 18:22:43 +0100
Message-ID: <216e7cd0-10b9-45a0-9eba-b53cbc6fda4f@web.de>
Date: Thu, 19 Nov 2026 18:22:41 +0100
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
Subject: Re: [PATCH] dmaengine: dw: Use devm_clk_get_optional_enabled() in
 dw_probe()
To: Frank Li <Frank.li@oss.nxp.com>, sashiko-reviews@lists.linux.dev,
 dmaengine@vger.kernel.org
Cc: Frank Li <Frank.Li@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <8e3534b7-ae64-4c1f-819d-0ba390737b84@web.de>
 <sashiko-outbox-223487@kernel.org> <av8pd_aQFFSSMkDg@SMW015318>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <av8pd_aQFFSSMkDg@SMW015318>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1gotOdEI/Ane0/gPVwFVjZnt4lVJeRtp1/SLU/aQyvRrirYmjy6
 ypGzlokziniZiNxaTQ3I0qvVKYx1CPvizRm5EhUuR8WddZBk4JHe671X5QkYyMp9662Upei
 AhdR+dQ/xZnephu1MZePRhZ045QEa0FO+a0Q0X5X4qJSPOXr7bVn3ii5jxAVdoC6LtIPGlp
 YwrD/VflaYojvrAoeQibg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SBbsnkw2OSc=;r6rUmHA0Ex8DA6pX+LEXn0knp5r
 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

>> Thank you for your contribution! Sashiko AI review found 1 potential
>> issue to consider:
>> - [High] dmaengine: dw: double clk_disable_unprepare() in dw_probe() an=
d
>>   dw_remove()
>> --
>>
>> commit ff07f5838666895fdb235cca7d9f7155e7085b00
>> Author: Markus Elfring <elfring@users.sourceforge.net>
>>
>> dmaengine: dw: Use devm_clk_get_optional_enabled() in dw_probe()
>>
>> This commit replaces devm_clk_get_optional() and clk_prepare_enable() i=
n
>> dw_probe() with devm_clk_get_optional_enabled().
>>
>>> diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
>>> index 7e76391475ac1..9bb3c2cd08570 100644
>>> --- a/drivers/dma/dw/platform.c
>>> +++ b/drivers/dma/dw/platform.c
>>> @@ -64,12 +64,9 @@ static int dw_probe(struct platform_device *pdev)
>>>
>>>  	data->chip =3D chip;
>>>
>>> -	chip->clk =3D devm_clk_get_optional(chip->dev, "hclk");
>>> +	chip->clk =3D devm_clk_get_optional_enabled(chip->dev, "hclk");
>>>  	if (IS_ERR(chip->clk))
>>>  		return PTR_ERR(chip->clk);
>>> -	ret =3D clk_prepare_enable(chip->clk);
>>> -	if (ret)
>>> -		return ret;
>>>
>>>  	pm_runtime_enable(&pdev->dev);
>>>
>>
>> [Severity: High]
>> Does this cause a double clk_disable_unprepare() on chip->clk?
>>
>> devm_clk_get_optional_enabled() registers a devres cleanup that disable=
s
>> and unprepares chip->clk automatically, but both the err_dw_dma_probe
>> error path in dw_probe() and dw_remove() still call
>> clk_disable_unprepare(chip->clk) manually.  When data->probe() fails or
>> the device is unbound, chip->clk is disabled and unprepared twice,
>> underflowing the clock reference counts and triggering WARN() splats in
>> the clock core.
>=20
> Please fix this problem

Do you find these two function calls really not equivalent to another know=
n function call?
https://elixir.bootlin.com/linux/v7.4-rc1/source/include/linux/clk.h#L680-=
L699

Regards,
Markus


=E2=80=A6
>> --
>> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/8e3534b7-ae64-4=
c1f-819d-0ba390737b84@web.de?part=3D1

