Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C65633688D
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 08:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278298; cv=none; b=LeqNPbjVeiVYkvgCaEvD95UGB6siUX0splfNDZ7c63ZJBVtfvXNI0yeLVTQilgTjPAAOJ8gzP0tRFHOtxDmmVdMmpE+89wOFrLp2nT4tWzBs75K9WvNpFKnwdDte8X27cWblVEv2jhocQwytcKQ6VEaBKo3oPx19s8XiC0BT8g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278298; c=relaxed/simple;
	bh=cA8gEkeDSQQjEDzuC9r04N4Y5bx+7oGd6XlLTNgGtsI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jpF7kB9i8E/bX+DyMcxN+ctZhvgk42SP7cuZ7JAtsDiGh8tG4N+8hbCySYcv31BDM32MmD53ehQDktoD6MJ1QMKbjK+tDTkDlR+VDtzs3aZnsIqGG9LgmMm8IS19l/yI0ygZiZIuDu5UJsigTvxmooD82stBSh4coTuQ+RE3KTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=apDZN2Qu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="apDZN2Qu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0FBC1F000E9;
	Fri, 17 Jul 2026 08:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784278297;
	bh=2rQQ7ww6tVG09Q+gv8kkyc1fTFPLimw0TewwGzMnc94=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=apDZN2Qu1yXQmeLdbKVVbPh1ShAjWLMvkRy4RW3XjoEbctMGs+gVScytx1w4lx7QK
	 /VBgyG1TuNiuelSqyyePyN9tn5XcPsSZzoHwDgVzYQm/efyhuzBUDDumpijMd0K74q
	 nDgYHv5AtFKfXTuxv4Ux0Y8JOKm6yt2pNpsOrKMF38oYHRD1h3sQkb/1gIZdJ3x0WU
	 lW5b9qCdbvyZY+T7AqVdsChes7dd6mGBvMExr3gr50DrvjkpPv0gdNmC0EkHAlm8iU
	 3oao7OZpOqtaMms9DlChkpmSnRjx0IJTy2i6hY+I5PpJ01o4R+zjUDZhhJhg5l7GEy
	 /Bq6bLCfp2OZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260717-qcom-qce-cmd-descr-v22-6-ff0d18b27246@oss.qualcomm.com>
References: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
 <20260717-qcom-qce-cmd-descr-v22-6-ff0d18b27246@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 08:51:36 +0000
Message-Id: <20260717085136.E0FBC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] DMA API violation due to mismatched device pointers in dma_map_sg =
and dma_unmap_sg.
- [High] The client-provided physical address for the lock scratchpad is si=
lently truncated to 24 bits.
- [Medium] Transient allocation failure for lock descriptors causes a perma=
nent channel stall.
- [Medium] Pipe locking is restricted to TX channels instead of RX channels=
, contradicting intended design.
- [Medium] The dummy lock descriptor clears the `reconfigure` flag using a =
hardcoded TX direction, potentially misconfiguring the channel.
- [Low] Missing integer argument for `%d` in `dev_err_ratelimited` call.
--

--- Patch [6]: [PATCH v22 06/14] dmaengine: qcom: bam_dma: add support for =
BAM locking ---
commit c786d3c51276cef4b55a461357b399c32982316b
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: dmaengine: qcom: bam_dma: add support for BAM locking

This commit adds support for BAM pipe locking by prepending and appending
dummy command descriptors with LOCK and UNLOCK bits set. It aims to prevent
writes into config registers while the engine is busy.

> Add support for BAM pipe locking. To that end: when starting DMA on an RX
> channel - prepend the existing queue of issued descriptors with an

[Severity: Medium]
Is this intended to be restricted to TX channels? The commit message mentio=
ns
starting DMA on an RX channel, but the implementation in bam_setup_pipe_loc=
k()
aborts the lock setup if the direction is not DMA_MEM_TO_DEV.

> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index f3e713a5259c2..edaa694eb9df0 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c

[ ... ]

> @@ -859,6 +887,15 @@ static int bam_resume(struct dma_chan *chan)
>  	return 0;
>  }
> =20
> +static void bam_dma_free_lock_desc(struct virt_dma_desc *vd)
> +{
> +	struct bam_async_desc *async_desc =3D container_of(vd, struct bam_async=
_desc, vd);
> +	struct dma_chan *chan =3D vd->tx.chan;
> +
> +	dma_unmap_sg(chan->slave, &async_desc->lock_sg, 1, DMA_TO_DEVICE);

[Severity: High]
Will this cause a DMA API violation?=20

The scatterlist is unmapped here using the client device (chan->slave), but=
 it
is mapped in bam_make_lock_desc() using the DMA controller device=20
(bchan->bdev->dev).

> +	kfree(async_desc);
> +}

