Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013062.outbound.protection.outlook.com [52.101.72.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E1C370D7C;
	Thu, 23 Jul 2026 19:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784836712; cv=fail; b=OeLv+j4kpCFXLsBSbpwng/4SO+7zxTPyZe+9PdIMNR8xv82GrCzBIy76dTSxAmrlXi/zSGVb03VeDvZxYXiBuLHuhfXcQBv8jum1FGSYykLrUOgZgHttidtW8YY5KMEgHO3hlE63mQa2N9GiUGUXjyW3o4WrgCRCjBER08FiiEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784836712; c=relaxed/simple;
	bh=LTB9p1Y7yt1RBiHSpBzZAL3Htf0EA05KNQWpWnhj+xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XACcW0cBYfjy+Vws8WQfKYAQLTfWp+PrukkFDOXZhtlSXcMPnCLF+PVIwceqR5/qsih8/swWmRJi8DWwYSw2Fv54syxXe7LDHlTQpslT6VioVwRfeDr2XWQIO7JbFNeP7Yfx9AC/fkBc1YaoE6Vk7uKCgCesuJzsx9x4GHdBgqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=C1z03C5T; arc=fail smtp.client-ip=52.101.72.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="C1z03C5T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0XwkMkCDRdK0EBT+Th4xMiYESwZJrBoLZsRMKdG9p2Xo+FtM2AU4TZno7UxyXIreRgj4pyAfaDAMbhmGOr/fg62TrFixo3g9hif1IisOqfMVssJAS0YVhw9wj2q5rPmZHesMmPCTvLFBk0HrEm50VEi4grL6CAj5zaJXoGD/SqDwdVKdW36U0GS1rsna4WWcUX1VKITJ4hUrJeapsxipFAMgYlQ75txSf0IvU6P7SE0FnRIajG1iXnNNL4jREovHe54PXbU7DHhOuUO6Tt8kcV7kLuQLVBgIaZYwbNJEVYTkKBY78YQMT9OhCAlvW/bLSsMzCwghe9mZTrtAAChUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZyBlNhJIc6KplUuDJBfphWgcYNKRNdzZNWtBew+PyB0=;
 b=JqLVlPKON7x/ui7yCmOYE0uw6MOuoDRuukKS9JUdNMz+KSWIo7ZGG0MCcVnBL1KqfKTZeFCHE3eG7jcIPq7KKO2mt+qxEApWnudS0BL2OBv7F/w5GqTRW0P54IA4jZEeXIIst1KmIIoIP3zEKT0AuFoKRxC+i6G0Di+qKbBlCu/g1iNQrMKSNXjy5eKpEswr1ob+9Ml/ugZCK4inwoSDEYTPxpCGqZLT9j0QDVoxhJWAZbVX8cZS5o6aOEar/FtPvifeH8Wm/Yu+9+CIXkmY0nF91wWis1Z7VoYTGpe+a1NwBkj+bJbNXhqMy8kEcOz8x5htNqtVkTxMLoh7DqFySA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZyBlNhJIc6KplUuDJBfphWgcYNKRNdzZNWtBew+PyB0=;
 b=C1z03C5TZRReXJeW8GH5YI8mGnihBGuOjYF8BVeeg4yHUdxqBCQGDwZo5BNnvOHyi4NMtCZjzK2LVScS84CRd/Ca7bHOit9OcbYkgWReUk2Ijygd2bIaipf2CQW4ZpcorUj0dGDn5/YimjwSFBOCDBKXvWVofMmk6YdjNyC+KVWj6FZi/KeWQ71y66ZBwDSg5o6lOKdiHfWQ0z9p5081Mb5eaZm2hnbwH3DKCk1UWjMsh5WQYVxiZsn3smlm+b+qYO7SwJWByr+CslsaIurXwsGYB448xBvL9h2iwqm2Gbrr1yW0s17MDARBWJ/RdjLHw0FbCsGsqmmuoraPBBpUEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8023.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 19:58:26 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 19:58:26 +0000
Date: Thu, 23 Jul 2026 14:58:16 -0500
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
Subject: Re: [PATCH v2 05/19] dmaengine: dw-edma: Add LL interrupt placement
 policy
Message-ID: <amJyWDdq7MBkoudf@SMW015318>
References: <20260723084150.521366-1-den@valinux.co.jp>
 <20260723084150.521366-6-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723084150.521366-6-den@valinux.co.jp>
X-ClientProxiedBy: SN7P222CA0030.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8023:EE_
X-MS-Office365-Filtering-Correlation-Id: be18f3be-503c-4036-05cc-08dee8f4c217
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|376014|1800799024|7416014|11063799006|56012099006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qvyim20ETbcMxo6xWjfSXK59CgO9bgnE/ZKDbXsvDp/yCY2XonIewCfUOvggODRad2eFvOHRZ7KnnW/7kH+45zXfh+7vFhgr9tIQx6RYxdpdgDj2bf1SAPMfv3XOQcSdMDtf8kLkuESY6fjWEzTGCH0bJP5m2tZK6dK4fYlMod8U6pia9l7SfWfVRshfZN6Surt07TdAhIXKprl1fbOy+q6/fgj1Ecoi86DU152pvJ03ZGVIoCv6UDLQIBgfp/4gJmP6q38z4ooUz7Au5F96v69m5S21B2H4kh7SfpK59HqoXIRoiIBsEgwuroCZcTldJEv/YGGWzb8S+18wBzbFbXKI3gusCwVmRrUq52tD7odyrwVH46jlZRn6eC4GA5UDh9bmpoaPrGP2UQw9LxnZ8b98zXdKSiYQLIXj/2Qx/rmccX5uJaq0aSwe9GSNdmvnu5ynFQ7hWtQ5pN1E8/yYUPKs/y08i20bl65aoN7j+C43WO3fyT0veZtYWvWUjBUtx6esQzfb/1YOoZsPR6DJVUTiBVvyVrRM6lAe+BqZExNoxvbY7Qv744AZq7WkgN7aNbx2xnPVXO47Sot9Px0gHj+hMOdqpcpKSD4g8ao5KJWQLccuhEz2uov0UmJ+G0jmjfPMhJUkUj16kU8pCmiK4UBb4RsqI3i1yMZcF4FEWYo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(376014)(1800799024)(7416014)(11063799006)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AgFV77uybtasBb5XG1cKGGY7STdOu8aUkVn6pHJhyDV6aOp8CKaKKcmfxNRa?=
 =?us-ascii?Q?w0jaRPHSGPZv3yLHugOu2q3jXDG2MgxpfIZoSoOUiCC5ZTlEJadRqIKjP7iw?=
 =?us-ascii?Q?X12JqLeTnsHMHP7+xc9vNFXacwX0RxUtTXw2eUslTQxOZV6Lmm6G43fJrCAk?=
 =?us-ascii?Q?4gZbEbPWy0FDrEpzSzdnDt5T+itlpYYsBzx4QksBNDmmLn4HN1GP4yzHX7Rw?=
 =?us-ascii?Q?RJrM3sPFZwecSo9AKERi5PQWWnCd0NmBrgNI+9OkFLO3jbZIkso6yILNMUfh?=
 =?us-ascii?Q?kqo0tZwCMcEEPl6sX5B/Ey3pJxFs9+oeVRb3vFcds141D6ksCnZpe92Fqt70?=
 =?us-ascii?Q?DIPRQIShXHVwhDZ2otGmwcIIOt2YG3Kyy4kdAdr/clWdCH1dItscvZjw5nmi?=
 =?us-ascii?Q?wbJXuUL4LRtCNkJxxTgORJKbW8FIJfc9R02895IIG3PPEFLcVNA+5XhpRsoA?=
 =?us-ascii?Q?Cg8OzIyrkEQXclXWJKs7nN3x/PWw3JPvUu5CZhHp/damS3nbQsVzep5H3yAj?=
 =?us-ascii?Q?9i9J/clW+mKbY98xZLWx6TIGKbQZqMsBwfIQkBrHN7g9D6vTphgzwMtZJJHL?=
 =?us-ascii?Q?p6hevS7Ivo3GsxIP1ZPWEl6+SZ/qwCldO8/d7sIps3/Ziif7J+2AezgrsQgg?=
 =?us-ascii?Q?O9IrRKrDk+3w/hHAsvLF/V9DNTDmf2CpbD4TfCVmw9HokzR3BQRuGwo4M5lZ?=
 =?us-ascii?Q?xpg1GJVJw4gemuXDhUkZ5tIIaByi70BCPZkiGOjJsWDE44d7yvu0RR4PomEv?=
 =?us-ascii?Q?yuj6+v/KY6bOSwwQeDpQ7QdTz0NGPkbfbww3B9E7UwChU+NxhzztwBOoaBbQ?=
 =?us-ascii?Q?p0z++8EA3VZFnoTJMAX51C7vmZAeXsxPyuiOHPNXPA4p6qMkOs++vm+gRxaI?=
 =?us-ascii?Q?YmpDPkhAXGddrzV1kNvUlzEV3v/qg8xnx1oIyVl8N9ObhuEuqQzf3pEJ4s4M?=
 =?us-ascii?Q?zDTaT3XqQHpFM3XH5Jvn3aGgHuv32ap6tF+WgOgA3SwCa7mE8/5eUKDgXafF?=
 =?us-ascii?Q?KEvbJB7SH9AUvd6Opw6Z1ymfVJPS0/KrRZlYScEXQ/YNdXrduP5ripgcUz2H?=
 =?us-ascii?Q?LS5NdQ+XkTvM31WWZZH7Cyij6MaBONq7jfqgCWG+SetjQ2yk6cBNgonkVt4W?=
 =?us-ascii?Q?T4p818ra+miztbYFJZ/0kzxfU0IqG26BaMSCNaNox9WVxdV2A/gVYH0D2ncy?=
 =?us-ascii?Q?V8zssvCZuDknE3CfmFhKj+dKh4VZQFxAPPIVFIwuz9RaTpG8fKNP/zaUPpmq?=
 =?us-ascii?Q?6P36e2775wxNi9wEV7zusZ+f4Tk8LeM+M2/8NcdwnhCq/rVpytMjXCPHetFI?=
 =?us-ascii?Q?KJzRTh14s/NhPnxQ3YSW9yhBpy2aUlediuVUQTpDupbkKxk7EfWjLWW5Tpt2?=
 =?us-ascii?Q?MkiUGrBwf1gzvR/4ntFdERsWer75vcenB4Ix4EL4MVPYZc8Ztc3kjzP9INHx?=
 =?us-ascii?Q?oNoO/9BSOzV3s7TT7BHon5pc33myOMeIX3mjz5JBSbV++shSyrXQ8gqhMxyr?=
 =?us-ascii?Q?Vtiq0j3TMm4ltKCuhCzVBKvAzx8+t/UxaACnAjxeU7X9uxvnqTTI+Z3sXbhe?=
 =?us-ascii?Q?k0bh2Nf8dRvOtxpgRLfoEFY0zqbyZU3xUEKh4EAPW2IkcI8iMQRba7F6kDXU?=
 =?us-ascii?Q?ND9UDfsayZBAGiPzC1MfYzswas4Cw3Uwf6fzg28UASh+pRgsrLq8ymdefuPK?=
 =?us-ascii?Q?+ejFKlF52jIxzXKepAKu9oDfCm/RiDpv9EL/beZDcyi+C524+eazarEY0HZ8?=
 =?us-ascii?Q?r352QOhAwvz88zk08Q3cOS3bqICBeWlXpAbbUbTamYGfoLKiUEyd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be18f3be-503c-4036-05cc-08dee8f4c217
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 19:58:26.2130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZ0dg96Zt3KVx7ymIwo1MHj7AJ+B0iSDxsni37Dr9jEZJz3efC4/pm48CQ84Q0zDLx+aa/23s1w4bod0YgL1z8TlQWKT6V4Ij8RHOXt2aBQPvo9tmOVcxUy5EyjYEfrt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8023

On Thu, Jul 23, 2026 at 05:41:36PM +0900, Koichiro Den wrote:
> Move linked-list interrupt placement behind a core callback so eDMA and
> HDMA can use different policies.
>
> Keep the eDMA behavior. For HDMA, place watermarks at descriptor ends,
> before link entries, and every four entries when a descriptor exceeds the
> usable ring capacity or another issued descriptor follows. A later patch
> handles these watermarks as progress events.
>
> Four entries is an empirically chosen coalescing interval.
>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
> Changes in v2:
>   - Fix the zero-based interval so the first watermark is on the fourth
>     entry, not the fifth.
>   - Revise the commit message and source comments.
>
>  drivers/dma/dw-edma/dw-edma-core.c    |  8 +++++++-
>  drivers/dma/dw-edma/dw-edma-core.h    |  2 ++
>  drivers/dma/dw-edma/dw-edma-v0-core.c | 10 ++++++++++
>  drivers/dma/dw-edma/dw-hdma-v0-core.c | 28 +++++++++++++++++++++++++++
>  4 files changed, 47 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index a9f25a65294e..78d1bb6302fb 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -98,6 +98,12 @@ static u32 dw_edma_core_get_free_num(struct dw_edma_chan *chan)
>  		chan->ll_max;
>  }
>
> +static bool dw_edma_core_enable_ll_irq(struct dw_edma_desc *desc, u32 i,
> +				       u32 free)
> +{
> +	return desc->chan->dw->core->ll_irq(desc, i, free);
> +}
> +
>  static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
>  {
>  	struct dw_edma_chan *chan = desc->chan;
> @@ -120,7 +126,7 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
>
>  		dw_edma_core_ll_data(chan, &desc->burst[i],
>  				     chan->ll_head, chan->cb,
> -				     i == desc->nburst - 1 || free == 1);
> +				     dw_edma_core_enable_ll_irq(desc, i, free));
>
>  		chan->ll_head++;
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
> index f2c2d5af1fff..8ed37e8a12cb 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.h
> +++ b/drivers/dma/dw-edma/dw-edma-core.h
> @@ -162,6 +162,8 @@ struct dw_edma_core_ops {
>  	void (*ll_link)(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr);
>  	void (*ll_clear)(struct dw_edma_chan *chan, u32 idx);
>  	int (*ll_cur_idx)(struct dw_edma_chan *chan);
> +	/* Called with chan->vc.lock held. */
> +	bool (*ll_irq)(struct dw_edma_desc *desc, u32 i, u32 free);
>  	void (*ch_doorbell)(struct dw_edma_chan *chan);
>  	void (*ch_enable)(struct dw_edma_chan *chan);
>  	void (*ch_config)(struct dw_edma_chan *chan);
> diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
> index c31fff095b4f..62141aa32e50 100644
> --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
> @@ -649,6 +649,15 @@ static int dw_edma_v0_core_ll_cur_idx(struct dw_edma_chan *chan)
>  	return (val - base) / EDMA_LL_SZ;
>  }
>
> +static bool dw_edma_v0_core_ll_irq(struct dw_edma_desc *desc, u32 i, u32 free)
> +{
> +	/*
> +	 * eDMA reports LL interrupts through DONE. Keep them at
> +	 * descriptor ends, plus the last free slot to refill the ring.
> +	 */
> +	return i == desc->nburst - 1 || free == 1;
> +}
> +
>  /* eDMA debugfs callbacks */
>  static void dw_edma_v0_core_debugfs_on(struct dw_edma *dw)
>  {
> @@ -685,6 +694,7 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
>  	.ll_link = dw_edma_v0_core_ll_link,
>  	.ll_clear = dw_edma_v0_core_ll_clear,
>  	.ll_cur_idx = dw_edma_v0_core_ll_cur_idx,
> +	.ll_irq = dw_edma_v0_core_ll_irq,
>  	.ch_doorbell = dw_edma_v0_core_ch_doorbell,
>  	.ch_enable = dw_edma_v0_core_ch_enable,
>  	.ch_config = dw_edma_v0_core_ch_config,
> diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> index b2d35f0b7b6d..fb651a83f0f3 100644
> --- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> @@ -13,6 +13,9 @@
>  #include "dw-hdma-v0-regs.h"
>  #include "dw-hdma-v0-debugfs.h"
>
> +/* Empirically chosen watermark interval. */
> +#define HDMA_V0_WATERMARK_INTERVAL			4
> +
>  enum dw_hdma_control {
>  	DW_HDMA_V0_CB					= BIT(0),
>  	DW_HDMA_V0_TCB					= BIT(1),
> @@ -417,6 +420,30 @@ static int dw_hdma_v0_core_ll_cur_idx(struct dw_edma_chan *chan)
>  	return (val - base) / EDMA_LL_SZ;
>  }
>
> +static bool dw_hdma_v0_core_ll_irq(struct dw_edma_desc *desc, u32 i, u32 free)
> +{
> +	struct dw_edma_chan *chan = desc->chan;
> +	bool needs_progress;
> +
> +	/*
> +	 * Always place a watermark at a descriptor end and before the link
> +	 * element. The first reports descriptor progress; the second provides
> +	 * one progress point per ring lap.
> +	 */
> +	if (i == desc->nburst - 1 || chan->ll_head == chan->ll_max - 1)
> +		return true;
> +
> +	/*
> +	 * Use periodic watermarks when a descriptor exceeds the usable ring or
> +	 * when more issued work follows it.
> +	 */
> +	needs_progress = desc->nburst > chan->ll_max - 1 ||
> +			 !list_is_last(&desc->vd.node, &chan->vc.desc_issued);
> +
> +	return needs_progress &&
> +	       (chan->ll_head + 1) % HDMA_V0_WATERMARK_INTERVAL == 0;

This is not good layer design. edma/hdma supposed just do action to operate
register, less software logic.

Can we move this code to core layer?  introduce an 'interval' for difference
backend.

eDMA: interval is number description.
hDMA: interval is HDMA_V0_WATERMARK_INTERVAL

So core layer can use unified logic to handle for both eDMA and hDMA?

Frank

> +}
> +
>  /* HDMA debugfs callbacks */
>  static void dw_hdma_v0_core_debugfs_on(struct dw_edma *dw)
>  {
> @@ -441,6 +468,7 @@ static const struct dw_edma_core_ops dw_hdma_v0_core = {
>  	.ll_link = dw_hdma_v0_core_ll_link,
>  	.ll_clear = dw_hdma_v0_core_ll_clear,
>  	.ll_cur_idx = dw_hdma_v0_core_ll_cur_idx,
> +	.ll_irq = dw_hdma_v0_core_ll_irq,
>  	.ch_doorbell = dw_hdma_v0_core_ch_doorbell,
>  	.ch_enable = dw_hdma_v0_core_ch_enable,
>  	.ch_config = dw_hdma_v0_core_ch_config,
> --
> 2.51.0
>
