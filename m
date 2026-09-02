Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011070.outbound.protection.outlook.com [52.101.65.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EE349CF3E;
	Wed,  2 Sep 2026 14:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360933; cv=fail; b=ms73NFdP/22FnRYCrih+sWRT1BFiFtTu6uckFTQOj1vCdgr7hvFSC36Zoz5IKqo2YfjqNU//gWsWMxQIOFLNRLCXFoY9/lMoVEqon4XjOiCsjxMxhZVOpyT3YzmoV8ziLldxhEI0yYccFfJqgQOgaMCRC0+Yns5ge65OokKgI3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360933; c=relaxed/simple;
	bh=EQhkubnepEsNCKU/8qM+4+X6GFK/hK4GqSOZalJPzxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DoeXc8NVB6wsGpFGbJ/iizLnIcdjXAcINS1n3HUzseUFtxg9UZrM1Patwv1b82M1hGYxem6P5bixTfRJ/4w5bQKQkyjwjS+ZUiRMxA80ru/7STW+ynp/wCG323MbTsHN8S/OQmsiYY4pj4MPVkWHHYAXND/QUkFQGNvLAsIzjiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MdAGCL86; arc=fail smtp.client-ip=52.101.65.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MdAGCL86"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JiZKQWqWJ37WdIMUZrjXqE47+/rD3pnYqci56jWRmMis41thV77obxXuY82xMMhNIXFtnuO5tuNvoLQTePlP6Q3h4tAz+kvPVENJXo+97GwcwUbLif5fuKv3HTbDjv5GCHZwd+NB5rex5dTcb6eMSTwjMDxuN/2OqHPwkHwIUMCglMgjQ189PiATw8XXDWGKr094r+fdhtvQG2m/rl9L3409tVUoSYAdOvEnsYIDp0NIUif/jslt1pfLfCd/XmFbMbheDBDlZNnIKGkd4DU00WS5AnLm+IdcckRxs8fyZuNKmqPs+jrzdyjTwfylIwB/St/oLFi4Jq4Evd1/5sjWng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75T2r/h55y96PxOlCEiQc20UQE9bajEycxL6VI1uysU=;
 b=xPVWvRfFmBg3klEW+W7FVhkM5Ek4UpH2dw02hMukLVW5qpzOCItH8abz1JODyjxxxXKeDw7OLEjPTJTce2mbuYr0NUd4M/Au5hZQN/fj3sUZwuyNX3dyivKJNmEdy+2Hq/CAbtcjJbq8e2Qlc05SJvF16O4NHeDqeJ7ZlNwauDF8w4tg90JW3DopNid4hCDUwcF9af6pq+JjAhMciacwVT6x86EzVj6efj9ajq9MMZfkSWIQO/oEZswK3QXdeZBxlgicv+tP2kBjBdv0iOnwc0Y8ecwOFSkAq7OGdy9jBW9MG3nvAvgPs0j+Dye9xDgQ5NmmecIPHwBhWz5P0jPDvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75T2r/h55y96PxOlCEiQc20UQE9bajEycxL6VI1uysU=;
 b=MdAGCL8650DrVWTqRdSXCMABIwbD+J7TZMZrnswMRzpP9hzyzJXodtaLuqA8NiqajCLwQ7CHc8rxgJYtaxKYUtIP/3fuzULjKY+7VpJW0iPBd3jXtYCxplEAkGijggdODTfl83VH5fXcx+hYZ/c6k/G3lGYULIykzHs0OHh9kxPOfBKBxDKoNbSM6xiOvK/vk3CreUMJot2eOirfsiakc0AwW25uxFrRRdBo9n9+qY9/tQRPcSqn2SIWIZrVl39VsSkySYFtJzPviGiP4C4JWJqoY+Ssbt9Uv+RQy2vORovYBI2zPPqDuBCWCuMvZYiRAW8GyubYbNY95BoqKDohsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by BR0PR04MB591767.eurprd04.prod.outlook.com (2603:10a6:2c8:33::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 14:55:27 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 14:55:27 +0000
Date: Wed, 2 Sep 2026 10:55:20 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 31/34] dmaengine: dw: defer callbacks via channel BH
Message-ID: <apg42AqZsyt7O6hb@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <51d53a46331dd58a67e71cb8c53c6e67f4b5503e.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51d53a46331dd58a67e71cb8c53c6e67f4b5503e.1786384169.git.allen.lkml@gmail.com>
X-ClientProxiedBy: PH7P220CA0116.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|BR0PR04MB591767:EE_
X-MS-Office365-Filtering-Correlation-Id: 59411ce4-852e-41b0-5ff3-08df090239b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|19092799006|366016|6133799003|10067099003|5023799004|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9yoied2VOtBDtQjRHxblMticQA1q8NeRoApqFOyYfFcvHBEfNYaachu6GkMVVkkxmT3Rn0sa2hsirX4bAclgnLiwJ2e6mIIyk5UZxwqg9e0wYeb5xviisCthW2rxiAZJJ2QqkdCmpcci9vOgvZupEmMu7nr/tMJTdzR7PHhqS4Oj/a78KzTW7ZlrA5WAC/8TNzQ5F82nnX0H6SICn7zWfj+ZiicN8lpP2dKsA5D5oHz7daCRJvcfV5QmfkV+s5ThtIeTOsBVX/T4xKPTehLCW5pYiB1YJWcnkkbfuRHM1vk525tyTcHIKBtwe3cOkC1rcQzroEF9ZiSHDnDz/MKb4c2LNa5GiMX4o2MMyQRZVh2PNdIvhjl05fTq9jp04oEwJAsEN5bIJiOjQBND2nbkrVlPJlBVTlu19Is7ju5+TQHsdV1PjDE50b8teqmjUTnE62yVdAOCJMTIFoPWPpTf9EI/7pLIj4JVW1CdnAEtIIuqns7YU5KyoWWkvNBoo+NZkmdAWZXJZ5fXBU4xAhaZ1GpFb3scLv8a4h0kMkd2mKle1iFy+G1BAG7CMgXA3AP5Nlr//cKvjm1hXmfjHjaOXXmlPJXknasNl0ouS3UimyKw5hsyv/r6u1YrX3MgVzXP4XO3qqylImkLbdaVJSxCYJeanombrBwVWo/9WRE+UAc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(19092799006)(366016)(6133799003)(10067099003)(5023799004)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?90cEbQrK220VYmYfqZJv6lUT9wgx4APHUrA/h4IkPFPYs91YX44eCgx5wraG?=
 =?us-ascii?Q?c8mbzQ+xQar4rP2MUuJXtvKt828O/PFoEtCGRRIiwN4fYaBdURMZUvROBFie?=
 =?us-ascii?Q?tC8dOO5n8s9/Fi+utMSZ8ggE+reZ4AtVZ+L9t9lGm5FYr2aknL2dNr6LK0zy?=
 =?us-ascii?Q?8qkpFq3QrLkFhmwagHKUmUrzmEKGd9kA2NuZ1CphRNdOjoJfhxWpKmqmdvHI?=
 =?us-ascii?Q?Re521Cj8i+0MgTJdgYoFVxEcgfPFk2VgKlNCwDgT+KFjwvcbihwtUHKPiA+x?=
 =?us-ascii?Q?3ZbeNyu3fpyIKziCwhJ490/2cRfHNpKARC3IUElyI7x1q4umWgA2zm8CmF66?=
 =?us-ascii?Q?l911jNdru1XCKsAsTt8leDzcV00eF/pniqZ2IueCs312y1kGQG76EXEaazHg?=
 =?us-ascii?Q?cV7VWVOB2IK75uFu0HF7l2l0WUkrx0gfhIc9kQk1PbSYazcwBKHmFU5RZIDX?=
 =?us-ascii?Q?1FwNlvXPIrMcrZu5M7Z3hKnQcKKSLDgzPf2MD1VwLqvb9G1VtOpUOeAyXkt/?=
 =?us-ascii?Q?0Oldl6VP9q+kElwe6SM0NGL4L6K2uwmpwTzzOzvaFP3QXcMy8nYBJbtl+DPc?=
 =?us-ascii?Q?S1qTMBHGDRQ1hclqw+/DuIrawJdjmPwZ3Z0vlFy819aGJ2zMGUzACsvPBU7e?=
 =?us-ascii?Q?OQC9FsL4tu7TOAhuFsXveuLBeCEiUHoLKvXMRbXmy8sGoMkcXDg3mk10wFgU?=
 =?us-ascii?Q?4cdJcdXkoAbeHUKCgW9YxSxDCobwPm//bTy6RSPOrBdUd9gnKf2NhrWLddn0?=
 =?us-ascii?Q?xrxoxUA8vg75LejXCvvo2/tm5ecOU0EyRDPTkisvZXCreqXBKWF4Bp2LFGYa?=
 =?us-ascii?Q?mMYNY8sJS8XqEHrt23AKzaMujVffLDt0IpytB2RPTyTYcgHipQF1/1xoopG0?=
 =?us-ascii?Q?dNgvRSZHgu4EjZomhd6QjaOwUDYyrSHV5yPlEWAheZ34PoZQ8LfUK5TD1nrf?=
 =?us-ascii?Q?zzHQCtDorWKoH9aYQc07ppNHVamX/yomNnjYu9yAAP+mMsF4qK6rMq0uz3yk?=
 =?us-ascii?Q?rYiTStCDdrNM47m2evp6IAtukn9gMXd+Tr0huXyt1xvfLO+JBhtHgiFKzkZy?=
 =?us-ascii?Q?WkkUa0dQq7scw44VQ4IOdLr7xcZyyVUmbQHa1kzj6+Iq2nMCYwZFpCAt0YIZ?=
 =?us-ascii?Q?XFuM6TJVYbuc6xgzVu53/I/V80ZIuEUUbX0tFPP0FGVyA5oaTFEG/uxwJJzi?=
 =?us-ascii?Q?NsROJawmLqocqju0GGmbJqv30d2KoNBIFDp2QNcA5oh5k7JQ6lf2LerqVYV9?=
 =?us-ascii?Q?l216AYSMUyxCFzXAtqCBTl/GP9GPvZWGqFDipIl4hH6FjKfEl2vtJLgYaeua?=
 =?us-ascii?Q?Kaga5kr1agDDICvrEHrwu85mgKk6gTmFS9kj8fmCkoZmRC3cqbNVRjr5Jutt?=
 =?us-ascii?Q?RPKZRL7+e/Pw6D2zXPuDhamg3VY9ByxX3bhWNaB+DYZT763dEPlBKCyyFWcL?=
 =?us-ascii?Q?TtFUDz04jJw/GJcxY7IzYZEQaFvulMso/auhr59UjBPl9yDIKjWjbbpBxGn9?=
 =?us-ascii?Q?ICW3dzA7jD0+llnm0wTfBIv17V3wXbkYYbyzYIk0gkU9d1b8XDOoDh4cWPgL?=
 =?us-ascii?Q?mA+3PJn4Ti0P7Po68SGGU6o5M5LFCWRmwnxODN3cLLRhVttTiAEvCoF+tDzC?=
 =?us-ascii?Q?2jsbHBtaUSGVKfDB9c+KkfWaNCeiHrSPdpogV7byiPE26cdNDN3QERtJJBOZ?=
 =?us-ascii?Q?X+UqF9LTBmpccLumswPdIw9nB0x7CrEcCnXXwUrBFFAW8Ns3Ve0ILkiNI4Be?=
 =?us-ascii?Q?qVOId7t3Z1UBw+1IgLcIPiAk+fozJEStIwwbttS72AgXS+NRnqL1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59411ce4-852e-41b0-5ff3-08df090239b5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 14:55:27.5298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: grgNYG8RBIQgfIsAoMHVBh2FnMPolIBvq6dJVV/rqn7RzNCGuzCw2TxaR0YcVf6yTjdmNVwJH0nQVqJSMM/+e0m4s7u37uw5/tLbO3TSyOM4KQdRrgTogvdq9uvL7NJE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB591767

On Mon, Aug 10, 2026 at 11:09:32AM -0700, Allen Pais wrote:
> Queue completed descriptors on the channel and invoke their callbacks
> from per-channel BH work instead of the controller tasklet. Add a
> synchronize hook so termination can wait for deferred callbacks before
> their descriptor storage is released.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/dw/core.c | 42 ++++++++++++++++++++++++++++++++++--------
>  drivers/dma/dw/regs.h |  1 +
>  2 files changed, 35 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
> index dd75f97a33b3..2765acfe5644 100644
> --- a/drivers/dma/dw/core.c
> +++ b/drivers/dma/dw/core.c
> @@ -236,25 +236,24 @@ dwc_descriptor_complete(struct dw_dma_chan *dwc, struct dw_desc *desc,
>  	struct dma_async_tx_descriptor	*txd = &desc->txd;
>  	struct dw_desc			*child;
>  	unsigned long			flags;
> -	struct dmaengine_desc_callback	cb;
>
>  	dev_vdbg(chan2dev(&dwc->chan), "descriptor %u complete\n", txd->cookie);
>
>  	spin_lock_irqsave(&dwc->lock, flags);
>  	dma_cookie_complete(txd);
> -	if (callback_required)
> -		dmaengine_desc_get_callback(txd, &cb);
> -	else
> -		memset(&cb, 0, sizeof(cb));
> +	list_del_init(&desc->desc_node);
>
>  	/* async_tx_ack */
>  	list_for_each_entry(child, &desc->tx_list, desc_node)
>  		async_tx_ack(&child->txd);
>  	async_tx_ack(&desc->txd);
> -	dwc_desc_put(dwc, desc);
> +	if (callback_required) {
> +		list_add_tail(&desc->desc_node, &dwc->completed_list);
> +		dmaengine_schedule_bh(&dwc->chan);
> +	} else {
> +		dwc_desc_put(dwc, desc);
> +	}
>  	spin_unlock_irqrestore(&dwc->lock, flags);
> -
> -	dmaengine_desc_callback_invoke(&cb, NULL);
>  }
>
>  static void dwc_complete_all(struct dw_dma *dw, struct dw_dma_chan *dwc)
> @@ -285,6 +284,24 @@ static void dwc_complete_all(struct dw_dma *dw, struct dw_dma_chan *dwc)
>  		dwc_descriptor_complete(dwc, desc, true);
>  }
>
> +static void dwc_chan_bh(struct dma_chan *chan)
> +{
> +	struct dw_dma_chan *dwc = to_dw_dma_chan(chan);
> +	struct dw_desc *desc, *_desc;
> +	struct dmaengine_desc_callback cb;
> +	LIST_HEAD(list);
> +
> +	spin_lock_irq(&dwc->lock);
> +	list_splice_init(&dwc->completed_list, &list);
> +	spin_unlock_irq(&dwc->lock);
> +
> +	list_for_each_entry_safe(desc, _desc, &list, desc_node) {
> +		dmaengine_desc_get_callback(&desc->txd, &cb);
> +		dmaengine_desc_callback_invoke(&cb, NULL);
> +		dwc_desc_put(dwc, desc);
> +	}
> +}
> +
>  /* Returns how many bytes were already received from source */
>  static inline u32 dwc_get_sent(struct dw_dma_chan *dwc)
>  {
> @@ -965,6 +982,11 @@ static int dwc_terminate_all(struct dma_chan *chan)
>  	return 0;
>  }
>
> +static void dwc_synchronize(struct dma_chan *chan)
> +{
> +	dmaengine_kill_bh(chan);
> +}
> +
>  static struct dw_desc *dwc_find_desc(struct dw_dma_chan *dwc, dma_cookie_t c)
>  {
>  	struct dw_desc *desc;
> @@ -1256,6 +1278,8 @@ int do_dma_probe(struct dw_dma_chip *chip)
>
>  		INIT_LIST_HEAD(&dwc->active_list);
>  		INIT_LIST_HEAD(&dwc->queue);
> +		INIT_LIST_HEAD(&dwc->completed_list);
> +		dmaengine_init_bh(&dwc->chan, dwc_chan_bh);
>
>  		channel_clear_bit(dw, CH_EN, dwc->mask);
>
> @@ -1321,6 +1345,7 @@ int do_dma_probe(struct dw_dma_chip *chip)
>  	dw->dma.device_pause = dwc_pause;
>  	dw->dma.device_resume = dwc_resume;
>  	dw->dma.device_terminate_all = dwc_terminate_all;
> +	dw->dma.device_synchronize = dwc_synchronize;
>
>  	dw->dma.device_tx_status = dwc_tx_status;
>  	dw->dma.device_issue_pending = dwc_issue_pending;
> @@ -1374,6 +1399,7 @@ int do_dma_remove(struct dw_dma_chip *chip)
>
>  	list_for_each_entry_safe(dwc, _dwc, &dw->dma.channels,
>  			chan.device_node) {
> +		dmaengine_kill_bh(&dwc->chan);
>  		list_del(&dwc->chan.device_node);
>  		channel_clear_bit(dw, CH_EN, dwc->mask);
>  	}
> diff --git a/drivers/dma/dw/regs.h b/drivers/dma/dw/regs.h
> index 5969d9cc8d7a..c9e32bd6110a 100644
> --- a/drivers/dma/dw/regs.h
> +++ b/drivers/dma/dw/regs.h
> @@ -279,6 +279,7 @@ struct dw_dma_chan {
>  	unsigned long		flags;
>  	struct list_head	active_list;
>  	struct list_head	queue;
> +	struct list_head	completed_list;
>
>  	unsigned int		descs_allocated;
>
> --
> 2.43.0
>
