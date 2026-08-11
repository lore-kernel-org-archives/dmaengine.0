Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AFA30566B
	for <dmaengine@vger.kernel.org>; Tue, 11 Aug 2026 20:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786481105; cv=pass; b=IJYW9dOQFxy15dK4G/mGFVS/AfpU7z//xZohFKx7C4qxibaGLDw5Tt7n9OQrLcxWpJHqRafBiCQrISco1ArJJSi1z4f+QbcncHqmNQBWvnn001uH8ciQc2fW0eKeOAMXSicIuejv6kXpYyFZ1Oi3M48sE2guQFxxA+CLTmwDmrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786481105; c=relaxed/simple;
	bh=ebBozNdmAkIjmVYbImV5EG4YbkTEF+TNKKLKSPoVW3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rbaRLzN+8XvWgwZ2WTffLWHZ2T++QOgb/qqHWjcNWJ0xrEgoVisEbPRLPo5BXVq776GGz8MUtlMMQbmK7zagA+qZdqMA5xFW+5NT0D0gsmIUojuOnUk0PyN3U6Pvp41aimhSKpLbjxW1WLL+HN3S+1o52lmBo1FV5D2bx+im4FE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=et9iJObO; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="et9iJObO"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cacb8416a1so4646185ad.1
        for <dmaengine@vger.kernel.org>; Tue, 11 Aug 2026 13:45:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786481103; cv=none;
        d=google.com; s=arc-20260327;
        b=hMi1FJ9fgX+osOeKJDprrI40JVXRUpBChLYqkYnXceosayyp3YBBwaC3c/F/QIRmRj
         FXjhBzMe8x4y3dIepMj7m7nm+ZSTmwvu1m1FZE78Lcu7bw4aVMFQG9haHVU/cFysnTFw
         y/catvSrOmt/x87egr/uiHspd1mXnemqPM3GESjqEugkhXLa/KfS2vhX/Nu32pJdqBUk
         FynxMibrxttu055WG3NvXi4UDllROM12DpnEIrhxSIzJQSgIEQLTMM82dV6oprcwIXzV
         LiO/4sV8o1Yw1oKavJWPsbhChxCa7cQS7W7JO9/eejsXGdPQlZWDHEpgH9KB1yRkkCz4
         FPjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wqbaQUnQzBGC3bfWkeUGkpxMuvGFVYsWyDUh0SAIiX0=;
        fh=/+1MSBBUVNo7ZlqblRwDGzPz8e7VDA6d/Wxfb+pe2OI=;
        b=nA0FFM2/mxOdOX0EhQlHuKA6OaMaGgCtoM6XE+td6EoYFE0FC0x4/GrB0esAqpJUbL
         qhZYqSh2lUn4v7npFhFiKOrbA/2CNCYlRR9E8Ofp3MwWROTZB6m9WodXhzMXt+SE82Mn
         FrOBiaabdm7XSLyCz5FQqzg1UowyX+TAvRAun7r6MSrfTzjoN5eoOxdEsOjiCC9yD/wr
         UOzCXCuLtIu3gHw17leqxArRXoaiGiR2GZ8SFw8ICn5SrTpAOpB0b4PbGS+SM+lzWX3L
         5a/upz8A0mU/EosFFiWKJlHC2mWaFw8zJoyoB/W1g6iwNH7dnIiV7EPekHc/kFMnTizX
         F2vQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786481103; x=1787085903; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wqbaQUnQzBGC3bfWkeUGkpxMuvGFVYsWyDUh0SAIiX0=;
        b=et9iJObOlguBO2zex591WtdpvhBe3j9E8fC/UN1zKlg/bTMSq92WJsiM0IKdkbxfK5
         zLFw+6y6tXKsAhPkq6l48ZebWd3F/KC9V9uYTntDIEB1IFYVY0mBe5T9hK86LomM8IsX
         ZrqeVfd3qbGdY4oqL/5are/oO+83B+DdPI7Sp8q0L2or5AXXxLBHG/CAD4zuD6qdC/k6
         rz9EgcLyPhvqMp0TJyX9QbvUsfQ/Rj1j6YVCN5JY/2u6lScIJdUOmvQXjLIZvS7aD11N
         4ozmfohNnrPI034uCgBbL8mRovM2drBqAak5PGYIzQN5wHRIh5G46ygKxasxEMLYjSzr
         MNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786481103; x=1787085903;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wqbaQUnQzBGC3bfWkeUGkpxMuvGFVYsWyDUh0SAIiX0=;
        b=Lk4Dsp2esrVBPlIPOCE1wuyKT/RXNcMC9bgBbph40wtY8ICQPo/PftytJSaR3RSLv6
         UGUYxor1wpeMCPKsZJXcF4BcQ7gfQbqRdwB2gepGJZxKYygVybTWBHjf98VyEqhpYVRH
         jdGkUwquLgSCGJQo9O0noFnl2auRgTl/4EYf0O8QPSgYvE/WInUhXFPFgbAi/D5tmd4e
         lxD2YzEaQ1sQ0IrMrOhn04CnZ+RA/OMzzfwfK4rlJNbUNMD1gB6JM9CgWjfcrfPYGx+V
         Hi1qLT7dAiwNP9U2zwotXuIzRXV0iGfO9sQPm7lLhHLORTbZnLBDtQSmWciLS72CY752
         VH6Q==
