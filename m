Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC9145563C
	for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 21:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789593971; cv=pass; b=QUQB2BTbmPOKWLtQ0CfgVuV+0xRoPvFPEUkITxAzd8w/ELoGUrIAwlQJsuXp/rLzEbzqbbPFeayu+XI3YTnRlsCtSSXzjwvC6v/USvQO70L1K5ky1Mkq/FBCMqY+d2KJom26T9vhjPrOMxxFcGxvwtApiTfXEzuic/u87+fUji4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789593971; c=relaxed/simple;
	bh=PaEyW8ziV39/D+o3TZiBGYjeiJYSGmcsepQiVBnz1sM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j0S/xr9op2Z56lly8IfROkrNP8V1BaEjLkixSzfMvauc4RdbpmP6uwIVK8Ky6008YOX96+wzOw74H6uokteLZ4F8GTUAVjbGkWOxRBZ5hZ1UkW4ii9Hxr9x1TzFEq418rdYKpEQ34DUI9ygs4doaAS9pVr7kTNMTxRG+3c3Amec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MfIu5n/t; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MfIu5n/t"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55efebso31465466b.1
        for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 14:25:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789593953; cv=none;
        d=google.com; s=arc-20260327;
        b=CwYovi3etymFJf4941ymuCn9W5tvl9uOCw4ZSYgesrUzT2/+xpGYcODsHo7tpagfgv
         No9qMCnr8O+5NejLyRd7rHxIwWFWe0DFzP6vSWmY1Amx9fy8FRoHiqnJFtsGm23eJAxw
         GNGOMjIGRbfut1dBhVkqL4gItB/bgiI315SGMR1QEk3lfzaeRy5OhmlyjS4x/oCDv/EP
         8LTCAJ/vJsx6ewFilz+bu+2qk6SYA4MeM+dcEkTTCD4ghdN9iR6Cwr//EpWrLE3bTXTJ
         wkwGWmALH/U/25ocuYvKQRytf7icdIc/PQt2SuaqtGEs/hygZYL74QTcBqJHJIilxFyS
         pMHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=24dq6MGP09BQVdqu/qtRfDCvRFA88J8G77yWogi+o5k=;
        fh=Qpg4609oK9CZTfuEcfJ0KjNxzO1VrGy95OFDkStsuGg=;
        b=WwDHcNr4zhsD0VLhVavLzW1D1GTGqw+mwPfnwAI50Xc7EJKAHbDS+8JDNh3pX4BUf/
         NeeeSEuIduRSqfXMqoeye448tO8/F4ED/KR9/ETabq4J5TMhAFsRM8d9+hqtT/tXF1oP
         u9UyE9CcyGX9Vpu1K1cOr0ZbKk84PBn4/hXhpSNf8j8ekRNVtcCVdTXQQDnMjtx/E2Lx
         8AhI97Z9oFPMEw4Qr52785wJQ+hHvMRqViueYTljaIZHR6lhgt/DmUqUI/snOsJGyLEc
         SMvC1nxKH1T6cPuXA1wZugixq/dDa4C2ZHvg7kS4+iARVPPgfQ9dCxjwgpFjJtQIFQow
         iKjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789593953; x=1790198753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=24dq6MGP09BQVdqu/qtRfDCvRFA88J8G77yWogi+o5k=;
        b=MfIu5n/t1RRV2o/akMJ+Y31OkeyhzD2pq7zmpeZYO4oUGALZZNAW6R7ZQrHOdY01oY
         aJCPZXbJd3tR0RcGsB4VR7z1EqiWPQcldm+1+WF3JPxZGZH8edKlprJ76XvmSAAOTqUp
         kbRmPNf80/Yrs8PE3nnlzjAQHj7a8IgBsHlnK0l6XljHuaNLSn+jGOMK9vXt/jisRZ1o
         OrO/1DWdFp5ykOXUlwTpXDkiOkthwoRpfliaERFEdiswXKomJuwUAdWvnSnp73u/3IrQ
         OHl5f1FrRzafawmfnwoqLbAh2NzN/bE+8PMZfYNlHv9uf8BLgPeaxO7nfbO8miWoWCaK
         vtiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789593953; x=1790198753;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=24dq6MGP09BQVdqu/qtRfDCvRFA88J8G77yWogi+o5k=;
        b=P5MJtqWTiazxEnyA3e/Xiil4ImoUuOth7QEF8VEKyC6Uvay3Biz+t5SMbQxhyWOPZS
         zG2tViFKUW8bT2cpSoPrGxkKcW6dnrHG53kQzbnXy3SNGLvXwui3rda5fQvBYDKzFl+O
         p62gIq4VOTDqJ/JTJ3GuWWjcILf9iZYqqbIUUlcfAF2N/OqGxURQCrzpFpHi+kRatRrx
         tqeG0ZyOSBEfx6qFfO/3xztGvYWdyOemTnIojFZRvICOrTavAsF/ZWZugTIO02KCWH9i
         upOkdmUz1ozs32HIPKJqcCqZUY6i/LGa801JTbRg2e8HK0elsDMKbAg6XLMKJN0iDweJ
         cK0w==
