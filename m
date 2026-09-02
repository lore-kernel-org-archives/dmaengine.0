Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010001.outbound.protection.outlook.com [52.101.84.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549103D9DCC;
	Wed,  2 Sep 2026 15:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364181; cv=fail; b=VkFaQINNTkZ0pFykupQfiepqu2mxln2k12qLI1+P1JWIBovbglY6K6Yz6M4bEWgMkU2No1fgyjl7w6oQBX+CIMZIaxuC6OOM2k+qVFoP+dZryCA//vhQEerAQgzI21GgIjqM5KIS5+Xk/HTM3YNjrXmaRG1WIKCgp5wl/wby0jQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364181; c=relaxed/simple;
	bh=sYRIa5E+HetCu1TR/Ih9oqLFu06+/d39WbYZYqmOhm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=W0pRsiEVgiTTgEHFXfz4xVk+TSUL0XNXmhAg5QOXKnqaUFq2cg3iHNXpkE2ohxQYb0YkR1QPo0TFrFGBix9QLmM9JxLFP7hOOkBP5ePajU1TLS2Z5ifPc2nIzdqnGRbTx4gufEHfEO8DxbQ9oe4idgC3S6AVDJPJlZrSjkd+Y9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cZbyE5qe; arc=fail smtp.client-ip=52.101.84.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cZbyE5qe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgITeIjWn8tx3GxptRM0cSlH77rBDoFCxotVncIqOsyU7SO6IZHmrA5azZsr9JwhnCsjwMo/Y9m9bOFWv6phrvo1BVNYgpmQFzz82k7vPxQ5I+dKDIluHp0FfcfMx5FTUi6oJb/esM5uEq3pq/KWFQ5O00Hz4rUOISdRn27TFU7w90cAklXj5Yp8MUKxQGkrvE9id9lMx+svtPD+hWCdm/txDgvzfBtBJfUbbDwjK7WJ+HF21yI3ZqbKnDiZ+dHhzQWqFD1s39CAQnZCiG81iCDwk5/kN5pmnAooepZx437cSYNuwC3NaPzTCHhEwp5PrRGti2whPAE2hnA5PRTnrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmNo1KMOhClFLvMcrHuBS1dWT2xiiQVwtuczTcoMaUM=;
 b=CvjDJ0NUa/UpcCl8MIuENW9iDn0FDdv7ZNTqZJOA3w7blkRMsdnnMOhGH/XYfrkEGghjmU3ZjMjcl8Alvk0FoR0Tv09fIuIkSjhua77NcWZLSJi8T3TrdrESkkRUTVOuIMV39CDJ0N0wM1RX47xNZEtqu2uRV9d/sNDF5XktM04kZojcrsZ1dkzKlktwnEArcYveeun7KzpO7pMAyjxEp65QwvstA21qFwuCV2+fRVqY9ivgT5pLimfVegygB6dYPnrHZcwWUWPoTyeaZ3JLhJaiL8t06QJNRJhGEjRhKYNS+L1cAmbchYOMEgpg0heIc9r4nYohECvjBWj07rNkPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmNo1KMOhClFLvMcrHuBS1dWT2xiiQVwtuczTcoMaUM=;
 b=cZbyE5qeG2c8jB70teiV4ueZ7/WYy02i4R5N9HCsAEGZW9spTUVsDuT4lKCxw5JQ7XVcV+HGPx64Hl1tCUO2rudNTleXqOSpevAWSsJ5EfRrWVNAtZXh7CJJjCDnpXcbhHc6ZF6oM2H95JXZl++bgSIMbp/HlvD+tCOcSmTmWgbief1NVCJTF7T+eVkTq7QTJbOqj0mYik1mbq3yVbsgnvQty+0H5V3N38Zhds2eep3rtNc+HGz2EtXnP3SLJVa3ddT5BLTBPS0p9Q2dcmvIP+xzqcFan//qjcS6/wEOQ3nFPI5jqk4ebxwjwsg/Ko8gqPylitPYYOzZPLtPADB73w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB7198.eurprd04.prod.outlook.com (2603:10a6:800:126::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 15:49:33 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 15:49:32 +0000
Date: Wed, 2 Sep 2026 11:49:24 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 00/34] dmaengine: migrate channel tasklets to WQ_BH
Message-ID: <aphFhDMOmtTtmoeY@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1786384168.git.allen.lkml@gmail.com>
X-ClientProxiedBy: PH5P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a391715-3e02-4e7a-8287-08df0909c789
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|11063799006|6133799003|10067099003|4143699003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	t9qulI2gVfa+Fpg4KtiJ1Y4hbrxGfZBwhid+KcjwLD80ZEQYIdRnLMCw95J1MTMCpK4uEUbaQCXT0ltaJNmdvXwryZ7pgBTrXlRcCkQo5s1nXcw8d5zfRUTgtZXFpHWZaDHlnq8NaRwGMz3F6Wey86oUpLQP6sdec+uVk1PTfL867ELogQki66WGKt4nhZYxgHQXKurgZ2Ce3fsI2lqbdtmIx0xx8QltNN3tHYkuumXOh9O4/wjZYLJ+bFDZ8FW9d+M04LCTIXbka3D871yPLc4EqmuI5Tijs6Ys5mZTt+8awvnCVPCoSQTH1hkoMcX+azVJgfa2ih4BdbeALDrpiZGldgHyU1Th72xzVtnX9/2U7LjMSzartg7uaOIVwhhx33h0/rJwexcOnUkySdsGQcSdw3c0o+S98f/IBPXzC1nRMbeE1pSt877gH/icP4N+Y59bFvMxNkmtGGf9Fa2tkIZZIAwM+B4caUXPgcPD8yvbFpjfrIaQ1+XIm8YLpegOJ0y3fjEQ4nt0gubWVSvizw2u7gkXGFh/n6Y4jkTIbC7prQuOXKxAj0XQWZNlynOoDhwmZ9S6mwDwBr0BinVAVaAJcfQ7e2A4DuMAW+3tCZ47rdcGOE9EE9h8KaTfGC2rx/ZY3tZ8U0Q0RS5Upph/Pm24zU2XWLHDiZJ92EgSnaM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(11063799006)(6133799003)(10067099003)(4143699003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QsTrZIpPJVG3wY8aV3StfQnW3GVi/XzLc9uK4t3v6RSo7sJ+pxBpZV7l4xXB?=
 =?us-ascii?Q?oJg61556FukSahxfDb+g1iiTXj82cGqu7R8+yDL7qK9cjdEhxOWRd9t4Qu2b?=
 =?us-ascii?Q?eK3OqfPD8M71pwEiWNhpqvbVEObVNOrnrh8sXGmAJln3bFOEfR9DsF7SltTh?=
 =?us-ascii?Q?N+JusU8ikDBQPveRbiX1QOZiKvAypiTljtUnNsJJNSSNpCMN86KemFdWxlGY?=
 =?us-ascii?Q?flER/13O+jnDIX6/OwWGKLtutLp5vx6v8kjijhHr5NT5r4LSiUWVrJWCOGNM?=
 =?us-ascii?Q?5csY+vxLclwdYSSlubeBoyxRo9kPWqpPpch+Yai/fed+8JLPmk68SfjHfgM6?=
 =?us-ascii?Q?b7QFAzIe30572PuGQYmFBfMEBXv/6ZQkgayanuxRq926G6F23XjKqxt/w2Ga?=
 =?us-ascii?Q?MXrv8NNixV58BL16Y1aU93oKhtZauoKWMsQVKO3RDy4llzApesAhxk13gfEo?=
 =?us-ascii?Q?4EAEFQgc/V8CT4Dz2e1cmpn8BSLCCVPG3m66mvHZ+wDCHu/jGA8OLOBesUHn?=
 =?us-ascii?Q?bWyzWZoAezk5gr9SuhEglsFNm9RNJnL2PvHKvQ1RDKFR0XiU/AXhRRyIyuuX?=
 =?us-ascii?Q?yN1qaLt8NO/1fis2+UhMNDfhAP3VPA7/ToreVK8pETbWC//IfIJhuOuorRta?=
 =?us-ascii?Q?Opx1L+I3nacdfUptnTJPkrIrUSd75nW0eQ7ogUx6hHiSMZkhPePYwdqoA9Lf?=
 =?us-ascii?Q?3mBN45tUeEWxR73lUnZ7C+aTgdRrntp4N9hytX3ecgsXlbrxDR+caj4dE5sL?=
 =?us-ascii?Q?ylCk1H6nqfBw2Wt/Dph5whNB55siyvOHnnIzMMcvcqNF6d2DeIpk22euVO36?=
 =?us-ascii?Q?sSGQtSzROVg9hEfvkcsvJ7DMKr9K7nmQ6RA5g4RraxC+24azCYiSSfbPrwvn?=
 =?us-ascii?Q?O1b2R3exA/XLPxwImSVgNt+dbViU7vJF4Am0ZtW/A6xyqb48zqt7azNI/MPc?=
 =?us-ascii?Q?yxlLY8JzVrzQctWRtL4E1wDKLEBLwZn8K3FGf6ht77bKQauzoNIJJh3TEBRL?=
 =?us-ascii?Q?AxlNjq6I3AOAu4VccK+g35cijC8CA9kOItTdcJ4VuhVUXmDfTMSSZBU7sse4?=
 =?us-ascii?Q?Gq9cpiLew0wPrOkreiQkQUB3e8zSxf3affj+GBSPoWTmzNiaV8nm+MxPMbnM?=
 =?us-ascii?Q?rHx6a4HS5oKcKSbZb7mPC+l+LJU1scCYidZXsWED8rDjo9CJKAPtQjIAR4Vf?=
 =?us-ascii?Q?jagmVN/lVqn5QJWPaM2mqA6j7bdA19rGdHDqyF8zD8ipaohSySTX2sHnpPSg?=
 =?us-ascii?Q?9xdKXeFOPS6TX1KOn8wsLIRxZOoevpO9BuvBqixHtM9j8zOViHwc3Qbq5UmQ?=
 =?us-ascii?Q?ZGwWjnP2Ky1I7fE0V3npr3XCe6SKOAX5eX7lcFgS5/qB0AJEgkI0lTddOBrh?=
 =?us-ascii?Q?vV1GhU/jEvo3xlMo0IW27Bt+PqBx5jl0FplL19Pd2RB3SIxEKHzLPzzbcH7X?=
 =?us-ascii?Q?mMZYZlytIDLn6Hex/PS4QpI9ao3ck6pYCaPOkNbx5XJkN6od7eQXi+Pk+2JD?=
 =?us-ascii?Q?5A683gOfLYEBFUxaeB69qpa0zUS6GnoRAo6TWfAmSII3oRmJa+E8KeRZ3APu?=
 =?us-ascii?Q?u4rGBSEZl3f/sr3AJGt5IVK8fgxLyzNPRQvJPPH1vZuWjvSCeRoOE+gBL/Gp?=
 =?us-ascii?Q?yZ1WlLvM7Ji4saqqm1BWkl692vJ2S7QQcweEmssv7m+3qybJFL4yauio+HCA?=
 =?us-ascii?Q?9YAN5pw67uruZi0nebyGibY7HONrrEoi2XYPOukVZMHumBXyDW3i9MQ/fPHN?=
 =?us-ascii?Q?RZp1EIntC19k91vMiCvASJ8u/Rg+dlpdRL6USKTghIqA0cWwMnhw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a391715-3e02-4e7a-8287-08df0909c789
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 15:49:31.9226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KoBO1Q2nA0KreRRaFj7tMiTUchs+PPwwx7Is3FtPKaUAHX7Z4OOSnqebDlspvEh+MiBByUPpvtID6AwSt4h5kYrUCNXckFVtU2YD1B59sfMHCcMmeMeiLQVr/BW/CFLu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7198

On Mon, Aug 10, 2026 at 11:09:01AM -0700, Allen Pais wrote:
> Hi Arnd, Vinod and Frank,
>
> This series moves DMAengine client completion bottom halves from private
> tasklets to a common per-channel API backed by WQ_BH.
>
> The first patch introduces the dmaengine_*_bh() API with a tasklet backend
> and converts virt-dma to it. It also updates every driver that directly
> accesses the removed virt_dma_chan tasklet, keeping the patch buildable on
> its own. This separates the driver-facing API from its implementation
> without changing callback context.
>
> The second patch switches that backend to a dedicated WQ_BH | WQ_PERCPU
> workqueue. WQ_BH keeps callbacks in softirq context, while the common API
> centralizes initialization, scheduling, and synchronization. The
> workqueue helpers remain internal to DMAengine, and dmaengine_kill_bh()
> drains scheduled callbacks to preserve tasklet_kill() semantics.
>
> The remaining patches convert driver-owned channel completion tasklets.
> Tasklets used for controller-level processing, recovery, or other
> non-client-callback work are deliberately left alone because the
> appropriate replacement may differ by driver.
>
> As agreed in the RFC discussion, selecting hardirq callback delivery is a
> separate API change and is not part of this series.
>
> Earlier discussion:
> https://lore.kernel.org/all/20260108080332.2341725-1-allen.lkml@gmail.com/
>
> v2:
> https://lore.kernel.org/all/cover.1785183549.git.allen.lkml@gmail.com/
>
> Changes since v2:
> - rename the new public helpers and callback type from dma_chan_* to
>   dmaengine_* as requested by Vinod
> - update all direct virt_dma_chan tasklet users in patch 1, fixing the
>   intermediate build failures reported by Sashiko
> - fold the resulting 30 empty teardown patches, reducing the series from
>   64 to 34 patches without dropping any driver changes
> - rebase from Linux 7.2-rc5 to d58772d8520c (latest Linus master)
>
> Review tags retained on unchanged standalone patches:
> - 09/34 IOAT: Acked-by Dave Jiang
> - 17/34 STE DMA40: Reviewed-by Linus Walleij
> - 27/34 PLX DMA and 34/34 Switchtec: Reviewed-by Logan Gunthorpe
>
> Review tags received on v2 patches now folded into 01/34:
> - v2 41/64 HSU: Reviewed-by Andy Shevchenko
> - v2 60/64 BAM DMA: Acked-by Bartosz Golaszewski
>
> The HSU and BAM DMA changes remain in 01/34, but those patch-specific
> trailers are not attached to the substantially broader 35-file patch.
> Andy and Bartosz are copied here and on 01/34 for visibility.
>
> Testing:
> - x86_64 olddefconfig, make -j$(nproc) W=1 drivers/dma/
> - the same DMA build with patch 1 applied independently
> - scripts/checkpatch.pl --strict on all 34 patches
>
> Allen Pais (34):
>   dmaengine: add tasklet-backed channel BH helpers
>   dmaengine: back channel BH helpers with WQ_BH
>   dmaengine: apple-admac: use dmaengine BH callback
>   dmaengine: at_xdmac: move irq bottom half to dmaengine BH
>   dmaengine: ep93xx: hook callbacks via dmaengine BH
>   dmaengine: fsldma: migrate tasklet to dmaengine BH
>   dmaengine: fsl_raid: run completions via dmaengine BH
>   dmaengine: imx-dma: flip per-chan tasklet to dmaengine BH
>   dmaengine: ioat: convert cleanup tasklet to dmaengine BH
>   dmaengine: mmp_pdma: replace per-chan tasklet with dmaengine BH
>   dmaengine: mmp_tdma: hook completions to dmaengine BH
>   dmaengine: mv_xor: convert irq tasklet to dmaengine BH
>   dmaengine: mxs-dma: use dmaengine BH scheduling
>   dmaengine: nbpfaxi: switch callbacks to dmaengine BH
>   dmaengine: pch_dma: convert tasklet to dmaengine BH
>   dmaengine: ppc4xx: replace irq tasklet with dmaengine BH
>   dmaengine: ste_dma40: convert per-channel tasklet to dmaengine BH
>   dmaengine: xgene-dma: wire descriptor cleanup to dmaengine BH
>   dmaengine: xilinx-dma: use dmaengine BH instead of tasklets
>   dmaengine: xilinx-dpdma: kill vchan BH on remove
>   dmaengine: zynqmp-dma: switch completion tasklet to dmaengine BH
>   dmaengine: tegra20-apb: use channel BH helpers
>   dmaengine: timb_dma: route callbacks via channel BH
>   dmaengine: txx9dmac: route callbacks via channel BH
>   dmaengine: mv_xor_v2: use channel BH helpers
>   dmaengine: mpc512x: route callbacks via channel BH
>   dmaengine: plx_dma: use channel BH helpers
>   dmaengine: sf-pdma: route error callbacks through channel BH
>   dmaengine: pl330: route callbacks via channel BH
>   dmaengine: altera-msgdma: use channel BH helpers
>   dmaengine: dw: defer callbacks via channel BH
>   dmaengine: hidma: defer callbacks via channel BH
>   dmaengine: qcom-gpi: defer callbacks via vchan
>   dmaengine: switchtec: use channel BH helpers
>
>  drivers/dma/altera-msgdma.c                   | 14 +--
>  drivers/dma/apple-admac.c                     | 16 ++--
>  drivers/dma/at_xdmac.c                        | 13 ++-
>  drivers/dma/bcm2835-dma.c                     |  2 +-
>  drivers/dma/dma-axi-dmac.c                    | 10 ++-
>  drivers/dma/dma-jz4780.c                      |  2 +-
>  drivers/dma/dmaengine.c                       | 89 ++++++++++++++++++-
>  .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    |  2 +-
>  drivers/dma/dw-edma/dw-edma-core.c            |  2 +-
>  drivers/dma/dw/core.c                         | 42 +++++++--
>  drivers/dma/dw/regs.h                         |  1 +
>  drivers/dma/ep93xx_dma.c                      | 12 ++-
>  drivers/dma/fsl-edma-common.c                 |  2 +-
>  drivers/dma/fsl-qdma.c                        |  2 +-
>  drivers/dma/fsl_raid.c                        | 11 +--
>  drivers/dma/fsl_raid.h                        |  1 -
>  drivers/dma/fsldma.c                          | 10 +--
>  drivers/dma/fsldma.h                          |  1 -
>  drivers/dma/hisi_dma.c                        |  2 +-
>  drivers/dma/hsu/hsu.c                         |  2 +-
>  drivers/dma/idma64.c                          |  4 +-
>  drivers/dma/img-mdc-dma.c                     |  2 +-
>  drivers/dma/imx-dma.c                         | 26 +++---
>  drivers/dma/imx-sdma.c                        |  4 +-
>  drivers/dma/ioat/dma.c                        | 14 +--
>  drivers/dma/ioat/dma.h                        |  3 +-
>  drivers/dma/ioat/init.c                       |  2 +-
>  drivers/dma/k3dma.c                           |  2 +-
>  drivers/dma/loongson/loongson1-apb-dma.c      |  2 +-
>  drivers/dma/mediatek/mtk-cqdma.c              |  2 +-
>  drivers/dma/mediatek/mtk-hsdma.c              |  2 +-
>  drivers/dma/mediatek/mtk-uart-apdma.c         |  4 +-
>  drivers/dma/mmp_pdma.c                        | 13 ++-
>  drivers/dma/mmp_tdma.c                        |  9 +-
>  drivers/dma/mpc512x_dma.c                     | 74 +++++++++------
>  drivers/dma/mv_xor.c                          | 12 +--
>  drivers/dma/mv_xor.h                          |  2 -
>  drivers/dma/mv_xor_v2.c                       | 20 ++---
>  drivers/dma/mxs-dma.c                         | 11 ++-
>  drivers/dma/nbpfaxi.c                         | 13 ++-
>  drivers/dma/owl-dma.c                         |  2 +-
>  drivers/dma/pch_dma.c                         | 14 +--
>  drivers/dma/pl330.c                           | 18 ++--
>  drivers/dma/plx_dma.c                         | 12 +--
>  drivers/dma/ppc4xx/adma.c                     | 14 +--
>  drivers/dma/ppc4xx/adma.h                     |  2 -
>  drivers/dma/pxa_dma.c                         |  2 +-
>  drivers/dma/qcom/bam_dma.c                    |  4 +-
>  drivers/dma/qcom/gpi.c                        | 17 +++-
>  drivers/dma/qcom/hidma.c                      | 18 +++-
>  drivers/dma/qcom/qcom_adm.c                   |  4 +-
>  drivers/dma/sa11x0-dma.c                      |  2 +-
>  drivers/dma/sf-pdma/sf-pdma.c                 | 14 ++-
>  drivers/dma/sprd-dma.c                        |  2 +-
>  drivers/dma/st_fdma.c                         |  2 +-
>  drivers/dma/ste_dma40.c                       | 13 ++-
>  drivers/dma/sun6i-dma.c                       |  2 +-
>  drivers/dma/switchtec_dma.c                   | 16 ++--
>  drivers/dma/tegra186-gpc-dma.c                |  2 +-
>  drivers/dma/tegra20-apb-dma.c                 | 18 ++--
>  drivers/dma/tegra210-adma.c                   |  2 +-
>  drivers/dma/ti/edma.c                         |  2 +-
>  drivers/dma/ti/k3-udma.c                      | 12 +--
>  drivers/dma/ti/omap-dma.c                     |  2 +-
>  drivers/dma/timb_dma.c                        | 21 +++--
>  drivers/dma/txx9dmac.c                        | 12 +--
>  drivers/dma/txx9dmac.h                        |  1 -
>  drivers/dma/virt-dma.c                        | 12 +--
>  drivers/dma/virt-dma.h                        |  7 +-
>  drivers/dma/xgene-dma.c                       | 19 ++--
>  drivers/dma/xilinx/xilinx_dma.c               | 20 ++---
>  drivers/dma/xilinx/xilinx_dpdma.c             |  1 +
>  drivers/dma/xilinx/zynqmp_dma.c               | 19 ++--

There are some dmaengine code out of drivers/dma tree. Do you plan to
convert it also

Frank

>  include/linux/dmaengine.h                     | 28 ++++++
>  74 files changed, 482 insertions(+), 311 deletions(-)
>
> --
> 2.43.0
