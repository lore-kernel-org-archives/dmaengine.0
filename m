Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC6442A17A
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187133; cv=none; b=RFy/4/aPBH9xyvb7c4ih2i1rxcfjSYhNndh1NEpSG2vIM3+Bz56DS7QUlVem+bmTl8bXkpiFSvsHAw6YzN39+wmGhtX+l9+oJpA7wAxMUoMwIOnux4Ml0g5dWIl+xcEH6U/L9JZtqxlHhkuK1UaJ3n82pFud4Da8tQYCbo+fgxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187133; c=relaxed/simple;
	bh=XlRvDzooMbH9EfeUB+e1WXv423zHx1F/X5Iznra336Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WhCjKLC5xIYyI83jkQ9S88sRcm4obL/tbXZMCgQLqK1GSIFwI2DNnkCj2WAeYDlGh/1Qcy0uz02/UtE6AmTgWgD5VVUY6g09S9rRE3Lroj4yMrrW1i78Qvk62Es1PTfumx3GOIL88l9Oboc+Wpa0vb2wOdh+y9yLjjX1U5ih6RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gyC/rxyt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gyC/rxyt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258891F000E9;
	Mon, 27 Jul 2026 21:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785187131;
	bh=IC3xLjM5bYrhlqjTWBW6iFNBxFw8RvB/m7iJObt0JF4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gyC/rxytg8osmXVvFJNeOlkYp/T7NEyr7w6ybvschyrlw7OS+NfxKrkUGZYXhoJR8
	 XP1zU6Lx0ReAIiJ0bc//XZaWZODt7s/U1NYGAtMeIQGJcjV/bSXmMYrefUCCmoRsGU
	 yL4pOkWxMlmLQiC1MiZe6d2Yv9mTQysmIjDPzqoAfM2GsCh5HmBjFjKFbxo2oJObjW
	 ZXfWKuifim7V7htTBc0hZSFbWHJpCfm4K1IqF7drCAbBBVn+wwFnw2SCz1U+iEunM0
	 eXTcScFtFrG3NXb6NdtGPAX0j5sRUker9GdMxQE8vBhUVTjXbnQk0HrtHXVzfZ4Cyz
	 VzPDr8aiSEpNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 54/64] dmaengine: st_fdma: use dma_chan_kill_bh
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <025035b9fd1b5a4ac763f71c024c3fc30549633c.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <025035b9fd1b5a4ac763f71c024c3fc30549633c.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:18:50 +0000
Message-Id: <20260727211851.258891F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Calling `list_del()` in `st_fdma_free()` prematurely empties the c=
hannel list, breaking devres-based DMA engine unregistration and silently l=
eaking resources on probe failure.
- [High] The per-channel completion BH work is never cancelled during drive=
r removal, leading to a Use-After-Free if scheduled before devres frees cha=
nnel memory.
- [High] The driver lacks a `device_synchronize` callback and destroys the =
DMA pool before pending BH work is cancelled, leading to a UAF or NULL poin=
ter dereference on channel release.
- [High] Virtual DMA descriptors are permanently leaked because `st_fdma_fr=
ee_chan_res()` omits a call to `vchan_free_chan_resources()`.
- [High] Inverted teardown sequence in `st_fdma_remove` vs devres allows DM=
A transactions on partially destroyed hardware.
--

--- Patch [54]: [PATCH v2 54/64] dmaengine: st_fdma: use dma_chan_kill_bh -=
--
commit 4cab1e1fac46ef4cc457cee5eab4226a73880829
Author: Allen Pais <allen.lkml@gmail.com>
Subject: dmaengine: st_fdma: use dma_chan_kill_bh

virt-dma now dispatches completion callbacks through per-channel BH
work instead of its tasklet. Cancel that work during teardown before
channel storage is released.

