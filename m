Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E0942BC20;
	Fri, 24 Jul 2026 10:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784890713; cv=none; b=YlIo0IfFFgtijmFEEGlkzDg6PpErcLw1Im7jJIVpWABT5n+NKNclzsXDqVgItdY3ZFLUaid7fyO1efgALTyHM6Tsxz98kKVbUYHGUWTAkNhMtgvbfyP2XbrWgj0BSmYyFiqrxG/oNW9Me3Rm4bYwxQi6qFVkcrl6S2cpfhd/OfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784890713; c=relaxed/simple;
	bh=ThWPD2vO6WFChLLKHLS5nruVc5+/3YACWxONEFf+T2M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=estyut6V8NTs7TTpfw/jrUgj2I0MLLf0tHTKivG52CPfsqGr9YYB1j+1PsQMkc6+v6UZZu7tVsg9b351IwAiwHo9fRsNRcqmtr5+UxuAN+TpAqjSXOAOg3ZoUGtVwDjkRnp8EDWvNTnNfAPsueX7a6ptMUJgf39Q+BS+eoylsp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nOQ2pHCA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nOQ2pHCA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07121F01561;
	Fri, 24 Jul 2026 10:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784890709;
	bh=plF2j54U8gl8dhYEYhsoHOEWZ0ryy2oTvAaJXHg1aRE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nOQ2pHCA0azsscOqhJtvPt9fhI7F437pNVazX20IUPGR45qcoijvtDM/5ULQITnIB
	 JwzEf8UVw2yQPf7dsv8YQcHu5kcZYjkLjmnloSCtAb2MQDQU2GNt1H0hodgdK/9AJa
	 T15D8TVdCQiwJL1NlY8j5iJ7uMP1U0mfSMEBXmRoxY/5IXA2859W1G7uX7uoDZfG7r
	 P3iol2ccUi4E83cE2A5x6BzwUqk7vvA5zjM+z1UAZRLHMS0wu265XD9CThEbcvMQmk
	 V7y9u4rwVkgyFUYkNSaRUsR54qOeUkOEKcqgMz/pbh7PdbPBskLvvZUGI8nk9Tuqq/
	 rXKKYYdPl7V4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 18/19] dmaengine: ti: k3-udma-v2: Update glue layer
 to support PKTDMA V2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724102115.2854-19-s-adivi@ti.com>
References: <20260724102115.2854-1-s-adivi@ti.com>
 <20260724102115.2854-19-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 10:58:28 +0000
Message-Id: <20260724105828.D07121F01561@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Improper teardown and disable sequences for PKTDMA V2 hardware, ca=
using state corruption and timeouts.
- [High] Incomplete and contradictory configuration of PKTDMA V2 channels a=
nd flows when TISCI is absent, leading to memory corruption and missing set=
tings.
- [High] The driver fails to poll for the completion of the channel autopai=
ring sequence for PKTDMA V2, returning before the hardware is ready.
--

--- Patch [18]: [PATCH v7 18/19] dmaengine: ti: k3-udma-v2: Update glue lay=
er to support PKTDMA V2 ---
commit e70a50b02c5e24b0a06466a8296de08ac78f41b1
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

    dmaengine: ti: k3-udma-v2: Update glue layer to support PKTDMA V2
   =20
    Update glue layer to support PKTDMA V2 for non DMAengine users.

> diff --git a/drivers/dma/ti/k3-udma-glue.c b/drivers/dma/ti/k3-udma-glue.c
> index bec4deb480e60..07952c4efee2d 100644
> --- a/drivers/dma/ti/k3-udma-glue.c
> +++ b/drivers/dma/ti/k3-udma-glue.c
> @@ -267,6 +267,9 @@ static int k3_udma_glue_cfg_tx_chn(struct k3_udma_glu=
e_tx_channel *tx_chn)
>  	const struct udma_tisci_rm *tisci_rm =3D tx_chn->common.tisci_rm;
>  	struct ti_sci_msg_rm_udmap_tx_ch_cfg req;
> =20
> +	if (!tisci_rm->tisci)
> +		return 0;
> +

[Severity: High]
Does returning early here skip all TX channel configuration for PKTDMA V2?

This skips configuring the fetch size, pause on error, and other
essential parameters for the channel.

