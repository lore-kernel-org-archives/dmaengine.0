Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010022.outbound.protection.outlook.com [52.101.84.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2408649505D;
	Fri, 11 Sep 2026 15:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141784; cv=fail; b=IFddgK9+IUjGEYKe6DB/MpA4CR6tab8rRKrZtUT+bCYSWhzeDvcOeblAdO2E3IYtVD+PsfXcNfmKUn45nVIxtuMAeQ5hJimzM8hCKLdKb5bqjSMqUc2eb0ggSLrp7ZYQbh85sQShR0ERZAJek0rpKe5+vqQ0st2wjyZP5OxGGxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141784; c=relaxed/simple;
	bh=KId3+k5YLSzekMXtkVTudvd0S0Bf2m7OiJXIjExOqCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ld2DndR6uj/ntCNDlWBlZlVm7XIlEVJewCj3zsepbQjfkoGRX9N0WEY0z/6d2A7WoUhC1+adnVO36vrS1Q+KzdiSgByq2QFv3IPWFMWX3s7SbZBwaY3qQGcuFuNpXUkwKqUrjlytv5MMtnljP/it6lGGEVrL8emgAFTmXfs6nFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=r+pnhRcO; arc=fail smtp.client-ip=52.101.84.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="r+pnhRcO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mhkafmcIAsnd5RqTmxJs03uDOREifIFXLpBef2mud0pFBGddSxXhGDv6CMEdKGtmATL/SgppCN0LNman54o+WcCtKgCaR7+IwELC9ISdbSBApxr/jVFhgzpsL84akw9OVMFdUBj4pFB4HwlhyxqptpXQl/z3iE6qiguxnRKq1zU+s+m4Srg8AQywP4CQV/9VfxAH1CCvhuhtL/5Zkl04Df9hDwmZq1zRvD+nHRWHNgIaIafpEf8TxhzQL7PeDT3JVyaaBchTJ1jExJZhUubO1r7ICiYXsOQ7YQM30rs4nUnRDOaOm0BsNbapi2u62ux6tZPJI7iReqbZMIFPSWgZQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6usKcfmDii5jhZn1tt9nfw4aHKpXgeibSZFYoGMhy8=;
 b=w103FBLxNzg4cX6lQTXq38nXm3Vpl00tZ1Xs9rt5vIHYoBDf6K9I3KwG8eZ4f4JFBw+IH88xISXJz8dMoQte2FC03ekYtwNyncQPdnvtqWe3BJP+/RdKbA4fdQkzykuDomNz4rFWwpJlIQLoEtuh241k3lp8FzVtbRWxCAco+MksbWN50pcl51WkyttkNBPLccDwF6MmqmL1+GnXoUtqSjLDjXKcMPB35nbuz84MAaCuHgsK6QSq32aKCW7crPlK9InK5VbFBvzln2sE1m5T4NNCTEJEHYR48SVMrXakelJtOX2kNKv3hsDpTd2k0/DZzuBR765k5HSQ5gnR6fPm7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6usKcfmDii5jhZn1tt9nfw4aHKpXgeibSZFYoGMhy8=;
 b=r+pnhRcO+K+IwupScg+Xwhyojm2ZoY/N9cSeCphkL6Aluhuibc+WD+pZ+iHOLZglozBWwoiJE60uPitPfIUK7tdaxE6D4raOaCokNlEbrX5h9FUp9RQLen5fXqfOALPXRG/jy0rOomyxkvR4Xlj5CC+4a5oMLueyYTlH2Ot5PHpn+OB6mjDHwAiSlr1tuUcDeAU/hD3XIQnkVyeq8aIUcDM+IdeLiKEQpnSpE+g7lakvqJjDSjJffLgIu7+C4NQH0y90WH2BQ4hNgYZC6sGR+I2n4iBn9TckqSCdEpT0VE4HeGc++hexGyj44z5XjMelTXd42w8pcOM3gOxk+7qR4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB9053.eurprd04.prod.outlook.com (2603:10a6:150:1c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 15:49:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 15:49:39 +0000
Date: Fri, 11 Sep 2026 10:49:29 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Yuri Tikhonov <yur@emcraft.com>,
	Anatolij Gustschin <agust@denx.de>, Dan Williams <djbw@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: ppc4xx: fix format specifiers for size_t
 arguments
Message-ID: <aqQjCdMSalzM91VT@SMW015318>
References: <20260910211440.65618-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910211440.65618-1-rosenp@gmail.com>
X-ClientProxiedBy: CY8P222CA0024.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:930:6b::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB9053:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c789384-0c0a-4575-1b8e-08df101c49cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|366016|1800799024|376014|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	F49E+56LrMXPewVk9Zcd/mjRXaWEHNb9qvy00gKhToumVXFbkv/m9ln0CsbWQm0tuQ2jQHbMH75olpjUeat9nk125GLvT/w/b0Gb6gU69KILMyIFUEkDztQqtWwm4oROW6+BExLUj7zdyqR3Hf9uA2PZw+Z+mbANh+Fg/Gho+OSzOFN1mmxolHJBIZZ9kAMmAs7Pc0h4HdnQ01i/iyd5jcLDr9AtRwGEQ4q5vv0CNAxJcuh8A/JMTqAeaaQpPmyaas8Pty8lK1UpyEuMaXKlNEJcMod8d+28TwcbmBzXMA3vh5MAMc7M9bTzGhziqnFzzs9ie+0a4TugtVzvInny2idGr2gRDzTAMtgWASVLbtBIlar+fp9to1FLORTnfY4UcF8pgZ7cDIxORUruSByn4/RdYgxYi2kMH9DksTgnsDmHcjTR0OR1SBasViEdhflDnbc0m/eWtnEEfyPGYFT0r9mK8el3fdoIIs0P7TOAlNEnL1s2VL5XD81crGCifhcacuEZC4hfgZ+cWfhez0tzjuPoronrpPs0z0IFJAXWLVXvqhUc5B7Kgvjb53s2Ws9pChFm7VU/PZw+KoLZP+SO9JxkoNCRUTDSCTt0Ae7jY4dNQSQzscBbAOQqgcMneSl+Bj6z7kJ4C/CePf+HDb5kpLADOtMF/+Jxv1L+ZnMmbVE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NgqC42cYv6qJWGq2RrRhGjul9Y8yjsVA3Ma116DN/XAgWCs8jVJBvdTjQEuD?=
 =?us-ascii?Q?Uy2d252bmZ2x7sYh3rxIZBpPXmtk/MhTcsrzlCGwYALu87CcbQk6NBlmJdMP?=
 =?us-ascii?Q?fO0A/QAxJNXpdyfZpK8pK0N6KOGCTHIfVMvNPk33MiOAnOFKXMhzI0UNGx3I?=
 =?us-ascii?Q?4alaVGSt+7F9Mb9bfidjELa45YJnSbGn3femLb23yuBpO2KKmoSpFSBNlRTv?=
 =?us-ascii?Q?31hsBLYxdy5pJHcXj7hGWswYn3t1XSeUj85XY6wr4m2gcN3IrMfIYTUPAOJQ?=
 =?us-ascii?Q?RsGWxbHKQRw5+Mc75Ue+Bx8EI1Ewo5kcSa3NcxTaCuoRE7n1RLTvIO5FID+w?=
 =?us-ascii?Q?uuX1aGmTKGjpu3eCptSPpWqlRpwHlhYmnG1CZvBzNyNTjPq0ukB/qbNxoVs6?=
 =?us-ascii?Q?EF6ucXSOoVbvgC5CmSfeH9UpMSLbsWZ6m1O+5hrad1kAyPGtqIzuY7MdHHng?=
 =?us-ascii?Q?43xqebWAtKh/uRW7ForJvsLkYesussaeOy9puXVaDo9jcu3R+99xzBO0Mdht?=
 =?us-ascii?Q?qd56TiLnPTkpsRICHP2e6VOQaQ8IeuL45WN3/1PrjFARMC4RGjMJeDqNEdKj?=
 =?us-ascii?Q?0NRlmoNZPA9bq5tQEG0a4JboDS0j3xa2U+PYhRIdki7+vAvYlpqs0stIHhXr?=
 =?us-ascii?Q?k4CESazI+URpSH6wTaHs4JJIDXe9+w+FbK3czh7y1vkExEb0rTM17QL14KNJ?=
 =?us-ascii?Q?71DsSxVg0jTvQVlH2frmHQCLoGU/QJ+xEYOXglaFbogfv5kIG26xgvknhF7X?=
 =?us-ascii?Q?//UrNh+oEWiZv7r4k8mGOkemPrhqb3ix39c6NzcXfLoo8Bkdldh1CVc6/Ymd?=
 =?us-ascii?Q?mU2nddYKscbyRQy8zjXGZJNwiPGL3dkKkExhxQ5KjKymvws5GSoDB1kDaGBF?=
 =?us-ascii?Q?waGMYoHD7dbT6XqAIqyQSOeLCuG8xf7ZodV6HESv8vp9e9wV1jwUVTAJYSHW?=
 =?us-ascii?Q?oxvMjIZEoBEX4Dex3xFUZs93c6s5Cr33fcwASqRUlOyABYRWbvXpsW18OVvj?=
 =?us-ascii?Q?gbsWBunY1fm+t4mEPVnHYXcAwQv6sTlonvCO4oFA0YO22+/Wkjwuegwmjwfp?=
 =?us-ascii?Q?T95H/P/o4nILPIX+7ErxMRCrEblOS2KEhThI1aT1bLts0Qg4NibrAEHxT+7C?=
 =?us-ascii?Q?pJRdbkMIF9fjh+vE1DolCxSb9piqo651pVizxxX2l/gEEYCaePQtvNpuiY0j?=
 =?us-ascii?Q?HpkdyVkorm2q/39UaPaSq3HgXqMwlruP6cdIACewCvmIOUlnIruWHXY4YOCy?=
 =?us-ascii?Q?xKc9N8UXs59RdggYGEDYxZYb3iWeeX1p69UiVnk8+SvTr7AnJNZKgdWgC7Wq?=
 =?us-ascii?Q?bdyqrAoDdouxdTO5VeN+MylPI2NHkF2OQ5kgK/hdx6sOdHCJ9vqCUaHLAYBS?=
 =?us-ascii?Q?GdcVvB19eZ0lf33AHJAfXPQSLKS/KhEXQ8lM+7OunFwLRsUws6gMLW0K9Lz7?=
 =?us-ascii?Q?oEq9rFeHJQI2MMRqXZ1YM8m12OJCPnKlgZZvkPqVsauoSl5A8NYA/wCy0a7C?=
 =?us-ascii?Q?GulTavb/A3iBgdDoL9aKJKPdnvvh1OMJjbI4vivos7EyHlbieU/QIkdifJH/?=
 =?us-ascii?Q?Nzr+obb4iM95F2hmlkpQyCn+80aNfC/NiLluQQV1YhxqD1g/E2olHfuuVSQJ?=
 =?us-ascii?Q?mlKIp7HOF0bQnphZ8+XsASoWhAkqpnhtp1JW+0obETHDCgetYPwmTzZEzj/8?=
 =?us-ascii?Q?qugGNo7epvuEgcdYgA3y9ErRIpPK0Iro0jT22G4xGg1YtBO+Nm3FAB13UKNo?=
 =?us-ascii?Q?i1K8IToQjKKlq4fPctaDCNLtzM5TxKPU7z0bHFv2ZS40gDogTeRE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c789384-0c0a-4575-1b8e-08df101c49cc
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 15:49:39.6519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3TFjgKgw0Agjo4XEV+zkeCnbjZytzqNm/ld+5xVW2GPkS8gOnEc7LS8ovZTffjr4LnYg7dJgHnOKVz46fYhOQTmkGc2aZpkzPOcjFsygMH79xXv2ryXo8t7YP7SQEG+w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9053

On Thu, Sep 10, 2026 at 02:14:40PM -0700, Rosen Penev wrote:

dmaengine: ppc4xx: change to %zu format specifiers for size_t arguments.

Frank
> Several dev_err, dev_dbg, pr_debug, and printk calls use %d or %u
> format specifiers for size_t arguments (len, pool_size).  Fix them
> to use %zu to avoid warnings on 64-bit builds.
>
> Fixes: 12458ea06efd7 ("ppc440spe-adma: adds updated ppc440spe adma driver")
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/dma/ppc4xx/adma.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
> index 279a431ccae3..bcc54d584e2b 100644
> --- a/drivers/dma/ppc4xx/adma.c
> +++ b/drivers/dma/ppc4xx/adma.c
> @@ -799,7 +799,7 @@ static int ppc440spe_chan_xor_slot_count(size_t len, int src_cnt,
>  	if (likely(len <= PPC440SPE_ADMA_XOR_MAX_BYTE_COUNT))
>  		return slot_cnt;
>
> -	printk(KERN_ERR "%s: len %d > max %d !!\n",
> +	printk(KERN_ERR "%s: len %zu > max %d !!\n",
>  		__func__, len, PPC440SPE_ADMA_XOR_MAX_BYTE_COUNT);
>  	BUG();
>  	return slot_cnt;
> @@ -1989,7 +1989,7 @@ static struct dma_async_tx_descriptor *ppc440spe_adma_prep_dma_memcpy(
>  	spin_lock_bh(&ppc440spe_chan->lock);
>
>  	dev_dbg(ppc440spe_chan->device->common.dev,
> -		"ppc440spe adma%d: %s len: %u int_en %d\n",
> +		"ppc440spe adma%d: %s len: %zu int_en %d\n",
>  		ppc440spe_chan->device->id, __func__, len,
>  		flags & DMA_PREP_INTERRUPT ? 1 : 0);
>  	slot_cnt = slots_per_op = 1;
> @@ -2030,7 +2030,7 @@ static struct dma_async_tx_descriptor *ppc440spe_adma_prep_dma_xor(
>  	BUG_ON(len > PPC440SPE_ADMA_XOR_MAX_BYTE_COUNT);
>
>  	dev_dbg(ppc440spe_chan->device->common.dev,
> -		"ppc440spe adma%d: %s src_cnt: %d len: %u int_en: %d\n",
> +		"ppc440spe adma%d: %s src_cnt: %d len: %zu int_en: %d\n",
>  		ppc440spe_chan->device->id, __func__, src_cnt, len,
>  		flags & DMA_PREP_INTERRUPT ? 1 : 0);
>
> @@ -2279,7 +2279,7 @@ static struct ppc440spe_adma_desc_slot *ppc440spe_dma01_prep_pq(
>  	unsigned long op = 0;
>  	unsigned char mult = 1;
>
> -	pr_debug("%s: dst_cnt %d, src_cnt %d, len %d\n",
> +	pr_debug("%s: dst_cnt %d, src_cnt %d, len %zu\n",
>  		 __func__, dst_cnt, src_cnt, len);
>  	/*  select operations WXOR/RXOR depending on the
>  	 * source addresses of operators and the number
> @@ -2553,7 +2553,7 @@ static struct dma_async_tx_descriptor *ppc440spe_adma_prep_dma_pq(
>  	BUG_ON(!dst_cnt);
>
>  	dev_dbg(ppc440spe_chan->device->common.dev,
> -		"ppc440spe adma%d: %s src_cnt: %d len: %u int_en: %d\n",
> +		"ppc440spe adma%d: %s src_cnt: %d len: %zu int_en: %d\n",
>  		ppc440spe_chan->device->id, __func__, src_cnt, len,
>  		flags & DMA_PREP_INTERRUPT ? 1 : 0);
>
> @@ -4077,7 +4077,7 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
>  					adev->pool_size, &adev->dma_desc_pool,
>  					GFP_KERNEL);
>  	if (adev->dma_desc_pool_virt == NULL) {
> -		dev_err(&ofdev->dev, "failed to allocate %d bytes of coherent "
> +		dev_err(&ofdev->dev, "failed to allocate %zu bytes of coherent "
>  			"memory for hardware descriptors\n",
>  			adev->pool_size);
>  		initcode = PPC_ADMA_INIT_COHERENT;
> --
> 2.55.0
>
