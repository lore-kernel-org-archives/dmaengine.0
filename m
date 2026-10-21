Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792601360;
	b=MQDaFfCUVu4gGTJKxzcI5bulgxPhI0Ah53hOXP1UfHEL8fZZxabSxosXuNXzABGoYjQc
	 tMGBAnoNv8ahq/m+uQwCs0wtiy2cxuRzNp4oCe00oQeMoNmm6CHpPuTvT3tFfQ7XR31sE
	 5zQV2teYWGhaNK7RMs/o0IbZeydZnDXChUQLq70GQhY1N0WIX3DZLsAIPzqW599WVwrki
	 Oq6nfDgPjbNBs6Ng8JdzN8ll1W+3uKlLm2ecRkBss6rs/n3WOQ4saGoNb9e98wWphen/3
	 emt+dAucfQQ2qJMn5ZA+Jq8CO9zQ320EcSme3AcvRQ8ZyejE7anTVBp66U46bpkgkYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601360;
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
	bh=gBatK4uqmjPdT1edeLXqOwktVYAUPZ47n54OYWH8Tt8=;
	b=mg5w5mxFJygdOHLJuUKMayrxzyIUD/XGPnamFWsfA2A406bk5IwbOr4taqBIEXOIPuTq
	 rrJdDlmIFWFuykOxwN9gyyHLJC3Hb0i5U3O/Uu/iQHkCzCXPFB8VKyI+tiIi8ndcoxGnK
	 Y/WEMCW9fHd0z32lbTXLNwGW0AIDuNpWwmXxN2eQOHtLfeqAoZVli0jPRbLQ4FMwv1pbq
	 KQ3bXGGJSfyFIiu6N4luD2e78HAKWw4EWOjWaNxMQxYdlgynnOZLgignVhfAPf7+HP3ef
	 s852CWvXbegz/uoYUEoRlwkXljLxnkCmWIe2b7oQQrynhqP72TxW7oPLzFWePYwpnEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=cuZEBJwT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.7
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010007.outbound.protection.outlook.com [52.101.69.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35BC606A323;
	Wed, 21 Oct 2026 16:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A35BC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=cuZEBJwT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNRiqrrPFL8UOaUh6csnxegS4ntr31JzBGdAWm8dRSw5NBpGCThR4JCOwdXqcHgZVlOuVziTnYywg1rk0910dS/rCK9jIvJfiPydo8WpVEXDtVWNsSoE7Z81DBXFkhLC2a6F60x3/mp4Ix56+4LgSakNsE/XlkDcv/l0XGN9fXymWQbzuaE4BB1ifYTnURte0bzrwlOiGDqaWcTrDcYESv2W3zZU542pK8l+BzoQCA+ipK+vbcJyth4PbOE3G8cdagArzyrvQxQqqcIGEl5bLSiW3nP8I/QR5FyCsbg3JcXDxUc6r658uoTbaR4X8P0QXI2QnV6tQSf5pAUa5iaXsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gBatK4uqmjPdT1edeLXqOwktVYAUPZ47n54OYWH8Tt8=;
 b=qg9/vfCFnYPwBa81WXICLOPShpc18JaO5Qp3UwDKy3c76PZAhNxYKY8cLM5HAEO+WEeNLnb/yeRToT1LN+bKz+MvR8BjgGkkxv4LAti0MM9oJMeMInLiWOGyq9Z63TU5LahSEt52kTi/K0lURQC444jcywLgeffgXunNlcqcPGnUB5TygdkMa2f0QFeUUUV8DEL1GaIiXge3VciIcfrL5p0oRo+OgIWWhnlv5lr/mcOPjmDIREivm4aYUfTVR2Rox8O59xLjSR+mjKKHsjwboXhnZWZ2nfXlp9pYzpjmgex4NfxJSVHXriPu5Ygec7BYJPEkkActr5XneKlhR87MDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gBatK4uqmjPdT1edeLXqOwktVYAUPZ47n54OYWH8Tt8=;
 b=cuZEBJwTgDw0YIwwMYOvXGb0pTYzPEVgF8+cwo0fhS/72MGMuV20z9t7Ob71Fat2LhZDNZClwuPSP3HbHgGSjrSNoPna5hgNjh654A9MWGuxGaqquiZUO5ObmIHgyLqfcvcr73NGDxrVmsHPt0Qd+J3i5BgjXh9Cqbr/mhCsvudp5QoSO7deaGxzKwzMqew8f3lGJYjh/fq8ZWWvUi2MQ3nhTWkBsseN1NG/3V7VZXViMMv6VaEmrpwT6YIIhJEqqYBKdMG5MFC1HiPWS6Ub5TQrzB4EuMUc8C43FCxaYhbKGOhOluFwxDr6YhEdj38BO7lH6CWIIZdlJOdCdV4YDw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI1PR04MB9931.eurprd04.prod.outlook.com (2603:10a6:800:1d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 16:49:15 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 16:49:12 +0000
Date: Wed, 21 Oct 2026 12:49:04 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Roland Dreier <rolanddreier@rivian.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] dmaengine: dw-axi-dmac: Decode errors in the
 transfer failure log
Message-ID: <atjtALwK3XWAlCkm@lizhi-Precision-Tower-5810>
References: <20261006-dw-axi-fixes-v1-0-3b319e456d93@rivian.com>
 <20261006-dw-axi-fixes-v1-3-3b319e456d93@rivian.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-dw-axi-fixes-v1-3-3b319e456d93@rivian.com>
X-ClientProxiedBy: PH7P223CA0023.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::21) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI1PR04MB9931:EE_
X-MS-Office365-Filtering-Correlation-Id: efbf9614-6b58-4624-3871-08df2f933c52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|19092799006|1800799024|366016|6133799003|10067099003|18002099003|22082099003|261021121427099002|11063799006|5023799004|4143699003|261009223027099003|261021123027099002|56012099006;
X-Microsoft-Antispam-Message-Info:
	9mLSsJpHBVPGN7eFO3vPF2PFQCVLch5LdmQ6Io/ht3rDbOPNbLtoyqdIUedLNB3rN7H0Le5327dtRj6nrVFfC/SBPzzw5aFasBkdehvZfrxyrLWr+t5+Uce8Qu7x+IKCnlIAZ1HnoY2HWCwY5KcSNe7xZ9a+sGB/HGqZ0Xj00Aj8p8pt1buy1pzV7y593dsFfcOuimQhhFka4xbf9qvEPlPSIjilGPDShe6HURt8WGd0/nprJBbZcmVonMftNyz6H/FzAtKtXK4KuD1eMs7IcjBJdKoLrMRRxNg75ax15Agr5VMBEVCpHJjMbTSvXI60iFTJlCsWKzPFZIc32BN6w0GKOov4uRzROM42cMjdGbvNClO4W3PU+cHmvot1nGslhHv2CZo9KCiWekfWD8G2Jm2RodYmCOnj+p0d1MEKSrCc5D5cRkQerLeRmLIUvyS/6ACyHE4cg3tuqosgSxPhj1Z8qEw+7GecHPxcmNjAX3dLr6ouiOv0JNT7YgAgTDfePS4d4Nmd+OmdDTTQJN2D8lrg8ILZAYX8UT7mDocQlO9isR1OgzMc/ylzvQ01BOZMJxMCoapC0/ZAuf9YUrlZYLArnx75MRJnLKNkVaotGS6au4lhR2uE8SBx7WJWdEMnt8J70joJRQfm3rqBFmdriEoLPfslYjwSJ8r8LCtksgI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(1800799024)(366016)(6133799003)(10067099003)(18002099003)(22082099003)(261021121427099002)(11063799006)(5023799004)(4143699003)(261009223027099003)(261021123027099002)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/EefoTNR3MEc+BwCpn1V8ftdFfncBB4hKFqPW61bF7l/Cw9pz+/NDfo5e8xq?=
 =?us-ascii?Q?Qj51JwoxBCRn0bWaOIH+sk5gO5M+42m/9WWY1hukM2/CtsjpOT7XVll2wq/q?=
 =?us-ascii?Q?43Nan/HuSqQ0d/c2kAF5k8dedQ5FxXPB/4x7mUsO9SRwQQMV9IS3XJEbKwRG?=
 =?us-ascii?Q?ZPortuewjp4RdbQXgC/PJJTmZhPZnjeMFWGCivn4zhhJETICb16oeSGQLFGu?=
 =?us-ascii?Q?aSf6BUfhBHCFwgkbNyCs+TSQoF+jnqFinsSjLTZE/Soa0RbH7ST74M6++1+0?=
 =?us-ascii?Q?b6CsiL6N+3E4v+XC2tvyM5ixaO2H58qXHH3Bptmezq3edr0u/i78Z0ElJs5D?=
 =?us-ascii?Q?YMZB6DEBxbOXLU23rCZrrCbloILkhNL24kis79g+mblTHpBkz8u4UrnWCmjx?=
 =?us-ascii?Q?ykL9xke5UDIGKkTXdKaXIkyetWN+Kq0R9w66Es8qcabYnKU0k8OMYp1eM6Uz?=
 =?us-ascii?Q?EoeJF9Mo2KuXDYgx2umpTtmJgBnaNJTPuSDvqQuIp8dTvwD2lDPMIC7FX8sq?=
 =?us-ascii?Q?0SrFt1Z8KV8YfGRauJVtYi72ss0tvpXRwnSKU+tXtEEgyQxLPAI59zN3nzBd?=
 =?us-ascii?Q?X5fC+JpdOJWxWkd/EMP2CN1WeyxN9r/DrueGqDdMg/jxMZYbodx1FdQFMSVr?=
 =?us-ascii?Q?2YvO4ETNfKXS4EjyLkYmJKAddMXdmRVj7abZev1kunFOKocDHeRM+62L+uya?=
 =?us-ascii?Q?T/MCkV9YUAyxGUBhoezjqi7pr14P/6Qf44CAYngJPzABqSbD2VOJlUjhi6vB?=
 =?us-ascii?Q?FB6r9/QeOEM6SlUOerDuUN39ocbyJdgZZjnfExo10a3PrcWfBFngYgFKyOqA?=
 =?us-ascii?Q?qI7cW4JC8CTtfuxwvYs5+LEmIb04Cs1MhwNaqd8pJlHAZGAoBISNCKM0ktf6?=
 =?us-ascii?Q?D3GRXD8JOGVlhVQ8sTMRvi0pQ7YfGqetGMXNWNIAnkGyMI/C+fjSkxKJdksD?=
 =?us-ascii?Q?58ViTcl78CMe5P9I5bThiOlaP3X8CduDrJSVM3RU1VnKRc5TJKezghTRsZKP?=
 =?us-ascii?Q?RfpdTGPIh/6tt40RK9RZ2P+ccDzkqm8tReMycaem/aikIjgc/P0nFNIMOsIg?=
 =?us-ascii?Q?LV8FjaDw2yYDD4lPrBayKBMH+iTiDUGofN/jSQBKcRbdTCOhT2SmWmL+l8Q/?=
 =?us-ascii?Q?08AHQ061Y48gPrqXxdPFALDCrjYgRamhUFk1e0+/7kFjepNC85Xbu+4gnJyJ?=
 =?us-ascii?Q?iqivlGhx8nBqyL8umAPkGBEz4odYd05VSzBiMzJ3NGz6bQI/4rKbnYpDTTan?=
 =?us-ascii?Q?wX3zsAOlw6Mk0n6eZV/cp76F7y+w22+hnFeJ1B+cYhqiGK90FCxZwgMK0I3O?=
 =?us-ascii?Q?5HfpKiE5JXS2Wt7uBMEP1hmJH5xolTxWeVsRX9bHigF5BPpPj3/Q2zm3OsUQ?=
 =?us-ascii?Q?mx+8kHtwQFuRFaYvyXmka3e8qUY7KJkxQyrzuJTk5y6cgyU7Si3gH9jSbDGK?=
 =?us-ascii?Q?6qJuq1JvF+Q2F44DLGg7d6wbiViF54OO4PXjHLmuAfDB/QYXxvdHSmwhCOcv?=
 =?us-ascii?Q?9/nO8G28i4jk0ZaxX7aSl8TBk/CEjKYTbTW+hREbvL6Wuz82w3EmEhJJXBaM?=
 =?us-ascii?Q?bf73YI9AzsDkZbqSedBsVjl0StcE0yT/0CjuG0yEDiIF9+2HFoGlJRKsAOue?=
 =?us-ascii?Q?vG/OlHeISTBKbjnr86MMX5KPQwa+6hbxRFWtzhBY9m2eMPkEyGjocjfMc950?=
 =?us-ascii?Q?PyMDktAqCxf0iTjbdgtM7Suy2JqJlUsybhFq0Hl5ue3WDXwMJBDjBaWg+QdJ?=
 =?us-ascii?Q?mlxB+KAKjRfZmy6+yuN+oYvVSqi+blFYbHt9+0gXGGxh7URSwSU1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efbf9614-6b58-4624-3871-08df2f933c52
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 16:49:12.9345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S6LLlZuorYnVxFfboqiYIeZHQK3yLrTXrBVlQJErWlOkJumqvmczpkPYHinflMiPqJyoNyy9UgqpEsG9NsNCNltmBNtZj6ID0jjoksy64ZHo/aQSOGRK26iWnZdEwoc9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9931

