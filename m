Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011013.outbound.protection.outlook.com [40.107.130.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0612C4CCDDF;
	Tue,  1 Sep 2026 22:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788301349; cv=fail; b=Scl007G9yogi5Eg3QsOgZJUZ7N5h3hEhyZ7vpiDwpMBioytG919ycR6Iu1M8GXqodymcZUCBHXPIkHxY/MUl5CoBCntA6WHu042eE3Dpjtdr0fKaQjo2qP/6NuYNlzHHACwlvsEjpObqPPemjbz/bcLUD97mtAPV6nyWPMP7eug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788301349; c=relaxed/simple;
	bh=dzBTPwelZDA5u6id+O4nqzbNAEA36ULMSw4kNzOwhxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VlIsmfiSiqZkktoQAYmbxaVpK/RXTw1xsD5Iu3CKGwLruR/UU24u87IY844bt69wsvE2ipZiJlAHn8DCsYWD9U5WzpArSB46pZ/Zi+KePpKOBY/i+ofWnOnfUTDwIN2iG4mAI1ATEln8/RFIsO4kcDT4Rg1x2ds5LmT6G97tSjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wP71LEi8; arc=fail smtp.client-ip=40.107.130.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wP71LEi8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uGhjbbKB2ZcpNpV8HxMZXDGNkrRYzk2lk24XGUDr6DYfDhPnhpmrPv24fdY+PgvflHIKFVRTVdfMEs3p2J7Z6zMkuuicsEwax2UZh5GZA0+LUna146INW7YxGSQ5eg53tqWoXqaXbNCgLaYYdPGdUngWd/ZVVzYvtDVrRTWp76vlg6ek+cIAOfSsuicSCV0Z0kBMne6hcPUAwmnAUrl28q7AA3Ip0OjQol555nVEwl+4n0ktk6p8cQOqFI49KKKMpCbuGPDdK54/Wc2zgE+JiAYhMFralFn4tE/CdX33FWXMpZoT5zuS4v2DnS57fydQ5LMroHYOYTxSXUnEeXNC+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fkkf61gHY6KC2ZguCaXQ4e66eGjSGnsC4uL5RzZLFYI=;
 b=mWMwnkLjOVqcv7O7fv9ou3KrOzZ4lpo4YUBHvPVSOcWsP0K1iA9sdIazLyEvnLxA+nUUCboGIXo1vnq4lBmH9t7UCIrp6joeMEsfG9cNY5w5viQ5TajhIKQPoG0P2H9kSe2XgTFwFMjFw9DIfVKzDzS97oPFhgzm91PrgVBUFD9fMH79oPig8Foxzdtwi11EWwcz0L3AoIBiv+Q7aDyBxxn6+dBfnzMWCmqerGmJ3RjF0zq/qPilxIUMe46PZ6niC9E0aLaSoauXEBiiTzULGYvwjFcjWZAlAYQazD91rqZmh8Z1WeA7TSkNSuj7Qu3HrRJd3Lr62mTTLCWACAVu4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fkkf61gHY6KC2ZguCaXQ4e66eGjSGnsC4uL5RzZLFYI=;
 b=wP71LEi8ij3HWLxw4mM4wVrH+ccPmuPf75MWh8C6lfht5QFAYyk61FeY8bbIUKyZO6a2X48kq4VoK+Sc5Pmzheobqb+k0QJwjNfc2AB/aIt/JkP9cs1U5/ayNherN1kRX17wrUsC60S2pZdpXp5R+iAbrWQjypyiyXoiAEHrG7nKQ/jbbqT6mL5f1uJfHgYtPMt24MVP+EH69kyl/MVunM8DitbV8U7t/ak1cw+9+SlJfz3x/BcIOYv3cOXgsmgKqozK1/7G2K6wXWiPujXTu2QZnNMOxGdc9ZwUCT6W1LVDjeYitBvw5w7d2TQADPcGDkZGd+Ug241rTjTrwnelsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8540.eurprd04.prod.outlook.com (2603:10a6:20b:437::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 22:22:24 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 22:22:24 +0000
Date: Tue, 1 Sep 2026 18:22:17 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v3 23/34] dmaengine: timb_dma: route callbacks via
 channel BH
Message-ID: <apdQGeId_mpjzply@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <0950412c2bdfac1b4014903dada42f4aec055bb8.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0950412c2bdfac1b4014903dada42f4aec055bb8.1786384169.git.allen.lkml@gmail.com>
X-ClientProxiedBy: CY8PR11CA0040.namprd11.prod.outlook.com
 (2603:10b6:930:4a::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8540:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ea54e3e-577d-497f-c2b1-08df08777f5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|4143699003|11063799006|10067099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ySyL8zyH2u2hsCShvxevd95urEkjTsUyhcYvjp4rjtN1e7NMSuOMK4z1baSv5Y9i48FyL8dG7LWg3/Y/zfQML7IMAqfVEzMfXljLgziJAZnCFyw2CJf4ahBSpO6bW72HqzVCh+t1fhS0WYSYrglVZvDOBDjYz7brl4IAB8EZS1478DzV0h3qMke+wJv7MjWi+7rexw5voCZLe5cSwPVkD2/H2assb1kCFDAaQlD+wYXiQaQd5JEcEZEWY9Ps73xpAJU4wivM/xzo9fGm2miUIxG4fErsCDmZJlS+lWVdRDf5IVD4YWog54xyQiwJbwACaAdn+JxnK0y12OFoQffuAfnDxo9anmUUAuSC+85tg1JcW7u7eX7FyJhshKLdDnGT0xJqq0k+xEi3RBymFrVPg0MFt4MKT5GeAbWHwgipD2aY8XUWhcGJCNCOh0cCEWX0yud2WeQQ8lGJ73ww6YWYrgCVyOslCAmDZLCJrKjs+ngYLTvt0udUlq3OEjQOBzGywfbJMbKmQTo28s7KSA6Pyn7splvIATl/HlXzyoMZa9lN8uDNOXBEspxMW+WVV0t7Oo/AbTuL6MxQ2XjTAUSj3jGOSbzabXwGe0hXgI38URyzOmDlJi0UnYQEON7phSONsC7cr7ebzgqSED/hzHYdU22uAmAUIqNocSewW2tpKIE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uXot7dEgBCywyLw4YfbGD71DpsfZ8LmR6v5GFtJAj+PEkds6+s53/SyqTZlZ?=
 =?us-ascii?Q?JLfePU/epFN1X30RLEI+EGZpITNpJOapgMddnnDT+YwXeiyX6aBrF0cBf1jd?=
 =?us-ascii?Q?VcbmeDqPTirLHkqoVvfsZ4nBP6Wvio4w2sYL0pWxmfOyXLHJDnvNxAsSULtv?=
 =?us-ascii?Q?ZQF6WG9HLWs71q3jbByBrIrs05nFU6LZH3HAbfE5QEELtwSJJ2gtEkTp5PjB?=
 =?us-ascii?Q?Jk8Sr4X+wjuTdF5qv0NrueznbVGBUS74N607Q427HB/4gw8K1/R6C7Tf8WV0?=
 =?us-ascii?Q?rxXyRCGYM3yV08C+0x2dDx9Qv+jZ1MGEJbTfRean0eP574mohc2h+k07FDeW?=
 =?us-ascii?Q?y6zZVWcSBqAozTeswP0HJSK7kcKqrxUc1H336Y6zxJ0heOoMSSom1TcaKo7o?=
 =?us-ascii?Q?bgMEbW8X4GqPA/AWiAM/u07BYmu1K/zunlaQkLJo1ZyDgOWvR3r8Eg2wz093?=
 =?us-ascii?Q?W5u2d4pR1A4oggQaR+Ll9BgKB0TaAD5G30HZWoxtsiIbBVxFFUOqDJN+tI7l?=
 =?us-ascii?Q?NjyF70npxnKGKlBmdCDrOnkMEwobZIWQgH3phIpwNmtbkuDf5nCAlq++0BHv?=
 =?us-ascii?Q?+PPdniZ+40jt4YrYBj3kJaHuiiuTQ2Khr6VeRpBFRJykdsOjE+JOXFbmMKsZ?=
 =?us-ascii?Q?JsSboiEa+GatSyszrvzPDARprMhK5PDfenan1a6670tAq5KaeNA4klEzKoDO?=
 =?us-ascii?Q?LGsRzzf5hqWR5StI1V8FbyGdI71YEPCSl9L4M2azCYNc8AvEBqqfyzFG4pxq?=
 =?us-ascii?Q?O/7et40LDQSVZgGjTTXuffW94hQbIkEgkxA0YE2tDMYSYT9hKFOGH3JKulBP?=
 =?us-ascii?Q?cw9CuLfcPuRpNnbPRb3ihc1tZiwqKscpbjxiSl5da8ipwyaoaAHS7ZUHnMKX?=
 =?us-ascii?Q?Lak9Pn5+7nhCnwNFTIYjgbgYJY1u2prS0cGpx7Je8EG8heiU7EvdkiICVC2f?=
 =?us-ascii?Q?lnfPiBdP15/GcPTFtsxunb7lRDKICPLzyb2sKDB8UOvwH7/gp/4sDkbSku0P?=
 =?us-ascii?Q?8mCiF5u3SGOsc9Jp2XF3WWhpOzWUNz9Y7CjGASrUS/r9gaWtgunQw7CQ0YAS?=
 =?us-ascii?Q?tQUcMrok5mfAgtVl1DP6X1w1jbKwo3Qs7ydXcOeAqYBXB5ApJRMni6N8GVAy?=
 =?us-ascii?Q?H7A4EyZBqlLkFkZadBZPeGhXLhaWdj5ecB047BgY8b4HjjnqnSIFXN5UJbek?=
 =?us-ascii?Q?6xVHWXivPiUp/x55vFo7EV3olbs6yrwSRX7URFBMX8ri9QJxx4OFpUw+dSZY?=
 =?us-ascii?Q?I2FNnx/cmnC5wGsFt8Y0rqRQj9mxwX1nto2DOfUjMCLT3yQrePPf5gH6xwt5?=
 =?us-ascii?Q?iSwYfC5479ETBt4+SrSfszUGScthhWo5RGg+N1dmbWExaXNaGGWUzaOuN2Pd?=
 =?us-ascii?Q?JBNDaf1ECm+QHh389B1iT9jcX+bUlaK6NlhVZQH8i1MYmCgpDYbzo0IL6Rf4?=
 =?us-ascii?Q?j1CjxNtR8DIsr37aT/+Iw1edTnFUVsJAkYzSUF1jP7mk6RNQfok3XFiloxPH?=
 =?us-ascii?Q?WSgX3cm6/u5OPIFI4nBTfMBQ7YINKgRlDQi5tp3OR8GVEyUimP+ByuUfTtT4?=
 =?us-ascii?Q?qvkC7DxdVCQadJA5KxjJMoycdr7ahnUwa2cAC8fiP9kdl7Idm62OcsFSUQd0?=
 =?us-ascii?Q?16kPMHWDlx80dUsprRHC3wm9dKQd3lWNbRJziQ9RKq1cb3MCxGOIMb9L3Mel?=
 =?us-ascii?Q?P5YH/2e9+FGM0VusMVrf1UYPoDaWp7A4ojmtUP3fSef1utl5+m9ZNmfN1PpL?=
 =?us-ascii?Q?b90+qULLgXOulzmoW2ghXh2Ra4X8FR0xgTluCz92mryQ780H4k7X?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea54e3e-577d-497f-c2b1-08df08777f5c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 22:22:24.2980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dUNvmtjxSC4PWKbCoa58/3kWbB7s9Hdo+1QbyB+GlowM12AEKe8EswMXIDA9fdlpBVmsqaeUR2tCsTxMG9Pomi+cBdcVYSO8cAUI7QSsBA+zy3poNYLiBiCrV2tiH/Ld
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8540

On Mon, Aug 10, 2026 at 11:09:24AM -0700, Allen Pais wrote:
> Schedule per-channel BH work for completions so callbacks run through
> the dma_chan deferral mechanism while keeping the controller tasklet for
> IRQ handling.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/timb_dma.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/dma/timb_dma.c b/drivers/dma/timb_dma.c
> index 4fc5119854ec..5a2374aab02a 100644
> --- a/drivers/dma/timb_dma.c
> +++ b/drivers/dma/timb_dma.c
> @@ -438,6 +438,8 @@ static void td_free_chan_resources(struct dma_chan *chan)
>
>  	dev_dbg(chan2dev(chan), "%s: Entry\n", __func__);
>
> +	dmaengine_kill_bh(&td_chan->chan);
> +
>  	/* check that all descriptors are free */
>  	BUG_ON(!list_empty(&td_chan->active_list));
>  	BUG_ON(!list_empty(&td_chan->queue));
> @@ -580,17 +582,25 @@ static void td_tasklet(struct tasklet_struct *t)
>  	for (i = 0; i < td->dma.chancnt; i++)
>  		if (ipr & (1 << i)) {
>  			struct timb_dma_chan *td_chan = td->channels + i;
> -			spin_lock(&td_chan->lock);
> -			__td_finish(td_chan);
> -			if (!list_empty(&td_chan->queue))
> -				__td_start_next(td_chan);
> -			spin_unlock(&td_chan->lock);
> +			dmaengine_schedule_bh(&td_chan->chan);
>  		}
>
>  	ier = __td_ier_mask(td);
>  	iowrite32(ier, td->membase + TIMBDMA_IER);
>  }
>
> +static void timb_dma_chan_bh(struct dma_chan *chan)
> +{
> +	struct timb_dma_chan *td_chan = container_of(chan, struct timb_dma_chan,
> +						     chan);
> +
> +	spin_lock(&td_chan->lock);
> +	__td_finish(td_chan);
> +	if (!list_empty(&td_chan->queue))
> +		__td_start_next(td_chan);
> +	spin_unlock(&td_chan->lock);
> +}
> +
>
>  static irqreturn_t td_irq(int irq, void *devid)
>  {
> @@ -697,6 +707,7 @@ static int td_probe(struct platform_device *pdev)
>  		INIT_LIST_HEAD(&td_chan->active_list);
>  		INIT_LIST_HEAD(&td_chan->queue);
>  		INIT_LIST_HEAD(&td_chan->free_list);
> +		dmaengine_init_bh(&td_chan->chan, timb_dma_chan_bh);
>
>  		td_chan->descs = pchan->descriptors;
>  		td_chan->desc_elems = pchan->descriptor_elements;
> --
> 2.43.0
>
