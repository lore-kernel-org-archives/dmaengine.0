Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795033174;
	b=sgKjhzJHXHoAchkDfuM3wjSW5Uuz4Izq8rcliKpBhExkgJ1IGJ+rYRH1qkqpsM0pifsW
	 TD9CKnq83zuBjrfgI/gP+XVkaDoDI0USMBzsKjCKsYjWEn4xLdrQE8XSYRQ/aRTMSCxgS
	 ZMO0PMhX1NBa74JlgZMsNukx9MLbL+noUUYkHxKrINm120JSMd2bVCSN03o85P0bPnzrf
	 rM8Lu5Ux22rZDo8PlLkDdCUGxyYg6XHWVuTG9ldwWynPCKlx3fIJvTFUGFd5RjWL2hRuS
	 lBOAVDfx1ZgF9LIhpa4uwhT+4cw94+ehR0S933l2nB9PToxvMgTEceC0eqzQbqxACFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033174;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VIqubSxa6chp+PQfAvvw0Nq36rRNM/+XIF5m2rPT+yM=;
	b=PutfgJkEqSFNVgDHZFI35FjLo1NghFQvivTdI7b38iNXWQMValyxgHKFcgoBt9Jijfuy
	 NpXoucH5CzNgsHV8AaAp2m+kgvcjpcNYl9BCoQREtqYwrDGG4Zqtz9gVSOF+uj+qR0bCn
	 3r6Ku2pc62Jl0dv+pMZQ9Tfzsd4PHvtczSimhf0ysyp01Rz0N+dAVZul2L5FPo4w97edx
	 erndMs36B0vbqhGphHZCXITmAuRgxYSCadt7I63sE3EW7+x9XJNZxxMzWVMT02aeSa2yz
	 P189vUsLaP+GGn2/CBy57uUVZiwYtFllhjfTF5BXkZ+sWsfYz/1s0p2tSMcR/0xe9oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O1XCocHm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08979606A337
	for <dmaengine@vger.kernel.org>; Wed, 18 Nov 2026 20:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O1XCocHm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E1F1F000C6
	for <dmaengine@vger.kernel.org>; Wed, 18 Nov 2026 20:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795033173;
	bh=VIqubSxa6chp+PQfAvvw0Nq36rRNM/+XIF5m2rPT+yM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O1XCocHmC1uEbbj94W+sS5HN2aQj/aTWDgTaCJnorv60lbj1qrFLyAyz435tV64SD
	 hjiTpKQP1aBE5Xqtu5DiEyl6PUEt+xKRZPmPy8EcRVZ/gD+TO2QbbYVuo+tY5i/rc7
	 s7yKP/GovMGVe42SGHjiOot1t609AFaWZPHF4bm/5spD5boP/9q0vZOCG5uHrXy7z5
	 FNbVyGMdlFzI39I1E6Wu1jFhLAOzqUm8/3ZPdWX2oD48S9sxkvJ+IWf6g9VQODhygK
	 SYXFlpG6zoGOx49CIleiayWZZt/gXd6lgejMByp6jAVfvl9TaG8rjf7EAA8Yav0ee4
	 ohzqEJK5/qgmw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c1479be604so1151853e87.1
        for <dmaengine@vger.kernel.org>; Wed, 18 Nov 2026 12:19:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEbskf2KAnXjnRQh5mx7J0sjopfU+Ty4wGXRgQjyBRk+CDpYLo7KVWiAHUTL/2yu56qQyheEDdkCZk=@vger.kernel.org
X-Gm-Message-State: APuU4Z83f3yo8DX9qM/O066qEP4X5vImsUw9PfBUqA9aSurWYTVXQ1mB
	KDo2bVIAwDJ3xD1W2DEobv4ADW2IltqA3WO811RpBxIyZcb8JKVt65dDElcZ+3mNnN6m261d+mk
	+w9r650DD+MsfOYPjqv9OBog+uFLQu98=
X-Received: by 2002:a05:6512:3e19:b0:5bf:a592:1d6b with SMTP id
 2adb3069b0e04-5c1aa2b7054mr1382701e87.62.1795033172582; Wed, 18 Nov 2026
 12:19:32 -0800 (PST)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-ux500-dma40-powerdomain-v1-1-da8b6e1a0376@kernel.org> <av4CJkri6LQO9FxG@SMW015318>
In-Reply-To: <av4CJkri6LQO9FxG@SMW015318>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 18 Nov 2026 21:19:20 +0100
X-Gmail-Original-Message-ID: <CAD++jL=ZFJFTV6zY=SA+aHMQyjw4MQ8zFgWmUUBEoH6vKDLTsA@mail.gmail.com>
X-Gm-Features: Aa3M54pwwb9o1bjEenCJbSQCJmUNEtUd6VLIE0RDxP1yOLbxmTezi19Q1Oe1J4s
Message-ID: <CAD++jL=ZFJFTV6zY=SA+aHMQyjw4MQ8zFgWmUUBEoH6vKDLTsA@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: ste_dma40: Use power domain for LCLA SRAM
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 8:53=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:

> On Sun, Nov 15, 2026 at 10:26:27PM +0100, Linus Walleij wrote:

> > Replace the LCLA ESRAM regulator with runtime PM of the SRAM device
> > owning the ESRAM34 power domain.
(...)
> > -     /* If lcla has to be located in ESRAM we don't need to allocate *=
/
> > -     if (base->plat_data->use_esram_lcla) {
>
> Does it break old dts's back compatiblity?

It would if they were using LCLA SRAM but there are no
DTS:es that actually define the LCLA SRAM, so we are fine,
all existing deployments put the linked lists in common RAM.
It was an oversight or "fix later", "technical debt" that was
introduced 15 years ago.

After this is fixed properly with power domains I want to turn it on.

Yours,
Linus Walleij
