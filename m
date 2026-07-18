Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013029.outbound.protection.outlook.com [52.101.72.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEC71F5825;
	Sat, 18 Jul 2026 14:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784384128; cv=fail; b=IADWiKh35G9ov8VTrlxFztnHA+8ZAIur15Pb2KbNwaxGEUNQ5dz54evmjcI4zizJAhIc4z+E1BR6hXUAM4WU4uFn7odSru7ov1fN9gkTubybBG6oC5I/+n04pFQWqZXO+2VqTPH8WNsql0TlFfO3U+zvdQe3OJfzFi31detp/Us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784384128; c=relaxed/simple;
	bh=FDXTQ5Yt6gifeJwNfIPnQIg9ikipXic7WXN5aZvCuIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XQGQEvzKDMcHqbPqcHU/pFKL7WQgrdD6aTdXTkVTsAo37/71SJq/oTgWe2sllSHKipJNUd3g/OqMnZaU/PITvK28j8eAZ3KG30bwpFOElyNqhhmAfUVGVBGJKdCF5vxUVqypvgviLRHV2Rw5E/UBfR6rYcPgSAzVLD+rc4Dqwl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iJRcdPXX; arc=fail smtp.client-ip=52.101.72.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iJRcdPXX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nALxq54ymezxl1Ymjw3+IkIVHpJ35Co5VrIcAUvjMAM2uOVVnTqDiO4QuIfwSChIAtmhXvdlJYsMgkYjX1ey2Qijp5csGIPfVjP27CL3m34mPjP/kBkfQ1OEFACHM7q+3uuiqpZ4GeeJT7zjJgJNyEf4lOU1OVYqfnLWx+JVS+7RaY9gaK0OCw072Rc7PIkZ/ZPHa32NfDu5qTaCBzho/VjwRclEuNffDrtK6jJIBSEo0NZRlsfhgyL1BnDAJ0UoTZ5zrte6LkWwb8KGo+/moNutM92IWeNHqDBfABa+I35tmg/XC606Up4JgAEfEDOJF7xP8RoB9QGp5bRcvKQKDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynMIuClNjJcokb+LuboPec8IkvOadFUUDDHR/n4seqE=;
 b=GBOUMynxPvdsOjUksDOJAm/9n/vxjEURvH6yVUUlnolXTW44kjXS8VIsP0pZcjg8kbsNL7Vah18ub2p8txku2BZ92q5fYf3sRmmYAAuQ3sTm5e+BEBlC6h+7VSfIUNngI+79EqIlucn5KWMjaLMdJV7bjeX70pvFu2l0TZZH7e6sZ3Gqwnj3LloKeEqK04qNXyzmMfyYnACVwdud5ixYtSyYVtY3iHmG1Do6FtEORDKye5cIVj3KANleQEva7nnO2HeTxTpe6l7If9cOUBzlZz45FoTtzgCQRtmqZRje1mR81275BEyM+DBjFd3VbKaRi/Rl/39aF1pODTILiy5Jfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynMIuClNjJcokb+LuboPec8IkvOadFUUDDHR/n4seqE=;
 b=iJRcdPXXH5C/6zupw9ygJNUNiXWHTyYtnBWL3YGvz6JgqEZ+D/1PkY99ZhmRY4OVrkkp+5jsja2wsMOqxFzUnZ6HoZr37QFxwdvDQ0BClFjmJyvqVetsfV9jFaBPPRxiRfHRVYP/Ku+OzLaOCyoMHl2k2cvCEjTpL6ZIQMVusM85d84HwCnGppwOwmRNyZ7IqVGFtOvw6UtrzSN64VBJX2Sac95lhLzTnckjNradvcdmU1VissZL6S4WJHxnFVFTpdXmT1miiNAWzK+SqyEEmEw53OtQ6/tVkY4DPkLr+roQfzoN07LCMkAGkTlh4c5w5lJvVjrGUFqZvlRG4He/jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MIYPR04MB12598.eurprd04.prod.outlook.com (2603:10a6:290:78::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Sat, 18 Jul
 2026 14:15:25 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.012; Sat, 18 Jul 2026
 14:15:25 +0000
Date: Sat, 18 Jul 2026 09:15:14 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Harninder Rai <harninder.rai@freescale.com>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: fsl_raid: don't invoke client callback under
 desc_lock
Message-ID: <aluKcpx7fLxKg0Rd@SMW015318>
References: <20260718053010.3074329-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718053010.3074329-1-rosenp@gmail.com>
X-ClientProxiedBy: PH7PR17CA0009.namprd17.prod.outlook.com
 (2603:10b6:510:324::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MIYPR04MB12598:EE_
X-MS-Office365-Filtering-Correlation-Id: fd76c3b5-aa52-4609-e953-08dee4d702ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|23010399003|1800799024|366016|6133799003|5023799004|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	THpjVQcsbiswENJuA6gGamkWjNE0Mq+lsoRSM4YLNh6M2IDr+fUPkTinj6Zegf6kwJ2YZLIGLwUu5peveACho8lHkvcldav6YWMaeHcl2nTqJGz5KRx9QOkXKT/J6tqacXaafyqnRp3Cyc2D1JtsYIzo/DQxGA1vNKZMAWxwIxpy6bzqjDHPg9xyVUn4plFSgigtUSGduMDSnMxQoYugbYPuWYmWULKa+t4nqerC5qMKrPByPoQfWgudNdtXR1DmN1IdW3aXEWRuYA9H1vES9ZNiPbWYLcr4JtLs4PRaPINoPLpbzwPV5skVzOC+3FEZ2GYhT19IX4oaLYpTBIyyL9YVi6dJh7RChtcPghDGWpvSpnlcm2w+NxJZgBGq1sRnxcFURCMX1qfpXTiwt4jaZPpWGL6JJ8K8pjXTH7WIf/xaKIASZhWWqnxm9G+6Z2cQr22yLIEt66lVic2z5yJc/R1xBXzJD+moDIFHIU6l2iympytd5+5r3Sc8vj2G0v3HPgl+JOSqIGca3mnlOsYVzd8VI0yrQUq4UaIKqczIj+paItuoEdDTPaRjbuAthlhP3o3B3QIc1S7O1YzGCCe68Wb3GUdsrzeGO9jAcMyZKc3Cej7/rRroTREJvO2OYq0foBEEyTUsm0lgIE2HTGYy94TeDPLDGpR/lhr8fOFx/dw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(23010399003)(1800799024)(366016)(6133799003)(5023799004)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BKNtLFxnhS26RQV2p65rBvGkBOXiv101RD+0988D58RNAFnmP76hTXu6gHBk?=
 =?us-ascii?Q?ZbM/6wejgJg7e3F1xvAQWcIcZdO4RZCRh8CuQXNOZLSbBfo3IhpsuzLte/6t?=
 =?us-ascii?Q?KC4RkBKssQbCGmmwcteTWP/v+mF6bT6D05e1AEI99N37ecDVhB5xOtlVS5yG?=
 =?us-ascii?Q?pmU5M2tRXHVHFLe/UKOdM+DP6tA4diyE+3KCyGm2vS8pcXEaq9Vo/Gusd2BH?=
 =?us-ascii?Q?Bljpanfz6GsOJBGlCs1TGeU3Xw3D9nFfUaTjmhm9F05lBJWby5EEx3sMl3HI?=
 =?us-ascii?Q?kVq1UGWxnqf0dPXOF/dLmooOEEZu9CFcT7vgvB/s+an/6hH+knJj+/MyrQj5?=
 =?us-ascii?Q?VlW+wPnl22VqRvWZCKgrMXRSZ0L3V/eo1gIJCdvcS92qDFikEdMpMfo5xum2?=
 =?us-ascii?Q?Rt7DAiL1ImLJXlgjXhC6gkEalU6of0EAmEe6vevawkjNY+KIdlJfCWk+8wSr?=
 =?us-ascii?Q?OkdyN5I+HGeK+a7JN+AK9nX4IK/ylqM4IqriuVJLPNlItlm4up7yxm4PXFIc?=
 =?us-ascii?Q?GlAphuDCr5PmRVmfWeWMlTricdElAoHJ6nglpih7Fv0qAvtXxd3UcnqVoNJU?=
 =?us-ascii?Q?ctsyzq8OQWjiXqv2R05vIaF2zy/uJmqQlSChJu9Po0A4UR56mkiZzz+aT9s0?=
 =?us-ascii?Q?4fzQbrWlKFagx0B2iaQcI+/FINygjL3qgS9Lp8RTcqzH7fELv4LDd4TRC71c?=
 =?us-ascii?Q?7wugIveX+zCdlnPAO5VEwQC2ayz6BI8YLszxEGpqOIAWJb5v9v2mrMeD9nce?=
 =?us-ascii?Q?4QDHxf1yzJZYzCnWlVoDcIj33xgk5eCjEoiQyivoxRxBlRCUV5v+NvJyupZY?=
 =?us-ascii?Q?Xd6c/f2JmzZLR84ehowtUj4dm5cRvjECIx+5xlmUEw+xwHLnbUbZXO2wbKsf?=
 =?us-ascii?Q?8BTRbmEjSrkwtivljF4LwNAnvS/CY1WuTsVk0xrL4fnMh72geHgdxj7se9c/?=
 =?us-ascii?Q?ISDarZaQlzx9BnzJsKGQHWxh4VNmFs6w5wmwQZW6MLtMyODPxdRekH7sW6jW?=
 =?us-ascii?Q?ATlo6oijsvs5FnEi4ntaZ6W+2We9Vmcino6s8qXzRlrDYeVuTmKevcqgbhSX?=
 =?us-ascii?Q?UcoTw9yh/zbm/4Ol97wD5Blk2vFaVCOxi9VrOVBJMZmEhDYE1dBdqpLx1xhg?=
 =?us-ascii?Q?woDFMfcEBw7z9kTljOj8u+tIPD6OOhdAZT3FWQ9aA2xZR60v747A7Jb7XVKs?=
 =?us-ascii?Q?OdE4dS0aMLK1Bz2fZF1qAL1gUfFyMhwOwmXyTkoCqC3zWhp91hu7NEaMYA+L?=
 =?us-ascii?Q?1rjXrqGEy3uHymAml0gwV1BP1VGcv6QsV7i+n1CPlmic1/hgxDvaD9ZBglQ2?=
 =?us-ascii?Q?SsFxcNv5sSL8OkodnotJloJUMPXYL0Pwxl/Ke1PDIZ+PisVIe1OEx/d3cWtU?=
 =?us-ascii?Q?aKM4dtgKGvGzdvF4mbdZFBYeK2tFBVHXg3AqnK2rE11oSgZNhfqK4C0t9tWs?=
 =?us-ascii?Q?GB9VcGDbXtnMVyUNrPwj0jlJeUFvVOV3uTXNvDdvN2VdeWYZTkyZ+0Q19swD?=
 =?us-ascii?Q?z7aYoLYQazbKH3GmKMGR+L2rtvdoAvZlgjX5xr6XWMJ1r8icHpMrjNGSwGkJ?=
 =?us-ascii?Q?EAr5iraw7HVrQU3C6DaWJD3DjAm+cUnD+T0f5YzLTgeZWXPxKjdJzSa6Us15?=
 =?us-ascii?Q?eH2Q+em+XOeAViPkWdZHgPEiy45tRyEmFXVW5Rvfy1+xKaB/SDsERC7HzZP+?=
 =?us-ascii?Q?9mnWIuaZWfd2A0nuqNJ8EiYTDGKuvSmMQusUtmJipD5MdxMndvSRSqxdAq0z?=
 =?us-ascii?Q?ILlNmDA8xiYnl6VngG8tE0wK8DFzTPT9n7ogtL71hQzKTtwisg2h?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd76c3b5-aa52-4609-e953-08dee4d702ab
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 14:15:24.9759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JSLMSi0tfWhL/gpAjcXqRwiGV4g1U8nxfWOj/2DGDudFvnpqBEPVROzapmovzIu56gD7ybt4VeztK4Z9LBVPtduNglnMvSt1kqaWLMK3KycbmupCbbOigV+1KS+knJqe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIYPR04MB12598

On Fri, Jul 17, 2026 at 10:30:10PM -0700, Rosen Penev wrote:
> fsl_re_dequeue() holds re_chan->desc_lock while calling
> fsl_re_desc_done(), which synchronously invokes the DMA client completion
> callback via dmaengine_desc_get_callback_invoke(). If that callback
> submits new work (e.g. fsl_re_tx_submit()), it tries to reacquire the
> same desc_lock and deadlocks on the spinlock.
>
> Collect completed descriptors into a local list under the lock, then
> release the lock and invoke the callbacks before moving the descriptors
> to the ack queue.
>
> Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine device.")
> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/fsl_raid.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 2d86f61105e5..bfaef6245695 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -162,6 +162,7 @@ static void fsl_re_dequeue(struct tasklet_struct *t)
>  	struct fsl_re_hw_desc *hwdesc;
>  	unsigned long flags;
>  	unsigned int count, oub_count;
> +	LIST_HEAD(completed);
>  	int found;
>
>  	fsl_re_cleanup_descs(re_chan);
> @@ -182,8 +183,7 @@ static void fsl_re_dequeue(struct tasklet_struct *t)
>  		}
>
>  		if (found) {
> -			fsl_re_desc_done(desc);
> -			list_move_tail(&desc->node, &re_chan->ack_q);
> +			list_move_tail(&desc->node, &completed);
>  		} else {
>  			dev_err(re_chan->dev,
>  				"found hwdesc not in sw queue, discard it\n");
> @@ -196,6 +196,17 @@ static void fsl_re_dequeue(struct tasklet_struct *t)
>  			 FSL_RE_RMVD_JOB(1));
>  	}
>  	spin_unlock_irqrestore(&re_chan->desc_lock, flags);
> +
> +	/* Invoke the client callbacks outside the channel lock. The callback
> +	 * may submit new work which re-acquires desc_lock, so holding it here
> +	 * would deadlock.
> +	 */
> +	list_for_each_entry_safe(desc, _desc, &completed, node) {
> +		fsl_re_desc_done(desc);
> +		spin_lock_irqsave(&re_chan->desc_lock, flags);
> +		list_move_tail(&desc->node, &re_chan->ack_q);
> +		spin_unlock_irqrestore(&re_chan->desc_lock, flags);
> +	}
>  }
>
>  /* Per Job Ring interrupt handler */
> --
> 2.55.0
>
