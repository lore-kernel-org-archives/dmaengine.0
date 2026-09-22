Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0082C49F137
	for <dmaengine@vger.kernel.org>; Tue, 22 Sep 2026 21:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790111624; cv=none; b=SjJvbIVYAvsdDR/FECRlM/FMlOjaZbfp9ur6XmG31NKslZmJKHe46O9ByMtbK4VM3hBrxONJzy8qkUlcvlFvc6fQIYDJQgwTdAnQOCawRauXlzG4ifKamgR0CPSecUlBd8xOQi5B7lHjCAvPCKKfRbIEzmL0F4GCksOhUDX5y0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790111624; c=relaxed/simple;
	bh=HFijfuMwGUGh14CZaDQJm0qPotdGEN9dDRqUxJohHVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EULr+VptSf5x++Ydh8a22VCgCuzn47jNctvTfMU4MfuTHJUlkCuD7QiaGz07hrwtPrRmFqnnm3wHKTDFqix0UQPCudFR5piDeZtMcFUeqiNYrz95jfgah72vJNbbBbYxn021BxX8g0Ad8cn3HvFSE6ALOfDJBL7iNRIlnj2RrDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eFzWzwPn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eFzWzwPn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9009F1F00893
	for <dmaengine@vger.kernel.org>; Tue, 22 Sep 2026 21:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790111607;
	bh=I8EVlPZEScJqsXn5fr2gujH+jhXPf1PoFW/7CMkUWWk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eFzWzwPn8fbQWhuhOynlDwAggojndmxXoMKWJ0s+igFll4cqeY5HrOXJvs8jpduxo
	 e73Ry3EkhVgHm9qnHrWESdcT23bHkXaK5+Mf0t6NDyeG2kY16RbM52DZyGRAQ/ODL0
	 r2ENPZqBINTWGaybYLCk3mumflixVM1/ME9491Zr2QNOt8Dm5xHVoAAOXIzAzzfH7g
	 0H8yIEbGxyeCE7xr81nNHDMUWtDakhacor/zcAk6t4V8u/jeLCfskPZhdv3vMg8FWM
	 t8MqktaijU86L6nyuhS+zmKmBpFSbWof0SjI9vRyXBHt9swVJqS03pd0piDgpa0r/z
	 dRYOWpU6eNMbg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1e023so78778e87.0
        for <dmaengine@vger.kernel.org>; Tue, 22 Sep 2026 14:13:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzGmgqC4bo1c8dCa98yk1T1CVGZ8kzcGGsKNkfdPGifRGwXnEGWDZ6ybTav4tCLnSu/veWUZa3iRbY=@vger.kernel.org
X-Gm-Message-State: AFuF++lycxEtYO+MrCUrhr9hIVCHJcjMK+UhUo/LpgmtQisI4J1IrMkw
	11G1QFRQUXyqADtUbHiZh9LUYXNPZRmco/FhJMhbysjjOzGHZYjq2UM2aZchGozVgb0eA2S43Gd
	uW9WR9WSWFJ1QJQxKx9XqJgkwn2qP54g=
X-Received: by 2002:a05:6512:2506:b0:5b8:b392:b40f with SMTP id
 2adb3069b0e04-5b8d863aa6dmr196592e87.5.1790111606297; Tue, 22 Sep 2026
 14:13:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
 <20260920-dma40-fixes-v5-3-5c55cd7f92f9@kernel.org> <arGm-Wivy4MXb5if@SMW015318>
In-Reply-To: <arGm-Wivy4MXb5if@SMW015318>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 22 Sep 2026 23:13:12 +0200
X-Gmail-Original-Message-ID: <CAD++jL=3NN6pKA3x6vw_np4SLOx8_VNX9Jt2rAJcZXWpSkNB7g@mail.gmail.com>
X-Gm-Features: AclHuK9aMoqEtTQqgoHhqsZGVdvYImOrCG8ErKh8CQi9ZPxKXTdtnxolqpCCe78
Message-ID: <CAD++jL=3NN6pKA3x6vw_np4SLOx8_VNX9Jt2rAJcZXWpSkNB7g@mail.gmail.com>
Subject: Re: [PATCH v5 03/23] dmaengine: ste_dma40: Recover coalesced cyclic callbacks
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 11:52=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wr=
ote:

> > +static unsigned int d40_cyclic_periods_elapsed(struct d40_chan *d40c,
> > +                                            struct d40_desc *d40d)
> > +{
> > +     size_t current_pos;
> > +     size_t offset;
> > +     unsigned int periods;
> > +
> > +     if (!d40d->cyclic_period_len)
> > +             return 1;
> > +
> > +     if (!d40_cyclic_offset(d40c, d40d, &offset)) {
> > +             d40d->cyclic_callback_pos_valid =3D false;
>
> looks like cyclic_callback_pos_valid is not useful. if d40_cyclic_offset(=
)
> failure, always return 1.
>
> Logically, can't reconfigized n*period_len.  assume period is 4.
> if there are not additional register to recorder counter, you can't
> distringiush, 1, 5, 9, ... irq elapsed.
>
> So we have to assume never elapse more than peroid.

I'll try to make it clearer in the code, but I think it can detect
the minimum buffer counts that we can see, if we have for
example 4 buffer counts (we should see 4) if we are one period
off that means we could have had 1, 5, 9 .. etc periods.
If we are two periods off we could have had 2, 6, 10  ... etc
periods.

If we wrapped around the whoe buffer one or several
times there is no way we can see that :/

We report 2 missed periods even if it was actually 6 we
missed for example, I'm just hoping it will mostly be 2 if
it ever happens. It's not like this is a problem I have seen
in practice, it's driven by Sashiko reviews.

Maybe this patch should be dropped altogether,
it's just me chatting with Sashiko about things I don't
think happens much.

Yours,
Linus Walleij
