Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012065.outbound.protection.outlook.com [52.101.66.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD135383F6;
	Thu, 17 Sep 2026 16:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663186; cv=fail; b=GrUZO5EGOCHdNX/RqNxrpfacfJULY4R2meF9tbtYtB/RwVomGVRn/djdseUweweNfhYyWPN88R0gQDXEOn/CnVc/Wkur3I7WWoSzfGpRRV5Hhymt3tuG7VPUpqDy8wezwe/ikgBJ/YHo3gMrrY/Nr57fJ7KXB/tlJUKQ7+aeMCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663186; c=relaxed/simple;
	bh=jIofWphpk8mB5DQONa2lyjLuEmC4BcG3RtV41qpvufI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rDS7xT8a1uS3zEwQ3rLikO67HEP9k8XCqlXcUeYW/8IMJU1pWjH4OuV/ixZWt1O5nPW5ys/pKp3eDJHkbO9IOgp0isVKjDapIUg4NfIKAC1fNFMS1bvvK3/I2EMl+4ONpEWFAXP+72dDJISn5L7zZ3wGk+RrtJgNoaLq8aUZut8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XaqzHoJ0; arc=fail smtp.client-ip=52.101.66.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XaqzHoJ0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HGLh8h08Z+/Ny5BqSW6Iw6gEfDNAO+jwmR4qkTFckY+xFTFkg96XrjHwPtiubQeQn6egk/7FsioiqRXlS96WzimawBvarHxptFWFcDuFkOXtqAc0V5qU+2eo8fvulc1s/5/hf5vvsPCusRxrEbRncXc/dD62LkD6EQMfMpCKGWvhZmokvU7EPbjPrOIXCtj3Qc4REo0HriivfertID2thIrSWxVmlJyfGKnOADCnk732dsKywviuao8eAnls+V3vF/DinmM6IR9UTN9Q+Ed/Cv/ZnRavrs8JwgJu/xo/daWuzsJ9dzI7mjI4SoQXTpsV+8sYyPxfU4w2jZU2ACxcyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SDbt93CcMCq1Dd+RgoBzDCu5VcwWbyepruWStA5hv2M=;
 b=jGhYArnE0pPfsbAua9YHO+gPwluHeyKdlo2rUfV+6xQgFU45YjbOwJjaAHHdlCefvX+h3iXndIltPy2hYBxe52UkNDUG6WJk/w+W5NlcXyynBd/kzI006cTraoskHQEIsDgHkuQi0Hy/I8VmZU9NyMjgJNhGv+HNLxSdLEjVl/Het8LEilCQek7ZvB2f+0hfi7awppWJBFlmx+NAqxF9Mz1hYGlBjYz/TqS88FddQzO66yVi/8INvdRUm3fs+kofauUBW0S5qyYuH1C/RqH9hgBAXdb0Lae9SLb+tb1eKOY/YZxXoj+u7wz+8cqj19QiVhzp8OHW6NyluRgWPKHNLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SDbt93CcMCq1Dd+RgoBzDCu5VcwWbyepruWStA5hv2M=;
 b=XaqzHoJ0uaac+oZ9ZovXrSGNHsdIn+E0PG/icIJ6x+t6QtY1yHTsHeP+lUTwSMmJLSCKAXUu6WKndXMwibt+45xL9vtGg/rHZprEj27yB/F2oUdQC+mHcXe1hEO51GbIU+BgUXIxwMPCuqQTK1Jh6lOJ/URGmHluLEwpxNaUNvoHRzR9LM37IEltNYa2mjUj4Ow1Uc931Nfwpm2aPdJbZ3257pfXQtGE2b9rr7JUcovJ0QAm5FosTEEJN03AS1DtzrQIttuhKEiiyEAobSSRDcfmGetSngcR/5Dw8qbOuweqe496P2hrpqxWVhS7wL2SssB7EJbyW87xF6qSkoK32A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB9283.eurprd04.prod.outlook.com (2603:10a6:10:36d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 16:39:37 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Thu, 17 Sep 2026
 16:39:37 +0000
Date: Thu, 17 Sep 2026 11:39:28 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Koichiro Den <den@valinux.co.jp>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH 2/3] dmaengine: rcar-dmac: Add missing
 dma_descriptor_unmap()
Message-ID: <aqwXwOiPgRDUQfp_@SMW015318>
References: <20260917071208.36888-1-wsa+renesas@sang-engineering.com>
 <20260917071208.36888-3-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917071208.36888-3-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: PH7P220CA0122.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB9283:EE_
X-MS-Office365-Filtering-Correlation-Id: f0add7c9-2f14-4dc3-c4a6-08df14da42f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|19092799006|23010399003|18002099003|22082099003|4143699003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	4y85a5VORTWsLjc9WZaRMhIIXVABKPjOoGf4qkc/mi2fKm0JtwC5TvwsrJjBtyzYuVT1O6LVWm9FJ4aGqi3Va6xx1hu8S6KjMdsHZNsFwPE368dhkztRTEF9acyZIOYkSYqjVwwk/u3IDGWtz/ZcQ1Qi/4AtAmUA155Z2G6/x2hL9cPB+ufaYnbF85ARFRlGuVIFF6k2kPyOYChV6KrbmZLSWyg7IFtUuwr/iMF9pSNu3mo6J+uUqlUFEVG6moW3sEbIpzfNUpwvNYcXl1TdNcHfoEiN2AuXLxAOr0Hp8ojf1DZVeSXI6Tl9f04PqQgLgcJlaqUv/Jv2QKKrlSCM7uKBo+yzfqUNatr1ZZr+inurFP0F9yZK6hKZ4Rr4TEMUKiYq1Iy1SoFTUzc8lEhO/R0IfKx4xm1MxMXna9oLKjh77QWIJLXlcUmO/zjqlqbPoxzl1UNFVMaMfl6iTlaBOwOmJeXxRdkmENt//JptzUGxpi2V6Ri4oHrLtZ4UUuTMoIwC8kwZYkhEvAsrNDakxjdwBjGmuWsj+8FLJjTpOn2frCM+2pU0cZ3TfmwRul5sJtkuuMSamni9WEZd325mHrCRqfP7t3d8wUszJlz/mE0I9CjwGtTCj5koAJOV1Q6y3It73ijQL2P5n9Orw9TbpiqgjFuLEOxsAQ74IBFA56k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(23010399003)(18002099003)(22082099003)(4143699003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lDmy+VokRsFtWH7q5figJypqW3faq3x0vysKhmKTfVet4aK13yc3BRflp/7S?=
 =?us-ascii?Q?GFTZe4WL2SfKB9Q8olj1eOanuoLdvj/A4UIC/fj1N4ebpSEMzk93A81E+dSb?=
 =?us-ascii?Q?6F7KhVECMfZNHNIbZk5RieH+3tMb2CZ8mQx5J3IA80n2arf4G2I6JvjGF1Bx?=
 =?us-ascii?Q?25jmXByAzilp3EWOCyN9Cj4GsbFG175x946ViOVYYemmyIz2LGmahq4a/dKd?=
 =?us-ascii?Q?D2swiWeDH69ea0/sBCEZi12K+1P59/OyfJB5mq+Tt4b4SXnVrp+S0XQ0e97y?=
 =?us-ascii?Q?nKLjEre73RB2AUXUGNdDwMx0OG4iygTN69U8z7JAWDEdT7pp0jLg9FXfJzNe?=
 =?us-ascii?Q?grd6/z+vV0yUooUHvzqm8QW2QyDpmZuXTclMWAbMGQpwVIsJpNKo4CqYdMTY?=
 =?us-ascii?Q?Ulvfc/Nhr41oOcIwat3WCHUnZ3O3fo+TSiCDWQ+hJqVC20d5kQqVjTEJ6Mnl?=
 =?us-ascii?Q?bmWjJvOmIdAGlsIWlGmmcQuExyaZwnHjGxeZjaAbXQU/eZyYtwexcBNsWglm?=
 =?us-ascii?Q?2OliRP/Ydy/2Ma9/wvXUsFQeyBVRAw1sibWGuWfWGrHEbiKR99mcZv55eMf0?=
 =?us-ascii?Q?6GX1OIfnVfkl8Nt3G3IQvJGnnX6LoT8uo4NnYbZBueGr9iba0bDXG3zE/nXJ?=
 =?us-ascii?Q?V2/4bpZtzpZSKieGdPNDtRluFVZF92x5BQ19qQoN9n2MswqsZB5dODWvAhvR?=
 =?us-ascii?Q?cC7f2Pi/sA17VrEWXG+G8ez9CcI/PXdbqSqdqFgdMQTHI9oi3DYeL3wytJig?=
 =?us-ascii?Q?hL2uD3wwqciqdgGjMXzUcQEO5G560rbvPm1dc+dk9QZ7rn8Sc4xA5EN9IRjO?=
 =?us-ascii?Q?z3QczQvokPln8YO9fre5AKDtXlwD8UstZnIqv0FrUv1u28uClbK/NVQHDy3U?=
 =?us-ascii?Q?HobaW4zdyg6LTgOlVwFvsAsWul5dk1vqzd/kiAQE/qLusyd6b6Fl+kvN4FoU?=
 =?us-ascii?Q?AJJajq2p08EDL4fTCUUDpDdrzJWJtVL/69vJ9e3nHISeY8NRbqcGaCCX1Wz+?=
 =?us-ascii?Q?xAf9QCduEymi/zKIBuM8ygB9WzFbD4cSg4aX/UbWfIoPZCEMQob2eZMGvLlA?=
 =?us-ascii?Q?gqxNaVJbgU09BYV8spPWb3U8toxrotB0GQ2g3XuYXNGcGhMWndeYWoSwcrLe?=
 =?us-ascii?Q?+qVM5/hE4s7ORENdecC/y0+QpnyLWsDuKQNUTQrcUABOdSFad8CQkND7woF+?=
 =?us-ascii?Q?N0dxdVqD5jljajPKCqocx2bmexoyucFhgGcmLRB/hS+Vy5I97WFc0cdyjBkM?=
 =?us-ascii?Q?4l3VjbRjH9/1D1tP+AYySYQgo64n0T0Lvd6MWEf12efU2HZhZCt2ptM2PAlE?=
 =?us-ascii?Q?U+/Kuvx45he6IRZG2jJhSlFaN3EY6QAEEYrpqnXkckUNqjLNZmpdGBTdQVy2?=
 =?us-ascii?Q?AAae1fq5JYwZ7lPG35aQ0IX6WXi+jja/6LSkAC1giIHrQsGaueFbYtvuXB82?=
 =?us-ascii?Q?0b6gOsdX9v45U/Zoe2iqBhBuW1sW0ZX9geSu/6dk1LRaiau8Qp/H0B7o1kxZ?=
 =?us-ascii?Q?N5nHawfUY/Fx/Gsnx69LpXFeZpuq4v88j0uKnVSEizZ+TVe22bUnNvJFRYcE?=
 =?us-ascii?Q?5OE/UvuHF3xYBROPy+hUGw25aA2+vn0NlWehBIhtvVVYmVbJ/2UQ9p5mFVeE?=
 =?us-ascii?Q?NB2qqUhpH9eH7QmG5F7DJnpLGaXZ3E02+2+0Q5YUxdYmWb/oZ+hayd9WbTx+?=
 =?us-ascii?Q?qFyOi1kIFWO3LHHklz8yPUFUc2gy8dF8fW3kJhHe2CothgWW7L+FhAorXmbY?=
 =?us-ascii?Q?zx6k7xqYDIvqCHC+hYho7PitiRokr8G9tTkaiOcdgFv2tJP/3f4w?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0add7c9-2f14-4dc3-c4a6-08df14da42f7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 16:39:37.1967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XAffBX/VAtjRt31pcDZtuA911Fv8KGoyaY6t/BZWwEW0o84kFPbtccQXP+RfrZoe+vyGLabmoF+SLvCYJHkmly08Hiwf3WpGOn80taUX1JAV3vygkec3tK47SMC6Owtc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9283

On Thu, Sep 17, 2026 at 09:12:07AM +0200, Wolfram Sang wrote:
> From: Koichiro Den <den@valinux.co.jp>
>
> Call dma_descriptor_unmap() right after dma_cookie_complete() in the
> threaded IRQ completion path. Without this, streaming DMA mappings
> attached to the descriptor are never released and may eventually exhaust
> DMA mapping resources (e.g. IOVA with an IOMMU or bounce-buffer slots
> with SWIOTLB), leading to dma_map_* failures.
>
> Also ensure dma_descriptor_unmap() is called in rcar_dmac_chan_reinit()
> (error/terminate path) to avoid the same type of leaks.
>
> Fixes: 87244fe5abdf ("dmaengine: rcar-dmac: Add Renesas R-Car Gen2 DMA Controller (DMAC) driver")
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> [wsa: added Fixes tag]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/dma/sh/rcar-dmac.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 5b54f1c4ce15..9155bceb723b 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -844,6 +844,7 @@ static void rcar_dmac_chan_reinit(struct rcar_dmac_chan *chan)
>
>  	list_for_each_entry_safe(desc, _desc, &descs, node) {
>  		list_del(&desc->node);
> +		dma_descriptor_unmap(&desc->async_tx);
>  		rcar_dmac_desc_put(chan, desc);
>  	}
>  }
> @@ -1654,6 +1655,7 @@ static irqreturn_t rcar_dmac_isr_channel_thread(int irq, void *dev)
>  		desc = list_first_entry(&chan->desc.done, struct rcar_dmac_desc,
>  					node);
>  		dma_cookie_complete(&desc->async_tx);
> +		dma_descriptor_unmap(&desc->async_tx);

Does callback function still use these data? suppose should unmap after
callback return.

Frank

>  		list_del(&desc->node);
>
>  		dmaengine_desc_get_callback(&desc->async_tx, &cb);
> --
> 2.53.0
>
