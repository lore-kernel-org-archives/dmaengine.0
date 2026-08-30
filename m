Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C9681AA8
	for <dmaengine@vger.kernel.org>; Sun, 30 Aug 2026 05:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788068865; cv=none; b=c+TDnMm8mZb6GqTEgjUJAfpgnlmv8qZsmHH3GJp3H5w3NAcEw96ycpAvZpTolB8iAIXNQD5TpoQyF5WzPDr69nVCWhiA7UV2X2W8aAYqU7cdX4m7vBO+ZKmgAcSV1jRwOibUXR7y8/BSdiF+3DKlQ+uuolamHZKU1siggcWgs08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788068865; c=relaxed/simple;
	bh=4Veb3U0kdHuMrPWzmS6uiOgxPZRTMd8ZSyfPtNnR5yo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q96te/0T21x2e4bzxinxVIn1pMh8C9zYecg+lW8N9nONBEalFqBz5r9h9YelHTr6VNX1XUBsyyqi5VHS54SJ/E2aqbqqt+5LVF8H6QSpqM8w82dEjtCptj8Tc3FbscGVu5X8fqdbBATjAP+0DYOppIIlucjOf2+RIWRcP4TRYh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QPA2IkD6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QPA2IkD6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C03A21F000E9;
	Sun, 30 Aug 2026 05:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788068864;
	bh=B4XCNLnHWfpRFS5isJjNfHpTk7VskXZn1lDv1LsHkAw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QPA2IkD6ZryjFNbnm+bkrxpMrIC3qgFU7RYEcc6+STfadsIgFlVQWF6hzo0LqVlxO
	 dR8u68rNyIvY+Wcn4OWnv8+k/JpFG+KGCBMjJsIKJK9D7Ibu2SxUFCr2DSinJnIzkT
	 k59x1+StYrECNX1G4cDf3TkRcVH4qxyek+G169rN028jI6M17s9wDxM33ZyAwHbut5
	 Luizl5QkGUW7Bh5ZkYWYJcCIVSuw04CYgoxtLlFKF2GrrudV8iqSWVT5CgkU5T+51w
	 v4iVg6QPVtUg5FQW9Jr4yLUAL8ERh+nadS4li7S8aV471/grrKqzSes8mw4CytguxB
	 WqfNcA3IiG+cQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: altera-msgdma: initialize state before
 requesting IRQ
Reply-To: sashiko-reviews@lists.linux.dev
To: "Runyu Xiao" <runyu.xiao@seu.edu.cn>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260830053308.2190597-1-runyu.xiao@seu.edu.cn>
References: <20260830053308.2190597-1-runyu.xiao@seu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 05:47:43 +0000
Message-Id: <20260830054743.C03A21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing dma_async_device_unregister() on the of_dma_controller_reg=
ister() error path causes a use-after-free in the DMA framework.
- [High] IRQ is requested before the hardware is properly reset and quiesce=
d, leaving a race window that can cause an interrupt storm or concurrent ha=
rdware access during reset.
- [High] Chained DMA transactions are stalled forever because msgdma_start_=
transfer() moves all pending transactions to active_list but only submits t=
he first one to the hardware.
- [High] Hardware interrupts are enabled at probe but never disabled in the=
 error path or during module removal, risking an IRQ storm.
--

commit 7387a0714cc7c9797e08cd9d4ea5b72695584890
Author: Runyu Xiao <runyu.xiao@seu.edu.cn>

dmaengine: altera-msgdma: initialize state before requesting IRQ

msgdma_probe() registers the IRQ before initializing the tasklet, lock,
and descriptor lists used by the interrupt handler. A pending interrupt
can access incomplete state during probe.

