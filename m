Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035723B2FC8
	for <dmaengine@vger.kernel.org>; Tue, 26 May 2026 09:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779786715; cv=none; b=XRaCgP9cH5gEi92oP7CLWmnnQAy7vyUvkkD/g4rojhpAFcqURgaMqkk4grXFP0ydpcaCuvfRL1p55dTx1idF1eXLg/r7R7uWMs3vAqqjg8nLwYhjN7rbSht4Yf6UNyra92bqkRqVG0s6a9yGJrUm8xTYh0E3nbINZ3MtJC29oDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779786715; c=relaxed/simple;
	bh=8wmMdg/KMWkdiuGbB0Z4f/ImUz/zgjOCvkgJi986OIo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Hvrree2cgilTepr9zROtzm7W+CQSPJNpmqJ63fTeb2odDqtliMPOMTAQsbvwymhq+fpFW+XJ+kawOwHyWrc55s/tOuqgVHhxdPeoxobMwcWfF233O7i+1HYO2Vlkv437ZRUeW8Ywj6tTZYW6FUWjwLdFEDcQ2OdQj/VQ6Z8/Kp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4LvhT/7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4LvhT/7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B8E1F000E9;
	Tue, 26 May 2026 09:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779786713;
	bh=GX9hs1xBdQlZr3dUVE01s763aawj/3CilaFRMUVTGBU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E4LvhT/7FN0D+ZPAf1g2KF67kkz07Sa58GGqzjaOWmc9omWkHaHTj2F9fW78kYGqK
	 RBmCv4L9o7xn8yoDcjEa8cFhuwkEZy3HDLgobiKpb5oDJ4ah0ZO03pLTrtHJwgfDgp
	 uAdwaySZ3sYnXn0WGFVAeqKkceycag5mlO0CGteQU1eXt8JGxgBN1emxGLV3G+SRue
	 rDR0z6E8aUfn+zuw7jgMxkaa1Afc3JXKgCSBCUNrBh9y/bPVzfVSx8Ymk26qu+AIrX
	 aS7swWuglAwwSrXnr8RIHsPGFQxmfJOFMDNiEJi8OyUGGCafP4e4AVEO4SKejfAc38
	 56p4yLocKOHIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 11/18] dmaengine: sh: rz-dmac: Drop the update of
 channel->chctrl with CHCTRL_SETEN
Reply-To: sashiko-reviews@lists.linux.dev
To: "Claudiu Beznea" <claudiu.beznea@kernel.org>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260526084710.3491480-12-claudiu.beznea@kernel.org>
References: <20260526084710.3491480-12-claudiu.beznea@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 09:11:53 +0000
Message-Id: <20260526091153.A5B8E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The scatter-gather length (sg_len) is not validated against the ha=
rdware descriptor ring buffer size (DMAC_NR_LMDESC), leading to ring buffer=
 self-overwriting and data corruption.
--

commit b5b7f66ce5e55b5fb6774aa2e02322dedba11acd
Author: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

dmaengine: sh: rz-dmac: Drop the update of channel->chctrl with CHCTRL_SETEN

This commit stops updating channel->chctrl with CHCTRL_SETEN during
descriptor preparation. The bit is already explicitly set when enabling
the hardware, and removing it here prevents conflicts with the upcoming
cyclic DMA suspend to RAM configuration sequence.

> diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
> index 557364443a5fd..c9c00650ddd5d 100644
> --- a/drivers/dma/sh/rz-dmac.c
> +++ b/drivers/dma/sh/rz-dmac.c

[ ... ]

> @@ -428,7 +428,7 @@ static void rz_dmac_prepare_descs_for_slave_sg(struct=
 rz_dmac_chan *channel)
> =20
>  	rz_dmac_set_dma_req_no(dmac, channel->index, channel->mid_rid);
> =20
> -	channel->chctrl =3D CHCTRL_SETEN;
> +	channel->chctrl =3D 0;

[Severity: High]
This is a pre-existing issue, but while looking at this function, does the
driver validate sg_len against the hardware descriptor capacity?

Looking at the earlier loop in rz_dmac_prepare_descs_for_slave_sg():

    for (i =3D 0, sg =3D sgl; i < sg_len; i++, sg =3D sg_next(sg)) {
        ...
        if (++lmdesc >=3D (channel->lmdesc.base + DMAC_NR_LMDESC))
            lmdesc =3D channel->lmdesc.base;
    }

If a client submits a scatterlist with more than DMAC_NR_LMDESC (64)
elements, the lmdesc pointer wraps around and overwrites the initial
descriptors of the current transfer.

Since desc->start_lmdesc points to the beginning of the buffer, could
this cause the hardware to execute the corrupted descriptor (containing
the 65th segment's data) and skip the first 64 segments?

If CHCFG_DEM is cleared in the overwritten descriptor, could this lead
to silent data corruption by prematurely terminating the transfer while
the driver still marks it as completed?

I noticed that subsequent patches in this series (like the one adding
cyclic DMA support) correctly add a length check for cyclic transfers,
but it appears slave SG lists remain unchecked.

>  }
> =20
>  static void rz_dmac_xfer_desc(struct rz_dmac_chan *chan)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526084710.3491=
480-1-claudiu.beznea@kernel.org?part=3D11
