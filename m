Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0319A3A9879
	for <dmaengine@vger.kernel.org>; Tue, 28 Jul 2026 19:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785267215; cv=none; b=jRqAyW/g1e8HmuHFifvH4Som57Abz3sOcsgOPDsjSSwYS69vCP1rIEupX3p5OTunwyzRY+N+sIqGUjTqsDbTbRVvYu82xcfP9VmmvhZcf3TNfG5WwtOT8g7w0wR1OtG0aNTm5nSkoHzgCne5xfISKbr//Yffk0K7Jxnm939V5pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785267215; c=relaxed/simple;
	bh=SXI6gFkjQYZ+NYsO8AhtQ4GmNWfEVEfMDOECqmQ48FI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IPHKsKwD/3LwJno7nRxWMjYiFRNkXw1paxVU6cXShxiN7eY7/wbKqs1inqb4QX3/izt3KLzGv9nmiDH1WFbndFzUYFLwkCo4HP7tIQB/tYngenveTCD9DUSJXxmS1mLQ9GfpQdaMz/QX0Gwp6ny2i+2WbPRKIq63WvXVdbYCK9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UhQoP4fw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UhQoP4fw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E00B61F00ACF
	for <dmaengine@vger.kernel.org>; Tue, 28 Jul 2026 19:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785267213;
	bh=SXI6gFkjQYZ+NYsO8AhtQ4GmNWfEVEfMDOECqmQ48FI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UhQoP4fwQT/U04THSEbnxCTgBCvNja8g73PmWS1fh0hFnFNgwTtWxfvgJPBJHgft9
	 5YV13qSMLGOBqBgGsiMAbDp9vjYRhjehqIroPzfUb/2S8pf0Jbu/o9Dez8UX4l5QBg
	 4PAzQJ7TbgxUyho1mmX/fblyz2DNUzjfz4DRxVMpO59+J0FnK0RdIHzVJfADqMYy9j
	 ozZswU9+IXmj7XNXUwdh1F4XA14kb6C6g8U6Nmep9PLDPVgpml88uvBPRHgzFrs30N
	 YE5scn29I9L6fS3eJqdxazdb8etVGy0iz/L5GLzLcgr48cpJjaODFpvFN1iqcFmzH4
	 dtUBam0By19QA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b021916bd3so113602e87.3
        for <dmaengine@vger.kernel.org>; Tue, 28 Jul 2026 12:33:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RphoOxt3pB8d8ImJInqzy5/rJR2O19xfjv0Uq5x9p4pTbHCpY6ghdanLhn85CBFw5AVzjikKmctFC8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAnwR2oDBSZ4SNDc+MRaScMJ+F/hp5S769Uk4zNLl+xPG7HSf5
	/fYhAOhNetJR+fmUR58kRaOATrGlYNfCnqhT+awVkrXqfHG9ex6wAnHKCREoz0aKVlDDXebHop8
	NqN3/Xpt2cjx+AAEHEXDuH231LMiW9bg=
X-Received: by 2002:a05:6512:32c8:b0:5b0:1c19:2cf4 with SMTP id
 2adb3069b0e04-5b2d024a79amr690589e87.35.1785267212617; Tue, 28 Jul 2026
 12:33:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com> <119d257968c0a337b7e439fe71b59636e7fb37c3.1785183549.git.allen.lkml@gmail.com>
In-Reply-To: <119d257968c0a337b7e439fe71b59636e7fb37c3.1785183549.git.allen.lkml@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Jul 2026 21:33:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLmAxMVzV=5zhk9=qAnKW=dH=kyaMh2ZxHXkC_DjUag5Sg@mail.gmail.com>
X-Gm-Features: AUfX_mxp81_Wlqgv-Ug3odEUUq02BXPt84M_OSF4GyANip7gyAC3QepxqZfR9-I
Message-ID: <CAD++jLmAxMVzV=5zhk9=qAnKW=dH=kyaMh2ZxHXkC_DjUag5Sg@mail.gmail.com>
Subject: Re: [PATCH v2 17/64] dmaengine: ste_dma40: convert per-channel
 tasklet to dma_chan BH
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 10:32=E2=80=AFPM Allen Pais <allen.lkml@gmail.com> =
wrote:

> Replace the per-channel tasklet with the shared dma_chan BH helper.
> The handler continues to run in softirq context while dmaengine owns
> the common scheduling and teardown mechanism.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>

I like it.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
