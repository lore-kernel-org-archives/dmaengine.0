Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013050.outbound.protection.outlook.com [40.107.159.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87886347536;
	Wed, 19 Aug 2026 19:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787167764; cv=fail; b=sefJlcsMEYyFNvsuQZdsCA/DMdloApbRavu/B5Ph2x0MKP528vtbhURljQvFGxPS1OMEXBPki63ZWuLyp4PS8MPyPNKReJmxLV/iGIm1IuNxqD9mHQAdHZDPo2j+cny2HqSRTISVwz0Cn4IDXEB0nDSEqYo9s4JMHqqJ8gXmol8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787167764; c=relaxed/simple;
	bh=Xr7PrWGqxCHbXOwrtkEb57sRiS0hvIhU08T55uLg3os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rwrxWX/qDXpVjUejaIjn3isdAs1weDp408K6Gv/ovAhWaYQaMvN3eSYlYHm8FTKjdta4BK9x1GQLVNz8oGMHZ83DD2UBxl4YxrT7LhbjOPOQSV1zkNAe7O1QXPsJlMWLTSQWsmukrW/6fRbIqv8bBATKS4mdxI6znSGbeFMytxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fgZWppMv; arc=fail smtp.client-ip=40.107.159.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fgZWppMv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X84X4hDzABlVbbz5sfWk77Sd3pnpiIg+Xq91lQPlu4uDnCJ5dPDFCKA4X8w/dV3x5eOJR8zIHoLmFEdnq8W5YHiw62iKAIqtH12hrqEFVOr2hWSTxX3TzGyi/1OpKaZ7sOHhm0eKe10zYJ7+WZrQyLrnTy8+mb5XZZ7e+Eynj4oH3ER5F+HtrjoxamVwx54jQyBmjg9u8OiJwHkCl8TaOiEYVXgoNgU4+WSnpc5ET2TZK4Dz+XNdcbkZyhqptTtzx2D6jEdeXtGo25qiHkb0SIx4+/P7w9Go7VCyCTu8JpdEwuQmDTPZtpx8p/qrA8MeVPOHopLmj4NJ9ncaRNYdNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExplmZ7AQOQInJedU4ecDUh5vuL5CTj5vm9a3I8DeP8=;
 b=E3MHgMTYnq/ny2enJHDYSoOHaWfLuWyQ8Wi9r4rqIPIp2d0fDrZvRRKaetgZb3Z/7h3EaDV51hP4dqj6fRrAuJr7imkVBKd67higPSGdEABqeSPvtJLd8u1vURjiZp5l41i8EXG50vgD6eNoDN0GsBnmE0ncwnXRQibgQ3P49QyEMYADJ+tEzT8m083jfBQSPeoNT1raNYK9ZKLxcCPSCJ8mf4CQtmeqScDhDUS9ggjotKBjUW+yLDP85LKRvNcF/SmS/telSr17LW++irPa4tp23jddws3VHDL4qrr1GpnxQyt70Tx3OmaR6rtptX9ym99UUnv9sGmwDfG1ZroroQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExplmZ7AQOQInJedU4ecDUh5vuL5CTj5vm9a3I8DeP8=;
 b=fgZWppMvOoLalguS4Felo8olUJfpFspwkiEI3BnsNZpcDMUqMf9m+71acK6aAi5KvMtxBGOHX5SZeE1xHsZH3fECQzl3ywUf0RJhLhSYhcQfl3/U+72MePRAc9pLmrzFoNZAh5VS09BbPH5ZlLFhdSqbRhng+gGuTazWbIi0W1fNtTzHFqTdmmItDvQZP/s/ZCEZGuXi+GqJbJsIxG2VDgCv+hperAbr5yOzehxGbsStIztSTzX9sV1cXFqSznqlWcuB3vMdPMMP+Mo6Atzb3s9dOsE2U+gMq9oJLxM2j3DsV0S4rGHMWjPDK2JdADAt06KQQ8VjaUJK1kKlJ0h2Sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB9271.eurprd04.prod.outlook.com (2603:10a6:102:2a6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 19:29:19 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 19:29:19 +0000
Date: Wed, 19 Aug 2026 15:29:11 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Ruoyu Wang <ruoyuw560@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org,
	orsonzhai@gmail.com, baolin.wang@linux.alibaba.com,
	zhang.lyra@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: sprd: Fix runtime PM reference leak in probe
Message-ID: <aoYEB1r31uQ2Fo9Q@lizhi-Precision-Tower-5810>
References: <20260813153149.3953497-1-ruoyuw560@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813153149.3953497-1-ruoyuw560@gmail.com>
X-ClientProxiedBy: PH0PR07CA0032.namprd07.prod.outlook.com
 (2603:10b6:510:e::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB9271:EE_
X-MS-Office365-Filtering-Correlation-Id: 73d59a89-4982-4e1d-e866-08defe2829e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|23010399003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uELD6iflZq7DuEv3niZAICSftPvdmRIzUk8ZjY6uU16ILoZ3lT3fk4np7Bg7sQEIVw28kuwqRGITxKXo30e4AF+QXwKyjywNU+BJvWtqBOQIKtWWAS0SJhdaPkL9lfQN4QIXrZji2ShiP8re2Ivrc/KFYg7m/brOUUK7Li9c2IWYKRGKfoCe/rszdQMuu4GOUEv77JsjNehKwo8F0LTJz41wIddYgIqLhkSylJ6by+CsEwk3mrwXFl4MB9Afy1/iBdNEuEjZf9ckuuoowUuLexesq1hNldfGyN3dCjo9bctNs6bFR+529Jksk9o45qHpM9IO/UvW6H8QfDPYbTa6V+ZZcgoIc4IQMLSmbAFtbfBOhnXpXT9X0X3w92FGnj8S/Jn180HzTqrZr2ojDq0xcVrohesDRMrZe6U7+saZOzSZJshb4q58xrm/UTj2DFobK5KZMOToBhMk39/dg+/Z3ekC0MXGp0eswFThsA2xgDoB0CFre8kuYZaEcoAFVT9eMVU59UvcMrrftYwP+qpxSuLpXNwi0mEn23ffktZVR56BoB4P2I/dj8D2TniDebwU2f6vAijGUMz47orbER8kJSr5Eucq1LP9tvKe65aGOLUx82I5nZIQRgW/lCM0SX/TNuZwFAxtODzpZa8hLKg+l/fEPJ67s0uLUGZ7UH5rF4s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(23010399003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EpjmPsTepcOsaEYnMFKxKLLVxNc0N3D/Qk+hqgMPueLTgsdm+RMQ7sbKVVFt?=
 =?us-ascii?Q?LmiRTfR0PEBriGlFh+KAJbk7Mbe0iqkrWFA74TeVx5h8qxss127zp9B08My8?=
 =?us-ascii?Q?rwYHyGPuFkae5tcXWnSMzIvIAOliD1poR6Hv2uqjkz5LOEwOseDUgy1gEZVU?=
 =?us-ascii?Q?lh7C+r7uQ7dkrL7fbLVPhXoP/LAjsFIfrfcQLaa4mVnAzzDrbEhKrQL0keLq?=
 =?us-ascii?Q?SYld2pbvjjqFudrNaCIdNoVS5o+NMB1QCluMBhhK8rEa1uTVSA6NK7teKE1a?=
 =?us-ascii?Q?pzKsR5r8V/bp2G4vwP8gAJQi+1kM0Clh2fNhDj8LifWeREVHzX6BbsAvvNPh?=
 =?us-ascii?Q?5IDAEa9mDsXVVkQKh2u9wKZQZQOYP1qgnk3mL8gdjZz3NNr4N868dYkvACLH?=
 =?us-ascii?Q?O2SzRQVhUBnLhtDx1YChb+1HpaE1w7Whyb9snPgzZsItGdVzYk5QGJFBhbdE?=
 =?us-ascii?Q?bFQcAkUrj9Kl/FF3FgIY0nKjsv85mUtCswW4grQn35kZxqUE9W/dkbY8uTQ9?=
 =?us-ascii?Q?9A0PEqJE+rp/VW8pj8Myc1V0Nea6bCgxkb0j5O3NngKAh1vX1nTW0qUhMIaV?=
 =?us-ascii?Q?4vhLwwuWjziAsTijcR6B8o3O7HxPXase7WQ/wHf8PL5dx9rhOXxHjIXl8kXe?=
 =?us-ascii?Q?DCEwS2UFN5jUn/08DSb/U25UvRnmTAgHvttYqchONeR3Mb3cJDXUpXQIramQ?=
 =?us-ascii?Q?lNIeIbCoz1yvU6n/+RKMmy/keKCdQNTHCoAJCGeVDuKPwne9IU5MSE/MbSV+?=
 =?us-ascii?Q?WXPeY7PYSmkPj23nUuNhH0RVw0gbR/S73a1cxkNCpPoPvDG2Wp7W8zq/yW/D?=
 =?us-ascii?Q?LtMMnMN6x9tThRAXLYGZ+Rv5+Czw1tqgVJGepdvLprQbD4vSCn79jUjVh1gY?=
 =?us-ascii?Q?01bbyipgAiupibugP3R7hpugqXLS0GAy6pX2+YYM5+Mi6J2GHMNC8XPoOEEK?=
 =?us-ascii?Q?VKu9PCVONiehNPWTwHz5865sZYoFH8N9A8c9eiJXR8z0/Yx51OYIuoQo51O6?=
 =?us-ascii?Q?mMKYo6DK+ruRmwU5wAPkiDvMjDSwJbucfmfkHrT20GLRRjczJ7nH5OqHed+R?=
 =?us-ascii?Q?bb5+AlQyfuDWDRDtYjzot8+lUNiuzkyhRUCxJRZyp13vti1CrGDYxRpG3QjE?=
 =?us-ascii?Q?y5O2YRWzRraDONof3aD36EvU21BVEKdFoEXqbYo6N8QScFKqe+2a0N10lHl0?=
 =?us-ascii?Q?D0mAc8nqAMxUhGsz0nsQenN+NxIAS4PMD4J62oEmzFzHW3sjUvB8Og41/G66?=
 =?us-ascii?Q?0VLHoUof4C9/ZnEzYJYOxGTvBndnkD8c2Z2RVP6wV9dVZV2qGpbTQozQlJlk?=
 =?us-ascii?Q?eF/CGAAAZu+8+3uHHVTf1K71lWYNr/HgIdzypuiRmlyWe7a0b+owtwGV+YpK?=
 =?us-ascii?Q?nCY5rSXR2jTY8dKcWDIFEcVQhn0fgaeC2rmn5XdOW05WGqdVHMV50bcQoglL?=
 =?us-ascii?Q?i4bZFngtdX9nqe3B4RsK/0u5NjuYo2NvdTHi/54JSHzy1lzsUFE8aD2xFRpO?=
 =?us-ascii?Q?y5ohVwJXpnI6swH4aeF+9YK9fPRHSHQoY2VMnBI1iphcxqGKeb4L/AznYPeg?=
 =?us-ascii?Q?20e8AYkESF5D9o2+7YfN8xN+fqfJDlKZt7IsZTWmRyNuYLJWkYwIheyB5GjH?=
 =?us-ascii?Q?OjBgGoZzBLqA3YGXe3buL3BYLHt05nMwg7Tc9yGTuGNC2iBZyxiGJ8LpfBQc?=
 =?us-ascii?Q?sk+MVtFatkO4sRwnSS/3iTUk4ZwqfbqKjRBL39toN5mcuPBmTXOdUQB5LuB7?=
 =?us-ascii?Q?f776ikRQTc7cOhNdW8iJk4uoETzomA/M8lBlUUksmmzVYYfXNzTh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d59a89-4982-4e1d-e866-08defe2829e9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 19:29:19.0105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ps8G0cfPQBX/7J+qvvwJ0vN/cOw4QGl6R3xpUhcdZDLja7EEFyuqQNsNyN90AEIsmBh2sYiLzu8jMPazXjWNA16WNvNYzp9cBXZzb0wq7cymtBkP9/uXWrwRAKTAUq6+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9271

On Thu, Aug 13, 2026 at 11:31:49PM +0800, Ruoyu Wang wrote:
> pm_runtime_get_sync() increments a device's usage counter even when it
> fails. sprd_dma_probe() currently jumps directly to controller clock
> cleanup on that error, bypassing both pm_runtime_put_noidle() and
> pm_runtime_disable(). This can happen if the preceding unchecked
> pm_runtime_set_active() fails and the following runtime-resume attempt
> also returns an error.
>
> Enter the existing runtime-PM unwind path instead. This drops the
> reference without idling the partially initialized device, disables
> runtime PM, and then releases the controller clocks. The success path
> and propagated error code are unchanged.
>
> This issue was found by a static analysis checker and confirmed by manual
> source review.
>
> Fixes: 9b3b8171f7f4 ("dmaengine: sprd: Add Spreadtrum DMA driver")
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/sprd-dma.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
> index 087fea3af2e411..19b32a23c882de 100644
> --- a/drivers/dma/sprd-dma.c
> +++ b/drivers/dma/sprd-dma.c
> @@ -1212,7 +1212,7 @@ static int sprd_dma_probe(struct platform_device *pdev)
>
>  	ret = pm_runtime_get_sync(&pdev->dev);
>  	if (ret < 0)
> -		goto err_rpm;
> +		goto err_register;
>
>  	ret = dma_async_device_register(&sdev->dma_dev);
>  	if (ret < 0) {
> @@ -1234,7 +1234,6 @@ static int sprd_dma_probe(struct platform_device *pdev)
>  err_register:
>  	pm_runtime_put_noidle(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> -err_rpm:
>  	sprd_dma_disable(sdev);
>  	return ret;
>  }
> --
> 2.51.0
>
