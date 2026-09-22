Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E9C4DA540;
	Tue, 22 Sep 2026 07:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061055; cv=none; b=NDChjEQbLXeNCxwNTw54cK1V4gll39pdCQXPcSl4IQvGLeoN1TEV5U5OtJlTBFO+h8oUWdSG45CQPpwZJjoPPgamSgmEPWNZRcRVJVp/KxSIZlmhR350ZUhvIw7A6Wt854N3azkiF9yelkwtr9p7WppoTiaR7xCsGoTCOqhRmks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061055; c=relaxed/simple;
	bh=sgUqBDspS08OgP6LhtLDWXUxtzsk4tKXHjkISz493UA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mhe6v+8iQaM+bYFIfWHhDiFe4P0DuA6jxONaHNVzT303kMRi9kU2s+f3cor5jcXj4ndnZnq4qIsuWHdzoH71l+7xZRghiU4EirgStjM+2kVtKMmnP/KyU/K6F32WMJHIhO73uDs2a9wWKt1gECpa7JXffgC5k2+jo98HEYZDzFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KGhx1DeY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KGhx1DeY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5669E1F000FF;
	Tue, 22 Sep 2026 07:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790061053;
	bh=ZdR6emMrSPRStPpxZnSBpcHi66tgsEosPebW94ipPVY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KGhx1DeYoJZyt408zxNj+fMcNacyHoImmaDvcBuSxF/czf6e+TenHVzdlMDDA6Huj
	 6ZM7lrKPV1kPZTuC7/IvFizvICt12CVdyR29rPmB65V2bAP35FhqMdMhuZfhSUkn+4
	 cQbWXAgL63kEbXIpDARgEujhkZ5JGA6fdtBSJg4KG0P7myCDTui87VwP4USVw5fDAI
	 zFheJ5gLE6ZTkSlMD+e/Ol+yqsshegDnLuL5b5AKVg8m+AbsgKJw5exh78HWce6/Mm
	 5Yt+K3KpOU5vU5qVB8DoOE5r3H6T0RKsck2H41pSf30E+Da+InVahALUOqya9brXby
	 YDbwR26o+e0Pg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 18/19] dmaengine: ti: k3-udma-v2: Update glue layer
 to support PKTDMA V2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260922064902.2719979-19-s-adivi@ti.com>
References: <20260922064902.2719979-1-s-adivi@ti.com>
 <20260922064902.2719979-19-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 07:10:52 +0000
Message-Id: <20260922071053.5669E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dmaengine: ti: inverted hardware teardown sequence for PKTDMA V2 T=
X channels
- [Medium] dmaengine: ti: missing configuration of error handling flags for=
 PKTDMA V2
--

commit c9030c9c505174820633d0b6b095c2b74c127474
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma-v2: Update glue layer to support PKTDMA V2

This patch updates the glue layer to support PKTDMA V2 for non DMAengine us=
ers.
It adds handling for the absence of TISCI, direct IRQs, and autopairing.

> diff --git a/drivers/dma/ti/k3-udma-glue.c b/drivers/dma/ti/k3-udma-glue.c
> index 3721edf71f9b3..5a3cac685a46c 100644
> --- a/drivers/dma/ti/k3-udma-glue.c
> +++ b/drivers/dma/ti/k3-udma-glue.c
> @@ -267,6 +268,19 @@ static int k3_udma_glue_cfg_tx_chn(struct k3_udma_gl=
ue_tx_channel *tx_chn)
>  	const struct udma_tisci_rm *tisci_rm =3D tx_chn->common.tisci_rm;
>  	struct ti_sci_msg_rm_udmap_tx_ch_cfg req;
> =20
> +	if (!tisci_rm->tisci) {
> +		u32 val =3D 0;
> +
> +		if (tx_chn->tx_filt_einfo)
> +			val |=3D UDMA_CHAN_CFG_FILT_EINFO;
> +		if (tx_chn->tx_filt_pswords)
> +			val |=3D UDMA_CHAN_CFG_FILT_PSWORDS;
> +
> +		xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_CFG_REG, val);
> +
> +		return 0;
> +	}

[Severity: Medium]
When configuring the channel without TISCI, is it intentional that
tx_pause_on_err and tx_supr_tdpkt are silently ignored before the early
return? In the TISCI configuration path further down in this function, these
flags are evaluated and applied, but here they seem to be dropped.

[ ... ]

> @@ -573,8 +605,16 @@ void k3_udma_glue_tdown_tx_chn(struct k3_udma_glue_t=
x_channel *tx_chn,
> =20
>  	k3_udma_glue_dump_tx_rt_chn(tx_chn, "txchn tdown1");
> =20
> -	xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_CTL_REG,
> -			    UDMA_CHAN_RT_CTL_EN | UDMA_CHAN_RT_CTL_TDOWN);
> +	if (tx_chn->common.udmax->match_data->version =3D=3D K3_UDMA_V1) {
> +		xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_CTL_REG,
> +				    UDMA_CHAN_RT_CTL_EN | UDMA_CHAN_RT_CTL_TDOWN);
> +	} else {
> +		val =3D xudma_tchanrt_read(tx_chn->udma_tchanx, UDMA_CHAN_RT_CTL_REG);
> +		xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_CTL_REG,
> +				    val | UDMA_CHAN_RT_CTL_TDOWN);
> +		xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_PEER_REG(8),
> +				    UDMA_CHAN_RT_PEER_REG8_FLUSH);
> +	}

[Severity: High]
Does this sequence invert the hardware teardown requirements for PKTDMA V2 =
TX
channels? It looks like the teardown bit (UDMA_CHAN_RT_CTL_TDOWN) is being
written to UDMA_CHAN_RT_CTL_REG before sending the flush command to the peer
via UDMA_CHAN_RT_PEER_REG(8). Does the hardware require flushing the peer
before initiating the teardown to avoid locking up or leaving the channel in
an inconsistent state?

[ ... ]

> @@ -826,6 +883,19 @@ static int k3_udma_glue_cfg_rx_flow(struct k3_udma_g=
lue_rx_channel *rx_chn,
>  		rx_ringfdq_id =3D k3_ringacc_get_ring_id(flow->ringrxfdq);
>  	}
> =20
> +	if (!tisci_rm->tisci) {
> +		u32 val =3D 0;
> +
> +		if (rx_chn->common.epib)
> +			val |=3D UDMA_FLOWRT_RFA_RX_EINFO_PRESENT;
> +		if (rx_chn->common.psdata_size)
> +			val |=3D UDMA_FLOWRT_RFA_RX_PSINFO_PRESENT;
> +
> +		xudma_rflowrt_write(flow->udma_rflow, UDMA_RX_FLOWRT_RFA, val);
> +		rx_chn->flows_ready++;
> +		return 0;
> +	}

[Severity: Medium]
Are we missing the configuration for flow_cfg->rx_error_handling in this new
no-TISCI path? Callers using the glue layer for PKTDMA V2 could request
rx_error_handling, but it appears to be silently ignored here instead of be=
ing
written to the hardware registers (like bit 28 of UDMA_RX_FLOWRT_RFA) to en=
able
hardware flow error handling.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922064902.2719=
979-1-s-adivi@ti.com?part=3D18
