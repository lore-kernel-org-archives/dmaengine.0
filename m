Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F72488762;
	Fri, 11 Sep 2026 13:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789132988; cv=none; b=Rndu1Gst6SVaa/TzEjLa1lDOe0NoUkOMtQJovcm+kIREe6Ksj+kSp1LWgjt1bCg3/ZHThdXbYEOFcwUqFXkKS9fbh8nT0v3jZMPxcWA6GQQbH8WY11nsPmVvJ1xMsHpO6MPbkEk7+4DXylaCKp2CAidea6Cy3rkD8ZRLKPxOeEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789132988; c=relaxed/simple;
	bh=gh0Xi78NBOYrWoEb6fcomr0tChm+mbhsB1n/V/AYo18=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tNn79/JWz0T2qEIZPUYaBavyMfP+4oXTbEm0cEVfR8lMyRvIeygbc2pbwdXUT2AuNeZsxdJ40xq5Wcx9TwjBxIXlQoVVz7ClXbJ4PlW2cRiG+1j92bpjxM3BJZBPsUoGqJzIgOx/eeexpjmlr4GtrQkuiHgILUm82IhkvP8/fHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZLj66oW1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZLj66oW1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295731F000FF;
	Fri, 11 Sep 2026 13:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789132983;
	bh=kqc803EcYbqjZYEYF4fjdtnsWRP/BBnmXZJkarUTSc8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZLj66oW1wf/Xy7uYp34JboYGvPcgsB87W9/IQRoxG6TWZGT1jfD7z5uYFFv+cJKZB
	 LtUAFbs+clixbPEOn35A3zMROsdXGGql43QmiCg/xFS4nEqvzFwdITqd7/yXMIs8Sj
	 Tv9P/QCPQUoGPFBF4rRSr2za40sN0BDlmz21k/sOkcIJx2vrRgaHTHEk84unhv2bAn
	 PWXMwny3Jo2JQgth3kYZfJkdTwxBl4id6EDCf0PbFZBslymBIINSB3dLHbKm0mXcuH
	 Qng8Z3yn88BcyrtIQ08/Un8d7hDBRkNp2iUIKnRnNirQH2XaHCJJeaAGhsGCOlYEMD
	 AVNzGOI260L8g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/2] dmaengine: fsl-edma: Support dynamic
 scatter/gather chaining
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, imx@lists.linux.dev, vkoul@kernel.org
In-Reply-To: <20260911-fsl-edma-dyn-sg-v10-2-700eb72def57@bootlin.com>
References: <20260911-fsl-edma-dyn-sg-v10-0-700eb72def57@bootlin.com>
 <20260911-fsl-edma-dyn-sg-v10-2-700eb72def57@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 13:23:02 +0000
Message-Id: <20260911132303.295731F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The completion handler erroneously completes and drops pending des=
criptors if hardware channel linking (E_LINK) is used.
--

commit 1703b2e67fb35f2931ebc1bf4444955c605a74fd
Author: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

dmaengine: fsl-edma: Support dynamic scatter/gather chaining

This commit implements dynamic linking of scatter/gather transfers to allow
chaining multiple DMA descriptors without stopping the channel. It adds
fsl_edma_link_sg() to link descriptors and updates the transfer completion
handler to reap issued descriptors using the EDMA_TCD_CSR_LINKCH field.

> diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
> index c5f5951c988be..76fbd2bc5154f 100644
> --- a/drivers/dma/fsl-edma-common.c
> +++ b/drivers/dma/fsl-edma-common.c
> @@ -55,10 +55,36 @@ void fsl_edma_tx_chan_handler(struct fsl_edma_chan *f=
sl_chan)
[ ... ]
>  	if (!fsl_chan->edesc->iscyclic) {
> -		list_del(&fsl_chan->edesc->vdesc.node);
> -		vchan_cookie_complete(&fsl_chan->edesc->vdesc);
> +		u16 csr =3D edma_read_tcdreg(fsl_chan, csr);
> +		u8 link_sg_id =3D FIELD_GET(EDMA_TCD_CSR_LINKCH, csr);

[Severity: High]
When hardware channel linking is used (the E_LINK bit is set in the CSR),
doesn't the EDMA_TCD_CSR_LINKCH field represent the MAJORLINKCH target
channel rather than a software scatter/gather ID?

If fsl_edma_link_sg() explicitly skips assigning dynamic SG IDs to
descriptors with E_LINK set, their software fsl_desc->link_sg_id will
remain 0. If this interrupt handler extracts a target channel number
(e.g., 15) into link_sg_id here, it will fail to match the software ID of 0.

> +		struct virt_dma_desc *vdesc, *tmp;
> +
> +		/* Channel is DONE when a TCD with D_REQ set completes */
> +		if (!(fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_SPLIT_REG) ||
> +		    (edma_readl_chreg(fsl_chan, ch_csr) & EDMA_V3_CH_CSR_DONE)) {
> +			fsl_chan->status =3D DMA_COMPLETE;
> +		}
> +
> +		list_for_each_entry_safe(vdesc, tmp, &fsl_chan->vchan.desc_issued, nod=
e) {
> +			struct fsl_edma_desc *fsl_desc =3D to_fsl_edma_desc(vdesc);
> +			bool id_match =3D (link_sg_id =3D=3D fsl_desc->link_sg_id);
> +
> +			/*
> +			 * If the transfer is still running,
> +			 * don't mark as complete the current descriptor
> +			 */
> +			if (id_match && fsl_chan->status !=3D DMA_COMPLETE)
> +				break;
> +
> +			list_del(&vdesc->node);
> +			vchan_cookie_complete(vdesc);
> +
> +			if (id_match)
> +				break;
> +		}

[Severity: High]
Following from the E_LINK mismatch above, if id_match evaluates to false
for a descriptor using hardware channel linking, will this loop erroneously
continue deleting and completing all subsequent pending descriptors in the
desc_issued list?=20

Since their software IDs will also fail to match the extracted hardware
channel number, it looks like these pending descriptors will be silently
dropped and completed without ever being submitted to the hardware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-fsl-edma-d=
yn-sg-v10-0-700eb72def57@bootlin.com?part=3D2
