Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0850377A97
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 05:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784783683; cv=none; b=DyNy62SUuc4KqUaz6Bb/EoR763C631AAvoKF26pR9xRbKT5YrsQDzZeX5btRaYl9JuoBdfgmhYnudS1YOVEj/YEgDec41L39tU+sEFLfcpqXBv4dwJDstmiuNqXWqwD3A60bqYZCNZs61NP3ivEZQw6m4hIc8NjBQf+Clh2Qgtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784783683; c=relaxed/simple;
	bh=5pC8OBPaguodWQUkb8Mlx0S96oi548YDZ68oMRJyV0o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hF184iupuy7MI/U4ihZGKHgkqMbST2iVQBXg3GfJ9ozofK5n2tVu9j7TnKz/3MbF1WCXgIan0Xpo1rOHjFIlxSvtFa4T7ziaCuWc+ry/0+5OPuXRBL7SVcEJm9eyrGPu86+DxbQ4P5svQ9KFQmEBDbC5cORS4DxIMVXVZo9UOO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB1E51F000E9;
	Thu, 23 Jul 2026 05:14:41 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: at_hdmac: fix sparse '__iomem' cast warning
 in memset helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260723050335.270146-1-rosenp@gmail.com>
References: <20260723050335.270146-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 05:14:41 +0000
Message-Id: <20260723051441.EB1E51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The patch leaves a redundant `(u32 *)` cast in `atc_prep_dma_memset=
_sg()` despite the commit message claiming to eliminate it.

Pre-existing issues:
- [High] Scatter-gather memset does not duplicate the fill byte across the =
32-bit hardware transfer word, breaking memset for non-zero values.
--

--- Patch [1]: [PATCH] dmaengine: at_hdmac: fix sparse '__iomem' cast warni=
ng in memset helpers ---
commit dc753f3b1d4af7a33d407969b7dd8472cf0ea85c
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: at_hdmac: fix sparse '__iomem' cast warning in memset helpers

This commit fixes a sparse warning caused by assigning a dma pool pointer
to an iomem pointer. It changes the type of the memset_vaddr to match its
actual usage and removes the need for type casting.

Link: https://lore.kernel.org/oe-kbuild-all/202607231110.8MqNRj0Q-lkp@intel=
.com/

> diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
> index e5b30a57c477a..f9c336630fa25 100644
> --- a/drivers/dma/at_hdmac.c
> +++ b/drivers/dma/at_hdmac.c

[ ... ]

> @@ -1168,7 +1168,7 @@ atc_prep_dma_memset_sg(struct dma_chan *chan,
>  	struct at_dma		*atdma =3D to_at_dma(chan->device);
>  	struct at_desc		*desc;
>  	struct scatterlist	*sg;
> -	void __iomem		*vaddr;
> +	u32			*vaddr;
>  	dma_addr_t		paddr;
>  	size_t			total_len =3D 0;
>  	int			i;

Further down in atc_prep_dma_memset_sg(), the code assigns the fill value
to vaddr:

> 	*(u32*)vaddr =3D value;

[Severity: High]
This is a pre-existing issue, but does this assignment properly duplicate t=
he
fill byte across the 32-bit transfer word for non-zero values?

In atc_prep_dma_memset(), the fill pattern is explicitly shifted and combin=
ed
across all 4 bytes. Here it seems to just assign the raw value directly. Co=
uld
this result in the DMA hardware copying a pattern like 0x000000AB instead of
0xABABABAB, zeroing out 3 out of every 4 bytes for non-zero fills?

[Severity: Low]
This isn't a bug, but since vaddr is now declared as u32 *, is the (u32 *)
cast still needed here?

The commit message states that changing the vaddr type eliminates the need =
for
the cast, but it looks like the cast was only removed in atc_prep_dma_memse=
t()
and remains here in atc_prep_dma_memset_sg().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723050335.2701=
46-1-rosenp@gmail.com?part=3D1
