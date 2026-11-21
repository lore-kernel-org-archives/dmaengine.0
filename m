Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795220489;
	b=R9A2jea3kD3buJrS5kOR3odIuw/KANtobZTUsYaW7rXLxXZb2Z0IuGFaHmrFHuRLAVqN
	 hfliNYtPQhXkkXFTrGolmIR8ZMRyWg64zNinnGDPFQvNDxeg2ikJu/BFhkagES1Bn1i+F
	 9kRJeRAXTxythcqa180hqVfwm7aX9gwq9j6f+Ul+WF1fv+G5KNCwLOy6Ki/lPAUlMTZ5B
	 gWdzVSIcfnfH4AlRFuCsPPhKeGQSsGNT0amZHue1U67l1/Ni5jzLmqkmqp227TpjMC+0t
	 6E3Tg4qVUbtRSHmxN9yRU3dE07D+jQp5iDpnnLAKUJJpEet2F1dtI4/o39uNgS1M2Fg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=LYqdc75BT1lTbF77dS8F5BOtPhAT/8YInZ5Fdxp9xiA=;
	b=MyMYrfxgnTnM21gyA+wJ7FYgJ1c0/bhiOjUfgZOj/s70ctwL/xje+yC0iprIhlF0Yc26
	 WQ05X8rsovtva5NSgx5qLOZYOm2Gx3aLB1LGRU3YmKhyTDt70vBwiO+9rWnxmtPIy90DI
	 AozLO2EV3FhhFObgPo3n9X4YDitC7NHh7Bxv3bnhxqJqwXC4k713sGNYfU/by4+6qTnTD
	 cu8zPRQ06eEMy80rWKgDD8kzWW2q4PTxMwlgL4lv8nc7YHHAGoGEqJpMq2l6oV0wRzVI6
	 KcQnvzF8YZHWhYs9sMPvxfwdD2d2EOLVA8ABD0BR7/hcf1IL+hQ2xELO0KnH/rio0lQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TYO2HNiW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69095606A6A4
	for <dmaengine@vger.kernel.org>; Sat, 21 Nov 2026 00:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69095606A6A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TYO2HNiW
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b7ddb99db4so1852930a12.0
        for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 16:21:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795220487; cv=none;
        d=google.com; s=arc-20260327;
        b=JSyx92oXvinUgvWQUk1mEMMNXmoq3gv2LNO5dU6l3p3R5lb5lYK3+Jx6Q7jFWoTFIj
         HsCPigyGCdHkm4MR/H3T4s6GjYrSa+kjLZVRzdPNMGFG2H+Oi45Vdnh8jJEpf8vSGERY
         I3wZqg7lPUs6v7o7/DQ418kcUeU6h1B/V4gWRrDJ65QoxELXp01T00czZmWu5r+OFia8
         GZQ1reAIgI8BL/Mg6zCiq9pW8/OJDUics6MyR2WEwfxXblxrXalhSHCiUVJHZBMFDwHL
         erMpyAfwtihwoll+Gwwpjdwi4IDznFKcztvm13BjkhyJ0mQ4fQk5QBmCiIh/snp3TnNc
         FILw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LYqdc75BT1lTbF77dS8F5BOtPhAT/8YInZ5Fdxp9xiA=;
        fh=sJwXN6PSTohsAa4UDHf0pgOsg7MYq1JruJC0VmeUVoo=;
        b=stkqn0h22GbhRmHBrOuUE2FZnq5dN8wyUzYizS0CrGyEkReMtwOHHsenrsaKyAI2jW
         izx/glKqiiBfyvrq+w3PoFGq4e43faVBk1d1MsXzlfetU4jinnHPVquu6wIhl4nHuDjf
         R+rW33Ymc0CE+AD+jj6k1tJQ1sPHd00ldAX8eu20yomhoisW/nVL+Xjb11ur0mIaTz4b
         G/wxCyY+mcOdbaPju6SDhvMUw+hxjTmvf42rkWG4eCaRgCCcKE99w/63tRv00Qf0DnWi
         yNgPYmo1tz69oGi9kp3ruCkHKe/Kbwke7JUp8b+K7lx8WLYYEurcEmqLvgPOoi8aegIS
         uCpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220487; x=1795825287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LYqdc75BT1lTbF77dS8F5BOtPhAT/8YInZ5Fdxp9xiA=;
        b=TYO2HNiWuepoW06nbobCJniMr/SVwOjbrEILFva6FDPxxhWfo2p0OmFN9HppetgWbi
         Bj1zkKw7O9INM/eATtfbluu0xl7N9u09LRV/PSA6dCUwoiWn7PS/B4UTcZeup9RpZc5h
         j6ACF1yON49//HU4v8fJgKTI7t7IhUITfoZR4VcvG6Oe+LJN5R0e4F1xouCks9eZk+3Y
         60q+kRIgUQl/TRxACjaDSBGwJGpQYtrCIB3l+a23mbf/UuP0deRMQSj/errX4BXv/cM+
         KhD6iJFtv7+780BgQ5a5p6GuSuJJG7gEDMdIikmmPxQieFKLQ/rQzu8TUzSkCIwjMqo6
         1Q5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220487; x=1795825287;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYqdc75BT1lTbF77dS8F5BOtPhAT/8YInZ5Fdxp9xiA=;
        b=Auqa9wt1/O11KRuzQVKRpIGRluIJb8IEFHan7MPiLKDJoVMBSpqyOYBNyzJJOFdzlO
         05YUFeRVTJ8qphtHRm4BAGJXgu6HNUqgXTeOtPJIBq6JFFTO53UEJqMqOf3Hbjm0r8WG
         w84ahQL286mZKDP6t5nrJ3hPQgDaYdR6thv3sQxT1SixoQgRe4Fo27YnyJFtiFDHVbFg
         jjIj2SlFUYI2EmTRdT0oFiNnDubAo7fTTQly25gRpUZ3PIwJkvEcLRGU0D/DcCrplv2c
         Td9GrV8JUGRwxcGZfxQWu/TK1/e6KURAt31tiuMJAU6m1s68WBuo3ghK7KHd+dsZqBWx
         OQ9w==
