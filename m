Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795020931;
	b=XjVCdWuES4Z7uTD09QenDLpISXQbpmX/ktHUaR5bvCZoBtY6/kVecWJ/EdWBjagO4xER
	 pOsV/KjFbbxrmRymymInsahXIfqdkLXmc+OKRNTFuzmBfNN9rwY2b81NvDBSBpe4LPWc+
	 nyrQhHq1iGYBZrQenD9vRIMiRYrIkaD7f6Ri9QOeTUoMGrtUD0+0TmWC8HJRHod0+/O86
	 bkHwsndQhgu5jvwKUncsw+lZBv3IALMmJKHhyKQLIFYyWKYiaHpaT7BkcCkaInWvXQ4od
	 B04NjZy3kIpz7+sevBWfs9vNDlJVLqQ1sVwBiIG6nuSDR0wcgacvwvfqfxz1yrEjIFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020931;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=oEmcUOZ6oTmdBhzwmdzqe3dX5//jbL7OnVF9gBVmUTk=;
	b=HvXPUbbOVHPOsm+ndsw/CSXqbGaFKXMleQS+4VaXMwwy53Ukb21fOFXSn2ehNkCQUvDq
	 jWFIEBnj+DvNeZTf423boBrse6MwbnalTOtrl8hTiCDDT1CVMacd1CIjODCWaq7pTQsJu
	 XTiE6YxAOjc/CMeYYXb8Xzx2CZ8ORH2S+04ipl34IQxvyHzkcCbDJ87BUKqaOefvzkDy8
	 +WDLuKvkG6AbT6XuNjDqFMxVMWE3ah3qK06feOJLP7I5GTR9LuvM9ZENCJ0hZnvPH8CwX
	 j9awf5xrVPEbKC1ghN3yzVT3SEt2Zg8VT/FFUGr6uDgwJHJexlBBHSm/VUAhZ6OX5bQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="FvYbA7H/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.44
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012044.outbound.protection.outlook.com [52.101.66.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E73A606A320;
	Wed, 18 Nov 2026 16:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E73A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=FvYbA7H/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9Wsv+3nKs2jK4rfwOyHtZA5OVfF5WmiTQdix5CzbxJaX2tWBdxu8BmJj00iWt+sbyqwYeT8hfBUn+I0iyyEVeHaLH3kunhb/DrIwQCj/fwEGLhgL5X0L5vtf9mErvc2ELW5XWfuW3kyogPso4PhWXEancmJ07NE0bhB/EyJ4HGfAHw/34tVq2V+YufFmJ7DPFRWqTSwLeaK39/rCvJ6ySDOdmMn4qWSf+OvF/bKIqLunfY2yaMHdmbnploqKVtJBWEGKRYVQ20P1OUM5gWnDf1t2K1nlHOtuGNnq5IQ2cqaIwYK9hS/IPjBkLBJXsVvRBdOqVrZmFTryIxV/6d9+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEmcUOZ6oTmdBhzwmdzqe3dX5//jbL7OnVF9gBVmUTk=;
 b=LvWT97yIGQfC3Bqw3O8nBkKrQdHzO4qr1uj6MtQT7i+t3Z8IFuTotjhG+SD5CeL0LSrKHezPNUiJ/mkGSlkdFifgWqXZED8G4/Xuz4Fuq8TII+QW7b/9NeewrRo0O7II+PqcRYgBnu00iZl9AhlZ8h6dJhbgtdjltml/a/tPpKyO/C6Nrdh2fFelAaHAWK/5R+wE5WY646xG8rTmp+wPPTxcJEREtvg/kS13hxjnO6eRuEoK9+tG4/TU0JiUFCJxqFpLCjxKll5Maxsvm+y/X9D+XtBm4LShTCmTUE3VoQ1K8LqxBz1poTc6/lb5PnsBZOZohVGxfhWV5wtY5dJ42A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEmcUOZ6oTmdBhzwmdzqe3dX5//jbL7OnVF9gBVmUTk=;
 b=FvYbA7H/7gT9rvVTsJSNY0qKGnH2sHrNR7xsM4bfI1Lb1ePkdmEkc1UFm8QeOGYu4E+UPetbaDelTmPUcKHpkbi7N6Z1Pr9uwecxagWS8T/M+jH/znQsX0PiTLjGbSQU2W6gjJm9ZgQFGCkEkabU9TZO3zEjHB2y+2E7DkrV74l/CwuRWFc5UrOh/5yq9WpR8ROWJX7RNPmkXe576W244O7sNCD9oHd+Bx956QH2ZAcG5cZUmPx85Dgxus97C3X0+mGyMfjF3Uwu/MYI6dRCaVdxyYQ16YTuM7+G985kSA/RtQE8vBnGPPdgx1uC9QdEz8bQvAa6uC13CfDoeCtznw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AMBPR04MB015018.eurprd04.prod.outlook.com (2603:10a6:20b:7d8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.16; Wed, 18 Nov
 2026 16:55:28 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 16:55:28 +0000
Date: Wed, 18 Nov 2026 10:55:20 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.li@nxp.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v3 6/6] dmaengine: plx_dma: don't invoke client callbacks
 with ring_lock held
Message-ID: <av3YeAbHSUdVowUJ@SMW015318>
References: <20261117165135.746241-1-logang@deltatee.com>
 <20261117165135.746241-7-logang@deltatee.com>
 <avyrd_b0yQ4Nqk-O@lizhi-Precision-Tower-5810>
 <c2df58c9-6ddb-4125-aa1f-897e90b33e9d@deltatee.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2df58c9-6ddb-4125-aa1f-897e90b33e9d@deltatee.com>
X-ClientProxiedBy: PH8P223CA0011.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::23) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AMBPR04MB015018:EE_
X-MS-Office365-Filtering-Correlation-Id: 83bacc90-9036-43c7-a493-08df4594bf74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|23010399003|366016|18002099003|22082099003|6133799003|261009223027099003|5023799004|11063799006|56012099006|4143699003|261028144727099003|261102123227099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	uzi/7MnfALb2ts9cgRz5J2r58XSxD0JTXZoxO3WJoUyzTkG27+5t3ys8qKB+oVvwA+Qm6LBVsoOU4F6nW0jhrzX8aolHAtjsdj2VmHRNZne4LQV7iNwQ+2Y1XPHDVPp63uadqZvi/2g2OknYGVMLhKsp36bsKnavKeVb6VHMQqlRsdim6XbsztSZ4RCkuI09umBvhNbF7XWpTXDAlJpgjOqUeCdT5oc0m6LElCqta1a8qJ3ON4rBaTz5LfxgUqpzZYdNSlogSHm1W9ENtcgkWU06LtRAlOS5zZT40LMOwkzIUb6h7rGHbl3zbqkax9vsdLqY1s8GAcLobKMhBw9Tp6H/wsrxSosDvTTVgEbSidLZuPG9Yuu8cvEUA0mQ/jpn9a7vyd2bmkG86S3Bedpbl0NFWctr777xZ6yjIS+j/EJOljWllCeOe3M5/edgpcAS30ywAR3AiO/5rgHoar4zcZP49lmZUTEckvM+EYrtaStp3o8zxGEm9Cd+XwaKS4E9voK2Z3lYz97JrRK90XBRucceV0Bb5ZU3ZMdV0VAoANIFBiGqmHe7TNiMdYklFI1Wj+xuk4cDRQ1whPwuIcd/N9n0n66pUac74K8ZDmZtXSgPisy8O9cHlLM9AsDF8Jy+yfxKESXSgts3nh7xYVBYEOJd44KyuB/ZGE8Tb3F1zGg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(6133799003)(261009223027099003)(5023799004)(11063799006)(56012099006)(4143699003)(261028144727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xcshL/CA8+O19T4VM5sfUCNi5y6OLOCz02BzAp9/ynuXWhGAk0UeNWauSg2B?=
 =?us-ascii?Q?yNwg7IAV7K2MgcKUZwdqZkd6D/t2luOE4rw6viBHLAXnsIO5VJIh4IU0Izm+?=
 =?us-ascii?Q?xRwt+jz6XHPawkiQnsq9mVsWaYfqrAnW5Gja7zLHkao2geio5PDt3470NQNx?=
 =?us-ascii?Q?sQdQcO0x+MDixHa6R5qWwAgn3vJrgrvDwU1p47SyEGqB0q6akpIwoUpy2Qc+?=
 =?us-ascii?Q?gNzFeoaVJaxMa9XkxJjhj7MhJSG6x2j9HchiLFFsljG++iTcPw1ii7+hs8aK?=
 =?us-ascii?Q?auTtB1MHYrkGZR9vfHYPi9jjTGKJKqrDR2QVEvVSGsF5h4qIYmQ6pMpvxDKu?=
 =?us-ascii?Q?W3eFSXdal3Q8VcH1SuTtE1I53BpPXobA32lkWk3BfeJWKiUodQmTM6umS5Kn?=
 =?us-ascii?Q?9M6b9olrRDkpqzIwPFrpUYMekSaDX/4HLK7BhdBqJmYQDdylxd7JEYSHmBWp?=
 =?us-ascii?Q?F5+qHsmnxgral4y2mbkbYHzFvz98UIe6W2/eXb+Of2Ef+0e5NVYp/BR/RNr3?=
 =?us-ascii?Q?lV3NrncqKcn/9ZZhL0OfY+r7dVT/yGEWqD2aK/VOTy1Ie0UPs/7J7+4ebgLm?=
 =?us-ascii?Q?qAiLwBmE95Mi4kq+ApAqeTifJgKtXe6j4H6ersFkJT8Mx0ySTI7rPWaUPU3j?=
 =?us-ascii?Q?WF+voCtLKzXx1Kc9sJ4BPRaHiznGvieTDFwh13m4UxiN7xuU54pMff+LijMd?=
 =?us-ascii?Q?cRV9PcRMf7kbQCJWNNZyT9vtIRc7YcbKmY4GVQZXDdkjMNvPLwQ2bU9wogUF?=
 =?us-ascii?Q?LT7wKQgVuar97R5Fu1OCuJlj6oLwCMXlkRWqQTHRSuOdI/Q5M4NA7Njc30Kr?=
 =?us-ascii?Q?9KH9j8Fw0C6t33fEKwEy126FTIQeFRxvL2a+oCiYCFvDFaUrqc6b0Lv7Cenv?=
 =?us-ascii?Q?MnSUlBwvolg5aK7tkWS+tDSl33AnFBw2H50U8MFlK9C2Uiz9QXuyu/ZivbpB?=
 =?us-ascii?Q?oaV8/mxCdG2xmw27p5lAAJWHm1G3c6+J+9WT7N2Kl4nJfEr79dwZbGo7gS6V?=
 =?us-ascii?Q?KMyOk+UrBjaG/Xe+7bU+2J8AxdkGvVJIzbnNwK/iZgNdlO/zSioWbPXFFXoG?=
 =?us-ascii?Q?Z8FpLXzeeV+MkMnKauhYGp4is3HOsnzDZ5aT6Gb8oPWrqho8S/wpxUf7MzBa?=
 =?us-ascii?Q?DVdHXhpU6Dg5+t3XAosKpJMMgZRBZTjWbqulqTfh41vZM1Rrqp59/YhhBEv0?=
 =?us-ascii?Q?7nemeqd3ZypUItwDoJC47gRNuuQnY2QwIgXbcYwgdj8pJSWxq91z+oFq8Tck?=
 =?us-ascii?Q?5pjdVAYbqaiYPCOp/zgO2Xx6h551S1S4x3SqK+B4ZkvXzFqLpc1/uZBCJeQc?=
 =?us-ascii?Q?Tmb/9FO1BnQMfcVtiipVwyTI/DZ0SpGsYxU5yqKbwXvpitTysI/tnU1fkoEW?=
 =?us-ascii?Q?VYCOPOwdj6W+GNkkcEEuz31HUQzfFGcc2g03NdTVH6hCpPSdTmb+f2Rt34SZ?=
 =?us-ascii?Q?RoULUlvCAXH+E6Qgn0r8P5bFW6z6bl2FR/BrLjzKKEQYRMLzLc3cwCGrzIfG?=
 =?us-ascii?Q?YpFtmfLbGLSOjRo+eWPZn4Jhn9rabNNy310nsMSG/njl72UwgZ41SeiwmhbW?=
 =?us-ascii?Q?PUcsXdp2XDkvwqRU9V1eP5njjybgNO1jEUoNncM//LBPlQi/Giv58i3HqnnS?=
 =?us-ascii?Q?qIunSbta9sa+HvERCVFO6Kko7rjfbmBQhMYTacUF3gWF1Mr8VA+6BJ4Yl1g3?=
 =?us-ascii?Q?nvIC/xboMiNL5GW+0TbU6CtgEP74jwJqhfqYL2WnPegfN7REddMOHJx3V2nF?=
 =?us-ascii?Q?VOLFoHLze605QM6OdlKOlCgGuDTF59MowE4a0RE83f6A5oRU40fh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83bacc90-9036-43c7-a493-08df4594bf74
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 16:55:28.1545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZdfNyQ7Aoxl2PrbG/ldX6y2eBUQ6v8T9GSIsvrxNyWwN9vxsFyp0ms9PuL5jx/M9PHdLjX6DU2NATdU2SuKDQ5tj63Y2rjIZehZYD+WbjsCQpJhdE59R2pgfLvSXCqIS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB015018

On Tue, Nov 17, 2026 at 04:46:36PM -0600, Logan Gunthorpe wrote:
>
>
> On 2026-11-17 13:31, Frank Li wrote:
> > On Tue, Nov 17, 2026 at 10:51:35AM -0600, Logan Gunthorpe wrote:
> >> @@ -166,22 +171,35 @@ static void plx_dma_process_desc(struct plx_dma_dev *plxdev)
> >>
> >>  		dma_cookie_complete(&desc->txd);
> >>  		dma_descriptor_unmap(&desc->txd);
> >> -		dmaengine_desc_get_callback_invoke(&desc->txd, &res);
> >> +		dmaengine_desc_get_callback(&desc->txd, &cb);
> >>  		desc->txd.callback = NULL;
> >>  		desc->txd.callback_result = NULL;
> >> -
> >>  		plxdev->tail++;
> >> +
> >> +		spin_unlock_bh(&plxdev->ring_lock);
> >> +		dmaengine_desc_callback_invoke(&cb, &res);
> >
> > Common method is slice to local complete queue in ring_lock. Then unlock
> > ring_lock after while loop. Then invoke cb in complete queue.
> The PLX driver has no software queue. The hardware queue is large enough
> that having a software queue would have been wasted overhead. So the
> virt-dma pattern doesn't apply here. I'd really rather avoid adding a
> whole other software queue just to fix this issue that isn't that complex.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Logan
