Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1807E435EC5
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386868; cv=none; b=j+G2SGkGR+nVxjepmFUDs6ohPckXmPAdsCCKU9HH3ZnQ2Y5JCcm+uoTzpugd3zxHvnX5aeAGwNWBsKe2rDZgPw7i9MW3x4ZaB4qAUdqkXUxbxrLHBVnukNU2O8IDUhqkqSlsyUr/ydYzaVwapQWqq3+KCbW9Cht0hdBGKuWOn9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386868; c=relaxed/simple;
	bh=ANkrYKcJpY1IHYjl9pP/sG2Ope918ze6tlGxDtYmE3I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qlZ0UMhwMklM2n1fXJDpI0NKypDujd7TkySMUaeLahcLOQTYvN2TT0PwafwoJY1OAGaF08FVPlPvYG9bMxft1MMJndoZl79XxF1UYJwciY7T/9Q2wgE3CzPJ1rSjs73b8BSt7DLyIixPIXS32wiML9RSHR7tnWPsn4HFXJWuf08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObIGAfYl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObIGAfYl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA92F1F000E9;
	Mon, 10 Aug 2026 18:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786386866;
	bh=cs1gyyfc1YmIH4ucQjMCuXCPVtJ6Mmy1yuDu91S3BIw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ObIGAfYl9FgdoQk2Z9glAiKvuM3BuvDkT8Ci+pxARHY/jWOL+duMrB8zjbTz+6HDy
	 BlAviSEfAxTvt7BueivTGIFl19OJT1g3LLX4l5TzZOw1Gq5ylK63kqIasgTxNt+QC3
	 QwEui82mUGBbXKg+NRKXClVdSDw3BFSs54GrJrtcZSMTQVxJY2h7qkWIVr73K056iw
	 LALoTmO6KgPKEFWcAKMHoApMHkdjUDTOOFc4GaewA91L4vGhhCBW3dKI2Kz5ifIZNi
	 IZyCplh+xNXnxMDYWjK3vqV1o4UO6JZBJJRMduGEzaIiGqP17wxZT/OjRmKRfZO0uG
	 NC55bfeLSq7Vg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 24/34] dmaengine: txx9dmac: route callbacks via
 channel BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <c98a32a57c3e295c79806859547756e70bb3f1a4.1786384169.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <c98a32a57c3e295c79806859547756e70bb3f1a4.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:34:24 +0000
Message-Id: <20260810183425.DA92F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Uninitialized per-channel BH work in shared controller IRQ mode ca=
uses DMA transfers to stall and triggers warnings.
- [High] Deferring descriptor scanning to a background work while immediate=
ly re-enabling the shared IRQ causes an interrupt storm.
--

--- Patch [24]: [PATCH v3 24/34] dmaengine: txx9dmac: route callbacks via c=
hannel BH ---
commit c425e27c746c8c326d7eb6597032d4dcfe3fa1da
Author: Allen Pais <allen.lkml@gmail.com>
Subject: dmaengine: txx9dmac: route callbacks via channel BH

This commit replaces tasklets with per-channel BH work helpers for handling
descriptor completions in the txx9dmac driver. It updates the probe, remove,
and interrupt handlers to schedule the channel BH work.

> diff --git a/drivers/dma/txx9dmac.c b/drivers/dma/txx9dmac.c
> index 05622b68a9363..0547f645b51c8 100644
> --- a/drivers/dma/txx9dmac.c
> +++ b/drivers/dma/txx9dmac.c

[ ... ]

> @@ -659,7 +659,7 @@ static void txx9dmac_tasklet(struct tasklet_struct *t)
>  			spin_lock(&dc->lock);
>  			if (csr & (TXX9_DMA_CSR_ABCHC | TXX9_DMA_CSR_NCHNC |
>  				   TXX9_DMA_CSR_NTRNFC))
> -				txx9dmac_scan_descriptors(dc);
> +				dmaengine_schedule_bh(&dc->chan);
>  			spin_unlock(&dc->lock);
>  		}
>  	}

[Severity: High]
Does deferring the descriptor scanning to a background work while immediate=
ly
re-enabling the shared IRQ cause an interrupt storm?

Looking at the rest of txx9dmac_tasklet(), it calls enable_irq(irq)
synchronously at the end. Since the hardware interrupt condition is cleared
by the deferred workqueue (which runs after softirqs), will re-enabling
the IRQ here instantly trigger the interrupt again, leading to an infinite
loop that starves the workqueue?

[ ... ]

> @@ -1113,7 +1113,7 @@ static int __init txx9dmac_chan_probe(struct platfo=
rm_device *pdev)
>  		irq =3D platform_get_irq(pdev, 0);
>  		if (irq < 0)
>  			return irq;
> -		tasklet_setup(&dc->tasklet, txx9dmac_chan_tasklet);
> +		dmaengine_init_bh(&dc->chan, txx9dmac_chan_tasklet);
>  		dc->irq =3D irq;
>  		err =3D devm_request_irq(&pdev->dev, dc->irq,
>  			txx9dmac_chan_interrupt, 0, dev_name(&pdev->dev), dc);

[Severity: High]
Is the per-channel BH work left uninitialized in shared controller IRQ mode?

If dc->ddev->irq >=3D 0 in txx9dmac_chan_probe(), the code falls into the e=
lse
block and dmaengine_init_bh() is skipped. When an interrupt occurs, the sha=
red
tasklet (txx9dmac_tasklet) will unconditionally call dmaengine_schedule_bh()
for the channel.=20

Will this trigger a WARN_ON(!chan->bh_work_initialized) and return false,
permanently stalling transfers for shared IRQ setups?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D24
