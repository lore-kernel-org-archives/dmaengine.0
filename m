Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792433367;
	b=OJ5PeE6kAivqRS4rTdg+lTjQ8Tg+6hmjL4FVwFCtKL0GlPjncAFmZ24mxoU0TgbnpsxP
	 BOAVnESHkjsmPOCN4bqd18KUERJR41/hMjqz4jUEJKWRmxb3B1EeuroXu0A2EowreJdQD
	 G6CR2CsV17SxhWu0slpv820+2kgHQx34LKm4EEx8ASTKjFo4bT8LKVCuECgC7azYIM6cG
	 s58ByuvzAVPXuu+cbqX/OgP8QudcEkX4B5bmAsmC3ep/RTRGFvFTh7Lyppyxr7rZcBkCh
	 mYQHHpQPxR8lisBEwMeeHc0zaGyVR79A0vWI29HoyZKq9jh5Ue6vZ/Mcx9y4zDaXmsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792433367;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SGD2+Zibg4Tw/pezXOrwLmVBayKO6Q3yRnilbDDGKF0=;
	b=uNzXc6ognKqM3b7Rkv2s11vGZ7hQbQtxeyU0AVBy0LWvJCDi62c6oKarWFNVfcxahFnP
	 YI4SbuqbHaP4oZnq+5baO9lHrr8SwDY8eD5AeOo1xOVxgjb+s6r9WsG4rWPjNTSogXG7w
	 cXJLyEvtN363M8iJz2lVG85gholup6Njxi5E2tjZh9aR5Wg/mtUIsVa0B0tLFWZtxpI2n
	 yNBrarySTOrVRnbWRgnioUe8T6v6qjUKS61GrvZS9NxAuJ+4ixbmRoq1nnGLTSWYH3Igf
	 0IZzwJToZO1o0wxvGFAEFTKwBD/QcUbS5fW+PwebQcMMlJW+2eMSJ5zpObdeRqvgOBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EJrfX9JM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490F4606A31B
	for <dmaengine@vger.kernel.org>; Mon, 19 Oct 2026 18:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EJrfX9JM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45961F000C4;
	Mon, 19 Oct 2026 18:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792433366;
	bh=SGD2+Zibg4Tw/pezXOrwLmVBayKO6Q3yRnilbDDGKF0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EJrfX9JMy4aofDB/ysl0BYOf9fabfsXqF6iNS3lY7/fYF2eDpSBIPOusbhXFhoSlL
	 IjhpxtiWVqLsjvp1sh2B+hnVdazb66wq3V59Mv92iLRgnccrHMINQzq4hI4UJ8PNlu
	 JLW3mZceYZ/onZEEfVPe9LAi4Ri64dWJCp98OwJeItMS1IMUdsvAouggf2bgq8NX4v
	 5RDXLchh5GTqCevQWE4wLtUf2YtGUtkhPrz+m4sHdQ8vXQaJ3VG74KeyO6Cl/PUTWk
	 EUzYMAXS9jjj9D7Qa6PwCcCSkgzHNQuDsveIGj9v9Y0+ANNyT643kTUPAH8XEIXIaO
	 94BzAu2idbGRA==
Message-ID: <sashiko-outbox-178064@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/17] dmaengine: idxd: disable the device before its
 work queues are unregistered
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Byrne" <daniel1.byrne@intel.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261019150630.4026341-12-daniel1.byrne@intel.com>
References: <20261019150630.4026341-1-daniel1.byrne@intel.com>
 <20261019150630.4026341-12-daniel1.byrne@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 18:09:26 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dmaengine: idxd: wqs freed before misc IRQ teardown in idxd_remove=
()
- [Medium] dmaengine: idxd: PASID detached before disabling bus mastering i=
n idxd_remove()
--

commit 702a28ae3b6aeca10dbb038b18e88c5081667455
Author: Daniel Byrne <daniel1.byrne@intel.com>

dmaengine: idxd: disable the device before its work queues are unregistered

This commit moves idxd_shutdown() in idxd_remove() to run before
idxd_unregister_devices() so the device is disabled while the work queues
still exist, and sets idxd->state to IDXD_DEV_DISABLED after
pci_disable_device() before dropping the final reference to idxd_confdev.

> diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
> index c4319ac27bfb1..a037a6e763622 100644
> --- a/drivers/dma/idxd/init.c
> +++ b/drivers/dma/idxd/init.c
> @@ -1296,6 +1296,13 @@ static void idxd_remove(struct pci_dev *pdev)
>  	 * that driver while the queues still exist.
>  	 */
>  	device_release_driver(idxd_confdev(idxd));
> +	/*
> +	 * Disable the device while the queues still exist too. The
> +	 * sub-driver's remove leaves the device enabled when a command has
> +	 * timed out, a late completion can clear that state at any time,
> +	 * and the disable below then clears the queues' software state.
> +	 */
> +	idxd_shutdown(pdev);
>  	idxd_unregister_devices(idxd);

