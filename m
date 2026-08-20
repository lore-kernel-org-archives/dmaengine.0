Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E6D353A8D
	for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 18:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787251114; cv=pass; b=UjrBBSjhmnMzOgxw1OfpuQ1MhgvXTg9tVyqzgDEXWIm3y/MY9lstfp1kc3M7668I6XMak8FdaaI6jE0BwhD150ULVVtZGbUikBraj8t106e5ovbZ+IqdAka1o82Et51sjGa4A7ZmpUwQzSM+BXdXFk5XUHvemS6pqJz9bmkR8tE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787251114; c=relaxed/simple;
	bh=ySgPgfv05Yd25g+jC4eHkSz8Sx3TC893Dq5u7CSXQOw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QFD+DG+ZpqvVrz2tM3J7EpQyWEHvdkUPDMqpScKlzpEq6mZz8UtW7fNpXhP2YPDjtwC6oyP6ZiS/tajjVbTPHOeckBfaFzxvbrPfHRCtJURbs8qygUNhlpkiV5yH6lajQKREVGVnUMc0xeB8Sn5oAtlMmV6W7vR2z3yqrUg6XFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIBd+D90; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIBd+D90"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so382054a12.2
        for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 11:38:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787251111; cv=none;
        d=google.com; s=arc-20260327;
        b=YitlFO4sOcosBEYqvEkoiXX8BseIjPJbGV6yyyCG4DtgxO0CFv1wmY8MJFjhYcOi1F
         G5lfUY3gjbpRS3SpMoutsP4hTKy7VeY3fHpbyoOQXxOZpt8MN1bNWxv8+QaJ4PnlK1v5
         SyxT6x6lIN6nHwMD+B+DzWi1+jPfn5N+i/n4jrXJcBRWza6oYESatmFfvY6fFTyYBDlT
         SUzT0s4Yb/+AEJG+uO+MOfCNIvGO5ekEWGeFFxO+vwlLIoECYhR3DxNtic9IED6zQqY4
         o79QQq5QIJirXRIyIA4Bmnc1sZDQnm4jsEYcbkUzQIlPgFhaK6wYkUgmrIYAUYUjmWv3
         YOjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y399UwJ+HCYN54RYrd1HkabMCMMPg6Wkn/Pg5u47ll8=;
        fh=cbH6eCr1n2DxrSvAgxpWoYBigkc/hGYfxwnS2wUooGY=;
        b=h4KOhdwy8rG06R+XmgY+cuLxN0zPMCdDmPBbLZSZbLznujWA1VDs6r0kieopJvPxoj
         bXCozISnB20L8hsLVKrHZ8lgkeTm2M/4+ux6ktHJPEAfv3rU6MRH4sZqcgZ0/1bbG8DU
         YRnRiVB9PbOIOxVgiCRexXCQCOlq2L4uM1D+XbYjNyv23R8W7B2vCQTaYa36Nq++AYK9
         e/edciuR6yRyvnJQAN42tEmAYeL6p3K6Xezp4lOmZF8/BU0nf1Qd7t3fF2W2xJ8AOJav
         WsUS5lMLmmMB7o1JGAZvuK0HhQzEFeydz5SPkBW+rk/Bq+32DUKLSPwASJMx1+xFjFqs
         6BQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787251111; x=1787855911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y399UwJ+HCYN54RYrd1HkabMCMMPg6Wkn/Pg5u47ll8=;
        b=BIBd+D90MSadaN0krbeNu+BHa8C9Ym9aQSDgkOMyJrJJPSTvULN5KF4UAsyk3fLja0
         HR+wGZlhQf4sv3OoDKJRgVcSusdT+caFv7P7TKjBHTFlV09LMrClgs0GmplpS2gzcrBQ
         Kja9yp5UNp+uMxNLcUhB7nZbg21i1itHA+j+OJpL4HcuAUFMFehThM+t1J1Vvw4p2nWq
         mlDlIi25aMi6qVGhnSZPouJAjaA4hQKCAm/TEuWAvrWDiClhq8eNzinyCbOGcPjsxWIg
         QS3OmXAlo+8uOXFk6NFZYFNLe4Rp8Ml+arsV6JWpjI6i47uHhqSNrF7n5wPYJeSMpLdM
         PuXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787251111; x=1787855911;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y399UwJ+HCYN54RYrd1HkabMCMMPg6Wkn/Pg5u47ll8=;
        b=U2mCF7Uf+1aZiqzQSDtfkwiLjmD86cTQcG2xOPBNnIRi5FKpgV2TUuEQlOVw6c/V5j
         JOp9ieHUKAH5mKQIVCcNd8DZlB3Nji5qVOH4W9G+ZU2wzRZihp3FFg0A0qKtJafAJsxn
         7oBsUDfALOoTCfJsN4ejn88Na0TNWQrQYcZqSo1+fs42Z35LwYX7jglDjd2FpTQcMecP
         1XmnCYMeD/QRD9yeE7oDB7Rn0NsSuRPxhLfn2phgr9y3CiU3jnJr88ojb2M0zyv+iPJo
         x6UOZVf+Qy5QGh88XetuZiHGFqE6LNDUaQUZRXh3LhwQL27tRf+a1nLFhBJT9Fq74CKA
         RDAA==
