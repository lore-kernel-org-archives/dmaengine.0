Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AF02C0261
	for <dmaengine@vger.kernel.org>; Sat,  8 Aug 2026 10:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786183422; cv=none; b=uhoPrUZqBk2kdryu7iUVPUx/O+KfwwD647Xz1wmiA+PlFutyV5TJfXHLzK7fElYTz9QNtdajRPro9q/C+8GiQ/XsmtqbmfGTIKPqN90GSudu/Z/ptXCUTRGG1hVZyewWFg6E4iFnB3iLs73TEOCB2Vs7o95b3Ubrwogx1O3Vo2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786183422; c=relaxed/simple;
	bh=etFjqskW8TPIDZMFHuD4tnvmA6wow1VUe1k1VIVdBW0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ScGVCdOf70AoPo4sGFAn9F6su2+ezjSFlZlupVvUigs6w5ceZSJKUCpF7ZhxVdOioJTwjJvMoi5aGEyshT5Bi9mbeBA4lvrXY5JxtiAmNJJoTZN/qGs7ixyz97pCoZn0V5rHffTiIn848TxWAkfKvFKfl1QRB95Uh52AZ2xwNeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MIi6a0SJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MIi6a0SJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B781F000E9;
	Sat,  8 Aug 2026 10:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786183421;
	bh=YR4KCkZ8GaCg3lGwUyMMnTXJQEa77FuvvO33Lvy2ZwA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MIi6a0SJkRJAc2r4y742hXTgB8uiMnFbiIJ3+w4jko8UFdOIOP+mr/L6LUrHsp1r3
	 MW92iWa+4TUULmt8YqKGORc4FTGtdRkMfrvPxyuILdcvUDstO43+h2iQyCstT6adzj
	 a6v/ocG9rRdQTl4utcD9jJjB4XOAVaTpMS+zE6hOHu0Td3SxWV+QB8qkqU9gy5qCKy
	 O8gA4ld7ZJjFyMna2KZ9RKxIL+M/M0C4MiylnUObGzhik9Y6Co6/OydWwun6BcAoVL
	 Udqot2rsC6//2CB07IEnK+A6tIozDcgI0SO3ufh4VB+fVuplrYq7c8b7np4jpwo+5h
	 2H3a89M+ipkGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: pl330: fix autosuspend cleanup during
 removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260808094452.2752443-1-lgs201920130244@gmail.com>
References: <20260808094452.2752443-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 10:03:40 +0000
Message-Id: <20260808100340.B4B781F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The IRQ handler accesses hardware registers unconditionally withou=
t checking if the device is active, risking a kernel panic during suspend.
- [High] Dynamically allocated `dma_pl330_desc` descriptors in the `desc_po=
ol` are leaked when the driver unbinds.
- [High] The `peripherals` array allocated in `pl330_probe()` is never free=
d during device removal, causing a memory leak.
- [High] A debugfs file is created in the debugfs root but never removed, l=
eading to a Use-After-Free upon unbind.
- [High] The IRQ handler is registered before the driver's synchronization =
primitives and tasklets are initialized, risking a kernel panic.
- [High] Casting an offset byte array pointer to `__le32 *` and dereferenci=
ng it causes an unaligned memory access.
--

--- Patch [1]: [PATCH] dmaengine: pl330: fix autosuspend cleanup during rem=
oval ---
commit e8b4012da1e87845c5bb71ff8b0d6b5e60fae048
Author: Guangshuo Li <lgs201920130244@gmail.com>

dmaengine: pl330: fix autosuspend cleanup during removal

pl330_probe() calls pm_runtime_use_autosuspend(), but pl330_remove()
does not call the matching pm_runtime_dont_use_autosuspend() when
removing the device. If the autosuspend delay is set to a negative value
while autosuspend is enabled, the runtime PM core increments usage_count
to prevent runtime suspend.

Cc: stable@vger.kernel.org

> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index 25ba84b187041..8baadd1047193 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@ -3204,6 +3204,7 @@ static void pl330_remove(struct amba_device *adev)
>  	struct dma_pl330_chan *pch, *_p;
>  	int i, irq;
> =20
> +	pm_runtime_dont_use_autosuspend(&adev->dev);
>  	pm_runtime_get_noresume(pl330->ddma.dev);
> =20
>  	if (adev->dev.of_node)

