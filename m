Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011045.outbound.protection.outlook.com [52.101.65.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED934A8FF2;
	Wed,  2 Sep 2026 15:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363350; cv=fail; b=iUbsHcAOGaHzZXfBThlqr6NMvWLeekeAkBwVVkXu+4Q7FTAZD6IGhQq+UKt4cXamd00rBVR0Nuw3TH7YdKE5TRyRTi/6PCqoBneblrRaHkueJ0xXENr0Tz1Cl20IMzaLwSmvH9Kqsg4EvG6HHEmFBJ1zRucZATMp/02WAuloMmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363350; c=relaxed/simple;
	bh=xKFkItUJjH7JGwdyVPp6ecKmccMOyrjGMKGrdbdnVQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oLaQWOsAVMq7bSGwABB7L3AAaBF+Fp4T0sUMgUiy/SkbbLhv0SQeUTRy4132exYKe78yZCeKR+McwHjafK48kXNle31nnpKAzmri1ooIqdKXH1E9VFr26ExyM4/LYo0J5Yow5T/x0xTBmkn9unkH+ZHEwkShlOZbr8iCyBL/MEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mg6xSE4D; arc=fail smtp.client-ip=52.101.65.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mg6xSE4D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZD1tQM04+fsPcyX1Qoc5W7xPXx72BScUrctkibfhZthdeRTl/4cIJnE09otVZAqyyL8xFUgsm5xMjzw9xj+qX6EFb8hI4viGWRusBQyHX3MbxVV2/hx0+tau6SPygADha3wU4hXd68r8PRGzplxe5kZrK6dzG+O74oE+6pCDe5jLg00RCW+H5mLiLRXg2AoalwEytYbbRI7lgvb04fgZMu4jprWGm1iLclcOihJrGcmvL+e5vZhlvLlSOyF4G9L5FqYY3ZyaDXIGOzGx1giqozMcq5V9kPVv11cHdWTZLk9+fnI92FJDABDB0xBZPiox+TI2E31jOpbzLrVSxxRPVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvA0/Q9ot+FTVNrEH4K4MjRVLQvBOODRTnirEGCA5sU=;
 b=R+ui9gGOApB+dpS3X+vMdsuN+GJ4cy0MzLpuunH7XeG3lbT5hTnUxmgI4iQv2cBn3HIrd3r/qXT6Lv+d+EyaU0rIA00yQvES1xiQziIvrWhdjEpfcno5Okdk9s3QwVSvHMwG1G/rVmz4jW8WTZIjZkUzGMeBhSwJtipVEy+a7LyCCh7f5miIqL3/+30HbhJzbqVpUD2YdlmEr2cE3atsq679v9JM2uDooR8KlRnjytfRcr5QsqG4a6efmt4wt4agpNeo+JRH9FhOT+dIU33fE7UncR5Wsg6BvTJDjDKUJbFAPBBeio+eIPmRWGV2F3+TYh1pj1uoTYGqQep9Tg7jbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvA0/Q9ot+FTVNrEH4K4MjRVLQvBOODRTnirEGCA5sU=;
 b=mg6xSE4DDtxm3jJYH2z68BOCc/UBlNyuz/abH7lkUHKvAZ65NAYkFVmx3TMx9kufHPKGEWs8HJI7Tf8XgaXl02pwK2VQRwOlr7cNPa8Z+42YS2DmDnzNjD8I90XrEAOY7aoFTgpHjmmJ/z+U5j+wJwfmhtgzmbPh+7/g5TAqRQriW5hqhO7V8F7OBwUpAxVjgOhqe1h2pTIZR8B6cbKzkePWmO53oV/d99WTjE+CD198Wi1dEqGk1KPlRUueUiX6ynNSN8h+El9k+jWWl07it9wl7jWmlxVh554HMio9mI7FCmibDA/0ypCZAGtpI2TZSSyhgKRVBJ2SfLtBh5tfTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10898.eurprd04.prod.outlook.com (2603:10a6:150:214::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 15:35:41 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 15:35:41 +0000
Date: Wed, 2 Sep 2026 11:35:34 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v3 05/34] dmaengine: ep93xx: hook callbacks via dmaengine
 BH
Message-ID: <aphCRukDN-ljBvql@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <69b17379bf3c78b6af96dbe3b76940520d491417.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69b17379bf3c78b6af96dbe3b76940520d491417.1786384168.git.allen.lkml@gmail.com>
X-ClientProxiedBy: PH7P220CA0147.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10898:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b0d3167-f025-47e4-f235-08df0907d881
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|19092799006|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zB53YaTHOvBPpKawPgY4wLfQdgSoMzzwG9XhggFY75Otx4y98toF+908OgfLKMkjlpu3xeec6T2Qzgr1YQqdokg7tSG3WK0q9CgPcnScu2TqFZJAkUMX3ssXVXOhQQQA15Fnm9f7IG3dyrMXyvaBlMJi9W/OL/2RPkxyydGECLKsEJpF8N4YhamDdtx7S+Dq6B9OAeObPZ0+BbrAoHBNRLzRfgqO5cyreqWSiYuJdK8ezBsq+mheqEIcr/m8lj8OyatrIX0V8M5rNJtJ/vqn2gvv8oIYVOrKBo8uFTyjvCSB1ZadMWzmHj8POp3FwrFdz+Va3gPs2j+Qi/RnolYDYn2WWbtP7LXPWvneLXOu56csEPPxP9TS2qicMlMydBWrEaEls5uDvQ4IWN8Qhtxv0ERE4Tx6XcWil70DEML6tMTPp5WooVcxp/49auC+YVLYWEtdwfGgTilcFkMDMKDV8oEGTyr9f9K+bYxg0BB0NEMe4oOgznq69ismCRdrjAnLN7JuTNeTSu1qzyTECDyqNx+j6t+qrIrDRNUeuolYNhdGIEPTUxU6AvPY3+Ni/MRZWoILfLghAOr7yVi0fgBB8T6RjzbMMQ6ZnsE8mZJ3nF6T1nR/ebZ4miI2kKO55LZuufAJ/kpTcw7ggJEMIWwglbwrEI7b1W08tq8NltcchlM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(19092799006)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q+2zvwJ7Q1mPIzTxQuOdyOLGXRaCwv4X8pmOjDDvCG11KgFjNhqASiIk+OXW?=
 =?us-ascii?Q?Ab9ih+Kk73U/Qs/GxXnCz5D8nettjQTsh5vxgOzdByuwZ0DoJzeJL15q6hwt?=
 =?us-ascii?Q?ydNpXHa/roeYGHGZitxBaKqv1cPbNTWYMmXe+8A0MuqrjRI0+YhPoE4DfO0H?=
 =?us-ascii?Q?cFzS1wc0woS4uzOdhzWHPcOKJclLCwv8OTt81NvFhFcJzaL0TRuP3dERZdzX?=
 =?us-ascii?Q?Jzfoyi/11GLq5kl2+7wsHTiw0hzilQkwj3/EKAc0I2TpAPUZCDc4VzUO7Cac?=
 =?us-ascii?Q?g+QTrDziT/QCS4xI9VeJbJm2zcnlgiw8WL3CCdbE5A3kmnMEHUGbFr24OacB?=
 =?us-ascii?Q?S9Q5Y6t2URVNetLhjfAjmPJwyy6RZlqH1dwXOzc/yIFU2RJHiq6B4VoElTIK?=
 =?us-ascii?Q?PuhnLaSwlBqSrNr4qAxiuUSCq1UOIVKX+Z7ysigBYTtuwFA5+nc6FssaDmbb?=
 =?us-ascii?Q?/j8Rmygh3c8nM4Ml2xYXiZ3//vwNC48AIWcewjSVL9T6gK2WW0K0bc920lJ7?=
 =?us-ascii?Q?O68Dc/cBo0rfk+ADqXZN1M+S5q1TFDlHues4tGrJd5hYzA2OIadONTaMGVpD?=
 =?us-ascii?Q?Q+1h0aAt31tcLyL0UIbHnYgRAAwwmCVBd/9ikoKda4xfINr4sguI5EhVOkQE?=
 =?us-ascii?Q?C1y1yKRpti9sqt4X6Gnwi3OC+QWAbRYB127WH3SR3N8dZ3+za1T6t8iJ5WCh?=
 =?us-ascii?Q?j9EosJyJ1ntEP8A7xdswTMiA3Tk1hCmPKfA0YI7FZgVTAEI9naXJh/+QAbgw?=
 =?us-ascii?Q?IUhxHlR62A1A+UlJLWCqtQhkxhJBm+exp8oaR7QUcKOiG8tEOCMZNEtFmSJE?=
 =?us-ascii?Q?qZHYxkXJNEEJMEEEmOty5ThB57g9eOUqN8j+3WbL3KbYSqMTf+kbRrrIX75q?=
 =?us-ascii?Q?s1xLJDA+iEgxfDgpDPlgYVU/SrXRUy8tXuXuy1PYOoTwoyozLpMljCB7o7kp?=
 =?us-ascii?Q?pzqlse8bDljQv1a3khUrR/v7m3ISTvTa6tixXHy1PKoI9X81qFvj8qoPZL01?=
 =?us-ascii?Q?A2tbFH/xd+sGJQZKLGteb+PY2vcYbhG2BoBR6F/yTkf4LhBre4h+IAZQHZnS?=
 =?us-ascii?Q?OoTmhRDi7LZfKMy8WlyLaXKIiuCr2wmDcxBwtbrMozdR644Qn2zRg3EVOSGj?=
 =?us-ascii?Q?icjZAY+hv+kaaXwmFc76U7+/bI7f9c8KgjFh99G53jvwQc47Qpz1YSGMmMtG?=
 =?us-ascii?Q?ceGUsW7PEGsOywjLhfq1ZEWJXX8NSbgNnAr88gzNjHNxDisrKl4yA7Kvx9cM?=
 =?us-ascii?Q?GDsP64mrq0721QFSzfNLxhagCeOMreu+EfdGZAXWb702rnmyxymKiCqJMtwc?=
 =?us-ascii?Q?5Sv69yKOWP+ie+EXC2O/OvJMTwY9Jlc+o4HN4LLREtYId/qCBU7pD5ZWcOES?=
 =?us-ascii?Q?1BljPCtt28zddBfVFwczl3OHSfm0A4rSRfuhoF9m5u7EYmE002errjJznC7S?=
 =?us-ascii?Q?ovMQmOCcrdt1RIam7tDuULeSeQ90ZTjYzsYtwngM+vb5wG5jUH63mvuDaeKv?=
 =?us-ascii?Q?aD/239PWfEsWxtd2+DN4lw+jBsVeRUEyqm2Stnl+4F41xt/h1KxO+YqjZtZD?=
 =?us-ascii?Q?rFwrOZQF3Jxpy5xt2VI5GAt3k7Jf7goTg6c7t9l9DlAi2FSu+rHDaSMcY15Z?=
 =?us-ascii?Q?gqf8RsOY9ORUGXNx0rgUN7VzzjLQiGYHd5ktzqQhQEQoLNwGoChOSbglaItt?=
 =?us-ascii?Q?+YlXzUD67ToHMVN4YL4Ii3wYm3qonaHyOedmR2rDXavXCLZ5J7ZrxWTNqUBS?=
 =?us-ascii?Q?VY6jxrBYqOFkeXBOISyCddhYxzgje4z+wK++1vQrEeRc/wSCUKln?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b0d3167-f025-47e4-f235-08df0907d881
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 15:35:41.3648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ywYFFITlMhIPpFOXnfxkmkKowigcDKd8Le0wWuOFK1tuttpZ6Lw/Q4O/wnoG0XNNTX9LzH1oYylHBsXLfCYKnlm5898zaZIoPFEjZ5+P205zw83fs3+IrxBIAvpR9/A/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10898

On Mon, Aug 10, 2026 at 11:09:06AM -0700, Allen Pais wrote:
> Replace the per-channel tasklet with the shared dmaengine BH helper.
> The handler continues to run in softirq context while dmaengine owns
> the common scheduling and teardown mechanism.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ep93xx_dma.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/dma/ep93xx_dma.c b/drivers/dma/ep93xx_dma.c
> index 311e55a97ba9..d79e278fb7ba 100644
> --- a/drivers/dma/ep93xx_dma.c
> +++ b/drivers/dma/ep93xx_dma.c
> @@ -167,7 +167,6 @@ struct ep93xx_dma_chan_cfg {
>   * @dma_cfg: channel number, direction
>   * @irq: interrupt number of the channel
>   * @clk: clock used by this channel
> - * @tasklet: channel specific tasklet used for callbacks
>   * @lock: lock protecting the fields following
>   * @flags: flags for the channel
>   * @buffer: which buffer to use next (0/1)
> @@ -196,7 +195,6 @@ struct ep93xx_dma_chan {
>  	struct ep93xx_dma_chan_cfg	dma_cfg;
>  	int				irq;
>  	struct clk			*clk;
> -	struct tasklet_struct		tasklet;
>  	/* protects the fields following */
>  	spinlock_t			lock;
>  	unsigned long			flags;
> @@ -801,9 +799,9 @@ static void ep93xx_dma_advance_work(struct ep93xx_dma_chan *edmac)
>  	spin_unlock_irqrestore(&edmac->lock, flags);
>  }
>
> -static void ep93xx_dma_tasklet(struct tasklet_struct *t)
> +static void ep93xx_dma_tasklet(struct dma_chan *chan)
>  {
> -	struct ep93xx_dma_chan *edmac = from_tasklet(edmac, t, tasklet);
> +	struct ep93xx_dma_chan *edmac = to_ep93xx_dma_chan(chan);
>  	struct ep93xx_dma_desc *desc, *d;
>  	struct dmaengine_desc_callback cb;
>  	LIST_HEAD(list);
> @@ -858,12 +856,12 @@ static irqreturn_t ep93xx_dma_interrupt(int irq, void *dev_id)
>  	switch (edmac->edma->hw_interrupt(edmac)) {
>  	case INTERRUPT_DONE:
>  		desc->complete = true;
> -		tasklet_schedule(&edmac->tasklet);
> +		dmaengine_schedule_bh(&edmac->chan);
>  		break;
>
>  	case INTERRUPT_NEXT_BUFFER:
>  		if (test_bit(EP93XX_DMA_IS_CYCLIC, &edmac->flags))
> -			tasklet_schedule(&edmac->tasklet);
> +			dmaengine_schedule_bh(&edmac->chan);
>  		break;
>
>  	default:
> @@ -1420,7 +1418,7 @@ static struct ep93xx_dma_engine *ep93xx_dma_of_probe(struct platform_device *pde
>  		INIT_LIST_HEAD(&edmac->active);
>  		INIT_LIST_HEAD(&edmac->queue);
>  		INIT_LIST_HEAD(&edmac->free_list);
> -		tasklet_setup(&edmac->tasklet, ep93xx_dma_tasklet);
> +		dmaengine_init_bh(&edmac->chan, ep93xx_dma_tasklet);
>
>  		list_add_tail(&edmac->chan.device_node,
>  			      &dma_dev->channels);
> --
> 2.43.0
>
