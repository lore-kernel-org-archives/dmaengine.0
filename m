Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A0740587A
	for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 07:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789110864; cv=none; b=qbowWArI5+e9KuYYPcCZsUAIqdf70/qe85ORXXSUzhRHJcpNlwuVFs4sHESYBBXoh3yKk0akSG2T4FaWCoHJ2BSBILC/zMLaL4k5dQ+A635+uPeRfKAehlf/WeW6AXdZCTU+UsI3CHC13rlUxxx+X1w2WwjnMny+bVDX1pLT1NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789110864; c=relaxed/simple;
	bh=8ksMOA1KfcMJ4IQLOu4NNPRNW1anQ3tSyACk8nssguk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s4ZNg9qiFT24GkyrcfvREweMUSHGjb7pP0SceUzzTUeMG1KNJ932kjrtGuLFaEaN5TQnUOeMlB150ThdZgbN+SXSKeodFtS3BrLddKDPHHLAz07k9tbKld+PADehyLk2mWttBBDt4XZm9UvQ9euSFicr1slo76Gl8XiZwYXNiQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJN5HnLO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJN5HnLO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4096C1F000FF;
	Fri, 11 Sep 2026 07:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789110853;
	bh=ypgtRqkeiBQKPdp0ySCBlqZXNI2UFKxoWqPCFoMWqSk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iJN5HnLOuf7xGLHzfV3ekqw46vAeaAFbCCwCuGckj7VPgAgOWXuHiD2NMoWTAifCL
	 r53+7CmZvrSARiYw9tOtmYVljEoMFgh16AyjjiCnlirh5aFqAzPQkPz6avBH08pDw7
	 gyBijIaxno6nDw0w0jdSC9WIM7BWDHmVdGWFaFm/0MiXQsCaDzYB1AcFok9C8OFeff
	 PrGnrMlOYYJL+GkuUOGqRZHW56/sT5tfaapvMOWLFt2xgvCWjfCufD3afIkaf1M7dh
	 kVaVFMgHk3w5YYUw0x0mUFgiV69/OY+xI7QKx927glzxOj+0xqc2p4gwseFQPegbQm
	 PCuNgNiNeOJvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: idxd: Fix use-after-free in idxd_remove
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Wml5b3UgV2FuZyAoTGVub3ZvKQ==?= <ziyou.dev@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260911065547.161522-1-ziyou.dev@gmail.com>
References: <20260911065547.161522-1-ziyou.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 07:14:12 +0000
Message-Id: <20260911071413.4096C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Pre-existing Use-After-Free and Double Free in the error path of `=
idxd_register_devices()` and `idxd_pci_probe_alloc()`.
- [High] Pre-existing double free and UAF of the IDXD device and its resour=
ces in `idxd_free()`.
- [High] Flawed `while (j--)` loop condition in device registration cleanup=
 paths causes an out-of-bounds array read on the first iteration failure, a=
nd skips unregistering elements on subsequent iteration failures.
- [Medium] Pre-existing memory leak of the `saved_engines` array in the err=
or paths of `idxd_device_config_save`.
--

commit cf8581894d15c4c8e08a44d0ae7b7e0a1a4eb54c
Author: Ziyou Wang (Lenovo) <ziyou.dev@gmail.com>

dmaengine: idxd: Fix use-after-free in idxd_remove

This commit fixes a use-after-free bug in the idxd driver unbind path
by taking reference counts on the wq, engine, and group devices before
unregistering them. It adds idxd_put_devices() to release these references
after all cleanup operations are complete.

> diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
> index 4b827a3297564..212efbfebacce 100644
> --- a/drivers/dma/idxd/init.c
> +++ b/drivers/dma/idxd/init.c

[ ... ]

[Severity: Medium]
This is a pre-existing issue, but does idxd_device_config_save() leak the
saved_engines array on error?

Looking at idxd_device_config_save() in drivers/dma/idxd/init.c:

	struct idxd_engine **saved_engines =3D
			kcalloc_node(idxd->max_engines,
				     sizeof(struct idxd_engine *),
				     GFP_KERNEL, dev_to_node(dev));

The saved_engines array is allocated without the __free(kfree) cleanup
attribute. If a memory allocation fails later in the function (for example,
when the device undergoes a reset and memory allocation fails), it jumps to
an error path that returns -ENOMEM.

The idxd_free_saved() function frees the individual structures via
idxd_free_saved_configs(), but assumes the arrays themselves are freed by t=
he
__free cleanup mechanism. Since saved_engines lacks this attribute, is its
memory permanently leaked here?


