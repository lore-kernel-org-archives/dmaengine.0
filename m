Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219C8421259
	for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 19:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789588109; cv=pass; b=CxfnFs51oDZlRqfeDWEhlfQOcSK2VPa5T05/j7GZL7QQniJRamlEvCniYz5oSyeU3N868qh6i5LOX3sZFshJ9J9Rw7FsKQvrWU+dYI45Zq9V3kQOJT8wzKBSHu449N7BS9HSNT4AIonFwRQCylkFTeS861p35N1utt7Q6sGYUlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789588109; c=relaxed/simple;
	bh=wU+5155qdUPgw7RyzztSXCOgYlXDyq4rSWa8o9Db53U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qe8o6y7rzUbIjALJojH/e0FWjTUxwF+zCYxSPOt9tjiHuPYVFQwdTVrk1oDd/iZvWP2L8Z/kOR+bFXDd8Vg+b6202OKauiUuQ8nfM3HJn6BqvmBlUj+KRFpG/VJuWZzAKVyRzaGGAUyvr6ynthDtKOkQLkcH13/r4YvRBurcsqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3wCsWwr; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3wCsWwr"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7db0so19540866b.3
        for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 12:48:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789588086; cv=none;
        d=google.com; s=arc-20260327;
        b=KeCYHFLz2aryCb8ewftDHhT5LwH4fOMVL0R6+95uUqX2oSCs7R2t6qBGY6UU6/SLC8
         H0seJlywdmK85kzedGA3sE4IX0Hm4qzkKDEcluuQRCtWKtys0DYAH4LVjqwLt8Y9Qrps
         u0VDfUAOWjUYtf2AbTGuZTAr83XOigxx2lzY+TauMx0CfdvswLPv63idYPnfO3p406vK
         CUsQe0R2NXq0mZL4kEmS/WEsrHQjqVJu4tv3Nya/3M72Ic4nQq3gg8MByX1HGgYMYGm6
         qml0uBYnOIkmKHOClo4Bd0Xl4mcBSjLr6TE0PUZ0BDqd2WsyrOvcBMF1Hix4BcD/S8wy
         5ESw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uUwNANsqCyAEnoTGeTMQrWBhCYCOT0fgfggYDa58xD4=;
        fh=Qpg4609oK9CZTfuEcfJ0KjNxzO1VrGy95OFDkStsuGg=;
        b=l2sYuZeqEKuusq/ygFfOI/OovX+NZky6lGzAn2CybCVSEEmQjLn5klZnrNfgX1D519
         XTF134wHEMRFNVe9XMuncCgz7MLPuwqDERHjAzgutbgJqJpKU6frOQLrfprtlLeoD91S
         D59YiwyrWwCM2kT42Hwpt1lre1MTsuqZv2fcheN9JBS6FF4JqytWqvxY8SMRvqGW7e+c
         v+rK+8hRJsDyHJdMT2IYdSqQBYzjnzeCUk9acxPUicVVbppLavLw6YxejSa3cNj7UdO2
         qP15UfceaR4PdRoH8G5H7trBzwMj95AyC0mqdpoXT0J5bOkHxJnElubuHvAhObVGQqrc
         ZKxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789588086; x=1790192886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uUwNANsqCyAEnoTGeTMQrWBhCYCOT0fgfggYDa58xD4=;
        b=H3wCsWwr/wqoeV/byKUorfvf1//TjUw+lUK7PZ9FoQIuayEavGD8iAfUto4Hkte2DN
         0ib2TCGLehY9/G9o5/uX6fhPxzN2r0AKAfWGA4owTHgu/Mkig9DY8I7i5arikNQgnp9+
         ypFKml4y2hCIXDS1sXJCgn9kca7+HjVMlMWduaCdE63pFw9FFc3mO3j7D4D8NLj1Xr9o
         e/Z05HuQtzAaWV9++IziI688FmAOUIhiuNOWbDMg3m1pnDq9yv1wQlSAltuU2lNX9Xop
         K6nXE051Mvv3w6GaUSZnrLIjH4qVI9L6AblZV6NQJuvwQQn0xkn1Z3WRcwfe0Xon7Wkf
         PJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789588086; x=1790192886;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uUwNANsqCyAEnoTGeTMQrWBhCYCOT0fgfggYDa58xD4=;
        b=coP8mQvAYl3YkJWOyGjC9mzSHyYlA2ge3RL5GAMpYSxu0u0madGOIQXBtf+QIyCtWA
         fpE6w93++P79TJ/zTxW71YEkz9jIXxj7726T0YSaEifrE+mbIe0hAtC2DMqOVCUKBizz
         9aFxZqQPYNXC0LNvirw7um/EVXVinGoG152nYn+CK3GTrVvNWR70GV+uhluZPB9YWMjj
         0bKajW906NpTqq2QpOOam+BbqAcEZy9PO1Wmwl40qQvDjBSoTkRjlmOkCZxL7xnCKHM5
         nPvqR43LpnvJNLQcLN2V78FRDI2Jzq0Ml6XIVGlP+GN8JBIe7GOhQW7Ev55/h1AD/X5M
         wUqQ==
X-Gm-Message-State: AFuF++nK3OjhZDezS0NV9Y0nkQHPXPnkXI4J0V4x6xvYxQ01AoVVLPMb
	Yx9Ej7lW8mdxXMY6z13DClFnkxV882XXCahdUMz0dNiygufFHmdywCX9mGpVhk9l8F/NaN5wW0s
	9JAIn4/uaNkxGssWcUVu+pw4XoQM3F54=
