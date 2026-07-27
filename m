Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC83737B00E
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187499; cv=none; b=tlbCvpYnavVFGRcnBGt+TTahmBkEALN1ZONya8O62WpCYP/j7WtUz2+N6fDq2AXUUWynlmrBJ7+u2CSHmqDJXJDbQSt3o/429Q75AS2aP0HK5BlrTeVb2ycpDP2NgrYGlTeXPb/MUpr6oy2ne1Nhr7PpdkiBU5B3kts6Ufw+LNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187499; c=relaxed/simple;
	bh=awiShoYG5jOggJcCkBb0HEtHfIXe3QCyHcI4Zp3tjaI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tVChw1906Q3ULV3lvv/MSmYQK9S91KODlSANJ8wZM6cwtwiZruuvbjhtE66YdM9TPWTY7NCcHnNAZRpHQ83pBn4G+ai2Mp1AzTdTZ5mT1ZaXW9SJhLM7xwXingX/B+qOfkdrPMJTnqLsfuJI5HCziWdOLqIlcmSBMH21283xBUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k4jZvH8y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k4jZvH8y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F651F000E9;
	Mon, 27 Jul 2026 21:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785187497;
	bh=8zCFed27kE5Jja2gicTcso34QfF9umgtn0mdQPiWsr4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k4jZvH8yON0foLljuElmBcaRCLUMK7BK8Pt001atcG2OgdOZH/zzYcBqn9SRbdYfF
	 hz99y195f6h/sGQ+u6/ZKwH1O8k2xI0+vZodT4zkuscNN0dazUUAsHeeSLkstREHUN
	 4LHfrl7sS4CfKFIPrEy6pn0XTS++Yrk7ESwsjhHSeKFIgAkhitSe/NkhPSp/85z376
	 QfEXW1wahPt5gOyEUezbQw+83RzQa9zYHyBl6IgvZppHZ4dPWnZ7AjzpEhGAXG8ynO
	 9hWdJpCUJm21yMiDUr1pU1LkkTDjl2OqWSmg1WZwX2VqZWqlaUK+F0msrAVPfmAOen
	 MuDmWjvPVL6YA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 63/64] dmaengine: qcom-gpi: defer callbacks via vchan
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <2685692fbcc37b41bdef7b88e37ffc7ca359986e.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <2685692fbcc37b41bdef7b88e37ffc7ca359986e.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:24:57 +0000
Message-Id: <20260727212457.77F651F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incorrect teardown sequence in gpi_free_chan_resources(): dma_chan=
_kill_bh() is called after gpi_free_ring(), exposing a freed ring buffer to=
 concurrent client callbacks, leading to a divide-by-zero crash.
- [High] The driver defers callbacks to a virt-dma BH but fails to implemen=
t the device_synchronize callback, breaking dmaengine_terminate_sync().
--

--- Patch [63]: [PATCH v2 63/64] dmaengine: qcom-gpi: defer callbacks via v=
chan ---
commit e55f43a67f69dbf222b5c7eba067eedde92ac98b
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: qcom-gpi: defer callbacks via vchan

Complete descriptors through virt-dma instead of invoking callbacks
directly from event processing. This preserves the transfer result for
the shared vchan BH, which invokes the callback and frees the descriptor;
drain that BH before releasing channel resources.

> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index a5055a6273af6..4cf68cf8eb2e5 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
[ ... ]
> @@ -1060,8 +1064,12 @@ static void gpi_process_xfer_compl_event(struct gc=
han *gchan,
>  	result.residue =3D gpi_desc->len - compl_event->length;
>  	dev_dbg(gpii->gpi_dev->dev, "Residue %d\n", result.residue);
> =20
> -	dma_cookie_complete(&vd->tx);
> -	dmaengine_desc_get_callback_invoke(&vd->tx, &result);
> +	spin_lock_irqsave(&gchan->vc.lock, flags);
> +	list_del(&vd->node);
> +	vd->tx_result =3D result;
> +	vchan_cookie_complete(vd);

[Severity: High]
Since this patch defers callbacks to the virt-dma bottom-half, does the dri=
ver
now need to implement the device_synchronize callback?

When a client driver calls dmaengine_terminate_sync() to ensure no callbacks
are running before freeing its DMA buffers, the absence of device_synchroni=
ze
causes it to fall back to dmaengine_terminate_all(), which merely stops the
hardware.

Could the newly introduced deferred BH execute a completion callback after
dmaengine_terminate_sync() has already returned, potentially leading to a
use-after-free in the client driver?

Should gpi_probe() be updated to set gpi_dev->dma_device.device_synchronize
to a function that wraps vchan_synchronize()?

> +	spin_unlock_irqrestore(&gchan->vc.lock, flags);
> +	return;
> =20
>  gpi_free_desc:
>  	spin_lock_irqsave(&gchan->vc.lock, flags);
[ ... ]
> @@ -2009,6 +2017,7 @@ static void gpi_free_chan_resources(struct dma_chan=
 *chan)
> =20
>  	/* free all allocated memory */
>  	gpi_free_ring(&gchan->ch_ring, gpii);
> +	dma_chan_kill_bh(&gchan->vc.chan);

[Severity: High]
Does this cleanup sequence introduce a race condition that could result in a
divide-by-zero crash?

Because dma_chan_kill_bh() is called after gpi_free_ring(), the bottom-half
is still permitted to run after the channel's ring has been freed and
zero-initialized.

If a deferred callback executes in the BH and calls dmaengine_prep_slave_sg=
()
to queue the next transfer, it will eventually call gpi_prep_slave_sg(). Th=
at
function calls gpi_ring_num_elements_avail(), which blindly accesses the now
zeroed ch_ring and divides by ring->el_size.

Could dma_chan_kill_bh() be moved before gpi_free_ring() to ensure the BH is
drained before tearing down the hardware ring resources?

>  	vchan_free_chan_resources(&gchan->vc);
>  	kfree(gchan->config);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D63
