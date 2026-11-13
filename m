Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794601041;
	b=bLE+aFjXLR/rPOKL1kDlgoDhTaANFTwNrKdx3G+dWWzkJGFAJ0rMR4sk4WJXqPJeMqWz
	 73OKqReaBo/6FSQHItGkafuDtoOySjTZWpCYIY0k6Iw3+D1oRJgw9Z5B54fo9/5yGVPrE
	 slUw9Sr8UL154q2qiD1r9eBq3HSzemPIRwqX4Xi/Tf1bGyP9Zq5602KEV+bouC5W/Hntq
	 vbyHcPB/WVTiT3dSGMd1yL2FKTq1mw73ecN6/npY1ZJzBuUmPw61dKg0IIUxaFph6llBa
	 7ZyH4UoAVFpoYEexkBVMsB3PmPIZiHn4ynAIpkbTJbDLrTMft0lC2sIXS+MXB9Q+6uA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601041;
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
	bh=EXh9/1qJABy8XYnCXl5d5uwCFQJlbANSCS9TV10Q7fw=;
	b=Atw5DEbAB9aqgRxcP696UZr9+fUhLXq+U2uQtcZNOX+5hTDiS2buIeXt4t6F1x0rSm+Q
	 Gyn4UWNmBXRo+ga1k1UFzxtSSHyUx23PGs+MFeIcIax9gmD+azzfN+LKH5YsRD9ZWN/Yd
	 z+FVRRSN2XrlQuAc4USryQ+fN1CjeOnQibo/0O5s2F+Iqo57uceHivNVhjjXw5bCkuSJQ
	 O94G+grIYb2R/UqNAtClXdk3N0rV4nG7sVCwyk3P92mI7tdv6Vda+AhogpyW0i8S4yF+o
	 b3S/xmQkWQuTwtxB6bZb0yAke9MlxzTVX/FVMm6qTDBDuZCqMcrigxpFxYXHSXb4ctQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=i8r6ABwU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.19
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011019.outbound.protection.outlook.com [52.101.70.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11668606A33E;
	Fri, 13 Nov 2026 20:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11668606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=i8r6ABwU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kVhP1Nx1ob5mtK4tWCPlenfk4MqOXxZ8p8xSFpqUgF1vnLybY671FFh4yLefohZRdI46w8E6Z01HOtF751TU2sujFgW+TiX6MjIpUe5KJSnJjV3QPFLGaRF0AFq5koznToCu0m0yBxYaYuB7OZyXgIYsKa6JHD01mbEhOKkeRcC4Ajg2CKZNQneCz4Z61egbnp+d1o7TUSx3QarHAzt6Bkuj86r+l8/B3Ck7mcNkWCZE9VDKI8QVcwzzsJakpVdfvhJxYZRMVwccQ3aRKSIbBl8HYWCBy+8XonEFYCMO+Fmt/QcdQ8waY7i5CMSv8EAi6g4ZVG+ClludJeHMJVEanQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXh9/1qJABy8XYnCXl5d5uwCFQJlbANSCS9TV10Q7fw=;
 b=qeKpHrg1fVgvSENDv6+HMq6uchMMzfiUj+uRDrwqy+3Ur+evRPUV1OjjCtoFCPRMb28vibEVAYwcCt6Nb6z8m6yT/Sjt6Rf55Y/wgS+sMFaUKPx6Olottw3Z2VxhkfxQqVvnKvoMIcat7E2aZWq51H7nL0/OHczbyIe+TBRwMSpkZa8NPwwSisqVIkF3hRjwePfJerKsVdSJJXnLfU4MLUXY9gAzFTXi4rFoQ/Ezq6xMfAoxKKuFWhao3oHTdmn/83omKb99JsSrNJ4u9S7u3IwD42JcKyrBcjAwiuovxC7BNwotkw9mVTUj1BZ4+0lCBagkPvBL+PCr62w5ak9BVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXh9/1qJABy8XYnCXl5d5uwCFQJlbANSCS9TV10Q7fw=;
 b=i8r6ABwU0vRxJcqlj1zznLuVtIqeltj8fH3GgzaUL6bXmAHLf7e+F4VT7HXCm4t+b1cTPw+mGGr8K/5FDBLk3gp8PmYCO7y3MRDMU9I19LXE+lGCUf3569gj06JmUv4gRaFlQGuLl6EOZXngnw9dTo6+tyYsdtCqi0BepqhsqhrZkW86byP4nVFLWam+dJnwd/RZFFLOUmQkN0ZqgCdy2buaiWuDhYXUs3kXm7yAhXPFS2q4QyOt/5kp9kTkTr41OaJ6+S9O6Fhjs4WGs8bg78TkhM2SW0IFgvB4/fuc88GpHbxtyNzrQPe9GwEXiqRbdcPf33rHoRXw13Qz0T3IUA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM8PR04MB7970.eurprd04.prod.outlook.com (2603:10a6:20b:24f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 20:17:17 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 20:17:17 +0000
Date: Fri, 13 Nov 2026 15:17:09 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>,
	Maxime Ripard <mripard@kernel.org>,
	Jens Kuske <jenskuske@gmail.com>,
	Jean-Francois Moine <moinejf@free.fr>,
	Hongling Zeng <zenghongling@kylinos.cn>,
	Chengfeng Ye <cyeaa@connect.ust.hk>,
	Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/9] dmaengine: sun6i: detach completed descriptors
 before invoking callbacks
Message-ID: <avdwRWujanRNBBCM@lizhi-Precision-Tower-5810>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
 <20261023-submit-sun6i-dma-lifetime-next-v1-v3-5-ef1acb0be768@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-5-ef1acb0be768@gmail.com>
X-ClientProxiedBy: DSSP221CA0005.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:8:3d5::10) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM8PR04MB7970:EE_
X-MS-Office365-Filtering-Correlation-Id: 612f5d45-d9e5-437d-ebcf-08df41c31d55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|366016|23010399003|22082099003|18002099003|6133799003|11063799006|56012099006|4143699003|261102123227099003|10067099003|261026140227099003|261026121527099003|261022105027099003|261028144727099003|261022075727099003|261021121427099003|261021123027099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	XwrxsxCHkGhDsBkXxO68mjQj++in98R2156u/WnB4oQQSDfQ6iM3p/z+4lcbABuflNWK90tcaN8Tc4Q1jgIMA/8+Kw504ulwq5FQIq0VjHT3qVbd4L8FRYvwX/m/2R1BHB0zSRLGbtHPm5T5mw/TjbeCRugPU/CN/6t6djbsBxvFNRLWQGD176nBnObdpCuTd9qydKTbotar8oi45t3S7Sbg5iafr/bq89/4pGqFDTALP72D/WE7QVliPqB9VgkKCyAr3Lfh+5pa07sd/zJGyiQev46K0LkscNB7m7txl/ze5GXDbY5hfjKH7QldL+FuhBAysUCowL4fy4sYZttnxTPFNmJ+v20hTxoWGKN90iTgCSPv28jNrOi/VEAWVEGuJmYF58yiJe1QVD7D0YbEaMQCOHjcAuvZJcOhZp6VE7uk053VvG5OcSC6nVebKb/iNXOGc7HB4oa4C6dYtMb1Eq3BzESriRCd3sFWS9+DgXhnJMxTz+ANeyTL60aPXPcAWmEjSGLSqID1JS7lA9NAqdzeJtivvS5macEPOVG85rrMk53u0llQ1kp3it12D5/J+cO2P1LS7g62GPRkVZQ/dm8jiRt5t288BhWN6y2D5N4QiLM6hz/4bkBwP7NRLMuH3pzrmaE7/mm7EZZ7TdiQo7Y49mHi/GSEuU0M8LNfT3cH80dVc40M5ZEUAYtXPSdvyVWl9RJQFK/wWm3pRqkcK0Q6RgtQI85KVy/G+RjpRlo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(366016)(23010399003)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006)(4143699003)(261102123227099003)(10067099003)(261026140227099003)(261026121527099003)(261022105027099003)(261028144727099003)(261022075727099003)(261021121427099003)(261021123027099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2hYaJxIjV5wiBWQ7sJnMoDi9IIul5yDR/XjWc+V7HSm7pQ5CgypR6EHj1R6u?=
 =?us-ascii?Q?iMm3ghZ3lVDZyNBaCn9PNPUqxuxMkV2alGWM5QMWIc8t7mE6e8NnLDmvdOgK?=
 =?us-ascii?Q?MTUZ8DgOQdqpmI6u4avT+yC64O+2Ca5Kbns896ICUnWUAUT4JdBj9egLqQeV?=
 =?us-ascii?Q?T8G9crwfUq0C+PXiqbaAG9FIhgxboa3GSyod1eaNkUCMI0hAW0NOymCvOCZd?=
 =?us-ascii?Q?o88yazkMoeiNfVoRhKtHF1k/q92J3Xv86plwujNXqYpEnD8p2JIFyELe/rHy?=
 =?us-ascii?Q?A5bqZ6Tejo82nKp83dZr7bpbF0jwQkSaNf3LvwWqAtkbR8Cpe6QJVodC1aeN?=
 =?us-ascii?Q?mSYZeGwtYMSrR7WmvUw1UiK/DmWmynJUuMjz3RBpnsahtwr/c0Am8eemVK2y?=
 =?us-ascii?Q?uL8jrpT6gEAGnPIFNi72lHyIwIMiPdR6ZTfd0QMCdxIcpQrg0dbp4OQyHo5H?=
 =?us-ascii?Q?hsTLqlv4LmWYViGWZC8SLjeyYza44Edd93P7v/XpZaTRGcFjY1poySmFm57a?=
 =?us-ascii?Q?td1hEgRDflfRo8utmpakhG44+fVFmbJOde/zgIwhYDexS2c62fFUUhkKGsiV?=
 =?us-ascii?Q?rmNeYeo16QdBAxl4LEkIVLbsk61d6gDd9F0llxXXhvOQdkPxdqG4DVRWxdzg?=
 =?us-ascii?Q?wNWSQ+JF+3su9eo2+cnYBovdAjuQfBhpooLl7waqzFylQg2G947OSGsUsqyl?=
 =?us-ascii?Q?JwO56GbMEo9W7qBZxuxPUE1CeGsvYR+4RhHV+8S1y7V/y3yPBkUjf1P01rlH?=
 =?us-ascii?Q?TgQKAkhMUkIVPrvScK/e4Guaz6yeHbs2MKOx8+GGFV8yy1PuL8MNG8QxPLTl?=
 =?us-ascii?Q?nnF2fwni9hDpzY7oHnI7w+BXIO6LEtdwHeBEPN8PHEkjJfeLPsjtS9QdcUTW?=
 =?us-ascii?Q?yJ+5ulxLl6Qabkn63k7+cjWKhoW4C8Cs9B5g7r9oUmm1TUNu1INDIY+40+Mb?=
 =?us-ascii?Q?lNHwAkHNl5C4jhsp6FZa5ktrsYoud2T387rVtZqsOuk5GshRyckLyo+UzI1X?=
 =?us-ascii?Q?E1atvriLzjuGPFaDBItwneLmS8NGPkgjy5+AybBKGu4GHPTPb6B/PjlDdOcx?=
 =?us-ascii?Q?MoEUazLF4y528eH+jFaeF/7bF4MLS1K+PKrBBbw+ME62Y3XOzjaqT+UnP8R8?=
 =?us-ascii?Q?M1nIklLtf+zMc5AJr0ByoNfqTQ5VioUVSgeM0iQka/NT5tKWNFNNrKkr7Z4k?=
 =?us-ascii?Q?Y7OyeMTMCkjzz1HfgKus7WaDJab0GTHSgxs5FFAU9Cy07yU1D5VIOCEnidlt?=
 =?us-ascii?Q?35TeBjcFuD7V/T/3A9VBb30m+i9Ofi+vA1DS93QnBDk+JptZejREze3Xh7NV?=
 =?us-ascii?Q?WuVy0dfO9AP7GiZYjSUbLj9K7NniOMhnfnw9oc1Q0LIV7mjmJ72ix4vK0Guf?=
 =?us-ascii?Q?g+6ibVd6msujMSGEIUZxo36l5sP7K8oEgHfasU7PLWwo+Ys12g+LX5+hVUzM?=
 =?us-ascii?Q?7JmdfELh3BQtiSFEjLdEvsAlCcf+/0MuXjPx74kviV6OAzQxGpSvqJNZY6Xz?=
 =?us-ascii?Q?SuyWu6qRyrHJVWe02vpb8T5QBeTC7+v/VMRdzODjqmsfAEsqPgAj9PdnlsT9?=
 =?us-ascii?Q?5McIJHT1e245VnH+D0VMre9jkh4XlrOQEw7Ut9b4002CQ6miwiBhSbgGCTtY?=
 =?us-ascii?Q?jESla8aS3v1sfNOtFL5Kz5BjUwvfJ5NHsAaWhSv3GrbLdsXKBorGjXrpqdHh?=
 =?us-ascii?Q?OiCPbljKKV5f7sBakfnjYQdIdeF6SdkdWE5s8FF5H92Ucqv15LUF1r1Davxw?=
 =?us-ascii?Q?TPSPEr2/7gMKO4in/3GewPXYpRre1nXNr9rfaM5PPtf7pnQRDOq4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 612f5d45-d9e5-437d-ebcf-08df41c31d55
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 20:17:17.7231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6MzWt+HNzVk9GBYHG9uaas8LixRc7mthWEnzAKDDy7Kgpb9FQYYBN3Z5xQGFLUGXySwM9TWgOk5zT4FbYYwlMW5KC/Dh6b/7RtU9oznMIr0OEBmxMtH1EOVp/idUPbx+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7970

On Fri, Oct 23, 2026 at 05:38:24PM -0600, James Hilliard wrote:
> Finite completion publishes a descriptor to virt-dma but leaves pchan->desc
> pointing to it until the allocator runs. The virtual-channel tasklet may
> free that descriptor first. A residue query for another incomplete cookie
> can still pass the retired descriptor to sun6i_get_chan_size().
>
> Clear the active descriptor pointer before publishing completion. An
> assigned physical channel without a descriptor is ready for the allocator
> to start its next transfer or release it. Use that state in place of the
> completed-descriptor pointer, so residue queries and termination only
> consult descriptors still owned by the physical channel.
>
> Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/sun6i-dma.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index d3a63c866645..900bb629ba3b 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -198,7 +198,6 @@ struct sun6i_pchan {
>  	void __iomem		*base;
>  	struct sun6i_vchan	*vchan;
>  	struct sun6i_desc	*desc;
> -	struct sun6i_desc	*done;
>  };
>
>  struct sun6i_vchan {
> @@ -490,16 +489,12 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
>  	if (!pchan)
>  		return -EAGAIN;
>
> -	if (!desc) {
> -		pchan->desc = NULL;
> -		pchan->done = NULL;
> +	if (!desc)
>  		return -EAGAIN;
> -	}
>
>  	list_del(&desc->node);
>
>  	pchan->desc = to_sun6i_desc(&desc->tx);
> -	pchan->done = NULL;
>
>  	sun6i_dma_dump_lli(vchan, pchan->desc->v_lli, pchan->desc->p_lli);
>
> @@ -536,7 +531,7 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
>
>  		pchan = vchan->phy;
>
> -		if (pchan && pchan->done) {
> +		if (pchan && !pchan->desc) {
>  			if (sun6i_dma_start_desc(vchan)) {
>  				/*
>  				 * No current txd associated with this channel
> @@ -582,6 +577,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
>  	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
>  	struct sun6i_vchan *vchan;
>  	struct sun6i_pchan *pchan;
> +	struct sun6i_desc *desc;
>  	unsigned long flags;
>  	int i, j, ret = IRQ_NONE;
>  	u32 status;
> @@ -601,13 +597,15 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
>  		     i * channels_per_reg + j < sdev->num_pchans; j++) {
>  			pchan = sdev->pchans + i * channels_per_reg + j;
>  			vchan = pchan->vchan;
> -			if (vchan && (status & vchan->irq_type)) {
> +			desc = pchan->desc;
> +			if (vchan && desc && (status & vchan->irq_type)) {
>  				spin_lock(&vchan->vc.lock);
>  				if (vchan->cyclic) {
> -					vchan_cyclic_callback(&pchan->desc->vd);
> +					vchan_cyclic_callback(&desc->vd);
>  				} else {
> -					vchan_cookie_complete(&pchan->desc->vd);
> -					pchan->done = pchan->desc;
> +					/* Completion transfers ownership to virt-dma. */
> +					pchan->desc = NULL;
> +					vchan_cookie_complete(&desc->vd);
>  				}
>  				spin_unlock(&vchan->vc.lock);
>  			}
> @@ -983,7 +981,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
>  	pchan = vchan->phy;
>  	list_del_init(&vchan->node);
>
> -	if (pchan && pchan->desc && pchan->desc != pchan->done) {
> +	if (pchan && pchan->desc) {
>  		struct virt_dma_desc *vd = &pchan->desc->vd;
>
>  		vchan_terminate_vdesc(vd);
> @@ -999,7 +997,6 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
>  		vchan->phy = NULL;
>  		pchan->vchan = NULL;
>  		pchan->desc = NULL;
> -		pchan->done = NULL;
>  	}
>
>  	spin_unlock(&vchan->vc.lock);
>
> --
> 2.53.0
>