X-Gm-Gg: AYBFou2oRO9gyUWRyOkp0KtqGbUPRqyRXyFXkAKQ9JxXg+AfGRcXqtXGEugDzfGRUmz
	AaP7qntPtosJ8hhdl3rTX8y9m/GgUS1HtZWfN6HT6qZE4tDxdL83HxSsEhPWIXRfd/zvK2CXtEv
	ZD2OMReum52gqhPUQImJccZIiglqcuKnZ0HZikiJSiUOeM8Zq6//AJbNV0jjShJD66bjbXTqfy4
	meL/s8rcpOooQ+8kCpNMM8HZ5kYAAwHp5MT3KhgXpdXsnew9ra9CBkftdQ8Wa98n3YXfKh/maPk
	c86CeazUu2l3kBLOHsD/wpH9DYn7oZCBX4LlznGbwoLt0qiDQev9Z30B1KXN1aGqFbf6EI//9fz
	eqFoFybjJaRlJURQ76qDOHPwiIzNtlByLH2ehOOAPLOQiVetSddGwpYPZdPtK2wkM/Wu0JdNqQz
	W7GqaYGSGzdcTF5Ie5UUrdquBhg/Q43TZb7tpPnLGHDxCojmbkEKn4v06JXwVwWKmyDw==
X-Received: by 2002:a17:907:c705:b0:c29:6400:ef8e with SMTP id
 a640c23a62f3a-c29e5413d2fmr269131466b.42.1789588085865; Wed, 16 Sep 2026
 12:48:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915181709.11323-1-rosenp@gmail.com> <aqrxFTWEsJmFIrel@SMW015318>
In-Reply-To: <aqrxFTWEsJmFIrel@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 16 Sep 2026 12:47:52 -0700
X-Gm-Features: AcwNN1VWEP860etYY_BLQbwSQ7HYCEYQgEcVWOM6xtWBlz1ixaj6SyE77I5cWWg
Message-ID: <CAKxU2N_zEA1NxAp6H6J6COjTwUv8NK909m3OZ2kcyVCpCby18A@mail.gmail.com>
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

On Wed, Sep 16, 2026 at 12:42=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
>
> On Tue, Sep 15, 2026 at 11:17:09AM -0700, Rosen Penev wrote:
> > Allow the BestComm DMA engine to be selected for PowerPC
> > compile-test builds.
> >
> > The freescale ethernet and sound drivers now need a dependency on
> > PPC_MPC52xx as they use headers/functions from that platform.
> >
> > Assisted-by: LLM
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/dma/bestcomm/Kconfig           | 3 +--
> >  drivers/net/ethernet/freescale/Kconfig | 2 +-
> >  sound/soc/fsl/Kconfig                  | 2 +-
> >  3 files changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma/bestcomm/Kconfig b/drivers/dma/bestcomm/Kconfi=
g
> > index 5dd437295964..153b5492c93c 100644
> > --- a/drivers/dma/bestcomm/Kconfig
> > +++ b/drivers/dma/bestcomm/Kconfig
> > @@ -5,7 +5,7 @@
> >
> >  config PPC_BESTCOMM
> >       tristate "Bestcomm DMA engine support"
> > -     depends on PPC_MPC52xx
> > +     depends on PPC_MPC52xx || (PPC && COMPILE_TEST)
> >       default n
> >       select PPC_LIB_RHEAP
> >       help
> > @@ -34,4 +34,3 @@ config PPC_BESTCOMM_GEN_BD
> >       depends on PPC_BESTCOMM
> >       help
> >         This option enables the support for the GenBD tasks.
> > -
> > diff --git a/drivers/net/ethernet/freescale/Kconfig b/drivers/net/ether=
net/freescale/Kconfig
> > index b34c0fcfddea..d81984fcec64 100644
> > --- a/drivers/net/ethernet/freescale/Kconfig
> > +++ b/drivers/net/ethernet/freescale/Kconfig
> > @@ -38,7 +38,7 @@ config FEC
> >
> >  config FEC_MPC52xx
> >       tristate "FEC MPC52xx driver"
> > -     depends on PPC_BESTCOMM
> > +     depends on PPC_BESTCOMM && PPC_MPC52xx
>
> use seperate patch for difference subsystem.
The issue is this patch exposes the issue. It's also extremely
difficult to get anything into net without the maintainers claiming
this is pointless churn.

>
> Frank
>
> >       select CRC32
> >       select PHYLIB
> >       select PPC_BESTCOMM_FEC
> > diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
> > index 04940879dfd8..101bc952aa14 100644
> > --- a/sound/soc/fsl/Kconfig
> > +++ b/sound/soc/fsl/Kconfig
> > @@ -234,7 +234,7 @@ config SND_SOC_MPC5200_I2S
> >
> >  config SND_SOC_MPC5200_AC97
> >       tristate "Freescale MPC5200 PSC in AC97 mode driver"
> > -     depends on PPC_BESTCOMM
> > +     depends on PPC_BESTCOMM && PPC_MPC52xx
> >       select SND_SOC_AC97_BUS
> >       select SND_MPC52xx_DMA
> >       select PPC_BESTCOMM_GEN_BD
> > --
> > 2.55.0
> >
