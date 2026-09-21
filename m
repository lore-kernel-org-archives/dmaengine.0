Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013065.outbound.protection.outlook.com [40.107.159.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1750D3C871D;
	Mon, 21 Sep 2026 22:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790028637; cv=fail; b=XCPKgxf3saY4HIj7s7t/dqRdZVZTPZPMBiT/iVOv2YkLmEVh48A0t23OmLCkjyhkXxPVoYMiMqMV2sf1zL+gebe46zNllxA3H8rQ3fuVQdjRYmi8K7fmnjPxjTpvNy9ubjbFbssUad+lC/qjW0hJu0+Lu2Icpk/aRcmB3+h4z4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790028637; c=relaxed/simple;
	bh=DynIHpYw2JnOMr7XdwLiGhf7Avjn2PlOU/7a6Pm9UgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OZ0VgSqCECIMhbfpt1hckKWBSr43zDh5SqbHdnhPQB5cO043KY/zLwhpiSDQI6LNcTdeLOTQLiItQ/6UVbj2Bcxj9eQKCF55B46Z7AqSXXcF1v5IxdSRnwUY+8RrGsSZMzM9YvVziccrx/2jVZsUJHsOqlMp89b0topeL0L8f5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=L2ZPKSI0; arc=fail smtp.client-ip=40.107.159.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="L2ZPKSI0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dvmtVh0pLYkko55OSTbe1/LxT+BCJ0OXTLvwwEg9a6HFAg6NVUoDjh8rsP4zUeW02gnqs30a5IHSHubAy2veUPWXO6A/uJ2ZST+/6o/qqNO5jHJAJNWydePjOSddsZy0ymUFzWqJoVDNUSj8LwUA9NEIgy4e0c2aXW7YUSlGADYINiJ/0z3g2Ms7WW82KSAAJTjZyUnjHAxQgRVhHv8Xzym9dfdleA9/JxDw8cIDkJTH40nTjyN3GMDtOGD6vhjuerkIg3cp7PWJVrkcDANtaCNe8Z8HfTvtXua6lUZ7H1Lrp3ako8Rn5INHkhqNU+C+FPOoyMqWsb0FQPFTkxpq6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxjLg+ItxeVIfT6envMPqIOB1reEheIMNDSujn3hXqs=;
 b=HpSC3eT4cWK7wFdIvNKQRxUMW0n0z2sr6ZNWdU6/vWe6ulMRb6i6RShahf2wJ/zArNjVvIl3JiZKBMxIxfaYDzDO6H/DUvNGAf/YJp5dUbl+AR9sGJdEzQOpUPild2zozJDAim5Hfmuc8zQn+vd+EtY8Rt4THC0spNtGUJOl0Y65h6dqEdsMI2zZk1+pYgl5qbfEdbP/EitQi0pbRRgQ26sykBPkXRa+AB2VnxXKxngstuBdgYiIDom4x/ndoKcBPKcLzUPcO05gE0tzTne5nE0woq1MtawEu0b6SFwm1hu47yXXwtogJyeXZ7KriiYtMcuZpEuC1U72y18eni4+jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxjLg+ItxeVIfT6envMPqIOB1reEheIMNDSujn3hXqs=;
 b=L2ZPKSI0b5FWh18yGPUdyKZEgS3I1wYRv0BSedvSg/h6zFMWv8drc53oHpoK0a3FtpAo9vILE/OAJqp7eEzCIaUdhZBYRIQYdvVbZqmqUq+gkWjBbo4R68v0mTvxOLnCPC9G7snqc5Z426a+poBakrUSY2IgDSLuPk+tVCmspGRXh2MR4DhjRyd0T3PMrEjTeLKL9sR7TBdfC5nkgL2YSvprS6GnzWrId1VLMvRpxhx2mzp6FsRA9M8m1yGy5t6QNm/CC4dGLWW8hEfaZ1cXtxNs305vgVCmZj/50GIHWQ9klgvNxNpggghDsAZ8PtwzhHIiM9PLPF9jvjA17bQ+8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB11961.eurprd04.prod.outlook.com (2603:10a6:10:617::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 22:10:30 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 22:10:30 +0000
Date: Mon, 21 Sep 2026 17:10:23 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v5 04/23] dmaengine: ste_dma40: Fix failed start cleanup
Message-ID: <arGrT2T_Fs6tazPd@SMW015318>
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
 <20260920-dma40-fixes-v5-4-5c55cd7f92f9@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920-dma40-fixes-v5-4-5c55cd7f92f9@kernel.org>
X-ClientProxiedBy: PH5P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB11961:EE_
X-MS-Office365-Filtering-Correlation-Id: 990086c6-16f2-4c98-dec8-08df182d2647
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|19092799006|10067099003|11063799006|5023799004|18002099003|22082099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	INa3wad8K740pSfRaMQDRqE3AyeJ80itDDKZ68GT6NxW6difm5O81em3nvsPI0eupapvIuaWmXVs+K2aaPjzlJGZ7TKOZemB+4hEk0vzeQJbWXnORLJ22KJDpdE7bV9O10xM95DeTjOQOy23OETgDHWF1dR/d2hDpRaxuSnbWbRnR9cQrpC/6eqcOMuQUrNRO5uPQtEdp3hcLc5SD+MmXMpera1Xh0eZx1XPlvMLMEW2RfTb5EoWn/HalYcgagO0TY7SN5SFx/jEO8BRbZYVUfj2UdzrUlncgVl+5ZgFLKGBaNCXYnXVe2XdxMKdbVGn3RzgRcrVc0dNzHGJmeQCjOsZfIUWaA1P8/CpbYEfXybLUXLmqWeb0Nsw3jesvFMmh0P/e1G7YosryZ01WIUu6B1i/EylH8hA1VAdnUhUPJ63dkVkNBQQPGA0+X+/CWjk2nIdnCK7Oggd+skKIrj08d3eXdNgAkM6BU7173jCCQxCepjVNwY6IjVElgyWtipDCM1zXwX1792ZuMhsOCZfnIz1nIwQfMhKX6za10PVVanhkz2eWlvaEz6yrNEqzIOgp1FG/0UqNkedSom7ePoXajunQyzHYODBJPuhBiMB1KM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(19092799006)(10067099003)(11063799006)(5023799004)(18002099003)(22082099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AmzRitU77setnYptfs6edT+XejRjgdSwY8+ctkEkz0CRJOCd+Fl917bhaIPy?=
 =?us-ascii?Q?0m+MIhgXAAzpnQ7yxGgTKQ9H3rVrkmY2khKvU8bYkvsL+ZNtNimLhrhcNlkV?=
 =?us-ascii?Q?+CCT5B48O6ws9QXAUph+BgO6Faff3yE0ukPZcBoYr1GvRr4yCJ2OvUcssD3e?=
 =?us-ascii?Q?0wBpojmRqFbtYG+U2TPZ+GKG43l6ctMSgYUJ9UHK+NSSd3/2/b+b4gKX7xST?=
 =?us-ascii?Q?51bmKNcDbJ6PoaYx1zWXRIJJt4pYMN1S2KwAuFCMpaHvRG3Ukq+tECftRrPc?=
 =?us-ascii?Q?iNcz7UmOwh0inkoO+mU+USUyBEExrWEzBNxL2fv5KkSGf/AotrdifeYIDCvA?=
 =?us-ascii?Q?W1iJANXD5/+AL4dVyeKp9SbK2CY0saXIsG4ZDISJT3t59offEp71m0d3XG9/?=
 =?us-ascii?Q?2OghsXnzCcD3IoAIxtamd4CZyd0ar+jyaKoxMGhzz/VCBa7ihzrR2GrG9GVl?=
 =?us-ascii?Q?nyF2IKxJdL2XzyHjJ9goW1D6Xf4vLMMxgQSVa7oepp3kRmLw2VObukpuje8J?=
 =?us-ascii?Q?3qJga8rLNZRj+dANvWZzcxS5Eg0xyXAkRFNBupIdJnZxcn+LhH59p3Kreuan?=
 =?us-ascii?Q?Trrl2aTLumHo3OyeERoLARbw8Pg6TKmaFITT75oA+Qgkx/AI0g8S/uM1Ktxe?=
 =?us-ascii?Q?pbx4neGA1I7MRU10rjxizVJvjsi1QnhitYQN/ZqO+a92dHFX9uHAwtRL23ga?=
 =?us-ascii?Q?BEG3imcjT15R15opJhomjhL9THQ+4CD1MaQ+N64javPbdwW/SezRlTC1Oc+5?=
 =?us-ascii?Q?Bl3tJMEeJZnT5BV3e4PMVpasRdCwt+BiZ2Kd8EZYg0LIUiwtba5EcPTlMPcN?=
 =?us-ascii?Q?XQFe10g1mj0dYcpXekAOXlNTZf/8KpeITNBCAOdnx+SSwk7WwTHIkmNv3K5r?=
 =?us-ascii?Q?2YJttgythn4gRq1vmDrlFFb/ER63S7f/Y2hknApeCN6eWVSbS1Ei78FrxCQa?=
 =?us-ascii?Q?jKt3YC9/lSXVG8sRj3Aw2vSb/OiK/TuIsdiP6wkt+Z1In12CFbuQC2KxYXvb?=
 =?us-ascii?Q?/y74wtv+KXWISDrID+BDVIxuq48ZNJ482T5Vo1mlUu+kNGVBWRkcVUfNy8dD?=
 =?us-ascii?Q?n754rfRROhvDKsMqOXeZZxV6vomnPXBdYBbDheATtSSzTmU6oRR/crrDs6py?=
 =?us-ascii?Q?jalkE7B8GYhR7DKNBcx62nhh+SmosCnHM9K8TJ7i4/taKpdwpdqwtBSRon5d?=
 =?us-ascii?Q?/lMG6b8FtM5ciancRU6Ef0TF4yLhv2Cgqk2GMtFcyg5BI/1vghh7AWoixjCU?=
 =?us-ascii?Q?GkK42oFltVRLyQ6naNv3IczFL1Sk8vASF6A+PNfJpz0gnCl5LaQO3c+I0pSb?=
 =?us-ascii?Q?8HA/AwkwC79YGCU2fiTosCl38fAcA8GlKLnrpzUAc+DgRKSFU8nDf1DwNwP9?=
 =?us-ascii?Q?TvaU8LRwIIsdftK+l9GO1iNRNTn0z+VBAY4HaYpQlTJrf93zxmSF7Uhq7p7e?=
 =?us-ascii?Q?OrAdEuGcj+gdDiewDqa6v1DajbDrpJ8tObdjeQl4HWgerSDsGKIAxB1QC/p8?=
 =?us-ascii?Q?3i6pv689cGdogpTKz0GyIm86Eklvk65fE0GZCJAH77n/WwGRXjhZ9G77KwaI?=
 =?us-ascii?Q?SbgCiZeCgQBQn4MQANuBReXAcjnYuM2tLXbo9uVHUP7KE+UWI3LN2+1Vgzd2?=
 =?us-ascii?Q?SDPDUuzkphMaljJPseLr5IRTeyeSXYkgFCwICmDK1AJm0SuZbnMUh8OqxwN2?=
 =?us-ascii?Q?TyuvDOhkrKRhcpXDYm7Hp9Sm870AJeGnpYEQXfuznO5/5+9MomF5S40p2u24?=
 =?us-ascii?Q?u5RkDRl1fU3pTbDmEyyGH/2eb+fpxUWlScAqwclXtrOM6R/6fzY+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 990086c6-16f2-4c98-dec8-08df182d2647
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 22:10:30.7397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HjN197JgpskcVTRrklmAWYQEBs5F3DSOQ7QhdPN43js9cZkWc6c/PbWrhq0GFrsyYb2t3HgXECzjtBCXH9Z8IC+rRvMkq0fnIAbAhe1VErClg6QrIIzc3pZt6dz8DTJM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11961

On Sun, Sep 20, 2026 at 08:59:39PM +0200, Linus Walleij wrote:
> If d40_start() fails after a queued descriptor has been moved to the
> active list, d40_queue_start() currently returns NULL without unwinding
> the transfer state or clearing the channel busy flag.
>
> Fix this pre-existing error path by completing the descriptor through the
> normal tasklet path, clearing the busy flag, balancing the runtime PM
> reference and returning an error pointer to distinguish the failure from
> the no-work case. Do not free the descriptor directly, since it has
> already been submitted and has a DMA cookie.
>
> When starting the next queued transfer from the completion handler, put
> the completed descriptor on the done list first. This preserves FIFO
> completion order if the new transfer fails to start and prevents the
> completed cookie from moving backwards.
>
> Use done-list membership rather than the cyclic flag to identify terminal
> descriptors in the tasklet. A cyclic descriptor that failed to start is
> then completed and removed instead of remaining permanently at the head
> of the done list.
>
> Fixes: 7d83a854a1a4 ("dma40: remove "hardware link with previous jobs" code")
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.kernel.org/
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ste_dma40.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 1f9e8c7249b1..280a0d2f16c5 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -1650,8 +1650,15 @@ static struct d40_desc *d40_queue_start(struct d40_chan *d40c)
>  		/* Start dma job */
>  		err = d40_start(d40c);
>
> -		if (err)
> -			return NULL;
> +		if (err) {
> +			d40_desc_remove(d40d);
> +			d40_desc_done(d40c, d40d);
> +			d40c->pending_tx++;
> +			d40c->busy = false;
> +			pm_runtime_put_autosuspend(d40c->base->dev);
> +			tasklet_schedule(&d40c->tasklet);
> +			return ERR_PTR(err);
> +		}
>  	}
>
>  	return d40d;
> @@ -1698,14 +1705,14 @@ static void dma_tc_handle(struct d40_chan *d40c)
>  			return;
>  		}
>
> +		d40_desc_remove(d40d);
> +		d40_desc_done(d40c, d40d);
> +
>  		if (d40_queue_start(d40c) == NULL) {
>  			d40c->busy = false;
>
>  			pm_runtime_put_autosuspend(d40c->base->dev);
>  		}
> -
> -		d40_desc_remove(d40d);
> -		d40_desc_done(d40c, d40d);
>  	}
>
>  	d40c->pending_tx += callbacks;
> @@ -1719,20 +1726,22 @@ static void dma_tasklet(struct tasklet_struct *t)
>  	struct d40_desc *d40d;
>  	unsigned long flags;
>  	bool callback_active;
> +	bool from_done;
>  	struct dmaengine_desc_callback cb;
>
>  	spin_lock_irqsave(&d40c->lock, flags);
>
>  	/* Get first entry from the done list */
>  	d40d = d40_first_done(d40c);
> -	if (d40d == NULL) {
> +	from_done = !!d40d;
> +	if (!from_done) {
>  		/* Check if we have reached here for cyclic job */
>  		d40d = d40_first_active_get(d40c);
>  		if (d40d == NULL || !d40d->cyclic)
>  			goto check_pending_tx;
>  	}
>
> -	if (!d40d->cyclic)
> +	if (from_done)
>  		dma_cookie_complete(&d40d->txd);
>
>  	/*
> @@ -1748,7 +1757,7 @@ static void dma_tasklet(struct tasklet_struct *t)
>  	callback_active = !!(d40d->txd.flags & DMA_PREP_INTERRUPT);
>  	dmaengine_desc_get_callback(&d40d->txd, &cb);
>
> -	if (!d40d->cyclic) {
> +	if (from_done) {
>  		if (async_tx_test_ack(&d40d->txd)) {
>  			d40_desc_remove(d40d);
>  			d40_desc_free(d40c, d40d);
>
> --
> 2.55.0
>
