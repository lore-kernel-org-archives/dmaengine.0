Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4912DC792
	for <dmaengine@vger.kernel.org>; Sun, 27 Sep 2026 08:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790498520; cv=none; b=SY8v245S0WaC+sT2m4iY4YVFnDQEOTs6cQxo6Vr9PIqssxhR4bE4XiSXL1eGEcY7l5LqHiJC7TGPNvB8zOSfKnt48bZfPc/Ir/Sf9uPlVD7sLhMhhCkZ4Ojw+8KfDfYVXns7f+8Hz4IBTMl1Pal32HdE/TmvsWxoDG7zwtnug7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790498520; c=relaxed/simple;
	bh=ssHHucZCZHVjKYb/oS7uXfR4XRKkhvPwANGA6q6rbKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M570AUji5BzB3l5tRPR4H4aTOHC+bKt9ik8rPNLsd8gwhzdgya8YBmil24QXperM6TIDPYGYGE/cdWob6vukKrRzzSvRcsu/v7WHpXfpGqmtBBjaHMmgYRjtE+vBnHpDduEHkMuVItAjQOBvFWVZZZEvClEphC8JsD/16T0fvHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fFi8MCZO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fFi8MCZO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBD751F00893
	for <dmaengine@vger.kernel.org>; Sun, 27 Sep 2026 08:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790498518;
	bh=NRzW+nL3FGVXxw2LYK9owXXCvFIG562HWQp0Te/h3M0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fFi8MCZOjsJ275yEIMuaIiCCxlfAd1nQIakPRzBDO0ZSeaNvzm8/J4b9L4sKaxW8M
	 7Oc+m/G2RpnI/nHhwSdPnebsRD0rcr1A9vU1Uw2/+OuMg+r+L/1Tw+EOdi/5K7F0RS
	 zgzmeqK/zpy0eiKOEIQvv9CmUfp5/oZsbzQsFR9QCBuhOzZuyB5hVeL2ilUEwJagGZ
	 FHyURkuPTzOyXBXoOAUHmJABbOFMNx6A1/qz3S5ysjJ809lPlyjeK6doE3vzEYTIx0
	 wx69U0pJhQHHmiigaLrjCvdszJTtk0YqWi/UnG/33PCquEiDW7hH/FW0qZVj2Id6CP
	 XnqVIuMnbbd8A==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c1b8d7b5so1822216e87.0
        for <dmaengine@vger.kernel.org>; Sun, 27 Sep 2026 01:41:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzaYpJrBPvZCZisAPqVMXbdVLL4IkhFtuW6g4H/9D92tEeFodWI+PONpm7Ci/zD/LImBfeRGleJ9PY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhdn68biDDRUiL7z3Chi4z4IgZk2E/nynXt9iGWDxggwWV9YB8
	aSslTKbYQr8NgffBMvuxm12x2Ds0RcoOdcPJd+/9rBlIGcaAq0gqAD13rjhn4Tnkh0NgcuXdkUd
	akXqPjfVf/36SfCjqJNteHIgfvP3Le9Y=
X-Received: by 2002:a05:6512:b07:b0:5b8:bc5e:d0ff with SMTP id
 2adb3069b0e04-5b8df09aeb1mr4003591e87.41.1790498517609; Sun, 27 Sep 2026
 01:41:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
 <20260924-dma40-fixes-v6-11-fdb6755020a2@kernel.org> <arU9o0FEP-3wKne0@SMW015318>
In-Reply-To: <arU9o0FEP-3wKne0@SMW015318>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 27 Sep 2026 10:41:44 +0200
X-Gmail-Original-Message-ID: <CAD++jL=A+7iiVoroCSi_C999-OQjC0+DimFTjpp8YmYc4HteRw@mail.gmail.com>
X-Gm-Features: AclHuK_w4ZYWS_e2btsUd-1QpKJrhfum9b-4W5S2D-WmryqqXQlhvNW4i5Sji4c
Message-ID: <CAD++jL=A+7iiVoroCSi_C999-OQjC0+DimFTjpp8YmYc4HteRw@mail.gmail.com>
Subject: Re: [PATCH v6 11/23] dmaengine: ste_dma40: Fix DMA registration unwind
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	phone-devel@vger.kernel.org, sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 5:11=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:

> >       ret =3D d40_dmaengine_init(base, num_reserved_chans);
> >       if (ret)
> > -             goto destroy_cache;
> > +             goto release_dmaenginem;
> >
> >       ret =3D of_dma_controller_register(np, d40_xlate, NULL);
>
> if use devm_of_dma_controller_register(), does it avoid use devres group?

No not really.

All of these changes based on Sashiko's comments are starting to feel
a bit overzealous, I think it is commenting on issues that actually exist
in a lot of DMA drivers, are theoretical problems, but never occur in pract=
ice.

I don't know if I should stop dropping patches from the series
because they are too fringe...

I managed to clean this up a little bit, I'll repost.

Yours,
Linus Walleij
