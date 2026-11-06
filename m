Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793987282;
	b=ZFog+j/ZahI1jZlVo1RPMgK82CV9waskQfX54+L2hdhBlNFsumb9T5dgoreiFnwK25Rn
	 SfRvfU9yUWyl+OBOZNdfCWFT0KWprTQyNWVDGwiE8ferXWBMguYPRZWkktK/mE9/tAfCh
	 aI8nw51XeS8+XpBfc0rFlBmP7CJyFyxLJkHmrYrH/SFs7mq3SlHBE5J5KyH3DUYClKnkG
	 e8PX2ByVHIWR4q8Y8qxxsLf8dOMzbwxXAr4/+v7KbD2pnNaB7QW7ShPGPd8N+3TF2hBqX
	 Gghfbt3URQQX0KBN/k6IGtnNLRLGgUoSkbf8jLg+2IqQaH+3NAc9cvzsDB1ZY+Tljrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987282;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=B+9VpnrW6UALmewKeXnfaGb89syQlUuMISq/N/hwAhI=;
	b=XCDbAH1wBsuUBrBk16B1aaWn4Jk7YexuCayfc9EGAoNn6mfon19Iig9zPusSUNLThkuI
	 BqvJfDdXUzLDC4VZwIv0SO4IdGtpJqQrGwgaEpaSSFD8KdSd40oO8qbQUin2tM/YQhqSK
	 LXswZL2UgwmOU3ewKn8CZd6O/7CoAOMOHBGAW5G90NAUMeOG+SLbI5H6Ajlytxgm1tcwP
	 s1Lylj0XS6cbdaOsf1tGtudlO0ggsy8FaMDLFUySGy1fKgHgM42sTEwy0U6WCem4pPTaZ
	 uZWy+4uW8SDnvMmgcfvDD79bhtSebHqrA8LsHHE2ODjDF/YMMWva0MJyqhKciPrFnhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="wJSo/KG1";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.35
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011035.outbound.protection.outlook.com [52.101.70.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C04606A329;
	Fri,  6 Nov 2026 17:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06C04606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=wJSo/KG1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SjRrBKNgszoM7AawuSvcGBu13y4ffrYguQ0fS3W3b2Dlud2qdz6lEucaLd5W19qjqS0XLkUZ2Nf0D/bYLDZhSvhprz862lsgxHkF+FG2rwOSvdPqy0p22XhZBSer/mNr45US8kw8JSd2ZMonB7neF7qbBj9Yo3RZq+0mhWv1uuufixF590BxySIc4Cs83yyldii6zuRmnnrgxDThLTS+5dnq+kLHy41VTJSrB5suCS3DlS7xqXouho4paYRYCy+Ax1/kSkBliLahRxU+5A5he3KFJ2g0fwoNLNumLUy3vK9mIJeeDRxi4pxgHrFFOOCe9MfCVv6Kc1gg9HfQD70hXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+9VpnrW6UALmewKeXnfaGb89syQlUuMISq/N/hwAhI=;
 b=r+sxkIcAtnsm3rlVX1aR7mK+oGKxcd/YuI5FKWTZ22R1/whoPDzClSsqdUESnXqqX2h5NQ/0B2Zudr75pTi3zxdUqWnMZn+XP8zzg0SQah/kJhKbPzEqGgIGvoaH+8ETaOUxMRmPnFqmOPu+59qOVNd+BHLfpH2KbBpGZ5mUfngE8tIvxkWm+xARKRgQe3hAudKQnC9z83Om7EOPfvNke76PkXl8X59flDLRQ+6uugxUsVJUJIOvfwPUtFlGkv2OGFAJ/YL+4Iestb4YRm1ZpzEeF4iInCh4YS+G8CNB+HRUuUhRa+/9WxpTvSpPa8gDT51LQHgsinU38REynFra+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+9VpnrW6UALmewKeXnfaGb89syQlUuMISq/N/hwAhI=;
 b=wJSo/KG1+19CXoeYqwrdUqFLoQCWohcnCoHd79x3ftlh5t+I81U3ce2ZSboKFljQY1m9IKZkgdLVvaIohl3WkLiXP4bJ+8BAqqnBJNJ5m31uiihcmRimp6Re+hOv64t/ZwBrq+x02mGBwR2bfggYvIvAPLERDMy+5SdGXQkeur/PSLXjnxdToLGTUlq+fOWI9I1smQ2L4paeATwemXgHZyA10E1Zd8XQhKXtDqTX3NvODC+Fi6VBtwh6sap+vd3vo+M+tuFzo+HNxN5MYHzBt7RjJ59QdxnJSjMXPunODuPRics9li9+zVI/1q97OEcD29D2QlQvq5VcLeeZ6URV4Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI2PR04MB10268.eurprd04.prod.outlook.com (2603:10a6:800:21f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 17:47:53 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 17:47:53 +0000
Date: Fri, 6 Nov 2026 12:47:46 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.li@nxp.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 4/6] dmaengine: plx_dma: add dma_rmb() after observing
 write-back status
Message-ID: <au4SwnmfSotzKalT@lizhi-Precision-Tower-5810>
References: <20261103155202.461725-1-logang@deltatee.com>
 <20261103155202.461725-5-logang@deltatee.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103155202.461725-5-logang@deltatee.com>
X-ClientProxiedBy: PH1PEPF0001330C.namprd07.prod.outlook.com
 (2603:10b6:518:1::1b) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI2PR04MB10268:EE_
X-MS-Office365-Filtering-Correlation-Id: ad680348-d396-4a03-3f11-08df3c2e1547
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|23010399003|366016|18002099003|22082099003|10067099003|4143699003|11063799006|261026121527099003|261021121427099003|261022075727099003|56012099006|261102123227099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	MhCCOx9DBPVUK2cHkcxkb6nCPtrbX20sI7nvzR8GUUyeIIdKvRLY/xEpnrCYivcNUWR543p+0ljBAyJchlQFXbpC7pYhBhZCj0aJvtSCk/7Oes/flpuLNuosKwAINPkfZ31d1zorFvrpf+yoeKTqbcd1iLdO826hTR7tl6r0ynAMhgwDWZW1cpiJXhi2/QyCggsAbqXs47x8kOfmOY87LBhQMDJaQztzpxplUHKgFSGklGKdBRWyvUzIYE6mKkpelxPuulpMXOcJ1IFQUOlQlaqAuuFPn+sCYMZ6PhsRIZGcdbydOmgw5v82F1E6nI8WjjihJJ48oWhH+OBqB+jJrRoMjm2nC1YhMvtMXE1d7R1TI7nb8XEyXnMZgF7uw1RerFoWblvhdQJO/7IXjLCKURGJPK1HCx5sGoXmnQSN3Py/HSOVeMH1sB7ZOJymMJL/IHt/47Yt0406PNiLpiJpAD2261AiQ0XMiInfqsLWqJiDIQs8RuXwPtx0LkbM8aJqSrqkgyssRCNECRWK/jy5FS8We2AXwEr2A6lHxXzKUpGUUo1y85JT5aKgyu3EF2vlPYPffrnyeR+qb91Jn8tyf2ADcGrjH7oFgAXoebHR5j1qXOFQLPVKFeHFofGIH1KH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(261026121527099003)(261021121427099003)(261022075727099003)(56012099006)(261102123227099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vu5fX0AQhd8msvbj0I2st1/cZwkccpqRldPQHFfAeC48m41mKytoDiycdIM9?=
 =?us-ascii?Q?4jFIHThsvWkkN0hn0l4Gn+dhFZbXDuzJtcrcnjk8T0foYt7v0qkQDRAhEfig?=
 =?us-ascii?Q?noLdnDPrgO2JzdRjR2sMM9bC/CR9fsDzvjdaGqmvmwZeXqR11SgytAAKbJm3?=
 =?us-ascii?Q?74we9s0iftNaVpsf0+mvd8XZyj2wthGOugWf6PvO5GYs8H+yiGThFoFJPg8w?=
 =?us-ascii?Q?RQq9u/IrMK3nXxu8b2dV9s6K7Kcw/htHudRPAsg+w6hU8i+gn2nWGiVVUhnu?=
 =?us-ascii?Q?RPKiTx9ynZpuyzpYiOuRaOiioo0exOHYptjEJMf7NEK/m7OvTiZ8cFZl4rZ+?=
 =?us-ascii?Q?sDdVVtIXTraycARI/Bu2mVTCcIrN7mksx7FQw0asFsdqi8QWYAybzbuBp7yt?=
 =?us-ascii?Q?5htcQ/mSwi7+Ku0vvVrS5p7IOdThG/BrDs0sv0stnW6vAK4X8AjtDUPWa4Q8?=
 =?us-ascii?Q?luR/H3qFG7mG8Kh+dVfvNxZbRvPANVRc6ot2XvNn93R3C74q0wiHxcVaAlfT?=
 =?us-ascii?Q?+rdKLyNrI607rmw3oKX3KPvHswuOYQcd8LqHpO22yZ0S3WwQwmbg/wPXh5ZS?=
 =?us-ascii?Q?+s9gGyGiaXtfKkD5gnmQDwR4GXIhLliGOVEi67GjMHWcQUUzo7DcT6HCFjVm?=
 =?us-ascii?Q?sepVwI6/GCUzYmCVJOKUuMmY+4RPPuLMCLJBsyNYym/KwnHv2Laag5OF3DeA?=
 =?us-ascii?Q?C5UbxilVrkPhqaxgUdYxJs6NFSbLslEw5CdKzfiqp9GAqLgHtXiPOBUnFM61?=
 =?us-ascii?Q?T1HYBACbr7oC4eQfthKZu7xjM9E+oNSGOZVx39+X6yZVM5OwyvSfxDXyhbNh?=
 =?us-ascii?Q?epH9zIDKlIYGCqyj/T76w/bsukRTXVFahDoMfA3Q4eGFW8TpB3a8Oh1Hb0Qg?=
 =?us-ascii?Q?75C876cs3t2TVifiFZJmLMztIDYoqNAn7u0/Q+Kuzg2hMzt+we0dpymPcFIS?=
 =?us-ascii?Q?MDS8YlGs4mtuMFelliAegIBMwheawqN8oihWcKWh7piARInayZKZhVO1qH0Y?=
 =?us-ascii?Q?ldyl8igiuPFXpJNZA3aY0LcyX21VcCImK9FoC6NkQz5xtj67bQDSNWHrsNUO?=
 =?us-ascii?Q?aBnz+Ema/QeE06+7LrU5fdBGOlZqnfZQ3pH/g5iesMgL+tcZouLPF0grw+SC?=
 =?us-ascii?Q?WWVvGtfKcOnqhujnajj+Dmk5PsgbkGUadrLx5xii/bQIsLmOuXZVKvF9Z0BO?=
 =?us-ascii?Q?qUWECsQxZosSAKwhusVA4UHGug+oIHH/njEyjAtE7+aTXBLhVkc1vD+PsZO7?=
 =?us-ascii?Q?qRHw+lKRaw7JMXPebd3rO13DuT+CfF+4JwrCwOjHM+2lNZfkSP6DNDSChOVY?=
 =?us-ascii?Q?TtS60h2isD6j0of3wXiNg4+z/UldRhCuaanf7gv33sQfTGY0B6YgiuI3vm10?=
 =?us-ascii?Q?7I6qfAVdwufMTbTrNenWtcjgtlDgVlRHGUWOzUHTvwjJJFoHzzP6NibJHwiw?=
 =?us-ascii?Q?wHnwzTc5q1hzbtzLGAOGmWqyDxnBlPNUJeWb/zGYjySDrLb8vkGRGNI9QU8Q?=
 =?us-ascii?Q?95mT7dKobfoEW6iXfXXraZZ3cfsLmCKHQjnU8j2McxPpH+X1lEwObQa+YREs?=
 =?us-ascii?Q?Bw7ezKXhBj1AB8Y4r38CW91TyWrJ5VwGnOqfXmD2eFmI41lgKHgYH/jm/EqY?=
 =?us-ascii?Q?LL4kEEo2I3ZoPv3j4uekme/h+BBYAAzEAy8KH9z8skhq2LIkVjHrgsQtpe+b?=
 =?us-ascii?Q?R81BKZyT1ILnjFGvBIgDyGAfLhIxINm9UO4zqDQCY1uN/Z7g9zgzwl7MWaFR?=
 =?us-ascii?Q?MlsL4BrfoWjV9vQJd4KzY7ZTCz0etDi6ckPJB79kygh/2YDxveFn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad680348-d396-4a03-3f11-08df3c2e1547
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 17:47:53.4057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K5feqeLG45DwuJjG39jSpEjUzu4r9CIdi3drPR735HuZfd8WxtafStXyNlzhrbrR74mAZEJ9Vt0FkTtUI/UdF4yO4k++0Gq0Jp4iNRL9Ozk8lXEwejwohIKOdz5fLZav
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10268

On Tue, Nov 03, 2026 at 09:51:59AM -0600, Logan Gunthorpe wrote:
> Add a dma_rmb() after the write-back status check so reads of the
> transferred data can't be satisfied before the read that showed the
> transfer was complete.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/dmaengine/20260717223217.B6FBF1F000E9@smtp.kernel.org
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> ---
>  drivers/dma/plx_dma.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
> index 1c995f0c4463..e4243b66f933 100644
> --- a/drivers/dma/plx_dma.c
> +++ b/drivers/dma/plx_dma.c
> @@ -148,6 +148,12 @@ static void plx_dma_process_desc(struct plx_dma_dev *plxdev)
>  		if (flags & PLX_DESC_FLAG_VALID)
>  			break;
>
> +		/*
> +		 * Ensure the write-back status is read before the
> +		 * completed transfer's payload.
> +		 */
> +		dma_rmb();
> +

Is it false alarm by sashiko? follow code have dependence with 'flags'.

which part in Documentation/memory-barriers.txt show here need dma_rmb()?

Frank

>  		res.residue = desc->orig_size - (flags & PLX_DESC_SIZE_MASK);
>
>  		if (flags & PLX_DESC_WB_SUCCESS)
> --
> 2.47.3
>
