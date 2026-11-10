Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337728;
	b=IheUeaEIwwl20q0XxN/GVEn4h9qktqva/RDsXeMOcawKhGuX297hikg27RTfRVm0lt2O
	 k8hnYJ5jFVbspLoGbQTSt7OcsvE1aRLppHfw/6AN9J20GiV3DhprqWfYbWsTA4D8pHXoR
	 LUB9Gq6tytFugeoPTaQpmLJGEOAWihKGKh6bc0MkIYzGyr72p/gP7muvlO8JqKJ2zWSG0
	 QCpOF70jUTkupZ6S3w9ZsZXBIpWE69wTtRtOg1lQDjWEkrfOe2NbiJxvKYLEMe7Duwk/f
	 H5aLLrKEXFVgCe8UAlY6VqZWt/GS4gKLv6qzIMeKJR+qTigW00j/Povm7wl6oeRLKhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337728;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+zsPKthV0a99Y/dngwZN9bT7NJIQOOBWIZGilsxuhU4=;
	b=nAqUp25UJwTzG5vQgEQiaLXe5Rh9y316Zi2BwWn+HP43kZqqgKzommDJ3XvcD/sYMmWK
	 zAa2s4Ik8vz0oA/LISlvWD05SCAn2ko59JqSt3D1NwzFZFe1+sXDmF+iAJpvP2SiCVa/A
	 t5bSoBj8Mv4rAF1jTY6Fskp6WSZ7/cN8IOdzBEUewQJn7CmAvs2tupu+CDbDHvS2col7k
	 l1zzPOGxrovCrEycu+KXDdDFX8RXXqdcUYELe8Q5Qy7sNYSPfgvrdx+906VlBKznaLJTl
	 sFlvdc5UY235dCspplgEvIEA/+Wl0Q7mbmWss2tyusqxllKUtgOthrtthi884utpiDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cNEBdh5f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3AE606A31C
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 19:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cNEBdh5f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E101F0089F;
	Tue, 10 Nov 2026 19:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794337728;
	bh=+zsPKthV0a99Y/dngwZN9bT7NJIQOOBWIZGilsxuhU4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cNEBdh5fV0tXtUXWn/pGR1AIs8mQFpDI5ZL3twAprfStYLTXrX1RKHZwIzg0o3izw
	 y1oh8h+xwO5RN4TIsBcqtJK1NCRDl2DbXLqpDMyNDqAYpAu/UvsN6Kq+E8RG3iiky+
	 v9/BTKj7qItiGNEGDDiGKSd6kJw3MCmSt2uxuGXfGJJ438D2+KtunVMZO+5NaU/JTJ
	 DXWTsv0C5eXhJ5eMU6HDi+5bEqF0UAN8pTGR5TBeb9y0/KJdHObtCZmaXzZNw1XrkF
	 LGnbU65hvc392qh8deGfmceE9mw9JNMxUFsa9ZmXm2yy5W4vuVXqlM+H4n/OjGrbUw
	 KfyJkdKXFe0tA==
Message-ID: <sashiko-outbox-207637@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 28/33] dmaengine: sf-pdma: route error callbacks
 through channel BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <25d7826e0e6738356657f523e6f6cf3450e4b26c.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
 <25d7826e0e6738356657f523e6f6cf3450e4b26c.1794315350.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 19:08:47 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] dmaengine: sf-pdma: unlocked chan->desc read in
  sf_pdma_errbh_tasklet()
- [Medium] dmaengine: sf-pdma: stale error tx_result on reused
  descriptors
--

commit cbd0063b16af2f825d62b2888a259c514966e4ac
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: sf-pdma: route error callbacks through channel BH

This commit routes failed transfer completions in sf-pdma through
vchan_cookie_complete() with DMA_TRANS_ABORTED instead of invoking the
client callback directly from the error tasklet, and kills the driver
tasklets before killing the channel BH on removal.

> diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
> index ca60fb46ade00..992f9f1037028 100644
> --- a/drivers/dma/sf-pdma/sf-pdma.c
> +++ b/drivers/dma/sf-pdma/sf-pdma.c
> @@ -326,9 +326,21 @@ static void sf_pdma_errbh_tasklet(struct tasklet_str=
uct *t)
> =20
>  	spin_lock_irqsave(&chan->lock, flags);
>  	if (chan->retries <=3D 0) {
> -		/* fail to recover */
> +		/* fail to recover: abort this descriptor and move on */
> +		chan->retries =3D MAX_RETRY;
> +		chan->xfer_err =3D false;
>  		spin_unlock_irqrestore(&chan->lock, flags);
> -		dmaengine_desc_get_callback_invoke(desc->async_tx, NULL);
> +
> +		spin_lock_irqsave(&chan->vchan.lock, flags);
> +		list_del(&desc->vdesc.node);

[Severity: High]
Can this cause a use-after-free or NULL pointer dereference on desc?

sf_pdma_errbh_tasklet() reads desc =3D chan->desc at entry before acquiring
chan->vchan.lock, and neither sf_pdma_terminate_all() nor
sf_pdma_free_chan_resources() synchronizes with err_tasklet when freeing
chan->desc:

CPU0                                    CPU1
sf_pdma_errbh_tasklet()
  desc =3D chan->desc;
                                        sf_pdma_terminate_all()
                                          spin_lock_irqsave(&chan->vchan.lo=
ck, ...)
                                          kfree(chan->desc);
                                          chan->desc =3D NULL;
                                          spin_unlock_irqrestore(&chan->vch=
an.lock, ...)
  ...
  spin_lock_irqsave(&chan->vchan.lock, ...)
  list_del(&desc->vdesc.node);          <-- use-after-free
  vchan_cookie_complete(&desc->vdesc);

If sf_pdma_terminate_all() or sf_pdma_donebh_tasklet() clears or replaces
chan->desc before sf_pdma_errbh_tasklet() runs, desc can also be NULL or
already completed, corrupting the virt-dma descriptor lists.  Re-reading
chan->desc under chan->vchan.lock and checking that it is non-NULL before
unlinking and completing it would avoid this.

> +		desc->vdesc.tx_result.result =3D DMA_TRANS_ABORTED;
> +		desc->vdesc.tx_result.residue =3D desc->xfer_size;
> +		vchan_cookie_complete(&desc->vdesc);

[Severity: Medium]
Does a reusable descriptor (DMA_CTRL_REUSE) keep reporting
DMA_TRANS_ABORTED on later successful transfers after an abort?

sf_pdma_probe() sets pdma->dma_dev.descriptor_reuse =3D true, and
vchan_tx_prep() only initializes tx_result to DMA_TRANS_NOERROR and
residue 0 when the descriptor is first prepared.  Once
sf_pdma_errbh_tasklet() overwrites desc->vdesc.tx_result here, neither
sf_pdma_xfer_desc() nor sf_pdma_donebh_tasklet() resets tx_result back to
DMA_TRANS_NOERROR with zero residue, so subsequent successful completions
of the reused descriptor will pass the stale error result and residue to
the client callback.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794315350.gi=
t.allen.lkml@gmail.com?part=3D28
