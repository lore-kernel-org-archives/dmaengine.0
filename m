Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201027;
	b=DKNKnlsqbWNRyGUijD7kofI32u+uZeJZDTnOriG0bRZw7wq5J/eGPxIsnQqML2c3cEWf
	 bKrd0rMCHH4tv+lNLAgLFnRWA+G52BeCZqVixPn5rgys5akiOSo6TauPMmKWmi2tLNeBK
	 SsmW4PLdWagx38Gxk1OgLd6n9g69b7kgKLwGhz9qQ6nJ/QR/IP7rZJsGtIP/58bwp0jrd
	 EG5PEpI7hn9wDOYzX0KY5VfKDdWH3HizZQtVvG9/JZw/tRPVGOpc63x+GcGR6qYMmlpAP
	 KG/BBzj4QG0NX7kADjs7LWbIvChZS/vImn9DaoVYc2iq6aTwHsSo+U/gGxkb5n7Dg+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201027;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/NPir8mHi5mJNH4iHBXK3aLGX+ARFEWqbNiESTvPUnw=;
	b=bPoR8Hl4hmLSLh+lJTHq6J7Stv9aENxEDfRqsjcr9q11IR6ns1yhrvWK9r7UBa3UAm6e
	 HbhDbSgWxSRidVOQRnV965LatXfXCEP2jX9MvAP7YizwDGpse1FSN5Va49uok9ybC6pTp
	 jZgNT0AGbEPER7jyTKxVB8NpBBe960FuOlqeDPEsg2YaFA8RmdwjK8O3cUKNHLE/x+sxQ
	 khAuBgnd62FKVzuVn4ayijtipIcZYhhLSIS7uqZTBr0EgmffR/MaDjqz0KDNEhDM+Nupn
	 jH6dx1H2Q+lXR7UpV/u1ypZwe3Bxz6YwTBknsi3Lpmx/HW3IISkkXnaU9NKytcv4mKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MzmuGrPk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A460606A322
	for <dmaengine@vger.kernel.org>; Mon,  9 Nov 2026 05:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MzmuGrPk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57DB31F0089F;
	Mon,  9 Nov 2026 05:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794201026;
	bh=/NPir8mHi5mJNH4iHBXK3aLGX+ARFEWqbNiESTvPUnw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MzmuGrPkXtAMRfi70C0i33Lj40e/KGWRvg7cPlBGDXSj+hLY5UTwlUOnzKkKHI4gP
	 ksPRg8+NXqjGMvGmfvHguTt95oJv1wN7wv/5KjUA55up5dn2d9R0F+1KVtfuzEWKH7
	 8rjSc5HwyTIQ7fNE7UImoJzlqRBw0rzDG04t0Sx6mgVt8b3LVmF3W3n6AL8Gj+48xV
	 xP4S5S6Y/LDWm02U50r0qUjl+lDjcQBlPBywjILM6MbFFbVtASJADttoaGdnf2ksj6
	 hXw+ssRF+rfmAohCAHr0Mfb1x29sGHzO4eA5m0q2wPxgh7ziPKXLgwfqbZkRG16wsU
	 dBRngJPm4QWsA==
Message-ID: <sashiko-outbox-204416@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dmaengine: dw-axi-dmac: poll the correct enable bit
 during termination
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261108-submit-dw-axi-dma-stop-pause-v1-v1-1-c48ec19e9ee4@gmail.com>
References: <20261108-submit-dw-axi-dma-stop-pause-v1-v1-0-c48ec19e9ee4@gmail.com>
 <20261108-submit-dw-axi-dma-stop-pause-v1-v1-1-c48ec19e9ee4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 05:10:25 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] dmaengine: dw-axi-dmac: use-after-free in
  dma_chan_terminate_all() [1]
--

commit af0999f332d674abe73e6d4b71aee90f2aef6ba8
Author: James Hilliard <james.hilliard1@gmail.com>

dmaengine: dw-axi-dmac: poll the correct enable bit during termination

This commit updates dma_chan_terminate_all() to poll axi_chan_is_hw_enable()
so that upper-bank channel enable bits (channels 16 through 31) are checked
before freeing descriptors.

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index 7520c78f55ccf..49f65486e8626 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -1181,16 +1181,15 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, =
void *dev_id)
>  static int dma_chan_terminate_all(struct dma_chan *dchan)
>  {
>  	struct axi_dma_chan *chan =3D dchan_to_axi_dma_chan(dchan);
> -	u32 chan_active =3D BIT(chan->id) << DMAC_CHAN_EN_SHIFT;
>  	unsigned long flags;
> -	u32 val;
> +	bool enabled;
>  	int ret;
>  	LIST_HEAD(head);
> =20
>  	axi_chan_disable(chan);
> =20
> -	ret =3D readl_poll_timeout_atomic(chan->chip->regs + DMAC_CHEN, val,
> -					!(val & chan_active), 1000, 50000);
> +	ret =3D read_poll_timeout_atomic(axi_chan_is_hw_enable, enabled, !enabl=
ed,
> +				      1000, 50000, false, chan);

[Severity: Critical]
This problem wasn't introduced by this patch, but can dma_chan_terminate_al=
l()
race with dma_chan_issue_pending() [1] and free descriptors while the
channel is active?

axi_chan_disable() and the poll loop run before chan->vc.lock is acquired:

CPU0                                  CPU1
dma_chan_terminate_all()
  axi_chan_disable(chan)
  read_poll_timeout_atomic(...)
                                      dma_chan_issue_pending()
                                        spin_lock_irqsave(&chan->vc.lock, .=
..)
                                        vchan_issue_pending(&chan->vc)
                                        axi_chan_start_first_queued(chan)
                                        spin_unlock_irqrestore(...)
  spin_lock_irqsave(&chan->vc.lock, ...)
  vchan_get_all_descriptors(&chan->vc, &head)
  spin_unlock_irqrestore(...)
  vchan_dma_desc_free_list(&chan->vc, &head)  <-- use-after-free by DMA

Because CPU1 re-enables the channel after the poll finishes, the hardware
continues processing descriptors that CPU0 then collects and frees.

[1] https://sashiko.dev/#/bug/linux-d3e7b3db-d97f-48be-a317-9ef1a4cd9953

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-submit-dw-=
axi-dma-stop-pause-v1-v1-0-c48ec19e9ee4@gmail.com?part=3D1
