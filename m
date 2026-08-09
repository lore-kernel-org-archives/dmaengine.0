Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D1725A321
	for <dmaengine@vger.kernel.org>; Sun,  9 Aug 2026 22:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786313771; cv=none; b=jSYLgnbb3IB/JP8ODde51L+DSBwVHfGvniKMG6Zv8NcFgS7Yn4eeAWBmIcLwNPuvWuVHk+euKcni9XKuA4tb29zD3Z3unVyYWqcBFnF3I+Iw4h/2XlNetGktuIHfmN9FX3ztteYdpPcG/HQ4zO7mI32CZoJzqdEbEHrJRR8qaho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786313771; c=relaxed/simple;
	bh=IHn8oZ0zecHgsYzvQ4c7hdnvmHb/ysPai90QswJYPfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wb1BNcd7bJZF0s9EUbkz8GzU5775QuRefYCTdI+kWCXfE8st5XS/hdYj57IPX1302nXNFBOujmwuWeHkVcynJ9F1H8qAonzfEsEsk47M2VvXNGwbj8mzHhbwQUexIfrtqUArVglDX39beoWpmlTkYkITjKxhmh+nby7/S05YNCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TjUZX9lc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TjUZX9lc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B6541F00AC4
	for <dmaengine@vger.kernel.org>; Sun,  9 Aug 2026 22:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786313770;
	bh=IHn8oZ0zecHgsYzvQ4c7hdnvmHb/ysPai90QswJYPfw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TjUZX9lc2KGpRuLZ00Xm8ZVQ+BcX6tOcklCDT97NH+mp5mKoKufznyAXWs2jPPCNQ
	 FLy6+7pwAZmsPdbxYsubQLTHKCZJsff2Lqrr6kGZakTKhGL98EDoqCtEmuNjqiJwAe
	 ipA+lR/xyBSGMso16aSHQyrXSVjWkKsx0ZLN5kNaZXaOgNQUt84GY1Guq7xSD03ekC
	 ni5KzVF8wd618k4POpKKcWg6OZ6jnojOpDVdirQKGsRzYhgOB1yPT6jxG5J/BbBJaG
	 XacCKiI/AzhLsm2f4/JPDA7qnE3qoeyid6cV+oxyfNYwTzbpJL/Pg8ggNKxuRQFXUp
	 dvF8razTMYFvA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b0148201fbso802699e87.3
        for <dmaengine@vger.kernel.org>; Sun, 09 Aug 2026 15:16:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqnSgnkqvEjg1ZOSLv/UUQJjfIMVmf0ahx9pZ+WVbU9whL/53JaWz8Bsv0AkKgVuk5bbj4YG9G4+f8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdMikFoo7Ef+DxS88/I0JJlBwf49nRT5CowbJMhpBXOjdEIpG7
	hx3er0Ux078+mEeT9gpKOySjYeoaEJ1rpsAX4tPjqMRFVtGt4wubWWZDtwNa0yewjtZL7oyvuj9
	a2yVyVomQGMSglKuh/MRRJRjW/i60LOw=
X-Received: by 2002:a05:6512:304a:b0:5b0:eda:de2d with SMTP id
 2adb3069b0e04-5b30b73cec6mr2290080e87.19.1786313768907; Sun, 09 Aug 2026
 15:16:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808105657.2762974-1-lgs201920130244@gmail.com>
In-Reply-To: <20260808105657.2762974-1-lgs201920130244@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 10 Aug 2026 00:15:55 +0200
X-Gmail-Original-Message-ID: <CAD++jLnAr8jcnqrFe+h5tjw_TJSuXChSS8PMd8WX5LAO5Q5PNA@mail.gmail.com>
X-Gm-Features: AUfX_mxw6Et_ErCVG0q1-Y3BIuXJcHPuyvd84V3ZxvHfMVsEVCyxxMfdkHrG8m4
Message-ID: <CAD++jLnAr8jcnqrFe+h5tjw_TJSuXChSS8PMd8WX5LAO5Q5PNA@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: ste_dma40: fix autosuspend cleanup on probe failure
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Srinidh Kasagar <srinidhi.kasagar@stericsson.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Dan Williams <djbw@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 8, 2026 at 12:57=E2=80=AFPM Guangshuo Li <lgs201920130244@gmail=
.com> wrote:

> d40_probe() calls pm_runtime_use_autosuspend(), but its error path does
> not call the matching pm_runtime_dont_use_autosuspend() before
> disabling runtime PM.
>
> If the autosuspend delay is set to a negative value while autosuspend
> is enabled, the runtime PM core increments usage_count to prevent
> runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> during cleanup, this reference is not dropped and usage_count remains
> unbalanced.
>
> Add the missing pm_runtime_dont_use_autosuspend() call to the probe
> failure path before disabling runtime PM.
>
> This issue was found by manual code inspection.
>
> Fixes: 8d318a50b3d7 ("DMAENGINE: Support for ST-Ericssons DMA40 block v3"=
)
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
