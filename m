Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45442363C75;
	Mon, 10 Aug 2026 17:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786382455; cv=none; b=udMgyL0tlikUZgyibG0LVPjy403FsR3QfgmKrN2AjpWZYPjbkvepkaNpmvgSokyMfMOK8BrsFl3/mY7kUKZ+J7yQ9JymyJXkKr966uIGlDUcmEdZ/MAQio5xDI3yScUb7KRYPeF0Dq1qb+iH7IMkysJvMqs+qvGclO7LIz02Alo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786382455; c=relaxed/simple;
	bh=b8U61I8U+pXiZOhugm9hn4TcNffMep9S/iFL+fm3y2w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FSTF37v6+75j7ak+0Yq5I5TI6NcCb99rkSNP1GnnMnCjhKyYE2/Pm4x51GGTYrNBFiQguMJNSnKl3aDxDImcjvzIMYCEVkNuRCZNvt+ixLoaVl4RlVZ4oMRQnikdiFmFK1cQ4YbsxtwdNZXLLy+xYPbEXWKbCB+PhLA6JwXtqtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n8oaKLPJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n8oaKLPJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D11341F000E9;
	Mon, 10 Aug 2026 17:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786382451;
	bh=jEh3ZorWlAwQDHaDMh1BWutAJBwz0a3ej5Meo/CoAgc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n8oaKLPJ/Ww2LqSxXW58R48nYZ8Be4wE9gjxOvsr51Qszs4YhkIvCmWLMsXajPqBF
	 pl3ukjdwVbTYDHJBo7zBzyDi6Ohzyp1DtZV+SykYfMMUWecCrvrlFkYd7MPoya4Z9q
	 hNM9/rxhmxDdum9EBvivzBwss9AAkSdUll3cAl02G3j+vE41Kncz8Rv2YWg5U/L45e
	 eMgHqDKy9M+hFmjgk97NNyu2tINeaILLpSBAvgzOK3NrtilH8q1zhxMoxZwmxcIVM/
	 ynqdooKJId39q4lkE6DMAxsBeWZqRhMdVx6bJg40pnOt+SC/OiDK/qiv6rkitRbjyI
	 2V224suDe7rQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 18/19] dmaengine: ti: k3-udma-v2: Update glue layer
 to support PKTDMA V2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260810151423.1948224-19-s-adivi@ti.com>
References: <20260810151423.1948224-1-s-adivi@ti.com>
 <20260810151423.1948224-19-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 17:20:50 +0000
Message-Id: <20260810172050.D11341F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Hardware TX and RX channels are left enabled if the V2 autopairing=
 process times out, leading to potential DMA Use-After-Free.
- [Low] Unmet direct dependency for `TI_K3_RINGACC` when `TI_K3_UDMA_V2` is=
 selected.
--

--- Patch [18]: [PATCH v8 18/19] dmaengine: ti: k3-udma-v2: Update glue lay=
er to support PKTDMA V2 ---
commit 679ff99789e75f58a08b38ae95963dd08f423c94
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma-v2: Update glue layer to support PKTDMA V2
   =20
Update glue layer to support PKTDMA V2 for non DMAengine users.
The updates include handling absence of TISCI, direct IRQs, and
Autopair: Lack of PSIL pair.

> diff --git a/drivers/dma/ti/Kconfig b/drivers/dma/ti/Kconfig
> index 40713bd1e8e9b..ada2ea8aca4b0 100644
> --- a/drivers/dma/ti/Kconfig
> +++ b/drivers/dma/ti/Kconfig
> @@ -68,7 +68,7 @@ config TI_K3_UDMA_COMMON
>  config TI_K3_UDMA_GLUE_LAYER
>  	tristate "Texas Instruments UDMA Glue layer for non DMAengine users"
>  	depends on ARCH_K3 || COMPILE_TEST
> -	depends on TI_K3_UDMA
> +	depends on TI_K3_UDMA || TI_K3_UDMA_V2

[Severity: Low]
Does selecting TI_K3_UDMA_V2 cause an unmet dependency warning?

TI_K3_UDMA_V2 selects TI_K3_RINGACC but lacks the depends on
TI_SCI_INTA_IRQCHIP dependency required by TI_K3_RINGACC.

>  	help
>  	  Say y here to support the K3 NAVSS DMA glue interface
>  	  If unsure, say N.

[ ... ]

> diff --git a/drivers/dma/ti/k3-udma-glue.c b/drivers/dma/ti/k3-udma-glue.c
> index bec4deb480e60..9b9921e904bc2 100644
> --- a/drivers/dma/ti/k3-udma-glue.c
> +++ b/drivers/dma/ti/k3-udma-glue.c

[ ... ]

> @@ -525,21 +539,38 @@ int k3_udma_glue_enable_tx_chn(struct k3_udma_glue_=
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

[ ... ]

> +	} else {
> +		u32 val;
> +
> +		xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_CTL_REG,
> +				    UDMA_CHAN_RT_CTL_AUTOPAIR | UDMA_CHAN_RT_CTL_EN);
> +
> +		ret =3D read_poll_timeout(xudma_tchanrt_read, val,
> +					val & (UDMA_CHAN_RT_CTL_PAIR_COMPLETE |
> +					       UDMA_CHAN_RT_CTL_PAIR_TIMEOUT),
> +					100, 500, false,
> +					tx_chn->udma_tchanx, UDMA_CHAN_RT_CTL_REG);
> +		if (ret || (val & UDMA_CHAN_RT_CTL_PAIR_TIMEOUT)) {
> +			dev_err(tx_chn->common.dev, "TX channel autopair timeout\n");
> +			return -ETIMEDOUT;
> +		}

[Severity: High]
If the autopairing times out, does this leave the TX channel enabled?

Since UDMA_CHAN_RT_CTL_EN was set before the timeout and is not cleared on
this error path, could the hardware eventually pair and perform DMA accesses
to freed memory if callers assume a failure means the channel is inactive?

> +	}
> =20
>  	k3_udma_glue_dump_tx_rt_chn(tx_chn, "txchn en");
>  	return 0;

[ ... ]

> @@ -1406,21 +1481,38 @@ int k3_udma_glue_enable_rx_chn(struct k3_udma_glu=
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

[ ... ]

> +	} else {
> +		u32 val;
> +
> +		xudma_rchanrt_write(rx_chn->udma_rchanx, UDMA_CHAN_RT_CTL_REG,
> +				    UDMA_CHAN_RT_CTL_AUTOPAIR | UDMA_CHAN_RT_CTL_EN);
> +
> +		ret =3D read_poll_timeout(xudma_rchanrt_read, val,
> +					val & (UDMA_CHAN_RT_CTL_PAIR_COMPLETE |
> +					       UDMA_CHAN_RT_CTL_PAIR_TIMEOUT),
> +					100, 500, false,
> +					rx_chn->udma_rchanx, UDMA_CHAN_RT_CTL_REG);
> +		if (ret || (val & UDMA_CHAN_RT_CTL_PAIR_TIMEOUT)) {
> +			dev_err(rx_chn->common.dev, "RX channel autopair timeout\n");
> +			return -ETIMEDOUT;
> +		}

[Severity: High]
Similarly for the RX channel, if the autopairing times out, does this return
-ETIMEDOUT without disabling the hardware channel?

Could this lead to memory corruption if the hardware operates after the dri=
ver
has freed the associated ring buffers?

> +	}
> =20
>  	k3_udma_glue_dump_rx_rt_chn(rx_chn, "rxrt en");
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810151423.1948=
224-1-s-adivi@ti.com?part=3D18
