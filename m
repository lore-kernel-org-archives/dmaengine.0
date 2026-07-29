Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012045.outbound.protection.outlook.com [52.101.66.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA19E42C4F6;
	Wed, 29 Jul 2026 16:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785343660; cv=fail; b=gccGQ7MT0eLQO3zq2ixJ/vKIrEXXYLl7cjHO49NZBE6V/j/EMSfO4zskm/jjMNI6PVo9ti9//HJ7uj9eaFGZ7kAcUrpoTvpT33mvEpTTvuZKGSoYyB+5jHlNDS6lHLc6QT8dv//oVYoMIdxmUl4+3oWCs4tdwj6zw35d+2GSMks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785343660; c=relaxed/simple;
	bh=ujppR7pKG0dF6aqNAdD7sW5hYIJYuIOAP6T46ONSxNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=U7UBBWvrpszbJTnRtxRyXyGUl0BSe0Dbas1vMqamIYIrEsl/wFOgqJEVA2eLvpuHQ2gaYt2bMuebEnA1ceL6MmHlQgcIshOFb3fQb9KCg3kyGc+QlFZNTXMMdruyyGUsEe7yKhSAzNKZ5xc1IwI6ttKgv240Jwlho4+0lCeQ9Bs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UJ4ikrq0; arc=fail smtp.client-ip=52.101.66.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UJ4ikrq0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UCQCp+aadKRBJHfxvW80Lmcgapc+/DV0DkWzpyDxw6VuknuqIgdC3wpYv6o6RoBY2af7mGDVEMG8JyNXwenz2op9/VHj6yB/8rMN3ScCE/Og2rwP55dW4kNDUrSI+BXxs136ILreDyo1EDfSMCd/nPntnp8XKikTYSUJ3gpSrm0/BaJOVl90IJGaHbfM6HMfkfYwlOet6nQeW4K8Kfmfknk0EMpADlaAHLEnEV6Cj+EooT74Qo6gb6Nt6OcNBs/30f9vsPaaOn673cEl1q8ChPgIpUlzWSQIcxxe1ZXZlRq0cgVIY2eC43qK57GxzB5ke+tLYoTlRZpOmCeeFpllZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppP1NISqVLDnAhNcP88NzlBlgzBH6MauYV72ApkjC9U=;
 b=NyY7gHO5dbFBCctQNuadDIictwJIYhH9MKwTyFTjPg2XCS87cFa2HDdCXiCfl/erhwHwgbToFlxmBz5bQWVZIkUhh8qpXuAQCHHLXAmn6zYnLVmt1ru0oGPS35qmwSjzu2R1So6W8uMWGAO8lA4YDemTkhNEByP6KBHL2pZBbCfgvs3R4emwyDE2qK2fza4YohnGAWdHzWnUWLLJZhpo0xynliShr+jg4KuJPjMjVH7ktIPPraEXC8AB8TyaGCIRQgN32jPAsISF87g4UHVUOdw0NW+bVRyKvAlSpPrqorQZxffKRLSpa2HMgYWUJ4MjVYyL1GmXh9o3h9iLrpr1VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppP1NISqVLDnAhNcP88NzlBlgzBH6MauYV72ApkjC9U=;
 b=UJ4ikrq0WGgEU7BNLkrdRZfdL55vURQlAiETH4Zp0LfUM2SASzabNQ3aOWlwthFeDs99P25sjlErZd6fiOu/DVQQcWg1doDzexHnILipFLuic1DNF4ObjKgBfYlXyuJikxh5YRtxdTVVb+6GTuDVHP/JEmCSDWKn4ZC0zwntXVtATWBass6aOdP+akDmyA/Co0yo9rwfjC9O4W/RrILsrLNmv67cVIqb2/QPTVc3TDCtA0NXjsL7R9L2kff9IMyXi3EcSnFTaS+rTqkC5b3POkM66LJFef5EQKHw8VLujLCPqZtNpE4SJ/Hfr460rAFEtz8w2DKZH1UPbSpwjKZgDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10657.eurprd04.prod.outlook.com (2603:10a6:150:217::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 16:47:31 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 16:47:31 +0000
Date: Wed, 29 Jul 2026 11:47:22 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
	Kees Cook <kees@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Christoph Hellwig <hch@lst.de>,
	Serge Semin <fancer.lancer@gmail.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Niklas Cassel <cassel@kernel.org>,
	Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/24] dmaengine: dw-edma: Prepare LL progress event
 handling
Message-ID: <amoumkWEpqF6yx8w@SMW015318>
References: <20260729143036.3087722-1-den@valinux.co.jp>
 <20260729143036.3087722-9-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729143036.3087722-9-den@valinux.co.jp>
X-ClientProxiedBy: SN7PR18CA0027.namprd18.prod.outlook.com
 (2603:10b6:806:f3::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10657:EE_
X-MS-Office365-Filtering-Correlation-Id: e8ff0f77-9376-4c2d-541a-08deed9114c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|366016|1800799024|23010399003|56012099006|11063799006|4143699003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	GjTYVCjWtKByA7rQERi7xEKr4ayc3hk3BpHSit/rLOnXk+u1i8EDOj1mJ8wSPe7YAGbaQNt/iuoUwOVCdM5U3W5nmOuYil3LhPXk1IbRo1/O5qseAON7uxuoW5AACVQT2pYNezlRS2ELRS7um0tsdI53KOsE0kgAe/UR8WHc8/YTEAfCYv4KUxyClcyo9CV0M8CKIV8uwFeDyMkncSsBERlx9yJW4sqPCckbbEQSMuROXeG2M/1V7yhvuNGmnXIj9+2SV3I5DOZfP2mvivcgRT89gcQvmDeLBoWZ8TSs2gPLcChL+7Hu1FK4eJSvC7MJGSJWK1WOVEQYcCmWzpWAdzklIf+oEe4EAwgyAYwfNPJOXsmeVzYjuN2WYQwlJdHYWQVxLkySuroWfLDfN2keo9PZdex/a3jSOkR2ADQoJv4x65oFmD5pBnaD8TAYLpg7SMHN2ebnYhsyBc9iSaRzEHMdNhCRJbE1rtq45nQmkefdbXqw6ZDbWlVLDKxtqSEPoXkkBG9PK48e7BBeRiLmQVchRrmzarS5XUqNrOFlW2rC0RIwr0+fCPXT3V3Dp8l+JqnZcWA4QwNiADdKnJ6ZvOzgFKQHRyi5w3aTadtPIZM4pxrx53pSjYFDgE06Sxw1Mb73RGJQ3RJye/OHFxMdklk7JyVJ1jsB6sIwwgGKaJs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ks2F/vMD9+1M647FkHFLUumtc4IEMmqbNl53K1IzH6FhbUsMjNMhbd9QcS+6?=
 =?us-ascii?Q?1JdpIwSdK4pdAsmcLTZ3NRMfo7wHjK6G6cY+dkwLQwLA1MVbTziARIeMWRSL?=
 =?us-ascii?Q?ZadMz9mt7ViFMEKj0vPMElqMAwgR5qLcZhk/X5clHi6ScfcZd8HNMCViJ5+1?=
 =?us-ascii?Q?g/g+44Eu+n71+AYgq5EpvXhoSRHg1Vg2NImAoDmIBRAXzrmcv2APlO1aCfdt?=
 =?us-ascii?Q?JKlwPzgTErwlp/1qu85sdcJYoi8Ad2VIqHF9ZJAf8ACd7EAGtFu683D3YjVW?=
 =?us-ascii?Q?3hc4ssj+j3QrHOsn3rXihT+tILz80f9i3SbKFbspRwVCDhSXS7P+XapO9GS2?=
 =?us-ascii?Q?Ee9MaZKcI1eIv23kwLyFkHQk6+H8xqAhjMPMXjbe3jk/rvxUfgsNTfDa2+F1?=
 =?us-ascii?Q?xB5bO0IcHCkRS32kCnU0IBP2TWJQgtelNbl0Lo74E9qetf5eeLeC9opg5z7G?=
 =?us-ascii?Q?jepF7Uzo9tuKkBjJb3hcyTcpFqRrmAvpO2GWPZQZyWplLb8XrrD5YaOTF53G?=
 =?us-ascii?Q?ojH8NK+EmRK/PPqPiD6YBZXgBuU9G+A4+uOhWBVGrdV2N2Ge3yELcno3Ld5A?=
 =?us-ascii?Q?61CgE10yiFStU8di/iJFWmrxSCt5cimHlFAhhuOx1yNFUY0KpAMuWUwEBQCp?=
 =?us-ascii?Q?vv+6Hl+ex2rgdI+A2FjKnB5XuC8FnTExhyTzEKuxesGU0/+65F3up7cRtGYZ?=
 =?us-ascii?Q?u0UVYQC3PM8BJRtdgCa03YKB3WaqWxE6gKhVkpv5k9eg3k/lHrKGmrP81l5j?=
 =?us-ascii?Q?GBLVDLFR0Dfs+TVk9+KUNcjhFefYW+oOWEFC+J9OQLHXZAWt7jtAvaI6huKm?=
 =?us-ascii?Q?/ezpUUUt8qquozLrAA4DKiJdFBh8cRG8vMbdItvAzAyhyw+Vva5dighGHe0X?=
 =?us-ascii?Q?nF0TaI7ziYZhSe6qZxl96sLK8zsQYY8AqTP/VZ5F1rO8nsDcqUNhm9NoBbrL?=
 =?us-ascii?Q?B8FXzBQ7aVyXOK9S3ntX8tBCDmfD4zpyByU/WXhzC6LEKOQKumCLNnHWxrxL?=
 =?us-ascii?Q?YmZpNH/Uw0Rb4PKuqJv7YXEXKM8Lf/wgNPLkTeD24zRa4kCnF1wR1602juYK?=
 =?us-ascii?Q?gawKmsI0Ar0uVDg+8++NYJLQWzcrIDX5HoCESQWf1XHcMca0gA6tLN38kEHh?=
 =?us-ascii?Q?HM3nx8ii+/2awVBK/ZAahh7D0HsAffa26zm6EUq+jL6Gc1Q8NzI1z8jnwNTT?=
 =?us-ascii?Q?aurrlH4ntSs8uf+KD+VqofkXiO8JJu6yYH1MXHoYJfOe6U97Ujrw/5p6YHTY?=
 =?us-ascii?Q?npMPlsh74gphjigoyZ+vPLUez15an/SbwC3n7WtfK4Sb+JdYoKfxv6Kacfzd?=
 =?us-ascii?Q?C7nHbatVh8oBP/69/5Tc2gRdudBC+wOH3QQsvKcW+orDR33H3hI344EoYYsp?=
 =?us-ascii?Q?b8Dd/Aq0/NucwZyY/HHkEIHJFGQ7EQPVodEcX7jElAI+aVPwrRoCnN89d1zd?=
 =?us-ascii?Q?AM+aS5ibR4CFkaNJ8AeteQdI5ubzaqWu/PifWote5TaGkzain118jnZ7RJIU?=
 =?us-ascii?Q?YJkebBeuAuBRC4WiWwjV2hgZFMFwcEevgFJk7y3QDPEx+cuichPYJo3eao8Z?=
 =?us-ascii?Q?6jGZfr8UkUZMAIpZ9jFBEgeCR9GqGWxr2yaxjSfGBdm2FcXis/T5bfuodT6+?=
 =?us-ascii?Q?jb5UVjYW8ll+KFi6ptCJ0Wz3dOw7hiQsq02INMoHigOc+pgeO0NbV2xKNncj?=
 =?us-ascii?Q?dRhzbGxn7u8qErRnk3ZNyK/2rwW6QfLQvz2Xp3Cru9Nde7nBy7eSecnWT+nQ?=
 =?us-ascii?Q?whho73BILiNsRFehenePSgMa1EMU32rt99OYxtBFAM8Xc+NXjY6X?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ff0f77-9376-4c2d-541a-08deed9114c4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 16:47:31.1541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2RcvUqyzwSCqCc268RY2cOK7hkZ/p+ySF3KFyYHbpV75cU3+Ez6vXYWKDOMRdweIsKUYZuOCkdT8R41WQvxGXuFR7VznbVUCW8tj8WOPEgN8qVDMMtN7DR/+C8AaVPsp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10657

On Wed, Jul 29, 2026 at 11:30:20PM +0900, Koichiro Den wrote:
> A later patch records each observed LL event (STOP or PROGRESS) together
> with the LLP sample taken in the same interrupt-handler pass. Serializing
> that capture with a channel restart needs to know whether interrupt status
> is shared per channel or per direction. It also needs a provider operation
> to clear stale LL interrupt status before a channel restart. Add both.
>
> Centralize runtime request updates in dw_edma_set_request(). A later
> patch uses it to cancel a pending LL recheck when STOP or PAUSE changes
> the channel policy. Rename the existing workqueue event bits to
> distinguish them from provider IRQ events.
>
> No functional change.
>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
> Changes in v4:
>   - Explain that the LL event and LLP sample are recorded in the same
>     interrupt-handler pass. (Frank)
>
>  drivers/dma/dw-edma/dw-edma-core.c    | 35 ++++++++++++++++-----------
>  drivers/dma/dw-edma/dw-edma-core.h    | 12 +++++++++
>  drivers/dma/dw-edma/dw-edma-v0-core.c |  2 ++
>  drivers/dma/dw-edma/dw-hdma-v0-core.c |  2 ++
>  4 files changed, 37 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index c036510dabcb..b84aed59bf77 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -30,9 +30,9 @@ struct dw_edma_desc *vd2dw_edma_desc(struct virt_dma_desc *vd)
>  	return container_of(vd, struct dw_edma_desc, vd);
>  }
>
> -enum dw_edma_irq_event {
> -	DW_EDMA_IRQ_DONE	= BIT(0),
> -	DW_EDMA_IRQ_ABORT	= BIT(1),
> +enum dw_edma_deferred_event {
> +	DW_EDMA_DEFERRED_DONE	= BIT(0),
> +	DW_EDMA_DEFERRED_ABORT	= BIT(1),
>  };
>
>  static inline
> @@ -73,6 +73,13 @@ static void vchan_free_desc(struct virt_dma_desc *vdesc)
>  	kfree(vd2dw_edma_desc(vdesc));
>  }
>
> +/* Must be called with vc.lock held. */
> +static void
> +dw_edma_set_request(struct dw_edma_chan *chan, enum dw_edma_request request)
> +{
> +	chan->request = request;
> +}
> +
>  static void dw_hdma_set_callback_result(struct virt_dma_desc *vd,
>  					enum dmaengine_tx_result result)
>  {
> @@ -243,7 +250,7 @@ static void dw_edma_finish_termination(struct dw_edma_chan *chan)
>  	if (!chan->non_ll && dw_edma_ll_pending(chan))
>  		dw_edma_core_reset_ll(chan);
>
> -	chan->request = EDMA_REQ_NONE;
> +	dw_edma_set_request(chan, EDMA_REQ_NONE);
>  	chan->status = EDMA_ST_IDLE;
>  }
>
> @@ -360,7 +367,7 @@ static int dw_edma_device_pause(struct dma_chan *dchan)
>  	else if (chan->request != EDMA_REQ_NONE)
>  		err = -EPERM;
>  	else
> -		chan->request = EDMA_REQ_PAUSE;
> +		dw_edma_set_request(chan, EDMA_REQ_PAUSE);
>
>  	return err;
>  }
> @@ -410,10 +417,10 @@ static int dw_edma_device_terminate_all(struct dma_chan *dchan)
>  	} else if (chan->request > EDMA_REQ_PAUSE) {
>  		err = -EPERM;
>  	} else {
> -		chan->request = EDMA_REQ_STOP;
> +		dw_edma_set_request(chan, EDMA_REQ_STOP);
>  	}
>  	if (chan->status == EDMA_ST_IDLE)
> -		chan->request = EDMA_REQ_NONE;
> +		dw_edma_set_request(chan, EDMA_REQ_NONE);
>
>  	return err;
>  }
> @@ -724,7 +731,7 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
>  		}
>
>  		if (chan->request == EDMA_REQ_PAUSE) {
> -			chan->request = EDMA_REQ_NONE;
> +			dw_edma_set_request(chan, EDMA_REQ_NONE);
>  			chan->status = EDMA_ST_PAUSE;
>  			break;
>  		}
> @@ -764,7 +771,7 @@ static void dw_edma_abort_interrupt(struct dw_edma_chan *chan)
>  	}
>  	if (!chan->non_ll)
>  		dw_edma_core_reset_ll(chan);
> -	chan->request = EDMA_REQ_NONE;
> +	dw_edma_set_request(chan, EDMA_REQ_NONE);
>  	chan->status = EDMA_ST_IDLE;
>  	spin_unlock_irqrestore(&chan->vc.lock, flags);
>  }
> @@ -778,15 +785,15 @@ static void dw_edma_irq_work(struct work_struct *work)
>  	do {
>  		events = atomic_xchg(&chan->irq_pending, 0);
>
> -		if (events & DW_EDMA_IRQ_DONE)
> +		if (events & DW_EDMA_DEFERRED_DONE)
>  			dw_edma_done_interrupt(chan);
> -		if (events & DW_EDMA_IRQ_ABORT)
> +		if (events & DW_EDMA_DEFERRED_ABORT)
>  			dw_edma_abort_interrupt(chan);
>  	} while (atomic_read(&chan->irq_pending));
>  }
>
>  static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
> -				   enum dw_edma_irq_event event)
> +				   enum dw_edma_deferred_event event)
>  {
>  	atomic_or(event, &chan->irq_pending);
>  	queue_work(chan->dw->wq, &chan->irq_work);
> @@ -794,12 +801,12 @@ static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
>
>  static void dw_edma_done_interrupt_deferred(struct dw_edma_chan *chan)
>  {
> -	dw_edma_queue_irq_work(chan, DW_EDMA_IRQ_DONE);
> +	dw_edma_queue_irq_work(chan, DW_EDMA_DEFERRED_DONE);
>  }
>
>  static void dw_edma_abort_interrupt_deferred(struct dw_edma_chan *chan)
>  {
> -	dw_edma_queue_irq_work(chan, DW_EDMA_IRQ_ABORT);
> +	dw_edma_queue_irq_work(chan, DW_EDMA_DEFERRED_ABORT);
>  }
>
>  static void dw_edma_emul_irq_ack(struct irq_data *d)
> diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
> index 761a5ab4bbb5..95bd4bf47ea2 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.h
> +++ b/drivers/dma/dw-edma/dw-edma-core.h
> @@ -41,6 +41,11 @@ enum dw_edma_xfer_type {
>  	EDMA_XFER_INTERLEAVED
>  };
>
> +enum dw_edma_event_scope {
> +	DW_EDMA_EVENT_PER_CHAN,
> +	DW_EDMA_EVENT_PER_DIR,
> +};
> +
>  struct dw_edma_chan;
>  struct dw_edma_chunk;
>
> @@ -155,6 +160,7 @@ struct dw_edma_core_ops {
>  	int (*ch_quiesce)(struct dw_edma_chan *chan);
>  	u16 (*ch_count)(struct dw_edma *dw, enum dw_edma_dir dir);
>  	enum dma_status (*ch_status)(struct dw_edma_chan *chan);
> +	enum dw_edma_event_scope event_scope;

I remember needn't event_scope at all.

Frank

>  	irqreturn_t (*handle_int)(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
>  				  dw_edma_handler_t done, dw_edma_handler_t abort);
>  	void (*non_ll_start)(struct dw_edma_chan *chan, struct dw_edma_burst *child);
> @@ -163,6 +169,7 @@ struct dw_edma_core_ops {
>  	void (*ll_link)(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr);
>  	void (*ll_clear)(struct dw_edma_chan *chan, u32 idx);
>  	int (*ll_cur_idx)(struct dw_edma_chan *chan);
> +	void (*ll_irq_clear)(struct dw_edma_chan *chan);
>  	void (*ch_doorbell)(struct dw_edma_chan *chan);
>  	void (*ch_enable)(struct dw_edma_chan *chan);
>  	void (*ch_config)(struct dw_edma_chan *chan);
> @@ -284,6 +291,11 @@ static inline void dw_edma_core_ll_clear(struct dw_edma_chan *chan, u32 idx)
>  	chan->dw->core->ll_clear(chan, idx);
>  }
>
> +static inline void dw_edma_core_ll_irq_clear(struct dw_edma_chan *chan)
> +{
> +	chan->dw->core->ll_irq_clear(chan);
> +}
> +
>  static inline void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
>  {
>  	chan->dw->core->ch_doorbell(chan);
> diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
> index 7ca4b6823ece..27c57f755d83 100644
> --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
> @@ -680,11 +680,13 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
>  	.ch_quiesce = dw_edma_v0_core_ch_quiesce,
>  	.ch_count = dw_edma_v0_core_ch_count,
>  	.ch_status = dw_edma_v0_core_ch_status,
> +	.event_scope = DW_EDMA_EVENT_PER_DIR,
>  	.handle_int = dw_edma_v0_core_handle_int,
>  	.ll_data = dw_edma_v0_core_ll_data,
>  	.ll_link = dw_edma_v0_core_ll_link,
>  	.ll_clear = dw_edma_v0_core_ll_clear,
>  	.ll_cur_idx = dw_edma_v0_core_ll_cur_idx,
> +	.ll_irq_clear = dw_edma_v0_core_clear_done_int,
>  	.ch_doorbell = dw_edma_v0_core_ch_doorbell,
>  	.ch_enable = dw_edma_v0_core_ch_enable,
>  	.ch_config = dw_edma_v0_core_ch_config,
> diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> index 67a3a7778280..c8b9f6c42494 100644
> --- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> @@ -435,12 +435,14 @@ static const struct dw_edma_core_ops dw_hdma_v0_core = {
>  	.ch_quiesce = dw_hdma_v0_core_ch_quiesce,
>  	.ch_count = dw_hdma_v0_core_ch_count,
>  	.ch_status = dw_hdma_v0_core_ch_status,
> +	.event_scope = DW_EDMA_EVENT_PER_CHAN,
>  	.handle_int = dw_hdma_v0_core_handle_int,
>  	.non_ll_start = dw_hdma_v0_core_non_ll_start,
>  	.ll_data = dw_hdma_v0_core_ll_data,
>  	.ll_link = dw_hdma_v0_core_ll_link,
>  	.ll_clear = dw_hdma_v0_core_ll_clear,
>  	.ll_cur_idx = dw_hdma_v0_core_ll_cur_idx,
> +	.ll_irq_clear = dw_hdma_v0_core_clear_done_int,
>  	.ch_doorbell = dw_hdma_v0_core_ch_doorbell,
>  	.ch_enable = dw_hdma_v0_core_ch_enable,
>  	.ch_config = dw_hdma_v0_core_ch_config,
> --
> 2.51.0
>
