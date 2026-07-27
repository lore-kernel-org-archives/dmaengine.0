Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A9C3D9DD8
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785185650; cv=none; b=qJtdOFDberdCUc9cRI6JA90mulB4HyRBCw/xP53XQkOQKwfsB0vnBsgbLWt+4FJ6WvH3cQSG5xpx9LgCTk5kqnAPeRT1++gzfdcyoQQUaGTPEKeTM+77LAWlICoeEtx6KYt7XqwtvPQytfhrOYmLmPQG9FIqLq/6oZnYpTqGR8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785185650; c=relaxed/simple;
	bh=eI5Z9Gw5oI/mgUI1azD6qljLX+iYbGZRTR+EsQVFSVo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oABvhlm/e8ryYcjYHMdAZsNdCBAndF8NhKja78G9yFp70cejCZ0t4MKuwdkbmKsnF0HN/xRspptNueXawc4Q+rzhKbRXVX3f7+xbT0Plm0CrSnqHBHhWRJfp5hpHHNigYQnyugdUYShMHkG6mFWA9LypoulEs+YaMW0CELiOxws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hmv9NCYw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hmv9NCYw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D55011F000E9;
	Mon, 27 Jul 2026 20:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785185649;
	bh=lD7fEC1XXjuem9396FfeOYZCQQwNXRrjm7mwB6HJkwE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hmv9NCYwp/M7cMOw/2K85NsmrWqT1VWQSdpHgSFKwS0/xlD54UKzAdbDHfcBsSSjS
	 lNm9XxIbdPAdw+1wdiZk8LxfIaTquJ8VoRl1p6UtPdpYkQrVx9kwAM3cHKQ8t5gLZi
	 HgHV28bJKr8bNEUUG+ly6GhPjwFY6thjeduzSgi1EKKhMrRDl8MzfLv8K6GibjwhSI
	 9ytBzGbGqgETx4lKiS0ApUAn5QkbVg9O5pvqfh3lVmBvqEMO5TMsfw301M1YPV53jB
	 qiUNWTj4im+On5wrWlfPDzqX8LzcIMUFsMZIAP6UGdlYHBFOuJHaGB2pCH7A85hr+o
	 O1iSK1z7suZzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 21/64] dmaengine: zynqmp-dma: switch completion
 tasklet to dma_chan BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <72f509130ced9fd642dbf3906d253f5addff444d.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <72f509130ced9fd642dbf3906d253f5addff444d.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 20:54:08 +0000
Message-Id: <20260727205408.D55011F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] On channel error, the driver incorrectly marks the currently activ=
e descriptor as successful and silently drops all other pending descriptors=
, causing clients to hang indefinitely.
- [High] The DMA completion handler `zynqmp_dma_chan_desc_cleanup` drops `c=
han->lock` during callback execution while using `list_for_each_entry_safe`=
, allowing list corruption if a callback calls `dmaengine_terminate_async`.
- [High] `zynqmp_dma_device_terminate_all` fails to actually halt the hardw=
are DMA engine, leading to hardware silently overwriting memory after the c=
lient assumes the transfer is stopped.
--

--- Patch [21]: [PATCH v2 21/64] dmaengine: zynqmp-dma: switch completion t=
asklet to dma_chan BH ---
commit c7b5b53ae6dbca9c51452b38046b4252492aa34c
Author: Allen Pais <allen.lkml@gmail.com>
Subject: dmaengine: zynqmp-dma: switch completion tasklet to dma_chan BH

Replace the per-channel tasklet with the shared dma_chan BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_=
dma.c
> index f6a812e49ddca..6291126cdc9f8 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
[ ... ]
> @@ -760,11 +758,12 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, =
void *data)
> =20
>  /**
>   * zynqmp_dma_do_tasklet - Schedule completion tasklet
> - * @t: Pointer to the ZynqMP DMA channel structure
> + * @c: Pointer to the ZynqMP DMA channel structure
>   */
> -static void zynqmp_dma_do_tasklet(struct tasklet_struct *t)
> +static void zynqmp_dma_do_tasklet(struct dma_chan *c)
>  {
> -	struct zynqmp_dma_chan *chan =3D from_tasklet(chan, t, tasklet);
> +	struct zynqmp_dma_chan *chan =3D container_of(c,
> +			struct zynqmp_dma_chan, common);
>  	u32 count;
>  	unsigned long irqflags;
> =20

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a potential proble=
m in
how channel errors are handled when this bottom half runs.

When chan->err is set, we call zynqmp_dma_reset(). Inside zynqmp_dma_reset(=
):

drivers/dma/xilinx/zynqmp_dma.c:zynqmp_dma_reset() {
	...
	zynqmp_dma_complete_descriptor(chan);
	...
	zynqmp_dma_free_descriptors(chan);
	...
}

Does this incorrectly move the active descriptor to done_list and mark it
successful?

Also, it appears zynqmp_dma_free_descriptors() silently moves all remaining
descriptors from active_list and pending_list to the free_list without
invoking their callbacks.

Could this cause clients waiting on these DMA transfers to hang indefinitel=
y?


[Severity: High]
This is a pre-existing issue, but could there be a list corruption risk in
zynqmp_dma_chan_desc_cleanup() which is called shortly after in this bottom
half?

drivers/dma/xilinx/zynqmp_dma.c:zynqmp_dma_chan_desc_cleanup() {
	...
	list_for_each_entry_safe(desc, next, &chan->done_list, node) {
		...
		if (dmaengine_desc_callback_valid(&cb)) {
			spin_unlock_irqrestore(&chan->lock, irqflags);
			dmaengine_desc_callback_invoke(&cb, NULL);
			spin_lock_irqsave(&chan->lock, irqflags);
		}
	...
}

The lock is dropped during callback execution. If the client calls
dmaengine_terminate_async() in the callback, all descriptors (including tho=
se
on done_list) are moved to free_list.

When the lock is reacquired, the loop continues using the next pointer which
is now on the free_list.

Could this lead to double-frees and traversing invalid entries?


[Severity: High]
This is a pre-existing issue, but does zynqmp_dma_device_terminate_all()
actually halt the hardware DMA engine?

drivers/dma/xilinx/zynqmp_dma.c:zynqmp_dma_device_terminate_all() {
	...
	writel(ZYNQMP_DMA_IDS_DEFAULT_MASK, chan->regs + ZYNQMP_DMA_IDS);
	zynqmp_dma_free_descriptors(chan);
	...
}

It masks interrupts and frees software descriptors, but doesn't seem to cle=
ar
the ZYNQMP_DMA_ENABLE bit or issue a hardware reset.

If the hardware controller remains active, could it silently overwrite memo=
ry
after the client assumes the transfer is stopped and unmaps the DMA buffers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D21