> diff --git a/drivers/dma/altera-msgdma.c b/drivers/dma/altera-msgdma.c
> index e23e5b441a24e..412f4bce1d4aa 100644
> --- a/drivers/dma/altera-msgdma.c
> +++ b/drivers/dma/altera-msgdma.c
> @@ -847,11 +847,6 @@ static int msgdma_probe(struct platform_device *pdev)
>  	if (mdev->irq < 0)
>  		return -ENXIO;
> =20
> -	ret =3D devm_request_irq(&pdev->dev, mdev->irq, msgdma_irq_handler,
> -			       0, dev_name(&pdev->dev), mdev);
> -	if (ret)
> -		return ret;
> -
>  	tasklet_setup(&mdev->irq_tasklet, msgdma_tasklet);
> =20
>  	dma_cookie_init(&mdev->dmachan);
> @@ -863,6 +858,11 @@ static int msgdma_probe(struct platform_device *pdev)
>  	INIT_LIST_HEAD(&mdev->done_list);
>  	INIT_LIST_HEAD(&mdev->free_list);
> =20
> +	ret =3D devm_request_irq(&pdev->dev, mdev->irq, msgdma_irq_handler,
> +			       0, dev_name(&pdev->dev), mdev);
> +	if (ret)
> +		return ret;
> +

[Severity: High]
This isn't a bug introduced by this patch, but the IRQ is still being
requested before msgdma_reset() is called to quiesce the hardware.

If the bootloader left the device active, can it fire an interrupt
immediately upon registration?

If this happens, the interrupt handler might access hardware registers and
schedule the tasklet while the probe routine concurrently writes to reset
bits in msgdma_reset(), potentially causing bus hangs or an IRQ storm.
Should the hardware be quiesced before registering the IRQ?

[Severity: High]
This is a pre-existing issue, but does the probe error path leak the async
DMA device if registration fails?

If of_dma_controller_register() fails, the code jumps to the cleanup path:

drivers/dma/altera-msgdma.c:msgdma_probe() {
	...
	} else if (ret && ret !=3D -ENODEV) {
		goto fail;
	}
	...
fail:
	msgdma_dev_remove(mdev);
	return ret;
}

However, msgdma_dev_remove() omits deregistering the async device:

drivers/dma/altera-msgdma.c:msgdma_dev_remove() {
	if (!mdev)
		return;

	devm_free_irq(mdev->dev, mdev->irq, mdev);
	tasklet_kill(&mdev->irq_tasklet);
	list_del(&mdev->dmachan.device_node);
}

Because mdev is allocated with devm_kzalloc(), it gets freed upon probe
failure, leaving the dmaengine subsystem with pointers to a freed
dma_device. Could this result in a use-after-free?

[Severity: High]
This isn't a bug introduced by this patch, but are hardware interrupts left
enabled if probe fails or the module is removed?

msgdma_reset() explicitly enables interrupts on the hardware:

drivers/dma/altera-msgdma.c:msgdma_reset() {
	...
	iowrite32(MSGDMA_CSR_CTL_STOP_ON_ERR | MSGDMA_CSR_CTL_STOP_ON_EARLY |
		  MSGDMA_CSR_CTL_GLOBAL_INTR, mdev->csr + MSGDMA_CSR_CONTROL);
	...
}

If an error occurs after resetting (e.g., during dma_async_device_register),
the cleanup path calls msgdma_dev_remove(), which frees the OS IRQ handler
but fails to write back to MSGDMA_CSR_CONTROL to disable the hardware-level
interrupts.

Could this leave the hardware capable of asserting the IRQ line without a
registered handler, leading to an unhandled IRQ storm?

[Severity: High]
This is a pre-existing issue, but are chained DMA transactions stalled
indefinitely when using this driver?

When msgdma_start_transfer() is called, it moves all pending transactions to
the active list, but only submits the first one to the hardware:

drivers/dma/altera-msgdma.c:msgdma_start_transfer() {
	...
	list_splice_tail_init(&mdev->pending_list, &mdev->active_list);
	msgdma_copy_desc_to_fifo(mdev, desc);
	...
}

Once the hardware finishes the first transaction, the interrupt handler fir=
es
and calls msgdma_start_transfer() to initiate the next transfer. However, it
then checks the pending list instead of the active list:

drivers/dma/altera-msgdma.c:msgdma_start_transfer() {
	desc =3D list_first_entry_or_null(&mdev->pending_list,
					struct msgdma_sw_desc, node);
	if (!desc)
		return;
	...
}

Since the pending list is empty from the prior splice, does it abandon the
remaining transactions in the active list and stall the pipeline?

>  	dma_dev =3D &mdev->dmadev;
> =20
>  	/* Set DMA capabilities */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830053308.2190=
597-1-runyu.xiao@seu.edu.cn?part=3D1
