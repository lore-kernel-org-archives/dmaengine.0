Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDFE339391
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386551; cv=none; b=TvqAPc3/719nTr9waWYuRewQijNxLy1pyRtN/8vGOhCSmEpGFFJoVQ7Ks4LS7ayX1X1t3LhNRyqZB93f9a91gMNL+UMERYQ2wG45ijwVP8ARZeB4MjPfcSsAF8077R1Y070agCURNWOl4XYF7UM5rrr6f8G1L8udl6IiB7UlSys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386551; c=relaxed/simple;
	bh=uJ/dd61v0VpoFGLC32s03JsFDPRdmmiKR2ZIi628B98=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O9KXBDnkXhlfxTvr11jjFtI+KyI1VN3FLiCtm4+7QowILhHZ4eNSQqJA72+kUUxHonhzo2LudoY4WWMU0j9x3CWeoXQgLNSiX/cwHOgrln+/bLr9i06ffgFkX6oMQJQkeUgvxmC/9faR7MOzDpiuCBZuzj1s3oy855U2j0kvc30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oRV9VRCi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oRV9VRCi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C40311F000E9;
	Mon, 10 Aug 2026 18:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786386550;
	bh=00dXdyNWLnYIHCH4FJ7QBqeDOJyXoNsfanZRDaakDgU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oRV9VRCiIuy+bWVmzKthRxyDd9UrrqSTuZ+u2ybWOOakoPr8h19BKFtbxUyrsXEfe
	 YLQM2vuMk6v/cLlurvb2V/0mRAjo7v6vv2TcINE5cGdg4/LbL5ZHZAPOoV/jEj7YxN
	 Q5GTh0f4Ru8H5V2czqboyIPRCEh8//YT/jL+TgINR82xfW+bSled10EE0uqUpJinSq
	 L77GJX3WumhR0fREs+ibOluz3u37nixZ/SpaHLHz2+ZTScp6c50NZBoxht20MAa9Rv
	 u955Sdee46rMIkuZc7Le9J2O0EwrmwuaAh366Np04aHO7QLlclvaX/lQyuX5LUq6rX
	 81as2xewKplbw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 06/34] dmaengine: fsldma: migrate tasklet to
 dmaengine BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <a9c4d258c73c2d7e3c23825db272cdfeacea478e.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <a9c4d258c73c2d7e3c23825db272cdfeacea478e.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:29:09 +0000
Message-Id: <20260810182909.C40311F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing cancellation of the bottom-half work in the channel remova=
l and error paths leads to a use-after-free.
- [High] The driver invokes client DMA completion callbacks and dependent t=
ransactions while holding the channel lock, which causes a recursive deadlo=
ck.
--

--- Patch [6]: [PATCH v3 06/34] dmaengine: fsldma: migrate tasklet to dmaen=
gine BH ---
commit 9529606b1e089f3e7222105fc2792fecf8bf406b
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: fsldma: migrate tasklet to dmaengine BH

This commit replaces the per-channel tasklet with the shared dmaengine
BH helper. The handler continues to run in softirq context while dmaengine
owns the common scheduling and teardown mechanism.

> diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
> index 22d62d958abd9..f52547611db99 100644
> --- a/drivers/dma/fsldma.c
> +++ b/drivers/dma/fsldma.c
[ ... ]
> @@ -968,18 +968,18 @@ static irqreturn_t fsldma_chan_irq(int irq, void *d=
ata)
[ ... ]
> -static void dma_do_tasklet(struct tasklet_struct *t)
> +static void dma_do_tasklet(struct dma_chan *c)
>  {
> -	struct fsldma_chan *chan =3D from_tasklet(chan, t, tasklet);
> +	struct fsldma_chan *chan =3D to_fsl_chan(c);
> =20
>  	chan_dbg(chan, "tasklet entry\n");

[Severity: High]
This is a pre-existing issue, but since dma_do_tasklet invokes client
callbacks, is there a risk of a recursive spinlock deadlock?

Looking at dma_do_tasklet(), it acquires the channel descriptor lock and th=
en
triggers cleanup:

dma_do_tasklet() {
    spin_lock(&chan->desc_lock);
    fsldma_cleanup_descriptors(chan);
    ...

Inside the cleanup routine, it calls fsldma_run_tx_complete_actions(), which
runs the client callback and dependencies with the lock still held:

fsldma_run_tx_complete_actions() {
    ...
    dmaengine_desc_get_callback_invoke(txd, NULL);
    dma_run_dependencies(txd);
}

If a client callback or a dependent transaction attempts to submit a new
transfer to the same channel, it will try to acquire the same lock:

fsl_dma_tx_submit() {
    spin_lock_bh(&chan->desc_lock);
    ...

Could this cause the subsystem to freeze when clients submit new transactio=
ns
from their completion callbacks?

[ ... ]
> @@ -1152,7 +1152,7 @@ static int fsl_dma_chan_probe(struct fsldma_device =
*fdev,
>  	}
> =20
>  	fdev->chan[chan->id] =3D chan;
> -	tasklet_setup(&chan->tasklet, dma_do_tasklet);
> +	dmaengine_init_bh(&chan->common, dma_do_tasklet);
>  	snprintf(chan->name, sizeof(chan->name), "chan%d", chan->id);

[Severity: High]
This isn't a bug introduced by this patch, but missing teardown logic
might lead to a use-after-free during driver removal or probe errors.

The original code lacked a call to kill the tasklet, and the new code
similarly omits a call to shut down the bottom half work.

If an interrupt fires right before the channel is freed, the bottom half
could be scheduled and remain on the workqueue:

fsl_dma_chan_remove() {
    ...
    kfree(chan);
}

When the workqueue eventually processes the queued bottom half, it will
dereference the freed channel structure:

dma_do_tasklet() {
    ...
    spin_lock(&chan->desc_lock);

Should we add a call to dmaengine_kill_bh(&chan->common) before freeing the
channel structure to ensure the asynchronous work is safely flushed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D6
