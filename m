Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED913A9854;
	Tue, 28 Jul 2026 14:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785248472; cv=none; b=cMZki4gEYBQ9ZAk6Wrt6JZ596FVeVjbmjGWts6f4UksXv5O40EgwwqAcBdqrUYqh3q+UrS4SuYfBVMSXLUEWC3Qo2zMXZp/tngGK0pXq7Gu/VvpDXk+kMTkQ3q312KEg25/LC2fs9UEiLPj/qaSfPDh5XHYtq6SjwXlF7LnQfEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785248472; c=relaxed/simple;
	bh=GaK/c6k1LXJeArytMZ9eloFuOO47DP/7cbHaJkRAABI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QvdwZZOz2SP3kq6DD20XPEv1lSBjs7DFRqtCiHXRPVvpjZzlQewg0zie54Bv3DIke0YVLHz9Vts+An3hZDmE1jeJWvi0oRAXGprziYo7QqjcQtXSkgCvRGDiQ6bfQyuN+QPhYA/A11h+JnzBcFZ7ngd0XdsUgcsVjwrBa2fyeuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQyBEH7l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQyBEH7l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A103D1F000E9;
	Tue, 28 Jul 2026 14:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785248471;
	bh=RvZGJMjnOmepsRNlPPFPMt9G5To+iznfZtZ4pf2XWHc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lQyBEH7lE3QdsS2wIc69mPRUiwdkEYDKP8x3qLoaselaHKr8IGqwU30dRIhyV1pcH
	 GTPUJAXmTctSwSzpYyL50Z95jGS0oWixmryhVTvERVUOnv0tp5A8TrV5wEq6T81W5q
	 cZ2Vnt9EqLoQuqMrXl9uuAjOM+ASM0CwGJ7hLYE2kOU28Cfqh74/Xj1bujn3UPAI2Q
	 E1NKwmViLh/4g8EDPK3ozdgK/moYmPrxxZFZ4fewLFznEQaag9PHg9PC7OaZ5qYeso
	 Czfv1kx7LyTKMmgmqFRjSy7WLnNwhfU0Rb+LaaikdiJlh9gTPFdIVv8HkMA8Pw4yF3
	 yxOTxws5SRijg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] dmaengine: fsl-edma: Support dynamic
 scatter/gather chaining
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: imx@lists.linux.dev, vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260728-fsl-edma-dyn-sg-v7-2-10dffb4167c2@bootlin.com>
References: <20260728-fsl-edma-dyn-sg-v7-0-10dffb4167c2@bootlin.com>
 <20260728-fsl-edma-dyn-sg-v7-2-10dffb4167c2@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 14:21:10 +0000
Message-Id: <20260728142110.A103D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] A completed dynamically linked scatter/gather descriptor will be e=
rroneously re-issued for execution if its interrupt is delayed, leading to =
double-execution and memory corruption.
- [High] Descriptors can be erroneously marked as completed without executi=
on if channel linking (E_LINK) is configured.
--

--- Patch [2]: [PATCH v7 2/2] dmaengine: fsl-edma: Support dynamic scatter/=
gather chaining ---
commit b8502bf27e9fa2ac70190840a26c1603f5640651
Author: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

dmaengine: fsl-edma: Support dynamic scatter/gather chaining

Implement dynamic linking of scatter/gather transfers to enable
chaining multiple DMA descriptors without stopping the channel.

> diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
> --- a/drivers/dma/fsl-edma-common.c
> +++ b/drivers/dma/fsl-edma-common.c
[ ... ]
> @@ -55,10 +55,29 @@ void fsl_edma_tx_chan_handler(struct fsl_edma_chan *f=
sl_chan)
>  	}
> =20
>  	if (!fsl_chan->edesc->iscyclic) {
> -		list_del(&fsl_chan->edesc->vdesc.node);
> -		vchan_cookie_complete(&fsl_chan->edesc->vdesc);
> +		u8 link_sg_id =3D FIELD_GET(EDMA_TCD_CSR_LINKCH, edma_read_tcdreg(fsl_=
chan, csr));

[Severity: High]
Will this misinterpret a hardware channel link ID as a software SG ID if
channel linking (EDMA_TCD_CSR_E_LINK) is configured?

If a transfer uses EDMA_TCD_CSR_E_LINK to link to a non-zero channel, the
handler appears to unconditionally extract link_sg_id from the CSR. This
channel number would be read as the link_sg_id, causing id_match to be false
for all pending descriptors (which have link_sg_id =3D=3D 0).

Does this cause the handler to iterate through the entire desc_issued list,
prematurely deleting and completing every queued descriptor without them ev=
er
executing?

> +		struct virt_dma_desc *vdesc, *tmp;
> +
> +		list_for_each_entry_safe(vdesc, tmp, &fsl_chan->vchan.desc_issued, nod=
e) {
> +			struct fsl_edma_desc *fsl_desc =3D to_fsl_edma_desc(vdesc);
> +			bool id_match =3D (link_sg_id =3D=3D fsl_desc->link_sg_id);
> +
> +			if (id_match && fsl_desc !=3D fsl_chan->edesc)
> +				break;

[Severity: High]
If multiple dynamically linked descriptors finish before the interrupt hand=
ler
processes them (e.g., due to system load or interrupt latency), could a
completed descriptor be stranded in the queue?

When the hardware stops on a later descriptor and sets the DONE flag, this
loop will break early when it matches the link_sg_id of the finished
descriptor, assuming it is still running because fsl_desc !=3D fsl_chan->ed=
esc.

> +
> +			list_del(&vdesc->node);
> +			vchan_cookie_complete(vdesc);
> +
> +			if (id_match)
> +				break;
> +		}
> +
>  		fsl_chan->edesc =3D NULL;
> -		fsl_chan->status =3D DMA_COMPLETE;
> +
> +		if (!(fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_SPLIT_REG) ||
> +		    (edma_readl_chreg(fsl_chan, ch_csr) & EDMA_V3_CH_CSR_DONE)) {
> +			fsl_chan->status =3D DMA_COMPLETE;
> +		}
>  	} else {
>  		vchan_cyclic_callback(&fsl_chan->edesc->vdesc);
>  	}
[ ... ]
> @@ -931,14 +950,87 @@ void fsl_edma_xfer_desc(struct fsl_edma_chan *fsl_c=
han)
>  	if (!vdesc)
>  		return;
>  	fsl_chan->edesc =3D to_fsl_edma_desc(vdesc);
> -	fsl_edma_set_tcd_regs(fsl_chan, fsl_chan->edesc->tcd[0].vtcd);
> -	fsl_edma_enable_request(fsl_chan);
> -	fsl_chan->status =3D DMA_IN_PROGRESS;
> +
> +	if (fsl_chan->status !=3D DMA_IN_PROGRESS) {
> +		fsl_edma_set_tcd_regs(fsl_chan, fsl_chan->edesc->tcd[0].vtcd);
> +		fsl_edma_enable_request(fsl_chan);
> +		fsl_chan->status =3D DMA_IN_PROGRESS;
> +	}
> +}

[Severity: High]
Because the channel status was updated to DMA_COMPLETE in
fsl_edma_tx_chan_handler() above, will fsl_edma_xfer_desc() then fetch the
stranded descriptor from the queue and erroneously reprogram it to the
hardware?

This seems like it would cause the hardware to re-execute a DMA transfer th=
at
has already finished, potentially leading to data corruption for I/O devices
(such as duplicated writes or dropped reads).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-fsl-edma-d=
yn-sg-v7-0-10dffb4167c2@bootlin.com?part=3D2
