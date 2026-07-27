Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF7D372B26
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186438; cv=none; b=FnVGOIz5zkPMNwwN6IL3MGLzUWnDMgbQ+xiiJuT7dQ2RJkLq4no1a21hTklxnC+X141Fcj25ydvzJ/lcRrVVtVQ5ei7+5D7hgQ03suNyUQiGd6A4O2OXmVIICwQn09Alle4UvTKAAvyLY1ie/R1YTM4I4eY/Pj/FgvT+nAI1cRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186438; c=relaxed/simple;
	bh=EfzWrzdY97n5tBiJUgyz7nOurC8bJEKYjQVMrsuqwm8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NK1sXprEnGecidQQnutOGAZeFwJp+ATTJQzz0tHW6MM85phev2dbb1NYXK/Bhs8qDbYZ6j+aLHSC1rCHTRr5yAaCzVYk+2ejmTTwl5jcavUkH0caiRJTA9VqprWbe4OdeUbHxOKiBx0toBk6/LJkWTaFRJPhpzAwQeiZT/vjQ1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cTf+tk0T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cTf+tk0T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4865D1F00A3D;
	Mon, 27 Jul 2026 21:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785186437;
	bh=0ums6E1lDVBLhZKovHQiVNE7FUedWj+4g89M0NAroRo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cTf+tk0TEt8HbSICse5y9RNo3JbVzoLeoTd2WlaTbZNfpnr/S52M7GlkrZht0b7cc
	 XieY5NyS48KMcBayLeZCMy/DDuJOF3W9dNl6ibewIF1qK3kfzaY3pEHyg7KFYrCVKW
	 ZKBSFczqO7wPMN8OeBSc0dAI57SB+uaLnbmBIYjaIX0Aviu9QjJ3PXln9nljq9Qsuo
	 YPQwiBXB2axs3L5HWlitRVEg4XG5f7trcs0R7atIIuE4ouOptf9qD21QtwF1Rswczy
	 Yz4ojjP8KAwOl8G0y6hgRHBOaYx3xsrwaGOlAMKp3sMOoEw5eeTnMVF5Cykc/wqzzX
	 K2tDaFDnNGBhQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 30/64] dmaengine: sa11x0-dma: kill vchan BH on remove
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <83cb2ec3443e6061816a37699d18bc1afc0fb908.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <83cb2ec3443e6061816a37699d18bc1afc0fb908.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:07:16 +0000
Message-Id: <20260727210717.4865D1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver's teardown sequence in `sa11x0_dma_remove()` and the pr=
obe error path is critically flawed, freeing DMA channels before disabling =
hardware interrupts and stopping the device tasklet.
--

--- Patch [30]: [PATCH v2 30/64] dmaengine: sa11x0-dma: kill vchan BH on re=
move ---
commit 34b16ea740696f927777e47c145e53481090efcc
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: sa11x0-dma: kill vchan BH on remove

Use dma_chan_kill_bh() when tearing down virt-dma channels.

> diff --git a/drivers/dma/sa11x0-dma.c b/drivers/dma/sa11x0-dma.c
> index a6fa431530e3d..ea4357da5e39d 100644
> --- a/drivers/dma/sa11x0-dma.c
> +++ b/drivers/dma/sa11x0-dma.c
> @@ -891,7 +891,7 @@ static void sa11x0_dma_free_channels(struct dma_devic=
e *dmadev)
> =20
>  	list_for_each_entry_safe(c, cn, &dmadev->channels, vc.chan.device_node)=
 {
>  		list_del(&c->vc.chan.device_node);
> -		tasklet_kill(&c->vc.task);
> +		dma_chan_kill_bh(&c->vc.chan);
>  		kfree(c);

[Severity: High]
This isn't a bug introduced by this patch, but is a pre-existing structural
flaw in the driver's teardown sequence.

In both sa11x0_dma_remove() and the error path of sa11x0_dma_probe(),
sa11x0_dma_free_channels() is called before the device interrupts are freed
and the main device tasklet is killed:

sa11x0_dma_remove() {
	...
	sa11x0_dma_free_channels(&d->slave);
	for (pch =3D 0; pch < NR_PHY_CHAN; pch++)
		sa11x0_dma_free_irq(pdev, pch, &d->phy[pch]);
	tasklet_kill(&d->task);
	...
}

If an unbind happens while a DMA transfer is active, could an interrupt fire
during this window? If so, would sa11x0_dma_irq() dereference a freed chann=
el
(p->vchan) and cause a use-after-free when attempting to acquire c->vc.lock?

Additionally, could the lockless traversal of the d->slave.channels list in
sa11x0_dma_tasklet() encounter list poisoning or a use-after-free if channe=
ls
are freed concurrently by the list_del() and kfree() operations here?

>  	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D30
