Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013001.outbound.protection.outlook.com [52.101.83.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359524CB8A4;
	Fri,  4 Sep 2026 15:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536523; cv=fail; b=iIoCx4BelLAD/x6Aw8y/cJ65AnNkHuYIUOPFP3OfSZlIGVX2n4gNeolNbzM/MPgtekihLCQkLZm/GDgOrd3TtXTD5pMhYFe8bVUV3q04v4NMm+sCYKvMydqqNgVV/oQVgmyaWiCQjpScatJQcNxHY7d2xUXKgoNpS1OQ8o/UTLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536523; c=relaxed/simple;
	bh=e/SZDtAu6YiB6fO1e1HNV1cMGlTg45lfx1ttHkcfkkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hCsUYl6I6kDGMtslbStlCTsyTeP8hXYLikvCpmFRuLkqGpsd/a7SqQ9aHBP6IxtiEuD8b9YSGGtm3SujUC3aYxfSIuhrmFR1n4TguoPbgo9d//DGUwkekKL4gPb3prHYHIr75bYEfJ322JtlIlXFdjakXTtnDmfZYFoARrY9QSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VqPtWwTm; arc=fail smtp.client-ip=52.101.83.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VqPtWwTm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFTkOfl4YjZhpEavwumZFn+ybA2fFNd+OPjlqWjOGWkVGPM8ITp+Jm/wfe5wZ7seU1jdXiGl8QdDlIkHqpbYIAzDm2ffkRfYTY75kBKy7ZA85i4odqauQM4cvTAZpY3B+vZQwk/wMWvaj7jjFTLzJ2wRjQv68qlpNlW90Evo1/EpW/fPwt9wqXAUhAVxV3M4oeQxQ8H4S3EL7LfWIS3VfTY7Me9w/K8VaNqVQlAMozF1HWJknOmHS+XuGqsvBng3PrAJfXNlN3i/g+19xiqmEdutrY98I9utHM43mjyGVIXEN+D7ECfmpfV3gKez+hYp68ms9NhJqnWsgdsoXUqTOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oed5pAS43ELTk9q+/LapAIhQlc7pC5VUslT1e0lCXb8=;
 b=U2Wh/uy5heLLvyvmwnkMLSosLI4QXOGdzXyILhhxeVnM5d88uYux+gKNRZ7/aOJhglDznSM6VKWHbTtwB+C08h9EaWWq7v5Lrf7ooKWGfGOFGRNAHGUXqkN5uk9yxkC0GiUfkG00mJNi1n9kxPYZPlvLCBExRweRxSRu7sDCXrX8EQ+X0+qS57vc1XLnderXbKOoUZM/L0QSZo25J4IcPnY2yISfhwegit8BeU7AicSlZFCXiLOlxlfUUH9VJHPcLNi/XThWm7Gw9HtFQejCARg+yGig00ieJ/Br1iTR5cCTF7wzh/1wh8kSwfRLj/5Yb3LC00PRZzFM7ivbW6P25Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oed5pAS43ELTk9q+/LapAIhQlc7pC5VUslT1e0lCXb8=;
 b=VqPtWwTm86BjgWWfMu1ur9BW67yikaHWBqbqiCCk30Dw+IQ6sBkw6k1zzp5txT8qUOWV4xwrveq9B4QvMGVhfLP4QzSIZQrYjRStVo5XWU8thkur85qfKd53voEjZUccojAbH02sxhGQavgef61RzWtbnd8jYP7X5TKIbdxMz9RgL58eOzTrxtXfWWQJg75nG6nEToD3yAXfQjPn2xsg9jSRkNNv9wqgzy5kV+0U4Kvp9rJ2A5Nck7tZ/wzWWnUpShzdZlEFlsWH73sp9ppKcKyyF1ZLzfJX8IxdTQPPhsjgZXD5C98ckJ7+//iExo7SLtq0mxRDRloRM/L77Y2oQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB11005.eurprd04.prod.outlook.com (2603:10a6:10:587::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 15:41:57 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 15:41:56 +0000
Date: Fri, 4 Sep 2026 10:41:47 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Devendra K Verma <devverma@amd.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dmaengine: dw-edma: Configure remote interrupt
 routing
Message-ID: <aprmu6McROxJrDLW@SMW015318>
References: <20260903064533.2269557-1-den@valinux.co.jp>
 <20260903064533.2269557-3-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903064533.2269557-3-den@valinux.co.jp>
X-ClientProxiedBy: PH0PR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:510:5::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB11005:EE_
X-MS-Office365-Filtering-Correlation-Id: 99440e8e-3c68-448b-7f9b-08df0a9b0cfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|376014|10067099003|56012099006|4143699003|6133799003|22082099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	1zPuIasDExJEff6PTIqNkFFIx0UOCt9tMTF7aLGpbZJm/ZZFfDKue9dlBqUfS9NOOermcwj+UXz4zVTxd7ku74qe01gvdugNO6WHIU8Fq39t1xBowHpewIBRkEm0QyTyHXLb+CNIuZCn8VSF5q8wq/w/Lx/q8NtJbBI7JI8wPR1J3LRx1NB2NFWhJfNCPCzdR1QgdayXI7uXluaNg9UZQAOqrNQdLTc1RKRDNeeemq5OxmCR+rH+a+YjroTui9KWxdglOlY8SOO68qa5bl2H5H6mDoqYR77w3GakXhCrNHF6e8cDXZYnDQpJe+B1SQq6PhGnjGNrbh46agMnYamkam7qqWNcJkjge5bw0W0AJs17l7d8iS+nbk9yUT54OaoJ0776daj+UoSyHARAUkaE24u2LUXR4wfO5meKFINQPLiwE6Zi2e4fJ+qqnAKL9U53iFl80B1Tk8cNaYHLeAZq6RD3wSuA+sZ0nZ45qSLGdP40hUGIMfMhEfylYRXfkU23q3Ztr1IZoWK+zNS84rxiP64Avr/rs5+E2AL6x0+Nsi26HFAFEizbkqwyQfkFyFQSKxXyR4MWOrlETQwO6tGHsQQ81tHuY/x1dDQjmDmhDmE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(4143699003)(6133799003)(22082099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8E+GcxkpVuxzzfBidFwGcF9TBYgbg/xKU8INlfWw2nVB6f0KFekTvVdGGtRw?=
 =?us-ascii?Q?PLNF69sJDfRvc26kfnWPPonaXi1vW4BuFJpxM/ytI2vMUJ8PoxwJPQnE3lVc?=
 =?us-ascii?Q?hDMc4VKkgIOjltjdK23QWY8gOuPko0iDDGnWQSoOCWQx5TRseTR6vmGRQSrS?=
 =?us-ascii?Q?Fu4FnR+456KPfQ+rbhPpJ11emG2M1ALYOimMBwDhURwHI2gJ/mu7e3QJATCr?=
 =?us-ascii?Q?W9pcHmW/Cg65O79pNo9Ts162e5LXygIEahalI8spZclPRSGTx7xmqI7BSdxT?=
 =?us-ascii?Q?6Wo9a/qoNxy1BQfhcI0UvLj5uQusqh+DO98KbLG4mpoyQHEGVHFTLXlvaGiP?=
 =?us-ascii?Q?/2Y5WOgHS1Eq6KiHN5rufN72fm2ge77GOZVN0DtM27FQZhh6CoswNuKxSLPO?=
 =?us-ascii?Q?WNXlT+Gdu/e+kFMLx4fUpH+ROwFJwdszGeOtO06fegaET9ZaACkT7XlvpI6u?=
 =?us-ascii?Q?yPQGn9u4c73vHOb/W4IkUN/8BKsv4sC86mkd6oxGxhUybXBJtfSsUBeUejtd?=
 =?us-ascii?Q?vR7QHvGXRdi3hiFwHbKGm1JO7U29xnzjmNsS63Azun1fg3ofIbe6YnwXkhwI?=
 =?us-ascii?Q?RH6E7eSez1miEzsOY2TyzWJ1n4gJcEunmsu8vK1B7QR4inNvxLCAm8qlP3l0?=
 =?us-ascii?Q?MtuwaTDLDZ/OEr+wHJcFfK5RTJmmYEd0LxD7G84/WpVza2XRLBf76ENVkvVF?=
 =?us-ascii?Q?FEgxQzWrvhZ/m5RlA/mkjlnkOGvrBE6XxbDHWVXOvcff81PEwBMAym36G0J3?=
 =?us-ascii?Q?5nkpK232B8np/XMi0XlI0VEXx5SlZXktoyzbc5rR6THUIQw7yNctW+9BsGef?=
 =?us-ascii?Q?KGfAo1+4rWHlWPL7OGtC+MIn2qcMkqi7AE6pqn+H3hAUiKJeo1MstShAGvBV?=
 =?us-ascii?Q?3f1ysnEfFCnd44zI1Lfb6jo5i78//e76Q9Xs2kHatm58ziFP5Ia1ThpO8Mfc?=
 =?us-ascii?Q?nFlA6nsd919ZlzJkFPGtvt+BH49sJ8ZG/XLu5OwPKDesst1KiUl7eDeNYE4G?=
 =?us-ascii?Q?arxkWFeL17+D81nyAZv9icC4rJ0sodDGgUA1oVbR2yo0ZJvLxyvGLVIQL119?=
 =?us-ascii?Q?g0DNh8cwxGZaSp7N5Gk7I4i6wuL7zB02yf0ZRCkwv1/XXqvAT+OC/4TNYHKl?=
 =?us-ascii?Q?DDbDfwdCxtDMGbijO2ostIvCqMoyY8xPD3bRT0ER1xcmWsGFMo1sh+FicE6Q?=
 =?us-ascii?Q?ZQZkVCKQmb2daBBw5lI44Pk5oCgB5NyhdQ0snrunCcxkFh8QbziH2sRNATEP?=
 =?us-ascii?Q?q0u9h9Kb85d/i9/f7aOl/MZQJOV8DBLFnn4+6RlAQCGVUmTbPr/YY0vW0Oqp?=
 =?us-ascii?Q?cta/8enW8ztSkoSfZjmvAHJ2e3fxxGmXweO880wSyTFmpK4hmCDQMMo1yrrw?=
 =?us-ascii?Q?SsSYVaRMNYYQul5Kl7aBwzgopQFgXa4nYRo7/5FsLfSzKcpvmiMkIS37UqVk?=
 =?us-ascii?Q?BWz7J6YUD9nMXJ0THtJpeoKFDbp9iZ84MhvFY2pe6fnNzpkHMUwFTadi7HSE?=
 =?us-ascii?Q?GLD8Ih5jAEGVR3TPkMmkF5wuQgSeQnse2hVeIZnE3JCY8wPDuF/vBz4eXVGc?=
 =?us-ascii?Q?xPAzWMD2vpO6Mt95YM90jhZUYh+NV6tWtqyEK/bxAKf4GrdDtbkukc97283l?=
 =?us-ascii?Q?yox5b4U9ka4JZ+Tozyc5kkiqvZ5tD3Nt8R4GLu1Jp5zwDN+HdLVQIP1IFwfX?=
 =?us-ascii?Q?v7DP5ewIYRzN3xVpCg++PvO5mYVrIycrzPZdUFUSqUD2R+OIN15Yen8Mmr9Z?=
 =?us-ascii?Q?qtOV+E2aQ82ESSGw2LldraNSIRfuKWHQGoHf6SKDSHnUBo5BuYWQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99440e8e-3c68-448b-7f9b-08df0a9b0cfb
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 15:41:56.7232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AyO77OOEaU78e0KE3gRx32nsocgYPRnCo7vj8T2eyxme2cuhX9OW0RhQl24b8g3wftWzUKNuofg0kGIWTknBI8P0atDsTYJkGvccY6HKsoXGRu93Ln5b+vXacfvIDBmt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11005

On Thu, Sep 03, 2026 at 03:45:32PM +0900, Koichiro Den wrote:
> An endpoint function can reserve an endpoint-local channel while the RC
> programs it through an exposed register window. Such a channel must route
> interrupts remotely and ignore them on the endpoint.
>
> Use dma_slave_config to set per-channel interrupt routing on idle channels
> of a local eDMA-compatible instance. Releasing a remote-routed channel
> quiesces the hardware and drains its local IRQ before restoring the default
> routing.
>
> The eDMA quiesce may stop a complete direction. The caller must own every
> channel in that direction and stop remote programming first.
>
> Suggested-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
> Changes in v3:
>   - Add struct dw_edma_chan_config with validity flags for non-LL mode and
>     interrupt routing. (Frank)
>     https://lore.kernel.org/r/apWj7zzAw57U2r4F@SMW015318/
>   - Do not skip generic dma_slave_config fields when private settings are
>     supplied. (Sashiko)
>     https://lore.kernel.org/r/20260828164950.61AE51F000E9@smtp.kernel.org/
>   - Use READ_ONCE()/WRITE_ONCE() for IRQ mode accessed by shared handlers
>     and drain the channel IRQ before restoring local routing. (Sashiko)
>
>  drivers/dma/dw-edma/dw-edma-core.c | 135 ++++++++++++++++++++++-------
>  drivers/dma/dw-edma/dw-edma-core.h |   5 +-
>  include/linux/dma/edma.h           |  19 ++++
>  3 files changed, 126 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index a678c70a78fe..e3786d960a43 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -177,48 +177,79 @@ dw_edma_get_default_irq_mode(struct dw_edma_chan *chan)
>  						  DW_EDMA_CH_IRQ_REMOTE;
>  }
>
> +static int dw_edma_device_config_irq_mode(struct dw_edma_chan *chan,
> +					  enum dw_edma_ch_irq_mode mode)
> +{
> +	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL) ||
> +	    (mode != DW_EDMA_CH_IRQ_LOCAL && mode != DW_EDMA_CH_IRQ_REMOTE))
> +		return -EINVAL;
> +
> +	guard(spinlock_irqsave)(&chan->vc.lock);
> +
> +	if (chan->configured || chan->status != EDMA_ST_IDLE ||
> +	    chan->request != EDMA_REQ_NONE)
> +		return -EBUSY;
> +
> +	WRITE_ONCE(chan->irq_mode, mode);
> +
> +	return 0;
> +}
> +
>  static int dw_edma_device_config(struct dma_chan *dchan,
>  				 struct dma_slave_config *config)
>  {
> +	const struct dw_edma_chan_config *dw_config = config->peripheral_config;
>  	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
> -	bool cfg_non_ll;
> -	int non_ll = 0;
> -
> -	chan->non_ll = false;
> -	if (chan->dw->chip->mf == EDMA_MF_HDMA_NATIVE) {
> -		if (config->peripheral_config &&
> -		    config->peripheral_size != sizeof(int)) {
> -			dev_err(dchan->device->dev,
> -				"config param peripheral size mismatch\n");
> +	bool non_ll = false;
> +	u32 flags = 0;
> +	int ret;
> +
> +	if (dw_config) {
> +		if (config->peripheral_size != sizeof(*dw_config) ||
> +		    dw_config->flags & ~(DW_EDMA_CH_CONFIG_NON_LL |
> +					 DW_EDMA_CH_CONFIG_IRQ_MODE))
> +			return -EINVAL;
> +		flags = dw_config->flags;
> +	}
> +
> +	/*
> +	 * When there is no valid LLP base address available then the
> +	 * default DMA ops will use the non-LL mode.
> +	 *
> +	 * When LL mode is the default, clients can request non-LL mode
> +	 * through DW_EDMA_CH_CONFIG_NON_LL.
> +	 */
> +	non_ll = chan->dw->chip->mf == EDMA_MF_HDMA_NATIVE &&
> +		 chan->dw->chip->cfg_non_ll;
> +
> +	if (flags & DW_EDMA_CH_CONFIG_NON_LL) {
> +		if (chan->dw->chip->mf != EDMA_MF_HDMA_NATIVE)
> +			return -EINVAL;
> +
> +		if (chan->dw->chip->cfg_non_ll && !dw_config->non_ll) {
> +			dev_err(dchan->device->dev, "invalid configuration\n");
>  			return -EINVAL;
>  		}
>
> -		/*
> -		 * When there is no valid LLP base address available then the
> -		 * default DMA ops will use the non-LL mode.
> -		 *
> -		 * Cases where LL mode is enabled and client wants to use the
> -		 * non-LL mode then also client can do so via providing the
> -		 * peripheral_config param.
> -		 */
> -		cfg_non_ll = chan->dw->chip->cfg_non_ll;
> -		if (config->peripheral_config) {
> -			non_ll = *(int *)config->peripheral_config;
> +		non_ll = dw_config->non_ll;
> +	}
>
> -			if (cfg_non_ll && !non_ll) {
> -				dev_err(dchan->device->dev, "invalid configuration\n");
> -				return -EINVAL;
> -			}
> +	if (flags & DW_EDMA_CH_CONFIG_IRQ_MODE) {
> +		switch (chan->dw->chip->mf) {
> +		case EDMA_MF_EDMA_LEGACY:
> +		case EDMA_MF_EDMA_UNROLL:
> +		case EDMA_MF_HDMA_COMPAT:
> +			break;
> +		default:
> +			return -EINVAL;
>  		}
>
> -		if (cfg_non_ll || non_ll)
> -			chan->non_ll = true;
> -	} else if (config->peripheral_config) {
> -		dev_err(dchan->device->dev,
> -			"peripheral config param applicable only for HDMA\n");
> -		return -EINVAL;
> +		ret = dw_edma_device_config_irq_mode(chan, dw_config->irq_mode);
> +		if (ret)
> +			return ret;
>  	}
>
> +	chan->non_ll = non_ll;
>  	memcpy(&chan->config, config, sizeof(*config));
>  	chan->configured = true;
>
> @@ -890,11 +921,48 @@ static void dw_edma_wait_termination(struct dma_chan *dchan)
>  		 "timeout waiting for channel termination\n");
>  }
>
> +static void dw_edma_synchronize_chan_irq(struct dw_edma_chan *chan)
> +{
> +	struct dw_edma *dw = chan->dw;
> +	unsigned long *mask;
> +	int i;
> +
> +	/*
> +	 * With nr_irqs == 1, the common handler can enter for the other direction
> +	 * and retain a status snapshot for the remotely owned direction across
> +	 * quiesce. With multiple IRQs, the handler covering this channel can likewise
> +	 * enter for another IRQ sharer. Drain the IRQ whose mask contains the channel
> +	 * before restoring local routing.
> +	 */
> +	for (i = 0; i < dw->nr_irqs; i++) {
> +		mask = chan->dir == EDMA_DIR_WRITE ? dw->irq[i].wr_mask :
> +						     dw->irq[i].rd_mask;
> +		if (!test_bit(chan->id, mask))
> +			continue;
> +
> +		synchronize_irq(dw->chip->ops->irq_vector(dw->chip->dev, i));
> +		return;
> +	}
> +}
> +
>  static void dw_edma_device_synchronize(struct dma_chan *dchan)
>  {
>  	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
> +	bool remote;
> +
> +	scoped_guard(spinlock_irqsave, &chan->vc.lock)
> +		remote = chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL &&
> +			 chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE;
> +
> +	if (remote && dw_edma_core_ch_quiesce(chan))
> +		dev_warn(chan->dw->chip->dev,
> +			 "failed to quiesce remote-routed %s channel %u\n",
> +			 chan->dir == EDMA_DIR_WRITE ? "write" : "read",
> +			 chan->id);
>
>  	dw_edma_wait_termination(dchan);
> +	if (remote)
> +		dw_edma_synchronize_chan_irq(chan);
>  	cancel_work_sync(&chan->irq_work);
>  	atomic_set(&chan->irq_pending, 0);
>  	vchan_synchronize(&chan->vc);
> @@ -903,12 +971,17 @@ static void dw_edma_device_synchronize(struct dma_chan *dchan)
>  static void dw_edma_free_chan_resources(struct dma_chan *dchan)
>  {
>  	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
> +	enum dw_edma_ch_irq_mode default_mode =
> +			dw_edma_get_default_irq_mode(chan);
>
>  	dw_edma_device_terminate_all(dchan);
>  	dw_edma_device_synchronize(dchan);
>
> -	scoped_guard(spinlock_irqsave, &chan->vc.lock)
> +	scoped_guard(spinlock_irqsave, &chan->vc.lock) {
>  		chan->configured = false;
> +		if (chan->irq_mode != default_mode)
> +			WRITE_ONCE(chan->irq_mode, default_mode);
> +	}
>
>  	vchan_free_chan_resources(&chan->vc);
>  }
> diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
> index f6a5ad317567..275d362d1805 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.h
> +++ b/drivers/dma/dw-edma/dw-edma-core.h
> @@ -280,11 +280,12 @@ static inline bool
>  dw_edma_core_ch_ignore_irq(struct dw_edma_chan *chan)
>  {
>  	struct dw_edma *dw = chan->dw;
> +	enum dw_edma_ch_irq_mode mode = READ_ONCE(chan->irq_mode);
>
>  	if (dw->chip->flags & DW_EDMA_CHIP_LOCAL)
> -		return chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE;
> +		return mode == DW_EDMA_CH_IRQ_REMOTE;
>  	else
> -		return chan->irq_mode == DW_EDMA_CH_IRQ_LOCAL;
> +		return mode == DW_EDMA_CH_IRQ_LOCAL;
>  }

does this tunk fix something, you make this change later.

>
>  #endif /* _DW_EDMA_CORE_H */
> diff --git a/include/linux/dma/edma.h b/include/linux/dma/edma.h
> index 3c8e2ef9dee0..93f866d57987 100644
> --- a/include/linux/dma/edma.h
> +++ b/include/linux/dma/edma.h
> @@ -101,6 +101,25 @@ enum dw_edma_ch_irq_mode {
>  	DW_EDMA_CH_IRQ_REMOTE,
>  };
>
> +#define DW_EDMA_CH_CONFIG_NON_LL	BIT(0)

you need update other non_ll user to set DW_EDMA_CH_CONFIG_NON_LL.

Frank

> +#define DW_EDMA_CH_CONFIG_IRQ_MODE	BIT(1)
> +
> +/**
> + * struct dw_edma_chan_config - dw-edma channel configuration
> + * @flags: fields selected by DW_EDMA_CH_CONFIG_*
> + * @non_ll: use HDMA non-linked-list mode
> + * @irq_mode: interrupt routing mode
> + *
> + * Pass this structure through dma_slave_config.peripheral_config. Before
> + * synchronizing a remote-routed channel, the client must stop remote
> + * programming and own every channel affected by the hardware quiesce.
> + */
> +struct dw_edma_chan_config {
> +	u32 flags;
> +	bool non_ll;
> +	enum dw_edma_ch_irq_mode irq_mode;
> +};
> +
>  /**
>   * struct dw_edma_chip - representation of DesignWare eDMA controller hardware
>   * @dev:		 struct device of the eDMA controller
> --
> 2.51.0
>
