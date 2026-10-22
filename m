Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792685440;
	b=2QF5N0z06McYlr89DmDwqe/6UwbliqH4tD37gLohoPM8m9ckTn0pV+uE61bvwsobCVR8
	 GOQrHv5oMmpXi5U3kQrTHdZUDOtogb4wOcDoRNXNlUEIpX0BU/vZmfkKtCDnI5goN/zm5
	 AgLTjDumw25rcBOkOjTfa8t1h1VP5V2gogNRADtNOb+KeLy60kWNZWIX1dHxzczv+SdCH
	 wYFDTPK52bCgkGRIyz/7NZdgO9D61saNbIR4DXzh6246okdbEJ3GkEkfDFaLSnmibHjsq
	 cc7lYsk6PETCMEMOz+IrIeNtHCLv/ZNUfVGEBu/GKVVbCF7ULb9XQ8NyeJ0oqegraaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792685440;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=YmDtfeYUYdTqZj/VRlgrbHB89NaGUNHVyxGlUNdKvk4=;
	b=eiJF+gai2WZbeUeylt+l369QDbHs2PDJgCHVUpY4JTB9sD+ZlmyfSd21RB0ChOURb+++
	 ayc5qiLt+OXqfb8/bKBySr6Yd0eSsVSkeBs1nQu2eWTWIhWTRbVwv0qXVAET7vgL5JhOC
	 gfR2QYlveB+NWf3mJEGQULGMHeeIG1iDfz5MwtYZBtgR95ZAcY+H3sU5O3b1RQIPftPNz
	 fJ0Rjea2vKTLSce+ANLNooDbARMTLyWIEPJTxsmn/v03fPR1nV0X42+x/n1EYjXv9FtC5
	 x6qqTRDzuiHjEaXN45XPFGkqFODwulHQq5R0POyW2k4fymdtXFuJulu0t7AxyTrJELA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="raXeSzp/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.61
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011061.outbound.protection.outlook.com [52.101.70.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54BB606A31B;
	Thu, 22 Oct 2026 16:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C54BB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=raXeSzp/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QY8C7DDNk7egsqObevOoKyEYXYY7y/RjQxmESrZ93g40hRR3PI7ZIVq0+dlYXG1n0cLh9vXvuaoRujOaMJnCXsmqluryi2jiSpDInR+kEksdmAU6VwuAKg7K4+xXnHoZZxbkkWBp61YeTMAhFIRx4s5x12PCPpb4mMwBlAE3InN5ulPBAPpwamcNNHPxxlPKXPP4nbtK1Gf8x73cev/x8ulmMezElq6BNw4uqRxkgT4VkeJJiweqiOW1yvzO02Dni+io9zVWLM6HRkSpmBalaDgjFg1TosRtF2RtRpMVPk+tmQzqtD7TAHPLgoSqWAMhbq+LaNTPBfAM0uYMeCx+qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YmDtfeYUYdTqZj/VRlgrbHB89NaGUNHVyxGlUNdKvk4=;
 b=MyYve+geFCZHZUHWJ8JZaQenilGfAy0058X5iNeFjWf2AcRTUZ7tmQJwljL9ZdlI3Kr+ULxpbW2diNK+MOmSaIlBd/mIGR4gbulPdA9n7uS7Az/qXm5fc3j6p64Qe8YNRBkPZGf7bqOs2v95ow5b1w5HuXM5k2Tkr4Rkcl/bxL5KX865yqN7BQ8XSPa0XcQ40WnHlGR+QdvlGqKrqeVzldqsAsQdxaMQpS01IOZruowNiwIgfl+FPm5aRbQcdX2KemMiTLnOVR5zC5Qo4RJ28XHQmlBNn3bZ78b9c+FtTfjMcrxxW4EdCrUNJEvk+FT3QoSQ3EsEcAGmWixGfzqVsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmDtfeYUYdTqZj/VRlgrbHB89NaGUNHVyxGlUNdKvk4=;
 b=raXeSzp/mUUgj+fsGG4hoFieoo6rFpRg/noP7mykTqDzu+/L/LlIah/x1whAW8zWlb3yMeSj8Fq6Ic6vVRMmugt6/uqQW0xMfMqFVFHI6julIkwoBJP6ly2eBGr0jkTcmdiEPsa58oXORHS12U1zdEsVKyXb1mqyrY7mGULxDWwERkAVpd7XTT23M0RsSQPb8jxLw+qbeWGQR+EVhhUOUaKdLdmQonyqnwBEZcWBJ95chmMJRyyoYZg+JaCTM2nPY8BVdxqgRKsknCPRVMZDly59tK72rMw6IWhruEKHSHBW6qQpO68ZH3LHaPxBV/Ck5HIJgCPdwxfXiz6HKkdYdg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV1PR04MB10396.eurprd04.prod.outlook.com (2603:10a6:150:1c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 16:10:29 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 16:10:29 +0000
Date: Thu, 22 Oct 2026 11:10:20 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: sun6i: constrain descriptor addresses through
 the DMA mask
Message-ID: <ato1bMSJgTVZnOyd@SMW015318>
References: <20261021-submit-sun6i-dma-descriptor-mask-v1-v1-1-76e72bd52e57@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021-submit-sun6i-dma-descriptor-mask-v1-v1-1-76e72bd52e57@gmail.com>
X-ClientProxiedBy: DS7P220CA0065.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:224::29) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV1PR04MB10396:EE_
X-MS-Office365-Filtering-Correlation-Id: 75956e5f-b4aa-4997-8b71-08df3056fe06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|19092799006|1800799024|366016|261009223027099003|10067099003|56012099006|261021130227099003|261021121427099003|6133799003|261021135927099003|22082099003|18002099003|261021123027099003|11063799006|261021133027099003;
X-Microsoft-Antispam-Message-Info:
	A0W57FKSY6WmDw5IgV2PtrsTz6W21o8jmViBGmpFII0J/j+88STqUu0jgRXcxyIaz+3F2KYVs+QL0yVv3t1cTBnewxkuuxWRKQjnVUYxH1TcL5Cx13EKcvLZBO9aArdyQ7pS7/edxl26vvHXoAFk1jHYxZitt5yJJzSHH4KCCru2HOlHndEGH12s0MnnZuhJvEcS2Y944qP4OAFiMce9wGuK0K6rrmhHSI3elVLHAH0pCz5ArdrsTeG9caqczhH6dXJ1BcDIMAiB9CGGewX3alVbK3f+S6LQ1I508/dvrfnp/E6gJXfHblNCoB2Gk41gIIZcUzwIXPTpjB3kDq5BcnPbKkrpm5YJKA9W68k/Bl/0Ydb3p3WKiEWBXS954GYoCvKoqY4atHx/AmiNq95qJ6b7JysLVmrF2VVzFtdx8h6NREn4Bw+VFMUOTUNxP6sZJfP2y3LNmZTUMoJtjLowQk0B7UjhQwIGf4kJPe3jVtYtdxxFbVK03FtVTwcfQeuGypFIsI3CvCca1o1AlX8Tw5WMiCY/NAY4RvP2dpiuuIiIe+0yN0jdrbHbGof8DXcvgajf6Yt95KwT6HGsAymcCruBIt7AVKvOQ1aMNazRo5yPPE2aSiIvaB96Gkvh/gvWYu3rgy6/pRbjoV7QkEgAlAkH038HDMVio0l3kkk/CHQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(19092799006)(1800799024)(366016)(261009223027099003)(10067099003)(56012099006)(261021130227099003)(261021121427099003)(6133799003)(261021135927099003)(22082099003)(18002099003)(261021123027099003)(11063799006)(261021133027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BsSpPwjv5NL8Ee0qspkZlDOsbqNvUn1NREq3iJLdpOFA4VmuL75oLijTIWJ/?=
 =?us-ascii?Q?1SxG7EWiB44TXUUtQxRolmttqS+mNrNnl+Q2pCUTWGLWrTosnaVXieH0p+mW?=
 =?us-ascii?Q?gXfyMXygdMatZHzC6s8YMUAuTvL2TnFHf7BbpjtJqWzkLjJLDfUXYKbn4Xhf?=
 =?us-ascii?Q?ezt1PjxwecUMLYve12W4WwreOgZGen0Y5ZC1/kyc+Ro+iR8lLdDp4MXErduU?=
 =?us-ascii?Q?eRYF9UBC22vrc0UmtKmiXdgkGdJpnFO757QVAjMrP4wuHqeY1Az3Fqlw1dkJ?=
 =?us-ascii?Q?atVItkmylXS4owSOZiPGIGQs10ynAEQfOMcpwhPTJfaWCU8MxBgGDA+/bJWr?=
 =?us-ascii?Q?6g4xRlfAsOEpsph3BE5/H2/LMwTMqa2iCDpv67si2ZGf7lXMH2pSFfHGlv3j?=
 =?us-ascii?Q?Po7j21XfMEbPNN2yfqxY7aW2NyQKvYVQPPehHypHddZOsbuQRthb9E2Mm32A?=
 =?us-ascii?Q?qgs0ij8VI1wGNjNwQSu9mJOt4Fcpp8Pbcr+br1mGlr6aLWkh2uat1VTwbCY9?=
 =?us-ascii?Q?se4piJ6ia9kOXieWdn7pBQCWAHxV3Nm32cazplh2bmw0at3guExH3cDJEKLv?=
 =?us-ascii?Q?Pd0izBDwtNMwyxXLj5BWZIfXts15GUT8GaOs18+Wk6sAd4+d6NZuzQ48DsO+?=
 =?us-ascii?Q?aW3kd7XJ2eH80OgZJJ86VVpC03fjvua+ByxzgKnlGPIFjRX5Zht0rvDhfRBk?=
 =?us-ascii?Q?YHqx//WDRPHTNvBQ0UUv78v0IX9dw9xWq7jy+Jl2g0KMO2yr7SUMpXGq3FIe?=
 =?us-ascii?Q?/uYd1AWBDQluekNGfkrVG+XrUycR8A7JBrN8O1MPIFIXURXT6Wy6ZUCQ0BNx?=
 =?us-ascii?Q?9z2wLvtWKBXC8gqV3JARoAt0cDB9k2l1HmqboHG/tOG1dOk1WxlxAdMUSqD9?=
 =?us-ascii?Q?i06c767qItWS6ZJo7y9q4FoQnCemJU3xB6fHs266U6c5FWZWGy71J2f2vQ4h?=
 =?us-ascii?Q?AHw67YTlDq5zod7RbqXQaTJQYvZYazXCEWv2aPtKg5+bpJfuzKbYgvBB6Drz?=
 =?us-ascii?Q?huX1IuUNbzEjIzOMmg34GD+a3T5rOrVAxURvda+o1Cx1riMGAiyfa7xOG7V8?=
 =?us-ascii?Q?kgmsRDUfnCT+1Vfr1y9OyTTXdJtg2wAcR9EgX4o9/CJL1CkWixPpKUzCZJHu?=
 =?us-ascii?Q?LLu7UUI/74iovnlFP8bUEsyZtz944peXI/AYOAZPzsiujEMVYWXcUiZvTCsv?=
 =?us-ascii?Q?/LVaFZuh0UmC3HFa5aMgaJ5eWHqGASWWF09JwO5g60pmUJZRwQqljZW1KH5S?=
 =?us-ascii?Q?etHZu6Nl6rsfM9IfigXOSlTwsXVsHTK5UpidIjWL9D1ALWd5n4IHwk8wFwuT?=
 =?us-ascii?Q?Y9PYTqCbjrEPgU+V6zp0Y+9CuLYgLFMD46Oysr5hIqb7pffloDhDLBA6U1R/?=
 =?us-ascii?Q?+/5LpNcI4hhs3zYNoHLw8n0K6gY7Ed4oB0JUUtb1x7CH/DTrNdbVB1SlQedq?=
 =?us-ascii?Q?EZ0Z6E+JrLln86gsTXyKId4kFuI4GOsfxc5mMkvSzbIH2dxLUA+x6eQkFY27?=
 =?us-ascii?Q?h5uz+QNjHTomWHei6xAxpRfCOGQayP3K3lFTiVUTiEE5J97oMRFro15TzPKD?=
 =?us-ascii?Q?yI8iSBEqtlT3ciFt3qvNsv7xO+48ZMudd3E9EvmOgwWeK1RFrM8Sd0odTYGM?=
 =?us-ascii?Q?pGy1rc6Pd9ZM0qPq+PKoczpqV3yGONTmvg12Lm0JDVhJHBAT0G3iTMpIoWdO?=
 =?us-ascii?Q?LNxHflz/L/o2g1xa64JN2EEtIhzNJxFPOowWvIjTBBesFIC0zCFrHuZ0vWxf?=
 =?us-ascii?Q?YbFROJkvlc3STBwKy6p/eGodEoMXbtBkLaHyZF8jcsyca8O3c3HA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75956e5f-b4aa-4997-8b71-08df3056fe06
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 16:10:29.8543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NxITF4N+ecOtvP6xIsWB6lyXy2b9+q04Jrx34XgHvIhkGDa+ZNGoVYaDa00lCZlSrGf4QPsc2PyNNuOygGZsdaJKcfn06OiinAI5oVy2L0b18Js6uzbgGCoN40i5E3wO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10396

On Wed, Oct 21, 2026 at 03:11:29PM -0600, James Hilliard wrote:
> Descriptor allocations pass GFP_DMA32 to dma_pool_alloc(). The DMA API
> chooses the memory zone from the device address mask, rather than accepting
> zone-selection flags from the driver. These flags can also reach the pool
> metadata allocation and trigger a slab allocator warning, as observed on
> H616 when preparing the first UART receive-DMA chain.
>
> Set a 32-bit coherent DMA mask before creating the descriptor pool and
> remove GFP_DMA32 from its allocations. The driver does not encode the
> extra descriptor-address bits supported by some variants, so descriptor
> links must remain below 4 GiB. Keep the streaming mask unchanged for
> variants with wider source and destination addresses.

Spouse other dma address in src/dest in descriptor also limited to 32bit.

Do you means only descripor address have 32bit limiation, other have not
such limiation?

Frank
>
> Fixes: ec31c5c59492 ("dmaengine: sun6i: Add support for 34-bit physical addresses")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/dma/sun6i-dma.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index 7704b016aed8..0ef6ed1f936e 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -684,7 +684,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_memcpy(
>  	if (!txd)
>  		return NULL;
>
> -	v_lli = dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWAIT, &p_lli);
> +	v_lli = dma_pool_alloc(sdev->pool, GFP_NOWAIT, &p_lli);
>  	if (!v_lli) {
>  		dev_err(sdev->slave.dev, "Failed to alloc lli memory\n");
>  		goto err_txd_free;
> @@ -743,7 +743,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
>  		return NULL;
>
>  	for_each_sg(sgl, sg, sg_len, i) {
> -		v_lli = dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWAIT, &p_lli);
> +		v_lli = dma_pool_alloc(sdev->pool, GFP_NOWAIT, &p_lli);
>  		if (!v_lli)
>  			goto err_lli_free;
>
> @@ -826,7 +826,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
>  		return NULL;
>
>  	for (i = 0; i < periods; i++) {
> -		v_lli = dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWAIT, &p_lli);
> +		v_lli = dma_pool_alloc(sdev->pool, GFP_NOWAIT, &p_lli);
>  		if (!v_lli) {
>  			dev_err(sdev->slave.dev, "Failed to alloc lli memory\n");
>  			goto err_lli_free;
> @@ -1345,6 +1345,11 @@ static int sun6i_dma_probe(struct platform_device *pdev)
>  		return PTR_ERR(sdc->rstc);
>  	}
>
> +	/* This driver uses unextended 32-bit addresses for descriptor links. */
> +	ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
> +	if (ret)
> +		return ret;
> +
>  	sdc->pool = dmam_pool_create(dev_name(&pdev->dev), &pdev->dev,
>  				     sizeof(struct sun6i_dma_lli), 4, 0);
>  	if (!sdc->pool) {
>
> ---
> base-commit: 93f51579e7df248780214094418f205253383cc5
> change-id: 20261021-submit-sun6i-dma-descriptor-mask-v1-35bb381b932a
>
> Best regards,
> --
> James Hilliard <james.hilliard1@gmail.com>
>
