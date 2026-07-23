Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011035.outbound.protection.outlook.com [52.101.65.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7954823AC;
	Thu, 23 Jul 2026 18:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784832858; cv=fail; b=CVrU6g629tj0ABWZrvICpBHU+mEF9ouDUNIB7mWWyHqIb9x4/H6BdCff2zenUZoX860VtCvxhMcf7Trx3hTmmhg7FNlnpHNIEitRPuQ4lyA1rzKJZJh95+PxLtJb9w6Z/DsPnBTlpDPnvfI0Nl1RvDtoTID3ehfUKIZzFRVoV9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784832858; c=relaxed/simple;
	bh=UFjQLv2aq8Bwnu7lMbFdSRYDTrgh9v4agPLUErItjd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TL2l6qE6wKA/h+iiAkgqBT9A19r8VD0avuqDl4KXwaJs9SLIytEAHF/gVKbg1IQ6mTivEX2xV1k0GJv6cuNrkxoLMUXWxgekpG1+MXcl6JdIxw2I09+vLJwXlpAYuqQhFOEKVGobwoA9KS1eAHyRtS5qiXfEhyUoTdtIhojNtM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Gq3oTTw3; arc=fail smtp.client-ip=52.101.65.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Gq3oTTw3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NqOnh0V1uked9skHAHHUDq1lnY+qhS/zGdqLCqiJnBm7qPzwvHStXjijjhtmzgLsUMV5hrlvgrbJ+E1gs7Os5BONCyJC2DcXxu/4mh+0aErx6uu9i+FIpcnSGa6y8FaA1Q82qB9RzT98cBYuTA8KOeSQDlfMCFjbw7j8lK9o0nSe0KSUgV1mh+YU5WNl1fDB6TUPvRoLwjTDm1VnOsw9PndPHgupdVjDuCCTT+BDaYwxo/EcZ74vj1wULzRw5p4nWD7sJsbZEFpRgfciQYLydc3utFtKp1O5dPgP4KnUIHMvkZNK/mobn3+RvYC8wKHChfHicLbSi/G9O+Nu4i7+Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ckQMaTW+JSBiOU5gfaUONzC0FrM5gwY22SOriOlO4s=;
 b=GBcLt2Z0kmaqwcwaIPmXFGy0i0gffVK6+SRP9JxKWwMIykfWRj+kDVcQTMNQdQdmSxBkgHyRrVfAv/j0EE40qF1SJdOgIwJgiodJZ2iuuPIMFVMZTWj1v1uh1ZKmWmoSNJCUb6vDTj8onHgGIKSZlDBd4H97hAcXAhJyzDTcPZDXRsHo41HCy+YiBAaJdXaXCN4T16GBLzXHBD8Nto+d+3IRbk0Gx2WGDy871u9AywLN5sD3tXRI6L/v+obe/RS2+J04/C9kzyoMr64CMvU+bBYpbYSU1vvIhOG0dxRdX2mPdaNAU6OOOzyj+FW40AU1fQW5WwhtonyOosgB8Y/swg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ckQMaTW+JSBiOU5gfaUONzC0FrM5gwY22SOriOlO4s=;
 b=Gq3oTTw3gdqqR6OYRzlccmw0jHz8VYUV1oDt1oje/ojkjqXxXb+8+IIal+CT4lkhjYTtWnAtTtHEeVYPNOUP2wVMdVjBXyE4JPN0nxG9krGc3vBOhGOOu+JpFgd+xzumG0iGaf2cuWrR8e7GX5e98mTQdEm4rurubU10ARRbWC+kkRpwE6awqj+CmH++QQTz2yQnvPaCi9rrjto0eWjd2cNYOnNlm5lT5NANbgTznmkowNIvTMDbUz0h1rtIe2cMxVf8Z0AYp3ZZbKF5G7YQFyibGgTBaE6yftSmxiFXQgvnljdvRWzSP76ylDCKUf2pL8w41xU+5AVfr/jKWyNoFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11589.eurprd04.prod.outlook.com (2603:10a6:150:2b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 18:54:08 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 18:54:08 +0000
Date: Thu, 23 Jul 2026 13:53:57 -0500
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
Subject: Re: [PATCH v2 02/19] dmaengine: dw-edma: Add dw_edma_core_ll_clear()
 to clear LL control-word
Message-ID: <amJjRVO-eXqMdhi9@SMW015318>
References: <20260723084150.521366-1-den@valinux.co.jp>
 <20260723084150.521366-3-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723084150.521366-3-den@valinux.co.jp>
X-ClientProxiedBy: PH8P221CA0059.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11589:EE_
X-MS-Office365-Filtering-Correlation-Id: 7de7913a-f681-4903-615a-08dee8ebc6ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|376014|1800799024|7416014|366016|10067099003|56012099006|11063799006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	KsgI1l96d1nuHrV8lHQ8DpQ2XcqbnBR37eJZ75eAM2f/r1Fz9QlleoEqqEU7ZEu2EkSpoNvAH4cANBmYPBEHgCS531OTCwXcEAtzwz3TMrkK6psKIXce51gRQk09IjqBtFyyf+uwYmFJCpdgLMB0w0DqGnD7TdAKVf13KUZXDJzRIkcXpUdcsPQJ68ja5FR34bUFLpo5HIEbxciLe1HByuERTgVjE0aq7iTjgZQJjc1fQlpj/Rht9IX0ppKZcAD7335Rv6DCzOBdR7gtvuaJ3vfwye7QjIF1K2fIE06RmXt0Rreo+CnN94Sgru9UINW5xpqQAeeMHunW0DS8U5PGqrWTKMIcURI88Uig8Ai9rOJ+bG91m541X18RfGN9sSUunrfBGNuzULDU7xQyIMPp7xnOVU/clsD7TawPQ8xgEHCCLLTQ8HOWYPJ2s7X9Oj8QfuxPCZ34fx6h6rCSevxNzlgj9rNnGlx58qbc2nUDg9wK2hluUBVfJq/iHK3XetZBjCJghkO32dBROXb93gpunPCKjWlcE6JC+mD0TgOGspx/MAMjzudKRRB7xYkO3JLpKmhCNk+FnfPKvlE08yOEIsvcuEUhqi1ATCMeDV6taMA8rcXKgWIlsl2n1UZ4qk3pc36hTZKpyfuZuMdiAVSYFgky/y+SDS0nWHTMzv6kcOk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(376014)(1800799024)(7416014)(366016)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bCM8pBOJwpICWjy6f69+qylGefhpZfesyS2W0EppRgRk9QsBcmMvANehSmEm?=
 =?us-ascii?Q?b+X6OEdCUOARofB+fopF/MK1RB8U1uOyeiPxNSNC7NDXj3fXkZXijXtDDVyr?=
 =?us-ascii?Q?mhe8wCBXG1DJoh/HnBI4kZUQbjecF9h9WXTRka3he5e++5yCeagFuG3yFKED?=
 =?us-ascii?Q?AQ4E0uo9Ktr4eYfzmbzaT8xXl8Bqu0sXn+b8Bt20hdfYJ5ARl3MxSd6Z6bGE?=
 =?us-ascii?Q?i0A45htNF4uMbLNha3ie/DHKjK1MBv/ygB7seTD2xN31eLYiEMc1opCqOU+r?=
 =?us-ascii?Q?A3WhNkp82wYYPgiuA7kUXdntyjKcxbifigNlIWsXxzkGys9Y9qzi8qdhyDoq?=
 =?us-ascii?Q?eApiqRrz7HOmd3O5FOSDKMZizNetL6SmI1/twXkWPKttVD54IE3Vtc6zTwM4?=
 =?us-ascii?Q?9qMELlskpQ/Nbro8Ly+gX/L8syzVI3RF58INLPrawJ6QCwVQrKBP1YioNo5L?=
 =?us-ascii?Q?UU7k68OqgPzmgvjKu7xhUgerXurhg8EtUNDBsg4plvTthsoq75u+d5mOGA4S?=
 =?us-ascii?Q?mez57oozLv3fsxfky0pd3cnDHkngJIknTNeVp0PsjiXUFg4TBs+93JcpMaj3?=
 =?us-ascii?Q?D5JRqct546tvzTno5oy5BaPAxGHXLdopAWUd/rgOBBz6pnfyxC7B9lFYbxUD?=
 =?us-ascii?Q?96eYiTSKBLty2yjLinaGsrHB6fkt5Z9qfz5qc7RO+OvpH6aCZlONuZYMMIes?=
 =?us-ascii?Q?PLo9SVj9G/rk6Gc+jSvMRbwEgJxShjWkFpd7fK48WPWKPPAmkhWrSfWWMJ5Y?=
 =?us-ascii?Q?xldv3XwPh7W1vLB/nWMS7xfh4hLru6EvK8qaKVv2zPYIvB+bjSjNH3aNBT+J?=
 =?us-ascii?Q?qj1yyY4JBxvihRUk6Z6qie7dR75V2wcQjLl/Mtae3ySH7rnfmgfIqIHnM9Kt?=
 =?us-ascii?Q?8QtgqAINn7HBcQyW1K8WollJz7OwfS6b1OX8DP92l9jRpUz9AFu1f0IQ0bpP?=
 =?us-ascii?Q?NrZVCnmKYOpgASDdDlX2eVW87EEC4yEDBk3n+lrJt0NKwpqNGVS1I8JJpz//?=
 =?us-ascii?Q?lS4I5+Vxa1UwhCH2cEvKxBm4jMPggSIagtIwHykie4svBXokCLygpM8WiHG8?=
 =?us-ascii?Q?OSdFEnt39ZyPI4CoJRk2+hP2md9u2rJL9HaOcl0sUAzJp/vMN0H+tehqJObi?=
 =?us-ascii?Q?Uw9gJjohEN/NUxY8Oz+So4/mBus9bUuqm3edj+KYpPwVNtdQu+iANTneArqQ?=
 =?us-ascii?Q?SimEEFJO7xcS6vwvNJeKzowk+7GeZLOdXQ+UPtsDiKIHaSXEe6qx5LoIRK5A?=
 =?us-ascii?Q?+YGYSVhHKIz/nwQH/jL6tAF3xZja2uCwgRptcET6B96XnX0K3CrnuFt6lKmJ?=
 =?us-ascii?Q?lPtjOGCom15xUlO7K+9jXNUA/qIRtWqFgaEihPFruJeRwssgxqZa3xS4nPu5?=
 =?us-ascii?Q?za9Frs8vczIg2qt73SimJ8vomBiTdH8O3plYb1RUdYQHPlKpoC/AtuT7qzyX?=
 =?us-ascii?Q?YWxJ0I4pcr2Ml/dB1UQnt7QgqcKhZWTC0+1KFw6/BA8a3gRdGI+ABfCmemmW?=
 =?us-ascii?Q?N0JfJCST3oOdDGRZW17Yu2bHowyTuRTXczrQImXnsA2Fe5JsEj+prEcZXk4b?=
 =?us-ascii?Q?MoxNoSUVw66f6VE5nvbAP3LfUkG/em2HYXcjpVLlk1/vK94np9olb8l3f/bN?=
 =?us-ascii?Q?teCuAHYUhCs4Y1dMQ3zwER3mUUnkhafz7z9rZ4K3c6ldAjhQoXTKO+hNjcSn?=
 =?us-ascii?Q?Ef7nbdEl4ZO/nO5ScEE/yotuzm4XcrqVjzgXesqqHb+ytarcaTJv3SREpeD8?=
 =?us-ascii?Q?tRDy7oBN2MnIBCBhjbxpT04QGJWSrfPqr0SAP2wCykpQLQjGRanT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de7913a-f681-4903-615a-08dee8ebc6ce
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 18:54:08.5598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NIwTRf/VeKY/3GifF8MOgfLJTTmg46wuhXh8acyw+Y+0qraU8bgsCpW6hulhmrpTGWbc4LfhDpENmqkJkmAwWeu7FYp+Q2wK3w8CRw9GZdPGVHPtNXTfrRkFlS3atYyO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11589

On Thu, Jul 23, 2026 at 05:41:33PM +0900, Koichiro Den wrote:
> Add a core operation for clearing the control word of one linked-list
> entry. A later patch uses the operation to invalidate stale CB when
> resetting a circular LL ring.
>
> No functional change.
>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v2:
>   - Split the provider operation from "Clear LL data entries on reset".
>
>  drivers/dma/dw-edma/dw-edma-core.h    |  6 ++++++
>  drivers/dma/dw-edma/dw-edma-v0-core.c | 16 ++++++++++++++++
>  drivers/dma/dw-edma/dw-hdma-v0-core.c | 16 ++++++++++++++++
>  3 files changed, 38 insertions(+)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
> index e50fa7965778..089f913fd247 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.h
> +++ b/drivers/dma/dw-edma/dw-edma-core.h
> @@ -138,6 +138,7 @@ struct dw_edma_core_ops {
>  	void (*ll_data)(struct dw_edma_chan *chan, struct dw_edma_burst *burst,
>  			u32 idx, bool cb, bool irq);
>  	void (*ll_link)(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr);
> +	void (*ll_clear)(struct dw_edma_chan *chan, u32 idx);
>  	int (*ll_cur_idx)(struct dw_edma_chan *chan);
>  	void (*ch_doorbell)(struct dw_edma_chan *chan);
>  	void (*ch_enable)(struct dw_edma_chan *chan);
> @@ -255,6 +256,11 @@ dw_edma_core_ll_link(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr)
>  	chan->dw->core->ll_link(chan, idx, cb, addr);
>  }
>
> +static inline void dw_edma_core_ll_clear(struct dw_edma_chan *chan, u32 idx)
> +{
> +	chan->dw->core->ll_clear(chan, idx);
> +}
> +
>  static inline void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
>  {
>  	chan->dw->core->ch_doorbell(chan);
> diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
> index ba84811234e1..c31fff095b4f 100644
> --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
> @@ -605,6 +605,21 @@ dw_edma_v0_core_ll_link(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr)
>  	dw_edma_v0_write_ll_link(chan, idx, control, addr);
>  }
>
> +static void dw_edma_v0_core_ll_clear(struct dw_edma_chan *chan, u32 idx)
> +{
> +	ptrdiff_t ofs = idx * sizeof(struct dw_edma_v0_lli);
> +
> +	if (chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL) {
> +		struct dw_edma_v0_lli *lli = chan->ll_region.vaddr.mem + ofs;
> +
> +		lli->control = 0;
> +	} else {
> +		struct dw_edma_v0_lli __iomem *lli = chan->ll_region.vaddr.io + ofs;
> +
> +		writel(0, &lli->control);
> +	}
> +}
> +
>  static void dw_edma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
>  {
>  	struct dw_edma *dw = chan->dw;
> @@ -668,6 +683,7 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
>  	.handle_int = dw_edma_v0_core_handle_int,
>  	.ll_data = dw_edma_v0_core_ll_data,
>  	.ll_link = dw_edma_v0_core_ll_link,
> +	.ll_clear = dw_edma_v0_core_ll_clear,
>  	.ll_cur_idx = dw_edma_v0_core_ll_cur_idx,
>  	.ch_doorbell = dw_edma_v0_core_ch_doorbell,
>  	.ch_enable = dw_edma_v0_core_ch_enable,
> diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> index 2fc7f8e85b43..b2d35f0b7b6d 100644
> --- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> @@ -374,6 +374,21 @@ dw_hdma_v0_core_ll_link(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr)
>  	dw_hdma_v0_write_ll_link(chan, idx, control, addr);
>  }
>
> +static void dw_hdma_v0_core_ll_clear(struct dw_edma_chan *chan, u32 idx)
> +{
> +	ptrdiff_t ofs = idx * sizeof(struct dw_hdma_v0_lli);
> +
> +	if (chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL) {
> +		struct dw_hdma_v0_lli *lli = chan->ll_region.vaddr.mem + ofs;
> +
> +		lli->control = 0;
> +	} else {
> +		struct dw_hdma_v0_lli __iomem *lli = chan->ll_region.vaddr.io + ofs;
> +
> +		writel(0, &lli->control);
> +	}
> +}
> +
>  static void dw_hdma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
>  {
>  	struct dw_edma *dw = chan->dw;
> @@ -424,6 +439,7 @@ static const struct dw_edma_core_ops dw_hdma_v0_core = {
>  	.non_ll_start = dw_hdma_v0_core_non_ll_start,
>  	.ll_data = dw_hdma_v0_core_ll_data,
>  	.ll_link = dw_hdma_v0_core_ll_link,
> +	.ll_clear = dw_hdma_v0_core_ll_clear,
>  	.ll_cur_idx = dw_hdma_v0_core_ll_cur_idx,
>  	.ch_doorbell = dw_hdma_v0_core_ch_doorbell,
>  	.ch_enable = dw_hdma_v0_core_ch_enable,
> --
> 2.51.0
>
