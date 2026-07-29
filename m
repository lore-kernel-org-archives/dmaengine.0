Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012002.outbound.protection.outlook.com [52.101.66.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FED44052D9;
	Wed, 29 Jul 2026 16:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340922; cv=fail; b=j+UaQu+LasOrwUUeyBaVbegDFqUEC5D3T2syIVjkNva/CNBRv0rOcmq/VCFYlKJ/i6kBte/1k/tHiKQ5rrxSJHvy+6834hy4dbYPouEAhFQaECYiB2dCbco5mouobt654KkAw0bnmh+hQi9QWxloUP0990S09cwm/HaIU+52HLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340922; c=relaxed/simple;
	bh=As49WknY/Us+P2cFDcX6OM+1RIOdG03lIoF4G2n+Ikg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=m6KWoA/8Aj4MoSK2W6M1TWjEsVja++Mf/kSVlJUu0Kjl4vNnF0poaSeEs5oTr5klLqV52qFcbS7amkyhiEleU5cyHDvInmrnAjQZLpkUW6psMWPf7cNQTwwsztibxSKrIGMBnyXGlLo1wl8koTJEZ3ZApxt6/6WZDfdrk4x5Yfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KBjVg5qU; arc=fail smtp.client-ip=52.101.66.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KBjVg5qU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQSibArkbxTI8Pvnl5H6CfS+SYA4UFU5KLdOu6bFwjr0ncXvnx5WW9vZOmUhyJrX1HpmUdIw4bmXfx1IREJlWqg4YJ8WmWwqrvzQ7Ow3gNCM6WEu2WhBBIq5M9cHd9fYzdp+/SSA7IjXVnAxQ582M5nx4NIpIk0AMoOKAPcCiURm1hCmij5noepW5hYfvtYt034/Omo1gLGQLMAiTx7bmUKddF4B+0hbofqmHgKkFforIyMDoJDDsFYxxquxFXFA0paiugvjvoWoSYXoWbiw2VXGOX9h1g1jWb1SFWOEB8aViLYCanHBvnVDFJM/i96ZeBUlOg5ozBPftRC1LbmCSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Scv115Yr/1F+9KdPdTt57OCrj/6W1ffQyWd5C5qRkSQ=;
 b=A795pqIS8emYDbL/Pq0FFMon18w/4+D6uPCi4Wm6FRiqFmZzwDSqGNS2LrllfAAKI41CRk8HAeUv9Pavcv4LOkkm+Zbi4eeIi/Dgn0E4CPYqBiR4C30aT5Tcd3a3/SCpzsbkxHxt7sJXmDmFSjwgsBDMunbKwyUJaA191BZT9Jvc/v9aI2LfuScQWoW4KJs0tktyOXsO8ejM87eAkHI6xMvgiR+kNLkI2hfRgynMlfqn24931MB4GIx8IquEJNv/Py6nc4pDa/oJ4cmjsPx+wzLs/KDg3UKq0I3gak1bJMjrErlzOq9CDYYRNUU5fJg7XaPoFjCd2EkiOAvtSE4R1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Scv115Yr/1F+9KdPdTt57OCrj/6W1ffQyWd5C5qRkSQ=;
 b=KBjVg5qUCMse351TyqVZcsBxgaw0Vw+GtMsNu7GhRxpZdZB9kgNYYQa7w3/KNZwzwLth55JfjbkqW2Es4Z3YyXtaM+pqEwHoIXBncxRq46v91c40GmaOl3C15LVE2bfur/83xVNK95AQTREm35AQjvSgjOC4NUNXxeod2DGVz+cSSUTeL+YvEeDAAs7gM4jiht1Ccuf+FhiAbz2q4hyo2l6WvQqxgeNdXXiqC73qu7w3YgwC94a0Vv55ZK1qw+y8rHdCOhTdUpYBDdgkEhuu+BZ5cMA9gpNi55E31hiqbo1/uLkSyeT4UR6xuRPA9WeTAOI3NXQcixZZ3Qxy1oNJUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 16:01:57 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 16:01:56 +0000
Date: Wed, 29 Jul 2026 11:01:47 -0500
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
Subject: Re: [PATCH v4 07/24] dmaengine: dw-edma: Centralize LL doorbell
 decisions
Message-ID: <amoj6zAcRocJbbCY@SMW015318>
References: <20260729143036.3087722-1-den@valinux.co.jp>
 <20260729143036.3087722-8-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729143036.3087722-8-den@valinux.co.jp>
X-ClientProxiedBy: SN7PR18CA0005.namprd18.prod.outlook.com
 (2603:10b6:806:f3::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8833:EE_
X-MS-Office365-Filtering-Correlation-Id: 08b2231a-d81d-49eb-b5f3-08deed8ab70e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|7416014|376014|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	POi143QigWLqAeYrcGKk+j7rpJHm2rB1MTmIfio71bZZ9mGLgRnJY1WbiPg6j/ZD6DqXAECsGT6oKMNLCjCIOdcm2tWt5fWxqPQrvXdfJ9wvmhgX38KlCm/V5rhT4WZrbVIFBeS/zqj6pNNAP/uAmzkCw5qf30NKenDP5ZbQyWno0+F9LZP4JW9VeZpEAKlL3A3/Qc0k5PSsebB0wKBo4O9X4CrmZFrln1/Wqkgcf9a8tXXNsQbryCFB/AFLVvnZZYuvZPE374mRSYfQKyteqzUyuojXD6BIkZcBquTioSfdjmLOZVmbWGIK3CinPiHEr5c64GPMzNAwUvCqJnwxV+UG6odNY9c8bS8oxtllP/N91DHB9W/spboK012XIfjcaNkNfZ6n9CafNstvMOJ4uTCCGKGArSE9oB9aiImhQMbsU3hRigpELwCx7SwTNxAo3+E/iAt2zScRf7e4jLEK5kIDuF61PVvEUXTfCQov9ItoagQvszj/Oqh5LC1XXrMzRq4BeLJNq92dK3ERtkPhbSRXWRdKxXqAxYi/BOPupF5u5qybRXeftFlwHkd5wW1om8c7Fgsv6nXNN+c3Q/7Fa5SkPisvZ3DYP7/F8zgFeDsVm9X7Rqr1YGUi/KmMHtvEQgTtkNztsoqWRc3V8eRd/eWBF0cXArVlDbYevMYuX/4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(7416014)(376014)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1DZ4LhfFVPAqcd9mZqxDWsOlj6udnDs6HLNF6uoSjDpNq0yMo6i9nD6sM+e+?=
 =?us-ascii?Q?czrYGlvSDBKC1LIdgu0zfdb0sKlsnGS1AfU81A3UrW3UeCA2wcYQThT9uWmc?=
 =?us-ascii?Q?DXztR5iWEFIcc7lRW4yTx56AfThHbQsG+uzmunKoCiuVO9cTppfYz9stjsYx?=
 =?us-ascii?Q?hiQitWC8+DQyVdMBBz7U1W50fSJ6cv71mquapCNBVb9T6c6QaaSqHPfXivLt?=
 =?us-ascii?Q?ZARMrC2B65Ah71Ree6FENX/qzDdSDCRA+ZReDdiDXtUVFKhxUNv+qu8EIbQw?=
 =?us-ascii?Q?z7KkixOJbm2ecNtyEIIKlYlFLR7tBPxNpZ854Sc4qsvqyFJP9+pcTXPlvCrD?=
 =?us-ascii?Q?S8fhYn4+R6YFo4vXCCIt2zSFeN9o0amBIdwztwVO/iaeZiVvbDsfi8tWhxA7?=
 =?us-ascii?Q?5Rrt5HZDV50uoLipaLItTScH0KQ97tOC23APeFmJjEOrlXL2EiEUW/b/gQCH?=
 =?us-ascii?Q?iA0XhDviDY+UkWrQhd39CQT04vtGL0DavzSR+kgeeLxhgo7+wursjpTSsDNC?=
 =?us-ascii?Q?Mt7wL8Sr79I4a3KWvaMR8QWOCR5VHf/g3sqVcZmYTD/e7/2kbMSyUt04AVU1?=
 =?us-ascii?Q?YTaqOp8ESRtsdsVHXuNULLLBIJ1dJXV/Jmi3+VTUnIFqmKs7HnYONZNEUfDx?=
 =?us-ascii?Q?tpWlvjhBAKcxw/+SMLBD2ZfBsTJJZi7YdnKWUzKODvVN1PqdvpZ3pszMnSbe?=
 =?us-ascii?Q?622dgkT10W3XbJUES6BWixWMprcvb20B4YpOqj/Fu9wIosrqwsieaiFOu7N0?=
 =?us-ascii?Q?UJTdc9ORn7L8ykdg1Azv4Q4xWXiVIMaXukRqlxxlAenfd6FWbNo2Czg42e8S?=
 =?us-ascii?Q?0Z/1VFpjO9yWQsuhyOhXsigXz4bVM9qW2WaWH48V9L4lfHOHvpFVJt211o0G?=
 =?us-ascii?Q?O8HGJ/3xRdi3lRtNs1sYT9La47cHsiDV94+rj7qO0Z5yRUDSrgFdqSLIVS1H?=
 =?us-ascii?Q?ZetkLFS3wQvFZ3fFy9OOvznUme00q0n6pFu7d8BMWP+WCndKd1yjCJxqlC32?=
 =?us-ascii?Q?i4z2PtlaGLSAkz2ZMvJTTcLmGnCcwimOzImIjJ+wP4+JvYZUFJ2wPbDrzhmO?=
 =?us-ascii?Q?v91PZKZ4FSx0qfRslMn+pjVYvjlv78VACwxtgMOzbOpASUJVnadzOssVAqeV?=
 =?us-ascii?Q?+MiI1pWEUoG1ndJ9rKSRCII1D7VWTLGoB//o3DwMyIJ+7MDrtvUK4qrRS4E8?=
 =?us-ascii?Q?SOVTfMRwoScJKgZCwS9k7hhS/qNkrftZTV7okksGsMi5hdYlFKygR0R6kAfs?=
 =?us-ascii?Q?pT4lO2QNfwLhrTsNnswS3ITanLYswzETuCyQjo3hJFK6i+i8pxmBqRK+1/Tf?=
 =?us-ascii?Q?JPw4L6zdQKRWRCxGZOFp/J4aqni2J26tfoGYaHg4z1oKfowVLMl4geh3F+SA?=
 =?us-ascii?Q?Ay0/BViWCEv+xtQAmWdY66OPMJrv8fvOJC//QB3emYN/4IBoIlYNC6MfYcC6?=
 =?us-ascii?Q?VSbbGZMk7O8pAj+WqyuKjWb+pLme0As0crj4ExyhB4opeQmO0A8LuX3t2gVh?=
 =?us-ascii?Q?ujix2C/8AZz+m5oepj1BMVOPIWe4bnAaKXGT9fcGP65kB39/O1Yt7fS9Lpgb?=
 =?us-ascii?Q?TnTeG/SacQIRg+XUAogd3XlknqL4IeJ8SkgrcJczLAtu5fbaozUI1PIOHVR3?=
 =?us-ascii?Q?KhIjEw5WdPf4k9UpY71UMBxLRJ6nIsg7li2Vn6KIdOYnyfcMElRzF5t+B6Up?=
 =?us-ascii?Q?tzMq/PA4Q9D2mGfFrAKal/SF2CvTBYA4gIxYmHXR/GOh2S04NCEcg1eV4rEt?=
 =?us-ascii?Q?y75g6kMFof5NXtT5jlUhIiFzPYEVjASVF1oqz7bJtgq194764Ipn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08b2231a-d81d-49eb-b5f3-08deed8ab70e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 16:01:56.8566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jk69cqLdSimYjRQLhNLkMA1BWHgBOydp3zKJxsYQDMtAVo8faUFX9kftx/5oTarHvDlMD+ZK6TFfMSrZ9Irvsp98nrgvNxfAjN0Q8hZZwjLRKt+x7ZeDP3sTTbH0Knh9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8833

On Wed, Jul 29, 2026 at 11:30:19PM +0900, Koichiro Den wrote:
> LL fill currently rings the doorbell every time. A running eDMA or HDMA
> channel follows entries whose CB matches CCS without another kick. A
> channel stopped at a CB mismatch needs one.
>
> Move that decision to dw_edma_core_ch_maybe_doorbell(). It rings only
> for a BUSY LL channel with pending entries, no EDMA_REQ_STOP or
> EDMA_REQ_PAUSE. The BUSY check prevents EDMA_REQ_STOP completion from
> restarting terminated work.
>
> issue_pending() still publishes LL entries only from IDLE. A later patch
> allows live appends. Non-LL channels are unchanged.
>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v4:
>   - No changes.
>
>  drivers/dma/dw-edma/dw-edma-core.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index b419ff2becf9..c036510dabcb 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -167,8 +167,6 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
>
>  	desc->done_burst = desc->start_burst;
>  	desc->start_burst = i;
> -
> -	dw_edma_core_ch_doorbell(chan);
>  }
>
>  static void dw_edma_core_start(struct dw_edma_desc *desc)
> @@ -249,6 +247,16 @@ static void dw_edma_finish_termination(struct dw_edma_chan *chan)
>  	chan->status = EDMA_ST_IDLE;
>  }
>
> +/* Must be called with vc.lock held. */
> +static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
> +{
> +	if (chan->non_ll || chan->request != EDMA_REQ_NONE ||
> +	    chan->status != EDMA_ST_BUSY || !dw_edma_ll_pending(chan))
> +		return;
> +
> +	dw_edma_core_ch_doorbell(chan);
> +}
> +
>  static void dw_edma_device_caps(struct dma_chan *dchan,
>  				struct dma_slave_caps *caps)
>  {
> @@ -374,6 +382,7 @@ static int dw_edma_device_resume(struct dma_chan *dchan)
>  		chan->status = EDMA_ST_BUSY;
>  		if (!dw_edma_start_transfer(chan))
>  			chan->status = EDMA_ST_IDLE;
> +		dw_edma_core_ch_maybe_doorbell(chan);
>  	}
>
>  	return err;
> @@ -420,6 +429,7 @@ static void dw_edma_device_issue_pending(struct dma_chan *dchan)
>  	    chan->status == EDMA_ST_IDLE) {
>  		chan->status = EDMA_ST_BUSY;
>  		dw_edma_start_transfer(chan);
> +		dw_edma_core_ch_maybe_doorbell(chan);
>  	}
>  	spin_unlock_irqrestore(&chan->vc.lock, flags);
>  }
> @@ -733,6 +743,8 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
>  	default:
>  		break;
>  	}
> +	dw_edma_core_ch_maybe_doorbell(chan);
> +
>  	spin_unlock_irqrestore(&chan->vc.lock, flags);
>  }
>
> --
> 2.51.0
>
