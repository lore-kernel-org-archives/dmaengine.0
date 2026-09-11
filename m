Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066314C150F
	for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 21:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789163309; cv=none; b=MA18OSxk/a2IDrQG3W27twp5K37jjC4MUprLFDVjSkBDLXjM/sLio9tzL/LLa/T2TEJxFJOjlTZDCifSMRx6L+3WhR5zO0URI0OzKbBb8lR8IwZgTmV564RBWQBvsiFQK018CtXrk4+rp78yfm3XYwzQMTL3xV4JuH/39cPs05U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789163309; c=relaxed/simple;
	bh=kEyL4iiH1kryY8Nju7FagvqxmuIgCtlI+dDkhW6kCDk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AIOxOiTfXUcUa9/JlHOAoT/hlLLtZvClLsniwlFMrXnQUevU2cOBG9sLdvqRtNduOSebceQ+2PcE5Q64DxfW10kpYITVmsQWYj9+6qA06YIpWQSmz3jeWiIFEjAIF3DLN8QWD11tTmyiKD/+TsQu/S+KCPozS53iJiKuf2VbWwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kVcgkDtI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kVcgkDtI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 367B61F000FF;
	Fri, 11 Sep 2026 21:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789163307;
	bh=wDdaXgHRsOl3SmSCH3cWx6uO9+ss/OcYutG6XzkxGCQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kVcgkDtIRxuixKcWRzBak/1iBAPo6O2EiheMewiKUjwGgiMSklBdow0T7aUniCLm9
	 VCECQ0Jwz6MYvf/t0m5MAFkuZ/bP490FH+JJ45WTG/rgIDjcv52kVXslmsVD/ZmBaK
	 ZTFEmfwEVYSk9gHLAQYAKH+G/DB9OPjgIahTOabJAsJsYHIdVBzupsTqZgRWZHfzsP
	 B3Hf3iN/An5MmUZq0nLxd4E06r0OWLM4HHNhU+jLodrXIfGsA1k9sM22c0iWd1csEA
	 KOqsXAjHIvRovJY3OdcMH156Q6m0ROf5iQdGNJuisNbhQkGrEJCs9MFxYQ4gB56YMD
	 Z1aQv0YSBk3yw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv3] dmaengine: bestcomm: gen_bd: fix out-of-bounds access
 in PSC parameter lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260911213747.132694-1-rosenp@gmail.com>
References: <20260911213747.132694-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 21:48:26 +0000
Message-Id: <20260911214827.367B61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the patch fails =
to completely resolve the vulnerability. The patch correctly addresses an o=
ut-of-bounds array access in `bcom_psc_gen_bd_rx_init()` by checking `psc_n=
um >=3D ARRAY_SIZE(bcom_psc_params)`, but leaves the identical vulnerabilit=
y unpatched in its sibling function `bcom_psc_gen_bd_tx_init()`. The author=
 explicitly claims in the commit message that the TX bounds check was omitt=
ed because the function is 'not used anywhere anyway.' However, `bcom_psc_g=
en_bd_tx_init()` is exported and actively used in `sound/soc/fsl/mpc5200_dm=
a.c`. In `mpc5200_audio_dma_create()`, `tx_init` is called unconditionally =
immediately after `rx_init`, reusing the exact same unvalidated device tree=
 `cell-index`. If a malformed `cell-index` is provided, `rx_init` gracefull=
y returns `NULL`, but execution continues to `tx_init`, where the unprotect=
ed out-of-bounds array read still occurs. These garbage values are then use=
d as an index for an MMIO write in `bcom_gen_bd_tx_reset()`, resulting in a=
 potentially severe out-of-bounds MMIO access.
--

commit fe70e15aeccf81a4b8cdfa4a3e93e93a4e989ae4
Author: Rosen Penev <rosenp@gmail.com>

    dmaengine: bestcomm: gen_bd: fix out-of-bounds access in PSC parameter =
lookup
   =20
    The bcom_psc_params[] array has 6 entries (indices 0-5), but
    bcom_psc_gen_bd_rx_init() checked against MPC52xx_PSC_MAXNUM which can
    be 12 when CONFIG_PPC_MPC512x is set, allowing indices 6-11 to pass
    and read past the array.
   =20
    A malformed device tree with a large cell-index could therefore trigger
    an out-of-bounds read. The garbage initiator and ipr values would then
    be used for MMIO writes via out_8(&bcom_eng->regs->ipr[...], ...),
    potentially causing out-of-bounds MMIO accesses.

> diff --git a/drivers/dma/bestcomm/gen_bd.c b/drivers/dma/bestcomm/gen_bd.c
> index 8a24a5cbc2633..ce59a79325657 100644
> --- a/drivers/dma/bestcomm/gen_bd.c
> +++ b/drivers/dma/bestcomm/gen_bd.c
> @@ -315,7 +315,7 @@ static struct bcom_psc_params {
>  struct bcom_task * bcom_psc_gen_bd_rx_init(unsigned psc_num, int queue_l=
en,
>  					   phys_addr_t fifo, int maxbufsize)
>  {
> -	if (psc_num >=3D MPC52xx_PSC_MAXNUM)
> +	if (psc_num >=3D ARRAY_SIZE(bcom_psc_params))
>  		return NULL;
> =20
>  	return bcom_gen_bd_rx_init(queue_len, fifo,

[Severity: High]
This is a pre-existing issue, but does this patch fail to completely resolve
the vulnerability by leaving the identical out-of-bounds access unpatched in
the sibling function bcom_psc_gen_bd_tx_init()?

The bcom_psc_params array access in bcom_psc_gen_bd_tx_init() remains
completely unprotected by bounds checks:

drivers/dma/bestcomm/gen_bd.c:bcom_psc_gen_bd_tx_init() {
    ...
	return bcom_gen_bd_tx_init(queue_len, fifo,
				   bcom_psc_params[psc_num].tx_initiator,
				   bcom_psc_params[psc_num].tx_ipr);
}

The patch omits the bounds check in the TX path on the assumption that the
function is unused, but the function is exported and actively used here:

sound/soc/fsl/mpc5200_dma.c:mpc5200_audio_dma_create() {
    ...
	psc_dma->playback.bcom_task =3D
		bcom_psc_gen_bd_tx_init(psc_dma->id, 10, fifo);
    ...
}

In mpc5200_audio_dma_create(), tx_init is called unconditionally immediately
after rx_init, reusing the exact same unvalidated device tree cell-index. I=
f a
malformed cell-index is provided, rx_init gracefully returns NULL, but
execution continues to tx_init, where the unprotected out-of-bounds array r=
ead
still occurs.

These garbage values are then used as an index for an MMIO write in
bcom_gen_bd_tx_reset(), resulting in a potentially severe out-of-bounds MMIO
access:

drivers/dma/bestcomm/gen_bd.c:bcom_gen_bd_tx_reset() {
    ...
	out_8(&bcom_eng->regs->ipr[priv->initiator], priv->ipr);
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911213747.1326=
94-1-rosenp@gmail.com?part=3D1