X-Forwarded-Encrypted: i=1; AHgh+RqwtVQyccykvQxvuNiEDWc+O51zyYbdHrRlXj2sjfQPDB20e/11wp5ipFs9DHS2aZ2r64kQUWTjNJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJEGoKAqDFH0OlE4EYo+UZ2sTWYFAp/xyQtaikRJN23cDa4UVf
	dGu4Vw+edCCUJsR0aKBGM+6hZqqXz18oWagHN1z/ZUYFt+okrqIUATz7XlH1liEgSTzPu42WfQB
	7LAACsLpHyCCKtkFhfUH/TbqzV/sZyUg=
X-Gm-Gg: AR+sD10BrG0nvrKR2F/LX/JNzPJRHUIpZ7WWRFyocis3UqrVTHmm6tyN/F/wHfZDZfq
	C4bvm+rwr3tyNEo+U3V5QuQ/g/wFyZSmzS/EBZYhULDALAUfrCRqVsSB34xv81+mYGww8mHQakn
	SAprpPlRGUCHVYIR9k5A7ryj1kqzhlEAwe9uZ0MUZO4rELrpPC6YXm8fAqAultFeDHi1vJ6tgEH
	drC+1QQbCgE28qNemU8yhizd/sdvuMBrBLCv0fB3lnDA1LZqb+Rja4CLlFvAm245nU5lRDfYAl2
	RgXO3YhsAVm+wyFJM/4QEKFaiLU05Gjgl5hTORcDSG+/o8NLI0gbF376zR+6uHyb68RBLtBw2UQ
	rsQ==
X-Received: by 2002:a17:902:d552:b0:2ca:ed57:8586 with SMTP id
 d9443c01a7336-2d345713a25mr1935985ad.23.1786481103129; Tue, 11 Aug 2026
 13:45:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785183549.git.allen.lkml@gmail.com> <cover.1786384168.git.allen.lkml@gmail.com>
 <anr-hAQN5-jGoRp6@ashevche-desk.local>
In-Reply-To: <anr-hAQN5-jGoRp6@ashevche-desk.local>
From: Allen <allen.lkml@gmail.com>
Date: Tue, 11 Aug 2026 13:44:49 -0700
X-Gm-Features: AUfX_mxHcMoGgmljEHPHJV94zyVLIIoNYewI02G3Dpg4Ea21-WF-yo-zSmxvz-g
Message-ID: <CAOMdWSJyTovoEvokaHeOZEu2Z7UVhF8X2_uetcKn0_FySgtn9A@mail.gmail.com>
Subject: Re: [PATCH v3 00/34] dmaengine: migrate channel tasklets to WQ_BH
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

> > This series moves DMAengine client completion bottom halves from private
> > tasklets to a common per-channel API backed by WQ_BH.
> >
> > The first patch introduces the dmaengine_*_bh() API with a tasklet backend
> > and converts virt-dma to it. It also updates every driver that directly
> > accesses the removed virt_dma_chan tasklet, keeping the patch buildable on
> > its own. This separates the driver-facing API from its implementation
> > without changing callback context.
> >
> > The second patch switches that backend to a dedicated WQ_BH | WQ_PERCPU
> > workqueue. WQ_BH keeps callbacks in softirq context, while the common API
> > centralizes initialization, scheduling, and synchronization. The
> > workqueue helpers remain internal to DMAengine, and dmaengine_kill_bh()
> > drains scheduled callbacks to preserve tasklet_kill() semantics.
> >
> > The remaining patches convert driver-owned channel completion tasklets.
> > Tasklets used for controller-level processing, recovery, or other
> > non-client-callback work are deliberately left alone because the
> > appropriate replacement may differ by driver.
>
> Right, I would actually expect that virt-dma (and others will follow the
> example) will switch to threaded IRQ instead of tasklets.

Thanks, Andy.

  I had not considered a full virt-dma conversion for this series. Looking
  at the driver, that would also involve its descriptor pool, queue and
  active lists, software LLP and cyclic handling, and residue reporting. It
  would therefore be a substantially broader change than moving callback
  delivery to the common channel BH.

  My intention here was to leave the existing descriptor lifecycle and
  scheduling unchanged and only move callback invocation out of the
  controller tasklet. I think converting the driver to virt-dma would be
  better handled as a separate series with hardware testing.

  If you would prefer not to add the completed list ahead of such a
  conversion, I can drop this patch from the current series and leave the
  DW driver unchanged for now.

  Regards,
  Allen


>
> > As agreed in the RFC discussion, selecting hardirq callback delivery is a
> > separate API change and is not part of this series.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>


-- 
       - Allen
