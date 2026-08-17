Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416E023D7CE
	for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 02:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786932472; cv=none; b=jk3gmjAl18ym7Ly1NRodyenLw2bnGJFozcMtLphD0lLznEKp8UHlfPKim7eFL9YcNSJvoXTHcYZ6k3ZcmGYDuEF8SNGDPhNl11uMbmFAserp1OaWApkGp7VzRsAc98kBa18jUtqbgdOT4JytSiPjU1EelvRvMg8NXiZsdt9Jbco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786932472; c=relaxed/simple;
	bh=C8huVUTwS5qilegYgTrq63fYz6w9Qv8XAa2NnsBgL2U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QQCClYB1aEnNXJpwwUy5JkKLZ2aNRuNLTQUC5268xUXRAmUNmQy5FRsYZH6nrONNBiY2HSKJl+ONlSGIwVh01qET0N4vpX9a4gO9L0oPewV37/uN56iPtZ826B1EPeQeJTI66M34rpmk8Sfl7+omTN1XheznNB97Emx12VK7asY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qv/t30UT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qv/t30UT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9C41F000E9;
	Mon, 17 Aug 2026 02:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786932470;
	bh=UjODMVrcDz2rWAL56Q1yCAJtNrugtgeQrYwZfRjlH0M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qv/t30UT0k8XUGh9OA7/yXg9I1cpvoc07YE5kAl+VB/o+3Jt4CRq3x3eT0GO+k3f/
	 xG+BGlBPMGzwcB6cbsU3m1LIsdl/o4I58eowsIcabDhn7lYI4TZ5GPRDJUEbGUs9g8
	 I6sPCvEICcGK9IuW4yTq8LdY9G8PxGQuBnWDR1vds3vSxKIwIPBAEpfyeOiODAGSxS
	 TLRdQvEJpZtYfoOv8DxRRBmBZ2zVedU2S77h6+jZkZDjmkzdaVST7I+pPjuVwF/UkA
	 SPmO6p4xF70TIYN1fOo2zioYn+XUoUQnTzylH27FW2ItSvaJRoHmXOWkbXd0WXFHvL
	 BQv3AW3fsX/KA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: bestcomm: set bcom_eng to NULL on probe
 failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260817015442.136038-1-rosenp@gmail.com>
References: <20260817015442.136038-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 02:07:50 +0000
Message-Id: <20260817020750.9D9C41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Mismatch between request_mem_region() and release_mem_region() siz=
es causes a permanent resource leak.
- [High] The global pointer `bcom_eng` is published before its fields are i=
nitialized, creating a race condition where concurrent API calls can use un=
initialized state. The error path also has a Use-After-Free window.
- [High] Missing `IS_ERR` check for `rh_create()` return value causes a ker=
nel panic on failure.
- [High] SRAM memory allocated for microcode descriptors is leaked when a t=
ask is freed.
- [Medium] The `stop` field used to track task allocation is cleared withou=
t holding the required lock, causing a data race and potential premature re=
allocation.
--

--- Patch [1]: [PATCH] dmaengine: bestcomm: set bcom_eng to NULL on probe f=
ailure ---
commit 92a145656e579b67978a7c55621b1c807ffdc1c7
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: bestcomm: set bcom_eng to NULL on probe failure

Functions like bcom_task_alloc() use if (!bcom_eng) as a safety readiness
check. If the probe fails and hits this error path, subsequent or
concurrent API calls will bypass the check and dereference the freed memory.

> diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestc=
omm.c
> --- a/drivers/dma/bestcomm/bestcomm.c
> +++ b/drivers/dma/bestcomm/bestcomm.c
[ ... ]
> @@ -445,6 +445,7 @@ static int mpc52xx_bcom_probe(struct platform_device =
*op)
>  	release_mem_region(res_bcom.start, sizeof(struct mpc52xx_sdma));

[Severity: High]
This is a pre-existing issue, but does this mismatch in size during release
cause a permanent resource leak?