X-Gm-Message-State: AFuF++nJtjGCF0UsMIcUdAGsGV5cO+oiZ4JLUB1JVXvREYoArVG7U2Zp
	VxTZeYUg1VYUYp8xx+VGSodSE1ObLuOfRFvOJiCffzU4h4gkzbVUQiiFZUwpZ5xeonJaqxX/1sR
	R0oZLEJqGq+Y5PWAwl99c6/8Wwvd7LAg=
X-Gm-Gg: AYBFou3O4xEUF7FaTqYHGIcU77kQam8mEjwDR4ODFE0BcdvDWyedXE1r/E7M23oxuTk
	jRd/dJFW9vGc/+23AANohe3AMKQoERNTWwk4W4gHOpgRCmmZk3rKrP8VnQMo7aT/78Q92EaMcqE
	NjZAztC6dFMAbn7sbXEpeVxt3AMqxGDC7TOLGsuoYymoijlJWO8qYSUXKFxUh+8D4ik5Ze8gikH
	dtiTiHiU/WxM2QEdXhpaaa7x9UkhFKL7sz+iqNnH5yAmqcL/Ch1AtPsLbQ6CpEU8f7xyana0BeJ
	X2wDn5Pyces3cEwHdlmcj5WSu9c6ybyCbeYlowYwBVb+OKfL2/q6zTViunbNJxK4ITYQNP6XwCb
	KPCT4VXYMi72qnldu2zWri7GZxKPkljInYjibpYvGMH+/tNhJaIS2fX4BeMFALl5SvxOlfDeGOc
	HQMlRDnhZRd9RjAt2un7XeiAjKZL+b1tDy+aF2i+CSYOq8KkfmyZ9PhPN7SAhmVqbuNLApopoTg
	S3d
X-Received: by 2002:a17:907:9343:b0:c29:62d8:68af with SMTP id
 a640c23a62f3a-c29e5311f45mr285472266b.47.1789593952818; Wed, 16 Sep 2026
 14:25:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915181709.11323-1-rosenp@gmail.com> <aqrxFTWEsJmFIrel@SMW015318>
 <CAKxU2N_zEA1NxAp6H6J6COjTwUv8NK909m3OZ2kcyVCpCby18A@mail.gmail.com> <aqr7Lfji97j_0nVd@SMW015318>
