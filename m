Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792601072;
	b=pUGGGEg6hog6kUp6vXxf6BNRl8pf5BDS/ioZ+kzSr9po2Az6LQ1mXDa72fSi8nvRQfdV
	 ba+E+pN9JA6p4G6AHYpHPU2WKTsP7Al5wBhrY9UMz4srJ/AFh96QCpSJflVZP52KVy/xj
	 9MsPwHRBWs2XNPqgAorES1wwNFFewMyTV2lP8vq7hNyxHK5G/tgSuD5Qa71ESj1iG3/Zn
	 mSBu4gRPvgnSSIvQ2cUZs3o1k2mNMgQv5tzvbjjD2vAKFZf9998m/g1u6XdJPSxLuXEOS
	 6dnZ2IK5N92BJnuMro/eRGMjOkzHlyyHWLfh3ZSqDLJD4d8GPYUxEYymDu5sWoqeqLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601072;
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
	bh=yW3Q1TBNNUInnc0+sceufCj9u9RPmhdmihRZ5xUlZiQ=;
	b=ohJoxuwT3n1ILf7GpQ/t1ISs2VBUAoyuCqu32OLxnPOTjBcwfe5k+l0qUOMQFKhlPIl1
	 BB9GQ6H1N9m4U3wOoQDvIA2v0gHTy/9lkvVKnI5XXhzhkmdRz7HqhyuwE9onX1PIg9xVO
	 OuM1xQcoWRZzg4oMY7dImO+ItcXHUOMCC8D4Fo+ExRAfeOI0Mn6Abv9lz9SxLv7IXQlrD
	 P/V2hT2bTLMJ+hOCRLpo+4+hqBbXnbQhsVAtOQ3vQplIyPyhv8whrxa62z1BMLByw/8eA
	 Rzh04xPG18VTBNbkN7RrYl1IfkuEf8QoJyTP59c+X8QGjVrSJQ+RwFdsG5k832t3P+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=oJKpoubh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.65
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013065.outbound.protection.outlook.com [40.107.162.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B65606A319;
	Wed, 21 Oct 2026 16:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98B65606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=oJKpoubh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AcLj2O644mOH0zhDt7q8LD1KW/tnFWz9VodOYT/zhZGJnBObwFtBcTEwxUtlby931p1i/c0mplFujxJt13kJ3PGuXa+3B28oFgniDGiqs50/4hZStfYGr+mTGH0AHzNIYFNr3JuLrAlIMzf7s25QYNoD67dcHHZtjpz2YhRrIp0lGFrrVuHeglUIoDZs6djRvO9o7SQ7wDygMl0FJn3jPN/5v79yrzhVZDf2aUI0fGpCIaaCROl3IOZt6U1YnarAiRyLsamHcSo3QWAI+otFcN3Mud4g1LuASLfRqq8UjiRdq1Ei86oujP/ZH/Z0+akS1dae8gv38HZDkn8RjprmIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yW3Q1TBNNUInnc0+sceufCj9u9RPmhdmihRZ5xUlZiQ=;
 b=Bcn7a+cGBy35Iu2gB95x5JI4Af/sApDuUXpI1BmaLn87PiHCbY2W+BO0ThslKivqC/EWXnwZC5hjgzeVW4mPzs8tzwUBhzrKujOEFoDXjPmMCkBlM+QdMj4LgLlYlqW6bTK58XQTYcnc+763x8AFYte0DRf1gt+f/AArxamT43xck9cwUZR1wBSTlr4dT3/Gp8l50KydZ+3gUwC0yld2czHVTkAACguwd6FH+tZ43O1WXyiAaDeIFm1FaH3+jliJsiKJpEFAvWd5uuy1DlR8TmFVzIcFCvJvAj8ZqLsLg2YUZsv6TURHMPDJi2ATSA93d+ynZn7ORxJB025flxmftw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yW3Q1TBNNUInnc0+sceufCj9u9RPmhdmihRZ5xUlZiQ=;
 b=oJKpoubhfel2nfrT0ZVzP4jTMeB3msOBHlcJAg4A2JYs/EDq+6bdIFgbWiKWkM5/B/3m2J05FlG7lzGL7KT+Ni3vLRXGHLuRyOfdG9rmEsLx3k+DmHKp20wLzIhMHEGrNGl4JXbG3GrHQvMZ78CU5lqG87nl2YYMeaqLBwyQMHz9izZsoKgQBSGJAb1SrsSu47mPB4eP/HI2pG357b3DkhxkSfKFC+Ism2tvbtLjXtk4JVr98BHpAFn58fwhAl14JrUwdtKw4nfT7x8Dqi57jV/jk8R/jPi/LR+jYwiULN8GcmRlaD7npFZvWkWs590XDGng48HpRpKabx9sxmpq6Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI0PR04MB10974.eurprd04.prod.outlook.com (2603:10a6:800:269::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Wed, 21 Oct
 2026 16:44:27 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 16:44:27 +0000
Date: Wed, 21 Oct 2026 12:44:19 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Roland Dreier <rolanddreier@rivian.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dmaengine: dw-axi-dmac: Bound the cyclic LLP search
 to the descriptor
Message-ID: <atjr446tJ1ECtdMk@lizhi-Precision-Tower-5810>
References: <20261006-dw-axi-fixes-v1-0-3b319e456d93@rivian.com>
 <20261006-dw-axi-fixes-v1-1-3b319e456d93@rivian.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-dw-axi-fixes-v1-1-3b319e456d93@rivian.com>
X-ClientProxiedBy: PH8PR07CA0039.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::7) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI0PR04MB10974:EE_
X-MS-Office365-Filtering-Correlation-Id: b4ecf511-70c2-4d77-f19b-08df2f9291ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|376014|1800799024|366016|6133799003|18002099003|22082099003|11063799006|4143699003|261009223027099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	p6s3pJSeVg8nhy2HZBXbZ0czY2lWlFSJP0DPdjgYZJaTW8xxA8Qh91GiR8PA8/JN9S8d/S25WfJBxwBbqw+9qjv9/0L8Wd7dQknq4vigA2u9yBNqPJ54G91ra54FA/u2jxeZmjSK0aAef858ZRbUJrj2RXu8VVDg8i+6wrrewG1pda2AAERgjBXbYeKSXDMpxNBLN76M7KXxmVFLJqthsznFS1wmIzwspDg95h4RlsFT9wjIgWMK5uxvhMFA3Exxtq/5oaC8wO9JXhwZJwvBw/ITHiurGj03/mscykJUtGUC6v3s6rTGTN8TcNfeIFotgg4ejpwGGHTyhhcBJJvl7bLEl9dazv0qWsym49f6kVs0jQHkKqb7sH6QnJwXH1fzQeM7ZDMF3uYOF7kNuaH1suIfbf9I7Hr1WKslqVLjrxbdprRjpKpY2h46LAk3Ni0DOHLY3CIxGY3wI/kPAw7007np5ETJyNaaD4bvP1pZXE4d5JlcYRdnlczji/L0TEuY2koOwzJGxNJcOHyRgViDt1HWJ6zu9NUCeRzWU94Hf8SA1BLkf6TKIi71ypS30j5nFDLLlfs8Y2Iw/8bl/ZuB6opUU14ANZwB1SuKspfgyZNlr3p7OxkOUm4i9L+XQ6b/rGL7pXRsN0N58lRn4VGh/0Q15zUB8+CMhlbyTSknwVg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(376014)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003)(261009223027099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cJjjOAc/zzaOrQqZYM11x6fDiLRJ8C4qpTg+GHaHiyMMCfJ5FzhAKDusIQEJ?=
 =?us-ascii?Q?T6yvbDfCCbqrcMHt1DrEZhigrLzHcdIUqAYSmjwUhii1EAk4Ag7GRMUBOFqu?=
 =?us-ascii?Q?xT9cRFjEbFVcbGq9tYQripfnBqxW5ifV1FomRg14QNQwNeQzxZ/79C17p57q?=
 =?us-ascii?Q?KOC6yDJDmXJAOR6YwHaIp36U2jfnj5woaK+5qgi8o/ixIJnL7LjA1Ivwi+UL?=
 =?us-ascii?Q?nj5avJwkHQdL5tKD+HrErevYFLnovnKuP5vTQMRj9pZB5OH97nBiWvgeREya?=
 =?us-ascii?Q?XN71TT3ME13a+YgSvGT7Q079BJZesDcQ05+uw2y4t2FlfSlK3aUPChXq/F93?=
 =?us-ascii?Q?POhU4XkG42D/uBb7isg7JzqdQXQlPkJEZP2lTqgTslr1Fe2wqIf11MC+/8VV?=
 =?us-ascii?Q?FgJstW+oZbT2xdDizcuLLWBL7cTI5SRma3ZDmRYvjnyJUbRsy2ANdF602yJ/?=
 =?us-ascii?Q?QROeAyRFQDmBrVxsvqZ3id7IF3YhIyWUz1JcNLudFfYzgEL/RnRACD6ikni9?=
 =?us-ascii?Q?foarHjVIO+7YZfMmkLAxNUiLUoLuDYcpoWF8oAWgHQ1FeMs80aNjZ8wpy0mt?=
 =?us-ascii?Q?ljuKoa5ShggtoDVso4nxoOh8rK/o8iWrardetwo59nm2lw2aQCy17C5dl6Rw?=
 =?us-ascii?Q?lRTs2u0SAjfmsPZp2+jOOa48r6n9m81gPvPsIVciGg/6M64XQ6gxC2GFjd1I?=
 =?us-ascii?Q?9QJ4GBs42z7S3mJQ0TNF0Erp7ROtGkrGsOqe1smqqdMbNkGf6wBFxXlpdmO+?=
 =?us-ascii?Q?ID60gKMbuH/L5nwIb/dlp+0m5S4YvODVqEddhob63rgJaVrtDGOuPKYCXvHk?=
 =?us-ascii?Q?4VIOvOzJQINv9AEIY4bRdQHv7spuEaiLzsmlKvuu4HY1lWGaPX0408OpRNgF?=
 =?us-ascii?Q?/UDsn4ZnEuiR4h0Q5g0xi2A+7/eR9LN1XGLhlijWI3A8TsAv80ZY6wHMw6BR?=
 =?us-ascii?Q?ClGktd6bx6AAmBbCmd/Zy3kVZhKqGJCOeiCH4Rfbxp8b2NxROsC1D3Ils4vI?=
 =?us-ascii?Q?LonK/wMnl6Fxnanh9+6j/kE0S78A8OtgMqqVfqfgnBdCOpd227gcWeTG1/iB?=
 =?us-ascii?Q?6/P/mQ+DX6HBhS4qo/cUTVnV0Cucrn9lrT3Jbwd66U2QoHHEfXO2Vld07sHf?=
 =?us-ascii?Q?56DYHZ4zkAHnd/j2AdZ2o2NouMqq6fbKG1zMmOoYVxKHr9/CxtOS1MjAmXSF?=
 =?us-ascii?Q?FDfjD3ybnT0nLOsuTU4Ru61EDhk6dwfRHb+ygNUa/onlHwGYBAPz6KrMM4Jy?=
 =?us-ascii?Q?bQX7PnpL8Bk1KygEHhQUYrg3guIN0ShMKFYlqp1jLfrXJtJ+aYX9Ab+TKIHU?=
 =?us-ascii?Q?W1x5jFD7jN9My+furJPGCjjYPx2Maqz8YWMvt1Kmh+Coa2BSd2wmn8DVyrzt?=
 =?us-ascii?Q?nidAT1+fJnEh32F4BWxjIj4fVUr/Jxpzl3bvlkEzC4YUhdrO38VdwbH/HwR8?=
 =?us-ascii?Q?WK8uuaefFghWHq1DbaghMJq2iJ1dhl7UvleXPaHxmtQTFbdsJTicVXZ/UXQ9?=
 =?us-ascii?Q?TgAusTccPwlLp9rSCqEbtPB23p6cFe66R5Ti1ncQARBrX4SRPlkAFFq1qXG/?=
 =?us-ascii?Q?UVtkXRQMqXLpNHHI1eedHxAE2yZAtnMn1OShywfmL+Gow6ZzyHm9xESpTZoI?=
 =?us-ascii?Q?Bo8mItE1kjIGPVGylzmSGycelGCSj1m+lZTH9oltj8jZesQ9VcFP3mx6G1jq?=
 =?us-ascii?Q?dSKAljjnLvF/YI0386M3YBh5QXTB/swNZTEpwAu/43xG/6xM8gviYQBuj4fg?=
 =?us-ascii?Q?ZE9dbauUuj03v6nEm/FRLDyfwXSvHRJ+8gUHlYkGEweCDJicCCHQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4ecf511-70c2-4d77-f19b-08df2f9291ef
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 16:44:27.0916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6FKnLyksaCC5iWfaWmYz7XNEBUK9pCTVnMFMdLB7QwdVsygdr+D2A3ZvC1V5oSn/qWamn7b5NLjdgLE2bE81DOWeBmPkkPQbHse2UOK6Cl0FsqW1zv9vTkf3B+/WsfRi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10974

On Tue, Oct 06, 2026 at 01:03:07AM +0000, Roland Dreier wrote:
> For a cyclic transfer, axi_chan_block_xfer_complete() looks for the
> LLI whose address matches CH_LLP by walking the descriptor's hw_desc
> array, but it bounds the walk with chan->descs_allocated. That counts
> the LLIs of every descriptor allocated on the channel, not just this
> one. If CH_LLP matches none of the descriptor's LLIs (should never
> happen, but...) while another descriptor is allocated, the loop reads
> past the end of the array.
>
> Bound the walk with the descriptor's nr_hw_descs, as in the
> already-queued patch "dmaengine: dw-axi-dmac: Fix LLI dump
> out-of-bounds access".
>
> Assisted-by: LLM
> Signed-off-by: Roland Dreier <rolanddreier@rivian.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> index eebed2474210..813d17a278e7 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -1095,7 +1095,6 @@ static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
>
>  static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
>  {
> -	int count = atomic_read(&chan->descs_allocated);
>  	struct axi_dma_hw_desc *hw_desc;
>  	struct axi_dma_desc *desc;
>  	struct virt_dma_desc *vd;
> @@ -1122,7 +1121,7 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
>  		desc = vd_to_axi_desc(vd);
>  		if (desc) {
>  			llp = lo_hi_readq(chan->chan_regs + CH_LLP);
> -			for (i = 0; i < count; i++) {
> +			for (i = 0; i < desc->nr_hw_descs; i++) {
>  				hw_desc = &desc->hw_desc[i];
>  				if (hw_desc->llp == llp) {
>  					axi_chan_irq_clear(chan, hw_desc->lli->status_lo);
>
> --
> 2.54.0
>
