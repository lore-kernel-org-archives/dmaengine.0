Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F46838E8A1;
	Thu, 15 Oct 2026 16:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792080224; cv=none; b=em2jOaX45PFmAhq2yIz/0ntHIeZfWraZ/tfXd0ohc6N9nSwG4JO+bAHgRJJuVcONEHjkhwizbCgbMbY6e/4YJOJTDDXrjDUuQ8gXxXqJ5kYMDJtW1V1ZCInGxi/VRriLMVfmIMbF3E8/DPaEGxV3yw614Pb7lLz1rbuabGVDVj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792080224; c=relaxed/simple;
	bh=KWa3N34z4EdMgBN2JAVWSnlcb6y9cDqIiEAZLA5e8Cw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=RL7l2PHzBkKmN+MMJ1tDmLugpICI+57tNtRGMxXujKuEWZ/Kx7HFlF78awQvL4NLQcVp4Tkl/5axVhLxRTUeFRS6/C8g+xutBp07GTuOAg6r2DPvKCHLr2VZR22yeHYHL22igVbR6rZUvk19Z3LeZ4xyXojLADlZY+kO7avi1ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WFW0TEt8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WFW0TEt8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0EF1F000C5;
	Thu, 15 Oct 2026 16:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792080213;
	bh=7RW/wS0efcaRqzS87FYb3MAQKqXnjNwVZPetm7ZpFao=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WFW0TEt8RBicgBG6s0yZP+5C2Jos5alKs6KDwnu7zJMM9pnkS1vyP5fwB83+Q+DGp
	 FCq5ilAgVzKGF72L54xnjmufd177cPlWLDlwOg8YYoB3zZy/IvS1Sw2lUZjTolu/9W
	 Bj3jaK65NnS9yY/VaFMSpV5AXSiJ74qMpIvFmnP5Qh47Y82BuV9sWxZW1b8ujbptnH
	 JbcrzH+tCVw+MrhEEKrTkVyXDlgvfOqsJSTeNJWwVN/jl/G6Il1DZinEKG4b2DxIvY
	 ynw/VPE5g1+u3BSryeHmkso7jcX6sIOZH6vv5kaXlqQKk+E3StwEQxAZT7uiAdkuqK
	 uCGyaneWQ1lcA==
Message-ID: <sashiko-outbox-173127@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] dmaengine: ppc4xx: adma: remove unused
 async_tx.h include
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com, =?utf-8?b?b3BlbiBsaXN0OkRNQSBHRU5FUklDIE9GRkxP?=
 =?utf-8?b?QUQgRU5HSU5FIFNVQlNZU1RFTQ==?= <dmaengine@vger.kernel.org>
Cc: imx@lists.linux.dev, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261015155616.3068503-1-Frank.Li@oss.nxp.com>
References: <20261015155616.3068503-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 16:03:32 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dmaengine: missing prototype for ppc440spe_async_tx_find_best_chann=
el()
--

commit 7df6c7a27c8059b2cc2b7731da8108aa6dffb69a
Author: Frank Li <Frank.Li@nxp.com>

dmaengine: ppc4xx: adma: remove unused async_tx.h include

This commit removes the async_tx.h include from adma.c to prepare for
deprecating the async_tx framework. The commit message states the include
is no longer needed and its functions come from dmaengine.h.

> diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
> index bcc54d584e2bf..05041b99581a1 100644
> --- a/drivers/dma/ppc4xx/adma.c
> +++ b/drivers/dma/ppc4xx/adma.c
> @@ -17,7 +17,6 @@
> =20
>  #include <linux/init.h>
>  #include <linux/module.h>
> -#include <linux/async_tx.h>

[Severity: Low]
Does removing this include cause a missing prototype regression for
ppc440spe_async_tx_find_best_channel()?

The prototype for this globally exported function is defined in
arch/powerpc/include/asm/async_tx.h, which is included via
linux/async_tx.h:

include/linux/async_tx.h:
#ifdef CONFIG_ARCH_HAS_ASYNC_TX_FIND_CHANNEL
#include <asm/async_tx.h>
#else

Removing linux/async_tx.h leaves the function without a visible prototype
in adma.c, causing a build warning.

>  #include <linux/delay.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/spinlock.h>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015155616.3068=
503-1-Frank.Li@oss.nxp.com?part=3D1
