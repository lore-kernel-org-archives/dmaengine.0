Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013016.outbound.protection.outlook.com [40.107.159.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E72A49B5B2;
	Thu, 10 Sep 2026 22:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789078136; cv=fail; b=rNLvLBCwrKgzbBn4CWRZEXNVfEH6Xj4ORIqh0c+IUFWK5dGMEu4QQggcvUBIkJ5jgaCD1BUZHKA7S2neSoXJuKPf64/Jdl6baakgSRQHX2M5y3dbgQwkQ/vBlAdPXpRzch9oiTjc2I2DWAMtLoUWwp8cg6Z1DjGCn8jBAUEPwUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789078136; c=relaxed/simple;
	bh=XfY5/0b2/H2WH+3twQfS8XDpy7caVeoSDn9+vrj/+DU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VYPGbU0ZSW3bpwQPNYKEUBd+L5pIsZhGw1uO8R8jUzzNJ+48Yk2atUK3n1RSDROE1AhM7GqrbmTpuyk8pwF9nuG21zuUjToiqI20i8XUw9BvLGPzoDiCDkafvRbYMs723uqXwWTFwDzQGeukvZB1g6Fg/MaPSQbht5y+98bgcYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Aqy+ionC reason="signature verification failed"; arc=fail smtp.client-ip=40.107.159.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Aqy+ionC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxxHPZedvZwtVQpy8EJNGn291IlsM/B6cdS2zu0kzdXjG6m6Q+qWW3PmRQqEZvOkVgTMImbCarUcVPgcSGM3jRJTQXxMIP78N0bpfCHyuup4vO4eD3xr1K7GSyx9lhhZdxkwpwtBlIX8ES4bzviD3GPTapfBsCvfp9XEX22+X8oDAW9TvbhDPrC/uYXAeeQ0V9dP28zJ2w4frUI6FuU70EqA2UPiZjbij+Pmt8qeZuZfxi6ViymiOxlaKanoITG1FwVqcmjH1rr/TRquAJEOn2ngtG1R+YJFutGvfwerC8h+iYo5pQRAuOJPwGA5kvZuUxulKMjQI2pvcZ7HLzvNnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUS2BW+Zf1nC/hfLMROCTo3Aj6cmzCZ40fhnhA7Lj7g=;
 b=OLwzyC9bBxrZNVmGQgLuBwYKnQGNUVEprwroVuWWcM4KP3PyngI5t3CwkgOtK6KHVW0bN84+U8Eaz29sF0zuZfFtZaOwKOpwWCaba8TYGvrRNP93q7PjRxWiabkpUiJ6P3BrYYAjba5+Fuijc6vdUBqIgkzhzawvH2cPIWGomjW8v8f76M3gLJY9CjWvlfbZ8lcYq3hAfdRNfzle6xDPXKe3MZn6sHCh64ejmItavMubh21uo0oEFGFNQ4c0zjanZSXJ2FMxlrthdfjZs12O/0I5bOZb9s5AvFOXZlAVFcu1Pxon5SayFYhFduSvU868nfAhT1psw/2LZApQSrRWCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUS2BW+Zf1nC/hfLMROCTo3Aj6cmzCZ40fhnhA7Lj7g=;
 b=Aqy+ionCZk5fdJc+KlJbP+reZMH5ESLSqnaywuEe+VHK3Ioq1+mm+JfpB4a5tJcRmxpF5bc2ZZ0OunRgeBtTiwnSStbA2rP4KxJxrNvI6yqeE7yAiXahxk/rBIdtPDH/bcV7OHA8HesMHH0k169tcMKdA1vK7ZyVp3qjeurKBE1E7szAAg9ZljcZS3dWLelnpzm+whR+rNLFHu8B6GnGEyvSGF5zMK3PmiPPO3obK2R/EQ2InG2Iz8pSs3AUaTMJ7bx/xgAP5b5260klDiuwTaGTY3X3pbK7lCAMm8JxWJpTd8ekl8lQs+uHnov3LOU789H23APfaNx35rXFjTf7OQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB11664.eurprd04.prod.outlook.com (2603:10a6:10:60c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 22:08:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 22:08:50 +0000
Date: Thu, 10 Sep 2026 18:08:41 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Frank Li <Frank.Li@kernel.org>, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/2] dmaengine: fsl-edma: Support dynamic
 scatter/gather chaining
Message-ID: <aqMqaaDRKHzZObJE@lizhi-Precision-Tower-5810>
References: <20260909-fsl-edma-dyn-sg-v9-0-60bb2e678e8f@bootlin.com>
 <20260909-fsl-edma-dyn-sg-v9-2-60bb2e678e8f@bootlin.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260909-fsl-edma-dyn-sg-v9-2-60bb2e678e8f@bootlin.com>
X-ClientProxiedBy: PH8P220CA0034.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::17) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB11664:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cb294da-f90e-448c-52c7-08df0f881731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|1800799024|376014|10067099003|56012099006|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	8E+0Pv9y2+pkgdlhVOo/ob9k2MmdRfRI6nlyGfOpJCtYhluSt9Rb6D4TAmO4c0b94MBh/t/YU2Ntas/lNaXvZro7P5zSWhBcKrb5zloc98FeUEv6qFOLBDrch06wYyd3csOb+dq8VR9sbp/JPzbYd706UXaW/2b/DsljrIjHFQUo0IVv0939o620lCD2KzxhxPrFneSMNKidfQ/CN/6dXRLxoaZm2K1gh4/Spwwx+i375IJfz465wEvUaU2qQ3nk+QcThAfgIJuMg4PF8o7Ei375lZs1Hb+sOvSNzfsa1TAmzbEE/R0tBR/ZLnWtrn74/IFk4xcZqYbQHO8eSYgCNRq80TH+t9Q/riHXay896VoVFaCF3hyCsNBZst5p0IJ0sYs5YfE6m+0oNrpHEpfYVy+yWVH7EmNZGLp3ZBxVgsZ7qoRdBaX6etFk8CT7GwO1G3+7JvX+HcmCVn4WmkG+6nkidP2+TFL1+ji5sEc6Pf80H2lTSIwAi+Tar6lbb/afemj2kh5U/9eIVd3ZRrQk2NrbiYIi8vR3/ZNN7KGypgRy6XECB+YnPZWh9vQSf3w1orCrxhJAxq5/vkNLs2o+aFKIRdPk/LkNeLswKp1Xr2LPvwtEk7fpyLlTHza5qBb5ieLvLUcLFnApW90pcVCt9nhHzgdZsp98Cg7TsNVlmsU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?M6LKVMghG2yw65g6RBPYYBPP0QyXWcZ6eAAz3aGot1IL40UkbBQFdVALvk?=
 =?iso-8859-1?Q?sgOcjixDRHwttr7LT6cfTs42/LkqYqvusc1Lb2UX1uCt6MUj6zZKniTj/u?=
 =?iso-8859-1?Q?/nBALfaFr6sV/XhoRPAnL0gIL/5D6DsKZcYE/sYK+GJd7fOQkrcuhWLXmd?=
 =?iso-8859-1?Q?ewDMXlTZ64p6Go867/PabjVHiRAjwKjq6ekvU06AENbXFOKLei3dvPKGPF?=
 =?iso-8859-1?Q?SyQg7Q4X+eeQJtNe/nKsE3OtG+CBmnDQIXQH4xWD5kh5wsYArZ7mHEajK7?=
 =?iso-8859-1?Q?7frAAnWqmYaCaUsfOtzVoYZDQGWL3raA02FQvBa6mCSdXNfV6nu58UA7nf?=
 =?iso-8859-1?Q?4zOlixT20SSKeVpjI2i03LXc6SC41Feg3gI8Rfl9D4fge7rBTxJAvHlUWi?=
 =?iso-8859-1?Q?V79FIHU+4fx5udVhCg9qdwTsx7+y7rU29gi6GOMcv/irXQy5T2+TEbrv5V?=
 =?iso-8859-1?Q?R+5HiKNjhTZ8Rh1wkUoKA/JogfUJkG56OSeyyWJ2h6SW4fTx8oljf18db8?=
 =?iso-8859-1?Q?+zx7tvfDViPjem7A7ODNwSIGOLLDwn3H+1hNtgi55tEYIXmZFpSp2pIKGf?=
 =?iso-8859-1?Q?BbyCpPd5malADhv1WNvBRKLkWZAGn9Bx+I/e0TKZIY4ocPEFIzBRdkmv/Q?=
 =?iso-8859-1?Q?6ABF0jpRDsa1SS2R6mmlAwEBjzupCtBzJRhpGOVwyJCtC2E+s1cwtC9bVL?=
 =?iso-8859-1?Q?01h5PgKwwzdyD21VNbSQPZ5pITIRTTIbbimnOLP4ubX2xWkDbqpPJqPeeD?=
 =?iso-8859-1?Q?SkLtKSXbn5wFnk7AyuUUWxEdOK2jnY5A2T8oHyOKZmyi+tO8wVCzVePxSq?=
 =?iso-8859-1?Q?oY2CHr4syGRwWTMxAbtCDd55BdiZH/UOmDKv1Ou8i45fXdiN2CybewI4oq?=
 =?iso-8859-1?Q?E3l53cPZ6WJdEIGE5tG9NOqvi1GlnyRAlaowCmUmZwJ0kV1N9U/7JvDKvE?=
 =?iso-8859-1?Q?XSIN/fiitDol/D7kHVV2ePacYplpvm0tpIxkCVyTETH4IZtKVReOYe5a5+?=
 =?iso-8859-1?Q?bGXrUhFqy4aO7r5X49qcIVV4iZJ8yl6J0nSw2uFnR21GdAHVAa3An6IL9Y?=
 =?iso-8859-1?Q?5j2AgXx2UwhmyWNHailUu01tl93PaE5SMPqyOnzgCjR/mp/PpcwDuzN8Gm?=
 =?iso-8859-1?Q?mJ/QrMUt/bbOkejboR75zZwn+Fd2U2ESmQrYG5zXXFFDdHM4vtFwUemj/J?=
 =?iso-8859-1?Q?z6+yWGccNUpmE0LC88DfqejRt3wanUBCiHo1kOo7uNVGPUCVeSifP9xaLm?=
 =?iso-8859-1?Q?0wOUqYcaIJApRwcm0F4DMUiMvB2C5T3Y8s5ZcTlWgMNxf11l1x5mF6M3CI?=
 =?iso-8859-1?Q?Ov7uuPSSjDzbxGJscAbk+fBP7FQhjsptvZsWB1Z2RcWwYerl0OVKVPhFap?=
 =?iso-8859-1?Q?g3iqdi4lSmdFMvksckewqqCakciEj21Nde5Hbj/hljlq1/z6OyxPTC0skA?=
 =?iso-8859-1?Q?bRqX/Ecm5Gv1umYfUZPjNkQLVNoiHtgFX89VQRpa9p+PBcORqYIf6ZvNa6?=
 =?iso-8859-1?Q?4f4DxC5Aq/3VCTohRd3IxOOhmgxk+SnlJOGtdSujpx94TI3baYwYekXmPf?=
 =?iso-8859-1?Q?bIB6jrzwJLq7TaAXKanlLw1tS9QOJuX5RngtXPW+aN/cyxkt6i3MM1giTU?=
 =?iso-8859-1?Q?hdhOMQGU4nZTlyKjXtBqRtmreHp3OkKTStF3I0d4rb5fykg4/HfzMxoYDg?=
 =?iso-8859-1?Q?6WAW2E13kx+iscQSqmGRBdZ+sPYLB1x5HxLFHKrOc7k+xzR/Ttj4IDMij2?=
 =?iso-8859-1?Q?ZbKe8GpyhM440z+/nBmQBZNhFmoJvXMLGmvTWvUviLAQ2kDI2Br4dXK/XM?=
 =?iso-8859-1?Q?4MJiTpYihADDVgVvWU5ASKRWK7Nttw3zm98LtT6XvzveoudbxRlI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb294da-f90e-448c-52c7-08df0f881731
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 22:08:49.8632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9mHp68H3li1qOksvr/+T5U6o8Z4yXue81B/23DSuEagkDuKPRt0mA4G1rHC8BUv2Sd0hIAraSUvbTPcVy/qTJf2OECadBReJVSl32a2NAI57/CzbA14V5p3U2JlXF0t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11664

