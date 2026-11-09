Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218288;
	b=DJCAg6hpvBqLGcTSmiRGVfrt5t1MeMslvmffgLHH7c/sH9LEwv7TrXl2UxyXJRYxABdo
	 V9lTn9fbd55zWwYvc5LDXsL++dvD3i8dU0RQ8gotACuKYOu2A7olowW86v/DEpbegJQpx
	 WAqSkbivE+Gb/FE+w+cWifDtAxYLEVU2cn5Ms3G38Lv3Bf1bDhnIEksPyRp1l5JIxFHiJ
	 Rg8v/U4rIK8ZG+DseBRXFPwajdtDzEluwPSueByPSE5d5UP1uM6+OWOItP8yDCUoCS6Wv
	 NL0+1w4LCB1MXcE/pJuhNKSPq1gpRi0vXsPt0pXIzaFUXdgBmkI5wzywOTuZdAE7p+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218288;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zRxoDvJqNHWKSGKGDlWFVgI4JaCLH8YmN1Nmzj2nWUE=;
	b=oU8YGFd7Kkfr7HytwDU/UPGSuIEGBCv9GxTL9Lp6Bg+OPRq1pVrWG2yZk8GU7CUEgIC8
	 cUKYf3urKEn4EQQKgN1jqjplCxmjuw0RXXoqsDF4mBsyq9Zln3+LXAS8JfKq5Eeug1qrd
	 gjK0f5+fERCF7ZS9Jj2HplA+Ww2VA3Z7/HUk8ruR6eUzknRRSJX/zIZ8eoFIIOjlXPIpF
	 BCCTHeWybzXvhdJB28/nD15iuulxuuKjVGMSIQWuCNiEy9MrdGMBDBGLSSTThexG3WGDz
	 6xpWO5ZkSMxZwY5dAi1Sthm2Gg2gWpZk4od90HdEJumgfUAk0mdl0xmxvjfRGWuH0iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GiU7Bxto;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818C4606A321
	for <dmaengine@vger.kernel.org>; Mon,  9 Nov 2026 09:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GiU7Bxto
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 058321F008A3
	for <dmaengine@vger.kernel.org>; Mon,  9 Nov 2026 09:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794218287;
	bh=zRxoDvJqNHWKSGKGDlWFVgI4JaCLH8YmN1Nmzj2nWUE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GiU7Bxtoaybvkr2gAUT3yojx7KVrIQj5sQtwNARIabBI/Xz1yNaf9KfzSNkjlh9UH
	 FLVF6kd6xzvAa9r+rdhTrAhRwKETpbM2boIYE/kM4Ftwc6As5sVXrG8DNuLKfvKSbR
	 O6iQtYcMB7B8lLupSrYY0sMVM0rPD3QRJni/DMt4/9wpLv2olp5ZR4HSRgiDb5owU5
	 /qBaAbYj/x9bDyvOYEg5V/636GMO5okouD3Uw2ckMRp1JT0Pe8hbdsfv/7iCWSeEBH
	 gjCawLRRjst4hmR66QFBP9pNVOXSUAJOF3cPYJ98lkOcPhattlx+4gbZ5GbQQD2L9D
	 LwRuHpj0RxkXw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c14f3dab0cso400395e87.1
        for <dmaengine@vger.kernel.org>; Mon, 09 Nov 2026 01:58:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGgk7QUeZgljOhsx32eBsnVQiVqGteTVtj9RZsAOgGDYeew6EvNoKkkDzel4q4ivBlOAuh/ZrXp96s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mqB2OG8IE3FeqkDGaxgTtN4/G3+7qN7OjuLW3soUjPu7ufwdJ
	Do+bnwVJ9QHAgHRxmI+6MS33lNf0b/fOtNd4i9ES47UNdBLNJ4MorDp6DM1LqIeGM9SjdkZ5MMx
	5zRy+xy6Dhjgzu6X7fXwV+Uo7o5UsB2c=
X-Received: by 2002:a05:6512:438e:b0:5c1:4cad:c31a with SMTP id
 2adb3069b0e04-5c14cadc385mr777117e87.63.1794218285785; Mon, 09 Nov 2026
 01:58:05 -0800 (PST)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-dmaengine-subsys-v1-0-780eeddbf3ef@redhat.com> <20261106-dmaengine-subsys-v1-2-780eeddbf3ef@redhat.com>
In-Reply-To: <20261106-dmaengine-subsys-v1-2-780eeddbf3ef@redhat.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 9 Nov 2026 10:57:53 +0100
X-Gmail-Original-Message-ID: <CAD++jLmGtm2wv4AccJ9WscJv1sWv5E7CNf025O38TAZh7qVa+A@mail.gmail.com>
X-Gm-Features: AclHuK8oK7P6B9InDKuo8Ak_aj4mmjEASZmzu1jiS_QJYKoqcrqXJkxA1OxDiQ0
Message-ID: <CAD++jLmGtm2wv4AccJ9WscJv1sWv5E7CNf025O38TAZh7qVa+A@mail.gmail.com>
Subject: Re: [PATCH 2/3] dmaengine: convert to subsys_platform_driver_probe()
To: Brian Masney <bmasney@redhat.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
	Viresh Kumar <vireshk@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Zhang Wei <zw@zh-kernel.org>, 
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-actions@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 1:06=E2=80=AFAM Brian Masney <bmasney@redhat.com> wr=
ote:

> Reduce boilerplate code in these drivers and convert them over to use
> the macro subsys_platform_driver_probe().
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Makes sense.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
