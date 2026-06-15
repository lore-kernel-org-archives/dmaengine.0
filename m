Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB88184524
	for <dmaengine@vger.kernel.org>; Mon, 15 Jun 2026 11:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781521359; cv=none; b=PkK6rYb6Z7bnX/0J1L2DF0osayMb2oe/tc38/grtY7iZcp13giWLQNfENzluO7NB74DVpPNhGPHth0pEKEKySuEkHqYLumzggg/jY0+fQi6XCCisvleWJ4QDedZlQ+OtP32an/VyNMRQPPRXFRlQT2zPCmeRANP3j9DvLPk68KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781521359; c=relaxed/simple;
	bh=lFkoC0PsWyTwZmumbefQgbEcukiImgXlLvlu/wY8reU=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=maI+JmUly+JgNU1qJ9LyNGki+/2Q05FobNR5HVHYIx67VHWH64leHKzJw1+UemDk4k1LAzmZJ5eKnhiQ/3qR/VFKxRNUULf5PKiUIluM04+M55QcWv3QCarhNz/TbP3SryQczb3AsRC6mTFIOEVaX3hBnBaUW5H5unPkB6zb3EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fw/YoOUr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fw/YoOUr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B301F000E9;
	Mon, 15 Jun 2026 11:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781521357;
	bh=3O8c5MGM9CPYzFb33YZB90vw/n+5RF+dB0l5nBBQX68=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=fw/YoOUrSu1GcRUjLMWElKfgf4vjFK4ZPnIseDZLqenFARFUH4lYtM+HEstNKWOAd
	 TQnjob0skjMVChSHmzjNUNph8LZVh2P29Yb0AjaX3GrVCXovbJ7xObd7rgVw1hkhKH
	 RrrJPCP/1jN++ba0QuBcV2eTjjCtAPz2buaP079J3BeZuZlWaD3auIy404N630BABf
	 iGziekpIaZHnSFGSynCt8SFPlQ9QP0yqfNHGXC0rjR3qLL/oIOxksevJgmE111GUUa
	 lwOL9A/t2pYrazYysEOqhcna4HpCF+YhxoVv559cqJECibxj+VdgW1dSwXq0fK7oHf
	 JFXeEuthPEnEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: idxd: fix use-after-free in idxd_free() and
 idxd_alloc() error paths
Reply-To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260615103932.61828-2-bogdan.codres@windriver.com>
References: <20260615103932.61828-2-bogdan.codres@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 11:02:36 +0000
Message-Id: <20260615110237.66B301F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unconditional call to `destroy_workqueue(idxd->wq)` in `idxd_conf_=
device_release()` causes a guaranteed kernel panic on early probe or alloca=
tion failures.
- [High] Late probe failures trigger sequential manual cleanup (`idxd_clean=
up_internals`) and `idxd_conf_device_release()`, resulting in massive doubl=
e-frees and a double-destroy of the workqueue.
- [High] Sub-component configuration and cleanup functions (`idxd_clean_wqs=
`, `idxd_clean_groups`, `idxd_clean_engines`) suffer from the exact same do=
uble-free anti-pattern that the patch intended to fix in the main device.
--

commit 14c25ba1a63a6d7ab71af3fd079660a9cd76f396
Author: Bogdan Codres <bogdan.codres@windriver.com>

dmaengine: idxd: fix use-after-free in idxd_free() and idxd_alloc() error p=
aths

This commit removes redundant cleanup calls in the error paths of idxd_alloc
and idxd_free. By relying on put_device to synchronously trigger the release
handler idxd_conf_device_release, which already frees these resources, it
prevents double-free scenarios during initialization failures.

> diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
> index f1cfc7790d950..e2b5fe072d4ac 100644
> --- a/drivers/dma/idxd/init.c
> +++ b/drivers/dma/idxd/init.c
[ ... ]
> @@ -601,15 +601,18 @@ static void idxd_read_caps(struct idxd_device *idxd)
[ ... ]
> +/*
> + * Release an idxd device that was allocated (device_initialize() was ca=
lled)
> + * but never successfully registered. put_device() drops the last refere=
nce and
> + * triggers idxd_conf_device_release() which frees all resources includi=
ng the
> + * ida, opcap_bmap, and the idxd structure itself.
> + */
>  static void idxd_free(struct idxd_device *idxd)
>  {
>  	if (!idxd)
>  		return;
> =20
>  	put_device(idxd_confdev(idxd));
> -	bitmap_free(idxd->opcap_bmap);
> -	ida_free(&idxd_ida, idxd->id);
> -	kfree(idxd);
>  }

[Severity: High]
This is a pre-existing issue, but does this same double-free pattern still
exist for late probe failures?

If idxd_probe() fails late in the initialization sequence, the error path
calls idxd_cleanup(), which delegates to idxd_cleanup_internals().

In drivers/dma/idxd/init.c:idxd_cleanup_internals():
    ...
    destroy_workqueue(idxd->wq);

The error path then falls through to idxd_free(), which calls put_device().
This triggers idxd_conf_device_release() in drivers/dma/idxd/sysfs.c, which
blindly executes destroy_workqueue(idxd->wq) and kfree() on internal arrays
a second time. Can this cause a double-destroy and memory corruption?

[Severity: High]
This isn't a bug introduced by this patch, but do the sub-component cleanup
functions suffer from the same double-free pattern?

Looking at idxd_clean_wqs() in drivers/dma/idxd/init.c:
    ...
    put_device(conf_dev);
    kfree(wq);

The put_device() call drops the reference to zero and invokes the release
handler idxd_conf_wq_release(), which already performs kfree(wq). Does
calling kfree(wq) immediately after put_device() result in a double-free?
Similar patterns appear to exist in idxd_clean_groups() and
idxd_clean_engines().

[ ... ]
> @@ -649,13 +652,16 @@ static struct idxd_device *idxd_alloc(struct pci_de=
v *pdev, struct idxd_driver_d
>  	return idxd;
> =20
>  err_name:
> +	/* device_initialize() was called, so put_device() will trigger
> +	 * idxd_conf_device_release() which frees ida, opcap_bmap, and idxd.
> +	 * Do not fall through to err_opcap/err_ida.
> +	 */
>  	put_device(conf_dev);
> -	bitmap_free(idxd->opcap_bmap);
> +	return NULL;

[Severity: High]
This is a pre-existing issue, but will this cause a NULL pointer dereference
during early failures?

If dev_set_name() fails, idxd->wq has not been allocated yet and remains NU=
LL.
The error path calls put_device(conf_dev) which invokes the release callbac=
k:

drivers/dma/idxd/sysfs.c:idxd_conf_device_release() {
    ...
    destroy_workqueue(idxd->wq);

Since the upstream kernel's destroy_workqueue() does not safely handle NULL
pointers, won't this unconditionally crash the system on early probe or
allocation failures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615103932.6182=
8-2-bogdan.codres@windriver.com?part=3D1
