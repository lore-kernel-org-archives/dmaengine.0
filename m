Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012000.outbound.protection.outlook.com [52.101.66.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16FB3CC7EB;
	Mon, 27 Jul 2026 19:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785181680; cv=fail; b=LbROtEsUPmk0QbxqiNe5fvNf+vDl7QvppAXecego39HtNWrSv/F8fytNfadOYD3+9UqG0Bvl/b+sYYsJ8kXfR69V9ys/2fY/yVKcMtEO+j+4H/d+ByrbXTxr83qdgR5QrPTiiZTZhIj+zTCzlaOy2AKdXQw3kiub3xYRFWw/LNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785181680; c=relaxed/simple;
	bh=9dlWiBfyzV5oAfm0VJ0sTx6gy/SpUYbr9ZKHdgMoR1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cFQ+4jdlhxTA3uJRNcUoeyj+ZgI6M8i9It0qzn9qU/P7v+PjMfNK95PxRG0SU8S2CbFmpwkMz1/YecnOcwiXsv8bxvnCladCgkDUvDWZnNsPW26R7JuuGj8QXe8tBUmVGvvnWjL3kitPVg2/gJ12TxzBZErGsfLXSfmP5dGLrFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bJkMUDS3; arc=fail smtp.client-ip=52.101.66.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bJkMUDS3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jNIvbTgxdvOtFklS0URpdSxTr/dsnZRv+1xN5e7HcORCZ/6Pb38+SwnTufTxly1lMLtW/Doobr8Aq4dsZnBmsbQGq450RNJy9iRsaqEin5/3oOC8nbqiFtj93QQ2NC0Kecf7MqzjE0drmKDMhcH8l0rPEibsjp7uBQrUPeC4tevahQIYigdksTjKuaf5IvjB7ShHsY0DCk/Q9lgX75GAsChVMUZfQhcxqwUczJBkUMRnzqxeOvaj5TreFt/jlP46yAoxpvtxTNzeQytTFV1P8f8q1/bDzqwqQNp+BUiTvtGmURjGC82qYSZ92qzl57QEKsfqN15MNSESUdIN9hKJZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXHHrrwSsETdI3hDX9yn3FpdxFgzhMCJTe7ubwAHamA=;
 b=Aeu4ZDxRH+5yDaCeEoHjKQaIyncd6/ita8f0lmXTkBDgOb1LsaZOMi8b4h3AyaJUi0BVsRKFU2RFaAk1CdtBW5x4mQecR47kV0JMBmrdZkXP6/rPwXDrqf0X7bpxmNFc6AH5kQCqG9EVH2o8A3mgBkvKjZ8OWNq9y3hid7QJfxlz5wUcajVg/sWL4MfKUYgfTeSzqmyIyjrslfySHKqJbo2SIfQCbsMVu+jCJSpnTDszmL3g/t5lfeMdgAy2J2/APP/Kj6O5yNEKdENa38k4mFe6Ev48XW8Ql63s5iyKuszkVwrcHf7ANvsXB3tfxnfODNI1xh2NvCK/PeREPPZUMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QXHHrrwSsETdI3hDX9yn3FpdxFgzhMCJTe7ubwAHamA=;
 b=bJkMUDS3HNuDv8epUDCCiGEMB32oSVc1kdbO7KOmla7Dfhv+XPrnXdFH7ekBYeiZdt76KX0z448k4U+9q4io9MzWQ+YuQ9ax3mTKxawqCrRXY5kBeN4qN/E9p5optEXINrQo81WfniIkDXiPG0lP+zuMfPUaX43l9wIdrCjfIcT5tgJIHpVHiWpjdI2rshdBhJkK1EejnEY1orJl5oGr2XXdFBUWk7JmQ+7imFautjxR8zGjPCte7Szgx/eFc1OzdlHRlniYEC2KiULTcDlM81HPRO+RWHmRit20kzt8/W87oAvSRHo2cXWBImcfpoHGbSeJaOvD5bRsBdC1GdaWkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10518.eurprd04.prod.outlook.com (2603:10a6:150:1eb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 19:47:53 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 19:47:53 +0000
Date: Mon, 27 Jul 2026 15:47:45 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
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
Subject: Re: [PATCH v3 08/24] dmaengine: dw-edma: Prepare LL progress event
 handling
Message-ID: <ame14bGTfZUSMYUx@lizhi-Precision-Tower-5810>
References: <20260727170323.2321369-1-den@valinux.co.jp>
 <20260727170323.2321369-9-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727170323.2321369-9-den@valinux.co.jp>
X-ClientProxiedBy: SA0PR11CA0004.namprd11.prod.outlook.com
 (2603:10b6:806:d3::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10518:EE_
X-MS-Office365-Filtering-Correlation-Id: 76af2182-2665-4aeb-cb6f-08deec17f269
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|23010399003|366016|22082099003|18002099003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	dqY110HCHSFrRZpe5PEFIsVjJXHUcbpBB7w8xlRb5OQ2rvVmaOItS9H4r6pFAeb61fuZOYa2CkLGYY+ABdeb3J7/8/dlrl14TQ7Ph69pUUksBm/GWTF+eCQXsh23sYbgvVx1P9pdrpqM4Yalz29Gsj1WODsn+5xu00Q1vHQRXUk9G8D9vrkEIZ/6EhbAO7P1iWm451EwZNRAdFbLOBournomx3+oL+iBQVbctIEcXC1nxmkXp7MWouugadRRNsBJ+t+sEFXlHFgL2vBK2StDryaGJE0gH+gyQJ6znJYlh60IRT+d4DXHrQJW2xX+Shlz7smOVSpuE62Ba9AJc9JmZSW8LHR+BWV14Z+hgMXJBJQYoOeJd/HlRxpMC5+bG6fdmy1lqa6h/6zYaRHKWdDAKc02630QgiJiAJ1BIsXbyU5T+qrzrrFsSm/8pulRBTqnyGfevuJyk9htW+od48bYRAw97HvZC8g/aSLJPhJ/9auSUocr9LbrPALQumq/yOzdmk29r6sPqYdPSgGoGM6QhbN69wnkgrazdQBc82F5B83KoQAaHrmNp9bQJ+ZM6mEAjmEenZvxYld776a4EcHOYb1hdQxsu3uSDgsd+QcfhdPVfryjsls9P8PFPyb99rZub4vvxcYU33H/xmBgMpH36QKmkQN1AnDJr8WhCqblZB0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(23010399003)(366016)(22082099003)(18002099003)(10067099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xmKZog5RKrX9VH3NgESHyKLUMcGtkYsNT5IV70uLiDriy4QeCO8D+YmtuwlL?=
 =?us-ascii?Q?D+Unasozcqv+qvZVP112co0qYigDF5rFGYLwQuBwQs8R2p29ZK+Zgf39GE5O?=
 =?us-ascii?Q?NROLHdvEMzhA4/uXjEby2wZ1XiSgAUjFKatSZOcNmclfOIXVBICUM+fEsUGZ?=
 =?us-ascii?Q?CC4uHkW8io5a/Py0mTDdrGaaxwxXuZllM0IOBLnCzElDKAIzz5iV5taFN1GX?=
 =?us-ascii?Q?E5H3jU5M8T2p07e45CWBnliRxzxXhrflaAvUlbHCWlcYtmujaGXIJIe3wwn5?=
 =?us-ascii?Q?zfXCA1WSGSb8hoRB3ZabzSUMorfowOMaq/ZxJxQAtNkQ07+zX6mUIrnlSHS9?=
 =?us-ascii?Q?yjO9DeCa1Db6fR9TSsju8Wd+KhS0tDZbBmDDlvoRvS3JWHzTlGM011+T7Spm?=
 =?us-ascii?Q?6t4Gz1jvr9Vx59NQf/BLccjHv7+SspZlegvXQD+6m97ZS9jMpoTnrAo1wtup?=
 =?us-ascii?Q?NYXqLw2Hd4vscAmNpXKhCRiMZRb+n81JR7hINB3oc80BxwvxKgGSv5L6XU74?=
 =?us-ascii?Q?mLP0/jbGe7SJuYJl/Y3WN3L494Y81PoVkUZt8MLtOdUkRek7NMkpCPDwkxPh?=
 =?us-ascii?Q?hnuvBuLwwdkcyaI8JRYCxZwsHRWQcXtPIlYyz/QettrW6j782T+aUR91G7qi?=
 =?us-ascii?Q?7V24itIkpjo6ZWtCnDbgwSxrRHFYtwwOhUXRJ4d0pfnQK7hRoJX5ZVGfpfuW?=
 =?us-ascii?Q?55nitWrF4qhJQ9pvZwppPX0/tM75788utQ+K0Y8cl3pJv95s9LgS9X1yCaSD?=
 =?us-ascii?Q?okVL8fWWGfDe+ZjuQNF3IYAwNehb+CYm32/wfG8MSEkEpGmIHDHFi59bnpbG?=
 =?us-ascii?Q?a4n6/MURaD3mbp1Y9TmKKxGrV92Oyy8/dWk08f8vxVNt0fJESbbnc9oQptE3?=
 =?us-ascii?Q?RmN6naXWG2eGpLOO+7NFk5lpD8qVx8RHDTr81d31SnYr9YgLlGHV8fFu3eSr?=
 =?us-ascii?Q?43dXDapL9IgKmS/9NcPcM+Mf2Ykx2+pCKiw96Kl9w5eIx0uOVaBNYoww4rCn?=
 =?us-ascii?Q?OSroriLRBvOOZQvS+s8TByJIXzRjXHAf/gh9DiLInyKrXoWnlS1hFS/cYdJ9?=
 =?us-ascii?Q?bog7eY0zJTabq61OsVAoTUwRqLYNp9hR5kta6Fg+Dr+5vh3maufWGmZh2Wt+?=
 =?us-ascii?Q?dwGdOPeQup+SdofGvtYvneim66ZRGLjdalxGs0u1XlYlgQL/u3fryN32ZAjP?=
 =?us-ascii?Q?UHQiqeXw8Rzv/KUJ3gg7x151Re9ypSLrowLCMvXxMz8I7v5/hy2foCe9MQWb?=
 =?us-ascii?Q?nQo5mEaHR+5ixgeMRk+JK2/RLlGaYulc2ithLIyrfWXzTFuVXIusEObyIOhQ?=
 =?us-ascii?Q?tU6iqejBpD8JXnFIJatMyZwpIY3CGUgUCnPTg8joLiuMpxw2kCoivLnSTIwk?=
 =?us-ascii?Q?J/lgxq9drlOZHFiXDOs228rxKJt195FPn2A3WgYYhVvFokVPdVfea57s+oFe?=
 =?us-ascii?Q?bLuBOWCHcwaNlyMf0FbQ8WkQITztM2tKUz1gF1aPaP0nK5EY+1AzFF5Plmb5?=
 =?us-ascii?Q?Gvp3JhiU8NcXZuK6OXbkM6y0Ezxya7RUAv0Dxouh6wC9gdFpOjwrBFg7i4Te?=
 =?us-ascii?Q?8XxqWqIJ+EHipJB320rqTnCW3Oh/47zAxFjpb+0lzbBhTh4uBaMwHYrVyMi0?=
 =?us-ascii?Q?+URh6bTrli9IP8SO2kx4haiJnfnSc65CsUlEBhZ3qdnd0lZZOAxCv79OHhOo?=
 =?us-ascii?Q?RTXaD9xBREosHar1t5qN8nTKo2/tTpPvtIYqg7pSE05u623fNPVKUIoFwuVd?=
 =?us-ascii?Q?UwzkiJE/8BJq+StRPUn+ZKHHRcvZCf55BlTmdO6SCIqsRpqFFTaO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76af2182-2665-4aeb-cb6f-08deec17f269
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 19:47:52.9887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 615QFh7g1V6G5RKNB6C/TnO9cFVSggZclo40Bicjz77+GAAiBWYKmXylb5w8GsUhg3ys3A3fyDPSDen1OQ0G+6+qIVrugu7PKyO5MMgvMAkyeig8RvBhvJoiIPh+wUWG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10518

On Tue, Jul 28, 2026 at 02:03:07AM +0900, Koichiro Den wrote:
> LL event pairing needs to know whether event registers are shared per

what's means pairing here?

Frank

> channel or per direction. It also needs a provider operation to clear
> stale LL interrupt status before a channel restart. Add both.
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
> Changes in v3:
>   - New prep patch split from the event/restart serialization and
>     stopped-tail recheck changes. (Sashiko)
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
> index c31fff095b4f..d497d36f5b28 100644
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
> index b2d35f0b7b6d..b181603bf2c7 100644
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
