Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B47431E73
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386427; cv=none; b=qaPLNIIAoVzXFQwofIwx8CgBrS5cB9ubfFWdJdqhkRc1mhV5Mi+tKI8uFmK56q3T0jO6kI8qpRvz6hX4SDVNbVB0esgM+H/fJ2PoVvNVnH5KP3yfS6YX/sGdf+jJO4Oo3yugwhroMC9WvuK44DWOP90+GmovAH7gCmobCfRL/ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386427; c=relaxed/simple;
	bh=DeowNSmQym6W46AKO3JeDp3vk8ZunsUqotFkLdKWbz8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I97gC8dtyXb9zzhRTeyj2JvCJEkK9+96NoLwZHgG2Q6gqfAFLyLoXz8Gr6QD9M9A0X375V/VTXH6CxCTVaABXoIaQx0llkJ9zK+z9cGko0eNJm8MSVe2EX353rE1hf3aodv+XFTvkckXG3FiYpCDiNCbwzm69/D73PJe0M+0Ie4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Si6549bw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Si6549bw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6E41F000E9;
	Mon, 10 Aug 2026 18:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786386425;
	bh=dxa5D1ArP2mweKybgMNnVgOIeiK6fgUNLyHuJbusagE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Si6549bwL9KcJM2gc7iWcXVueidpmTzSfQgzksGBWWKvEBer69Ab4hIJwFAYgMxjt
	 gXSaYiNgPTYZxDwWgQGxf1DSK0BFDmuundEEy53dbvG3clsPQpSk5GnYixA71i47i5
	 cNAissqbHI+MFa7ALYAl2fc4iT5PZ3na7gExRhUGqPisDBZT6L5VkDHwsFAr+/bzC7
	 P7C5SfKdhnW6unhGJMp6nbk9f6ZAFe9+UuDcQBTc3K9XDiRrD1/NSOGfH056QBvuv6
	 ys1FAyCUJTl7p/MPSYbiVe+PThC6bIRPHlHP58n1VPXfoUveN210F4tu2UmdQBlBtU
	 fXPoMXhX9fJcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 12/34] dmaengine: mv_xor: convert irq tasklet to
 dmaengine BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <75cb0e6cfddfcf5655fae89f58a06cdeca02f831.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <75cb0e6cfddfcf5655fae89f58a06cdeca02f831.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:27:04 +0000
Message-Id: <20260810182705.5B6E41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing `dmaengine_kill_bh()` on error paths and device removal, l=
eading to potential use-after-free of device resources.
- [High] The IRQ is requested and unmasked before critical locks and lists =
are initialized, leading to a NULL pointer dereference.
--

--- Patch [12]: [PATCH v3 12/34] dmaengine: mv_xor: convert irq tasklet to =
dmaengine BH ---
commit 59f9ab1622f4d6943ebdad668684fff90fe01b57
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: mv_xor: convert irq tasklet to dmaengine BH

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

> diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
> index 25ed61f1b0899..752e30ca5fa80 100644
> --- a/drivers/dma/mv_xor.c
> +++ b/drivers/dma/mv_xor.c

[ ... ]

> @@ -1107,7 +1107,7 @@ mv_xor_channel_add(struct mv_xor_device *xordev,
> =20
>  	mv_chan->mmr_base =3D xordev->xor_base;
>  	mv_chan->mmr_high_base =3D xordev->xor_high_base;
> -	tasklet_setup(&mv_chan->irq_tasklet, mv_xor_tasklet);
> +	dmaengine_init_bh(&mv_chan->dmachan, mv_xor_tasklet);

[Severity: High]
This isn't a bug introduced by this patch, but does the error path miss a
teardown for this BH work?

If the probe fails (e.g., during self-test timeouts) or the driver is unbou=
nd,
free_irq() is called in mv_xor_channel_remove() and the err_free_irq path of
mv_xor_channel_add(), but the scheduled bottom-half work is never canceled
via dmaengine_kill_bh(&mv_chan->dmachan).

Since mv_chan is subsequently freed, couldn't this lead to a use-after-free
if a scheduled bottom-half executes after the memory is freed?

> =20
>  	/* clear errors before enabling interrupts */
>  	mv_chan_clear_err_status(mv_chan);

[Severity: High]
This is a pre-existing issue, but is it safe to request and unmask the IRQ
here before initializing the lock and lists?

A few lines down from here in mv_xor_channel_add():

	ret =3D request_irq(mv_chan->irq, mv_xor_interrupt_handler,
			  0, dev_name(&pdev->dev), mv_chan);
	if (ret)
		goto err_free_dma;

	mv_chan_unmask_interrupts(mv_chan);
	...
	spin_lock_init(&mv_chan->lock);
	INIT_LIST_HEAD(&mv_chan->chain);

If a bootloader left a pending End-Of-Chain (EOC) interrupt, couldn't it
fire immediately upon unmasking? This would schedule the BH, which takes the
uninitialized lock and checks list_empty(&mv_chan->chain).

Since devm_kzalloc zeroed the memory, list_empty() would return false,
causing a NULL pointer dereference in the list_for_each_entry_safe() loop.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D12
