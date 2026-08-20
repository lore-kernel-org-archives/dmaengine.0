Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012051.outbound.protection.outlook.com [52.101.66.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE8247A892;
	Thu, 20 Aug 2026 15:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787240446; cv=fail; b=DPh3a5o6qLoJchlWmIkT+/PwAhE5bSfNF0KPAEx6SH4OR7COqxqQ4jULBBt7IY/ojxSax0hs4reuWoxxEoJ30fjf1zRdDqQWFOUxlhIGr1wj3vgzMy+gvrIai2kRWM8BzcOsc6p9iRh/aT98kl4thmC5ctVbIV1INI9MCgu3PM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787240446; c=relaxed/simple;
	bh=JfZjCsHmrlfLaLY92QQpt5tUyS9wdpORKewcciSZa/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kUx3q/S6xTqRbb0zku6AnbYqTkK17G90C9Ou1uhqwc8Sbj5AwNb5ZtCTgYz4iuCkrXxkSolMF8lslw/rLl7qMXpb6FnHrmLkTx2QuNR8XfOpay5npRGW2HsZ8x8G9eqj99hnIXTzXDbo//zP8hXYDyGwrp3ebB6SAPIJfrDQyHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lZOelGi/; arc=fail smtp.client-ip=52.101.66.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lZOelGi/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KO5sAbRVCMZqvZ5GgBJullkodnslrqsNxNtEMoLGKkS/QBK8JSg85sQzT7+QXkKQ/rkxkqKvSWgIyB0Hv3ftr88fi51PHNB8T/6tRMykozrWPDt/Qe8sMGG32KKKjRYmwiBP9aGEGIUawbfHihqUyapqRUGnY5cc4nkNYBMSdqjLwxpWMNePCNE17RGiEOGGYSY0ymwY2DvRF63kl//8SX0s98+Rx9rYpLRHb5FVOf7mvhCods2HnfBDnUedxMcATy1Y5mvhXm6Jey7Gy3UF4VfSL33QKSwecVuPsbErQI1YHl8UmDno9S63r/HwgyD9WUWDLUJ1MjBcBHMQxEqV2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lev3fMH7715IRnJOJ4pMpiqWMm/Rk4Yf+lT97f/VUB0=;
 b=wgdG8B9aHwpQ9rEaYL3lAbrlMkioSfTpSzQ6e1urxvi0MS0QTZV1ccNCMPwdi+GtOZAVy0HXELF0uvOjLBwsxceszcnXRatN3HcKbNLtCNP3FL38eHW4j2Gt/xErUepQvtc87ysubWRx9ljz+t4mQuVseWnqvq/D3aRCqXi6Zt8SOhQYH3U38RSuzFxFmH5aP/68QChFthP550nvkMcfnt2jVgcSpBPXCD6qVc8m3rkbXc+sQtBtyNTLe7g0k1ABYtdOJiJYAgknwT9HBcw0fvAJLVPdCxw1fxCs35hz+Qcd9N8h8qi5C1fkRcjN8cXJpOTbhGOLPf7Yyk1DUjhzyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lev3fMH7715IRnJOJ4pMpiqWMm/Rk4Yf+lT97f/VUB0=;
 b=lZOelGi/y9VoI8LoiQ3ezuPdY4af//ha8XVKKzIneCjA8u+sM1dPrjgGVC+0NHWTG0JAM1U+f0GOEau3Yj0PI08dRsEQQysR+qYUQInfoAQE206yIjRzH+kul1hzmlKjdlfL/eQVm9h6NaErcAjoPog+CKdcyuePSO8K+Zg3ozECbjyRhRW5e6CyutsOL52KsfjC2Pwz1lO34CpIjgo0oHrpsiEIICFrS0JgJ373H6SOCrN1We+/4gXlm9HtZlRM5Iz4LKEiRPHgDYL84LcFWZXJui7TyNJNqPCJqu+EhvY1fcuQDzl576/PZQwMPTTLjMHXRM++9+my+ZSj5arQrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB10820.eurprd04.prod.outlook.com (2603:10a6:102:487::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 15:40:36 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 15:40:36 +0000
Date: Thu, 20 Aug 2026 10:40:28 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: fsl_raid: fix sparse warnings
Message-ID: <aocf7A1pjpnGAlq4@SMW015318>
References: <20260820002816.17382-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820002816.17382-1-rosenp@gmail.com>
X-ClientProxiedBy: PH8PR07CA0025.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB10820:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e48901c-ca71-49b5-0deb-08defed160ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|23010399003|6133799003|3023799007|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8DiT440FG7/fuGd2MDlDOIoFgEjWRl8U9iY3XQGWQFFFbLpUxzkis2L8rT9LFYva7fZ5cgz0+FJwU4QBQ8CrCdFolW18ItjGwT1aOFpdJqT9yM+V8+oPx7K2ThYQ1D2s86yTnMzCSG6iCNOg/rBdnRVdbisztD6XuKAfuQa2maL492m+m8JaSDutGDGvv+p4CtNZaeNTU1RF5hnjY53Gsf+R4pzMBdflNZuXNKsdqKbCTm3UD5MEJGxtea5OXCR3IgqKUTpznxcjfa8jTbC+bz97pQdkSA8Dx/Nw7b/i/hmg/pPsjWMWHmCL6Le78Y0J9bvcjIDXa08uL0N/LT0UGn+7XJSPjb27t/yafVV4gBoATz1+guNBPLo96vaK18Iu0WhaaFm9s5aI6n2uqHeZpf9jH4N6Fho90q/CItj/QFdaRyJTpKstHQAgy8k9Oh/3qBjzsh6IKp71piXxleCaopCvi8hq0qNTgefcHpBpc/B7nlEXIsjJ9gRrbkL1UEpPK/3JKCL3iFKezoWg/ImWNQvG8v+Ea/sWb4Lsoc2tcft5UmoB8rPSX4HG4QgCdnTTusNOMdjtwI2qJ29Ydgb5Ro4+K3QGy3k6Of3YjVyrYCiZ1SGBYWNaClSRUKOvQcbn2J78oFKnKuJ9gQ3Ru9v8dsEQ/1MnHhqhEjLOt9SOsRU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(23010399003)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a72mTWMPEiNCi5vJckzii9GD9xT+HswUhdSGZG2wPe0Nhk1eUJ8XatO7l4KQ?=
 =?us-ascii?Q?Vc89jlG7h9JL15/as2BCWHu8+RtxmY7NHj3cZLUEWHyslU1bt6F8293xXAY+?=
 =?us-ascii?Q?vzYmmvglAHlD9VPTVqjF0Aui0dBDIqeLzayVD7KB1nomCEF+GOK8flHUodnu?=
 =?us-ascii?Q?kKTJVwNOM+Z2GbyLaYv9KqgpTx8ap8rxT7kXWO2NeIhuVxTLqIAqrHPiUnOD?=
 =?us-ascii?Q?ml2iwN4YKUDIGf1oS9FI9OPGD0opLan1lsNafttsV6b51wgyq6iDnx+tcqcw?=
 =?us-ascii?Q?OU1kY/Prz/V+ZuorUiDETp5/hVdrvV4/KZlSlDuLNoAS6PgelmNsAtlGjnG6?=
 =?us-ascii?Q?kRgP/9EhjmVCOh/NuSOIK11JsIm4bfOdrjB5Tsl9An2eDtSvIJpyLbKxHJP/?=
 =?us-ascii?Q?wIayYxyrIelUg2fnPMV3FrciT1S/ReXAS7NYgVU/4t0lBkNLqHts4IjvImyO?=
 =?us-ascii?Q?Otx7GHq31j+hRq4p5nTTWWFRcXdaraePC6hnKWhSOA5Q75UQ5vDYLICnDRX8?=
 =?us-ascii?Q?N2WUEE7IWhFCg8oT9X0yt2M9vF/NKs7JgOV/EOmhHHYRnZD0btEO2toGIgXG?=
 =?us-ascii?Q?Z1XwzwhFkndguW/NxRbT9gVSjul5twkxmwlQgrA4Qj/gJDjIAt72fekKj+1P?=
 =?us-ascii?Q?a3ZEMTluo6APOeGiFGfvh389/76LX4YLRegbNHCJzvifNgpxnx6AwF2wBu6X?=
 =?us-ascii?Q?zAMXC7l407AhicWsGZ/GTtBxMDMPpfcWvfuXrOP8MDMKstTaEF6fhaXPJbfG?=
 =?us-ascii?Q?fdGVJTIl4JMg4BynR2VoWrgTEFQkfE5+FczqWBccDD9Inc2Ch7ACXHU3MknG?=
 =?us-ascii?Q?yNwFsv3jE22NdHpUxnICX3ZCP2hUChPO4g9uw5FMa6gXZeUgfnck4Ao6SCl5?=
 =?us-ascii?Q?DR5CSHALgaKtd4/KPAGIMtsxW3qtsO2uXt/lEtU53c7day7FH7UmQuObfOg5?=
 =?us-ascii?Q?63zFCM6w+Ik5SdYsDRalHFMZG4OgFcnJK70oKt2XRDTC2ivSwwLeVAV6L8e/?=
 =?us-ascii?Q?Mq2My0WOJSIl89k0AEFEZ9l/PZUumNGoogPt5jq2vo3aWdjoLWOg71Tf7eCS?=
 =?us-ascii?Q?NgtsfB64K7x7UPxvV+GiXSDEoDOikEzeU/TEs6KEPthJbUQFlb5CR9n7+FBi?=
 =?us-ascii?Q?V0oGcsC5IImPYwOmmcpgixJO+Y6vlvrVZg6O31e0DdbpLZBPQiyaBFpRPRwe?=
 =?us-ascii?Q?Ov4JvsLpuZf28M4MzVWqxVIWTz90zl6rSccaJnoMNrAT/vNUBImqEmMR+uWG?=
 =?us-ascii?Q?8W5MLRoDhpLwZbeacb8X1tgSIqU6D2H571+aaH5F1a0njqi19rIpxAzwljsB?=
 =?us-ascii?Q?KNahGvslD8YgaS9ya0hAO1PqLjX5IC0L7w98jZdPn9n+n0QP7VZTKhmAzmHE?=
 =?us-ascii?Q?j34ZTSLhdYZBE8j/e+3VC1Z6Te1aAYKyLGu1aJrxpHEZrSwv0bTmeZk+sbwC?=
 =?us-ascii?Q?taHEv6tkB1PYspl3H5YmhlJnxbRi6UYidYQxo9MG+gXPUD9+dPpuW4XzhER+?=
 =?us-ascii?Q?kkLJrCEZu/kyR/4CcNE1HI/xswJjLvWH+To8pkn2eOSNC/i/51p0hlejI5M7?=
 =?us-ascii?Q?OtDLT4OvH3XvkYaK6tbVGIbSQBN09i5ZWiLN8hbeeBxaooPn9VlBYXgJJ8+8?=
 =?us-ascii?Q?DQctDrpL/6laGrHJoXdgH6ze7cC3DGmDjOm1dV1FPfbupeoxzdxG//rEmbBV?=
 =?us-ascii?Q?w6hZEzf89ckyTctz/qhOV2wIccBa0Q2w8zNnaiLvZ47573uYh22ichJ22i3f?=
 =?us-ascii?Q?2Lf9OSH5JVO6XhnZl9Vfis3s6UZECtbMY4Vs3kQobK06tF0ckOuo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e48901c-ca71-49b5-0deb-08defed160ba
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 15:40:36.0503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EMyUr+meCHl3F5+Lr3F03rMhZ6C943YhdiXivRIzGOkO/5ubErA4V1VFAMFytzDaGRAK20O9J2g7sqgvoyWvq24fDF5raG2/rRqd1wrUKMD0+c38b2LbDeENXp4fFMD1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10820

On Wed, Aug 19, 2026 at 05:28:16PM -0700, Rosen Penev wrote:
> The register maps in fsl_raid.h annotate every field as __be32, but
> they are accessed only through ioread32be()/iowrite32be(), which
> already perform the byte swap and take plain u32 __iomem pointers.
> The __be32 annotation therefore makes sparse reject each access:
>
>   drivers/dma/fsl_raid.c:116:17: sparse: incorrect type in argument 1
>       (different base types) ... got restricted __be32 [noderef] __iomem *
>
> Drop __be32 from struct fsl_re_ctrl and struct fsl_re_chan_cfg; the
> descriptor/CDB structures written via cpu_to_be32() keep their
> annotations.
>
> Also fix the remaining sparse warnings in fsl_raid.c:
>
>   - compare the desc pointer with !desc instead of desc <= 0 in the
>     three prep functions,
>   - byte swap cdb32 with cpu_to_be32() when programming the XOR, PQ
>     and MOVE command descriptor blocks; the plain u32 assignment is
>     broken on little-endian hosts.
>
> No warnings remain.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202608200637.ro1CqMxi-lkp@intel.com/
> Fixes: 68b7fbc23529 ("dma: fsl_raid: keep MMIO bases as void __iomem and cast at access")
> Assisted-by: opencode:deepseek-v4-flash-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/fsl_raid.c | 12 +++++-----
>  drivers/dma/fsl_raid.h | 54 +++++++++++++++++++++---------------------
>  2 files changed, 33 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index a35ddc1297ce..524a7329c3c4 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -350,7 +350,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_genq(
>  	}
>
>  	desc = fsl_re_chan_alloc_desc(re_chan, flags);
> -	if (desc <= 0)
> +	if (!desc)
>  		return NULL;
>
>  	if (scf && (flags & DMA_PREP_CONTINUE)) {
> @@ -365,7 +365,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_genq(
>  	cdb |= FSL_RE_INTR_ON_ERROR << FSL_RE_CDB_ERROR_SHIFT;
>  	cdb |= FSL_RE_DATA_DEP << FSL_RE_CDB_DEPEND_SHIFT;
>  	xor = desc->cdb_addr;
> -	xor->cdb32 = cdb;
> +	xor->cdb32 = cpu_to_be32(cdb);
>
>  	if (scf) {
>  		/* compute q = src0*coef0^src1*coef1^..., * is GF(8) mult */
> @@ -474,7 +474,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_pq(
>  		src_cnt += 3;
>
>  	desc = fsl_re_chan_alloc_desc(re_chan, flags);
> -	if (desc <= 0)
> +	if (!desc)
>  		return NULL;
>
>  	/* Filling GenQQ CDB */
> @@ -485,7 +485,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_pq(
>  	cdb |= FSL_RE_DATA_DEP << FSL_RE_CDB_DEPEND_SHIFT;
>
>  	pq = desc->cdb_addr;
> -	pq->cdb32 = cdb;
> +	pq->cdb32 = cpu_to_be32(cdb);
>
>  	p = pq->gfm_q1;
>  	/* Init gfm_q1[] */
> @@ -558,7 +558,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_memcpy(
>  	}
>
>  	desc = fsl_re_chan_alloc_desc(re_chan, flags);
> -	if (desc <= 0)
> +	if (!desc)
>  		return NULL;
>
>  	/* Filling move CDB */
> @@ -568,7 +568,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_memcpy(
>  	cdb |= FSL_RE_DATA_DEP << FSL_RE_CDB_DEPEND_SHIFT;
>
>  	move = desc->cdb_addr;
> -	move->cdb32 = cdb;
> +	move->cdb32 = cpu_to_be32(cdb);
>
>  	/* Filling frame 0 of CFD with move CDB */
>  	cf = desc->cf_addr;
> diff --git a/drivers/dma/fsl_raid.h b/drivers/dma/fsl_raid.h
> index 748047996bbc..1b6f6b82c7d3 100644
> --- a/drivers/dma/fsl_raid.h
> +++ b/drivers/dma/fsl_raid.h
> @@ -109,59 +109,59 @@
>
>  struct fsl_re_ctrl {
>  	/* General Configuration Registers */
> -	__be32 global_config;	/* Global Configuration Register */
> +	u32 global_config;	/* Global Configuration Register */
>  	u8     rsvd1[4];
> -	__be32 galois_field_config; /* Galois Field Configuration Register */
> +	u32 galois_field_config; /* Galois Field Configuration Register */
>  	u8     rsvd2[4];
> -	__be32 jq_wrr_config;   /* WRR Configuration register */
> +	u32 jq_wrr_config;	/* WRR Configuration register */
>  	u8     rsvd3[4];
> -	__be32 crc_config;	/* CRC Configuration register */
> +	u32 crc_config;		/* CRC Configuration register */
>  	u8     rsvd4[228];
> -	__be32 system_reset;	/* System Reset Register */
> +	u32 system_reset;	/* System Reset Register */
>  	u8     rsvd5[252];
> -	__be32 global_status;	/* Global Status Register */
> +	u32 global_status;	/* Global Status Register */
>  	u8     rsvd6[832];
> -	__be32 re_liodn_base;	/* LIODN Base Register */
> +	u32 re_liodn_base;	/* LIODN Base Register */
>  	u8     rsvd7[1712];
> -	__be32 re_version_id;	/* Version ID register of RE */
> -	__be32 re_version_id_2; /* Version ID 2 register of RE */
> +	u32 re_version_id;	/* Version ID register of RE */
> +	u32 re_version_id_2;	/* Version ID 2 register of RE */
>  	u8     rsvd8[512];
> -	__be32 host_config;	/* Host I/F Configuration Register */
> +	u32 host_config;	/* Host I/F Configuration Register */
>  };
>
>  struct fsl_re_chan_cfg {
>  	/* Registers for JR interface */
> -	__be32 jr_config_0;	/* Job Queue Configuration 0 Register */
> -	__be32 jr_config_1;	/* Job Queue Configuration 1 Register */
> -	__be32 jr_interrupt_status; /* Job Queue Interrupt Status Register */
> +	u32 jr_config_0;	/* Job Queue Configuration 0 Register */
> +	u32 jr_config_1;	/* Job Queue Configuration 1 Register */
> +	u32 jr_interrupt_status; /* Job Queue Interrupt Status Register */
>  	u8     rsvd1[4];
> -	__be32 jr_command;	/* Job Queue Command Register */
> +	u32 jr_command;		/* Job Queue Command Register */
>  	u8     rsvd2[4];
> -	__be32 jr_status;	/* Job Queue Status Register */
> +	u32 jr_status;		/* Job Queue Status Register */
>  	u8     rsvd3[228];
>
>  	/* Input Ring */
> -	__be32 inbring_base_h;	/* Inbound Ring Base Address Register - High */
> -	__be32 inbring_base_l;	/* Inbound Ring Base Address Register - Low */
> -	__be32 inbring_size;	/* Inbound Ring Size Register */
> +	u32 inbring_base_h;	/* Inbound Ring Base Address Register - High */
> +	u32 inbring_base_l;	/* Inbound Ring Base Address Register - Low */
> +	u32 inbring_size;	/* Inbound Ring Size Register */
>  	u8     rsvd4[4];
> -	__be32 inbring_slot_avail; /* Inbound Ring Slot Available Register */
> +	u32 inbring_slot_avail; /* Inbound Ring Slot Available Register */
>  	u8     rsvd5[4];
> -	__be32 inbring_add_job;	/* Inbound Ring Add Job Register */
> +	u32 inbring_add_job;	/* Inbound Ring Add Job Register */
>  	u8     rsvd6[4];
> -	__be32 inbring_cnsmr_indx; /* Inbound Ring Consumer Index Register */
> +	u32 inbring_cnsmr_indx; /* Inbound Ring Consumer Index Register */
>  	u8     rsvd7[220];
>
>  	/* Output Ring */
> -	__be32 oubring_base_h;	/* Outbound Ring Base Address Register - High */
> -	__be32 oubring_base_l;	/* Outbound Ring Base Address Register - Low */
> -	__be32 oubring_size;	/* Outbound Ring Size Register */
> +	u32 oubring_base_h;	/* Outbound Ring Base Address Register - High */
> +	u32 oubring_base_l;	/* Outbound Ring Base Address Register - Low */
> +	u32 oubring_size;	/* Outbound Ring Size Register */
>  	u8     rsvd8[4];
> -	__be32 oubring_job_rmvd; /* Outbound Ring Job Removed Register */
> +	u32 oubring_job_rmvd;	/* Outbound Ring Job Removed Register */
>  	u8     rsvd9[4];
> -	__be32 oubring_slot_full; /* Outbound Ring Slot Full Register */
> +	u32 oubring_slot_full;	/* Outbound Ring Slot Full Register */
>  	u8     rsvd10[4];
> -	__be32 oubring_prdcr_indx; /* Outbound Ring Producer Index */
> +	u32 oubring_prdcr_indx;	/* Outbound Ring Producer Index */
>  };
>
>  /*
> --
> 2.55.0
>
