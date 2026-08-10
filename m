Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CA038758D;
	Mon, 10 Aug 2026 18:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386438; cv=none; b=KX4f07he+0DS/sSKyVE5mPi+Y6vrdDMVyEzpBYLwyAjQdkNYm39Iyvt10L6hDHpJkyTyRP7HRKfIg6FeSm7RvgweFhMZ9yjiCP1lOy6Cztd+j+FSGFXkG4sdkOR8m4YpyDznUhYQ7bWXrU8MU/quxO9eMRlK6rpxvs1zzE/JhS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386438; c=relaxed/simple;
	bh=Trzq/A6TDBBYNMdTbFVtbRQmNnjaQky7Gs/Jb3IVAm8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SQl+zuzQbQA92QMnQgbjPT/1nIvVBOJojoCKTdUTD0rIRssDIW7N8IJ8zY75uNfc/O3zv+JWWmGiaFY8o22/9qjlMlebt3blvulzkxJ/gQqiET/LUwoAfUR5bcU89VGl6dbxQXST2pPf2Wi8yW6/jGolzQ8VE3Uj6zDTtHobkaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UezxeJvC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UezxeJvC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC14D1F000E9;
	Mon, 10 Aug 2026 18:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786386437;
	bh=LtG/rEnkaVf0pRypD+zveZZn219o5vvfAplNI3WC1Jc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UezxeJvCuzfYmYc6HbT5d0H+g7xrEXxE2DFPHLP/ga0MedxdlFeHH5f1mNQVvhnoY
	 zdJQa5/zIufJu3aDIeU5er9D48zA+BGstFjzxr3wIMXAuqWZvRb/ERsBmOSXFvGfwQ
	 h6pxbPOX3zBW++2PVl9KaaO9t6NJKJv+BmzPXsYFYnB3p0+cgT4Y6eLxxUUsuycAfj
	 qNiNrs47YxP2LfoSgQbHEIgNRBCz8r140td53FA/hm6AVozQlwb/zyqRbo+HnqhHam
	 LYE8S+bwtOEnpeN76y9HWmebL0Aho/S43jKBBubfs5BlbWsdWf3NQSGZGhrpWocp3U
	 GXIhiS6OZ72hQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 13/34] dmaengine: mxs-dma: use dmaengine BH
 scheduling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <3dec314c8878181bbf9bd8bdf6d222c435643fc0.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <3dec314c8878181bbf9bd8bdf6d222c435643fc0.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:27:15 +0000
Message-Id: <20260810182716.DC14D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver does not kill the deferred bottom-half work during chan=
nel teardown or error paths, nor does it provide a device_synchronize callb=
ack, leading to a potential use-after-free.
- [High] Requesting the IRQ before enabling the device clock can result in =
a synchronous external abort and bus hang.
--

--- Patch [13]: [PATCH v3 13/34] dmaengine: mxs-dma: use dmaengine BH sched=
uling ---
commit 84e84c7d902dd9157e789fe8d760954306bc43d6
Author: Allen Pais <allen.lkml@gmail.com>
dmaengine: mxs-dma: use dmaengine BH scheduling

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

> diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
> index 7acb3d29dad30..149ac402f7b4b 100644
> --- a/drivers/dma/mxs-dma.c
> +++ b/drivers/dma/mxs-dma.c
[ ... ]
> @@ -386,8 +385,8 @@ static irqreturn_t mxs_dma_int_handler(int irq, void =
*dev_id)
>  		dma_cookie_complete(&mxs_chan->desc);
>  	}
> =20
> -	/* schedule tasklet on this channel */
> -	tasklet_schedule(&mxs_chan->tasklet);
> +	/* schedule BH on this channel */
> +	dmaengine_schedule_bh(&mxs_chan->chan);
> =20
>  	return IRQ_HANDLED;
>  }

[Severity: High]
This is a pre-existing issue, but since the driver is moving to the BH
mechanism, should we also ensure the scheduled work is properly flushed dur=
ing
teardown and error paths?

Looking at mxs_dma_alloc_chan_resources(), if clk_prepare_enable() fails,
the error path frees the IRQ and the channel ccw structure:

mxs_dma_alloc_chan_resources() {
    ...
err_clk:
    free_irq(mxs_chan->chan_irq, mxs_dma);
err_irq:
    dma_free_coherent(mxs_dma->dma_device.dev, CCW_BLOCK_SIZE,
            mxs_chan->ccw, mxs_chan->ccw_phys);
    ...
}

Because free_irq() waits for the hardirq handler but not the scheduled
workqueue, if an early interrupt schedules the BH work, can the workqueue
execute after the channel resources have been freed, leading to a
use-after-free?

Similarly, mxs_dma_free_chan_resources() frees channel resources without
calling dmaengine_kill_bh(). The driver also lacks a device_synchronize
callback, which makes dmaengine_terminate_sync() a no-op.

Should we add dmaengine_kill_bh() and a synchronization callback to prevent
the scheduled work from running after the client frees the channel?

[ ... ]
> @@ -781,7 +780,7 @@ static int mxs_dma_probe(struct platform_device *pdev)
>  		mxs_chan->chan.device =3D &mxs_dma->dma_device;
>  		dma_cookie_init(&mxs_chan->chan);
> =20
> -		tasklet_setup(&mxs_chan->tasklet, mxs_dma_tasklet);
> +		dmaengine_init_bh(&mxs_chan->chan, mxs_dma_tasklet);
> =20
> =20
>  		/* Add the channel to mxs_chan list */

[Severity: High]
This isn't a bug introduced by this patch, but I wanted to ask about the
initialization ordering which can trigger the interrupt handler early.

When a channel is allocated in mxs_dma_alloc_chan_resources(), the IRQ is
requested before the clock is enabled:

mxs_dma_alloc_chan_resources() {
    ...
    ret =3D request_irq(mxs_chan->chan_irq, mxs_dma_int_handler,
              0, "mxs-dma", mxs_dma);
    if (ret)
        goto err_irq;

    ret =3D clk_prepare_enable(mxs_dma->clk);
    ...
}

If an interrupt line is asserted early (for example, from a previously
aborted transaction where the client didn't call terminate_all),
mxs_dma_int_handler() will fire immediately. It then performs an MMIO read
on the memory-mapped controller registers (mxs_dma->base + HW_APBHX_CTRL1).

Since accessing device registers with a disabled clock results in a bus hang
on this platform, would it be safer to enable the clock before requesting
the IRQ to prevent a synchronous external abort?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D13
