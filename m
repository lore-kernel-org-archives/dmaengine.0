Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07DC3B4EA3
	for <dmaengine@vger.kernel.org>; Wed, 27 May 2026 22:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779919642; cv=pass; b=Mu6AYckLQTbFe+E+1twP3+dj1VJ4EbndahR7Qf6cF1SfBImNGA2rW67Cnf9ZLAuo7IvWMx2/1LztcYcKPuMtoiMSdtlRizPEMshXdu8NzcSHz0WslhqINx1Hcyt41d+84pReV+BmNXXg/pb9+xSB5fvH5d/zscbBn1TlAodtROQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779919642; c=relaxed/simple;
	bh=k3lLIpJDgggp3+QrM7CLsNzjAUmjklCE7a6Nrbi/gVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MC/LB1fMu7B36gqBbN+tzJj2R4754Cs8rIX6FeoAXUHzuY2gIleh2kkw3DKIrT1nKFhXGclDu+fGBz4NI7+QP/NVkSiJXOJOTVh8rzk0uvvQUeF7JhngqIpRcK7t8unW/O/sNDoEFgp9zQpXL24J7uL5GmQb1kxmRreHDlFWbIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qk4QUK3h; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qk4QUK3h"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6746d0b2b4aso20645990a12.3
        for <dmaengine@vger.kernel.org>; Wed, 27 May 2026 15:07:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779919636; cv=none;
        d=google.com; s=arc-20240605;
        b=T/Wcq9H/khT9BUiCVwPq8Hj6EGNVFDTDP1uTlpdgOc2w152/XZUf5lZJu7t9TjyUC+
         CHd/YNG1mbp2D71AJyTcXMA3Hkm7GEU8J0W2/Rw0bP2vraKNQWj8gS5wfKQ9Ug5RsZ4d
         EJFxBYlAFdKD2cARxJgPJhW35F6RRRpaCsRJUflouulTWBhU3b20z2W13BkK/0DxD84a
         DvQcgBG3DxO4q6/jJmX9UwIFojct9DW08uHHw9i/VyChGX96bVDiw99dY3PqIq68ZU0d
         vP9atajAs4ZsqvmDE9vs+4wojIsflRkGKEba5XUCzFv1tapfc+oVFroWIuF6n0KqNm29
         G5Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4OVBPp4ttbsthyZCZjKgIEqVwXCG0MyY9CEWH9wwh9Q=;
        fh=w2tFWgl6QMYc+mE7XDL66mEukd8bUBJjMCHJYeMF6ag=;
        b=Xl3XorrD8MilCA1qAzxJTZX/TbN1uELUKiOq4E/s9hqAGKvgzR6PV2EvSyMLOpwLJ2
         fFnQntjCEn3xydUZ/szJFlhPNiKlxHH0E4uoxI9OK32KAFBE4ZWWcbS8Ew1JG4NGn+kb
         Dby+TpyFjgTrO5/f+YJIQM+qluW1dUkxrpLnelB3JM/RtkKqnZg1HLou7Bcj4tkLzny2
         EXjhG/HWnpRHTp7AXBU8u4HSKGPtA1c78O/XKjhDxs0rvDubn8D0h8ykmcl187QjZ5Iu
         McFCTXKW/7s3IR+ME0i2IbBRMFYROw1+KLK84B8JzPwnyAB+NMNhjYG+7r5dWnFgPIMX
         H0pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779919636; x=1780524436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4OVBPp4ttbsthyZCZjKgIEqVwXCG0MyY9CEWH9wwh9Q=;
        b=qk4QUK3hoLM98VpdN0XRRjFto7YVZ2kWV8ZvcOGl5QbGZaJx7siXQ/anVf61xANkQS
         4Wv/lKw0DrIesbce7r1vzk2gYisShHkoLARK/7mO2HZuAVvNbAnYQI1GCTEO5eY0Z7qu
         MX7J7PC6k+0Vy82V0iRO/JsFxWgt18RsO7YUcLlrNjyUSokUqMPiSxZ8/oo/sm/1xtV8
         NIhcvxScCL6KuI9OE1REpzAyZRpN8SWEkptuE5vqn2QODGijWxq4aNYSYTj7xL8LtGeS
         a+sHq5dCW1iW+IUuNv8psWA45LjSZVDISTUDJrUEEJ6WCNVGu/TdwyEMzNkB09IVLfye
         qT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779919636; x=1780524436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4OVBPp4ttbsthyZCZjKgIEqVwXCG0MyY9CEWH9wwh9Q=;
        b=b6g33wduV7n0xFpdk3tLNmptjnGGFUbkvFabFYE/WnWQ9JZ/ABFXihCj4F48L36EOt
         5a6I3tIxm6uqbA5GGSnT6ksKgPM8otYzbq2PlV8RIIPpXp10XWRC2cCE1PXynUk7Ui1a
         ViRg68E2dxytWgQDOOSu8gzb5s6MDTcANprsyDROR3ck+c+6kM0Z5nKSH87+qg/TqwIl
         KSod52FVYBOJk8rlr2qQ7hXV7gMU2B8vZcjPE3BOySoLVOOZMdrxxFg7GkR4WbrK22RI
         FUHi0Hkfn+7jYTq2RXK4dYzGQisNtnjGylQ4+KfisIEuz6HV/quyBX201EKOVbGeB47q
         aLeA==