[Severity: High]
If a command has timed out and does not complete before idxd_shutdown()
runs, idxd_device_disable() in idxd_shutdown() will also fail, leaving the
device enabled in hardware while idxd_unregister_devices() frees all
idxd->wqs[i] before idxd_cleanup_interrupts() frees MSI-X vector 0. Can a
misc interrupt fire in this window and dereference freed idxd->wqs[i]?

Specifically, when IDXD_FLAG_CMD_TIMEDOUT is set, idxd_device_drv_remove()
skips idxd_device_evl_free(), leaving Event Log interrupts enabled in
hardware (gencfg.evl_en =3D 1, genctrl.evl_int_en =3D 1). In idxd_shutdown(=
):

drivers/dma/idxd/init.c:idxd_shutdown() {
	rc =3D idxd_device_disable(idxd);
	if (rc)
		dev_err(&pdev->dev, "Disabling device failed\n");

	irq_entry =3D &idxd->ie;
	synchronize_irq(irq_entry->vector);
	idxd_mask_error_interrupts(idxd);
	flush_workqueue(idxd->wq);
}

synchronize_irq() is called before idxd_mask_error_interrupts(), and
idxd_mask_error_interrupts() only clears softerr_int_en and halt_int_en,
leaving EVL and IDXD_INTC_INT_HANDLE_REVOKED interrupts enabled while
MSI-X vector 0 (idxd_misc_thread) stays active until
idxd_cleanup_interrupts().

Once idxd_unregister_devices() unregisters and frees idxd->wqs[i], an
IDXD_INTC_EVL interrupt running idxd_misc_thread() -> process_evl_entries()
-> process_evl_entry() will index into the freed wq:

drivers/dma/idxd/irq.c:process_evl_entry() {
	...
	struct idxd_wq *wq =3D idxd->wqs[entry_head->wq_idx];

	if (!is_idxd_wq_user(wq) || !wq->wq) {
	...
}

Similarly, an IDXD_INTC_INT_HANDLE_REVOKED interrupt (or a halt/error
interrupt racing between synchronize_irq() and idxd_mask_error_interrupts())
can access freed idxd->wqs[i] or queue work onto idxd->wq after
flush_workqueue(idxd->wq) has already completed, which could then run
after pci_iounmap(pdev, idxd->reg_base).

Should idxd_cleanup_interrupts() (or disabling bus mastering / freeing IRQ
vector 0 before flushing idxd->wq) happen before idxd_unregister_devices()
frees the work queues?

>  	/*
>  	 * When ->release() is called for the idxd->conf_dev, it frees all
> @@ -1305,15 +1312,20 @@ static void idxd_remove(struct pci_dev *pdev)
>  	 */
>  	get_device(idxd_confdev(idxd));
>  	device_unregister(idxd_confdev(idxd));
> -	idxd_shutdown(pdev);
>  	idxd_device_remove_debugfs(idxd);
>  	perfmon_pmu_remove(idxd);
>  	idxd_cleanup_interrupts(idxd);
>  	if (device_pasid_enabled(idxd))
>  		idxd_disable_system_pasid(idxd);
>  	pci_iounmap(pdev, idxd->reg_base);
> -	put_device(idxd_confdev(idxd));
>  	pci_disable_device(pdev);
> +	/*
> +	 * Bus mastering is off, so nothing the device holds can complete.
> +	 * The store comes before the reference taken above is dropped:
> +	 * that reference is the last one, and its release frees the device.
> +	 */
> +	idxd->state =3D IDXD_DEV_DISABLED;
> +	put_device(idxd_confdev(idxd));
>  }

[Severity: Medium]
In the same command timeout case where the device remains enabled in
hardware until pci_disable_device(pdev) turns off bus mastering, is it
safe to call idxd_disable_system_pasid(idxd) before pci_disable_device(pdev=
)?

drivers/dma/idxd/init.c:idxd_disable_system_pasid() {
	...
	iommu_detach_device_pasid(domain, dev, idxd->pasid);
	iommu_free_global_pasid(idxd->pasid);

	idxd_set_user_intr(idxd, 0);
	...
}

Because bus mastering is still active when idxd_disable_system_pasid()
runs, could in-flight descriptors on the still-enabled device issue DMA
with idxd->pasid after it has been detached and freed, or could
idxd_set_user_intr() write GENCFG while the device is still enabled?

=EB=93=AF

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019150630.4026=
341-1-daniel1.byrne@intel.com?part=3D11
