Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013051.outbound.protection.outlook.com [52.101.83.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EB4431A38;
	Thu, 16 Jul 2026 16:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784220841; cv=fail; b=h19DCuL53j1af0u5jbNukbD0AWurerT9hPrLdunrySQiiqeJGXi8mo5bIhaZ51VOHXZNpCgUTZaAU8cDztO9L3l8lrDM3NDB+nXqqBA+q/BkD3WsVJyp99Fjt2avclsGZKGxYOsiiZ39LNYUYUFLGjDqxAY+TAMPHgWt1X2qcWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784220841; c=relaxed/simple;
	bh=CShPFd7FcWGGlRkzk/B+xSkp6bRXGYXR6q8WbWxy6OE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=s5A60tuMoCEyxY/GNc8M6s6YcCsZzl9Goj2wRHpOTSSmKLH13Z7zRLQSls4SVazT8AGXq3bodPCq6R8Nrm6O14/tWDgIwT6ZjUtGaPzXPrcy1GwtV3X84gbRdxu2do604AjwBe41pQpX7bXWLCZrHIRaVqPQkYylqzFaAiajgM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=w0iOdIZO; arc=fail smtp.client-ip=52.101.83.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="w0iOdIZO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJ+K8YqQNKbn2V2V8rz8xsTC4ydxd8zH/go68ttiFX+qmpA5oggs5P5N45h7xCIhIPpkCg9qMbvl8JshpQshveXo5nQanVnu7uWFyIi9nidhcDiqsp+pQToo5TPCcUqmQv9hfqYb2Ep/vfVRIONnDM9LOSjCsuASTJx3j0HFz/pLECw+Edb/wBNPNzA9BaWzrN85PcZkDt0C0rQl8a4rYu/j/+WPbF5lA0athF17vSJnLcxmp5t6Hb+zFJL/ckID7eVNIucdOfas0xzoVlSirqKqZUwfy3RYWfI8spnT3NrWz8dL1nOgv3TelWXYJPfGx3t+jcDSZT7qEaV3rwp/IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLQH2H0Krei9+7RuIdfX2QT/+g2DvLDJ2JySdTceZNI=;
 b=ZdPcyXIH8/eRsDmROjbDhnsLYpqfMwf/gInRYguM8ImKxIFiJWZAS1PLyynevO3alsp2TfvqZGsqw3ZC7Aj+yXyld2Z5GiEoWwBRZ5+PorkWpQFGa08QeFSMP0GQvNPqdEu2ZxicuRKRjruEukR2E+Ll+jEJ2c/jCmHclm+QG8qDeKYvteJ+Oa3aV56gvO9LI4TWFPy52OeOlLka5ZEHfgL+1p1F0R3BeQARbH6OtJOK1AXWO4m5e/aPDsLEb7qo/IRXfu/nXtaXykFGjxu1NwNJ/rbzE4B6D+dSPmuu/qzS+T1prVhXKtyAUvlZCvIMSbbDdqXkqdTc0MX7tYMQwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLQH2H0Krei9+7RuIdfX2QT/+g2DvLDJ2JySdTceZNI=;
 b=w0iOdIZObjxAsE2A25zkEX33UBPnodgg2GhbbpkvqKeQPJ+SF5C8zuoS3cc8OV9V+8sxzkyxUjs8cQ6OBVHBpZp2v2ys09IZjMt7g9jVjd1r7eewTYq2X/a8MWm2dYXjelE3juWxusoTwnZc5xU/u4m0+c5cXclm5IW72vuLKqbV0DoFCsD9JPOs+sxgsInt2apm1zhQHlQdVh0j3+2F7qA5UkRp1+q1nhcVUQhRDdFoyBIC+ydBPz3X0020TS01DYea9dFuRfNbyKgLulZbVZqsCPa/AHSwiiwl2gUqj8Yzp5ZDgucZVSgsRdGaRIs1XXiUoL3YyhMSN2Y3z1HDuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8846.eurprd04.prod.outlook.com (2603:10a6:102:20d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 16:53:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 16:53:54 +0000
Date: Thu, 16 Jul 2026 12:53:47 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] dma: fsl_raid: use devm_platform_ioremap_resource
Message-ID: <alkMm6omqT9XPMWd@lizhi-Precision-Tower-5810>
References: <20260714233855.870797-1-rosenp@gmail.com>
 <20260714233855.870797-4-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714233855.870797-4-rosenp@gmail.com>
X-ClientProxiedBy: SA9P223CA0002.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8846:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f54240b-0c86-41a5-af24-08dee35ad1cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|19092799006|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wB2uuRX2pemdHk0U9t9N9fapU8BAc7qW9VD2dbVatKjbOP79kK0szJxb2cpEUP5DPJQRm9OnQWAN9lgFh41OFoKeaDhbas/nr7Wh82t3UBdL18nQcfguJT5qmCKQbkrTyvNWg/0W9iP/l2y8GCNSbxXNSdLLa7uT77oAJRUukO0S3DNSARHr066bbd1UmfPLq0d1sJfKst6MWK75MRKoiZbY1MBzvG/bu/UFvuHcxBIMFZZ174SrwnmTx1c5pe3w7mzpUlIeq7sDnmojAfLwPVO+EofBl8EVVkKMd5n0ZTWAKplpinCoyFtccUIaczXPj13/+/vybk+YBlc2exonxdU+9yKK73R/l8Nwfx6Hj2g8R0u47+wi0dkLPWmszaBEDiYhbzzynnsFqrdY7gPcLqnBzGAKkx7wgG/jacGI34e+fiWN+X1scAjp9nRFoMfjqBHG+U+uevFNyNhTlA+7U44jr9xTwlx5GZLlViVdBIJGqCsZSXleSrFwSjeTtKBSAhv5jnvL84R8Gn5fzl0ahnCzeQByAw+S37QQNcxKcNe2JhQOR9MJjYtgG3+2NzQX2SEsbQOuxCuaUYRMnhcmjIdNZvTr/1NOsSqjXDjjBTrBehgECTWNsSy/m1vjSZzO73SrgUlj+oxaGzagFpCyZBPQuzY61+GEacIIx0NlB4s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(19092799006)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?50tjp1CELh7dV8wt1meV3Sh6Y21an+u2cgPHAHPm9aImDRptlD5Nf9hbMXRM?=
 =?us-ascii?Q?xxoA84tyOzQlvFsmRckjG+McaG224Rpsvsk7jf/qbiFmqZoOFoKiGGaoD5o6?=
 =?us-ascii?Q?4veX7Kx4a/vzYRYBMV7HtWUBhe6L4+f7H6MW+lR/kPN21+EVEqz0Juj0KuVB?=
 =?us-ascii?Q?UkT51EWPt60FvrHxEryo9/uf4EHtebsOmfu4+7LGBCOuk3WtibhB75Lzeoh1?=
 =?us-ascii?Q?A9kwlx9cSLTmCzuVyL02AggkzCoXEpEdNeM5vaDpHCcmKMghmuf9CamQg0ZX?=
 =?us-ascii?Q?vAAC0KDggS8eLDbmJ9VAWEyhaOVjLm+eoHkFA2MQqt0V/Pn0xMeZMg2YUSWI?=
 =?us-ascii?Q?jkwkJcDLLSI5kmqyQM/BrYsJVWZUh8rhRYdSlk8TPc55w/6GWCt5kJPaPC9J?=
 =?us-ascii?Q?lGk4vholp1BTM4kCPnPs0NjGx9y8FXnWa27G1A61AuS53sB72QM4kyvpWW0s?=
 =?us-ascii?Q?/N8xd1TzwtvOJagDE4LNjSx6Grw2+VsOBUUYjFDYNWRbpBLY81onl5s5XFmM?=
 =?us-ascii?Q?+jwEMmSiEmwMeYQ4cAQc5q6zWahzjeNAePca9wUgCslWs29jeLUOHWbrihlQ?=
 =?us-ascii?Q?lFoYDZ57iTX2/LKFSxxcCygwCQrw2u0eR4dvDy1MXDDiXQBleM+9+kjxC/M/?=
 =?us-ascii?Q?v5irJifEKNXtAE0JRY0IOGgrFLIb8PmlNw7I0eHrmiuQShC7a14Ypi5gx1QH?=
 =?us-ascii?Q?aFDEVef/DmKOjzeoQwqOqV04W+2LabAe4NWb82YpQQPykALuhzYzohB4qtZu?=
 =?us-ascii?Q?gDL5ZOTisINfy9KhG8WqmhXCaQQdXNp5SFfIMvRBcv38Rny8duBis+nnNHAj?=
 =?us-ascii?Q?DJ7QlypOuG1TSzIaOo4olqGheI2kHnrhdgTXt0SRtHnaCPngItOGVbafHAKl?=
 =?us-ascii?Q?akpJ94CFvtoEXjz5pDmj+3VW3Ku/pEU2mORXZu3KAyknhayiuwPyoAT29/Mu?=
 =?us-ascii?Q?+M4nvuq3IIR1qLUFawIuTRa8qvRJdCS6oEdikzY9LHzBl3AmRYVjScbXQ8Y+?=
 =?us-ascii?Q?7RXTVpOVlEmf6evhc8vJf1Q1hhosylYW/ERBeXoq6SY3qMCmZDcdtkocXNrS?=
 =?us-ascii?Q?L1i+lVZJEnf8ZOwgg67h1pJI3U30Uzek+aUZojBDu4f2va3FQwDGH5c6CgbK?=
 =?us-ascii?Q?TaEXq+46coK60HzAtsYh1T6GCym8K48ODwtOkRS3TlU5r83OlG5S0i4nsFS+?=
 =?us-ascii?Q?bhI59NPQemqYPE8Z1PpT8wmxCZWlxUZk2iQElV2gunff/aJXPj+YoR+hqmKG?=
 =?us-ascii?Q?uTjxyR++cOdaMXCyW0gc9kMoSm+NpXoZlnlE0NL6bsN3GSOYxTsaE645Hpj2?=
 =?us-ascii?Q?O2nrN+aiUzVA7s6JCCSZMdFA0EAqYaVYx2S8eQkbp2yd/2vjejBR3ITq8oLZ?=
 =?us-ascii?Q?gs62GmWFv7Wk0QH8z7d1V7nAlBCJDNf081DaNxE99pXRMKvJu5ATw2+kzaV9?=
 =?us-ascii?Q?TkBQ5RmMoyuUQ2diY4n7/+xaG/mJfl+XN719eHNiwci5jTFmu79qECS/cKmA?=
 =?us-ascii?Q?0mu2UMWuyxrcQM3Q3NoTFYPQ3gDEWWCFkre5aDpR0z92hQ2JsoPes11e7I18?=
 =?us-ascii?Q?sVZpp1EhWNKgYNTSAce07kkaQwLDJ/imTsJUzqkT3DmdsLyk1SS6rsP/U962?=
 =?us-ascii?Q?HYXOZeG73bbkpQYZfkk4ZXkm6zBEP4jHrGYB2SBwmbTtGEpJj+NsUMFW+fkR?=
 =?us-ascii?Q?Kr9MOKFPfKUXpAp/YUINBwSdMYoW7zQIT5hh0qKXvq7Gh/LucMeKBdToLg1B?=
 =?us-ascii?Q?ahxnzqzzrfc5TAW/VakdaFFdIF1xZJ2ipNyYYTTsgqujV6JL3fJE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f54240b-0c86-41a5-af24-08dee35ad1cd
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 16:53:54.1069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 81VpyBqMtsdDs7XLunc2OE4+b18ZKeeU83ZWr07bZulbbPgBzCfgya87daSwkWeMdualiyDaOlQwx4gnWhoBRfJXc2ip7DCcpl7rjhQclj90V22S8Cmde5srmeRxf3zC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8846

On Tue, Jul 14, 2026 at 04:38:55PM -0700, Rosen Penev wrote:
> Replace the open-coded platform_get_resource() plus devm_ioremap()
> sequence with devm_platform_ioremap_resource(), which fetches the
> resource, requests the region and maps it in one call. Switch the error
> check to IS_ERR()/PTR_ERR() and drop the now-unused struct resource
> pointer.
>
> The raideng node has a single reg region (0x320000, 0x10000); the
> job-queue/ring children are separate OF devices probed independently, so
> the region reservation added by devm_ioremap_resource() is exclusive and
> does not introduce overlap failures.
>
> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/fsl_raid.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 47ebdf274331..aadb3dcb1b03 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -747,24 +747,20 @@ static int fsl_re_probe(struct platform_device *ofdev)
>  	u32 off;
>  	u8 ridx = 0;
>  	struct dma_device *dma_dev;
> -	struct resource *res;
>  	struct fsl_re_ctrl __iomem *re_regs;
>  	int rc;
>  	struct device *dev = &ofdev->dev;
>
> +	/* IOMAP the entire RAID Engine region */
> +	re_regs = devm_platform_ioremap_resource(ofdev, 0);
> +	if (IS_ERR(re_regs))
> +		return PTR_ERR(re_regs);
> +
>  	re_priv = devm_kzalloc(dev, sizeof(*re_priv), GFP_KERNEL);
>  	if (!re_priv)
>  		return -ENOMEM;
>
> -	res = platform_get_resource(ofdev, IORESOURCE_MEM, 0);
> -	if (!res)
> -		return -ENODEV;
> -
> -	/* IOMAP the entire RAID Engine region */
> -	re_priv->re_regs = devm_ioremap(dev, res->start, resource_size(res));
> -	if (!re_priv->re_regs)
> -		return -EBUSY;
> -	re_regs = re_priv->re_regs;
> +	re_priv->re_regs = re_regs;
>
>  	/* Program the RE mode */
>  	out_be32(&re_regs->global_config, FSL_RE_NON_DPAA_MODE);
> --
> 2.55.0
>
