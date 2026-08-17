Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35E93F2116
	for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 23:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787009093; cv=pass; b=EeaqsMuFEnaR1+yzBNA41hQVdPGE1pmkI31Cu8ywUWRGUR+QRjdPTtLpdSWfIt7MKBELxnIgr41blWK3hoOmgsr7naHbgcT4uSQvScSaEeOb+Z2OtAPluPr0CBc7HGqMqjZNXUJdOzMohyUqfuHDxnjx/Hr69j15bPBvc422AJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787009093; c=relaxed/simple;
	bh=EIYXnjCAjNr4smxO9uOZzqY0HcNX6do2IlpDo8+jIR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A+23zwFjodDQLf391O/EUYf5S1RpZgCP9TnnJ6eHT8znaCejLaO27VOd+pYHy+6kIU7E9hSI/OxwFdPlCjEm1tjDGqWIKp4GB247HNuxzAc4P3+jebQ0bRCrz59kTp2eu1+tiumJl7Gf3iFQyuPtUvwrk+9xcFykH4yoDFB4rnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GqYPC+Uw; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqYPC+Uw"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a18ef236ecso872068a12.2
        for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 16:24:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787009090; cv=none;
        d=google.com; s=arc-20260327;
        b=aBcyVqhzv2TfZ3aYQWGKuwWWbiA83bwDokhJZqDG3LwFg8e6I8NqPrNo62kLmA4PsE
         jz3sTLkrZd04FP9nZ0vfnGhe3uf1wWrCEfyrJxOJqoiL0UtzjO8DczoRnDhfJvt1DliV
         9oR4cmaJlPd6d64WHKrdC+2mFDxmnenmn5HXVTSOFCjJ60S5DJ9qCHCM/es4Aa6TkW7o
         7IhLtTglr5dlbZTDTJkTc4plw4mah74kE+Zl/xtt486DUV/Yxsm3LAn9JW3ju7U0QhVE
         pZQNIU4yZrVT9gj5qzSymLs0M+HxD9IuSz0fWagvn1P9fsk09WafxNpsn/kMiW97VVfW
         ODvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EIYXnjCAjNr4smxO9uOZzqY0HcNX6do2IlpDo8+jIR4=;
        fh=dUeKDhMOXo0ZuiJXO42iZFRX5xupr5bqe6uNoayrgwY=;
        b=efF/S3woIAXyZEqpVb5cUvdkzoWWxBSZpUWhGPLE3tLkGalvPqXPMkOTN5oNyu0Fnu
         T2QEVyVP6iXWSuQvr3SmoNz6VUX7Z9Dn+b1TwPoSWcS5J6afl+tjNWaWsnUiPlcp+/kA
         fsAqegLN57XqsAzwlGRQE6MUdYkjNDMPf37DFEinwjuCnXkIPWa+NE0STgw9J1daOrFo
         0gw2SCUidWsOev3Jb87Bd/H/0j3qtFNQt3qnlX5OrGo4wtol40ExM2xG26jofAneQNzd
         +F+jEbTlgvl2sB9btPemlCQIqvndw0YD7fGlmYG76ncUB6lntB8Hhzzfaa7/ZzpYuLSw
         CSlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787009090; x=1787613890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EIYXnjCAjNr4smxO9uOZzqY0HcNX6do2IlpDo8+jIR4=;
        b=GqYPC+UwlRI4t9fUjSYh4v/Rxk5pUmwhP7wPggqGw99MSgWfWraeP0VvoBiQmm6inf
         egu3uZ5zySjeD44NEvvoE2kfnVpj4HRo7atxtvL9QsK4ZtsyVSVL7YWgs6qUD5rTGWYE
         PnaaL3JxJ0Ho8iZw4stXgcE2BXWcgik/2kRC+8jDPYhJPtiq0+OhjrGNDLl/6lCBnJfE
         7eILRnuD+7b0cgiVeXmFMgSPlme482UreG9//fcgRJPXIXh2Til5v4U48EcV3WcXZobd
         tFfrm8AzO8fWL6uqhnV6l405qBfq96mAnJXPPv4fpMa2GWDqNztulLw6YRVXyzUCzJAp
         6lQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787009090; x=1787613890;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EIYXnjCAjNr4smxO9uOZzqY0HcNX6do2IlpDo8+jIR4=;
        b=NUHcv9185NdY+UVei/AyOjfnRlV6x6UPtdzrezM/d+lKH70YhzfUPKIgcYGzJEULlr
         8bjIwJgv7xh/QtWFm1dUOblVfRF6vl6pwN708Wd3CvlsR1nyJBNDHecs4ZTQCTsKaMMm
         1j6yxZMb4ImDKd1Xo5lGtoUpngMc2EQLVdhZwldWVPO1HsjFO81o4XiwNUzQSas9XTSK
         NjETSDoxzWjaE9cRYFj78jlwFuaLrOPugGG4maWosc27ZAGxHa3KV8PZZJoYP4hXu3DX
         WkBvBtx3r5tmpuYeQR5tUQVdmOfS+xpOqjAR9LK3kkZgGJSQ8wHSkC46ZqqNxjyzsANG
         /s4Q==
