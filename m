Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332158;
	b=JTstv21NoRtanb9XWHmXXhQKwVF2miIa0GWvPlsveiZdBrPt2YD2zylfcMtuOSJusmVs
	 zsExUGqA2FdIhtEJdhYilv1LCdSVV1iJsnSumYQ4MNSajdfaRD6LkNX5wX0CSjyccyNXs
	 bVl8k5/0W21LVFblIWfW0k57tWvuV+qM62H0Mm2HS32a6gWultEaPqTewEPF0UVBhHOdh
	 ZgBwpgKM3xkRE0isBle2HUrm7eGJ7AiKX6vLI0X4DGrhGPjrSsBtMC97crusIaXoGrv/A
	 kqu1W5CSj3cEeZl2Grq3o6CYNnFXLwbQLEghkTuCJMdU4EYCbRwiTQmzErzfDieqz9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332158;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gyGFEu4rN8jRbXCLt87X2nJtSCwcM2eV/xdLHYuHZ2c=;
	b=StFIjS9DFfeVPe2mHuh5p2OnAuzpnnwFpYW1BE6DQ9tnAAp6xa4Uuo6qEtUUCPNYg315
	 EpWa4E8PScJmol1r3oYPthSuq4GaXT5FglNTTSaQvjG6lvGhgWcHygVIYSPpwOouEhDRA
	 T6KyeALKVVA6xDVw6oF3TXd+qxxxMQ4rBbzoTDyG0Yd2GNf/RbWd3oEfpbVDQLr2uBGT6
	 2l8H+CU44Ltj1J3VwEljHVCVwl8Q0As6lSjeJEkF/qXyieBBcrAGtja3srbQJvSaJcB3T
	 jYYIBHW8Jv7GHoFnOjaxXWgfMxlk9GfVTcnLRpPhKTQoTQ/nOGT939l3DLLjCTw1n+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fINU+LAl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D1F60A6F70
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 17:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fINU+LAl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 820B91F008A1;
	Tue, 10 Nov 2026 17:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794332157;
	bh=gyGFEu4rN8jRbXCLt87X2nJtSCwcM2eV/xdLHYuHZ2c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fINU+LAlzdIDHN0Br9Axkg0XbW5pSDHrJdQlgbiriZL/BMqxDfsd8kipI9lZrbzJm
	 FV3iRH0XaVaL3LfOQ3UAT3/coLHE99U/xAoVms72zD4o1jgaP4jIyqIACziYenCZze
	 YTpc3dfw2KF3TVZ49RHU99ciCYOxs21sg9LggI0JgdEWK3pDGLGV8W01RpN7VlB9Ix
	 JnleqrRbrcNuTtWYHwpcGaw9I4TNTQ2g4DDrCdAtSWtdC0JODF2lobCD8nNn3ojsLl
	 CikhoCXja/f+ilixCf/eUzQa5rsTJ3n/vlg2ODLJdJoahIQCN2gpIatkc31QrD7Y2q
	 2A2L01mQxNplQ==
Message-ID: <sashiko-outbox-207489@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 19/33] dmaengine: xilinx-dma: use dmaengine BH
 instead of tasklets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <b17d718ce2500611e33331d29d10e3ab5de07a39.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
 <b17d718ce2500611e33331d29d10e3ab5de07a39.1794315350.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 17:35:57 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dmaengine: xilinx-dma: HI_SOFTIRQ priority loss in
  xilinx_mcdma_irq_handler()
--

commit 959cca11cf1a0ddb7da4355d351b00c62da10f51
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: xilinx-dma: use dmaengine BH instead of tasklets

This commit replaces the per-channel tasklet in the Xilinx DMA driver with
the shared dmaengine bottom-half helper.

> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
> index b89f2c3c1579c..d23658c927c74 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c

[ ... ]

> @@ -1979,7 +1978,7 @@ static irqreturn_t xilinx_mcdma_irq_handler(int irq=
, void *data)
>  		spin_unlock(&chan->lock);
>  	}
> =20
> -	tasklet_hi_schedule(&chan->tasklet);
> +	dmaengine_schedule_bh(&chan->common);
>  	return IRQ_HANDLED;
>  }

[Severity: Low]
Does replacing tasklet_hi_schedule() with dmaengine_schedule_bh() here
regress MCDMA completion priority?

dma_bus_init() allocates dmaengine_bh_wq without WQ_HIGHPRI:

drivers/dma/dmaengine.c:dma_bus_init() {
	...
	dmaengine_bh_wq =3D alloc_workqueue("dmaengine_bh",
					  WQ_BH | WQ_PERCPU, 0);
	...
}

Because WQ_HIGHPRI is not set, dmaengine_schedule_bh() runs the bottom
half in TASKLET_SOFTIRQ rather than HI_SOFTIRQ, which silently undoes
c77d4c5081aa ("dmaengine: xilinx_dma: Use tasklet_hi_schedule for timing
critical usecase") and places MCDMA completions behind network softirqs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794315350.gi=
t.allen.lkml@gmail.com?part=3D19
