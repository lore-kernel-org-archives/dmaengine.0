Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73432471429
	for <dmaengine@vger.kernel.org>; Sun, 20 Sep 2026 21:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789939582; cv=none; b=XRloSzSkUi5VW8WiUtE0DBAZHgu+2uJtKkvawz+XwG6MrWjSPN46XrnQWqapqN5D72CYsEgUSrCsXCvfy/RoehNWUkxZ+qE/gGTek316Z6cpAi2L7mnSJgT1QGuCCFuEQanZkb+IBtKebdcAzLFt+3JkzO/+722hMiJ9nm7Ft+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789939582; c=relaxed/simple;
	bh=QqhZ/4bdO4svuABCROBWbDdvadwlgS9DHey09zHSxkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WFmQC8GN6ONNbK1qsjvFLGJRpdExG/FNkTc9GFbFl2vuOUgDEwugMbUUHWGZZgC1g5E2c6bvRLhErUzlcXgNjuP0SyZwD+xuiaVlws+/GF4C0XlkGJf+lSBMF+U5kCurZORGlXA74mGAlkeA++j5N27rdFt47nunB10i+e3U/bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GvBoI7mS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GvBoI7mS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E371F00898
	for <dmaengine@vger.kernel.org>; Sun, 20 Sep 2026 21:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789939581;
	bh=QqhZ/4bdO4svuABCROBWbDdvadwlgS9DHey09zHSxkQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GvBoI7mSTQJhRdnItdkeXot2daTgZBCmBuSYCwVlRLl+jAwyjZ/5k7I+OSDN+rLuw
	 v/40lOICCGgOrS/EvZwty+R8XbQGO6Xb87u8/DAOQ07c9CHsEB88npQC5Z7OcjyJL+
	 6uzU6YP02i+E/biGMoG3ifAY2PejO9kGGQx62ZBNQZYp/jZzPaNsUzlZpoo1PH4yLf
	 U2EKNQCy1G4s5HOYzOKLqQFpgAIPPKDexnIV7DVIdo06puJUdIe/A7RgMEemajZLzH
	 PjLsxv4QpYN4CoagvNG8xQ5JFIGzK2dmlj4FtDcAZIdaZ8bgeTFnanQKclMjhX3vhL
	 7XYq+J8SzFo1w==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1b846so2681221e87.0
        for <dmaengine@vger.kernel.org>; Sun, 20 Sep 2026 14:26:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxQ/hn+cnBEIq6V243ajYEX3EXxc8/ouKaee4T5DrtRushpokXlbJc9Hjt3gDvcsoEXCaoAv3If8B0=@vger.kernel.org
X-Gm-Message-State: AFuF++lnnGsMAlcxvfStM/ohNeM1GVkMLbJOgz9+5GnlLW8vREOT8bPk
	OsqibnFF90saUGyeR7E9VuX1OX9PGlpjCGabS/kwQlaDLKUqiNvMRwO1Ewnh98IRBAgUHiyStN+
	amn4E5ERQGEc/jcCDPaFnrppBr8DLZRc=
X-Received: by 2002:a05:6512:3183:b0:5b6:1a7c:aa1e with SMTP id
 2adb3069b0e04-5b8c1983b64mr2661814e87.54.1789939579762; Sun, 20 Sep 2026
 14:26:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
 <20260920-dma40-fixes-v5-8-5c55cd7f92f9@kernel.org> <20260920191047.20ECF1F000FF@smtp.kernel.org>
In-Reply-To: <20260920191047.20ECF1F000FF@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 23:26:06 +0200
X-Gmail-Original-Message-ID: <CAD++jLnnNqZLDTjXzPdXDDzy1wUwnJz+7nPWBmupivP534FUbw@mail.gmail.com>
X-Gm-Features: AcwNN1XGqPtFpWo82NOBX51t-x8FqbUONJL9CevtYAQfXQLUOmssAu-_LHKbN6A
Message-ID: <CAD++jLnnNqZLDTjXzPdXDDzy1wUwnJz+7nPWBmupivP534FUbw@mail.gmail.com>
Subject: Re: [PATCH v5 08/23] dmaengine: ste_dma40: Return IRQ_NONE without
 interrupt status
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Sashiko,

On Sun, Sep 20, 2026 at 9:10=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> [Severity: High]
> Does returning IRQ_NONE here risk disabling the DMA40 interrupt line in a=
n
> Asymmetric Multi-Processing (AMP) setup?

You didn't really read the cover letter did you?

This is FRINGE, the other CPU cores on the system (ux500)
where this is used do *NOT* use the DMA40 engine.

Nevertheless I have done my best to circumvent this.

I think the series is good to go.

Yours,
Linus Walleij
