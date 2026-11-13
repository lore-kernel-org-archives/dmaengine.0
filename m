Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794597433;
	b=BzBt3j7XZPGcmQbqpGYMCcwkGBlP9ySzsXyNrRJz/ZoARuOXHn3HNhetXTrjVRCcVCQm
	 H0NwLjLfIpnGlAk+KX92UAkyIJvybq2rK+lzcp7S2tOF1WVM3/eId6cy1eTkPgHReyN6/
	 bMznN1juW5ONeCPyWeAF6uSu8AMMMkxIavRMc62tpdK44wIPLq9B/X/BAXJXGez80Om+x
	 RxHvx36jZQUZKoErIxjRJYPMa8Tvjdfpgmze/ARgX+eEFQRI/pGrjTeqxdy7pW6bJrxbc
	 JYs0PRvcE3Eg/fZ3u7c+mS6LJCGpdudq9ARa7fj7KTfZpBAm3Nb+oqonpM99kduwlQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794597433;
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
	bh=b1XYnIt1lApY4YFM4IKFhv+AVRPEbUIREWKuYtNAHXI=;
	b=awIj1ttbwxd4dxa1nT9E5G1LRdga2YHolqxSZk2EjohWIMdfhRjLjkr2+WTq8bPrD7Ip
	 Xm9cvd4yH8OlbvyxrtexDPvyVcjMjHRnhZ87mZ2SkwswEe+xt+qw69VUvZ3qoX8WFOpU8
	 nyEfbVgXEB7O35bt0BHMlH8BgVuh646jTDf87bnA+QhByQeJWtxIX9owox6ekGGLk24Q4
	 1+dGW0ON1gQJjLBLjnTlQsz4M+b88ZYxs9BRuxSGzSZIy0Z6yIrf7+K4lgEpkyfahds/u
	 xIoL9ysR+gKu3CjZR0vI8qJWs491Ssht2JpwGfDWUUPrkftTh5N3BjtWWt+gKKclP8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=exOnpRP4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.22
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013022.outbound.protection.outlook.com [52.101.83.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD55606A333;
	Fri, 13 Nov 2026 19:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FD55606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=exOnpRP4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LBrHZgrqerMEDQ+oyQ3ujrCfL2g8L8J07GCrh4FKeu2++xz8GWBgGfYgNt0ZTIWcyJFryuZ8VTvEOHFe3F4VXEvjrSjajUQB/YIq7ecp2La0/FNDBrE1i5I6Y9uI3+yqhy6s2+4HLS9ir1mMY8k1eIpkTRYOa43yI/v+kw4fmb0oBuiimaGRqlB9/yfXFzDwvwLAR2xB9M1tk4Jf6ozzRIxncsB0rO+ygCdoZzbIJY9BTujIyUNsxQY+znsXu2dnug0RAHSOVPl9ydie+EP4pOPfKpgJDTDk3fQFfAyvh1NM3aOBXB4ECJO3cRjTJ7qkEgNWY5uGMXVq4M4iUYnshg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1XYnIt1lApY4YFM4IKFhv+AVRPEbUIREWKuYtNAHXI=;
 b=cTlav3DCdPrWsFrnfj35ZYPwPKcEuvsmFxCSfiJJtLEAKMLpNv8mrMRoPbld8lbjSszHxBlWyzV5WPjPSEMnMj154nTMRoTMggEah1cyPDYLqJFtzJEx68XTuK0F5oeApHJIUFjZFrFEzrPRkGKI0Yh9jcrCB+MQleUkSq+yMjPt0263G07+lZmdZbs37CwpN7zjrqE1gaTpjTvm7kjkuzFbNmjhGkzJagrI4rZbx7ZMNQgLd+02F/HgKBZSW3n12ViF8BHwM2S2IDFhkPGrjOtNRAj88O9XN2MOM0oraMdA9GCZBEQE3BXshefGnbmgAvsNI3rmQ7lrVNq6AYeauQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1XYnIt1lApY4YFM4IKFhv+AVRPEbUIREWKuYtNAHXI=;
 b=exOnpRP4oaejmv2lFL+yP2KA3KH9uNlcjUTIoklJaQZTkX4ftohpvyGSgDUMAPXReiWHtwfsBkOuanGYLxI9g36U8rFnYmkxMIOrqn8e66Vk4a+VQGAvwxnZIVApYHb4Mz8EKOzra+Gw/NVCiaDiQKNdsCKR0+iAsWKdHsDKvd9Aw+/ERibeTpTq1HV1RRjR+rfT4ObybB9urM4ijALS0BbGdLDp5+dPX+M8XuQiVotN+sBpDC0D2qvPqFdYNIojibHgGAPF27tgmp+qOeLBFtf2kKRXN9J4/K0E+ATLwijRowF4R+ysUUNbvU0dRIlxNMNI9VN/QDXfvTuIF2NODw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS8PR04MB8898.eurprd04.prod.outlook.com (2603:10a6:20b:42d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 13 Nov
 2026 19:17:09 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 19:17:09 +0000
Date: Fri, 13 Nov 2026 14:17:02 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Maxime Ripard <mripard@kernel.org>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: sun4i: retain cyclic descriptors until
 callbacks drain
Message-ID: <avdiLjdrrdLsuooY@lizhi-Precision-Tower-5810>
References: <20261103-submit-sun4i-dma-callback-lifetime-v1-v1-1-4c5a0653104f@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103-submit-sun4i-dma-callback-lifetime-v1-v1-1-4c5a0653104f@gmail.com>
X-ClientProxiedBy: DM6PR03CA0088.namprd03.prod.outlook.com
 (2603:10b6:5:333::21) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS8PR04MB8898:EE_
X-MS-Office365-Filtering-Correlation-Id: 3183ca99-0bed-4adf-9817-08df41bab697
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|19092799006|7416014|376014|3023799007|56012099006|261026121527099003|261009223027099003|261026140227099003|5023799004|261021123027099003|11063799006|261102123227099003|261022075727099003|261021121427099003|261028144727099003|261022105027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Ao5KzpXuSLGHkUgVRRryRh5DZn9HS/Y1/okbQ4ZFkWyYvuN14TS0cx6Emp2vW6NVnAj8F1O9U14rxKBHKkuwsTO4Otb1H1oGyDvETa2+rOCgE8SEolWWhlMitFB7DrY3DjY+gPsmhYB5xw2urpnX1iOFeauF+FpdrA7xsKjA6+OEpoLGzRtjdk5fbeAvbJ+CfAsPZHIYT+57jncAFgIml9ibz16Bm68ls0phWGErURj/kQjabFpIYprnq3nRbtxkwZIFUhxbXuSPrccQsr/0NS2r/ToUhZ6W211tGCjCLJ+ElUTnPwIxyXXY46bw2YZrtC3+qbXgLNBEEhMs4UC8d3GcnmFC8uqNGByADBvoJscxu1vhKdqoDEX3E6Yusllp8TyL0s8bcp1+cWpvZqDxNTIPmwdhiu3okRBgVAdMBEf6TiOTkQoo1js3kWrHD7v8US6UcfZewuB3uAqXxbaBMNEouW9xYS+C60MrTJrVNPvi30Po91CaecoQSxIkcr57ozvytP9m/4UqNZhMYQjifpN3g3pcoBp/avlQINQ04lADD7k2866c5LIDTxX8D/p1ZYUdr3wVgUh8EC5laqgzNQGpPKB6fCW7aZ8NqkumDgOIMaR5ylOTJCnheR4v7z8rUDOhvl5Oj6V6c4MuUso7lJYBQcBEwmffWXeSRPv0KXY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(19092799006)(7416014)(376014)(3023799007)(56012099006)(261026121527099003)(261009223027099003)(261026140227099003)(5023799004)(261021123027099003)(11063799006)(261102123227099003)(261022075727099003)(261021121427099003)(261028144727099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iTd0MuBEVke5JOf8srRf8zkeMwgGsFC86/3sTDYcCUEiFohpZLrd0nUBqhh6?=
 =?us-ascii?Q?aZyXBVmWs9WKP9E8IBrf4H5QIo956ndi5+9a3or68Gqk4dWjKt0H3oCPmV5H?=
 =?us-ascii?Q?wbS5b6QZz9AGqcZ9Nt0Gk3/oCY3hyyJvn+GUIQ90JIzIP9IdXFaKNOFBuOHD?=
 =?us-ascii?Q?64FS0fJ/etqlGsAtrorqbdz8EX5g/buOGnmD63SN/uULDbsJL+R57XVc+VGO?=
 =?us-ascii?Q?1/aGCbo7uN1w825TfqBRGdhheSdXxMvOv7L+808WzWFsgAtdWiJ22hrhN1Zx?=
 =?us-ascii?Q?iERV1jbOnji6SuFDURzkQ1VlhsJr/ai8CQ6uOIwztfOqKyIchVxX8zUxD8kE?=
 =?us-ascii?Q?112xD81SjjxLepw+MP+DPOj0nMIQ63TWsCfWDiq9r1tFaG9nCcwXxB6v+uJm?=
 =?us-ascii?Q?qnjv0d3pGyB13MWUsRvZMn/+z1JP9H54pAgJvBHccAl4UVwB8oNeYeFwkeo0?=
 =?us-ascii?Q?07t5wn9qTDoAKllk/MWxnE63bWhukdNzj8uckJFfPqciHjMso6a+3vD4Cqh5?=
 =?us-ascii?Q?xSwL9bdGkhTGNPO0KA1sm8GC/jODKB6L+lforiE2TtGKQB88Fl+tQ0BoLBBo?=
 =?us-ascii?Q?7zCnEwOADLz9Iz8dmYL7kQRvTmUJj4VSivBqAYhkB+kKTAWCp69cvMFXqdSO?=
 =?us-ascii?Q?TrcR/g1B8Z2LlqsKRkzd5pVvfSgKx1v8N/sStT+UVcgQXOy3A3/e7L2fONx0?=
 =?us-ascii?Q?DJqVvLIfQHpaxYAdJxziDH98qB/bgJOQ6fL2OT9YtSfG7e7/X2gP4fBYOfs7?=
 =?us-ascii?Q?XawQ5rRKvYswq5YAkQITxmFgG7daZ7GPEyD5nkSowkDMykjhoPDUctSRAZfy?=
 =?us-ascii?Q?EitiRcSx/UiiolQpKoasP6Oa3ZG+UytAD12pBRjPQibzWq6L9PGjHOwiMR36?=
 =?us-ascii?Q?9M4HcVgqx96x96NwdIFwHGz0D3FMEF+Qq3IeM9RjvG/GpqJKiWugX1b9cAbF?=
 =?us-ascii?Q?DrG4O5AZCpTwNzg+3GUes2n9jXhuWl2MzHJvSwTUUBiMJDwTIcI37m2b1Q4x?=
 =?us-ascii?Q?kTEddDMFpzegKd2wkB+50SgA3CfjR0t12hAighyaeGtIXNBJYnHukacaDPfE?=
 =?us-ascii?Q?fYBSnayRsrhaQdSOY4B3Duz3jgq7D15dMM/yUFmyjEBsl89z0KnVlV2dM3u8?=
 =?us-ascii?Q?SIUkjrVyrVKIFLrn+Cf5jzDa1VESIlKe39MYD5QkFdVCHk2WfYQjKx+a/Xu0?=
 =?us-ascii?Q?rXf0968OY/f5CsYjnSnN+ei//T9hT+Kvs1zfmsnAcS9KVKYonwbaQJHyAQ/W?=
 =?us-ascii?Q?XCFG5GKVVw5PYP/hu6Cjk1F2Q55NxSzUs/3hrILGeMV8v5lkR7mLLWnyvDS5?=
 =?us-ascii?Q?D089dmmcX4K73d4SQKlgktt2ZvvK7WETP3wtrbonXPemjgEA03YIi6IQoc1Z?=
 =?us-ascii?Q?vMRiGTY2/V5uhsekPjqEwghr3BajhZPXNLrZDzeKem1UwLo5wrJfAYRADKGe?=
 =?us-ascii?Q?d93U6myFqPQQwSpSzcZ6to2j8dfkO0XLzI1Dfbj9sIzn9h6mW/Wyq9E7x8Gk?=
 =?us-ascii?Q?qbUlGn5uuyuZDmLH55ddbfeyExB+rY02GADJHUrigfITu0NtgVAoLyuMDRBD?=
 =?us-ascii?Q?9f0tT8rnEv4bniUEPMFRxMF20y1NYS7i0dLoPn4vc8lJN0ArGU9BBbCpomMB?=
 =?us-ascii?Q?9/TJwzsEuIMjo8p3a93mUOl2km4AJ8dAASz2p+MSkRZYHjYHHGmD+UxMqVCU?=
 =?us-ascii?Q?g8snKfc80rwfOw3fevcGRGuddkDUzuFH0WtkaxOkxj9xxczUfFtOmTNeHaqh?=
 =?us-ascii?Q?RckML+0EV80OGfV1c82ycHc/aYRHkvZk0ZphSafPyceCAcc5umGl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3183ca99-0bed-4adf-9817-08df41bab697
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 19:17:09.4679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fHn/QxxQNe/rOzCPG+T0FgrypotUKU0HCf9maCqIyzGdRtVLY13G8lbWRVFGQgtn445GnwrTPtJB6DZvnPRUB3Lmx+o0L59ovafUeRTVDgU1O6BXfmSRLldwYiraEhuY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8898

On Tue, Nov 03, 2026 at 11:25:58PM -0700, James Hilliard wrote:
> A cyclic IRQ queues a virt-dma tasklet with a pointer to the active
> descriptor. sun4i_dma_terminate_all() frees it without clearing the queued
> cyclic callback or waiting for one which has already started. The tasklet
> can subsequently access the freed descriptor. There is no
> device_synchronize callback to let clients drain these callbacks before
> releasing their own resources either.
>
> Serialize both half-transfer and end-transfer IRQ handling with termination
> under the virtual-channel lock. Recheck the physical-channel association
> after acquiring that lock so an IRQ which looked up the channel before
> termination cannot use its detached transfer state.
>
> Move terminated cyclic descriptors to the virt-dma terminated list. This
> clears any pending cyclic callback. Retain them until a new synchronize
> callback has waited for the IRQ handler and drained the tasklet. Drain
> callbacks before freeing channel resources as well. Termination itself
> remains usable from atomic context and from a completion callback.
>
> Keep freeing other collected descriptors immediately: an in-flight
> non-cyclic callback owns its descriptor on the tasklet's private list.
>
> Fixes: b096c1377d1e ("dmaengine: sun4i: Add support for the DMA engine on sun[457]i SoCs")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/dma/sun4i-dma.c | 46 +++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 35 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
> index 225e4a53502b..b92cd9c8676e 100644
> --- a/drivers/dma/sun4i-dma.c
> +++ b/drivers/dma/sun4i-dma.c
> @@ -293,10 +293,20 @@ static int convert_buswidth(enum dma_slave_buswidth addr_width)
>  	return (addr_width >> 1);
>  }
>
> +static void sun4i_dma_synchronize(struct dma_chan *chan)
> +{
> +	struct sun4i_dma_dev *priv = to_sun4i_dma_dev(chan->device);
> +	struct sun4i_dma_vchan *vchan = to_sun4i_dma_vchan(chan);
> +
> +	synchronize_irq(priv->irq);
> +	vchan_synchronize(&vchan->vc);
> +}
> +
>  static void sun4i_dma_free_chan_resources(struct dma_chan *chan)
>  {
>  	struct sun4i_dma_vchan *vchan = to_sun4i_dma_vchan(chan);
>
> +	sun4i_dma_synchronize(chan);
>  	vchan_free_chan_resources(&vchan->vc);
>  }
>
> @@ -322,7 +332,7 @@ static struct sun4i_dma_pchan *find_and_use_pchan(struct sun4i_dma_dev *priv,
>  	spin_lock_irqsave(&priv->lock, flags);
>  	for_each_clear_bit_from(i, priv->pchans_used, max) {
>  		pchan = &pchans[i];
> -		pchan->vchan = vchan;
> +		WRITE_ONCE(pchan->vchan, vchan);
>  		set_bit(i, priv->pchans_used);
>  		break;
>  	}
> @@ -339,7 +349,7 @@ static void release_pchan(struct sun4i_dma_dev *priv,
>
>  	spin_lock_irqsave(&priv->lock, flags);
>
> -	pchan->vchan = NULL;
> +	WRITE_ONCE(pchan->vchan, NULL);
>  	clear_bit(nr, priv->pchans_used);
>
>  	spin_unlock_irqrestore(&priv->lock, flags);
> @@ -970,13 +980,13 @@ static int sun4i_dma_terminate_all(struct dma_chan *chan)
>  {
>  	struct sun4i_dma_dev *priv = to_sun4i_dma_dev(chan->device);
>  	struct sun4i_dma_vchan *vchan = to_sun4i_dma_vchan(chan);
> -	struct sun4i_dma_pchan *pchan = vchan->pchan;
> +	struct sun4i_dma_pchan *pchan;
> +	struct virt_dma_desc *vd, *tmp;
>  	LIST_HEAD(head);
>  	unsigned long flags;
>
>  	spin_lock_irqsave(&vchan->vc.lock, flags);
> -	vchan_get_all_descriptors(&vchan->vc, &head);
> -	spin_unlock_irqrestore(&vchan->vc.lock, flags);
> +	pchan = vchan->pchan;
>
>  	/*
>  	 * Clearing the configuration register will halt the pchan. Interrupts
> @@ -991,10 +1001,20 @@ static int sun4i_dma_terminate_all(struct dma_chan *chan)
>  		release_pchan(priv, pchan);
>  	}
>
> -	spin_lock_irqsave(&vchan->vc.lock, flags);
>  	/* Clear these so the vchan is usable again */
>  	vchan->processing = NULL;
>  	vchan->pchan = NULL;
> +	vchan->contract = NULL;
> +
> +	/* A tasklet may already be using the active cyclic descriptor. */
> +	vchan_get_all_descriptors(&vchan->vc, &head);
> +	list_for_each_entry_safe(vd, tmp, &head, node) {
> +		if (!to_sun4i_dma_contract(vd)->is_cyclic)
> +			continue;
> +
> +		list_del(&vd->node);
> +		vchan_terminate_vdesc(vd);
> +	}

Can you move this logic to vchan-dma.c/h ? I supose other vchan should use
this similar logic also.

Frank

>  	spin_unlock_irqrestore(&vchan->vc.lock, flags);
>
>  	vchan_dma_desc_free_list(&vchan->vc, &head);
> @@ -1128,9 +1148,15 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
>
>  	for_each_set_bit(bit, &pendirq, 32) {
>  		pchan = &pchans[bit >> 1];
> -		vchan = pchan->vchan;
> +		vchan = READ_ONCE(pchan->vchan);
>  		if (!vchan) /* a terminated channel may still interrupt */
>  			continue;
> +
> +		spin_lock(&vchan->vc.lock);
> +		if (vchan->pchan != pchan || !vchan->processing) {
> +			spin_unlock(&vchan->vc.lock);
> +			continue;
> +		}
>  		contract = vchan->contract;
>
>  		/*
> @@ -1138,8 +1164,6 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
>  		 * interrupt (odd bit)
>  		 */
>  		if (bit & 1) {
> -			spin_lock(&vchan->vc.lock);
> -
>  			/*
>  			 * Move the promise into the completed list now that
>  			 * we're done with it
> @@ -1173,8 +1197,6 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
>  				disableirqs |= BIT(bit);
>  				release_pchan(priv, pchan);
>  			}
> -
> -			spin_unlock(&vchan->vc.lock);
>  		} else {
>  			/* Half done interrupt */
>  			if (contract->is_cyclic)
> @@ -1182,6 +1204,7 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
>  			else
>  				disableirqs |= BIT(bit);
>  		}
> +		spin_unlock(&vchan->vc.lock);
>  	}
>
>  	/* Disable the IRQs for events we handled */
> @@ -1276,6 +1299,7 @@ static int sun4i_dma_probe(struct platform_device *pdev)
>  	priv->slave.device_prep_dma_cyclic	= sun4i_dma_prep_dma_cyclic;
>  	priv->slave.device_config		= sun4i_dma_config;
>  	priv->slave.device_terminate_all	= sun4i_dma_terminate_all;
> +	priv->slave.device_synchronize	= sun4i_dma_synchronize;
>  	priv->slave.copy_align			= 2;
>  	priv->slave.src_addr_widths		= BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
>  						  BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
>
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261103-submit-sun4i-dma-callback-lifetime-v1-b6192060b76f
>
> Best regards,
> --
> James Hilliard <james.hilliard1@gmail.com>
>
