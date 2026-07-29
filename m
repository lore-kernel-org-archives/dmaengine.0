Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011030.outbound.protection.outlook.com [52.101.65.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0424445C714;
	Wed, 29 Jul 2026 16:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785341055; cv=fail; b=tcl+WQ/pfBV0lQ4Cimo+AWR1rR7orT02UqdawxVpJczHWW4zi06v5aqRGroPBLcabcqjs717WSPz5rCJlhDBk3IBnp1Wv3cZ/jeCBwkmFk8L36ownuJTAnyVMkHgYUtnBi2Up48P/5re6D9mWios0BiwGVKNc9HAYfiWGTzQ+PE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785341055; c=relaxed/simple;
	bh=jYZKe6nhEvSzueI0kLOkGgC3BsFzHzys/N+WxtkUbIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OpafEk6Q3/21TsqNBr6Feg5KM6w+Yv12smqLAh9bkzOVUaVlsSmirLih118xjgmh4PzfJ8lLAo5nAK0WezDH404agkQfdmvMy5jXRT5mOJBXNF8nOKqZosUz7IPbH3XDqMXXIpZ6ON+uzMNYIkvsCsOoswTWyVNG97y7N/zWkDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZvVS5mDI; arc=fail smtp.client-ip=52.101.65.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZvVS5mDI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwT0emwQows8OCFkwuzE0/bQjg4/ldqGEZehJFm9OEiR9v7Hg+Q22UH42Y7wIbkTScO82yb3O9m0j/K7ugeY3AJD18lbE8ncSLvvOxNYwiRuvoTF6Ps6DG9lGwbOomxhlLjYHSRb1WY1BqUOZ7NnxzxGTYlKQGZEs5kA2isgTFkYZWmOW0M8xWHMcRPVQSADTIoKjvTLSeTOhqexK/vJwxGkNisFow9ozfB1MBai10yAj8zfYT1A0MPK2hvjLxSU4kPE6tn8G+9OJgWd0CyosDbtlah1tHnX8rYOUwSZbOLlt9xXnz7MacyKVGPb0ruGS04rYLS6mfNwGPDx9uOb/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHVZao/zDUuFay+v0h3uOEHQJ5qLsTuoKdIi06Lf6P4=;
 b=p0z4pTqVJIsYoe8UTPfaqEj2LK/Sx7Naz1zrScwPSMYkfEEESB7rYs8HD5B+LAC1X1rK0FTyRtJyt1X56E1q2GNlqYANuLEWRynppe8//0T3qsntWQM8DWGoZU5JoWerNF2FEmRbLwvc+Tkg2vxf52l/YJgn6R0amc93RvH6fq49Hw+VNOxUMolyxcTSeFwGD0yvJXa9TnsJ/TB0Xz43N3ow/yK+3+/YlfYxsweLek2F4G1chtGpThDFPWpUp9gEnYvXYD3s/hw/B6YmKlIE6uhQaSc5gJoqe2B5xRlmS7+43SuGMPfNSBORdu9/Z5pKdxphYHoAHJvcC9BRpsbXTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHVZao/zDUuFay+v0h3uOEHQJ5qLsTuoKdIi06Lf6P4=;
 b=ZvVS5mDIgPgu9jDeg+Cv7MCMktIbOubuEx6+PHsWJ7HmBmWDEg3LQ5TvcaL5h6oQ2Bf8YYDZDC5pikNwAic/Kl5Qz2vy9wLiCM0uxaR1AgB5sCfzfJIuOWylRPg+KvQSAn+zK3CgsznghnsLjN+uY0UyldZu4DseOBrp4iwpzwhws3sBBsN6/NKg5+nGzvrq9aznTBqbmjMwR39vgfLjaq4AQlLBpVtT6t9RHT9J3zIaRfiwVbUA1rDrgQ71Zn4jAC8/gt8QM3Vww3bdYJCRJu7MfmYmrngAVogoMy3rIZC5Fk5a8/+CTUDdLl3p3gUi4t0KKm6+4gwtecOrX/hRuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA3PR04MB11106.eurprd04.prod.outlook.com (2603:10a6:102:4b1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 16:04:10 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 16:04:10 +0000
Date: Wed, 29 Jul 2026 11:04:00 -0500
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
Message-ID: <amokcCsQpiHQdOR9@SMW015318>
References: <20260729143036.3087722-1-den@valinux.co.jp>
 <20260729143036.3087722-9-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729143036.3087722-9-den@valinux.co.jp>
X-ClientProxiedBy: PH3PEPF000040A5.namprd05.prod.outlook.com
 (2603:10b6:518:1::54) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA3PR04MB11106:EE_
X-MS-Office365-Filtering-Correlation-Id: 888f5651-0bbd-4472-e2d8-08deed8b068d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|366016|23010399003|11063799006|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7Hv2aEiRm2KHZIMcSyKUjj9VAhZt5IzcyQ4/MIE3p7le9gBIhxgqg5dv1MeuWLg4Y/Fca4czy5mnByD8Z/PMTFJiABfFEoK1jZKqSynE6Vbkb/4Lf8nm2uinKL9Pfr9dyQyauUaltGyymq3z7W5XlnRXDAePqDFQUBRJPWvfPisAO5L7ui+s1Xwp9c4bKCv8kwJOsvawrR6kRcFmLjkeVfgGbzmZ7Vc22SpZW9Ot8+iHSBITtqe6+4TOIwtbOplaHNhDnBZk0Sr/aOwYSFjs8Yi+d6fZcYf/lmcU44mCUKQTtUFjp+ew790+hOCTmVHmD2GvE/wjEIxcS8ZAxc1LnhidqrZk6Y+uUWz2HDjgfe/p96ZXDoGOnPJyBuKOz1yzuPjS+v3l2RUMkUwuPW/LsmClfynSdtK/l2E3syEOLfi1iWKiidW2krcDNJE2PFxYHZEGXjiOa+G1VaEFUKgDXk2D7zBF60Yck1+GcMfpRoS2vWO/Zngq6Spjh4q9J/uYyLzD9ivoWqromWeuQgyaLBhmEuQLNEEAWBmKTGkNn5eIt6WN2/JqXjh3G5F47QbqaqzJDIFLkFJ2O2p2yxHfF1jResFbUWDBTkScZEphBNiLBEdwBO9HrT9UKQ2Nzw1nuWgcTgPzm+mSbY73Aud3xlfSvyXLi6EEtr3rt5a0e6A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(366016)(23010399003)(11063799006)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hKrCnVpJYd7gmAiZbYYxY9fP7RA8SBvpW+bMKEyp6I4X3vfxrRlwmaqFleQ7?=
 =?us-ascii?Q?syM37KQR5YNL8X5iCDePbvwv/hy0VjB3KLhdNIRwZ69uOyTyfdsSEq9cWdmf?=
 =?us-ascii?Q?fOn/02U3nXfZ86bi4+IH0Ib19VBvp5WtckRA7IhDVd4vrm5CJ/L1kpKzzOvW?=
 =?us-ascii?Q?AMhEFurOlzZEBu6fT4kdWJDiY1bFSIq+9cPkCrviVsSCDJocKWBlGYJj+vuF?=
 =?us-ascii?Q?OGHYcC3RzEiD5AcV54FfyAEd1rf2p8N3zfNzvGgT/I/zp0lJZhXFdXk7fX8o?=
 =?us-ascii?Q?6bBuhno0jYKYo0KhbmGeY4JSpPiVZcXIM0YcRXcPIfmwzLk5u53xvIafBbmC?=
 =?us-ascii?Q?Do1bLmLIXWdSudtjiWueNCe/J95VSMPgQJCrv1t+v7mnjOGBI6dYQeGDr9VG?=
 =?us-ascii?Q?UdzExp5pfbsrK7zWjf785PQMiqtno1f9DQBTF78EMEQbWqRc+d2Y4TBeI6s8?=
 =?us-ascii?Q?2u6WWoLCsvRl5SlmAcEW1NvVWhwv3ZLvzL97kwRtvfut7SReQuNAwMq/gK05?=
 =?us-ascii?Q?0eWLXqwk2VVbzXWlc4xVuzCpKp9NjUuSTn/j2/HzGRKhf02HJPuUAzyuVMii?=
 =?us-ascii?Q?hEYL/RFnhK90vup9+uPcBeXbEASvfLacrugH5qtbqHwK7WShPZlUFjtaXPKf?=
 =?us-ascii?Q?Y6U1X9NIH1qcRhv+xYhSxLQPr7GSuPy7Y+yYkk0vH2TzSLr9YY9X3aDrLXBx?=
 =?us-ascii?Q?KxPuNjwRa5tKSEah6wRlcUdQ0m0eL+Tz94HmEQbXbBCrvkUGIBjmeK4u6H/A?=
 =?us-ascii?Q?US2hsDpfS/a9ZDciBvRSbldi0pCcbdoF7xhlCMvSVYiMHeBe33STu76dG3OD?=
 =?us-ascii?Q?dUgzDK+IXCte00al/sbfiETL+r/vgmO0UPtNDoQ4smB/s/xeWCFX8yaXj+yX?=
 =?us-ascii?Q?HuJfKTeuoVPDgHJNGWN59zbp4/uFP0BKIUeuCBuS7S9ezUzAleyu481IBe0H?=
 =?us-ascii?Q?LVTqAb3BlfyoHEuFGFlkIdaWgHpn+fgDDa0WUy5Dqd5n829kFM1zjTtCEfFm?=
 =?us-ascii?Q?Ji3B9kmWWP2KEaN0DVe2Bi35ADetW5Bfaf6WyjCo2U0MSmVjo1+qII6N3LV2?=
 =?us-ascii?Q?rmBGXakRxNTXsUlHrY1MmRmckzfTlfFmRcxFJ3F+Tm6EF2Y8yEDjRgbrOUNO?=
 =?us-ascii?Q?pYNn65YPGmAuTX2FvzKXUSoLwRlgLIAvwppoodUKFvD3cPpIlNg1EI9uOjk5?=
 =?us-ascii?Q?MS1wMSoZB71PEY6hVKtHY//o0GWCB8d0wMmF40UmQ+5tn37qTFo/yUfRE2NI?=
 =?us-ascii?Q?iaCoyH8jIY+b9FNo94aniUcQiRazHYr0oOKM9GvVjThsvb412YelIdxM/VfK?=
 =?us-ascii?Q?TqhkZUGA8jBCeomG8JlFiUlJ+wKDIdarorkBUca2GvLnKuw44sqh23fU9jB+?=
 =?us-ascii?Q?58a/E/Y8ShQxgxPV8Lr95ZrvUgfL4/U5O5alQhKKMx/uTDk/bt2jAq63vMPI?=
 =?us-ascii?Q?O3Sth7vK1BT0vvUttI0DuLdotmEfx6+cOGBE/nMmXquuLCR4mj5ZoGX9FZUT?=
 =?us-ascii?Q?zdE89ZPTv+3/5B9sLPGkaSZamZ7D/fLIt8IvPDUg6jbLWYCN7mFDL3kc+Uob?=
 =?us-ascii?Q?5KCQKim9G1y8x6GswEoOZrHxC9E7xm0MQoN4+FppikeeXPiipwPc+jigslBz?=
 =?us-ascii?Q?R52Wph9Y9mjbb0+8zMnur4WayLmrUQZYhNg4ZMrnrcN16aG4rtKrH6vl+Pm5?=
 =?us-ascii?Q?1Dz9waKHlDacXIpl8/RAocFveHL2WtR7FP3mZu1EVxpdWWkwpGy2g19w2hLc?=
 =?us-ascii?Q?fa3yiM5Os588Jr/DsGFyuIZapszJZ0TWxFV8fiiqEauHJVb7ttN1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 888f5651-0bbd-4472-e2d8-08deed8b068d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 16:04:10.2443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: deKcmvyjGke8rpe2kIhUj6yant+ryRLE2IocG0vw+u+dOh8EngP7ZIeB0rPcvoH/MHuxE7aDDQFLBjytvxbd2Qq7vcZHm7rjOkYrcbgk/LsdDnP+GGyCCrq9uGia900v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR04MB11106

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

Reviewed-by: Frank Li <Frank.Li@nxp.com>

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
