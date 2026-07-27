Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D6A42DA38
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 17:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785172436; cv=none; b=sXWzP7Ybpm/U4Y6GqKnEjnAmdS8Apws6h0FKGm2oc8yzVz/MMCPl/fmV+vcA2G9ZWA9oMQzS0eSu2BMwpnnqwW+/hHUVZ27CwOFX9rmEDK6qIF3hFESseUTRTvn52i73Qd6ABGain3mz9PoLrZOdJjjdXW7OxN4uxSyL7G29faY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785172436; c=relaxed/simple;
	bh=DySJ663lGIIHf+4+Pwmcpp0SgME8OauJlLUl9nOHfiY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NSyTsxlAtxi+Y7gBoFTBgisRsIBGcXDxc/38n/8wN5ZiER++xYh8/c2CI0vzbs04TSX36oZRTUJ0pOFdZLVnW58/iT/FmdaQmxtykQctKtlerHkUfZyYwAVx3cEUu8Aes1NTIsTnDuR09sPrzIEGfVaN1XIen+wrXUx0XVdfSpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MUDoklob; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MUDoklob"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED7151F000E9;
	Mon, 27 Jul 2026 17:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785172435;
	bh=0WY1LA7qCI1wq8i2iuLRiABCm880t5oAJgpxTgv9hOk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MUDoklobh6ANg7dEqWQ/ppJGsfq6IO1qsz4eE9MNSRwMAdp2sVI/uVW5/QfiuAOeQ
	 myD2w9F+JR4j3uPjy81hsHObcLF+Z52XNVFeCKLkamghw1Qldzf5Gu+qgzJ9xoeN3z
	 7SOPmP5rPe5NUx3pkgG4AgqvvI3Q5AalHyDspgFg87WNWsLaFgeG3TRi38zH9aJEJ6
	 jclkVidp/6gYtN4fkf4hBxMYswf5JkB4EUqOnKzpMBjK4ZCbZvkNXGuhRVcUcTG3rB
	 WgFyo7XC9p2tdRghXosr+72BcHTN/8Ll2qnsz2Jyz1YadDzoBz6ZnGqHBhUjJl/OHh
	 jbk0eJnybMWMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 06/24] dmaengine: dw-edma: Dispatch DONE interrupts
 by channel request
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260727170323.2321369-7-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
 <20260727170323.2321369-7-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 17:13:54 +0000
Message-Id: <20260727171354.ED7151F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The DMA subsystem is unregistered after the hardware is turned off=
, interrupts are freed, and the workqueue is destroyed, allowing active cli=
ents to access freed or stopped resources.
--

--- Patch [6]: [PATCH v3 06/24] dmaengine: dw-edma: Dispatch DONE interrupt=
s by channel request ---
commit 9cc3e80742a029b2761081307fe945a794ab8be6
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Dispatch DONE interrupts by channel request

This commit prepares for LL progress reclamation by moving the request
switch outside the descriptor check. It separates this non-functional
reordering from progress accounting, ensuring STOP and PAUSE states
update correctly even when no descriptor remains.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index 6e7d1f7c20f93..b419ff2becf9e 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for a client
to access freed or stopped resources during driver unbind?

Looking at dw_edma_remove(), the DMA subsystem is unregistered after the
hardware is turned off, interrupts are freed, and the workqueue is
destroyed:

drivers/dma/dw-edma/dw-edma-core.c:dw_edma_remove() {
	...
	if (chip->flags & DW_EDMA_CHIP_PARTIAL)
		err =3D dw_edma_core_quiesce(dw);
	else
		dw_edma_core_off(dw);

	for (i =3D (dw->nr_irqs - 1); i >=3D 0; i--)
		free_irq(chip->ops->irq_vector(dev, i), &dw->irq[i]);
	dw_edma_emul_irq_free(dw);
	...
	destroy_workqueue(dw->wq);

	/* Deregister eDMA device */
	dma_async_device_unregister(&dw->dma);
	...
}

If a user unbinds the DMA driver via sysfs or a PCI hot-remove occurs,
could a concurrent client attempt to issue a DMA request because the
device is still globally registered with the DMA engine subsystem?

Should dma_async_device_unregister() be called at the beginning of
dw_edma_remove() to prevent new subsystem interactions and avoid a
potential system crash like a PCIe UR fault or use-after-free on the
workqueue?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727170323.2321=
369-1-den@valinux.co.jp?part=3D6
