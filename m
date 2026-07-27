Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B20E217F27
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186052; cv=none; b=E7oMcFRGDACcw+F3W9AjW/T/fvmzzVoNbdY6TjQHWwSFJG2LyTuBNyKodldLxJDKvFJ8g2SCVIbbaOjmaSc2WpQe54qUloZqls5Db4Eu9nTOO5Fnsl0cZ4T+bk8eISxK+dtVVw7+BWYYaHgcd5cTUmUAF08KKcxTBLwq0DWaUtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186052; c=relaxed/simple;
	bh=jZqI9zdngHSk9xLxSHjLTCL88sT48xdgofDl5qjYJUo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ixGFb6M4wFLbyXOR7CDDQjF2QFxYAzz2khNfOhWFw0IY0lbWLIa1fEvQH6yeb+Oz2aRtqTt545Wa3dvkWdoqlOIyGVn/t0M/3YPAYFgNRvPeLw4xNZcfakAFzO4lj7S3DWiuUZlGsTUmfic6r7zb6PlBT5V+ETuSi9CEiQPJkHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oxPEIt3b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oxPEIt3b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0DB41F000E9;
	Mon, 27 Jul 2026 21:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785186051;
	bh=4rUJeRmXWeKGpl0CSByjDQThCLW3WwFk6yVVnP50jno=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oxPEIt3bcAZRiZpOCMc+jAHwg0MoMnjkPQktLrtjZHmsvyP1bRKeH5tiXysyn0EcM
	 8r1ZxnegZuekizmR7IFGMhkHInSJc8vRtYPL7Gm0x0dwlh6gfkAU2n9fU5a3bpZew+
	 QkA4albPjIGlMXqIeco2vloFDhoEkzdPSscX4ZdrmgLveEM5CJ3ZlSOGDBJP7hpWY/
	 hUQOv8C6XMK0YgMkreMVGHYLlDorF0eec/MxNpCsNDp6+AEMOXIL+xSELZTurXEVyZ
	 O1XNJIFExN/E9O9xp7cOPl5mwHq0qHxG1/taEAu/tTnG1fCPXuZr539tA6UBcX8es0
	 CGJnLpG7jq3Iw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 17/64] dmaengine: ste_dma40: convert per-channel
 tasklet to dma_chan BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <119d257968c0a337b7e439fe71b59636e7fb37c3.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <119d257968c0a337b7e439fe71b59636e7fb37c3.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:00:50 +0000
Message-Id: <20260727210050.B0DB41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing `free_irq()` on `d40_probe` error paths leads to a leaked =
IRQ handler and a potential Use-After-Free of `base`.
- [High] Missing `device_synchronize` callback causes a race condition duri=
ng channel release, potentially invoking callbacks in unloaded client modul=
es.
- [High] Probe failure after exposing channels causes a Use-After-Free beca=
use devres forcefully frees memory while clients or scheduled BH work may b=
e active.
--

--- Patch [17]: [PATCH v2 17/64] dmaengine: ste_dma40: convert per-channel =
tasklet to dma_chan BH ---
commit 7d6ec649e7f14a8affbdbde4ad9aa8498383284e
Author: Allen Pais <allen.lkml@gmail.com>
Subject: dmaengine: ste_dma40: convert per-channel tasklet to dma_chan BH

This commit replaces the per-channel tasklet with the shared dma_chan BH
helper. The handler continues to run in softirq context while dmaengine
manages the scheduling and teardown mechanism.

> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 0d9ffa3e26639..f279a093a81f6 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
[ ... ]
> @@ -1641,7 +1638,7 @@ static void dma_tasklet(struct tasklet_struct *t)
>  	d40c->pending_tx--;
> =20
>  	if (d40c->pending_tx)
> -		tasklet_schedule(&d40c->tasklet);
> +		dma_chan_schedule_bh(&d40c->chan);
> =20
>  	spin_unlock_irqrestore(&d40c->lock, flags);
> =20

[Severity: High]
This is a pre-existing issue, but does this create a race condition during
channel release?

The driver doesn't seem to implement the device_synchronize callback, making
dmaengine_synchronize() a no-op. When a DMA client module unloads and
releases its channel, it relies on this synchronization to flush any pending
async work.

Could dma_release_channel() return and the client module unload while the
bh_work is still executing here? If the work is preempted right after
dropping the channel lock and before invoking the client callback:

	spin_unlock_irqrestore(&d40c->lock, flags);

	if (callback_active)
		dmaengine_desc_callback_invoke(&cb, NULL);

wouldn't it resume and attempt to execute the callback residing in the
now-freed module's .text segment?

Additionally, I noticed a couple of pre-existing issues in d40_probe():

[Severity: High]
This isn't a bug introduced by this patch, but does d40_probe() leak the
IRQ handler on error paths?

drivers/dma/ste_dma40.c:d40_probe() {
    ...
	ret =3D request_irq(base->irq, d40_handle_interrupt, 0, D40_NAME, base);
	if (ret) {
		d40_err(dev, "No IRQ defined\n");
		goto destroy_cache;
	}
    ...
	if (base->plat_data->use_esram_lcla) {

		base->lcpa_regulator =3D regulator_get(base->dev, "lcla_esram");
		if (IS_ERR(base->lcpa_regulator)) {
			d40_err(dev, "Failed to get lcpa_regulator\n");
			ret =3D PTR_ERR(base->lcpa_regulator);
			base->lcpa_regulator =3D NULL;
			goto destroy_cache;
		}
    ...
 destroy_cache:
	if (base->lcla_pool.dma_addr)
		dma_unmap_single(...)
    ...
 report_failure:
	d40_err(dev, "probe failed\n");
	return ret;
}

If d40_probe() fails after request_irq() (for example, in regulator_enable()
or of_dma_controller_register()), it branches to the destroy_cache label and
returns an error without freeing the registered IRQ.

Because base is automatically freed by the devres framework, if a spurious
or lingering interrupt fires afterwards, won't the still-registered
d40_handle_interrupt() execute and dereference the freed base pointer?


[Severity: High]
This isn't a bug introduced by this patch, but does a probe failure after
exposing channels cause a Use-After-Free?

drivers/dma/ste_dma40.c:d40_probe() {
    ...
	ret =3D d40_dmaengine_init(base, num_reserved_chans);
	if (ret)
		goto destroy_cache;
    ...
	ret =3D of_dma_controller_register(np, d40_xlate, NULL);
	if (ret) {
		dev_err(dev,
			"could not register of_dma_controller\n");
		goto destroy_cache;
	}
    ...
}

In d40_probe(), the driver exposes channels globally by calling
dmaenginem_async_device_register() midway through the function via
d40_dmaengine_init().

If a subsequent initialization step fails, like of_dma_controller_register(=
),
the function returns an error. The devres framework then automatically
unregisters the DMA device and frees the driver's memory.

In the window between registration and failure, could a concurrent client
driver request a channel and start a transfer, or an interrupt fire and
schedule the channel's BH work?

Since dma_async_device_unregister() doesn't wait for active clients to drop
references when called from devres, will the client or BH work access the
forcefully freed structures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D17
