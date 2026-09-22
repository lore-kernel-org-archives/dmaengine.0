Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013058.outbound.protection.outlook.com [40.107.162.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179544A3407;
	Tue, 22 Sep 2026 19:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790104997; cv=fail; b=YWdckjKbR6NGH4WKLj+RlvodTWkLOa/RYuN6LdB+ucyWm9lYl/fWceCGOyJaC/GekaxWhmdvpIFwEHdWrT0aXNQ0VgIYwJPI0+Ol1IL0/0NHwiCf11mS6naGtx85auKLq8bCeE9VLsfYhSqb/R927pdrNQOpgiwr2tKGTnttk7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790104997; c=relaxed/simple;
	bh=3suay3i2pzM1G+FO3GfplyH5XQhGFaTk/GpQNMiQNhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pIb6QGh7Iv0dyhMbN9MIIk52hzwHa3Xy4QFPxTxasd4x3ZJX0FafJQ39wkA6gMhH5MtKx2Fu7gAVzWiwYXPnnjb7ig9CyUQMZwSWxSdfDxZi+8V04XAxzPWIXkTE+/w3Ywz1O2H5pdGlFp5Wy8TV31c3SIXCvRpUfIHcTzUVUxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ijoiY+gB; arc=fail smtp.client-ip=40.107.162.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ijoiY+gB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZPknJsHQgWJNU5SFC1PkYpK/suEWEaVNLUfgHKo5oYs1+snt3Q5lKXlitSowQfEf1QJju9pdWnhMyCAxC2awIPTUM3FEC6lCJzR+z39MndMX598iRAAr/MDsDACymJ5UPGCdEnwLGGhXrcgf4PThmLDBO6FIMOp3B8uyz5imEnNJ/6hOXvsfF3+IgFLtayGda3eLEzdqZkrzfe2NF/ixPkHJFRTocCKmRogQ1Lzx0Wrev4PnyCvTnOBfQ3bHXEZEntVxNBr8k/4n4U/YHMOuuB4HNfnfCt8vjqUNwWXDkVpSFmPaypoMXGyFR82Rnjf0qeI/hlOfXSkHL/Yz8UZ9KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/k7Bk+bcPkN0t11gYvYBaRskMdFs8GM99q02iMLXzo=;
 b=ZX2yhIqVFTTYOHpumo3ddnAvw4fV20GvQ35nS10zaHmQy1pB5wDAE6ix3VgBv7+ViOu8SYFv1LojO2mvMvKIWRF9e96mkwZE++/ZO8QboyTnZUhNmRvLytYfViunLIOTVffeI1PGOdXJzqn/VzY6o1DpojdVFbETOoPNnwV7M7erO4sMhEwKg6ksc0Soe9TvMM/NBOv/0ISONXCgcxtFRPqT2ZBEH6XjDEECW/4kfiLpHjCRjnPRO/lSrD+0s2lfwFeym9fHTaLVbo9Xep/QBLivk9Y7Avob4SoaTfju0qXequDlgVH3UF6m7H9F9OiaKPAceX6iymHE0mEiQdAnSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/k7Bk+bcPkN0t11gYvYBaRskMdFs8GM99q02iMLXzo=;
 b=ijoiY+gBmdMBtxqmCx4mVdsXgtwfOu64p9Ly82B+tkemUBKePIm/cf5PG9f6s4wFlDuwUDn04iTLvymwakgqsyyRd+U0davF+rqVll+qOkGMA17y9Bsid5wqYCbKcKe2nL5GvA7MaIdFLU3w/P8wixTmKrGgIBeXuKhJtKsPklTUMiU62gQRGAcnE2ZjVLQJiONe3r34k2vf3/n5amGEc5FI2P96yMU1HlF7gAflL4RbmdecsvE5GMi40Y+rG00CBcmvBl5R/3BJ8pI4fjiGlOzjQJTecg4xaaNIyEtbXGbrKbWm3G9nuTvkrjPUYZd2kn/tm9DLQx9GYOuIYwRINg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB7700.eurprd04.prod.outlook.com (2603:10a6:20b:2db::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 19:23:12 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 19:23:11 +0000
Date: Tue, 22 Sep 2026 14:23:03 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v5 07/23] dmaengine: ste_dma40: Handle runtime PM resume
 errors
Message-ID: <arLVl9lFO2wDEt6Q@SMW015318>
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
 <20260920-dma40-fixes-v5-7-5c55cd7f92f9@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920-dma40-fixes-v5-7-5c55cd7f92f9@kernel.org>
X-ClientProxiedBy: CY5P221CA0147.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:930:6a::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB7700:EE_
X-MS-Office365-Filtering-Correlation-Id: 72dea97a-b513-46df-9603-08df18def0f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|19092799006|1800799024|376014|10067099003|6133799003|18002099003|17002099007|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ttbucS1cbWUDIC9Iw4H1ZREvrlFvQCw25p3mCvUgLaajBfDPlNhEs9kCRDSX4k0PTH0znnRNlibyDDKBH2Ze4QvV0ttdFH5t2IPKTeR3NoJU1/J1zs3tX82B9SBJBAyPN8P8nkw85f1Wziy9ggw1/sJCqBX+5sIgMTKdouK15DkgQ+GZPSw3CJQ0NFDaTMM+IG9a/taWM+0H5bjywqHkY0HlJg6mC0Gza0/sNhB8y4zYgpHtitsQFYaDfzKt+x18owhVOxzl/girT/b5IAmfNE6dgc70YFQBIk2T0gPSr7wOsgEH5gLGJAPVoG09p56fAqWBR7HEsf2/qlS/MS+yUC9qBg0C2CHaWeuaFp2MxaGnaNT2UJ8EX9UYi53s15TxdJHDMs72jGpTtaHzK1ckeAQureEAze04M0OzthK6BNr/ZDYTqkmOefDW/EY/zLQpFLmGLLWY7t8rAyEu4AEa5iKGlRjI7zrmPINAZrDu4B6BmOacrpom3ehVZky/oTFOtzlWOr3qMfcWme6sHbs+SfjkNbMNz+4TmZNZbDesk7xCygQnI+sG7hqqE7C7K4gnla7m4ETBFQIsCyJFRWw+sAI9F795Cw1WYTZ/TlwQhn7Stg3Lb+/fYYUj/wvtE+h3A9u5mr37p6pUzH0SJXl86nY+evJETa/K9HAuFY9VKWY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(1800799024)(376014)(10067099003)(6133799003)(18002099003)(17002099007)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1udnBMaqKSDJsVN0KffrJ+ouhQzw3z514xkLKQCXEcNj8q2HfO7tCRpOziBO?=
 =?us-ascii?Q?rPRySbOGzWr4LPqQVGHjqHKA5b8p7IPgZJvXbg7RNZ1A8JtRMjav3wRe0P4x?=
 =?us-ascii?Q?DcjCdtsj5+hlygwW0fmqw/k5cWst8MPOiL0a4qwnkNxMldkQP3GI+H7uoN9c?=
 =?us-ascii?Q?gWJaitG5tOivKepGwog/em0wravPvgUqiQZQhxm/83dXnsSH7hrMPvXcRx5Y?=
 =?us-ascii?Q?4ZUof/CR5R/nXEk9nO5271OvsRVG6wfn1UwehCoguJNu60ZuCWV9XnQFe8pa?=
 =?us-ascii?Q?NnrUk5LoXj+BitG9gB38T0WI+r/FUJmfsYPvgj9KNDhY9H9lgghY4E2fa2y6?=
 =?us-ascii?Q?2xOAqJS2axejyebWA8Kj1qLII3QfnI2cALzWpeWhFQ+xPBtnVd3QRD6gtJRM?=
 =?us-ascii?Q?4jr5UvoUDebijuWb9c6Ff+mDX/KXMOmBHapBSzIGwQ3BsxsQ3UlabcqF1e2i?=
 =?us-ascii?Q?9WcHIGiaoHkE1KxN0h+AH1iKP+E8gBuQMVp2iszo9KRMYEz9cnxiutvu6RRJ?=
 =?us-ascii?Q?bat6+tgGWL6SGQ3SMiDPgBXoNcGeAqn7sZPUURkRknZXvtuAAgwm3RVPOCE9?=
 =?us-ascii?Q?8Qy+CC3phdog9WPfsFRoJd3HEJKeWKGfjE8sNCwYXsKOgIpTfJ49hP+tFEwm?=
 =?us-ascii?Q?gzUlGMHoyyy25wkmXxqJZnWpNMBXIIlEnd2SJ5hV1glGQ2iHO2h5lNUSDcY3?=
 =?us-ascii?Q?4odLJBWMYF6ttrv1OvdFRbIs06mh4avSOdZLMJfkK0GPmIJgvU8AQRFNPch7?=
 =?us-ascii?Q?vo6DMeLXmzi90ol7FfwmoojkvP1jMMtrOgnUDlJ+1q8mylWnB1vlnCM03rwc?=
 =?us-ascii?Q?x0d1FynPqo6/LNKGfIjlvTojCtkHxpVNP3fVogig+LQd2iZNwxvdY1VKTokQ?=
 =?us-ascii?Q?dy8yCdh/dvOV0jX9eVV+cQHuxfAyNCHv158GbNfTe5bIyNvdjfhEh7nS//7D?=
 =?us-ascii?Q?XvISFJ48q0rYYuPUJD80E4sIk/WA30fOdB1xuXjTdkDv3Sjgu1X6AjkBGAUd?=
 =?us-ascii?Q?zOEqTE81tIp+K7kssAGh0VVhGOhd/xK06X79ewQgIrqw18QZnByV3yHeZrst?=
 =?us-ascii?Q?NRHixfBkOi4mt1v8NjUv8Wmh+uyo4GOah1Mirs1wUcqaG9XeiYW5jDxJeTHm?=
 =?us-ascii?Q?BcLQcrtqEW0DloKcH4+XfS6BnnDTe+0IBVfdHw2YXiL41Y9DyJirxIj9ggqF?=
 =?us-ascii?Q?gPaU0marhznu+SDU3W4ktb+2KCyuybCzLkihyJYWVQIbFIyZJrNrmzcGELBe?=
 =?us-ascii?Q?slmrWhl2J/0IzX4R7KZiQG+VR49PDqgs4qJImy/jwA63DBdTuyNvt5NrUre7?=
 =?us-ascii?Q?cBd8VeETe1ztWYkXy3a3tPwHSnxP2NOpXW7b50VQ/CBU/j5ESeZWlq69RUke?=
 =?us-ascii?Q?C5noNdt/W1amPXMLTA4kAWJNiniu8vvnVpUqm2iiPU703R8+4CVQ2GHSRSCt?=
 =?us-ascii?Q?n8kBi49lb4k9zl32Ey5YkcjMQImnE8hHjuKYDdfc2WYrF9uzxwnZuaTpMC/b?=
 =?us-ascii?Q?DJmlmTfUOr4/g1dfCsHyseaqdLoPz3DpKoNMnz6eJ9QMMVUYd7Avz6HXLPpu?=
 =?us-ascii?Q?LQC6VJKySS1aVhB32jDwpqFSo0hPHmoVaCQKYlXevTbbWpEH0oDHnR7GodDe?=
 =?us-ascii?Q?BQONnKPNBJKpl6hem0NUYmnZBIV1SF04MPo1/ZUp7ONX6yRs0XauWYxNVWEo?=
 =?us-ascii?Q?P0IQpIuKaU5HkCA4IWHG+0Xigvxr0yIwewIyfz4OUxXZkvLsvGY71kGO7G1k?=
 =?us-ascii?Q?YoYvKD8oUmklY4nBP/2XH2odxb8jBHkNMBi5p/kPSn2v4Ocd7oE7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72dea97a-b513-46df-9603-08df18def0f3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 19:23:11.7816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BIR+QGnmQLx1mLWhu7adQeDjRzptdvheANhlDHVrJl3kYHNuhXm4yv4WuE9qXqd3cUWtj5Ssmqj9KZtJGprPmt8nXtebrIMIHD3JabCHNArJD5YyDmY/LGX19KzhqBeE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7700

On Sun, Sep 20, 2026 at 08:59:42PM +0200, Linus Walleij wrote:
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
> controller cannot resume. Always release descriptors and the outstanding
> busy reference, and release channel allocation state when freeing the
> channel. Skip only the hardware stop that requires register access.
>
> Fixes: 7fb3e75e1833 ("dmaengine/ste_dma40: support pm in dma40")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  drivers/dma/ste_dma40.c | 67 ++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 50 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 58128a980847..bb052d3028cc 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -1567,11 +1567,14 @@ static int d40_pause(struct dma_chan *chan)
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
> @@ -1591,13 +1594,16 @@ static int d40_resume(struct dma_chan *chan)
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
> @@ -1634,8 +1640,20 @@ static struct d40_desc *d40_queue_start(struct d40_chan *d40c)
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
> @@ -2150,11 +2168,9 @@ static int d40_free_dma(struct d40_chan *d40c)
>  	int res = 0;
>  	u32 event = D40_TYPE_TO_EVENT(d40c->dma_cfg.dev_type);
>  	struct d40_phy_res *phy = d40c->phy_chan;
> +	bool pm_acquired = false;
>  	bool is_src;
>
> -	/* Terminate all queued and active transfers */
> -	d40_term_all(d40c);
> -
>  	if (phy == NULL) {
>  		chan_err(d40c, "phy == null\n");
>  		return -EINVAL;
> @@ -2176,13 +2192,21 @@ static int d40_free_dma(struct d40_chan *d40c)
>  		return -EINVAL;
>  	}
>
> -	pm_runtime_get_sync(d40c->base->dev);
> +	/* Terminate all queued and active transfers */
> +	d40_term_all(d40c);
> +
> +	res = pm_runtime_resume_and_get(d40c->base->dev);
> +	if (res < 0)
> +		goto release_channel;
> +	pm_acquired = true;
> +
>  	res = d40_channel_execute_command(d40c, D40_DMA_STOP);
>  	if (res) {
>  		chan_err(d40c, "stop failed\n");
>  		goto mark_last_busy;
>  	}
>
> + release_channel:
>  	d40_alloc_mask_free(phy, is_src, chan_is_logical(d40c) ? event : 0);
>
>  	if (chan_is_logical(d40c))
> @@ -2197,7 +2221,8 @@ static int d40_free_dma(struct d40_chan *d40c)
>  	d40c->phy_chan = NULL;
>  	d40c->configured = false;
>   mark_last_busy:
> -	pm_runtime_put_autosuspend(d40c->base->dev);
> +	if (pm_acquired)
> +		pm_runtime_put_autosuspend(d40c->base->dev);
>  	return res;
>  }
>
> @@ -2572,10 +2597,14 @@ static int d40_alloc_chan_resources(struct dma_chan *chan)
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
> @@ -2583,8 +2612,6 @@ static int d40_alloc_chan_resources(struct dma_chan *chan)
>  		goto mark_last_busy;
>  	}
>
> -	pm_runtime_get_sync(d40c->base->dev);
> -
>  	d40_set_prio_realtime(d40c);
>
>  	if (chan_is_logical(d40c)) {
> @@ -2616,6 +2643,7 @@ static int d40_alloc_chan_resources(struct dma_chan *chan)
>  		d40_config_write(d40c);
>   mark_last_busy:
>  	pm_runtime_put_autosuspend(d40c->base->dev);
> + unlock:
>  	spin_unlock_irqrestore(&d40c->lock, flags);
>  	return err;
>  }
> @@ -2767,6 +2795,7 @@ static int d40_terminate_all(struct dma_chan *chan)
>  {
>  	unsigned long flags;
>  	struct d40_chan *d40c = container_of(chan, struct d40_chan, chan);
> +	bool pm_acquired = false;
>  	int ret;
>
>  	if (d40c->phy_chan == NULL) {
> @@ -2776,19 +2805,23 @@ static int d40_terminate_all(struct dma_chan *chan)
>
>  	spin_lock_irqsave(&d40c->lock, flags);
>
> -	pm_runtime_get_sync(d40c->base->dev);
> -	ret = d40_channel_execute_command(d40c, D40_DMA_STOP);
> -	if (ret)
> -		chan_err(d40c, "Failed to stop channel\n");
> +	ret = pm_runtime_resume_and_get(d40c->base->dev);
> +	if (ret >= 0) {
> +		pm_acquired = true;
> +		ret = d40_channel_execute_command(d40c, D40_DMA_STOP);
> +		if (ret)
> +			chan_err(d40c, "Failed to stop channel\n");
> +	}
>
>  	d40_term_all(d40c);
> -	pm_runtime_put_autosuspend(d40c->base->dev);
> +	if (pm_acquired)
> +		pm_runtime_put_autosuspend(d40c->base->dev);
>  	if (d40c->busy)
>  		pm_runtime_put_autosuspend(d40c->base->dev);
>  	d40c->busy = false;
>
>  	spin_unlock_irqrestore(&d40c->lock, flags);
> -	return 0;
> +	return ret;

pm_acquired is not necesary

	ret = pm_runtime_resume_and_get(d40c->base->dev);
	if (ret >= ) {
		ret = d40_channel_execute_command(d40c, D40_DMA_STOP);
		if (ret)
			...
		pm_runtime_put_autosuspend(d40c->base->dev);
	}

	d40_term_all(d40c); /* In your patch, d40_term_all(d40c) can be call
without acquire runtime pm
	...


Frank


>  }
>
>  static int
>
> --
> 2.55.0
>
