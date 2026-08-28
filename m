Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CE0383316
	for <dmaengine@vger.kernel.org>; Fri, 28 Aug 2026 16:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787935792; cv=none; b=LqrakEak0Ed/ZPojsaDKV+/XhCOGkCszGIh/Z9/3zHX5sly/Kvs3wtqcOoIqTDcC/4A0nnfo4ilBZJYvfjdEn4xAHzcHnZaXkEDyY17GIVGDwXRrdS/E2vjI7r2BneQwf4Guc9EYbf/4fJmPQusHNsgBz5z+B3AVXvs92jnna2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787935792; c=relaxed/simple;
	bh=mKXONxSNWfipSWW0WkXgBFTw7PEG1eLGT9BxqK7Ybus=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EaAl5Wexy3956ssjd2Ga1+pjt2bqWvHLhO5zofFn7RljRHL1xxBZ1UZyy3VoXzayNOHDxaqP1i68rtnNjjT14wrJyCSCglctxcbEdyWTBkgYW3HI9Cj/HiUFd5osTf8yGK5PG4A8s7bzQ/Xtux8toOpy1EZ/DT02h4CtwBz0P6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kHHXMovz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kHHXMovz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61AE51F000E9;
	Fri, 28 Aug 2026 16:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787935790;
	bh=KHLfnqrOchQ7EetRPBIxOM+Y1UaGe056HxeptVtsJXY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kHHXMovzWcpUMnZnnbSfxyZIZg6X1paxjALQcaj9BSfGHMfitQD7p57ydsbY7y/jE
	 n5JnQCju0RDv2P8/rUnZLT6RU3VJkP99JdZstI2A4WpYbAOiy+qVzlEu2b2kPuwY1x
	 LZ+kWz8FXFQtefoPTCj3bGlyqYYgfZ9PMtJGrOTDZW6DKBswSSuNEtnUeS94FuWmsW
	 gv9f+gNO7P/qWhpHGkxba+Ic3Pm+hc8/RGYJueRkjpN67YGsEVn1t1iGNgIWGOJJdh
	 RHta0ZimYOZ1MdQGGObh34nphh8IgxU+6uA/a0kS3plbMb/q8hWhGWX+dPyFQ29i0Y
	 71ft5DeMOwg/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] dmaengine: dw-edma: Configure remote interrupt
 routing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260828163611.2691264-3-den@valinux.co.jp>
References: <20260828163611.2691264-1-den@valinux.co.jp>
 <20260828163611.2691264-3-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 16:49:49 +0000
Message-Id: <20260828164950.61AE51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] dw_edma_device_config silently ignores standard generic DMA config=
uration fields when peripheral_config is provided for non-HDMA devices.
- [Medium] Lockless reads of `chan->irq_mode` in shared interrupt handlers =
will race with writes in `dw_edma_free_chan_resources` and `dw_edma_device_=
config_irq_mode`.

Pre-existing issues:
- [High] If a DMA channel fails to terminate within 5 seconds, dw_edma_wait=
_termination times out but leaves the hardware engine running, leading to p=
otential corruption of future transfers.
--

commit ea103c42c7be1020b46df769c1c7bb35f1349b52
Author: Koichiro Den <den@valinux.co.jp>
Subject: dmaengine: dw-edma: Configure remote interrupt routing

