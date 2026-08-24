Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774BF3F1656
	for <dmaengine@vger.kernel.org>; Mon, 24 Aug 2026 09:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562909; cv=none; b=D6PFnIkkNTrbfAhPimAdh7hYPNPCCvZU4tX8yAzQdI/Ykej40nZL0Ui7SDqv/jKG/RjJoCVzgHkVhyaBznWbPqk5TwKV3IyKHWNB+5yzPGwz+6iPWuhbjJjAEJop79zFCUmp/4/P7ZJR4u86vx8kd4XJN6p7q1JJIwPx1imiP0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562909; c=relaxed/simple;
	bh=eXZpuwQM9oNy1Hm/SuZMYgIQpz57NlPhmbuKEN40o2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IVEcaX1QdM2Fl0hlGidRRPhTsex2x25aqpy0Fr0xU7JifVmY/i077HkxU9ERvDFgN4+1iA7KjY7EtN/0qAyqUMmm05RkaCdBlwQ3ztA5R31PXD419Hv+tc1/J/bu1vZbYNQ6Pb117Trywt43YkL/nvwUNIS0sApuqxJUuxNWTow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JqklSNTO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JqklSNTO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D901F000E9
	for <dmaengine@vger.kernel.org>; Mon, 24 Aug 2026 09:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787562908;
	bh=eXZpuwQM9oNy1Hm/SuZMYgIQpz57NlPhmbuKEN40o2o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JqklSNTOvPIOUZV+Q0sLKZHnOo0/OS0yVVtzBU8m8RjxWKTx/046RVIbjnNahe5qd
	 p42NQCfudRYyJPffJuEKFJcMM3jE/34sys+r8vK80Gura2obeeINN6CSM3wnmujOt+
	 sFISoFcFWZk6eNDmsZV+4BzvvRS1HVcKggv3EuPr0IQgu43QYqpNeNoQ9qwVf+0So8
	 HPepJUyZGR83PmixdnV3yCWu3DC9XJ6A5THO+fbGMhqDyyP1iOnQuOYPgJIE6eRYcc
	 pA8Jpmq4OPxLKOhxffDe0LSvuATGK1sjW6LR+94RtzoP3xGlTtCVF8aRYVtijyl0vy
	 A4Ew6tjgd7B3Q==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b01cb18515so2731820e87.2
        for <dmaengine@vger.kernel.org>; Mon, 24 Aug 2026 02:15:08 -0700 (PDT)
X-Gm-Message-State: AFuF++mhWBGhHlMDuA1RKYd2fJ4vg3/3Qux6C2vmzVARhUlYL0CFO394
	9Ro51Dlvy4VHfQfeI0FlVxl1r4JptVFvC4RruKNLsA+ffGFiv4woK4cZ6qvokEgdVWLXN5qIQhI
	01ChX58diKo/yjb1eJtLlJBNMftI1h+E=
X-Received: by 2002:a05:6512:31cc:b0:5b0:bc3:dc11 with SMTP id
 2adb3069b0e04-5b4842694d8mr8278786e87.22.1787562907068; Mon, 24 Aug 2026
 02:15:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
In-Reply-To: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 24 Aug 2026 11:14:54 +0200
X-Gmail-Original-Message-ID: <CAD++jLnPDc-v5iuy-zaTrmuxFKU2ehr0ZS65BJyR0x8zW5BWNw@mail.gmail.com>
X-Gm-Features: AcwNN1Xpz4wUPHFz_KxEzXIYuZr10RLzOEGAmXsXhXzCSoMF5HDM55cDdRJ0a1Y
Message-ID: <CAD++jLnPDc-v5iuy-zaTrmuxFKU2ehr0ZS65BJyR0x8zW5BWNw@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] dmaengine: ste_dma40: Fix probe and allocation bugs
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
	sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Regarding this patch set,

On Thu, Aug 20, 2026 at 3:15=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:

> This series fixes thirteen pre-existing DMA40 bugs found while reviewing =
the
> Ux500 LCLA SRAM power-domain conversion.

This whole exercise which is admittedly a bit of an experient
remind me of an EMACS macro named "psychoanalyze-pinhead"
where a dumb random quote generator is fed to an as dumb
Eliza-type psychologist parrot "AI" program.

I am basically pitting Gemini against Codex here, where Gemini
finding more and more fringe issues and Codex fixing them
and then introducing new bugs and Gemini discovering more
bugs ad nauseam, bugs being more and more fringe and
weird as time passes.

I wonder what to do with this, the driver was *already* working
fine, all I did was introduce power domains...

Possibly I will take a final sweep over the patches, fix issues
*in* the patches, ignore any "new discoveries" then call it a day.

Yours,
Linus Walleij
