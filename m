Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75243CA6F
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387230; cv=none; b=tDVLL20PuzGb39eZvAtrGmgeD4VW18/+H8tnIkqqTDo0rCp13k6E8legpasipNXX0v+qoxMu1uwhBtenhVjJiw07W3zSPutd5FxDHj7zbXJdxEoQoWR8FOnlrB8owkSEim4rc0Z5HjA8FTGy/NF35iWcIg7HtaPOqc0crJvIyzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387230; c=relaxed/simple;
	bh=rO4lduJfGube5wvu8rmm5aMD3Y54WJtyk+hDuqBqRI4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ThZmoPUEOJnWc/IPOZMhH9xwQwi7ImuNaNZG9aYR8MNYIS6p5CcJX+b+nn0s2u07Lr7BRMkAHWAfWkudhYD2k+zO71m0W7ICF0qDSbEXxOpYLf7V5KHK5V3GEA5OopI/V5jTC9M/+nRAmcTqlqjaq+J13Hzt9AtPP6psAAT9Ya4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mowEggpP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mowEggpP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5B371F000E9;
	Mon, 10 Aug 2026 18:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786387229;
	bh=SzjUbI1eotwc2T94OILLz4WymXYmonxZKrRkdt1cRlg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mowEggpPaYtbzcBg7IVoa9zuSI5wVkANOlH6Jq+tujwmt07IrYz985UKjKwygOYP9
	 7jFd7Gq4cVtZCbl6d687nLI4vdgsdJYXr5cQASwnTiVYD6MbWyFzyBy8Iy12XGuWaP
	 9LBfXzak54lk2A+Bm/tXIG9hx7uTUyOVuMQUMC4R6lRjBaE+wrVmszEmcyZriTnADI
	 3Coal+2j8YOEZXR3Ib67lVqhZKt2mKh6PHMKjbybwHa3eVQCwHP7z00RUhsB9xcwL1
	 k4tyC3qPaRKhp0IAurD0P5eB4Hct9yNnYqjwj3lUbQgqu0Rx7hmb74ShsRJlvvgJaX
	 i2/EhoAE3Shlw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 22/34] dmaengine: tegra20-apb: use channel BH helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <6d720011ba5a41fa48cf1926cd9060da22f89444.1786384169.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <6d720011ba5a41fa48cf1926cd9060da22f89444.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:40:28 +0000
Message-Id: <20260810184028.D5B371F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The channel interrupt is requested before critical channel structu=
res (spinlock, waitqueue, and bottom-half work) are initialized.
--

--- Patch [22]: [PATCH v3 22/34] dmaengine: tegra20-apb: use channel BH hel=
pers ---
commit 4e26e9a252e11cfe82fed93039f39258debd48f7
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: tegra20-apb: use channel BH helpers

Switch the per-channel tasklet to dmaengine_*_bh so completion handling
runs through the shared per-channel deferral mechanism.

> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> index 640b8a218c9ad..45995b82a1330 100644
> --- a/drivers/dma/tegra20-apb-dma.c
> +++ b/drivers/dma/tegra20-apb-dma.c

[ ... ]

> @@ -1511,7 +1511,7 @@ static int tegra_dma_probe(struct platform_device *=
pdev)
>  		tdc->id =3D i;
>  		tdc->slave_id =3D TEGRA_APBDMA_SLAVE_ID_INVALID;
> =20
> -		tasklet_setup(&tdc->tasklet, tegra_dma_tasklet);
> +		dmaengine_init_bh(&tdc->dma_chan, tegra_dma_tasklet);

[Severity: High]
This is a pre-existing issue, but I noticed a potential race condition here
during initialization.

In tegra_dma_probe(), the interrupt is requested and enabled earlier in the
channel initialization loop before these critical structures are set up:

drivers/dma/tegra20-apb-dma.c:tegra_dma_probe() {
    ...
		ret =3D devm_request_irq(&pdev->dev, irq, tegra_dma_isr, 0,
				       tdc->name, tdc);
    ...
}

Could an early interrupt fire before dmaengine_init_bh(), spin_lock_init(),
and init_waitqueue_head() are called?

If the bootloader leaves the DMA controller with a pending interrupt, or a
spurious interrupt occurs immediately after devm_request_irq() enables the
IRQ line, the ISR might execute before these initializations.

Would this result in acquiring an uninitialized spinlock, triggering a WARN
when scheduling the uninitialized bottom-half work, or causing a kernel pan=
ic
by dereferencing a NULL tdc->isr_handler?

>  		spin_lock_init(&tdc->lock);
>  		init_waitqueue_head(&tdc->wq);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D22
