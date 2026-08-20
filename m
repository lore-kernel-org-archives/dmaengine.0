Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3105A4570C4
	for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 13:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787232711; cv=none; b=Q85zZ9QjbLY+485rILp3UG1wJCJqDwjtg/9gymtULOYB1N6qyz8YtiSwUZ8H5hXVPSIFseB9h9A4wlZWtu+SWAindiywAvyIiMZHPFJI1SxamF9wf94qWo/2oqNWgZTMzCNqpue5EOG4MVDk/Th+cI6yjYj6fuoOuhii7g6VeCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787232711; c=relaxed/simple;
	bh=tJeCcaF6/JuNDsunjnQjMkF6m7p+HL7o6OMJtD/9JzE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WMwLsoH/KZYcTHgqZycd7jIsTozT/qjwkuokfFxnOmMjjNgQXFRVbTVF0IUOELiBLkJy8L8/c++EwUk9E4Ez2BbqzH7ne6NxPesjPLPLAbV1zl7brpacujETvNdxMQ9LL10AQNDLHxF3oPZoa1tCBKB2ClOpKgSOTxbb62F/1sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zcjihq6G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zcjihq6G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7CB1F00A3A;
	Thu, 20 Aug 2026 13:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787232701;
	bh=y7rvP50ZUwYL6X6lzErnwgt9CpLoxqXRZa/TXtpn94w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zcjihq6Gnqy2YKytYT9QRl9nV5Ae0W/UjO+gU9d9Fn2P3tDDHuy0PX7wV/WE9hsz7
	 FyEYJ3epX9Okx6Jv5hLdrwVV9LZ0s5HD8aNZZc+LrDw7G2AFTqkp+lOiVY+aiUAJY3
	 YGVYCV2Gjw2S9RBCAHIROzBzTTdYeRj/IaFR34FxRVNhof/RXIv/uJ9QKIZ/texD/A
	 SqLzNvDvEnSBddSncOL10vK/3WBh/kSUVrF1AeLd3fRW1Nw4Z3+xSgTMRmxPzJvihH
	 0jmOyA8ruFFnWW+WFCR+RblRUh512Pk/RnN/j6FbrAW6dAPgHQijXZuFzzTP3X0cm/
	 eliB9ZSd/AhTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/13] dmaengine: ste_dma40: Check runtime PM in IRQ
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260820-dma40-fixes-v2-2-63238334c707@kernel.org>
References: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
 <20260820-dma40-fixes-v2-2-63238334c707@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 13:31:41 +0000
Message-Id: <20260820133141.9E7CB1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Checking `ret <=3D 0` from `pm_runtime_get_if_active` unconditiona=
lly returns IRQ_NONE when Runtime PM is disabled, causing a deterministic i=
nterrupt storm.

Pre-existing issues:
- [High] The interrupt handler unconditionally returns IRQ_HANDLED even if =
no interrupt status bits were found, defeating spurious interrupt detection=
 and causing CPU lockups.
--

--- Patch [2]: [PATCH v2 02/13] dmaengine: ste_dma40: Check runtime PM in I=
RQ ---
commit a32adbd5256a0eee9c50c9b0d29d46183f86ef06
Author: Linus Walleij <linusw@kernel.org>

dmaengine: ste_dma40: Check runtime PM in IRQ
   =20
d40_handle_interrupt() reads DMA40 interrupt registers unconditionally. A
spurious interrupt can arrive while the device is runtime suspended, after
dma40_runtime_suspend() has disabled the GCC clock.

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260819225114.AE1511F000E9@smtp.=
kernel.org/
Assisted-by: Codex:gpt-5-5
Signed-off-by: Linus Walleij <linusw@kernel.org>

> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index facc1bcf42a03..dd449d4285efb 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -1674,6 +1674,11 @@ static irqreturn_t d40_handle_interrupt(int irq, v=
oid *data)
>  	u32 *regs =3D base->regs_interrupt;
>  	struct d40_interrupt_lookup *il =3D base->gen_dmac.il;
>  	u32 il_size =3D base->gen_dmac.il_size;
> +	int ret;
> +
> +	ret =3D pm_runtime_get_if_active(base->dev);
> +	if (ret <=3D 0)
> +		return IRQ_NONE;

[Severity: High]
If the kernel is compiled with CONFIG_PM=3Dn, pm_runtime_get_if_active() re=
turns
-EINVAL. Doesn't checking ret <=3D 0 mean that valid interrupts will be
rejected with IRQ_NONE when Runtime PM is disabled?

This would leave the hardware interrupt line asserted and cause a
deterministic interrupt storm until the kernel's spurious interrupt detector
disables the IRQ line.

[ ... ]

> @@ -1722,6 +1727,8 @@ static irqreturn_t d40_handle_interrupt(int irq, vo=
id *data)
> =20
>  	spin_unlock(&base->interrupt_lock);
> =20
> +	pm_runtime_put_autosuspend(base->dev);
> +
>  	return IRQ_HANDLED;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but the interrupt handler
unconditionally returns IRQ_HANDLED even if no interrupt status bits were
found earlier in the function:

	/* No more set bits found? */
	if (chan =3D=3D BITS_PER_LONG * il_size)
		break;

If a hardware glitch asserts the DMA interrupt line without setting any bit=
s,
the loop breaks without clearing any interrupts. By unconditionally returni=
ng
IRQ_HANDLED here at the end of the function, does this prevent the kernel's
spurious interrupt detector from counting the unhandled interrupt and
gracefully disabling the faulty IRQ line?

This could cause the CPU to enter an infinite loop of servicing the
unacknowledged hardware interrupt.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-dma40-fixe=
s-v2-0-63238334c707@kernel.org?part=3D2
