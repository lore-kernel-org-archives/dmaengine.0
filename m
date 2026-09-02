Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010008.outbound.protection.outlook.com [52.101.84.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE114A92F6;
	Wed,  2 Sep 2026 15:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363383; cv=fail; b=t8O2zmX85/i81Lj1nxxw/K39JDdtyK3s0uGimRxbrgP6L/WNFuLKnHxNkywgEBsgfXc1ynK1Au9D9R+SDoZtApXagq8hVmJsW37ngpJu22Jx6DmDr5J5o9nHI7uLr/7zWv8r8zjn/MWSWgWMQUeTtGOsdUVjIz2SQ3ncTBH1XyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363383; c=relaxed/simple;
	bh=w31XfpjoDUH39f2fhyOOLL+aBLWgK5j/0PppBeTcQtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Iez4E9n8XigrI/zdol/WVjGHBeC3mUPKMgOnLkpM+lNpabdV3XpWfV3e67tSkcWQ20D0E+hOv2o656v/R/27x56oa9VXuUaVat57pFadMuEnB7YpZZrYnnbyBjPK5nC5iSMRy635CiKcjOzzpkyY4Qr+knQhzI+and0DnAlje6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lsiBU86c; arc=fail smtp.client-ip=52.101.84.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lsiBU86c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hSuoKy26nVtY/6GeVLagsjC1OB2SXKLf6I2+trrXhrO4P2mWixPFEjX1C7l8v+kb9hQEbYkZVZvadSiEoyOgwTUa0jrh7Yxe0Q6UwOtGC2kb/2Pb3gzYePhqpRBFQseSFt9Um5nAUHngzA0WdSCKNFuTlQbqfPVsVRNtPP5yd8+ldJvb9aTBo6TXm7CyiEx6F2/oOjrEIRsT1TxFhkLd9mTnN2ckqq9zPYxzjC2Ws2L17m9HZ/anp86NlYNgOocefj4P7zfvWlgnza7EDPMEZYzv1x332EZehB61aWEDV6mll3c7YtHHYJX0Kp44V5eC6KIXO5B1Rja6Atia8arBIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iifnVROFuGR73huGix8dN3oep1hsUbsaiTtiz5TVano=;
 b=j9JXalIYkmi6LKE6sGojrkHbtX5hkvnf15x1nEPyVnHywmpOcEWJ9Yz8n6DSLOQgBObRLH/G4rtqsFcVzltSTZluwKlUJK4di/wKFfauL8GDeUkXsZCbkGNFHsKirWuxx7J/hoqWhvQEqIp4ZAw18enLd119U1ycZ76JPGp8qQPtsj9N+CFibUa/Itg9Scx9L422mhq1X5eTnUEGeky5HBQKRfnZcqbO4yv3miSMkggZSj/KgpLCHJnplHvl+E3eZVv6kPwrijPvebMc3WXF2WrCV6zsurbOSMpldTHlakWVeKTvq0TWfaqbMBK7kYaUgk0i0oGmaJ46J9IQLHi5pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iifnVROFuGR73huGix8dN3oep1hsUbsaiTtiz5TVano=;
 b=lsiBU86cwISf2pCF0BZ3o7atXugVi/N4oq18bFhpYPbQ99Vqoje3OKwWBIseGvSDqkb0qsMfsulgmU9+G64CrbTP/h8IzHPrAzYILEcZNNuEHRlBzKoNP49BwMQ9r4pl4mfdsNXHW9gHU0wh5ZltKFWsOMwh4CZJR7PPMXkWDO0OKcV9AjEi9ljANbiJH6PmKc/Kucc199OrURGgUS5st5pKjrOizhDk/PatWdBM4a1s05nKBXpZQJz1bh05Qa0EZfWNaiQ0ziXo6qNGf/jERlZENHetChvseoBFrUVPXNCbCODNeYybFeAWRCqqcnMpmJFdrzswZW2DdfXXeRujdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10898.eurprd04.prod.outlook.com (2603:10a6:150:214::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 15:36:07 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 15:36:07 +0000
Date: Wed, 2 Sep 2026 11:35:58 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Suraj Gupta <suraj.gupta2@amd.com>,
	Marek Vasut <marex@nabladev.com>,
	Folker Schwesinger <dev@folker-schwesinger.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 19/34] dmaengine: xilinx-dma: use dmaengine BH instead
 of tasklets
Message-ID: <aphCXtVkfbicBiBC@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <67afeabe4a9cc241704b36875e766d7d129465ec.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67afeabe4a9cc241704b36875e766d7d129465ec.1786384169.git.allen.lkml@gmail.com>
X-ClientProxiedBy: PH8PR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10898:EE_
X-MS-Office365-Filtering-Correlation-Id: b6ce5c53-e9c8-4b36-b3e9-08df0907e83e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|19092799006|10067099003|56012099006|4143699003|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QGqvXddS85WNNFSJE4EWT4Ha4tyxSaTxdW8wmGOx/yBCXRn+Yff3PREk1XxveB+ej6QXvsb2YbvAMpvV4G1eriFjzSG2V+mAZkY794tWouTxmVxIh/idt3yY22xHub0agwaTdZy4HJzDtIiK7eXb+80IAEtdDlwGTyNIls1nPzKbAWAeRmdLB7Obsiy650YtxK8GpKb+3/eNe7QXiw9m0Eq72mDR26KoZunAL+QRT7BTnLV6NjgaGjih1Zp/JdyqPWq1/4SMTI8NVvyeXXi2x7QT5a3IyiKvP66DW8LLB7V2QIwUQuHHzJlCC81TphC5tQliy7r+05+AQmAnMQY/oFtD3vZXOU1SSy/5vvPBz6rCFdMpMFsFCYK/NKboWk/Cu9R/hN80zV/r0DcSuinewtNHNFsM3d0qBc73cBQx02j2KKWwC+maO9oNhMpNjeYUKtq/9jEnNFuUcnfR8rSgkgVoClQOBzeUf4NIUJ/Gf7feVm51ymwyzdCkDyK6fXg5d+deAZbCcCDFkE4QQG0U+EKrxpyynVDWW6Wlz4SEv8so04G8IZqV0WWsmxGEtNNctJR4PJYE8l+dafK+bn2GASWkWDSPocECWGidOY9p/PpXgo7kUkBq8mRx5vOyCAnoAFybmCipbxWFyR56msw6GJHIC3BjXNoQPFBYMc8FsOs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(19092799006)(10067099003)(56012099006)(4143699003)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?00DIaSXExcgvTDcaYozhF3n3UnoRzYPZBe+1Vqwe2HAtyEIrWk/dVFOL8qb9?=
 =?us-ascii?Q?skf/DEKOZHQ1UL+s+feL9ojM5gMBM5GAcobRQcMFKEhMM97XEy9o+XrOz1FM?=
 =?us-ascii?Q?nGZFWNU2i8fsUytOT3y1sdjxvYxidnmgw/cU/TrMbEbWO3pCABl4+6zEgjqM?=
 =?us-ascii?Q?9IxS8S5f+N+BJiJSdguvliXEFs8EBoRvt+SANBWO84+/ucXPsbGfdsGmVSGT?=
 =?us-ascii?Q?AFoQPdQASxFCcmvqVkj4+mUxwd717lc7YnRt7k3FTf6CG91GKizc0E9lgSDo?=
 =?us-ascii?Q?7NpmD+Ux0MHvEXYnD/JkhuDEsVHGn7YqW8R8MDxLCqcW5ZPU9qB/sqY0YmH8?=
 =?us-ascii?Q?NUT1j8VZJAVsySKWfQyGWASOfccEINf763LDsNS/boBghTNQKd8v+ZaPb8Fi?=
 =?us-ascii?Q?jN8h1NRNM8WQCcbcI/ufNNcOvdrVYArAJd/nEcrSa9gbGIX2hMzxD0LQUbVe?=
 =?us-ascii?Q?RPIpn+HniXVjX65LHlTIITYvwgJ60ikgmWBL5dQUqyGidxVOln3MVt8M/ckU?=
 =?us-ascii?Q?txzF/09brhvfIVGMEZrqMsUw3osPcfYCypp4kuTi8iEYybRGpuc5JPZxH+zy?=
 =?us-ascii?Q?MnHsYpUxsLEC0nUwuN6Jhe+GhxMhuAETPBeRvMo0wy23sCNTHAsiihsVizsM?=
 =?us-ascii?Q?0aPS3UWUhYxiUaFa6+7MHpsqffv+ltwAzQzliFX+kHUCi0teiIQ5c58YPBIL?=
 =?us-ascii?Q?1Plc+ssz/u55M6hwBW1w3nsH/4PvDzETLMlcJIaF04AlSH/2YuPXDHIX+ecD?=
 =?us-ascii?Q?mJvwEFM9OceusNEAB5fAUfZTBV0zCSagrb8a8teF7nU/aOl4tv6pT1OPzZie?=
 =?us-ascii?Q?BTEpie0iJyII/ViLvDboszykaNtqWRodE4n2PwJTTZhPh73JrizMzQPT0pGQ?=
 =?us-ascii?Q?ern1nKupnDAYAN69M1/DkvWS1MHVf9pUuDW7A1cCAgvfow6a1hGcJb4j3RS4?=
 =?us-ascii?Q?73+4iWAVbN6m+WTln/3IdCtxuqDk0Pd0LLujLk80aVYifoqF9zO4GWcAt8Bq?=
 =?us-ascii?Q?JVJ7s62g3ISsx0sCquRpTD3izqFtxpB5VY8ASW6mbcfA/xvj3H1pzh2281lh?=
 =?us-ascii?Q?sDd9uVwN9hj6JlqUX+IiYi9sKmKioUR06Bkemd9Hm5Rm2JymRr+W9kRXIno9?=
 =?us-ascii?Q?V5dAIxjkF4CbegsWhYvEqBF/5n94kJTPZO+a1Sm8JcLALwpOOSCQnPIXlP6v?=
 =?us-ascii?Q?z30J2mShpNRgABPWVR0UU7M+M5dYOf0NjGv8lNkQYs9Hywo762NPK8CWlmvf?=
 =?us-ascii?Q?jywLjwLOZhgV9xx97c4Xusr3sTs1UwnrAWBz8MpjrSaFZPitfX8bXUUTUW/K?=
 =?us-ascii?Q?RuyA699reX7U4oR4QeenLfHLX1CReZc1vx7Nziwy1E1Z9+yn8oFZvsGacdgE?=
 =?us-ascii?Q?h7pZeDLMv1WfhoNzuK9NdDt7pTDvpYuEjvefXhqlbYtfgL0aHQl9n/rmAgWh?=
 =?us-ascii?Q?00jyYkmg2q9i2A+tXmKhJ668j02+FJ66Witl2gAQp8nmgOP8odGWIVjegEVx?=
 =?us-ascii?Q?P9utGkb6j8E5AmnXFsYdroT9/Zguh81mU4+cmj1d3vsZ8cM7dEmcDdxtZfN3?=
 =?us-ascii?Q?9xvNBf93V/iBmvW7uXBNAleveD5K+UeV10/D2PPvUXv0QD2rmnOrxKyqBjBT?=
 =?us-ascii?Q?xdqVK7cPaYKvHL7bIMbRBx51I0cizfsgpw6/39rHPRSX740HH7rbNS8JcJbu?=
 =?us-ascii?Q?yMMBxpPAt/tm5Ag5i+EwFoZ8i29SmOJjhjVsAeVezsqdiBwn+xfhmpWRaPM3?=
 =?us-ascii?Q?phpz3oYw1l7Uyh6ZKHr1lSt9/1Ka+S6ly8lVTGwx8tj1pb50WaZQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6ce5c53-e9c8-4b36-b3e9-08df0907e83e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 15:36:07.8758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mxRyqzIYeklNCZ14dGlN1Ywh3POHoW6Vh/HhxerWbqzTK1SClAtzh1ySjIxk/BHXx7aQFacG3+PWyZ9JiClgl5j0OX7pAyLFLrW8W9ut4bfBANeBVIwaoRaQQZvrINIa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10898

On Mon, Aug 10, 2026 at 11:09:20AM -0700, Allen Pais wrote:
> Replace the per-channel tasklet with the shared dmaengine BH helper.
> The handler continues to run in softirq context while dmaengine owns
> the common scheduling and teardown mechanism.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/xilinx/xilinx_dma.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
> index 404235c17353..b142c9c0583c 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -402,7 +402,6 @@ struct xilinx_dma_tx_descriptor {
>   * @err: Channel has errors
>   * @idle: Check for channel idle
>   * @terminating: Check for channel being synchronized by user
> - * @tasklet: Cleanup work after irq
>   * @config: Device configuration info
>   * @flush_on_fsync: Flush on Frame sync
>   * @desc_pendingcount: Descriptor pending count
> @@ -441,7 +440,6 @@ struct xilinx_dma_chan {
>  	bool err;
>  	bool idle;
>  	bool terminating;
> -	struct tasklet_struct tasklet;
>  	struct xilinx_vdma_config config;
>  	bool flush_on_fsync;
>  	u32 desc_pendingcount;
> @@ -1115,11 +1113,12 @@ static void xilinx_dma_chan_desc_cleanup(struct xilinx_dma_chan *chan)
>
>  /**
>   * xilinx_dma_do_tasklet - Schedule completion tasklet
> - * @t: Pointer to the Xilinx DMA channel structure
> + * @c: Pointer to the Xilinx DMA channel structure
>   */
> -static void xilinx_dma_do_tasklet(struct tasklet_struct *t)
> +static void xilinx_dma_do_tasklet(struct dma_chan *c)
>  {
> -	struct xilinx_dma_chan *chan = from_tasklet(chan, t, tasklet);
> +	struct xilinx_dma_chan *chan = container_of(c,
> +			struct xilinx_dma_chan, common);
>
>  	xilinx_dma_chan_desc_cleanup(chan);
>  }
> @@ -1898,7 +1897,7 @@ static irqreturn_t xilinx_mcdma_irq_handler(int irq, void *data)
>  		spin_unlock(&chan->lock);
>  	}
>
> -	tasklet_hi_schedule(&chan->tasklet);
> +	dmaengine_schedule_bh(&chan->common);
>  	return IRQ_HANDLED;
>  }
>
> @@ -1955,7 +1954,7 @@ static irqreturn_t xilinx_dma_irq_handler(int irq, void *data)
>  		spin_unlock(&chan->lock);
>  	}
>
> -	tasklet_schedule(&chan->tasklet);
> +	dmaengine_schedule_bh(&chan->common);
>  	return IRQ_HANDLED;
>  }
>
> @@ -2654,7 +2653,7 @@ static void xilinx_dma_synchronize(struct dma_chan *dchan)
>  {
>  	struct xilinx_dma_chan *chan = to_xilinx_chan(dchan);
>
> -	tasklet_kill(&chan->tasklet);
> +	dmaengine_kill_bh(&chan->common);
>  }
>
>  /**
> @@ -2745,7 +2744,7 @@ static void xilinx_dma_chan_remove(struct xilinx_dma_chan *chan)
>  	if (chan->irq > 0)
>  		free_irq(chan->irq, chan);
>
> -	tasklet_kill(&chan->tasklet);
> +	dmaengine_kill_bh(&chan->common);
>
>  	list_del(&chan->common.device_node);
>  }
> @@ -3075,8 +3074,7 @@ static int xilinx_dma_chan_probe(struct xilinx_dma_device *xdev,
>  			str_enabled_disabled(chan->has_sg));
>  	}
>
> -	/* Initialize the tasklet */
> -	tasklet_setup(&chan->tasklet, xilinx_dma_do_tasklet);
> +	dmaengine_init_bh(&chan->common, xilinx_dma_do_tasklet);
>
>  	/*
>  	 * Initialize the DMA channel and add it to the DMA engine channels
> --
> 2.43.0
>
