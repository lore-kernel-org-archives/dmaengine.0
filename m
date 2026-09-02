Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012010.outbound.protection.outlook.com [52.101.66.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC2F35F5F7;
	Wed,  2 Sep 2026 15:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788362929; cv=fail; b=Zf6XBhXgUrVMXeuloC9qtcaOhyMJKJPqSDMfQpsiCy9lnCOYLTomQdgde4vM656u10w8M7FCcSOkue6n06OaW7JiBjdxP9+hdoQUNBO/ZJZvsPzr3zuO2RP66hYtu0vu8sawNy2LBL8GeZ9ag1pNtfjV+nC+GP7u2/YICL/8L64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788362929; c=relaxed/simple;
	bh=SMWwyEVI3JyJ2E8B2Q6dEHf5q26O0OXBRcnJVSxhTks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ti0lolvPeemZkX9i1NIHCEqAtnXHsB5WT5EqN5LyvIdEiHLxcH3aucxVEXM3JRxj89zhmu8FRAVjbR9EFEgUdHL10/0ei6tsq2H+8ExIO/MnsGUOk7aepfhz8h72DFHRXee59urTn8+vc2tuoPXrgYES4yKTr/uLh5FLFLfW0X0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iwL6FWXd; arc=fail smtp.client-ip=52.101.66.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iwL6FWXd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nb8kzE3IOOfSk5J5s/JGbgOA5y1T1V88PAyNmfLhx2mHcgK2GucoO0C+96yWDs0GroB0eOv3z/qriw3KSKx9WeclmEVXqWKer3ovP6d+fEyqne/RUxYq9rwYaqaOyHPD4/ZsYwEEzDJtLRPcoAneUwAy3Pt4qepz4ALgDoL38Hkj2Q3ttI8Xm1QIi0MOItPCw1eBLs2Dg4wH2MbaSlvHO43f1vWBkiM6tUbP4LgqZlwpGTlhBKETA7oMaAkYrPm6E1047KOp2vkph2PeE2rn0xLBDNbPe+7WEeD7BqaKkO5RKI3PkS+EITmtdv63BwZDXm1WrPuW6WScjNzFY+ZRTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPYQcGyvxjcbqDZERIoebLK6AARepcIpO7CoPvs5LCE=;
 b=zPTYc3QOibXWPKuA23dSgvopEYJhFHPkmu3MX3QTZOn18CPXZKoaFDuH6YtlhhZtt67TK7ce/6F/YkTcS+QStFz9rryvcpe37IXQ7F+az1xQ3SWMmIkTJPlUaKg5AmDQci41ZxOPjzxoFQhay+QYRoilmfCY/+DAXhGU+ltH4M41uEPgxpQeNOsTag/JhVwv6YllDR3IqkWbIrHxVpuOwqOhlqSE+eg8Qy3fOlu0rVgYqK4Tw31pqJHsoPEzsV0Td1tZVUHgjqXrKWfIHfwwCPPbY3DxLFCdNYNacGcXl/7K+yIbTmhl3qZMK1y1as3a6pSS/i3X2Y1t3PXbsUTHjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPYQcGyvxjcbqDZERIoebLK6AARepcIpO7CoPvs5LCE=;
 b=iwL6FWXdPjVCvlrrI7wt+CHLisEBseSLak+7PlCKvDDB+wPUcFkq0bMxb3KIoH+sLJhKko27VXbUAe9H/n1ACJ+4LtVmA2c06hN1HMXyey00iVJyJcUpWNL0hvo9nDsnW7KK1Ft0Txa5MlAHaImYFbfY5R+ZLvNZdg4lktC1LA8VXuF7QyefHpRwUYe+edTUUrmJwNrrQRl6gEDjEb1UIhXCc90qjRcNqhE0P/qjMa08D730jstuOJ4sGur+bOxQYiOPLnndobTYVrHPtbUJ9G8PZ1R632Kv2Tbwr66/b0V4x7Woz3y1lCNvYFrjIriQjHmECb9vT3A1dQ39+3lcJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by ZR6PR04MB910871.eurprd04.prod.outlook.com (2603:10a6:910:dc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 15:28:45 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 15:28:44 +0000
Date: Wed, 2 Sep 2026 11:28:36 -0400
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
Message-ID: <aphApJ1wEAJLOxGM@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <787938bdaef4c3530b4bf0296386a33928b877f0.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <787938bdaef4c3530b4bf0296386a33928b877f0.1786384168.git.allen.lkml@gmail.com>
X-ClientProxiedBy: CYZPR11CA0014.namprd11.prod.outlook.com
 (2603:10b6:930:8d::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|ZR6PR04MB910871:EE_
X-MS-Office365-Filtering-Correlation-Id: 72c89483-2cac-4d09-33dd-08df0906dfc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|23010399003|1800799024|366016|10067099003|4143699003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	qDTR+zOUoovYa4fidISF0Fp9C/9FBBt2TcQAowz01G8vlL1yUrQ56ozyww2kheQrJnxZc2zcGn6Mi3wc42kAoQAo0oaWXSupqOVqSflbLRAsWf81ROOWIyNU0Jj9Vzz7+OwsLw1pYcr+04PXjkkYzTRGjJs+ThQBlbTosBq/Yhi9/YWsdo2MtqbWi0IqqDx4uMoOR71utrXh/cMy9vUErKl8BuXbo+ap8uu7YNRS+7xd7s40nhgpWPI8njvAj6V6vBO8494UwzcVHYF7JTjzZJsLy8eCmzT5RZp8wP3FSQ2Z+oLpd6eMeIGDANI/HDOYLFe4wujLINAKqPPoKLCRTL+PobGKsCyLeCFqkNeMUxzT2wEr8zs4sEJxz9bcRvOI18AdW0aiDdN3JnOJD/6djKcoM1A5uc1BL9hghMM1G3wZqVfHyoFADFJQeiDG1d+aGuWIs0Pm2Ih6h6dMHHJM5SdigY62jRdWzs4Nxd41MD05Q2gGpmYA6Uni6fAZyDDoMMTiV0KUtGZdby0xSJvAxvcAka84CxZFhoF5ItRTw1jZbHHyYbnvjzHRPi/73XxUG9cD/d/fsw5OBf28LXLCiD/osPAaDecOkYgp58TRHuDoehjYMND4rreOxfXYc8s5eygNuDtms1c6nkY/93fRBdHtcpQZVbLvAMzzQKNfZOA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(23010399003)(1800799024)(366016)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hHp9gvyqBzBWu3rMNATs3okFOy0dMIQFCHFs2XFKKiCjnYHflFQFfK7GeN2E?=
 =?us-ascii?Q?vFk3pTviXtmfK7cVygemakRQy2R6BjoRpP42G517Tc+BCAu33lFfXEGsk2Tv?=
 =?us-ascii?Q?kX6ysjPMJhGQZwjzQ5aB2mvQKRZh/ACtQtVc5BurJnHUjZzoY0Eex6SQKqNB?=
 =?us-ascii?Q?6i/nZJ/mLMOCeJpT9hb2MQHfygkS7/9qzILevrQcHg9RERHc02WBGZabCjZY?=
 =?us-ascii?Q?0T730iB/D/tdFYW4qZox5hYFGfT7aBYkcWB3R2kpLEXdVs/hIaZh22lFgTF6?=
 =?us-ascii?Q?KNmmI+HI16+iNnIHJ/+QZ/NRT7Pz+ScZchw2GWbrBF0qo4PHRchQffSt/O07?=
 =?us-ascii?Q?kzuEOsqkDPLn8hauDn/x8fml9Rjun+hZqWoAVMXne16l4suFhOyqKSXfH+Il?=
 =?us-ascii?Q?xpFvX60NjrOiPhFDdHmVtyNjfYLPrj+TIUiQJqzNnQUpoeeJ9O3VkqI5Eog3?=
 =?us-ascii?Q?vaPQQt4FpB9RKcQ34nyD+LG4TmkN7YOWYyq5asZfLm6aXui1nJtppXkzlegL?=
 =?us-ascii?Q?yb4OKi17B4n46AnHaZquCuUBC+WEaR45Z7KLFXWjm2X46AQTwtGV/tbFdM/5?=
 =?us-ascii?Q?NOr+glYgKbF9XFUQFH4bVrxsc+AwcK+6JONi4BD9e/dRAcuQWUsi8qrUpIpY?=
 =?us-ascii?Q?XyatnP8cVgRnbACic87ytLoO97lcTXCwfik4cQkFKZiA/WjJISB43b64lc99?=
 =?us-ascii?Q?E0tnQ3tGHMdG/0GsBVhhSf2p8WIPr6LtZQ03bfz7l4HVgOQQYn23iykoES1w?=
 =?us-ascii?Q?SwDrycy9+qhyfry9wxo3TIojwdfeCK/AvvVvF7ti4+ZEzY54Ac/3r6X8Lw1R?=
 =?us-ascii?Q?O3sXDuXWdKL7W5uSbIVgbYuqNbPKGbvRN75RrxfmYchiUslCPfBhanfR7SH0?=
 =?us-ascii?Q?DeoDkw8BI30q6mmV294ddrB4r6OVts6Um0svl6JFuuf6gRQNrNXpZj96K+uI?=
 =?us-ascii?Q?L3+lpKPboseCnGkGORwVaZbRb13XG88vJOet3y9yQwsmEpHYNR4BUqS6mlrD?=
 =?us-ascii?Q?I+mZ5cwvOei0VMzag0rEZm4rniyCMKgVKbR0hSDpDVxL7c1Mn/Sv6ABI07Cj?=
 =?us-ascii?Q?Y6drRd4FFMHTBIPvZUzj6VymzFdcQoBJSxoRfhswqwNosWSne6T/TigXj3dZ?=
 =?us-ascii?Q?aRq9gJpcAI/Rwpzudehy9JkIYxY5XVkN3j/hrUIYpV9SZcbK5ZRzR3mb7C/l?=
 =?us-ascii?Q?H8Ay7Rzz9LCVh4NQXl4U6egjwXBZRB4N3g5HWt2C9FV34yoS0+EjHKqEvnB/?=
 =?us-ascii?Q?D+lha7oVV7wXrWRvgdUSUBz3be2XvMX7vZpuo8wq4arGiTCSHP5hG6shU3sD?=
 =?us-ascii?Q?fnNoyl9j82YiQq5RreId+OdXoX98AeOvQbmnHpOIT63EWw9l3XgGgB0oDQ9w?=
 =?us-ascii?Q?QUl0BuqUAAM1fx1/xgAotRX5ZqgIkMCNdQ+geyVJjc7eWf8V/GYPheksbtup?=
 =?us-ascii?Q?nY6sPGUR4FUdGbmQasQjsGHyEFHXCBIn43eaoyikiDD88QSTE19j1/oYnd7Y?=
 =?us-ascii?Q?DogKuSZSYbvbKIHKLTfdO/qUF1So6PAwrQDjiGBIfKAfzYMVuEne7J5ZGvSl?=
 =?us-ascii?Q?tL5fS6Rw26cfRkdlJAhxva34FmcqKgIN6aBxSlVhNX4+942q/e/p/rPm0K+o?=
 =?us-ascii?Q?SXJfUd7jAJW7BZSFBppJ/b9BS3fH6X6HdI/hF6e6M3qL/gLLccVaNN+IuANz?=
 =?us-ascii?Q?eGFbC9I7ykj9JTp0MTgr/aH7jqM0LjwIsFnbp6uWoQ5tXrT6SowVYXYX91dm?=
 =?us-ascii?Q?diKjPheXQChzexDsJ5cgwvQ5Bf8mguE6hHH/hpVZCOEVzc6DxXno?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72c89483-2cac-4d09-33dd-08df0906dfc9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 15:28:44.3495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0d+Ty5DtxWJndderzhC+f/AKIdTeRv8YmYL16Wm44ASIhb/61ubrSx3WtTcvi6sxVzBYvtriCQWh/oZOV1YI4wdO2u4+FcN/2xOVlF5sJ/jEMVGdsGk3AVVHM7SD01I3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB910871

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
