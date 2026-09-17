Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E5D2DA76C
	for <dmaengine@vger.kernel.org>; Thu, 17 Sep 2026 07:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789629909; cv=none; b=MvOHh+L5ws/gvHLVS6S/lTKJvmkrxg8QZex04FfgGjf+OAtQox9D5/49dDzfscHSkpAkf0klINIoQdn616BtjQsYbesLABDh3qmctOJXKzSPYhTbZ25aG5mdkATvxA922fTWYNoACN+5JaRtnrQ7tXR3QA69OUYR0ChLW5bxqb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789629909; c=relaxed/simple;
	bh=1YZYQdA7cQnN53EzppnJRDei63bVcLlDarIc/XYRlso=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lC+oMfo+VGz4Ry4BZFNKIjdBkSJxrpCHoOybtoF1G69gyxufTV7tOsaJ2sdsN21VMDIEe81pD4/kWW6Mv+KLFoiJlOJ6TCh34opG/qr2DyvD5dqCqkGh9dv5knq7RC9hQkfW8gSp1U4S9s6J/8SW6Ad/9bF4Bg2TMmAudMOxzII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L6UAz3zh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L6UAz3zh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDB61F000FF;
	Thu, 17 Sep 2026 07:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789629907;
	bh=o+KYgt91PVccvN9zLWo4sr7okQCG+kKr8aleLUyNixA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L6UAz3zhtzf53PQ4zIEFFYEo6PY9pYoLPf6sh4p1cb6BOoI5PSUXnX73QQKmg9Wx1
	 JmQ5hhMzJ8nTXhQpGXQLn0sm+jaf8lj9BaeJtPMOU9KEbMJLsYMUCYBKkAAhbarJWB
	 QgvOozCNFzYsPsC4owVG1yC7s2izrEBo4ceJBS+IJ/mscfckr3MsTElKKds1gqSlF9
	 nPpU5QcvUd8mU/GDpcjkSVuvZQcoBhu5KD3j5iCHbkz4OOeBPFvngNLnik4nNtSzG7
	 Ii0eKmVsdq9AyNs77xtvEnk3d4EMtcIucsFFUVtITGFiDInBtSJpb47bI+lxCrBZqk
	 PZj4Wjm5UCDPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dmaengine: rcar-dmac: Add missing
 dma_descriptor_unmap()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, wsa+renesas@sang-engineering.com, vkoul@kernel.org
In-Reply-To: <20260917071208.36888-3-wsa+renesas@sang-engineering.com>
References: <20260917071208.36888-1-wsa+renesas@sang-engineering.com>
 <20260917071208.36888-3-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 07:25:06 +0000
Message-Id: <20260917072507.5BDB61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dmaengine: data corruption due to premature dma_cookie_complete() =
before unmap
--

commit 1e9a738c62158e887202df32a8267f4bc4bfe4cd
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: rcar-dmac: Add missing dma_descriptor_unmap()

This commit adds missing calls to dma_descriptor_unmap() in the threaded IRQ
completion path and the channel reinit path. This prevents streaming DMA=20
mappings from exhausting mapping resources.

> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 2d2baa36feeae..016024858fe5a 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c

[ ... ]

> @@ -1652,6 +1653,7 @@ static irqreturn_t rcar_dmac_isr_channel_thread(int=
 irq, void *dev)
>  		desc =3D list_first_entry(&chan->desc.done, struct rcar_dmac_desc,
>  					node);
>  		dma_cookie_complete(&desc->async_tx);
> +		dma_descriptor_unmap(&desc->async_tx);

[Severity: High]
Could this specific ordering lead to data corruption?=20

By calling dma_cookie_complete() before dma_descriptor_unmap() in
rcar_dmac_isr_channel_thread(), polling clients (via dma_async_is_tx_comple=
te()
or rcar_dmac_tx_status()) checking for completion locklessly might observe
the completion too early.

If they access the destination buffer before the unmap operation finishes
cache invalidations or SWIOTLB bounce buffer copies, it could result in
reading stale data.

Would it be safer to place dma_descriptor_unmap() strictly before
dma_cookie_complete() to prevent clients from seeing stale memory?

>  		list_del(&desc->node);
> =20
>  		dmaengine_desc_get_callback(&desc->async_tx, &cb);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917071208.3688=
8-1-wsa+renesas@sang-engineering.com?part=3D2
