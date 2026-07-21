Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF2A3769E5
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641734; cv=none; b=RE1SJMe768HSc+EVGsMluy7i9FfO9AwBIHzhY06oqcXgYDiTTfR5CPC4+tYzxaESLvkm1cyt/B+sd6M/X2nQXFwUJ78SqNU5DKLzk9ENdNfFfBl/ItbeeOusKT9wMYi3hza6yi+XOgMGX1E2T4oyk1Rrr/stMuBPS3Jt76Z9A68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641734; c=relaxed/simple;
	bh=a5z3UiNoTTcAMSiwSS2obt0D+z7p0rTe3VAISFftl6Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p6JzjNkEZWNuLermLsKwwihpqkerNwvgUs640DgBD/ACPRb6RfRjdUeyx7axFKvAiJlS1YlOM6sqch4yWd0SbY/ZaDqA+iLFCMyHTrvQ9Wu+O5DX8BSC7Ig3GiiAjIkKeqF7BUzF5DQLx3I65tAHAfeQG/mybAZ1ahG3RlekE+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZbPeWHDq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZbPeWHDq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B2401F000E9;
	Tue, 21 Jul 2026 13:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784641733;
	bh=LhBaHNQ9TIxtWOG4ZoxM0wgLQUNxCknH7fHO41ctz98=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZbPeWHDqkzfNONobpBSWkOpw+3m7+cJMicNnIRjuloozDnyQ/qwA4AXf64gVJOKRB
	 hqWcIKEueuv04y2tXgKhfRyg7bVskTlQQnbFEzwjM3wGYPeAH7GEJSYI4vc58k+uCd
	 E3PJRMJQJOV0dj4z6q60aKxo6MRMFxKK822DoQyUysLsR59yaDqzSiRQQLmVUiG+Sx
	 EvvjMxFPfnybivzGhZFCM8bW+so8lJZnEdnMhWhqxCKZPqShOfXEPEAZAc44/RIysi
	 OYnri1oeqieIn0ferQUwbh+FWPpQZzpuhdkTbUM5qdRgQ7vAr478s0JVWn/APnR/vP
	 gT1Dc3gOYjy0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-6-1be02deffda9@oss.qualcomm.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-6-1be02deffda9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 13:48:52 +0000
Message-Id: <20260721134853.2B2401F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] State leak causing hardware misconfiguration on channel reuse due =
to uncleared `lock_scratchpad_addr` and hardcoded direction.
- [High] Channel state corruption when `bam_slave_config` fails validation.
- [High] Infinite BH workqueue loop and unratelimited log flood on memory a=
llocation failure.
- [High] DMA API violation: `lock_ce` buffer shares a cacheline with freque=
ntly CPU-modified struct members.
- [Low] Unused assignment of `hdesc` in IRQ handler.
--

--- Patch [6]: [PATCH v23 06/14] dmaengine: qcom: bam_dma: add support for =
BAM locking ---
commit 8b44c5e4935cbb61832adb3262df00b3b606a283
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

dmaengine: qcom: bam_dma: add support for BAM locking

This commit adds support for BAM pipe locking by prepending and appending
dummy command descriptors with LOCK/UNLOCK bits when starting DMA on a TX
channel. It uses a peripheral-local scratchpad address communicated via sla=
ve
config for the dummy writes.

> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index f3e713a5259c2..411c60c4433e2 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
[ ... ]
> @@ -72,6 +76,11 @@ struct bam_async_desc {
> =20
>  	struct bam_desc_hw *curr_desc;
> =20
> +	/* BAM locking infrastructure */
> +	bool is_lock_desc;
> +	struct scatterlist lock_sg;
> +	struct bam_cmd_element lock_ce;
> +
>  	/* list node for the desc in the bam_chan list of descriptors */
>  	struct list_head desc_node;

[Severity: High]
Does placing lock_ce immediately adjacent to desc_node risk a DMA API
violation? lock_ce is mapped for DMA via dma_map_sg(), but desc_node is
actively modified by the CPU via list_add_tail() during bam_start_dma()
while the mapping is active. On non-coherent architectures, could this
cause cacheline tearing or stale data writebacks if they share the same
cacheline?

[ ... ]
> @@ -676,13 +691,26 @@ static void bam_free_chan(struct dma_chan *chan)
>  static int bam_slave_config(struct dma_chan *chan,
>  			    struct dma_slave_config *cfg)
>  {
> +	struct bam_config *peripheral_cfg =3D cfg->peripheral_config;
>  	struct bam_chan *bchan =3D to_bam_chan(chan);
> +	const struct bam_device_data *bdata =3D bchan->bdev->dev_data;
> =20
>  	guard(spinlock_irqsave)(&bchan->vc.lock);
> =20
>  	memcpy(&bchan->slave, cfg, sizeof(*cfg));
>  	bchan->reconfigure =3D 1;
> =20

[Severity: High]
Is it safe to overwrite bchan->slave and set bchan->reconfigure =3D 1 before
validating the configuration direction below? If cfg->direction !=3D
DMA_MEM_TO_DEV, this returns -EINVAL to the caller, but the channel
retains the rejected parameters and will apply them on the next transfer
because bchan->reconfigure remains set.

> +	/*
> +	 * This is required to setup the pipe locking and must be done even
> +	 * before the first call to bam_start_dma().
> +	 */
> +	if (bdata->pipe_lock_supported && peripheral_cfg) {
> +		if (cfg->direction !=3D DMA_MEM_TO_DEV)
> +			return -EINVAL;
> +
> +		bchan->lock_scratchpad_addr =3D peripheral_cfg->lock_scratchpad_addr;
> +	}

[Severity: High]
If bam_slave_config() is called without peripheral_cfg, should
bchan->lock_scratchpad_addr be reset to 0 to avoid leaking state from a
prior configuration? If the previous lock_scratchpad_addr is retained,
bam_start_dma() might erroneously inject dummy lock descriptors on new
transfers.

[ ... ]
> @@ -919,13 +959,19 @@ static u32 process_channel_irqs(struct bam_device *=
bdev)
>  			 * push back to front of desc_issued so that
>  			 * it gets restarted by the work queue.
>  			 */
> +
> +			list_del(&async_desc->desc_node);
>  			if (!async_desc->num_desc) {
> -				vchan_cookie_complete(&async_desc->vd);
> +				hdesc =3D async_desc->desc;
> +

[Severity: Low]
Is the assignment to hdesc used anywhere? It appears to be assigned here but
is never read.

[ ... ]
> @@ -1046,13 +1092,100 @@ static void bam_apply_new_config(struct bam_chan=
 *bchan,
>  	bchan->reconfigure =3D 0;
>  }
> =20
> +static struct bam_async_desc *
> +bam_make_lock_desc(struct bam_chan *bchan, unsigned long flag)
> +{
> +	struct bam_async_desc *async_desc;
> +	struct bam_desc_hw *desc;
> +	struct virt_dma_desc *vd;
> +	struct virt_dma_chan *vc;
> +	unsigned int mapped;
> +
> +	async_desc =3D kzalloc_flex(*async_desc, desc, 1, GFP_NOWAIT);
> +	if (!async_desc) {
> +		dev_err(bchan->bdev->dev, "failed to allocate the BAM lock descriptor\=
n");
> +		return ERR_PTR(-ENOMEM);
> +	}

[Severity: High]
Could this unratelimited dev_err() cause a log flood? If kzalloc_flex()
fails here, bam_start_dma() requeues the work to system_bh_highpri_wq,
which runs in softirq context immediately without sleeping. This creates a
tight spin loop that will retry the exact same GFP_NOWAIT allocation, fail
again, and rapidly flood the console.

> +
> +	sg_init_table(&async_desc->lock_sg, 1);
> +
> +	async_desc->num_desc =3D 1;
> +	async_desc->curr_desc =3D async_desc->desc;
> +	async_desc->dir =3D DMA_MEM_TO_DEV;
> +	async_desc->is_lock_desc =3D true;

[Severity: High]
Does hardcoding async_desc->dir to DMA_MEM_TO_DEV risk hardware
misconfiguration? If channel reuse retains lock_scratchpad_addr (as
mentioned in the bam_slave_config() review), a DEV_TO_MEM stream might
erroneously inject this dummy descriptor. This would cause
bam_apply_new_config() to execute with the wrong direction and incorrectly
apply dst_maxburst instead of src_maxburst, while clearing the reconfigure
flag for the actual data transfer.

[ ... ]
> @@ -1064,6 +1197,7 @@ static void bam_start_dma(struct bam_chan *bchan)
> =20
>  	lockdep_assert_held(&bchan->vc.lock);
> =20
> +	vd =3D vchan_next_desc(&bchan->vc);
>  	if (!vd)
>  		return;
> =20
> @@ -1072,6 +1206,24 @@ static void bam_start_dma(struct bam_chan *bchan)
>  		return;
> =20
>  	while (vd && !IS_BUSY(bchan)) {
> +		/*
> +		 * Open a LOCK/UNLOCK bracket around each fresh sequence.
> +		 * Sentinels inserted by bam_setup_pipe_lock() are skipped: they
> +		 * already have bam_locked set and must not trigger a second pair.
> +		 */
> +		if (!bchan->bam_locked) {
> +			ret =3D bam_setup_pipe_lock(bchan);
> +			if (ret) {
> +				dev_err_ratelimited(bdev->dev,
> +					"failed to setup the pipe lock, deferring transfer: %d\n",
> +					ret);
> +				queue_work(system_bh_highpri_wq, &bdev->work);
> +				break;
> +			}

[Severity: High]
Does requeuing to a high-priority BH workqueue upon ENOMEM cause CPU
starvation? Because system_bh_highpri_wq executes in softirq context,
requeuing immediately without sleeping prevents the memory reclaim needed
to resolve the GFP_NOWAIT failure, leading to an infinite spin loop.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-qcom-qce-c=
md-descr-v23-0-1be02deffda9@oss.qualcomm.com?part=3D6
