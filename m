Received: from mail-ej2-f20.google.com (mail-ej2-f20.google.com [74.125.228.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C1B4334AD
	for <dmaengine@vger.kernel.org>; Wed, 23 Sep 2026 05:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.148
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790142813; cv=pass; b=u7GFpa8GgSC58ScEfMlTVwKtdvJArtY3B8r4tT3IFJQyi+5IIqphb5Mfo2lziLATqJOT8ZWmXZ3j1t4StucFXFyBuct5ZwZfLG+XIi7jQQlPc56GUbdGw8Gy1ypp/tBAqBwXmw6ujBlx6tSKTaQGMrPJm1Qhq68yR/0ywRbe19A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790142813; c=relaxed/simple;
	bh=wCB36lhePw43bhn1eMjIQeiRYhs/jz7LzvK3sw8DY/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e1aPsQIOBjqkPn1fFq4Qf0y/EOk3rfKzZ6zHlvp+vScDDglJwNrueBh2Ut39kbGQPleZhuAW9dfSuPx+sM5DjkM2am/DWqwC2S5NObONZr2bpkBfN1zRAyMW1nKXeDfXiT8T29SFjU9ko+i0YwgmtsCJtoQDJcxoIq/0C3iTgSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTjGnxcg; arc=pass smtp.client-ip=74.125.228.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTjGnxcg"
Received: by mail-ej2-f20.google.com with SMTP id a640c23a62f3a-c293c683202so71281266b.3
        for <dmaengine@vger.kernel.org>; Tue, 22 Sep 2026 22:53:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790142810; cv=none;
        d=google.com; s=arc-20260327;
        b=BwK8vNZiwsPs59EqehTZhW+EJ9RYU2XSQrEr4fo9y/wQBHZrkr8omqzraySIvz2MBP
         baWZfXHmjS781KoYrUG/Fla3DFYAwPLwWECNAMPugktt7TOvkeSna6s6ihPDdNiofwVx
         lsst2zUm2Y73xk/0X3aDJOF9CJ8cvIaZ0C2FJqbhm4IVKp1Ro1+pKtkKRlg28pFBwtgB
         e/8uwiiIDVc279WYaU3QNGqaIkPvWAZBqmuYdYh674jYrLG5MaCke7R/S2iFMk7LuBqx
         wwu7i34dUm6gS3zfKllU+oRCYb6xlIlp7skrT4AQYGqjRdETqH8zTQQ+R0q8QXR5w74q
         zGCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b4ipNKvv9Ha8ZyDw0UA6CxU/i2uV2iwxrmfrZjUvuRU=;
        fh=jRfuZ1Xmu9l7W3+KBadB6Vl2tj6kU6Yis5yHJCaMpo0=;
        b=Mjfa2Pwab91MA6md9Z5f7o6PO0MTBJLHEDpqSwp4Nbovz1ES9kaUgtTCjUtrb0cfn6
         jYTGdyOlp8aU0S7+TpyvxEdDnoXWuA5VZwf9ep7sKZ9tDyaEe/C9aaoXKPf9DtI9I5My
         5gW0mbMP4BsHEhlXP7W1P3vuOKwAeG8HdEe4jZDojk6SLE1wx/zwi1P690FCQt1fITVj
         XZUgg8d0NJGTx7rNsUGRXfyZxwisCoqjkP4510MPeYEsjdANtzDzFLMtZSGaLUsAKMAY
         5Sf1+5T8xckUZwmmKuG9v9sBAq4LfDQd6Nm/RXh2cR/jYWFHNtLxEl8vHNjzAwhAhnv+
         EtmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790142810; x=1790747610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b4ipNKvv9Ha8ZyDw0UA6CxU/i2uV2iwxrmfrZjUvuRU=;
        b=LTjGnxcgWtagsVEaNlaOZ2/GypUyemdq6w/gBp5f9xbwCPNKJRidx4vevPQw7KArOF
         Dk8lHjE4jpvlejKZeMTQh5vliPyx4Kl6fgvQmWGhDXwlj5OvMaKjeKlxi1tjRKeeV7kx
         fNuKWuBSwCvFuDJSETfgVBdPfB6BzJDFIPrD3sohhATa5qYfDMVKDyZS9JjRvb9iZQOg
         K7lXt/N3Mo7NgEt/cWl3pYdDnevluFUKP6FPu86TGe/EGADTukT215XfxHDZA9HboRNC
         Kv+1Uu+qtmx/VwEDjkwQrwvSK3jKDyR3Rf8Wouaq3jRHbGYTMgsaGnR0pJCVNAHyHMRy
         nvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790142810; x=1790747610;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b4ipNKvv9Ha8ZyDw0UA6CxU/i2uV2iwxrmfrZjUvuRU=;
        b=t/N9qD43Colz28MMuW/VZucjl0+FOdTFFCZC7vyD/zj929ic/6MKcSFysEor1b8BXj
         h5Ii2BQ57S8u0tJAZAW5swiI1DVpEcGXKYgZ3AVOr1skpKz5zxPGoFoV+F7EldhPYX4n
         EX1sn5glhCA2/eTMH/NF2E3KWKiJE0gWG0xJyQ5wjL2mnw/TPwI8PrAi6FjPlpCoTyvJ
         +a+0sBRh15VVtdKEjifWSYwHcea25OUY5T3yOPqBcQTIzy2A4azSCJuhWzAURf7tFbk9
         wrvkKsH7qHw/XHINWg1Ww8+m9M5NjSpOyULm87N3YpqrpupJpIY76jVqMVxtTsJc88hU
         kHhg==
X-Forwarded-Encrypted: i=1; AKwUvBxvg5IBUR0ZeMGlNsiCgjrCWoYnGg/DLT84xz3ggXI6YNQbmcdRapEdjcP/Rb/yTXu3BsduKVWZWio=@vger.kernel.org
X-Gm-Message-State: AFuF++kWL65vjzTbsBOvRo14MjoIfJhyP+81Z/s7Ah1LqJts5cDK6oym
	/U5J/HUUW6R+KCHoxvnYToKMdaicKBl6507cgKoOtUohCVzwmMCY8Bt0OpO0Xzb8pJksML4iOyM
	d5q7lmIBMWLI7ws3zf1lA+rbIskuYuvs=
X-Gm-Gg: AYBFou28lbXtcXvsMzAAvX5wIb9NrcqkEfTNvPN6bPLnq4BwHeZfoAbDPB2SjlqxEEe
	vmntAd0QDcMXfntJe5Zbbflpa9nzoQEONKVBuvGh6X8CLbuJwch9F0ehBEiXHIioLncnQ3J3ZvU
	/1uwwDbTaBTb6l49yTXYiPh9CiRSUz0MGhifrkvo0WrnQg4Dv3uUNJXLY3IqOY5fROpCFEfqhd1
	VsMJHBeChv0jz6TdoiK3VMxh9kgrymyNGUUNJMr8p/OguIvWsBDGR7WvCnFZ6kAEpvBNF6PT6sz
	Hx68/DdMDYd25oJheXi4z8RpgwTuKydoOK3LYV8Cm1HWG8mP/KwWxDEF6w==
X-Received: by 2002:a17:907:97c1:b0:c2a:6bee:77c9 with SMTP id
 a640c23a62f3a-c2aadcefe12mr117281466b.4.1790142809578; Tue, 22 Sep 2026
 22:53:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790068409.git.zhoubinbin@loongson.cn> <arKwsyDwkCsIPjWk@SMW015318>
In-Reply-To: <arKwsyDwkCsIPjWk@SMW015318>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 23 Sep 2026 13:53:17 +0800
X-Gm-Features: AclHuK9BQhIFAJMfP8FhnBIMi1HpURCls44U9SRbBAmppK4kZXV4hRu-tk4ozV8
Message-ID: <CAMpQs4KszBmHDrXUZ9azYiGpsQY+LWqBSoWKB95VVO=ioh51bw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add Loongson-2K0300 APB DMA mux support
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, devicetree@vger.kernel.org, 
	Keguang Zhang <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank:

On Wed, Sep 23, 2026 at 12:45=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
>
> On Tue, Sep 22, 2026 at 05:25:41PM +0800, Binbin Zhou wrote:
> > Hi all:
> >
> > Loongson-2K0300 integrates a CMC DMA controller with 8 physical
> > channels. Peripheral DMA requests are not hard-wired to these channels;
> > they are routed through the CHIP_CTRL13/14/15 DMA_MAP fields.
> >
> > This series adds support for that DMA request router.
> >
> > Patch 1 adds the DT binding constants for the peripheral request IDs.
> > Patch 2 adds the DT binding documentation for the DMA mux.
> > Patch 3 adds the driver, Kconfig symbol and Makefile entry.
> >
> > The driver registers with of_dma_router_register(). In the route
> > allocation callback it validates the <request> <channel> <flags>
> > specifier, programs the SoC-specific route register, and forwards
> > <channel> <flags> to the parent CMC DMA controller.
>
> Is it possible use standard mux interface?
>
> drivers/mux/mmio.c

It does not appear to be reusable.
The mmio.c file appears to only involve setting bit fields in
registers, but here, not only do we need to set the bit fields, but we
also need to pass additional parameters to the DMA controller.

Take i2s as an example:
&i2s {
        status =3D =E2=80=9Cokay=E2=80=9D;

        pinctrl-0 =3D <&i2s_pins>;
        pinctrl-names =3D =E2=80=9Cdefault=E2=80=9D;

        dmas =3D <&dma_router LS2K0300_DMA_I2S 3 0xbf>,
                    <&dma_router LS2K0300_DMA_I2S 2 0xaf>;
        dma-names =3D =E2=80=9Ctx=E2=80=9D, =E2=80=9Crx=E2=80=9D;
};

We need to pass the last two parameters <3, 0xbf>/<2, 0xaf> to
`loongson2-apb-cmc-dma` to complete the relevant configuration.

> Frank
>
> >
> > Thanks.
> > Binbin.
> >
> > Binbin Zhou (3):
> >   dt-bindings: dma: loongson: Add Loongson-2 DMA mux request IDs
> >   dt-bindings: dma: loongson: Add Loongson-2K0300 DMA mux support
> >   dmaengine: loongson: Add Loongson-2K0300 APB DMA mux driver
> >
> >  .../dma/loongson,ls2k0300-dmamux.yaml         |  49 +++
> >  MAINTAINERS                                   |   3 +
> >  drivers/dma/loongson/Kconfig                  |  13 +
> >  drivers/dma/loongson/Makefile                 |   1 +
> >  drivers/dma/loongson/loongson2-apb-dmamux.c   | 380 ++++++++++++++++++
> >  .../dt-bindings/dma/loongson,ls2k-dmamux.h    |  56 +++
> >  6 files changed, 502 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/dma/loongson,ls2k=
0300-dmamux.yaml
> >  create mode 100644 drivers/dma/loongson/loongson2-apb-dmamux.c
> >  create mode 100644 include/dt-bindings/dma/loongson,ls2k-dmamux.h
> >
> >
> > base-commit: 0a8dda0a15d3926422d286567f945a05328a4ac6
> > --
> > 2.52.0
> >

--=20
Thanks.
Binbin
