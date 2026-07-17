Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB0C2459E5
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 05:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784265403; cv=none; b=YqHa3LzLqh3FsJuEGCMwl0wk5eHF1STA5iM4odwgswXg7EIWHNm98CzlS6GsJjccJLW+bwdOOgJrF06YK9MqSTjIznTPpXAZbYVLHK0NyLrW2CCnGJwB4SEsd6uKpzTcrM1EtHFWP2BUA6lv2HNAYqk0pkDN34eKE42iAZQ+XGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784265403; c=relaxed/simple;
	bh=1WWCVy6sZjFrBmAAkJnkd3j5SILbHskeI+wzrTTe6W0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=etx9Acp1N7c4oX6omUQzmDyo1mjB7BGKd8yz2875ZO60UDF9DcCjGzdxi3L3gzmLTTetam4BGdooInUBIbOV4XzMKRsDY8tDaP+IUWWP7/GD1ZBD3xesJJ+KGmVO2LSG7vGxOHwdZGVvmcJrhoV2Ier4cxqxcVHS1Qisx824exI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDJBy0C4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDJBy0C4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE371F000E9;
	Fri, 17 Jul 2026 05:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784265402;
	bh=syXj+7O1eT9cvwAFUWRRFpO25ShjxKglLECEzQixCq8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aDJBy0C4CTKWZVp+ol1DLfMPKY26YfzPHOuZdYL/uu/Ge9X5XXvEdVDIr4bzBmkSa
	 ektsEhYNSrHtncg2XETImw5f4VBfrGhvevCIVvryAYlgcyFIkkOq0Od495Ssw3WY2R
	 LwJLd+CCrJ16/MmCu9kYd14b4uHa3xOE3yQl5IXBdeBU4SoxnEZh+4CNnTYCOgpyuI
	 RJWnQQ0uWlg9QP2X51a2h2hIdh0CCHFQTi2GZ/a1zGZr43TKpHR1G0quQAVHKYk1xZ
	 GchwZxxao4GsNTGr2jl4wfpet2i7OTiA7iY3mR0vg6EjvBPVcCnoXxBYvHYO1MSQkl
	 NnrGaV7Wf3NRQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 04/14] dmaengine: dw-edma: Initialize IRQ data before
 requesting IRQs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260717050308.2144108-5-den@valinux.co.jp>
References: <20260717050308.2144108-1-den@valinux.co.jp>
 <20260717050308.2144108-5-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 05:16:41 +0000
Message-Id: <20260717051641.BEE371F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Teardown race condition in dw_edma_remove where the hardware is di=
sabled and IRQs are freed before the DMA device is unregistered.
- [High] State modification and linked list accesses are performed lockless=
ly in the pause, resume, and terminate_all routines, leading to data races =
and list corruption.
- [High] dw_edma_device_terminate_all() fails to stop the hardware synchron=
ously and neglects to clear pending virt-dma descriptors, leading to DMA us=
e-after-free and memory leaks.
--

--- Patch [4]: [PATCH v5 04/14] dmaengine: dw-edma: Initialize IRQ data bef=
ore requesting IRQs ---
commit 65ff3b1fccd7b06e00ca72a89bc12e41c6366a28
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Initialize IRQ data before requesting IRQs

This commit prevents a potential NULL pointer dereference in the shared
interrupt handler. It fixes the initialization order by setting the back
pointer before requesting the IRQ.

Cc: stable@vger.kernel.org

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index 8a1ec0fd057bd..392981f3b7bb5 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c

[ ... ]

> static int dw_edma_device_resume(struct dma_chan *dchan)
> {
> 	struct dw_edma_chan *chan =3D dchan2dw_edma_chan(dchan);
> 	int err =3D 0;
[ ... ]
> 	} else {
> 		chan->status =3D EDMA_ST_BUSY;
> 		dw_edma_start_transfer(chan);
> 	}
>=20
> 	return err;
> }

[Severity: High]
This is a pre-existing issue, but does dw_edma_start_transfer() need to be
called with the vc.lock held here?

Looking at dw_edma_start_transfer(), it appears to locklessly call
vchan_next_desc(), which reads the desc_issued linked list. Could a
concurrent list modification from dmaengine_issue_pending() or the interrupt
handler corrupt the list pointers?

[ ... ]

> static int dw_edma_device_terminate_all(struct dma_chan *dchan)
> {
> 	struct dw_edma_chan *chan =3D dchan2dw_edma_chan(dchan);
> 	int err =3D 0;
[ ... ]
> 	} else {
> 		chan->request =3D EDMA_REQ_STOP;
> 	}
>=20
> 	return err;
> }

[Severity: High]
This is a pre-existing issue, but is setting chan->request sufficient to
safely terminate the transfer?

By not synchronously stopping the hardware via dw_edma_core_ch_quiesce(),
the hardware might continue running and writing to memory. If the client
subsequently frees the DMA buffer, could this result in a use-after-free or
IOMMU fault?

Additionally, this locklessly modifies chan->request, bypassing
synchronization with the interrupt handler. Does this routine also need to
acquire the lock and call vchan_get_all_descriptors() to purge pending
queues and prevent descriptor memory leaks?

[ ... ]

> int dw_edma_remove(struct dw_edma_chip *chip)
> {
[ ... ]
> 	/* Disable eDMA */
> 	dw_edma_core_off(dw);
>=20
> 	/* Free irqs */
> 	for (i =3D (dw->nr_irqs - 1); i >=3D 0; i--)
> 		free_irq(chip->ops->irq_vector(dev, i), &dw->irq[i]);
> 	dw_edma_emul_irq_free(dw);
>=20
> 	/* Deregister eDMA device */
> 	dma_async_device_unregister(&dw->dma);

[Severity: High]
This is a pre-existing issue, but is it safe to disable the hardware and
free the IRQs before unregistering the dmaengine device?

If a concurrent client calls dma_async_issue_pending() during driver unbind,
dw_edma_start_transfer() could re-enable the eDMA hardware. Because IRQs are
already freed, the software will never be notified when the transfer
completes.

Could this leave the hardware running while the DMA driver is fully removed,
potentially causing memory corruption?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717050308.2144=
108-1-den@valinux.co.jp?part=3D4
