Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DFC31B80D
	for <dmaengine@vger.kernel.org>; Sun, 13 Sep 2026 19:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789329422; cv=none; b=FOGkp7nEyEzbGHvZfpVcU+MBvbnuRwxZ744pVMb/Ry6LN+Tf+eOR/aIubzJ3OJ15wutphsrmGOa3/8eAz07BnWfmutUoGpkVUxBSu+OWlTe8+f7gWja8ADVEPr4vMSGJ/KwFlsLcg0lHrd6gYDkgcTL3h32ltHtByFoGzWzi9T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789329422; c=relaxed/simple;
	bh=z6zw/T5yo97nSHKy7YFTuEEv3sbq0dG/iTKx14HUOoY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zgpp7eC9wx1ypXcoBnzGzdra1Iy7wfO/xevaKHpKUZhTSV/RlCg3RO7io6x0YP7pFrZRp6CwbobQ1VkKPM50Whq2xzmmVkP1g/0iEb5a4hln6aQVqg9qfVR1C3z1QprEzancdnrs/3wHx/sxRP8uJ6SF85qQLL1dSLkBbGwS/F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BloaYMGk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BloaYMGk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C7A1F00893;
	Sun, 13 Sep 2026 19:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789329421;
	bh=9ImE/SogLQMeZNHhf6s8Y2IpMDyJzSIgMEJHHU51SJA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BloaYMGk1G6rYzoXqSzsPaF5/aI+nC+gSi63mVPgRyf82Fupbq2Lf9Sv246DYFKe1
	 DAikyrr50TIZyKAF9yxvzMcpnV29Tqntj0wSTsb0HCWYNqIUAGxt+fJliCh6OczI8v
	 Yt4shb67TgbbEsywETLlWWZcrrgqmcl6QTtTuIBfm6kMWUfXELjgAx1kW6Q/uBmwgx
	 4zv6gy33/c0bCHnByzBIJ+1puVCfBMoQcoKpWklClI6JXrqccCLmEpGlmZHYLOrt0P
	 GWHbYyyzH+2wBaYj3pQdh+qbkvLbAftyCkQTrsl8KMlOY8o1bZ4492TZALpHRnzukJ
	 5zFLm19unhaMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2] dmaengine: bestcomm: make gen_bd init helpers static
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260913194804.39939-1-rosenp@gmail.com>
References: <20260913194804.39939-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 19:57:00 +0000
Message-Id: <20260913195701.20C7A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing bounds check for `psc_num` in `bcom_psc_gen_bd_tx_init` ca=
n lead to an out-of-bounds read on the `bcom_psc_params` array, resulting i=
n a subsequent out-of-bounds memory write.
--

commit 208dbbe4b8a05c7464d2b55c9abc2d1a2ba7e83a
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: bestcomm: make gen_bd init helpers static

bcom_gen_bd_rx_init() and bcom_gen_bd_tx_init() are only called from
the PSC wrapper functions in gen_bd.c, so make them static, drop
their now-unneeded exports, and remove the corresponding header
declarations.

> diff --git a/drivers/dma/bestcomm/gen_bd.c b/drivers/dma/bestcomm/gen_bd.c
> index 8a24a5cbc2633..abe6c19f7148e 100644
> --- a/drivers/dma/bestcomm/gen_bd.c
> +++ b/drivers/dma/bestcomm/gen_bd.c

[ ... ]

> @@ -166,7 +165,7 @@ bcom_gen_bd_rx_release(struct bcom_task *tsk)
>  EXPORT_SYMBOL_GPL(bcom_gen_bd_rx_release);
> =20
> =20
> -extern struct bcom_task *
> +static struct bcom_task *
>  bcom_gen_bd_tx_init(int queue_len, phys_addr_t fifo,
>  			int initiator, int ipr)
>  {
> @@ -192,7 +191,6 @@ bcom_gen_bd_tx_init(int queue_len, phys_addr_t fifo,
> =20
>  	return tsk;
>  }
> -EXPORT_SYMBOL_GPL(bcom_gen_bd_tx_init);

[Severity: High]
This is a pre-existing issue, but does bcom_psc_gen_bd_tx_init() lack a bou=
nds
check for psc_num before calling this function?

While bcom_psc_gen_bd_rx_init() checks if psc_num is out of bounds:

	if (psc_num >=3D MPC52xx_PSC_MAXNUM)
		return NULL;

bcom_psc_gen_bd_tx_init() does not, leading to a direct out-of-bounds read =
on
the statically sized bcom_psc_params array:

	return bcom_gen_bd_tx_init(queue_len, fifo,
				   bcom_psc_params[psc_num].tx_initiator,
				   bcom_psc_params[psc_num].tx_ipr);

The garbage tx_initiator value read out-of-bounds is then passed to
bcom_gen_bd_tx_init() and subsequently used in bcom_gen_bd_tx_reset() as an
array index for an MMIO write:

	out_8(&bcom_eng->regs->ipr[priv->initiator], priv->ipr);

This can be triggered via mpc5200_audio_dma_create() in
sound/soc/fsl/mpc5200_dma.c, where the caller blindly passes the id derived
from the device-tree 'cell-index' property:

	psc_dma->playback.bcom_task =3D
		bcom_psc_gen_bd_tx_init(psc_dma->id, 10, fifo);

Since it calls tx_init before checking the result of rx_init, the out-of-bo=
unds
read and write will unconditionally execute on a bad ID before any error pa=
th
can bail out.

Could a bounds check be added to bcom_psc_gen_bd_tx_init()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913194804.3993=
9-1-rosenp@gmail.com?part=3D1