The patch uses dma_slave_config to set dw_edma_ch_irq_mode on idle channels
of a local eDMA-compatible instance, allowing endpoint functions to route
interrupts remotely. It also adds hardware quiesce during synchronization
when restoring channel routing.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index a678c70a78fe6..a8c6bd508fcd4 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -177,6 +177,30 @@ dw_edma_get_default_irq_mode(struct dw_edma_chan *ch=
an)
[ ... ]
> +static int dw_edma_device_config_irq_mode(struct dw_edma_chan *chan,
> +					  struct dma_slave_config *config)
> +{
[ ... ]
> +	chan->irq_mode =3D mode;

[Severity: Medium]
Could this plain C write to chan->irq_mode race with lockless reads in shar=
ed
interrupt handlers?

While dw_edma_device_config_irq_mode() (and dw_edma_free_chan_resources())
writes to chan->irq_mode, an interrupt for another channel on the same shar=
ed
IRQ line could fire. If the handler iterates over all channels and lockless=
ly
reads chan->irq_mode via dw_edma_core_ch_ignore_irq(), this could trigger
KCSAN warnings and theoretically risk torn reads.

> +
> +	return 0;
> +}
> +
>  static int dw_edma_device_config(struct dma_chan *dchan,
>  				 struct dma_slave_config *config)
>  {
> @@ -184,6 +208,10 @@ static int dw_edma_device_config(struct dma_chan *dc=
han,
>  	bool cfg_non_ll;
>  	int non_ll =3D 0;
> =20
> +	if (chan->dw->chip->mf !=3D EDMA_MF_HDMA_NATIVE &&
> +	    config->peripheral_config)
> +		return dw_edma_device_config_irq_mode(chan, config);

[Severity: High]
Does this early return silently discard standard generic DMA configuration
fields?

If a client driver calls dmaengine_slave_config() on a non-HDMA channel and
provides both standard configuration fields (like src_addr) and a
peripheral_config (to set IRQ mode), the early return bypasses copying the
standard config fields.

Since it also leaves chan->configured =3D false, subsequent dmaengine_prep_*
calls could unexpectedly fail, even though this function returns success.

[ ... ]
> @@ -893,6 +917,17 @@ static void dw_edma_wait_termination(struct dma_chan=
 *dchan)

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a pre-existing iss=
ue
where dw_edma_wait_termination() can leave the hardware running on timeout:

drivers/dma/dw-edma/dw-edma-core.c:dw_edma_wait_termination() {
    ...
	while (time_before(jiffies, timeout)) {
		scoped_guard(spinlock_irqsave, &chan->vc.lock)
			stopping =3D chan->request =3D=3D EDMA_REQ_STOP;

		if (!stopping)
			return;

		fsleep(1000);
	}

	dev_warn(chan->dw->chip->dev,
		 "timeout waiting for channel termination\n");
}

If a local DMA channel is requested to terminate via dmaengine_terminate_al=
l()
and chan->request =3D EDMA_REQ_STOP is set, but the hardware is not forcefu=
lly
stopped via registers, could this lead to potential memory corruption or a
use-after-free?

If dw_edma_wait_termination() times out after 5 seconds and returns, softwa=
re
will free the DMA client buffers. If the hardware engine subsequently compl=
etes
the transfer or unsticks, it may write to the freed memory.

>  static void dw_edma_device_synchronize(struct dma_chan *dchan)
>  {
[ ... ]
> @@ -903,12 +938,18 @@ static void dw_edma_device_synchronize(struct dma_c=
han *dchan)
>  static void dw_edma_free_chan_resources(struct dma_chan *dchan)
>  {
>  	struct dw_edma_chan *chan =3D dchan2dw_edma_chan(dchan);
> +	enum dw_edma_ch_irq_mode default_mode =3D
> +			dw_edma_get_default_irq_mode(chan);
> =20
>  	dw_edma_device_terminate_all(dchan);
>  	dw_edma_device_synchronize(dchan);
> =20
> -	scoped_guard(spinlock_irqsave, &chan->vc.lock)
> +	scoped_guard(spinlock_irqsave, &chan->vc.lock) {
>  		chan->configured =3D false;
> +		/* Avoid a redundant write racing with shared-IRQ readers. */
> +		if (chan->irq_mode !=3D default_mode)
> +			chan->irq_mode =3D default_mode;

[Severity: Medium]
Similarly, will this plain C write to chan->irq_mode also race with a lockl=
ess
read in a shared IRQ handler?

> +	}
> =20
>  	vchan_free_chan_resources(&chan->vc);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828163611.2691=
264-1-den@valinux.co.jp?part=3D2
