Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013039.outbound.protection.outlook.com [40.107.159.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2044A5EA3;
	Wed,  2 Sep 2026 15:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363065; cv=fail; b=aEqeHFRsACHBKA7HvUANOr2tk3BmfijRBHVWC7g9/J8mebiBJdOpgyuBzy/EDLmHRrdp91XW7fLkw7ZnBcTK5x9N31XFlBWp1sDsq2hatAsQKhge/C0sDgbUEKXF4MGl8b2HtV3Ks0ro/44ObK+O820OUpV5O1EuuEyewiiCkIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363065; c=relaxed/simple;
	bh=VjoINcKMJ9pOPFSD1tsdAtQEfNQbUWYk4EsdBB2CrAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=H1MHIjDIPL/qUYdOjLHSPO01Y8dSOGdz+G0bfd/3gEz5cCrQucA1ixws41OhnKh76/PA4Rv8xubt4emDFUg9kb9jldO+nIjMG1xiTG+XkjzawHvUZ5khBmYLdbjTqzZ/1xUZ8U5lzO7Bdtg/BbWz5AJFNThYQ1J//7PCz73ysBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DIyEangR; arc=fail smtp.client-ip=40.107.159.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DIyEangR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yRbp7o7ou/qH/13g0NMxAd/7T/+CN29sFXtnETTm7hp7UtgsJcGvaW8OhiiwkyRhDNLAB6sC+1T0bOiJTfqhjFopEIRzIuv30vJukOIwhOfHKtWJlq+0Voh/tgoS+2ridcu3Un/DFNrJbGcA1g9mxFxO49h2e7ePckqgbwgKXwEQBtkcBrTS4suoYw0QHP01sG2e3A6Syi/CmMtxDZUuLxcCSCIpE6Dzdz6nY+47dxZfDW0IZZSSvreZKJ5AwzPwfdFdrv//k/rz3hw9Ty5Q1vY/j1lFQaXtvbV/CWGcM8Cf1ySjbk81ymvchGRICORvf5A9VbqGPwDmuPGlV3jTmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85v0o8zF5lWYUsIkrakN1C+TDhuta9DrWSy/ozcqNBc=;
 b=Wt6aPUTxhc+DeEYsPVB/g3MWNeeoYbSWE4HXxbEObYPCGemRlueAY4xw1UbE/BCVviWIgHZ1GVmPtF13Xt03jBGznvb8H5nRuBwVa4FKCHf1Q5CqocNhJIQ2wU3TJO96FMV9cFD7H3knO9mofSTnfWDto3r9rFZA24KyZEfl+r7NzL1KP6lF7aYAxu/YVBuNkQyg9hOimdRj1aNa778V0a1a6kVi8osv/+rkkofdUWYSWBYNW21rhPqQiSFPHsGVqdSYSVW0HN4dpl+viYx2U7GpSuXlz3pXuvo50hrG6AyeV1DPkRLv82xPG1Jn26m8DtcS5qpG/KA3998lex3hgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85v0o8zF5lWYUsIkrakN1C+TDhuta9DrWSy/ozcqNBc=;
 b=DIyEangRAztUJCZSrcTnnxTOOajYl+3WZzyl9/E4whe1HxhcYNKwciomL9pmLBGRQVjhHF2F81Ziq3taAGbBB2CJMCvNv/HXwV6RezCggup3NKnPBwr3Hvy49PtCPW0wgBStCFHvkyGry8Bg/CkSyiPJYdMTUCBvyXueT/C2fMrDFw5UqKVTFKy2nTURmWT042JwUJVCTfB4/+YEzsWSqGEGjQ9SeN2y/jc/JKqvGx3MOcNcRPeb0+wL8HIKJmzF5Lw1zMvz3V4uhg3GDXuukVXiCPk770eauDDRpMsBgGgB/nholtRAUZ5o6buqKIhx1U2yz1n1zrOcq+ti4/LeIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS5PR04MB9769.eurprd04.prod.outlook.com (2603:10a6:20b:679::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 15:31:00 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 15:30:59 +0000
Date: Wed, 2 Sep 2026 11:30:51 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 21/34] dmaengine: zynqmp-dma: switch completion
 tasklet to dmaengine BH
Message-ID: <aphBK2xxFiWXmfCG@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <56dce14420ecdf8665c0e03b5f3a42004d33eadd.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56dce14420ecdf8665c0e03b5f3a42004d33eadd.1786384169.git.allen.lkml@gmail.com>
X-ClientProxiedBy: PH8P221CA0027.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS5PR04MB9769:EE_
X-MS-Office365-Filtering-Correlation-Id: f01278cc-13a1-42ad-a756-08df09073046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|1800799024|7416014|23010399003|366016|4143699003|11063799006|10067099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ZNG4PFX3ae8JY2qetxMT7uHBfsyClFtoQOAVwrApKAIkoix64OqqvEmviCbwS+VOJqMgMdM57lkaLDTe7nyryAc3ARs6pEiQtUe8OFAndUhbbkYIuPx5RXixreBo/eA62Ywd/b2KcF9Y/kcScPy0I8PiQzzU2YAK6f5LbKqmrS9SYpcy7vMgMUMzTWWdFjCpD6os6WJObK8gnSdflA/XcnVBtuhNB5qxJiQltUOGRaNRytinD4/odNG/hm/OX9ojUW+FGqW/z5JlSYrUzO5pfI2mtSUcjNQF4RGFBbDDr9p2Tlw8DovPIcVZ9PY2fyMJhR6qboJ/lsILXGIcKXKLn4dTwJIiTEmk4mBNud3wbPJZUcE62k28UU7CzMxvsPngNmnyRMh1GbOLfVVkG4Y1CHTPb26XiR4d9baa9byRQ+NwEf0hUONtapuMSECP6H1D6s3x/R6INmfvVVq+XfBYvqPxJpY7419Yv7Em0/jvcmy06Zd0ZpPVSRlrSmXEWTA0M8GmJkwcnVKAkB9x3bmS8VapqiKBjpkPCs4wvx23HKju58NcqCaNnlFv7a6YGMuyYXenmBZeyzG/iWm6YfI61xNq9/eSIh6ug0pUwVAiHEi2Tr2nR+uhpWBAJonecZ5OyndqGMr2jjJxroS/hsrCAww4//zAy3udk4GsqL+6YYw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(7416014)(23010399003)(366016)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g1uxe2HijfovCOQYCh8bGtdN7MbUzZcjB9vF98sGKxzIv4HGDm4IoLipHeIt?=
 =?us-ascii?Q?6UPCDhJ15OhMnokatT1nhphzb6EHPf5BTczBGcP5IEEvcAkzyPQD5oBdlgX8?=
 =?us-ascii?Q?GXVd6+psCvXQQvrx+Np50/tIrZ4E7fOHALWz3SiW8FfRFj8ff1aiCBBJqPSZ?=
 =?us-ascii?Q?qi+0IVDx2w0422DmROSuYGPKM2LuGi+bFmL6AzeEdGy3fXZ7ZvF0OZVnSYhc?=
 =?us-ascii?Q?RdAjkoA0c7cAlTEKH0HYQ3Yx7/sGXKt42vY8eefSQJPHIqF1YX6+BI1o31N7?=
 =?us-ascii?Q?+zqG4xvEq4QRbahxcjj2eb9KMvDMn+gbF/aSud2c4w4awFzKcKnkAkPA+9Bj?=
 =?us-ascii?Q?iMBHc7Eu4vxz+5YfdBwxD+mEm8WxCEAFgFzqRE6SfE5833qiA5BiDpGL0c91?=
 =?us-ascii?Q?r/KfGQPulc8nlBf4DslgYZ0HEgOdA/7SIBDhAdIolfHw+7vXnkJ0FIZWnojd?=
 =?us-ascii?Q?2gCPBRveUqPSZxt9wrBMPAsdqBIuW7VUjkAb5TvBfm20LpWaRiKgn3A5lo/i?=
 =?us-ascii?Q?GElnWVNAOC5vnv0UoqehxgfCAmmGyvYHP59j4RA9AKTjocdlZ/U3nxqZMSPE?=
 =?us-ascii?Q?TJ7KYSUVhuz37UOJR2It+xvglYD6dJ6r0iynA/FbdbKRiEw2977r4mh3EjH5?=
 =?us-ascii?Q?4QinrIHZ9Zj5tOHZpFG8+rv2LVB21H5Birm1ET6pGQTWlebczLQxWywwyTL2?=
 =?us-ascii?Q?6CmFI48dk4Nh1C+2Zm+Ejk7z0UJgyN5TH7/8MuH9UB/0yfga2nX22NS6ipQj?=
 =?us-ascii?Q?hgtENVHcaZpjXwchD8aAhVOp+vYYFW6I4E0sN2tHJpGEqn5pZpV3cYI8zm8O?=
 =?us-ascii?Q?fDRz/S1KMDRtn9YrfNCMFlfHpGtS0p79rvA/Un3C+Pd1nN91FuuLmN0ywcwG?=
 =?us-ascii?Q?C+mo0u8CxJGdNuIynuJyXK691mqlebughKX/6K1tSbD7M4bkvwl+FwK+jpG4?=
 =?us-ascii?Q?U4cxsqLu2hc2xZ33aYYFV+OgU0yOxLgDPLIFGAmXKGDhe3cBZW/02mRj0Gyn?=
 =?us-ascii?Q?DA/+fCcgyvZSSEc/ydfD94PPranKhdflgpXk7oFG/MUlBWp/H4SOAkgJF3k+?=
 =?us-ascii?Q?K4F6ob8yXXnl0VOKg7skFp9Q9GxXnVjwVg8pMMcpfRq2vWhtIAIga6zBk0d2?=
 =?us-ascii?Q?10fkWJMSvNoAuHtxkT/Dh0/GXMyc12H0h/opkRkNx1CzLmWQ/PtSvdesSZJb?=
 =?us-ascii?Q?4et6q4tON98RruCROK/qZoJYvFu4/2gXz89KRid+tco7rPLxV9uZJf9ZL7wa?=
 =?us-ascii?Q?1DXRtFYMGMd8tCRRnb8dgazqW0bK7EBUZZqyG1pWSV7/Q5SThn9O4mlTNeSn?=
 =?us-ascii?Q?a/vs0H7Pswdneif6wBFAU52FZURwiUre9OJc2TYjqwXvrHLOqc75ofhjqTWd?=
 =?us-ascii?Q?BwfQZjPqYHgVZGw6FoOyDSsJlBqB0VdyoHbe08OqC1KfITWTn0wm6/oT+kgY?=
 =?us-ascii?Q?cAR+V80HjBQh7v/lmMKAITMwIyS+wbjo1r7goNvkmjDvFeFs1Ti3MeIHLlck?=
 =?us-ascii?Q?IrSQ/L/KFeBoVCsUvJhLXeWEYSZdESC6n7EtNJYPmQXisk9sxfYaa+8josVz?=
 =?us-ascii?Q?JIBi5aHDz81srEuFZ5jbMlG/sL//BNBv6XYoAYf13MSKUTxRJ0mYvlBWKdw3?=
 =?us-ascii?Q?MP3lDuiEoFfH3epW6QbvGJ3RcL0aeC52bUUflRy1ipIK1enTmAReVDgrV+oJ?=
 =?us-ascii?Q?gstJQ4IF+C2WZDak74cLmTRGcqhY0Hy87hIAUfyoiYkS9U7roiQEl7uV2xFY?=
 =?us-ascii?Q?A4rU9/p0oo9rN2lhtnVneZYx0WUvnSxZSl3HSTym92V1FtaMxTtl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f01278cc-13a1-42ad-a756-08df09073046
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 15:30:59.1379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yr7Rd56hWBOxO7Y6/+F23TufhqVBW8oB96bKl98jNF/dHmru+twr7w8b0QD4/5YuMLfogg3vXXG2c49VMpG3MW/LFke0R/OvfCOSBQtWpLYYwu1noZceBmtvWFxjLri5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9769

On Mon, Aug 10, 2026 at 11:09:22AM -0700, Allen Pais wrote:
> Replace the per-channel tasklet with the shared dmaengine BH helper.
> The handler continues to run in softirq context while dmaengine owns
> the common scheduling and teardown mechanism.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/xilinx/zynqmp_dma.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
> index f6a812e49ddc..e396a35f0e0d 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
> @@ -207,7 +207,6 @@ struct zynqmp_dma_desc_sw {
>   * @dev: The dma device
>   * @irq: Channel IRQ
>   * @is_dmacoherent: Tells whether dma operations are coherent or not
> - * @tasklet: Cleanup work after irq
>   * @idle : Channel status;
>   * @desc_size: Size of the low level descriptor
>   * @err: Channel has errors
> @@ -232,7 +231,6 @@ struct zynqmp_dma_chan {
>  	struct device *dev;
>  	int irq;
>  	bool is_dmacoherent;
> -	struct tasklet_struct tasklet;
>  	bool idle;
>  	size_t desc_size;
>  	bool err;
> @@ -735,7 +733,7 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, void *data)
>
>  	writel(isr, chan->regs + ZYNQMP_DMA_ISR);
>  	if (status & ZYNQMP_DMA_INT_DONE) {
> -		tasklet_schedule(&chan->tasklet);
> +		dmaengine_schedule_bh(&chan->common);
>  		ret = IRQ_HANDLED;
>  	}
>
> @@ -744,7 +742,7 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, void *data)
>
>  	if (status & ZYNQMP_DMA_INT_ERR) {
>  		chan->err = true;
> -		tasklet_schedule(&chan->tasklet);
> +		dmaengine_schedule_bh(&chan->common);
>  		dev_err(chan->dev, "Channel %p has errors\n", chan);
>  		ret = IRQ_HANDLED;
>  	}
> @@ -760,11 +758,12 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, void *data)
>
>  /**
>   * zynqmp_dma_do_tasklet - Schedule completion tasklet
> - * @t: Pointer to the ZynqMP DMA channel structure
> + * @c: Pointer to the ZynqMP DMA channel structure
>   */
> -static void zynqmp_dma_do_tasklet(struct tasklet_struct *t)
> +static void zynqmp_dma_do_tasklet(struct dma_chan *c)
>  {
> -	struct zynqmp_dma_chan *chan = from_tasklet(chan, t, tasklet);
> +	struct zynqmp_dma_chan *chan = container_of(c,
> +			struct zynqmp_dma_chan, common);
>  	u32 count;
>  	unsigned long irqflags;
>
> @@ -815,7 +814,7 @@ static void zynqmp_dma_synchronize(struct dma_chan *dchan)
>  {
>  	struct zynqmp_dma_chan *chan = to_chan(dchan);
>
> -	tasklet_kill(&chan->tasklet);
> +	dmaengine_kill_bh(&chan->common);
>  }
>
>  /**
> @@ -887,7 +886,7 @@ static void zynqmp_dma_chan_remove(struct zynqmp_dma_chan *chan)
>
>  	if (chan->irq)
>  		devm_free_irq(chan->zdev->dev, chan->irq, chan);
> -	tasklet_kill(&chan->tasklet);
> +	dmaengine_kill_bh(&chan->common);
>  	list_del(&chan->common.device_node);
>  }
>
> @@ -937,7 +936,7 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
>
>  	chan->is_dmacoherent =  of_property_read_bool(node, "dma-coherent");
>  	zdev->chan = chan;
> -	tasklet_setup(&chan->tasklet, zynqmp_dma_do_tasklet);
> +	dmaengine_init_bh(&chan->common, zynqmp_dma_do_tasklet);
>  	spin_lock_init(&chan->lock);
>  	INIT_LIST_HEAD(&chan->active_list);
>  	INIT_LIST_HEAD(&chan->pending_list);
> --
> 2.43.0
>
