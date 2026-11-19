Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795054346;
	b=jk+Kyl9z1jj2aApUPpRv868VEePWn7ZNApIHBOPeBIKIkUEWygdeUKdFOWMsn+6Xt27F
	 FxhoGXH/hOR8/EeJpX8aWEMPXZb6wX71ghTJaBygrtIbTbp0irsl1mIG5UP17aDwXJU2Y
	 Z6TsMdzOf1YiSq/PqejbraAw2CfUE+2qgyfEnqi1HdlzA8SO1zBz/xp2QhuXbVomGezzc
	 G7ZQMUUBNEHZCiM95eatrLl7Z4WSamRGn4AzK/cazocyAzHOqpxDjjeCuw9yueqNCWv72
	 MM+TOf8iJpiCV5NbZMbO8NvtCKbqckFYDVOvtgMzlNnG+BKoG6AAUFyt7SUuifmsXkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795054346;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8cHp5qgZGJoyxkEAHf6R+lFpnbH9i0oNE31lKF25MU0=;
	b=WoFuLLPZRKEe60MbLUq+25IMb4uaHmIRWws30BlufY2nWiI0yJcupbwv8EUfnsswxG18
	 wXL3ki2OK8QzSHsLGuijgQLpBl+iXPMJwrv8EHQsctyg4Um61Cni3SOtmyBf9Roj0JjNf
	 XmmrSx82TVGF7C9aVs04Gpqyum0E5xXuhm8QuuWU789OC0AvAwUujpvKt4OqrlgR2V7Gq
	 OeC/PIfA6DH0y+34YYxTWLjLvh+L3TSmAqJh1qZCkwWPHQo2v5Z1DbW8eIdDyOKIgIsEM
	 kbYuh5ZIFLhvPr4MVpE/S4CspiD3KMEOMSVKLVs9XjAcb3/w0/CriEU6stJeNHFuW3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dZj9J2y7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63932606A31C;
	Thu, 19 Nov 2026 02:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dZj9J2y7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97ED91F000C6;
	Thu, 19 Nov 2026 02:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795054346;
	bh=8cHp5qgZGJoyxkEAHf6R+lFpnbH9i0oNE31lKF25MU0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dZj9J2y7TrZkOkriU4FqEGrWXYUv4NAkDmHLmDHeVBYtJt3+6ZDLlBjnbpzQSwawQ
	 t8iVDLgSo0o3DBOJKx1jyhAipkbAUObwTU7HhIUMPcLnd2uihMJCUF/P6/1rLEE3I3
	 URxzcyPbOmzb+uWpjRl0djZmDdIegguB8goQjqHBVzRF+jBZ/P8/IhermXCeJ+j05t
	 koHJRJSE1KLb4JWzgrUqPmPSAAzGlyn/DiNX1ZBmLE/00p0LHurNHdXNYZ+AbiCtGa
	 WOgg1FK2cnIm12nmS3vIGVaIT0gQZT1mb2VihfkBGJiF5P3PP6k7Htt6CSn8b0qoUo
	 +/iq68BYuROVQ==
Message-ID: <sashiko-outbox-222317@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shan-Chun Hung" <shanchun1218@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261119015447.160470-3-shanchun1218@gmail.com>
References: <20261119015447.160470-1-shanchun1218@gmail.com>
 <20261119015447.160470-3-shanchun1218@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 02:12:25 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] dmaengine: ma35d1-pdma: broken init and teardown order in
  ma35d1_pdma_probe()
- [Medium] dmaengine: ma35d1-pdma: missing tasklet sync in
  ma35d1_free_chan_resources()
- [Medium] dmaengine: ma35d1-pdma: status clear race in
  ma35d1_pdma_interrupt()
--

commit fe61217d728ce53c5336f64af791df9cdaf7d2d2
Author: Shan-Chun Hung <shanchun1218@gmail.com>

dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver

This commit adds a DMA engine driver for the Nuvoton MA35D1 PDMA
controller supporting up to 10 channels for memcpy, slave SG, and cyclic
transfers.

> diff --git a/drivers/dma/ma35d1-pdma.c b/drivers/dma/ma35d1-pdma.c
> new file mode 100644
> index 0000000000000..0d6a744043214
> --- /dev/null
> +++ b/drivers/dma/ma35d1-pdma.c
> @@ -0,0 +1,662 @@

[ ... ]

> +static void ma35d1_free_chan_resources(struct dma_chan *chan)
> +{
> +	struct ma35d1_chan *ch =3D to_ma35d1_pdma_chan(chan);
> +
> +	ma35d1_terminate_all(chan);
> +	vchan_free_chan_resources(&ch->vc);
> +	ch->request =3D 0;
> +	memset(&ch->cfg, 0, sizeof(ch->cfg));
> +}

[Severity: Medium]
Can vchan_free_chan_resources() free an active descriptor while
ch->vc.task is still running?

If a client releases a channel without first calling
dmaengine_terminate_sync(), hardware DMA remains active until
ma35d1_terminate_all() runs here.  An interrupt firing just before
ma35d1_terminate_all() disables the channel schedules ch->vc.task:

CPU0                              CPU1
ma35d1_free_chan_resources()
                                  <hardirq>
                                  ma35d1_pdma_interrupt()
                                    vchan_cyclic_callback(&ch->desc->vd)
                                      tasklet_schedule(&vc->task)
                                  <softirq>
                                  vchan_complete()
                                    spin_lock_irqsave(&vc->lock)
                                    vd =3D vc->cyclic;
                                    spin_unlock_irqrestore(&vc->lock)
  ma35d1_terminate_all()
    vchan_terminate_vdesc(&ch->desc->vd)
  vchan_free_chan_resources(&ch->vc)
    ma35d1_pdma_desc_free(vd)
      kfree(d)
                                    dmaengine_desc_get_callback_invoke(
                                      &vd->tx, &vd->tx_result)
                                      <-- use-after-free

