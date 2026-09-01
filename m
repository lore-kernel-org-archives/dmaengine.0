Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011010.outbound.protection.outlook.com [40.107.130.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3151647606F;
	Tue,  1 Sep 2026 22:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788301046; cv=fail; b=W4tYrRgPuvjpYL35+wylKObM+gobMqroh42caNM7+6kArno1joSQjgo7gLKEyhQmTbuNN+dPSE1nNOeLoj82cEy9gkAeTB1fx2m+s0jL2z2sPskUaNj6atHdkyTl+lu36rEzhAJ03d2h00/Q7lzDvtb3mr9uKS5qMg4W0zjDtfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788301046; c=relaxed/simple;
	bh=fyZ/gBJII6Bcqww9qJu+WA9fgqMkKtsQD96a+9kY44Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ti9jqAflNtNA2VINAbb8FJ9Zvygd7KuVLpW96fzkMioYBgPEcmjYKY5MKdJ6VylXYGGaI+lWu293LCi+ed2583IiXzho38JEmjaWTu7mdBXTWMhoQBPrfuNMvyBRlphrkH+StFkQOSI5Gmfs0fHWzYiVd4H82HxfnO5turc+Sms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=N5M/3V6S; arc=fail smtp.client-ip=40.107.130.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="N5M/3V6S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H95TOfT4U8tfmCC0O2TK+3Pef4m6jNQb888hlpzsMp9r3of1Bqb4Fcwzmj+R/32wZevtAGvc+9/8rSLLYUukuqzPFhX6vend1wEjc8VfjvhenAMKWs/fzLO74FKQddcSv0RWdpYAU9S9Yncqvx1NaF3pPA0sPxmH/EyusvaLhSug9r5xQBcDsPH4SlPVUcxpOnLDmFzoaKbP6pdlvs/NXFOp1H0VnsE7NhCQZ8aw+5VyczRzM3NWszO5xMKtxF7mZ+U6Ro4LMmbCKD+wsHkTJ5oHS4HQOgCoTsa4fr+6LB/mcxTM7qlB14WFmN0Q37c2G8qfDm3y950Z2OWHnkFCdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHQGzNbckCDFcFX4x0M/BBR/Es+zCT6Yldn4N4EbFk0=;
 b=y61xKfpVqiVI9r4G8aMFUBZsk7+lPrN4IUfDy9bKiaUn/xwmgqEswaECBXpHwxX29vzG92zezIsJLs6PFxxIoq4+vXqJFvX5g7oM4WpEb24aGMGzrUtNN4UeQyYuKffzT4pZ9HwnqBmOLZcGF2QgOIrtwV3s3rRCDTaxutqDkHGLzopMRrubL27hg11E6Lhlx0Y39+EHGYNNbOC/xd6zL+ExeoU0f01OCVdQfbBWYq5/7iWSvkxchDb5LzXKRBKck5xgSHC6/nHSN2s2j5PkjRPYDjDYxUNU1g5aH7S0CYXzga9FBnFD6FH9HpBQ+2mAtHsppTG+LldLGD60gb3X1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BHQGzNbckCDFcFX4x0M/BBR/Es+zCT6Yldn4N4EbFk0=;
 b=N5M/3V6S7Am+wSQKLTrwoEhG9qULVxY04iDjRF16z38TzlwUSxnHw/ZeXyqyh8faoEN+nb/SYEX+L9T32HagroASkQpAk6JknDBzkpvAzLuL0zRFEHdvdCLayIykFhT2HMFzumtmsos8rBdyRjtOrq+m0+eYWQK0i+UbG1HBF19Z3Z3Vqe9fddSA/8rEkXNsepqEawz5HgoNiV7mM3gc0FudR/EVyDDGCtgaVER/+68aI3SO0d1QhzbBoymMf8zOs3zxLOKghmr3eF2Mb2EYaQZn7ye7PbNmsqdOlEZgkIM6Zkra/D09WADh++sQPMQDN++MYJKGkzxMBfaawQp8UQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB11002.eurprd04.prod.outlook.com (2603:10a6:800:280::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 22:17:19 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 22:17:19 +0000
Date: Tue, 1 Sep 2026 18:17:11 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v3 02/34] dmaengine: back channel BH helpers with WQ_BH
Message-ID: <apdO5637PNgeUIBC@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <442747fea2d831d2d6257e15a984a494bd7ad6ec.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <442747fea2d831d2d6257e15a984a494bd7ad6ec.1786384168.git.allen.lkml@gmail.com>
X-ClientProxiedBy: PH7P220CA0109.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB11002:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a249c34-7abe-4307-8ace-08df0876c976
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|6133799003|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	i+Ihp8GH94nLUdD2HsJhwlmE8HwFcJAY1UzG6sosrd7ymvMXtIdNq2F1ozFJKk0rPxy/f/YW4IQtYL+S4Jrb8y11TSFLf+vi8yeRnljT2HrSpgxT4MPxuOhgKYkanqXzQclrhtKO+zWtDmm0ipFnOumBiWni4LfAvqwK9iKPT73k5qky0uJs3bkuweNsa8QoyzLSBH0sTR7nkxKhD27Q04G4Ff0JjGz7MX6d9kQDmugn/P/1FvX5YiQWlPPFcWStgWjFz8RSS+A5yiDLpwVXypKpHpfBorVxRzrfwtjzpSGGc3CaWFAxcpLBrLcs5jWaQG+4hn5taMvuYrtUb3Mg8QUOeYeN9zi5Pbe5jpbFaovxlOmifdMNwrUwP4nlmfSpFk/RmVUIh/vzJ9NBYFXZyDi06fL7mhEODdMaSzBVeNuhFY7uQKx+qMTSQJX2SDInogWLUAPImVBTe9iMbniOBumCiLa2TF/IYI6TtGrVaUKoTprfEw5JvvB/DW20K3pXJN7YodwMMXj7K5Dj1QvlVQoDKVceJQIj9WHL3HmW8HkYuwRxg8L+p5vrp1lZEPA5lzdH/srMAVdDEWCTFTcRVZ5iii/4OI8wV2KKg0Z+zen66YvmqU1298yby4AFgrIN0CjMc7w5AnrSNqw55pGiere/2uCMIUvLuBsIQQZHPyQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L3Ftk+Mkw6DtEP3CbD9RCGylJDeyazXgwaU3wMmPI1YapJENv9wtJqYzbIwI?=
 =?us-ascii?Q?aQqQQ8d8h5DBXQSgcpLusbNdm2q7E3gK1HebWusnGFlhEFTHhItTLWeaRowM?=
 =?us-ascii?Q?9NJ37RqrW3Ax3Tx1YNvGMaOFG5VleT/ArhBayyx0+AnffmOdOlhDqPJgvTtp?=
 =?us-ascii?Q?nscCjzpw0Xm3s9FgknoRuRZeM2sQrInCGS4K+zy441rX7Tp/4lrsoJssq2uZ?=
 =?us-ascii?Q?lRTHvlcP2Dfl4YMu6B/7nGtOpuOywDUG37XaR2fLEWgXFW6E8dvzldLPfjdV?=
 =?us-ascii?Q?lnYo6ut8NH8QyhJhyaprZsjVJCWVhHxwFRRVetOgVoUMju7ffS4F/ptz0H+1?=
 =?us-ascii?Q?/FrSbFStI02iXsoVtAA8+lNh+/jCN3jh6hWZyzWowXxr0lpuvnQRConCaaC2?=
 =?us-ascii?Q?1yAoenNMnXZ/FzQYAi8O6/tVhxeivd54VOXgQZw99i6SLl3z9Kg3bwA/FX2A?=
 =?us-ascii?Q?eO46n5WlCjCnJNB64xzE465MJi6GvIDYWNdmCrd1745iqlMumHlqZeFm4/DK?=
 =?us-ascii?Q?Bl5pmt/j1FpYiJ7NHuL35KfMvkD9jmkDKPA9yGrtpgDK8JIx43JKISd6XyxT?=
 =?us-ascii?Q?TxckHp1aUODDXwbAiJrJcv2EnTgbRpgGqqNq8v3IeiGEcADMuo2s1gEcuxNu?=
 =?us-ascii?Q?uZ+y3iYLRmz8BrI1YDHFeMY4k0Prp+hq/m6gQwwOzBRG6xgULBOitmpVwSih?=
 =?us-ascii?Q?vBYSWsGf4BfFmEx5G/DesV3Ejw4wsq6JJ7elVubK8qTBW1bwWAlfYWZUx4C1?=
 =?us-ascii?Q?PyIxDHi1vjxlDudeWjueuxdTpHaV+FudVFLLz4wKJ8rpF4jIj8qW2SQZ2+7J?=
 =?us-ascii?Q?5bbEzj3FW0H+4HbmyHIm47i7Ts9UJV8Z/7EP4LLK8yPDewj3au9ENT7ZhH1U?=
 =?us-ascii?Q?lTCVRx8fQfnDGJWSUQikPeYBtF50H5kXf/q8HYYAeayZPw2RBp00DsDBRaH5?=
 =?us-ascii?Q?e4owdI+NY+YE1A+mXgWdMHI7klM8+sUGIshNUF5O2pWYxxh2FrMCbaPWZ1C3?=
 =?us-ascii?Q?j/i9ZJudKVgCvmyAxV1f81psvlHCkXaQUmF76VK2squSfXXYvHEWZ2e2iNwv?=
 =?us-ascii?Q?EpxjJWUJofbZIZAF2L8G6dJaX1cZuFBOUriuNAGPxPhLaizAryF+EU9EQMhU?=
 =?us-ascii?Q?5cPrdnwJr3rrh87+v7X5V94WWJe1rZx8DWh8i5wmCXoni6GrKlLTQfp6Us1g?=
 =?us-ascii?Q?a2iHVAs56mEMMx6BZ7YCYNASj/D6p5hZFGSBDYWH083m0Zcap6I3v6g9WWEE?=
 =?us-ascii?Q?goBmmrYMjCXFe5MJHVHCUdoczozyS1fu1jHQlL0f/VGQscyTFIaWuPNAjQGP?=
 =?us-ascii?Q?JXyuTss9uN1jAKWxtIKAmotlHwShi4UTsfAzxogGnQHyaAIeliIXs0zK5J46?=
 =?us-ascii?Q?V9WCXureAsL4d4TnamKcYYHvLKvAKz0j9CTqKX7dTrcRqEZJ2VcXioWtMky6?=
 =?us-ascii?Q?YQoDrM/c+bB5cmqTG+J5GdjDqynjOeNlP1Ow9kBdK1dkI5Bo9fUe188yCfRw?=
 =?us-ascii?Q?5bOsL4NuS3Jj9qaUkuVxZi9mjuuyqdb5FxcyyUhobaxsDSfAZHKCVW9z0cOL?=
 =?us-ascii?Q?GT2iE4bFaGqKUbB4VAhrG2uwnGUTxt6Y0Rwglos0KVCicwDAtVUnJnR6edbE?=
 =?us-ascii?Q?QohSdHhjaE+JvvdjWR4u/nZ2VNz3mVuQx/qrH9jFm+bL3jjMR0dMrxCbDIzl?=
 =?us-ascii?Q?LuxzPjtpGd2zjJ6Xg4bxAVuva7wLf3QvqGKe0T352amSyrZO7z9G5FEEB9DY?=
 =?us-ascii?Q?d326iI/EkDnX364G1IAyVZI2uvceWzSkbmaNXPxqxj2UEVhjGUxx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a249c34-7abe-4307-8ace-08df0876c976
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 22:17:19.0737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TmzHdzycvKHftdh5936par1m29i+ldn4ehQA1BMNUyRynukZQjXBlkxiYjkEgcieArAra6X2MUgw/NnC95VjDAC33p1Zn4wzszmt/LSRNxpHqPgdu7gyFIDbhuPxV3dk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11002

On Mon, Aug 10, 2026 at 11:09:03AM -0700, Allen Pais wrote:
> Replace the tasklet implementation of the channel BH helpers with a
> dedicated WQ_BH | WQ_PERCPU workqueue. The public dmaengine_*_bh() API and
> its softirq execution context remain unchanged.
>
> Keep the workqueue operations internal to dmaengine. Drain scheduled work
> in dmaengine_kill_bh() to preserve the completion semantics of
> tasklet_kill().
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/dmaengine.c   | 59 ++++++++++++++++++++++++++++++++-------
>  include/linux/dmaengine.h | 10 +++----
>  2 files changed, 54 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index d8fc7eb71b48..e00f73a18e99 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -54,6 +54,7 @@
>  #include <linux/rcupdate.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> +#include <linux/workqueue.h>
>
>  #include "dmaengine.h"
>
> @@ -61,6 +62,7 @@ static DEFINE_MUTEX(dma_list_mutex);
>  static DEFINE_IDA(dma_ida);
>  static LIST_HEAD(dma_device_list);
>  static long dmaengine_ref_count;
> +static struct workqueue_struct *dmaengine_bh_wq;
>
>  /* --- debugfs implementation --- */
>  #ifdef CONFIG_DEBUG_FS
> @@ -1428,9 +1430,34 @@ static void dmaengine_destroy_unmap_pool(void)
>  	}
>  }
>
> -static void dma_chan_bh_entry(struct tasklet_struct *tasklet)
> +static void dmaengine_destroy_bh_wq(void)
>  {
> -	struct dma_chan *chan = from_tasklet(chan, tasklet, bh_tasklet);
> +	if (!dmaengine_bh_wq)
> +		return;
> +
> +	destroy_workqueue(dmaengine_bh_wq);
> +	dmaengine_bh_wq = NULL;
> +}
> +
> +static bool dmaengine_queue_bh_work(struct work_struct *work)
> +{
> +	if (WARN_ON(!dmaengine_bh_wq))
> +		return false;
> +
> +	return queue_work(dmaengine_bh_wq, work);
> +}
> +
> +static void dmaengine_flush_bh_work(struct work_struct *work)
> +{
> +	if (!work)
> +		return;
> +
> +	flush_work(work);
> +}
> +
> +static void dma_chan_bh_entry(struct work_struct *work)
> +{
> +	struct dma_chan *chan = container_of(work, struct dma_chan, bh_work);
>  	dmaengine_bh_work_fn fn = READ_ONCE(chan->bh_work_fn);
>
>  	if (fn)
> @@ -1446,7 +1473,7 @@ void dmaengine_init_bh(struct dma_chan *chan, dmaengine_bh_work_fn fn)
>  		return;
>
>  	chan->bh_work_fn = fn;
> -	tasklet_setup(&chan->bh_tasklet, dma_chan_bh_entry);
> +	INIT_WORK(&chan->bh_work, dma_chan_bh_entry);
>  	chan->bh_work_initialized = true;
>  }
>  EXPORT_SYMBOL_GPL(dmaengine_init_bh);
> @@ -1456,8 +1483,7 @@ bool dmaengine_schedule_bh(struct dma_chan *chan)
>  	if (WARN_ON(!chan->bh_work_initialized))
>  		return false;
>
> -	tasklet_schedule(&chan->bh_tasklet);
> -	return true;
> +	return dmaengine_queue_bh_work(&chan->bh_work);
>  }
>  EXPORT_SYMBOL_GPL(dmaengine_schedule_bh);
>
> @@ -1466,7 +1492,7 @@ void dmaengine_kill_bh(struct dma_chan *chan)
>  	if (!chan->bh_work_initialized)
>  		return;
>
> -	tasklet_kill(&chan->bh_tasklet);
> +	dmaengine_flush_bh_work(&chan->bh_work);
>  }
>  EXPORT_SYMBOL_GPL(dmaengine_kill_bh);
>
> @@ -1666,15 +1692,28 @@ EXPORT_SYMBOL_GPL(dma_run_dependencies);
>
>  static int __init dma_bus_init(void)
>  {
> -	int err = dmaengine_init_unmap_pool();
> +	int err;
>
> +	dmaengine_bh_wq = alloc_workqueue("dmaengine_bh",
> +					  WQ_BH | WQ_PERCPU, 0);
> +	if (!dmaengine_bh_wq)
> +		return -ENOMEM;
> +
> +	err = dmaengine_init_unmap_pool();
>  	if (err)
> -		return err;
> +		goto err_destroy_wq;
>
>  	err = class_register(&dma_devclass);
> -	if (!err)
> -		dmaengine_debugfs_init();
> +	if (err)
> +		goto err_destroy_pool;
>
> +	dmaengine_debugfs_init();
> +	return 0;
> +
> +err_destroy_pool:
> +	dmaengine_destroy_unmap_pool();
> +err_destroy_wq:
> +	dmaengine_destroy_bh_wq();
>  	return err;
>  }
>  arch_initcall(dma_bus_init);
> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index a1437bdbda9b..9f1a5405f6b0 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
> @@ -12,7 +12,7 @@
>  #include <linux/scatterlist.h>
>  #include <linux/bitmap.h>
>  #include <linux/types.h>
> -#include <linux/interrupt.h>
> +#include <linux/workqueue.h>
>  #include <asm/page.h>
>
>  /**
> @@ -339,9 +339,9 @@ struct dma_router {
>   * @router: pointer to the DMA router structure
>   * @route_data: channel specific data for the router
>   * @private: private data for certain client-channel associations
> - * @bh_tasklet: bottom-half tasklet stored per-channel
> - * @bh_work_fn: callback executed when @bh_tasklet runs
> - * @bh_work_initialized: indicates whether @bh_tasklet has been initialized
> + * @bh_work: bottom-half work item stored per-channel
> + * @bh_work_fn: callback executed when @bh_work runs
> + * @bh_work_initialized: indicates whether @bh_work has been initialized
>   */
>  struct dma_chan {
>  	struct dma_device *device;
> @@ -367,7 +367,7 @@ struct dma_chan {
>  	void *route_data;
>
>  	void *private;
> -	struct tasklet_struct bh_tasklet;
> +	struct work_struct bh_work;
>  	dmaengine_bh_work_fn bh_work_fn;
>  	bool bh_work_initialized;
>  };
> --
> 2.43.0
>
