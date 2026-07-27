Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423FF3E51E6
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186555; cv=none; b=PPyu5PEN3DD8aaaaFC0/IH4Pxy63F0SXbhwnmHBANo62JdGgR91MUH0JPYe0b0etXdXQgdBxzp08PhtFLkIgd/kE/rrRkVbDt0g9Br38DpZQPfUJjyU5NhUgOweyrT9SPbJ3NgPkDPaCw7oaWPv0fKbT76rFON2Hqw7F1MItQN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186555; c=relaxed/simple;
	bh=dcS/9zKOLN1i5SfcLcyG9+pezWc5Lps4kJDMU004w8Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MfTP45Pua3K9aHjZX3YERY2yl5y5tJdYGWXvBAOsd/+RersM94fk6np7u2eEm5eX2sC+/Hh/XbH0wZpC1yFm1khWLDHDAjNh73u4p+lvquq1hpuPzrOHEfHVBbOjl2Pfm2eIQuO1CXnLBn4R5RF+KeRyRx9vfmz5umUnce0eyCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T0PyDrkC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T0PyDrkC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC4BC1F000E9;
	Mon, 27 Jul 2026 21:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785186554;
	bh=HVD8nFo8iPhGSW/rdm6s6y2sVMDF5kKBO1ch4MUTAxI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T0PyDrkCx/ldfkMZdEkPKDU6s/OGdbazc6kgOdiaGh99w/uUSUAhTkB7rM4+HL0nf
	 Wh/M6fD1HEPOVDAmHVeJJyhz99bAUkBS3MQdCnuzDTR+S6DMV0llF2e63ZphD3qAkI
	 grPegdWd+y32BQv4meaOFtMLCPnWl+TZzzFdsizm5/vQ2/D/pkV3tsqNxf0GhO8FgB
	 a0Ba2oXsotJeHEio1tfUvll1t6d3owYuo9GmMd71z+/AsEsVYVxKEB7G2b4p+a2sP6
	 v9n81f2hgBRJ0a2NqxXl6tbRA3MRI9ZiG+GKJ+9fuewE/8Zxs6DvaX/fTycU84hAZ7
	 rm2g+keRrVWsg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 34/64] dmaengine: mtk-cqdma: kill vchan BH on
 teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <b0f12f19d5ad706bb5dcb26cb0e573d78ca22e2f.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <b0f12f19d5ad706bb5dcb26cb0e573d78ca22e2f.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:09:13 +0000
Message-Id: <20260727210913.DC4BC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect teardown order in mtk_cqdma_remove() allows physical cha=
nnel tasklets to reschedule virtual channel bottom halves after they have b=
een killed, leading to a use-after-free.
- [High] Manual removal of channels from the DMA device channel list via li=
st_del() before unregistration bypasses dmaengine cleanup, leaking memory a=
nd IDA indexes.
- [High] The DMA device is registered before physical channel tasklets and =
hardware are initialized, allowing early interrupts to schedule uninitializ=
ed tasklets.
--

--- Patch [34]: [PATCH v2 34/64] dmaengine: mtk-cqdma: kill vchan BH on tea=
rdown ---
commit 94dd78bb3e2fc0bc1ffe5fdde7322901f8e3ea2c
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: mtk-cqdma: kill vchan BH on teardown
   =20
This patch updates the virt-dma channel cleanup in the MediaTek CQDMA driver
to use the standard dma_chan_kill_bh() helper rather than directly calling
tasklet_kill().

> diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-=
cqdma.c
> index 80791e30aec24..3b0f1d8fa2055 100644
> --- a/drivers/dma/mediatek/mtk-cqdma.c
> +++ b/drivers/dma/mediatek/mtk-cqdma.c
> @@ -895,7 +895,7 @@ static void mtk_cqdma_remove(struct platform_device *=
pdev)
>  		vc =3D &cqdma->vc[i];
> =20
>  		list_del(&vc->vc.chan.device_node);

[Severity: High]
This isn't a bug introduced by this patch, but does calling list_del() here
cause a memory and IDA index leak?

By manually removing the channel from the dmaengine device list before call=
ing
dma_async_device_unregister(), the core subsystem's unregistration loop will
see an empty list.

This causes __dma_async_device_channel_unregister() to be skipped, which
means free_percpu(), sysfs cleanup, and ida_free() are never executed.

> -		tasklet_kill(&vc->vc.task);
> +		dma_chan_kill_bh(&vc->vc.chan);

[Severity: High]
This is a pre-existing issue, but does this teardown order leave a window f=
or
a use-after-free?

If a physical channel interrupt fires after dma_chan_kill_bh() is called but
before the hardware interrupts are disabled and tasklets are killed below,
the interrupt handler will schedule the physical channel tasklet.

This tasklet processes completions and calls vchan_cookie_complete(), which
re-queues the virtual channel bottom-half work. After mtk_cqdma_remove()
returns, devres frees the cqdma device, leaving the re-queued work item
referencing freed memory.

Would it be safer to disable physical interrupts and kill tasklets before
killing the virtual channel bottom halves?

>  	}
> =20
>  	/* disable interrupt */

[ ... ]

While reviewing this file, another pre-existing issue was noticed in
mtk_cqdma_probe():

[Severity: High]
This is a pre-existing issue, but is the DMA device registered before the
physical channel tasklets and hardware are fully initialized?

drivers/dma/mediatek/mtk-cqdma.c:mtk_cqdma_probe() {
    ...
    err =3D dma_async_device_register(dd);
    ...
    err =3D mtk_cqdma_hw_init(cqdma);
    ...
    for (i =3D 0; i < cqdma->dma_channels; ++i)
        tasklet_setup(&cqdma->pc[i]->tasklet, mtk_cqdma_tasklet_cb);
    ...
}

Once dma_async_device_register() is called, the controller is globally
visible. If a client probes asynchronously and immediately requests a chann=
el,
it could trigger an early interrupt before tasklet_setup() completes,
potentially dereferencing a NULL pointer for the uninitialized tasklet
callback.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D34
