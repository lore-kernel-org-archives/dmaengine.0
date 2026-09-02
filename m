Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013049.outbound.protection.outlook.com [40.107.162.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842AE4A8428;
	Wed,  2 Sep 2026 15:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788362241; cv=fail; b=kre167700gwQxOqVKavNN+PcklA/z1YVCN+KtlVtAXqn8XmnFmbejQjpYMrR7bdKKCsmrVdB363rnZfP1HK02o6zZgP1r+oqdnNDa+tOk6adBfJThiZCIm+k50D1hBTTOOdJF1FCFCpAkFt+TxOa7vr8VSf5IznVBQa1PSsxci0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788362241; c=relaxed/simple;
	bh=SMWwyEVI3JyJ2E8B2Q6dEHf5q26O0OXBRcnJVSxhTks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=URnqAIsIh42QFGsmHyvB5jr1O1Odv8BXLejqo+XRyqMZo68lHPP7mbtAEpCU1wyntSIZbjTJpl5Bo3FkUVt4ijq+HCXSzQlUTDAgBj83gApgbdQl3e7Kc1Srkzngogn2Ass9OTWV9T8Un8BomF+iEvMVq62BfImYU+5UTuZs1Wc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Rmqx9LyX; arc=fail smtp.client-ip=40.107.162.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Rmqx9LyX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ScNEANp6OsA6AFT0lmwkIpCscnaR1tM5BEJ+uyq5AJ4fjjzmr8V+wnLJmGkePXDGOvsjvD4QnP2a2yS4qVvxWBeQxTweTYhjnbcyBsSEWk7QNk3/UXTXZ2YvNPFG1E2qve+j3S9tPYvA2WKg+155X3HQFJkYnJ+MSUjAyUJzsOulPk0C4jtSH5TMdwSpS85QmP7Irmi5NlKtxx7XmDTVdlmvVfwopqjsQU5ZTSS1jLSvtknIRAwTGj5bjTckUGf08JfLFv49rzRiJihukTzSOOk0lZAf/4Zy5CTYn/2fMWU3WLpZaVmBofefDP/xZEZZtnaLt3rxlevX7Cr1pEvmiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPYQcGyvxjcbqDZERIoebLK6AARepcIpO7CoPvs5LCE=;
 b=NloXi2Pp7X/RqYylmwqgFrEOjzdO8BqYK+PF4TocBTvPNyCZtvF0zPJxCjLavjSfuenRGERY6sbmLWskbi5VzA6viWooSckxQMQ6teRjFIKKo1zZ2PeRxwKZDRnppVw1qItJLc9J4DSzU/lYStkxL+m/43LMDXMWoCeLXTTGZoFOTcKHQ4I2UuCidMNsOxJFJC11KuPBR6hUnJ8xOx964ay08Up4lZwzBq1XJ+ohFKY+ZQYd7zJYIXCr8mSZ2DLg+V2YGrmKL/XW4NwayIfs2hWEnu6VTTJirLAcoEVacMTMXtv7molWDGMmO7l5vikkdnxhyzmvdtbwdGjyx4xjww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPYQcGyvxjcbqDZERIoebLK6AARepcIpO7CoPvs5LCE=;
 b=Rmqx9LyXt6m8vgxe+sFp5F4zoMKKoOC1cIRbBqZeVpiMJA1MtTsGsQBK12o9NBZVXkmp6HaDHgGe5DbeRlp/l7E/ErvIiIAGGRRW7DDXrYvC1W5pcViZY+de4x2smcx4QruwxbGxH/2JLtHS8sZNtYDaZA0Ii155fbHotNKlksUIE0jtX1h8g+0ey+/Krz1CIePfthINssIaOxX+CJ4+VNDbvYN8WnzYwlazdqKXzUjiACX/fwOK4WP41b9pGo4XPMDOEiXHSIZgB6rQNKDN+ZAXaWR/v+fx/9U/De4bLXDzxppz3z85eQri4j3N27sfyYEsU3GKY2hKkaNsiY+oeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB12129.eurprd04.prod.outlook.com (2603:10a6:10:643::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 15:17:15 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 15:17:15 +0000
Date: Wed, 2 Sep 2026 11:17:06 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 08/34] dmaengine: imx-dma: flip per-chan tasklet to
 dmaengine BH
Message-ID: <apg98idPGhorwZ9p@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <787938bdaef4c3530b4bf0296386a33928b877f0.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <787938bdaef4c3530b4bf0296386a33928b877f0.1786384168.git.allen.lkml@gmail.com>
X-ClientProxiedBy: PH7PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:510:339::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB12129:EE_
X-MS-Office365-Filtering-Correlation-Id: 21d0fbec-17d7-4834-a39d-08df09054569
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|7416014|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	EaatEmSB0qeG56rvzpQ2jtyvP/BrXFF8PTw9vnblWfeWBL4kvflZWi9WyH92iJAaI8keOO1durj988uGC1KdZprsHW01qszTctzhN/GqaOp+C41iifAHcjSSFdQeAp5pRfS4p2x8lKL8YtCrz+wRYJkzgVzC2RQzAgNmgOIXWnPgCVC75KoxNJqNFD27izZ1mQhC+q+eL85RDyU7/PM94LsXTnemhHYx31UX9gY7DXs4kGoRnZYDJcYj0xrj2naoE0N0eJXftw0F0W2lbEn94EOFwxLF+1/hYWxhci8+J2BL0ocFAf8MBZs9wtOGQ+asTsBllVbPj6YAGo0c1JkSTZlzzv/jKejWkDBoSssJ5xsiHoRPVTWOYlbXSzKR1fLSmQqiDt1HBs+o8K+kMPKEg9BeYBkDWcoNYnPL/oXKg5wnLFQ8IMDhlSJ+gx6aWrab/EUHssPuhhfSasg+JEmuYkTZ6ciRRpN/sNqJvgFDloOzKwFRukN3a7u94dtaSVqCrjf3hvXbUiIrMaTa2Hj2SvGRwnQLPv9/LQYmckgWDRIMuNWkqUwnZHaxzkvZjZY7HQo6/2jOGyAs9kIduj5R/dlkujj7F4hUeBcpgklKAxbxBG8WvPJ5PsJhIDEy/Pd54N4b+9k31RpZRGT812DuO1C+Tknz8Dh40Z3R9sAJ7eo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(7416014)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nf8rGl4UJ1Jy/GEg4XROpRqo9eeT0ETUdHwBQgClTAL1pw+J989RxaXOvlv4?=
 =?us-ascii?Q?Kr3cigcPfODPoL2s2SbS2EIFtyrhUIyuafTQKJEJYaE1ILwfDfhQ1hpG1V8I?=
 =?us-ascii?Q?kjRJt5tQQMVMw+AMlOp/gNZvcgcwfW0T+4wacwASF/D17KYJe1zkWXEkyjKC?=
 =?us-ascii?Q?pWh5EZYlv5dPWnTWDtcuKLF5IXbQfwPSArOnt/hvIzSP6XUhqdNefUHzQ6jl?=
 =?us-ascii?Q?KWoUFNihB/9GTNMB6tq8C01rYI92CMsU9/BMUZoK+ysWpI05jcF0eb5UIg1g?=
 =?us-ascii?Q?VoiOnnScMuDy1uwvllLuFv9c+3kYuVtLihnbGNyj8ihKLyL0M22HSgKxTv/6?=
 =?us-ascii?Q?9lwTokj5QqSG7HAkxTXJ1WIg6iX15TULbMk1ceqqj2KPwdcXwlW80/ChAR98?=
 =?us-ascii?Q?zVn6HOxSI5IzJTlZeEKM73rdabkVW4ve+fFY/+MBr3dzlxMrHReWT1KI+ix4?=
 =?us-ascii?Q?O8LXg63N0f8uIBp6FSXNoTRRcvFqZPhV9Xwjkz5wssUOGyezQdlMV7n1xI2O?=
 =?us-ascii?Q?NQfeWBkv0JnrvaTaAi3CPeY2JoT68Yj9haIF+xC5WM98JI6fNDzRSP0GiERn?=
 =?us-ascii?Q?2uOcMZEZOWtXD98aLumxmD2unrwFWM6OW3imVmmZi+6NBl96VurNxyTiHepx?=
 =?us-ascii?Q?R74qWrNjvD/92R/FPvmJaBZrZ9YmCHrC3JMVCyu7vnNyNC/7L1ZUKC/0nZWV?=
 =?us-ascii?Q?GuzBcCjkgsOTpssWIK/ey/I3GCV/hijvqFS2sAzFjn1N1xAeZoP3Vm+wbblV?=
 =?us-ascii?Q?GCGjrNUaU2a0jxr+KsHJv0kNGD63aUAy7R1ArHdO8gVSy0/c7hszAQ8rASe0?=
 =?us-ascii?Q?KmkIyNPV2Zh+4+lHd9U+8EA7KQ8Pt/c6xTvqSYphpHWhOgwVDmwadt4lkhTh?=
 =?us-ascii?Q?FlX4DF9iGv81REu8CnZwyn9KZWI249WE8IjCxgH4NLABIVX5Evl4sWCQqA3x?=
 =?us-ascii?Q?gv+nsjt1dh6sr2SDaHLTDzYbhYZE74B1jdBbrxBqBAw09f5+KPtFMqM3WeWU?=
 =?us-ascii?Q?YpEza5jBmEt3PStqW6tFR+4tjXUzyvNo2fgoH1MoQdrqVvUb4s3E9m79GjeR?=
 =?us-ascii?Q?xaXBE9E9zrY/xnumbxSd6Ps4vcPh86koPIgYVgNwUAjn6ZnbKIjLY0jEYTbq?=
 =?us-ascii?Q?dRjo1ywztk82FHwrKtlwwuGON7mOtjzEcgJvnlzjRLyfl3unma9qjg1GOWrE?=
 =?us-ascii?Q?jPUKlT2NtYTvVOvBjOXWx+gSCxj/gUWVZaH14LUMLF0iOH5RUIf24ClgqIvM?=
 =?us-ascii?Q?qa6mxFS8iPJDSjCjmf6NN7mZHMzQL9N/INKpog62zrTR3MJ0j9P3evSiDT8l?=
 =?us-ascii?Q?nbh8D5s5zZoTYHt47/m+imudzQddSvyHtGhYbsAWwDuO5bedEZVlRfeMMGkE?=
 =?us-ascii?Q?BWa8PBZ5eupyyaKl60XcJPQQS5Kl7rpn1UWqpydOjM7A7c44FgriBW7R1lu9?=
 =?us-ascii?Q?QXJN7CXz13qxK6sXHld6cm5wC1NgS8VBlaRyVRFu1wthCanHcSGHy2SdVg+N?=
 =?us-ascii?Q?DqLYtsl/5+8Tawci/5BuNm5XVvkoimn1TJmvMqCNqC5dt5dYlawbpxW6ZTg7?=
 =?us-ascii?Q?RzRJj3NYj4s+6d8L5IsOQLdgRiJfO8BkTC5ZU4g22rATg7SuWw2x0QY2tr7S?=
 =?us-ascii?Q?oNQxmxUil261BZ1j/KmcEicBlH/McZA/6IE3rjga/vy/ssevYC3tHBE5Y+Zb?=
 =?us-ascii?Q?3ZoBGPLziV3gl9HkL3OyXmROa2PLYp0g4FvaMrnb/5IqeQg4Af4zBQdReccN?=
 =?us-ascii?Q?+f7lfYF1L9ihb9R/Ne7yL68YWmfwXUC3+JAOeWT7m7za+3TiTh6x?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21d0fbec-17d7-4834-a39d-08df09054569
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 15:17:15.5273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JbWRNeGzNhR3QhiOElrJ68wq5Z7DPNHqShTcUdmlftLsUO4rlVf19gkcppfdnsXhEYFe/Kwo2WhdUM64R612oNzjEQZ36Z/LzQZ5E6yD/bj9F9CQ10Cki1LylbbMTCsd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12129

On Mon, Aug 10, 2026 at 11:09:09AM -0700, Allen Pais wrote:
> Replace the per-channel tasklet with the shared dmaengine BH helper.
> The handler continues to run in softirq context while dmaengine owns
> the common scheduling and teardown mechanism.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/imx-dma.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
> index 81c6276436f8..308fe407fe16 100644
> --- a/drivers/dma/imx-dma.c
> +++ b/drivers/dma/imx-dma.c
> @@ -145,7 +145,6 @@ struct imxdma_channel {
>  	struct imxdma_engine		*imxdma;
>  	unsigned int			channel;
>
> -	struct tasklet_struct		dma_tasklet;
>  	struct list_head		ld_free;
>  	struct list_head		ld_queue;
>  	struct list_head		ld_active;
> @@ -344,8 +343,8 @@ static void imxdma_watchdog(struct timer_list *t)
>
>  	imx_dmav1_writel(imxdma, 0, DMA_CCR(channel));
>
> -	/* Tasklet watchdog error handler */
> -	tasklet_schedule(&imxdmac->dma_tasklet);
> +	/* BH watchdog error handler */
> +	dmaengine_schedule_bh(&imxdmac->chan);
>  	dev_dbg(imxdma->dev, "channel %d: watchdog timeout!\n",
>  		imxdmac->channel);
>  }
> @@ -390,8 +389,8 @@ static irqreturn_t imxdma_err_handler(int irq, void *dev_id)
>  			imx_dmav1_writel(imxdma, 1 << i, DMA_DBOSR);
>  			errcode |= IMX_DMA_ERR_BUFFER;
>  		}
> -		/* Tasklet error handler */
> -		tasklet_schedule(&imxdma->channel[i].dma_tasklet);
> +		/* BH error handler */
> +		dmaengine_schedule_bh(&imxdma->channel[i].chan);
>
>  		dev_warn(imxdma->dev,
>  			 "DMA timeout on channel %d -%s%s%s%s\n", i,
> @@ -448,8 +447,8 @@ static void dma_irq_handle_channel(struct imxdma_channel *imxdmac)
>  			imx_dmav1_writel(imxdma, tmp, DMA_CCR(chno));
>
>  			if (imxdma_chan_is_doing_cyclic(imxdmac))
> -				/* Tasklet progression */
> -				tasklet_schedule(&imxdmac->dma_tasklet);
> +				/* BH progression */
> +				dmaengine_schedule_bh(&imxdmac->chan);
>
>  			return;
>  		}
> @@ -462,8 +461,8 @@ static void dma_irq_handle_channel(struct imxdma_channel *imxdmac)
>
>  out:
>  	imx_dmav1_writel(imxdma, 0, DMA_CCR(chno));
> -	/* Tasklet irq */
> -	tasklet_schedule(&imxdmac->dma_tasklet);
> +	/* Schedule the IRQ BH */
> +	dmaengine_schedule_bh(&imxdmac->chan);
>  }
>
>  static irqreturn_t dma_irq_handler(int irq, void *dev_id)
> @@ -592,9 +591,10 @@ static int imxdma_xfer_desc(struct imxdma_desc *d)
>  	return 0;
>  }
>
> -static void imxdma_tasklet(struct tasklet_struct *t)
> +static void imxdma_tasklet(struct dma_chan *chan)
>  {
> -	struct imxdma_channel *imxdmac = from_tasklet(imxdmac, t, dma_tasklet);
> +	struct imxdma_channel *imxdmac = container_of(chan, struct imxdma_channel,
> +						      chan);
>  	struct imxdma_engine *imxdma = imxdmac->imxdma;
>  	struct imxdma_desc *desc, *next_desc;
>  	unsigned long flags;
> @@ -1142,7 +1142,7 @@ static int __init imxdma_probe(struct platform_device *pdev)
>  		INIT_LIST_HEAD(&imxdmac->ld_free);
>  		INIT_LIST_HEAD(&imxdmac->ld_active);
>
> -		tasklet_setup(&imxdmac->dma_tasklet, imxdma_tasklet);
> +		dmaengine_init_bh(&imxdmac->chan, imxdma_tasklet);
>  		imxdmac->chan.device = &imxdma->dma_device;
>  		dma_cookie_init(&imxdmac->chan);
>  		imxdmac->channel = i;
> @@ -1211,7 +1211,7 @@ static void imxdma_free_irq(struct platform_device *pdev, struct imxdma_engine *
>  		if (!is_imx1_dma(imxdma))
>  			disable_irq(imxdmac->irq);
>
> -		tasklet_kill(&imxdmac->dma_tasklet);
> +		dmaengine_kill_bh(&imxdmac->chan);
>  	}
>  }
>
> --
> 2.43.0
>
