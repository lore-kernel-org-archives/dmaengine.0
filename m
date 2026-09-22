Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4173769F0
	for <dmaengine@vger.kernel.org>; Tue, 22 Sep 2026 23:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119036; cv=none; b=Tnxzh3oA9DPtUpHV4VyxUNC4/yvWM1rIjLYpenUex4tASJJ9DkspexPiCt7AF9/+y2gTHe5XIhXMIMA1yOKlsvd1xqGOe2Y+ZzlBz3JOn7g8/B9TeYQFK3o6RX3SEV5WW5xEWzzzDX719s/K1cFBo7UnnJj7+k7kV4VYZMViJrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119036; c=relaxed/simple;
	bh=UYtWLyYdU1OopkDfn4zx43GEwzAOHXRpuc/IrW8ImC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t7drczKt8VPPwP39FKG98O/LbqpUO4NduGSM1jiI5QOIH3uXKUj5JQJbiRAR33VUTBsPj9fu5Kj1BnKQHIYAdcPqYkwVfV/GIhpbCQw11grGz41EyAGSyQwjzhIskBK+iRgGWaDf2P8z4LqOeTSJ0cP5cgZ0nzlB+tARPmrA7QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xx0HvFg6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xx0HvFg6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2966E1F0089A
	for <dmaengine@vger.kernel.org>; Tue, 22 Sep 2026 23:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790119035;
	bh=UYtWLyYdU1OopkDfn4zx43GEwzAOHXRpuc/IrW8ImC4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Xx0HvFg6q08j4vo67TbdPu9QzeZe9zV0P3tgJUePkLGllB5ur8APFqCGRMUrSASie
	 Kpju4bUERejwcs+hTPPMzsnStLll4qiW4KUontGaH42Fyzxl4XEU8+/MvFPR7biMF4
	 ym+L/4jr8xt8Ua1oJH0qn3aRpVN4FXEUS3QjRCgHaK1o97tkDadoGnSUNHSv8Bslx/
	 sk9Ttyl6M2VKUpn7fux4BB05QQ1ZJvq0o7Ptf7Tfw/tQ013R9ATno8z/UUZwrI8YzO
	 opVnDHZS0qof3OTGcZoOWdXMH2IML0j5M5l7wg2EJ6KbAxKJXPuyr6PB8R0nyKrc4z
	 UOc6s0/+l6/Mg==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b899413537so429640e87.1
        for <dmaengine@vger.kernel.org>; Tue, 22 Sep 2026 16:17:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxScvO7FJ+bToYGXb6XkqM+igPW6NQCr++M8kLqU0zpCyT2+ffQ0Udc/0i6impeujlTnd5239aZNGI=@vger.kernel.org
X-Gm-Message-State: AFuF++mezHoMEoijSX85m5quNZsJnkAz1oI2ydznQu025hlOjS75kmzz
	LD+gDDcxAnmRje5/kb0oRNGwXdQmfFrdIYj3CWmt9YKZg7kx91sMM4sx9L2Iz8V28/jC0eHilHj
	n9Se0qI4L81jd9A0LmmJ5oeHGli6RZIY=
X-Received: by 2002:ac2:43d7:0:b0:5b8:9b7b:e9ff with SMTP id
 2adb3069b0e04-5b8d89b8c50mr182996e87.33.1790119033868; Tue, 22 Sep 2026
 16:17:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
 <20260920-dma40-fixes-v5-8-5c55cd7f92f9@kernel.org> <arLZBzE25DrDC6jg@SMW015318>
In-Reply-To: <arLZBzE25DrDC6jg@SMW015318>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 23 Sep 2026 01:17:01 +0200
X-Gmail-Original-Message-ID: <CAD++jLkqCLjGN3fHmth43Rmo_Uw4ryUzfAaLaVyWbgBycerjQA@mail.gmail.com>
X-Gm-Features: AclHuK-EIqSQ0GIM4yWpzmHufXbQIF-0N6roB4oHVQpFTK8eEWY4Od56XNiXA-g
Message-ID: <CAD++jLkqCLjGN3fHmth43Rmo_Uw4ryUzfAaLaVyWbgBycerjQA@mail.gmail.com>
Subject: Re: [PATCH v5 08/23] dmaengine: ste_dma40: Return IRQ_NONE without
 interrupt status
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank,

On Tue, Sep 22, 2026 at 9:38=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:
> On Sun, Sep 20, 2026 at 08:59:43PM +0200, Linus Walleij wrote:
>
> suggested subject:
>
> return IRQ_NONE when no interrupt is pending
>
> > d40_handle_interrupt() returns IRQ_HANDLED even when no terminal-count =
or
> > error status bit is set. If the line remains asserted without matching
> > status, reporting it as handled prevents the generic interrupt code fro=
m
> > detecting the stuck interrupt.
>
> Looks like it is debug function. The major purpose is return IRQ_NONE sho=
uld
> be for irq sharing?

That's the most usual case, but it just generally means "that IRQ
was not for me / caused by my hardware" so it is something you
can/should emit even for non-shared IRQs in case you realized
you are certain the hardware didn't raise it.

Then it will appear in dmesg as "spurious IRQ" I think.

Yours,
Linus Walleij