X-Gm-Message-State: APuU4Z89qs5u56yzx87x2bvsDsv4WlwOnZG9EdoXac9Wmthjap1gqrg3
	NqHi2gowrwSjZ3d91TfBmUZ1eVPcmu2O5GMR7xeVoVUMsPy3YtAxDtRsy6qa5jccv6xb0M6HPGb
	iVxWQOTHyQiVBMBCkl8kZA7LNJ+XzJz0=
X-Gm-Gg: AZFdTZegg6C/pnKDbe3e2uTZmjDFvqAOtDiY7gjQ5L8eY6oeLcxDqyH+uj5LjRw/aHb
	ENoyLc0pHZcGJlkNLR4uOLjoA5z2oH2QP9fDAXnznBreeIQyEfYyE0L5NqpbeFYjJzxhEdEdtkf
	fO2uTQIp6r0Ei8YELAEF+R1H1mHWYrlgE3y04HBJlviOamf/GMJvL0NWPlvsFQ39koIMmovH4+B
	tJ5NlOWecs7uAmNg4e7jhHZUAqelRMN2o4Uj194GRrOi1XV77w48aaXoVEKu2sVRlzIDVWbB49a
	dxyYo3Cxr1BJtgI6OWKis/gmqd128HgsFIQzXVfCrhO6m1dY8T9WDcyuDMyjWcqVXeVbl3+Ximg
	VP/RnqJH2dTHJYhVkS4MEf6QqlA5YfC5wMdzdH62GyUtkChUCxnjZEhnezkyDeo2BF0lvP58aUu
	0L+bFcktQCZbyOtQ/KXBmRShBsE8glxqt0RXbYAleQO6/OtXheKi/14I8DnX8iXFGj0NP5Kwjdz
	+ynCjvIUaFUq5FycsadZmRGd1HnoiGmmB1FXelJlY03GQiwyQ==
X-Received: by 2002:a05:6402:280e:b0:6b5:875a:c2a0 with SMTP id
 4fb4d7f45d1cf-6ba37d4d344mr3340540a12.24.1795220486608; Fri, 20 Nov 2026
 16:21:26 -0800 (PST)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260917232930.128927-1-rosenp@gmail.com> <awAQMEu_OULFyBpl@parshuram>
In-Reply-To: <awAQMEu_OULFyBpl@parshuram>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 20 Nov 2026 16:21:14 -0800
X-Gm-Features: Aa3M54oEXJbT4boYUjqj_4oeLXlapmGV48mqldJNJIbz8dYcbx4pMjtMHhUbgoA
Message-ID: <CAKxU2N_5+V7QsnDoAHTt_F5_MhXTTKn2t07zpGAuuy5U64SFPA@mail.gmail.com>
Subject: Re: [PATCHv2] dmaengine: ste_dma40: allow COMPILE_TEST
To: Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org, Frank Li <Frank.Li@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 1:17=E2=80=AFAM Vinod Koul <vkoul@kernel.org> wrote=
:
>
> On 17-09-26, 16:29, Rosen Penev wrote:
> > The driver only uses portable kernel APIs and AMBA bit-field macros fro=
m
> > <linux/amba/bus.h>. Allow building on other architectures via
> > COMPILE_TEST for wider compile coverage.
> >
> > Also add missing HAS_IOMEM as COMPILE_TEST also enables configs that
> > don't necessarily have it.
>
> Have you tested and verified that it builds on diff archs?
yes
>
> --
> ~Vinod
