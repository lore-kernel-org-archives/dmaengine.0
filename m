Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010071.outbound.protection.outlook.com [52.101.69.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F524A3877;
	Wed,  2 Sep 2026 14:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360255; cv=fail; b=sLzvmGs9o5dt+JkUyB58qxolTnbIakU1PHLHX9CyaoZj0Tp4JpqQNwwO94noqcbU0gEL2/hqZlLHQIgqXbfs6Qd+pFp33atQQSR5u92OrOjClsG6xMBIsyyRsGsGq3s0JA/VYyaBoYMYNEnAM/awfsXRXkCpe0wN0vdJMFcwk4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360255; c=relaxed/simple;
	bh=+x0xisY2Wd/yiPTKMcKWMCzkWe2HkHZ68DrPiRFb8ME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c3LI9fSt/OkaIYRyL0bZAlthrmOYFeRWadHekVe3kSBMLlijewebrIlRakTa8o7apUbuoo7Vqd86OOY8gFDA84FNz/n/0juIE0leKx/UnO10C0fzYH4kS9dGD/kjVK2TunvkkxaYn1ei5QtMTVn8MiYn7DW1ZcnfRv6g7o8SRdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ly7Z0iNz; arc=fail smtp.client-ip=52.101.69.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ly7Z0iNz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6H/6C904/d3jTOn+ZJ0O0LGxBUfKQIgznnRsoR8DzmnMIdbj11sYNWS0e+pDd0qCcpq8Dn0Iv2zf+3W0Ut86qrorZjbksbj0SZV6U+7TtaMH3o2KHTyjVlrqSgEMnUYMJO2FpykR7To8Vj0D49kBVFEeYfZuPQZoNE8Zf/Iz4hOH3aAp7MBwci99LqMzu6rQKZsOmyKFRARbTXTKCMcHVq1cmAJ7KA3TarH9Qj38wL34gVg2MRTe+D2yZyrutOml3A1oYIKYBJHb9bZTP/V7Q/wsVPzV0g/DL8639DkOJr6C7fnkjmKGXelzO2djdC8rT9cpwkDZOyhUzWP0oQdhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7GicQ3j9Tqfh4MlXZJAponY6wa7Uthzr6ZSCnkhhWg=;
 b=E239Y5bn8nF2lR6Wf11L1Cx5nPaz9lKWmMpno/o+UBDlUDpbhC4cuj12I8x7mrkSst/HtSUTX0+2giBUu3fMXfK/IfWZ+jonRM6yDZ4YO7PM99ZTWCKT1wYsgyPOJURlL1Qmc3ICQZvDQqG/eqNsbWn6nZFamsx73QIIZyZBIlGs4KOPXjVRVZTywQIS112VmHxEQob4vlIBeZn0p7xCB9DQSzqrjzKG3/AxOPWjY3Kk6h+xj7iqZrt7JF4UTwLY9meB++ErlVkK6UvN/Vxv0oNV90Kr92/IQMGkDF+5uN8ESWhGWZKQOShGYd8OsnM7fCgBIqBepWb/8sJDvJeO7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7GicQ3j9Tqfh4MlXZJAponY6wa7Uthzr6ZSCnkhhWg=;
 b=ly7Z0iNzrQJ1uMnCpT/4FsGXHTci5KzdqdeuF5U45LgG3zp4gBkUcEoqXAByTNM7jMAX02fRfxo3Kgc/zmVTKLOFa/MhyCU/LNqGFp4BUyi9QTgIkn8y6CFxg8MQg4FontcD0lsWpwXXY8WdKAnoR1zfBIlUwmI+oIpFGeHRM+pBrf5VYXGBjKINAA0kB2wBu57AKZa/6HCEH67JkKG0Cvdi/Sd7yivxrIW/iUdd79h64rWCSEYS2xoPPunV6DAMQB+TdIs0rv5Cv4R5HcU0GDCeC77KWzinrQpImT1Cn+eseCKbuUjnqMAu8h0v28ckeHfcovYLjJ7IM7xwU88Hgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MI9PR04MB043780.eurprd04.prod.outlook.com (2603:10a6:290:84::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 14:44:10 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 14:44:09 +0000
Date: Wed, 2 Sep 2026 10:44:01 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Alex Williamson <alex@shazbot.org>,
	David Matlack <dmatlack@google.com>, Lukas Wunner <lukas@wunner.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>
Subject: Re: [PATCH v3 09/34] dmaengine: ioat: convert cleanup tasklet to
 dmaengine BH
Message-ID: <apg2MWGffJSivTz_@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <00e0c9c2fea2a0b00a2f3a91bcea240c6021648a.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00e0c9c2fea2a0b00a2f3a91bcea240c6021648a.1786384168.git.allen.lkml@gmail.com>
X-ClientProxiedBy: CYZPR02CA0013.namprd02.prod.outlook.com
 (2603:10b6:930:a1::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MI9PR04MB043780:EE_
X-MS-Office365-Filtering-Correlation-Id: c650064b-e6db-4c86-aff4-08df0900a5cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|23010399003|366016|376014|7416014|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/XPRzgF63sP11Jrh3lUyRJ/y7Ihxvs7Cyp1tQw0Q2nXKzoA1S0MbYSAbVOs80daTb+fwvsyX4C9nDbTDxmxRiHvNf9OyAR9tDKe8abyZJAh0okjSnsRZfzadycHH9zCcGida4ELPRs2qAGa2Y2dB6hQahRkQAnFbILEvbni2PB0nlXt+NOU4+c7cA4HISEncNA9P/Tvo9QpG+JzvH5H+I4wMJQz+ZWHQaI6wr9+NB/u0gQzUUa+afofMfRJqhnzYQPC8O1ozaC1u+GPpUkCarS46xvpjBS9oNxSdgz4vtCEm8l6NF4lG1AJVUj6KpyVPhxp2XnMYmaB6VAzweBM/EYWLRJzKMeG6uF6uBWVbQMoaqHdDMP7xASgfVTSSM3vGN6ccXDjapm70HZi+er7gD2C5aEVdoyOtWRcZaSfxIbFxV+x6706MQkQe+O42i6Pr1d8pa8LjDF1skoYChZ9DTAmGTuSWJSb+r8pgoD8nQq1+G8Kz8HXPlWN4suttjSKdIGMBLcGxZ2qoNr2+Vw/ZnQlSvNe+nyiN57Qb8368/0oCxs2nkib0nbzybT5GWPLjA8BGuicYKYjI9E18bfwmzfgIJciwDTOUbBC2MzmU0rl26FJLASUiOBfEH5we8pepM6TTisJXaJ+Xuus1rfdEXdHM0iBMMPSzK+7c9/zSImo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(366016)(376014)(7416014)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OysEQb1YDo6Ccs8Zm28iayIoyX8sorPOrlbNet74ISdiG0ixoTSGfBFY1Goz?=
 =?us-ascii?Q?a6YMjiAxfKi10/wh8hqXy4c5kgWyvfy6n55PIswzk/Eknebu4OhCownonxUn?=
 =?us-ascii?Q?eHDuAFeMaFISyHK7K/NCWTIVTjw2cqlko1cRjeyj0c5CHoRl7Eb41Yi3deSB?=
 =?us-ascii?Q?GK0J+wZDWG+nOxi6miBJMtr8Bm7wqKOp6kNynmdrepFHAL4FrJS1ZwmDV9k3?=
 =?us-ascii?Q?IoaIh0P0He8DskL9Mbew0DogkWv8ek4ySkAiAQ0FHmjMEaBZqG+N2rrsMaEn?=
 =?us-ascii?Q?gnDAoaAbyV6r8cl28COEY4+B3xPSoON+t5gtP0KG+hv3AFrqHf4grpOKJ/x/?=
 =?us-ascii?Q?aUYN3LwLHug8A7hrN/CBsoh9jrbjE/J9EU982vzubDqzcQOZ0n878CsZemU9?=
 =?us-ascii?Q?EmP0daEDy3KuAlz+xazdxw2PMZzIzRRcyYSDnMm7CjcNJlgG6u6esDojW5O/?=
 =?us-ascii?Q?F4KdasVLMXfTeMU3fu8rdMXXvh17zGVGa5DMD1myGye2XQqWf4+/nmvhq736?=
 =?us-ascii?Q?vqY54299IlfXFOHqhSvuC/lsCfuZkf+VjQ4oDtFpUQxP8rmAa5DjpUVhonM+?=
 =?us-ascii?Q?xACH8CPs7JOtKIzQ77wdt8yHE7DqlaDpV2BglyS+wh1yDstinZO4Ok1IEAvb?=
 =?us-ascii?Q?NswF1O7nQWSOR2E1PTjZIQQyM2RPur5KUYEo7ADWRJdyuKjSjEjLd7M11xZ/?=
 =?us-ascii?Q?EMZJ6BLTxeuwB/zlDRhZ1X/yrTVP9xR7THAi0Dl1ShjUbil0CDODCdUPNtMe?=
 =?us-ascii?Q?esxwQaztwvUOyBR+yM+EdevzBimsWEtWf0UxM5bhuVV9tQrtazkCKQ+Xqw5n?=
 =?us-ascii?Q?d9akuyUx7NPAuvqFm4jxbDGrqKyaerVN9z4y3JnCnXdVbdvc1iMEa4MlTeiu?=
 =?us-ascii?Q?8lTG/YenlbeFICJLzd4zLUwYKxAJXeAuF047z/qxjuIPylNfp/+sB2tnax/x?=
 =?us-ascii?Q?62eLD8XnN3cfkR7nfsW0BogOpekYNIZzdhFnOa7OhTm0/ZCFfijMc30/+BU1?=
 =?us-ascii?Q?eUhngAeiCuH2FoN78haOvCC0l+tQsqhmqsNTZ8z9fGbUOmvA4we7NySIi8Oy?=
 =?us-ascii?Q?xAvbW1BKFeUQhseR7V4a+V5BBVfQVgqk6FYbTqywIu+yPsqFt8NmM+rhdgHD?=
 =?us-ascii?Q?usLPSILv/0BNbhqD9SOmOenI41DF78tjZmDnski6ZsVgpxlSMjQds5W2Fyyl?=
 =?us-ascii?Q?Rb64XB+7aRSyOt8Y15pTL8kUhdRKvi6/tCr8TPv+dWXKr9/gx5u6F76i9Qqf?=
 =?us-ascii?Q?S0z5KZxQHl3uh+BHvauRqdo9srnB3hEOxCgsbNpJiYkUzpij7OVP5YU/WPj1?=
 =?us-ascii?Q?QjtURnWRoIXvfnk5WaOt/42sNI5K9SSF5WE2TUh1VWcD6gCwjbYFGxBpArWy?=
 =?us-ascii?Q?ZgUVTqGtDxLiLM/t1EUj8ZZxQaAYsANCuukr/Bqi73uA+aZRczfkA8vnZxpg?=
 =?us-ascii?Q?tU76QIYjRf+8Ge1M7IhzfXJy3hc7MGkrP0Os3+Y5kO0Q0/Trx4b5DbC1yKbY?=
 =?us-ascii?Q?Zc95dtORGf86UTQTPwYeRF//XQqfDTzxERXDamQgz6SukyHEOH/boecM6aBO?=
 =?us-ascii?Q?aZfid8j9oyghV9gWuXSgpuiFnGPP6L7OUVTBybMXMaMKzTcrbMSIEzEyA8xA?=
 =?us-ascii?Q?0zi0dfBUUimsTK+xOfyFtR+08yZIJ7FJTpi4jdwKcqTkPQojO3/zzJMm7UYg?=
 =?us-ascii?Q?4CvXMHa51bnJP8Rm12tSJAKx4vvJvbAPtDA4w1770gKJGwZXcMlqF+HF/9oz?=
 =?us-ascii?Q?b2G5sXWVBy1eGTz9onDC2I+WD6s57RKPZOZD3l09Xqzp/4mNMnPz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c650064b-e6db-4c86-aff4-08df0900a5cc
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 14:44:09.8542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NwajSgRx3CYIxidpKj8ZRaD5BYx2m0kmG2EyKGQRwSCaqYVu9ABs60Vbi3fe9nRChcjTIYvb4QnTrAYkBzzfVYsimIYt7LcuV48mQo3gTC8VRrfAKWxvcII90649O89F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB043780

On Mon, Aug 10, 2026 at 11:09:10AM -0700, Allen Pais wrote:
> Replace the per-channel tasklet with the shared dmaengine BH helper.
> The handler continues to run in softirq context while dmaengine owns
> the common scheduling and teardown mechanism.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> Acked-by: Dave Jiang <dave.jiang@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ioat/dma.c  | 14 +++++++-------
>  drivers/dma/ioat/dma.h  |  3 +--
>  drivers/dma/ioat/init.c |  2 +-
>  3 files changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/dma/ioat/dma.c b/drivers/dma/ioat/dma.c
> index ee93b029f9e3..c7a63dbac6e2 100644
> --- a/drivers/dma/ioat/dma.c
> +++ b/drivers/dma/ioat/dma.c
> @@ -110,7 +110,7 @@ irqreturn_t ioat_dma_do_interrupt(int irq, void *data)
>  	for_each_set_bit(bit, &attnstatus, BITS_PER_LONG) {
>  		ioat_chan = ioat_chan_by_index(instance, bit);
>  		if (test_bit(IOAT_RUN, &ioat_chan->state))
> -			tasklet_schedule(&ioat_chan->cleanup_task);
> +			dmaengine_schedule_bh(&ioat_chan->dma_chan);
>  	}
>
>  	writeb(intrctrl, instance->reg_base + IOAT_INTRCTRL_OFFSET);
> @@ -127,7 +127,7 @@ irqreturn_t ioat_dma_do_interrupt_msix(int irq, void *data)
>  	struct ioatdma_chan *ioat_chan = data;
>
>  	if (test_bit(IOAT_RUN, &ioat_chan->state))
> -		tasklet_schedule(&ioat_chan->cleanup_task);
> +		dmaengine_schedule_bh(&ioat_chan->dma_chan);
>
>  	return IRQ_HANDLED;
>  }
> @@ -161,11 +161,11 @@ void ioat_stop(struct ioatdma_chan *ioat_chan)
>  	/* flush inflight timers */
>  	timer_delete_sync(&ioat_chan->timer);
>
> -	/* flush inflight tasklet runs */
> -	tasklet_kill(&ioat_chan->cleanup_task);
> +	/* flush inflight BH runs */
> +	dmaengine_kill_bh(&ioat_chan->dma_chan);
>
>  	/* final cleanup now that everything is quiesced and can't re-arm */
> -	ioat_cleanup_event(&ioat_chan->cleanup_task);
> +	ioat_cleanup_event(&ioat_chan->dma_chan);
>  }
>
>  static void __ioat_issue_pending(struct ioatdma_chan *ioat_chan)
> @@ -690,9 +690,9 @@ static void ioat_cleanup(struct ioatdma_chan *ioat_chan)
>  	spin_unlock_bh(&ioat_chan->cleanup_lock);
>  }
>
> -void ioat_cleanup_event(struct tasklet_struct *t)
> +void ioat_cleanup_event(struct dma_chan *c)
>  {
> -	struct ioatdma_chan *ioat_chan = from_tasklet(ioat_chan, t, cleanup_task);
> +	struct ioatdma_chan *ioat_chan = to_ioat_chan(c);
>
>  	ioat_cleanup(ioat_chan);
>  	if (!test_bit(IOAT_RUN, &ioat_chan->state))
> diff --git a/drivers/dma/ioat/dma.h b/drivers/dma/ioat/dma.h
> index e8a880f338c6..4bdb1ae937e4 100644
> --- a/drivers/dma/ioat/dma.h
> +++ b/drivers/dma/ioat/dma.h
> @@ -111,7 +111,6 @@ struct ioatdma_chan {
>  	struct ioatdma_device *ioat_dma;
>  	dma_addr_t completion_dma;
>  	u64 *completion;
> -	struct tasklet_struct cleanup_task;
>  	struct kobject kobj;
>
>  /* ioat v2 / v3 channel attributes
> @@ -385,7 +384,7 @@ int ioat_reset_hw(struct ioatdma_chan *ioat_chan);
>  enum dma_status
>  ioat_tx_status(struct dma_chan *c, dma_cookie_t cookie,
>  		struct dma_tx_state *txstate);
> -void ioat_cleanup_event(struct tasklet_struct *t);
> +void ioat_cleanup_event(struct dma_chan *c);
>  void ioat_timer_event(struct timer_list *t);
>  int ioat_check_space_lock(struct ioatdma_chan *ioat_chan, int num_descs);
>  void ioat_issue_pending(struct dma_chan *chan);
> diff --git a/drivers/dma/ioat/init.c b/drivers/dma/ioat/init.c
> index 737496391109..788927820d86 100644
> --- a/drivers/dma/ioat/init.c
> +++ b/drivers/dma/ioat/init.c
> @@ -765,7 +765,7 @@ ioat_init_channel(struct ioatdma_device *ioat_dma,
>  	list_add_tail(&ioat_chan->dma_chan.device_node, &dma->channels);
>  	ioat_dma->idx[idx] = ioat_chan;
>  	timer_setup(&ioat_chan->timer, ioat_timer_event, 0);
> -	tasklet_setup(&ioat_chan->cleanup_task, ioat_cleanup_event);
> +	dmaengine_init_bh(&ioat_chan->dma_chan, ioat_cleanup_event);
>  }
>
>  #define IOAT_NUM_SRC_TEST 6 /* must be <= 8 */
> --
> 2.43.0
>
