Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29591D416C
	for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 00:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787186411; cv=none; b=fPVQul1zDe9vM0H/pXtogTe4jgephMnOJRyGChO+xGhVtO3rTDxzlDyYCIqPo91+dJ/crjAGU102iY5APOeksJj4JOcPXexW/b2FhMG9wUk70ZAuRFYi2dpzw79aJSMcM0TD+lLIKjQaulLwQIBmsPHxCU950EWFSTzVvFe0SRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787186411; c=relaxed/simple;
	bh=aHwkiP8j1e2M5GXt8jB5Ugf2b4EC4icK/EIIcRx35dQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vBWSaiA0CeP5T7rwzt8Fdcm/zQ2aES3gXbpHeHvMquqJlqli6jnnR6rZUj7Ef8e70+8A2brjdWsKqSLfauBg41oAkUR6fiU+XY8SNmY0USOkcKxk3G5/ufUZJw2VwnYnIlEDrH4ozKUYQvM3OQZSRUmIOkoXgBwRwjZwGPz+N68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cKtfM1t9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cKtfM1t9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C5961F000E9;
	Thu, 20 Aug 2026 00:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787186407;
	bh=fqPnGYdNHregBSEYpiLZ7P/t2LYdqsOwypTb+vc73YY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cKtfM1t9k8Q5Mv0r4mhOXLerOxCkNslroAr86UeGg5pwl27ZOZAxYNusaRwhTpl7+
	 Ugmg+9XYo9LuI+SsN0GZjBcKKKCfmqO9DlKaq/odqor/yPvoEoq/TEYh62/I1dBnV4
	 1teQ8WZ0+v9uyTBcs92CnOdOzdsjDnlzUiSBY9C+HsehP0zvRBIh0uUeFtmabYLbic
	 IBPfs1YXx9YDPOlosmedrDBEfnzUuNDoCHenYmYANaKzSFfNwVIJ2tmPRp6g+ElzVE
	 O48RN8mMQYkRoUJmoPE/8+83HP9lP9D70WqTxMAySe0nnHq8cnmlNZv0eup1EWNNa9
	 AttycWHrIdgww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: fsl_raid: fix sparse warnings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260820002816.17382-1-rosenp@gmail.com>
References: <20260820002816.17382-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 00:40:06 +0000
Message-Id: <20260820004007.1C5961F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete Endianness Fix
- [High] Use-After-Free / Resource Leak
- [High] Incorrect teardown ordering in `fsl_re_remove()`
- [High] Memory Corruption due to unconditional pop in `fsl_re_free_chan_re=
sources()`
- [High] Deadlock during client callback invocation
- [High] NULL Pointer Dereference on probe failure
- [Medium] Uninitialized DMA Memory Leak
--

--- Patch [1]: [PATCH] dmaengine: fsl_raid: fix sparse warnings ---
commit 736f7849012b086f7c1f995cc45ee838fbb53650
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: fsl_raid: fix sparse warnings

The register maps in fsl_raid.h annotate every field as __be32, but
they are accessed only through ioread32be()/iowrite32be(), which
already perform the byte swap and take plain u32 __iomem pointers.
The __be32 annotation therefore makes sparse reject each access.

Closes: https://lore.kernel.org/oe-kbuild-all/202608200637.ro1CqMxi-lkp@int=
el.com/

> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 99945845d8b5e..97103c84dd70b 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -334,7 +334,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dm=
a_genq(
>  	}
> =20
>  	desc =3D fsl_re_chan_alloc_desc(re_chan, flags);
> -	if (desc <=3D 0)
> +	if (!desc)

[Severity: Medium]
This is a pre-existing issue, but does this allocation leak uninitialized
kernel memory to the device?

Looking at fsl_re_chan_alloc_desc():

drivers/dma/fsl_raid.c:fsl_re_chan_alloc_desc() {
    ...
    cf =3D dma_pool_alloc(re_chan->re_dev->cf_desc_pool, GFP_NOWAIT, &paddr=
);
    ...
}

Since the compound frame descriptors are dynamically allocated without zero=
ing
(__GFP_ZERO), could the uninitialized dpi and trailing gfm array fields exp=
ose
kernel heap state to the device?