On Wed, Sep 09, 2026 at 05:19:46PM +0200, Benoît Monin wrote:
> Implement dynamic linking of scatter/gather transfers to enable
> chaining multiple DMA descriptors without stopping the channel.
> This avoids waiting for the channel to go idle if there is another
> transaction already issued.
>
> Add fsl_edma_link_sg() to dynamically link the last TCD of a previously
> issued descriptor to the first TCD of a new descriptor by setting the
> scatter/gather address and the E_SG flag, and keeping the channel active
> by clearing the DREQ bit.
>
> Also in fsl_edma_link_sg(), assign a non-zero identifier to the new
> descriptor that is stored in the EDMA_TCD_CSR_LINKCH field of the CSR
> of each TCD, after checking that the descriptors are not using channel
> linking. The use of this field (MAJORLINKCH in the datasheet) as an
> identifier for dynamic scatter/gather is suggested in the i.MX93 datasheet.
>
> When the last issued descriptor is the one currently active on the
> channel and has a single TCD, the scatter/gather address and CSR are
> also written directly to the hardware registers to ensure the link
> takes effect immediately, unless the DMA controller requires the DONE
> bit to be cleared for the CSR change to take effect. Clearing the DONE
> bit would disrupt the interrupt handler.
>
> Linking is done in fsl_edma_issue_pending(), which iterates over the
> submitted descriptors, links each one to the previously issued
> descriptor via fsl_edma_link_sg(), and then moves it to the issued
> list. This ensures that transactions are linked in the order they were
> issued. Linking of a descriptor is limited to 31 outstanding descriptors
> on the issued list so the identifier fits in the LINKCH field of the CSR
> register. The value of zero is left to identify non-linked descriptors.
>
> Update fsl_edma_xfer_desc() to avoid re-initializing the hardware when a
> transfer is already in progress, allowing seamless chaining of descriptors.
>
> Modify the transfer completion handler to check the DONE flag in the
> channel CSR before marking the transfer complete. Since this flag is only
> available on SoC with the split registers layout, only link transactions
> for DMA controllers flagged with newly added FSL_EDMA_DRV_CSR_LINKCH. This
> flag is set for eDMA3 and EDMA4 controllers which are able to perform
> dynamic scatter/gather linking.
>
> The completion handler also reaps issued descriptors whose link channel ID
> (EDMA_TCD_CSR_LINKCH) has already been passed by the hardware, marking
> them as completed even if their corresponding interrupt has been missed.
>
> Add trace event for scatter/gather linking operations.
>
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
> ---
>  drivers/dma/fsl-edma-common.c | 138 ++++++++++++++++++++++++++++++++++++++++--
>  drivers/dma/fsl-edma-common.h |  30 +++++----
>  drivers/dma/fsl-edma-trace.h  |   5 ++
>  3 files changed, 155 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
> index c5f5951c988b..76fbd2bc5154 100644
> --- a/drivers/dma/fsl-edma-common.c
> +++ b/drivers/dma/fsl-edma-common.c
> @@ -55,10 +55,36 @@ void fsl_edma_tx_chan_handler(struct fsl_edma_chan *fsl_chan)
>  	}
>
>  	if (!fsl_chan->edesc->iscyclic) {
> -		list_del(&fsl_chan->edesc->vdesc.node);
> -		vchan_cookie_complete(&fsl_chan->edesc->vdesc);
> +		u16 csr = edma_read_tcdreg(fsl_chan, csr);
> +		u8 link_sg_id = FIELD_GET(EDMA_TCD_CSR_LINKCH, csr);
> +		struct virt_dma_desc *vdesc, *tmp;
> +
> +		/* Channel is DONE when a TCD with D_REQ set completes */
> +		if (!(fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_SPLIT_REG) ||
> +		    (edma_readl_chreg(fsl_chan, ch_csr) & EDMA_V3_CH_CSR_DONE)) {
> +			fsl_chan->status = DMA_COMPLETE;
> +		}
> +
> +		list_for_each_entry_safe(vdesc, tmp, &fsl_chan->vchan.desc_issued, node) {
> +			struct fsl_edma_desc *fsl_desc = to_fsl_edma_desc(vdesc);
> +			bool id_match = (link_sg_id == fsl_desc->link_sg_id);
> +
> +			/*
> +			 * If the transfer is still running,
> +			 * don't mark as complete the current descriptor
> +			 */
> +			if (id_match && fsl_chan->status != DMA_COMPLETE)
> +				break;
> +
> +			list_del(&vdesc->node);
> +			vchan_cookie_complete(vdesc);
> +
> +			if (id_match)
> +				break;
> +		}
> +
>  		fsl_chan->edesc = NULL;
> -		fsl_chan->status = DMA_COMPLETE;
> +
>  	} else {
>  		vchan_cyclic_callback(&fsl_chan->edesc->vdesc);
>  	}
> @@ -931,14 +957,99 @@ void fsl_edma_xfer_desc(struct fsl_edma_chan *fsl_chan)
>  	if (!vdesc)
>  		return;
>  	fsl_chan->edesc = to_fsl_edma_desc(vdesc);
> -	fsl_edma_set_tcd_regs(fsl_chan, fsl_chan->edesc->tcd[0].vtcd);
> -	fsl_edma_enable_request(fsl_chan);
> -	fsl_chan->status = DMA_IN_PROGRESS;
> +
> +	if (fsl_chan->status != DMA_IN_PROGRESS) {
> +		fsl_edma_set_tcd_regs(fsl_chan, fsl_chan->edesc->tcd[0].vtcd);
> +		fsl_edma_enable_request(fsl_chan);
> +		fsl_chan->status = DMA_IN_PROGRESS;
> +	}
> +}
> +
> +static void fsl_edma_link_sg(struct fsl_edma_chan *fsl_chan, struct fsl_edma_desc *fsl_desc)
> +{
> +	u32 flags = fsl_edma_drvflags(fsl_chan);
> +	struct fsl_edma_hw_tcd *last_tcd;
> +	struct fsl_edma_desc *prev_desc;
> +	struct virt_dma_desc *vdesc;
> +	u16 last_csr;
> +
> +	lockdep_assert_held(&fsl_chan->vchan.lock);
> +
> +	if (!(flags & FSL_EDMA_DRV_CSR_LINKCH) || fsl_desc->iscyclic)
> +		return;
> +
> +	vdesc = list_last_entry_or_null(&fsl_chan->vchan.desc_issued,
> +					struct virt_dma_desc, node);
> +	if (!vdesc)
> +		return;
> +
> +	prev_desc = to_fsl_edma_desc(vdesc);
> +	if (prev_desc->iscyclic)
> +		return;
> +
> +	last_tcd = prev_desc->tcd[prev_desc->n_tcds - 1].vtcd;
> +	last_csr = fsl_edma_get_tcd_to_cpu(fsl_chan, last_tcd, csr);
> +
> +	for (unsigned int i = 0; i < fsl_desc->n_tcds; i++) {
> +		struct fsl_edma_hw_tcd *tcd = fsl_desc->tcd[i].vtcd;
> +
> +		if (fsl_edma_get_tcd_to_cpu(fsl_chan, tcd, csr) & EDMA_TCD_CSR_E_LINK)
> +			return;
> +	}
> +
> +	if (!(last_csr & EDMA_TCD_CSR_D_REQ) ||
> +	    last_csr & EDMA_TCD_CSR_E_LINK)
> +		return;
> +
> +	/* Set a non-zero linked SG identifier to all TCD of the new descriptor */
> +	fsl_chan->link_sg_id++;
> +	if (fsl_chan->link_sg_id > FIELD_MAX(EDMA_TCD_CSR_LINKCH))
> +		fsl_chan->link_sg_id = 1;
> +
> +	fsl_desc->link_sg_id = fsl_chan->link_sg_id;
> +
> +	for (unsigned int i = 0; i < fsl_desc->n_tcds; i++) {
> +		struct fsl_edma_hw_tcd *tcd = fsl_desc->tcd[i].vtcd;
> +		u16 csr = fsl_edma_get_tcd_to_cpu(fsl_chan, tcd, csr);
> +
> +		csr |= FIELD_PREP(EDMA_TCD_CSR_LINKCH, fsl_chan->link_sg_id);
> +		fsl_edma_set_tcd_to_le(fsl_chan, tcd, csr, csr);
> +	}
> +
> +	/*
> +	 * Set DLAST_SGA before enabling E_SG in CSR: if the DMA engine
> +	 * only picks up the former, it updates DADDR at end of transfer,
> +	 * which is not reused.
> +	 */
> +	fsl_edma_set_tcd_to_le(fsl_chan, last_tcd, fsl_desc->tcd[0].ptcd, dlast_sga);
> +
> +	dma_wmb();
> +
> +	last_csr &= ~EDMA_TCD_CSR_D_REQ;
> +	last_csr |= EDMA_TCD_CSR_E_SG;
> +	fsl_edma_set_tcd_to_le(fsl_chan, last_tcd, last_csr, csr);
> +
> +	/*
> +	 * Update the registers if the engine already loaded the TCD,
> +	 * unless doing so requires clearing the DONE bit, as that could
> +	 * lead to lost completion.
> +	 */
> +	if (prev_desc == fsl_chan->edesc &&
> +	    prev_desc->n_tcds == 1 &&
> +	    !(flags & FSL_EDMA_DRV_CLEAR_DONE_E_SG)) {
> +		edma_cp_tcd_to_reg(fsl_chan, last_tcd, dlast_sga);
> +		edma_cp_tcd_to_reg(fsl_chan, last_tcd, csr);
> +	}
> +
> +	trace_edma_link_sg(fsl_chan, last_tcd);
>  }
>
>  void fsl_edma_issue_pending(struct dma_chan *chan)
>  {
>  	struct fsl_edma_chan *fsl_chan = to_fsl_edma_chan(chan);
> +	struct virt_dma_desc *vdesc, *tmp;
> +	size_t issued_count = 0;
> +	struct list_head *pos;
>  	unsigned long flags;
>
>  	spin_lock_irqsave(&fsl_chan->vchan.lock, flags);
> @@ -949,6 +1060,21 @@ void fsl_edma_issue_pending(struct dma_chan *chan)
>  		return;
>  	}
>
> +	/* Count the issued desc up to the maximum number of linked SG id */
> +	list_for_each(pos, &fsl_chan->vchan.desc_issued) {
> +		if (++issued_count > FIELD_MAX(EDMA_TCD_CSR_LINKCH))
> +			break;
> +	}
> +
> +	/* Link the SG descriptors with the available identifiers */
> +	list_for_each_entry_safe(vdesc, tmp, &fsl_chan->vchan.desc_submitted, node) {
> +		if (++issued_count > FIELD_MAX(EDMA_TCD_CSR_LINKCH))
> +			break;
> +		fsl_edma_link_sg(fsl_chan, to_fsl_edma_desc(vdesc));
> +		list_move_tail(&vdesc->node, &fsl_chan->vchan.desc_issued);

If this happen, it will depend on DONE irq to queue left desc_issued to
hardware tcd? So there are idle gap?

I think it is fine, less possible longer than 31. I just want to confirm
if my understand is correct.

> +	}
> +
> +	/* Issue the rest of the descriptors unlinked */
>  	if (vchan_issue_pending(&fsl_chan->vchan) && !fsl_chan->edesc)
>  		fsl_edma_xfer_desc(fsl_chan);
>
> diff --git a/drivers/dma/fsl-edma-common.h b/drivers/dma/fsl-edma-common.h
> index 0d028048701d..deb172f5a4db 100644
> --- a/drivers/dma/fsl-edma-common.h
> +++ b/drivers/dma/fsl-edma-common.h
> @@ -42,6 +42,7 @@
>  #define EDMA_TCD_CSR_E_LINK		BIT(5)
>  #define EDMA_TCD_CSR_ACTIVE		BIT(6)
>  #define EDMA_TCD_CSR_DONE		BIT(7)
> +#define EDMA_TCD_CSR_LINKCH		GENMASK(12, 8)
>
>  #define EDMA_V3_TCD_NBYTES_MLOFF_NBYTES(x) ((x) & GENMASK(9, 0))
>  #define EDMA_V3_TCD_NBYTES_MLOFF(x)        (x << 10)
> @@ -169,6 +170,7 @@ struct fsl_edma_chan {
>  	struct dma_slave_config		cfg;
>  	u32				attr;
>  	bool                            is_sw;
> +	u8				link_sg_id;
>  	struct dma_pool			*tcd_pool;
>  	dma_addr_t	/fsl_edma_xfer_desc		dma_dev_addr;
>  	u32				dma_dev_size;
> @@ -199,6 +201,7 @@ struct fsl_edma_desc {
>  	struct virt_dma_desc		vdesc;
>  	struct fsl_edma_chan		*echan;
>  	bool				iscyclic;
> +	u8				link_sg_id;
>  	enum dma_transfer_direction	dirn;
>  	unsigned int			n_tcds;
>  	struct fsl_edma_sw_tcd		tcd[];
> @@ -225,20 +228,23 @@ struct fsl_edma_desc {
>  #define FSL_EDMA_DRV_TCD64		BIT(15)
>  /* All channel ERR IRQ share one IRQ line */
>  #define FSL_EDMA_DRV_ERRIRQ_SHARE       BIT(16)
> +/* Major link channel in CSR used for linking SG descriptors */
> +#define FSL_EDMA_DRV_CSR_LINKCH		BIT(17)
>
> +#define FSL_EDMA_DRV_EDMA3	(FSL_EDMA_DRV_SPLIT_REG |		\
> +				 FSL_EDMA_DRV_BUS_8BYTE |		\
> +				 FSL_EDMA_DRV_DEV_TO_DEV |		\
> +				 FSL_EDMA_DRV_ALIGN_64BYTE |		\
> +				 FSL_EDMA_DRV_CLEAR_DONE_E_SG |		\
> +				 FSL_EDMA_DRV_CLEAR_DONE_E_LINK |	\
> +				 FSL_EDMA_DRV_CSR_LINKCH)
>
> -#define FSL_EDMA_DRV_EDMA3	(FSL_EDMA_DRV_SPLIT_REG |	\
> -				 FSL_EDMA_DRV_BUS_8BYTE |	\
> -				 FSL_EDMA_DRV_DEV_TO_DEV |	\
> -				 FSL_EDMA_DRV_ALIGN_64BYTE |	\
> -				 FSL_EDMA_DRV_CLEAR_DONE_E_SG |	\
> -				 FSL_EDMA_DRV_CLEAR_DONE_E_LINK)
> -
> -#define FSL_EDMA_DRV_EDMA4	(FSL_EDMA_DRV_SPLIT_REG |	\
> -				 FSL_EDMA_DRV_BUS_8BYTE |	\
> -				 FSL_EDMA_DRV_DEV_TO_DEV |	\
> -				 FSL_EDMA_DRV_ALIGN_64BYTE |	\
> -				 FSL_EDMA_DRV_CLEAR_DONE_E_LINK)
> +#define FSL_EDMA_DRV_EDMA4	(FSL_EDMA_DRV_SPLIT_REG |		\
> +				 FSL_EDMA_DRV_BUS_8BYTE |		\
> +				 FSL_EDMA_DRV_DEV_TO_DEV |		\
> +				 FSL_EDMA_DRV_ALIGN_64BYTE |		\
> +				 FSL_EDMA_DRV_CLEAR_DONE_E_LINK |	\
> +				 FSL_EDMA_DRV_CSR_LINKCH)

Can you avoid move \ in this patch to reduce difference.

Frank
>
>  struct fsl_edma_drvdata {
>  	u32			dmamuxs; /* only used before v3 */
> diff --git a/drivers/dma/fsl-edma-trace.h b/drivers/dma/fsl-edma-trace.h
> index 45d964a3726d..f4b0021d2bd0 100644
> --- a/drivers/dma/fsl-edma-trace.h
> +++ b/drivers/dma/fsl-edma-trace.h
> @@ -121,6 +121,11 @@ DEFINE_EVENT(edma_log_tcd, edma_fill_tcd,
>  	TP_ARGS(chan, tcd)
>  );
>
> +DEFINE_EVENT(edma_log_tcd, edma_link_sg,
> +	     TP_PROTO(struct fsl_edma_chan *chan, void *tcd),
> +	     TP_ARGS(chan, tcd)
> +);
> +
>  #endif
>
>  /* this part must be outside header guard */
>
> --
> 2.55.0
>
