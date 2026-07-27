Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013028.outbound.protection.outlook.com [52.101.72.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81762D0C62;
	Mon, 27 Jul 2026 20:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785182960; cv=fail; b=WXngt/FOhdRiEpPvIR9U5qfUlkKjNaqOCYjR9wqGpTyQdH5Ivjzk8ivWUMGoNgp0oKInYRtr+3+I8upeqe7+6E1xNGf5I7ezbNY5ubnE42vy5Z90bMWTKcL0kmlA+oAhx4nqjvF+qgQ7HJ48AIEVBV8dxk2gf1zqlKXElzk/Kcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785182960; c=relaxed/simple;
	bh=eln//rW5Gy0shFrTClrjSfekVotDHiDsUaZT/9sYH/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X8ckQrk6VUCxLEpKXQl8CAaHxiGeiJKXnnfJozlRlugy5sJbx6HZHQd6Uhkkq6KezAavTLEz2SHwLvqZsyR67JKZ1vqQs+S5ZM5VD5B09V78HwBrfvbmmANeveD9zDqzoLvloubDGPeHJUFh2pxZ41MvQqr/WCKa7weLXTf9bNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vVAPKzXZ; arc=fail smtp.client-ip=52.101.72.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vVAPKzXZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chrYcw6s3HECtlQ1yQdOwcAX3lIjvyb3Mhv9fAir63S0JYeg6MQwqfXGKFYTyEwNIPL7iI3zN+bz04aQjHwbiBACMQ5Rby1Iw07kNCs0WfIH9lk6N1XcOG9MB7M95HOrkoeRNK7ACygcEihw5Le9s6hjqwM2zdbeWMwXIpahqVYwpRb6elDEmXUnnqEK488T9S/a95y3pld/BQWimPrd+pEIKdFGkjUTfTzyYYGJ7cwhgCzgC3uvRyXA2mhC/qNE5h4IYJsxBBx78btqPOE7AR132moO0oodz7TORYYlxPMBNr9TcJlr+LLhMYDHS0+O6IS2bYMhwSUWZQ+fGZXLJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lu66AGAOZKp8NHPWANk6ttl/f7rw9dmueqjvMjz26I=;
 b=XSKjpcrF0Pq/JzrKkvhp7GTtTkm7/rzMX67M4u1kmgchF4dQLj/EVnNi/8q7pfWHVqeUi7GwVxTTBJuPVSQn1cvsNc0+5TqvmzT7onS9LrCMzas7qJlQTSQfXRRCrip4H+gOsOwk9F9KtIojih4gL8P/mMVtpGhIx/S2JBS7vA8wnlydfxsO9EMtj62xe/zisKFsCD4FBsLMb8cNOyeSasJNarxqLige1ySDnKrdoei6Svztfl+JXLPvP49NxJxnRHyWaBC6gJBTXQOSIvQJvYv4l6ZfogN6tlGX06/YmMmxRKKbjQ+9wbWAHLaEQXDRXC3zR3ATRsj+YV5ZbtD2SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lu66AGAOZKp8NHPWANk6ttl/f7rw9dmueqjvMjz26I=;
 b=vVAPKzXZusiBMTdkLF5O74D/YjjdGlCAkqZnRqFtyDyVBYyhz827pg2rFR+IMhDOGNtdlfy2kozswNSB/sx1i9NPhLhIpcqA/X29tPm2coJMUmsTi7gZmkDEI9JgxX5xqKM6NSxqTVCAce1dJT1tbityGMuU8h+1rwYcEZkq8rJC6SCBfQUhAyKVudfN2X0nmMpPxkN8LJh+4BKxYsXdKr2d0c66WV/1NbVc2WnAPMqXNkC3Laj+RoGFdc3gDVPwkHcyIlhacipn2LGe2vGjHf8+ILLp/lH6HHV9qCN2W9gsssMZdq7b5pl5FUJZzKAdhqHXTPjbAO5qrsMJfuB02A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB7005.eurprd04.prod.outlook.com (2603:10a6:803:136::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 20:09:11 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 20:09:10 +0000
Date: Mon, 27 Jul 2026 16:09:01 -0400
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
Message-ID: <ame63c8jsjRFJoxQ@lizhi-Precision-Tower-5810>
References: <20260727170323.2321369-1-den@valinux.co.jp>
 <20260727170323.2321369-9-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727170323.2321369-9-den@valinux.co.jp>
X-ClientProxiedBy: PH7PR10CA0017.namprd10.prod.outlook.com
 (2603:10b6:510:23d::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB7005:EE_
X-MS-Office365-Filtering-Correlation-Id: 39df6f3d-45b1-4579-1deb-08deec1aebff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|23010399003|7416014|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cAIenlv+eg/23vuRYaO4MZZSQfSiJ5V4IKg7QlNmU+p/MiryGF3IVXuNDGsncmd0wmJlfAOxX6fAhc1ESSzPOzgsDvn43EdO8om7JYeT4FVqrOVgR8fS9OXxZgnVbIWRbekzTWZvuYNypE8reCPH8+QcihNJN6OKLhV6amYpAr6JyugB7LaG5WfRbZ6q11iKDwtSHI7jjBek/e+LzbowgeBES8aLp9FmhJQYDR/S02Pf/1gEnNqx3Eo41JpIVTZ2Ogtn7JDM7BQwN7XGY/pTcvcAb9xHLCP1DtO/B5HDR6vEMLKgffNf3h+vvPiywqyRdgpnSmvcLhqAwJU2w0YCB33OMpJograpI2G6MLx0kQbVA7QFzIEoO30D9a2O92EBVLOZumVTt22BDZ12tBnSJoVNVAw8dXppFmzjA4ad2moEm6Z+I2aBx6M2HwCI5tJ3HUUoUNSlPP40m6TYxHvCpmFb++77QQufhY8UbSGutzXNnItd2Ax7EZXUWDRlM6EnXbU9WVoBDtyuFGW0K6S0BkHIOXlemANC5M/dsEXQL8gSv1Z21H5lXJhKNrOfcGJdDwn0hvX0hUGBSzVjxFuwK+gPN34R7Mg3jwLGJFz7vde8iaZbK9AWzc0uAkmBT7+YXm8j/G9DYxC/POqOrOK5lru5vuCkGnP43v64se24Mjw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(23010399003)(7416014)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ii0a4Z3EUrHfKG6gnc88l6xf2mOp4Hyofu+p359PTQ96x8fe4ggk5sDWXJ/m?=
 =?us-ascii?Q?PwfzklBUU59qvv6YrNwx/uRsNj0mB0IL9OIbyQuBBCLdNOMt0y/Ay0lE+rcV?=
 =?us-ascii?Q?EdeTJQzbr0dMSQnVGGXEyrxYFIV+A4BTz8Qig6BWAY+SQ1tF+hOKCurcGRuE?=
 =?us-ascii?Q?NNN+Ft4923s7iS/tVEyu9+DZF72D3h57Te5Xt4EmjuoeNk5VemD84fNCrh/j?=
 =?us-ascii?Q?UrlrqmpuCQ60uQ/qYVpLUWGGDE/st7+yRPuU3dOVarUwbVg28+6DgmIpQfwT?=
 =?us-ascii?Q?TdsKi7vUaZ7JkMK+xNbsIW+nUtpABQXusIdRhjsGgxXJJmUeqqFo3cvqtgID?=
 =?us-ascii?Q?32izXV7i0uSytEOREtlutiF++F3E6qhgyeiRQ4Y1N0wNqa1Gg/KyhZPROuOJ?=
 =?us-ascii?Q?RFfk6+QSAB4V7EbaWZxi/XScgkCLeAJzvcMRPcPUeN0HkZW4Bf1EULdxXlg+?=
 =?us-ascii?Q?fgLXHoYA+v1nGjsN3yK86sSDkdGqHVfmd1sVh02I4nEi9o0NL5iRUy5P92d/?=
 =?us-ascii?Q?WYRH09VNQAI651uoKi4Yqhph7PPTgt1kti/EuT+lhVQMas3f+kNlAI4k6PLQ?=
 =?us-ascii?Q?akPesUcqizwZxkIk7d8VAuzSGLVNMRxCA9Uj9W3yw8DywK5k998RuMjOZfBK?=
 =?us-ascii?Q?RkZEwLPwgd2ZY8+LPLzO+znkEqUpndJPGiSO6tH/ZdNPbVgx5ilHmXFVV5TG?=
 =?us-ascii?Q?WM7LZIAF0oM+uCN3dBPqFMCUvmMpo/i72ntT1KmKl8eLiZYlAWFwYKw+VqFz?=
 =?us-ascii?Q?DxiF+VuWZ0V2XihvfRNWKszOi6cj7Oe1txx6cuHcqLT9QCxEnTf+ucEsO6b1?=
 =?us-ascii?Q?eLAz6tvSS11wb1S1djjOXyx49rz6rQogkc08rqcRluAfpLPIhDTqv6nGsFtP?=
 =?us-ascii?Q?NMISGNtcH2QV2UU84Y3GEGGukhEFn4ipEONLBm2Q/tJI6zRz7u14Rq8E1aOv?=
 =?us-ascii?Q?X6O9+0MDIcEqrTh/UZ7NOuwyU1qBaBNFpUZLhjbHhn1+28bYUgaVXUG/Fzv8?=
 =?us-ascii?Q?hE3wumnFUR6gwTbculQDJGpQjE/rj7zci6HdiQwCzT/xWrYnTG19SlkDLGli?=
 =?us-ascii?Q?osx6nwImgfqsQryOtYMPo0/H6hBAu3YoXQ1Vzm2CXqH1I3DiUBnqzWQf1uqo?=
 =?us-ascii?Q?UhyU9YeDUZiiv976dTiiIg1v0axBFU2k4233Gl/RLVV5EeiPTx3RKrN0WmQ5?=
 =?us-ascii?Q?WMfL/fa/sZiet8/Wcm8u0iDW5AWpFKVcBMFmGB4BgWRKSHQIgChnkDUHEv2u?=
 =?us-ascii?Q?WJwmn1AXbpRw+uN25fY7zw4xl3gUyVJoqCUbJLs0467ZziuJjHQ1iA/whvHj?=
 =?us-ascii?Q?rqkRP+44BGAiUQ+DtT0sg5XcU9djpSIawPy+eA3UxCu0f2bc6cko5ZvUtZZq?=
 =?us-ascii?Q?9t0WJgBbJER/kgF+OfiPVMvir+fZCT+7EcfpKPxw2g/1/wj0gPk0cKBgAZQh?=
 =?us-ascii?Q?N4bSXrYEu6NiRnd5/Vpiyke9uxYKx7ObfumRGlMH58DKjhdg8K/vpY8Zko9B?=
 =?us-ascii?Q?vVuEyCPF1N21Mi5sTBJa/tcjetyFJWXRI9rzwZPLYd/fMiBhGjmnricgbclp?=
 =?us-ascii?Q?I/mvD9RCFoaRP8zA/MqcKvHmm3diLwV0DiQ4s/5iklMbkDgK/i+5L2B6bEf/?=
 =?us-ascii?Q?y6omwRAUf/sJBBM7Tvasy9AScRgVAhVvQaQScJT0YyErnyHpH9B3KykW+N8c?=
 =?us-ascii?Q?mQ4kXGg9/IgWRd0VGkLfWk7lFQmd7KSaPdspFqrXXAFeIB6epjLorkYeuGSL?=
 =?us-ascii?Q?9B970oAPwrPyEX1fuUPeUnQ8wvQLkLh2mSliKrEDaAFiu1A7SuHQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39df6f3d-45b1-4579-1deb-08deec1aebff
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 20:09:10.7616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dLdnW1eyUWHFuPnRbWdkNdxkXCILq6odDCq8FbHG35i8UMeN/45RO6+4t3WrIxbYV/vYMvzCy8nOGdJpfWvmbz4RD00E5Y0LAMllQFLoDuBStO1iE62FDPiMUNRP1SGa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7005

On Tue, Jul 28, 2026 at 02:03:07AM +0900, Koichiro Den wrote:
> LL event pairing needs to know whether event registers are shared per
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
...
>
> +enum dw_edma_event_scope {
> +	DW_EDMA_EVENT_PER_CHAN,
> +	DW_EDMA_EVENT_PER_DIR,
> +};
> +

not why core need know this information?

Frank
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
