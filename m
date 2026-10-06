Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB323280035
	for <dmaengine@vger.kernel.org>; Tue,  6 Oct 2026 01:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791249140; cv=none; b=e/NZaMQ7F2kozQqMhM+v0I3nEBBsb+PmsZ0+mnSnHkVT7wxcw5ROOc0ej9uwffqUiGW+AdkLGkx0cwvn4IB+0wwHfFSym+hIWxDv54NrlT2YDZ+EbqVia5+3UMGqRytQtagSA1F36mPR3373wjx2fndz6G0aaChlXTmPj7c5IZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791249140; c=relaxed/simple;
	bh=zNkdFLAwO1TAWhjjGjNI1hAJkHN4XZbbEPX9wTYE/ec=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gsbJ3PIqThItaUJLRpHZUY5fUz+U9cmoPo/+NLswqlHdbs5vyjBdVA6JRR3UbdEgzIJ4/WWayRIXgqxarLCK767So/U0vIHuNtTlKaOfcNqevbp7R0pANpYGNgCHHJfoBT2Xeu89QJOZm02A7fXQmDSUI0ygH7nFLApa3UmNsT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WhCL7jhB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WhCL7jhB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2492C1F000FF;
	Tue,  6 Oct 2026 01:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791249138;
	bh=pYvSNEPEp+28JwI493/phtGUNCTsId8c9iYLgf/fHGU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WhCL7jhBrli3NjQ/wTNugcgleU8QT50kjzYx2ea5riv9W6iYM6AFXZiTX5vzseJIZ
	 XcrBJ9BhWcGQq59tADmK8mPBnrHC1i4qPIP4JOZlBWdXtYjhQU80Ucts5fts8H2G5U
	 jqKD1uFb7hXC/nNEBJzizqUH7T2VEKLhhIrKw8wkTNLBi1bpvabzod0VReUwfkw8J5
	 q+GEwBOkHYYqIsuIX9ZZZDgym2ulS0Kn9XSm0QPN6Iw6zHaZwNlRZxhhj/bLPqv8L2
	 b5p3BiUjJB2NYd5Ej+yZfdWOCXb06eGlyITuKU5Gox1t5S9wmRlyKF34T8rvi8XhuQ
	 CLDvyV9B52/nw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] dmaengine: dw-axi-dmac: Decode errors in the
 transfer failure log
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roland Dreier" <rolanddreier@rivian.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20261006-dw-axi-fixes-v1-3-3b319e456d93@rivian.com>
References: <20261006-dw-axi-fixes-v1-0-3b319e456d93@rivian.com>
 <20261006-dw-axi-fixes-v1-3-3b319e456d93@rivian.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 01:12:17 +0000
Message-Id: <20261006011218.2492C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dmaengine: dw-axi-dmac: torn reads of hardware registers during =
error logging
--

commit 6d61e30d4aa304e36fef59b004f04b0033e152dd
Author: Roland Dreier <rolanddreier@rivian.com>
dmaengine: dw-axi-dmac: Decode errors in the transfer failure log

This commit decodes errors in the transfer failure log for the dw-axi-dmac
driver. It reports the first matching error name and includes the SAR, DAR,
and LLP registers for diagnostic context, avoiding dumping every LLI on
standard data errors.

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index 88362f1812071..e5a259e79a386 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c

[ ... ]

> @@ -1078,11 +1108,19 @@ static noinline void axi_chan_handle_err(struct a=
xi_dma_chan *chan, u32 status)
>  	/* Remove the completed descriptor from issued list */
>  	list_del(&vd->node);
> =20
> -	/* WARN about bad descriptor */
> +	/*
> +	 * SAR and DAR advance as each burst is issued, so with bursts still
> +	 * outstanding they can be a little past the one that failed.
> +	 */
>  	dev_err(chan2dev(chan),
> -		"Bad descriptor submitted for %s, cookie: %d, irq: 0x%08x\n",
> -		axi_chan_name(chan), vd->tx.cookie, status);
> -	axi_chan_list_dump_lli(chan, vd_to_axi_desc(vd));
> +		"%s for %s, cookie: %d, irq: 0x%08x, SAR: 0x%llx DAR: 0x%llx LLP: 0x%l=
lx\n",
> +		axi_chan_err_str(status), axi_chan_name(chan), vd->tx.cookie,
> +		status, lo_hi_readq(chan->chan_regs + CH_SAR),
> +		lo_hi_readq(chan->chan_regs + CH_DAR),
> +		lo_hi_readq(chan->chan_regs + CH_LLP));

[Severity: Medium]
Can reading the SAR, DAR, and LLP registers using lo_hi_readq result in torn
reads here?

The comment notes that bursts might still be outstanding and the hardware
registers can actively advance concurrently.=20

Because lo_hi_readq performs two independent non-atomic 32-bit reads, if the
hardware advances the register across a 32-bit boundary between the low and
high reads, the resulting 64-bit value will be torn.

Could this mislead debugging efforts by logging bogus, corrupted addresses =
in
the diagnostic output?

> +	/* Only dump LLIs on non-data errors */
> +	if (status & (DWAXIDMAC_IRQ_ALL_ERR & ~AXI_DMA_DATA_ERR))
> +		axi_chan_list_dump_lli(chan, vd_to_axi_desc(vd));
> =20
>  	if (status & (DWAXIDMAC_IRQ_SRC_DEC_ERR | DWAXIDMAC_IRQ_SRC_SLV_ERR))
>  		vd->tx_result.result =3D DMA_TRANS_READ_FAILED;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006-dw-axi-fix=
es-v1-0-3b319e456d93@rivian.com?part=3D3