X-Gm-Message-State: AFuF++mpL/C7TDnHuCi/l8kfwGsqm+mFxiVQiPpOp035qieMxA75cmYb
	Dw5YMy9KNuzxwMLWmH+vgLCPpjjPZA1cfzmGUWD4mY8hl/6huKheXnWeM4OiEN79NeHqZ5Rln9W
	wryZh7QRgdX0cGoZk4HGFbJg14BEnhCFeVgmF
X-Gm-Gg: AR+sD136PR42oRW6QsvzV8QeFqsgPw2p45lQa4L4QfnOW0Ptdpu6dhBm0O17sQG8GHa
	5d8IFrF3HUmqzp+OBYGnIJxeKekdIv4Um2kxuU86Qq6GtPxkNXdpmu/ZDPS3THdz5d7NA3OeYBw
	wrULDearM+uvCCHHdeDLvk7IzXw8Y7YdR9leMfnq1nZWcS5xqAw/rZIhrL4nfvm+gAectUeb4Pm
	Aj5v44+CfmcdF4wxAXuBHu52DDwb067vaYzNbiIBlyciqmdLh5vXYxLFTAZpTX+ukJDJE/Bv883
	VpHFGZLgh2ZB8P/2tkfus92mZx2na2yYqP03CbS8oCZqZigQxhn4yJUOUu0SxlspbxRt9LiBN/0
	h0xBjh6sY2tblSew+cnagYlP1piXWCNlElXPV2Soy0qbexatr8eERqLdhkZAL8srripElsO9TDF
	KyvDZTfy8p43BV72RC4kkNPMwjCP2YKPcXdgeXu6xkbP8ng9HLjwNRIkY=
X-Received: by 2002:a05:6402:190a:b0:698:663d:d7bd with SMTP id
 4fb4d7f45d1cf-6a42f1df94emr504720a12.11.1787251111224; Thu, 20 Aug 2026
 11:38:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723050606.283453-1-rosenp@gmail.com> <aoYJGXfDciTLTZx4@lizhi-Precision-Tower-5810>
In-Reply-To: <aoYJGXfDciTLTZx4@lizhi-Precision-Tower-5810>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 20 Aug 2026 11:38:19 -0700
X-Gm-Features: AcwNN1WadOkdQETjHY5aKJw3lWDWX0-S7dat9vSR7J9yhC3maiVC2GsEIfMKG3c
Message-ID: <CAKxU2N8SvNqQB6g-esc-+KpO0sNKHAB7EiE9FWbg7Dv41=5MGQ@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: at_hdmac: ioremap and get irq early
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, 
	"moderated list:MICROCHIP AT91 DMA DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 12:50=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
>
> On Wed, Jul 22, 2026 at 10:06:06PM -0700, Rosen Penev wrote:
> > The functions can return -EPROBE_DEFER. Call them before anything else
> > to avoid doing extra work.
>
> just move before one devm_kalloc(), I have not seen much beanfit for it.
Not sure I follow. devm_platform_ioremap_resource() and
platform_get_irq() just need a platform_device pointer.
>
> Frank
>
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/dma/at_hdmac.c | 17 ++++++++++-------
> >  1 file changed, 10 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
> > index e5b30a57c477..2f6f5877fc3c 100644
> > --- a/drivers/dma/at_hdmac.c
> > +++ b/drivers/dma/at_hdmac.c
> > @@ -1943,11 +1943,20 @@ static void at_dma_off(struct at_dma *atdma)
> >  static int __init at_dma_probe(struct platform_device *pdev)
> >  {
> >       struct at_dma           *atdma;
> > +     void __iomem            *regs;
> >       int                     irq;
> >       int                     err;
> >       int                     i;
> >       const struct at_dma_platform_data *plat_dat;
> >
> > +     regs =3D devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(regs))
> > +             return PTR_ERR(regs);
> > +
> > +     irq =3D platform_get_irq(pdev, 0);
> > +     if (irq < 0)
> > +             return irq;
> > +
> >       /* setup platform data for each SoC */
> >       dma_cap_set(DMA_MEMCPY, at91sam9rl_config.cap_mask);
> >       dma_cap_set(DMA_INTERLEAVE, at91sam9g45_config.cap_mask);
> > @@ -1968,13 +1977,7 @@ static int __init at_dma_probe(struct platform_d=
evice *pdev)
> >       if (!atdma)
> >               return -ENOMEM;
> >
> > -     atdma->regs =3D devm_platform_ioremap_resource(pdev, 0);
> > -     if (IS_ERR(atdma->regs))
> > -             return PTR_ERR(atdma->regs);
> > -
> > -     irq =3D platform_get_irq(pdev, 0);
> > -     if (irq < 0)
> > -             return irq;
> > +     atdma->regs =3D regs;
> >
> >       /* discover transaction capabilities */
> >       atdma->dma_device.cap_mask =3D plat_dat->cap_mask;
> > --
> > 2.55.0
> >
