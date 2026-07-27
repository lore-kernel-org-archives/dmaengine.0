Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013017.outbound.protection.outlook.com [52.101.83.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327D93451CE;
	Mon, 27 Jul 2026 20:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785183499; cv=fail; b=OyhFX9OdWB/zvBJsLUBMipAhDFp+KCGxvVLhPXQNG2jp+WaO5sUMB6lmJHSqm0pBvQz8Dn6fcgwxHC6ldWHUG5Y/l8c/fzK/sa7iDtFJMdhHHKEe/y+qb9VYuoVX7Ju77pxN20JCsDD/YL1xupHapwEDDdlCzs+U6MmdkfpV5sk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785183499; c=relaxed/simple;
	bh=hWCOrfJUuXSJ1LGtKK7ILVj0f7iHe8xQ0o6fQzgi3Y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aBEMuiSlDfxiNsPhupTqODnmunv6FJMLThC/0Uz9GiOdRWRAxQD6FrTUds9KSnRz3Oxdwy31MmHqQ9KwsDd2jW8tJnMfHLx76B/ynVi71MU4AxQzdYcYZBzFVrPlUkJG4vqpFtg/ec0dFlE1PJ2zXnQtbPaWYSSLvO1EiqBivoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cXMDF9V2; arc=fail smtp.client-ip=52.101.83.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cXMDF9V2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ek7mqBRuqgDVzDntFONm7Ahfn2KmazcKOUhlGkkVVUBj7Z/NnKUV2UJJ2q3DZ7TLtC+mV7ZT093QzA/o4D9db9S3TTiXDk9viWKQIMbL7zNT1VRdKUaE/IqbGx1XjiyLTwiEuMZtJ1S97OJe6YpUCYt1uD2Q2RuWjNwdTjKye/dyfMFBBbSePiQ+hWoH4XYgAXZXvNCDchQx4k2TK8bSZf1UgZmRJIrMqkmx5xaamOZtGFYYr/4zClzwQjg1oFih3ykPZfvnk3/tuO7fYgjLynx94Vi3VNEOY7v0llxrZuUsn/hxdprRV309OGutnrUvQw3Kjqnr4gEvvzQd6LUqCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLp1P3ylA6gGaKgIFUKyDuA0T+h25HAPuR4W8l+xZns=;
 b=f1ELg2XRBzr0jWmm992j6PtDAZm52fUHwSQu60weWTKllNmBuKXUxYbK9BJ1ZCk6VOGH8i8dXb7yxqj1fQLrFjgtQe+NNWNpNpBJQuEP9FEO6KrN4v7Q/oWiEqvJqXYx+bWaH4i8GhPAP5SRgleFzPwwtAx2Tc46YRdt0qqMZ5Fk64PRUGvC5ooX6ZZHPnOScuklWXHNCTIbz9CCF+LGekMjYYVhv2UPYd4WxMd+0dJxLamImVKQDZC3EHFoi3Mlbw+hEXMgeiBCjPuY2o3Dk24UwBMbwADSDbeL/IEE0bNmJGb3ECrINH8PKeQ6KLhVpg3tpv+Fp2keFcGTurptmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLp1P3ylA6gGaKgIFUKyDuA0T+h25HAPuR4W8l+xZns=;
 b=cXMDF9V2kFOvrME1QOuxnpj1+8rq44jZoJ9ZnDqF5Tpd2RmYmtLLMRRyRupA6RjxMaTieZxcLXTb5bJgBXCekH5hQFBqwxxIWYBYnaAACNkxDdFHePGXVS9OjqqNizrnu6j+yBraN5GJvFO46bMmqaJrX2shDQbl1BmoLfPMePEt7BEY5bx6HMHHJ38GJZHBt3M7xWRY8m3EbB7hTAAZiKFAyk5YaMCTcB9eqKqVSK/tHZQWAXZ1wS+Zh365jsJt/1ZAbgQjR6vIx0NWqfGFPGxbaYINnUXxqIcyohcsrauci5G8JWNQe5MH83JKbsWd25cAfrVbvJtoPw1An1BOnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVUPR04MB12170.eurprd04.prod.outlook.com (2603:10a6:150:33f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 20:18:10 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 20:18:10 +0000
Date: Mon, 27 Jul 2026 16:18:01 -0400
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
Subject: Re: [PATCH v3 10/24] dmaengine: dw-edma: Prepare LL kicks for event
 serialization
Message-ID: <ame8-QU4siDSPzaS@lizhi-Precision-Tower-5810>
References: <20260727170323.2321369-1-den@valinux.co.jp>
 <20260727170323.2321369-11-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727170323.2321369-11-den@valinux.co.jp>
X-ClientProxiedBy: PH7PR17CA0046.namprd17.prod.outlook.com
 (2603:10b6:510:323::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVUPR04MB12170:EE_
X-MS-Office365-Filtering-Correlation-Id: 2093c87e-fce5-45c2-7ba4-08deec1c2deb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|19092799006|6133799003|4143699003|22082099003|10067099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Lu3UdSAQzmIqC8z5feazIq46m/aSJn2ZFkq3cyoU8ntVlDhbxgQZv8FDxn1EF+gDU4QBfi4kcWTmwYfBoBggCWac9w8lksygA2kprygWLxG2YsIZUKvlN9pv4kM67mi0e7a9cqHiNYnD9WaOLKnTGJ3V8qfne+kDyI2FzqFAYf396yGZxUkuGcwioVedadv3ZYPNL4db7JccGjaswkSJSAiOsvtd6MuiKHDtZ8NkcY+ymfxd+v26CowmVnoXpWDTaANuPlxaRspHb5/EpwKAVtZVQF/XMIrB7nl4elMxUDutsbCeqZzqM/FP034em9Sx0weoQWGGVCo2kl6CtKlUPKcm2+aBIulP5TlZ5IDcdLeFBIOA5A0vospep5xJ8CIqdL6Dqffg5kf6G4vxw/qudGmEKoEY/WqY5nApcvA5MKeZU6Uh7tQxnf8USxvDXw9uriFCbeR5B3bCY67pTQv+gCS9Vzbmrk450GEdgCc/Vs6jN6Kp93r/DYwL4vyDQQju8+7GZ0hjHQ+9FCENot0taz6QuTJUt1k68niHDnyBhYFX3lHRWkO2+TzzJit+/mzYI1msKz/heur+XmCQ6lPbtePuoqBZICZLXd3AiAiK1+j3cW6Dtdtgyh0zGgxtMHgn0/Qx2eAIKzBTFo1kyCYedEUoDXwSE7LcfI2RVimgF+c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(19092799006)(6133799003)(4143699003)(22082099003)(10067099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mR/IHEYEQK6O3/2POfNBNCjjJDe/sQnWxyYeoOAnnQogb0kMoraVqF1cL9fI?=
 =?us-ascii?Q?fy/nnKSuLn3P/3nzI9NIlSLbvsWNU7TKx/hjdyXqD+0SD3yB2M4zbLiNqYKT?=
 =?us-ascii?Q?v0HAUSXXgSAYY5zlWF+lrgwQ6JqjkvLFFR4Q51ptTPrDK1O7hkS9I7F823VZ?=
 =?us-ascii?Q?CDSPwDYqvsdu2TC64bbkE5NZmfmeLK5qVELnioYCgbH73waDyh7Cm9Kecf09?=
 =?us-ascii?Q?qWG4mkYeJuD7lpy4cbDButzpIDGfkM+QoRLZgaNVjTxlUMpR+gc5h1uQ3fht?=
 =?us-ascii?Q?XZkwginHhaieds9cfaztVYarLWSmDb700zlqaexsKX5+DYmBg5rdhzbLQScN?=
 =?us-ascii?Q?kgAB0KPWBmKsEMZYxStTyfECbjEyw5/HKI47ErWU9+eRMKO7YLPJICgEWNW8?=
 =?us-ascii?Q?FyNKTWyFaDcYb/okosB4GEm7YVhTscm/be+7R3F1gJwDtNKvXFe7KmldrAnQ?=
 =?us-ascii?Q?wQFxq1ynNAjaka4GXa7GeAECvSBsLmoZt+jscCHraMKPCRtdn5dRJcaQg802?=
 =?us-ascii?Q?Xn/vU93/9dFgRY/zvUCyt/iu6UZDRw2iPa3RlL5KdfUrLeGjjc3qjapQzRDg?=
 =?us-ascii?Q?jX1IJFn6v/yxd1hhQFWzFL3XAqGoXkjgiR8dChdYlOqnGn98kUny/0U6ssqF?=
 =?us-ascii?Q?9nZQ3Pg9gWNEN9pldlJfYWd8FIi345+CYpYEzxgzPEDKMgeps2bfNF5TDzZy?=
 =?us-ascii?Q?yiprWh6Ab817rjJKT7wtTFOOb3HiLNFrAz2n+/mUZuiBWrta8k2jS+7cEIxK?=
 =?us-ascii?Q?7FAzOuxaY6AgFEeCDHIywFLrJTZgmBKYSZ4TeiVX2foBntXxMkV4eEOpjOrW?=
 =?us-ascii?Q?Q+CNYrEAKcGq8wkhZgktY/twGaOXi74B1gE1AQm+DCFBYfd/pmS2egWyIog7?=
 =?us-ascii?Q?8w87RiWOSimRPT/VysceG/d8N+NsriuEYodPza7kBBBGL7syAebfbqBU3RON?=
 =?us-ascii?Q?fPsu0QlIVnYezkX1xUNFU3qV+xkq7EwPibly7YmACijamgejJKC785D6s+Jk?=
 =?us-ascii?Q?bBAYTM4xSVgJeSV0YhcxxBcxh9V8PW/L0/i7T2UEKUTQXVJvw9B0WQ+DkVAU?=
 =?us-ascii?Q?OgjzEPmcKHo/Qbw6/L6HFCVF74kSAVBvCn4As3Pw5d3KSxyM5pXsrN5P+yh9?=
 =?us-ascii?Q?ZP07wMYwUFM9duh0lXeQqLTzGAf1wTOgMFlh8KZ5xaS95F9JL6PhXYb/d4Ja?=
 =?us-ascii?Q?VL9gJ0CjVSSoW3eluhmqfwtsvivqM3yNjiseWLPIKb8roE98FScvV9e0wfpg?=
 =?us-ascii?Q?0ZegXcqb6YhvCW5Skqq3txSIc74+epJ/OajYl5p0JEm7GpgjnaOn71yIltcB?=
 =?us-ascii?Q?WMLfn4Yuwmnx8q2gTTWc0L+TMckFgE0pZ4tQBdyJ9ifbh77GbsRTS6Qfli/G?=
 =?us-ascii?Q?Z7ttZVFP6UMRSZZPlgT3MB33MJS9+06GMXVlkSwV6+Tlr+K/l4uYHV1+xNvh?=
 =?us-ascii?Q?m90h/hv4jbo5UXMZ6HCejHLaSa7Dt/owKiXmiYU5lfrhVLb7zRJ9WXseEcdo?=
 =?us-ascii?Q?GCGJpSwnfbzXrtzVfKjvWnyZ9Bi7hi8YbkO/xqJdB6DUoykDqdL4h5UF5EFI?=
 =?us-ascii?Q?JFhOJ1dEZcmLEeUAhXLKPuvx21vRbDOngw58WqgjiAy7vJix9cFGQTq5L+iB?=
 =?us-ascii?Q?ryDJs+t0ucafRrmC06pWqNpl1kWQ96UrfqI6ZCC6EiDaSTFnA62ey/xNRpz3?=
 =?us-ascii?Q?0O0+ikJIjLilzROb7eyda6BazMkb2JajqFqD4B+tmplDwS0tBQVmK3wGYFMu?=
 =?us-ascii?Q?1iA3doMToFCfl++CFF8Xc6jo3ySQbKdWX6k8LaGKXc2bzOSxS+OX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2093c87e-fce5-45c2-7ba4-08deec1c2deb
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 20:18:10.8279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l7PmESM9dyr4Whad3DVYIW2QLQpC4bODCVIBRx7w5TxoZmn5+FV6LSPq+aAkUKRg8q4aNt6m/tT779H8uZiJ+rzf/t8nyBZ5Lha2UpK85TdhqgTwJ0/0ZLwGAqZQ9YG3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR04MB12170

On Tue, Jul 28, 2026 at 02:03:09AM +0900, Koichiro Den wrote:
> Both eDMA and HDMA perform the same remote LL read-back immediately
> before writing the doorbell register.
>
> A later patch serializes each LL doorbell write against IRQ event
> capture with a raw spinlock. Keeping the read-back in the provider
> callback would hold that lock across a remote read. Move the common
> read-back into a core kick helper, where it can run before the
> serialized section, and leave dw_edma_core_ch_maybe_doorbell() to decide
> whether a kick is needed.
>
> No functional change.
>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
> Changes in v3:
>   - New prep patch split from "Centralize LL doorbell decisions" to keep
>     that policy change focused and the remote LL read-back outside the
>     event lock added later. (Sashiko)
>
>  drivers/dma/dw-edma/dw-edma-core.c    | 20 +++++++++++++++++++-
>  drivers/dma/dw-edma/dw-edma-v0-core.c | 16 ----------------
>  drivers/dma/dw-edma/dw-hdma-v0-core.c | 16 ----------------
>  3 files changed, 19 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index bb57f2d39d1c..e3d0559206d8 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -13,6 +13,7 @@
>  #include <linux/dmaengine.h>
>  #include <linux/err.h>
>  #include <linux/interrupt.h>
> +#include <linux/io.h>
>  #include <linux/irq.h>
>  #include <linux/dma/edma.h>
>  #include <linux/dma-mapping.h>
> @@ -254,6 +255,23 @@ static void dw_edma_finish_termination(struct dw_edma_chan *chan)
>  	chan->status = EDMA_ST_IDLE;
>  }
>
> +static void dw_edma_core_ll_sync(struct dw_edma_chan *chan)
> +{
> +	/*
> +	 * Remote controller registers and LL memory may be reached through
> +	 * different paths. Complete posted LL writes before the doorbell.
> +	 */
> +	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
> +		readl(chan->ll_region.vaddr.io);
> +}
> +
> +/* Must be called with vc.lock held for an LL channel. */
> +static void dw_edma_core_ch_kick(struct dw_edma_chan *chan)
> +{
> +	dw_edma_core_ll_sync(chan);
> +	dw_edma_core_ch_doorbell(chan);
> +}
> +

Can you move

	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
		readl(chan->ll_region.vaddr.io);

into funciton dw_edma_core_ch_doorbell().

Frank
>  /* Must be called with vc.lock held. */
>  static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
>  {
> @@ -261,7 +279,7 @@ static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
>  	    chan->status != EDMA_ST_BUSY || !dw_edma_ll_pending(chan))
>  		return;
>
> -	dw_edma_core_ch_doorbell(chan);
> +	dw_edma_core_ch_kick(chan);
>  }
>
>  static void dw_edma_device_caps(struct dma_chan *dchan,
> diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
> index d883ca446f5a..b3098eb83442 100644
> --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
> @@ -480,20 +480,6 @@ static void dw_edma_v0_core_ch_enable(struct dw_edma_chan *chan)
>  		  upper_32_bits(chan->ll_region.paddr));
>  }
>
> -static void dw_edma_v0_sync_ll_data(struct dw_edma_chan *chan)
> -{
> -	/*
> -	 * In case of remote eDMA engine setup, the DW PCIe RP/EP internal
> -	 * configuration registers and application memory are normally accessed
> -	 * over different buses. Ensure LL-data reaches the memory before the
> -	 * doorbell register is toggled by issuing the dummy-read from the remote
> -	 * LL memory in a hope that the MRd TLP will return only after the
> -	 * last MWr TLP is completed
> -	 */
> -	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
> -		readl(chan->ll_region.vaddr.io);
> -}
> -
>  static void dw_edma_v0_core_ch_config(struct dw_edma_chan *chan)
>  {
>  	struct dw_edma *dw = chan->dw;
> @@ -624,8 +610,6 @@ static void dw_edma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
>  {
>  	struct dw_edma *dw = chan->dw;
>
> -	dw_edma_v0_sync_ll_data(chan);
> -
>  	/* Doorbell */
>  	SET_RW_32(dw, chan->dir, doorbell,
>  		  FIELD_PREP(EDMA_V0_DOORBELL_CH_MASK, chan->id));
> diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> index afc2f24fecd3..64a07fbc5be3 100644
> --- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> @@ -282,20 +282,6 @@ static void dw_hdma_v0_core_ch_enable(struct dw_edma_chan *chan)
>  		  HDMA_V0_CONSUMER_CYCLE_STAT | HDMA_V0_CONSUMER_CYCLE_BIT);
>  }
>
> -static void dw_hdma_v0_sync_ll_data(struct dw_edma_chan *chan)
> -{
> -	/*
> -	 * In case of remote HDMA engine setup, the DW PCIe RP/EP internal
> -	 * configuration registers and application memory are normally accessed
> -	 * over different buses. Ensure LL-data reaches the memory before the
> -	 * doorbell register is toggled by issuing the dummy-read from the remote
> -	 * LL memory in a hope that the MRd TLP will return only after the
> -	 * last MWr TLP is completed
> -	 */
> -	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
> -		readl(chan->ll_region.vaddr.io);
> -}
> -
>  static void dw_hdma_v0_core_non_ll_start(struct dw_edma_chan *chan,
>  					 struct dw_edma_burst *child)
>  {
> @@ -393,8 +379,6 @@ static void dw_hdma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
>  {
>  	struct dw_edma *dw = chan->dw;
>
> -	dw_hdma_v0_sync_ll_data(chan);
> -
>  	/* Doorbell */
>  	SET_CH_32(dw, chan->dir, chan->id, doorbell, HDMA_V0_DOORBELL_START);
>  }
> --
> 2.51.0
>