X-Forwarded-Encrypted: i=1; AHgh+RrQE1ml1MIx8CFJaWsDUi/rOTn/aZRjRCa5F7xdGV8Oe0VQjZZNjyS6oVT2TFcgZCX9X+z57G1r1e4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNEfuzu9/oOB9IaMLrjumZ4FB+RZNfgXqyeD8++o6wWdFTG/z1
	bs+wYNvg8rcNL8NliEKjqJzcrd1VIyC/dOWTcvUwRy57iZlSqczoKBFDiu9WVmjERS/iaLw7jMM
	YBaPU8C1PxwnxuXUCHtKW5ixIvqTka80=
X-Gm-Gg: AR+sD12FOxAdmXQmpTp+EUIFM4gksdWEElr0UCBJdGV5wjPUBUAbMQCI9CZMVmLeeON
	zBPp53XU+iAdVyE3VHh2WtTFhHv4r3sP0gLQd7o1VFKvd+P6o3xCjyIINl+MXUEB4CtRj3k6Fx9
	mNRJ2G120fXvMwMxtdmEGenph/Qa9hSzyLYqtabGpoSlh9foQyLmeIZqj5oIbcZCDemqfoWPBLn
	0xNucpvgpcCsqc7LNXkUWolmqMvfrkxd3UbFQcKWYaSda2RY0KhgO6BvKcgXWfU01C3nuT+ZMc4
	LMzGtNj99IRdqGJUDPjWnclP2vjSykQAwuAte72F5g3WSfpe77Mi/0o=
X-Received: by 2002:a17:907:9403:b0:c1c:4ae9:b935 with SMTP id
 a640c23a62f3a-c212a22e029mr832073766b.3.1787009089753; Mon, 17 Aug 2026
 16:24:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818-ti-am33-usb-v1-0-69ac5f92df45@gmail.com>
 <20260818-ti-am33-usb-v1-4-69ac5f92df45@gmail.com> <20260817215828.978C41F000E9@smtp.kernel.org>
In-Reply-To: <20260817215828.978C41F000E9@smtp.kernel.org>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 18 Aug 2026 04:54:38 +0530
X-Gm-Features: AcwNN1WTyBaZvgcQdpeEh6FbkgnwyFmOSVf8hYf16WKHI_bRxJfpI64Z7g1mdQU
Message-ID: <CAOWyW_4GF6iCzZ6VMbrPtn+gkgQe3tZ0U+WP4S1vJDsGxMYPpg@mail.gmail.com>
Subject: Re: [PATCH 4/7] dt-bindings: usb: ti,musb-am33xx: Convert to DT schema
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, dmaengine@vger.kernel.org, olteanv@gmail.com, 
	robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, vkoul@kernel.org, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 3:28=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The custom vendor-specific property `mentor,ram-bits` is missing =
a type definition reference (`$ref`), which will cause device tree schema v=
alidation to fail.
anything that ends with bits is already defined so no need for $ref,
there would be warning if $ref for this is added
