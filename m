Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794897923;
	b=tQytFhZs7jDCV0qgzPEmLy27/NfB1VWBy7EJhMdDpwx837lvxbpL79c5HLFO/Hn8MUrC
	 QkcsOuquBpQtw2YQbtVHEettxK6spf3B7KadPBCTAz/voRgNgZOnK/y2DpR1/fU53yLPa
	 ofzEeIyZXb32VuJxMp6g/Ebp7l5pX7urDnvzErmoQwDvjfUQQhoS4+IMEfb/V7QbEOTYI
	 enWWA8cuAapgcya+sKtaGDHdcColsl/wWgvlcpotS72Om2KTC0lOHsesYJsxH0tp+4skb
	 kVSS++bPIUACWdQnLdg65RfCb1oE10rN0JMi8Pn7yQQgVyCk8VpDXrst89haJIn8nBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897923;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oJrKx6agKbgNQIM4l0b6ULsKnx4LIM8tVbx72J00oOk=;
	b=1o/A02TKJHiCDJKvG4uasu2EWaDB9snbxKYSqaS5n+JqiKvfEwny73og7bkwFGn0F7LP
	 rpVaTtqcpBzBlvHucQn41lEU4TTQhMqQOBsTdivKH6sRtn28/vKrtK1Mng9tMNN8ePrOO
	 8kl4CVPWSm/j3TDMNZWaCR9X7Y8cu2Qsx+hgGbsJ6OB0se5JP7KSk81RoYlAT613R8BTw
	 VuX9wS1w0+asjkYcbFnm3ZqbF40Buikt2jvg5fKQppjoOSeWRCDc69wLwAvEUuHYzx2zb
	 q/Qii5YY3puBwInpxchPaIQ+3MSnbitpPbSqy8seUTBjj2eVjMdKmCRira3YWHV/tPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IvJBEsyg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02A3606A31C
	for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 06:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IvJBEsyg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45BE51F000C4;
	Tue, 17 Nov 2026 06:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794897923;
	bh=oJrKx6agKbgNQIM4l0b6ULsKnx4LIM8tVbx72J00oOk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IvJBEsygW+j0fshLSGH+p73T6NG0FE528iSANejdg1Irv2E/OFDbVJmlSc+grR1BY
	 cc+eCtXs2SWJUoGZlNlxWD3qVh+R3TCr1yFzoLNSpeWAIsIr/w8WRixvErSB+tvaY/
	 ZcWCszHaH8Mg/szFyZL+lm1fihTI1F4Q5kbHe4t6EY2Nl+9wfV9hQI9S+tF118fnmT
	 zvpvDFXFj6ZKRuM1NgeARYMe/RB2NcTKdKT1FLAaJjOhcu8KSeWRZ9q7yZA9Igpkfc
	 s+biTBxjzDI7O5nrnhol00ky8Kggb3hb7rHERCYqj8AUWNs9mqdYhuYOFkEl9Rx8Gp
	 fw3bCOPBxWwfA==
Message-ID: <sashiko-outbox-218277@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: axi-dmac: change IRQ to threaded mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sergey Matsievskiy" <matsievskiysv@gmail.com>, dmaengine@vger.kernel.org
Cc: vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261117060124.27914-1-matsievskiysv@gmail.com>
References: <20261117060124.27914-1-matsievskiysv@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 06:45:22 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] dmaengine: axi-dmac: threaded IRQ race with
  axi_dmac_synchronize()
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] dmaengine: dma-axi-dmac: cyclic desc use-after-free in
  axi_dmac_terminate_all() [1]
--

commit fcedf11ce19d4d148f53f6d8bd9c6a0e04ee8801
Author: Sergey Matsievskiy <matsievskiysv@gmail.com>

dmaengine: axi-dmac: change IRQ to threaded mode

This commit converts axi_dmac_interrupt_handler() to a threaded interrupt
handler using devm_request_threaded_irq() and switches vchan.lock acquisiti=
on
in the handler to spin_lock_irqsave().

> diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
> index dbc31b185c4d4..c4b6f6ae6be8c 100644
> --- a/drivers/dma/dma-axi-dmac.c
> +++ b/drivers/dma/dma-axi-dmac.c
> @@ -582,6 +582,7 @@ static irqreturn_t axi_dmac_interrupt_handler(int irq=
, void *devid)
>  {
>  	struct axi_dmac *dmac =3D devid;
>  	unsigned int pending;
> +	unsigned long flags;
>  	bool start_next =3D false;
> =20
>  	pending =3D axi_dmac_read(dmac, AXI_DMAC_REG_IRQ_PENDING);
> @@ -590,7 +591,7 @@ static irqreturn_t axi_dmac_interrupt_handler(int irq=
, void *devid)
> =20
>  	axi_dmac_write(dmac, AXI_DMAC_REG_IRQ_PENDING, pending);
> =20
> -	spin_lock(&dmac->chan.vchan.lock);
> +	spin_lock_irqsave(&dmac->chan.vchan.lock, flags);
>  	/* One or more transfers have finished */
>  	if (pending & AXI_DMAC_IRQ_EOT) {
>  		unsigned int completed;

[Severity: High]
This problem wasn't introduced by this patch, but can axi_dmac_terminate_al=
l()
cause a use-after-free on the active cyclic descriptor [1] in
vchan_complete()?

CPU0                              CPU1
axi_dmac_interrupt_handler()
  axi_dmac_transfer_done()
    vchan_cyclic_callback()
      vc->cyclic =3D vd;
      tasklet_schedule(&vc->task)
                                  axi_dmac_terminate_all()
                                    list_splice_tail_init(..., &head)
                                    vchan_dma_desc_free_list(..., &head)
                                      axi_dmac_desc_free()
vchan_complete()
  vd =3D vc->cyclic;
  dmaengine_desc_get_callback(&vd->tx, &cb)  <-- use-after-free

axi_dmac_terminate_all() splices chan->active_descs into its free list and
frees the descriptors without calling vchan_terminate_vdesc(), leaving
vc->cyclic pointing to the freed axi_dmac_desc when the scheduled tasklet
runs.

> @@ -601,7 +602,7 @@ static irqreturn_t axi_dmac_interrupt_handler(int irq=
, void *devid)
>  	/* Space has become available in the descriptor queue */
>  	if ((pending & AXI_DMAC_IRQ_SOT) || start_next)
>  		axi_dmac_start_transfer(&dmac->chan);
> -	spin_unlock(&dmac->chan.vchan.lock);
> +	spin_unlock_irqrestore(&dmac->chan.vchan.lock, flags);
> =20
>  	return IRQ_HANDLED;
>  }
> @@ -1317,8 +1318,10 @@ static int axi_dmac_probe(struct platform_device *=
pdev)
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D devm_request_irq(&pdev->dev, dmac->irq, axi_dmac_interrupt_hand=
ler,
> -			       IRQF_SHARED, dev_name(&pdev->dev), dmac);
> +	ret =3D devm_request_threaded_irq(&pdev->dev, dmac->irq, NULL,
> +					axi_dmac_interrupt_handler,
> +					IRQF_SHARED | IRQF_ONESHOT,
> +					dev_name(&pdev->dev), dmac);

[Severity: High]
Does moving axi_dmac_interrupt_handler() to a thread without updating
axi_dmac_synchronize() and axi_dmac_terminate_all() introduce a race with
channel termination and teardown?

axi_dmac_synchronize() only calls vchan_synchronize() (which kills the vchan
tasklet) and does not call synchronize_irq(dmac->irq), while
axi_dmac_interrupt_handler() reads and clears AXI_DMAC_REG_IRQ_PENDING befo=
re
acquiring dmac->chan.vchan.lock:

CPU0 (IRQ thread)                 CPU1
axi_dmac_interrupt_handler()
  pending =3D axi_dmac_read(...)
  axi_dmac_write(..., pending)
                                  dmaengine_terminate_sync()
                                    axi_dmac_terminate_all()
                                    axi_dmac_synchronize()
                                      vchan_synchronize()
                                  axi_dmac_issue_pending()
                                    axi_dmac_start_transfer()
  spin_lock_irqsave(&vchan.lock)
  axi_dmac_transfer_done()
    list_del(&active->vdesc.node)
    vchan_cookie_complete()       <-- completes and frees new transfer

When an interrupt fires just before dmaengine_terminate_sync(), the woken I=
RQ
thread can run after a new transfer is issued and apply the stale
AXI_DMAC_IRQ_EOT to the new descriptor on chan->active_descs.  In chan->hw_=
sg
mode, axi_dmac_transfer_done() unconditionally pops and completes the head =
of
chan->active_descs, freeing the descriptor and its chan->pool SG entries via
axi_dmac_desc_free() while DMA hardware is still using them.

Similarly, during dma_release_channel(), an in-flight IRQ thread can run af=
ter
vchan_synchronize() and schedule the vchan tasklet while
axi_dmac_free_chan_resources() is destroying chan->pool.

[1] https://sashiko.dev/#/bug/linux-b5d0e7ef-3ad0-4c97-9c79-1694077caf95

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117060124.2791=
4-1-matsievskiysv@gmail.com?part=3D1