On Tue, Oct 06, 2026 at 01:03:09AM +0000, Roland Dreier wrote:
> axi_chan_handle_err() reports every error with "Bad descriptor
> submitted" and dumps the transfer's LLIs. Common errors are source and
> destination decode or slave errors, from an undecoded address or a
> target returning an error response. These errors do not necessarily
> indicate a malformed descriptor, so the message is misleading. The
> dump also has one line per LLI without any indication where the
> transfer failed.
>
> Report the first matching error name while retaining the raw interrupt
> status so additional error bits remain visible. Include SAR, DAR and
> LLP to provide hardware progress and linked-list context without
> dumping every LLI. These registers are diagnostic snapshots, not
> necessarily the exact addresses of the failing transactions.
>
> Dump the LLIs only when a descriptor or programming error is present.
> Leave the transfer result and recovery path unchanged.
>
> Assisted-by: LLM
> Signed-off-by: Roland Dreier <rolanddreier@rivian.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 46 +++++++++++++++++++++++---
>  1 file changed, 42 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> index 88362f181207..e5a259e79a38 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -1059,6 +1059,36 @@ static void axi_chan_list_dump_lli(struct axi_dma_chan *chan,
>  		axi_chan_dump_lli(chan, &desc_head->hw_desc[i]);
>  }
>
> +#define AXI_DMA_DATA_ERR	(DWAXIDMAC_IRQ_SRC_DEC_ERR | \
> +			 DWAXIDMAC_IRQ_SRC_SLV_ERR | \
> +			 DWAXIDMAC_IRQ_DST_DEC_ERR | \
> +			 DWAXIDMAC_IRQ_DST_SLV_ERR)
> +
> +static const char *axi_chan_err_str(u32 status)
> +{
> +	if (status & DWAXIDMAC_IRQ_SRC_DEC_ERR)
> +		return "source decode error";
> +	if (status & DWAXIDMAC_IRQ_SRC_SLV_ERR)
> +		return "source slave error";
> +	if (status & DWAXIDMAC_IRQ_DST_DEC_ERR)
> +		return "destination decode error";
> +	if (status & DWAXIDMAC_IRQ_DST_SLV_ERR)
> +		return "destination slave error";
> +	if (status & DWAXIDMAC_IRQ_LLI_RD_DEC_ERR)
> +		return "LLI read decode error";
> +	if (status & DWAXIDMAC_IRQ_LLI_RD_SLV_ERR)
> +		return "LLI read slave error";
> +	if (status & DWAXIDMAC_IRQ_LLI_WR_DEC_ERR)
> +		return "LLI write-back decode error";
> +	if (status & DWAXIDMAC_IRQ_LLI_WR_SLV_ERR)
> +		return "LLI write-back slave error";
> +	if (status & DWAXIDMAC_IRQ_INVALID_ERR)
> +		return "invalid LLI or shadow register";
> +	if (status & DWAXIDMAC_IRQ_MULTIBLKTYPE_ERR)
> +		return "invalid multi-block transfer type";
> +	return "slave interface error";
> +}
> +
>  static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
>  {
>  	struct virt_dma_desc *vd;
> @@ -1078,11 +1108,19 @@ static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
>  	/* Remove the completed descriptor from issued list */
>  	list_del(&vd->node);
>
> -	/* WARN about bad descriptor */
> +	/*
> +	 * SAR and DAR advance as each burst is issued, so with bursts still
> +	 * outstanding they can be a little past the one that failed.
> +	 */
>  	dev_err(chan2dev(chan),
> -		"Bad descriptor submitted for %s, cookie: %d, irq: 0x%08x\n",
> -		axi_chan_name(chan), vd->tx.cookie, status);
> -	axi_chan_list_dump_lli(chan, vd_to_axi_desc(vd));
> +		"%s for %s, cookie: %d, irq: 0x%08x, SAR: 0x%llx DAR: 0x%llx LLP: 0x%llx\n",
> +		axi_chan_err_str(status), axi_chan_name(chan), vd->tx.cookie,
> +		status, lo_hi_readq(chan->chan_regs + CH_SAR),
> +		lo_hi_readq(chan->chan_regs + CH_DAR),
> +		lo_hi_readq(chan->chan_regs + CH_LLP));
> +	/* Only dump LLIs on non-data errors */
> +	if (status & (DWAXIDMAC_IRQ_ALL_ERR & ~AXI_DMA_DATA_ERR))
> +		axi_chan_list_dump_lli(chan, vd_to_axi_desc(vd));
>
>  	if (status & (DWAXIDMAC_IRQ_SRC_DEC_ERR | DWAXIDMAC_IRQ_SRC_SLV_ERR))
>  		vd->tx_result.result = DMA_TRANS_READ_FAILED;
>
> --
> 2.54.0
>
