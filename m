Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013070.outbound.protection.outlook.com [52.101.72.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7171B3D6479
	for <dmaengine@vger.kernel.org>; Fri, 14 Aug 2026 20:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786740212; cv=fail; b=RfGhSsysmxtkxZaFUrGCUv5l2F5VicYwbA9mx401yVIAZdfueYCt3pR7/PUxAbADVPK0Ora6t5yGwpVFuM1WxTIXMkeS5kSYiOTGceKOe0l1tn2N55E5WnLQysQQWJFjyJ6v9yM9WVyNK/g9qe+Woj3HB3kBQoLC48rDaB8VJwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786740212; c=relaxed/simple;
	bh=D9eaXrPiXejOTq/EIToaxBvma9TtdDdcvEKjhPyMWHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=vGlCV/I7hUl/SJ++RoX7zfQk7Ct/BiNyr2YwUxfrbJXLyNxGHNMVKF3Jou0WNYXmaIYCn3lYZo7SPJbqSC0/60YcdtQJ7cWAc9J48PnvQuJoqn+7n80S5Sr8HIEUFvhOB6GFfLxj8TyrhBrP57NSLNEfTt2kIwWp8SPrbH0WMsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=b6BpXH/D; arc=fail smtp.client-ip=52.101.72.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="b6BpXH/D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=is5TgE7mPuxF6YysmV3ojQZtGivvBFKCF/NqOCm7JJZtNBENAKAVBWRx4dRq7vfwPLjNAa0vJu9toqDDtgLcwYbhc+Bjfj8P7b2ta/Bk3Kkq8k3Z8K3pVA2nn1Iy87cZSzpyBGX1sgEGvliZ3mjs/QmDa6aSpluXka6m3yEK6VI+8hAMqyjnrdDODK/AE4Ci8ddLgsKBjCDY4i9X4rpSpdCCucErRXPr7oohTgJ6q8yXgY+XPlxEePPKkiSDVIO2BisZ9gtVvm385OSvSHppgmArBRY/OiSlhRboHqvfPVYR62FaDaYg6gJnskuHYLp/4FcVYlY8dVVUCb6ZWbJhDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dZVIpHCFeveDgVpWQK0EQVyc2+0nq1a7qac0gakwMA=;
 b=tLq+EHVfUkVqLG3Y4sx+KDr4i+hWyfGn0yDczYFFC6gAstqPkCNh0Msd/XAKoaeJqIMSq2esjIFoFAZ2bt1WxtN62iRNRJJNLpq2BUcW7RsXsSG0Oxou3rqHAAvTrmEeNlOS1gzLQO0rOShJBA4omLDoaBpMDuGHvk+NVODs8U3elc9YNkihEYHAQ2jjluVLUDAEIgWUzUg4OFyUoCZ8bR9hV8hpHpz1xaTHemghKtWzpENNES7KY+OgbCgHwZ3B/mx+KdzYywiHwnymIMNXjv+d7viQ1JzWx6f4BB+1qFcS4Lhc87SCQ2Xf8fbxRvrtSG/UQP4Ciw4K8L6hhNhegg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dZVIpHCFeveDgVpWQK0EQVyc2+0nq1a7qac0gakwMA=;
 b=b6BpXH/DsrK9R5M6TOHfJbMlnT7SW014aHxgKNZEdctuiCHpnVL5KBCN8QXESM9wDjZKYLwyUnN3o3J0rHGNADjP5f2q55UpcouLR1tR4X+TjIt4DDEiUIxDK48yMtmgbmMCWpPqz4+wFF4GyaQ0JiDrGYxWzERrKJKpdUKPK0FRSiuOtHfZDUgsMm+FM6QCaoy1vsmbe/RTbrFELUA+u4G9F4qDk3APzGeHe3wf9/F0QSLZ0eInJ7VK8BO5K16j9hCwltJBDs0KhoTXe7RAHQntDm1ErOBz70Ah7LI6RRNFzW5R+ssD3uM42Lnqcd9hXUF7YQ6NUfOXqtevUHaKKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB6880.eurprd04.prod.outlook.com (2603:10a6:803:130::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 20:43:26 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 20:43:26 +0000
Date: Fri, 14 Aug 2026 16:43:20 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH] dmaengine: pl330: Move device specific debugfs file to
 its directory
Message-ID: <an996J7-D1PrcYTr@lizhi-Precision-Tower-5810>
References: <20260725194343.494973-1-vz@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260725194343.494973-1-vz@kernel.org>
X-ClientProxiedBy: SN7PR04CA0060.namprd04.prod.outlook.com
 (2603:10b6:806:120::35) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB6880:EE_
X-MS-Office365-Filtering-Correlation-Id: b9f56b3b-d6b5-4603-13dd-08defa44b069
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|19092799006|10067099003|56012099006|22082099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	AQYKUUT5imsjuAQuZk7m2NKnfFYuRKmUpBvso6mpPwRJghDAiN55HqJkma6vZy0JuxQxFbKCzz4tnidkt942sFc7ghgWMugkwa/JuR9uqlhOz/dLgcyKfI4SxdqsvLSt2cjt8YmYIAhvZ/SZeQ33HWBnIaPpJHv7fBjVqRaAil4SSaOVWkwFBS743bUYOdFYkMqgCaevxD5yX5AGSXGbNM0R17Wd+9nq1VgtvVUiMlwkBR2R1zlmO5/zFO42h/1Mr2Hl7slE35XeGkI66Mc/BmN3mHxjL2a646AX8d6EN7Nj3hfWC7G/PjzWe1F0RrZHedmPmRHZBLAcd1nhi9iFybcWPsAA8LOLgpnunPDe6SMNZg28h6YXgoCRgjQc60qYVQsGu0Xebu845INduddVjYlxQKX+wwN3HEfVptJaBmeqUVLFS6Y8pMjkKpjU0leiF/R0ZMlkE4NL7UiJvjHpbmHeg3HwtKrPhXg9Q2w/hj1aczheg4+9nKyGMGBQhZ+DrgiAz2IG/sIVXyiElb5qtLu4OWr5DbGfIZM7OwSSGv413MWAP18ZxjNOK2HhQCzntcPhiocUKDNvN5ukiiBrn28S4grH+OMKSvZ/hyPRCzwCLzjI0eIBH7BqeR6LjPBk2Mh+HBGMuoo6r4j26WGJrcaGiQRpzLr+8qhZSTvgWHU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(19092799006)(10067099003)(56012099006)(22082099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q03KtzDQOx8gfD8kUdlP2v9AxogGqwxYwVVxcVl650m+VZE+FlfyOaf3J99n?=
 =?us-ascii?Q?1zsDzFX9FwLEa17PvAbGl3K8vtsD8s/i7QkH9K4ujwa40ZRv2ZYT+5rG1D4q?=
 =?us-ascii?Q?8pJmH/pya0PGmAner+B5Fs5AU0Y8ZDI7OEopfFRh9jpHvHro1sudHUN+Cw4Y?=
 =?us-ascii?Q?munSk3WfxWQcTgx0pCgXb5tr1EvOUhboixAe09PWFgLOHgcOqTGooabMRx5P?=
 =?us-ascii?Q?xQ8zyn7/y//6E1+mP2+aOswGStGEC7UakMcLEhJxpQY52FFi+5nAS5Vb+egF?=
 =?us-ascii?Q?0VA5ZvywFiXs4E3yaeoqf2ZUtErVIR0k3tmxr8IWWFTvasGCr6r3oEThr927?=
 =?us-ascii?Q?cDVPF8IrWSk6yi1d3T+EzFf8deWZBhaOrvovtVyKuE7cJo+lQllAZ7Si9TxZ?=
 =?us-ascii?Q?ctdZG1Ceh8xPdBB206ZaQtOaggTojjcwJlRwuxR+LLZoL1de6rFAT5igvpwz?=
 =?us-ascii?Q?/EbCQ1oJagvUJGFz8B1brEC9eNHXBObQls3oPoqgXtnepIWkmRUPV2Wj076J?=
 =?us-ascii?Q?VjJ1JFfgHdn9zNcDppAYI7aGKVeZDfwPdlpCI+oE3cZyIZW7HgLnTyK3k/vz?=
 =?us-ascii?Q?pNA1lDHSIwXZtkAB9w7PqLO7QZMTZOqIwE9EE8eYzENgHtsSQrpuKSyQ1c8f?=
 =?us-ascii?Q?gFgFPkyfbu5KJUqkXBWAuxnd9j9RPKwUEXhJKSA7ne3PsuBKUtHflwqCpRV1?=
 =?us-ascii?Q?ntOMghl/CKGDkxa8WXEfmejK2GXUuaku99jOwxeQw08gwS1nsewy9Lxidd5D?=
 =?us-ascii?Q?w5RKZl2bdjNQcx2jyu7dYpM0YuudlhFMGzOmY8O48XRbjb3JgcxlhHXFSb1V?=
 =?us-ascii?Q?040kh82RPY3jdX1lMHk0VpRtJ8cfI1FuXRnbQ2I8miNcXcxRG/7/mUaq52ML?=
 =?us-ascii?Q?J/AsYpAI5o94CZ5kSiA7YXMIZWugpH0HDAa3kmb6xRWy73+LuG8vyVix7pF5?=
 =?us-ascii?Q?ZP5Hu67DdKPYCSwTy2KPSSSLdNR0TQ0ResnbVyrk+sTei3i2PXQAGdjwIJrs?=
 =?us-ascii?Q?L5xHPnH+0WTHvTkNkzFoAakI/voxwqmDDRmqFDk1wNN8sDlfAe7DIbbkHh2Z?=
 =?us-ascii?Q?3CMdfeKOiUcKclc/aV8RH7+Aur+De8J7Un2pHbo7m/jRJ5iNSUP9UzX0FoVa?=
 =?us-ascii?Q?eXXqpzBawREx/bg7b6J5CSsOzJhI4vIP85jKVkMexIV2Bs8ccKDDd/Iu0rtr?=
 =?us-ascii?Q?5jmTSLrCZjvCZuNEa8KV7yzKwU96NoCzNusTbzkb9ifo03SliKl5eoAnPP9m?=
 =?us-ascii?Q?IKb7a9tPzP2V1yaJ2d5jFbjq/BxyYv2B08ZmpBTX9SbshfAUk7yFdhhwdHUw?=
 =?us-ascii?Q?S4lqa6WayUkS1YTcH3D9j1Cr3WYdPWn+P+NdHQDglwF98G0YCaoK0brPMkO/?=
 =?us-ascii?Q?8529t0g13dpkLFb0h6OCqrMDzH/Dc2+Flvwb5bW5ZCk+TJK6B5lQr5eEBCwI?=
 =?us-ascii?Q?1xc9Pi74yLUuiCZT1ITpwc06uFV2MsBtKeUuxs4laBagVk+Y1rTfLGmzjgel?=
 =?us-ascii?Q?4DPNge3PTvh3tbYvY+R0hFezt42TAONV7x/sUa2FdzRYREHtZ98c1WVogusk?=
 =?us-ascii?Q?TjCyy9mZfB04n289RXwqOLREVKtH52PFL2nhvV1nnsuHtDz4e3dj/uGcCa+i?=
 =?us-ascii?Q?w4vxWY/4A2NoqjsvLRw9DIFyYQwx2YpQiur8j5uFWElq/wBU8isYLbxx8yvJ?=
 =?us-ascii?Q?czjPy8CfdicPyu5EEwDNGq/uAKlqqXs/PYzfDnfsrCCVzggZMu0r4m9aBMuG?=
 =?us-ascii?Q?ozPeMPq8SlHMv5VpcMw4s9/3xMweCwmLzG1jPJs+SplNYYG366ry?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f56b3b-d6b5-4603-13dd-08defa44b069
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 20:43:26.1462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yQxecRIhgAL1TlTcqUgG4t0G/ArfwW5fd3hKy1lD5p9xxKrum5oS0idwhh+nHb81Ld1XvLaS9i6fdfWSnYYUnuJclnMbUI/CGCRbEUw1K3QhUJRPrqMuTPFVv62gEC00
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6880

On Sat, Jul 25, 2026 at 10:43:43PM +0300, Vladimir Zapolskiy wrote:
> Under DMA framework every DMA device gets its dedicated directory
> dmaengine/$device_name in debugfs to store any supplementary data
> accessible from userspace. This change moves a single registered
> debugfs file of each PL330 device from debugfs top directory to the
> device specific directory, the file is renamed to "stats" to match
> the most popular name among all DMA device debugfs files.
>
> The S_IFREG mask is dropped as excessive for debugfs_create_file()
> function.
>
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/pl330.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index 25ba84b18704..9736eb24e5ac 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@ -2952,8 +2952,7 @@ DEFINE_SHOW_ATTRIBUTE(pl330_debugfs);
>
>  static inline void init_pl330_debugfs(struct pl330_dmac *pl330)
>  {
> -	debugfs_create_file(dev_name(pl330->ddma.dev),
> -			    S_IFREG | 0444, NULL, pl330,
> +	debugfs_create_file("stats", 0444, pl330->ddma.dbg_dev_root, pl330,
>  			    &pl330_debugfs_fops);
>  }
>  #else
> --
> 2.51.0
>
