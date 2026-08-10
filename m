Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8EB2E738C
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387419; cv=none; b=nv1/8/DwKO5GG+UkzdgoyCndQPGHiD7ioncZovm286v3Wq6a0alXhBeQTrHXz8/RZVMrbBvUvSswyC7QreHl6JU67wc40Xy+6tSrXdgIDxKjJL/pnGtmqNiKS+aNsYNZnY01Y7xUxXeDmfdwgs78QessGbXJffKTeq5TZTYj16U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387419; c=relaxed/simple;
	bh=NUuMDX87jN0ky8uX+FAakz/2Rbk8yW0VaevtSIbqGnw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UqeaqkdUwg9nG+LX62C+WQGIBn33VEuzWJ64y0YozkffK5+0FcH6RnOILW8OKKuHToTbYaKNVLwvr1p3/rUWQ2Z6u4q87sz+liuy3HuGF24h2g06zbArH1pPF8IA3oIEOFiVxQiCsXvbswX7MvYSo03iEZWgd9E4WIiQwzS/ZpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k9gKehK9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k9gKehK9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C121F000E9;
	Mon, 10 Aug 2026 18:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786387418;
	bh=6dt8LOK2A8yBz7aAZ2hnGTX8UAQM8bo3XsfvzLIuHiE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k9gKehK9K9AOzoKNa+T/QzaHMCm991/AZwHGQGBLZuC5bRP7BglYouALa6oI9h5s+
	 U1EcVz/ykPprktf9QWlBC1nTiWb7qGfG0QNfH3I5IBgJlYkGj3LWaCPdyVaDhE5Y7u
	 pn7sd12mUOT8wqHXggvyli6f++bCvtEfuMrvpA1kImGL5cSifRqmGu0L6WpxPfEPRX
	 70cG8pKyl1aqJEzKLD9M7fSXh4PRcrr0pXk26AMUhcR4P0rHr7BVF0+ezBvgthFfGg
	 gB07NQKCn+aKmzWmK58HhGImjBrFNeZzeAyXTs8gZLY2ua7EEh+/+9j+gW3SdRUvrR
	 EwqInSfeaYa+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 34/34] dmaengine: switchtec: use channel BH helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <c91231fb254131d62306600a19d8f97231b3158f.1786384169.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <c91231fb254131d62306600a19d8f97231b3158f.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:43:37 +0000
Message-Id: <20260810184337.C2C121F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Stale hardware completion state is incorrectly processed after cha=
nnel synchronization, leading to data corruption.
--

--- Patch [34]: [PATCH v3 34/34] dmaengine: switchtec: use channel BH helpe=
rs ---
commit d57e70e2d9fa1493ca8fd6bc467970ca44d80a8e
Author: Allen Pais <allen.lkml@gmail.com>
Subject: dmaengine: switchtec: use channel BH helpers

Replace the per-channel descriptor completion tasklet with the shared
dmaengine BH helpers. Client callbacks remain in softirq context while
using the common scheduling and teardown mechanism.

> diff --git a/drivers/dma/switchtec_dma.c b/drivers/dma/switchtec_dma.c
> index 3ef9286406159..fdc28a45e8586 100644
> --- a/drivers/dma/switchtec_dma.c
> +++ b/drivers/dma/switchtec_dma.c
[ ... ]
> @@ -584,6 +582,7 @@ static void switchtec_dma_synchronize(struct dma_chan=
 *chan)
> =20
>  	int rc;
> =20
> +	dmaengine_kill_bh(chan);
>  	switchtec_dma_abort_desc(swdma_chan, 1);
> =20
>  	rc =3D enable_channel(swdma_chan);

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for stale
hardware completion state to be incorrectly processed after channel
synchronization?

Further down in switchtec_dma_synchronize(), the software state variables a=
re
reset:

	swdma_chan->comp_ring_active =3D true;
	swdma_chan->phase_tag =3D 0;
	swdma_chan->tail =3D 0;
	swdma_chan->cq_tail =3D 0;
	swdma_chan->cid =3D 0;

However, the hardware completion queue memory (swdma_chan->hw_cq) is not
cleared. If previous hardware completions left non-zero phase tags in the
completion queue, would switchtec_dma_cleanup_completed() see
le16_to_cpu(phase_tag) !=3D swdma_chan->phase_tag and process the stale ent=
ries
as new completions?

This might cause the client driver to read incomplete data or reuse buffers
that are still under active DMA.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D34
