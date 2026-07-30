Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013003.outbound.protection.outlook.com [52.101.72.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C332EBBB7;
	Thu, 30 Jul 2026 19:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785438215; cv=fail; b=O+caZiERx+oNyFfp50VWtrrQq3ohS0JKugQBpIqK7Pl88JsgcxO75Nqui/RwngbpDdinHEbEjDiHY5IOf2a+zQN/wWtgAuNfJv9SddmfnuHxEr2Mo+X47CXBWUOKcTp8zX/9z+kmJ8x5C/fz9KU+7B4aL+/yDnYilWXC+t7mISc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785438215; c=relaxed/simple;
	bh=EYKbRO86n0x9/A7gBnNvCyYx2ozAbpnp5eeXnGVuPOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FDXPdtH2uwm0AgP15HuBNOO9Xi8shenhUp9eMN0ieJooj+3pXAxU4td+7616TUHSI4c1oyQa3DRLZV6I6OnKqiyQkcr+E3vEhWFMCQF4LyU9s61e1z+6E2LZI8P9lQFJMId2R41rYQpwW+X45uUyS87we5S2nPA0MUGt+OKHWBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=q7scCsQn; arc=fail smtp.client-ip=52.101.72.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="q7scCsQn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTGLPn0zFMBHrPO12vskMH0Z6anEVvlee1occBuPKjuGpokYYjfF0RdFI7SgRpjpUP2gnflUtcpmiPJE4S3VSwa5mG8DpqPswVVKG7y5HwNjuhHK6kg7DjD3MQwOPcOwvfD8UtOxcrgWie7Zdl4wqKN/y2FyWXJzgdtyzOf31thkVkAtVZmDXM4iS2Z7wx7r9VJDieVKcu9Yt1RnUbzflIGrhJZ+qWGjm3fU/2SgRlcLDDmtDys2gqypVyOzN7wT/EZTYgjU7whlIlLEVcC7BJtwMCH+pBHwpzis9XCpp00T6mQZ0THmBBfKG5jVo3jLGZk1Nhr5EEHjxJW7CeNLCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s26M+1LHDwg1rRWhogFuo6ScfZu158zAJJwIkUC++RY=;
 b=HSW/sDqbTbp1Jc3R8KSNgp8rhcJ9fDu0NQgK6dHgJVKqua+PvKVZPqyz5aS5Wupshe6c/gXm841h4zkVIGCgMx5I9qI1iWCe6nXtkdkiikFCKoShlf8u1L3Am76PnrRZ1RZmz5WauTKvpQXQoq3qZGl1GW/zWYUFYtNAVqiTww3Dh1x4feFygObxELLjRXCZxflfivarBBkaiiMRSD8dbs46fYb1Jy4NI8xpPmZBABsm1+zBtV5C6KoJr23kUsNNuWwFPghJMgqk9SppJm1YrWokjosLFa1lKkCdY93n9uztUhW5Fu37rbAwRI4Ugmoy02QsH8akjZZEDGrNTrz7Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s26M+1LHDwg1rRWhogFuo6ScfZu158zAJJwIkUC++RY=;
 b=q7scCsQntgb4RmwPHVcLzqu1z3Xz5Dx56slUw5emHdomLGvVSDuY+7BlkvCstSD/K+oPR7Cv4jaSjYrFtteblbp8xfa+j/9r7vAB0aRD+O2J02AzwU41S68KFlLVEUzOwEIFb215eoZi1tqrFIqKqv/2YGc3OWkHZHnd2e2MN7NP29a327CKD2FEMWQRKb2vghlfACuYvxlria7wSXBdaa9deaDvn2a+fUKTtJLnI3azl2v4APSF4dATOd9pNvT8NOX7eo8sUrOsD/KwqWhEqXDiCj2BkwQcGg/iwUbEhj+g6lNXVnv4i7rY6mcKTSu5JImWulof2Fydbq0yPZD8Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB9776.eurprd04.prod.outlook.com (2603:10a6:10:4f0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 19:03:26 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 19:03:26 +0000
Date: Thu, 30 Jul 2026 14:03:18 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: dw-edma: Mark emulated IRQ as level-triggered
Message-ID: <amuf9rMAH_AmR-Bp@SMW015318>
References: <20260730160701.3550710-1-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730160701.3550710-1-den@valinux.co.jp>
X-ClientProxiedBy: PH0PR07CA0036.namprd07.prod.outlook.com
 (2603:10b6:510:e::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB9776:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a867d69-b359-4125-c067-08deee6d3c0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|19092799006|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Se9RQuOOmwVLWD6g5NMzvRzw+H9Piah1VUyHwIdxPVNjIFAuC7O0U13qYlZyLLV5feOGBffoC04DyCy5ntrdHMryZcsLGFwfAnUVBwluLaK1bbBFayyWurw1gaqF0NPUxrODUOfROfeMFkh38PMFO5axuVkSJeYYD07jOXVQvC7vMerjdExz3xubN+lQg0jYjCgWKgpYjV3sU7nm7fHmK5Qm5JC4hK6EC8PODD46XWwFxbrMGZrG9ObSt6WFPGuF73RF/kb1CZbCjokCbBcyl+T7+MqOnUEfmnMcng4qIZyVW1/evky/OLJ804csxwmGvvPp554DbGA1x+CjUHp7zxyfYB5btPDcICDQFmN+KZakXrhh7Z0460R+u/jnXp/bF4hOV2jfqu2Ikhamvt/gm5pSmj6FCGQajOaVXhY2sgaUU/Et4vJxx0s5fKyZYLhCr7Fuwtb/p113g4ppJHpH+ig4zqlACZaNmV/dQqaDQq9hXiJhtlLjrrQrUWMNOp9x0udaLtizhdBOf6cPc8YFCL28I+9P0BvP19qqx6qlXVHhoKzPeauPU5+4F/CYG6W57RNtT+7Lm1tIX54Y/bWLERkMX58j9kbk6aZktn64ic+8S2IE2bLh1KlPPTnPs9sYhTnVOxG3cF+35W6ssJhO4wZDQTSD8qWVKMRxMADyFlQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(19092799006)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?61pmDNmHG/cV3UFRIQUhY1JbjgyM3A5zS6DfT4xGFXhP0UrjxdWW4v/zObwL?=
 =?us-ascii?Q?WjygpMxDGSGRMsNG3o/vL+RKS+OYQDFFgI/UYJ2S19K8sZhZpwUlLAiLgWrY?=
 =?us-ascii?Q?pA0/eKZn6gwWbrE5AZcyaDacIzzgD5k62BbOnPEQ/6EM19O4eHXvRUA3GFm0?=
 =?us-ascii?Q?iFoqdoshhwdrZcEBmzmKdqeeg24t31/uTe9AOcHBnBYS6z5ftjQZ4CKD5z4A?=
 =?us-ascii?Q?mKNw8wG0Akq7BKfbR5X2uHhi1LfuENgraKI9jsTe7QpeoTUlsxeB7+DcGDVJ?=
 =?us-ascii?Q?VKmG06OTZcKsNd7EGYZqviEB0OJnMf1o0vddwK30AnLbJBWYo7hC2KDPP/9j?=
 =?us-ascii?Q?2NAxeIdI8UHgdZAbuk7jxkiQgsTyQ3O7YcSIYF9CDyErrjuwaA4WtW3WF6Tj?=
 =?us-ascii?Q?6VttSHTD8Pnk/aD+saS8KK5dOPzj5wf4G4VnenPylHY1/zzMXlwMnxnSrhrV?=
 =?us-ascii?Q?4XPGwrc1K9mCuw2aIsyKV2zhUzE15EJpb6UYrtfE4EH/AUdpB7ucUCQNsbsr?=
 =?us-ascii?Q?nsMfenESPTOD3XmiIoeVi+9i3E869XDXtSNoE2nXbRlOtQaFFXxlbwnBFaGt?=
 =?us-ascii?Q?SrCvZw3kZvFZHeakb7bscuvb6tUTEOxzS46kc8KewY/WmPtTqDTwJS6wsLXN?=
 =?us-ascii?Q?EaZnsy3kbs9L/f9/4Z+h0xQNv+YbeIRycVqr11xN8xe9p4IHNFAFvxYZTHQC?=
 =?us-ascii?Q?AR/hCkmc3xmNYYbofhU+XhPmL9p2XOdhODAExHw6ZYRQwd2lbHWvNY8zL5WV?=
 =?us-ascii?Q?nabtQ73sMBJr8KP6e9bP+gedr2HgZC1R3eAkOYkktgrmWBtkNpBH+2xzrZAz?=
 =?us-ascii?Q?e/If1+wzQiiGU2Zk0kxH2LDMfaBf1eFtfs27ZlPfY+dcweL2cQg5S2qiiaxL?=
 =?us-ascii?Q?QHcJzKFCsAuhG/t4DmGuLMfprk4bnY8n0D9htvW/C/7vSOyF2ZsopeoUnKSj?=
 =?us-ascii?Q?IrAJd2Git2EpAiXmn5tsW9xPuQelw8w3AqRoWx8zajVGI9/bKC7ZNvPQgoM7?=
 =?us-ascii?Q?KbXAp+FjiwcydmFz0qs47aYkScngQugK24poucMsfjljYz3DeFcFOEGHIuJG?=
 =?us-ascii?Q?3yd4xFjylLnEAcxiUPnpasjMAJT+zjUE4/qi6piav0Y5tr0rELE/ALaYccCN?=
 =?us-ascii?Q?95rBP7qbkrvuPgIX6451V62uWkfL8sEUVtNOAryKNYXKcFtbGSad5iQcc8Lx?=
 =?us-ascii?Q?02Bcku15aOWN/B7XWiWQoxg/iYpClVfresPN7PlDukcrXojIWJME0RPFIfLt?=
 =?us-ascii?Q?6fkmgjgwVobC42KUHkyDeCdeVTVFzsF0ZF378rwPEZuna3EvBk4j1CRcUEr/?=
 =?us-ascii?Q?kDSI9YTerjioP7DKdwAB7/lHj45nVIVB0trudG+A08fkpYYRvlj5NTSvhdZa?=
 =?us-ascii?Q?GYEHbsMF75zt1JPnuqz3fSVHxkkmmJRcKHXLhJH1hWOA7l+LiaTNZ8M5cG+2?=
 =?us-ascii?Q?Q4WgNb1kJK1lHEb6k/znJwPo5bmM5JQ3l2wyB17hjOIMARUBp3OE3Lm0bTd0?=
 =?us-ascii?Q?qdB3i835Uh//iCipeosxwibrfYIK1IZxvrQ9VOWQJoHPn5cMWTwT2LLjWzmE?=
 =?us-ascii?Q?PGY0+qAZDnFpfeoAU1+k6qeqsQt9C+JikYYFcadR8mskbW2wqOSQOHxAG9TR?=
 =?us-ascii?Q?5bb6lCIpNFkrkHD9fwSUBg63m/qGmz0CmR1NDLE/laejKklcp+5mSHEjJDpM?=
 =?us-ascii?Q?1bVuo+zosSbjXPGC/ICd22c/+uwOgxPEfmkJhCad7T9zW1/+80UGGQcBlOrE?=
 =?us-ascii?Q?ENjoqUUxRacvENhMczRqTIDn7+VrjIEOehyofMbgvNHkPIe5tUZv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a867d69-b359-4125-c067-08deee6d3c0e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 19:03:26.2747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mxfjpayD4Jg9jadIKVsGLVmgS4HDkTZGYWAPn1hk+1vbaqv+fWIKKaZEU4EtN/pfJFq5AfIGo7PvZ8cfP1EIxK3pt7AbleZQiv2dmhpiP4rcdI6rBpl1uARCDJOkHwGT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9776

On Fri, Jul 31, 2026 at 01:07:01AM +0900, Koichiro Den wrote:
> The interrupt-emulation virtual IRQ uses handle_level_irq(), but the IRQ
> descriptor has not been marked with IRQ_LEVEL.
>
> The interrupt emulation is somewhat unusual: the eDMA interrupt handlers
> dispatch the virtual IRQ for every edma_int[] interrupt because software
> cannot reliably tell an interrupt-emulation event from one caused solely
> by DONE/ABORT status. If an interrupt arrives before the doorbell
> handler is registered for the virtual IRQ, the IRQ core marks it
> pending. When the IRQ is later started, check_irq_resend() treats it as
> non-level and replays the pending interrupt, causing the newly
> registered handler to run for a stale event.
>
> Mark the virtual IRQ with IRQ_LEVEL so the stale pending state is
> cleared without being replayed. This was observed in pci_endpoint_test
> as two doorbell handler calls when the DMA-variant test ran before
> DOORBELL_TEST.
>
> Fixes: d9d5e1bdd180 ("dmaengine: dw-edma: Add virtual IRQ for interrupt-emulation doorbells")
> Cc: stable@vger.kernel.org
> Reported-by: Niklas Cassel <cassel@kernel.org>
> Closes: https://lore.kernel.org/r/ampndLtU32ODmncX@ryzen
> Tested-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/dw-edma/dw-edma-core.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index 89a4c498a17b..ec097c68cf5f 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -755,6 +755,7 @@ static int dw_edma_emul_irq_alloc(struct dw_edma *dw)
>  		return virq;
>
>  	irq_set_chip_and_handler(virq, &dw_edma_emul_irqchip, handle_level_irq);
> +	irq_set_status_flags(virq, IRQ_LEVEL);
>  	irq_set_chip_data(virq, dw);
>  	irq_set_noprobe(virq);
>
>
> base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
> --
> 2.51.0
>
