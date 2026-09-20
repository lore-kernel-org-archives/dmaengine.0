Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF772475CB
	for <dmaengine@vger.kernel.org>; Sun, 20 Sep 2026 19:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789931448; cv=none; b=EHF3fSbazhhdZNPIrEjns9Jdp9hHvcSwqYVUOM2mP4sVt7uaIO7wmLdEOWmlwqNp6OJy5sQSpHAOnbuwvBTjIFm7H+5j4D1wJCHFvH5mHKrktcE9o21h5fxODlkkr2WhGvSg/IVjSfmkA5n3ad/Dm8zqTpFJZxRRq26FTRPUzRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789931448; c=relaxed/simple;
	bh=7nxa8XPZBhXdYIVIt0mJuxpXocvxg4zqFBy73+OTqGw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V6OeHvZvApqgCrqE0An040vN7jQGWO1JxIlt2nEsOu9doMci1NFeY2UsulXrnezLsk0IUIBdSq469wodaxPvaD7bszh45NaodOBNY4IM9/FlUma9q9Djv51aYOIcA3Fdu4YCBGDu/vrx4+OGbfkdEI76+cdJqBZCbWgUaRPMWlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jEHG9gAL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jEHG9gAL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20ECF1F000FF;
	Sun, 20 Sep 2026 19:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789931447;
	bh=kY4fGVQJtsjJ/gBk3fA4tZtF8p8lB+DRkjtykLCPE20=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jEHG9gALink+KNpIjgUtgo/xCvdC6tcEtVqNLkdM3eJ1dQzUewP6oHmr+pAtAz6BG
	 +UrTJxgvuEXqOMM29bZjAF7ljPwV7pwrVcQZwGRJlQtH4RcNnODMRJPFz6X86hZldM
	 bCgmcokNO+NCc8dQyFaIhzanu+t7FKn4BkYuxYDUAdO/qARQ0xj45t04eUXczz1ItC
	 AGISSqGMCesugsF5hc3q9/KJ+UA6NClniomH7hdJRUlgy7jynM7QtdPvgLExPDe/le
	 XzD6V0KbcZtzG8FF6rV3CjyJ1Ex2g9RR3Pa/OtPAr95C2iVmiGdN5U28ZcupWREyBX
	 74h7ZZunpgPOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 08/23] dmaengine: ste_dma40: Return IRQ_NONE without
 interrupt status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260920-dma40-fixes-v5-8-5c55cd7f92f9@kernel.org>
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
 <20260920-dma40-fixes-v5-8-5c55cd7f92f9@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 19:10:46 +0000
Message-Id: <20260920191047.20ECF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dmaengine: ste_dma40: IRQ_NONE on AMP-shared line disables IRQ
--

commit 2ed162fa364e4bf7289280c1ba5e44ef8ed65fc3
Author: Linus Walleij <linusw@kernel.org>
Subject: dmaengine: ste_dma40: Return IRQ_NONE without interrupt status

This commit changes the DMA40 interrupt handler to return IRQ_NONE when no
status bits are set. It aims to allow the generic spurious interrupt detect=
or
to disable a faulty status-less interrupt line while still treating foreign
status as handled.

> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index bb052d3028cc2..4380f9a1b035c 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -1807,6 +1807,7 @@ static void dma_tasklet(struct tasklet_struct *t)
> =20
>  static irqreturn_t d40_handle_interrupt(int irq, void *data)
>  {
> +	irqreturn_t handled =3D IRQ_NONE;

[ ... ]

> @@ -1872,7 +1879,7 @@ static irqreturn_t d40_handle_interrupt(int irq, vo=
id *data)
>  	if (ret > 0)
>  		pm_runtime_put_autosuspend(base->dev);
> =20
> -	return IRQ_HANDLED;
> +	return handled;

[Severity: High]
Does returning IRQ_NONE here risk disabling the DMA40 interrupt line in an
Asymmetric Multi-Processing (AMP) setup?

In an AMP setup where both Linux and another SoC core share the DMA40
interrupt line and status registers, both cores receive the IRQ when an
interrupt fires for the other core's channel. If the faster core (e.g.,
an RTOS) clears the status register before the slower Linux handler reads
it, Linux will read 0 bits set, and handled will remain IRQ_NONE.

If the other core processes many interrupts, such as audio streams, Linux
could quickly accumulate 99,900 'ghost' interrupts within a 100,000
interrupt window. This would cause the generic Linux spurious interrupt
detector to permanently disable the shared IRQ line, breaking all
Linux-owned DMA channels. Returning IRQ_NONE for status-less interrupts
appears to be incompatible with AMP-shared interrupt lines.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-dma40-fixe=
s-v5-0-5c55cd7f92f9@kernel.org?part=3D8
