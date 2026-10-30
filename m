Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793345738;
	b=lK7IBXESy3214M94QIbED2QbOl+8YtaYi/Iq3sBdXIWoym3Mlwmo0ECNc5OGba/kYW0g
	 2X9pQcHpsGzhxR+xOihjVjWiuAUfHyK3hwX08gNr09xd+9QjRtOF1VcIE2yvfXessCRHh
	 ea4/C6srYe1kKWZMWCXNjPtn7L/GWtG1IMyxD/49iu95rBWW90sljlnV0/X+KuZToZC9v
	 cdxxX0qM3P+Vn3y4knM16MFLkwHruJZwsQd68M6Ka3t9evp93b3hQ4XVU+5klfz3Z/Rpo
	 shVchyJc9CdWu2SN+u+ZL4/UM9mgikwxjBEoYFXDtqdikVBi9e8P1WFcs7OqKWpVRBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793345738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=eGiW8RvcVr3fwqj1crm//CbfJIk1OPn7AoDBhadQcmo=;
	b=sJ/kHY2HH6aZeArt12accmcldDUCrNdT3iA5pFO8mNbbIw1wGGGPMSuXycdPhKtbAege
	 XjY2oIge1xqPIt/kYn1h+z46dVCzCaYYmd0/8BkTtQ3IkhdKUHxvS5Hjp/2SEet4cg25C
	 VIkzhlEVw2g8bbuVhJou/DGrsB9hIY+XLmbC6SSxrWGevfs9ItiMgn4AL93/dhV0lsCXB
	 FJIAA209vysnOkh2PehOTnPN51+epZk/P7qClR6b71qwGElCoPeavM1YlIQG7zocmvkIm
	 A6xH3WuqX7N0R2NRAjAN+uF3WPO8m/Nu86GVsNM6MkgRw+B3cLnm7IFpu4/fLccSS5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oxtxUsyW;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AD6606A31A
	for <dmaengine@vger.kernel.org>; Fri, 30 Oct 2026 07:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2AD6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oxtxUsyW
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c49df71182dso53634666b.2
        for <dmaengine@vger.kernel.org>; Fri, 30 Oct 2026 00:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793345736; x=1793950536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGiW8RvcVr3fwqj1crm//CbfJIk1OPn7AoDBhadQcmo=;
        b=oxtxUsyWkSUGcx88r+mZxY6yEP4cgJIGdQTXTPbFz0lHuMrHqGliKsZYbZiDVutwHi
         ORPZjHLcA2o5rgEh0skN15D13RN5+/vfSVda8NE4B8poQwtsg5xZPf4IABCrZcPyIx6N
         vLN84EmFodtwQnAT545kbEHJY4WoxufJ3kbqeuBU5STtwmL5kkjXMlib8K/4KqtK45A7
         l1RvaH8CnumoW+SVn0S/iqnq3Iq0bmSezASKgF+G04MDssAp2e5MpYzBA6cZ54qBZNaY
         SpA7U9w2NDAzZH67aEGaanQ99/jiA9IZZTF99fQkjP/2kcSP4mLTTE1kPc3TUblfZQdL
         a3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793345736; x=1793950536;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGiW8RvcVr3fwqj1crm//CbfJIk1OPn7AoDBhadQcmo=;
        b=mb4f/J17L+77qwUFaxvcal/lpTilVQdIbrEX2+btnM7q6eruG4fPP8zgt53su7P7xo
         udTH9uHSFc2G6V6F2RA1wUzT6w6klsl/lM9aTY+XWw8PKqka0KfWkN2THDFKr+QSkrbi
         YZetaqb57IPYc2SZ+g+JD73movP+7R1a+QbIULH8m/0/qfog+p+ONx7/2jyJBIGC4ycL
         UQ+M95goi57+5wBhK+pPBolBq8XoJ2vPY/48CFqybZ/gFsQFiOwLJ4L7zg3R17sMburU
         FhdODLSFt0jNy94OKXlEsry8VELtzOsvgXk56PawLyWmvXws5hFjFnBUxyruFMv4qAcO
         SfxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjcaqKrQYAz9V1IIaOum74df++juOxya8GB7avvLsceiOANQu7S3wOP+4XqIpMxXKVwTeF6AfQVeM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrcnbJfp7xK7ZZ7oUHNf5+wQGdpnHv+ACa8gyF4lfwkQWk6J5T
	ameEDKZPSLv6tpvmrT/vqFwqoBgzWWaJuOjaJHeV5BA6W6pgfEt3rjBj
