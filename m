Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7222BE7CD
	for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 03:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787196522; cv=none; b=sh6xfaffWpq+A/QHilTPmzquhXi8TYJcK+NpSb154ZaivB9UyPKKCxSuwidXoS0XVUwvDgmaa+KH5Mn6hPz9nCpnmqhXJmGACYksPmbzJRnPlCH85IJpQWZjrUvgFsxrwFBtY7un+KdbpVGEZP+Vpj3m8uSSuXp5dM63NQIRFDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787196522; c=relaxed/simple;
	bh=EdGj006bAkQd1mAvF0A4AfEgGAPNFroGHnTMIxwTjNY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oK3Y4kushdfsKQOvCm2sBnKBrl62MdewuLq9KocRspyqCGK2Hr7ESNM2KpLpf9RTy7eq7QXxg8b1sQpeg377YiqqxdAXkUfy3A532l9pK65haDJVUhKQZJvEb0Vum+6Qizby64FxYCGRnCkbaw6bMLWnlH2bp5dPyzgJCIhNxNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yo3VcE3q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yo3VcE3q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D811F00A3A;
	Thu, 20 Aug 2026 03:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787196520;
	bh=/rzo27NAiQoHFBY/UjVdZbg7UUGUlNitepjBrL+2rLQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yo3VcE3qfrfqS/nYqIY2vSJ4Gju91MmPs4tSw723HBgrFgJQ6UggOrlBtMcNsfbPW
	 DHCg9crLaVKao7WXmzU5Tv4nbt6ehm+4SBP5FZQ9UPT+e7UzZpARScHDMIfDBCGfcp
	 tcJ6DrwPNlAz8bQWlhnVsp5MwfIihNIWFDoMxO/x1K0cUbulhLaPATpKrGs87brSLd
	 QIVLkOMgg7sqsB4Ba/dHed+353cTvZrm53dJD+5t0yh/VxGG8TFTsUQk7l9qxmqUuy
	 Mmi5w5uEFbF+fJ4mad2/AY6O/J6BfQer7bGyRE2ty83A/U/yjHV66bkjkROi9OJM3K
	 +DxInnikvG6sw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: fsl_raid: zero CF descriptor pool
 allocations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260820031654.28450-1-rosenp@gmail.com>
References: <20260820031654.28450-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 03:28:39 +0000
Message-Id: <20260820032840.25D811F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] When reusing a descriptor from `free_q`, `fsl_re_chan_alloc_desc()=
` fails to clear the residual state from the previous transaction (e.g., `a=
sync_tx.callback`, `async_tx.callback_param`).
- [High] `fsl_re_free_chan_resources()` blindly loops `alloc_count` times w=
ithout verifying list emptiness, causing list corruption. Furthermore, a po=
st-decrement on `alloc_count` causes integer underflow, leaking descriptors=
 on subsequent allocations.
- [High] `fsl_re_dequeue()` invokes client callbacks while holding a spinlo=
ck with interrupts disabled, causing an AA deadlock if the client submits a=
 new transaction.
- [High] The driver teardown and probe error paths completely fail to free =
the requested IRQ, and teardown frees DMA memory before unregistering the d=
maengine device.
--

--- Patch [1]: [PATCH] dmaengine: fsl_raid: zero CF descriptor pool allocat=
ions ---
commit 0eda1d4c582e7fd0cd8ab28917a580d65f3d2988
Author: Rosen Penev <rosenp@gmail.com>
Subject: dmaengine: fsl_raid: zero CF descriptor pool allocations

This patch replaces dma_pool_alloc() with dma_pool_zalloc() to ensure
compound frame descriptors and embedded CDBs are initialized to zero.
This prevents exposing uninitialized heap contents to the hardware.

> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 99945845d8b5e..1ed41d7e923bf 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -294,8 +294,8 @@ static struct fsl_re_desc *fsl_re_chan_alloc_desc(str=
uct fsl_re_chan *re_chan,
>  		if (!desc)
>  			return NULL;
> =20
> -		cf =3D dma_pool_alloc(re_chan->re_dev->cf_desc_pool, GFP_NOWAIT,
> -				    &paddr);
> +		cf =3D dma_pool_zalloc(re_chan->re_dev->cf_desc_pool, GFP_NOWAIT,
> +				     &paddr);

[Severity: High]
This is a pre-existing issue, but when reusing a descriptor from free_q
earlier in fsl_re_chan_alloc_desc(), does it leak residual state?

If a client allocates a descriptor, sets a callback, and executes it, the
descriptor returns to free_q. When a subsequent client allocates from free_=
q:

drivers/dma/fsl_raid.c:fsl_re_chan_alloc_desc() {
    ...
    if (!list_empty(&re_chan->free_q)) {
        /* take one desc from free_q */
        desc =3D list_first_entry(&re_chan->free_q,
                    struct fsl_re_desc, node);
        list_del(&desc->node);

        desc->async_tx.flags =3D flags;
    }
    ...
}

Only async_tx.flags is updated here, leaving async_tx.callback and
callback_param populated. Could this result in spurious callbacks being
invoked with freed structures if the new transaction does not explicitly
clear them?

>  		if (!cf) {
>  			kfree(desc);
>  			return NULL;

[ ... ]

> @@ -583,8 +583,8 @@ static int fsl_re_alloc_chan_resources(struct dma_cha=
n *chan)
>  		if (!desc)
>  			break;
> =20
> -		cf =3D dma_pool_alloc(re_chan->re_dev->cf_desc_pool, GFP_KERNEL,
> -				    &paddr);
> +		cf =3D dma_pool_zalloc(re_chan->re_dev->cf_desc_pool, GFP_KERNEL,
> +				     &paddr);

[Severity: High]
This isn't a bug introduced by this patch, but does the way alloc_count is
tracked lead to integer underflow and list corruption in
fsl_re_free_chan_resources()?

In fsl_re_free_chan_resources(), there is a blind loop:

drivers/dma/fsl_raid.c:fsl_re_free_chan_resources() {
    ...
    while (re_chan->alloc_count--) {
        desc =3D list_first_entry(&re_chan->free_q,
                    struct fsl_re_desc,
                    node);

        list_del(&desc->node);
    ...
}

If the channel is freed while any descriptors are still active (not in
free_q), the loop will run more times than items exist in free_q. Would
this result in list_first_entry() returning an invalid pointer and causing
list corruption?

Additionally, if alloc_count reaches zero and the post-decrement underflows
it to UINT_MAX, wouldn't subsequent calls to fsl_re_alloc_chan_resources()
permanently break descriptor tracking when incrementing alloc_count?

[Severity: High]
This is a pre-existing issue, but could invoking client callbacks from
fsl_re_dequeue() while holding desc_lock cause an AA deadlock?

drivers/dma/fsl_raid.c:fsl_re_dequeue() {
    ...
    spin_lock_irqsave(&re_chan->desc_lock, flags);
    count =3D FSL_RE_SLOT_FULL(in_be32(&re_chan->jrregs->oubring_slot_full)=
);
    while (count--) {
        /* ... */
        if (found) {
            fsl_re_desc_done(desc);
    ...
}

The fsl_re_desc_done() function executes the client's completion callback.
If the client submits a new transaction from within this callback,
fsl_re_tx_submit() will attempt to acquire re_chan->desc_lock again. Does
this result in a recursive spinlock deadlock?

[Severity: High]
This isn't a bug introduced by this patch, but does the driver fail to free
its requested IRQ, potentially leading to a use-after-free?

In fsl_re_chan_probe(), an IRQ is requested without devm_:

drivers/dma/fsl_raid.c:fsl_re_chan_probe() {
    ...
    ret =3D request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);
    if (ret) {
    ...
}

However, free_irq() does not appear to be called in the probe error paths
or during driver removal in fsl_re_remove_chan(). If the device is removed,
re_chan is freed via devm_kzalloc. If a subsequent hardware interrupt
occurs, won't fsl_re_isr() attempt to dereference the freed re_chan
pointer?

Also, in fsl_re_remove(), memory areas and tasklets are destroyed before
the device is unregistered:

drivers/dma/fsl_raid.c:fsl_re_remove() {
    ...
    /* Cleanup chan related memory areas */
    for (i =3D 0; i < re_priv->total_chans; i++)
        fsl_re_remove_chan(re_priv->re_jrs[i]);

    /* Unregister the driver */
    dma_async_device_unregister(&re_priv->dma_dev);
    ...
}

Does this allow clients to still access DMA resources while they are being
dismantled?

>  		if (!cf) {
>  			kfree(desc);
>  			break;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820031654.2845=
0-1-rosenp@gmail.com?part=3D1
