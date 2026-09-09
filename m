Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F3D52FE41
	for <dmaengine@vger.kernel.org>; Wed,  9 Sep 2026 23:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788998303; cv=none; b=NORBP9QUsrMAkYN83NCKXUA7nyjWrGaQnMPY94zP6aSA8Qu2UtxByKJd5O/OL+qbT0vQwj09kCRZMjWoUsNqgqHRi4U1bFVh6DFXPC8NzsGyPhU6bxWXuRD+zvfWS8HQPA39L+5XIR5mUiCA4VhNo0majdmKWJ8+cXdzjh8f8kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788998303; c=relaxed/simple;
	bh=fjMEPwaWyyae5AxmG/fZnIMR0tbMMOqURXvO/JeAovk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uMk/kxMVg42mrVsEssH6QN6GYMLrE5uS/BXyuJnv5/bhov/QegRwGYklvGA8Yty6OXynMYkd/84K8/SmVxktAM8wMNoZpgSP3AHT0QRjZ6U1on8e5Gpjit1/oECEPeU5DylAifEF5DDoFvYUURMudXagh0+9pL4ov9P4tAnixSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VGzZ59QH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VGzZ59QH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2229B1F000FF;
	Wed,  9 Sep 2026 23:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788998301;
	bh=/aAMdqo+/YljsAjs3kwTntnaTwxw/jq6ZJZXtaVQZc0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VGzZ59QH6S50IJFqfeSlZ1CXsuLhljr1bxbJy304mTAI8/edAIlK92qUyegUtX6AY
	 xT2u8eTtZm146vwU1jFnpOJZoExTnwzIekDUdHjqWycvnTFWrl6PH01lHJhOnubqRz
	 qkQo4OSkj1KRIOvVQ2OSyFfpFj0vxohyzR1xLdcbFwbgqfxv4MwwxXqWvbx9wvxi5u
	 ssTS1vdiiGZ12289aqpPsoVw4cxvJeWoFVUakvbue1FdBILYp+XSII+QnzncwmgjLw
	 qQpc3Apewvw+pNJzYZj/Wz58yZIA7GbSpFrNyPuGaC/lsQlKaockfEedUhsC8YCs8E
	 ieaZOaDrbAPOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: mv_xor: kill tasklet on channel add error
 path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260909234601.101883-1-rosenp@gmail.com>
