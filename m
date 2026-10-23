Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792760403;
	b=W5iLiRs13XB8MbgZHXztp5xoOfTnWOom78bS0VaO/iIch9jAZuwilCkbHBHRD2t0h+Lp
	 GhnHRKmAZ8W7TYeHPJVzeThutBGFYYdqT/x6TSvpHCCtdYi6UvXi018yR26sDV5aW2LRq
	 gliaPDvvSJzadSUQhMo525vSbJbyEcE3L/hwW6icPyboYqPFjdS7iMEu+LwDcvBrTZbQK
	 o5qiQQczcZyqdzNOIm4K0QhndlvSkV4V6kDeEO2efMvmQUkHUlJOaho7SUNFoRocLSFQQ
	 0LV+oW+VQ1/331NBBfCsGVLbakSZrEG8sBJ8AWUoWdLZWz/dvOrn2UTMmvaRIdWp11g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760403;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sr19VKYUvxwLrJlgEMdcLVEIVJZklrD+FybJ3ZeZXGw=;
	b=S8LnXAQwdcdvhoX6kitbegqd6AX71T/8bmNcBpb5ODg9c3S9Hj2skdEoD7njm2SbivC3
	 YCZA2rk4Kk/1F1LVG1IiH+af03DPCRu1qdjOXIWptFCTdk8lHRUvXM3cAXYAYBokmGjqH
	 4Mt3kiSrRdb2cOoCdRxSOcsCXOQdlilUseHK2apvmJq+xuXrhQbBnou9P+5qzmogKmsYA
	 04rAbfpmL2ubhdLW5rbarsvGE8mxqGSx6e5SbczpszjNrMBdIBtymgx+QzSkaOykza+E0
	 07IEpy2j0D/1kSstTW40P20z9lpgeaDZgWC/cASC7du0o+ON12HYYLp0QOIu0J4Cdwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n3b048kK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8308A606A31B
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 13:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n3b048kK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C4C11F031E3
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 13:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792760403;
	bh=sr19VKYUvxwLrJlgEMdcLVEIVJZklrD+FybJ3ZeZXGw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=n3b048kKb1PgtvbhAx1oJQLSk/xFZgNmv8qTeNvWni2JXqRPAezw+xIkNJtW8uarj
	 eNfLC86mRiNlo1HYYvauwH5Y4zlYITncn7JnpGtbsxk7n4cGeETq6R+MwRdb9nKFUu
	 RZzgS8/zXAF0lOg3lI/sJVzLrBfvrz1BsYN32R+98eMUJQ87hhhnpaTlUuh4AvtEk1
	 yT/hUx4TCKNCtMTnkGzm8I76x339WOoxQm4rja12pod/FwXYpLgbAXiyM0M8BQrc/W
	 yjsuqbpbDNPYMihVezf9pYFVzYL7xp70t1bvJBHg+e4eraqugYKki+NLkEqxTR/ptu
	 Q2jx4BzZBKi1A==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5ba328513b9so660205e87.1
        for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 06:00:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx+lCPl9DvSWuG4k5xbJt8zN17+qw8oN/bvp3HpocXQ0/69dcaUFac5dsPLfPe2kcjdJOWV44KLhtg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqD+PBkGp/xfRLgc16yNyTToshJsRPznn197I28HICrcU9wWR9
	GVX9iAmZKinTLczVemFXlrohXxijOC5sZ/EQ3HqkNUHKq4zB21aN+8lu2F2oZr7z8sL6Ul7MDKG
	XTSffXP/MhZuNjsYPXX3eJoq7wDvcA5M=
X-Received: by 2002:a05:6512:1244:b0:5ba:3632:cf9 with SMTP id
 2adb3069b0e04-5bfb0a4f3a8mr756271e87.66.1792760401405; Fri, 23 Oct 2026
 06:00:01 -0700 (PDT)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260921-ux500-power-domains-v7-1-v3-4-9352be6b86b1@kernel.org>
 <179242679515.1178810.16625867453853597322.b4-ty@b4> <20261019163732.GH2663669@google.com>
In-Reply-To: <20261019163732.GH2663669@google.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 23 Oct 2026 14:59:49 +0200
X-Gmail-Original-Message-ID: <CAD++jL=8ZgrUHoRuPA=tWnP=iODE7hR_zOGUmTS1p7iRNggivg@mail.gmail.com>
X-Gm-Features: AclHuK-ukw_Hgb4DIFvnusEPhIMVNTAyp8V0dmIgTflHNqlHHkK-tLLwcaoopM4
Message-ID: <CAD++jL=8ZgrUHoRuPA=tWnP=iODE7hR_zOGUmTS1p7iRNggivg@mail.gmail.com>
Subject: Re: (subset) [PATCH v3 04/18] dt-bindings: mfd: db8500-prcmu:
 Deprecate EPOD regulators
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	dmaengine@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 6:37=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
> > On Mon, 21 Sep 2026 00:48:10 +0200, Linus Walleij wrote:

> > > Deprecate the db8500-prcmu-regulators node and make it optional as EP=
OD
> > > control moves to generic power domains. External consumers of VAPE an=
d
> > > VSMPS2 now use the actual AB8500 or AB8505 buck regulators.
> > >
> > > Stop requiring the individual regulator child nodes while retaining
> > > their definitions for existing device trees.
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [04/18] dt-bindings: mfd: db8500-prcmu: Deprecate EPOD regulators
> >         commit: c8132247fe4df52e9982d74c986bb199d792b85b
>
> Hmm ... or would you prefer for the set to go in together?

No this is fine, thanks! :)

Usually I prefer to trickle in dependency patches.

> If so, how far off are you?  How many more Acks to collect?

Not too much, it's some review comments from Ulf that need
addressing so some banging the set into shape in early -rc shape
and I expect we can merge the entire set for v7.5.

The endavour god a bit sidetracked because there was a pile
of technical debt to churn through to fix bugs in the different
drivers which were of course extensively refactoring the
same code lines...

Yours,
Linus Walleij
