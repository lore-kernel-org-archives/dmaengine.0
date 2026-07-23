Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011053.outbound.protection.outlook.com [40.107.130.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4837F388E44;
	Thu, 23 Jul 2026 16:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784825869; cv=fail; b=f3khyD07RvPHoXpjw1hfOFi/Jl83L+k5lKhiroX9mqSo87IZrNrCEfruYdZGEdFihkF7hqkqKAK54hGBkkt55jpcXrwpIJgTOk8Tj92eLC1laz/rGgsIFJ6OA7Ngj4IBUlP7kINEtno38HI8qRhsVWSGASePJ2V9+SMJJBxH/o0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784825869; c=relaxed/simple;
	bh=XyWbs2Xa3bXQiyX4aAOTB2ERr5uZBJL5eQnVdTHexZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UWxKumj1RRAE8jRlz8p6iqYvx4nMVOaW3CPFieeYzK6wNtJwOxRpIpU8Mb55T+8l8bmu1gEc1uXYT3S3nFjjqp70vYmsIHm9n8ppRa7CTrtUUWIDKrImjdGYnRgYmCu4ju0UDPSblqiu831dP9akwwbQwVYob515APT6cJeTtTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=K2LWpGjm; arc=fail smtp.client-ip=40.107.130.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="K2LWpGjm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ewRd1IJUTKlTm8kdnI8an3AEzmGYtNMjWfHqxEvaZl2SakpJ6jkq4BNxV/ZV5IRUSbLVHJ0PPEX+Xf0dvpQvmk7KyPZ0tfDj34NKLrJd1kIB3mrviJY4VzZeytNeVgw2mxnRdbCBtq1HoY+E/9PSo4g2y/wkzJ0QKdE7d8/O0yAXMOnYsctstMXPw54uz5kHa6egsu0HuQuZ9myvMQIyHZS8S9ngeeXyPqhOIdw9D2RBfTmnIg5vxnpYPET9qvSW/ss+hwsrMsoqAyxAi8Qw/Tz/DzSbMoUeEd8w7IKOG2mrTWlegZxyxeIZ8eh+CGIfgUPWRkYW/03r7dc18HTovA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ba49B3glk13jnytN83rbX2juq/16se22VsO3+zg5/+c=;
 b=Ks4xA0UZ2Ri/4hsWUtX1bmtLXhuzIqOkaKnmnRjQAIPL8YVnaUU7kFkT9vU3vEjVcvBwbWzzjYun5CTCxh80JZupQc2DnGh5OhYlgf67AfRlAREjtJ+wkmyp3cmoCeVKuZmemWnKVtNMHnHe7De4pJ5reyhLxhk/wE8n9RPsL8PdIsVDgszRUP7Sclpc1eUXrfij7M+B4kaR+vvpB4LUC1R/x0eurBgb689/OIdJe6kal5EUn7cpzqDz/Sl9VDUcq3S8oRhJV02DPVvKBWbz7nU2FrSjrtnc/+tmH372JXpyrWNEk93xFENX/4iWh16tUd1JIpJdWzX1yCg/Pe6p9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ba49B3glk13jnytN83rbX2juq/16se22VsO3+zg5/+c=;
 b=K2LWpGjmKqg26jQh052A+MJyfw9vLL3ZxoDHVSb935YB+XvKJKRx96cYXaPzSRLqD1PrfMmNun5YeR2OXT+WG/DDDnKrSxq2LFiJl69nw/uVLAJiQgnRO++ZokCpXbuPgyqSrnGkbGkUew5LgqHvkMwchdJSSL9aQ/FwjeG76aIPMWsCkHGj6pYvDyLosz6mS/re0vfnlU5zsb9G2x/o0pa9PkQjEubNRI6LDTGyzKGZoTQR00ECBia7vU339fV3r2ENFYPOdO9wvz+YyefFs0Jd/Jpv2uxPAEbXXSncQXMixBM5eeLiKF+PhZu/Ugg3Xz+8GPCsBmVjAEunKHg/Gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10518.eurprd04.prod.outlook.com (2603:10a6:150:1eb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 16:57:44 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 16:57:44 +0000
Date: Thu, 23 Jul 2026 11:57:32 -0500
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
Subject: Re: [PATCH v2 07/19] dmaengine: dw-edma: Dispatch DONE interrupts by
 channel request
Message-ID: <amJH_IknotEHF5Nr@SMW015318>
References: <20260723084150.521366-1-den@valinux.co.jp>
 <20260723084150.521366-8-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723084150.521366-8-den@valinux.co.jp>
X-ClientProxiedBy: SA9P221CA0016.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10518:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ac07b75-b0b0-4204-727f-08dee8db83c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|23010399003|376014|19092799006|22082099003|18002099003|10067099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	V9sC8h90AGK3//vUTfOjJBVy+e/kEXrdgzRO/YHaIyiyaZc6J4oBrMrO8M0GgEXVD19UIhxSn/2EbXtGvzULRoRgukt87WMIa5rdk2A2DKdS1RZozGESez2HUE4XFXdyM3pUxI4iUfP5Sn6CWthBcK4qVTeqackuk5V8OdvdsK4p2Ajy9rCN6pGBM3dIxDAZBq7Yoz/tMgHG+QzzvYwf42zIR3dS7UAU7x5lGsHCWTvkOluwGQHLrYSN9QM6cJ8fGOlimqCfp9BS8rzJFBPhQPeVARTWIcA0zoYmGQh/fQzYYWw2zdnrLXUsx45PdiPoRlOhZ9J8l9cMorD0ng0gjT1hh1aRpModcslwfu8HT/lBUbjAvLT9VMEY4FtRc33rcT/8U563olE6GtZGHAl7bWrLqmMXj//oTwHgm4c8gIMXh2B+pOR64d3p+tyNVgZOKFqwRMtGeEHy3ojOD5HT6IIcsbBrdew3aXLIINz2j7Vpqlxup8rMU21zURZGz7fd/PqZ3ad2nyRrhY5n4iL9jZx16nPotith7uW4foLAAT8EE8LR/rOmVpa0tFN4VNS6N9Plhn3d5rZfuvT/7w/sgVCYOVsW5/r44AgCeXtoznD+vI6IC23pp007W8H+YUejkbA9sKKTa6kf6384uxARoof1PYsCv0NnTjptPzAYMsQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(23010399003)(376014)(19092799006)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UWK8ZG6D1dCHuH0UAetQmoWaw0J7GhcqTwk831VLCYkNYnaR2tUJ5mgei0E/?=
 =?us-ascii?Q?sYHCK6ZGjK7HEyHWoRLVbAS+ODOjlw1diJa4feBKAI70rcUyiBWtcxAbfyLR?=
 =?us-ascii?Q?DJOZfCCv0kgkCZqiKWAJz5z/Nqg85IQnvNRfTVwkTZId26PkZrfd0Roy7mmb?=
 =?us-ascii?Q?REkT1MqIBCduir2a/fK6GYPq0Mi1EDkg6WU6djhyiVT3WkjiGbNgq16qNpP1?=
 =?us-ascii?Q?YmEdaIuueYgiF5+EUrhqIJvZltCQJku7SGI2z0B2MmkfeQV/B8V+mJZ1jj3M?=
 =?us-ascii?Q?L8y5267NhRx9DgTx5vvVmq2xhpJJYa9v33bbhRsx1/X8KVCC0uGJ49KUg+z+?=
 =?us-ascii?Q?7yWUk/t1+Hy+RnfoTqNXmZnSjx6ESNlq4JTYQmXYp29PjQ+jWUZDPQcRCZ1Z?=
 =?us-ascii?Q?TDD50LOjYYjnOiCq0fRilE4JN2iYu1wLSDNQKg4MLmxtIf6KISGy9/jzpuqj?=
 =?us-ascii?Q?Fc7E3nAZ/95MiMP9VGYaJ8cSaYFtznEoTh25ZKCaAv3CLgDHt2UrRw/4NAWF?=
 =?us-ascii?Q?02rTBW5Dn8frhsjAx/Vy1Nt9ggqHox2fZEaNajlarjz/Qw1oxRjdiN23Z4pt?=
 =?us-ascii?Q?zbiDfxCVccmkgKp/qzpFYfXh+8ByvvRiSuAnUIyHIgY+gZtzMrn026xAQy5P?=
 =?us-ascii?Q?eBGit5iHe3CYTzTI/4ZzscTfu9Ty48MnuWDii8yeODcIiO6hqp8xgQfM4Tm2?=
 =?us-ascii?Q?qA3PeM1Gekv3WhnSqYUHwZ4xm/jUbo3kYKGuksjTaQWU9L1r6JVS1TM75pPR?=
 =?us-ascii?Q?xuHEioV+r4c0aTBZhSJMmxvXCigQmQfAI7ogeOsFHG7jeivsx29cQp/UVr+W?=
 =?us-ascii?Q?hy+mn1w6cocSd1yOfisZHvOJtCqRlHdfesMhMFP4Vl9+tQkBR1l/VU486Kqg?=
 =?us-ascii?Q?EsawAKg6xzA/xRZU8+eD7t9IKC0qX5TYeUcUn+zdToZtmbG+WzXD9icuuKcs?=
 =?us-ascii?Q?yZOvSjxaLKeornvwvgpuB5D7CVT4IJfjUHJbdzTTpc69KqU5nrDMWV9RlmyL?=
 =?us-ascii?Q?luzCxb43AABesW2eKgOT2RuKTDt2H/5kgn0HM96cqAbIoepq5/LTEWzDRIjg?=
 =?us-ascii?Q?57u3C7y5/c82wtw6HLDCWj2h19dWsoTBtf8B2Jc6Gt0ybNuqoFGO+koaS7bU?=
 =?us-ascii?Q?lz65Sq+Cg6ogL5YS6l7QkRVc7uINHLc0oReqpDIGjrIKUqm72vObauPYCMFQ?=
 =?us-ascii?Q?BOwXnIgFJyufWJB2C+Hv94tkuhRSdwjx+KXLBMbptvPWSeuXai/14VQZA+Zv?=
 =?us-ascii?Q?F1ZY0rpJnrxiqoNLcXke27zTpfTnPfuVKlrDwtfaOnTlgkW2ACSaNaGdEE+2?=
 =?us-ascii?Q?sWlPalfwNa9M94EQk6OoFceuv2z1KfeuSIzzIe/9RBodw/5yfG3mCoc4jZvB?=
 =?us-ascii?Q?+X4uJfz7+b3UkXpex78HbvMxQ5YfNg8clHNU4t54QealXon9kNeCmo2pw9jb?=
 =?us-ascii?Q?d+ATnIKxy/EsZ4llZr3OWCEVdMUA9TW8QEbIWpHAK1ncQzPzxxMe3MI6YaUT?=
 =?us-ascii?Q?+6P46lTPIe8UrbzqGDYSZOMt/3RfjPBwVZFdPztnkzxF5HfEqcaBsCk80gay?=
 =?us-ascii?Q?Fl3Q3fp7Lv7Uz9sOqO7hzP1S1pOwQ1vhVFXnrlB6K52QP5wfWHqCtupkH+Yy?=
 =?us-ascii?Q?Te3G7DLnPPvAqN7FSQ2sY3KeyiZp1QWUsYJv/wt5fELAipcMlI3R8wZSCZQy?=
 =?us-ascii?Q?Cz2WOtkb3k6wQJlhNhIDnzqUgc0yVqdnXjSvhQyaeq/co4zYcCZYCChXFTQV?=
 =?us-ascii?Q?GRnigHTgeEbYNXlbuD0kK3K5b4MlyJ0+be556NQjtEWffOAIVRL1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ac07b75-b0b0-4204-727f-08dee8db83c7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 16:57:44.2860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LuH5C3ijcRJX9IWRhj3zr0CjVaXAwcISrudTwQkxBxgHhWM5YuCIjHqiIq3REEx1twl02okSvBxpkJQzR703mCzw9eRTwGcfm68jR5Q2CKavJMcFc/qLt+1YPZBY+AQN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10518

On Thu, Jul 23, 2026 at 05:41:38PM +0900, Koichiro Den wrote:

Subject:

Check channel request firstly at DONE channel interrupts ?

> Handle the channel request first in the DONE interrupt path, then look
> at the issued descriptor list only in the cases that need it.
>
> This keeps the existing behavior, including the current STOP and PAUSE
> handling when no issued descriptor is present.

Need descript why need this change?

Frank
>
> No functional change intended.
>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
> Changes in v2:
>   - Limit this patch to request dispatch with no functional change;
>     move LL progress and empty-issued-list handling to later patches.
>
>  drivers/dma/dw-edma/dw-edma-core.c | 60 +++++++++++++++---------------
>  1 file changed, 31 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index 29f78405e9fb..fa104af4146e 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -682,41 +682,43 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
>  		return;
>  	}
>
> -	vd = vchan_next_desc(&chan->vc);
> -	if (vd) {
> -		switch (chan->request) {
> -		case EDMA_REQ_NONE:
> -		case EDMA_REQ_PAUSE:
> -			desc = vd2dw_edma_desc(vd);
> -			if (desc->start_burst >= desc->nburst) {
> -				dw_hdma_set_callback_result(vd,
> -							    DMA_TRANS_NOERROR);
> -				list_del(&vd->node);
> -				vchan_cookie_complete(vd);
> -				if (!chan->non_ll)
> -					chan->ll_end = chan->ll_head;
> -			}
> -
> -			if (chan->request == EDMA_REQ_PAUSE) {
> -				chan->request = EDMA_REQ_NONE;
> -				chan->status = EDMA_ST_PAUSE;
> -				break;
> -			}
> -
> -			/* Continue transferring if there are remaining chunks or issued requests.
> -			 */
> -			chan->status = dw_edma_start_transfer(chan) ? EDMA_ST_BUSY : EDMA_ST_IDLE;
> +	switch (chan->request) {
> +	case EDMA_REQ_NONE:
> +	case EDMA_REQ_PAUSE:
> +		vd = vchan_next_desc(&chan->vc);
> +		if (!vd)
>  			break;
>
> -		case EDMA_REQ_STOP:
> -			dw_edma_terminate_all_descs(chan);
> +		desc = vd2dw_edma_desc(vd);
> +		if (desc->start_burst >= desc->nburst) {
> +			dw_hdma_set_callback_result(vd, DMA_TRANS_NOERROR);
> +			list_del(&vd->node);
> +			vchan_cookie_complete(vd);
> +			if (!chan->non_ll)
> +				chan->ll_end = chan->ll_head;
> +		}
> +
> +		if (chan->request == EDMA_REQ_PAUSE) {
>  			chan->request = EDMA_REQ_NONE;
> -			chan->status = EDMA_ST_IDLE;
> +			chan->status = EDMA_ST_PAUSE;
>  			break;
> +		}
>
> -		default:
> +		chan->status = dw_edma_start_transfer(chan) ? EDMA_ST_BUSY : EDMA_ST_IDLE;
> +		break;
> +
> +	case EDMA_REQ_STOP:
> +		vd = vchan_next_desc(&chan->vc);
> +		if (!vd)
>  			break;
> -		}
> +
> +		dw_edma_terminate_all_descs(chan);
> +		chan->request = EDMA_REQ_NONE;
> +		chan->status = EDMA_ST_IDLE;
> +		break;
> +
> +	default:
> +		break;
>  	}
>  	spin_unlock_irqrestore(&chan->vc.lock, flags);
>  }
> --
> 2.51.0
>