Calling vchan_synchronize(&ch->vc) between ma35d1_terminate_all() and
vchan_free_chan_resources() waits for ch->vc.task to finish before freeing
the descriptors.

[ ... ]

> +static irqreturn_t ma35d1_pdma_interrupt(int irq, void *devid)
> +{
> +	struct ma35d1_pdmadev *pdmadev =3D devid;
> +	unsigned long pending, done, abort;
> +	struct ma35d1_chan *ch;
> +	unsigned long flags;
> +	int i;
> +
> +	done =3D readl(pdmadev->channels[0].base + PDMA_TDSTS);
> +	abort =3D readl(pdmadev->channels[0].base + PDMA_ABTSTS);
> +	pending =3D done | abort;
> +	if (!pending)
> +		return IRQ_NONE;
> +
> +	writel(done, pdmadev->channels[0].base + PDMA_TDSTS);
> +	writel(abort, pdmadev->channels[0].base + PDMA_ABTSTS);
> +
> +	for_each_set_bit(i, &pending, PDMA_MAX_CHANS) {
> +		ch =3D &pdmadev->channels[i];
> +
> +		spin_lock_irqsave(&ch->vc.lock, flags);
> +
> +		if (ch->desc) {
> +			if (test_bit(i, &abort) && ch->desc->cyclic) {
> +				vchan_terminate_vdesc(&ch->desc->vd);
> +				ch->desc =3D NULL;
> +			} else if (test_bit(i, &abort)) {
> +				ch->desc->vd.tx_result.result =3D DMA_TRANS_ABORTED;
> +				ma35d1_pdma_complete(ch);
> +			} else if (ch->desc->cyclic) {
> +				vchan_cyclic_callback(&ch->desc->vd);
> +			} else {
> +				ma35d1_pdma_complete(ch);
> +			}
> +		}
> +
> +		spin_unlock_irqrestore(&ch->vc.lock, flags);
> +	}
> +
> +	return IRQ_HANDLED;
> +}

[Severity: Medium]
Can reading and clearing PDMA_TDSTS and PDMA_ABTSTS before acquiring
ch->vc.lock apply a stale completion or abort status to a newly started
transfer?

CPU0                              CPU1
<hardirq>
ma35d1_pdma_interrupt()
  done =3D readl(... + PDMA_TDSTS)
  writel(done, ... + PDMA_TDSTS)
                                  ma35d1_terminate_all()
                                    spin_lock_irqsave(&ch->vc.lock)
                                    writel(BIT(ch->id), ... + PDMA_TDSTS)
                                    ch->desc =3D NULL;
                                    spin_unlock_irqrestore(&ch->vc.lock)
                                  ma35d1_issue_pending()
                                    spin_lock_irqsave(&ch->vc.lock)
                                    ma35d1_pdma_start_desc()
                                      ch->desc =3D new_desc;
                                      ma35d1_pdma_start(ch)
                                    spin_unlock_irqrestore(&ch->vc.lock)
  spin_lock_irqsave(&ch->vc.lock)
  if (ch->desc)
    ma35d1_pdma_complete(ch)  <-- completes new_desc while DMA is active
  spin_unlock_irqrestore(&ch->vc.lock)

Prematurely completing new_desc schedules its descriptor free callback and
starts the next descriptor on the channel while hardware DMA is still
using new_desc->sg.  Checking and clearing channel i's bits in PDMA_TDSTS
and PDMA_ABTSTS under ch->vc.lock would prevent this race.

> +
> +static void ma35d1_pdma_teardown(void *data)
> +{
> +	struct ma35d1_pdmadev *pdmadev =3D data;
> +	void __iomem *base =3D pdmadev->channels[0].base;
> +	int i;
> +
> +	writel(0, base + PDMA_CHCTL);
> +	writel(0, base + PDMA_INTEN);
> +
> +	for (i =3D 0; i < PDMA_MAX_CHANS; i++)
> +		tasklet_kill(&pdmadev->channels[i].vc.task);
> +}

[ ... ]

> +	ret =3D devm_add_action_or_reset(dev, ma35d1_pdma_teardown, pdmadev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D dmaenginem_async_device_register(&pdmadev->ddev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register DMA device\n");
> +
> +	ret =3D devm_request_irq(dev, pdmadev->irq, ma35d1_pdma_interrupt, 0, p=
dev->name, pdmadev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
> +
> +	ret =3D devm_of_dma_controller_register(dev, node, ma35d1_of_xlate, pdm=
adev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "of_dma_controller_register failed\n");

[Severity: Medium]
Does registering ma35d1_pdma_teardown() and pdmadev->ddev before
devm_request_irq() invert the probe and devres teardown order?

During probe, dmaenginem_async_device_register() exposes the DMA channels
before the IRQ handler is installed.  Because devres runs cleanup actions
in reverse order, driver unbind or a failure in
devm_of_dma_controller_register() frees the IRQ and unregisters
pdmadev->ddev while hardware channels (PDMA_CHCTL) and interrupts
(PDMA_INTEN) are still enabled and before ma35d1_pdma_teardown() calls
tasklet_kill() on channels[i].vc.task.

Requesting the IRQ before registering ma35d1_pdma_teardown(), and
registering ma35d1_pdma_teardown() after
dmaenginem_async_device_register(), ensures hardware interrupts and
tasklets are stopped before the DMA device is unregistered and the IRQ is
freed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119015447.1604=
70-1-shanchun1218@gmail.com?part=3D2
