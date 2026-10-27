Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793119068;
	b=ga78erUJ/GdGr1GLvi4+e9fU7hXaR2lR0J21zT4tcChe0RudWMytxRa9RWJm7F6V93qf
	 WMausDDFkYOHumv1i3j6MwF7mpOtIUba5hgHFo/q3nUWNcAF5nzwmQ5zwoeRj1c1ixGF1
	 f6WHOgrWtxyn83OPj3CLT89g41GF2dLOVYSYJD3N8WkMlWCtYL7/3cWEJAwfEV4wrfQmT
	 MNmkZRbVzts9Y6rJ/SdhZsE64x2FL/8Xg+3HTGobWGY7Ju4Vt5wthKPEutUD+IphzwQYD
	 J0VN593AC7ZCZE4mXaGyP31zl+mgWHwu5J+v/4qIU7pISgex1FaGrt2N7o5IqvmFl+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119068;
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
	bh=9nVkKEC20L9XARdllr2jkQiQ5TE6i8ajrNHfbsRP6cY=;
	b=fOQKPZea8Ws651mwFNOskyUmLH27OeOhe1SaaglobTzx1QH0OOJCAb08tbR+VFI/YJ5F
	 9fBBQUu6gayIjXpotKN2ZyQ60U0ulo7iTH0PwBMkhOG7L37gcqgp+SfJR96Bgm5Dx5fpT
	 XsCGh7gSmuWF/r5ml0IQabWtLaRHtCdkOuhMzGfK2GmA5Iwm7h3DISFatnBO634gt1A08
	 Q9/zwNbe2JZWifUium08XtG+lwph1lzBC1y+yMIrOMt65FUxKVIX0l2xQhW31fQ3dQ2bw
	 +lfYpMMhL3ifzzaCNofZpTzX8QaBcNiV4Or19bTN9hj1WkJ71g4bWzaMv0fYYc/5vpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ZvgkpKYJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.7
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013007.outbound.protection.outlook.com [52.101.83.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D834606A321;
	Tue, 27 Oct 2026 16:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D834606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ZvgkpKYJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vwvOSmqPiN4R4IqD4r3Nf9Xy9rtijcpHlNTM9QHaFnlQKd2OL4/Vs6SzAOqFJ2ic60heitxPPfi/kss7VQ6GIjKZlecjssWZSZkOy4XBiLVZg50v52eItDHjlDCOIkn7TZ9Le3C3GdmCkJSGXA7cuJs74xXYnKK0EotBrueJznwQPznDRCKtCug1xLn2BwdXEJ6YsnypAKdlMBIuPCfRrAJPPZYTFewsWrJqY0SefLVpkrJLJ0OjlNYAvD1TAET5mowClOTF6frQDY88xtGfNevCRLXKn+9voAAzPFD9y/N3zqHzs7q8ordYVti/DFa1f4Hhv1ivFFMM7nPo+9svgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nVkKEC20L9XARdllr2jkQiQ5TE6i8ajrNHfbsRP6cY=;
 b=cjZ3pi1PK0dS6XKty/3JSGASVYeQ14v8cZWcI6rdrfNwNThd1vedTMtRhr7xaTLF69811Sdml17w5ZmZjTDmznJx1YLJBr4242inuaE8YIpomiNFPNNRTthwGw1C5LzSsfHWpqjCj+JOlc8rWmM5kHYzrsao/ltd8DhQRvf56gB0upNDJ/mZ8bg+phZIUcbCbolvIMmTwZN5pQoCHRUVOKb+IbqfVKpUpnBIN5B/K2FmShuw2aoVpFLrtHb0g9y+sZpl75MA9fwWetd0NHE/klGzGQxxQqNbCjTJV2OEU6sdBR+VlzBYlobs0IqVFhqD+yVjp3GZufLYCVxh8Wrqig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nVkKEC20L9XARdllr2jkQiQ5TE6i8ajrNHfbsRP6cY=;
 b=ZvgkpKYJzkhUZ157PYjiOFyQb3WeMrZTu6uH710fEL/nw1xgTR64RP9QdbmYKOUnCcJXi4zXci1iYoe2mOzwE3m1egCAyUTxjpyxxOVJv9GNQ3ag4CKyvUvJvD7rp1/mDw4t5kmfGzqYIO5jywKNEj6XIqemiu+msFDvXXwlSBM1ZTOVZgCgxEpkImATh5D2hJ66n8CQRLnyua5caXlDjWO2KXrL8t6bfasOR04RempKT553iOSfr3sT1URsa/x+jJAO43tnTOMH+d5q01D3nyYEBdUw0SK8uMqSsM+ggqmxyJxW8bGA8Ze0wEtqoOYcniPjPRHi7NwCc5yC+CT/hg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU2PR04MB8743.eurprd04.prod.outlook.com (2603:10a6:10:2e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 16:37:43 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 16:37:43 +0000
Date: Tue, 27 Oct 2026 12:37:35 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: "Jeff C. Jensen" <kernel@nullptr.com>
Cc: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Suraj Gupta <suraj.gupta2@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Alex Bereza <alex@bereza.email>,
	Folker Schwesinger <dev@folker-schwesinger.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dmaengine: xilinx_dma: Reject transfers that map no
 data
Message-ID: <auDTT7A-SpD7nXEN@lizhi-Precision-Tower-5810>
References: <20261022-xilinx-dma-work-v1-0-20faea2e7a80@nullptr.com>
 <20261022-xilinx-dma-work-v1-1-20faea2e7a80@nullptr.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-xilinx-dma-work-v1-1-20faea2e7a80@nullptr.com>
X-ClientProxiedBy: PH7P220CA0062.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::28) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU2PR04MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: 95873120-bde9-4bbf-4e72-08df34489fae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|19092799006|261026121527099003|56012099006|261021121427099003|4143699003|11063799006|261022105027099003|261009223027099003|10067099003|18002099003|22082099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	d2n0UOHgA3U9aMQhYjPy3gE5WRXnSZKiZuPALxaliWQ+fTsYVTQoYxdPnQ7OtqbZ4y5eDZ9KjjEI5H1yzHqj61u48bKH6judifPOpzYhor/UzxDuLAuBbS6vg0yeO25dMLkwPDR48hGxOMm/TwzofYg2NvGs9YX6j/V11M80iXup1Cw2uXb/sAIboaC3XOPz0eVupPWAsrxXctoAT4GlB8sBwu5ZqnMlPe2tJzltyTkTqHCIXpcSbANeeJvnwAi93cR2m/2JzTAqelkGqE3tXCeYm+tyh4LMXGbB3JbO0n/kzzF1x8qKmlWS7hmLVQpkB7XkRxg9HX7pWC1oefK4G6pA9Up/NeNklJfBcvas82ddrGMrc04BfcOA60Omv+R/3MH7oOkzYIKWUF7EIiMOFKDKM7hdhWb/DiKZy905TrG/cS4guBsZCXqvLhC1pUKtmb96x1HM6GaNrCxPIw2Bdc8sYRBb9BEuzsErb7ZqZl3fifZ6FPjFO8rjiiYQ29/tQydTEUwIyACH/hcM5Bp7VkG3kgnlv+mwIJ7rL0Q+OLVu1ihSM6T02POmQMcCm1i+Q/TQEjW9pNA/F68FCDaH4HDrVgefFTaBkZuN7/TlZ2jsayhlyrKPJduTUCC76tJ/VvQswPW8dx36Dkvocv7ohZ783uWbhKVB+FmVRyJxods=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(19092799006)(261026121527099003)(56012099006)(261021121427099003)(4143699003)(11063799006)(261022105027099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XoRxCGGlegQPRYWlMnq9aqE9O9orn+b1bfoFyDZ1mR0XnGjgyegD/mG7f02w?=
 =?us-ascii?Q?qs7VZvjSw75K+bm6MYgLFAbyCK1viaBnFEntiSG3h4Cl0mUF48ZvmRAD7eey?=
 =?us-ascii?Q?yIIIcHWyZjNLdSJYopFsJFK1W6h/3h7wINnhOe3ldVL7Ohr6A1AEeSx3+OnD?=
 =?us-ascii?Q?jCgpbxc/9x27ySzu2azLnYtPC9YJ38QV6Vuaf+tA2bZB03NHMPoFsMy50aJl?=
 =?us-ascii?Q?KZQmlHKzMcDkti0C4cwP16fVk6HNEWo7H219vaX2uG2NZVRV0CDvszbuKHb/?=
 =?us-ascii?Q?Vx4cspkS4fqzKAAeTGgCtub30iTy5+F7GjPnlx/xu+K8PqCFCqaTYY/wcWvr?=
 =?us-ascii?Q?nd0qcj0jb9Lcz2NiOn+vnlMJH5xDH6hzpGxE3jBjOi5xeEJKRG9q6lZOxjRy?=
 =?us-ascii?Q?SCSJHlv7ZSERpXmeHOatMxhC3zQhR7uwSguAiWQbBiUVUQYRMuuoGq2b40aQ?=
 =?us-ascii?Q?ITaruOhvq6smFZ7Bou+1DAZTZywttM7otxwl2WDzrW5uMj8JdkTiz52LHOvN?=
 =?us-ascii?Q?i2ml99uaNvv8r9nrGKsXUka3n1RB3XI2DxHwrklARdc5/F1iHHeUfg27ThHZ?=
 =?us-ascii?Q?IieZrpG+4scBHH6ENIlwk95VgjsMND27o2UqupySdbaxs0EK2Dd2AUokdkv5?=
 =?us-ascii?Q?nTt+Nlzv+cbPJAtYePegF1ULkskaUvh2nB2aqItJQNPdcKLONF05bZncPwyn?=
 =?us-ascii?Q?4KkwY7GmSGWhRJzrK6dC7c6W+WqGqDUVv6L6/KyzL9p0e/acVz1wBro8/Bw3?=
 =?us-ascii?Q?MaRlIEfvbrZpaP+j31OTotOy31DSUwqhmN1MTQA5hm6fLQBSuc0/w+O28oMS?=
 =?us-ascii?Q?c6hK8OY3SyQgQOvz8HCxTLfNkJdU1gG8FYVA/oipiW6Q8NccIpfeJdJnYTi6?=
 =?us-ascii?Q?l9cnDmrMjRMn7RiCDB9qtij3yXw9X2viB0l6bcvUKkdClwG66mWKwDO75K53?=
 =?us-ascii?Q?68sa4R1ozfpKgP8QMReLRfSIsEAubDe9ScaJqlJ69jHuWlpFBVcBpt7NqfSl?=
 =?us-ascii?Q?KuDpDfiHWnBwnrUAbJXo4cfJtB6QjTai2c2TpMLeFhAxry5NhwN9Cr4emKhC?=
 =?us-ascii?Q?4sII3vYUz45v1aAF1c6YjAn1EvrRis1XGTly43ctJOkiZUz6CUk+RJgjVkQx?=
 =?us-ascii?Q?VXRdhK9wxYG0+PjrkYVo2l7Z+28D651AIibpQ6FFmW2Oj6Zz+RIvuVzPL84M?=
 =?us-ascii?Q?64vY0f2lKM5Abidz64J2JvkBeGn2oILGJA8NQIiun/+kNOjwZE3Op/a795Cp?=
 =?us-ascii?Q?bHgjsQEwZG2rW+wueUdBJqsnER5xqtVl3/fIi1vaDeFnxrmRltjYOpIM+sq/?=
 =?us-ascii?Q?90yYVwDecB8fn/mLRp9v7bcN4jb5RIiHxiQ8YufXmLYRtTrDfJkhD7OPe/eN?=
 =?us-ascii?Q?plSPHbBlSChwpAp8WB5RfNifZM9uQBF7cisxc9VhZRV9yQQID1t6s6VJZUdA?=
 =?us-ascii?Q?bcLNmnCBHgSllxzVJgUU/yK/k81okATCTjZzVME7M9q50n6wOBH31jLCHsQU?=
 =?us-ascii?Q?Fcko+5lO84sE69l9GsNjLevI8rSZ+O8slnfCa/h7vZ3sG5zAjWXiFnj2wPjF?=
 =?us-ascii?Q?vpeyDqeYoNkDSyNN+txsrN8LaiT55BqZHuCNo8Ohb/vMT8fAGliW8vBzuvl6?=
 =?us-ascii?Q?LI6E65cLKf3gLq/rvl2kkW/tuKz3lz17p2YF9e8PiB8LP48ei6RIfou6Kbsy?=
 =?us-ascii?Q?8K5pHiskW0hrG6yuXpn66955bndawJSMl5yHBaerEomKF2woAv5wiMxhSI/a?=
 =?us-ascii?Q?ivfKwHqDsYfwJqdHUahIjUvW4kLrG/vmzJxzpGZbn4vRxRYppd+V?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95873120-bde9-4bbf-4e72-08df34489fae
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 16:37:43.2131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 87qiEYKRU0FHR2Dv5ml+j6S7gB/nlQeSBuMBBx68tMPRxyJD8rtFcB3XpnNjh+efV8dM5aS5xpzYAJqwamsDTKDpHGqRVganUVAIxfpEUimKMZU4++miI3iIjmpDINJE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8743

On Thu, Oct 22, 2026 at 03:11:30PM -0700, Jeff C. Jensen wrote:
> If every entry of a scatterlist or a DMA vector array has zero length,
> the preparation loops in xilinx_dma_prep_slave_sg(),
> xilinx_dma_prep_peripheral_dma_vec() and xilinx_mcdma_prep_slave_sg()
> allocate no segments. Each function then takes list_first_entry() of the
> empty segment list anyway, so desc->async_tx.phys, which is later
> programmed as the current descriptor, is derived from the list head
> rather than from a segment. For DMA_MEM_TO_DEV, the SOP and EOP bits are
> also set through pointers that do not point at a segment.
>
> Fail the preparation when no segment was allocated.
>
> Fixes: c0bba3a99f07 ("dmaengine: vdma: Add Support for Xilinx AXI Direct Memory Access Engine")
> Fixes: 6ccd692bfb7f ("dmaengine: xilinx_dma: Add Xilinx AXI MCDMA Engine driver support")
> Fixes: 38433a6fdfb7 ("dmaengine: xilinx_dma: Support descriptor setup from dma_vecs")
> Assisted-by: Claude:claude-fable-5-1
> Signed-off-by: Jeff C. Jensen <kernel@nullptr.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/xilinx/xilinx_dma.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
> index cffe7c6fa640..5ccc9f9d58a3 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -2305,6 +2305,9 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_peripheral_dma_vec(
>  		}
>  	}
>
> +	if (list_empty(&desc->segments))
> +		goto error;
> +
>  	head = list_first_entry(&desc->segments, struct xilinx_axidma_tx_segment, node);
>  	desc->async_tx.phys = head->phys;
>
> @@ -2406,6 +2409,9 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_slave_sg(
>  		}
>  	}
>
> +	if (list_empty(&desc->segments))
> +		goto error;
> +
>  	segment = list_first_entry(&desc->segments,
>  				   struct xilinx_axidma_tx_segment, node);
>  	desc->async_tx.phys = segment->phys;
> @@ -2613,6 +2619,9 @@ xilinx_mcdma_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
>  		}
>  	}
>
> +	if (list_empty(&desc->segments))
> +		goto error;
> +
>  	segment = list_first_entry(&desc->segments,
>  				   struct xilinx_aximcdma_tx_segment, node);
>  	desc->async_tx.phys = segment->phys;
>
> --
> 2.43.0
>
