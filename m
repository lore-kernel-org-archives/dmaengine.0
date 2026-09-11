Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013056.outbound.protection.outlook.com [52.101.72.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC3B36A033;
	Fri, 11 Sep 2026 15:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139844; cv=fail; b=JdMh7ClEftSssxQ+2LJ/UcyMbFDum+S+7A3kVpoNKL+Y/PzCWPAuNwTn6RvDyCGMbuIujNy2fp4sdigxgc6j/0Scrtcw1f+hhkJ/TIa26F2kTNDQdN5TupiYrICTdfD3vrSDeTW5Dz7WcgY0KQMypv5wLKDrF2r3pn5HcEFNlHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139844; c=relaxed/simple;
	bh=TAgljfPhKGrA6Jzs+w3GXlpkZ1ScKLVSfT62e1klSgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a0/QsouL9z1FCK2BtVADd4AWObg+3J5m/dsaWDi6CPfOMSazDrB842KEnVFmW05UkUw32xZYjQzkA9YFlpLf1AgUKVeJsCfURUoRUb3KblmPq2cyE6LX+mEko10LEtSo4qHcCMjqeSN0mDYRyqUntuagHYekgbteh8nIIxDRdpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ik0vjxra; arc=fail smtp.client-ip=52.101.72.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ik0vjxra"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HDrOSgPj2QRsPZaeY7KilNVGLpg1FETUbrkJ9nhRuvZsn2NrMuqgmr4iAjJ/ah1kWL2tBlawMGImthkX6EPb8V7VGq1+cI3L6pctmD88fUNt/bxEfsMnByqUflIlVCrDltAxsMJyjDb8g3h6tc2DmrFxgAr1N+7EJVDgpcppJLpfdLsX9XVryAg1rFpH//+rvM46nVxKA7MktZfGC0lZQ/NItlrrcuoHbaD79se8N6rnYHaZmc43OOzS8t4e95fjE60H0N/2QckKc0mkNt+NXFT0IFTogECCU7HSiUd7H1IU1HnO/H85Jc4vrVtBcKnbpkEebObXCNfFCK+VQbRMlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWeEM5GTexPiVTVdoNK5Yq9AHC7xt5vg55K51e+kwFQ=;
 b=KIHzab0S94cvXnujEpWmn+IS4AodrW9g0/o1b1C3MHOirPDJym2z3sPidG69FIw1dNsgl/BP78FaitLwvTiDHUq1p39OaAqwOZwGJrnRcM5VE8po5A/4fbFxAM2RC8gzhnMAgGweRN27LN0Ux4c4k03tyjBsUkofSiV4XV4DSajhiMb153myH4KF1CMY3HMTGWDdfsuGKK4h9Z/pzLWTUS911wrCTG98uBMx9fU5FDqrytqGrettmGq+vZmhyBYppF8OYN7VQUjZ5CkTkjOlNS1KA1CxyozLMktpNkGbgHP1XgSbR6zxVFqXQOTTCfEO0LcIpuoA3XHgXCe2YYQDbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWeEM5GTexPiVTVdoNK5Yq9AHC7xt5vg55K51e+kwFQ=;
 b=ik0vjxracY8odW42OKdJ9cRKg1UzjKW44tt+pz4YTnodOMPxgnp4pFw+tyAekn/0akB3IxxPSmXnNajHkObFOY69rW9MIOS2NZ+Mzv+FG7gTk75qhfQx3HIE+iJvjwNM3hShW1uVbA9eSWgQOKHKNrBq/ncGJkMzHbf79QhaMmSqGT3ienqa/gsU4Tb6RaDWtQSApvsAmA8XzX6DHO3nQLP0z1cLZn3FHPY6A3AijBz9965fZQ5jbc5X9R2hXrjjh+5L5ELHMC2CSmIKEO0zWOhLTl8PiP8BE9FxwmPfuCDNntdTqjF7jbalRshffOeyoJpZdiI2KmMffg9DYZbRPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB11996.eurprd04.prod.outlook.com (2603:10a6:20b:6fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 15:17:20 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 15:17:20 +0000
Date: Fri, 11 Sep 2026 10:17:12 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Harninder Rai <harninder.rai@freescale.com>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: fsl_raid: byte-swap cdb32 when programming
 CDBs
Message-ID: <aqQbeOV3IWzJc4Q0@SMW015318>
References: <20260910194324.33697-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910194324.33697-1-rosenp@gmail.com>
X-ClientProxiedBy: PH5P222CA0008.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB11996:EE_
X-MS-Office365-Filtering-Correlation-Id: fee6ebed-2707-42d3-2406-08df1017c5d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|1800799024|23010399003|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8ZKf+As2GNjo3NMhwXgQ6tmMpAf4ddAxwtxr4HdLpZf2E5C8ZxqAN1/+wmUhUsrNpELjAwbkGYdzzOt35gilc8VO2WhxR0gHTrgl9dbpb/9XXszHq1MHeAJ9wkDm5VSbRqhkFrBcorOx87pYjzTGmEHv8iYfhjPjrnsjBGsF9B+YOW3lKEA8eQyFKw2llA78z6LfKirmN+m70BEILnH/44R6EtBsrwsfHQ7yf5WJVj6B0lla7APQgDv8f5q0V8duhzPtBEsF25kHj0pnx9wynkt1i14D4GUE6/zMO8I28fKq7O+CWz+LGcerhqEvBHuxN7rMZTd6oxWqoy1aLICkVFD0lTEoPOOC0LDrLuRrslQ+mLwLmgm5Lz1JN80KafEakHNv1LkltXQJmufrVgUCcmiZ1Pc7bdMniIP6s7UJjzPWWqpvDcXtI1WnaDGCA84bYtBYA039Is/0iQxy5phlQP9O+d3+/VO3YVMZZ2cr3FKO/0fYpV7qsqnHWWPwqan0KmukUU+xpWyfesWeJPH26KQT50uuaq2tMbZImDSaYheWELsIzroDnVntnVBAiSIqmpqgYVygVgsjRNuh1XK0GDLxWdShzpYX1Z1YzVt4IDDbeeswf2vfDwoXQODxRYQeYttlJ0s2sy195vZy8w7JQ7tIfX3Qt0ZsoTCyZjJDy0c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(1800799024)(23010399003)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3u0M01jIM0gGQWN6XxrAIPFRsZt2hp0zC/492ieUKGpUhf001kEA1D10JIqc?=
 =?us-ascii?Q?zEG0aM8Yrx5ZxpWeceduRPxrJM7YwrGxQB322850UJXZVszZU0cwUKM4IUGN?=
 =?us-ascii?Q?PHwYkxsvp9kqcVh/5TnD3dGe1okXIRa+tXNGMTlME5Vl1XuPQwQKyqFOu1pD?=
 =?us-ascii?Q?PVUA4c1jx/CcX4JY+8UJ7WbjQFECvtZ24H+K1mCd12tIo39SHKpQhFAV+LEe?=
 =?us-ascii?Q?92AmqFXnp5clR49i4R8EmstrOzKywMhEuAOC56IaiMKwgIvqL57j73GPu+bN?=
 =?us-ascii?Q?lcoFw/gwMnlSxpndSVBPrN7bxXD126Mioa8sK0EymdF2+JKr3412eGVI2wr8?=
 =?us-ascii?Q?fq2MTu8kS9n1upGXDpHMPsXVum5G41fUCC9xZ/F0ekurPVXGbVoSdGQE09NZ?=
 =?us-ascii?Q?KFnmLagFFerGKcdjks3WZTknCwYThZmh8OknNLSzTxBdoc7f+qQ7riVC8i4g?=
 =?us-ascii?Q?swceslmXYeU/etJyQErljaPmymruWd37ZzIl6pl7e2M0surV1fDfq+q21KVg?=
 =?us-ascii?Q?MA8wUE/PRXnd6kI9riHcCU9ijxajnLF9pjmJekm6BXMsXDI/s050+UWR0kpO?=
 =?us-ascii?Q?YmK/QVQELALrMlDuXRUcLTFHq8286+aDwaMEsvRC9zAKGEjjfM9j7lIUptQe?=
 =?us-ascii?Q?yephVZi/zh5m42c6V2xmZIVF3/Z4Xyk8EmKUvDNzCxmP+y2rwEFitqZ8HkZY?=
 =?us-ascii?Q?6ZACZDaJyMN5P+bBCJPVGvgK4pOqFlla525YFCzBWZsabLE7LQ2btE1cYPuX?=
 =?us-ascii?Q?qTDRpODq6f2DYOJXaanvN6aEToFIVy86wbOlPwsAKsiNVRuShw30+A+n0eqP?=
 =?us-ascii?Q?yDn6BEV9VQ3MJvvwcs1pyg77T2kACQg7zeGOR/oILJ4im2MtqaGZ7WQa4REl?=
 =?us-ascii?Q?iZ6J4L9YTSYf/me2ypbXgA3afRUY5iXSxL0qP1A06Hb4hOntWHYplUPN49Du?=
 =?us-ascii?Q?GCXMwgdOwv5MPxMuNU6bVoFIE53M+iVViztySYBa5nLoyk/NecYcCbPejEVs?=
 =?us-ascii?Q?U3o9K1iKuNropnsZKCM2MdJZCAVUWyEL/cSs/C7z1RHaSfRXfdrSSLOsN14B?=
 =?us-ascii?Q?vLomDP92dblA9A4yfrvbrZ9wPdpX1DnewmtltXxGL89E5J55lC+wItMmAuBP?=
 =?us-ascii?Q?2DmFQqY/soF059D5P/lw58gDHr4zMqnWxb75K5NTmeN0jKgdHGrXkN48DT4f?=
 =?us-ascii?Q?YpE+QrRXNipIGncMbYzvUIYxP0rzYmffy2SVnbNXVszleBxvxEOozB1vdULY?=
 =?us-ascii?Q?E22f7Q3hXHgv500MLx0QaQZaTflSrPutvuPYvnhcNF/s6xCvAAC+aYijtMij?=
 =?us-ascii?Q?5u2KHfU4RZcWYCQxGwJv6kfHTJp7XNbu6WdvSFzhINPjspmTr0LSR23B1add?=
 =?us-ascii?Q?x2UYINzRT46x8gWSd6rH7LaHp0rXSE1ayrWCuBhf0gE8eTKmOiDCeV2QdV6a?=
 =?us-ascii?Q?ZpmUbbpZXX8vrK+tJFfplZElh+6HNbY+A7MB1Vz1rUkjrIreRhdWUEbvAa2q?=
 =?us-ascii?Q?d1ekypEo40JLx50MUlFmXV7tgLS+vIiyR03CbKJtVvdIV5OV/ygwLOrVCgbL?=
 =?us-ascii?Q?5u82ahqJBx1gG0KIqNngtrlmKjm5ZBS/KsDaME5uJRkMEB07vq6k9gEDoRt1?=
 =?us-ascii?Q?v5q5cdChYc1sp6NBaoya35TMVwHw8hS/VGp9ZPtmpntjUYXNi0zFZNqkUhW2?=
 =?us-ascii?Q?SqZyOeRiZMjRKVFWtuwxIdueXeV4PIruFNGmDECLEi3tSG3/2XeybkUbuWji?=
 =?us-ascii?Q?foD2/GvrV+Osf0bjn/fgLRl0pRmvtRZ4ougV9k194GuIUpadgjDX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fee6ebed-2707-42d3-2406-08df1017c5d3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 15:17:20.2085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jgEKVMcTW9xDHqYLcvXic7k8fR0QmVdMxH7cLcuD7IiC7r3LE8JD4H8DhZyN6qqP4Apz8XBt3cBp4xp/w1lzKrJubre1Vd5ubtQ0N4c95G1V4Y2kaIrvuOESvk3fSpN/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11996

On Thu, Sep 10, 2026 at 12:43:24PM -0700, Rosen Penev wrote:
> The three prep functions write the first word of the command descriptor
> block (cdb32) with a plain u32 assignment, while every other CDB/CF
> descriptor field is written with cpu_to_be32(). The RAID Engine expects
> big-endian descriptors, so the plain assignment produces a corrupted CDB
> on little-endian hosts. Use cpu_to_be32() for cdb32 to match the
> surrounding code.
>
> Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine device.")
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/fsl_raid.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index befb4bb69d54..9cc289f7129e 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -361,7 +361,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_genq(
>  	cdb |= FSL_RE_INTR_ON_ERROR << FSL_RE_CDB_ERROR_SHIFT;
>  	cdb |= FSL_RE_DATA_DEP << FSL_RE_CDB_DEPEND_SHIFT;
>  	xor = desc->cdb_addr;
> -	xor->cdb32 = cdb;
> +	xor->cdb32 = cpu_to_be32(cdb);
>
>  	if (scf) {
>  		/* compute q = src0*coef0^src1*coef1^..., * is GF(8) mult */
> @@ -481,7 +481,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_pq(
>  	cdb |= FSL_RE_DATA_DEP << FSL_RE_CDB_DEPEND_SHIFT;
>
>  	pq = desc->cdb_addr;
> -	pq->cdb32 = cdb;
> +	pq->cdb32 = cpu_to_be32(cdb);
>
>  	p = pq->gfm_q1;
>  	/* Init gfm_q1[] */
> @@ -564,7 +564,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_memcpy(
>  	cdb |= FSL_RE_DATA_DEP << FSL_RE_CDB_DEPEND_SHIFT;
>
>  	move = desc->cdb_addr;
> -	move->cdb32 = cdb;
> +	move->cdb32 = cpu_to_be32(cdb);
>
>  	/* Filling frame 0 of CFD with move CDB */
>  	cf = desc->cf_addr;
> --
> 2.55.0
>
