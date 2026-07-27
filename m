Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EB53033D6;
	Mon, 27 Jul 2026 07:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785137765; cv=none; b=YM68Nm/a9tTiiREt2vw33+FVY+O6rMQk6GEcfCx+mOFR5g4xJ6ZiiRz/atCb454ClHg1ulj02TgmMBAoY3sq0V0QIl46aGOHscKzNuNU27a2x5B+a16k2GpC/KjqoiuP9dons4SglhV9s/lwxTXq8jp8cwZUip7P/XTqncyITMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785137765; c=relaxed/simple;
	bh=Vy9UqA5VnI2Htmzyvv0HhisYEMF0zRaLavWwSZ/PAE0=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:MIME-Version:
	 In-Reply-To:References; b=nvnLPAIxB3VrOE5UqEdo0gmHrj+ZhooS/07Y4OaLYscMlTTcTetRYRiz3f7DwEiF6+cSIg9sn5LOTlXsthBQmmwLqZSOjX8kqkWJBmS2/ujbNcQpYyA3iN2iac6/yWC8hfngwav++fK/Qtp3OztT+RwEuQwqWUUbKykQJKNs8Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=P4zNKVEP; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="P4zNKVEP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785137695;
	bh=KL5Fp4IzwiE9LqVjgJfa2uxTnxpNuxSkBa/EiDxfGg0=;
	h=Date:Message-Id:Subject:From:To:MIME-Version;
	b=P4zNKVEP3Okc/WRUWorLIztzEzn/LAraM+rLRcufTKRftRFu7okd/cmchwt8bIQAb
	 MXrpsCxFK+G5/T60wCxrPkgPDfmoZxqzwM4xIFjmM29u/wtvDdfpNdJDqoAre5e/eg
	 mxzm7J/gIWKKKc1IsJ2IfwdX8dlHxNXOioHvrWv8=
X-QQ-mid: zesmtpgz9t1785137692t0e7eb53f
X-QQ-Originating-IP: oxpuJSqOZbD9ourOjfZ/7tJPx64hRJQIcJ0XgjKrej8=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Jul 2026 15:34:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7053956593380550659
EX-QQ-RecipientCnt: 10
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 00:34:50 -0700
Message-Id: <DK96HXIOUUHC.1K9YA51CG882V@linux.spacemit.com>
Subject: Re: [PATCH] dmaengine: mmp_pdma: fix wrong extended DRCMR base for
 SpacemiT K3
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Guodong Xu" <docular.xu@gmail.com>, "Vinod Koul" <vkoul@kernel.org>,
 "Frank Li" <Frank.Li@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Guodong
 Xu" <guodong@riscstar.com>
Cc: <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, "Troy
 Mitchell" <troy.mitchell@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
In-Reply-To: <4wo2ylvv2v2kmec4vzycgide3orx2zwjzdjunfm23t6pclknbl@pqtb7lw2parx>
References: <20260615-k3-pdma-fix-drcmr-base-v1-1-ee1af124199f@linux.spacemit.com>
 <4wo2ylvv2v2kmec4vzycgide3orx2zwjzdjunfm23t6pclknbl@pqtb7lw2parx>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MM1NxodbN5/S3Fulun2AzcU2bwsSubPRAS/8dmW9D7c/cEviT0q5xYDx
	PMm9NzezV3HDd685eHE+lXz6SrsB1d+umo3UTE13xg1frobpcrAbbJ6fpUvEJSDzR7tAasD
	wcatugMYSxmbzyd2a2ASHVKsRRMTDQ4EMNXLC5SHkgNNlk/Mnsgt3WdIPlU0qlRaQIPI41B
	KDQ0myh7K3HTw8h3apOmkxoWfnImrbx0YaLB1SRG/bDaEIJ6a0WLGO1sJ/Gsj9Z7zCohEWl
	zzB/7cpoqbZwHNzEHc5XCF1Rf3kONGAEW9U0+fxxqMQQSHfU6tK0V4WSjrwoSiQRTwJT+Lk
	dkBr8TbisNzHbOAEsK7y8AIlWZjZf1XbpXqn1vBs7i2JWoqsWLvroclUA8mXXwqbDoAxFid
	cr0hb1GMQR4lNcJsAUFQYe+pM7UBo5jpMKWULpTO9ys52aR3xEdZ0PNW7F+IJOr+8Ci3YM6
	Fb05B1CKltwp9UQdbRQGPePywvQrwOG+1AGCxv6Oq/gR1ihA0XHXzeLdP3fAIspLHql3vy3
	GMjzAShQk0/WxOZ1kljc8BNTfJl0So+WSn4gVftPHgJ6YVFLwm4m0o7Sy+t+XvDLcJ+qDtm
	3udoHMWqmVcIMA9myhEbRGqMZipuPJeuvW2dPlR37QRvG5qWq6p0lY6rHv0Oqt28gyas/tf
	/C8YWE5ljA6+BnpLN7BoftkeVQP6dkPv8Cv14qQ12cQqwtYKG5u6cPFmb3N1FoiZi7pmEDH
	bcDGSnrOhLOb7wETVRp3g/nUyTrF4ee+G5neP6iZlUMkKvmMOLkKpU1beGUP8Yx+WyOySZy
	NJkZ+u3PXquZ4Qhfruplpro0dIEG9NmyKpxg9gdi8JVArs31cRoTFlJPxuvXYHYRul9f9RM
	MJpR8foPpFFglu2m5jqN/0NLI0/eEW6mtQJ6QEqfsETe/lXSUJdWb0+c9X2XtNdI+6/ImZN
	pIEHj/AwpOvu7Auni4Z8hEU5soWAFx+PNm8ujvxvpvuhkO8FL8qFMOdQsOaXL+oX41vEf0+
	u/MkzF6Lvid+MoS58hc0pT+dIYO322VDTI8olgjTiJPZ6iLYSaygmknERwutaMBY7Yf+MzJ
	6oXPuoz1wxEkRHhfqM3ldoeApLBQuMYsQlsool0V59LOC10XBWCqkZqZ+sFqnjDnw==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

> K1 never touches DMA request numbers higher than 45. It's not K1 who
> needs the extended DRCMR. PXAxx needs them.

YES, K1 does not exercise the extended DRCMR window. I will
update the commit message in v2 to avoid using K1 as the basis for the
change and describe the corrected K3 register layout directly.

> The SpacemiT K3 datasheet still 'incorrectly' carries the base 0x1000.
> Refer to [1], Section 16.1.4.6 DMA Connectivity & Assignments
> which still states 0x1000 as the base:
>
> 0x1004 Request for SSP0 TxReq 0xD4040000
> 0x1008 Request for SSP0 RxReq 0xD4040000
>
> I would recommend you double check with the SpacemiT team to make sure.
> It's better SpacemiT can fix both the online document and downloadable
> PDF as well.
>
> [1]: https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k3/k3_docs/k3_usermanual/16_peripherals/dma.md

The online K3 DMA document at [1] was updated on June 24. It now lists
SSP0 at 0x1104/0x1108, SSP1 at 0x110c/0x1110, and QSPI at
0x1154/0x1158, all in the extended DRCMR window based at 0x1100.

> Before we flip it, could you please confirm your source fo truth:
> did you confirm 0x1100 on k3 silicon with a real DMA transaction,
> or from the datasheet? It would help if you could share your
> test setup.

We confirmed the corrected mapping on K3 silicon with real DMA
transactions for both SPI and QSPI. Both were successfully tested using
the extended DRCMR registers in the 0x1100 window, so the change is
supported by hardware validation independently of the documentation.

                                            - Troy
