Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1B817D6
	for <dmaengine@vger.kernel.org>; Sun, 19 Jul 2026 00:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784419540; cv=none; b=uuH6knj59uCpRQ4mxY6XTBsVT7gQvN2tjdhlnBqm+Ucy7DWQx0UQjBAhUqpstxG9GwzHGvo0Xel5fgYwg4IvT1V45HfqB4KgNnSB5jgZwstA5DDCN6dA2if9it2JAHNIi8vsLM+3q3NK0apk/RsZ2WF6OumbyzMUHqpfD4y6DbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784419540; c=relaxed/simple;
	bh=KC7VPa9z4QCMeyWjPFYuW0xS0a1oSsrTWhea7F+PNro=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pFBjj65jVqLByF8OAN2BMZ3THTHCPpLT0c9vAapZgnOzoTBInQ1oNl2o6fFzECXdgtWZ05YDm9YBmkTDR5EXnm7d0iIb24PUgMAMkvqLLtJkdfzo7tOg9z7uir92VTW6n0YURWPqevmJzX+hMqirGUD4NOababqHsMpI1K5jq/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g16nREQM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g16nREQM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B2E01F000E9;
	Sun, 19 Jul 2026 00:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784419538;
	bh=Tn8XDgL+dFGjIcWvnLbQLhQU5W04Mbq5Eyv4dgPDfUo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g16nREQMOabVB8mbmFVqKwsJmTifeCQpAIC2hqJxDItewNFFeOI9j8tNauLlhiMwO
	 V4DG7xLiE3JIO5/YFWmeZ8SOFJyhWsPzTb/5Yn/e3dYJl/mjsdS0yFbsvgcP1KPXv6
	 4qIuUFbDCmuD7uJRFsZucJav2iA4h5GbFb6abcc4ddpQVrbKB35qzwtx4NDx/RjJJ0
	 T4lxmXjW7FJC61PhHe1ykl4glxjlTWJLb7ywdRtPuJlEVpZAuK6NGP20EVxqKcoJoL
	 Q6s7sCT9ksnzVbi/hWE0+iWnHMHeR4fRuqcQTsu6NyDjWmhsLLAS+O1vSJB42oTlxZ
	 YNBPmabYh1Npg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: fsl_raid: avoid free_q underflow in
 free_chan_resources
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260718235227.385108-1-rosenp@gmail.com>
References: <20260718235227.385108-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 00:05:37 +0000
Message-Id: <20260719000538.5B2E01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] The patch avoids a crash by exclusively iterating over `free_q`, b=
ut permanently leaks descriptors in other queues and introduces a dead-code=
 check.

Pre-existing issues:
- [High] Iterating and modifying `free_q` without holding `desc_lock` can r=
ace with the hardware tasklet, leading to list corruption.
- [High] The driver never frees the requested IRQ, causing an IRQ leak and =
a subsequent Use-After-Free on driver removal.
- [High] Hardware descriptor rings are destroyed before the DMA device is u=
nregistered, causing memory corruption if clients submit concurrent request=
s.
- [High] Papering over the crash without halting the underlying hardware ri=
sks severe silent DMA memory corruption.
--

--- Patch [1]: [PATCH] dmaengine: fsl_raid: avoid free_q underflow in free_=
chan_resources ---
commit 6689b4246e148c9519335c9bfdee192da8124eb9
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: fsl_raid: avoid free_q underflow in free_chan_resources

This commit modifies fsl_re_free_chan_resources() to walk free_q using
list_for_each_entry_safe() rather than relying on a fixed count. This
prevents a list corruption crash when descriptors are still located in
other queues during teardown.

> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 99945845d8b5e..5d86ff99624c0 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -602,18 +602,15 @@ static int fsl_re_alloc_chan_resources(struct dma_c=
han *chan)
>  static void fsl_re_free_chan_resources(struct dma_chan *chan)
>  {
>  	struct fsl_re_chan *re_chan;

[Severity: High]
This is a pre-existing issue, but does this function completely fail to
halt the hardware RAID engine?

If a client frees the channel while DMA transactions are still active, the
client will unmap its data buffers. Because the RAID engine and its
interrupts are not halted here, will it continue performing DMA operations
into memory that has been freed or reassigned?

> -	struct fsl_re_desc *desc;
> +	struct fsl_re_desc *desc, *_desc;
> =20
>  	re_chan =3D container_of(chan, struct fsl_re_chan, chan);
> -	while (re_chan->alloc_count--) {
> -		desc =3D list_first_entry(&re_chan->free_q,
> -					struct fsl_re_desc,
> -					node);
> -
> +	list_for_each_entry_safe(desc, _desc, &re_chan->free_q, node) {

[Severity: High]
This is a pre-existing issue, but is it safe to iterate and modify free_q
using list_del() without acquiring re_chan->desc_lock?

Since the hardware is not halted during teardown, an interrupt could fire
and schedule the fsl_re_dequeue tasklet on another CPU. If the tasklet
calls fsl_re_cleanup_descs(), which acquires desc_lock and attempts to
move completed descriptors to free_q using list_move_tail(), could this
concurrent modification corrupt the list pointers?

[Severity: High]
By exclusively iterating over free_q, does this deliberately strand and
leak any DMA pool buffers currently sitting in submit_q, active_q, and ack_=
q?

If a client frees the channel while descriptors remain in those other
queues, they are now ignored and the memory is never freed.

>  		list_del(&desc->node);
>  		dma_pool_free(re_chan->re_dev->cf_desc_pool, desc->cf_addr,
>  			      desc->cf_paddr);
>  		kfree(desc);
> +		re_chan->alloc_count--;
>  	}
> =20
>  	if (!list_empty(&re_chan->free_q))

[Severity: High]
Because the list_for_each_entry_safe loop above runs until free_q is empty,
won't this list_empty() check mathematically always evaluate to false?

This makes the error logging dead code, effectively masking the fact that
descriptors were left behind in the other queues.

>  		dev_err(re_chan->dev, "chan resource cannot be cleaned!\n");
>  }

[ ... ]

[Severity: High]
This is a pre-existing issue, but does the driver leak the IRQ requested
in fsl_re_chan_probe()?

Looking at fsl_re_chan_probe(), an interrupt is requested using
request_irq(), but neither fsl_re_remove_chan() nor fsl_re_remove() calls
free_irq().

Because the re_chan structure is allocated with devm_kzalloc() on the
parent device, its memory is automatically freed when the device unbinds.
If an interrupt fires after the driver is unloaded, will the kernel
execute the registered fsl_re_isr and dereference the freed re_chan
structure?

[Severity: High]
This is a pre-existing issue, but does fsl_re_remove() destroy resources
in the wrong order?

Looking at fsl_re_remove(), it destroys the hardware descriptor queues by
calling fsl_re_remove_chan() before calling dma_async_device_unregister():

drivers/dma/fsl_raid.c:fsl_re_remove() {
    ...
    for (i =3D 0; i < re_priv->total_chans; i++)
        fsl_re_remove_chan(re_priv->re_jrs[i]);
   =20
    dma_async_device_unregister(&re_priv->dma_dev);
    ...
}

By destroying the underlying DMA rings while the device is still visible
to the core framework, will any active or racing DMA transfers attempt to
write to freed memory pools?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718235227.3851=
08-1-rosenp@gmail.com?part=3D1
