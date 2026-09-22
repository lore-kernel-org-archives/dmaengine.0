Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436E135C68A
	for <dmaengine@vger.kernel.org>; Tue, 22 Sep 2026 23:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790120483; cv=none; b=EVvvCO6PMYbL5YCwtJl2HUqU21hw82KRm338kVXveUUehjpSqs7QMkD41UMFdi8ARIoG911gg1080FII7kSzIE5EbEz+TBp9to5tsDgL11pt8G+rztDDGlWdcyuob1f48OnN7mhCBm7DLYE1axQJ8nzcdCwMLEDcWdWScvbp4i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790120483; c=relaxed/simple;
	bh=OmAXoJ7ICdfkiqqxrLXT6Cgmu6sF+LA5cSDJh5YiBQc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z9FCValuH22wf3zMhhPVI1HbBpc2rKGqxLzZlHmTWZxEdGeQm6gR35ehjTODFJbfApJSvPn5lyubKRrmOobeyWXEjHUcy5F/Aur9X4fz3MGUDwjZsFgo+Ye6cRJeKjNv4GRMtuMw3YXw+3ngc15Nnb9MyzDnjNBskdN3T9lamqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j15xr0IK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j15xr0IK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D79AA1F000FF;
	Tue, 22 Sep 2026 23:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790120479;
	bh=lWVtzeB8CarV79PCKwAPQDF+RASeidu/bcKMf7EONoM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j15xr0IKLXknu2r1mEPv1fdU01/MfxwCIRhxnDoHNtL9tBhSYiYXklpQOmRY3ohSV
	 6rE1S0wN/1KMwdvURvr02K5U6RR2RCUosQH23RjupdNoYI4wXSTtLW0Woy21o9qrRt
	 THMlA1IzYItcvEvJG2pf3OfI8ChL3zdshkE0u7IEDJ3P/tbb4Vi75Kqo4LRzLtGNdc
	 qCQOIIDjuIrBo24J8xqdXYwpM43b7wiIJcqrTWC/2cAgJsjkULUBrFlqGh12gWQs0e
	 /6MuK246/NteQLEnEUt/pKNkkdesKrOoP3Z77z+muEBLwPyvBZsDbASpenUMZkf0JT
	 je+eXhnYB+GXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 08/23] dmaengine: ste_dma40: Return IRQ_NONE when no
 interrupt is pending
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260923-dma40-fixes-v5-8-709d160cde76@kernel.org>
References: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
 <20260923-dma40-fixes-v5-8-709d160cde76@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 23:41:18 +0000
Message-Id: <20260922234118.D79AA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dmaengine: ste_dma40: spurious IRQ regression due to returning IRQ=
_NONE
--

commit b3869fd527499e9a4f208caed7dc53effe8c70c3
Author: Linus Walleij <linusw@kernel.org>

dmaengine: ste_dma40: Return IRQ_NONE when no interrupt is pending

The commit modifies d40_handle_interrupt() to return IRQ_NONE when no status
bits are pending. This is intended to allow the generic IRQ core to diagnose
stuck interrupts and eventually disable the line.

> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 9e8879e3e8d1f..0c3f837fe5867 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -1819,6 +1819,7 @@ static void dma_tasklet(struct tasklet_struct *t)
> =20
>  static irqreturn_t d40_handle_interrupt(int irq, void *data)
>  {
> +	irqreturn_t handled =3D IRQ_NONE;
>  	int i;
>  	u32 idx;
>  	u32 row;

[ ... ]

> @@ -1884,7 +1891,7 @@ static irqreturn_t d40_handle_interrupt(int irq, vo=
id *data)
>  	if (ret > 0)
>  		pm_runtime_put_autosuspend(base->dev);
> =20
> -	return IRQ_HANDLED;
> +	return handled;

[Severity: High]
Could returning IRQ_NONE when 0 status bits are found cause the generic IRQ
subsystem to permanently disable the DMA40 interrupt line ('irq xx: nobody
cared')?

As noted in the commit message, the hardware interrupt is shared with other
SoC cores. When a foreign core's DMA channel asserts the interrupt, both
cores may wake up. If the foreign core clears its status register before
Linux's d40_handle_interrupt() executes its readl(), Linux will read 0
status bits.

Also, when Linux clears an interrupt via writel() earlier in this handler,
the posted write may be delayed over the bus because there is no flushing
readl(). The CPU might exit the handler and re-enable interrupts before the
write reaches the hardware, causing an immediate spurious re-entry where
Linux again reads 0 status bits.

Will these transient delays now be counted as unhandled interrupts,
eventually breaking the DMA controller and dependent peripherals once
100,000 unhandled interrupts accumulate?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-dma40-fixe=
s-v5-0-709d160cde76@kernel.org?part=3D8
