Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5C443A819
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387767; cv=none; b=SXqDnpe1jo37xEKJnCex7iSV551Ez6qUFgVlghcB1ep0mdAuQuOPlYzVI/pleJrxlU+MUDIOt00yoO6d1ECtuEWWBt0x9MJna9s5Rs0qFMfMR95izkDXXlJMvwQCaYiA2mEIWIoujdNBJHKNSP0ex5rZKAokwcSMB07mN+cJxQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387767; c=relaxed/simple;
	bh=7LujZFZJ66L730IhTUxcMiuwmb4OaJ+ZJXbzJ5+C/4U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CTxjZIA48tAuADof4x1vCGCrd0LceTNB8GvMziTMVobn6PYzziWsJvb/OlH33ZAiZTNpaV1Auem3T0nlnE1dksdx/2Eyx47mlKm0Yc73IgjkGQuuaRkumwIX1zqAoI0B9xaQQYpBMY4YCg9qAVghBjgdre3QlH3Ezw348HzIM2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e6tVJLW+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e6tVJLW+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC241F000E9;
	Mon, 10 Aug 2026 18:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786387765;
	bh=hFYLuGzer+7lZHWFjluO7P+odHueCxIhNeaPQxB38rU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e6tVJLW+zjofAMlu4zWL2ovEf8c38rhdyekgMjxRNjcKR3b5BR54TmZx4mn0g2p2+
	 ZqzfhCcQvtOXajdiHX00oOvqgIfo9tPGcUtVUVDIsgKQDZdF2A0LFIOwDQPowQo52w
	 NvkfkR87220t2xoZFjMgT1sE1AWSI2Tg1Ot+KdPPqWGf9sZchQdAQzHg3+/7nM40qh
	 8MSeHfpEjO9eBIG9pfEWALKBZJTxOgFmy7FU026BFbZdy2hptmNLXMOozEhrNDSxbx
	 iHOk3W5UPh0bA0fP0vwIueHYKYRi6iWJEZqnv3+rAN10YT53G7ZmZAUWYMLnAasbAu
	 DumBZgRd7wxvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 30/34] dmaengine: altera-msgdma: use channel BH
 helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <21c92aefc28557597024ee450f1690761ba6d452.1786384169.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <21c92aefc28557597024ee450f1690761ba6d452.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:49:24 +0000
Message-Id: <20260810184924.DDC241F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The failure path in `msgdma_probe()` does not call `dma_async_devi=
ce_unregister()` if `of_dma_controller_register()` fails, leading to a Use-=
After-Free.
- [High] The IRQ handler is requested before crucial data structures, lists=
, spinlocks, and the bottom-half worker are initialized, which can cause a =
kernel panic on an early interrupt.
- [High] Batching multiple DMA transactions causes dropped transfers due to=
 incorrect list splicing in `msgdma_start_transfer()`.
- [High] Dropping the spinlock while iterating a list via `list_for_each_en=
try_safe` enables arbitrary concurrent list destruction, leading to a Use-A=
fter-Free.
- [High] Zero-length transfers bypass descriptor limit checking, breaking a=
ccounting metrics and eventually leading to a NULL pointer dereference.
- [High] A hardware-induced soft lockup where the driver spins infinitely w=
ith interrupts disabled if the hardware descriptor FIFO remains full.
- [High] Missing bitmask application when reading the response fill-level r=
egister allows undefined upper bits to impose massive computational loops, =
freezing the kernel.
--

--- Patch [30]: [PATCH v3 30/34] dmaengine: altera-msgdma: use channel BH h=
elpers ---
commit 728ca1a7dab7d5ba74ab85afa0d21836b794d564
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: altera-msgdma: use channel BH helpers

Replace the device tasklet with the per-channel BH helper so completion
handling runs via dmaengine_*_bh.

