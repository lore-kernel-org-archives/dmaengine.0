Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013070.outbound.protection.outlook.com [52.101.83.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ECA3B3891
	for <dmaengine@vger.kernel.org>; Thu,  3 Sep 2026 19:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788462110; cv=fail; b=i2nmPAmWRsGgpaZmBTSgq8oZMqyZRe4le7ARrr8TEbmrpLaaImDOHKhw4IYXNra7vcZHiTU15oCm/CDFsjkxnqxQHx+JmPRMnmxjWL8hHitVZUQm2U3p3YRgxeG2QyXQEEzzv7J2vQJZL06yB7cnwpYIJOv7uIGGV6JsJLBbl5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788462110; c=relaxed/simple;
	bh=45L9QHa6oquJtZ2IYsvdhoJjbjncmhcIL0greKiU9BA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oVi7uxf7bt6NZcmddUT0/4qyBlhZZWOKUTFEcAMpmepKeXlRwjWk3kNlh4wro+kLLi1zMEcgguztHzTIOHaQGdyHPS4fQziXBd69SH63/Z5OQomYNb8FbM1oXAzh2i1jk9M19rqo3/D0/hwZlWAux6CfGIZuo1Jv0cfPwfjVnZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=L2LisBu/; arc=fail smtp.client-ip=52.101.83.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="L2LisBu/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vSdsqtFQwFPVczoauN02cCCz57SBaKy/O/cD13Uko3GbYkMrjuAH21n/l+nGH+bpPOtjxnp7S+XsoZhqHhe+NQ1InIHsVNJeEJ3qSYzgeEIC1YJoUUzWTAHSMuCKk5C0Q0z4ZIEu0SbKBpC3vYT+EnoINiD5BUZYkijllQBAlw4IorYZ53waouADHX/mQKHapHJxswdrW5iSKczim5Ws1ObgMuv8aLAHjoIUHgDUQ+NLFGKxjDwMoqfdzslgWrarXigLnfmisjRAJQDJdexFCPNSKTjsm42WrlSb2Y3A4Jth5K2UU2ptadneTz2zL6ZPPXVwB49olPxW+g18ONl3uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RoQJ5K4A4GKbI56/fw82zJfb5D2UAMgfGxT7J4fS1+Q=;
 b=UobOUbMqNcmzscZY6D0FYgEqXFjz1CXXROIGB/8+s44Ttj4rn57WiZfU009mrxAZmS/zAXzdXnvwiQuk4YszOpm767sj7+HEtP49JhWqs7oFdSt9KOZY1F2QS4fXs6AjAjOP1VngDvP6gRyeWqwGOqqOLr8oSq3bA8GEZOw5fzMLSLezOjCNR5pwr6Y5D5vn4gYqQ63aKz4x8dodh70S4F4DebCFX+IrSp0xWLnSGH6USdQhZKWoYbGEcQDncUlQMc7ahE/HlPF42kyrJvXYVzrTxQHb3m2z2ml++y4o/ib72pBXTESCwwCz5wmaxWg+T0kLzU/GI0H2GWEz/6OE1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RoQJ5K4A4GKbI56/fw82zJfb5D2UAMgfGxT7J4fS1+Q=;
 b=L2LisBu/TlLF7p1gcvKOA0CQbgGAsAvaFdscJV9UAvYJCEvArLe2++537XVXwP12eEeAzsRWi28DWhlhpsbAUe31j5hC+4j9cF0hAC8Mq5FCJfTrj0N/QF7Pk/5Z8FaJ2qgQfxCd75bsDKvh7SC9BfYeOwu345kMYBnq2ccbQBkFvwtPx2vCSQQkrm5HcJHz76ENP2LVFj0sS6IANFeYKXBdMT/C4CgpDRrHlGOKjQw3UsKY7vM/EiwmfkzzIbUT6qTztmNWCpEMfBoIc7vPoZsX/Y0/U0Yu5uNjw/bNoKgGIZ4EEkPsM5KiCai68NReTXA6UDFTriJV0Nb12iHN4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11142.eurprd04.prod.outlook.com (2603:10a6:150:278::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 19:01:38 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 19:01:38 +0000
Date: Thu, 3 Sep 2026 14:01:29 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org, Frank Li <Frank.Li@kernel.org>
Subject: Re: [PATCH] dmaengine: zynqmp_dma: drop redundant label
Message-ID: <apnECT9Mz6ncrS8W@SMW015318>
References: <20260903170357.1711462-1-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260903170357.1711462-1-vkoul@kernel.org>
X-ClientProxiedBy: PH1PEPF00013304.namprd07.prod.outlook.com
 (2603:10b6:518:1::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11142:EE_
X-MS-Office365-Filtering-Correlation-Id: 96761f3a-a22b-4c8a-3f50-08df09edc80e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|23010399003|366016|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PxeRYo+T9w5YBeSqAmlHkWTU4BCNNhtctgjgXixfGNlfmdBsRVdXCxGhPVbjqtszRSZHBrxY1NbCzlgcPV8TpiheL48bG5BenLUFmkAmfDMCM94+Tyb5tINfkbPiByLwYaJLesUzE+UdXJRjMN90KeGxIU/ALiND4A8qO8+GxlrBmUGwTQlRkBJDdLlVbVih52I3Db9Zb9E7tdVcb8Mz3pFaNhHDeuOpfLp3cVIhRl+DxoDC0Iyg7qMTAWxOJyk19VdgVGyWH9TPHgAy/VWOLCF1xQc2GhRD+S6o13CVujqMFh4mO+VpXE0cR8rJBd6M94bALI1vua9Teo4X8ngm2kWvqrcw82gZFgBbaXL8u3N3oWVjRZ+7UBXFddXcykefo4Irg0maz0m0X3Xf2jyDgqdxXYCN9qeMNQRMrvgPe+ZFs5c0muCGP5LqAZahyBRiBHEFhU+oMw5UtGVAWDFQ2Gf9C7+2tj7g2oiUYoKPnufDwv/Wpu84JVbISbrMCjcEKEIX6WTqt/Yss9yrg0rOVzX7Nw2geIwpg7p8y/byL46YFwzrn8BzIf2zpFKQEZdYs2vKCmHaS/+Yn6AkpuKEQDJsnXZvw/iOOE5mMg8Fd8RIasiaa/cGrwCRtSOtm1QiaO5+GoJ0ctoTWIbcOkqtGO41g2vior3shHvC33KiadE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZSsxNUlOU1YxdnhuTERDVTFRb0l3N2NzTjV0cktla3pHaXFYMFEzVzVUc2lF?=
 =?utf-8?B?UDYwTllqSndMRllmY21ZMERFWStsNGp0WlU2MnFnTHl2aVRGZFQ0NHVNS0Q3?=
 =?utf-8?B?MVZscnZ0UGM0a1hKcHhVbDVtMlBmdjI1VWFyTlovcVMxZVZaL0NOcGlRNjIy?=
 =?utf-8?B?MmtjcWtaS3IySnM3SmtRb2pOdzF2bW9IK09HQmljYlhZb1pTRy9GVEpjeThP?=
 =?utf-8?B?Tld3Mll1cURIdzN5OHdxYS84VURPVXhWWlpKTUROS2gxUXE5ZmtHWDBxWmd2?=
 =?utf-8?B?UnQ0dDFSaUthK0hxRVkvVkRHVk5naFJ1NjlHcmhKRzlpbkltbXRQMmZWZkFi?=
 =?utf-8?B?NXBSRjBCMDFQM1MzMUtBUmNXZXdmZ1NWYzNDMXo1QTNnS3E4L3VncEZ1OW1a?=
 =?utf-8?B?blJmU0RqcXVSZGM5MnRqWGVLNmhrbi9jL2VYUFJJUkNZRGNwYlhtWHAxZVZx?=
 =?utf-8?B?QkJHTVNhOVFGNmtBMUNKcXFCbDd0Y3JCaThKNmRkMFlFcERsME1wbDZpbEtD?=
 =?utf-8?B?VlFpeUI2eVVMYzhkZmlyQXpwQWM2a3ZIWld3Mnl2Q1pzcjFGdU5sRk9UUDNa?=
 =?utf-8?B?SlAzTllsakxCU0dRajFHdTF6anJpNktVQmpsb0J0d1NpM28vQkJNTUJMc21E?=
 =?utf-8?B?Y1JJU3NGdGlYMlF1T3phVEs0bDUybU5ZeGFPdGxFZHdOKzFKZDI1OXNMbUxL?=
 =?utf-8?B?MnlHQmRac29iLzhacWJndmdTR3JtNmJSckdINWpDSjVHMTRMcWtuSzU1L3lr?=
 =?utf-8?B?ejl6Q2VmQlZPZDRtc092ZmJQTGdWZXd1QStuQnhieG5UaWZXM1ExVWlxV3M0?=
 =?utf-8?B?L3B0ekpkam1tMTZRUGdyTWVlNzFQbnhVVVQ3SkN0Vm4yMzd3QVdwTE9aS0ZC?=
 =?utf-8?B?VlFVRnJLTzFMK2pRcmFWRy9PWWE1bzBDZ3BPZ3I3RUkra1lOa3ZIT25MSVpE?=
 =?utf-8?B?dDYzYXRLbVBNMG5zbHY3OG9Ub0Y4SXJ0WkJscTFaYmxHYUtxb3lyRUJoV3lt?=
 =?utf-8?B?Y1lTdmF1NllKQjE4emhWODluZWxWaThoSnU4U3pUUnNlQW9xRHNGVDZZdWNl?=
 =?utf-8?B?SGoxZUpEZTY2NkxtTzNhWmxJM2RETVZsbHZJQ3FtUzJnSnR0ZjZuYXdFWjc2?=
 =?utf-8?B?czBMQ3lIL3BKcDd6bk9uTkFjemNsVUpHbVp1Tm5HTW40SDdSWndyaithTmUz?=
 =?utf-8?B?cVVUSnZyaDVUZjRab1QydHVTbzJjY0tseW1ZVGlTbE5PMmxac0M2N1lxYVFV?=
 =?utf-8?B?L0ZQTnI1bEE2aFlrWHRGVlZUUWNPMzBhWVpKOVpEUW5WZU9mcWFrYjkwR2JE?=
 =?utf-8?B?TUtkZjhCazdQN25oalFBUVZVRnJzME1GdmZ2UktSMGx3bk5uclBzKzRSbE9G?=
 =?utf-8?B?bEh2NkdnWGoxMHVtQ0VmM1RKR3kvVGNtMDUxMVVBL3g1TGR3cXEvbHRoMVlY?=
 =?utf-8?B?N2JGYnMzWUtPN3poVGRDbVlpRC9KQ25hZVhJU1hKUHZkdHQ3dDlJN2Z4MG41?=
 =?utf-8?B?MEJXcXVBb2FqWG8rRVM4WGEvMEdzdVB3WUQyZm9LZTNDRlpqU1pwcUlKcnl2?=
 =?utf-8?B?Rmk0T0p1TWxvMy9Vbk9UZDlRcFpZK3pLN0FhdkZpUXNKd3JEdWtwOWJjQlFY?=
 =?utf-8?B?N0VWaUFzTmNUMXpKUXAyanJFdlN6eWVpN2RTUnU1aTE1aDRFcmdyQmU1QllL?=
 =?utf-8?B?ditWci81ME5pZmM0K09BcndPdlZIWHFUcWFYM0FST1BjNmZvR0JlUWhubUQr?=
 =?utf-8?B?SytncDZJSkJOZ0Fja0pUSW5pTmNtSTMrR3NmOU9pck9JbnBXTkFuQ0ZXWWVl?=
 =?utf-8?B?RWtONGtGTGo2Vzdndks4eURRVysxOVoySkUrNFlrc1NlZXZJMnQ2T3Y1V3VT?=
 =?utf-8?B?aDZKSzlhVSttRG9Hc21xaFB0WHNubGxwc3ZpR3N0eEgxak8zVFpoZFZNSW13?=
 =?utf-8?B?ZWx0M3NqRmZpM1hLWmV5Zzc0M1hKVlpQMXN3YXRFM2dHbmVEeUhDelBUN3RM?=
 =?utf-8?B?bGRTeXZpWWRIVmFzN1EzNnRvNDdEVHpZMStEb1UvaERacTVnbUk4elpXVE15?=
 =?utf-8?B?bFZ1SkkvUFZPd05zMEhNTVVkL0gxektkMGlRQzltN2tZUVdkMlVvYWRkcFpP?=
 =?utf-8?B?bU5nWGFBSGJ4WjQzSFZWNVRJUUMzVFFlREhHQUpsOFNmeDMrSndzL0tTVGxS?=
 =?utf-8?B?aDczS0p3ZlBkM1hZY21tYUNPTFJNdDJ3dlBMbGRhR3EwejJweThVV1hoNVZh?=
 =?utf-8?B?ejZSR0ZrTVZZT29XeE9OOEFOVko4bDBvZTVWeHBaTXVKMFkzVTBuRS9CT2dW?=
 =?utf-8?B?a2wvbkFqaWNBQnJHaURYeTdKam1LVHp6eFFodlVISjFKRHVxUURZVlU1dVEw?=
 =?utf-8?Q?oTTwOdwjb/UTTLtilza7YYe7I3XPJPspLykgz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96761f3a-a22b-4c8a-3f50-08df09edc80e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 19:01:38.1506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NECA40rRojqL28iwBg14zuAl9vxaPkOiHG3pSSTcEw+4aLhtefWlj32oKPbcsNj03dR8N17zt+mocGFIVBA2SOWd+k/9T0K/IzxrsXGnlTOAsHlKSChm02Q6DUJ6qgUl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11142

On Thu, Sep 03, 2026 at 10:33:57PM +0530, Vinod Koul wrote:
> Commit 64c6f7da8c2c ("dmaengine: zynqmp_dma: Add runtime pm support")
> dropped the use of err_disable_pm label causing warning:
>
> drivers/dma/xilinx/zynqmp_dma.c: In function ‘zynqmp_dma_probe’:
> drivers/dma/xilinx/zynqmp_dma.c:1171:1: error: label ‘err_disable_pm’ defined but not used [-Werror=unused-label]
>  1171 | err_disable_pm:
>
> Drop it
>
> Fixes: 64c6f7da8c2c ("dmaengine: zynqmp_dma: Add runtime pm support")
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/xilinx/zynqmp_dma.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
> index d1ee51dde3d1..3b7dfa53f972 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
> @@ -1168,7 +1168,6 @@ static int zynqmp_dma_probe(struct platform_device *pdev)
>
>  free_chan_resources:
>  	zynqmp_dma_chan_remove(zdev->chan);
> -err_disable_pm:
>  	if (!pm_runtime_enabled(zdev->dev))
>  		zynqmp_dma_runtime_suspend(zdev->dev);
>  	pm_runtime_disable(zdev->dev);
> --
> 2.43.0
>