X-Forwarded-Encrypted: i=1; AFNElJ+FIsL8a/ePSSpT8Z45LLGgX3OfnvFbCZxbw1DmL71RVTbd7E3FZMoxCSF7jPlE/AKepFfqlSgvLTM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB0yvy/qQ1Vc4e9xDtmF5nDsol1Qc4vO+lk5OrKJ5IAhxaS/BF
	E3nvMPW2znOR6uBkACZ9+4vzZz6OhkUxeF1RyyCbCVSzkb3oiPiE2nPnlK6/exdW7JvAJSeg0rF
	hgMqCD+k3cBalruzSLEYL+7NU/rosZlg=
X-Gm-Gg: Acq92OF0qOZbm+Dy+XfMmM/NEHHSpCGFjpMQBQcIncDqVFqzaPKbL3GLQI1gxV1w+NI
	Wr5jXxkxWf6hHP1eaiEiCRgA6kEhqnuVmFAzWy1VxOnTHKdc9AHEErETO5+0+2T1tR57dkqeogh
	NPukI0tnHS1bs5ivbM+0wKJPdzuLZbsTr7pD6X2B5tv4SVcilCo1yFJkYikJxIjLf7OwuhDoKsr
	J8sgPvS8oWFldNhzefnDsNt5tkAzrlf52BdN6iIiwSgjcL3ZK9c42pk0DPH9FAQR8AQ3IdMnFpm
	8CNim0250PrDdDkva8rMDkwmyIve362ppj6o6eXyEGCGVs1n4aF1Rkt8WAnVBcA+7dt/GeFPqQe
	kQpgQ7lR0++gAoz7xgO50ikRNp506z1Pi0tIUah2tE8KbmrM1f9ZIm5WNMRkxCF8xUQuYi/RneH
	C870I=
X-Received: by 2002:a05:6402:4147:b0:67c:5745:ba00 with SMTP id
 4fb4d7f45d1cf-6889c2a3792mr12387039a12.0.1779919636018; Wed, 27 May 2026
 15:07:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527203126.7053-1-rosenp@gmail.com> <20260527204806.1DDBC1F000E9@smtp.kernel.org>
In-Reply-To: <20260527204806.1DDBC1F000E9@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 27 May 2026 15:07:04 -0700
X-Gm-Features: AVHnY4JJw3-pkbMOdUPeLxDinjlUUnntxistMEnXZFRIYvGlrPP2EONxnjVRRXw
Message-ID: <CAKxU2N_+aSN3L5KXs3bi4sdKmVW-JF4FzuFV50yae_Ha4Aw7CQ@mail.gmail.com>
Subject: Re: [PATCHv2] dmaengine: ste_dma40: turn d40_base phy_chans into a
 flexible array
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 1:48=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Defeating struct_size() saturation arithmetic with unchecked add=
ition can lead to a heap buffer overflow.
> --
>
> commit e3bf7e1250eb198cd9bf4617a8f0c3d6cc4d796b
> Author: Rosen Penev <rosenp@gmail.com>
>
> dmaengine: ste_dma40: turn d40_base phy_chans into a flexible array
>
> This commit converts the separately-offset phy_chans pointer to a C99 fle=
xible
> array member at the end of struct d40_base, switching the allocation to
> struct_size(). The log_chans and memcpy_chans slots continue to live in t=
he
> same allocation immediately after phy_chans.
>
> > diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> > index 9b803c0aec254..d3e3c4cd43f17 100644
> > --- a/drivers/dma/ste_dma40.c
> > +++ b/drivers/dma/ste_dma40.c
>
> [ ... ]
>
> > @@ -3197,10 +3198,9 @@ static int __init d40_hw_detect_init(struct plat=
form_device *pdev,
> >                "hardware rev: %d with %d physical and %d logical channe=
ls\n",
> >                rev, num_phy_chans, num_log_chans);
> >
> > -     base =3D devm_kzalloc(dev,
> > -             ALIGN(sizeof(struct d40_base), 4) +
> > -             (num_phy_chans + num_log_chans + num_memcpy_chans) *
> > -             sizeof(struct d40_chan), GFP_KERNEL);
> > +     alloc_size =3D struct_size(base, phy_chans, num_phy_chans);
> > +     alloc_size +=3D sizeof(*base->log_chans) * (num_log_chans + num_m=
emcpy_chans);
>
> [Severity: High]
> Can this unchecked addition defeat the saturation arithmetic of struct_si=
ze()
> and lead to a heap buffer overflow?
>
> If struct_size() detects an overflow and saturates to SIZE_MAX, this
> unconditional addition will wrap alloc_size around to a small integer val=
ue.
>
> As a result, devm_kzalloc() might succeed in allocating an undersized buf=
fer,
> causing an out-of-bounds write when the channels are later initialized or
> accessed.
>
> Since phy_chans, log_chans, and memcpy_chans all use the same type and ar=
e
> allocated contiguously, should the counts be summed inside a single
> struct_size() call like this:
>
>     alloc_size =3D struct_size(base, phy_chans,
>                              num_phy_chans + num_log_chans + num_memcpy_c=
hans);
>
> Alternatively, the size_add() and size_mul() macros could be used to pres=
erve
> the saturation protection.
This is completely unreachable. I can add min() calls if needed.
>
> > +     base =3D devm_kzalloc(dev, alloc_size, GFP_KERNEL);
> >
> >       if (!base)
> >               return -ENOMEM;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527203126.70=
53-1-rosenp@gmail.com?part=3D1