>  		return NULL;
> =20
>  	if (scf && (flags & DMA_PREP_CONTINUE)) {
> @@ -349,7 +349,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dm=
a_genq(
>  	cdb |=3D FSL_RE_INTR_ON_ERROR << FSL_RE_CDB_ERROR_SHIFT;
>  	cdb |=3D FSL_RE_DATA_DEP << FSL_RE_CDB_DEPEND_SHIFT;
>  	xor =3D desc->cdb_addr;
> -	xor->cdb32 =3D cdb;
> +	xor->cdb32 =3D cpu_to_be32(cdb);

[Severity: High]
This is a pre-existing issue, but does swapping only cdb32 here leave the
driver broken on little-endian platforms?

Looking at fill_cfd_frame() which is called shortly after:

drivers/dma/fsl_raid.c:fill_cfd_frame() {
    cf[index].efrl32 =3D efrl;
    cf[index].addr_high =3D upper_32_bits(addr);
    cf[index].addr_low =3D lower_32_bits(addr);
    ...
}

It appears native u32 values are still assigned to __be32 fields without
swapping. Will this incomplete endianness conversion cause issues on
little-endian hosts?

[ ... ]

[Severity: High]
This is a pre-existing issue, but does the driver leak the IRQ resource or
cause a use-after-free on unbind?

Looking at fsl_re_chan_probe():

drivers/dma/fsl_raid.c:fsl_re_chan_probe() {
    ...
    ret =3D request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);
    ...
}

The IRQ is requested here but appears to lack cleanup in error paths and the
remove function. Upon device unbind, could the IRQ remain active while the
channel structure is freed, leading to a use-after-free on the next interru=
pt?

[Severity: High]
This is a pre-existing issue, but does the teardown order in fsl_re_remove()
violate DMA engine lifecycle constraints?

Looking at fsl_re_remove():

drivers/dma/fsl_raid.c:fsl_re_remove() {
    ...
    for (i =3D 0; i < re_priv->total_chans; i++)
        fsl_re_remove_chan(re_priv->re_jrs[i]);

    dma_async_device_unregister(&re_priv->dma_dev);
    ...
}

Since it destroys channel resources before unregistering the DMA device, do=
es
this race condition permit concurrent client requests to operate on freed
memory?

[Severity: High]
This is a pre-existing issue, but can the loop in fsl_re_free_chan_resource=
s()
cause memory corruption?

Looking at fsl_re_free_chan_resources():

drivers/dma/fsl_raid.c:fsl_re_free_chan_resources() {
    ...
    while (re_chan->alloc_count--) {
        desc =3D list_first_entry(&re_chan->free_q, struct fsl_re_desc, nod=
e);
        list_del(&desc->node);
        ...
    }
    ...
}

The cleanup routine loops blindly based on alloc_count. If descriptors are
currently active or submitted, could free_q run out early and cause
list_first_entry() to pop invalid pointers?

[Severity: High]
This is a pre-existing issue, but could fsl_re_dequeue() deadlock during cl=
ient
callback invocation?

Looking at fsl_re_dequeue():

drivers/dma/fsl_raid.c:fsl_re_dequeue() {
    spin_lock_irqsave(&re_chan->desc_lock, flags);
    ...
    if (found) {
        fsl_re_desc_done(desc);
    ...
}

The client callback is triggered while a non-recursive spinlock is held. Wi=
ll
this self-deadlock if the callback immediately submits a new transaction?

[Severity: High]
This is a pre-existing issue, but does fsl_re_probe() risk a NULL pointer
dereference on probe failure?

Looking at fsl_re_probe():

drivers/dma/fsl_raid.c:fsl_re_probe() {
    ...
    if (rc) {
        fsl_re_chan_probe(ofdev, child, ridx++, off);
        re_priv->total_chans++;
    ...
}

Since the return code of fsl_re_chan_probe() is ignored and total_chans is
incremented unconditionally, will failed channel allocations leave re_jrs[q]
as NULL, causing them to be blindly dereferenced on module removal?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820002816.1738=
2-1-rosenp@gmail.com?part=3D1
