Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428574229A2;
	Fri, 18 Sep 2026 19:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789761481; cv=fail; b=KcvGhBXKJN3k00JZ2TvGFb7d0BxAIPYxGTLJPgtSKFhwMFiJRuMfyKUPyapimEmTd20evfHVwioqVprzdsHLba+6Qj2swoFI55yL1rnwM0EgPmYDTxEY4UgXP5cOJz5BLLUsY84EBM8O9A2y4zb5U7NvvJVDoXymC6lCJUA4AYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789761481; c=relaxed/simple;
	bh=1QmoNGYqpJSMC7YuJQO9+oWVNWwSrVbw4ZyRaJxkY18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Aicv2BKdK+lU1wHg3B3vqVauJ8wMVVymj9c+4BWTT8+uE6UVu2oCA+MfSWs40QDqjcvTXFqxuky3voohLxhW+A/fv6h6jKjuXYeop1K/6BIjaYDZBUjQDj25VrlpiQQCdMlJ61F7IvwTovGqtEjc/qfiV4vNtLJR6xii6QFgr9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KKltAXBs; arc=fail smtp.client-ip=52.101.70.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KKltAXBs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s/hoW9eWZpZ07hi/JYz7mmXVNPcDJ7KszLHeMSAsXJdD4IIrIrIXpM111yKcHiu0k0gua2kTTvMvC5z3IRxUTdd4dRjPqmOZB0F+rEPa1Xvooox3oAZdubfYby/n+qlkzpEQEoU9nEbcn0PsQzR+d3sJS1FV0vnSx022p7g1KbLep4NgLaAynydnX36QmDZwu6VzxIh+b2LU8JdIpmq/WKfRk/nzWHXA1SeNQx3TbXt1g0Focoy3/Hrw7zU4VcidcNVy64st8PgFk44zfplYoX7pyDKcbZZO4Fixer87ifSi+0FduPZe2zY1ayc0UeNGpR31TtHGHVmQNLCYtpzo1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgC8gITPVNOKfNJ5pT7GwTAbzTCVMFagAkwMrOwaRLs=;
 b=O2OtUqB9L3RZs/mInnYNyTJi3RYbZDngUL+jiGiRwOQT7i72Vh5ZjLiln2ddqiswDNmdwjvGMY533PDb64f8+09zJ5wYvz2lopb/N1SCg4TISL5KVQupX2SG+36SvI71Y15dh++JDcelabU6pQBvygrh1I3LTKS6c4PmEp+gU62n57z403+gyQF1cyRX7pO967TyZjvRXWPcS3MmlhD9DHsTu65EH92HAbb9X4p0Ay2rUxyxoENBBAAh+2tFf0YpRPIFG2pt1gHNB7+/woQVFzJdOczEpO63hNptSBibNWIrqenx2bZmd5Ao0w0anKuk7AKBqklaaNYq7wwLVvjzRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MgC8gITPVNOKfNJ5pT7GwTAbzTCVMFagAkwMrOwaRLs=;
 b=KKltAXBs8tvWrAYBYd9ciL0AZdCOn6f2Oxj+7P50T8s+XjpK5ltZQ1Km55bPGTq81X6uO5kZ9EIgz9rZ0ZBzIgyZ4tl/BJ13fQxooDBFQkKOndaT/aYPlI3/Udc9evWkABpMpDtY8VNpQzH5or7iI+xFq1NytHeUg9LdU5lHGs8lANd6fB1kAkuqCdU6jttIZN7KxT4vQmf2IY8pf1YLDdTo9WPgzOt3VuvVapWbLQF+SLkxd3WsygNn/iM/CRCiK9vfo2nuZXThHUjnO3QcEfAWVd458vdbDhyEVkHtanqxti4bTbKA5dsrfw+hMvs0Eo68S8IKky6+pV1gaKSULA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MIWPR04MB098240.eurprd04.prod.outlook.com (2603:10a6:290:ee::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 19:57:43 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 19:57:43 +0000
Date: Fri, 18 Sep 2026 14:57:35 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 01/22] dmaengine: ste_dma40: Fix physical cyclic
 capability
Message-ID: <aq2XrwzJDF8yZCbz@SMW015318>
References: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
 <20260918-dma40-fixes-v3-1-8dd8450669e8@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-dma40-fixes-v3-1-8dd8450669e8@kernel.org>
