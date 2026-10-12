Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2424F55AC
	for <dmaengine@vger.kernel.org>; Mon, 12 Oct 2026 21:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841663; cv=none; b=uRIzYrKhNho0txRhOXUdx6Hu7aYPoyZWC5LEscBIjmbDrWaxhjcmZXIafZGJ+TheRZQJkRVT1ZNQurRQlukvBVmqSF5J4hJbcqRU3hLu7DOad46hANI7NyS/OAPbZHuf1t/qeMWqoRHP2jfV8U8oqGhI0nmLLjCXUQJkZ1fe0Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841663; c=relaxed/simple;
	bh=lBH3oFtyn/BbgiFbWgObG96hpQjWTISUXyw20kjYifo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=XLvzL44YcbVvLXfM5NxuGVtaVRlPlrPPiYMI4fDPn3kOwtFdtfPdPdNlLezPdaIxbqIu3jJszTeXYWmz7YoxXvRfWShWO7RbTrw+NCnnmVIifLuptWkM/NOg5yKA9kddDAyp/rgBcm1gQ3BhwGOn7ZUB5JtrW8pM5yaH75HwLp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LRQQZL/A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LRQQZL/A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE091F0089B;
	Mon, 12 Oct 2026 21:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791841660;
	bh=otz0mIyXt/8XHgzy/FhPEF7kVxowmrEt7N/7uOmuE7M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LRQQZL/AAYiVtHLQxg16o4+kx6zr60Qr7HDRw6e/eHGpEapK0oaoSahaIB/HYumaU
	 bXi2sFQrzNFJYQR5ElApKDLDfnv6L5af5XIeCA21E0RWTkzwZ1S8swKp3WsifVkolv
	 MKBVrRRFKFpNE95NMfmKMArTvQQXY3gCeOlQ5+RUu8EaMhLP9kKvSX3hrheXzVs9Au
	 iPXvcrmkmz22tm0H56Rk/hnrakNNaMaRH5YlcTuvB3bt5twnXwfePMizYcS4ScEkrC
	 Af8mCyWETCtqU/C5fy0JG8G/qgiHaXk2i79oQN/zUyfHtEZQP055DDfyhj04kiW31z
	 txLAqQHDHp4NQ==
Message-ID: <sashiko-outbox-168646@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] dmaengine: idxd: Fix unwind bounds in device
 registration error paths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vinicius Costa Gomes" <vinicius.gomes@intel.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261012-wt-idxd-fixes-v1-4-30a35a445077@intel.com>
References: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
 <20261012-wt-idxd-fixes-v1-4-30a35a445077@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 21:47:39 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dmaengine: idxd: UAF/double-free on device registration failure
--

commit 571be93356be3fdc63d0506588c4e560e5d9eccc
Author: Vinicius Costa Gomes <vinicius.gomes@intel.com>

dmaengine: idxd: Fix unwind bounds in device registration error paths

When registering the per-idxd wq, engine, or group devices, a failure partw=
ay
through must roll back exactly the devices already added. This commit fixes
an underflow loop by starting the rollback at i instead of i - 1.

> diff --git a/drivers/dma/idxd/sysfs.c b/drivers/dma/idxd/sysfs.c
> index d5ffc641c8567..e828292e5fb88 100644
> --- a/drivers/dma/idxd/sysfs.c
> +++ b/drivers/dma/idxd/sysfs.c
> @@ -1876,7 +1876,7 @@ static int idxd_register_engine_devices(struct idxd=
_device *idxd)
>  	return 0;
> =20
>  cleanup:
> -	j =3D i - 1;
> +	j =3D i;
>  	for (; i < idxd->max_engines; i++) {
>  		engine =3D idxd->engines[i];
>  		put_device(engine_confdev(engine));

[Severity: High]
Does this error handling sequence lead to a double-free of the child device=
s?

If device registration fails partway, this local cleanup path drops the ref=
counts
on the child device kobjects via put_device() and device_unregister(), which
frees them.

The failure then cascades up to idxd_register_devices(), which rolls back
previously registered child devices (like WQs), also freeing them. Cruciall=
y,
the pointers in idxd->engines and idxd->wqs are left dangling.

Then, the error is returned to idxd_pci_probe_alloc(), which unwinds by jum=
ping
to err_dev_register and explicitly calling idxd_cleanup():

drivers/dma/idxd/init.c:idxd_pci_probe_alloc() {
    ...
	rc =3D idxd_register_devices(idxd);
	if (rc) {
		dev_err(dev, "IDXD sysfs setup failed\n");
		goto err_dev_register;
	}
    ...
 err_dev_register:
	idxd_cleanup(idxd);
    ...
}

idxd_cleanup() invokes idxd_cleanup_internals(), which iterates over the ar=
rays
via idxd_clean_engines() and calls put_device() again on the dangling point=
ers:

drivers/dma/idxd/init.c:idxd_clean_engines() {
	for (i =3D 0; i < idxd->max_engines; i++) {
		conf_dev =3D engine_confdev(idxd->engines[i]);
		put_device(conf_dev);
	}
}

Could this secondary cleanup access the freed device pointer and execute a
double-put, causing a use-after-free?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-wt-idxd-fi=
xes-v1-0-30a35a445077@intel.com?part=3D4