[ ... ]

> @@ -1046,13 +1090,101 @@ static void bam_apply_new_config(struct bam_chan=
 *bchan,
>  	bchan->reconfigure =3D 0;
>  }
> =20
> +static struct bam_async_desc *
> +bam_make_lock_desc(struct bam_chan *bchan, unsigned long flag)
> +{
> +	struct bam_async_desc *async_desc;

[ ... ]

> +	bam_prep_ce_le32(&async_desc->lock_ce, bchan->lock_scratchpad_addr, BAM=
_WRITE_COMMAND, 0);

[Severity: High]
Can this truncate the physical address and cause memory corruption?

The client-provided lock_scratchpad_addr is a 64-bit phys_addr_t, but
bam_prep_ce_le32() masks the address to 24 bits:

bam_ce->cmd_and_addr =3D cpu_to_le32((addr & 0xffffff) | ((cmd & 0xff) << 2=
4));

If the physical address is above 16MB, the BAM engine will perform its dummy
write to an arbitrary truncated address.

> +	sg_set_buf(&async_desc->lock_sg, &async_desc->lock_ce, sizeof(async_des=
c->lock_ce));
> +
> +	mapped =3D dma_map_sg(bchan->bdev->dev, &async_desc->lock_sg, 1, DMA_TO=
_DEVICE);

[ ... ]

> +static int bam_setup_pipe_lock(struct bam_chan *bchan)
> +{
> +	const struct bam_device_data *bdata =3D bchan->bdev->dev_data;
> +	struct bam_async_desc *lock_desc, *unlock_desc;
> +
> +	lockdep_assert_held(&bchan->vc.lock);
> +
> +	if (!bdata->pipe_lock_supported || !bchan->lock_scratchpad_addr ||
> +	    bchan->direction !=3D DMA_MEM_TO_DEV)
> +		return 0;

[Severity: Medium]
Does this restriction conflict with the commit message?=20

The condition limits pipe locking to DMA_MEM_TO_DEV (TX), making this featu=
re
dead code for RX channels (DMA_DEV_TO_MEM).

> +
> +	/*

[ ... ]

> @@ -1072,6 +1205,22 @@ static void bam_start_dma(struct bam_chan *bchan)
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
> +					"failed to setup the pipe lock, deferring transfer: %d\n");

[Severity: Low]
Is this missing the integer argument for the %d format specifier?

[Severity: Medium]
Will this cause a permanent channel stall on memory pressure?=20

If bam_setup_pipe_lock() fails due to a GFP_NOWAIT allocation failure, the
loop breaks and leaves the descriptors on the desc_issued list, but no
mechanism appears to schedule a retry.

> +				break;
> +			}
> +			if (bchan->bam_locked)
> +				vd =3D vchan_next_desc(&bchan->vc);
> +		}
> +
>  		list_del(&vd->node);
> =20
>  		async_desc =3D container_of(vd, struct bam_async_desc, vd);

[ ... ]

>  		/* on first use, initialize the channel hardware */
>  		if (!bchan->initialized)
>  			bam_chan_init_hw(bchan, async_desc->dir);
> =20
>  		/* apply new slave config changes, if necessary */
>  		if (bchan->reconfigure)
>  			bam_apply_new_config(bchan, async_desc->dir);

[Severity: Medium]
Could the dummy lock descriptor clear the reconfigure flag with the wrong
direction?

The lock descriptor is created with async_desc->dir hardcoded to
DMA_MEM_TO_DEV. If pipeline locking is ever enabled for RX channels,
bam_apply_new_config() will configure the BAM engine using dst_maxburst
instead of src_maxburst, and clear the bchan->reconfigure flag before the
real data descriptor is processed.

> =20

[ ... ]

> @@ -1191,8 +1344,11 @@ static void bam_issue_pending(struct dma_chan *cha=
n)
>   */
>  static void bam_dma_free_desc(struct virt_dma_desc *vd)
>  {
> -	struct bam_async_desc *async_desc =3D container_of(vd,
> -			struct bam_async_desc, vd);
> +	struct bam_async_desc *async_desc =3D container_of(vd, struct bam_async=
_desc, vd);
> +	struct dma_chan *chan =3D vd->tx.chan;
> +
> +	if (async_desc->is_lock_desc)
> +		dma_unmap_sg(chan->slave, &async_desc->lock_sg, 1, DMA_TO_DEVICE);

[Severity: High]
Does this share the same DMA API violation mentioned earlier?=20

The abort/cleanup path also unmaps using the client device instead of the
DMA controller device.

> =20
>  	kfree(async_desc);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-qcom-qce-c=
md-descr-v22-0-ff0d18b27246@oss.qualcomm.com?part=3D6
