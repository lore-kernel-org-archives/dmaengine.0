Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010071.outbound.protection.outlook.com [52.101.84.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09FB38C42B;
	Thu, 23 Jul 2026 16:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784825533; cv=fail; b=DXucordo3OQtSc7+ftFnjesD3BCWo6hTi0cADg1L8/9IZKrAB8hpht0h75io0YDz1dBOheoYlXuZywec3Z7DwGRJdrPIshvRhOYOvVhbA1IuL7piIQM9bJKj1YswHXZZbuH201svzBhzWISXKlsHXsYLabbnSLvGcPw/mA8UqnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784825533; c=relaxed/simple;
	bh=kFvDX+E2jBH/bA17E7/rCkXEw6/Txs8h214hucpu0aA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tgZ7WVHPXPBI0GuI1A/p3/btDYGnSlFs2N7L4URPnU6+kDVwSY/dOBtZmQoMkUkZauld7R+2y1bG63zpUkSWSJ2/Z5fKe6YH8fBjNGx4P01B0dn1BLSlwO2lhK4qFimkadXmT15cQvpb6yd4UisxdVPogT5IkBa7jdvfQwb5WRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bgRwIZTX; arc=fail smtp.client-ip=52.101.84.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bgRwIZTX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PRLrwIaORoA+YVOWRuf6IC6E0sJV6z77C38TqzwfcHLwk31svaqakJwOXb5FYxYychZ93oO3D6Hsy4dp2/OHgHKbfk/gay3BWdTNZPPlRLWE/DxwhXGRL594aSnIkmffqkQOm+rOG2zYrLstfWF4aJgcgGrjaxYVt9ORRLUWCG/gGN2F09O7yfh82xtMQDshNNRqCB/0yeet6tVuIOBKIY4i1vinNsKy1yGji9ZzPvZmSQ/9vIugSW/PrWOfoXItlqEuChDgKVkruAELi4aKO8wWka459PMTeLRUS+DPoJEqMtPlXXubRCxY9Y0e+FfmwJFQNXAl4ogoG/CpkACi4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JltRT2acwfkQ6mP9hO4WperVDz/vfTgcuN7kEfd0J4=;
 b=oMqLq6X5pUW2lCoLBgmcbx1DmmgdJMsW59J8374pmAkMSIkmvGTAZ2FhvSCDKtWBWXMavjL1SVdkzkPRnlsbaUZlnjBEyer+64FWrCPo7fDR3enyNbQxCrLdy3J/inbChVbM19wEevpcRQGILEFSGZk8buiyp8OnZ98BNxkByUa7zppZAC8RJ/HMDxBfviVpsPzj+JlJf1afZvjmEZhpzkS8mSJpnFjpOYuCyjkYZI4m88UOk/LqPgSR3700KjVcmaoLXWae4l/EQxbSk8WBYit+mrXJXYZqZWG4nonatCWk1PgT2AtXmFjK9uiMtVUDx7GfgO7ngOh9knDoXsppdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JltRT2acwfkQ6mP9hO4WperVDz/vfTgcuN7kEfd0J4=;
 b=bgRwIZTXnOyUS9FMgEFHXe8zaA3Wln1ApL27CJlxQINSA1TDvXXbAFEurallX2Uhq/uI/6AdfwkiAYwM6yJWmnrt3+oLaPHPYQfjyyF6O8J4fWQArVl+hYWqnmcDOdTajK/vsz82nRjXR+I++ZT5YcccIMOQYpSBYlNfk/wHQFoIyA+hq5KB3U2CRYwvdSmVVpFTs9Bvv+M2DtYag0zXYJ6XVhw6cLxxXV6Gsr0M9R31rZJ2WcoN3il5Oggt8ERvLXo1taPGF0+6l25RFmiDtuPDqfW5N2K7smOpWLVqCZHQkWcDch3nyHPGDC9gWmhWC9EDhk44xNzcChAmGEcfFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8005.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 16:52:08 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 16:52:08 +0000
Date: Thu, 23 Jul 2026 11:51:55 -0500
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
Subject: Re: [PATCH v2 06/19] dmaengine: dw-edma: Move callback result helper
 before LL helpers
Message-ID: <amJGq2aPpEMPc9uY@SMW015318>
References: <20260723084150.521366-1-den@valinux.co.jp>
 <20260723084150.521366-7-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723084150.521366-7-den@valinux.co.jp>
X-ClientProxiedBy: PH5P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: 77ff9f14-edfb-47e4-e16b-08dee8dabb63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|7416014|376014|1800799024|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jLI/ljNNVNtoYbqEZwglswYZ7Wyxos+tR/zylX0AROnP/CjHYVLZQtPEcVdVwp+T22Vt2Iec5VVfLGUB6QjiS99OSuQD3Kou+XSYyZa2q6Kssy7YQn5LRbACdo3y3R/bwDXMAkQOKOle9i8Irl0JX/tmC1hbsTIoOrrCeXLejNHrho/8Dgxc8qCfHVaQHjOz42/tkUp8pa/GUKvxnIljr0XXEganC1LZUVZHGs4zdn6oHFnX4D17GxEEyHDdqFCDDtEu1DdP6iarDcn8VDsxg1ThsWlK8H1Qe7FDajfN7g7Kea/6LLqKYCplZvVO+P3yqeGoDMB5oEFgLAMP71EODt5OPkX4yv1xchKB+/hZtq/jCu4L0GDlH33iTbYfQPrAketwffJGNPrgLmOHaNwjSboFeDRI1M0erZ//DWl+2t/7PIoELyU7b4rxK6p33JSWBb9Xi+n3Pg8p8UExXOZ+zJnFeoY9OhQUIHl+LsUKWStrgu0Dn4PCpTu+Dt7OSyP1eNwUlflXz8dfKVAk/dDcVnlnU+gDX35BZBhKCYA4JeI5BJ+6vC7apWQGEjr7ATkpoxq4ekp2hFPxls7pmaJOPaPgGbHHSrsUka2Lra1OXyIzvSTUsi/7/jtXiz38wgdiSzN3Rw3le058yXqk9LG8Jg+ez60576JOocuMDXUkGFM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(7416014)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rO1O7nsow7mhQaVSQx3ND3UCV+JBqqEhZPnsKRb7t3jkQT71U5gg5vhJRMfS?=
 =?us-ascii?Q?4A2gt6OWL/chxh81zLiyYu3HExJmVG2rIfgovZiBitB3MjS/sfHIjNXt6LRq?=
 =?us-ascii?Q?mFktFGbty219LZ0BVTFv1K07CJL23WI71XuHahyzCvoibAJecWouo/OFCDl3?=
 =?us-ascii?Q?KdWvlGGLRgKudqF9yRpJxyHI9ZYge0xxIXrcdmkyKGawf4gVBkSSRTZTCWLx?=
 =?us-ascii?Q?HaC59hhzA0S0bnOvDmokUYrCR5gIYhTS/OoOous+wXkcEZj2Q0REI83OLw8+?=
 =?us-ascii?Q?NKF1LV6TKA53RXkmEkweBlROEgPhb8OHmoNQ3VUjUAluzSyJFPpaSg52ToDN?=
 =?us-ascii?Q?e4jJEUE+/xPD/QXdBPXun+QXXiZSyzzOK22HjSCC9YpVhVBPrhZM17wrnMr5?=
 =?us-ascii?Q?lbRUZKwmMTLQzBTYvxeIqW7Wo5LiccDQJ+Ba9H3pSvRpPQTsEzUyql87leYM?=
 =?us-ascii?Q?GyMsyEG3dW9ohB5BPKyEXFEQ2oXaVPlY/IvP5csobQ/dcjYb8ozTxUoPN3XN?=
 =?us-ascii?Q?h02KLNdvd+hI/Kk6XrCaZ0jdUBbA9jxJX+9wAl7fRCKkZ5yusXut/MjNpf66?=
 =?us-ascii?Q?rKSZGDTvYcP14UiHklWVs3V+f6ZtXlEq+gcNmQ8gQdwiC8He7E1pIKxO7RMN?=
 =?us-ascii?Q?NSjwcaV1lCx/TclNn/GCOorbWYPW1UO1zpmBj4GajMRv+gJ8C6SFN5LpQ1DP?=
 =?us-ascii?Q?qKuaEal2k9IKZsmmtGLgbJffZVuWB3B8EAj/vYY1ltNDFO8J1CjSyGR1g5UD?=
 =?us-ascii?Q?VPxaVNceil35I1WCz46DFKDxGHnMXRg+Jiz2wcJMIYi6/wZxyqkHMpMnxjeG?=
 =?us-ascii?Q?WGBbS/xXJxQRZukTMxvlR1UjEqUbcPZVqjKlON0mB3lMTcIuMGyEySZ0kj4R?=
 =?us-ascii?Q?uAu6aVy/du0qLw7n8HANx2qTKc7NcaGK9tZPUnQjoOg9eVIooQYNLbCLnuKC?=
 =?us-ascii?Q?Hit1yCZEcWLYABcqKdVLcZs8HabFCGnIbeLl9XBnZn2mMntP77TB4WLs/lwc?=
 =?us-ascii?Q?BSD2A0TPLPA03g0jH3cFxrjJx0UACzDQgGvRROaDBJXs/IyIFkLLymFLZbIW?=
 =?us-ascii?Q?ichDgOu1eMX1kFWVlU1ug4R5XmJB6j0V46zPQIELg3CjC1Z90Ng4hLTYlXA0?=
 =?us-ascii?Q?ZeEB0izzwWnvYAYMlhL0qc+rstsMZ4Kn/6LHMFJMNVUa13QwMvLEEVc9LHP+?=
 =?us-ascii?Q?XQd1y/htCp5UY3dKvZQsuaIRxBSEIEsnLyT1sBz93urgtHOpxLjLhLjiVKmz?=
 =?us-ascii?Q?SUn8wD+sPeW1t6SWvRaY87P3VUArOwMkOFulCzJZG/cX3lBEM+fJlySInCV/?=
 =?us-ascii?Q?v9HW73wtqhrJwPZr5xNZo9P13+KJM0yS4Sm0Pv/ZDrra6bSh+RDOfTfUgUqU?=
 =?us-ascii?Q?xqG33MzqmDaFF8new9fCFddBOew9tKvG23CP/89AzWQEmUCewZk67405MJgy?=
 =?us-ascii?Q?VDHXeNEk7WVDy1W61HL958gZwS0rmUiWIeAtODR9kd5wR3A+S1SkCbhdblMF?=
 =?us-ascii?Q?RrrxDw4577XDY8g9qrZXquhKhPDhKkD2FigFyGbOa12huA//hEMaU2rjfWFs?=
 =?us-ascii?Q?bA4SIrUnKjqplSGl9ihlN60MpQnGrcz29IiifvPNvS1Pk7k3YiKlgNIdL365?=
 =?us-ascii?Q?oCDIrcD2Xo3LpUlQ0LjLVhC4JSqV45riB3Rye0GuO8YYOF6IGunffclaspRG?=
 =?us-ascii?Q?/S58wtn3+DLa0TzvUeZ6+jMalh6nOMAHm7La2Bho3Hg5wPuIZBy4R/tEvp5W?=
 =?us-ascii?Q?KINHbHPIKn2M94p0EoXxYv7OylsIEtyCikeCWvMZ6GbUyP0ecwR0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ff9f14-edfb-47e4-e16b-08dee8dabb63
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 16:52:08.1112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xxA75Pi3FxfahcU7M1kSX7ExLhguqbsr+f8nsmfOvMgn6mwb6SwOkeVSD2wKRh85Ah7r3sSS6kT0O2hbmCpM1MXDoc4KLr3QaBHJkNXa0e9/RVB/be7CloGemhKdGemp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8005

On Thu, Jul 23, 2026 at 05:41:37PM +0900, Koichiro Den wrote:
> From: Frank Li <Frank.Li@nxp.com>
>
> Move dw_hdma_set_callback_result() next to the descriptor helpers so
> linked-list completion and reset code can use it without a forward
> declaration.
>
> No functional change.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>


> Based on Frank's original submission:
> https://lore.kernel.org/dmaengine/20260109-edma_dymatic-v1-2-9a98c9c98536@nxp.com/
>
> Changes in v2:
>   - Move the helper before the LL helpers so later patches do not need
>     another relocation.
>
>  drivers/dma/dw-edma/dw-edma-core.c | 50 +++++++++++++++---------------
>  1 file changed, 25 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index 78d1bb6302fb..29f78405e9fb 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -73,6 +73,31 @@ static void vchan_free_desc(struct virt_dma_desc *vdesc)
>  	kfree(vd2dw_edma_desc(vdesc));
>  }
>
> +static void dw_hdma_set_callback_result(struct virt_dma_desc *vd,
> +					enum dmaengine_tx_result result)
> +{
> +	u32 residue = 0;
> +	struct dw_edma_desc *desc;
> +	struct dmaengine_result *res;
> +
> +	if (!vd->tx.callback_result)
> +		return;
> +
> +	desc = vd2dw_edma_desc(vd);
> +	if (desc) {
> +		residue = desc->alloc_sz;
> +
> +		if (result == DMA_TRANS_NOERROR)
> +			residue -= desc->burst[desc->start_burst - 1].xfer_sz;
> +		else if (desc->done_burst)
> +			residue -= desc->burst[desc->done_burst - 1].xfer_sz;
> +	}
> +
> +	res = &vd->tx_result;
> +	res->result = result;
> +	res->residue = residue;
> +}
> +
>  static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
>  {
>  	u32 i;
> @@ -645,31 +670,6 @@ dw_edma_device_prep_interleaved_dma(struct dma_chan *dchan,
>  	return dw_edma_device_transfer(&xfer, dw_edma_device_get_config(dchan, NULL));
>  }
>
> -static void dw_hdma_set_callback_result(struct virt_dma_desc *vd,
> -					enum dmaengine_tx_result result)
> -{
> -	u32 residue = 0;
> -	struct dw_edma_desc *desc;
> -	struct dmaengine_result *res;
> -
> -	if (!vd->tx.callback_result)
> -		return;
> -
> -	desc = vd2dw_edma_desc(vd);
> -	if (desc) {
> -		residue = desc->alloc_sz;
> -
> -		if (result == DMA_TRANS_NOERROR)
> -			residue -= desc->burst[desc->start_burst - 1].xfer_sz;
> -		else if (desc->done_burst)
> -			residue -= desc->burst[desc->done_burst - 1].xfer_sz;
> -	}
> -
> -	res = &vd->tx_result;
> -	res->result = result;
> -	res->residue = residue;
> -}
> -
>  static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
>  {
>  	struct dw_edma_desc *desc;
> --
> 2.51.0
>
