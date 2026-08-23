Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A2D39DBD0
	for <dmaengine@vger.kernel.org>; Sun, 23 Aug 2026 04:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787460282; cv=pass; b=qU/cJ8gfQ9J0KwO44FbBaKrgzVQF34LWtC7jWquJUMEDZ5Bg0PG/zGrvi4LjQXUPZnJR3l/Q6vJo361SH6AlHMYjDAQPY2RkzfcrGkTfOUCojESVS047lzfE4RVmIskdAZFszeABUF/qE22+J9W2Vd4TSI/S+QRNDnovEPurRNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787460282; c=relaxed/simple;
	bh=rUA8STlsYFYQiRvYWCdYW5+b5xiB+c/F92/ZCn93/g8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pBWc+kNgPfJ1EaEl3xFQwRZxyd9++FXBJd3DvzMwpdLHqAm4fw2davKnyltfXnL1LIrBvoKS7OjavucHxGTFN+FJ6y6mTAW4bM1PeuRZMfWimFf5WKaBvT5qmwybKcfPoDftCKIQJ5+39E9coyrhtdfcu/My+OrGd3UgktIkHto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1q/tc0S; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1q/tc0S"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a15d54ac95so4111216a12.0
        for <dmaengine@vger.kernel.org>; Sat, 22 Aug 2026 21:44:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787460280; cv=none;
        d=google.com; s=arc-20260327;
        b=lfkHmVg5VLOPWwW/PehffW2zN/wi7AggV3X0U+N7dKgZwhApcscWR7lNEAbaQGmNS9
         k7NKHgQlKc9GBTXEUUmh8B8on28qkrqgZc5KIz+vrcbjydaSrSSTztz8oySAbF4TEyWB
         xi9GjIw/EWSMCarxLSaAB5ZZxiILaFLItElMTPbnLWoMzOX/42jvu0MFqkiH48VW58/i
         7vOVDqZr45xBOCTRm3t3p2cNnO9aiOqcr7PhrZBD6F9dikzUnasbzoj3ad+t9VxpEoEZ
         nZEcJsk25RfLGJfC7ruS3l8oqS8HVguY0yzH76njxxGZnHEFl2JzKubwxNPRa4cNn96r
         JMNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZSqjSSah5KBgALutr0hY72c4Zb4Ws8WYQo3Q/l3ach8=;
        fh=R58UPJfnjpFD+Mu+qx+W109JiL86gsXdBZ9UpuirA8Q=;
        b=bar1sITuhNHiC1ya2gBHfGAmw0G4nTH/MoP+U59tSHs/7IczEKKEtTGkUbJdFKGnMM
         CHh0qKypNIBvW29qnnFSby33+kEqu4ABcH8mqEbRWHZ2hHqvh6WnRt+A6MKOGtMJzUHE
         SD0hz3hzrRHmfwQ6PVIWlBrFUvE+Hrdo2FqBnpX0h4ji1dIMpscqsP55naOo/a4b2ukn
         naBPugJdpp1mETY39LOeuLmO+wz+T8tmpGoI6C0gDt9OX0edo/0xd4EpZt4EHGj0H1qq
         UBamxK6NG5raKj+szRmP9D5rKGuvjnutzRWPgO8ptqbnj1GPwQFouqqIP0nbwlAbpKrp
         WibQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787460280; x=1788065080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZSqjSSah5KBgALutr0hY72c4Zb4Ws8WYQo3Q/l3ach8=;
        b=c1q/tc0SF6zdK84DnOsm398gjIRp2zwOqHqvWFDxhL5H3RdCoS7UVWxog13Yh47NdK
         xqYsQln3oDUELzBzegsotci+ihhYGHxRL4aU0dOPQDEGibtfnFeXmLkbbfRd+FKqOd1k
         7mKtAv5a4tDzzVScjeB+5Xs6AoeNLHRFkdCiOMPR6N+MA+DpPk5IdQiP7uB9kUaD7wy9
         dy8a80RaSe82u/+4JJpmBtxP8eVxSLLWCG5qf7U1D5BWIhnXjQGXQjbTi0bFuN7QYGM6
         AyXa13YtswoCxd5m4GfEFc8qa9wJhGTHrkvaFU1v7HbzzeT6dILzQysp5Dk6zNhkjMsO
         Ze1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787460280; x=1788065080;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZSqjSSah5KBgALutr0hY72c4Zb4Ws8WYQo3Q/l3ach8=;
        b=r5Q0yW/DMVE5PV/UL+MTX/Caa6goUzEciIAOW720WAk++VOmzjmUiQRjLMkoet8C7q
         r375j0n6dloOUQu+GMgRRTQrJrad+zX+0WezTodusUR/dImbEzkLM/HCGAQR2zNjjhbT
         xPFQHkYJGg5DIwkZ6k9VWUZ6XSvaGQGY0MS/UiA0gVHxbfBBztiV9jIv1/3kEK6H2dp6
         riYB7eZyKtq2dL1EySGAYk54tesRyWTMhi0jxMq71rW/rQ+iltZOXix64pGVXAU6HHVl
         eHSKUZTh3VDarQKyuQ8G9ELxgiqe3R3zqu0iDVCP/qqi2OdxJSbzFFMJIqqk3bTPaijT
         soiA==
