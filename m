Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012057.outbound.protection.outlook.com [52.101.66.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC93417D81;
	Wed, 15 Jul 2026 19:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784142169; cv=fail; b=kiPLeKJDT1uxQ9WE6DLPe+QTLUF64mUTUnUBYvRba/tUucsowxpMbLFW6YcZAYle8l4chqJutWtxhELAVIOj/1zcQD5fuuDqlTgRPJKY0JJsKI7i+vreK9a225SCud6mH6t7qB51JzxkIPu/8fHqwP8X7YTyl1K9M0NhHH2/JSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784142169; c=relaxed/simple;
	bh=M4s4uPgDa7iTislA9B7DojFmJF29OJ1gpDvWsmBoVRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FtQkitsp1KQZX8S3uBUDNmDgBjX920NaP6lZJRET6TDbk8iGRtPx6GJavtpZekEkLSLrYZ7VLdAV/9vSjKHowwHjAaNHj8ZOVyyQuNOUkjUpR8gM9Tbo1VyLM8kemkK2xhThoMCsSAFm0BROp3+ur10i5nsNWLRMyAaS29Cc3E4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Zizm7Z9n; arc=fail smtp.client-ip=52.101.66.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Zizm7Z9n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rS7kLkmIr1w4X0kyRBxvUHEOuCDHJUf04W+GfFHlGcnZcC8cnZgzOb3k+PGT8sDaN7Hpuo+Qg9WFb0gRtmTnyi+ojI3oUEbqbcZBF78RwzEpLCyI1qoNp3xdOkOpxqoLeMqQkgp6j/yzOWgHB29MyBAFcpmxL3jtDLERtR8RYLTe6uYtYc25kxrCpJJhLG853fgINatp92f34vc8rFKYBHeWPP3KCC1UmdjVWXU0OZxhm17emEMmMYwi4/Z/ZiA4b/MTdWOYxxHHwhcBIbyNLaFCLZTZRcr7uKP9FJ0JF7iFDeWXCKSXIMLGNqFRKj6CJA3monpQ/BSWZP2rewcwwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNOuvaQUoeNyHerBaDiv3IbXjpYQb5mguc4UHNd2CTs=;
 b=IGLtilv6UdHg4lI7BKI+HIhC0LaxJ/bJAGJZSHpidxrEhuE5eClMTbEHREP5F0Eyr0xLrO4NXdR3/3usiHnvOabPvYDl0xoMvpna8mKp5zikgo//DLw04lwbxx6bOcdVI9Y/OZofNZvgxhK7K26898QBRcG7wqm/F8ulPvYqmf97p9lzzxoXNKoYazfk395gJh3PkEaCGgEH1zZKvjteLWHacrgPnFWojVg7p4kKpn0lo7ZwGtZnRvHoiGuZNT7+Ni7meBpiM08jUo7ie5YJKgvmDyxxAqPht2TrEwFPEdpWEmSgF6NelkDZZwrEIB4+hyQ0tqMEwJJz8Fo+G+npeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNOuvaQUoeNyHerBaDiv3IbXjpYQb5mguc4UHNd2CTs=;
 b=Zizm7Z9nvJEz/8hQgsngUiXv6aGa7c8s/0QjsybQqDyR1upcKbecPBxoK9oziONeU9buCIdbCou5auT2BHzqylmvb5w3OgLce5OZvlJ10hySyj8Czbd9X1+lHH8O20kSxhofPlyh2Xc/Gex8QXk/rhgph/2xbZLwS3Y+PEkFmTo6ppv6e8pxHimWnUFXyLx/4rEFUx9CETBlviYRvJkT1rdD2Imh1CZNycUBLXQ34Pqt5ZtldxE+0fzj06UUSJYhY2mf7MJSK91vMNNbjdSwghntE6vMSn7DhrREsru3UUifmWVaeER4NQjJRelpRoKqWlv7FTb/0LHpPhNNDJw7bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB11481.eurprd04.prod.outlook.com (2603:10a6:800:2c8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Wed, 15 Jul
 2026 19:02:29 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Wed, 15 Jul 2026
 19:02:29 +0000
Date: Wed, 15 Jul 2026 14:02:20 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Cai Huoqing <cai.huoqing@linux.dev>,
	Serge Semin <fancer.lancer@gmail.com>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
	Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 9/9] dmaengine: dw-edma: Defer channel IRQ handling to
 workqueue
Message-ID: <alfZPMZTwi7nENsV@SMW015318>
References: <20260715175740.1110404-1-den@valinux.co.jp>
 <20260715175740.1110404-10-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715175740.1110404-10-den@valinux.co.jp>
X-ClientProxiedBy: PH8P221CA0050.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::11) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB11481:EE_
X-MS-Office365-Filtering-Correlation-Id: ad759df9-2ac1-485d-971f-08dee2a39dba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|7416014|19092799006|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MoIjOUhQwCuZPYTUtYQbNiHqDBRg0hPglIK/RmDnb+JqBHBjiw5FMvCUmPjG4SM4uCFIsZ3mHmv2pEmIEywpiFlRquSX/Bm/pLsIjxgIaSVHsHT5Eq6JCaMllM1mdps4jrG2knOO9qn5tOAC/RF6PQn+irIWDEbDUl/Z/EwEbbMf+ICOdIf/grt7D9YX4g307sO/O4UgxfFKsKBcudsTpWkII+Yz1KxoyaSpZABXTiXRJQzOoqohOt23TjpCl8gdRUEGsBRCLmMch2cnY40sb2DweMc/o98Cn22OZrAE0nMip5VcwzFNukrkKtgbYfcbRdORd7jHgtVEAIRYDfXi7ssn0tpWL3oDLswH0tJ8e+P6rOEu0itr1uXOlj3GF0VsSkRgZa6lCqVq1sMyUEBYLy7Ib7x52Bq8nJV5A6s96VgKPjRGW6v8i4Wqlv+MIN/Ym6K/n/z4O1FDDZosprmbNLEjn6J9NKIsyYzWKeMD8k75Xjadurc9fYTtUYRAOvfsqGFR4on36DKHHjlRmv/t9iPxE5m/A6dpD7Tnvzc7wGInbOP4j66j676lqg0+RgD7mEShaXcCzaOpDRmVFdRrjY5t18ubg8Ew3p2cYppM0g8UNXbsqyGIY5s/WO2jDn10eWuXWjrmizh0l7JtktQtuov28YfUOSdMbG/tmMvkhSs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(7416014)(19092799006)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7JNdf6cS8rc/mHAmo1PFiv9UJtb06aP9FjlsjUvFRByztrlk3LpPRSTJWxSk?=
 =?us-ascii?Q?JLSDcW14eVRj27Sg7Z3v61kN4x3s+QRFowr3S1s889rkcXPUkxOJPHW7X1z0?=
 =?us-ascii?Q?Pyt2/cBzqXc7wgUOc2v/26iSWx8CavFcptTAni5FZMkPDjS3wsIVk0Oh6R5o?=
 =?us-ascii?Q?IlC4E3iadpMlckNVn2LQ0hBtXZNAGepEaHjUKhHmysSIRQLwLOtE5uq5CJ90?=
 =?us-ascii?Q?QKUKup0TEcHhXdG8TWTStx8+gFoJ0sb1VHG8ITZFQtLxwrpSZGCNmhQW7V0w?=
 =?us-ascii?Q?2acVwEBs+LlI5/neqYFZ9h6FurS7AvnFBDfiizwny/3pgH0HiX1ef4Gce6U5?=
 =?us-ascii?Q?nUCMo4rcKschSGam47aZDneXj/E7ZlfLnYmje/T6QWdS9qJVOEgNvOakhj2q?=
 =?us-ascii?Q?YoBf0W2WoI0cYxBLDQdUkY+yiNYpbAp1BM8nohKpsPqSMPSIVNicFBmyxEeW?=
 =?us-ascii?Q?kNLkosXv4kiU57SmGHHcwlWwy1UV+GmAJRI6zIBXazdcb7sZFg9lnYIBvjHS?=
 =?us-ascii?Q?xmCmIrL7tNeS3qZw7dT+PZ8+eol57sLCVrZbpU10N8HbJKwjavSEgc4TJW14?=
 =?us-ascii?Q?LE2IL7O0+QlwBViui37fqFAEraJIlw/RP7WsXcDrC9IVF97dfiyK94/Pykp5?=
 =?us-ascii?Q?MxMJJ52RLUq+CFPgS4oBhQ3+jGaBIOoFsO85YkxUvxGXoznWgUxi96mYxcbx?=
 =?us-ascii?Q?V4HKxPWW+1+dd9UeSq+cadxu2ENGDELe3KYvgxa6b9HApOOFuOn+Z94mPvo1?=
 =?us-ascii?Q?ok4zE1tJIqXglFumXVJbrAhouTSm/B5mkR1F70HWcUBYiPXy+jB2sJexf260?=
 =?us-ascii?Q?dCAF8gTzhRvosYjPTnYPD2mom4Vempb1dTkQHWpNKBmFbHAThOZO8Fp3ffYL?=
 =?us-ascii?Q?e/PIhMEZekgKQsE56nJ/f63RkVjPe153/LqHnL5Tfm/LpFtSiOZ59PYvVLWi?=
 =?us-ascii?Q?I1L5DLCZ4a7uyP1KCnhTfWoHQJJrPbtP5y/UEnk7rNKipEGhQCPivnnkNDJP?=
 =?us-ascii?Q?pGlmsd9AX97+yGx/Xz/Z2FcuFBgQnHtPqurER4cfFKYzCm0VsmQLbY1bwvji?=
 =?us-ascii?Q?KMJlu4vqbGskPapeFdP3ZNkx6kTTV4lIp/SXzalBXcKEYCbqY6jC586cU/hp?=
 =?us-ascii?Q?f+mGVWb9dpnGxdSoI8efq2vJ+m+Bte0R4q4JhinWV4/WKf6L+eWOiPE8oygj?=
 =?us-ascii?Q?Hh6dmp4pXJSvjacnrz8PiWbR/a2KjhWfgmahFyjbQhjLJC1fSLqoFcRTaWkY?=
 =?us-ascii?Q?k/7y6qFp/t3d6tm1uT30BO2djdEvo3U+vecEqKyWNyDPUxqDT4CDiUy998WO?=
 =?us-ascii?Q?pKOy/D5cBCnclqLwTD4aE7kY+Q+Dc9oOtE/XLxHNVVAF0g1Hu3FO6CEbEIPb?=
 =?us-ascii?Q?NxWRpsNCDrWnW8MrxsDE2XDHnK5NpVWnJ8v2a7HxbFikWLHNPoaeELV1v2bQ?=
 =?us-ascii?Q?XC5z45vZlXo181XqbPrXcka83Lf+8LbVaQEvLHuEv+wN5OkZy9rfS+x7VOKq?=
 =?us-ascii?Q?+GEcWs2+xNGgTFB1BW524GgV0jYYYNaa7xgEuAFtbU57F6WP964vcPWsVMRP?=
 =?us-ascii?Q?AuTTgTVoz79Y8G4APvY8MaUBmCVQummjGWn68JgvepK+6Bwfaq9dhW82Wgkz?=
 =?us-ascii?Q?7o4QzVnpyy3TebIZl7lOPsTjobyDM22u7kt6V4ILUwj+5G3DGh8u7b2fN0IS?=
 =?us-ascii?Q?c+YVZ/N8QW5of6Gp4sDM2Jqi028wWvUWwvg57QFehqDsCS/Qk2iJfZFjlF2w?=
 =?us-ascii?Q?aAJHOA9L3NP4PL4XiULXSLNcfvlyKBjx1n6L+vMLPMojLu9M535O?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad759df9-2ac1-485d-971f-08dee2a39dba
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 19:02:29.3245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kh4eiVrg226/utXKu544ByS3Xj4ZDR7mXdQUvZjjOOoBAfVzpq1FCIxLE29+H6ZRXHqF3I/H6fGkgHGxkj4mx8iqctmCLySrLiZ7oQQpgDsqNTBjiAkRR8Ez236kIWzn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11481

