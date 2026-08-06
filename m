Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EBC257845
	for <dmaengine@vger.kernel.org>; Thu,  6 Aug 2026 12:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786020249; cv=none; b=Wt4h8TH8Ub6rmgrx2Sqq1OaAj9iL2FIQvMlHbx/SssVDqNPg1BKB61ob/KhyuOX/EfFyQbYWk4v/LPHszDum9dl07GH00JVY6wRXBvbf12RBMOwX0xCxFZegl7yYQPiTLwCQGvfejnY3pz9zE7aObJcQEB2InhnIftyixdsn2sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786020249; c=relaxed/simple;
	bh=owZvKorM2AKbwpaUWxHOvqR3E/gYJomye0HWav5nKAc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RE8zMOk+z5NfUdIc01SZrMzd3bF0VEtcqqm5RUq2A+zlblcMc89ChRl976GhoSh1/AhV+PJVYjKRPwgLWj76AIhBSgpMhn9MmBMJwdFaXlzHF+idMKHTYS61R8kwVJBT/65HoY7NtNkVRwR3Ep72HbCwv8qsrVbUlMOBTnIbrQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IBmStKSQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IBmStKSQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7471F000E9;
	Thu,  6 Aug 2026 12:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786020245;
	bh=fIbrsRi7ROq5HONIyUy9Jo3xiKwq30Ib4fyAtUlS07U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IBmStKSQPI0maxG+di9mPhuUkYnyDrU1pgdpmgbPAer9/NTpffVDYg06l3PUpgWu2
	 ZfvpOSWuC5UYnYZd7ouQ8FKmr26cFeac4ubZX7ID0aNbWZ4iklkaEp+1JI8g0RHm63
	 a7htN5MI3p8IxF2vqBDMjKplvh8ZomdCaAgYmAO2CWeBW2Elp9nXsOWvIjUAs+PgaU
	 4xrhD+S7FN2/c0NUd6aYyZGPY1ZpbSdx5BSRSOS5qC93r6sekkkAhRwMINS7b/WcK0
	 JEIW06afzGe2wKWIVasNU3paU9qcYAAmY+frTNyIb1depj18Aj8ZnQjTK7OPYP0x/y
	 n32pBv58v8FCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] dmaengine: zynqmp_dma: Reject zero-length memcpy
 transfers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Golla Nagendra" <nagendra.golla@amd.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260806123014.2120447-6-nagendra.golla@amd.com>
References: <20260806123014.2120447-1-nagendra.golla@amd.com>
 <20260806123014.2120447-6-nagendra.golla@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 12:44:04 +0000
Message-Id: <20260806124405.6A7471F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Dropping the channel lock during descriptor cleanup allows a c=
oncurrent `terminate_all` call to silently corrupt list traversal, resultin=
g in double-frees and infinite loops.
- [High] DMA hardware is not stopped in `zynqmp_dma_device_terminate_all`, =
risking memory corruption when descriptors are freed.
- [High] Unbinding the device via sysfs while a DMA client is active will c=
ause a Use-After-Free due to `devm_kzalloc` misuse.
- [High] Integer overflow and truncation in `desc_cnt` calculation allows a=
n arbitrarily large transfer length to bypass descriptor availability check=
s, leading to list corruption.
--

--- Patch [5]: [PATCH 5/6] dmaengine: zynqmp_dma: Reject zero-length memcpy=
 transfers ---
commit 6cf35d097f62dcd5d2c9ce20c7eb0a221c5be776
Author: Golla Nagendra <nagendra.golla@amd.com>

dmaengine: zynqmp_dma: Reject zero-length memcpy transfers

Zero-length prep_memcpy() needlessly consumed a descriptor slot. Reject
zero-length memcpy at prep time and document the behaviour.

> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_=
dma.c
> index 2d56ea08ce45a..e70874d651231 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
[ ... ]
> @@ -851,6 +852,9 @@ static struct dma_async_tx_descriptor *zynqmp_dma_pre=
p_memcpy(
> =20
>  	chan =3D to_chan(dchan);
> =20
> +	if (!len)
> +		return NULL;
> +
>  	desc_cnt =3D DIV_ROUND_UP(len, ZYNQMP_DMA_MAX_TRANS_LEN);
> =20
>  	spin_lock_irqsave(&chan->lock, irqflags);

[Severity: High]
This isn't a bug introduced by this patch, but does this size calculation a=
llow
arbitrary lengths to bypass descriptor availability checks?

If a client driver passes a very large len (e.g., SIZE_MAX) to
zynqmp_dma_prep_memcpy(), the calculation
DIV_ROUND_UP(len, ZYNQMP_DMA_MAX_TRANS_LEN) might overflow the 64-bit integ=
er,
resulting in a quotient of 0.

The check (desc_cnt > chan->desc_free_cnt) would then pass, and the subsequ=
ent
loop could unconditionally pop from the free_list billions of times, leadin=
g to
list underflow and out-of-bounds writes.

While reviewing this code, I also noticed a few other pre-existing issues in
this driver:

[Severity: High]
This is a pre-existing issue, but does zynqmp_dma_device_terminate_all()
safely stop the hardware before freeing descriptors?

drivers/dma/xilinx/zynqmp_dma.c:zynqmp_dma_device_terminate_all() {
    ...
    writel(ZYNQMP_DMA_IDS_DEFAULT_MASK, chan->regs + ZYNQMP_DMA_IDS);
    zynqmp_dma_free_descriptors(chan);
    return 0;
}

If a DMA client calls dmaengine_terminate_all() while a transfer is active,
the driver masks interrupts and recycles the software descriptors back to
free_list.

However, it doesn't appear to write to the hardware registers (e.g., cleari=
ng
ZYNQMP_DMA_ENABLE in ZYNQMP_DMA_CTRL2) to stop the physical DMA engine. If a
new transfer is requested, the software will reallocate the freed descripto=
rs
while the hardware concurrently manipulates them, which could cause race
conditions and memory corruption.

[Severity: High]
This is a pre-existing issue, but could unbinding the device via sysfs whil=
e a
DMA client is active cause a use-after-free?

drivers/dma/xilinx/zynqmp_dma.c:zynqmp_dma_chan_probe() {
    ...
    chan =3D devm_kzalloc(zdev->dev, sizeof(*chan), GFP_KERNEL);
    ...
}

The driver allocates its core structures (zdev and chan) using devm_kzalloc=
().

If unbound via sysfs, zynqmp_dma_remove() is called and
dma_async_device_unregister() is invoked. The devres framework then
automatically frees the zdev and chan structures.

An active client still holds a pointer to the channel because
dma_async_device_unregister() does not wait for clients to release their
references, meaning subsequent client access would dereference freed memory.

[Severity: Critical]
This is a pre-existing issue, but is it safe to drop the channel lock during
descriptor cleanup in zynqmp_dma_chan_desc_cleanup()?

drivers/dma/xilinx/zynqmp_dma.c:zynqmp_dma_chan_desc_cleanup() {
    ...
    list_for_each_entry_safe(desc, next, &chan->done_list, node) {
        ...
        if (dmaengine_desc_callback_valid(&cb)) {
            spin_unlock_irqrestore(&chan->lock, irqflags);
            dmaengine_desc_callback_invoke(&cb, NULL);
            spin_lock_irqsave(&chan->lock, irqflags);
        }
        zynqmp_dma_free_descriptor(chan, desc);
    }
    ...
}

The loop iterates over chan->done_list using list_for_each_entry_safe() and
drops chan->lock to invoke the client callback.

If a client driver concurrently calls zynqmp_dma_device_terminate_all(), wh=
ich
takes the lock and moves all descriptors from done_list to free_list, the
cached next pointer is now in free_list when the lock is reacquired.

The loop would continue traversing the free_list, double-freeing descriptors
and dereferencing the free_list head, resulting in a system panic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806123014.2120=
447-1-nagendra.golla@amd.com?part=3D5
