Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B5B37B00E
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187334; cv=none; b=tGajmXqLInnxFY3xc9riERVrD6RRGhIJSSVhdFUfbWIrFl4H3fkXcGg5Lxr/zaXjlLAbuIlnYhnuD8UFsfPInG76so2sncai3w1/Kwa+mNANKCTQ6Qn/wh3A6VDPZMIREyUaiIq7LgqGGrXIu+y7OfVWb43TIRPH/Wab78F4Am4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187334; c=relaxed/simple;
	bh=DcgGE8WPvm4aZwsrCG/iB0hJaCH42cZp6yp/vOsz3lg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Px+4WsoRzhCeG5gNwCBEooHdvTOHgZO//zSbZmHLdL/AfF4OIPdJ3CIjlhMJrBp4gXOJXBZuqYZwpmE9jh1rbtDBgYLT9DwzOAKxteubOWHIYJ0eq29BM31RpOmYY/8RtaMRK9v3VGN5hU9Mkq3BCfIH0ImHShlFMWiKDH/VlVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GzlXzdA8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GzlXzdA8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C89041F000E9;
	Mon, 27 Jul 2026 21:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785187333;
	bh=UTtVakLojixdaEhT7JwB86/iXUFu7AAR8vPM9yxx25E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GzlXzdA8MOQnyFpgmoJxq8CUoE17/LF4/L9A2N6oDm1PKO3XzVp3VWKnGAIEjAfcs
	 f9gixmc7NcQj+anrixm8g6Bxp0100MyMw3Nz7ye2f8Bx8/5QDYCQV2RHbxQRv6g6yz
	 NYkFngQUimi853QyTXC3OFdiN8dCJcHw2ppAof+ILfBc9xzGFDIiepcntDLZofiPup
	 wXWXWz9PEus0kr9THcY6T8/fd3wLLsdPL3ruq3oq19LxhPSXUuXzMuPNXojUG79JT6
	 WFJTp+4lsaMArdw03JJ/z96FbN1NuFB71XXG+RR4C5vUjfaO3qNk9T5BxIBJju49XM
	 JuN9H8+nQOkxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 64/64] dmaengine: switchtec: use channel BH helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <5eb60739b22e88b9220179dc024186c19724db28.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <5eb60739b22e88b9220179dc024186c19724db28.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:22:11 +0000
Message-Id: <20260727212212.C89041F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] dmaengine_synchronize() incorrectly aborts pending descriptors ins=
tead of waiting, violating the DMA API contract.
- [High] Lost completion results for out-of-order descriptors leads to inco=
rrect callback data.
- [High] Channel reset in `switchtec_dma_synchronize` fails to zero host me=
mory, causing permanent desynchronization.
--

--- Patch [64]: [PATCH v2 64/64] dmaengine: switchtec: use channel BH helpe=
rs ---
commit ae138df18f2b5dc2645b9652b5d982dbf7b2fde2
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: switchtec: use channel BH helpers

Replace the per-channel descriptor completion tasklet with the shared
dma_chan BH helpers. Client callbacks remain in softirq context while
using the common scheduling and teardown mechanism.

> diff --git a/drivers/dma/switchtec_dma.c b/drivers/dma/switchtec_dma.c
> index 3ef9286406159..f3459799e05d9 100644
> --- a/drivers/dma/switchtec_dma.c
> +++ b/drivers/dma/switchtec_dma.c

[ ... ]

> @@ -584,6 +582,7 @@ static void switchtec_dma_synchronize(struct dma_chan=
 *chan)
> =20
>  	int rc;
> =20
> +	dma_chan_kill_bh(chan);
>  	switchtec_dma_abort_desc(swdma_chan, 1);

[Severity: High]
This is a pre-existing issue, but does switchtec_dma_synchronize() violate
the DMA API contract here by actively destroying the channel's state?

The DMA API requires dmaengine_synchronize() to merely wait for the
completion of previously terminated or submitted transfers. Instead, this
forcefully aborts all pending descriptors and skips their callbacks, which
would drop pending transfers and leave clients with missing completions.

[Severity: High]
This is also a pre-existing issue, but further down in
switchtec_dma_synchronize(), the software ring state is reset:

	spin_lock_bh(&swdma_chan->complete_lock);
	swdma_chan->comp_ring_active =3D true;
	swdma_chan->phase_tag =3D 0;
	swdma_chan->tail =3D 0;
	swdma_chan->cq_tail =3D 0;

Does this channel reset fail to zero the backing hardware memory (hw_cq)?

Since the memory retains previous phase tags, the software might incorrectly
interpret stale data at index 0 as a new hardware completion, causing it to
read garbage and permanently desynchronize from the hardware state machine.

> =20
>  	rc =3D enable_channel(swdma_chan);

[ ... ]

> @@ -820,9 +819,10 @@ static int switchtec_dma_resume(struct dma_chan *cha=
n)
>  	return ret;
>  }
> =20
> -static void switchtec_dma_desc_task(unsigned long data)
> +static void switchtec_dma_desc_task(struct dma_chan *chan)
>  {
> -	struct switchtec_dma_chan *swdma_chan =3D (void *)data;
> +	struct switchtec_dma_chan *swdma_chan =3D
> +		container_of(chan, struct switchtec_dma_chan, dma_chan);
> =20
>  	switchtec_dma_cleanup_completed(swdma_chan);

[Severity: High]
This isn't a bug introduced by this patch, but does
switchtec_dma_cleanup_completed() lose the completion results for
out-of-order descriptors?

When the hardware completes a descriptor out-of-order, res is computed but
immediately discarded by a continue:

		/*  Out of order CE */
		if (se_idx !=3D tail) {
			spin_unlock_bh(&swdma_chan->complete_lock);
			continue;
		}

When se_idx =3D=3D tail is eventually met, the catch-up loop reuses the exa=
ct
same local res variable for all queued completions:

		do {
			dma_cookie_complete(&desc->txd);
			dma_descriptor_unmap(&desc->txd);
			dmaengine_desc_get_callback_invoke(&desc->txd, &res);
			...

Could out-of-order DMA completions lose their actual result status and
residue, causing them to incorrectly inherit the status of the last
sequentially completed descriptor?

>  }
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D64
