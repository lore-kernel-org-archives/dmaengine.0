Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011049.outbound.protection.outlook.com [40.107.130.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD66443E4D;
	Fri, 16 Oct 2026 15:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164713; cv=fail; b=simjMpVFIzsaDVy5Tv4KLhM/ZRifr9yfWWzFGOODEdLgin7uNhiQ09GZ38uirZ8QQxIP3Bdmg1cs67od1poBP9ytUsi4jtEWLWthIGSZpm/lVTkyHsIi45q+F9N7SIgdI8lvKuWgGERS/snLoi0fezvlUf6qgbH/z5uu7OMvn08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164713; c=relaxed/simple;
	bh=jleq5qRwnwMsosgUvMZmxzmzZbxaHMsDnQnMbIjH/ZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kioHmcGnNOaL5AI5rcBo+YDzZF8+jR/iKrvWNsANzhOvlw3Rsxi7viPEwbR1SJD4qDbI8k/WfJs/KzAhPrVq177slShR8N3tBUmhkkIJJ8jJ5hETaV5QfYMbNTZbOpF10U9vTYgcs4Q1Q4xuBK2V4ymExmvnkDN08n5VFD+5FWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BzlxKgv7; arc=fail smtp.client-ip=40.107.130.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BzlxKgv7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y8rVQKwBzLJNBr8sMgCzoyVAPuyFgyHjwWTilivSDaHxkE5EpTrdvwPvi3IDrvO2tT385c5cTlc3gR2hBEaOFPsVB2Z09bA061XJk4C9U3PdPb0DfgzD0CMqfJmkepjkkTHIVunzx0kylLa1bFaq+G9zbMJPn6ki4VtUWemOQVhTWYxlAInmvRccMgs8rP3YKyBzZX6tcIHzi4WpJgtxNhYuRz/vqthTR4WVg/VYRhaytP6fwavGjd73eLlk3yIIdrTzC8lFwB/SeIIsQguTMOoaqbNG/lu2nSF4DmrhQZx4N5FaGmh6ZwDJ/2K1xtc7pBGOQMYwg1xg55Kigg5oyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DvuIdEFke79uS7AG1Ce1Jlr069ZbZf2umZvsTgLl1Y=;
 b=tF5p9Cofq4a1D3iJqfZszFlPZS9AmXiiX8NzNn3ogbA5JHCWamZfb3vRMf7O3fUf9HzGODZBxTPKLuw6jgRN7chrY7k7ziRSQK3bxoE8+BotYMOKiRKiBbjCg8Pi9Lf/TN4SMzyzbN18NuPiapqes1eR9jF2ZdvoavhjtwNtcmHiUyLFp9rqWZDo8C1LlYEKGg6lYc6Cb2UNokg2lGWBEPOwhe4hwtnMVcNoXQkWmJqkiKOECmwEu+By5Y8/AsozEdJMbIY03PUZtTr3PiWKHtHYBKq2OHxlrUElp8sjS/X9iuUaUflil71wr3CPE6YSUn/r1E+41iTwTlm8AdvpfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DvuIdEFke79uS7AG1Ce1Jlr069ZbZf2umZvsTgLl1Y=;
 b=BzlxKgv7n3T60QNZn4xuaXxP5+ic4uBdG6Y2PGl+LrM1IFO6yHey3VuTI08qK46KIhPaFNqyKeLlX/++zIYGkao2DJupLQUzmuW0hwIuAq26KnNtWi1ewiM2NzTXTVVozCCvu2/cuBqWmjeGz0uuwI6H5EEk0w+DgO48lOySSUTPGtnGJnQ5jTtnutjDeDSt3CHC9bYPHV2Hunv0HN0VqiHtpq/hSAVxRv+smm3obbQMFLPQYc6a4airOoCC1ilxhWkScMsMAYB+MLhKcc2Cxk/7Zlbqk7YU+xu22NrCLJ+1hBBo/Ta5yxN/5HtAxNS4q2vWC9aYbzbHNqO/ZxiSvA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB7092.eurprd04.prod.outlook.com (2603:10a6:208:19c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 15:31:49 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 15:31:49 +0000
Date: Fri, 16 Oct 2026 11:31:41 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Olivier Dautricourt <olivierdautricourt@gmail.com>,
	Stefan Roese <sr@denx.de>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: altera-msgdma: fail probe when reset times out
Message-ID: <atJDXUqsOjtfa6qN@lizhi-Precision-Tower-5810>
References: <20260623060554.13523-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623060554.13523-1-pengpeng@iscas.ac.cn>
X-ClientProxiedBy: PH8PR20CA0017.namprd20.prod.outlook.com
 (2603:10b6:510:23c::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB7092:EE_
X-MS-Office365-Filtering-Correlation-Id: 5afd2e22-fa07-4f82-f6bd-08df2b9a985b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|376014|1800799024|18002099003|22082099003|10067099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	+KOTuQ6Zl26Vhle/cNlpp/x/uPgtdyxDPXroJfkd4sMmDc5L0/CLTxMNYj2h29qjcvauozv6irbQLmDbHCODhyHwpF/1Ttj2or97VhPEnTRHEd9PaXiRzKW5IjZbycUSiDs9wMBbKIqfwNT5O9QJtgbfppBqy9BSHwmO0EmtN48NTNEpg6W+S175zDQYuptrC5I/uQu5yBKFPVZt7X6hUdvQgyz9fercdUZLsZuo+eRVTvfpx29COqUn8qREwrRRTBiZSG7ge6R7XL83PS7+B/VayaIJvLqW4VIGoGkSOEDDjRjCESnUDOFI1UZIVaWqQ0sNfElxFNkMiDz3f5x5DfUVo3M/scQ9zBTZek6TbFyzjyTTljECeebNnmwFlI4yseEpf2PiKDWpsMdU59jVqw6S4IGd8sEP4V4UmAYDD7dJVOFi6TIlo0/ujCqixCEc7BtKr42bKFP+Fv9jYpmdtshN3dNPRZhRz7AfSV717e7ObPuRUf/zF1RmirDID/ouGC52IiBRDTUL/xUxJfI68lTjlkqdQJXhofdhrUH9Kcfy8sc4sKr7jyPRD7XP9PG+0y78ER9RAUuIaO40HTp3P/2QaM97KVVbWfKHvo7BmK6llWYDuaqVY/mtSL4aPiRY0MtFGK4tEVsJAZKrOdhYJQCYyrfpx/A0b4wmJBs6VNI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(10067099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KJHvF0z5dcoSGT8xW9osyAccEVat640mbvZGFGUcG+YML08t0tiMy1okGO7+?=
 =?us-ascii?Q?VRQVPtCZx6g3b5td7FPrNaMbJpbkDWNLuWoFcWrrbRUN76oToosa4/0k4WKf?=
 =?us-ascii?Q?uwRDGjsl6+DydvrI+/7LrYATk1dOWlc9fJHXPuMDQDE85Q9zMUw7jRofLxbd?=
 =?us-ascii?Q?oQSEcfrp3P2K8HwnYMuzc2Bhq9ulFv9RmV2E7AxfcFDrbtM21AR6eDc18cE2?=
 =?us-ascii?Q?BweTU0n4/o9pAyxrzPrSaDY4/xbPYxRqs+eZOdov9iQMt5gqAUXKGDm/ysJR?=
 =?us-ascii?Q?TL31w64YIw9rlDo4UAetY8bS1iyVlkxt0qEWaVWKmxsVYRPeN5rCAfncPbdJ?=
 =?us-ascii?Q?rmJ8/U/0hN0RLKy5dbFdOyjgYBNJdunmCr9sT7RYI3CIygMgJuxj0TjzjJoc?=
 =?us-ascii?Q?YTl7gvBN/XL8pOcWV/1dmwrBhSYjlqd4Nxj2pDvUczgjckgeR9EeChfdGIDQ?=
 =?us-ascii?Q?1enGwL2+kOkOrtwnRMq7WBxCFF3Q21w7SNpLMeuXfUEMKiijVz6YTXTZqWuu?=
 =?us-ascii?Q?95Rg2g8mS01NRIQa8GyscDjz8QQ9ywoZGM6zPTHAQShkRaeIGP22q8hJq3gz?=
 =?us-ascii?Q?VScG31KR8WWmHJxUjyXCsGXqgD/x2V7NSzeOh2mzFVsqt0mLsaDMolBCKQtd?=
 =?us-ascii?Q?xPHrGpius2oIjzPdEteaqzi69k4A3igfYNTHVsl2ULSjaI8Ne0cdkKzuD0/X?=
 =?us-ascii?Q?mUkb11JtFGc+FqcC2Iorwe84sBp1aXm8IOmMF+zuz2EMCaXrqirDCgjedioo?=
 =?us-ascii?Q?jOT2aIXMz1MutJ+u/e0DpxV5zW82HwmueVIKIvpxSYNvWLNqmIwWm86JMvd/?=
 =?us-ascii?Q?Xanmg52Oxj8zC8kzpG6IcNAq8QQgHvWOZIeNB7VnfIx97L+XMKq/lCjIC+ei?=
 =?us-ascii?Q?osGUGY/rEg4rHHUkMqO2uEJl6Je2CCA7vdtNsCyanBKqsu8NVIjQ1HymzGVy?=
 =?us-ascii?Q?RxLnq5ivLva2kEr+N43KOlc/tlRCnjFhJCHuBxDM0tGYsY9c90kGGZb/aCkl?=
 =?us-ascii?Q?BqctA2rdcn7JsTSpPK+bo+maaohuRxnCmPvNk8BV487ZOhlKlrXFuhO80meK?=
 =?us-ascii?Q?qZY108YUHHNArQLpMoUVXTz2uQDrhBpaGGebc6vTr/r/hdkE/60c2BAv+yzP?=
 =?us-ascii?Q?RKdg26Arr77Q7MDoHLe66OGhY1Lb2UfK/q2eHkHd7X2p/xhRT4zJJTJlYhd3?=
 =?us-ascii?Q?zhqc2Uj3WMRSWmIzOh7Cd1ZVESDez7wsaq6zBwdYPeOZZMaXSrsZ/wlIK+Kd?=
 =?us-ascii?Q?+MLedOc7qWlCQ22VQdw5l1AoNd57mTOSukWiapq3oN2uljQAsxt2JHCckvyH?=
 =?us-ascii?Q?WCXJGJ2v+PLNAfFtzgkTBkYm5r5iH7XytHVfncdmKvfrHvAYaKI6+2Z0cdPd?=
 =?us-ascii?Q?23m7t1aSReUFC88IDdCEbUHUq6O9i9hVChBPxvAUZV19zYI/0DUI6QYwVRrk?=
 =?us-ascii?Q?mC5uNe50nj6LoysB2fh1ucb5fzr5QSgvPW9bHkIt1tuYMNmzX+yJyT9ebF2K?=
 =?us-ascii?Q?borz/8FP7tRPmDeLfePDfn5Zlfzeb18V7/GEwQ9dbj9ka0WDXM+ABSCznqiu?=
 =?us-ascii?Q?4gNhxuCWwE4uiDb9/pNZGkWI4X7T1vU2rdtUF76B7HyeCl0hA1Ffxdr0wBMn?=
 =?us-ascii?Q?ABVFBhZB8ld/Mtxpx3LRJJGiq79sim2DgiTan+41H/BZCptMk1bp73IcW9wP?=
 =?us-ascii?Q?Whlu582i+JpYpyv5dsA9zHL9YDcBGiJDqVNJgcq0ALpyq/S3EHywD21DS62T?=
 =?us-ascii?Q?83eX3mqhGQYK2HrUckqBTFabsXtTnjTZwCIze2elKUTzvw3xUu0m?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5afd2e22-fa07-4f82-f6bd-08df2b9a985b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 15:31:49.2505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: quRIMbRMjc0xK7dzqkmIyNO0uCtQ7THH4jXvT4v+z/5EaM8XCHKHbWBDhpNiiR9gaQfJjR0hQWM4q8DMNGvC1Tdz4luI4MJ0ABjHcDxh/ehuDw/vzzpkmq74NAqScvl5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7092

On Tue, Jun 23, 2026 at 02:05:54PM +0800, Pengpeng Hou wrote:
> msgdma_probe() resets the controller before publishing the DMA device
> and OF DMA provider, but msgdma_reset() only logs a timeout and then
> continues to enable the controller and mark it idle.
>
> If the reset bit never clears, the driver can still register a DMA
> engine backed by a controller that did not leave reset. Return the
> readl_poll_timeout() error from msgdma_reset() and abort probe on reset
> failure.
>
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/altera-msgdma.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma/altera-msgdma.c b/drivers/dma/altera-msgdma.c
> index b46999c81df0..f60a4e86a246 100644
> --- a/drivers/dma/altera-msgdma.c
> +++ b/drivers/dma/altera-msgdma.c
> @@ -466,7 +466,7 @@ static int msgdma_dma_config(struct dma_chan *dchan,
>  	return 0;
>  }
>
> -static void msgdma_reset(struct msgdma_device *mdev)
> +static int msgdma_reset(struct msgdma_device *mdev)
>  {
>  	u32 val;
>  	int ret;
> @@ -478,8 +478,10 @@ static void msgdma_reset(struct msgdma_device *mdev)
>  	ret = readl_poll_timeout(mdev->csr + MSGDMA_CSR_STATUS, val,
>  				 (val & MSGDMA_CSR_STAT_RESETTING) == 0,
>  				 1, 10000);
> -	if (ret)
> +	if (ret) {
>  		dev_err(mdev->dev, "DMA channel did not reset\n");
> +		return ret;
> +	}
>
>  	/* Clear all status bits */
>  	iowrite32(MSGDMA_CSR_STAT_MASK, mdev->csr + MSGDMA_CSR_STATUS);
> @@ -489,6 +491,7 @@ static void msgdma_reset(struct msgdma_device *mdev)
>  		  MSGDMA_CSR_CTL_GLOBAL_INTR, mdev->csr + MSGDMA_CSR_CONTROL);
>
>  	mdev->idle = true;
> +	return 0;
>  };
>
>  static void msgdma_copy_one(struct msgdma_device *mdev,
> @@ -896,7 +899,9 @@ static int msgdma_probe(struct platform_device *pdev)
>  		goto fail;
>  	}
>
> -	msgdma_reset(mdev);
> +	ret = msgdma_reset(mdev);
> +	if (ret)
> +		goto fail;
>
>  	ret = dma_async_device_register(dma_dev);
>  	if (ret)
> --
> 2.50.1 (Apple Git-155)
>
