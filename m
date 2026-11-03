Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.40
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793719057;
	b=JM3tKjMrNsnaVy6mY+FvY5HIXqC6M1U76cWIbAuFLmR6Za/ECl7lFyit4rFRSzajSq5r
	 pg005up9E1y8Qo/M1fwD2t4f+71MDs2podXlwAu/vs0/GabM+dq02ClZLC5ayRngcVISu
	 VkM9XmjSr6Rg5zBKUXkaExTcFkcas8Rxn8FjoVfQeWt6fvD1pbmSluKMFymIHC0J/BruX
	 +czU9Y2civTpw90tGiJZ9dnbkv5RorPJfh3qWjM8ifGz9qJvKriiUPIpuTH/CPfxczNpT
	 jMTyZS5T5WkxquBkF8q2c5p824YOlInKEO8rTsquWIH7dcWQcjcuDMVgmA95kXb8xbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719057;
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
	bh=4GYjZvAv0hjPN3hpBy/l81G9bI83/K+mg1CIrdYRnXQ=;
	b=hOXFQK7JFAiqwxXlTXw9LreUCyO7xh9CYmTSiKtAhjvvWyTmuqoWg/GDAwiLY8ffZgLX
	 LaCv0zC3q+esdHsYsFDqnRP5zHnSluyV3O70ji2TJIzmP1Bolh17bAAWP0zPKBQyvtObw
	 gSxCJUd/BKwZcrUFmT4HVsXiDuSj726uksRdC6eaGWcNH2dCBcc/gPiXGEQSMGioj5/0J
	 csxG6UKnVEyMGQuIMmjFoGjwMpCh9owYw7482tjg/0i3mGLEGIvdShHzMlwpr3TUvRSz8
	 Bhwz5pjaUUCu8F4QoaqbDGOO8PwALbz0zirBtAo67IMozaAEXm7D+8TiYeZWaY0mJbA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=DOYq0K86;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.40
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013040.outbound.protection.outlook.com [52.101.83.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C937606A78C;
	Tue,  3 Nov 2026 15:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C937606A78C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=DOYq0K86
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfQcNL66JDRQI3IM6dQKEh+QBG/1u9+FCYu74f3d1cxxgsQAI0zVVBwAWRHUrSSF7NcVzkXesMfGpEDujycrfXDJKrbgkn+4VadGgLJyvkP+Tka9Dkn5Gbz9r8Ki3pzEnGRoi9fzv+q1vlTrqag5kpFXa1WApyX3F4z/Y8LuZV/scEIo3lfamzW3qUMaUXLVaUv6AOKhyup71EFal/vq+hjPoz+MYlt5JuHGgynSzphw6DJjytOjGtdcGBnbsvfVUwsb+B+xdo3XE7yQFXi3zsztZs+RltEfvi7H4iW/tcK41iRrGYN5AkYJWiX/cHGyWJspzqxSt+SfP2sJbiz2cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4GYjZvAv0hjPN3hpBy/l81G9bI83/K+mg1CIrdYRnXQ=;
 b=XOO2ngIZw/SrDDpPSxLNirVBLevEw96vX7pjHM4gCYMOrp8CR0JwKLGbguaF6kcMjlbk+lwQanKjrpNNee6YszN2lsUWo4VTmHgpiq9WBzTpU0YpOpelo9r4wB0PR4uKNZy2nLhzrAH3aK3WGUw9byHE1YRhoYdISW56RUVDQqSsm55AnnHScwI9x5AYM8Yph76ZXKMQThvbb2u34/eq/b8VOX73yk2NhxkJDXG2HVFJQY/EWv2IyTNs0fjDmp6fa5DrvFmU/n07Ew6TASdnYsVkvUvjoGR9eSFLHviYsGXFJuYIkS88HCrxn0p0Kq5O6NWIkqn6GnDAGhYIUusC2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GYjZvAv0hjPN3hpBy/l81G9bI83/K+mg1CIrdYRnXQ=;
 b=DOYq0K86muLR1kJwgjEnKqmk47UDy6GVMPBwL+CtJiGvfO3ZvZkXwllj3SFgGLQy/+bftjVdtrusORWugs0WemQKThtOWHtEdQtazNQ7CcBGqoL+ulY7C2sXO8Mr8X/BKUXcHKZRKUBRpcwE/l+y0QMxYlCHC0LU5KrBnxRzfNQdmjDI4a8eBlwr313lqEqw/vBBMRXFLf7S3/k9kWycbb1cbFcedR+RYy5jsBSgS30i03+Yz88+KaCw/xLQc0AApfbPmQQ4tBDN6mw4QyPujzcSz3pMH5ye/4BHzw4Z8IfbSFIGqX3fMBBxDvgCrpKWTCOYkCSTVAej4xkD/a7c2g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS4PR04MB9624.eurprd04.prod.outlook.com (2603:10a6:20b:4ce::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 15:17:29 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 15:17:23 +0000
Date: Tue, 3 Nov 2026 09:17:15 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Li Ximo <lixicaicai@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vinod Koul <vkoul@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>
Subject: Re: [PATCH v2] dmaengine: xilinx: dpdma: fix crash on zero-length
 cyclic transfer
Message-ID: <aun6-55yED9DAAgQ@SMW015318>
References: <20261103083132.1122990-1-lixicaicai@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103083132.1122990-1-lixicaicai@gmail.com>
X-ClientProxiedBy: PH8PR07CA0017.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::28) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS4PR04MB9624:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f64971b-90e9-4360-ff81-08df39bd8fd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|23010399003|1800799024|10067099003|22082099003|18002099003|56012099006|11063799006|261021121427099003|261022105027099003|261102123227099003|261028144727099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	+LvNUjxHdbykTYBn9Xud3BFUYec0V/IxMVn+QT6Ad8fvzuC8RqitEY4/KbuZbvHfaBY6Rvv7wv0xTpFePhxmFt5b432tvUE14W/N2D2vaKarrWaYMtBSt+Wm0wOFqSNCos9R4SRWZjfEJb3ncgt/ltTu0zoexiC03/8E0aCalWX8QFMnS0mehowRU+RIF8ON8ziv+jdG6idgzDbea9gaVGG0wH4hkKCLME9RN6McVPmRy250/EQlTxnynEIfN0ociZmG+JJ6WZHbHFYs4wFMS4j5wxqwQKuM5xoGbi7MLavzRd8rimGB4DTOUZkxXeJHsWQDBHyxGF2dscQujh9H/V+x1Q5kKuCbRawL1h2fOC6jbbSGiJaJHE6CjiWPQ0Gr3V/wf+4mwOGla3X0MrXJdCC2RmMCFvDERQpLu90cd18QKvA/R+cCpqVMgG1amDevu2BS0GQRUj8SDNsqawoYwzK7C+Y+QGmcGTy2FeioU/tKNWHO/skcNq/xP5AFaWOHPtVQ/FkZ6+OAWYFnlblnZE3areGWn/UMaFtjAIdSYcWd0b0J2N5VpUNodSZknl+4fseLbfjjnvtw52+RvffvT14LJ600kvJ8eS1wSHOP3VWz6NgdKLFvVGf+C+ucwu3B
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(23010399003)(1800799024)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(261021121427099003)(261022105027099003)(261102123227099003)(261028144727099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MRfrazJP0MPz+AgJQLiKS89NQe/yglQmq5S1MXwKCaH0gCeLuXKhim9g4YwK?=
 =?us-ascii?Q?xPMFyqWYd1AqSzEGKD3NTxD6kyE9QXS9+oxJCWGCTFS3jEVGJG8poRJLl5YF?=
 =?us-ascii?Q?LkjBLgxuBW+ZqNC2qUMOSywNqp+AWb4qHcunnD9rlc3UhffPi/jtpaDM8szu?=
 =?us-ascii?Q?DcD2LQBycL3P5XBCcjN6NFlNouT4YRtttKOGhtuGdFrZDkcEMAwkcFpLoH4D?=
 =?us-ascii?Q?bBbXTu0tcssrvYWO/AHtEieB8Y7M+h14UAsO5jDsMOm69k/EvXtLI77xjYkK?=
 =?us-ascii?Q?4R0f+lKQpyR6uf1q/iy5CWCa9vL3qnggmsCpmdmNTu5WVB6TPcoVXM9CGQt+?=
 =?us-ascii?Q?E0yUX+xG12eScSnIbPvs7FIsDlBgspF69uK0L0Uy1RZmIXfUE2qBjJHz02dB?=
 =?us-ascii?Q?3jftrj1PBrH1CFKIj2pxanC80G+013NjhqKmSpKce2v3XWZGwLHk5XsP6Kbq?=
 =?us-ascii?Q?BV63BS6iLX1XJtToCLTetaVxSGHoRFnuWn+o5UnT861q/Q7aJSfO5RWYQpb+?=
 =?us-ascii?Q?YUd8ZvRRA/zJce3Djh7BEHBnOSedddUpmYM0OW0mT4ObVtcfoVhxxVxYvS1k?=
 =?us-ascii?Q?cu1Sq7aY1tp3AE8QU/8rY56E/fxGm61OJlWaGkB/+EhujLcen2/rUsamZezK?=
 =?us-ascii?Q?CO5WaNYN51oN2KRdoXneCTenwB0zTm1W3GqwZetNqvxQqKwBc6UlgQ4w/BpX?=
 =?us-ascii?Q?nSQfltSFUp7lF7LZjqC6/3tlbeK1WzRIXGpSJGxjdc2zstJTl+rALx6jdWiH?=
 =?us-ascii?Q?CLu9AbGyrj5dC5sUWvEm4zhLhsb3PSR28vkMM5qbgWazJJcMejvhB396jxhB?=
 =?us-ascii?Q?N1gac0+QvG3g07r08J+1HeuCAN6+sNLKr0RwQvriaBNI5TUeyViGz5VMSeUa?=
 =?us-ascii?Q?hRtW9mJbACJKCBGpXxwgUSONVNDDok6/Dpo4BACpIGrcmwRe29Wbqq1TxUW4?=
 =?us-ascii?Q?iHHtHVIld2wItYzxwxqwopmbGjnFOWC7hS8DkHr6QP8ZJhhgmv17dWWpYJDO?=
 =?us-ascii?Q?BD7DPEQqguNL4eM+kMvjpkmz/1JNi3ENJ9GsdRo41Lli3qPcgLw+VWOQaM6i?=
 =?us-ascii?Q?61WoWhUZoyaxDqAixZb+P1U2TZXF43J1ChnS8zMs22k5+TU+H+XNMG4aN7JA?=
 =?us-ascii?Q?O+4dx44Dj3Iik0pxQo9GEIqsG29KfMftrGIbJxIhK88ERVUeRiootc1QfBrw?=
 =?us-ascii?Q?+qZilcbl6zveu2Ud2Ob8+1uDYaWCFovDlmL/5Ro2getqZGuEMfAqeafEwnk8?=
 =?us-ascii?Q?UfQ9F7fZ5FI3zfCXOUt5e9boUEZTs3Cnx8qS7VvmWN7e10yimQ/0nkhAigNY?=
 =?us-ascii?Q?PNAYBL8kC+TLVMxYqIgoJ2tTXJo6Ur4+zXjlFKEGPnfczUtnEtj4FQQHU+05?=
 =?us-ascii?Q?XZrjo7X48f2YEsWqTi8gK1a6UEVDgQzHe5H8XyghxYQQ2c85WJSTzfOShohJ?=
 =?us-ascii?Q?7f8V35YYsVO16/eG3JvPuCPpf4aQH5nuFO5gmCkG8r5THxNVq6QoPDuJxWBe?=
 =?us-ascii?Q?F7dQSXCDe0f0n/Ic2SIssy7ZJHuH1O524IZp31ZxWmdNptd92DR5ex9JnlSE?=
 =?us-ascii?Q?em7ty5NTFtbfsCtt5fb9+dvKAtkS/n1wMr1xXkboLZJpUqNm+sDPgJ2uHUY1?=
 =?us-ascii?Q?SvDvZYssBoYYqxs+eagZfPn7xi3W1iYxUEco0pqfPkWTuiTwcOJMu7uU1Q6g?=
 =?us-ascii?Q?R8+r1MDHBcVMW0Lw1Cpph2VbYXs0pGOPs9GyQqhsn/6AFjCdbeVDzfjZVYZ0?=
 =?us-ascii?Q?orCdcuJoRcTAuKfC+/4wNQxPw6m0wSvF8mlibmb+LeXrT6i7J3pA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f64971b-90e9-4360-ff81-08df39bd8fd8
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 15:17:23.7177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sSPl6f3Z94dcDm/NODkwbELiRwfpR7+Mn0JNCH9VLTc90i9bq8jw+IeX3SjvcxpwjTOZ8lwK+UpAsqEkY7jUkPfFiholsQjkY/1lOJSzasFDf93BdFS+/e3vYuXQRCXm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9624

On Tue, Nov 03, 2026 at 04:31:32PM +0800, Li Ximo wrote:
> From: Wang Haoran <haoranwangsec@gmail.com>
>
> When buf_len is zero, the descriptor build loop never runs, leaving the
> descriptor list empty. The following list_first_entry() on the empty list
> returns a bad pointer and causes a kernel oops.
>
> Return NULL if the descriptor list is empty after the loop.
>
> This issue was found by static analysis.
>
> Reported-by: Wang Haoran <haoranwangsec@gmail.com>
> Reported-by: Li Ximo <lixicaicai@gmail.com>
> Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> v1: https://lore.kernel.org/r/20261023065900.3455414-1-lixicaicai@gmail.com
> v2: rewrite the commit message in simpler words as suggested by Frank
> Li; no code change.
>
>  drivers/dma/xilinx/xilinx_dpdma.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
> index d9a3542c4..bdfa85b80 100644
> --- a/drivers/dma/xilinx/xilinx_dpdma.c
> +++ b/drivers/dma/xilinx/xilinx_dpdma.c
> @@ -730,6 +730,9 @@ xilinx_dpdma_chan_prep_cyclic(struct xilinx_dpdma_chan *chan,
>  		last = sw_desc;
>  	}
>
> +	if (list_empty(&tx_desc->descriptors))
> +		goto error;
> +
>  	sw_desc = list_first_entry(&tx_desc->descriptors,
>  				   struct xilinx_dpdma_sw_desc, node);
>  	last->hw.next_desc = lower_32_bits(sw_desc->dma_addr);
> --
> 2.30.2