References: <20260909234601.101883-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 23:58:20 +0000
Message-Id: <20260909235821.2229B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] This problem wasn't introduced by this patch, but self-test ti=
meout error paths unmap and free DMA memory without terminating the active =
hardware transfer, risking memory corruption.
- [High] This problem wasn't introduced by this patch, but in `mv_xor_chann=
el_remove()`, the teardown order is incorrect (`dma_free_wc` is called befo=
re `free_irq`) and `tasklet_kill()` is entirely missing, leading to identic=
al tasklet leaks and use-after-free bugs as the one this patch fixed.
- [High] This problem wasn't introduced by this patch, but in `mv_xor_chann=
el_add()`, `request_irq()` is called and unmasked before spinlocks and list=
s are initialized, creating a severe race window that can crash the kernel.
- [High] This problem wasn't introduced by this patch, but the missing `.re=
move` callback in the platform driver leaks non-devres resources and causes=
 a use-after-free upon sysfs unbind.
--

commit dd96e71824475c1db94aac75b83a4f34179c56e7
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: mv_xor: kill tasklet on channel add error path

If request_irq() succeeds but a later step (self-test or device
registration) fails, the error path at err_free_irq frees the IRQ
but does not kill the tasklet.  A previously scheduled tasklet can
still run after the channel is freed, accessing freed memory.

Add tasklet_kill() after free_irq() on the error path.

Fixes: ff7b04796d98 ("dmaengine: DMA engine driver for Marvell XOR engine")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>

> diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
> index 25ed61f1b0899..24f22db5dfa11 100644
> --- a/drivers/dma/mv_xor.c
> +++ b/drivers/dma/mv_xor.c
> @@ -1162,6 +1162,7 @@ mv_xor_channel_add(struct mv_xor_device *xordev,
> =20
>  err_free_irq:
>  	free_irq(mv_chan->irq, mv_chan);
> +	tasklet_kill(&mv_chan->irq_tasklet);
>  err_free_dma:
>  	dma_free_wc(&pdev->dev, MV_XOR_POOL_SIZE,
>  			  mv_chan->dma_desc_pool_virt, mv_chan->dma_desc_pool);

drivers/dma/mv_xor.c:mv_xor_channel_remove() {
...
	dma_free_wc(dev, MV_XOR_POOL_SIZE,
			  mv_chan->dma_desc_pool_virt, mv_chan->dma_desc_pool);
...
	free_irq(mv_chan->irq, mv_chan);

	return 0;
}

[Severity: High]
This problem wasn't introduced by this patch, but in mv_xor_channel_remove(=
),
the teardown order is incorrect (dma_free_wc is called before free_irq) and
tasklet_kill() is entirely missing.

Since this patch fixes a similar issue in mv_xor_channel_add(), does
mv_xor_channel_remove() also need tasklet_kill() and reordered teardown to
avoid tasklet leaks and use-after-free bugs? If a tasklet is scheduled befo=
re
or during free_irq(), could it remain alive after mv_chan is freed by devre=
s,
leading to a use-after-free? Alternatively, if an interrupt fires after
dma_free_wc() but before free_irq(), will it access freed DMA descriptor
memory?

drivers/dma/mv_xor.c:mv_xor_channel_add() {
...
	ret =3D request_irq(mv_chan->irq, mv_xor_interrupt_handler,
			  0, dev_name(&pdev->dev), mv_chan);
	if (ret)
		goto err_free_dma;

	mv_chan_unmask_interrupts(mv_chan);
...
	spin_lock_init(&mv_chan->lock);
	INIT_LIST_HEAD(&mv_chan->chain);
	INIT_LIST_HEAD(&mv_chan->completed_slots);
...
}

[Severity: High]
This problem wasn't introduced by this patch, but in mv_xor_channel_add(),
request_irq() is called and unmasked before spinlocks and lists are
initialized.

Does this create a race window that can crash the kernel? If an interrupt
fires immediately upon being unmasked, could the interrupt handler schedule
the IRQ tasklet, which then attempts to acquire an uninitialized lock and
traverse uninitialized lists, resulting in a null pointer dereference or
kernel panic?

drivers/dma/mv_xor.c:
...
static struct platform_driver mv_xor_driver =3D {
	.probe		=3D mv_xor_probe,
	.suspend        =3D mv_xor_suspend,
	.resume         =3D mv_xor_resume,
	.driver		=3D {
...
}

[Severity: High]
This problem wasn't introduced by this patch, but does the missing .remove
callback in the platform driver leak non-devres resources and cause a
use-after-free upon sysfs unbind?

Unbinding the driver via sysfs causes devres_release_all() to free
devm-managed resources like mv_chan. However, explicitly allocated non-devr=
es
resources like request_irq(), dma_alloc_wc(), and dma_async_device_register=
()
are never released. If an interrupt fires later, will it dereference the
devres-freed mv_chan?

drivers/dma/mv_xor.c:mv_chan_memcpy_self_test() {
...
	if (mv_xor_status(dma_chan, cookie, NULL) !=3D
	    DMA_COMPLETE) {
		dev_err(dma_chan->device->dev,
			"Self-test copy timed out, disabling\n");
		err =3D -ENODEV;
		goto free_resources;
	}
...
free_resources:
	dmaengine_unmap_put(unmap);
	mv_xor_free_chan_resources(dma_chan);
out:
	kfree(src);
	kfree(dest);
...
}

[Severity: Critical]
This problem wasn't introduced by this patch, but do the self-test timeout
error paths unmap and free DMA memory without terminating the active hardwa=
re
transfer?

If the hardware was merely delayed, could it eventually complete the transf=
er
and perform DMA writes into the kfree'd memory? If this memory has been
reallocated to another subsystem, would this cause silent memory corruption?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909234601.1018=
83-1-rosenp@gmail.com?part=3D1
