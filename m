Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011049.outbound.protection.outlook.com [52.101.70.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF9937F338;
	Thu, 23 Jul 2026 16:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784823930; cv=fail; b=OTmiIVTjKGAT2ljEIQuAFykHq9n97UGNlo7rZQn7xUmHASYbHAgK0GxnvlddDdIG51rMWaDAVYtZ407ZAWhnwD1GANjzOJFt/lShao9P3Tzb2gX0paBPegfF/1nACrzz0UkT+WDAzFHbz1dIww/wnAaPeEL3dyx01P3/I5W+fHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784823930; c=relaxed/simple;
	bh=e/WJ/YSW1oW2WI1ZlDzvD0lpmAgdNmF4my7HHRlgGAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WBqcdpawHDKgR+vQ+wKmWaL+G2A3ws8FesP9cigScTQ/M1byn4GDYIFA0ms7dtci1z3pfOd02ZlP8UcAhFlLRFkqKxy6BFOhpHRgQXMH/ZRRgTELfmQw8fn2YWoIPiy8NzwBcEd4OBvVoJo3SOmcRvVOldOyhEVLH9OscwxSjZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pMAq3e6D; arc=fail smtp.client-ip=52.101.70.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pMAq3e6D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PBm1glcbDXb4z0ahs1wADNV/Pkf0tqIagp8WHX5nEPtFVsm5nZOH9YGtpOKF3W6U5I7iZgRF1us0Q6OOHvGW7v1bxt34Z8he/hghhbWnphpNK1Vx1tiuH+jn1DqYLAM1d3JQpakCstL6+Reilz5ULY1nb1hQs8MAmUmpQYkKRdQaT6pQp32bfv0t2G8XvIHtYqebjU3hNizUu037oXBRF8dw768/kiRSHZg6wmIpqrK5yqmP9qAtNEBWj/7H8/2BWFtDR1qsvy+aKEuA+jk6ECeVPr8f65q7LIiSyarRhveGYbBKLvdQHuFOw4B5ZiAlXEMoz3YQbtvcSGfVQelGsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kY3EfVDOI/npqoW9G7e0WZOsDCmIyTUsvlARKX4MsBk=;
 b=KsrWDJXj1x2kAooe3N7TKmt8DzxXYhlYWvDeFWIQoYAgT1dkEzhZvKpRphuTXjxW8r14RqB28i+VVXriIGbXirQ68M9dNkgadcotP7C5ZaJEhnXDaaVMa67cY63iu+vSYTo3MzmbIseq+S+/LtohBblsl/2VMam3DDDmUh9drPynCvUmfXNaeKLU5C0goERjHuBaz3rmERhEthlSvglWh+QEIx5L8GhJjjgSMMdphPSEUgGAbHWf6huzH2OJDRq0t76PX42KdlOGBEjuPdpm4kkCMNqNUsizrefb2jHVKiTxmBvUCsITiLjgYxlbHzr+JLCmhryegdOfc2qHNjSjjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kY3EfVDOI/npqoW9G7e0WZOsDCmIyTUsvlARKX4MsBk=;
 b=pMAq3e6DcyKcnRgq8f3JeLLKVWCTcdJM3ieXrdebewJONDbHrkkLqMJ6phG299JcQL5MBBc9AEGdFVbi5xwAoR4+c8T4txvLBU/62nfWIM1yJgyH3SP6NZ7TWpar4EEYwEt6ZvNlQOWbch9Et1ZNzF6B0uPp9lJbSTkVJLizlxmR75iKYHoq6CAE7TRQYviSDwkcL6EkVkvWMGQ53/pnlLuqCUslhl2J5KJNQJc8U8E1KavIGLjXp4UqSA1NmHmGGLoo+FmHcZmW6YWGheDlKZ1GqOC1tRxjslMag325PoYXQwPKf2VXqEKqu/6QIKAC0TSD+Prx99JeP+Y2znzgOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB8496.eurprd04.prod.outlook.com (2603:10a6:10:2c8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 16:25:18 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 16:25:18 +0000
Date: Thu, 23 Jul 2026 11:25:07 -0500
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
Subject: Re: [PATCH v2 01/19] dmaengine: dw-edma: Add
 dw_edma_core_ll_cur_idx() to get current LL entry index
Message-ID: <amJAY8lV6WbigHOj@SMW015318>
References: <20260723084150.521366-1-den@valinux.co.jp>
 <20260723084150.521366-2-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723084150.521366-2-den@valinux.co.jp>
X-ClientProxiedBy: SA0PR11CA0045.namprd11.prod.outlook.com
 (2603:10b6:806:d0::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB8496:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aef98d8-a377-4e5d-aeab-08dee8d6fc0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|19092799006|376014|7416014|366016|56012099006|10067099003|22082099003|18002099003|6133799003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	PPEd4QvKEs2LwPpXMXrLitKm//u3AapbnO7eGlQbl8vCh/FF4RKSeHv0OD9ZQ+5j+n+aYWn7E5Ot3dN0wDuea/9p46F5ZyfIbcMvQNobmvJAXbxw7ybVmIG1j7ooJj0RCiq0eiVHgIYkbcCzyUlCIvmD67MHXHKj9mPMq+bTrsjfK87qNsu8Dn0StM+en2Bgxr26j5Dt1OwmciCWhxllZKUl6j3ahqbmkPRuGFLXIoVkRAz4OU+4aFnuCKTwrAcSuBYTV1hLD5Tgrreb9cYFFzVhOE/hiVov6Cv/bue3XZy3ds3XBfivOLXBKpfIFS6osaF/deFA7D5cP5giuWkCQzn0vixDhFeDMN16toF+4qjwjdi1AA/lMQfKJoQgqKlmRuyhkHDCS0FNUrHY7yxGqPfabSM/DGCnRZyvchyKIQXhucurxgFo7AeCvUeoxzrxkX/3Er51rz2Xpc5xopvqwrdWbaF4VtXB8QJZXbzrSqtFMf9e4l2ts94xGGb8LdeyH9Ws/IPtYk5C4kESMePg0zJ+Q7Sf84G91FIzRGqJ7oqZ64qZ3KXiOksYvNlxdUBgFxFA5sA8jov9VJG4d1cvIGQ95cS8TDbQhOOsAc5q7mUZoOfWXGarWlps8QtkFA+F5A03MMZpZ+L7hwZSP8oI5S/pZZI/Hg52UA9BvJdigQM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(376014)(7416014)(366016)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B39QbMJg2imyBUW+Niwub0ww+J1aGB30BXXkcNm0d3y8vwt1kMjJ0FURQ6d5?=
 =?us-ascii?Q?m3qRCpd/hBOiU8NhJcmweoxDuqF8VF6y9FQsYj2Pa50MPwLni2STfdiymOGS?=
 =?us-ascii?Q?MrrruD4axiLeg8crEi75SZfPIoqsNhTOsaU0MimA7y6Lh6Misi8xzMMcjrXJ?=
 =?us-ascii?Q?3NKvUTrABQHDiKmmDz5wu4QfS4DpuxZgplinoEMuj0YU7pzNxNn3J8BfYKD1?=
 =?us-ascii?Q?1kp5TKijTFXpQGX3nmCEmdfh2NLF3Hk2Mms25veXiw2URH/gqyfk9Vo2LzAX?=
 =?us-ascii?Q?wun3aOXxj33uKUov/N2CZfsgb9HGWmapwWoSjxJAwpBK3EOghGXaqygXM1z8?=
 =?us-ascii?Q?YBGsahbAAgZjKb7Ok8lpDW9lDdzP5miftYry3mxujZDZ0hVRZ40W3XklOlOS?=
 =?us-ascii?Q?lpulTsMY2Jo4m/1usVSmgQbF2AU0NKEtwm2fOCHnGBJeqpL30ETvC3RKlO3B?=
 =?us-ascii?Q?gi0GpCM04ZEJW8pY74LE/EP2VgumRmD/29pIF03dPtG+2OVGxVpZE77vDW6V?=
 =?us-ascii?Q?VwanCe/QwpNR5oULaUmvrDLbXD8iXPqQ/3xJQ5PQWuBiAWxRKpYq9/OFXvEg?=
 =?us-ascii?Q?MIHASyT3VuD/H8JPUr6T5bTAwZNHdfiab1Q5gp3xgp1MWQPGKFIqqDbyi2vT?=
 =?us-ascii?Q?q4zrK937HgawJI+yJRI0xm2haGS0YgpKfI3rEQ+rztN00cEDIggSinNxxucL?=
 =?us-ascii?Q?7z5tXoUJzUekpmTs8vie/d5hD/xYoIH0yp/Ns7emeW6wxptyj1T3Q85Ay1Uz?=
 =?us-ascii?Q?mL7gAAPLp7Ox20EnEk2VR13tlcHDSuy9vkQGWsASeTEJvNA3njjs8h66UlHl?=
 =?us-ascii?Q?uA5788LnsbcxdaAP+JpshT0usve4Z4uhBfu2T72MupH1hMMIar49fzR0JqwX?=
 =?us-ascii?Q?pkxuXYuE1d7e7sGciGmLFr565IUmHsUVUuMH/6/pczK5tn4/I2YoSHsS1+kv?=
 =?us-ascii?Q?qWsLOLwz4ym4cHWsx/RfL+itlbXhcxMGD2VXwVu2cbd5ft6K2w59z5SeNK9u?=
 =?us-ascii?Q?+SinoBb0sj+QbvvKPUhziQGScS9mmTuBeBXF92CcOvn6XnuXe9K4neS5N0Tw?=
 =?us-ascii?Q?eGpNTjk3cCDI9gDdK8kba3s+KJfWDAnjfDeasT0cocNwRGhGurUSwyRE4Lyc?=
 =?us-ascii?Q?kjcgiGL6jStxYKC9MLopEKyII/skTRGe+U9984Sg7dU39cVnf9Wbt0LbWda1?=
 =?us-ascii?Q?TbJuFWClkazwPXb/78I4Kr+1Mqo8u/zTfhnvMNbMfPKD4ZuUIHOUkZripCNF?=
 =?us-ascii?Q?TthdFRuS6+lPwZrNEHfcsbqa7fJEfG6aw+fluc80tNjAhI41EHEWj+u3NqCB?=
 =?us-ascii?Q?+JQXBIAUgW9JQPGJ3nPRezlqPzbiF1aYOMA6EC5Nb5J+/hYxyvcPUQKjTFhc?=
 =?us-ascii?Q?qq7auYpxjX4DdsnmEfwUc5iqlFHuOwT9JW+Ft9lbAsTVvy4oQSC6aicc7Y+C?=
 =?us-ascii?Q?P6ZBeKvlWX0Ll/7fSi71seNPNT9d1E9vaXKIvcDxE+Up0vPnorkfVIwxTp30?=
 =?us-ascii?Q?u/6UlYkSzf0kweA/XIqKxvmabhI7M9IHlzD4YeFAx12ylbkLoQcxn/I+NUvP?=
 =?us-ascii?Q?6nie/seqFFkGVhWa9aLte4gXWQ8FWXWwVf0iZMTRc5/9xQgSH2NXa17CZ0j5?=
 =?us-ascii?Q?tt5Lbh4l2zRo0LBvsXCwCZjJJrsepl0cNYjeYk+/Iqvn0VJlUbuKac/OIrhW?=
 =?us-ascii?Q?lYX4Hfc2+jd6wFQ6Jc2UUTvt0UB/L4rW3MWOx4ZllMui7giM/WIn6LoqEaf1?=
 =?us-ascii?Q?fN3GjPrEcchVUQkUCnZSe5AadxknOPOMJrRPWG3w+dH/jBMPRGWY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aef98d8-a377-4e5d-aeab-08dee8d6fc0c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 16:25:18.5402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NVw5cPGXYp4gpfWNPElzh4oNIzOqoOA2q/D17NxR2Za6vhOc+fIQwHd4/HMGnzH3uNEr8Gh6xvtu7ApH2hJzcfM7XyKnTPKGhhBf4nEUsm7pyyqt/7ZK+yOEvznNUvDx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8496

On Thu, Jul 23, 2026 at 05:41:32PM +0900, Koichiro Den wrote:
> From: Frank Li <Frank.Li@nxp.com>
>
> Add dw_edma_core_ll_cur_idx() to get the current LL entry index and
> prepare for dynamic addition of DMA requests while the DMA engine is
> running.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> Co-developed-by: Koichiro Den <den@valinux.co.jp>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Based on Frank's original submission:
> https://lore.kernel.org/dmaengine/20260109-edma_dymatic-v1-1-9a98c9c98536@nxp.com/
>
> Changes in v2:
>   - Handle zero low words and low-word wrap without reading DMA_LLP.MSB
>     on the normal path, and clarify the lost-context comments.
>
>  drivers/dma/dw-edma/dw-edma-core.h    | 10 ++++++++++
>  drivers/dma/dw-edma/dw-edma-v0-core.c | 19 +++++++++++++++++++
>  drivers/dma/dw-edma/dw-hdma-v0-core.c | 19 +++++++++++++++++++
>  3 files changed, 48 insertions(+)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
> index f6a5ad317567..e50fa7965778 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.h
> +++ b/drivers/dma/dw-edma/dw-edma-core.h
> @@ -138,6 +138,7 @@ struct dw_edma_core_ops {
>  	void (*ll_data)(struct dw_edma_chan *chan, struct dw_edma_burst *burst,
>  			u32 idx, bool cb, bool irq);
>  	void (*ll_link)(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr);
> +	int (*ll_cur_idx)(struct dw_edma_chan *chan);
>  	void (*ch_doorbell)(struct dw_edma_chan *chan);
>  	void (*ch_enable)(struct dw_edma_chan *chan);
>  	void (*ch_config)(struct dw_edma_chan *chan);
> @@ -181,6 +182,15 @@ struct dw_edma_chan *dchan2dw_edma_chan(struct dma_chan *dchan)
>  	return vc2dw_edma_chan(to_virt_chan(dchan));
>  }
>
> +/*
> + * Return the current LL entry index. A negative value means that the channel
> + * context is not initialized or was lost after a link reset.
> + */
> +static inline int dw_edma_core_ll_cur_idx(struct dw_edma_chan *chan)
> +{
> +	return chan->dw->core->ll_cur_idx(chan);
> +}
> +
>  static inline u64 dw_edma_core_get_ll_paddr(struct dw_edma_chan *chan)
>  {
>  	if (chan->dir == EDMA_DIR_WRITE)
> diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
> index abc1bd4c0be2..ba84811234e1 100644
> --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
> @@ -616,6 +616,24 @@ static void dw_edma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
>  		  FIELD_PREP(EDMA_V0_DOORBELL_CH_MASK, chan->id));
>  }
>
> +static int dw_edma_v0_core_ll_cur_idx(struct dw_edma_chan *chan)
> +{
> +	u32 base, val;
> +
> +	val = GET_CH_32(chan->dw, chan->dir, chan->id, llp.lsb);
> +	base = lower_32_bits(dw_edma_core_get_ll_paddr(chan));
> +
> +	/*
> +	 * An all-zero pointer means that the channel context is unavailable,
> +	 * so an LL region starting at DMA address zero is not supported.
> +	 */
> +	if (!val && !GET_CH_32(chan->dw, chan->dir, chan->id, llp.msb))
> +		return -EINVAL;
> +
> +	/* u32 subtraction handles a low-word wrap at a 4 GiB boundary. */
> +	return (val - base) / EDMA_LL_SZ;
> +}
> +
>  /* eDMA debugfs callbacks */
>  static void dw_edma_v0_core_debugfs_on(struct dw_edma *dw)
>  {
> @@ -650,6 +668,7 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
>  	.handle_int = dw_edma_v0_core_handle_int,
>  	.ll_data = dw_edma_v0_core_ll_data,
>  	.ll_link = dw_edma_v0_core_ll_link,
> +	.ll_cur_idx = dw_edma_v0_core_ll_cur_idx,
>  	.ch_doorbell = dw_edma_v0_core_ch_doorbell,
>  	.ch_enable = dw_edma_v0_core_ch_enable,
>  	.ch_config = dw_edma_v0_core_ch_config,
> diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> index 36ee72efcd31..2fc7f8e85b43 100644
> --- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> @@ -384,6 +384,24 @@ static void dw_hdma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
>  	SET_CH_32(dw, chan->dir, chan->id, doorbell, HDMA_V0_DOORBELL_START);
>  }
>
> +static int dw_hdma_v0_core_ll_cur_idx(struct dw_edma_chan *chan)
> +{
> +	u32 base, val;
> +
> +	val = GET_CH_32(chan->dw, chan->dir, chan->id, llp.lsb);
> +	base = lower_32_bits(dw_edma_core_get_ll_paddr(chan));
> +
> +	/*
> +	 * An all-zero pointer means that the channel context is unavailable,
> +	 * so an LL region starting at DMA address zero is not supported.
> +	 */
> +	if (!val && !GET_CH_32(chan->dw, chan->dir, chan->id, llp.msb))
> +		return -EINVAL;
> +
> +	/* u32 subtraction handles a low-word wrap at a 4 GiB boundary. */
> +	return (val - base) / EDMA_LL_SZ;
> +}
> +
>  /* HDMA debugfs callbacks */
>  static void dw_hdma_v0_core_debugfs_on(struct dw_edma *dw)
>  {
> @@ -406,6 +424,7 @@ static const struct dw_edma_core_ops dw_hdma_v0_core = {
>  	.non_ll_start = dw_hdma_v0_core_non_ll_start,
>  	.ll_data = dw_hdma_v0_core_ll_data,
>  	.ll_link = dw_hdma_v0_core_ll_link,
> +	.ll_cur_idx = dw_hdma_v0_core_ll_cur_idx,
>  	.ch_doorbell = dw_hdma_v0_core_ch_doorbell,
>  	.ch_enable = dw_hdma_v0_core_ch_enable,
>  	.ch_config = dw_hdma_v0_core_ch_config,
> --
> 2.51.0
>