> diff --git a/drivers/dma/altera-msgdma.c b/drivers/dma/altera-msgdma.c
> index e23e5b441a24e..c8e145cea6d25 100644
> --- a/drivers/dma/altera-msgdma.c
> +++ b/drivers/dma/altera-msgdma.c
[ ... ]
> @@ -684,11 +683,12 @@ static int msgdma_alloc_chan_resources(struct dma_c=
han *dchan)
> =20
>  /**
>   * msgdma_tasklet - Schedule completion tasklet
> - * @t: Pointer to the Altera sSGDMA channel structure
> + * @chan: Pointer to the Altera sSGDMA channel structure
>   */
> -static void msgdma_tasklet(struct tasklet_struct *t)
> +static void msgdma_tasklet(struct dma_chan *chan)
>  {
> -	struct msgdma_device *mdev =3D from_tasklet(mdev, t, irq_tasklet);
> +	struct msgdma_device *mdev =3D container_of(chan, struct msgdma_device,
> +						  dmachan);
>  	u32 count;
>  	u32 __maybe_unused size;
>  	u32 __maybe_unused status;

[Severity: High]
This isn't a bug introduced by this patch, but there appears to be a missing
bitmask on the response fill-level read further down in this function:

	if (mdev->resp) {
		/* Read number of responses that are available */
		count =3D ioread32(mdev->csr + MSGDMA_CSR_RESP_FILL_LEVEL);

The macro MSGDMA_CSR_RESP_FILL_LEVEL_GET() exists but isn't used here. If t=
he
upper 16 bits contain non-zero data, count will be massively inflated. Could
this cause the subsequent while (count--) loop to iterate excessively and
cause a CPU stall?

[ ... ]
> @@ -766,7 +766,7 @@ static void msgdma_dev_remove(struct msgdma_device *m=
dev)
>  		return;
> =20
>  	devm_free_irq(mdev->dev, mdev->irq, mdev);
> -	tasklet_kill(&mdev->irq_tasklet);
> +	dmaengine_kill_bh(&mdev->dmachan);
>  	list_del(&mdev->dmachan.device_node);
>  }

[Severity: High]
This is a pre-existing issue, but I have a question about the cleanup path.

If dma_async_device_register() succeeds in msgdma_probe(), but
of_dma_controller_register() fails, the code jumps to the fail label and ca=
lls
msgdma_dev_remove().

However, msgdma_dev_remove() lacks a dma_async_device_unregister() call. Si=
nce
mdev was allocated with devm_kzalloc(), it is automatically freed on probe
failure. Does this leave the dmaengine core with dangling pointers and cause
a Use-After-Free?

[ ... ]
> @@ -852,7 +852,7 @@ static int msgdma_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
> =20
> -	tasklet_setup(&mdev->irq_tasklet, msgdma_tasklet);
> +	dmaengine_init_bh(&mdev->dmachan, msgdma_tasklet);
> =20
>  	dma_cookie_init(&mdev->dmachan);

[Severity: High]
This isn't a bug introduced by this patch, but I have a question about the
initialization order here.

Higher up in msgdma_probe(), devm_request_irq() is called before the BH wor=
ker,
spinlocks, and lists are initialized.

If an interrupt fires immediately upon registration, could msgdma_irq_handl=
er()
attempt to lock the uninitialized spinlock, access uninitialized lists in
msgdma_start_transfer(), and schedule an uninitialized BH worker?

I also noticed several other pre-existing issues in this file:

[Severity: High]
This is a pre-existing issue, but I noticed something concerning in how bat=
ched
transfers are handled.

In msgdma_start_transfer():

	desc =3D list_first_entry_or_null(&mdev->pending_list,
					struct msgdma_sw_desc, node);
	if (!desc)
		return;

	list_splice_tail_init(&mdev->pending_list, &mdev->active_list);
	msgdma_copy_desc_to_fifo(mdev, desc);

When multiple transactions are queued, this takes the first descriptor but =
moves
the entire pending_list to active_list using list_splice_tail_init(). Howev=
er,
it only copies the first descriptor to the hardware FIFO.

When this transfer completes, subsequent transactions remain trapped in
active_list because msgdma_start_transfer() only checks pending_list. Does =
this
result in dropped transfers when a client driver batches multiple requests?

[Severity: High]
This is a pre-existing issue, but the lock dropping pattern seems dangerous.

In msgdma_chan_desc_cleanup(), the code iterates over mdev->done_list using
list_for_each_entry_safe and temporarily drops mdev->lock:

		if (dmaengine_desc_callback_valid(&cb)) {
			spin_unlock_irqrestore(&mdev->lock, irqflags);
			dmaengine_desc_callback_invoke(&cb, NULL);
			spin_lock_irqsave(&mdev->lock, irqflags);
		}

If dma_release_channel() is called concurrently, msgdma_free_chan_resources=
()
can acquire the lock, reset all lists, and free the backing array with
kfree(mdev->sw_desq). When msgdma_chan_desc_cleanup() reacquires the lock, =
its
next pointer will reference freed memory. Can this race lead to a
Use-After-Free?

[Severity: High]
This isn't a bug introduced by this patch, but there seems to be an account=
ing
flaw for zero-length transfers.

In msgdma_prep_memcpy():

	desc_cnt =3D DIV_ROUND_UP(len, MSGDMA_MAX_TRANS_LEN);
	...
	mdev->desc_free_cnt -=3D desc_cnt;
	...
	do {
		/* Allocate and populate the descriptor */
		new =3D msgdma_get_descriptor(mdev);
		...
	} while (len);

If len is 0, desc_cnt is 0. The free count check passes, and desc_free_cnt =
is
decremented by 0.

However, the do-while loop executes exactly once, withdrawing a physical
descriptor from mdev->free_list via msgdma_get_descriptor(). If multiple
zero-length requests are submitted, won't this drain free_list entirely wit=
hout
decrementing desc_free_cnt, eventually causing a NULL pointer dereference in
msgdma_get_descriptor()?

[Severity: High]
This is a pre-existing issue, but I am worried about the polling loop in
msgdma_copy_one():

	while (ioread32(mdev->csr + MSGDMA_CSR_STATUS) &
	       MSGDMA_CSR_STAT_DESC_BUF_FULL)
		mdelay(1);

Since this function is invoked under a spinlock with local interrupts disab=
led,
could a malfunctioning hardware device permanently stall the CPU core and t=
rigger
the NMI watchdog?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D30
