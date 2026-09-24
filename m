Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010070.outbound.protection.outlook.com [52.101.69.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF863B4EA9;
	Thu, 24 Sep 2026 14:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261695; cv=fail; b=q2SsZDpkxn0uXrlCz06sAiuS3sUhXAnxZArTvQOIztLov4UdeS4wPg+XNyY9qNeH2tsarp0GaVEOSVP5yH/gM3ycGY+1q3TXxIdb+koxQ/mEL2IGEGhX3rCx6EsHCCZhpv1VTiMgYE/gvJFoE8r/pRAhIvrJOeQJarGZdifSLz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261695; c=relaxed/simple;
	bh=ONSjJi8Ai21y2Z6dd4iunAgtCu44qGIaQWlRrR4HS4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MuWlp5jJcN+whosyHIah82/AjbpqUtBhP8rRpK6XGHvFXkeqfvT7emH/6k2hUc/pVn9/z8lffMN02RPOvkBCk7nIyofYyq0ukbrBeSM7E6Jd9mNU5A41c2KulQXAXAAshVDLpJbS1omApbUhGLODhKxzzJbd2AxEmZke+VLH9fE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NkGksSJJ; arc=fail smtp.client-ip=52.101.69.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NkGksSJJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Caz9ZEQ4QSLeioNy93Hp1/3IMQiWgQVJez85RmRogdVrCuTc4my4jOyNQHnY0hQDrLFsjjzp6828Ot+oWPPgMZgcXQEEBzCy5XUhakeO9W4WFxIjCZkvezyBLeEiHFvtpmfY3YWlJ6HCnazO324vACfhFbiITr5vLE/4WxKz35tAaFZqpoaqohvDC/KvGcRlN+cbSkXndd08URexexOpdLCEx5DGu+RugiHxN20I0dZfjMANgMcwpbpgvCqNDUUknXrrzVRVSGfVGS07RHrpEdsmKvC1jwrNmSv+n4ScKx5zsxKLCV0uUsSOiQoCHNZMoEJ2FEQnBYaN7IlKWcfTtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yBHHEMv15pfpDLXrTd6DlqyV1F5GL01SGPSdgkQ2S58=;
 b=RB0vTmOLjJoeogW4OGFQSFPXo0J5BBf+AC4PcD86Hx8UTnETvF76cos2oOZwpdWxPk4lDlAHdkhn6c7uR+ghOXpZ4lCdvzCCktLlBfcDRETsMjBPhsDBd/bRwr/hQYy+pYYRfhLgJFKs/0TU/rbAMmlQ923YZSCuObYh3Sfihp88A0XrNpWkhLOHFw80E0B66yGR+7qxQoZg8rNzpudcmZUlDCviA30a+ePFVHdSqAxq/nS/TukzShx+j6xzQRaMt91wYxgS+TUl1NbbfaQAkSgJiRO2XEn8ARNkGm0cUFcZFWcApG5pAbGhcwzsS0k2752NNl19oyjiOntemZZjtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBHHEMv15pfpDLXrTd6DlqyV1F5GL01SGPSdgkQ2S58=;
 b=NkGksSJJ0QDufnhUU9HdppWL6WfBpe/J2Sj3f1oxanhKKljoCDej8qQqn0B1BclkJEwdHkglcnq2XVMtrqurreW7tKJ8TVTlN6cHVxp0xDHCXACvY+qPnSP0XrCNprM2G291YsUS1E7uKY/QyPOjLkmOd9HQkbR+rK3aCeIkN+sLT3YLYuP+qVAA9jzJPdqWQnZ4bEPujBkWihqsjLx4mPSllxgWyI2R2Pd1uKlRJQbCjZNCfETPlBw1GYy/wYQU0q0Evx34j0rBSdKDGvAJqLwRoYwxFFG/m8e/WB6Fw/UweGu5XQP/+xkGV4yyORSI20WzQIf8OLEyURnVkp0tKQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MMZPR04MB439479.eurprd04.prod.outlook.com (2603:10a6:190:55::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 14:54:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 14:54:42 +0000
Date: Thu, 24 Sep 2026 09:54:35 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v6 07/23] dmaengine: ste_dma40: Handle runtime PM resume
 errors
Message-ID: <arU5q5UPIdcQyAUv@SMW015318>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
 <20260924-dma40-fixes-v6-7-fdb6755020a2@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-dma40-fixes-v6-7-fdb6755020a2@kernel.org>
X-ClientProxiedBy: PH1PEPF00013307.namprd07.prod.outlook.com
 (2603:10b6:518:1::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MMZPR04MB439479:EE_
X-MS-Office365-Filtering-Correlation-Id: deeb104f-1fa8-4d1f-fd48-08df1a4bc3ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|23010399003|6133799003|22082099003|17002099007|18002099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	QHA9X0RNPwIo7NaVKzMHAqMyKI492wcDQPUupQjYkkNFl3JPIjUMDxDWTMjL4bNRE68s9HDdjduLShTy9KpffirRrjmi9vXPLrHziqyD9pi8kWk25snUWmxLp6Dklnt9Tp6fU9bgrtlZJ+H6nP5bYAVGqeSftOyXMtg0dTb0FH+TQKsUstl6kKl/Oml/J01yYmfwLkPf+blZc5y04S4j9zdng2g+diaoLhz4DN9zz1l031QBQ8qzBucWz4wTnGF/S6WvQf1uEj+qQ78N3VsWNYOoezZfu0rYw7HW1h3/S6jkJxaZ7UutYuH6ukO8dcKFAfJDyCjL6rsWPg8Tc4aBz7JKQxOYrOPx6kKTZJTTvYLZ4MLdypv7V3fy4FEBJGZFmpd54G0xpAQW5kBY2F9ZJpo8xJ6+Gl2wWMxXnfs+CzxcPJtOIBIH6CMXycCj9BwxEn7m4ywOdYowJCndmXQkOzpM7DS+YXbgeb5DIVl02YjnVkF5eDReABE1rizKsZyAmOuFUTxVqGI2T2JHoA7k+wbayxIJriMyTRWERypLKT48z9obvuxEaC+nV911CRjFCzAVE2rSkneKohFYZoY3Fc5m0qieMa+V6fYZmzZb0WtDHfK7WQCmO3mCrbFIiXciyrR4sXZ9NYYHgy6w0m4OaeAAPjjHl88dblU52Xw3LC0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(23010399003)(6133799003)(22082099003)(17002099007)(18002099003)(56012099006)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FYqx8ZDoClF39lx4eHWIKobnIKx6kSFQ1PyxeziRA/h4eX7nK5HqG6glxOZc?=
 =?us-ascii?Q?xU8hBPgHp/q57BDLEujOERIn5W7FGQKR/jfX1J9pUhvBHItrU6cqGo8uVgT3?=
 =?us-ascii?Q?RFKbtdThMEZXq8yipeBkHH5sn730ZAdFTniR6LLuNecJLgn+VfQQPMb0IxQa?=
 =?us-ascii?Q?3HTBYDSD5nMJn+Y7Mhu7PqarqfZWCIGnPEjqOrwA2CKNWDORnMJ48URa8E23?=
 =?us-ascii?Q?xaeLaRFa3+vh12PSlvuykfRkcjnraiyfEFB9JthmaQzP1MUCtH7QRiThG6nw?=
 =?us-ascii?Q?/gTqJs5PY+vG6n1NxpkNmq30lvyY+6Kq5sN87mGD1YXEpzgiXrIeufMBKHTh?=
 =?us-ascii?Q?URGCxLFcoV1NKvtPNFPic2ujtayW7elRDEBQRqi19h3YEOf5fzrny1fB1wJ6?=
 =?us-ascii?Q?k5w1ESff5qsk/OZwCFt6OefliStwU7n7al5J/tz6S2ilL9PbivPjal+21+qa?=
 =?us-ascii?Q?VGIOefGDX9MWXF5y38RCtGpncAPHjGOUervgRKQTZC3lol7nPMRswS6daQG+?=
 =?us-ascii?Q?gFQZUFDIL7DtGd7bEumTqiOOafO1ZiZCgJBKpd3XsmlDeL+wxAG52Z2v/4bB?=
 =?us-ascii?Q?hG9R9SBvCcRv3WiAJ2eXRSHNHic1Ni+uCZ5NigniOxunIUf4EgLRAayYDzXj?=
 =?us-ascii?Q?AhNg6cLc7zO+L5YAgcaZFvmcASxRfrj2fzQdoHwn53hm7zU98XEVHiLiLEIr?=
 =?us-ascii?Q?B/YxkWvFL4zV+97Km21vWicAdZ55bzB4nx8b+SjadPe+ecu1wgBx3weASk+3?=
 =?us-ascii?Q?88zngyOBBEj7PxdM9jIzn/qJOX/VBxgtlBxWy53HAkJTLvt5vLBIXcwj8XRi?=
 =?us-ascii?Q?3KWsdeHefPfAJoVf2VmncZwlwf9eT71zrYLAHEhAU8x1DIlN0f6VYhbOWsmI?=
 =?us-ascii?Q?D0CW5vumGbFj2BYiy2Q/FGukUOm04ZTg+WKjQsFzLScWPrsLLiHumlSyyidy?=
 =?us-ascii?Q?6k5C2WLPRrwTIau3w4h80wsF2XpNces4Jphm4RsXVjkxZA4x5HcDFZ7uG1g6?=
 =?us-ascii?Q?MGhJWaFpmLyLAGkk1GxsKW934RQYTtRvmnp4qb6Fs6cyikeFWN4QIo1To8dv?=
 =?us-ascii?Q?TGFnYS54uOZGERYSEwkIEHy6IruBt5/RdLPAqoAHDPC+KK146LEls/1zt6FH?=
 =?us-ascii?Q?h13oI+oNr9tei7QR2vuPr4IXafhPqHRzbTyrUMczV/se4tnG0YExAXMesfkl?=
 =?us-ascii?Q?aHt9rSmTrZnXGimqImKDCe8cgN3k9g8kaAvcIxXtRsADL5tBpA3r2L+WrvM8?=
 =?us-ascii?Q?iud44lWI2LHm3VZbDI4Rq9xoAjE4DxXenCAKK3H9zmFEtPyn444ofvsQs71/?=
 =?us-ascii?Q?4adCYYLYBzdvqX3aYFGZg9YxXrkcNOpSvKOWhbK16qnGxu4R8YXbu8DYGjeE?=
 =?us-ascii?Q?1BkRkrksjNfqw0U2AT5wEPCWSKFWnP5Z7XbWzFCOZ+DIHjg7X0pUUI11R9VX?=
 =?us-ascii?Q?IyDYR5+ZedIh9u4jnYY/XRofVuXy6Z82cdkPGjU9DrGNPuf1s8JRGpWojOel?=
 =?us-ascii?Q?IIx73Zq13PCNwLdHEemU66wpPqRDkRhBZb2rq14st7B3k9+fmU608vVztCLo?=
 =?us-ascii?Q?nAw1q3WNVT5GSlfmB3MorVN4we69UctxbBBjI/ydkc+M68w3uWERhzv2YSsL?=
 =?us-ascii?Q?nNIo07oA+FVPZvuXi8O65GYfs60fhK/XLsC5Jxkbk8Ft3lDdWpqQP4ZD69i0?=
 =?us-ascii?Q?mme3PPvbybeR9p3hKJEFyeJLBsFNzYpsq9CYBtU35y4MAYLHd9YC475++LDI?=
 =?us-ascii?Q?n5ThPGbJtdmOMrXljftkGJjdacovM4srKC0wF+GpEjaf42b+YBw8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deeb104f-1fa8-4d1f-fd48-08df1a4bc3ad
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 14:54:42.0696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yBer0wmoj+1QEdigetL+KYBNe8B9kz64IEO6vCJqVZxpvDfTI3cEIn5k4pUexwaxtwYYfBrWcNJlxNG2A0f980qh58oduR5wDyPu+gTiCvrqDauq8+fUtm+6xh4t6kiu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB439479

On Thu, Sep 24, 2026 at 10:35:19AM +0200, Linus Walleij wrote:
> Several channel operations use pm_runtime_get_sync() and access DMA40
> registers without checking whether runtime resume succeeded. If resume
> fails, the registers may be inaccessible. pm_runtime_get_sync() also
> increments the usage counter on failure, making error unwinding easy to
> unbalance.
>
> Use pm_runtime_resume_and_get() and avoid register access when resume
> fails. Acquire the runtime PM reference before allocating a channel so
> failure needs no channel-allocation rollback.
>
> If a queued transfer cannot be started because resume failed, retire all
> issued descriptors through the normal tasklet path. Since
> dma_async_issue_pending() cannot return an error, leaving them queued would
> make clients wait indefinitely for callbacks.
>
> Termination and channel release must also clean up software state when the
> controller cannot resume. d40_term_all() only releases descriptor state and
> does not access DMA40 registers, so it remains unconditional.
>
> Balance each transient runtime PM reference in its successful acquisition
> block, without bookkeeping flags. Release the outstanding busy reference
> and channel allocation state when freeing a channel. Skip only the hardware
> stop that requires register access.
>
> Fixes: 7fb3e75e1833 ("dmaengine/ste_dma40: support pm in dma40")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ste_dma40.c | 74 ++++++++++++++++++++++++++++++++++---------------
>  1 file changed, 52 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 690e41ca40f0..712719f0c4cf 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -1579,11 +1579,14 @@ static int d40_pause(struct dma_chan *chan)
>  		return 0;
>
>  	spin_lock_irqsave(&d40c->lock, flags);
> -	pm_runtime_get_sync(d40c->base->dev);
> +	res = pm_runtime_resume_and_get(d40c->base->dev);
> +	if (res < 0)
> +		goto unlock;
>
>  	res = d40_channel_execute_command(d40c, D40_DMA_SUSPEND_REQ);
>
>  	pm_runtime_put_autosuspend(d40c->base->dev);
> + unlock:
>  	spin_unlock_irqrestore(&d40c->lock, flags);
>  	return res;
>  }
> @@ -1603,13 +1606,16 @@ static int d40_resume(struct dma_chan *chan)
>  		return 0;
>
>  	spin_lock_irqsave(&d40c->lock, flags);
> -	pm_runtime_get_sync(d40c->base->dev);
> +	res = pm_runtime_resume_and_get(d40c->base->dev);
> +	if (res < 0)
> +		goto unlock;
>
>  	/* If bytes left to transfer or linked tx resume job */
>  	if (d40_residue(d40c) || d40_tx_is_linked(d40c))
>  		res = d40_channel_execute_command(d40c, D40_DMA_RUN);
>
>  	pm_runtime_put_autosuspend(d40c->base->dev);
> + unlock:
>  	spin_unlock_irqrestore(&d40c->lock, flags);
>  	return res;
>  }
> @@ -1646,8 +1652,20 @@ static struct d40_desc *d40_queue_start(struct d40_chan *d40c)
>
>  	if (d40d != NULL) {
>  		if (!d40c->busy) {
> +			err = pm_runtime_resume_and_get(d40c->base->dev);
> +			if (err < 0) {
> +				chan_err(d40c, "Failed to resume DMA: %d\n",
> +					 err);
> +				do {
> +					d40_desc_remove(d40d);
> +					d40_desc_done(d40c, d40d);
> +					d40c->pending_tx++;
> +					d40d = d40_first_queued(d40c);
> +				} while (d40d);
> +				tasklet_schedule(&d40c->tasklet);
> +				return ERR_PTR(err);
> +			}
>  			d40c->busy = true;
> -			pm_runtime_get_sync(d40c->base->dev);
>  		}
>
>  		/* Remove from queue */
> @@ -2164,9 +2182,6 @@ static int d40_free_dma(struct d40_chan *d40c)
>  	struct d40_phy_res *phy = d40c->phy_chan;
>  	bool is_src;
>
> -	/* Terminate all queued and active transfers */
> -	d40_term_all(d40c);
> -
>  	if (phy == NULL) {
>  		chan_err(d40c, "phy == null\n");
>  		return -EINVAL;
> @@ -2188,11 +2203,18 @@ static int d40_free_dma(struct d40_chan *d40c)
>  		return -EINVAL;
>  	}
>
> -	pm_runtime_get_sync(d40c->base->dev);
> -	res = d40_channel_execute_command(d40c, D40_DMA_STOP);
> -	if (res) {
> -		chan_err(d40c, "stop failed\n");
> -		goto mark_last_busy;
> +	/* Release descriptor state; this does not access DMA40 registers. */
> +	d40_term_all(d40c);
> +
> +	res = pm_runtime_resume_and_get(d40c->base->dev);
> +	if (res >= 0) {
> +		res = d40_channel_execute_command(d40c, D40_DMA_STOP);
> +		if (res)
> +			chan_err(d40c, "stop failed\n");
> +
> +		pm_runtime_put_autosuspend(d40c->base->dev);
> +		if (res)
> +			return res;
>  	}
>
>  	d40_alloc_mask_free(phy, is_src, chan_is_logical(d40c) ? event : 0);
> @@ -2208,8 +2230,6 @@ static int d40_free_dma(struct d40_chan *d40c)
>  	d40c->busy = false;
>  	d40c->phy_chan = NULL;
>  	d40c->configured = false;
> - mark_last_busy:
> -	pm_runtime_put_autosuspend(d40c->base->dev);
>  	return res;
>  }
>
> @@ -2584,10 +2604,14 @@ static int d40_alloc_chan_resources(struct dma_chan *chan)
>  		err = d40_config_memcpy(d40c);
>  		if (err) {
>  			chan_err(d40c, "Failed to configure memcpy channel\n");
> -			goto mark_last_busy;
> +			goto unlock;
>  		}
>  	}
>
> +	err = pm_runtime_resume_and_get(d40c->base->dev);
> +	if (err < 0)
> +		goto unlock;
> +
>  	err = d40_allocate_channel(d40c, &is_free_phy);
>  	if (err) {
>  		chan_err(d40c, "Failed to allocate channel\n");
> @@ -2595,8 +2619,6 @@ static int d40_alloc_chan_resources(struct dma_chan *chan)
>  		goto mark_last_busy;
>  	}
>
> -	pm_runtime_get_sync(d40c->base->dev);
> -
>  	d40_set_prio_realtime(d40c);
>
>  	if (chan_is_logical(d40c)) {
> @@ -2628,6 +2650,7 @@ static int d40_alloc_chan_resources(struct dma_chan *chan)
>  		d40_config_write(d40c);
>   mark_last_busy:
>  	pm_runtime_put_autosuspend(d40c->base->dev);
> + unlock:
>  	spin_unlock_irqrestore(&d40c->lock, flags);
>  	return err;
>  }
> @@ -2788,19 +2811,26 @@ static int d40_terminate_all(struct dma_chan *chan)
>
>  	spin_lock_irqsave(&d40c->lock, flags);
>
> -	pm_runtime_get_sync(d40c->base->dev);
> -	ret = d40_channel_execute_command(d40c, D40_DMA_STOP);
> -	if (ret)
> -		chan_err(d40c, "Failed to stop channel\n");
> +	ret = pm_runtime_resume_and_get(d40c->base->dev);
> +	if (ret >= 0) {
> +		ret = d40_channel_execute_command(d40c, D40_DMA_STOP);
> +		if (ret)
> +			chan_err(d40c, "Failed to stop channel\n");
> +
> +		pm_runtime_put_autosuspend(d40c->base->dev);
> +	}
>
> +	/*
> +	 * Always release software state, even when the controller cannot
> +	 * resume. d40_term_all() does not access DMA40 registers.
> +	 */
>  	d40_term_all(d40c);
> -	pm_runtime_put_autosuspend(d40c->base->dev);
>  	if (d40c->busy)
>  		pm_runtime_put_autosuspend(d40c->base->dev);
>  	d40c->busy = false;
>
>  	spin_unlock_irqrestore(&d40c->lock, flags);
> -	return 0;
> +	return ret;
>  }
>
>  static int
>
> --
> 2.55.0
>
