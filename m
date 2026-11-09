Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203908;
	b=1iBgSSKBzk53trL4n4zpnekymonb50HabjMxylAh3E7MQ4XDQrSNl2QNc67XUU+PooJe
	 xSH7LPYyQly4CeBO8crAcD2tnPW2dj5XNbZK19RjpsazmqMpEivNCHo7blToWJEYbgCXh
	 0rdRg3wbSts0thrIKPhDGj9p2sd+ZI/5y1f+4H8HfMRGDM1kLEtLL/XStz9MED6gMo3Rq
	 Hx7o+89Z59hUQj1RrofccmRvtWGuGLMMY6hm9MuMcN2EDVPsCAYQ4U085rJNTEMN+3qZI
	 Qy8W1PvOZCyFBVXK5AVWN2JVI0asvGFqE2IjdKpxML1aMjAm99mkQeRITXK4AMpRlrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203908;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ertfhDn0apIHT7iaw1WUIFk4cHrpX2efgKDZ4x3NK2c=;
	b=be8o2fA7AFM7p/jyyCNdbVFfmS8O4N9bCN5ntgeqzjC9123w0vITH9vW4cMRdDKXYfTB
	 EKYyRO+BzoQwVbY1FLBH6HJW2qEozcWSiWN9FKUaIQyw1p2nQ5qC6xP92e/DRkLK36nNr
	 PkxHlqYpKjiqxf1T0Hcc0QBcjgTmKgpsjm0IOKawb84WomPONrScsUmqZ4wR/1ASWoXPM
	 wNTV7wvKUomrPsq7ww+gm9HnUcO6jzvNBAu2tbHaOrQEj016eKxxsQEjaaElhHUF0FWiS
	 2/3xwyS4ld9+S49JvuJWVM6A3kdSDNfqmF06GfOoqBJFKx2EqlTa12qPjK6+5ukYpXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BHoVM6Pn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C15606A321;
	Mon,  9 Nov 2026 05:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BHoVM6Pn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76CF31F0089F;
	Mon,  9 Nov 2026 05:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794203907;
	bh=ertfhDn0apIHT7iaw1WUIFk4cHrpX2efgKDZ4x3NK2c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BHoVM6Pn/YgO/PiOKctr1U3qj+2OF1/XhWYLY0qd/s4ueqekUtDFjPibuVZrpRhe4
	 MDDBKECPQpLMfxLunLaUL9ZVtCCXsAHlSQecf+yTWst8xR7RkB7SPR+dXhv5A5j+jg
	 k2FWSySlVycei49b/QCdTbhCQB2j10LLVCZyqE/de3Oe+68JWm8Y1i8Kq1PE04TRZ2
	 8OjF2bo4P/riWfALJMT76cdCxfPdLp74mO8FT9IBKx4q8uIdLg3qJtCSqlYk+P1UDV
	 t9KDbTrByErATJ8CmirboUeDTUsIhxacD1GVC2Z53G8AxyvmMPLwpL2VexG9htwo+x
	 Im2hIwOq9OoSg==
Message-ID: <sashiko-outbox-204468@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shan-Chun Hung" <shanchun1218@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261109052900.2960473-3-shanchun1218@gmail.com>
References: <20261109052900.2960473-1-shanchun1218@gmail.com>
 <20261109052900.2960473-3-shanchun1218@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 05:58:27 +0000
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
- [High] dmaengine: ma35d1-pdma: cyclic abort UAF in
  ma35d1_pdma_interrupt()
--

commit 6cfee31e98b745df1c08664e60fae82420194681
Author: Shan-Chun Hung <shanchun1218@gmail.com>

dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver

This commit adds a DMA engine driver for the PDMA controller in the Nuvoton
MA35D1 SoC, supporting memory-to-memory, slave scatter-gather, and cyclic
transfers across 10 channels.

> diff --git a/drivers/dma/ma35d1-pdma.c b/drivers/dma/ma35d1-pdma.c
> new file mode 100644
> index 0000000000000..fef78e6d10d78
> --- /dev/null
> +++ b/drivers/dma/ma35d1-pdma.c
[ ... ]
> +static void ma35d1_pdma_complete(struct ma35d1_chan *ch)
> +{
> +	if (!ch->desc)
> +		return;
> +
> +	vchan_cookie_complete(&ch->desc->vd);
> +	ma35d1_pdma_start_desc(&ch->vc.chan);
> +}
> +
> +static irqreturn_t ma35d1_pdma_interrupt(int irq, void *devid)
> +{
> +	int i;
> +	bool handled =3D false;
> +	struct ma35d1_pdmadev *pdmadev =3D devid;
> +	struct ma35d1_chan *ch;
> +
> +	for (i =3D 0; i < PDMA_MAX_CHANS; i++) {
> +		unsigned long flags;
> +		bool done, abort;
> +
> +		ch =3D &pdmadev->channels[i];
> +
> +		spin_lock_irqsave(&ch->vc.lock, flags);
> +
> +		done =3D readl(ch->base + PDMA_TDSTS) & BIT(i);
> +		abort =3D readl(ch->base + PDMA_ABTSTS) & BIT(i);
> +
> +		if (done || abort) {
> +			handled =3D true;
> +
> +			/* Ack both flags first so a new descriptor is not completed twice. */
> +			writel(BIT(i), ch->base + PDMA_TDSTS);
> +			writel(BIT(i), ch->base + PDMA_ABTSTS);
> +
> +			if (ch->desc) {
> +				if (abort) {
> +					ch->desc->vd.tx_result.result =3D DMA_TRANS_ABORTED;
> +					ma35d1_pdma_complete(ch);
> +				} else if (ch->desc->cyclic) {
> +					vchan_cyclic_callback(&ch->desc->vd);
> +				} else {
> +					ma35d1_pdma_complete(ch);
> +				}
> +			}
> +		}

[Severity: High]
Can calling ma35d1_pdma_complete() on an aborted cyclic descriptor cause a
use-after-free in vchan_complete()?

When a cyclic period completes, vchan_cyclic_callback() sets ch->vc.cyclic
to &ch->desc->vd.  If PDMA_ABTSTS then fires on that channel,
ma35d1_pdma_complete() calls vchan_cookie_complete(), which moves the
descriptor onto ch->vc.desc_completed without clearing ch->vc.cyclic, and
ma35d1_pdma_start_desc() clears ch->desc to NULL.

When vchan_complete() runs, it invokes the callback twice (once via
ch->vc.cyclic and once via desc_completed) and frees the cyclic descriptor
while ch->vc.cyclic still points to it.  If ma35d1_terminate_all() runs
before the tasklet, it sees ch->desc =3D=3D NULL, skips vchan_terminate_vde=
sc(),
and frees the descriptor from desc_completed, leaving ch->vc.cyclic dangling
for vchan_complete() to dereference.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109052900.2960=
473-1-shanchun1218@gmail.com?part=3D2
