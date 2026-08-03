Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4604E358378;
	Mon,  3 Aug 2026 16:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785774503; cv=none; b=UtZ7QVUmv7tZYG7pPNFARiGSQ8+hwZ1TRYMXOfq/BhQHasWqG3tsP9PM6mUp9/Ea/ssaanliQdQ18yb4/k3HyKOzTMbiXxpsuAigxXEL/9HsbtBaj3SGN8XMiAr4MEmYNwKOn3RIJ3jA5/NdRYyUIdzx0kefiecYLPwYgbv2MdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785774503; c=relaxed/simple;
	bh=VVboCFv0Hn1GW77o0VSeERSdZnBsWb9tZ/DcnO/Rba4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CgLw0v5i12KdN9vKTp9Zx1mzvRHTFZCn+TjUUbgmVz52nz2NnzyiAh1oI/Kc7YJVhUmt5uz14a2UI2f6vailzc7MUWj0JcbzqhJB5Yv4iqk1FNdOeuTed71uVH/F10e/nsEXcJ+ucfOGhFNDPSN5Q+567jmNxRssgm+PYTbNtnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eyuu7Rim; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eyuu7Rim"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70BF31F000E9;
	Mon,  3 Aug 2026 16:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785774501;
	bh=uzdkpqd2gJ70BJcg4YZ0kSabCpfKWwvo8lWrPtssdd4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eyuu7Rim7RoMP+a0PGg7KWqCmi2qC1sRW5rfEBcP8auQKo7DCV6zZmegzTgyJDh8I
	 E5FqPHYq+sa+IguYAzUazIfjc7hTir4mCch7oqT3l21uPlLgg6DWwm6Q98cduEZWKh
	 EfaL4lcpFzPql0gzcSuV+kUsGFTzRQR/Bx7v0cqITRX9EdNzw9jsHG9gfxUnmLL2wV
	 +og3LOfR5noAkfA/3nNbeIwWYBrUAxD9ahw/Ym1hrf7/QvitbyZo6xsgWQpXp/blCs
	 7CBo3XvF+N8Bp7MokhKjgTO4lcIkslQOy+WGTQE0ywMWusAux9phEF/GRrRzzT/ee1
	 Jo0jgNbVSeGCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] dmaengine: fsl-edma: Support dynamic
 scatter/gather chaining
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, imx@lists.linux.dev, dmaengine@vger.kernel.org
In-Reply-To: <20260803-fsl-edma-dyn-sg-v8-2-dc2b0317206d@bootlin.com>
References: <20260803-fsl-edma-dyn-sg-v8-0-dc2b0317206d@bootlin.com>
 <20260803-fsl-edma-dyn-sg-v8-2-dc2b0317206d@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 16:28:20 +0000
Message-Id: <20260803162821.70BF31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] O(N^2) algorithmic complexity inside a spinlock during scatter-gat=
her descriptor submission can cause severe IRQ latency.
--

--- Patch [2]: [PATCH v8 2/2] dmaengine: fsl-edma: Support dynamic scatter/=
gather chaining ---
commit f4efa8f669813b67983a5bf98e40939bbc5e00b4
Author: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

dmaengine: fsl-edma: Support dynamic scatter/gather chaining

This commit implements dynamic linking of scatter/gather transfers to enable
chaining multiple DMA descriptors without stopping the channel. It adds
fsl_edma_link_sg() to dynamically link the last TCD of a previously issued
descriptor to the first TCD of a new descriptor.

> diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
> index c5f5951c988be..189eb9d1269ea 100644
> --- a/drivers/dma/fsl-edma-common.c
> +++ b/drivers/dma/fsl-edma-common.c
[ ... ]
> @@ -931,14 +958,93 @@ void fsl_edma_xfer_desc(struct fsl_edma_chan *fsl_c=
han)
[ ... ]
> +static void fsl_edma_link_sg(struct fsl_edma_chan *fsl_chan, struct fsl_=
edma_desc *fsl_desc)
> +{
[ ... ]
> +	if (!(last_csr & EDMA_TCD_CSR_D_REQ) ||
> +	    last_csr & EDMA_TCD_CSR_E_LINK ||
> +	    list_count_nodes(&fsl_chan->vchan.desc_issued) >=3D FIELD_MAX(EDMA_=
TCD_CSR_LINKCH))
> +		return;

[Severity: High]
Could this list_count_nodes() call cause severe IRQ latency spikes?

list_count_nodes() unconditionally iterates over the entire list to compute
its length. If the list contains hundreds or thousands of nodes, it will
traverse all of them, well past the limit of 31 checked here.

[ ... ]
> @@ -949,7 +1055,12 @@ void fsl_edma_issue_pending(struct dma_chan *chan)
[ ... ]
> -	if (vchan_issue_pending(&fsl_chan->vchan) && !fsl_chan->edesc)
> +	list_for_each_entry_safe(vdesc, tmp, &fsl_chan->vchan.desc_submitted, n=
ode) {
> +		fsl_edma_link_sg(fsl_chan, to_fsl_edma_desc(vdesc));
> +		list_move_tail(&vdesc->node, &fsl_chan->vchan.desc_issued);
> +	}

Since fsl_edma_link_sg() is called here in a loop over desc_submitted, while
holding the vchan.lock spinlock with interrupts disabled, submitting a large
batch of N descriptors (e.g., from network or ALSA drivers) could result in
O(N^2) list node traversals.=20

Could this heavily stall the CPU and potentially cause soft lockups?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-fsl-edma-d=
yn-sg-v8-0-dc2b0317206d@bootlin.com?part=3D2