>  	memset(&req, 0, sizeof(req));
> =20
[ ... ]
> @@ -525,21 +528,26 @@ int k3_udma_glue_enable_tx_chn(struct k3_udma_glue_=
tx_channel *tx_chn)
>  {
>  	int ret;
> =20
> -	ret =3D xudma_navss_psil_pair(tx_chn->common.udmax,
> -				    tx_chn->common.src_thread,
> -				    tx_chn->common.dst_thread);
> -	if (ret) {
> -		dev_err(tx_chn->common.dev, "PSI-L request err %d\n", ret);
> -		return ret;
> -	}
> +	if (tx_chn->common.udmax->match_data->version =3D=3D K3_UDMA_V1) {
> +		ret =3D xudma_navss_psil_pair(tx_chn->common.udmax,
> +					    tx_chn->common.src_thread,
> +					    tx_chn->common.dst_thread);
> +		if (ret) {
> +			dev_err(tx_chn->common.dev, "PSI-L request err %d\n", ret);
> +			return ret;
> +		}
> =20
> -	tx_chn->psil_paired =3D true;
> +		tx_chn->psil_paired =3D true;
> =20
> -	xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_PEER_RT_EN_REG,
> -			    UDMA_PEER_RT_EN_ENABLE);
> +		xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_PEER_RT_EN_REG,
> +				    UDMA_PEER_RT_EN_ENABLE);
> =20
> -	xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_CTL_REG,
> -			    UDMA_CHAN_RT_CTL_EN);
> +		xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_CTL_REG,
> +				    UDMA_CHAN_RT_CTL_EN);
> +	} else {
> +		xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_CTL_REG,
> +				    UDMA_CHAN_RT_CTL_AUTOPAIR | UDMA_CHAN_RT_CTL_EN);
> +	}

[Severity: High]
Does this need to poll for the completion of the channel autopairing
sequence?

By returning immediately after setting UDMA_CHAN_RT_CTL_AUTOPAIR, the caller
might begin submitting descriptors before the hardware is fully initialized
or paired. The core k3-udma-v2.c dmaengine driver polls for
UDMA_CHAN_RT_CTL_PAIR_COMPLETE after setting this bit.

[Severity: High]
Since this adds V2-specific setup using UDMA_CHAN_RT_CTL_AUTOPAIR, do we
also need to update k3_udma_glue_tdown_tx_chn() and=20
k3_udma_glue_disable_tx_chn() for V2 hardware?

Currently k3_udma_glue_tdown_tx_chn() unconditionally executes a direct
register write to UDMA_CHAN_RT_CTL_REG with just EN and TDOWN bits, which
will clobber the UDMA_CHAN_RT_CTL_AUTOPAIR bit set here. This abruptly
unpairs the channel while attempting to tear it down.

Additionally, k3_udma_glue_disable_tx_chn() unconditionally writes 0 to
UDMA_CHAN_RT_PEER_RT_EN_REG without checking the hardware version.

> =20
>  	k3_udma_glue_dump_tx_rt_chn(tx_chn, "txchn en");
>  	return 0;
[ ... ]
> @@ -725,11 +732,18 @@ static int k3_udma_glue_cfg_rx_chn(struct k3_udma_g=
lue_rx_channel *rx_chn)
>  	req.rx_chan_type =3D TI_SCI_RM_UDMAP_CHAN_TYPE_PKT_PBRR;
>  	req.rx_atype =3D rx_chn->common.atype_asel;
> =20
> +	if (!tisci_rm->tisci) {
> +		// TODO: look at the chan settings
> +		xudma_rchanrt_write(rx_chn->udma_rchanx, UDMA_CHAN_RT_CFG_REG,
> +				    UDMA_CHAN_CFG_FILT_EINFO | UDMA_CHAN_CFG_FILT_PSWORDS);
> +		return 0;
> +	}
> +

[Severity: High]
Does hardcoding UDMA_CHAN_CFG_FILT_EINFO and UDMA_CHAN_CFG_FILT_PSWORDS
miss the rest of the actual channel configuration, like the fetch size?

