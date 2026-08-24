Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565912BD022
	for <dmaengine@vger.kernel.org>; Mon, 24 Aug 2026 20:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787603008; cv=pass; b=Gf3xwbcyBhjJz21ua6Oi75qi4sQ71aAOKx4kI5kdaawSvF3WY3OKYSE8Bu8EHRWF0tPZqswzVD2JzO2WJ4e8pZBu4V9KT5bCqUQV2xWUmmvnTfPVMiXUUKSkCvZXoxRtjYYnped9Trw+fWG/taQlmQidmGn4wc+S8JFCvAjRakY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787603008; c=relaxed/simple;
	bh=5qs3LmMlxBH938LicuDB2dABIFNbxNYpIEl6WUqmYhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ioOu1JrSSr/gL8khuG2O9DAip7g2iGXRHrUo8b3QL1YtRayLAqPVSEoaSWxxVAreZuD/ombKAr9Uv4ZROAM5RsRUmNr6BV8ozTEhaiO2VJ12NYUhNQsea3eBLUTLM6lnsdf/WBaoUE5BMtDY5ze3d6GmNVNcQo9ME2vZmzGmQ0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kypXOMdg; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kypXOMdg"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a3fda88184so6200440a12.3
        for <dmaengine@vger.kernel.org>; Mon, 24 Aug 2026 13:23:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787603006; cv=none;
        d=google.com; s=arc-20260327;
        b=UzHzocEtnNuC3O54gamCUh8Cx5Pa+qY/YOVgOZvyBHl3iEkvnE97m6LOcpPfKQ5AkU
         qKbBtbAJmvPB0XnKDnXMJd5xRXgAOSWYfAOYzQXTDv0YOsuudYGQoJp9CesVN2o2pVFY
         ZYStn6TQZXAobir1EBmDi5Ua7fNzqfQoAkZywVwezTox2sdq3ySV+4BZiBar8Bfytwf5
         mvTwNi1Ha6EC9skHovlElnFhfbdjIWThW/QoD6sf8p5owQqeypsEmYZggbIjvsRPshI7
         xiUIXNDO6y1GfHT5FKI2Tlo/kLqHl3X8mvu0t0awHAUr7DqSFBE91s7SlRyovtD0eink
         HnRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KpQrKPvXFKOaF0Tr+8jrYooYDbrbtiMXAGBA3TVJxiA=;
        fh=Hv75EDOwIXBauKfd8AfExPHD7D9OQxsbkS26QxkAsgo=;
        b=Jrv/3cKrKy59OVgoDfA4Lb+5p5QNZBmGXk+tCUXFE7DFKf3pBfX3VC+Zm7j05dIhF2
         pPlDTk4bPTgNRl4sbcBlQQMpfurMibKvJfW4e1+02+0QlJU/CU5V/TNo5Mdy2wo75EK6
         9aAKLfhq4OSr7NpujvPX8PRQiGRQtldH5biri8brQmgHNbvauR7+GlnCf8ffQBi9Qc3N
         +XwgzNcA76v3SxmeIqKIrP5dCROvXC9ji/7vPFGLUpZGLeOxjGMrAV8/InvobLtktync
         BOLajoMexOeQVJWnsTiYOqfityBji/qGgPFC1MwHYAA+FYzXvXNK3VSCNNgwOwJ5kZTW
         lNnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787603006; x=1788207806; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KpQrKPvXFKOaF0Tr+8jrYooYDbrbtiMXAGBA3TVJxiA=;
        b=kypXOMdgOxl9dUQxPYu+/od972hZGuF4KAPE/Mj3RWSoX416qMLiUliPfUgBaCUb5P
         wAAz05ePDrNYXIyNhQIRm/Vv35ShgAXbLji0gVnqXmSPomLoFIL9wOB2D+3ruso3DIUw
         MBUJfd0pPsrVqW53oQPD2l/Nr+iuKKEQc/XO4ijUfOMnQmZvXyzhI3nvrZ5DwQUULft2
         U3NqGur+W6H2ggdM9RDeyKYCmLfzec/PLy5Wqx9uWzIMAThBqhlYnPvQEVhg0p7/45RP
         pRAc43PBC6wr/mlh4uR0dDWCPZJHr00FOasIIDKaPxMyA+nB6pPSCAsKKJd6rZSaKKPn
         KHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787603006; x=1788207806;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KpQrKPvXFKOaF0Tr+8jrYooYDbrbtiMXAGBA3TVJxiA=;
        b=jsR2yB80/YRPJGx4sKA1AApBlPcRQGqPqjHiyr791k6N0wVQc4HZNbAGh/vWDvcDjC
         oVRXx+wuxZKvLZZFVe3Me1ROiPz+5Qdnf1ktALKb8m2pRPp/aXEccwPR+8VYVch0UJJX
         75DpXgWzzSRvgoeM8roS7ab4xUctoNckt4mJJKyexn0rpLZ5s4slmAr2VoNDLb6qRUen
         IlEPOikWo+wIfAL/7piiLZZj7M8iTkcx2S0Gum+Q2XSOCj0dWrJ/CrQ+u7K4AnsYwfyh
         ZtopUpXAT8PR/VQ46VucL3pFEqS9Ns1fXCP3acsP7gOb6P2oWpkJ1NbwgEUSYIq5nRdK
         XEiw==
