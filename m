Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011057.outbound.protection.outlook.com [52.101.70.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF124A441A;
	Wed,  2 Sep 2026 14:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360695; cv=fail; b=kaPcn8w+WDolwxgcsq1XvIGZpIRlq9DM2NJhYoaF058fT1yJEFPhsXUNENJex7JAxF/XYW3rFayd63nVKE7XvPZKrFunVuKcqgBo89kCENIOD0t0uU+q77McwUrzEK0+PY14Mj9JsMsKjgABmpLuSj2ng06zmucRJtB3Ap3fO2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360695; c=relaxed/simple;
	bh=kwCxFrsMEvpuTUxQ3iYkkJgkovQsuajW2iXriO58U+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=I3Fqf5T7wF1bee0zl9zOb8U3btDTG++KRdSR9pM0E/6pMaG4ibeF1MIvW543l1ZEHPvpVLK23rSZjx25Od/lF5Fdy6g2/JSee8iBiFW5aezioMtcALoyAoW5ED/BeOhBvC2m/edS4ZUYdnw9hfkayMAe2sLuKkxnZ0HdJg7ilqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bYrzwo5g; arc=fail smtp.client-ip=52.101.70.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bYrzwo5g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j7wTL3I7A4DbWrYVr8JZrZrthKOF37WkRg2f9YUgr6fVNvNQlLpC1J3nyey9+wWA/LpO0GUFZKfEomGCzcHmZjNwPcoKSAiblZwlrFc1Yd3JJbrFjXpe/jvDw4A1WDXhXfImPYyQwPclqMVldbQXC8yJTnq/gu6TvF5ALrC4G4E/yv2AscS7COVjATkOky5xgr3/mZJmA9yRE+s+0gskwRiKjMNwS3FEh47AskhykYUJIN6kohVNwU+OzCuX/CGHNJuJpwzALEf82D/lYsIn8scLuiyqrjAIVMqeY0sSt3Lnp80416702gpbJaR6HRZqcL5RDbw0Hu/XJ9KXqn0N1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RyLLyKvOeWKbwS8dlw75js1N7Yf0W8U07XYVcMAoRKM=;
 b=dReWDuiFvG4MBg/uRAFQkw3IZpehS8ua8zt5oj1qEXbIXNg7aaYDYNcHsb2vq8UsFAtXdNJG9FZWRMCStjt528jj3MJRrx93WhzKbeZewOThStjgNQem2DrI9We6mznk/XIA5aY9tw/OR+Ym8kAtBu2aCPu6JUhThJC7H5Vkv/u4o6SFzE/VqMXBz4shtrBj8U68W+aByIir3BFynvBTy80HzEiWnmQV5jUPm7THA6PlfqWVjq+xbzhUO7ExdiXjLNUZH4ZKATdlHzbFLFnHkOPEMTarqn70HZsqfOzaQtoBoYQKD9FC0qlkn3lK1fh33pU3L8Y9WB1OFWO6Dy5bZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RyLLyKvOeWKbwS8dlw75js1N7Yf0W8U07XYVcMAoRKM=;
 b=bYrzwo5g89m7ZhS8A/BiX/rR3MMOeaG+38ynImSAFf1dCoLKJg4HuSvUnqb8cUqO7Fk7SmvdDVIDTgc86EReN4y3Cs7GEYRSh2cSgaHQBF9lnCzIKa7TCwIXCqPvHueWh1+gU034MfhM1qdWUDOsC2ia83imLm77s7F/S536kEfrXQDpECGCJS/RnDPHp+NGvU3bnP1KPdu1x6AB2nUTmnjR5m+G9tmNAClasTjvrYSpck2W+b6+Z4an+qKG75mgq3nswKiOpHQFz6zRV8babw2iz1F26s4L1XP/BhXmOZq5S+fH7IBsUltmh8uzv/lUyQeCKl62g4JkoiKtT98JHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB10011.eurprd04.prod.outlook.com (2603:10a6:10:4c4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Wed, 2 Sep
 2026 14:51:30 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 14:51:30 +0000
Date: Wed, 2 Sep 2026 10:51:23 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v3 24/34] dmaengine: txx9dmac: route callbacks via
 channel BH
Message-ID: <apg36_8LMPl1srqy@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <c98a32a57c3e295c79806859547756e70bb3f1a4.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c98a32a57c3e295c79806859547756e70bb3f1a4.1786384169.git.allen.lkml@gmail.com>
X-ClientProxiedBy: CY5PR22CA0090.namprd22.prod.outlook.com
 (2603:10b6:930:65::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB10011:EE_
X-MS-Office365-Filtering-Correlation-Id: d52e23ab-5e31-41b0-d5a7-08df0901ac43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|19092799006|366016|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0eFh40WWOm4QYx+IAVF2CK0HJxIIR5hySvOX3DuMx1/Kdng6ZCQoXpAVsQtae6BKY635Riy+zzuPnpwuaeLZqw7+vPrCQljw6eUiM7QU4BVpY6iHaJHiEw1hKYMi6fh1JsyGmh+D6qb5nOdBb+JSd8cshXeipf9ijR9Ny07apCBxpzzRbWA+5OUwk1eZaV5BCvt8H4IgMsrXd4Qfuj+XRd52vckpJFeExoMeyUpBnnSTIPM/q1ZD5732KdyAr9nfkIUhkWYp20YtOB0rp9XRy2hG1cMshU79zil1FSEmhJh/sWEL0lGlIP607BTZawjQMHpDo4JqKyMo0d+9DeRZ/g1ORmqy38O4geaVCO9rDkv0a9D+PE9vfkxmxLL0suBIUksoM02RU36LRdSrVyj7hTSdZYamsukzyiDB+iZt6bruKRew6CoZUX2X+y3cdB2sCanng2OBhwnYbZ4dMPWAfxIWUSaNs/osc+Iy7TBlyRkOY8xSHUBUM8Q6WId88phdWaIqyt2+pe91sQc16pTj3ljwO/n+8c8RN9u+N6bcfGU7fYTYNro7dK+uqrdAMyCFFghA6A6VQXbPZVPlQ+YZ5Kmsr4YRn7cbXDv7kkBiwZW6pwAE4C33VJ2hZgczf/GHXyDB1gckqk/dcJY+MOlUpwVLB9CWRchMxim5R/grCKU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(19092799006)(366016)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CAX+PqQIIqwgIPTiNbtEZVafce5GI5MJKeA7PRQrRXPcPj04LbwpiNaEehSQ?=
 =?us-ascii?Q?bdv2I9/hLk8wDbv3PirmfnPflCzTV52VYGaLXGZMr270W2dA0I8meXx/p3Zo?=
 =?us-ascii?Q?mSDq8Oh8h/yYs4hWm+weDnR//NPB+fw0uZvyUuhluEGkkkfbxtlZrJkXrV7n?=
 =?us-ascii?Q?ETpYf1NXTSzcHQxgM0/nKnIZ8M+oW3KJ/s0SN/X2tYD77gMdD7lV25FZWYDZ?=
 =?us-ascii?Q?kvHOALUeFg0alBO4haKDAPMsFBjhXQGLExHJuaipGi2jj0JVaIhyyLzGzQDF?=
 =?us-ascii?Q?1mwq+lktB+cE70/Wk0ZjaFSJ68YmECcQThZZXGImIMwy3lNgET9WJWzvlOSU?=
 =?us-ascii?Q?VecOiIf9wKNSA7q7kCUJPt7gcG6S3nGYUpa1WTxDX6q4b8zuoNbgUWcqKqBS?=
 =?us-ascii?Q?UrkGfPGe63CaBmi2Bhto8/sC1/IoeGI30z1k7T5vaZMclSGXTFbSkE8O85RC?=
 =?us-ascii?Q?xYiLlw6UASrIjpocw+T+Xlk6jeGIpL7lThtpMEj9Gz6LF81kF8x/cshN6A9o?=
 =?us-ascii?Q?UZ1afUlYVml3CN0ABL9C7wzfG21C2o0hf/3vIWcKNaGTZEPKqqR2BAZ5dYtZ?=
 =?us-ascii?Q?W3P/GmEO2QMEQZyCov9bxwmttmmFmYCVfTe/43yCx6RBjre3FMpinkVzmp8X?=
 =?us-ascii?Q?Q8oPiqEWRpWdoJaKCoAOG2cEGSoUMO043yOp6sAHmaBJusXaD27J6ReAZhqS?=
 =?us-ascii?Q?Law/HmR0b+nB0nlweRKeuAq2KM0a3qfJ2heQ5FTsshgsqbo0kMHwEpXVhNvz?=
 =?us-ascii?Q?RmQKOC5ghuKVbP9VB416NVbHHpZzW0iamYrE03+Y4Y7QpZIYM2BA2eBIsFxn?=
 =?us-ascii?Q?N8RoGnGq4wVzsyMMrVr4h+pLWwcQsIP+7v3hQxlBvIwi5Hy1w95ocveC1Bui?=
 =?us-ascii?Q?9vdTnjsvkWbi/Sw3n5NTOivGuwOUD08JgzKh+g4lOBKkUxggE+TeCzVLAJuw?=
 =?us-ascii?Q?ZIwmcEtv+Y/IdnD8VSWw7GT1omWTN14ZGlj6Cd97pQoiIYK3R1X5+Z6BAnrs?=
 =?us-ascii?Q?8KxIgiDxB+RBcYNBNAtxI3qF19ib7pOgILA3iUz8sXsfrsCiOAFuccdWFU8L?=
 =?us-ascii?Q?qDMEvMccEmXDqS26KY/kpOQ7E8McZC2/FtzagGB78x2J1kdlBVu3/VWez07C?=
 =?us-ascii?Q?ImzTqKEGkjyWoUgtyOz12jy+ZM5ySf8tJ5dzxKGve31oIn+1Y5mZNSMoQtzL?=
 =?us-ascii?Q?3HdTqUVaFXe30rE2ke3V79wlCPe2yA54OvUt4KEQNLxKLytmJ8b7zE5Zu2Tf?=
 =?us-ascii?Q?YbO6lMk7snzJG65nQ9JVt3jV7rXkHIphdKbmFQfzC1aYI0AkalQ/6j1E6n3o?=
 =?us-ascii?Q?AjTwf+hsRe1cdw97YgavKZSZAs/+qvgoc+hSZPBGRgCuwQojHDXwQVOfhxwo?=
 =?us-ascii?Q?wCngl9Gqa14F7PRhxq1DKDLd3vAgUFc5EBFuulHA+uycG4ipcv92yFwl4f08?=
 =?us-ascii?Q?5Avqp1KkUxp+1grNIi69Ow1il69WHMFPmm/69U3En16SFGdb8Mt5lzQ43Iwj?=
 =?us-ascii?Q?R3KvllJgw8iJZxcYdogB3D68FBq1rZdBFv+zLTgTtKULS95A0YhAgQF2g1/s?=
 =?us-ascii?Q?CtB4DkdSspc5iX3F/b5sH7wBKCe1+yL2tR7DJy7l9OvOkU0FD9LqeXuipyck?=
 =?us-ascii?Q?L19PKDDqfbRw/8JPEwFJifhdsx8iN+Fro+S/fuAypJh2x6tx7fmbp5liBiJY?=
 =?us-ascii?Q?SexIscE++jL9Ou9Q5U0+3CMZ7qe3DxMGMWV7ojaeZ9xX9f1GSlFYRaV42tMF?=
 =?us-ascii?Q?07Nson2p8liJp3uKpQ50mPnhJp5kOEQGKeVRzVDKtEcON62WEW+8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d52e23ab-5e31-41b0-d5a7-08df0901ac43
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 14:51:30.1069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /H6wfEfEdEusw+D8tmbCSf+t4exsdw3W1G4aKXM0OpWYqavaM8LVSkCW0dtZLULKxddStXA/yjqpEcvvFZTvBzYMrf4EHSoYL0QbkTVQ22T5uLik8vmyD0hlsEyh6AjU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10011

On Mon, Aug 10, 2026 at 11:09:25AM -0700, Allen Pais wrote:
> Use the per-channel BH helpers for descriptor completion handling and
> schedule per-channel work from both channel and controller IRQ paths.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/txx9dmac.c | 12 ++++++------
>  drivers/dma/txx9dmac.h |  1 -
>  2 files changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/dma/txx9dmac.c b/drivers/dma/txx9dmac.c
> index 05622b68a936..0547f645b51c 100644
> --- a/drivers/dma/txx9dmac.c
> +++ b/drivers/dma/txx9dmac.c
> @@ -601,13 +601,13 @@ static void txx9dmac_scan_descriptors(struct txx9dmac_chan *dc)
>  	}
>  }
>
> -static void txx9dmac_chan_tasklet(struct tasklet_struct *t)
> +static void txx9dmac_chan_tasklet(struct dma_chan *chan)
>  {
>  	int irq;
>  	u32 csr;
>  	struct txx9dmac_chan *dc;
>
> -	dc = from_tasklet(dc, t, tasklet);
> +	dc = container_of(chan, struct txx9dmac_chan, chan);
>  	csr = channel_readl(dc, CSR);
>  	dev_vdbg(chan2dev(&dc->chan), "tasklet: status=%x\n", csr);
>
> @@ -628,7 +628,7 @@ static irqreturn_t txx9dmac_chan_interrupt(int irq, void *dev_id)
>  	dev_vdbg(chan2dev(&dc->chan), "interrupt: status=%#x\n",
>  			channel_readl(dc, CSR));
>
> -	tasklet_schedule(&dc->tasklet);
> +	dmaengine_schedule_bh(&dc->chan);
>  	/*
>  	 * Just disable the interrupts. We'll turn them back on in the
>  	 * softirq handler.
> @@ -659,7 +659,7 @@ static void txx9dmac_tasklet(struct tasklet_struct *t)
>  			spin_lock(&dc->lock);
>  			if (csr & (TXX9_DMA_CSR_ABCHC | TXX9_DMA_CSR_NCHNC |
>  				   TXX9_DMA_CSR_NTRNFC))
> -				txx9dmac_scan_descriptors(dc);
> +				dmaengine_schedule_bh(&dc->chan);
>  			spin_unlock(&dc->lock);
>  		}
>  	}
> @@ -1113,7 +1113,7 @@ static int __init txx9dmac_chan_probe(struct platform_device *pdev)
>  		irq = platform_get_irq(pdev, 0);
>  		if (irq < 0)
>  			return irq;
> -		tasklet_setup(&dc->tasklet, txx9dmac_chan_tasklet);
> +		dmaengine_init_bh(&dc->chan, txx9dmac_chan_tasklet);
>  		dc->irq = irq;
>  		err = devm_request_irq(&pdev->dev, dc->irq,
>  			txx9dmac_chan_interrupt, 0, dev_name(&pdev->dev), dc);
> @@ -1159,7 +1159,7 @@ static void txx9dmac_chan_remove(struct platform_device *pdev)
>  	dma_async_device_unregister(&dc->dma);
>  	if (dc->irq >= 0) {
>  		devm_free_irq(&pdev->dev, dc->irq, dc);
> -		tasklet_kill(&dc->tasklet);
> +		dmaengine_kill_bh(&dc->chan);
>  	}
>  	dc->ddev->chan[pdev->id % TXX9_DMA_MAX_NR_CHANNELS] = NULL;
>  }
> diff --git a/drivers/dma/txx9dmac.h b/drivers/dma/txx9dmac.h
> index aa53eafb1519..f2abedb73d49 100644
> --- a/drivers/dma/txx9dmac.h
> +++ b/drivers/dma/txx9dmac.h
> @@ -162,7 +162,6 @@ struct txx9dmac_chan {
>  	struct dma_device	dma;
>  	struct txx9dmac_dev	*ddev;
>  	void __iomem		*ch_regs;
> -	struct tasklet_struct	tasklet;
>  	int			irq;
>  	u32			ccr;
>
> --
> 2.43.0
>
