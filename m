Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7B5353EEB
	for <dmaengine@vger.kernel.org>; Wed,  9 Sep 2026 03:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788925853; cv=none; b=miRnN4quwR/olde1ajzIGBTVBFvte+FdYbqvWq7XeBbOxkfXy8VmunBpbzvHE8hD5z6nRdEQhvyjhUX8HWu+qrhnUSyKTJZ5RG21GmCyZHyU1Lhz7bXM3Vh+ERSAJEpOxEpQDAxrJ9lQiNKY7nyCO9tb6byITYiAS9aYulAZHC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788925853; c=relaxed/simple;
	bh=MnhWvHZ42CtwtN/XAi4dpbviSlN/fPna1tuzE+vs+mc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vDl2reN3P+thgQg2ENJYPcPyxlisAddqKkNLOH1vxkjtrCQyO3L5YCk3TPcPe/iopVVkQwrFyntYT7AiDtdLr4nDX9VVAQ7RQP7ALyAvhZD902tOLloTU+v0YAveT57lTMx7/mVvgBcB7thn14ZF7xBf0dVRrWPyZ0kZVkiUsOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RAWmuGqy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RAWmuGqy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E4281F00A3E;
	Wed,  9 Sep 2026 03:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788925851;
	bh=CiBeyzL/RaGUS/Grwed4tkJxnAVlh4I5KvXm+z6NV3Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RAWmuGqyfvp5k6l0G+E9SPZaAIpCSu7VQwsqscqWV0inoupjqRUlMPttr6UjUJLcU
	 w5FXu/dHIJg+ij8LIFq1lGv/AR/1hsxK782Xalgfr1/tj0HkbZbuON+pz3jbR+9BW0
	 s2nun0iYH99Zt9hMP5w9Cu9zGp/96KiKCx/FT7qiln7SKlS7qGGY4dTwJX8zSCvXW0
	 ybw3cKLZRa0XTpafI/XsCU+sQrSlVu/gZxhefhixkP7JR10Ta9mp2TVmGg7AAjZ3xe
	 RTnk4S6ZUPRfFruKyneadmxvIrxJ83exT4LReXBUrqlveKaRskXkTLOXeHlIBsEGDG
	 ZzmQ8SwdnWxsg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: mmp_pdma: fix wrong sg length in
 mmp_pdma_prep_slave_sg
Reply-To: sashiko-reviews@lists.linux.dev
To: "Baineng Shou" <shoubaineng@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260909033841.1395793-1-shoubaineng@gmail.com>
References: <20260909033841.1395793-1-shoubaineng@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 03:50:51 +0000
Message-Id: <20260909035051.6E4281F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free during descriptor list cleanup on error paths.
- [High] Tasklets are not killed during device removal, leading to a potent=
ial Use-After-Free.
- [High] Stale state and missing initialization for `chan->dir` and `chan->=
dcmd` breaking memory-to-memory DMA.
- [High] Unprotected overwrite of channel-wide `byte_align` flag by subsequ=
ent prep calls.
--

commit 67c707d8b7f67369582be4fc75b9289a8abcab3a
Author: Baineng Shou <shoubaineng@gmail.com>

dmaengine: mmp_pdma: fix wrong sg length in mmp_pdma_prep_slave_sg

In mmp_pdma_prep_slave_sg(), for_each_sg() iterates the scatterlist
putting each entry into 'sg', but the entry length is read from 'sgl'
(the list head) instead of 'sg' (the current entry):
[ ... ]
Single-sg or uniformly-sized lists happen to mask the issue.

> diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
> index 386e85cd4882a..e90fd2023af71 100644
> --- a/drivers/dma/mmp_pdma.c
> +++ b/drivers/dma/mmp_pdma.c
> @@ -713,7 +713,7 @@ mmp_pdma_prep_slave_sg(struct dma_chan *dchan, struct=
 scatterlist *sgl,
> =20
>  	for_each_sg(sgl, sg, sg_len, i) {
>  		addr =3D sg_dma_address(sg);
> -		avail =3D sg_dma_len(sgl);
> +		avail =3D sg_dma_len(sg);
> =20
>  		do {
>  			len =3D min_t(size_t, avail, PDMA_MAX_DESC_BYTES);

[Severity: High]
This isn't a regression introduced by this patch, but this lockless
modification of chan->byte_align appears to silently overwrite the hardware
alignment requirement for any earlier descriptors that are still pending or
running:

drivers/dma/mmp_pdma.c:mmp_pdma_prep_slave_sg() {
    ...
		do {
			len =3D min_t(size_t, avail, PDMA_MAX_DESC_BYTES);
			if (addr & 0x7)
				chan->byte_align =3D true;
    ...
}

If a client prepares multiple scatterlists on the same channel before
submitting them, does the last prepared scatterlist overwrite
chan->byte_align for the entire channel?

When earlier transactions are eventually started via enable_chan(), they
are submitted to hardware with the overwritten alignment configuration:

drivers/dma/mmp_pdma.c:enable_chan() {
    ...
	if (phy->vchan->byte_align)
		dalgn |=3D 1 << phy->idx;
    ...
}

Could this lead to hardware misbehavior or data corruption due to incorrect
alignment configuration?


[Severity: High]
This is a pre-existing regression, but I have a question about the error
handling path further down in mmp_pdma_prep_slave_sg():

drivers/dma/mmp_pdma.c:mmp_pdma_prep_slave_sg() {
    ...
fail:
	if (first)
		mmp_pdma_free_desc_list(chan, &first->tx_list);
	return NULL;
}

The cleanup sequence explicitly passes &first->tx_list, which is embedded
in the descriptor to be freed.

drivers/dma/mmp_pdma.c:mmp_pdma_free_desc_list() {
    ...
	list_for_each_entry_safe(desc, _desc, list, node) {
		list_del(&desc->node);
		dma_pool_free(chan->desc_pool, desc, desc->async_tx.phys);
	}
    ...
}

The list iteration macro safely caches the next element, but it reads from
and writes to the list head during the update and list_del() steps.

If the list head (&first->tx_list) is embedded in a freed element (because
the 'first' descriptor is freed during the first iteration), wouldn't this
result in a use-after-free when subsequent list manipulations or the loop's
next-entry calculation dereference the freed memory?


[Severity: High]
This is a pre-existing regression, but there might be an initialization
problem in mmp_pdma_prep_memcpy() when reusing channels:

drivers/dma/mmp_pdma.c:mmp_pdma_prep_memcpy() {
    ...
	if (!chan->dir) {
		chan->dir =3D DMA_MEM_TO_MEM;
		chan->dcmd =3D DCMD_INCTRGADDR | DCMD_INCSRCADDR;
		chan->dcmd |=3D DCMD_BURST32;
	}
    ...
}

Does the !chan->dir condition fail to clear stale state from a previous sla=
ve
DMA session?

When a channel allocated from the shared pool is used for slave DMA (e.g.,
DMA_MEM_TO_DEV), it modifies chan->dir and chan->dcmd. When the channel is
freed via mmp_pdma_free_chan_resources(), these fields are not cleared.

If the channel is later requested for dma_memcpy, mmp_pdma_prep_memcpy() wi=
ll
use the stale state. Could this incorrectly omit DCMD_INCTRGADDR (leaving t=
he
target address static) and apply the wrong address increment logic, resulti=
ng
in corrupted memory writes?


[Severity: High]
This is a pre-existing regression, but I noticed a potential teardown
problem in the device removal path:

drivers/dma/mmp_pdma.c:mmp_pdma_remove() {
    ...
	dma_async_device_unregister(&pdev->device);
}

The device removal teardown is missing necessary tasklet_kill() calls for
all initialized channels before their memory backing is freed by devres.

Since chan is managed by devm_kzalloc(), it is automatically freed after
mmp_pdma_remove() completes.

If a tasklet was scheduled right before free_irq() but hasn't executed,
will it run after removal completes and access the freed chan structure,
causing a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909033841.1395=
793-1-shoubaineng@gmail.com?part=3D1
