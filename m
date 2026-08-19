Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013065.outbound.protection.outlook.com [52.101.72.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043D93D1709;
	Wed, 19 Aug 2026 19:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787169347; cv=fail; b=DrlsWt79hl3/JEetUiFPe36onD6zqAT1zztGRqH0u4rRD1fQdpYEbgOwbE/amKO+N7Mx8Cf92+Pz5H6wbgxUSt3Ii5qQKst2WtOdfZNPJ6U4Ht4NvL3sjc09RUtEzjvkd7xCzXBs4AMvyyjLf9wf8vPVmCkXNan+LjkZkTgU05A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787169347; c=relaxed/simple;
	bh=tG0dwk/tx1sWJ5I86Dv17PbEdUOXteLuhRW1+H3OsTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=meYuwdonCJZpabPNXyZ4Pe2v8/VkFeyU1L77rYeQzV/AovwwNgkWy0GZQSEiB2WDjxVzyQq4PJJoHJvWWz4nycyxfoxXSCt/2BwOPHQ2sp03boyBNrew8bNsCQBeV/RfUD5WtVWetZ16ZcHnSvovvvAIIEYloP1rxa/7aNtwJQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mY1vnHE4; arc=fail smtp.client-ip=52.101.72.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mY1vnHE4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFxuDPJi33uMmDwtd8F01vEVK2JsSgD9xRPXmoj2eRhI3l5oVi8eM5k/mFn3tbAT8NKqadaJRN8kZNz9EpJcbIvexYVIsEhEvHwdZNkno5dyUZGdo2sL5LsSOv4y8KxhSkxMEyrr5a1NTDmknhfcMPH6cO0EP1HxrBcHYKoA6JdG3KnKRmWT6+HMZ8QrIPvRobF5CvdQdQQOZt4XMRhsuGaWncOmWE8pUSkXdRWX7aaX9oOzbzhiDFLSDHMyXTSXIcdDGd6rc8IvnRVykKOavPFN1mtkZ3FRocOwspUJh3cbCkV9fZnMrvviWNVE/BAO/gMYfP3H1XUUVf23kuvljw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGsLRrgWrLmebzOkHdCqaiyNMz7CPg/gmLPLbTsUx2w=;
 b=YfOzi4etvlKjIFZ9mh3A/CTRDQPHsiZm62rwcujtqxISrtgQtsovaRncTeYKeUuDoPNnKtaZu0sKPw3g1edCkdCLFpn4Qsx+8r/XbwsuO/4BJZJJj0HvrgYvPH8xIrCf6LRCRKdAVLlmlg8HpgBdbKlEuiFiERSrd3s9kMkFNOxHKVnQ+YWwRRsvojDYc9GnF2LJpdaGczA10atTSeGwBTQzRmQFcewhZebr6lvBQrd6+wCURu6bUUwA4ndD3G6+111wK+EhfLfPB6MA+xcmxPDEzwhgYehhM/6SAdqu8bI3YRyBFA3W7PwBrYauMkVhhJXOgK3S2nnCPWNQ5i5Dkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGsLRrgWrLmebzOkHdCqaiyNMz7CPg/gmLPLbTsUx2w=;
 b=mY1vnHE4Y/UWfPQ0hST7Ga2/JbtZAf04vUFxk6MHXVB2xgsbQ4fwyREyP9pn0vOlTl4F24sc1hh/7Q2f6b0rMUYR4mL6zUC8+UkF7860fQYzK/bqmUvInij0ZE4CZMEt4gmi6rb/KDKpK6KSaeswDSVvuJKxW2rvGL+ngzRDjgvC5uSDA0inq23APJ7IzI65Dk8RRs/hv9XWDo7D2+siS9Et1XO8T/HwWrCIdxhphuGUfJXzGI5fMoQr/MULNXen4fW3jdJtYrRDf9giTstR3Firfz3oMECRd2O1bWQrlzSzjdlAvfwcK5zKoPps41y+KtxZRapyDwjOLyCfN/pbWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB10339.eurprd04.prod.outlook.com (2603:10a6:10:565::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 19:55:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 19:55:42 +0000
Date: Wed, 19 Aug 2026 15:55:36 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: txx9dmac: use devm_platform_ioremap_resource()
Message-ID: <aoYKOOEGCcjPsmQn@lizhi-Precision-Tower-5810>
References: <20260714234742.908956-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714234742.908956-1-rosenp@gmail.com>
X-ClientProxiedBy: SA0PR11CA0168.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB10339:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e15f82a-e264-4a54-a690-08defe2bd9d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|23010399003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	a0ehnMbpC9OYD/mnc3vHjTPlkEmxNdIDahHUKez6hi+gsWEXjJ65RJ6SPPjx1uZzPbkTLNtUEYLyQrVxzYeGcajyyk+zReBb1FjH6OGTnoiLcflcbTWHLzhMN52a6I1cQ7tAdPssiVaMGY2BoCK2OwZrhy68BQ3/5u04iDpT5YCRwM1/nDVdjvJZtXosZgYeUah2kLShTCrZMwPvrrqZIp20dgRq4A73UGm3RLeVh9uNszL1lZoIImmb7advb83XTycNZS0ndIX4DaVn6z8ABvXNoinogwTXfvr8y/9RlUJQ//ax3N4Iq4kC9f53hVwGcmblNyrEjcIDMHlak5MmTX1ipwxKibeom+/TCT/oDFaW60M/FxQ5eDgX0GLkpS0rWNLFO1N+Z3A6EL3EMKN5fbCxQo4ZbVyxY7yP1UzGZrP5Zlk+8Bw5c6FPsyfjnL6o3+MqVoo9qeW5wttkpERJxGHFnqxq+vSYK7xf4Okg9CDM1ILN3wvRUqCkzB/dnYudkQ0aEVXCXr4VZkdNcAwsK9DmwDwzUxgCSy3CA2d2FIT6cuA7j0dBAwgY664Uwf2SrOxaoBVRaV5o75+9CRfHBbBC7P0XLTtlWOGUJmYFV5StVCgJmBo4xONB/s9yE/kxj2Jjmiz+odj6WcKPfkrKXxypmFWCRB6uJgBhNqAMnh8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(23010399003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8NzTy8c37PR4mNGWOiU9lkvgEwArYDN2kz14XnOG35g3Xs7GDXrLtNBqEkG8?=
 =?us-ascii?Q?Q+S3OCBoiw4dyIStH3D/g3gcRiY8chCiSdmYWu9csf0fAw7/+LVRaq1joCLB?=
 =?us-ascii?Q?ts8EZzEDgtREvlMQNDnww6l2wyet8bOZOvuwU2KwISDbTVK/EwQKOBm19g/1?=
 =?us-ascii?Q?RLrtQbNZuFQ7NonyOMRSTxD0gVbYAk8A14DQ8PuSuJSdsRSGPqOtsr7TUmNr?=
 =?us-ascii?Q?QubEqewIAY98Hi3QrGKaifdAV0OLd2GHZ/kPIeqXuUdHsmjFM1xl9d8nORXY?=
 =?us-ascii?Q?WhCHIUniBzYpuetpqekH445ayH6F5tDEDv+Qr+GwdoMfPDZCM+BVq1LVvHNZ?=
 =?us-ascii?Q?kLWGdalvF9PcUbIej5PTf2CaoK/yjW2ZRRPzLNr6dF38UV+pZkcPgAkgyiyx?=
 =?us-ascii?Q?Ns2kwWCEHz0cagPkYYNIDbH1xTr5mFv/xW/hSD1Vsz3ZOTPHAfOAsSQn1Nwa?=
 =?us-ascii?Q?uCMbso6k8By4+Fo/XIHT2S4hf+10DEqIxb/uqbpVnTLIDpHkXgUS3x5wyRi/?=
 =?us-ascii?Q?VVncQj66quyly/z0QAArC7dNbQsGpxDG7nR+VkrzRZsO26SDFjhAPdVxRV4Y?=
 =?us-ascii?Q?JNfPgo8HXpu+7TlRugOHxcCGs/Ig0pPNmWuPU7+VLt5vxLhHDw2Oj4jWt5l6?=
 =?us-ascii?Q?SrdYoLd1uK6QZzN2L9LyX+A5nZzbFt8JLaABMUsLz2l6BR9YHTo46icB3q3z?=
 =?us-ascii?Q?tnZ8ka5gMfbYm/mGEBVHm/bmJA1BgxZPy8b/em+N+V8hy24MDd0QGZoH2kWz?=
 =?us-ascii?Q?yYibWUybQTDq3fDOwKG5KFh3RAVAMQPED9edvs532cZSRCal+XFAIdqP6UVY?=
 =?us-ascii?Q?nbsiV8onOizzphNCO9UtyeGlv9Xza9Zxvnyx+lnDirpmpADAIHEhj/TJcdHZ?=
 =?us-ascii?Q?EQA8cRRIHMeTWrEQ7ZiEr30PptVGW2fJUgSjVqhOGG1fQQLwKPIs5cFty+wa?=
 =?us-ascii?Q?IPrtAUZumtXDz0kDTuhhszKbHR89fzZdw9s+EEM/lp9Sq3p3NfavMvaj4o7O?=
 =?us-ascii?Q?U4az2iod60kWRYuxq5QKKNzjny8jLfj/Xs58p06fvQNSSNpPPzmG+Ksrw3FF?=
 =?us-ascii?Q?GwQEXldgNYrM4Ydj9hlugZsUMsJAkQ5zjQjLoqM0tyaW31XvfKUZ1gMf3yL0?=
 =?us-ascii?Q?tcwTdv/I4zJMmU3teqxwSoxJfI0hBogQJodMgoqgc9eIEluaARvSnW1/+eBO?=
 =?us-ascii?Q?lpPPRrrr4FriAzlOVw88u/vIdpTJbojV9lcVhHsEqEi6vViNwObtVnVufb9E?=
 =?us-ascii?Q?vhM5e8t2o4SMDradgKi3zCDUOwzxwhrzBTExAHXJ9gZOT7KvW/lFK6t2EqCp?=
 =?us-ascii?Q?FkT6qrwkzJXiHrjfQqF+eMyGXJuCe8FYkcz8pnzlkV2apAq6ybVabPFujb95?=
 =?us-ascii?Q?soGjyS5d9udsvcU/iRoSAMmlwK1PVsWSiPcOYFIbH0HF48aDgXeskZJVRYe5?=
 =?us-ascii?Q?KtMzZK2bin8sLzirdJe66b+KtuZM+4fJRpEcRvTaQ1EqrJlSGG9qtGkvlRW7?=
 =?us-ascii?Q?hwWy/MzOac55qeia8RofnMFg5Kljho2Ec3+4NmMJsQWfhktSTv6kb/sEnqkf?=
 =?us-ascii?Q?IV/GQ+RyiVbe25lpEpQ/iI8U42V3flUO7TuWkcjrzCiLeo8rcC3h8kHq+Boy?=
 =?us-ascii?Q?wEEmMb3EGQ+EmHn2TPZliiihsl+mJUGqukGZk51Bt/YLZZa0X2XXVa2fE+Ip?=
 =?us-ascii?Q?c20Fl1hsWtjPvVfO82EmOC+Sk9LLSvF0mbjmiXUhMtZzBYA3wA734d6qISiI?=
 =?us-ascii?Q?oVaUnGv/CakbVWC8qYb8qq1GHe5t8Y5TZ5NcMRukJZWs9eJ3rrYJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e15f82a-e264-4a54-a690-08defe2bd9d4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 19:55:42.6552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZ8hymhl4s2Q79IRPFv0TkZE0GKgoQ8IdYdok64tD8UdU4kOzD6Pa5QMJNjFy78nJov7naln+iP/7Bc9u44J5txgHLKnYefnldTV44FDp8cQYOrzmoOvoDrRWgWTDbLJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10339

On Tue, Jul 14, 2026 at 04:47:42PM -0700, Rosen Penev wrote:
> Replace the open-coded platform_get_resource() plus devm_request_mem_region()
> and devm_ioremap() sequence with a single devm_platform_ioremap_resource()
> call, which folds the resource lookup, region reservation and mapping into
> one step and returns an ERR_PTR on failure, checked with IS_ERR() and
> propagated via PTR_ERR().
>
> This is behaviorally equivalent: the driver already reserved the region
> with devm_request_mem_region(), so the non-overlapping reg requirement of
> devm_platform_ioremap_resource() was already satisfied. The txx9dmac
> platform device (arch/mips/txx9/generic/setup.c) provides a single
> IORESOURCE_MEM window per DMAC instance, and the child txx9dmac-chan
> devices carry only IRQ resources, so no region conflict is introduced.
>
> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/txx9dmac.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/dma/txx9dmac.c b/drivers/dma/txx9dmac.c
> index 05622b68a936..6595a54a4b97 100644
> --- a/drivers/dma/txx9dmac.c
> +++ b/drivers/dma/txx9dmac.c
> @@ -1167,26 +1167,20 @@ static void txx9dmac_chan_remove(struct platform_device *pdev)
>  static int __init txx9dmac_probe(struct platform_device *pdev)
>  {
>  	struct txx9dmac_platform_data *pdata = dev_get_platdata(&pdev->dev);
> -	struct resource *io;
>  	struct txx9dmac_dev *ddev;
> +	void __iomem *regs;
>  	u32 mcr;
>  	int err;
>
> -	io = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!io)
> -		return -EINVAL;
> +	regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
>
>  	ddev = devm_kzalloc(&pdev->dev, sizeof(*ddev), GFP_KERNEL);
>  	if (!ddev)
>  		return -ENOMEM;
>
> -	if (!devm_request_mem_region(&pdev->dev, io->start, resource_size(io),
> -				     dev_name(&pdev->dev)))
> -		return -EBUSY;
> -
> -	ddev->regs = devm_ioremap(&pdev->dev, io->start, resource_size(io));
> -	if (!ddev->regs)
> -		return -ENOMEM;
> +	ddev->regs = regs;
>  	ddev->have_64bit_regs = pdata->have_64bit_regs;
>  	if (__is_dmac64(ddev))
>  		ddev->descsize = sizeof(struct txx9dmac_hwdesc);
> --
> 2.55.0
>