>  	req.nav_id =3D tisci_rm->tisci_dev_id;
>  	ret =3D tisci_rm->tisci_udmap_ops->rx_ch_cfg(tisci_rm->tisci, &req);
>  	if (ret)
[ ... ]
> @@ -826,6 +843,14 @@ static int k3_udma_glue_cfg_rx_flow(struct k3_udma_g=
lue_rx_channel *rx_chn,
>  		rx_ringfdq_id =3D k3_ringacc_get_ring_id(flow->ringrxfdq);
>  	}
> =20
> +	if (!tisci_rm->tisci) {
> +		xudma_rflowrt_write(flow->udma_rflow, UDMA_RX_FLOWRT_RFA,
> +				    UDMA_FLOWRT_RFA_RX_EINFO_PRESENT |
> +				    UDMA_FLOWRT_RFA_RX_PSINFO_PRESENT);
> +		rx_chn->flows_ready++;
> +		return 0;
> +	}
> +

[Severity: High]
Will forcing these flags cause memory corruption if the software
descriptors weren't configured with space for this metadata?

By unconditionally forcing UDMA_FLOWRT_RFA_RX_EINFO_PRESENT and
UDMA_FLOWRT_RFA_RX_PSINFO_PRESENT into the UDMA_RX_FLOWRT_RFA register,
the hardware will write extended protocol information into the receive
buffers. If the software did not allocate space for them (checked via
rx_chn->common.epib and rx_chn->common.psdata_size in the TISCI path),
could this overwrite adjacent packet data or exceed descriptor boundaries?

>  	memset(&req, 0, sizeof(req));
> =20
>  	req.valid_params =3D
[ ... ]
> @@ -1406,21 +1437,26 @@ int k3_udma_glue_enable_rx_chn(struct k3_udma_glu=
e_rx_channel *rx_chn)
>  	if (rx_chn->flows_ready < rx_chn->flow_num)
>  		return -EINVAL;
> =20
> -	ret =3D xudma_navss_psil_pair(rx_chn->common.udmax,
> -				    rx_chn->common.src_thread,
> -				    rx_chn->common.dst_thread);
> -	if (ret) {
> -		dev_err(rx_chn->common.dev, "PSI-L request err %d\n", ret);
> -		return ret;
> -	}
> +	if (rx_chn->common.udmax->match_data->version =3D=3D K3_UDMA_V1) {
> +		ret =3D xudma_navss_psil_pair(rx_chn->common.udmax,
> +					    rx_chn->common.src_thread,
> +					    rx_chn->common.dst_thread);
> +		if (ret) {
> +			dev_err(rx_chn->common.dev, "PSI-L request err %d\n", ret);
> +			return ret;
> +		}
> =20
> -	rx_chn->psil_paired =3D true;
> +		rx_chn->psil_paired =3D true;
> =20
> -	xudma_rchanrt_write(rx_chn->udma_rchanx, UDMA_CHAN_RT_CTL_REG,
> -			    UDMA_CHAN_RT_CTL_EN);
> +		xudma_rchanrt_write(rx_chn->udma_rchanx, UDMA_CHAN_RT_CTL_REG,
> +				    UDMA_CHAN_RT_CTL_EN);
> =20
> -	xudma_rchanrt_write(rx_chn->udma_rchanx, UDMA_CHAN_RT_PEER_RT_EN_REG,
> -			    UDMA_PEER_RT_EN_ENABLE);
> +		xudma_rchanrt_write(rx_chn->udma_rchanx, UDMA_CHAN_RT_PEER_RT_EN_REG,
> +				    UDMA_PEER_RT_EN_ENABLE);
> +	} else {
> +		xudma_rchanrt_write(rx_chn->udma_rchanx, UDMA_CHAN_RT_CTL_REG,
> +				    UDMA_CHAN_RT_CTL_AUTOPAIR |  UDMA_CHAN_RT_CTL_EN);
> +	}

[Severity: High]
Does this also need to poll for the completion of the channel autopairing
sequence, similar to the TX side?

[Severity: High]
Since V2 channel enable logic is added here, do k3_udma_glue_tdown_rx_chn()
and k3_udma_glue_disable_rx_chn() also need updates for V2 hardware?

k3_udma_glue_tdown_rx_chn() currently writes the teardown trigger to
UDMA_CHAN_RT_PEER_RT_EN_REG, which V2 hardware ignores for teardown. The
UDMA_CHAN_RT_CTL_EN bit would never clear, leading to a permanent failure
in the polling loop (RX tdown timeout).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724102115.2854=
-1-s-adivi@ti.com?part=3D18
