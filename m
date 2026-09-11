Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013067.outbound.protection.outlook.com [40.107.162.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDA334252D;
	Fri, 11 Sep 2026 15:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141373; cv=fail; b=s8sFpg3dDpgNPY16d5b8JnvJkwnUlqBbx8KWaeDDro3r6gOvL2I6BS3VqcgF/+RXGuTOI9wtsDHZdEZKNbFhoG2rZhJWX9F/Kwd/Ey2fuunU//+1vvStCuXqH0S8bkfbvdgntB2pqhdT4IhRjEnV5cDu6xUxrUMA79ZvL0MH/rM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141373; c=relaxed/simple;
	bh=JuDhobhdaei7tXTz0Q7gCYQe0qW2YpIEKSXLIS7loqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=i1gtB5zVQboAfdiCLrimq42CTOTdn5XHYsZHDInrWbq6KbZEFUgf8Bdp3sCT9aZVBlG5J1aOSW9F7O0i2WDRX1TQ96P4yO5ZmYexbiXLoKO+euPT6BC4kY2tDTb1TrwyCd87o4YJClCo4Wix4aZHGAEpsEwRyEgQqnD4a76D+cI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Za7M7Ryv; arc=fail smtp.client-ip=40.107.162.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Za7M7Ryv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EBXmxSBeyfYkcJJIrPwcfYlfiz/YuhHnUP34ird1swdC1ytJuz4tCbqOWtq44VujZrHzgcmWH3xD8of+RGYOxATvzZ78UfcbUr5T1lF85EoW7OISxFDCmkJkyxLRmYkxEQ25r3+VWwISYJk+ulaP45L2TqvjTWwbaIHXDmBhlmRYDtsOAYe1Em6NVU03JJhk+9LUlimS32aGKBmwTjGomIxE6hX9FZahkB5L16B/mYn8Jk17HudnVdNmerWgazwaV9R2n3yQA4P0PGv9MXwfd3nPMgccqynmHR7UJD9Kne8LFNN3pnY/w2jUeHoQDJsDJem9giuzJSk2XiKvzJQrvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yPmJHUx+l0eY/P7U+LPMHR6gRZZ0CyayY8CRbYSDyQ8=;
 b=OAtBbAlzM2k1UvsfKo6ef75FhweOQqD37Rn/VmSL5QfkKDliP+iQuaK3ZMfM5q1SAa2+DNYDLwxliuh3FEFjPc49IAKiZoFRv2N/0w9W77CKeTg7dqX8a2BObmjBHXembB7n9jFoCLNQoqImqr9xwZDCjOMzLanP0PxxXLe8CRe0y8qx0T3obLvlbft1p5Xzyl2nVfvPSdCfXyL8BsK2yFHl1ahesNEGnWmO9tF3lB6BTwtQw593TR8+cWTueweBtUEkzWvd3bcDWDdRSG7f21Pi/eKWZCUqPWbJRkVLxb7B98vUxo/oDx1nbCQAD7WDyG7iqNTTneTnpms0VVuwlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPmJHUx+l0eY/P7U+LPMHR6gRZZ0CyayY8CRbYSDyQ8=;
 b=Za7M7Ryvxfo+K2vTJl7Kum80Nw0loR3D6yAGfKw4fChXhcY+regSqdgR6L8RKXj5sgCT9K16Bb83p6sJ7xbNXzuicXR/ud9aTVNIaWtCbHkLqUQ4M1Z+BeWJg/ozXo28dOhA3qlU9aH8XYr+yTTVeitofYUT0dBiwyu4qQg3yV95Y1lG2lqaz16nWpGSNuVexUGzx6pqtXxvVLHwlDkSYZDNrzhI/Bzs+ivkK5EEMc5G/R+FtQAWaejKXmxcTp68oo+/SpUNITFkLtSDoOmhceo8hRYKzCQcRhVRl45LFXbSnfQ/9DfzpkJbqzz13pEW9OE+m5GlEYcMaSFZj/1NIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11635.eurprd04.prod.outlook.com (2603:10a6:150:2cb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 15:42:45 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 15:42:45 +0000
Date: Fri, 11 Sep 2026 10:42:37 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	Harninder Rai <harninder.rai@freescale.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: fsl_raid: fix 64-bit ring base address
 programming
Message-ID: <aqQhbfgHrLUhnqVR@SMW015318>
References: <20260910201717.44891-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910201717.44891-1-rosenp@gmail.com>
X-ClientProxiedBy: CYXPR02CA0068.namprd02.prod.outlook.com
 (2603:10b6:930:cd::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11635:EE_
X-MS-Office365-Filtering-Correlation-Id: f10c4b61-5473-44ce-0fc8-08df101b52ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|1800799024|376014|11063799006|56012099006|6133799003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7cgX+XpzF6hAtw2KrUPTynNp/J7y1DBDIZ4pp9CdJDuS5t/MSFY0UObPnhFqXuLySctHHEqLjySRka8c/HRoTkcuxuLr8rnZ4scF5Ms+zkaAlXGytROFWlIVDbb2XtU4JCneiDb9fGvgJeZt+m2WNt9ahtL3HI4zxGwDb3w0gsOGE1/mAst9sEGHs7p1sC11SQDh3Awuy0p7OaDhpCnWE+g4enArADLFaAO3ItNr30mQmOCH3bw0D5nngAU54pO90QCmEBU7LoCGi99cWMAjKJzIAm8f5YVmFI60Zpap3xEPXQ20H2uog/WofDwLcr/nYEYWmoWhEUcUiTsq0iNiy4vyE1yjxoTowtSURCCAip4ntKdNLxqEqodjoZ6oJjZOmTZhN9fhHlbDoA5BKEpQpS1oKUEOqvpsUvuDOAVcy30zXeQlW/W/FDHEW2bHXBh1Tsgf8pNZ9+HHRUVRwIwN9e2b8gtE9uVHELMnEZPqK88m4pH3JIL6J51azIo1163CwvBzeWLSJc/8fW8EBAJgq7kscrYBi8ONJ2Kg/AnZmpzLq9aeG61d2yP1/FMbOjlBIbkSMhqb5lgCVweiDVSwZzYHkpfa6f4zPfN1FdgHI+5rOYZ354mNbA5H/5vdWxHVDxEADW3454fDmXGEFzHeGh7U+ef0crLwiUkmigRJUgA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(1800799024)(376014)(11063799006)(56012099006)(6133799003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CnXBCtcn26SPBS8Hw8GPdUTg3FoOMpARYjJELG/oAnfw9A0sK6ax2xvvH7XH?=
 =?us-ascii?Q?h5ac1jVKZXPfZEmbb0Gt6sKuLzhFIkaJBmToF/qZiC0rxJfvEpJ1CUtbQgMx?=
 =?us-ascii?Q?lP38hWvKVpfFMtgGh1MSCSdPUNeQSsXFCHcca1r73w2LKlA5J/deGSIa79Wi?=
 =?us-ascii?Q?yiGYBVdPWwCqi7MBJHVzjOFRSt5eDIr+1LXbY8qd1+yk2S18kAwE2X6+kwhe?=
 =?us-ascii?Q?wII0+kqecjhO3O3LV96ybr2UGrihphZ26a7Ozsj+Ip4Lbh0ZyQMo49zaDT5B?=
 =?us-ascii?Q?6qmZdFrOJh057+1UvFtG4M9e8PtZktQLBnbp3VGHQc+slC0BO/tQ2iqD+2kC?=
 =?us-ascii?Q?C7yV5RBV615wtJZYDGtVOjv/Z007hA9QMCO/lmW6arOz4JStobExhWIrjpAt?=
 =?us-ascii?Q?vbdy7MGAq2MTOctInr0XWu7Xvj1xHmVKFC2H0oPEQM3yCyTfCkwlrnqTCy4r?=
 =?us-ascii?Q?BO1ttOxDvdKl3UTxseot69IPt+FgxEXiDie4ne0xHFUk23feMwIem7TKNGT0?=
 =?us-ascii?Q?3smygKPD11fYw1QdvD0dFOUvefSoM2Ue7JIAg9PhocgxLGLP405mxgwFovWg?=
 =?us-ascii?Q?7ia26nqsEzRB911FgBPISlpLSPqk/S6ZXb+1A2gJ70a+Sso1wCgjjcBWjpIS?=
 =?us-ascii?Q?Cfhjlc39OND4oqiG/SHbXOsBly1BHlyRPB9+mMtueQSECop6Lv3ZiFubCfWD?=
 =?us-ascii?Q?K/7rimSyLSwa9g2hdcuOy7qliH8kcTLSKDhEa5q9dQxn9BDk6mdYbY0CU+6t?=
 =?us-ascii?Q?fHmBeRr2WLN34fgLfJLqmBp3bG4qju2mHG7GEFGsv5fVRgsiJLtXlTmhwefP?=
 =?us-ascii?Q?yz7OqDSBctz/z2+yvMptnZWelNMRzIHhEJ5yXNP1TCrgm1+HMiq9PpIkbbzR?=
 =?us-ascii?Q?WbEGyGuhdSLzGHrAOqaHuFezXgT2NVNiak+WlELv65/w06IRRlxdjnlxNL3X?=
 =?us-ascii?Q?zm2E5HWJK2G+mevdT5Lk+W7o8gA7GuteHVWCwCaI+Hs6JvmUhQKIJmxAucNE?=
 =?us-ascii?Q?c2epNJUKshYYGm/VnCmfPpr9JhvS50hCb7ugYXnl90kMTg5K3dSr5sWuYEop?=
 =?us-ascii?Q?ZWLEeR0jyaBmavMJZHTLzP2QgDxYEuRFw3QFxRxqZhV/UzreBKL9Kg/pImcq?=
 =?us-ascii?Q?x2xOMKwaAtSHhn589IpFnMRDXbLiOjPgJ0TLFP2cb79Yln6ojKVnxebScvoT?=
 =?us-ascii?Q?1pP949DkpM3y7bP3LVidnMSbDP9Q0q3ZvxU2ULw5U1GpI1zTVlTYuJJDJ0W2?=
 =?us-ascii?Q?9BlbgP6OzgxltZEjCEv3VM1YDPZRd28utkmNST1UUJgmwDrRIGIZJ+5sIi+t?=
 =?us-ascii?Q?usqtSrbxvU0Ptyry/tTii+3T0EYhklRkefQSVrLNcLjg88rv9D8POfoDbPQ9?=
 =?us-ascii?Q?tww7MK/4TNm0/3V1nRA4TVcdFj9JOz0olykeBGZ/KP9EzDG01nJD6FM4pgb9?=
 =?us-ascii?Q?/wsCahtrZx3ViGFMFEzoVJSzGr3qVY+xK5ZuHh/k8h8YzzoPq5OV8va47HfY?=
 =?us-ascii?Q?bxnYpHUl3wP8Ipezlyoxq3BRW/66y71QaN74NWLG/XXgLugtXc03phf36BAY?=
 =?us-ascii?Q?lY2NU0zeZwokbxiwkt0ncg8sYlHgh30+8N9m88abPzxlmpdKCcdtdKvtSt8L?=
 =?us-ascii?Q?ameZ0QX20aAoGNJrGSkqEzjpNFlH9H1JIyKSKEmI3SrEhEHGpJ+tMct8ch32?=
 =?us-ascii?Q?T8hcQo/AwF5gnNPRFgeeLQRNy81F7bhMBW0CfDank8q6X7Ugvc01VDG5YiIN?=
 =?us-ascii?Q?BPyA0/L/NrLmeo+wipdF5WsJluCKzGJwVBezWInXz+fF8pqwsaut?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f10c4b61-5473-44ce-0fc8-08df101b52ff
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 15:42:45.5289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ngjxp6gIgMo+uOPozdhP6RUfynSh656AMNF6WKbi9KmV6KXTnDmx/ntKmB75pbwIllIkNk+HsyOsAYjJa1sFr1hYaY9YjZg/mdIGDAcKQ5iw4ud3Vy2da60xZWS3R615
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11635

On Thu, Sep 10, 2026 at 01:17:17PM -0700, Rosen Penev wrote:
> The driver claims a 40-bit DMA mask via dma_set_mask(40), but the
> inbound/outbound ring base addresses were programmed by masking the
> physical address with FSL_RE_ADDR_BIT_MASK (0xF) into the high register
> and shifting it right by FSL_RE_ADDR_BIT_SHIFT (4) into the low register.

This IP is too old, which only use by power pc. I supposed you have not
hardware to test. Maybw 40-bit DMA mask is wrong, only support 36bits.

And hardware base_l hold 36:4 base_h hold:3:0,

I supposed this driver is tested when upstream. this change may block
function unless you or someone can run test at real hardware.

Frank

>
> This truncates the upper address bits and, worse, places the lowest 4
> bits of the address into the high register. For any ring allocated above
> the 64 GB boundary the hardware reads/writes the wrong physical memory,
> causing silent data corruption.
>
> Program the registers correctly: the low register takes bits [31:0] and
> the high register takes bits [39:32] of the 40-bit DMA address. Replace
> the broken FSL_RE_ADDR_BIT_* macros with FSL_RE_ADDR_HIGH_MASK.
>
> Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine device.")
> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/dma/fsl_raid.c | 14 +++++++++-----
>  drivers/dma/fsl_raid.h |  3 +--
>  2 files changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index befb4bb69d54..7343833b3b34 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -715,15 +715,19 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
>  		goto err_free_1;
>  	}
>
> -	/* Program the Inbound/Outbound ring base addresses and size */
> +	/* Program the Inbound/Outbound ring base addresses and size.
> +	 * The DMA rings are 64-bit addresses split into high/low registers.
> +	 * The driver supports a 40-bit DMA mask, so the low register holds
> +	 * bits [31:0] and the high register holds bits [39:32].
> +	 */
>  	out_be32(&chan->jrregs->inbring_base_h,
> -		 chan->inb_phys_addr & FSL_RE_ADDR_BIT_MASK);
> +		 upper_32_bits(chan->inb_phys_addr) & FSL_RE_ADDR_HIGH_MASK);
>  	out_be32(&chan->jrregs->oubring_base_h,
> -		 chan->oub_phys_addr & FSL_RE_ADDR_BIT_MASK);
> +		 upper_32_bits(chan->oub_phys_addr) & FSL_RE_ADDR_HIGH_MASK);
>  	out_be32(&chan->jrregs->inbring_base_l,
> -		 chan->inb_phys_addr >> FSL_RE_ADDR_BIT_SHIFT);
> +		 lower_32_bits(chan->inb_phys_addr));
>  	out_be32(&chan->jrregs->oubring_base_l,
> -		 chan->oub_phys_addr >> FSL_RE_ADDR_BIT_SHIFT);
> +		 lower_32_bits(chan->oub_phys_addr));
>  	out_be32(&chan->jrregs->inbring_size,
>  		 FSL_RE_RING_SIZE << FSL_RE_RING_SIZE_SHIFT);
>  	out_be32(&chan->jrregs->oubring_size,
> diff --git a/drivers/dma/fsl_raid.h b/drivers/dma/fsl_raid.h
> index adbfede330a7..748047996bbc 100644
> --- a/drivers/dma/fsl_raid.h
> +++ b/drivers/dma/fsl_raid.h
> @@ -66,8 +66,7 @@
>  #define FSL_RE_RING_SIZE		0x400
>  #define FSL_RE_RING_SIZE_MASK		(FSL_RE_RING_SIZE - 1)
>  #define FSL_RE_RING_SIZE_SHIFT		8
> -#define FSL_RE_ADDR_BIT_SHIFT		4
> -#define FSL_RE_ADDR_BIT_MASK		(BIT(FSL_RE_ADDR_BIT_SHIFT) - 1)
> +#define FSL_RE_ADDR_HIGH_MASK		0xFF
>  #define FSL_RE_ERROR			0x40000000
>  #define FSL_RE_INTR			0x80000000
>  #define FSL_RE_CLR_INTR			0x80000000
> --
> 2.55.0
>
