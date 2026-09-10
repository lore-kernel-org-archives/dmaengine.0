Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7B141DE08
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 08:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028014; cv=none; b=UfUToZkM7DQB4duukw39yjLy7KDGFH3nox9QAOHb6oX4Ffuo+NhgxqiUvb6LxwaoYU0vKV22EjIni5wYzJINLco90mAO/Ex/lLKyYPYzg13HFOVlQziGJ4YhQ3PzUAPwMdEQCKv7G9cxRgba+5ZEz9tC66CKvwNfW13rMkVFTTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028014; c=relaxed/simple;
	bh=Uia/JMsUlincTOCsC7woz3jawmOsAgSHscCVbaSrgs0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pYKMBxjGckStEi+t2eBdrB7OzU94veXX3HPlYDSvekupg4tUd5edn1tluJhDkA2QAgJ0vOkvQZlEah8ik27uN7q5A6eA5eni1new1GlMyF3JWUlKeq4HpUmRxmClkuUaLbDpvUcw1oztaC41rRYsCyaISg+tHmqFFqsyGpsEk/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oYSEZ63O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oYSEZ63O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB8F61F000FF;
	Thu, 10 Sep 2026 08:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789028008;
	bh=9PHBk24dvzbAKIgspmUT5IJ+fva0WCs6bR4sqvyOz5g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oYSEZ63O6yJmn5WGUpiSEaZ/qq+WswCm6EGsHnB8ngpSjLn2oWIq1+dNngtlCBG9d
	 /lk8X2fcI8yzv0SJpuYU2YE09BuBDdNal8RDp+J0Wl8vRU5Lkey6w9xkpRev1HnTI0
	 OtwGww9zl0yRyAO5c9a5dchhAoRhHZJAvMBgdj+ED0O7nmiJA3NgmQGQodkApY4Zxp
	 nBo9EA6KtD/R3cKfpnchCgZjiwUeAuTINCZpmwcntAHv706sxuKWkLl8Ssex2qewA/
	 6eIz84x1Iy16uc+5/LIwM724BFaajl2XXPYQoT8WFzYq3wsPtUjvhCfzev1IjZeVvt
	 P7T4LHOr824hw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: idxd: Free the minor number when cdev setup
 fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "SeungUk Nam" <tmddnr49449@gmail.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260910074832.15729-1-tmddnr49449@gmail.com>
References: <20260910074832.15729-1-tmddnr49449@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 08:13:27 +0000
Message-Id: <20260910081327.BB8F61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Preexisting Use-After-Free of the `wq` structure when the device i=
s unbound while userspace holds the cdev open.
- [High] Concurrent open() during device teardown or initialization failure=
 causes a NULL pointer dereference (TOCTOU).
--

commit dcf7a1148089e42b5600f7c8fd58bdaab680d5cb
Author: SeungUk Nam <tmddnr49449@gmail.com>
Subject: dmaengine: idxd: Free the minor number when cdev setup fails

idxd_wq_add_cdev() allocates a minor number from cdev_ctx->minor_ida for
the new struct idxd_cdev. When dev_set_name() or cdev_device_add() fails,
the minor number is never returned to the ida. This patch frees the minor
number before put_device() drops the last reference on that path.

> diff --git a/drivers/dma/idxd/cdev.c b/drivers/dma/idxd/cdev.c
> index 82b07cf942ef8..f1af7f0d25d34 100644
> --- a/drivers/dma/idxd/cdev.c
> +++ b/drivers/dma/idxd/cdev.c
> @@ -573,6 +573,7 @@ int idxd_wq_add_cdev(struct idxd_wq *wq)
>  	return 0;
> =20
>   err:
> +	ida_free(&cdev_ctx->minor_ida, minor);
>  	put_device(dev);
>  	wq->idxd_cdev =3D NULL;

[Severity: High]
This is a pre-existing issue, but can this lead to a NULL pointer dereferen=
ce
during a concurrent open()?

A TOCTOU race condition exists between idxd_cdev_open() and device teardown=
 or
initialization failure. When cdev_device_add() successfully exposes the cdev
but then encounters an error, a racing open() call gets a reference to the
cdev and calls idxd_cdev_open(). The open() thread sleeps on
mutex_lock(&wq->wq_lock) because the initialization failure thread holds it.

The initialization failure thread then sets wq->idxd_cdev =3D NULL here and
drops the mutex. The open() thread wakes up, fetches the NULL idxd_cdev, and
passes it to the cdev_dev() macro:

idxd_cdev_open() {
    ...
    idxd_cdev =3D wq->idxd_cdev;
    ...
    fdev->parent =3D cdev_dev(idxd_cdev);
    ...
    rc =3D device_add(fdev);

This invalid pointer is assigned to fdev->parent, which is subsequently
dereferenced in device_add() via get_device(fdev->parent).


[Severity: High]
This is also a pre-existing issue, but does this missing reference manageme=
nt
cause a Use-After-Free of the wq structure?

When userspace opens the cdev, idxd_cdev_open() fetches the wq and incremen=
ts
its client_count via idxd_wq_get(wq), but fails to take a kobject reference=
 on
the device (e.g., get_device(&wq->idxd_dev.conf_dev)).

Later, if the device is unbound (e.g., via sysfs or hot-unplug), the device=
 is
unregistered and the wq structure is freed. Since the cdev file descriptor =
is
still open, when userspace eventually closes it, idxd_cdev_release() blindly
dereferences the freed wq pointer:

idxd_cdev_release() {
    ...
    struct idxd_wq *wq =3D ctx->wq;
    struct idxd_device *idxd =3D wq->idxd;
    struct device *dev =3D &idxd->pdev->dev;

>  	return rc;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910074832.1572=
9-1-tmddnr49449@gmail.com?part=3D1
