Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC35A1714AA
	for <dmaengine@vger.kernel.org>; Tue,  6 Oct 2026 01:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791249589; cv=none; b=dfdx3oXCWGjCN0WDxKDspsAKGPn0jaI5xEZy+2V5FKrR8GZzyyl1UDHQje+ipNbCr6XHXVyx9pTZlEO3iIRLu/B7ABBwVVHhLzMO/DzDFMAl1v4jMcw4cWq3ePtADiTs8EuQ1xw+grLGYa36guOQgDnTcrG1RFIXgkBWzeiszW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791249589; c=relaxed/simple;
	bh=r54OkRTpU7EUVGasKVelQbIP/OJT7xmh4fFufsSEHzc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RBXeG9eSmD020ZFtBf8lsgoeOkqOuln/OGqqXeRsqivvzumXADtxCkVXxEPheZH3Cd4IAh0JBCDvs3gguSebgoLfVNJIFicJifOO80j5bWH+MF/G13RsevEnqFQxHVNME2XklO0cnAZe0dWrXNSQADH31d1H3BcUM3JaPjxmk38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HM0QGH/6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HM0QGH/6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC981F000FF;
	Tue,  6 Oct 2026 01:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791249588;
	bh=pW6D/wQ+j+y+N8/em2LB4ZjhYe3MwucoS6+0WVER9J8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HM0QGH/6P8u4N570SHa4tzUYOB9zKLGcwvNYyy6WNV+jShxRJEXfjPzOdxHT77VKq
	 ETg97++VBW/+5XK2SY/+c8qlAQLkQlJSwkO/jojej97izwgsmZnLVFjZEWRid7v2QU
	 X/esuhoMxhAInYMar2EYKU9S44I5UxldLeXRlslHZjwQLEI4E+nIprKedO3HGw6xCC
	 bYEZ4xkVPJl+v92xsNUfcPoEFCRe40GPWJaMfrHW/JGcmhQezM+YW4IGLlcBSLKipA
	 lWTt0xpGke8razX1B2nBWNL+RUn0xpbbaQ5DwoBUqhV86Ednm2B8fYxMUkuv0j5SJh
	 jaQl5Xiq85uOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dmaengine: dw-axi-dmac: Report failed transfers in
 the descriptor result
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roland Dreier" <rolanddreier@rivian.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20261006-dw-axi-fixes-v1-2-3b319e456d93@rivian.com>
References: <20261006-dw-axi-fixes-v1-0-3b319e456d93@rivian.com>
 <20261006-dw-axi-fixes-v1-2-3b319e456d93@rivian.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 01:19:47 +0000
Message-Id: <20261006011948.3CC981F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dmaengine: dw-axi-dmac: missing residue update on error leaves i=
t as 0
--

commit 0cfa0e9416a64e0fa0850f1489894a836df68692
Author: Roland Dreier <rolanddreier@rivian.com>

dmaengine: dw-axi-dmac: Report failed transfers in the descriptor result

This commit updates axi_chan_handle_err() to populate tx_result.result with=
 an
error state. It previously completed failed descriptors without updating
vd->tx_result, which returned DMA_TRANS_NOERROR to clients even after failu=
res.

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index 813d17a278e72..88362f1812071 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -1084,6 +1084,13 @@ static noinline void axi_chan_handle_err(struct ax=
i_dma_chan *chan, u32 status)
>  		axi_chan_name(chan), vd->tx.cookie, status);
>  	axi_chan_list_dump_lli(chan, vd_to_axi_desc(vd));
> =20
> +	if (status & (DWAXIDMAC_IRQ_SRC_DEC_ERR | DWAXIDMAC_IRQ_SRC_SLV_ERR))
> +		vd->tx_result.result =3D DMA_TRANS_READ_FAILED;
> +	else if (status & (DWAXIDMAC_IRQ_DST_DEC_ERR | DWAXIDMAC_IRQ_DST_SLV_ER=
R))
> +		vd->tx_result.result =3D DMA_TRANS_WRITE_FAILED;
> +	else
> +		vd->tx_result.result =3D DMA_TRANS_ABORTED;
> +

[Severity: Medium]
Because vd->tx_result.residue is not updated here, it defaults to 0, which
indicates a full transfer completion despite the assigned error state.

Clients inspecting the residue to determine how much data was successfully
transferred before the error will incorrectly conclude that all data was
transferred.

Should this code also update the vd->tx_result.residue field?

>  	vchan_cookie_complete(vd);
> =20
>  	/* Try to restart the controller */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006-dw-axi-fix=
es-v1-0-3b319e456d93@rivian.com?part=3D2
