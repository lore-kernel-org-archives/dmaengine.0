Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FD444212E
	for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 13:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787232582; cv=none; b=io7sJh47idwrltTo22t3x/l4C62RgdLNoSnInJfcpNCk/mVVaCzXILyj/rwwmItvtTqA/Y2KTDEMZ/ZyRuGZjJ+L6FqAjPVdrf6Yltqb0n4sEc7B6ZXeEA4ksVNq3jk6JJdCMPhrGnLfvHfY3LB3CDCkpijH8wilMLBRGjDxEVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787232582; c=relaxed/simple;
	bh=hpikxipoTv0NOYraSI4mP1DgCIu9awNG77YwpoO/uho=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mpaANcMlE1XlgIxV1AFW4YvRfM+KKM2IFLMm1HaWeO3T/lQ5+4A77YM0Ll/C4cq4gTFxkMslPTNSeDeF2CfYTGDTw4QgctoWL6zBOhWeahF6OGd3TP21iPdw8GIING1XauFSYcxWbugSHUHs+VMHiqd6X57DtMZQm+9AEaHUZxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ehApKbv0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ehApKbv0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363511F00A3F;
	Thu, 20 Aug 2026 13:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787232581;
	bh=b73ySBD9xGLWGMsGdjySTEW8paZBXBzmk7qB/c51g00=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ehApKbv0YbpqwdBnHvIT1ecOStMkkKNWsVl71SSjjoEMuSGjDa349a2TjZVkpswSj
	 3d/M3Ffe0xZhszPO2/A9QoyBXDlE2YGWahLUwQG5LGq9C1QJw6+wzIif/W8fj2aJ96
	 ZDE6WFNBlo+sK1o4RFmlcCchlgJItgGSzWf9JpKd4ejMLQDST1ihSJvq0OGYz3gTe4
	 6I7vWhDguIje2vkwLqWvFfO7wFpmKqm9yQMys6QTXEM8LNJZJJtQjDgoK1WiWMOeSe
	 3SG9HfWu+6XM0ZxlTU/n2tVwoDX1DQmk9f53ykj7/6mP66a1zoSvTBJ1fD1h5ALjyq
	 Hs7qRTl0EyN0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/13] dmaengine: ste_dma40: Fix probe IRQ leak
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260820-dma40-fixes-v2-8-63238334c707@kernel.org>
References: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
 <20260820-dma40-fixes-v2-8-63238334c707@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 13:29:40 +0000
Message-Id: <20260820132941.363511F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware interrupt is requested before hardware initialization and=
 Runtime PM enablement, creating a window for an immediate IRQ storm.
--

--- Patch [8]: [PATCH v2 08/13] dmaengine: ste_dma40: Fix probe IRQ leak ---
commit e1b29c17ec30abafeb3d5100e10a174f78b73842
Author: Linus Walleij <linusw@kernel.org>

dmaengine: ste_dma40: Fix probe IRQ leak

This commit fixes an IRQ leak in the probe error paths of the ste_dma40 dri=
ver
by tracking whether the IRQ was successfully requested and freeing it during
failure teardown.

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.=
kernel.org/
Assisted-by: Codex:gpt-5-5
Signed-off-by: Linus Walleij <linusw@kernel.org>

> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 0c9094b4c4ade..8cf73b37f8bfd 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
[ ... ]
> @@ -3605,6 +3606,7 @@ static int __init d40_probe(struct platform_device =
*pdev)
>  		d40_err(dev, "No IRQ defined\n");
>  		goto destroy_cache;
>  	}
> +	irq_requested =3D true;

[Severity: High]
This is a pre-existing issue, but does requesting the IRQ here create a
window for an immediate interrupt storm?

The interrupt is requested in d40_probe() before hardware initialization
(d40_hw_init()) and Runtime PM enablement (pm_runtime_enable()). If the
hardware interrupt is already asserted (for example, if left pending by a
bootloader), it will fire immediately.

Inside d40_handle_interrupt(), the handler checks Runtime PM status:

drivers/dma/ste_dma40.c:d40_handle_interrupt() {
    ...
	ret =3D pm_runtime_get_if_active(base->dev);
	if (ret <=3D 0)
		return IRQ_NONE;
    ...
}

Since pm_runtime_set_active() and pm_runtime_enable() have not yet been
executed in d40_probe(), Runtime PM is inactive. This causes the check to
fail, returning IRQ_NONE without servicing or clearing the hardware
interrupt.

For level-triggered interrupts, could this lead to an unhandled interrupt
storm that permanently disables the device's IRQ line?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-dma40-fixe=
s-v2-0-63238334c707@kernel.org?part=3D8
