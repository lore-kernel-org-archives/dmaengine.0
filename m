Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011068.outbound.protection.outlook.com [40.107.130.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F2139CD05;
	Fri, 14 Aug 2026 21:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786743350; cv=fail; b=BhzmHuPBBbd27s/YbSa/T6AGwQDtQ09NlvW3FHCm91wqx/H3MbIajoybfWLHddg29Zkd+rqqnS5/XGUi91puTsgwtUzbbW1ta+ViBb/T3h/kurLxIvVCNpOsOjsgQ1x9u8hTuS1qEsK+mbYhj1iWImNyRRThfoEvuJFOrnBU6sk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786743350; c=relaxed/simple;
	bh=Tuj1rwjrHfr6wdyyynnp1lWgb9HsohskLgqnzfXHrqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=D3cgVNVinRTuedfw6l8g7voY2ca9VGEp2PYoXjj6lcnT/70mMF/pCaFRwIqTQk16iKV9B4KCpg6XTBulCSnHcYhQ+2MqdGBHXGFbFmNdsD/wrMLKfvdg0/Occ9Taw/e4gP631j5o/PWq600gL1KO7uIh8zco5xgJZcg1nmC05WM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QHjZa+T8; arc=fail smtp.client-ip=40.107.130.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QHjZa+T8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g2cfpukCYipeoj7hKCLITf1tq/7BU1FEKpF5FuOTQ44qPEfKFQr7+deFXqyY9BVrHJ9OJRQ+xcG4RTShgHjERfYsSDVr5djO4Q5uhTyRW6ANfdMk/F4Bdg9xrROPxFw/agogqVsmh933z93T+/+VYH85HgGAI5jZZXyzQDLWxgpOUR9IYpGJZb3QXs2DbPfpzVxvWJb4vEvIjOdIVI3nOSTbr8Sw0WsasXU1RRVchh5urlgjlB5iWybZZmbf2oLPRIcgDFR/0wsSN5WcONPCzY8FG4XFRg5odN/biJCLnV4/qsiLi1FnXghX590yIvdYAV1KWpVPHksE7cvyytqbVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBZ/nS042ZaIvzqg1RsCrcgKVEnfSEHJrVD/siZDQzg=;
 b=CF5t7fKnNYwCetn+KO3vhhzetBgGYT/ZjHfH6YpAVzlP2j7ybBtFo+UlNjMOF/o+y2J5KkEjek44KRNsS+bOv9VI+Pbe5I77EhjOSS+IJn3ilkc1gBkzMC1XTqvaSHSk5JzgIj/2IJxUjn5GQXq7LvhmXSlSsdHFVuu3UfCweJcS99fJhF4JfzFu75aTn3Ko0DbiUUf12OuWde6u1fDJtmvSCIJd9yMmQu/2PxJWz6BSZPqjCvg/KtQmVnV2J8qee6oz+50G6tSHAleCsGgvntHjhpt0QYvtDj3XU7khS/QQOkPs2HpU8+iDXThWpd6+5oG4ad+a2wcY8SXJcbKulQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBZ/nS042ZaIvzqg1RsCrcgKVEnfSEHJrVD/siZDQzg=;
 b=QHjZa+T8fV821WyCZW8ogqEf6MqrPFBPT/asjmO9cyKs8ugtWkBV2z2TUis7XBdE+4gQx5/pz3+WCbGSMyKIIneQ9QZtw2JWQavmdXhVBxhFFV6UB18+WgiO3/vDFpEnqFNIbMWoY+7t+BH24fhsj7UQpEwq9U/OY9OMyOu+2F21UaIsB2fmCfDlVVwnPJDxlhnG0q0AmwokuzHFJMR2gRGtHAYwqEWvkBKYbc7T7+gtd1P9Z3C7RDHWFecb76NvekfEPi+RoXvl8vY3o9J7cKmN4++CLYOU0dTKkqvnuJBgcWgl9jStkg6SxF9DMub1qdsehKOQj0n6D4OuDrkAzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB8PR04MB6908.eurprd04.prod.outlook.com (2603:10a6:10:116::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 21:35:44 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 21:35:44 +0000
Date: Fri, 14 Aug 2026 17:35:36 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Cc: peter.ujfalusi@gmail.com, vigneshr@ti.com, vkoul@kernel.org,
	Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	r-sharma3@ti.com, gehariprasath@ti.com
Subject: Re: [PATCH v8 03/19] dmaengine: ti: k3-udma: move structs and enums
 to header file
Message-ID: <an-KKKzOHbfpRu18@lizhi-Precision-Tower-5810>
References: <20260810151423.1948224-1-s-adivi@ti.com>
 <20260810151423.1948224-4-s-adivi@ti.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810151423.1948224-4-s-adivi@ti.com>
X-ClientProxiedBy: SA0PR11CA0078.namprd11.prod.outlook.com
 (2603:10b6:806:d2::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB8PR04MB6908:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b41fb15-087c-4f72-aea3-08defa4bfeed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|19092799006|22082099003|18002099003|56012099006|3023799007|6133799003|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	qHEAh/QnzZ38oQ2Tpug2fldzon/hpJGIBLQ/+B3iu959vA12j56wsin16k7jbUeeDJ/9GcONAUxknbHYlfyx88NWibP1I0YL2+Sndn6RauSP8Bk5mnslJmyu74mPWq9DAXTbvGPajzALNmI4IOymCujQM3i+FPR95b9U6PUHY4n56tZ3QAEcyEE+/fBhml9ZsdX5uwOrtW2wHa8G/BEOm27R72ZFG0lF3db8QD+aeE1bHzgm5LE//MLxRQntLo6WZ7ykPbKfKy3ourzRMYtlUZiDwY5KLEd4LTRFHHuxOzvJzSddprUMLsa2gLCP9YPCiOWcKTiJc383WvOh63kLMlOqsLvP1qXBZgvoM/i+2Vhc4ceVTZH3AN170Om6F4pOp5tcBGDCErX8Kw2St2P8zgFrHJ+lsL2Ki5Nnd4Nk/U6UJ7qmwb+j1btj0ZzrvJrUxsihybLoODO01KLOUFgTi4g6wVcgbWMtzKw5Zk+s+C/hwJdmFYyX0pxNvPM/XrYWHvhI22iXYzpmp/E9MgQ2eWjfkJNyWPHdGSf01AXzYpRKsc3g8FDhMl0/yvYSiHaAt+b8RuCvaCxihWZYt5sFz4rHLyLsuOrwyhG8l8EIVYCnYVjUh8/p6y/gkh9lAUpYea5KGR6q5Wjx6ehWyhSnsL3P6ezwTj5Qp6ggY2yOT3M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(19092799006)(22082099003)(18002099003)(56012099006)(3023799007)(6133799003)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?otsLhEAggWRskJr4WgDrXvnVhXxMzyyjpJXD9J3zhrfwSFiUKLdRXKUV+DjE?=
 =?us-ascii?Q?ZorXPkJ9WufW0IvC7PnS/AuUec+ggFndvV+LqaIeN9xlEKwjmsu2NWU9GVO9?=
 =?us-ascii?Q?Fznj04gBAxU4HvIagGGvo0l9l2S1U2OpVnIWucrQ824CNyvsGO/cDZVCzT4e?=
 =?us-ascii?Q?P2OFO12xikcMsmMmBDWioB+cx6UCdb5I6Id9ND/Z3l1wqlduf5mwdlaJTo3i?=
 =?us-ascii?Q?DTWjK2rJHm2+LUU4vQUofycMn7UvkjoSubVwOD7UmNrMoZH39eAvY6c4qtzG?=
 =?us-ascii?Q?psYLxAjM1g3YkpPIz4Cgg+ZKZ0pW9FroAKH/jwbqUa7gx7F9DSoyXzQMUcqu?=
 =?us-ascii?Q?qgMnNr8kEye2xiZ8RFFoVUh3hIsA1cHIRgfNMJhFUSLz0MDZH6xKZvr58p/8?=
 =?us-ascii?Q?R4MWL81tuMuj4JHrXeu6HX+0lfKmr/fzGBLhh7iIit7lUTPd8M2NozvHUh8K?=
 =?us-ascii?Q?OjtSqWVMjMveYultiVxWv7tRvvpVXeGIGN0HwSXXdRvgD5pHFYgZ4ngn0Rxl?=
 =?us-ascii?Q?RwflME5PjBIKatF7+oMlv5HlyU0WdwPU5RmLtXF1Pj20vgWnv1iMqWbKIrQx?=
 =?us-ascii?Q?q0KnqfWVpEtC/nnTdDb3egL0X5n/fFFtpUb1CgV9Z6Wyp4ZOIixMyvfgBQsx?=
 =?us-ascii?Q?kWW1W9k9qRUzPJrC/ss0TntIb3emzo5QMfhzRBsjInOPzQ4drA+xcABA59SC?=
 =?us-ascii?Q?GkEbZb2AoxUaFcGu4FXzhbQyH/gxKoWjQFNxMvwvT+5b2OiHCiH+Ao0cXPXB?=
 =?us-ascii?Q?TyqBud/vbJ96GOS5JjyaKFMfX501NvvK9BU2YB7vyxUN14hVqYH5gwxmnjck?=
 =?us-ascii?Q?JPtqbgFgvyaTYcaofVSwR5UrdK/Y5pvZJrBUNumF0KEgXY2pOWkm5vfXUNM8?=
 =?us-ascii?Q?938tbHoAGBjT63FRo7I8co92UomZcWjJf0jIMa2uD4qUKKaIG+wqyHjnPYq+?=
 =?us-ascii?Q?ELz585PgioLbmc8bANgjlGr4A2n+Cg7BW2HNG+Hmtvsaa8Y/OTAPq+Spd3+Q?=
 =?us-ascii?Q?XGYXumsE8Gn5y4aQsYvhl43P+Son3tY02AJMenYGnFoYBVToNwFuiWMAN1yS?=
 =?us-ascii?Q?rZrjTMXCRCEqi/Y/nDOocOEJ6b7CRlM9hDa0WtCwS2cRhTKX3BJ5PXmW8qdR?=
 =?us-ascii?Q?UgY2flF9Np1306Aa+dWrqkr3oMOX636Pb+HzhfBztd4k4rCTwJHsHsGsj+qj?=
 =?us-ascii?Q?BP/R42gzybXw3OqOCRb2KJoWMT1H9AZ2EQ4w/mw9b0qtlbW6MvS374mNyGQV?=
 =?us-ascii?Q?4HJ71YlP1wh/iQQ6k8Zjkzd9yxlCkdG9hRmiqmoc8BBmAwSf8ee7mVBWtAUd?=
 =?us-ascii?Q?z3LqPzWfEAAVzhsWnK3FPPdinX6GiG0pDCzU35D5Z9FBd8iuW3SndVMbn5ix?=
 =?us-ascii?Q?HP2CUNwEqI2VfXZSR+b67Lo0ZcShV2xBgq+uazJZLJgz112SJkQD19iAA6+X?=
 =?us-ascii?Q?YYtQLV86lgkxID0X5ENOAnBmXm2dVAbwrjDfE68pIOTtNEE87DGP1y6uxhLC?=
 =?us-ascii?Q?B3r1UssNrDXZ+y11iekTrmXRdDhnLS7A2xPOR4ldw8i05X6ewJhcMh2F/p76?=
 =?us-ascii?Q?J5P+HWT54O68TwZicX1CHmL/e9ufvZINzzisKS6hB+TELIPsD/iyqTQceYsP?=
 =?us-ascii?Q?gJkBRRob7NcjYmEp4daHKhsPZ36UvSQzym6svpORxPpyp+FI5rSTlZypO6T7?=
 =?us-ascii?Q?22HXJN/kam2GlDufl+/3Hw1SLs/BQ/ZU4qSoKNZEBYzRUKyO7yvYSznrm4vi?=
 =?us-ascii?Q?lks9PEZr0ZqRHbdATf7Y9uii82eLKMxZXuJF1ovr31meIepgT8Qp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b41fb15-087c-4f72-aea3-08defa4bfeed
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 21:35:44.1215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F57E5R50mh0HOQjgpNMy+tedPT9iBpPNtChS8w0zPEfJT+3pIh0f4zYMdo15AyIMCHfpD1HJxzb9eypU2+CPSNCxrFIjOPvQjeQHTFCm78iZLVoGekahiyCcgffC+Kt7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6908

On Mon, Aug 10, 2026 at 08:43:57PM +0530, Sai Sree Kartheek Adivi wrote:
> Move struct and enum definitions in k3-udma.c to k3-udma.h header file
> for better separation and reuse.
>
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ti/k3-udma.c | 259 +-------------------------------------
>  drivers/dma/ti/k3-udma.h | 265 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 266 insertions(+), 258 deletions(-)
>
> diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
> index a066862e2c699..ce706033143ad 100644
> --- a/drivers/dma/ti/k3-udma.c
> +++ b/drivers/dma/ti/k3-udma.c
> @@ -24,8 +24,8 @@
>  #include <linux/workqueue.h>
>  #include <linux/completion.h>
>  #include <linux/soc/ti/k3-ringacc.h>
> -#include <linux/soc/ti/ti_sci_protocol.h>
>  #include <linux/soc/ti/ti_sci_inta_msi.h>
> +#include <linux/soc/ti/ti_sci_protocol.h>
>  #include <linux/dma/k3-event-router.h>
>  #include <linux/dma/ti-cppi5.h>
>
> @@ -33,28 +33,6 @@
>  #include "k3-udma.h"
>  #include "k3-psil-priv.h"
>
> -struct udma_static_tr {
> -	u8 elsize; /* RPSTR0 */
> -	u16 elcnt; /* RPSTR0 */
> -	u16 bstcnt; /* RPSTR1 */
> -};
> -
> -struct udma_chan;
> -
> -enum k3_dma_type {
> -	DMA_TYPE_UDMA = 0,
> -	DMA_TYPE_BCDMA,
> -	DMA_TYPE_PKTDMA,
> -};
> -
> -enum udma_mmr {
> -	MMR_GCFG = 0,
> -	MMR_BCHANRT,
> -	MMR_RCHANRT,
> -	MMR_TCHANRT,
> -	MMR_LAST,
> -};
> -
>  static const char * const mmr_names[] = {
>  	[MMR_GCFG] = "gcfg",
>  	[MMR_BCHANRT] = "bchanrt",
> @@ -62,234 +40,6 @@ static const char * const mmr_names[] = {
>  	[MMR_TCHANRT] = "tchanrt",
>  };
>
> -struct udma_tchan {
> -	void __iomem *reg_rt;
> -
> -	int id;
> -	struct k3_ring *t_ring; /* Transmit ring */
> -	struct k3_ring *tc_ring; /* Transmit Completion ring */
> -	int tflow_id; /* applicable only for PKTDMA */
> -
> -};
> -
> -#define udma_bchan udma_tchan
> -
> -struct udma_rflow {
> -	int id;
> -	struct k3_ring *fd_ring; /* Free Descriptor ring */
> -	struct k3_ring *r_ring; /* Receive ring */
> -};
> -
> -struct udma_rchan {
> -	void __iomem *reg_rt;
> -
> -	int id;
> -};
> -
> -struct udma_oes_offsets {
> -	/* K3 UDMA Output Event Offset */
> -	u32 udma_rchan;
> -
> -	/* BCDMA Output Event Offsets */
> -	u32 bcdma_bchan_data;
> -	u32 bcdma_bchan_ring;
> -	u32 bcdma_tchan_data;
> -	u32 bcdma_tchan_ring;
> -	u32 bcdma_rchan_data;
> -	u32 bcdma_rchan_ring;
> -
> -	/* PKTDMA Output Event Offsets */
> -	u32 pktdma_tchan_flow;
> -	u32 pktdma_rchan_flow;
> -};
> -
> -struct udma_match_data {
> -	enum k3_dma_type type;
> -	u32 psil_base;
> -	bool enable_memcpy_support;
> -	u32 flags;
> -	u32 statictr_z_mask;
> -	u8 burst_size[3];
> -	struct udma_soc_data *soc_data;
> -};
> -
> -struct udma_soc_data {
> -	struct udma_oes_offsets oes;
> -	u32 bcdma_trigger_event_offset;
> -};
> -
> -struct udma_hwdesc {
> -	size_t cppi5_desc_size;
> -	void *cppi5_desc_vaddr;
> -	dma_addr_t cppi5_desc_paddr;
> -
> -	/* TR descriptor internal pointers */
> -	void *tr_req_base;
> -	struct cppi5_tr_resp_t *tr_resp_base;
> -};
> -
> -struct udma_rx_flush {
> -	struct udma_hwdesc hwdescs[2];
> -
> -	size_t buffer_size;
> -	void *buffer_vaddr;
> -	dma_addr_t buffer_paddr;
> -};
> -
> -struct udma_tpl {
> -	u8 levels;
> -	u32 start_idx[3];
> -};
> -
> -struct udma_dev {
> -	struct dma_device ddev;
> -	struct device *dev;
> -	void __iomem *mmrs[MMR_LAST];
> -	const struct udma_match_data *match_data;
> -	const struct udma_soc_data *soc_data;
> -
> -	struct udma_tpl bchan_tpl;
> -	struct udma_tpl tchan_tpl;
> -	struct udma_tpl rchan_tpl;
> -
> -	size_t desc_align; /* alignment to use for descriptors */
> -
> -	struct udma_tisci_rm tisci_rm;
> -
> -	struct k3_ringacc *ringacc;
> -
> -	struct work_struct purge_work;
> -	struct list_head desc_to_purge;
> -	spinlock_t lock;
> -
> -	struct udma_rx_flush rx_flush;
> -
> -	int bchan_cnt;
> -	int tchan_cnt;
> -	int echan_cnt;
> -	int rchan_cnt;
> -	int rflow_cnt;
> -	int tflow_cnt;
> -	unsigned long *bchan_map;
> -	unsigned long *tchan_map;
> -	unsigned long *rchan_map;
> -	unsigned long *rflow_gp_map;
> -	unsigned long *rflow_gp_map_allocated;
> -	unsigned long *rflow_in_use;
> -	unsigned long *tflow_map;
> -
> -	struct udma_bchan *bchans;
> -	struct udma_tchan *tchans;
> -	struct udma_rchan *rchans;
> -	struct udma_rflow *rflows;
> -
> -	struct udma_chan *channels;
> -	u32 psil_base;
> -	u32 atype;
> -	u32 asel;
> -};
> -
> -struct udma_desc {
> -	struct virt_dma_desc vd;
> -
> -	bool terminated;
> -
> -	enum dma_transfer_direction dir;
> -
> -	struct udma_static_tr static_tr;
> -	u32 residue;
> -
> -	unsigned int sglen;
> -	unsigned int desc_idx; /* Only used for cyclic in packet mode */
> -	unsigned int tr_idx;
> -
> -	u32 metadata_size;
> -	void *metadata; /* pointer to provided metadata buffer (EPIP, PSdata) */
> -
> -	unsigned int hwdesc_count;
> -	struct udma_hwdesc hwdesc[];
> -};
> -
> -enum udma_chan_state {
> -	UDMA_CHAN_IS_IDLE = 0, /* not active, no teardown is in progress */
> -	UDMA_CHAN_IS_ACTIVE, /* Normal operation */
> -	UDMA_CHAN_IS_TERMINATING, /* channel is being terminated */
> -};
> -
> -struct udma_tx_drain {
> -	struct delayed_work work;
> -	ktime_t tstamp;
> -	u32 residue;
> -};
> -
> -struct udma_chan_config {
> -	bool pkt_mode; /* TR or packet */
> -	bool needs_epib; /* EPIB is needed for the communication or not */
> -	u32 psd_size; /* size of Protocol Specific Data */
> -	u32 metadata_size; /* (needs_epib ? 16:0) + psd_size */
> -	u32 hdesc_size; /* Size of a packet descriptor in packet mode */
> -	bool notdpkt; /* Suppress sending TDC packet */
> -	int remote_thread_id;
> -	u32 atype;
> -	u32 asel;
> -	u32 src_thread;
> -	u32 dst_thread;
> -	enum psil_endpoint_type ep_type;
> -	bool enable_acc32;
> -	bool enable_burst;
> -	enum udma_tp_level channel_tpl; /* Channel Throughput Level */
> -
> -	u32 tr_trigger_type;
> -	unsigned long tx_flags;
> -
> -	/* PKDMA mapped channel */
> -	int mapped_channel_id;
> -	/* PKTDMA default tflow or rflow for mapped channel */
> -	int default_flow_id;
> -
> -	enum dma_transfer_direction dir;
> -};
> -
> -struct udma_chan {
> -	struct virt_dma_chan vc;
> -	struct dma_slave_config	cfg;
> -	struct udma_dev *ud;
> -	struct device *dma_dev;
> -	struct udma_desc *desc;
> -	struct udma_desc *terminated_desc;
> -	struct udma_static_tr static_tr;
> -	char *name;
> -
> -	struct udma_bchan *bchan;
> -	struct udma_tchan *tchan;
> -	struct udma_rchan *rchan;
> -	struct udma_rflow *rflow;
> -
> -	bool psil_paired;
> -
> -	int irq_num_ring;
> -	int irq_num_udma;
> -
> -	bool cyclic;
> -	bool paused;
> -
> -	enum udma_chan_state state;
> -	struct completion teardown_completed;
> -
> -	struct udma_tx_drain tx_drain;
> -
> -	/* Channel configuration parameters */
> -	struct udma_chan_config config;
> -	/* Channel configuration parameters (backup) */
> -	struct udma_chan_config backup_config;
> -
> -	/* dmapool for packet mode descriptors */
> -	bool use_dma_pool;
> -	struct dma_pool *hdesc_pool;
> -
> -	u32 id;
> -};
> -
>  static inline struct udma_dev *to_udma_dev(struct dma_device *d)
>  {
>  	return container_of(d, struct udma_dev, ddev);
> @@ -4073,13 +3823,6 @@ static struct platform_driver udma_driver;
>  static struct platform_driver bcdma_driver;
>  static struct platform_driver pktdma_driver;
>
> -struct udma_filter_param {
> -	int remote_thread_id;
> -	u32 atype;
> -	u32 asel;
> -	u32 tr_trigger_type;
> -};
> -
>  static bool udma_dma_filter_fn(struct dma_chan *chan, void *param)
>  {
>  	struct udma_chan_config *ucc;
> diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
> index 750720cd06911..11d08adb0d69f 100644
> --- a/drivers/dma/ti/k3-udma.h
> +++ b/drivers/dma/ti/k3-udma.h
> @@ -6,7 +6,16 @@
>  #ifndef K3_UDMA_H_
>  #define K3_UDMA_H_
>
> +#include <linux/dmaengine.h>
>  #include <linux/soc/ti/ti_sci_protocol.h>
> +#include <linux/dma/ti-cppi5.h>
> +#include <linux/completion.h>
> +#include <linux/workqueue.h>
> +#include <linux/spinlock.h>
> +#include <linux/ktime.h>
> +
> +#include "../virt-dma.h"
> +#include "k3-psil-priv.h"
>
>  /* Global registers */
>  #define UDMA_REV_REG			0x0
> @@ -164,6 +173,7 @@ struct udma_dev;
>  struct udma_tchan;
>  struct udma_rchan;
>  struct udma_rflow;
> +struct udma_chan;
>
>  enum udma_rm_range {
>  	RM_RANGE_BCHAN = 0,
> @@ -186,6 +196,261 @@ struct udma_tisci_rm {
>  	struct ti_sci_resource *rm_ranges[RM_RANGE_LAST];
>  };
>
> +struct udma_static_tr {
> +	u8 elsize; /* RPSTR0 */
> +	u16 elcnt; /* RPSTR0 */
> +	u16 bstcnt; /* RPSTR1 */
> +};
> +
> +enum k3_dma_type {
> +	DMA_TYPE_UDMA = 0,
> +	DMA_TYPE_BCDMA,
> +	DMA_TYPE_PKTDMA,
> +};
> +
> +enum udma_mmr {
> +	MMR_GCFG = 0,
> +	MMR_BCHANRT,
> +	MMR_RCHANRT,
> +	MMR_TCHANRT,
> +	MMR_LAST,
> +};
> +
> +struct udma_filter_param {
> +	int remote_thread_id;
> +	u32 atype;
> +	u32 asel;
> +	u32 tr_trigger_type;
> +};
> +
> +struct udma_tchan {
> +	void __iomem *reg_rt;
> +
> +	int id;
> +	struct k3_ring *t_ring; /* Transmit ring */
> +	struct k3_ring *tc_ring; /* Transmit Completion ring */
> +	int tflow_id; /* applicable only for PKTDMA */
> +
> +};
> +
> +#define udma_bchan udma_tchan
> +
> +struct udma_rflow {
> +	int id;
> +	struct k3_ring *fd_ring; /* Free Descriptor ring */
> +	struct k3_ring *r_ring; /* Receive ring */
> +};
> +
> +struct udma_rchan {
> +	void __iomem *reg_rt;
> +
> +	int id;
> +};
> +
> +struct udma_oes_offsets {
> +	/* K3 UDMA Output Event Offset */
> +	u32 udma_rchan;
> +
> +	/* BCDMA Output Event Offsets */
> +	u32 bcdma_bchan_data;
> +	u32 bcdma_bchan_ring;
> +	u32 bcdma_tchan_data;
> +	u32 bcdma_tchan_ring;
> +	u32 bcdma_rchan_data;
> +	u32 bcdma_rchan_ring;
> +
> +	/* PKTDMA Output Event Offsets */
> +	u32 pktdma_tchan_flow;
> +	u32 pktdma_rchan_flow;
> +};
> +
> +struct udma_match_data {
> +	enum k3_dma_type type;
> +	u32 psil_base;
> +	bool enable_memcpy_support;
> +	u32 flags;
> +	u32 statictr_z_mask;
> +	u8 burst_size[3];
> +	struct udma_soc_data *soc_data;
> +};
> +
> +struct udma_soc_data {
> +	struct udma_oes_offsets oes;
> +	u32 bcdma_trigger_event_offset;
> +};
> +
> +struct udma_hwdesc {
> +	size_t cppi5_desc_size;
> +	void *cppi5_desc_vaddr;
> +	dma_addr_t cppi5_desc_paddr;
> +
> +	/* TR descriptor internal pointers */
> +	void *tr_req_base;
> +	struct cppi5_tr_resp_t *tr_resp_base;
> +};
> +
> +struct udma_rx_flush {
> +	struct udma_hwdesc hwdescs[2];
> +
> +	size_t buffer_size;
> +	void *buffer_vaddr;
> +	dma_addr_t buffer_paddr;
> +};
> +
> +struct udma_tpl {
> +	u8 levels;
> +	u32 start_idx[3];
> +};
> +
> +struct udma_dev {
> +	struct dma_device ddev;
> +	struct device *dev;
> +	void __iomem *mmrs[MMR_LAST];
> +	const struct udma_match_data *match_data;
> +	const struct udma_soc_data *soc_data;
> +
> +	struct udma_tpl bchan_tpl;
> +	struct udma_tpl tchan_tpl;
> +	struct udma_tpl rchan_tpl;
> +
> +	size_t desc_align; /* alignment to use for descriptors */
> +
> +	struct udma_tisci_rm tisci_rm;
> +
> +	struct k3_ringacc *ringacc;
> +
> +	struct work_struct purge_work;
> +	struct list_head desc_to_purge;
> +	spinlock_t lock;
> +
> +	struct udma_rx_flush rx_flush;
> +
> +	int bchan_cnt;
> +	int tchan_cnt;
> +	int echan_cnt;
> +	int rchan_cnt;
> +	int rflow_cnt;
> +	int tflow_cnt;
> +	unsigned long *bchan_map;
> +	unsigned long *tchan_map;
> +	unsigned long *rchan_map;
> +	unsigned long *rflow_gp_map;
> +	unsigned long *rflow_gp_map_allocated;
> +	unsigned long *rflow_in_use;
> +	unsigned long *tflow_map;
> +
> +	struct udma_bchan *bchans;
> +	struct udma_tchan *tchans;
> +	struct udma_rchan *rchans;
> +	struct udma_rflow *rflows;
> +
> +	struct udma_chan *channels;
> +	u32 psil_base;
> +	u32 atype;
> +	u32 asel;
> +};
> +
> +struct udma_desc {
> +	struct virt_dma_desc vd;
> +
> +	bool terminated;
> +
> +	enum dma_transfer_direction dir;
> +
> +	struct udma_static_tr static_tr;
> +	u32 residue;
> +
> +	unsigned int sglen;
> +	unsigned int desc_idx; /* Only used for cyclic in packet mode */
> +	unsigned int tr_idx;
> +
> +	u32 metadata_size;
> +	void *metadata; /* pointer to provided metadata buffer (EPIP, PSdata) */
> +
> +	unsigned int hwdesc_count;
> +	struct udma_hwdesc hwdesc[];
> +};
> +
> +enum udma_chan_state {
> +	UDMA_CHAN_IS_IDLE = 0, /* not active, no teardown is in progress */
> +	UDMA_CHAN_IS_ACTIVE, /* Normal operation */
> +	UDMA_CHAN_IS_TERMINATING, /* channel is being terminated */
> +};
> +
> +struct udma_tx_drain {
> +	struct delayed_work work;
> +	ktime_t tstamp;
> +	u32 residue;
> +};
> +
> +struct udma_chan_config {
> +	bool pkt_mode; /* TR or packet */
> +	bool needs_epib; /* EPIB is needed for the communication or not */
> +	u32 psd_size; /* size of Protocol Specific Data */
> +	u32 metadata_size; /* (needs_epib ? 16:0) + psd_size */
> +	u32 hdesc_size; /* Size of a packet descriptor in packet mode */
> +	bool notdpkt; /* Suppress sending TDC packet */
> +	int remote_thread_id;
> +	u32 atype;
> +	u32 asel;
> +	u32 src_thread;
> +	u32 dst_thread;
> +	enum psil_endpoint_type ep_type;
> +	bool enable_acc32;
> +	bool enable_burst;
> +	enum udma_tp_level channel_tpl; /* Channel Throughput Level */
> +
> +	u32 tr_trigger_type;
> +	unsigned long tx_flags;
> +
> +	/* PKDMA mapped channel */
> +	int mapped_channel_id;
> +	/* PKTDMA default tflow or rflow for mapped channel */
> +	int default_flow_id;
> +
> +	enum dma_transfer_direction dir;
> +};
> +
> +struct udma_chan {
> +	struct virt_dma_chan vc;
> +	struct dma_slave_config	cfg;
> +	struct udma_dev *ud;
> +	struct device *dma_dev;
> +	struct udma_desc *desc;
> +	struct udma_desc *terminated_desc;
> +	struct udma_static_tr static_tr;
> +	char *name;
> +
> +	struct udma_bchan *bchan;
> +	struct udma_tchan *tchan;
> +	struct udma_rchan *rchan;
> +	struct udma_rflow *rflow;
> +
> +	bool psil_paired;
> +
> +	int irq_num_ring;
> +	int irq_num_udma;
> +
> +	bool cyclic;
> +	bool paused;
> +
> +	enum udma_chan_state state;
> +	struct completion teardown_completed;
> +
> +	struct udma_tx_drain tx_drain;
> +
> +	/* Channel configuration parameters */
> +	struct udma_chan_config config;
> +	/* Channel configuration parameters (backup) */
> +	struct udma_chan_config backup_config;
> +
> +	/* dmapool for packet mode descriptors */
> +	bool use_dma_pool;
> +	struct dma_pool *hdesc_pool;
> +
> +	u32 id;
> +};
> +
>  /* Direct access to UDMA low lever resources for the glue layer */
>  int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
>  int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
> --
> 2.54.0
>
