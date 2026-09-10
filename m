Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B1E41443D
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 20:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789070497; cv=none; b=KfyImaPXUUvSiPVKyMweEwNg9oXCUNTtCJMNQ6FrrftTCRbqnp6J79pLcRCBppfYmkeJqXwxwMO+7syHV/KC2AMLx4APIVEYfqd1BjMBnkaHMmwzHFwjAEiq0J0w8YBk7JqmWiTlZxEcNbdiAPPWOEPC0dGo6Xc9zMcEpGjfnJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789070497; c=relaxed/simple;
	bh=afmROAyALL3wgUNsm3/SFy55wxM5nwge6kO8nKqhC4w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gMco+3EfOzMl2CD9v7sZbRvzzhuT/+rcFmyY7Q5bTMOTGoH2IL5izxGeZ2wSsCoDpkWZo2rRXN6ZXVgWzbb4//BopbuitDU+KlhUioIn9mUy133QvM9Xw2aI555rbPOMN5dEVS3w4tos6xE/5EM+83JneMXYHTYx0ldV8PPmOo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OXg+A8GS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OXg+A8GS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4603C1F000FF;
	Thu, 10 Sep 2026 20:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789070496;
	bh=Pb9PiQcvS2HFJAsF+6cwKeQEjnblkUKqfdgtrbG9t1M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OXg+A8GSsquL563RILz1KXdskhBzkC7f15T4GCXFbu5I/gGfj5ij2i3qidO1vRirz
	 qV51ZuSG+EScupXHMLtCwJFDD1+C/4rA6+G1Hl8FtdrUHWNCaO3kFkJtmxDoQ8l//P
	 szoSUlLKSmfyGB3aRaPcEdl8HS8wEu5O+v9EBLNcDWDVasoFgzitPB7Y2rI6A0cgp+
	 L6ko7TgVoM5Hfdtqia4ely2YWBf1B76Gi0lwGkDsnRLUMzwI4iwhMiBRkh27byylbi
	 unvUm/BUIXWTex3E4STHK0C6Y0JhgWaRL0g66VZ2kNP9uDMrHnX63QtJxFuqCt4tY/
	 K8As1RxDidmqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: fsl_raid: byte-swap cdb32 when programming
 CDBs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260910194324.33697-1-rosenp@gmail.com>
References: <20260910194324.33697-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 20:01:35 +0000
Message-Id: <20260910200136.4603C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Buffer overflow in the compound frame descriptor array overwrites =
the Command Descriptor Block (CDB) during PQ continuation operations.
- [High] Out-of-bounds array read on the caller-provided `scf` coefficients=
 array in `fsl_re_prep_dma_pq` when `DMA_PREP_CONTINUE` is set.
- [High] Deadlock from calling client DMA callbacks while holding the chann=
el descriptor spinlock.
- [High] List corruption and kernel panic in `fsl_re_free_chan_resources` d=
ue to blind extraction from `free_q`.
- [High] Missing IRQ cleanup on probe error, causing IRQ resource leak and =
potential NULL pointer dereference in the ISR.
--

commit 35b8359a749c05ccda3b77bf570e1ce40a818eb4
Author: Rosen Penev <rosenp@gmail.com>

    dmaengine: fsl_raid: byte-swap cdb32 when programming CDBs
   =20
    The three prep functions write the first word of the command descriptor
    block (cdb32) with a plain u32 assignment, while every other CDB/CF
    descriptor field is written with cpu_to_be32(). The RAID Engine expects
    big-endian descriptors, so the plain assignment produces a corrupted CDB
    on little-endian hosts. Use cpu_to_be32() for cdb32 to match the
    surrounding code.

> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 2d86f61105e52..9845b6f1bb2c0 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
[ ... ]
> @@ -470,7 +470,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dm=
a_pq(
>  	cdb |=3D FSL_RE_DATA_DEP << FSL_RE_CDB_DEPEND_SHIFT;
> =20
>  	pq =3D desc->cdb_addr;
> -	pq->cdb32 =3D cdb;
> +	pq->cdb32 =3D cpu_to_be32(cdb);

While reviewing this patch, I noticed a few pre-existing issues in the
surrounding driver code.

>  	p =3D pq->gfm_q1;
>  	/* Init gfm_q1[] */
>  	for (i =3D 0; i < src_cnt; i++)
>  		p[i] =3D 1;
>=20
>  	/* Align gfm[] to 32bit */
>  	gfmq_len =3D ALIGN(src_cnt, 4);
>=20
>  	/* Init gfm_q2[] */
>  	p +=3D gfmq_len;
>  	for (i =3D 0; i < src_cnt; i++)
>  		p[i] =3D scf[i];

[Severity: High]
This isn't a bug introduced by this patch, but does this loop read out of
bounds of the caller-provided scf array?

When DMA_PREP_CONTINUE is set, src_cnt is artificially inflated by 3 earlier
in the function to account for continuation buffers:

	if (flags & DMA_PREP_CONTINUE)
		src_cnt +=3D 3;

However, this inflated count is then used as the loop boundary when reading
from the caller's strictly-sized scf array. Can this cause a KASAN
out-of-bounds read panic or disclose unrelated adjacent memory?

[ ... ]
> 	/* PQ computation continuation */
> 	if (flags & DMA_PREP_CONTINUE) {
> 		if (src_cnt - save_src_cnt =3D=3D 3) {
> 			p[save_src_cnt] =3D 0;
> 			p[save_src_cnt + 1] =3D 0;
> 			p[save_src_cnt + 2] =3D 1;
> 			fill_cfd_frame(cf, i++, len, dest[0], 0);
> 			fill_cfd_frame(cf, i++, len, dest[1], 0);
> 			fill_cfd_frame(cf, i++, len, dest[1], 1);

[Severity: High]
This is a pre-existing issue, but does this continuation sequence cause a
buffer overflow that overwrites the Command Descriptor Block (CDB)?

The CDB is allocated exactly at the end boundary of the compound frame arra=
y:

static struct fsl_re_desc *fsl_re_init_desc(...)
{
    ...
	desc->cdb_addr =3D (void *)(cf + FSL_RE_CF_DESC_SIZE);
    ...
}

The compound frame descriptor array holds exactly 20 frames (320 bytes / 16
bytes per frame). If a caller invokes fsl_re_prep_dma_pq() with the maximum
16 sources (FSL_RE_MAX_PQ_SRCS) and the DMA_PREP_CONTINUE flag is set, the
driver writes 1 CDB frame, 2 destination frames, 16 source frames, and 3
continuation frames (22 frames total).

Does this sequence push the frame index i to 20 and 21, overflowing the
bounds at the end of the array and directly corrupting the CDB residing
immediately after it?

[ ... ]
> static void fsl_re_dequeue(struct tasklet_struct *t)
> {
[ ... ]
> 	spin_lock_irqsave(&re_chan->desc_lock, flags);
> 	count =3D	FSL_RE_SLOT_FULL(in_be32(&re_chan->jrregs->oubring_slot_full));
> 	while (count--) {
[ ... ]
> 		if (found) {
> 			fsl_re_desc_done(desc);

[Severity: High]
This isn't a bug introduced by this patch, but does calling
fsl_re_desc_done() with the desc_lock held cause a deadlock?

Inside fsl_re_desc_done():

static void fsl_re_desc_done(struct fsl_re_desc *desc)
{
	...
	dmaengine_desc_get_callback_invoke(&desc->async_tx, NULL);
}

This invokes the client's callback synchronously. A standard pattern in DMA
clients (like MD RAID) is to immediately chain the next request inside the
completion callback. The fsl_re_tx_submit() function unconditionally tries
to acquire the same desc_lock:

static dma_cookie_t fsl_re_tx_submit(struct dma_async_tx_descriptor *tx)
{
    ...
	spin_lock_irqsave(&re_chan->desc_lock, flags);

Can this trigger an immediate spinlock recursion deadlock?

[ ... ]
> static void fsl_re_free_chan_resources(struct dma_chan *chan)
> {
> 	struct fsl_re_chan *re_chan;
> 	struct fsl_re_desc *desc;
>=20
> 	re_chan =3D container_of(chan, struct fsl_re_chan, chan);
> 	while (re_chan->alloc_count--) {
> 		desc =3D list_first_entry(&re_chan->free_q,
> 					struct fsl_re_desc,
> 					node);
>=20
> 		list_del(&desc->node);

[Severity: High]
This is a pre-existing issue, but can this cause list corruption and a kern=
el
panic if there are pending transactions?

The driver loops exactly alloc_count times calling list_first_entry()
without checking list_empty(). If any allocated descriptors are absent from
free_q (for example, if they are active, in ack_q, or leaked), the list will
be empty before the loop finishes. This would cast the list head itself to a
descriptor, call list_del() and kfree(), and corrupt kernel memory.

[ ... ]
> static int fsl_re_chan_probe(struct platform_device *ofdev,
> 		      struct device_node *np, u8 q, u32 off)
> {
[ ... ]
> 	ret =3D request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);
> 	if (ret) {
[ ... ]
> 	chan->inb_ring_virt_addr =3D dma_pool_alloc(chan->re_dev->hw_desc_pool,
> 		GFP_KERNEL, &chan->inb_phys_addr);
> 	if (!chan->inb_ring_virt_addr) {
> 		dev_err(dev, "No dma memory for inb_ring_virt_addr\n");
> 		ret =3D -ENOMEM;
> 		goto err_free;
> 	}
[ ... ]
> err_free:
> 	return ret;
> }

[Severity: High]
This isn't a bug introduced by this patch, but does this leak the active IRQ
handler if memory allocation fails?

If a step like dma_pool_alloc() fails, the code jumps to err_free without
calling free_irq(). Additionally, dev_set_drvdata() is only called at the
end of the probe. If a spurious interrupt fires after the error return,
fsl_re_isr() will fetch NULL from dev_get_drvdata() and immediately
dereference it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910194324.3369=
7-1-rosenp@gmail.com?part=3D1