X-ClientProxiedBy: PH7PR17CA0059.namprd17.prod.outlook.com
 (2603:10b6:510:325::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MIWPR04MB098240:EE_
X-MS-Office365-Filtering-Correlation-Id: 1224b770-46fb-40d0-adea-08df15bf1a46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|23010399003|1800799024|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0maKv3ZAS6lC966qlxsHfg7HK4yY17g3yDRmbPiYTTGUQvXz8rKt4n/Tyi7+bnS7vyjFIvqpanLTDaE8Zz/JXY0oAPEEr21nNEBr2VGvQUkfFlLpVhL/rW/CS6C3ovIH8EtGxxnPSNVeO3exkbSw7cReUf8o0Ycbd9/B9XQh/b2BMdNQlk5PwojCvM+U8z1S0dcUga4jW2rDCYoaPZT35AJiNi4j+l8Z1f2FofuxOYtEYz5AAaibnkCA/pFoeQtwLgY+JuOJ9b3lSTofGd6L+50E1BmWzuLF44LMpUvHmbhgGTYDYQo5/l0src6+HasDvCeYTzLWg8Iz4QSFQBrFF5l+0c/kJSL8sWEdkVtl9surGsS/L0sI4N7uVNVd5KFwYZwxkBbvQhR2ScGV5ywD8IgmF9i7YCaJrHkyVTSizZLB1eEPPWNA1DtiemfwETtmlLBPI3wQ8Q5bQ5KacCdoNLZ0L1MTL2gRvkuQ4yuDAEG4f7m0i5VzbqF/WFECvjX7iVUcqHLR7uKcImhAlMl6PufFSyc8Ur9c6t2LNmxhGGwAZbjG+hgYlW95cslFPcpj7KMZfeGoXrbutlE2dvQJim/ejiUo7o2QDKeDi7V1woS2spRWhrkGt19DnHb0Py9mHssr6p7FTTamDDF996t3jpcqTMuMBkX/0ZsYa3SLNW4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(23010399003)(1800799024)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pTfkBIQh1ZDqsJ85+YxdIoQgwR4i6CTzAjDDwVm+GiwSDiybRyCSXv+x/tw0?=
 =?us-ascii?Q?ewUYfbTcpHDEqQFd7VldUd/u9q3McQ1ZY2ZAQnoIBXB1lRxyCjKeOXiIKWf6?=
 =?us-ascii?Q?V+KqPgAA+g7BVNw7zfU886RHk6amx8vRayrqSNv+uKFNfIg1OMQr7kgXUNuU?=
 =?us-ascii?Q?rX1p7avfci5lkogtGMWUHhCpunirgNnRYA/jHftTbBfh7coHpYNXV727QYjX?=
 =?us-ascii?Q?6GyPLNXugrWmpd61rI2clj0e1ueVaBTA6ueYILqyRhlwGfyCjfLrMmocYAWt?=
 =?us-ascii?Q?EM9ZMesqHJOf3CYmaLPk/iuiEt5MYVhwjCx12yre8ze/m5R6yAjSq/AnnyfQ?=
 =?us-ascii?Q?W2BuCbnkKwFJfpe8jdiscrGD3RyAz3WJ9tHQhTOlpiMxsE/U4WMsKmFtzfh4?=
 =?us-ascii?Q?D/nF2lpffiHFUVWs5TJZMjeE/2FX4lxkvnit8f+hKEZKHprXgkAD2ATYlpPV?=
 =?us-ascii?Q?MlFXcZwSC25xJOIf4gmnXJtK/23H6yo3pBdlFMI5MTaiGJYMVZzzc1oQj5GP?=
 =?us-ascii?Q?bmKO3fIJPj6ahsV0PEZLCBGRfVjBR8DXtgjf0P+cwyTOEoKX2MadEHxurHul?=
 =?us-ascii?Q?vJicxfRTaRsdYJUiFrSgMgIIgzERDPlDJT/jh/1BHcltZ7NvahrY8MvBawXi?=
 =?us-ascii?Q?Xk0wqk0jUXMA8QFgV8dcTNlATKMWnQV/Hsp5UxNq3LzoJvKzSK9Bqjc2q7qa?=
 =?us-ascii?Q?8u3JR0rVe1oKfIull7PLMv+93CEJL3fl0yqqsBsiwmaXxEmQ0jWJnEs0I8e3?=
 =?us-ascii?Q?7XZcslvE51BGV6y4LrBLNFjLoQrHPNcO4ueVDges++GRY0UI0d+c1rm6/pec?=
 =?us-ascii?Q?9sO68FfZ6iEI0UGynlMIuhOzbAE8VEC/0fbY/dT8Ie5UyJ6PQ9OdKIBWo8bd?=
 =?us-ascii?Q?aUYwYXWksCQHZcDWP7PaQ3vLyHV/xnDH9YJnX598qnF6flfsYys8MAgz/DaH?=
 =?us-ascii?Q?PLsORipQg0/anXdtCs2hsds/XXv9xBUP+tWkRkWMwP6W40dv9OKvj4R7Ti+y?=
 =?us-ascii?Q?xb3JWcblsBBO6BXQnF2fkE/WsUP0MUIJZvzgFxvLGhV5ZoBm6KvfyX/ztABS?=
 =?us-ascii?Q?7cY9HyPuiks3biv8d01FgX5HAYsiNWXlfkb17cDW3zE+jXVew3oK4NqP7QeT?=
 =?us-ascii?Q?KuCXBAfczhCqsfuM52FdgzNJv8gVEFSaZWvK5J9XWrWwMXGiZol+CVKt1DnQ?=
 =?us-ascii?Q?QrgL4zwxkcJJ1SaItRRIlLBsQEZy2oKfnb1cTuotntg6mzpGQAMAlZutQP0r?=
 =?us-ascii?Q?S3qE6K/iO7hWwJtDT5R6+gwypC8E7xS5PTXZ1V6qstFB0IDjwDRHtogWgsc9?=
 =?us-ascii?Q?PnTv2fBrdR91qyDZtzwHkOBhQWHISpoQUxJ2jOZBVX0Y3nLv1xsn0kgLk9Ke?=
 =?us-ascii?Q?9OgHY50LTJSXR5knyS3Q3wLpCpOmZLl4sQTyLKqcTODNTpNvV2gujiMYswmq?=
 =?us-ascii?Q?FBKuvYQOo4opmKMiVZ6/rd3x6rnSOLhzkMrygIL6V3vB7LT5fzHIh01i1/IK?=
 =?us-ascii?Q?jvUnmqOPI0EvXB6+NGQY6WPz1C1P/P64k7Na7Zm2mMn/hImZC5ljrByAMrU/?=
 =?us-ascii?Q?YNXwq+1SmekTnAoi1Y/7+r24N8HYKLk/n8aNyn0k8VbPKsldXd9DZjteOkOW?=
 =?us-ascii?Q?LfYOY4rsqP+2a8CcV09GkaFCYEDYOF8bsuwD+e1aeTcrvkEW0hNG9odT5dwo?=
 =?us-ascii?Q?GZI1lFX2EbJSoXFdP/i9YzU9XQxpQh4+sj68CMeF6wzEUCfvL4T4CUGC+G6e?=
 =?us-ascii?Q?AF/c/ulGuCiSAMmFpRCBrIcOsY8WmY1ZeUaatOu1iqRtpiloqvqx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1224b770-46fb-40d0-adea-08df15bf1a46
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 19:57:43.6538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DrWHNH35yCbRH5d+u7labt7K0Jc+vlre9Yr3cZIE5G8M9NJma4MRU2lveOz0Gji0BAcyR37fPqBIQcVZS9l+kw86cie3XQ1fan/wSUJEWUL9wgh49cW/Yp4MoPu+Kb/Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIWPR04MB098240

On Fri, Sep 18, 2026 at 06:24:20PM +0200, Linus Walleij wrote:
> d40_dmaengine_init() configures dma_both for physical channels that can
> handle both slave and memcpy transfers. Physical DMA40 channel setup has
> supported cyclic LLIs since cyclic transfer support was added, but the
> DMA_CYCLIC capability is set on dma_slave a second time instead of
> dma_both.
>
> Set DMA_CYCLIC on dma_both so d40_ops_init() installs
> device_prep_dma_cyclic and physical channels advertise cyclic support.
>
> Fixes: 0c842b551063 ("dma40: cyclic xfer support")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ste_dma40.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 0d9ffa3e2663..e4d689c9eba8 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -2897,7 +2897,7 @@ static int __init d40_dmaengine_init(struct d40_base *base,
>  	dma_cap_zero(base->dma_both.cap_mask);
>  	dma_cap_set(DMA_SLAVE, base->dma_both.cap_mask);
>  	dma_cap_set(DMA_MEMCPY, base->dma_both.cap_mask);
> -	dma_cap_set(DMA_CYCLIC, base->dma_slave.cap_mask);
> +	dma_cap_set(DMA_CYCLIC, base->dma_both.cap_mask);
>
>  	d40_ops_init(base, &base->dma_both);
>  	err = dmaenginem_async_device_register(&base->dma_both);
>
> --
> 2.55.0
>