X-Gm-Gg: AYBFou1eWL2XguTHHkjnPl4cMeximZ0C8XPCi2kaqco2JaICVNv1qOT1LGfKHbg/Saz
	C9D5Xk4AE099u4UYFAj8/lZj9zH/c2419Qp6hYZhGOVMFas4OihrqR/GTJIuHyPhT07HBg+foCr
	mlrEtqLZwbRSIy080s99IBZAzsUYqav57dw6fh1dM3TnOCPmzgdN9SFygwP8fYgQLeamNcvKI4i
	jB1yYTicsU6q+KrsLlwf4rdM1w0w/on6m6rqWULIe76un0XkJbaK/BmWlDBXLJ0vvxUvptQj3TX
	EaAeb2605ol11d5BjAA7ZOb0iXL/apdGwHYGN8mn7fsoOSHQ9MolUuK4ItQhtSKNo20OV9gmo2W
	Wl5+mQvqVcCVT4hUM5x1iYwpo3Xvk8SK8JTqq2Np4crOTvIVK9rt0bL0VqTp5N+4HJjEBRaU7Rv
	JQrAHok9nd5EKOokEE9TmQzEQhd2RzTcgndPae2csVVoel9zTfSb2h4HR3kayZpYJ57f75HlDTx
	j8SPIPUTaE8elxm6bz0LqwuoNOejGt4CVdQYuCpuxNEFCJ9LwZxnMMYLEFcBv7NspCk9ZrvPc81
	L9I4RBqcIiI45iEOMgw9mHk1819vIQAkNJWy+UcOFQElwHQFPmwNqP5IM9Aq600YiI1TWIA9uRI
	C/uBBf6qSpGvpyzyZLydDGltceyomqTsO6RwK9p1TN/I0NQ==
X-Received: by 2002:a17:906:c14d:b0:c40:4f39:22e8 with SMTP id a640c23a62f3a-c4ca7acfb41mr120166166b.44.1793345735937;
        Fri, 30 Oct 2026 00:35:35 -0700 (PDT)
Received: from [192.168.1.229] (20-144-89-188.ftth.glasoperator.nl. [188.89.144.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc1920csm34203666b.5.2026.10.30.00.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 00:35:35 -0700 (PDT)
Message-ID: <80246e46-8b9b-4cc8-b3a0-b07f9e5aaf8f@gmail.com>
Date: Fri, 30 Oct 2026 08:35:34 +0100
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
Subject: Re: [PATCH] dmaengine: apple-admac: Fix position one period ahead at
 period boundary
To: =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261029105908.22809-1-sn125164@gmail.com>
 <E5478149-FA00-4A41-8CAC-7E8CF8578473@cutebit.org>
Content-Language: en-US
From: Jacob Procee <sn125164@gmail.com>
In-Reply-To: <E5478149-FA00-4A41-8CAC-7E8CF8578473@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/29/26 17:10, Martin Povišer wrote:
> Rewriting admac_cyclic_read_residue to avoid the race altogether would be
> best but until then, your change looks to be a strict improvement.

Hi Martin,

Thanks for the ack and the extra background info. I would love to take a
look at a race-free version of admac_cyclic_read_residue() as a separate
follow-up patch; v2 of this fix follows shortly. A complete test setup
is ready on my machine that traces every position read and logs the raw
registers. If you have any pointers on how REG_DESC_RING behaves, or
already have a direction in mind, that would help.

Best regards,
Jacob
