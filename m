Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013060.outbound.protection.outlook.com [40.107.159.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD5E262FC1;
	Thu,  6 Aug 2026 16:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786032022; cv=fail; b=iQrihJ9mtzRGYxAAGBQYZzYfIbo6maDwRdVMpwDQiuNxguAb4ofzY9M0ckyFPGDF+KgkHckgze4R5Lug3BGwlqgK7Sfg6zNDY8nzzyfh7RHLq3MBIsjcydwmYlVtew/tdwwEz07wScq7gXn1J2LOZKwlrBqTykt1ySnYH7c8sMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786032022; c=relaxed/simple;
	bh=EsIMe33GD8dyxIqFG6IE89BlA8o0pRJoVzJGeah/3Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YvNHvB82FDTrjvmAWFInnY0F9OJe0dLxacVH3lqhl4JYXqMqFCPSe819/K/FQzv+WMZa0YvQ9o2K8qgYWGgujrinO41+JV9ykENzInbAYRE0iUHmrRSqrVJ4y6fpeKmwM57JXNdiOTX+Tmh1Ao+3IQ8tV5ckZ4Kavb1UoCCKKhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PAU/e4is; arc=fail smtp.client-ip=40.107.159.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PAU/e4is"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SW/2/9/LAcM7SHgTZ4AAxVyPmADRsqi4q4uND6yhx+veKPvUEij9cMhX8uSAFt3Msp9ufr9222xe7vHUi5CC65DbmDFVyAsPsZvk/ERDxBa85iQKrjcD1VDFpVeE8DkNCmAa5qBkSZq+ww0cU2dM4hixhm61IbDLJYK1kVijwsEiQcllaD1l9XXgM7YMjdVS6f2szhyImhM5RsNzU5vD5o1uwSCnzRxM9bJpaPFaSCs5suPmhAxP5xm6HPErAU+3gNW1HxtEZMWcQCHBh4D9RoLM3RHXP76ct0oltE0e8qG3UuMCMmK9AamW4cDPGgzE7pct0k6wg1rn62ptykNeVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BM7mJU7d4hJU08aBrdokEDylQNe6WCAZEEfYGn/Uysw=;
 b=P2muxRdTC8WFQHU878gRhsM371wP1lgNXTGV8RlfNoPL/2HfHOPPX2U75S1+hech0w10egtwNW3USdIDLr33pQ0iE1E5sVo3af75vE+SXfaZnNiSoNGvsoNABVD+gLe0MX5GoeCNpraJtKtg8qSSHgc3dbSoCGIZzQc8atqDDWshca9rQhWGp6HzWqQfLgd6B5nr6mbdwzVHyCAmi/9QR7Cw0opddBfx/hpL/BAZ+MIgXoecb7FbsTsbajVZyPjqwS6+kD6CNgTLJ6G/TTi7glRaE/2sKTIaHzvqIW3yXJ31nkj3W/l+1PprLuPUbqrqgNzox3OCU20zPPOBzPjskQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BM7mJU7d4hJU08aBrdokEDylQNe6WCAZEEfYGn/Uysw=;
 b=PAU/e4is/7VpECP/HpyKVI/b1dnmpnHRXByhIeEXw9tnOwAked1fApZGLPCqO5nB4UHka7lAhlbd9y5wqyC6GKvX0AAKGuyLhRux3OWb9O12iblRbP18KBmbyVTS+McSOkNr47dlHzPHb5R+5GW0qQim52+JvDpi3a0XkytOQNVnO2uQsnDPOmfMGwXf1jgAW+jFOONM4crJ3eA3/bRPGuL8igI9g3qrG1spEdM1LRJqU4Bw024wh4/6AU1hDp20csVnWxQjz13W5MrlLCpDL6gS4Buc3N/Fm+07657EKWfbynyFBRoiQ7MBAaf+6uH+KNirw5hzMuL9KsoolgzFsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB9463.eurprd04.prod.outlook.com (2603:10a6:102:2ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 16:00:17 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 16:00:17 +0000
Date: Thu, 6 Aug 2026 11:00:08 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Golla Nagendra <nagendra.golla@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, michal.simek@amd.com,
	robh@kernel.org, krzk+dt@kernel.org, radhey.shyam.pandey@amd.com,
	kees@kernel.org, sakari.ailus@linux.intel.com, yukuai3@huawei.com,
	git@amd.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] dmaengine: zynqmp_dma: Remove unused define and
 duplicate IRQ bit
Message-ID: <anSvhwQHv4Tudt_6@SMW015318>
References: <20260806123014.2120447-1-nagendra.golla@amd.com>
 <20260806123014.2120447-7-nagendra.golla@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806123014.2120447-7-nagendra.golla@amd.com>
X-ClientProxiedBy: PH7P221CA0039.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB9463:EE_
X-MS-Office365-Filtering-Correlation-Id: c2cf2a21-7236-45b3-8937-08def3d3cec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|19092799006|366016|1800799024|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BKYuGBBqr5TAnuOyhMdveIWESH0uE/XZGqkYpS1FliDURfBMwZL+2Afdh+7Er8axOdjLX3AQS7RDYAYSZLkTVK6GF3fyVlHNNxVICWvxePyXOczQ58E2DsrbvcEIRkM/Ml02z3pV/eFtobGeekXu3CNMvPwBPd3O1yZxUBCa8dEts7QIC/qnDAeJNnugHNEiZmOAqN/pHIxJgaTsAdtmwCec7Qp53dGY9ivys6Ul1A/pbIIV9WKBjhAG9QjM6kdRCUK64zjYlHrG+W/OA6MfoCbLolIAO+aA+udcwSPjki6PC/xa8Cth0DuiANad6DoAOFvP3CPz8t9oJmpSc3NARumOJKQr1P6C86N80yzE3DwuSkbZOgU+ZzRk9DTJfvHb4DcAgG6dzAnM6VVPR+CmSTC/QKszEFmtDTsf2T+PnxUmDFJw3BFGpogG0feh0HgrclubMKCrB1D3SnBPAw9sWGBa8V9RY5jRpO5Zm5tulrerFOz5+OvnL8i9B+b5VFVJdIH9bQCK0yBayHg3O+qEZ9WeHmzruMFk47FEWfKco5DVTRz4pDZGYZ2WWb1onmHfmc9dvM8ouz6W3vttw6hNizzogwkdTTMwDOFl8MxfwxRyYVNWyV4HHxgSjJVU5DNSOR+c2io/+SIFtFpFpMCAdJ2O7NYkLTmohg57BPBpB2E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(19092799006)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wiwYpEZE8zpZtydPMwgIoyK6W0mZFHKuk5O7JuZsKkKkL1rDp6aleJTa5KKI?=
 =?us-ascii?Q?YyCv1tBZYDBLbFFLx5mMxrNgFtzLU4foNOS06YX/H3pG33X0jnVwetGkFSSK?=
 =?us-ascii?Q?GBxJBXhmYCZPYLLpgql3kBtPxpMlWjf2QbdRsJruZ9/3zMhOQ4MVJ3vk8uQH?=
 =?us-ascii?Q?TSwCEtzgw+OAO1KIW9hSqTCFCvA+3v4bIhLHZZ6yd7cNLECP5Fw8M9RGRVzp?=
 =?us-ascii?Q?B+HvLZSVlAw9650WYvtRxfrddsLRKE2G2kpBePbizjGdK9Vy5WHCbrEhtu08?=
 =?us-ascii?Q?ErkC8HyBWSemRBt0FNxI0bN/vhXjTEzSX5bzuoa4raJiviwQXTAjNZEdMcjf?=
 =?us-ascii?Q?WWcvcr+nKVWqhLPwQhH8v4ETKNdu6G3uGYos5msiQfZt+Szkzfel/whV2pIx?=
 =?us-ascii?Q?XHSwhiP5uzUgodp8CdlxK4QkYdYDjUG/GvGKZxP6Ij8yBQgTldUJoEqwRo3c?=
 =?us-ascii?Q?gJq7tESmFIuj+eKl6YEmzV3+YyqQxqiZ1yZzmwJ0JU9ElMNcbjZj+Iwakbe5?=
 =?us-ascii?Q?QU2tWmuiX1dwxyjarMCKp9+gNxb8k1zvTPJVZsGo/sk8TJ/9sQIwrqSLjZzM?=
 =?us-ascii?Q?+YiYQ37Yr0vzcrZ5G/rMmR/gU0lutdMSKbS2ZobzKzRVP6VW8ooMh/s/8h2k?=
 =?us-ascii?Q?G7fQda9fah7lClp+D3hhUVphxCoSlRp9o7KKIGgCCE+r+7fxJ/5B5VHfAYJE?=
 =?us-ascii?Q?AknYHceI+EpENsKvRpT5nxO15o4eOHmKFlcrc0r1sCOO8M9COdlTOYu+Nq5f?=
 =?us-ascii?Q?Ak0d7o4HcNag4qbB+ez5ndNOccOnv5hiYhpdVSREGn4+KekSZqCt/WNAEtPF?=
 =?us-ascii?Q?2Mb4oMpxaNcuiwDLuKtegPuSZiRBvY/qRQfR9gceblwi9DXl2+ioHNQs1/tm?=
 =?us-ascii?Q?wcXzBtsa6ws3RdknyvdvIZD+bfOk3fONdyfqniVZJnkrkquaclPMXnwrGvwq?=
 =?us-ascii?Q?awhFSwKZthubCJi1DM/HNw1gEjSZT+fin05oxwqoBtnZz5efW6pNcS4/hBSJ?=
 =?us-ascii?Q?qhGPBuuYJrIaK+uHrEy9X160+RD8n56CI2KADYptWv/1G1HqKCH+JNzTd9KG?=
 =?us-ascii?Q?QZiIYxZk8n97oTe9/oKBDww02L43XVeyc/7rlu8xDDd1ZXJIPHBi2AUkFdnc?=
 =?us-ascii?Q?3Hmb8d8mdUA7cCaeAt6Y+umWdD2aYWthG5I99Hc6cE0TMTq0HcjUgN/R17gE?=
 =?us-ascii?Q?whZEZyYuYnCndptex04kkhwbjLS10lfS7lSyRlmLhNC1vHvJBrEPIzDZ/IO1?=
 =?us-ascii?Q?Pp735yNJ6lSMIBLx6dmR3+bNcdtI0Ys0jh7uZHKHkvNxvkUdBs7L7w4XiajI?=
 =?us-ascii?Q?J4ebRYvtr7JkSVQg6Lh3SLGaVchhUzMXSZ2eTdMUac70/AJVfM/VBHj0pZAZ?=
 =?us-ascii?Q?oGRqW3JmECZhiRgW2QQ1C8HerNAq33e2Z3dFRHJJttJ3Ng9BzUGQ+PVkG+OE?=
 =?us-ascii?Q?fbj1Tg94+jz6lyIlEPxMmcJB8J7lbEeqWpcdadPyfez/SRhGK3ELqY9KIlWp?=
 =?us-ascii?Q?G9Rtg05eE941kaxNIcn+Cmkd48spYaUJ0fJy2LoQXpmb002X458CTxWpdkLJ?=
 =?us-ascii?Q?8w5y+HmGFedy0SkJ3+ovUxxWoEabizPfEWRtq2LCL6cfQLEAMbyyXO2nSMXe?=
 =?us-ascii?Q?8LIUFPuCrxV2aQSaM6ynnODhPGj7RNr7Xkqwtez01LbMnuAc1wo1i0+TCTr8?=
 =?us-ascii?Q?aQmi4Gsj5r8z9HLC9kazCKWaFDRC50p/4/mTHQH081ev1UAM782Z5wAWfZXr?=
 =?us-ascii?Q?XzDwuQJYhU9ZbFA+j5Fx1XwF0lEhMTM1sTccuI3NMNnctGhGomU3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2cf2a21-7236-45b3-8937-08def3d3cec4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 16:00:16.9342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKBnAdQYTUOIFmw+k+13TRBfuYZw7OavwgQ1FjxC+QQQvgvxLEmYAHHnijTuR67vRKjlSB0ZP6ST6SwJhiBT5XyJhFe73j6BmgwXPn801+y7mcFm3kgK7bPxfO0exsUE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9463

On Thu, Aug 06, 2026 at 06:00:14PM +0530, Golla Nagendra wrote:
> Remove the unused ZYNQMP_DMA_SRC_ISSUE_RST_VAL define.
> ZYNQMP_DMA_DST_DSCR_DONE was also set twice in the default interrupt enable
> mask; remove the duplicate bit.
>
> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/xilinx/zynqmp_dma.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
> index e70874d65123..fd2dee4ea17f 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
> @@ -112,8 +112,7 @@
>  #define ZYNQMP_DMA_INT_DONE	(ZYNQMP_DMA_DONE | ZYNQMP_DMA_DST_DSCR_DONE)
>  #define ZYNQMP_DMA_INT_EN_DEFAULT_MASK	(ZYNQMP_DMA_INT_DONE | \
>  					ZYNQMP_DMA_INT_ERR | \
> -					ZYNQMP_DMA_INT_OVRFL | \
> -					ZYNQMP_DMA_DST_DSCR_DONE)
> +					ZYNQMP_DMA_INT_OVRFL)
>
>  /* Max number of descriptors per channel */
>  #define ZYNQMP_DMA_NUM_DESCS	32
> @@ -128,8 +127,6 @@
>  /* Reset values for data attributes */
>  #define ZYNQMP_DMA_AXCACHE_VAL		0xF
>
> -#define ZYNQMP_DMA_SRC_ISSUE_RST_VAL	0x1F
> -
>  #define ZYNQMP_DMA_IDS_DEFAULT_MASK	0xFFF
>
>  /* Bus width in bits */
> --
> 2.43.7
>
