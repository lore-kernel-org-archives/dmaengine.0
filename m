Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6672A3B71BB
	for <dmaengine@vger.kernel.org>; Wed, 26 Aug 2026 08:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787731422; cv=pass; b=H79ZDzjF5+MivKQm6bv8M4TMo6UZshhKeig6+8Uu7w6EdV+GTrn1jGckFU2oSWKZnA9GqborNH/psmrkQJ4zUOyM6JJcX8qlrVZO+zL6rAqrj2metzcLYjT7OqXJ9rolpZ3RvepjWsMVQcgThnSUVooyWycgKBDXw8daM0KjWh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787731422; c=relaxed/simple;
	bh=TGWXhg3kIFRbogyDdU2TFv0HSJZmOgnoG5WYlfdiuIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rUnvIRUdKmpV521NhZ8qxLeI1Didr8+wm9y7noFrt3sbDBKBDrArEu67hUqV7IlXp2S+csAErgua2kNM23nazsac3sGkG7SnU+vXrLzuPQ4m52NEXJ+3fNuZAhyjgoreTNLXheHieSES9SOlk+XnMq6WlAoE3bqm1Wzl42IRwE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qhKm+q3G; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qhKm+q3G"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66ceaade3f1so603822d50.1
        for <dmaengine@vger.kernel.org>; Wed, 26 Aug 2026 01:03:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787731418; cv=none;
        d=google.com; s=arc-20260327;
        b=em0rY4ExT79R6IvZXC9r8wizu2zKSXaEZUj8JeALXboEmeINbDAzpZWiAYA8qG883X
         xuYb1l5pGTKZ4WlyRMRwGbDR5BT4oGlx7F48/WPEq1ybX66KGN4xZunkm/WjfccsaPrB
         8F80AuClnluXHQ0Q02gKkDRl+u3IgCkqZlBpSyKgWk1oZcVHYtfTT5trYeS5QTR7dkLo
         3tNlJv5SEFEAvskoQU8QmsyAxoghaiyotuu03ohEFz2ACAFhpJgbrS4rTVeEw5NbdQue
         KvL8ii3sAkn6y/2BfaCJnKCuKRjoZG8Aeg0v8/PRCC3lGC0Xra7nSqflZgY3aAqTylOn
         puZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TGWXhg3kIFRbogyDdU2TFv0HSJZmOgnoG5WYlfdiuIY=;
        fh=G5UPbsrGRueIaLNGdZr/2DVbzaQQ/RViMJ8dRU8HqaQ=;
        b=O5Tdd7c4V1DzmSot4oIDRDyOxfRQndS7gvZM9PRIqwulHeRv0LNEPzrJ8UWkb74FgT
         +JcAWnx23fwyA2A/rVz4qnUalljHpUe3QND/DX1sAIeiG9cetmBWcaJP+JwaXmh/ZH+L
         NcnQ0SgpyfqNBO3nORicocgI0PH+y3qcB33PeDe8ZC0zqJPVpLRGeAEXCXidhyy/272T
         RZ9ZwUFxc/ySO77x0RScp3sT2x0jm67VdaU2n5Eflo0ZOUZUF83UbraKyw6TFU8Gshmq
         RtXjg7pUGD7BRNHbpOYKkp+Ely0JedF3dDOPet4s5ks+ak5rOkuOV5xHr+hHlJbR4x6A
         TTuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787731418; x=1788336218; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TGWXhg3kIFRbogyDdU2TFv0HSJZmOgnoG5WYlfdiuIY=;
        b=qhKm+q3Gihr2fe9cUKB15n1/234rKzy0OXluD3uGVnPpz05VPixI5TYD4jYKC4qc4C
         kNFPqtSXVqExND+j6EDgkhYVuKClczeJLkxfN3gEilvxss66lwWfM2cRdijfFO6AR+W3
         LuNKQsUExbzj/PeAqciqGXLuWqDZ4Fe1ztZ/6xDYZDlP8ny9eeGH+KgpOhMh/O2RZewS
         tjeEHTX5+nn0gw/PfSaC8S2OG3Vn4bYFKJ/Q7HAq/n98M0BR0bVgJn+yuIpBHHSdoESI
         twquvNRoYCz/m1IFRe3U+O+UTu9JnUYBnLI6zOvNjZWPoz74FtkxCp23bPGzpTv+RoYV
         OiWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787731418; x=1788336218;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TGWXhg3kIFRbogyDdU2TFv0HSJZmOgnoG5WYlfdiuIY=;
        b=YmjKxaM1CB5WYRkNVvVSwODH79lep0TZwSBDH/RlxfN+8dz8TycDE8iKf1KqBFA0Kg
         ko+wDKk4GBhsvuemvkLjnoxNpqGni3aS/+XpxJAiqoMxLxx2pUTSlHOQM1lzezDQBgGu
         49zGL5YHBYGTHc4uceFpztgnkbBgfecGINe5THmafljQVhPctOpGFRkDunKNkB1vfr3Z
         3XAHNYSXwsr8vThmOg0e9GalP06zpJqexD7Y/PoKchxyil8v7U0IkoAiYkWHeT3hQaqr
         gIA2y8niwLFdHTRrR1eSAtJ7mFGbEDPpn5dsrfJXwICgoixsyk1s4X4Uvvp0BTyU05Fw
         8qMA==
