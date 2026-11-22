Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795389233;
	b=xHJeVFWHc+Fe7+MPUG8N/6EAwJO5bwc3uD+RgdctaqfTdn63XKn9QH4d0xC7WKcO4u2B
	 hpGJAymhPx1OqPPQbulWviesQHtQA1hZtx8Lt3lclD0DixV+XYwpPEdSDoOEePQsu0jcE
	 kzlobCfbqhHbnqSH1rQMMNPr1c5LdsPlqeteGGOLhULDvgNOYyHUrZpPpXxHAQIoXX1kS
	 /dHNuJIUvCOUvfhXutXmGpckS7q2/cs9rQmKf/qstNV70VS1I1V1aqvKGsAA0JS7nAT4v
	 xfo94u39uYycShC4EZB8orxoV/6D1R3p5muqes15o+l+DWBf4BcuglnMaRBGIlJ4CgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795389233;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Uqesg7WKqhC9WVOamLuXbk72+8gOLRbYq5v+fNOaRCw=;
	b=vD98a6+MkTuoPWvIZvALFz7JOdXZ9sdK6rDFJzby2T8CZk8RWWKcYh9lXy6YwJ/c8xe2
	 FIUR+EDpAzh31ml96Vt8xeRaJsNovuyf1fvh7311r3xf/68KT/vVOYVbFzq6q3bmNxsEw
	 PLJ5KtjzOJgq2G0va0uUaRzYK/WkONFdCkjNXHteOMtdX7xwifAq+OX9lCpxMA7KO4GYc
	 8SKyk7ym3PpGDNVo0ayroaxuPRE3KsMiU2lYvLVs7njoWeA3AiB+uQfjKshCwvS5sal2K
	 T/kocBleRfFGWAGk5nkP4Sl/SZs5rnFIoS/YSKGxaFGjj/rzHqigLuAh5utfPV4V6xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Np8Zt5tX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337A9606A31E
	for <dmaengine@vger.kernel.org>; Sun, 22 Nov 2026 23:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Np8Zt5tX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E4711F000E1
	for <dmaengine@vger.kernel.org>; Sun, 22 Nov 2026 23:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795389232;
	bh=Uqesg7WKqhC9WVOamLuXbk72+8gOLRbYq5v+fNOaRCw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Np8Zt5tX5qnZeku1ZR7Cwn2mNTLssVPbLKbcAd6ZrqTa/w8aRMs/FQGgn/v/f0fD1
	 J8FtUnGyFnxZH+7aqm/eXGKe6xPwoGewr2vylyPiSHX2zsu+d1axARv3dyv+qID1/d
	 EzbjNktE9MSLkNRI06nVykRGSkU4w5T+qokh4jPUS52TsxnI/O0f/n5BhNa8D0FLLV
	 dCMoYPNEMPM8oGQHsoyin6LO5BPm4AFAYfrjKafPZ9jGJEzYXCxuPxLj8G/fnlWSaK
	 Bp2BFRK447sprWtNDo+bMV+1gkWxANTbxVRwkG5GdyPIKDHB2oTgB+CsEDNLeWNSRH
	 WPmU/FvjhuWcg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso3972511e87.3
        for <dmaengine@vger.kernel.org>; Sun, 22 Nov 2026 15:13:52 -0800 (PST)
X-Gm-Message-State: APuU4Z+SW5ry8d0u8mbDNTxPS8Y58ovEcS2SxAn3tg/EtZwxCOS6w3eT
	eKXlXA0offv5QH3E3lVRneURNWJR7vuTCor2so0IhzOfHHOoxN0VD3fhP21scvfzllKxIigrVus
	upFD1tQQ1e8dfBEuqVr+KiqoBbZce+T4=
X-Received: by 2002:a05:6512:b9d:b0:5c1:4a64:ca0f with SMTP id
 2adb3069b0e04-5c1bc81230bmr2927823e87.31.1795389231275; Sun, 22 Nov 2026
 15:13:51 -0800 (PST)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-ux500-dma40-powerdomain-v2-1-8a0ebfc75b80@kernel.org> <sashiko-outbox-227882@kernel.org>
In-Reply-To: <sashiko-outbox-227882@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Nov 2026 00:13:38 +0100
X-Gmail-Original-Message-ID: <CAD++jLkAmEa_xNuJO9qqLU6w-=1+sM=f5tqsEHrTgYCaKHcCvQ@mail.gmail.com>
X-Gm-Features: Aa3M54r5H93aTxydLJ0ujwPJoMIhlr_QeooGnZ_E_JrGc-b1gyBGpl2TAgyHuHk
Message-ID: <CAD++jLkAmEa_xNuJO9qqLU6w-=1+sM=f5tqsEHrTgYCaKHcCvQ@mail.gmail.com>
Subject: Re: [PATCH v2] dmaengine: ste_dma40: Use power domain for LCLA SRAM
To: sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 11:02=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] dmaengine: ste_dma40: chained dev_err_probe() in d40_probe()
>   clobbers reason

Aha OK I should have fixed that too while I was anyway fixing other small
stuff in the patch, I'll spin out a v3, one moment.

Yours,
Linus Walleij
