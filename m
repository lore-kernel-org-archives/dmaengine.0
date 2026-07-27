Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D21A3D47C0
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186141; cv=none; b=tTMq+W7/xzVoBqdkm8ydqq1rS+ivdMAIc7C7fUqhiOaUQO7UtYoVgzfX3VHb+IJ7xXBSFfKQ3S+k6WhCHTmL39VK+dYvpHfSLc3ljByNiXe/pl1vKp0xQE5SKfUdwqnuBeNmBcN+j1qKBySxcjpfhj2z0rD0Nm23Ea9yz5MA2es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186141; c=relaxed/simple;
	bh=m+8a6KYaIEudxR11rs5D3GAczlDyZ1WLujOlRmS1pA0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HfSieV3Ha5bvjKNG7w8iFA6bkOIzF55KWhprr+/wnL6Nm9ZA+NgwmZPrqLvDP9dPnq4gdGRQilVDh/615HgfFNK/Onv1PSYHFWepvOslilcwcv7R4fTqCza18VgZW+PprmNGa+Rwe9gjXSiiJykRDRtZgIyvWl4XtBdsHd6eJMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PN7HN9/h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PN7HN9/h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C26A1F000E9;
	Mon, 27 Jul 2026 21:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785186139;
	bh=7Rw/vMpPHNpNd0sWtgF0Tn7ATusvRuY12l4m3ZyY8TI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PN7HN9/h6BHvB31yAhqCds8VL06WpUVGMFn6HmR2lzFhNdAILef9vD4/cliSNagMX
	 SZNclOZiyV7iii79jSKSdIplOva7+cZWZUmRhZYy0v6aSFUgzBWTMJhsCKhdiSFNqd
	 OKGOKzDfMKiwj9tYQ2EeyZ9iZYIk96c0Q3HKu+9pP7ISzAhe0y+GByf/GDtaX8oKdm
	 UVcYZyeY71TVU9/JPXntlZui3y7yLm3lly0LC6Kbuxmu9eXK4zabclw2rWv1TF7Xoc
	 BBpgaRSpRGkyQzNbPW0hgeftoRDC+JK4HibTm1u1ru5B81PS4ipmnYy0nKozckhfeC
	 dFiAh4q/ZZAWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 25/64] dmaengine: mv_xor_v2: use channel BH helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <64a4b1b008b641510416ee8ff13df3cca0b69314.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <64a4b1b008b641510416ee8ff13df3cca0b69314.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:02:19 +0000
Message-Id: <20260727210219.7C26A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect teardown order in remove() leading to Use-After-Free.
- [High] Missing dma_chan_kill_bh() in probe error path leads to Use-After-=
Free.
- [High] Early interrupt request in probe allows uninitialized state access.
--

--- Patch [25]: [PATCH v2 25/64] dmaengine: mv_xor_v2: use channel BH helpe=
rs ---
commit 1d8bd96829601184f429fc1fa7947ce7a05990e9
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: mv_xor_v2: use channel BH helpers

This patch replaces the device tasklet with the per-channel BH helper.
Descriptor callbacks are updated to run through dma_chan_*_bh instead
of the tasklet API.

> diff --git a/drivers/dma/mv_xor_v2.c b/drivers/dma/mv_xor_v2.c
> index cad4d4fb51ac3..e5fa7a221d5b0 100644
> --- a/drivers/dma/mv_xor_v2.c
> +++ b/drivers/dma/mv_xor_v2.c
[ ... ]
> @@ -760,7 +758,7 @@ static int mv_xor_v2_probe(struct platform_device *pd=
ev)
>  	if (ret)
>  		goto free_msi_irqs;
> =20
> -	tasklet_setup(&xor_dev->irq_tasklet, mv_xor_v2_tasklet);
> +	dma_chan_init_bh(&xor_dev->dmachan, mv_xor_v2_tasklet);

[Severity: High]
This is a pre-existing issue, but does requesting the interrupt before
initializing the bottom-half allow an early interrupt to crash the system?

In mv_xor_v2_probe(), devm_request_irq() requests and enables the interrupt
before dma_chan_init_bh() and dma_alloc_coherent() are called. If the
hardware is left in an active state with pending events, an interrupt will
fire immediately.

The handler mv_xor_v2_interrupt_handler() calls dma_chan_schedule_bh().
Depending on the timing, this could crash trying to schedule an uninitializ=
ed
work struct, or the scheduled work could run and dereference a NULL
hw_desq_virt pointer.

[Severity: High]
This is a pre-existing issue, but is a call to dma_chan_kill_bh() missing
in the probe error paths?

If a setup step fails after initialization, such as dma_alloc_coherent()
failing, the probe function jumps to the error labels and returns without
calling dma_chan_kill_bh().

If an early interrupt had already fired and scheduled the bottom-half, the
work item remains active in the workqueue. When devres automatically frees
the xor_dev structure containing the work item, could the executing workque=
ue
corrupt memory?

> =20
>  	xor_dev->desc_size =3D mv_xor_v2_set_desc_size(xor_dev);
[ ... ]
> @@ -869,7 +867,7 @@ static void mv_xor_v2_remove(struct platform_device *=
pdev)
> =20
>  	platform_device_msi_free_irqs_all(&pdev->dev);
> =20
> -	tasklet_kill(&xor_dev->irq_tasklet);
> +	dma_chan_kill_bh(&xor_dev->dmachan);
>  }

[Severity: High]
This is a pre-existing issue, but is the teardown order in mv_xor_v2_remove=
()
safe from use-after-free races?

In mv_xor_v2_remove(), dma_free_coherent() is called to free the hardware
descriptor ring (hw_desq_virt) before the device interrupt is disabled via
devm_free_irq() and before the bottom-half is killed via dma_chan_kill_bh().

If a pending hardware interrupt fires during this window, or if a previously
scheduled bottom-half is running concurrently, the executing bottom-half
could dereference the freed hw_desq_virt memory:

mv_xor_v2_tasklet() {
    ...
		struct mv_xor_v2_descriptor *next_pending_hw_desc =3D
			xor_dev->hw_desq_virt + pending_ptr;
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D25
