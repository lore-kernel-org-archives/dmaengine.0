Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012032.outbound.protection.outlook.com [52.101.66.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C283359A8B;
	Fri, 28 Aug 2026 18:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942533; cv=fail; b=jGN0deq8LWo+bAGTl8+gYOUwkVVt3FOD0mIVru6LHNyh0ZtYtxHhEND72uOdbdDtGXMJrtrlrNXU9hN0TZE49A59G89intDlqUdi1NdD4tFNbb2tGHD+yZuQpFClOM88kSXRwDjF/rnR8jXv6JbE5g7KdbexBkWJ6OQ9LnG1uSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942533; c=relaxed/simple;
	bh=s0QOZWkP3Co1hAxVcbnF3khp07h0Wb1hntBZN5YMzmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nDgLHwr0GLvm9XcY5qXET/IYG//wRssIC/qfHGvxNFYxxmRIM5dUEH/qBdr1PF5tBUwPwDkJs+wNDTQ4/0iqbn4+yhcuLE0NvuNgmiwetoVgZbn9Q8eQl2NZY8dC/UHxqNqrkLgKruR0fbmwl8Aq831vC0faQ/j6wqTyHkR06ZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IgRUXerN; arc=fail smtp.client-ip=52.101.66.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IgRUXerN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A7xkrIekZOxlG27wDkSUdnlXbcHj5fDUlYiBHJZoM9p6112fmT8h7FaYgO4e9tw2jvu27VZ5z9F7SO+gF3pUfcSXGERjJg8ceOUf31OCybwVzSfRjK35uehBVGyWEPPLTMJXHiiJszx4jzclUtJT11sQVW4uruSzX6k31h03kz7pUj79RdDSeoQ4kU9ssmMbKzGmDlinNVk6DtwMf+qqIof9MzE1jhOO+kth99OXFNvw9D0ICrTijUzjHKqa5tituhyP3oOLVSpfvO/b8rqOgrKOmv/AxZ8g5nLuQpLa3ic97VEGLBhoVa5pFdmSWRTiYmyZIGwoIvLq+e3DNs8FMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVlKbr2xq5Rx3e0f0Wlr0j7H8hS2csfd+9bLcj1THlU=;
 b=tR4xUABcjHtzPAQp1eCPjTDC0/ppGr3K3ocLzsgpFK9Cc3OFdiC3jOGf5epZjxaIeqn+jsqzsViOrWzgs/OG7tA4mNn14XV73nOPLSBg5WPSFEiOlhic4kVm7YW1N+M76YK3cXs1BLJ+r9B7Wk0cFkGyCaNBCZgLP84SUn+VZeSRQD+sz33RHPW3oZjmvOX5zAnfvYldHejUtIYhoxPDMfCegCvH33LEbydl4t3qXvQJDgyeBpBDhrVoE2pqYB3+0BRYDdwI9FetE2RQuuorQiZ/PoF7pfPwke226VK9JuNvwXIt1SoToRIeJKz63hHlXqHs1efEUmJMRyC4tnGkSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVlKbr2xq5Rx3e0f0Wlr0j7H8hS2csfd+9bLcj1THlU=;
 b=IgRUXerN0N2awZGc0ai7VAgw8nqqbOGDF36+JizTAn/2l71ElyvHqsr/noNVmllNRaXXIXNf1DX3ix/vo5HH+7znZblI6PIHZ6/7BwMpNZQOCRCsYbv6e5CL0NwZxLBK5V/PZLksDXGg0W7dz7EsZQBD6V0Su9AhuqA9hZ8uOOWg9NuPUIYK4Zk8FlWHZYGOINFGuad45v5Lgcek0JhqIa4tSWxAs+w9w8XXn3o3q+4KWC/eDnh5v7iOS3r+4cjL5C4Jiu7cayKI2jWmOR0gKvXzY5GODToDURJDtn6ByQMdvcy8DUp6hghuNUe5w5C2PsT+1Is0RXRubbpY0rYvdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB9956.eurprd04.prod.outlook.com (2603:10a6:800:1e1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Fri, 28 Aug
 2026 18:42:06 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 18:42:06 +0000
Date: Fri, 28 Aug 2026 13:41:57 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dmaengine: dw-edma: Configure remote interrupt
 routing
Message-ID: <apHWdSznP88op0i9@SMW015318>
References: <20260828163611.2691264-1-den@valinux.co.jp>
 <20260828163611.2691264-3-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828163611.2691264-3-den@valinux.co.jp>
X-ClientProxiedBy: CY8P222CA0019.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:930:6b::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB9956:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ef3e8eb-18d5-40a3-9493-08df05340f0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|19092799006|1800799024|366016|6133799003|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tTexGJi0b6Ihl1Qk1HL1VYhgzUQ+YSr8HnoGhFJS+TZjHz+HaDpJKcXpJq02a/gh9ox1GILdVrlb5pSrObfO+VhXbteHa7qnynwLSf7JeaZH+WqZTDI8SvqGfnRM57GJqpOcLmc2ysrmnnQmM1lIbEdqR7W1NoeL/C2wedPm+Th13DBuCogFnMlopH4K6KE5cMMzgXmQAQtn+dMS1TJQUrXEAgIfqnCt69rIwcdCglxsEwSTgZ/MOB7wRUVcmr6weB3aedOc22+sayP9V4MaNrdrYouxpOVJzFsZW4N5V/4Gjbqmvryik0NobmuMrx5fvcTTF1m5yvCzMe4L43K9BKJNUX6JHV58usiEaMiBCaitm5at+uFyvyEYs/NmgQ+dQ34J/gQK+DcE1t7QOJ76Oxu7ptEIPsxVg0NtE/BUlpk68U/mMeI8phRzXWWCv+Rdt2ZNF0FZBsCJfEnXidLeSv/x5u1M4jLpxhhswfBNbOIu5aHs6BbK/LHB5pVPuzwVbtckMGin+ZjGBomMByL9toWYvGRFE4JtIMfmzNftOnr7lioK/m7loLeEhOV87nyLVQhrQsNeKhsm5s6vun4a8cMT9CN8ySiZwsWJeq5p5I2txo2KCXYgIl5UQTiVkRIJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(1800799024)(366016)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jxbUOeZ+oiM1VVvw7+eh4TBQqq4ww00zwr2fJLUA/eFkfMyb1aomjPteAU5w?=
 =?us-ascii?Q?cV8qRmot8CM2/BElte3x1y0r8iZhGLtBStuM5WaLx0s8hfA/ffNogbE2jEdz?=
 =?us-ascii?Q?vyn8+kdrVGDzMd8abIi2M6AUFGefEJEfPpdRdK6N8HubzbUPBu65E2O9wX0e?=
 =?us-ascii?Q?m378bIpcJV0ZY68aDVftAgx6dOseFkNeJ5Xw/bcWuKNzbYWFkmF7MWxMzrYl?=
 =?us-ascii?Q?hze5o93Gy8EzkBDLsDrN5Z0leLvvBVXkubTRudYdI6w00GEiJbMEGWV/4ipu?=
 =?us-ascii?Q?G03RrqTYwTJ7z65Ky7ite/Zh50pTVTREJhcKPWxUGEseE8w0kVUWwpF19/uB?=
 =?us-ascii?Q?GLtHf31q03IdKPgttmM8iIdBSAx5ddmzqRQH4n/mg/k2plo2eH/umUoZBcd8?=
 =?us-ascii?Q?nku8/EBIZLhg8ynHKHGkhbr20v3DDbfX5TalEHj2MFF027cRKKsSPJLqC7GU?=
 =?us-ascii?Q?epU3JmHH3pdFF6P3Xk0gmZtXxTQ3vbnMQYr5hae10TSrqU6NpKz2xbPEXG8M?=
 =?us-ascii?Q?ht7/vlg8+qSPYfszVx3w2aet2pLiR9yHR5AaGIhKBb33B/LtQs56XXqHpRWh?=
 =?us-ascii?Q?F8kk8K5NxiVcdUoFVofwS/J6gvy5k4+HiBFe1K4yPEIoZxfvbguEr71DM6zr?=
 =?us-ascii?Q?2mAinL6ItpJGNwybkBZz6J3ZMW9iB2FQ6KbboQIsam4hWWGZz4xjPza7HnKg?=
 =?us-ascii?Q?pCYp8moYUD7hQehUGYyo7wPkiCV/82G61GPLwke3bh19Fr5Cr1XfGAG1GjdM?=
 =?us-ascii?Q?8pvFT2sA09ygNz61MhdGwNzMY4HX8KHr5BbZqY4oMY4Rj5fd1wDlLQiSQS9W?=
 =?us-ascii?Q?1WWBn/BZNPItM3YKYpRL9ko3vNb6bXcOnGDFZpNZDGYKymGfYE+TTeyaNxbC?=
 =?us-ascii?Q?2ZaYN0kZUGm3eQ696Qg4WSzGsG5nGp7379DCeLwbqPshmHe5Y7F5wzsyIyb1?=
 =?us-ascii?Q?rN42v9JMSt95W+CXvUN/IUNgSCwHXWvdcXlhtYn3P+CDUcmSe2gFg5yM+s3U?=
 =?us-ascii?Q?+Q2Fns3CNBChjJDfnRteGNxGMNEq3aDJPefKTbxgxHpH8juQn0j+GSgALH8G?=
 =?us-ascii?Q?TcJVCiHRofrN8X/xrWV2g2IRCOTeCEYc/iYf1ETFz9VGubvVkLluwhbhLfs0?=
 =?us-ascii?Q?BpMaXPVK4MJhfRfGXaMcoq/nFJEm8ix+uJY3CcQNgEsRjPJTHgCpdSlOPqGr?=
 =?us-ascii?Q?PC7j+FEib/iQo387lGWBnLV2S3s2rHXnhOtTIE4CDaqj+K5BBdu4ZCBuBw5G?=
 =?us-ascii?Q?4f5jPsxV3zZgEio70O6U4pJI0FW5Sqc6s4NjtaNjzQVEjrCWGwWo5uLsRCiM?=
 =?us-ascii?Q?Co4broO6escX9W8ddDcf5K0OcGa/pzWp5FAvj/1WcIQdiP2fjHcEDmnIF71+?=
 =?us-ascii?Q?D0027uYst5zoJm3XJ2sojgofYkb0JWq1H1neetsYfLVQz7APcq5bPEtIFdr2?=
 =?us-ascii?Q?N6oAdxA1qp//mfkkCBKe2gFh+XZgg/U7ycJnOHGqGP4vFSzM14Jy9sTfrYPF?=
 =?us-ascii?Q?wOK8C/4nLGZXHtRt8a1WxdXCYJ1rpOP6wvhe08qRoHXMsYED2PIib0+nbUC1?=
 =?us-ascii?Q?c5wFYYsB0WGBQoEGR2JZpi2fn09NMRv8mhkJbXJmoXJSqTM4eMllZWa7izfN?=
 =?us-ascii?Q?fEPyD4w67RqYxvwG778yiagTAzjd9WyBU9jFZ+G31X4v1jgY4YEecGsWYRtu?=
 =?us-ascii?Q?27r7AW+p31WTFQcCG8CnYmLImmLamVsKg7qevq3PM2q3aCYzjSb4d0fML25q?=
 =?us-ascii?Q?qL+EQrV18GHyMUi1hMmXf9E41DOBkzBIE+yqg9T0ChKmOTdigBt2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef3e8eb-18d5-40a3-9493-08df05340f0b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 18:42:06.2486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 58OWQtgfQNbq3j5WTTWHiYh8ZQAg+aNsWkunklANx1dMukU9/AKVpngKm3DIkQTV/kfgMMbY7LiinY7FQFubTYgmzuF8aL0yaGf+7sbGaleB6PvysAcDbwX1LjGtRF/L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9956

On Sat, Aug 29, 2026 at 01:36:10AM +0900, Koichiro Den wrote:
> An endpoint function can reserve an endpoint-local channel while the RC
> programs it through an exposed register window. Such a channel must route
> interrupts remotely and ignore them on the endpoint.
>
> Use dma_slave_config to set enum dw_edma_ch_irq_mode on idle channels of a
> local eDMA-compatible instance. Synchronizing a remote-routed channel
> quiesces the hardware, after which the caller can restore its routing and
> release it.
>
> The eDMA quiesce may stop a complete direction. The caller must own every
> channel in that direction and stop remote programming first.
>
> Suggested-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
> Changes in v2:
>   - Rework the channel routing from PCI DMA EPF v7 patches 5 and 6.
>     https://lore.kernel.org/r/20260813063757.3131865-6-den@valinux.co.jp/
>     https://lore.kernel.org/r/20260813063757.3131865-7-den@valinux.co.jp/
>   - Use dma_slave_config instead of private delegation helpers. (Frank)
>     https://lore.kernel.org/r/ao2nHoCwfTEEiFSr@SMW015318/
>
>  drivers/dma/dw-edma/dw-edma-core.c | 51 +++++++++++++++++++++++++++---
>  include/linux/dma/edma.h           |  6 ++++
>  2 files changed, 52 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index a678c70a78fe..a8c6bd508fcd 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -177,6 +177,30 @@ dw_edma_get_default_irq_mode(struct dw_edma_chan *chan)
>  						  DW_EDMA_CH_IRQ_REMOTE;
>  }
>
> +static int dw_edma_device_config_irq_mode(struct dw_edma_chan *chan,
> +					  struct dma_slave_config *config)
> +{
> +	enum dw_edma_ch_irq_mode mode;
> +
> +	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL) ||
> +	    config->peripheral_size != sizeof(mode))
> +		return -EINVAL;
> +
> +	mode = *(enum dw_edma_ch_irq_mode *)config->peripheral_config;