> diff --git a/drivers/dma/st_fdma.c b/drivers/dma/st_fdma.c
> index d9547017f3bd6..d4cff851e1d52 100644
> --- a/drivers/dma/st_fdma.c
> +++ b/drivers/dma/st_fdma.c
> @@ -733,7 +733,7 @@ static void st_fdma_free(struct st_fdma_dev *fdev)
>  	for (i =3D 0; i < fdev->nr_channels; i++) {
>  		fchan =3D &fdev->chans[i];
>  		list_del(&fchan->vchan.chan.device_node);

[Severity: High]
This is a pre-existing issue, but does calling list_del() here prematurely
empty the channel list and break devres-based DMA engine unregistration?

If probe fails at of_dma_controller_register(), st_fdma_free() is called and
unlinks all channels from fdev->dma_device.channels.

When devres subsequently invokes dma_async_device_unregister(), it iterates
over the now-empty list and skips calling
__dma_async_device_channel_unregister(). This could permanently leak DMA
engine channel structures, IDA allocations, and sysfs nodes.

> -		tasklet_kill(&fchan->vchan.task);
> +		dma_chan_kill_bh(&fchan->vchan.chan);
>  	}
>  }

[Severity: High]
This is a pre-existing issue, but since this patch updates teardown paths to
use dma_chan_kill_bh(), should st_fdma_remove() be updated as well?

drivers/dma/st_fdma.c:st_fdma_remove() {
    ...
	devm_free_irq(&pdev->dev, fdev->irq, fdev);
	st_slim_rproc_put(fdev->slim_rproc);
	of_dma_controller_free(pdev->dev.of_node);
}

The per-channel completion BH work is never cancelled during driver removal.
If the driver is unbound and an interrupt schedules the BH work just before
devm_free_irq() disables it, devres will free fdev->chans.=20

The delayed BH (vchan_complete) would then execute on the freed memory,
causing a use-after-free.

[Severity: High]
This is a pre-existing issue, but could destroying the DMA pool without
synchronizing against pending BH work lead to a use-after-free or null
pointer dereference?

drivers/dma/st_fdma.c:st_fdma_free_chan_res() {
    ...
	dma_pool_destroy(fchan->node_pool);
	fchan->node_pool =3D NULL;
    ...
}

The driver lacks a device_synchronize callback (e.g., pointing to
vchan_synchronize). Because of this, dmaengine_synchronize() returns
immediately without waiting for pending virt-dma BH work.

If vchan_complete() executes concurrently or shortly after, it invokes
st_fdma_free_desc():

drivers/dma/st_fdma.c:st_fdma_free_desc() {
    ...
		dma_pool_free(fdesc->fchan->node_pool, fdesc->node[i].desc,
    ...
}

Passing the null node_pool to dma_pool_free() could crash the kernel.

[Severity: High]
This is a pre-existing issue, but are virtual DMA descriptors permanently
leaked here because st_fdma_free_chan_res() omits a call to
vchan_free_chan_resources()?

drivers/dma/st_fdma.c:st_fdma_free_chan_res() {
    ...
    // missing call to vchan_free_chan_resources(&fchan->vchan)
    ...
}

If a client prepares a DMA transaction (allocating virtual descriptors onto
vchan->desc_allocated) but releases the channel without submitting them,
st_fdma_free_chan_res() destroys the hardware node pool.

Because vchan_free_chan_resources() isn't called, the virtual descriptors a=
re
orphaned on internal lists, leaking their memory.

[Severity: High]
This is a pre-existing issue, but does the teardown sequence in
st_fdma_remove() allow DMA transactions on partially destroyed hardware?

drivers/dma/st_fdma.c:st_fdma_remove() {
    ...
	st_slim_rproc_put(fdev->slim_rproc);
    ...
}

Manual hardware power-down occurs here before the devres-managed
dma_async_device_unregister() runs.=20

During this window, clients can still issue DMA requests via
dmaengine_submit(), which would write to unclocked or powered-down hardware
registers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D54