[Severity: High]
This isn't a bug introduced by this patch, but does the IRQ handler access
hardware registers unconditionally without checking if the device is active?

drivers/dma/pl330.c:pl330_irq_handler() {
    if (pl330_update(data))
        return IRQ_HANDLED;
    ...
}

drivers/dma/pl330.c:pl330_update() {
    ...
    val =3D readl(regs + FSM) & 0x1;
    ...
}

If a spurious interrupt occurs or an interrupt is in-flight while the devic=
e is
runtime suspended, pl330_update() unconditionally reads the FSM register. S=
ince
the device clock is disabled during suspend, could accessing unclocked regi=
sters
result in an asynchronous bus fault on ARM architectures, leading to a syst=
em
crash?

[Severity: High]
This is a pre-existing issue, but are the dynamically allocated dma_pl330_d=
esc
descriptors in the desc_pool leaked when the driver unbinds?

drivers/dma/pl330.c:add_desc() {
    ...
    desc =3D kzalloc_objs(*desc, count, flg);
    ...
}

During probe and normal operation, add_desc() dynamically allocates batches
of descriptors. However, the driver's teardown functions pl330_remove() and
pl330_del() completely fail to iterate over the desc_pool or the channel li=
sts
to free these dynamically allocated descriptors:

drivers/dma/pl330.c:pl330_del() {
    ...
    dmac_free_threads(pl330);
    dma_free_attrs(pl330->ddma.dev, ...);
}

Does this cause a permanent memory leak of all descriptors each time the de=
vice
is unbound?

[Severity: High]
This is a pre-existing issue, but is the peripherals array leaked during
device removal?

drivers/dma/pl330.c:pl330_probe() {
    ...
    pl330->peripherals =3D kzalloc_objs(*pch, num_chan);
    if (!pl330->peripherals) {
    ...
}

In pl330_probe(), memory for the pl330->peripherals array is dynamically
allocated using kzalloc_objs(). However, neither the teardown loop in
pl330_remove() nor the cleanup function pl330_del() calls
kfree(pl330->peripherals).

Since the allocation is not managed via devres, is the array permanently le=
aked
upon driver unbind?

[Severity: High]
This is a pre-existing issue, but does a debugfs file creation lead to a
Use-After-Free upon unbind?

drivers/dma/pl330.c:init_pl330_debugfs() {
    debugfs_create_file(dev_name(pl330->ddma.dev),
                        S_IFREG | 0444, NULL, pl330,
                        &pl330_debugfs_fops);
}

The debugfs file is created in the debugfs root but never removed during
pl330_remove(). When the device unbinds, devres frees the pl330 struct, but
the debugfs file remains.

If userspace reads the file afterwards, does it trigger a Use-After-Free ke=
rnel
panic?

[Severity: High]
This is a pre-existing issue, but is the IRQ handler registered before the
driver's synchronization primitives and tasklets are initialized?

drivers/dma/pl330.c:pl330_probe() {
    ...
    ret =3D devm_request_irq(&adev->dev, irq, pl330_irq_handler, 0,
                           dev_name(&adev->dev), pl330);
    ...
    ret =3D pl330_add(pl330);
    ...
}

The hardware is taken out of reset and its IRQ is immediately requested.
However, the driver's primary spinlock and tasklet are not initialized until
pl330_add() runs later in the probe sequence:

drivers/dma/pl330.c:pl330_add() {
    ...
    spin_lock_init(&pl330->lock);
    ...
}

If an interrupt fires during this window (e.g., a pending interrupt from be=
fore
kexec), pl330_irq_handler() will lock an uninitialized spinlock and schedul=
e an
uninitialized tasklet. Does this risk a kernel panic?

[Severity: High]
This is a pre-existing issue, but does casting an offset byte array pointer
to __le32 * and dereferencing it cause an unaligned memory access?

drivers/dma/pl330.c:_execute_DBGINSN() {
    ...
    val =3D le32_to_cpu(*((__le32 *)&insn[2]));
    ...
}

The code accesses the 3rd byte of the insn byte array. Because insn is a 6-=
byte
array allocated on the stack (e.g., in _stop()), &insn[2] is offset by 2 by=
tes
from the base pointer.

Does dereferencing this unaligned pointer as a 32-bit value violate C align=
ment
rules and trigger an alignment fault on architectures that do not support
unaligned accesses in hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808094452.2752=
443-1-lgs201920130244@gmail.com?part=3D1