X-Forwarded-Encrypted: i=1; AHgh+RrjDfGu+D7E2PSiRI7+gihzC7kKvDj4bcJZQHaHQ08GKQnCP8utf2i/R0mjJh3lLHCFwN8ZVjj+uBY=@vger.kernel.org
X-Gm-Message-State: AFuF++lv9jRb9zu2EAcoo5loGNblJSVhOA9tL+cwhgIx5VTdnePn2sHK
	4BT1AkF4WJL4hz/FCJB4KWDs21Emca4Uz99qagn5+iqU3/JVsVgjQ51ywOa6dtjdwUjGB0x+SbF
	8iB1du2etXSRkXUp+DEJhIkXbyICw0hc=
X-Gm-Gg: AR+sD12TD5ruej/pHtY4fch+Aw6/TX1NIPCpmVMwCLm2YRN95UnLX2maRm0oKBz6Otl
	qbfnqvnNcpkL1L/efYQ1hH3oj3ymfbNfnN7JuG2dJrxycY+D09ymMUF2LaZiTQ9SnYFzAR4a7AE
	xvfxU8V3WANwnh2/tMoiFUok6DMyzA/XIaHoZoQIC5XDrSeyBzbeOcCkiJU/+NIv3b7mxqPpGjg
	joVoV0XkinaBfeOAc33B51GA643NBT1FDU1d8ZQiQLUMGsd1PmlV2J3ysZLMxRXTDuU6O8T3gWX
	NrWN4hGoyM1hRlrdq7qI1l/aHZr6BhEJisucPtSartS4pG4=
X-Received: by 2002:a05:690e:1516:b0:66c:e3b9:f696 with SMTP id
 956f58d0204a3-66d257ea066mr1655899d50.48.1787731418010; Wed, 26 Aug 2026
 01:03:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808112551.2786782-1-lgs201920130244@gmail.com> <578653c4-a7c7-498b-a283-f3b17f3d4191@kernel.org>
In-Reply-To: <578653c4-a7c7-498b-a283-f3b17f3d4191@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 26 Aug 2026 16:03:25 +0800
X-Gm-Features: AcwNN1XeMS8Nn9F7_AMg2pV323zlKWTVjDvTMsgkH5LpvJ4tmdamIR4FLSMBfwI
Message-ID: <CANUHTR-xZpWYjsCAXCe+uRyJS5zuafsxpm7fNO09xRo-LK7jMQ@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: qcom: hidma: fix autosuspend cleanup during teardown
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sinan Kaya <okaya@kernel.org>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Thu, 20 Aug 2026 at 22:03, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 08/08/2026 13:25, Guangshuo Li wrote:
> > hidma_probe() calls pm_runtime_use_autosuspend(), but neither the probe
> > failure path nor hidma_remove() calls the matching
> > pm_runtime_dont_use_autosuspend() before disabling runtime PM.
> >
> > If the autosuspend delay is set to a negative value while autosuspend
> > is enabled, the runtime PM core increments usage_count to prevent
> > runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> > during teardown, this reference is not dropped and usage_count remains
> > unbalanced.
> >
> > Add the missing pm_runtime_dont_use_autosuspend() calls to both the
> > probe failure and remove paths before disabling runtime PM.
> >
> > This issue was found by manual code inspection.
> >
> > Fixes: 67a2003e0607 ("dmaengine: add Qualcomm Technologies HIDMA channel driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
>
> You sent vast amount of patches, all separate, making it very difficult
> to track and respond in efficient way. Do not do that.
>
> Group your work per subsystem.
>
> You were asked to clarify and respond to incorrect fixes statement. I do
> not see how you clarified and responded at all.
>
> Best regards,
> Krzysztof

Sorry about that. I should have replied to the earlier review comments
explicitly, and I also should not have sent so many separate patches.

I will group future patches by subsystem and make sure to respond
clearly to review feedback before resending.

Thanks for pointing this out.

Best regards,
Guangshuo