X-Gm-Message-State: AFuF++nOtDPzcVyeeBRrTRWhOEPWHkhgexm4js35ax5dnXBiBkJKvXYl
	idSXVl4PVnUEgcAQWxzLjcrGge7O7Bm52zJJCgkQk9DzlklU4O5Yaloy3OJl2PV1yuvd/W3a09L
	Jce9Y2nFe2kvx2rz31iWudxqzmTOhuV0=
X-Gm-Gg: AR+sD12Mzot7bAMHePGGVAc4Ubx6UAicWf7DVAVAfHwGLOf/hqkwvO2SvwrQfqDSEuG
	Yh2LyLX4qzQRiV7VApGxuaJE8TEhf2iyh2/9t6hHCLcJER8fYEJbznmWSS2Bzb5y4IPYxxt8Ily
	NqxSjgnaF6heKWZHGlda59g2BIziLQbuh8LrD3l5gBDrH17p2cX2/6fVM8y7+K18lfdwKulqw7a
	3ga3Y3GJ92BaEf3cgMT+mghXAVqXbhRZCkgMdyOUjYOSfHy/P39CLdGj2QFdYlwVVTqnpo/8YLT
	3Oqzq3WeLsVcTiosmO1PcU4iYCYHETRcCJ6+N+dcKrVEDLQObapbsaWed9haDEgrUvcI+xVzHdc
	2/qSENyW63N1V+f+9DQH6MCSbBOuFNKqUTXmauYjVVZ0vU2cE+YXiKEqAu4RZsFu5gk3wedzPet
	kSKm1UPJXtWMOewVXoOApy2YpHy/GzDHNhaWDIUSgGkxGsxvAt6+x6gB4=
X-Received: by 2002:a05:6402:52c5:b0:6a1:29ca:681e with SMTP id
 4fb4d7f45d1cf-6a5c41023e9mr1167670a12.7.1787603005383; Mon, 24 Aug 2026
 13:23:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823044900.11466-1-rosenp@gmail.com> <8735371d-b466-4262-818b-f854c83e23af@web.de>
In-Reply-To: <8735371d-b466-4262-818b-f854c83e23af@web.de>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 24 Aug 2026 13:23:13 -0700
X-Gm-Features: AcwNN1UsgemHpYLmLNmLi-9SyskohQPDLhvFFG24vc582B61NUGfhIv6kTo3RAE
Message-ID: <CAKxU2N_f+spFKbvvPDkh1VLLqrmSzBCZ9kvbsFDc2SRibRTGnA@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: bestcomm: ioremap early
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org, Frank Li <Frank.Li@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2026 at 1:00=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > This also fixes a resource size mismatch between allocating and freeing=
.
> > From sashiko:
> >
> > >     release_mem_region(res_bcom.start, sizeof(struct mpc52xx_sdma));
> >
> > This is a pre-existing issue, but does this mismatch in size during rel=
ease
> > cause a permanent resource leak?
> =E2=80=A6
> > ---
> >  drivers/dma/bestcomm/bestcomm.c | 45 ++++++++-------------------------
> =E2=80=A6
>
> I would prefer a clearer separation between manual descriptions
> and tool-generated data.
> Can quoting styles be improved accordingly?
what do you have in mind?
>
> Regards,
> Markus
