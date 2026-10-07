Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8153C483BF2;
	Wed,  7 Oct 2026 11:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371315; cv=none; b=pXyQyVFxGsFl+MoInlQQSDU59PjQ2S1TKADe3hUJx+GXksoXNTjtQbjxnejcnm9weOwsTcEP+QPUpsqXfSoBurd56tXX9KdEyYfewyFQuHXQkEUP9DbyaqJzshZMowJpNh03EoODlt/v1DVnet8p4HONYIrkxunfe6gXIv+CJcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371315; c=relaxed/simple;
	bh=NzHe65DventoijSoonZPQ+KXIkmumDEgG8tFKSVN0Oo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=UVRvrafP1uWLzcIJfoXElMqN55CeKm3y8HuW+iFyCxV88JgO+L7Izjb9df+uPyAVUwstjlZx20gAkqnvXS9wCixNeL2Ciw+2uLBR8hey325fjR6O9kojhMrL6nGXxL8M28g4ZTDXBOYnrEDch830h/qS8N+kxjWEfm8EQ47mvSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MGdlNjdz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MGdlNjdz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 210361F008A1;
	Wed,  7 Oct 2026 11:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791371297;
	bh=uFso4s9qu/CvpNpQTzn/PYvxHSVNPPqu9LyoOfIY7/g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MGdlNjdzgn1lrU+5wTXeQt+dwd40xtVuGCX4gkHMi3lZs8nDwscFAlgkLSE6egVgV
	 /zRznFmiGOKqUEXVrZzPqiDDb/bcqaoBsnDU4LmgXqP9/8KDGK9FJ4LG1hP72MHv/G
	 KGm85L0RKxOBmNrEgogZaqlb/yiMkLui821OaZE669DXDBiMY0IbW6Qvqgio2Nmyo6
	 QnMEC0Q1SosmBdIXvzmE3rtEWucX6v+qggDM63dDeqLM8Ovh0SbNSOJd/5FR6860Ka
	 EHzn9brLclOzzVOdjE/RjqmSr3EPoa6vOHxZWh06bF4ySXN+mZS40f4hsgXeMDxbba
	 9I7c16LkwemEQ==
Message-ID: <sashiko-outbox-162914@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 19/20] dmaengine: ti: k3-udma-v2: Update glue layer
 to support PKTDMA V2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: devicetree@vger.kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261007102936.2402427-20-s-adivi@ti.com>
References: <20261007102936.2402427-1-s-adivi@ti.com>
 <20261007102936.2402427-20-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 11:08:16 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dmaengine: ti: k3-udma-glue: invalid TX filtering bits written t=
o RX channel CFG
--

commit 80d8898567997b92a02ff1c556dd2a370e753920
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma-v2: Update glue layer to support PKTDMA V2

This commit updates the glue layer to support PKTDMA V2 for non DMAengine
users. It adds handling for the absence of TISCI, direct IRQs, and TX/RX
channel autopairing.

> diff --git a/drivers/dma/ti/k3-udma-glue.c b/drivers/dma/ti/k3-udma-glue.c
> --- a/drivers/dma/ti/k3-udma-glue.c
> +++ b/drivers/dma/ti/k3-udma-glue.c

[ ... ]

> @@ -728,11 +773,24 @@ static int k3_udma_glue_cfg_rx_chn(struct k3_udma_g=
lue_rx_channel *rx_chn)
>  	req.rx_chan_type =3D TI_SCI_RM_UDMAP_CHAN_TYPE_PKT_PBRR;
>  	req.rx_atype =3D rx_chn->common.atype_asel;
> =20
> +	if (!tisci_rm->tisci) {
> +		u32 val =3D 0;
> +
> +		if (!rx_chn->common.epib)
> +			val |=3D UDMA_CHAN_CFG_FILT_EINFO;
> +		if (!rx_chn->common.psdata_size)
> +			val |=3D UDMA_CHAN_CFG_FILT_PSWORDS;
> +
> +		xudma_rchanrt_write(rx_chn->udma_rchanx, UDMA_CHAN_RT_CFG_REG, val);

[Severity: Medium]
Are these TX-specific filtering bits valid for the RX channel configuration
register?

According to the hardware abstractions, UDMA_CHAN_CFG_FILT_EINFO and
UDMA_CHAN_CFG_FILT_PSWORDS map exclusively to the transmit channel's TCHAN_=
TCFG
register. Receive channels do not appear to have these configuration fields
in their CFG register.

Extended info presence for RX channels seems to be configured at the receive
flow level (using UDMA_FLOWRT_RFA_RX_EINFO_PRESENT), which is already handl=
ed
independently in k3_udma_glue_cfg_rx_flow(). Writing these TX-specific bits
to the RX channel here might set undefined or reserved bits and potentially
corrupt the RX channel hardware state.

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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007102936.2402=
427-1-s-adivi@ti.com?part=3D19
