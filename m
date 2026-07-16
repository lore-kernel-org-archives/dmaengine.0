Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011051.outbound.protection.outlook.com [40.107.130.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A423BC696;
	Thu, 16 Jul 2026 21:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784235785; cv=fail; b=lPgttP2fcBwmhB/pKyaohUSdR5xpr8vqr5JJzMxy+N7NzEJvM0+vv+GNU4GbHqhZ6otiYB6qIOTYTcpVqD9zbtQ3UhUNKDb/Nbr28ggvjhLI3Sad9s6M3b1hae/cOytkfUSVqwXZ9ctJGDcbQcJKDAoXYAGL5JTbyNmbcE+UFZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784235785; c=relaxed/simple;
	bh=HH/w2yXw/lqda69xuPOVu/L5ZDwUM06S77ErmvqXZ9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ACnCpCuDVEpflVXXH4so4EFoD+AEwoKQcgXXpaZWmz9Z9BRg7PAXgauNYeGYELMaYnLRxlmLZdk1yYbU2Jic7WZQEOM9sdfSpsFtJakCA1JyR9BIqToG7ALVXjcb+drr5Vyw55BRFsngHkFwsXKZkHoL0YbRcztILmAgqhnvFK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=R4tdaN1P; arc=fail smtp.client-ip=40.107.130.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="R4tdaN1P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFuVMWWWsLVvC7/HRM/z85LJNkV5h8TWf82fdld0GI//liOAh5inlPvP5RoTVLIlIa82eUcS1m1r2ZbMTlWa+h/gR/H6TzU+wTLOt9IHfqSjJlfQ40T1xlFaSn7Rjhcz5yEkBcC9wGcgq/hT3yovmVoTnbOk66rXckozZAcL1DRDWSXUTu3kM2OeLMARRLIJHKemm1hEp+Glla+a2lG6i8jdH5t0uq7K+sj5rdqcFM+MR4Mt7VQDn4F8fNYQiEytCut1JqW1rZr/IjXbSbt+RAMrIyYi1afxJ/Qr/0NG8gaNc0WwyHHcJk7/K8zIyAB/PLWYr0/FztDniNvtd3csqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4FMspBbfw1iAJL7lfP4mPSGggvPkT6E5pcVT3VZUX8=;
 b=dHXAlTQJqxl99W9AIdt/ObwjdfFI9H6VBb2bpn6h76xE1eioVfEXEplNjs6x4eeeHCcVbstEbk/q1yHvgbhGscRVIVCvqQlu0CB7PprYk+3g6aNfv3nYKPVodXs+RsKpuU7GEY/zGTUnRI/PADN4hkuQ9DoEXUCUQSDwx9gngSeSTbZ2iwUtl9c7DkdrsnhmtD1CezusvUMGZ0HQ7YYqQ1/9rH/woRR0WM4gh35Cn9Xy/heejo7NODQ2HUAIDHsAMAZOqazG9GCuABizZ0vuGwfoC4OlUxiFYfx5/UorFae6Rm+2eBG/JBLA8Vt4ogmJPzm9kSYUD08+GaJT/wzpZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4FMspBbfw1iAJL7lfP4mPSGggvPkT6E5pcVT3VZUX8=;
 b=R4tdaN1P+gbULonot1Cc2hzWM3y3+vb4c8AcCErj09z9oX0ydspVf2/9JbxXeHufqzn2JMlTCCYcaMTPpxDWBq2HAiDe8oNnzpc5xL8YPVVKnBiTDSLr53S87A3Dl1Q/k/OlFcgCavisM8WNnA5Yxi4gZAX0YG8lfpEq33HHbRIxzNag5xw9FWJpotCCPGXylGRgsC22OS/ZlO+vVYoaBrtE/8WcjO2L1dmyS6qXPmGttfzX3yaPMuB209q6mIiXp7r0javCnRM3Vtacx4J3FpFna8OOP9XNylHXbhDRaOlwJkJSE+UIhcjjtN5B0brEhWOyt3KJ9jdfeFFfEK5fyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB9089.eurprd04.prod.outlook.com (2603:10a6:102:225::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 21:03:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 21:03:00 +0000
Date: Thu, 16 Jul 2026 16:02:54 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2 3/4] dma: fsl_raid: keep MMIO bases as void __iomem and
 cast at access
Message-ID: <allG_krfWa3w2lJ6@SMW015318>
References: <20260716202949.677290-1-rosenp@gmail.com>
 <20260716202949.677290-4-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716202949.677290-4-rosenp@gmail.com>
X-ClientProxiedBy: PH7P222CA0002.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB9089:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e70d7d4-3dfd-4f3f-1238-08dee37d9e9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|366016|23010399003|1800799024|6133799003|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	J6JeSUVOo4WshXRy4OPyY3G2kgSRDjCYkI3XNaPgEkbngaZeGK/JOR7aZUaH0GhJ3FtmqXgeEhnENnvGzz40ic5Sg9t5gmzy017FgnhZjidN54J8a+VJsUMoQ1M8F08omAvhRSsAxHPIeCgNepzXwCTTuuCgNZZE2nYWWSemQy1pFP5xzj2CmmSUL1pMtWcSqzOCIpIhqUx9GnuoWelXK316cs4zL3agZui/jrIu6XTxFKMMGs6XkBJXDacFly7vcc3acDms9tVHkwktwCmQwcG8jT4ngDeDMcjL3O61aS0FTXd+pLtw5NtJfp02e7ryuAoCwFZydBe2CIKqJ1zYAsaHMNJFrUydkK8BD1c9lBA1pPDz3TWRMVvfPbPldNE94cHwGflxhTYzrrIlq63lH9a5wuHB4Ed0aiZoPHtINt3mnHkc/NhxCC/lTbQf7mgFJK7rNsC3q1bgDZFzppEiMjSnLbA65l0vtS893jaJtUDaeag8gUVdfgyXqNfzIMS9FJ41LJEyj592s5r4U3N5+DvINxrhrZoXP5I2y2Af949Ap0tZMcxu30H7OxKZZ/Hjj3MeNgem1sCmG+vcuzlasKoGLr8PTI2S4JcqQbrgTjXNQSxxDV5Tc1mi8Pphm1p8sBs0rfa2VlrJaW3SkhOQ5dOrWx8f1UtBc2VIhLMQru0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(23010399003)(1800799024)(6133799003)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MT0OS318efWH2TdCEl/QiZVtcCOPd7oHwuZtxI+sWzMkne9O0wfMRM5VsBkW?=
 =?us-ascii?Q?2XRRJyYfwCeZe6oLdvc9KtyoRz7DdkYu/1v5c3fCn6U1+uP5txyjyL++PvXd?=
 =?us-ascii?Q?q0P4Q24mpsABoyNbJsm/j5oXMYa5g8AWBNGjvOGON2hQkEPwBcKkD/7ufSkK?=
 =?us-ascii?Q?lTXzJ1ksK/+en/Y4k4ov19x4MamjTmJh9Yl4AMxecasp1XGacrwGYET2F1vh?=
 =?us-ascii?Q?TT/53BmIhVPc154j7wm0JaDuyqfDFBvJXKfg8q+V31txnYyXppZcNwRGEyNu?=
 =?us-ascii?Q?zvOF9BiHCc5FTFNTt++0EkZ34ltmzqEYjKDH7FSt0GeHec/QtXSFe8Xq0qWk?=
 =?us-ascii?Q?JugAqECrczrbTKC9bOUhn1oJJ0bEwu4HX7V7qVC1G2nQvqvfsPQ4jrnp19VN?=
 =?us-ascii?Q?4hu4tP57aEC+cQpCuk4UOqE39969ijOAhkHieARoRkbEBK10PCyKPfxX1l+Z?=
 =?us-ascii?Q?+LyHk0GZwoRoriwUIwbp7qHsMuc6psQY/2TeC8wSiLqOhQxpdWenv8n9vqzT?=
 =?us-ascii?Q?cP7zluBwRlyLgTcNaUV/gvG2omazPKQvGNOsciIQwcIEa6RrS0PQS7LBXjvl?=
 =?us-ascii?Q?lXU5mW1WoVWG+Kf6p/zs/ZbaGaQ/hr8A5my0zo701niV871I4+43ajvNs1N4?=
 =?us-ascii?Q?IjKvW8QAK50af4Rx1epyeg0/BitmpgudTqRkuBWFt9cPqK1jnrV4nEA5FoEH?=
 =?us-ascii?Q?+4ArMbKbtjfmjt2E2+GHBTCsiL/UJdiuykp/tCqT0IM6zvsww9BsXQvZNbMX?=
 =?us-ascii?Q?yC1oVtir4hKEdtZq67j3S27MDQV+QE2q/863dhC9uVoVvwlNH3d19ZI5vg60?=
 =?us-ascii?Q?vpDnbZa24+A1+viwx6N2fZl++vuEBIACx4TzgezhxsVIh6LvZJlZI9BDnDbf?=
 =?us-ascii?Q?J6BDonFJ+UO1e3x06QImLOVgFKbZRXPBH3t66SUpGb4LBv13iOuN/qEJWm28?=
 =?us-ascii?Q?TKTImtRndNCQAH0Wn7kwiviMzYEek4FKB7cda+fZjtsofNE13x0juMc26SmM?=
 =?us-ascii?Q?nnprIhSOik/ScxGRJsmxD7uif3FGpvQX8+nLqoWur5w60JTY23iZVXlBJtwH?=
 =?us-ascii?Q?LhjE60v0C+Sy1q2yZ5GHywQqIAq389Enoidq/0uxKFSfa39QCfTaSrNJ35Tg?=
 =?us-ascii?Q?pD5jwp+MW+yXHrcRKfO41ppMf7MkLZoYM/7YvjlAAt8PZ5E6al7twvOSeuh+?=
 =?us-ascii?Q?229qXz1O3s3CILcbQSTAiFvbkPSkVer6TFdiAc0UKsZA4d7G5szUaUXlk31I?=
 =?us-ascii?Q?fQ9XmwnD2z+cagC83PVBubbAw8fzQ7TNFtnu/id8Y8/eZWH1G53LQMuy8FXS?=
 =?us-ascii?Q?uwYhrCOQ3DDfmNuGyHH2tewQlwK9Epg1b9W2RJJyf+v5TQjUOiO7bHc0LUSF?=
 =?us-ascii?Q?fDEYYMyhXjr1WCQImMvqEc/u9ymT+gSS+xek90qToSklHp3KQf9mo7lq3KsP?=
 =?us-ascii?Q?1KDX61ZPnOdeOpqn6y2ltRk8gHs45p9THP3SxUPppoUcwlpLXaKf3umNkh3a?=
 =?us-ascii?Q?K0Ju/GxVHCjj/u/z9L9VvGAj9pdIYcD3x5RcjVFZNWCuda0Z2HfkpJ94GLgJ?=
 =?us-ascii?Q?mLtj9EISSEL94U8/4PY7FTj6xEhxgjVt920O/ZHaZ0tSvXBHkm2ZsR6deiGE?=
 =?us-ascii?Q?SiLdz9mMvyxUc5PjZ/L/WmPbmrefKoHTkpaBy7DYzw/U2pd9vSRACfVgLIu0?=
 =?us-ascii?Q?L2ob72GBQb+UA7tfU9/L6zh2AzUvFHcQ9sTdliI7EAHNlF0acJfg3P8L5uDh?=
 =?us-ascii?Q?jE/5kRfnfY2mErI0j8GjhKUuJohmoG8K6qHCoUJ470EadsjROXIP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e70d7d4-3dfd-4f3f-1238-08dee37d9e9d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 21:03:00.7832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /rVHRri5p2xLoYKAefgdLk+66tDXd+i41I29SXWO8y3k5D4SlTctaPYPH56zoYOQFyBRToNqzkLuZzqSXKaoYPxw9iRVLzwtDwUcVfYqUJf3Z5p8RY8Ni+kGw1uwsstc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9089

On Thu, Jul 16, 2026 at 01:29:48PM -0700, Rosen Penev wrote:
> The fsl_re_ctrl and fsl_re_chan_cfg structures describe memory-mapped
> RAID Engine registers accessed only via ioread32be()/iowrite32be(), yet
> the pointers to them (re_regs in struct fsl_re_drv_private, and jrregs
> in struct fsl_re_chan) were not __iomem-qualified, so sparse emitted
> "different address spaces" warnings for every register access.
>
> Store both MMIO bases as a plain void __iomem * and derive jrregs with
> void __iomem * arithmetic from re_regs, rather than carrying typed
                                 ^ base

> register struct pointers through the driver. Each function that touches
> the registers introduces a local typed pointer (struct fsl_re_ctrl
> __iomem *ctrl) and uses ->field, which is the idiomatic kernel pattern
>  and keeps the registers' __iomem qualification intact.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: https://lore.kernel.org/oe-kbuild-all/202008111749.yy85rFMD%25lkp@intel.com/
> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/fsl_raid.c | 19 ++++++++++---------
>  drivers/dma/fsl_raid.h |  4 ++--
>  2 files changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 888f55b672a5..524f83faf3da 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -657,8 +657,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
>  		goto err_free;
>  	}
>
> -	chan->jrregs = (struct fsl_re_chan_cfg *)((u8 *)re_priv->re_regs +
> -			off + ptr);
> +	chan->jrregs = re_priv->base + off + ptr;
>
>  	/* read irq property from dts */
>  	chan->irq = irq_of_parse_and_map(np, 0);
> @@ -746,6 +745,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
>  /* Probe function for RAID Engine */
>  static int fsl_re_probe(struct platform_device *ofdev)
>  {
> +	struct fsl_re_ctrl __iomem *re_regs;
>  	struct fsl_re_drv_private *re_priv;
>  	struct device_node *child;
>  	u32 off;
> @@ -764,20 +764,21 @@ static int fsl_re_probe(struct platform_device *ofdev)
>  		return -ENODEV;
>
>  	/* IOMAP the entire RAID Engine region */
> -	re_priv->re_regs = devm_ioremap(dev, res->start, resource_size(res));
> -	if (!re_priv->re_regs)
> +	re_regs = devm_ioremap(dev, res->start, resource_size(res));
> +	if (!re_regs)
>  		return -EBUSY;
> +	re_priv->base = re_regs;
>
>  	/* Program the RE mode */
> -	out_be32(&re_priv->re_regs->global_config, FSL_RE_NON_DPAA_MODE);
> +	out_be32(&re_regs->global_config, FSL_RE_NON_DPAA_MODE);
>
>  	/* Program Galois Field polynomial */
> -	out_be32(&re_priv->re_regs->galois_field_config, FSL_RE_GFM_POLY);
> +	out_be32(&re_regs->galois_field_config, FSL_RE_GFM_POLY);
>
>  	dev_info(dev, "version %x, mode %x, gfp %x\n",
> -		 in_be32(&re_priv->re_regs->re_version_id),
> -		 in_be32(&re_priv->re_regs->global_config),
> -		 in_be32(&re_priv->re_regs->galois_field_config));
> +		 in_be32(&re_regs->re_version_id),
> +		 in_be32(&re_regs->global_config),
> +		 in_be32(&re_regs->galois_field_config));
>
>  	dma_dev = &re_priv->dma_dev;
>  	dma_dev->dev = dev;
> diff --git a/drivers/dma/fsl_raid.h b/drivers/dma/fsl_raid.h
> index 69d743c04973..adbfede330a7 100644
> --- a/drivers/dma/fsl_raid.h
> +++ b/drivers/dma/fsl_raid.h
> @@ -256,7 +256,7 @@ struct fsl_re_hw_desc {
>  struct fsl_re_drv_private {
>  	u8 total_chans;
>  	struct dma_device dma_dev;
> -	struct fsl_re_ctrl *re_regs;
> +	void __iomem *base;
>  	struct fsl_re_chan *re_jrs[FSL_RE_MAX_CHANS];
>  	struct dma_pool *cf_desc_pool;
>  	struct dma_pool *hw_desc_pool;
> @@ -273,7 +273,7 @@ struct fsl_re_chan {
>  	struct device *dev;
>  	struct fsl_re_drv_private *re_dev;
>  	struct dma_chan chan;
> -	struct fsl_re_chan_cfg *jrregs;
> +	struct fsl_re_chan_cfg __iomem *jrregs;
>  	int irq;
>  	struct tasklet_struct irqtask;
>  	u32 alloc_count;
> --
> 2.55.0
>