In-Reply-To: <aqr7Lfji97j_0nVd@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 16 Sep 2026 14:25:41 -0700
X-Gm-Features: AcwNN1V3Sj2lR93W3zP_MWf1RpGY0ZFkZFuGnqEzbiPZuRWy3aeiqO_w5mHISZk
Message-ID: <CAKxU2N-bWXPHNgg2jLjZ8dUFQELr8RV3kWhKdSi8gKF3_9JRVQ@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: bestcomm: Enable compile testing
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, 
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 1:25=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Wed, Sep 16, 2026 at 12:47:52PM -0700, Rosen Penev wrote:
> > On Wed, Sep 16, 2026 at 12:42=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com=
> wrote:
> > >
> > > On Tue, Sep 15, 2026 at 11:17:09AM -0700, Rosen Penev wrote:
> > > > Allow the BestComm DMA engine to be selected for PowerPC
> > > > compile-test builds.
> > > >
> > > > The freescale ethernet and sound drivers now need a dependency on
> > > > PPC_MPC52xx as they use headers/functions from that platform.
> > > >
> > > > Assisted-by: LLM
> > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > > ---
> > > >  drivers/dma/bestcomm/Kconfig           | 3 +--
> > > >  drivers/net/ethernet/freescale/Kconfig | 2 +-
> > > >  sound/soc/fsl/Kconfig                  | 2 +-
> > > >  3 files changed, 3 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/dma/bestcomm/Kconfig b/drivers/dma/bestcomm/Kc=
onfig
> > > > index 5dd437295964..153b5492c93c 100644
> > > > --- a/drivers/dma/bestcomm/Kconfig
> > > > +++ b/drivers/dma/bestcomm/Kconfig
> > > > @@ -5,7 +5,7 @@
> > > >
> > > >  config PPC_BESTCOMM
> > > >       tristate "Bestcomm DMA engine support"
> > > > -     depends on PPC_MPC52xx
> > > > +     depends on PPC_MPC52xx || (PPC && COMPILE_TEST)
> > > >       default n
> > > >       select PPC_LIB_RHEAP
> > > >       help
> > > > @@ -34,4 +34,3 @@ config PPC_BESTCOMM_GEN_BD
> > > >       depends on PPC_BESTCOMM
> > > >       help
> > > >         This option enables the support for the GenBD tasks.
> > > > -
> > > > diff --git a/drivers/net/ethernet/freescale/Kconfig b/drivers/net/e=
thernet/freescale/Kconfig
> > > > index b34c0fcfddea..d81984fcec64 100644
> > > > --- a/drivers/net/ethernet/freescale/Kconfig
> > > > +++ b/drivers/net/ethernet/freescale/Kconfig
> > > > @@ -38,7 +38,7 @@ config FEC
> > > >
> > > >  config FEC_MPC52xx
> > > >       tristate "FEC MPC52xx driver"
> > > > -     depends on PPC_BESTCOMM
> > > > +     depends on PPC_BESTCOMM && PPC_MPC52xx
> > >
> > > use seperate patch for difference subsystem.
> > The issue is this patch exposes the issue. It's also extremely
> > difficult to get anything into net without the maintainers claiming
> > this is pointless churn.
>
> Maybe you try enable COMPILE_TEST for FEC_MPC52xx also
IIRC it compiles but does not link.
>
> Frank
>
> >
> > >
> > > Frank
> > >
> > > >       select CRC32
> > > >       select PHYLIB
> > > >       select PPC_BESTCOMM_FEC
> > > > diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
> > > > index 04940879dfd8..101bc952aa14 100644
> > > > --- a/sound/soc/fsl/Kconfig
> > > > +++ b/sound/soc/fsl/Kconfig
> > > > @@ -234,7 +234,7 @@ config SND_SOC_MPC5200_I2S
> > > >
> > > >  config SND_SOC_MPC5200_AC97
> > > >       tristate "Freescale MPC5200 PSC in AC97 mode driver"
> > > > -     depends on PPC_BESTCOMM
> > > > +     depends on PPC_BESTCOMM && PPC_MPC52xx
> > > >       select SND_SOC_AC97_BUS
> > > >       select SND_MPC52xx_DMA
> > > >       select PPC_BESTCOMM_GEN_BD
> > > > --
> > > > 2.55.0
> > > >