The memory region is requested earlier in mpc52xx_bcom_probe() using the
device tree node size:

    if (!request_mem_region(res_bcom.start, resource_size(&res_bcom),
                            DRIVER_NAME)) {

However, the error path above attempts to release the region using a fixed
compile-time size: sizeof(struct mpc52xx_sdma). Since __release_region()
strictly verifies the boundaries of the requested resource, if these sizes
differ, the check fails and the I/O memory region is never freed. Driver
unbinding in mpc52xx_bcom_remove() also uses this same fixed size.

>  error_sramclean:
>  	kfree(bcom_eng);
> +	bcom_eng =3D NULL;

[Severity: High]
This is a pre-existing issue, but by assigning bcom_eng early, do we expose
uninitialized state to concurrent accessors?

In mpc52xx_bcom_probe(), the global pointer is published immediately after
allocation:

    bcom_eng =3D kzalloc_obj(struct bcom_engine);
    if (!bcom_eng) {

Concurrent API calls like bcom_task_alloc() rely on the pointer not being
NULL as a safety check:

    if (!bcom_eng)
        return NULL;
    spin_lock(&bcom_eng->lock);

Because the pointer is published before bcom_engine_init() sets up the lock
and structures, a concurrent client could dereference uninitialized fields.
While adding bcom_eng =3D NULL closes the use-after-free window during
cleanup, the early publication race still exists.

>  	bcom_sram_cleanup();
>  error_ofput:
>  	of_node_put(op->dev.of_node);


[Severity: High]
This is a pre-existing issue, but is there a missing check for an error
pointer from rh_create() that could cause a kernel panic?

In drivers/dma/bestcomm/sram.c:bcom_sram_init(), the result of rh_create()
is directly used without validation:

    /* Create an rheap (defaults to 32 bits word alignment) */
    bcom_sram->rh =3D rh_create(4);

    /* Attach the free zones */
    regaddr_p =3D NULL;
    psize =3D 0;

    if (!regaddr_p || !psize) {
        /* Attach the whole zone */
        rh_attach_region(bcom_sram->rh, 0, bcom_sram->size);

If memory allocation fails under pressure, rh_create() returns
ERR_PTR(-ENOMEM). Passing this directly to rh_attach_region() will cause
a crash when it accesses internal fields.


[Severity: Medium]
This is a pre-existing issue, but does locklessly clearing the stop marker
create a data race and risk premature reallocation?

In drivers/dma/bestcomm/bestcomm.c:bcom_task_free(), the task marker state
is cleared without holding the required lock:

    /* Clear TDT */
    bcom_eng->tdt[tsk->tasknum].start =3D 0;
    bcom_eng->tdt[tsk->tasknum].stop  =3D 0;

The same happens on the allocation error path in bcom_task_alloc():

    bcom_eng->tdt[tasknum].stop =3D 0;

Since bcom_task_alloc() enforces a lock to safely locate free tasks, if
stop is cleared locklessly before task teardown completes, a concurrent
allocator might identify the task as available and reallocate it while
resources are still being freed.


[Severity: High]
This is a pre-existing issue, but does freeing a task leak the dynamically
allocated SRAM used for microcode image descriptors?

When loading an image, drivers/dma/bestcomm/bestcomm.c:bcom_load_image()
dynamically allocates SRAM and tracks it via tdt->start:

    desc =3D bcom_sram_alloc(hdr->desc_size * sizeof(u32), 4, &start_pa);
    if (!desc)
        return -ENOMEM;

    tdt->start =3D start_pa;

However, when the task is torn down, bcom_task_free() simply discards this
physical address without freeing the block:

    /* Clear TDT */
    bcom_eng->tdt[tsk->tasknum].start =3D 0;
    bcom_eng->tdt[tsk->tasknum].stop  =3D 0;

Because SRAM is extremely limited on the MPC5200, repeatedly bringing a
network interface up and down could exhaust SRAM and break bestcomm
functionality. Should bcom_sram_free() be called here before zeroing the
marker?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817015442.1360=
38-1-rosenp@gmail.com?part=3D1