existing code use peripheral_config indicate non_ll mode, is it compatible
with irq mode?

Frank

> +	if (mode != DW_EDMA_CH_IRQ_LOCAL && mode != DW_EDMA_CH_IRQ_REMOTE)
> +		return -EINVAL;
> +
> +	guard(spinlock_irqsave)(&chan->vc.lock);
> +
> +	if (chan->configured || chan->status != EDMA_ST_IDLE ||
> +	    chan->request != EDMA_REQ_NONE)
> +		return -EBUSY;
> +
> +	chan->irq_mode = mode;
> +
> +	return 0;
> +}
> +
>  static int dw_edma_device_config(struct dma_chan *dchan,
>  				 struct dma_slave_config *config)
>  {
> @@ -184,6 +208,10 @@ static int dw_edma_device_config(struct dma_chan *dchan,
>  	bool cfg_non_ll;
>  	int non_ll = 0;
>
> +	if (chan->dw->chip->mf != EDMA_MF_HDMA_NATIVE &&
> +	    config->peripheral_config)
> +		return dw_edma_device_config_irq_mode(chan, config);
> +
>  	chan->non_ll = false;
>  	if (chan->dw->chip->mf == EDMA_MF_HDMA_NATIVE) {
>  		if (config->peripheral_config &&
> @@ -213,10 +241,6 @@ static int dw_edma_device_config(struct dma_chan *dchan,
>
>  		if (cfg_non_ll || non_ll)
>  			chan->non_ll = true;
> -	} else if (config->peripheral_config) {
> -		dev_err(dchan->device->dev,
> -			"peripheral config param applicable only for HDMA\n");
> -		return -EINVAL;
>  	}
>
>  	memcpy(&chan->config, config, sizeof(*config));
> @@ -893,6 +917,17 @@ static void dw_edma_wait_termination(struct dma_chan *dchan)
>  static void dw_edma_device_synchronize(struct dma_chan *dchan)
>  {
>  	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
> +	bool remote;
> +
> +	scoped_guard(spinlock_irqsave, &chan->vc.lock)
> +		remote = chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL &&
> +			 chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE;
> +
> +	if (remote && dw_edma_core_ch_quiesce(chan))
> +		dev_warn(chan->dw->chip->dev,
> +			 "failed to quiesce remote-routed %s channel %u\n",
> +			 chan->dir == EDMA_DIR_WRITE ? "write" : "read",
> +			 chan->id);
>
>  	dw_edma_wait_termination(dchan);
>  	cancel_work_sync(&chan->irq_work);
> @@ -903,12 +938,18 @@ static void dw_edma_device_synchronize(struct dma_chan *dchan)
>  static void dw_edma_free_chan_resources(struct dma_chan *dchan)
>  {
>  	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
> +	enum dw_edma_ch_irq_mode default_mode =
> +			dw_edma_get_default_irq_mode(chan);
>
>  	dw_edma_device_terminate_all(dchan);
>  	dw_edma_device_synchronize(dchan);
>
> -	scoped_guard(spinlock_irqsave, &chan->vc.lock)
> +	scoped_guard(spinlock_irqsave, &chan->vc.lock) {
>  		chan->configured = false;
> +		/* Avoid a redundant write racing with shared-IRQ readers. */
> +		if (chan->irq_mode != default_mode)
> +			chan->irq_mode = default_mode;
> +	}
>
>  	vchan_free_chan_resources(&chan->vc);
>  }
> diff --git a/include/linux/dma/edma.h b/include/linux/dma/edma.h
> index 3c8e2ef9dee0..54491c9e4b5e 100644
> --- a/include/linux/dma/edma.h
> +++ b/include/linux/dma/edma.h
> @@ -92,6 +92,12 @@ enum dw_edma_chip_flags {
>   * handed over to and driven by the remote side, and the recipe above is
>   * applied by the driving instance.
>   *
> + * On a local eDMA-compatible instance, clients may pass this enum through
> + * dma_slave_config.peripheral_config to switch an idle, unconfigured channel
> + * between LOCAL and REMOTE routing. Before synchronizing a REMOTE channel,
> + * the client must stop remote programming and own every channel affected by
> + * the hardware quiesce.
> + *
>   * HDMA linked-list watermark interrupts have the same LWIE/RWIE guidance. HDMA
>   * non-linked-list mode has dedicated local and remote stop/abort interrupt
>   * enables.
> --
> 2.51.0
>