On Thu, Jul 16, 2026 at 02:57:40AM +0900, Koichiro Den wrote:
> On some SoCs (e.g. R-Car S4) the endpoint-side eDMA raises a single
> fixed SPI that is hardwired to CPU0 and covers every read and write
> channel. Handling channel events directly in that hard IRQ context
> serializes the completion processing of all channels on one CPU:
> descriptor recycling and refill, client callbacks (the vchan tasklet
> runs on the scheduling CPU) and the doorbell writes all funnel through
> CPU0, while the handler additionally spins on each channel's vc.lock.
> Especially under heavy multichannel load, this contention becomes a
> performance bottleneck.
>
> Keep the hard IRQ handler minimal: clear the status, dispatch channel
> events, and defer per-channel processing to work items. A work item per
> channel preserves ordering while allowing different channels to run in
> parallel on any CPU.
>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v3:
>   - Clear irq_pending in dw_edma_device_synchronize(). (Sashiko)
>   - Drop Frank's Reviewed-by tag due to this change.
>   - Refine the commit message and source comments.
>
>  drivers/dma/dw-edma/dw-edma-core.c | 69 +++++++++++++++++++++++++++---
>  drivers/dma/dw-edma/dw-edma-core.h | 11 +++++
>  2 files changed, 75 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index 2369b4c4630b..4ee7f14c3a82 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -30,6 +30,11 @@ struct dw_edma_desc *vd2dw_edma_desc(struct virt_dma_desc *vd)
>  	return container_of(vd, struct dw_edma_desc, vd);
>  }
>
> +enum dw_edma_irq_event {
> +	DW_EDMA_IRQ_DONE	= BIT(0),
> +	DW_EDMA_IRQ_ABORT	= BIT(1),
> +};
> +
>  static inline
>  u64 dw_edma_get_pci_address(struct dw_edma_chan *chan, phys_addr_t cpu_addr)
>  {
> @@ -759,6 +764,39 @@ static void dw_edma_abort_interrupt(struct dw_edma_chan *chan)
>  	spin_unlock_irqrestore(&chan->vc.lock, flags);
>  }
>
> +static void dw_edma_irq_work(struct work_struct *work)
> +{
> +	struct dw_edma_chan *chan = container_of(work, struct dw_edma_chan,
> +						 irq_work);
> +	unsigned int events;
> +
> +	do {
> +		events = atomic_xchg(&chan->irq_pending, 0);
> +
> +		if (events & DW_EDMA_IRQ_DONE)
> +			dw_edma_done_interrupt(chan);
> +		if (events & DW_EDMA_IRQ_ABORT)
> +			dw_edma_abort_interrupt(chan);
> +	} while (atomic_read(&chan->irq_pending));
> +}
> +
> +static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
> +				   enum dw_edma_irq_event event)
> +{
> +	atomic_or(event, &chan->irq_pending);
> +	queue_work(chan->dw->wq, &chan->irq_work);
> +}
> +
> +static void dw_edma_done_interrupt_deferred(struct dw_edma_chan *chan)
> +{
> +	dw_edma_queue_irq_work(chan, DW_EDMA_IRQ_DONE);
> +}
> +
> +static void dw_edma_abort_interrupt_deferred(struct dw_edma_chan *chan)
> +{
> +	dw_edma_queue_irq_work(chan, DW_EDMA_IRQ_ABORT);
> +}
> +
>  static void dw_edma_emul_irq_ack(struct irq_data *d)
>  {
>  	struct dw_edma *dw = irq_data_get_irq_chip_data(d);
> @@ -853,8 +891,8 @@ static inline irqreturn_t dw_edma_interrupt_write_inner(int irq, void *data)
>  	struct dw_edma_irq *dw_irq = data;
>
>  	return dw_edma_core_handle_int(dw_irq, EDMA_DIR_WRITE,
> -				       dw_edma_done_interrupt,
> -				       dw_edma_abort_interrupt);
> +				       dw_edma_done_interrupt_deferred,
> +				       dw_edma_abort_interrupt_deferred);
>  }
>
>  static inline irqreturn_t dw_edma_interrupt_read_inner(int irq, void *data)
> @@ -862,8 +900,8 @@ static inline irqreturn_t dw_edma_interrupt_read_inner(int irq, void *data)
>  	struct dw_edma_irq *dw_irq = data;
>
>  	return dw_edma_core_handle_int(dw_irq, EDMA_DIR_READ,
> -				       dw_edma_done_interrupt,
> -				       dw_edma_abort_interrupt);
> +				       dw_edma_done_interrupt_deferred,
> +				       dw_edma_abort_interrupt_deferred);
>  }
>
>  static inline irqreturn_t dw_edma_interrupt_write(int irq, void *data)
> @@ -940,6 +978,8 @@ static void dw_edma_device_synchronize(struct dma_chan *dchan)
>  	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
>
>  	dw_edma_wait_termination(dchan);
> +	cancel_work_sync(&chan->irq_work);
> +	atomic_set(&chan->irq_pending, 0);
>  	vchan_synchronize(&chan->vc);
>  }
>
> @@ -982,6 +1022,8 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
>  		chan->configured = false;
>  		chan->request = EDMA_REQ_NONE;
>  		chan->status = EDMA_ST_IDLE;
> +		INIT_WORK(&chan->irq_work, dw_edma_irq_work);
> +		atomic_set(&chan->irq_pending, 0);
>
>  		if (chan->dir == EDMA_DIR_WRITE)
>  			chan->ll_max = (chip->ll_region_wr[chan->id].sz / EDMA_LL_SZ);
> @@ -1195,10 +1237,21 @@ int dw_edma_probe(struct dw_edma_chip *chip)
>  	/* Disable eDMA, only to establish the ideal initial conditions */
>  	dw_edma_core_off(dw);
>
> +	/*
> +	 * Deferred IRQ works are queued from the hard IRQ handlers, so the
> +	 * workqueue must exist before any IRQ is requested.
> +	 */
> +	dw->wq = alloc_workqueue("dw-edma:%s", WQ_UNBOUND | WQ_HIGHPRI, 0,
> +				 dev_name(chip->dev));
> +	if (!dw->wq)
> +		return -ENOMEM;
> +
>  	/* Request IRQs */
>  	err = dw_edma_irq_request(dw, &wr_alloc, &rd_alloc);
> -	if (err)
> +	if (err) {
> +		destroy_workqueue(dw->wq);
>  		return err;
> +	}
>
>  	/* Allocate a dedicated virtual IRQ for interrupt-emulation doorbells */
>  	err = dw_edma_emul_irq_alloc(dw);
> @@ -1221,6 +1274,7 @@ int dw_edma_probe(struct dw_edma_chip *chip)
>  	for (i = (dw->nr_irqs - 1); i >= 0; i--)
>  		free_irq(chip->ops->irq_vector(dev, i), &dw->irq[i]);
>  	dw_edma_emul_irq_free(dw);
> +	destroy_workqueue(dw->wq);
>
>  	return err;
>  }
> @@ -1245,6 +1299,11 @@ int dw_edma_remove(struct dw_edma_chip *chip)
>  		free_irq(chip->ops->irq_vector(dev, i), &dw->irq[i]);
>  	dw_edma_emul_irq_free(dw);
>
> +	for (i = 0; i < dw->wr_ch_cnt + dw->rd_ch_cnt; i++)
> +		cancel_work_sync(&dw->chan[i].irq_work);
> +
> +	destroy_workqueue(dw->wq);
> +
>  	/* Deregister eDMA device */
>  	dma_async_device_unregister(&dw->dma);
>  	list_for_each_entry_safe(chan, _chan, &dw->dma.channels,
> diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
> index 6474cacf7195..7f6301572fa4 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.h
> +++ b/drivers/dma/dw-edma/dw-edma-core.h
> @@ -9,8 +9,10 @@
>  #ifndef _DW_EDMA_CORE_H
>  #define _DW_EDMA_CORE_H
>
> +#include <linux/atomic.h>
>  #include <linux/msi.h>
>  #include <linux/dma/edma.h>
> +#include <linux/workqueue.h>
>
>  #include "../virt-dma.h"
>
> @@ -87,6 +89,9 @@ struct dw_edma_chan {
>
>  	struct dma_slave_config		config;
>  	bool				non_ll;
> +
> +	struct work_struct		irq_work;
> +	atomic_t			irq_pending;
>  };
>
>  struct dw_edma_irq {
> @@ -109,6 +114,12 @@ struct dw_edma {
>
>  	struct dw_edma_chan		*chan;
>
> +	/*
> +	 * WQ_HIGHPRI keeps completion processing responsive under heavy load;
> +	 * WQ_UNBOUND lets different channels run on different CPUs.
> +	 */
> +	struct workqueue_struct		*wq;
> +
>  	raw_spinlock_t			lock;		/* Protect v0 shared registers */
>
>  	struct dw_edma_chip             *chip;
> --
> 2.51.0
>
