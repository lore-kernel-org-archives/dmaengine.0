Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308292E6CB3
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785185781; cv=none; b=oP9KliPUK6bKER2ITOrWhXkVmIRAux+z/IAKRPX8Cqniw05jUffsvtDnOSuUS212zhzCRvTKDZKO6Rabei4pQaKwyGpCagOoOOJJ+3As7benZnWY5ILUYu3vHBEtguroxTJanr5SDrLRxZWwuz3uQDUUjVpW2de7Iz/A05wHXAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785185781; c=relaxed/simple;
	bh=cuIQTdq58xecgqoMyCW/0vUyxAZZcDQm4m7MG3icXpU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eywbKqVCUGJ1DvrOVhp3VT1JAVYKzJ97pSK8Ka0h0i1JJUrXoeV/CnklC7z7ktIZOR2HZLNzWZLIUhmJ4LcMRljdrvfmQuWT9H3piyirkUtuWIbTsdfOXU35D76wfL7oZydxSBwcUQVVarVCi31qoJl2lAAh4rotLieFT0EBVAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Czoh0zyX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Czoh0zyX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 863801F000E9;
	Mon, 27 Jul 2026 20:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785185779;
	bh=Fyk18WgmDgDoSRHlls3zhPc/+veG1bXl1Slhp0Ukrw8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Czoh0zyXz90NBD8g1Og98sq6kqBg5PF91BVEGyTXskGbg47q1jCDjntvz8ck8dRMk
	 +4ciU6q36rYy5ss9qwNPJJBQX6Ws8S3lzvjQdTJt6SLb/vwj8q9/eZp05OkBUcn4Ag
	 L8UIdRIzEY3HNNsC3UUUCUQnId5nTWnrZ7jXr8FaqDDxDQQhsyHiSoB/9pib2OijhR
	 uGvIRS0qwIDfjYaXF2Udrqu4B96Yi8o5OJK13+9IQ3iv2eMFgtbGfMenEXtj4R+4YU
	 1TIZIQEiF6GfKr1Xexvva770lBbVWWXJpqRDS8k8oGDuGxecX1CV4kfXArdbbz4hNH
	 CdBLO8ff/0Ntg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/64] dmaengine: fsldma: migrate tasklet to dma_chan
 BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <8a4883ce4557e4cc5804b9d29ee56e6a2570af6b.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <8a4883ce4557e4cc5804b9d29ee56e6a2570af6b.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 20:56:19 +0000
Message-Id: <20260727205619.863801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing dma_chan_kill_bh() during channel removal and resource fre=
eing leaves pending bottom-half work queued, leading to use-after-free and =
NULL pointer dereference crashes.
- [High] Lock inversion deadlock when invoking client callbacks with the ch=
annel descriptor lock held.
--

--- Patch [6]: [PATCH v2 06/64] dmaengine: fsldma: migrate tasklet to dma_c=
han BH ---
commit eba223ea472b760cffa1e53fb0bb48d7fa6057d5
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: fsldma: migrate tasklet to dma_chan BH

Replace the per-channel tasklet with the shared dma_chan BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

> diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
> index 22d62d958abd9..1cb6ce3270782 100644
> --- a/drivers/dma/fsldma.c
> +++ b/drivers/dma/fsldma.c
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
This is a pre-existing issue, but does this cleanup path have a lock invers=
ion
deadlock?

dma_do_tasklet() acquires chan->desc_lock before calling
fsldma_cleanup_descriptors(). While holding this lock, it invokes
fsldma_run_tx_complete_actions(), which executes the client callback via
dmaengine_desc_get_callback_invoke() and processes dependencies via
dma_run_dependencies().

If the client callback submits a new DMA transaction, or if a dependent
transaction is submitted for the same channel, it calls fsl_dma_tx_submit():

drivers/dma/fsldma.c:fsl_dma_tx_submit() {
    ...
    spin_lock_bh(&chan->desc_lock);
    ...
}

Since the non-recursive lock is already held on the same CPU, won't this
lead to a deadlock in softirq context?

> @@ -1152,7 +1152,7 @@ static int fsl_dma_chan_probe(struct fsldma_device =
*fdev,
>  	}
> =20
>  	fdev->chan[chan->id] =3D chan;
> -	tasklet_setup(&chan->tasklet, dma_do_tasklet);
> +	dma_chan_init_bh(&chan->common, dma_do_tasklet);

[Severity: High]
This is a pre-existing issue, but is it possible for pending bottom-half wo=
rk
to run after the channel is removed?

If an IRQ fires and queues the BH right before unbinding,
fsl_dma_chan_remove() frees the channel structure and
fsl_dma_free_chan_resources() destroys the descriptor pool without calling
dma_chan_kill_bh() (or tasklet_kill() previously).

When the pending BH work later executes dma_do_tasklet(), could it derefere=
nce
the freed channel or pass a NULL desc_pool to dma_pool_free()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D6
