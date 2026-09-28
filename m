Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37805312814;
	Mon, 28 Sep 2026 03:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790565452; cv=none; b=pvRQvtUAJv9ADYlCP5+7lGrOJOVmUKJSTThFEJNaIM6C5H13lgRvj1o9pLJseaZ4VleuN1ne8uoD/Mya4KOdhkwxzXC4TQH1bGqEctkR5jS/PGKnR9UtdR0vXy/frYPLMg9DTRH2em41my8qd5N65Qzaw3jYKM7RD0p7/MtyaHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790565452; c=relaxed/simple;
	bh=uNe38Z4IPHb8y+bZnUCedgmI80wrfVGqoGihu8Z0nFk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aDxP/JYET2kqbfJs6FKsRxufWiMm+kURXj+llaqtTs9zHql1yu6I8j8yiYJUsxnCLCteCk6CeTGklQRzENuQAIypcLS+ASFC4z2NhNYcs8r8oC3NF+WIJlZVK4tRmxeCl/hDNChBkOxSGO/8ILbrLcnBOBzPDD/Kgow1u7+d3MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g612h1dq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g612h1dq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF631F000FF;
	Mon, 28 Sep 2026 03:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790565450;
	bh=m1kKWt4DV0zhj/mN7KaH2dpAO252h168uwlJ9ptWqOs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g612h1dqKbG4CRhJQNnRxSdvPkof5WTIajHAsE4kG/qc8cQk+HlM6PE62J9iHe9pz
	 q1XL3gwRXJ4oMCkcygC4k1bW7VLriRaWk74CgtHxDJ+RivOj3zT+1/TyhAPC+jW39F
	 r7UESIesQyXXsG/Xf4z/CoNMKGKfI2/PtgMHRVtFTa9Iljzy4XMW0Py9UWyH2Whe52
	 rc+syKNrbMx/DirZfLy8FtpcsZ6xHWxRvJsbkck0y0CpyFQQ9ce1MLcVMQ/WhFzZ10
	 eAVj8NXqDxjoeptpuZQbLk9TMto6b1S1c2bdx4jZKMWq8Pk6G5tXpBaA/3W3tkIFPv
	 J1HuNCDZ08jHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 18/19] dmaengine: ti: k3-udma-v2: Update glue layer
 to support PKTDMA V2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260928025749.1055383-19-s-adivi@ti.com>
References: <20260928025749.1055383-1-s-adivi@ti.com>
 <20260928025749.1055383-19-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 03:17:29 +0000
Message-Id: <20260928031730.5DF631F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dmaengine: ti: k3-udma-glue: RX channel incorrectly filters reques=
ted metadata
--

commit b3e94e1224d88a6c81029a4dc336d837a68ff7a7
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

    dmaengine: ti: k3-udma-v2: Update glue layer to support PKTDMA V2
   =20
    Update glue layer to support PKTDMA V2 for non DMAengine users. The upd=
ates
    include handling absence of TISCI, direct IRQs, and autopairing.

> diff --git a/drivers/dma/ti/k3-udma-glue.c b/drivers/dma/ti/k3-udma-glue.c
> index 996c130b10f4a..309a74a0b2a67 100644
> --- a/drivers/dma/ti/k3-udma-glue.c
> +++ b/drivers/dma/ti/k3-udma-glue.c

[ ... ]

> @@ -725,11 +770,24 @@ static int k3_udma_glue_cfg_rx_chn(struct k3_udma_g=
lue_rx_channel *rx_chn)
>  	req.rx_chan_type =3D TI_SCI_RM_UDMAP_CHAN_TYPE_PKT_PBRR;
>  	req.rx_atype =3D rx_chn->common.atype_asel;
> =20
> +	if (!tisci_rm->tisci) {
> +		u32 val =3D 0;
> +
> +		if (rx_chn->common.epib)
> +			val |=3D UDMA_CHAN_CFG_FILT_EINFO;
> +		if (rx_chn->common.psdata_size)
> +			val |=3D UDMA_CHAN_CFG_FILT_PSWORDS;

[Severity: High]
Does this logic invert the requested configuration? The epib and psdata_size
fields indicate that the user wants to receive this metadata. However,
setting the FILT bits configures the hardware to drop this data, which seems
to contradict the requested channel configuration. Could this be a copy-pas=
te
error from the TX channel configuration?

> +
> +		xudma_rchanrt_write(rx_chn->udma_rchanx, UDMA_CHAN_RT_CFG_REG, val);
> +
> +		return 0;
> +	}
> +
> +	req.nav_id =3D tisci_rm->tisci_dev_id;
>  	ret =3D tisci_rm->tisci_udmap_ops->rx_ch_cfg(tisci_rm->tisci, &req);
>  	if (ret)
>  		dev_err(rx_chn->common.dev, "rchan%d cfg failed %d\n",
> -			rx_chn->udma_rchan_id, ret);
> -
> +				rx_chn->udma_rchan_id, ret);
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928025749.1055=
383-1-s-adivi@ti.com?part=3D18
