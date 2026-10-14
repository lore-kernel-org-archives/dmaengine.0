Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4DF3CB56D;
	Wed, 14 Oct 2026 20:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792009101; cv=none; b=HRwcT6EHWZK1Tohsvq8mNm+NAz6GNrSffnvcxmoNNqRX6ZhFiMAHtPLQ1nC61LM55u6H/eMxTfNcRZg2McPb6z9S3u22t+tdFyqmQ++ApB0vyZa4RZLTKyeyQg0pcCUXXY5ivvVXAo/3imluWUm3j6BRU1pOWQ5eVbVIITnCtNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792009101; c=relaxed/simple;
	bh=t5lrPYQJezKW2riZevobKrM8N5y3/Mpx9jopXaaOyWI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=T7+OZsO9mx/a6PdUtcHFxZ/UJ6rFR6e/NnYLRfGxAD+pPu+cQiKLg5ss1vbpJWGOzKA9ctQnbmqpg6LrBpIx39ijXCT/w8q5C4W2w3u3l5+p6daw3dWz5bcqXGP8Vfr2qu/TVIqBvyaLUvNQwtAkrBD1APT9AcZbfFWsTBSN6ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CmL5Xo9I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CmL5Xo9I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C60A1F000C4;
	Wed, 14 Oct 2026 20:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792009099;
	bh=LTh+Qspye9WXp6/K/rYzUfscF3TtYTLTktbzb8UFFAk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CmL5Xo9IRJiuyvJusZP7+nU/gIfWx0Sacxz54OdUoEK91IUbekiAmcVtBRTZJSb9K
	 phmFILfsT+L1vHx1+tsreaWkCRwJMbH0sg4imDiX9rHCqhtzQlr/AIt2N5v+c9xcCF
	 DMi/lPGP6Qi1D59yKU/RgYcLksHTziqsSRP9nLyXK4gr+Y4GMphD0TpPiFS3jIUDRW
	 zlNGiRp79n4Wq6JT8haIxudaS7kuNaRVnAgWKABEcUlx6G34rYWJKSYs5lVbcaEDfT
	 O9ubKnL+39b8mLEsW1XGDmG1YlQBvJW5TNsOy+rmDnkhMFYFLMn1wgJk/pzWxZlkd4
	 TpmdrAUkuS5bw==
Message-ID: <sashiko-outbox-171853@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] dma: ppc4xx: adma: remove unused async_tx.h include
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com, =?utf-8?b?b3BlbiBsaXN0OkRNQSBHRU5FUklDIE9GRkxP?=
 =?utf-8?b?QUQgRU5HSU5FIFNVQlNZU1RFTQ==?= <dmaengine@vger.kernel.org>
Cc: imx@lists.linux.dev, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261014201221.1806634-1-Frank.Li@oss.nxp.com>
References: <20261014201221.1806634-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 20:18:18 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dma: ppc4xx: missing prototype for ppc440spe_async_tx_find_best_cha=
nnel()
--

commit 9b901f64606c940ade9457f8242fc8c04d2f5fa6
Author: Frank Li <Frank.Li@nxp.com>

dma: ppc4xx: adma: remove unused async_tx.h include

The async_tx.h header is not directly used in adma.c; all required
types and functions come from dmaengine.h which is already included.
Remove the redundant include.

> Reduce async_tx.h user to prepare deprecate aysnc_tx framework.

This isn't a bug, but there is a typo (aysnc_tx) in the commit message.

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
Does removing this include cause a missing prototype warning for
ppc440spe_async_tx_find_best_channel()?

This function is globally defined and exported via EXPORT_SYMBOL_GPL() later
in this file, but its only prototype declaration appears to be in
arch/powerpc/include/asm/async_tx.h, which was previously pulled in by this
include.

Without a matching prior prototype declaration, this could trigger a build
warning (-Wmissing-prototypes) when compiling drivers/dma/ppc4xx/adma.c.

>  #include <linux/delay.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/spinlock.h>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014201221.1806=
634-1-Frank.Li@oss.nxp.com?part=3D1
