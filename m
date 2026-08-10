Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28D2CA6F
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387287; cv=none; b=EueZgrKPpx0s3h6EitBwKvYKUIPQYIdItomB/QoNDO/DWjxTxijoR9AWGQysaYYtzbnjgpXaa+woiVtXZSuu4wJFU6HlQcUOOCoDkxuhnFEg8Q3zEjSP8SoSlMnDN0bIi+D5/PpTldYBSn8Imwv17TpsAtVO55hCjJzZA2jTaDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387287; c=relaxed/simple;
	bh=DWg0J+KxFIqsqb/XFJ/n4dlwEvJxWl/VyvPl1f/I9SI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BgPdLUAWgfUwlcrMfNlU1xSuPzyY84iCtri1ZFMn2ziGfFe0SCb9ke5VnZx3+qVdaWJDYkE4bwrFem6MrXCR8hVXjCPFR1p7aAiTmo3tvtINLho7p+Dryvp14EMiZGniiEWODwSTeimUMnlag3UKh//oOwmZOxfgm2DDZhRDugA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kg3mTSWx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kg3mTSWx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A2F61F000E9;
	Mon, 10 Aug 2026 18:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786387285;
	bh=MqpuueJOd3HMqCe+KSau5nNfLVzj6lyozuXuC+Oua9E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kg3mTSWx4kk6vxY4lWmj5Fd8tVVb1YKPa/xtiZCkCr/T8UyPQob9iO7dFzoOvb+qt
	 mHkjimQbzyt6jcGg1tbT0fqV538BmZsJ8BTeNT/uqubPbYDR87DkaE7Fyma/4ZyTk+
	 WoWoY2p027viIfXxDcY/2QzO5v/AUI3cv/g7KftU9qiLNgdlvNYcU3HLhtjxjt0EVQ
	 QN+FzbGYT0daqHoe1o4zNzerm6sIIsFlix15/+g0Tf46YiS5d23GKssK905nlq1kIg
	 A2Rft81IuUnpM87495ID0/5n9dNqUf2vnj3cnrHtcs+pE8m3V51lD138z/c1ezRwTL
	 Wi9G07HyHwUGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 28/34] dmaengine: sf-pdma: route error callbacks
 through channel BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <8538eed11abe0c92b1a5b2830baf7a3f06ac698c.1786384169.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <8538eed11abe0c92b1a5b2830baf7a3f06ac698c.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:41:24 +0000
Message-Id: <20260810184125.3A2F61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [Medium] Starting the next descriptor in the error path fails to reset th=
e channel's retry counter and status.

Pre-existing issues:
- [Critical] Unconditional double-free of the active descriptor (`chan->des=
c`) during channel termination or resource cleanup.
- [Critical] Driver removal does not stop active DMA hardware, potentially =
leading to memory corruption.
- [High] Lack of synchronization between `sf_pdma_terminate_all` and channe=
l tasklets leads to Use-After-Free and NULL pointer dereferences.
- [High] Manual removal of the channel from the `dma_dev.channels` list per=
manently leaks dmaengine core resources on removal.
- [High] `sf_pdma_desc_residue` returns incorrect hardware residue for acti=
ve transfers.
--

--- Patch [28]: [PATCH v3 28/34] dmaengine: sf-pdma: route error callbacks =
through channel BH ---
commit 5c7ab16a62d08deb1ca0b90a739ae089b50989a2
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: sf-pdma: route error callbacks through channel BH

Complete failed descriptors through virt-dma with an aborted result and the
remaining transfer size, then start the next pending transfer. During
removal, kill the producer tasklets before the channel BH so they cannot
enqueue callback work after it has been canceled.

> diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
> --- a/drivers/dma/sf-pdma/sf-pdma.c
> +++ b/drivers/dma/sf-pdma/sf-pdma.c
[ ... ]
> @@ -329,7 +329,17 @@ static void sf_pdma_errbh_tasklet(struct tasklet_str=
uct *t)
>  	if (chan->retries <=3D 0) {
>  		/* fail to recover */
>  		spin_unlock_irqrestore(&chan->lock, flags);
> -		dmaengine_desc_get_callback_invoke(desc->async_tx, NULL);
> +
> +		spin_lock_irqsave(&chan->vchan.lock, flags);
> +		list_del(&desc->vdesc.node);

[Severity: High]
This is a pre-existing issue, but is there a lack of synchronization
between sf_pdma_terminate_all() and channel tasklets?

sf_pdma_terminate_all() frees chan->desc and sets it to NULL without
synchronizing with scheduled tasklets:

drivers/dma/sf-pdma/sf-pdma.c:sf_pdma_terminate_all() {
        ...
        kfree(chan->desc);
        chan->desc =3D NULL;
        ...
}

If it races with this tasklet, the pointer is cached before the lock
and the list node is modified here after it may have been freed.

Additionally, in sf_pdma_donebh_tasklet(), the pointer is dereferenced
unconditionally:

drivers/dma/sf-pdma/sf-pdma.c:sf_pdma_donebh_tasklet() {
        ...
        list_del(&chan->desc->vdesc.node);
        ...
}

Could this lead to use-after-free and NULL pointer dereferences?

> +		desc->vdesc.tx_result.result =3D DMA_TRANS_ABORTED;
> +		desc->vdesc.tx_result.residue =3D desc->xfer_size;
> +		vchan_cookie_complete(&desc->vdesc);
> +
> +		chan->desc =3D sf_pdma_get_first_pending_desc(chan);
> +		if (chan->desc)
> +			sf_pdma_xfer_desc(chan);

[Severity: Medium]
When starting the next descriptor in the error path, should the channel's
retry counter and status be reset?

If chan->retries remains <=3D 0, will the new transfer inherit the exhausted
retry state and bypass the retry logic completely if it encounters an error?

> +		spin_unlock_irqrestore(&chan->vchan.lock, flags);
>  	} else {
>  		/* retry */
>  		chan->retries--;
[ ... ]
> @@ -603,9 +613,9 @@ static void sf_pdma_remove(struct platform_device *pd=
ev)
>  		devm_free_irq(&pdev->dev, ch->txirq, ch);
>  		devm_free_irq(&pdev->dev, ch->errirq, ch);
>  		list_del(&ch->vchan.chan.device_node);

[Severity: High]
This is a pre-existing issue, but does manually removing the channel from
the list prevent the dmaengine core from cleaning up resources?

The dmaengine core iterates over the channels list to unregister sysfs
devices, free per-CPU memory, and release the IDA. Because the list is
emptied here, the core skips cleanup, which might leave dangling sysfs
nodes and IDAs that prevent driver reloads.

> -		dmaengine_kill_bh(&ch->vchan.chan);
>  		tasklet_kill(&ch->done_tasklet);
>  		tasklet_kill(&ch->err_tasklet);
> +		dmaengine_kill_bh(&ch->vchan.chan);
>  	}
> =20
>  	if (pdev->dev.of_node)

[Severity: Critical]
This is a pre-existing issue, but shouldn't driver removal stop active
DMA hardware to prevent memory corruption?

If a transfer is running when the driver is forcefully unbound, the
hardware DMA engine continues writing to memory. Since the software
stack is torn down and the client buffers may be freed, does this lack
of a call to disable the hardware requests or terminate channels allow
ongoing hardware DMA to corrupt arbitrary physical memory?


[Severity: Critical]
This is a pre-existing issue, but does this code cause a double-free
during channel termination?

drivers/dma/sf-pdma/sf-pdma.c:sf_pdma_terminate_all() {
        ...
        kfree(chan->desc);
        chan->desc =3D NULL;
        chan->xfer_err =3D false;
        vchan_get_all_descriptors(&chan->vchan, &head);
        ...
}

Because the descriptor is never removed from the desc_issued list, the
subsequent call to vchan_get_all_descriptors() collects this
already-freed descriptor. Then, vchan_dma_desc_free_list() invokes
sf_pdma_free_desc(), executing a second kfree() on the same memory.

The exact same double-free sequence also exists in
sf_pdma_free_chan_resources().


[Severity: High]
This is a pre-existing issue, but does sf_pdma_desc_residue() return
incorrect hardware residue for active transfers?

drivers/dma/sf-pdma/sf-pdma.c:sf_pdma_desc_residue() {
        ...
        list_for_each_entry(vd, &chan->vchan.desc_submitted, node)
        ...
            residue =3D readq(regs->residue);
        ...
}

This iterates only over chan->vchan.desc_submitted. Actively running
descriptors reside in desc_issued and are missed, resulting in a
return value of 0. Conversely, if a transfer is merely pending in
desc_submitted, it reads the live hardware residue register,
improperly assigning the actively running transfer's residue to a
pending transfer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D28