X-Gm-Message-State: AFuF++lV9MxjMYIqy1Yq5oAMyUrcbsP3FTG3R+4g/bQLHehJvPQt/tRW
	si3fw9vao5Xa4BwJHg6p6ojruU6o8tlRRkiVDpKuBN+xhMDdlm2g8vRrV8jeyIoHyZm8rlF2P9Z
	FbyWRaCRJEqkZx4KXE6ACD1LjFV5qk+S2LN+w
X-Gm-Gg: AR+sD11YHgVXRQk5FXvI/+qqoHkQUfd/9E5Tpbi+9F0gNpjEL8YdnbfyO9rb2wRcgW9
	CROdXd2ym2H22YT9W1Om/lMR3l/n0+UW9hSOJ2CZv3okP6hxowFYPEFMMt73z8tuKexMxfx16cw
	FnV2XjohwdD86ivPDf+nLFJ4HvxyI6j7GJX2ZbM09zES9guTiDQalsU9+OydD9Lf+PnITwifbOM
	kM++wgvvRmCTDkV8K/ckhdAIPYrDORiuzOIz+RJ3CNAmVrWRZNq+i8N6M6tkk1UkMDP3TpuXrNC
	t1WysY8xhuDY4Rh0OxAK3NJiLew+YBwBMYUrJXCqFCPYpOHaz/4l1eWjBF5HnYE0qF5CotPC+A4
	dTlG1OViLZnErM6SVCQ4wm9xYqpKFC11eYDG2hJL7SvvqriMY5mfWk68hxNhCV+DWu6T/Vdli+y
	JG54GqH/ZwzFNi2/uGdUntFX5DciO10NcRWzF5MNJL+05jFWLAhSVCih7B
X-Received: by 2002:a17:907:8990:b0:c20:3679:a2e6 with SMTP id
 a640c23a62f3a-c24925eb3ffmr1126262966b.10.1787460279494; Sat, 22 Aug 2026
 21:44:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504031209.618949-1-rosenp@gmail.com> <20260506110910.su2s6ncsi2xfdiwm@pureblood>
 <CAKxU2N8PUdxo54oHtcroqe+Q88k0obxPg_9OCRsNsoOwvcS25Q@mail.gmail.com> <20260630123029.ozveska7eoenci3s@unturned>
In-Reply-To: <20260630123029.ozveska7eoenci3s@unturned>
From: Rosen Penev <rosenp@gmail.com>
Date: Sat, 22 Aug 2026 21:44:27 -0700
X-Gm-Features: AcwNN1WOqpjNvvrbFuuZdDr0EWOQvQOz6eBeeTVou_Zk_7DEeqlQ6lYFj7PXzJE
Message-ID: <CAKxU2N9wE48D2WLPvta98kB6xXciOdvpOzgGrnS9kkBHYfUwXA@mail.gmail.com>
Subject: Re: [PATCHv2] firmware: ti_sci: simplify resource allocation
To: Nishanth Menon <nm@ti.com>
Cc: dmaengine@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
	Vignesh R <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 5:30=E2=80=AFAM Nishanth Menon <nm@ti.com> wrote:
>
> On 18:42-20260629, Rosen Penev wrote:
> > On Wed, May 6, 2026 at 4:09=E2=80=AFAM Nishanth Menon <nm@ti.com> wrote=
:
> > >
> > > For some reason, replying drops the CC list. manually added them in.
> > Found the issue:
> >
> > https://lore.kernel.org/lkml/20260630014129.1548147-1-rosenp@gmail.com/=
T/#u
>
>
> Please repost with additionally CC LAKML and the TISCI maintainers for
> the patch, this would go through my tree.
https://lore.kernel.org/dmaengine/20260630013917.1537819-1-rosenp@gmail.com=
/
>
> --
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DD=
B5 849D 1736 249D
> https://ti.com/opensource
