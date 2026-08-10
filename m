Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BC3242D65
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386503; cv=none; b=f+pOEHw+XGXU6tD2esw1VIRgQ0ZI9E+oSwQlZvIE2j1gtkTR/jAUqjMjuvw1GHsC7TCZxxbQFeZQc3Fzak9/WEvFAP6VH05Ov7DWs8RtTXtiYRSO/geNFHwAJBKH9JaXeKO5nazJPGI19arv/WkSH07eBNuXnPS4iVpaUDGmRhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386503; c=relaxed/simple;
	bh=3YuOKrc6B7URjOHaC5qyQbmtxu1qewrGTZh9Dc3aGno=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pczczjJKSIdKA1UhC4RXy6QbdnzbHfJIZn9sE//h0f19cwIqBgNh/shj6EEvGOfS8+aQWzWz7oFwSqhU77DuMfofv/h8xNeYYb0pCU38kC3nrqKlxj9bUef1m6YoLDbnZe044FcCfPprUOQOOZCHWqECi5UvubmaMby7wKnNQY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j0HvPmLz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j0HvPmLz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7241F00A3F;
	Mon, 10 Aug 2026 18:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786386502;
	bh=8Q0RBMjMRPsGsECgnYe7FLS4hZJuDha4TiGA+6kGjWM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j0HvPmLzrQ22IbzF7ZqrNwpTCRy7quR0vsS6Xle+NA7wzHOrOIUCGQyyV4PEc9N95
	 +pxOTpe/9uZDHnNHxSbSkQY5Op03HjNAppxrEeYtm/V29WGlTFDlr8D1Y/HqcBK8py
	 vkY/XgtZZ54eS9YgMbMZGtyJIjjj3v8aGCDCV/MXTtH85wOwqSpJbmD0KnolZS7cGJ
	 0TnLQXZY4Y7NeF/jU2X7KGMH3fgkp+bMJaPjYllNFqGUnWrR95DQ5OsuPcSTduqPIU
	 PsI/jGSRCZwiDijl8WIR0m4OnbaDQhvnu4+j+ei//dt6g7Us9jAKCP6sbf6g30Dz76
	 RxGCe5TqTjnKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/34] dmaengine: mmp_pdma: replace per-chan tasklet
 with dmaengine BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <f55f26921b9c0bedb7353399f4284003ad5279f3.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <f55f26921b9c0bedb7353399f4284003ad5279f3.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:28:21 +0000
Message-Id: <20260810182822.2D7241F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver fails to flush or kill the dmaengine BH work item durin=
g channel teardown or module removal, leading to a potential use-after-free.
- [High] The interrupt handler `mmp_pdma_chan_handler` unconditionally dere=
ferences `phy->vchan`, which can be NULL, leading to a kernel panic.
--

--- Patch [10]: [PATCH v3 10/34] dmaengine: mmp_pdma: replace per-chan task=
let with dmaengine BH ---
commit 8e2fd9bba919782b8255f7948fa3a9fec6c35960
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: mmp_pdma: replace per-chan tasklet with dmaengine BH

This commit replaces the per-channel tasklet with the shared dmaengine BH
helper. The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

> diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
> index 386e85cd4882a..4f7d3193d7a3c 100644
> --- a/drivers/dma/mmp_pdma.c
> +++ b/drivers/dma/mmp_pdma.c

[ ... ]

> @@ -374,7 +373,7 @@ static irqreturn_t mmp_pdma_chan_handler(int irq, voi=
d *dev_id)
>  	if (clear_chan_irq(phy) !=3D 0)
>  		return IRQ_NONE;
> =20
> -	tasklet_schedule(&phy->vchan->tasklet);
> +	dmaengine_schedule_bh(&phy->vchan->chan);

[Severity: High]
This is a pre-existing issue, but could this lead to a NULL pointer
dereference if a concurrent teardown happens?

The mmp_pdma_chan_handler() is executed in interrupt context. If the client
driver terminates a transfer via dmaengine_terminate_all() concurrently with
an interrupt firing for that channel, mmp_pdma_free_phy() will set
phy->vchan =3D NULL without an accompanying synchronize_irq().

The handler then blindly dereferences phy->vchan when calling
dmaengine_schedule_bh(). Interestingly, clear_chan_irq() explicitly checks =
if
phy->vchan is NULL just above this, which suggests the state is structurally
possible during interrupts.

>  	return IRQ_HANDLED;
>  }

[ ... ]

> @@ -1170,7 +1167,7 @@ static int mmp_pdma_chan_init(struct mmp_pdma_devic=
e *pdev, int idx, int irq)
>  	spin_lock_init(&chan->desc_lock);
>  	chan->dev =3D pdev->dev;
>  	chan->chan.device =3D &pdev->device;
> -	tasklet_setup(&chan->tasklet, dma_do_tasklet);
> +	dmaengine_init_bh(&chan->chan, dma_do_tasklet);

[Severity: High]
This is a pre-existing issue, but does the driver ever flush or kill the
pending work item before freeing resources?

During channel teardown or module removal, the driver doesn't seem to cancel
the pending BH work. If a DMA operation completes right before or during
mmp_pdma_free_chan_resources() or mmp_pdma_remove(), the work item might be
scheduled on the dmaengine_bh_wq.

The cleanup code destroys chan->desc_pool in mmp_pdma_free_chan_resources()
or frees the chan memory via devres without first calling
dmaengine_kill_bh(). When the scheduled BH later executes in
dma_do_tasklet(), it could access the destroyed pool or freed chan structur=
e:

drivers/dma/mmp_pdma.c:dma_do_tasklet() {
    ...
    dma_pool_free(chan->desc_pool, desc, txd->phys);
    ...
}

Should there be a call to dmaengine_kill_bh() on the teardown paths?

>  	INIT_LIST_HEAD(&chan->chain_pending);
>  	INIT_LIST_HEAD(&chan->chain_running);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D10
