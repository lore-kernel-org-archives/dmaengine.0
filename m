Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011034.outbound.protection.outlook.com [52.101.70.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2322251C05C;
	Fri, 16 Oct 2026 16:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166951; cv=fail; b=AUvA9WJXNtA+I7O66nEcNPSbLSfJwg5VxD+efEWjZVp/3NvUsDgJcYF4GaVJuyWJGOz9a9is7aRCQXxPhTXXT2+1JohhSg51SZ/tI7KjgEmv1envU8Ngr/od3w3qzyaq3uyxurPQflMidjOBddJkqMJ/vBm484eW7Id9Q5m7ZAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166951; c=relaxed/simple;
	bh=giBeAHQ7+U6KCtIrGv+m3Ddw+OAQCY06X0ZmFFnDdFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=T/sXz/QGRXXjxjykYmVupI5/cQEIStDLlZM0AvL1qlHa9yMbcYo2Pwfsv+cYV7tEHU4aINaYVEvZM8B/kKwzWDUUxnFVN7J7KbXn5Td9giLs/TrmJEXDdlyyzcuTIC+Apbel2gfBBftF4YTpB5yOkeURxHw6Asmt6HT0Z6dyFHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JB2F1dyD; arc=fail smtp.client-ip=52.101.70.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JB2F1dyD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ApDX/mOQ+YuIRYaHkCBNAURRKHgG0k3nywZjSncdCQAx6BBRrJz7NODQ8HFUfhqVfSITqCJ7NRpMlHgf/TAAa8E9LTuEfDeAIB19SpfqD+Ze/z9hv3ITOZXWj5/fe0qfJyQLG1cHRzFjjcdm0xIxrdbo63ewlgY/HDE1gKqtDj3mPIHIQZ9Sh3tFi5u2bWjaCLzqt6YMLRySerG1TkgUjmS/vgTDsrpbHUTo3rw6W6iTssKn20SAqwLkpyw7ddE1HiFYIJfrY6t/kBtUjn8tXqMO/pP8gBxwMT03A3a0qf5L99yPkL0P5JDH++QEvIkREweBZlD0ImHehhaCYr2j2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnvQwYCr7PSNDSg5BNgKt/aFE3edtT9hvJn/4m4dN+g=;
 b=h70hI+XpgIJLqL0EuDNEyxAckJUK5h9J4huZxnUsDtneIUH66hWE9k7a8WSmJ7OPREqifSwR3rhIaJjvn8wTS7DORU4VK1XaNokRKmR5s0GsLqPgwJkicjvEkGcPhzXC84yZr2gjJliExx3RUWInf0diOCv9h2OWrJNKX14iOMAnN+LAwUZEaNVzSFmugrlXtHVr3Jr+M8+q8PrStLc1lWlfjNdBSzZLcHDMueYG2Jvv5Fo0y/H2Sz6/YhMg/LozL8yd59zY4DbVA8Z7+q/fKbBASML6m7jYV3GUNzdUjZTvtUW44tefNAElN4CH2uRKQvAHSH2z+ilGaVpEPMjniw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnvQwYCr7PSNDSg5BNgKt/aFE3edtT9hvJn/4m4dN+g=;
 b=JB2F1dyD9MRF2wc+k2764DoxVhz9+qK+KBLFrgfN5rYh8Kjsld6sS6CqwiIAvegv13hwdUZR1fDwG2ykYloYFIiDFGwr++Zm87OhZPkVWYFXj2XsK6m1tZ+Evd60ZmQRN3PO/cU8nmqpqXmsarTzfaSfDwXOyyw6fTS7bEPaC5fNeMhQFRVC0dhNpRSK2DcbhIeULqoNbkC0gAmpAAe0Zeu9RnoMJntb0URxUqvT3fM89438nCZjRnqZlHtxpubDxIEP8vEWSNnKyo2f3aBGryt/ucmgOPUVQ9dZ9KGTdLN0cPJVbx2fykZbdvr6AnnKSo1DlNzUCT2uh54LlbbWlw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MI7PR04MB167766.eurprd04.prod.outlook.com (2603:10a6:290:10a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 16:09:05 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 16:09:05 +0000
Date: Fri, 16 Oct 2026 12:08:58 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Hao-Qun Huang <alvinhuang0603@gmail.com>
Cc: Kelvin Cao <kelvin.cao@microchip.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	George Ge <george.ge@microchip.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: switchtec-dma: preserve results for
 out-of-order completions
Message-ID: <atJMGkMniKQTgnTJ@lizhi-Precision-Tower-5810>
References: <20260718223257.5662.alvinhuang0603@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718223257.5662.alvinhuang0603@gmail.com>
X-ClientProxiedBy: PH7P220CA0105.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MI7PR04MB167766:EE_
X-MS-Office365-Filtering-Correlation-Id: 786599b6-5e73-4b8a-1a59-08df2b9fcd13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|19092799006|366016|56012099006|5023799004|11063799006|261009223027099003|18002099003|10067099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	jO/rxMiTdh51NG+8PLWb3xr+kK2aPeb5NUcdcIfN++mkCU84lmGlaXcK+moaXYaFlnmKuXx7yoPOeb//kcBSLQK3ezFFn9YYa0X9vsDG/oqdCfEWvaagaLh1mfJlrmzsL09WdVH9Ce1Ka9X7iIz4ofn1WItriipu89bv7DZEke+aLnMcbjxMIXvlM/Zl3KpOkhWvv6uQdulIvjnCYIit+NCpmC/LX2Nar5wcY4wG1j/qi7/8q9MejmAfA6N1vAnYVTlUJ+LZn4qb6WPUaM/t+gLBcr2JGq6t7CbRa7i79ljAnsGY+03EhG708Ga7ITMais1+Md/JEJqTpLodu0LuO8oQOlfJVHD6b/QhP+rJqPQlFWWFbniI3ic1O/qUDLX6QMWVZp8Tvg4lUdS6IRLHZXyZI9i3Z8KEaljI9nzhjL2l4VpzlNS/YmrhQTD7jl4Hr1U/fhtpQ0bQgXSZCzK/6OjkAUrM8d0uw1vg/wdYmisIVtucQen25xcI4Dd5UsfXN94R3frN32eFmYTQqp6ixxJ8t/5UfPdoTcJ0dioiQOtSVJehZO+ICbcHfTe/cEd44ne1ekxSSNn5NxlGH1Q6jf2fpNHem5Xwnf0yYSDa8fkBrdvF4W0gP52o3MxIyHGZXj8QXKYFAKmLHidWy0fv/YqAcz9OU9JVBkRaRjIA/38=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(19092799006)(366016)(56012099006)(5023799004)(11063799006)(261009223027099003)(18002099003)(10067099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y9PibAL0y3LIzBWkE5ZusT37ikKleeiLWqmx+VVpTP1uhgg91QyZ5Fx9W6pN?=
 =?us-ascii?Q?By7Tc0iMh3DnpkzP1iG7OnC27xjUMVwUD8XSZIgA4uEkMQ0LLI1zccCpQ14d?=
 =?us-ascii?Q?ja9LIXIe3d/rjomp6z84OW0tn74P5fcjs4zBqWRKz0VL2ycGZMnf3PpiN0Cv?=
 =?us-ascii?Q?8nu9Iz5jHL9o6dH6YlyyM3VOdmHWqdex5GqxzC/zfmQoPkyFe41TUkAKAw+c?=
 =?us-ascii?Q?3DArR8lsE9yFk31K2tOqLbZv1hJhmaFoieiRMDJSwC5mVVGIx4jZ7+1NikAC?=
 =?us-ascii?Q?r/F/nPc5Wd1OqTTyW7iWX5CUr8O4RNJzpPvRUunadiCdWXlOFDWViqVLbFs0?=
 =?us-ascii?Q?ZLiG37pITCvx7PBkOrbP07BnTnf4ugUoDj7Z/e1TSxi0RbQMLoSeZf0wUJgn?=
 =?us-ascii?Q?qqexBgHa7hlAzQFy0zQaYlferycuvMiBumhAyL0XxxVfXaYuwq7bGxILSope?=
 =?us-ascii?Q?yh6vK+t0N6C51ow6tlje+d5Xh4Lu+yeYp9c1MRZ/EMye39QhhCg/6AclJcsL?=
 =?us-ascii?Q?5JCy/edmFDTylgmiNS/39UDcX04ZoL2GIxy4aDr+nhMgN/S+9c3zBbisoWup?=
 =?us-ascii?Q?dymg1m5OFXWLKjtIuM99bMAaFaHRdMFZNAy/mbAZIi7X0Vp/PIzvvreH+EoG?=
 =?us-ascii?Q?YkHpv/z/raCdZCS+Z3U8jtxAJYI4qeNgshK9Ip3I4q6k0UAJOGNw56K+sJp7?=
 =?us-ascii?Q?oD2s1ReVBEZ5fm53DNNlvmTbDF+Snn3jegY70bhE3Px353eClpmhxEs9A3/F?=
 =?us-ascii?Q?8KyG6ctUPXNVlzKU3+ilWUY2/TWtZGkeyDw7HHujkhaSVPZ5oG37klZ62+6h?=
 =?us-ascii?Q?REa9igh8YydvZfbi6zqnwlmU5YU1of9t6JTdOHH7Gqc4b5E+/yx6ahy15g27?=
 =?us-ascii?Q?1bmsTaqCzLTzWJ2cwxfuEEUuWzaSZ4JRZTBd1vJymhDKvdtqI9HbpfNm47cw?=
 =?us-ascii?Q?zXnCnDIguESb6zYU5sQecu/NmqygRRgG8f6t1YSCwaMspGogu3/AYiCMq6BN?=
 =?us-ascii?Q?VxTcnJF5hr3QTN3C2UtVEZkJGB8s0oZBGNizXSfFXgMIMxafyyLAn01VycsV?=
 =?us-ascii?Q?7ylAlkamXbz4w4rPnXANIJSTGy0bMnKwwfxHgOty94d9kkFRT7PyLrFBlMri?=
 =?us-ascii?Q?EnOBZkaup4XGErdiwe38Hj53MR1f8ZYl1PT6/AGZEM6YBlGCa2uGcrMD7phL?=
 =?us-ascii?Q?PEb71kqDXLwtFhI8uQa2XHYD1WjBe/jQB1U+J4+2pqCJ3w8yY5hqFq3xW2nf?=
 =?us-ascii?Q?Nvtn0y0VCXNaexBh3hDCutnvlDq1EWP76K6ctAGM0vm7Azf5aYWU39ghsx/L?=
 =?us-ascii?Q?vD6ba9M8NE4QwypBVpJo0ZDnCWC7NpaPEcR/TxZSPxEZqdU2NuuNeMoI9WGM?=
 =?us-ascii?Q?zj9MAB0DAZbYGDVkX9tos6KCfOBhuDgT1V5Q6Qptusl5Bn04fMZTNIjlUJUN?=
 =?us-ascii?Q?UwUdQHDgurK4GrPOl8zu5szc/NZfNjQKjZV3vTyiYDrIY+wBFzEjHPHRnA8G?=
 =?us-ascii?Q?IClM0F2sDJm3SoAM+zINQHIVcALKQFYng9Ucp+onlWEnqPc8H/bLpYkzAgYE?=
 =?us-ascii?Q?PK/sQTMMOzSg+8RYZRL1pSurOUKYU2Pw1HEy1s45lhBlC5crk/5MCYHhIet1?=
 =?us-ascii?Q?vRyd0Oxo/AKCr5YCgAUFgOZVhdDcpg6rXGodpPjgj/9ijA767GEJwuEehpg8?=
 =?us-ascii?Q?QmbLb8LcUzNGktZ/WWDBZTYkxVvDhMm3IdfJOVDX2aDIhdS8pJx9/MT3O2O2?=
 =?us-ascii?Q?ZAaocK/eqc/ju/chFxNuzAv3d/4e99W679uGoX8FisVSKQx1LcYd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 786599b6-5e73-4b8a-1a59-08df2b9fcd13
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 16:09:05.1973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8+NZtdScGdonDUb33vsxgmpB89RgDTmzF5FaaXYPKs0mvshOM3Vqwk0vVJR6+7oEQPxDjUwhFfivMNr+RWWWjN5Hw+LtiRcdppJJWw1bkmBT6YjeN6xX1xoCWwL+/YQQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI7PR04MB167766

On Sat, Jul 18, 2026 at 10:32:57PM +0800, Hao-Qun Huang wrote:
> Switchtec completion entries can arrive out of submission order, and the
> driver handles that by marking the descriptor complete and deferring its
> callback until the ring tail catches up.  The problem is that the
> per-transfer result (status and residue) is only kept in a stack variable
> while the completion entry is being read.  Once the tail gap closes,
> cleanup retires the descriptor at the tail along with any already
> completed descriptors behind it, and hands the same stack result to every
> one of them.
>
> So a transfer that failed out of order can be reported as successful (or
> the other way round) depending on which completion happened to close the
> gap, and the residue can end up coming from the wrong transfer too.
>
> Keep the result in each descriptor instead of on the stack, and pass the
> descriptor's own saved result when it is retired.  Cookie ordering, the
> CID-to-descriptor mapping and the completion locking are unchanged; only
> the result handed to each callback is corrected.
>
> Fixes: 30eba9df76ad ("dmaengine: switchtec-dma: Implement hardware initialization and cleanup")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Hao-Qun Huang <alvinhuang0603@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/switchtec_dma.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma/switchtec_dma.c b/drivers/dma/switchtec_dma.c
> index 3ef928640615..681540836e73 100644
> --- a/drivers/dma/switchtec_dma.c
> +++ b/drivers/dma/switchtec_dma.c
> @@ -246,6 +246,7 @@ struct switchtec_dma_hw_ce {
>  struct switchtec_dma_desc {
>  	struct dma_async_tx_descriptor txd;
>  	struct switchtec_dma_hw_se_desc *hw;
> +	struct dmaengine_result result;
>  	u32 orig_size;
>  	bool completed;
>  };
> @@ -409,7 +410,6 @@ switchtec_dma_cleanup_completed(struct switchtec_dma_chan *swdma_chan)
>  	struct device *chan_dev = &swdma_chan->dma_chan.dev->device;
>  	struct switchtec_dma_desc *desc;
>  	struct switchtec_dma_hw_ce *ce;
> -	struct dmaengine_result res;
>  	int tail, cid, se_idx, i;
>  	__le16 phase_tag;
>  	u32 sts_code;
> @@ -439,17 +439,17 @@ switchtec_dma_cleanup_completed(struct switchtec_dma_chan *swdma_chan)
>
>  		tail = swdma_chan->tail;
>
> -		res.residue = desc->orig_size - le32_to_cpu(ce->cpl_byte_cnt);
> +		desc->result.residue = desc->orig_size - le32_to_cpu(ce->cpl_byte_cnt);
>
>  		sts_code = le32_to_cpu(ce->sts_code);
>
>  		if (!(sts_code & SWITCHTEC_CE_SC_MASK)) {
> -			res.result = DMA_TRANS_NOERROR;
> +			desc->result.result = DMA_TRANS_NOERROR;
>  		} else {
>  			if (sts_code & SWITCHTEC_CE_SC_D_RD_CTO)
> -				res.result = DMA_TRANS_READ_FAILED;
> +				desc->result.result = DMA_TRANS_READ_FAILED;
>  			else
> -				res.result = DMA_TRANS_WRITE_FAILED;
> +				desc->result.result = DMA_TRANS_WRITE_FAILED;
>
>  			dev_err(chan_dev, "CID 0x%04x failed, SC 0x%08x\n", cid,
>  				(u32)(sts_code & SWITCHTEC_CE_SC_MASK));
> @@ -488,7 +488,7 @@ switchtec_dma_cleanup_completed(struct switchtec_dma_chan *swdma_chan)
>  		do {
>  			dma_cookie_complete(&desc->txd);
>  			dma_descriptor_unmap(&desc->txd);
> -			dmaengine_desc_get_callback_invoke(&desc->txd, &res);
> +			dmaengine_desc_get_callback_invoke(&desc->txd, &desc->result);
>  			desc->txd.callback = NULL;
>  			desc->txd.callback_result = NULL;
>  			desc->completed = false;
> --
> 2.43.0
>