[Severity: High]
This is a pre-existing issue, but can idxd_free() trigger a double-free
and use-after-free?

Looking at idxd_free() in drivers/dma/idxd/init.c:

static void idxd_free(struct idxd_device *idxd)
{
	if (!idxd)
		return;

	put_device(idxd_confdev(idxd));
	bitmap_free(idxd->opcap_bmap);
	ida_free(&idxd_ida, idxd->id);
	kfree(idxd);
}

When idxd_free() is called on early probe error paths, it first calls
put_device(idxd_confdev(idxd)). This drops the device refcount to 0 and
triggers the idxd_conf_device_release() callback, which explicitly frees
internal structures, calls bitmap_free(idxd->opcap_bmap),
ida_free(&idxd_ida, idxd->id), and then kfree(idxd).

After put_device() returns, idxd_free() immediately repeats these exact
same cleanup steps on the now-freed idxd structure. Does this result in a
direct use-after-free and double-free?

> diff --git a/drivers/dma/idxd/sysfs.c b/drivers/dma/idxd/sysfs.c
> index 6d251095c350f..eca96a4dcecd8 100644
> --- a/drivers/dma/idxd/sysfs.c
> +++ b/drivers/dma/idxd/sysfs.c

[ ... ]

[Severity: High]
This is a pre-existing issue, but does idxd_register_devices() have a simil=
ar
use-after-free and double-free pattern in its error path?

Looking at idxd_register_devices() in drivers/dma/idxd/sysfs.c:

 err_group:
	for (i =3D 0; i < idxd->max_engines; i++)
		device_unregister(engine_confdev(idxd->engines[i]));
 err_engine:
	for (i =3D 0; i < idxd->max_wqs; i++)
		device_unregister(wq_confdev(idxd->wqs[i]));
 err_wq:
	device_del(idxd_confdev(idxd));

If device_add() fails in idxd_register_wq_devices() or subsequent steps,
this cleanup path calls device_unregister() on previously added engines and
WQs, freeing them. It then calls device_del(idxd_confdev(idxd)), which
unbinds the driver. This invokes idxd_device_drv_remove():

drivers/dma/idxd/device.c:idxd_device_drv_remove() {
	...
	for (i =3D 0; i < idxd->max_wqs; i++) {
		struct idxd_wq *wq =3D idxd->wqs[i];
		struct device *wq_dev =3D wq_confdev(wq);

		if (wq->state =3D=3D IDXD_WQ_DISABLED)
			continue;
	...
}

This loop blindly accesses the WQ states which have already been freed by
the sysfs registration error handler, causing a direct use-after-free.

Furthermore, after idxd_register_devices() returns an error,
idxd_pci_probe_alloc() in drivers/dma/idxd/init.c jumps to err_dev_register:

drivers/dma/idxd/init.c:idxd_pci_probe_alloc() {
	...
 err_dev_register:
	idxd_cleanup(idxd);
	...
}

Which eventually calls idxd_clean_wqs():

drivers/dma/idxd/init.c:idxd_clean_wqs() {
	...
	for (i =3D 0; i < idxd->max_wqs; i++) {
		conf_dev =3D wq_confdev(idxd->wqs[i]);
		put_device(conf_dev);
	}
	...
}

This blindly drops references on objects that were already freed in the
idxd_register_devices() rollback, triggering a double free.


[Severity: High]
This is a pre-existing issue, but do the registration error paths have an
out-of-bounds array read?

Looking at idxd_register_wq_devices() in drivers/dma/idxd/sysfs.c:

	while (j--) {
		wq =3D idxd->wqs[j];
		device_unregister(wq_confdev(wq));
	}

In idxd_register_wq_devices(), idxd_register_engine_devices(), and
idxd_register_group_devices(), the cleanup paths use j =3D i - 1 followed by
while (j--).

If device_add() fails on the very first element (i =3D 0), j becomes -1. The
while (j--) condition evaluates the current value -1 as true (non-zero) and
decrements j to -2. The loop body then accesses index -2 (for example,
idxd->wqs[-2]) and passes the out-of-bounds pointer to device_unregister().

Conversely, if it fails on the second element (i =3D 1), j becomes 0. The
loop evaluates 0 as false and never executes. Does this skip unregistering
and leak the successfully added element at index 0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911065547.1615=
22-1-ziyou.dev@gmail.com?part=3D1
