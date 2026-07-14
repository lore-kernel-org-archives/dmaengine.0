Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A27027587D
	for <dmaengine@vger.kernel.org>; Tue, 14 Jul 2026 23:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784073023; cv=none; b=R0Igz706qlSywwD83wquOJa1q9J5SEDMTL1JYwhX137xPGbyPbM6FWWoENp12WAJPKXSdBK+HkFAjp3qiziZimjLDBozAI+LmQcKMzjEjCk/X2e+PHwUzPQPSOKmziZwA6Qam8t4y1725cFdexHb+l5DbQkNeC9bwHRVb3JvTfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784073023; c=relaxed/simple;
	bh=in+wB3g1DOHXXDgvUTL4vAEJvS9xVJ6+1M23184KsNg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AyeYvLRM2WrO25EiqoNbfagrBFbKipofzEQqcCaIlaAp9yMIUZmtYBgcjS0mMXvM3Rl36p3xWVt/j107S+vqBDCG5SKe6zMJI87dsdnoYaq1+NUGTh+ZkwtvwiUFu4evZSSJI1Z42FKyvqKiczzg2Jh3ce926ZpwPsWVsYXaL8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GBZm7RpJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GBZm7RpJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D244A1F00A3A;
	Tue, 14 Jul 2026 23:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784073022;
	bh=in+wB3g1DOHXXDgvUTL4vAEJvS9xVJ6+1M23184KsNg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GBZm7RpJwWc+tXVxEcnLqQyun0GqFTrXL4U/hpLAcGRj7GaT1j5lnlSabLU0Zc4AB
	 ASigB/4V/cCvktemOSw27MpPu3w8kQ+RhP4eSGOaRJd8be9pQ0hfouL6QIo9+6nkvU
	 r5hFcbztGpEXy73bllxz2dNhBN0h+72MBb1apaKfekAvlJinf17noswiRWLPQyelVv
	 eREmJFVpRrtUNL9FfOziE6lD/lcH25d6W1wyEINZ7Kgx4ES8ONf9/8k0hTn2yTtEPz
	 th/2b/kIIysU/QQp7BEDMzzE3TxL7iuLnsQr0eEY8FCTxRwo+LIaRsk4t10z6R5LXr
	 qXb8dxCfgr0Rw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] dma: fsl_raid: use devm_platform_ioremap_resource
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260714233855.870797-4-rosenp@gmail.com>
References: <20260714233855.870797-1-rosenp@gmail.com>
 <20260714233855.870797-4-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 23:50:20 +0000
Message-Id: <20260714235021.D244A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unchecked return value from `fsl_re_chan_probe()` leads to double-=
free and NULL pointer dereference in `fsl_re_remove_chan()`.
- [High] The driver requests IRQs but never frees them, leading to a perman=
ent leak and Use-After-Free crashes.
- [High] The return value of `dma_async_device_register()` is completely ig=
nored.
- [High] System-wide device tree traversal for child nodes instead of scope=
d child node search.
- [High] Missing cleanup of tasklet, IRQ, and platform device on error path=
s in `fsl_re_chan_probe`.
- [High] Failure during parent probe loop does not tear down already initia=
lized channels.
- [Medium] Platform devices dynamically created for job rings via `of_platf=
orm_device_create` are never unregistered.
--

--- Patch [3]: [PATCH 3/3] dma: fsl_raid: use devm_platform_ioremap_resourc=
e ---
Note: The format of this review has been altered to provide a free-form
summary of the findings without quoting the original patch, to adhere to
system recitation restrictions.

Commit df861cda9af0548c1bb12583b9a2c34f69725af1
Author: Rosen Penev <rosenp@gmail.com>
Subject: dma: fsl_raid: use devm_platform_ioremap_resource

This patch replaces the open-coded platform_get_resource() and devm_ioremap=
()
sequence with devm_platform_ioremap_resource(). It simplifies the probe rou=
tine
by fetching the resource and mapping it in one call. The error check is also
updated to use IS_ERR/PTR_ERR.

While reviewing the driver code around these changes, I noticed a few
pre-existing issues in the driver that might need attention. These are not
bugs introduced by this patch, but they could cause problems during operati=
on
or driver unbind.

[Severity: High]
This is a pre-existing issue, but does fsl_re_probe() handle failures from
fsl_re_chan_probe() correctly? If fsl_re_chan_probe() fails before fully
initializing the channel, it returns an error. However, fsl_re_probe() igno=
res
this return value and unconditionally increments re_priv->total_chans. This
leaves a NULL pointer in the re_priv->re_jrs array for that channel index.
Later, when fsl_re_remove() is called, it iterates up to total_chans and pa=
sses
these NULL pointers to fsl_re_remove_chan(), which will result in a NULL
pointer dereference when calling tasklet_kill() on the irqtask.

[Severity: High]
This isn't a bug introduced by this patch, but is there a missing free_irq()
in the teardown path? In fsl_re_chan_probe(), the driver uses request_irq()
to register an interrupt handler for each channel. However,
fsl_re_remove_chan() does not appear to call free_irq(). Since the channel
structure is allocated with devm_kzalloc, its memory is freed automatically
by devres when the driver is unbound. If an interrupt fires after the driver
is removed, could the kernel execute fsl_re_isr and dereference the freed
chan pointer?

[Severity: Medium]
This is a pre-existing issue, but are the platform devices created for job
rings properly unregistered? fsl_re_chan_probe() calls
of_platform_device_create() to create platform devices for the child nodes.
However, neither the error handling path nor the driver's teardown function
(fsl_re_remove_chan) calls of_platform_device_destroy() or
platform_device_unregister(). Could this cause a memory and sysfs leak, and
prevent the driver from successfully rebinding later?

[Severity: High]
This isn't a bug introduced by this patch, but is it intentional to ignore =
the
return value of dma_async_device_register() in fsl_re_probe()? The function
is called just before returning 0. If registration fails, the driver might
falsely indicate success to the driver core, which could lead to inconsiste=
nt
state or oopses if clients attempt to use the unregistered DMA device.

[Severity: High]
This is a pre-existing issue, but does the device tree traversal in
fsl_re_probe() search too broadly? The loop uses
for_each_compatible_node_scoped() with a NULL starting node. This instructs
the macro to traverse the entire system's device tree rather than just the
children of the current RAID engine instance. If multiple RAID engines are
present, could each instance mistakenly parse and attempt to bind to all
job queues on the system?

[Severity: High]
This isn't a bug introduced by this patch, but does the error path in
fsl_re_chan_probe() clean up all resources? If an error occurs after the IRQ
is successfully requested (for example, if dma_pool_alloc() fails for
inb_ring_virt_addr), the code jumps to the err_free label. This label retur=
ns
the error code but does not kill the tasklet, free the IRQ, or unregister t=
he
platform device. Could this lead to a crash if the dangling IRQ fires?

[Severity: High]
This is a pre-existing issue, but does fsl_re_probe() clean up successfully
initialized channels if a subsequent loop iteration fails? If
of_property_read_u32() fails to read the reg property for any job-queue node
after some channels have already been probed, the function immediately retu=
rns
an error. It doesn't appear to tear down the previously probed channels usi=
ng
fsl_re_remove_chan(). Since the parent device's managed memory will be freed
by devres, could the dangling IRQs, tasklets, and DMA pools from the orphan=
ed
channels cause a crash?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714233855.8707=
97-1-rosenp@gmail.com?part=3D3
