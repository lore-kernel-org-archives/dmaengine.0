Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7055D4CDDE7
	for <dmaengine@vger.kernel.org>; Mon, 12 Oct 2026 21:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841810; cv=none; b=BWunfRR8iSyEgVz7+yDtVwEKqMlrGxLV+gwYBwcHy6kDcJFJSPSyfRfz5FqNWeLTB2IdqxbZCx4gmL1JU9gWECKEvBc4/p21AFCanV+vN5j1Mts0CUnGyoRV9se3OPMyiiDY9yBi/Yk/fYHcWcLrHtbalj1ZRhy89o5F2ls/mfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841810; c=relaxed/simple;
	bh=xq6QpuQT2t/1+iEkE5B12HRGkny0UdLPlQfkW03KTlw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=sCyb4vOe0AfqLDgDneL6HiYIC9ZrnaTyju30+zpom/1G69o8pCi/4M1fSMklKKFIczh3DWVRl2WsW/pVk+dfEGZCzxYl19Rx4/BVXWG3hdf5dbHboimy2X2cToV3Bbqln2ia4Ynomn+fqx+jeWLWQ1XL/+qWWcGSaBOlkMnQ2mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y9zexe/G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y9zexe/G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9449F1F0089B;
	Mon, 12 Oct 2026 21:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791841805;
	bh=7xm7Bva38mzhwb4nAKIL4kN8kKv5pNuSAXPqVIj3vy4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y9zexe/GoYPVUxmoou7Yyk7G7AOG5TAYrCu5Xx6kuYlnNhNPng6uXk7iw6pp/VR+a
	 q51lbqn9Ms3nyAsOiAAKf5nb0PtFYOiBsocS1O3QDsWy1n36MGg1YwB1HHWzzeJ+eL
	 jRVl2cv7usO8qFX2LyvrRqAe0P6maDCWcvF8XqQEzGBS0MuecJLOkFRLXgwaxLlSWK
	 nMMQYK7oNiUgxwSlIftzkCqgZO/lHwo6EDEj6xZm/lYYDKf6bgSyZobIOahCAJsXoQ
	 UjsgI0S6NrU15fImBFykhCjs915tIqth4f12LL7YpScJegPF1G6npx5Zhr/SHcOsDo
	 ciy7lkQHQCOwg==
Message-ID: <sashiko-outbox-168650@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] dmaengine: idxd: Fix error code handling in
 idxd_cdev_open()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vinicius Costa Gomes" <vinicius.gomes@intel.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261012-wt-idxd-fixes-v1-5-30a35a445077@intel.com>
References: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
 <20261012-wt-idxd-fixes-v1-5-30a35a445077@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 21:50:05 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] dmaengine: idxd: idxd_cdev_open() masks -ENOMEM from xa_insert()
- [High] dmaengine: stranded PASID xarray entry on shared FD close breaks f=
ault handling
- [Medium] dmaengine: idxd: missing idxd_wq_disable_pasid() rollback on ida=
_alloc() failure
--

commit 63ea0ebbf579eb846dc4486575508a710df270fc
Author: Vinicius Costa Gomes <vinicius.gomes@intel.com>

dmaengine: idxd: Fix error code handling in idxd_cdev_open()

idxd_cdev_open() mishandles rc on two error paths: on ida_alloc() failure,
it jumps to failed_ida without setting rc, returning 0. And when xa_insert()
returns -EBUSY, rc is left negative and can leak out. This commit fixes
both paths.

> diff --git a/drivers/dma/idxd/cdev.c b/drivers/dma/idxd/cdev.c
> index 82b07cf942ef8..abbab9bdd06c3 100644
> --- a/drivers/dma/idxd/cdev.c
> +++ b/drivers/dma/idxd/cdev.c
> @@ -264,8 +264,11 @@ static int idxd_cdev_open(struct inode *inode, struc=
t file *filp)
>  		mutex_lock(&wq->uc_lock);
>  		rc =3D xa_insert(&wq->upasid_xa, pasid, ctx, GFP_KERNEL);
>  		mutex_unlock(&wq->uc_lock);
> -		if (rc < 0)
> -			dev_warn(dev, "PASID entry already exist in xarray.\n");
> +		if (rc < 0) {
> +			/* An existing entry is harmless, warn and continue */
> +			dev_warn(dev, "PASID entry already exists in xarray.\n");
> +			rc =3D 0;
> +		}

[Severity: High]
Does this code unintentionally mask all negative return codes, including
-ENOMEM?

xa_insert() can return -ENOMEM if memory allocation fails. By unconditional=
ly
clearing all negative return codes (rc =3D 0), this allows the file open to
succeed without registering the user context in the xarray.

Later, when a subsequent hardware page fault occurs for this PASID,
idxd_copy_cr() will call xa_load(), fail to find the context, and silently
drop the completion record.

[Severity: High]
If a process opens multiple file descriptors to a shared IDXD workqueue,
does treating -EBUSY as harmless leave the second FD stranded when the first
FD is closed?

When the first open succeeds, the context is inserted into the upasid_xa
xarray. The second open fails the xa_insert with -EBUSY, which this code
explicitly treats as harmless and continues, leaving the first context in
the xarray.

However, when the process closes the first file descriptor,
idxd_xa_pasid_remove() successfully matches and removes the first context
from the xarray:

drivers/dma/idxd/cdev.c:idxd_xa_pasid_remove() {
	ptr =3D xa_cmpxchg(&wq->upasid_xa, ctx->pasid, ctx, NULL, GFP_KERNEL);
}

The second file descriptor remains open and active, but its PASID is no
longer mapped in the xarray. If a hardware fault occurs for this PASID,
idxd_copy_cr() will fail to find the context in the xarray, warn
'No user context', and silently drop the completion record.

> =20
>  		if (wq_dedicated(wq)) {
>  			rc =3D idxd_wq_set_pasid(wq, pasid);
> @@ -279,6 +282,7 @@ static int idxd_cdev_open(struct inode *inode, struct=
 file *filp)
>  	idxd_cdev =3D wq->idxd_cdev;
>  	ctx->id =3D ida_alloc(&file_ida, GFP_KERNEL);
>  	if (ctx->id < 0) {
> +		rc =3D ctx->id;
>  		dev_warn(dev, "ida alloc failure\n");
>  		goto failed_ida;
>  	}

[Severity: Medium]
Does the failed_ida error path leak the PASID hardware configuration?

During open(), if the WQ is dedicated, idxd_wq_set_pasid() programs the
hardware WQ with the calling process's PASID. If the subsequent ida_alloc()
fails, the error path (failed_ida) unbinds the PASID from the IOMMU and
removes it from the xarray:

drivers/dma/idxd/cdev.c:idxd_cdev_open() {
    ...
failed_ida:
failed_set_pasid:
	if (device_user_pasid_enabled(idxd))
		idxd_xa_pasid_remove(ctx);
failed_get_pasid:
	if (device_user_pasid_enabled(idxd) && !IS_ERR_OR_NULL(sva))
		iommu_sva_unbind_device(sva);
    ...
}

However, it fails to call idxd_wq_disable_pasid() to clear it from the
hardware WQ. This leaves the hardware WQ in the ENABLED state programmed
with a stale, unbound PASID.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-wt-idxd-fi=
xes-v1-0-30a35a445077@intel.com?part=3D5
