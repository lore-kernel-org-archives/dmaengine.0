Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013042.outbound.protection.outlook.com [40.107.162.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A179D360745;
	Thu, 20 Aug 2026 15:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787238760; cv=fail; b=E0s9fPuJkZOfKjkVegH1dHlQNexcaHEi+et4Gkw3Hbms8cbg+cH/O3/9i8If5ksWt2kKwr4/obQHJtjywS2kNdLaD8AEbMwbYo80TNb4XNGDykAlAL1NAOEJNDqvjKpSJgvwqciYUhuwHHyob/P6qLswdsNSZzm2LMoUHjLEmik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787238760; c=relaxed/simple;
	bh=fA/EuG+Jwi4BIsho506fxp0ueGwXiInrEo+6tsGsy6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Qs68Jr114w5coqoXb2QM7uyYjRXqblIM2hn2XGLLxn/ACva2eGuCh8rcH7PTQRNL3muHnEUcknu+bEx5CwOHqTSC15vwkY39ojAyKRLM9klH5oGNkiwGjaYKVbcDNsbjR2002YGFeuoPIHhhAnaJz0EeincbeI4I3BcyoVmrVLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oXtUBy9V; arc=fail smtp.client-ip=40.107.162.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oXtUBy9V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ywjXLdFimGoCXK1pb4DsFKMV2vzhjdWI6ILY6t0auAyRfRhoapsrlV111Zq1L0INN6ASfUemeLxuoXGIAM6rDyQlqJ/KFnJAxV2GrKz51HPHi0G5Pyp6HWb3QBb0CxK5kk2V/Q69HQqpfFZzizwn2J8xn6riJ5/5WPBEcFEQIjnPSc1YANCXwyBYPmfNbrG13qqPjjpdqpH2GEdPsAtZJ0M5+SbKprZuAo8j0dkjEsNIH3zyuQD1PaSYVBuHvT0L1FXu0kl3Xh9gfpRDsz7HwuxkZdU/1+Iz8vDb5ARtpu+5okK0sXgVZpaqMaEVJpRcr1tJHxQrjqja+chPM+tg+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tl6qZluDNVD0XJHBfRo/3IHu/mfCL6sV0OHSIRwpFco=;
 b=lbEBzcwFiDXqLaEv2XfhDe50/f3sSGNH2fYH8jbyQQ7nTsB5xfjtqzOXBBGBa8h+ZtpmEozx2kbw5uoJEBsZLcacnLVIlL1WYURUMV4Ms8iRWz9lzIGZUVKx7Wyh9W0Nz3CYMmi5IEsDEOgncOLt5i3leaHva4EMJUHjQzOsJUSzrsLMkIa7hj/gUWXfcfDdqBW/t7b5KUrQNVYvgr4ZSN1eN3+oouPvJDzJvoky8O8d16C/MflBlmz3eMmXMTYbbdSHlxSkSah7LyUbq+s4qd844De4x5t0zDQYvz5mHvFj/LqMq0LXLJBEzNfFSntesrcg3KN+QzZOpijFCOUAaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tl6qZluDNVD0XJHBfRo/3IHu/mfCL6sV0OHSIRwpFco=;
 b=oXtUBy9V9GiQThGF6hI01ewxAkHa15xXK40+8+9SVeaTQQrabc6eDyREjXGhOtuXMkB2SaO0jZYpflmiayngUIyWc15KmMSAwzntVaDiDf08b99AEdCv9hICkh0wjqy90g5ZKELk5ycoX+AaOlqNFTXveTR9TOwiHdXKiCCLZwb54lJL013MdPAqiM0kBebdCt75QUWAh+jxeRuWQjDOpke8AQJA9YMZIcILZMKId6OVmXr8EeeZtbpDJRvFijo74dtlIYvmKc5UWKelVl+y6tiQCOPk3d288q0rjEoRGrchiTV2XgXUnLHhmexHJ05QQyiir22IOAShXcrq0AAfug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB11655.eurprd04.prod.outlook.com (2603:10a6:150:2c2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 15:12:36 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 15:12:35 +0000
Date: Thu, 20 Aug 2026 10:12:28 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	"moderated list:MICROCHIP AT91 DMA DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv3] dmaengine: at_hdmac: use devm APIs in probe()
Message-ID: <aocZXKrXxENFihZW@SMW015318>
References: <20260817201200.10952-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817201200.10952-1-rosenp@gmail.com>
X-ClientProxiedBy: SA0PR11CA0058.namprd11.prod.outlook.com
 (2603:10b6:806:d0::33) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB11655:EE_
X-MS-Office365-Filtering-Correlation-Id: f0cdcb62-fa0c-4b41-dbfe-08defecd772f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|1800799024|376014|11063799006|10067099003|56012099006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	L4iyJjMZnl8ahs4T9v+8rglKr6YY2GZnnPTIIb31SuPcmX8ZPJwsFCDA42/L5dhaEi11+lLbW0RVk3XvOZ05F6AJ+qO0ejUBIurk+fn5PuLaMzOe2aI694/HCPQhV26xNvb9ZjkxmFS4vOHuXj5iJSoTTIB0FvurGof1CvgnlljEwcjMj7qbPYLBU2Twxsn3PPPrPw9GaXWktTfm4B7PBLVe1ekveNwjqjgkHKYSPYKSp/mawVPPT3HDvPbUPWnJWpG0cIZeoRzHo+l/whU5sH4gVcLQT374zXCbfKd8aBQ4qszRDK7FRiwAeTzQXXywWXz96YBGfo/cFZY7vksLBeUpoZlgCR95pG8dTLnT5Vl6qcE8Jp2q2A7EZfxdqioWuFicGMS2VqGWLZYqGMaRinan3X+JOAN/I8nI2ZAthY/4CRFpCTe7qe2D/g+UYedA0c5yy4sN4eQ7J4RM7Nlcj9u4gXQGxeOw+I00O1W53gvDG7enJbKmMK2TJrzSlySdLtAru+vHqVpoROFSFhmtJhtysMogqCu2SMxSHrKbt41xqZ9oETU3Od2GKVg2F01s4HTfaTxvMkJdpn3yL9AHyJXoQ5oitlOZwJU6tknWVClkxPnC5ItmPBcQ7qAvi6BY6wtrDW+v9aFUR/7hHCvpejA7dCVu7OTVwydTxj8qaJI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(1800799024)(376014)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6VoqYbvUY6N7CSG0+ynGTy0ZxmY372+2xY6ccP9jOFtM+fL6/ObtJiDdQnZ3?=
 =?us-ascii?Q?oVcOHV0+copnPHxPVqS/q21QcWjKntIm5tce7lHMC5qamb3QWciq62e/XP2t?=
 =?us-ascii?Q?AIjdtAZaM+OsVCh/FOtC61CgFmXYOmONpUeiuoG0nUuZUPg2qXXhHse1w6TY?=
 =?us-ascii?Q?hYrMoRmoRD8ZPru57A2vIAcKgCoKtGBWorBw2096jubEs1b/dH0kUZtWumQP?=
 =?us-ascii?Q?Gnl2GZWizTgZRMFlJsTuTnozQ7JzgTT6UKy0KchmNvE9ekRyybjxagqxrC1M?=
 =?us-ascii?Q?LityLkN8riDkwkzFJKSmX+IpRErgQ54n2gZoCzFlYJkFt0YthHnpzPkBDtak?=
 =?us-ascii?Q?jqzkfpkmQh3dpjxrudZJeWmjVjrdGGGT9MPe1YhuyYbRw1ZpOZmBW/rOHfDs?=
 =?us-ascii?Q?C+t9Yr7/a5PRQXMQ3yGinjjpqUenR8hSYPz2SH0R7zwT9mJh1jNKlvImY2wc?=
 =?us-ascii?Q?UvOJNEdht9Qxr1/sVNZYsckWoi972OAuYXMWOEHm7oj124Fde2vQGj1IGhhC?=
 =?us-ascii?Q?M4MHd3/VqUZ4i4WcqUQ027Wvnw8ZVBQ7s7RAQrKRvztO28ShW8JH6qI1MXyZ?=
 =?us-ascii?Q?X7LebqyC9P7QE0fBWZQheHAW66OiZx2mZOKj2o79F2Gonh+mMpAelqgFg6+x?=
 =?us-ascii?Q?gkg0T0t/EloLVOxjJqRVBv9rudmzJySeJdlZvKW4UooPRBOCMrEeXdkJRYLp?=
 =?us-ascii?Q?eyKvoA4V3ZZEMQytFhLe+CXkrzOAXVoccXESvJu6pnB1ILMX23fOSeQE+ion?=
 =?us-ascii?Q?PdeSBORIDof0xbTocMAzW5Id0CNPTEvEVpTcDm7FqgxtE0+8ujj2LkNA76Jb?=
 =?us-ascii?Q?IF6h8I+gNS4ZJNLaKGaoyVU0/34qQTwVrkRVBoUBeZPuNFh+aIHEScumIzrJ?=
 =?us-ascii?Q?ID+tVEdQGrk3hV4cMNla4MyHSr17eVdqTpwbehGLlt3CNdZHZKJh1WCux9Xm?=
 =?us-ascii?Q?d9zNF/rsmyINKrf9Hnp1KrZxB2LfoWiO8A9+Rhwz5myuSiFejYXkQi5gml3j?=
 =?us-ascii?Q?/aJx5ZMJg/DwOd6zAAAEc0wd4zIbBC58SPMtJB5nUdRCBYJSIQeOHAfWXKay?=
 =?us-ascii?Q?MxRfYLJkNm6/Q79uQr+WdB5MMEnUn0t9FNhBRn98YyPKsELl/b7RbqI1WoLQ?=
 =?us-ascii?Q?k+T7918BknfwkSr//gbbEADtQRiZkHjit/SBrMtg88IYO18eoVKxkHtGpVMP?=
 =?us-ascii?Q?WitaB86g18yTAjaiyCciy47igiBK3TH6wbkHOmLnQcZhGME29O53PoOLXL3A?=
 =?us-ascii?Q?TlxriFaQACMkeYhKqwCpFQWMTK/YDy4Ibc3qLr4Czd/boSkoFnSDqXD6BxAy?=
 =?us-ascii?Q?MbuGcqHt1RFzSL1oWHGm2cyOgyfdY135a1gJ0I9vEK30MYCwaeWc8k0ur2Ec?=
 =?us-ascii?Q?0ZCUo5/JWykW0zJkt2gtn6IirkrakoyzQPGIkrQa9HGlZNSOVQvqeVccD6bb?=
 =?us-ascii?Q?ag4Ti5bWWM/8hYZ4oHmm6oGyFGCKrR7qkRiwwX3DkYijtuyOpMCzPe3JM8W0?=
 =?us-ascii?Q?VdIpRgsEXT444wcKVyanGnMH3KXFx7kMsa5XuTMGTnrW726qwCdu/w2l94dL?=
 =?us-ascii?Q?5N1b38K+QYISqv5WX/D19/JzckcYRBizQkx0AjYsBFFuySV11Lkg6BhL6R27?=
 =?us-ascii?Q?XrPdbXyraJgsDiVP/02Z1r3mh7kVFSK1f3IlpdwXqZpIAL24u4/IUSDO+h7K?=
 =?us-ascii?Q?Iaqgp3Wmq95tkDPChRIEsKkIOOfHgQIg//gNn4UPmKidBkgDjv6vi/P6cS0W?=
 =?us-ascii?Q?dJ/r4hyDDjjy3FqYXrv8rAX8l8rp6HO6QuCMbqTw8KyighxRobaR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0cdcb62-fa0c-4b41-dbfe-08defecd772f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 15:12:35.7532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QAlNFh8no1vLZepV5V8PrpQbwmLHRF32aZNx+sMpEEN/oxqqhFHfcg0oeMspkXf7F8ua6ksFxpa30BDcgK7J8Nrc61IK84F4d1CylZqlBdmnQubziKurG8mNQ5mbBLqo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11655

On Mon, Aug 17, 2026 at 01:12:00PM -0700, Rosen Penev wrote:
> Convert resource allocation and setup in probe() to use devm-managed APIs.
> Simplify the error handling path and removes explicit cleanup code.
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  v3: fix subject and description
>  v2: remove list_del
>  drivers/dma/at_hdmac.c | 50 ++++++++++--------------------------------
>  1 file changed, 11 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
> index 971f8bc9ec48..49a85ac66e83 100644
> --- a/drivers/dma/at_hdmac.c
> +++ b/drivers/dma/at_hdmac.c
> @@ -1986,40 +1986,34 @@ static int __init at_dma_probe(struct platform_device *pdev)
>  	atdma->dma_device.cap_mask = plat_dat->cap_mask;
>  	atdma->all_chan_mask = (1 << plat_dat->nr_channels) - 1;
>
> -	atdma->clk = devm_clk_get(&pdev->dev, "dma_clk");
> +	atdma->clk = devm_clk_get_enabled(&pdev->dev, "dma_clk");
>  	if (IS_ERR(atdma->clk))
>  		return PTR_ERR(atdma->clk);
>
> -	err = clk_prepare_enable(atdma->clk);
> -	if (err)
> -		return err;
> -
>  	/* force dma off, just in case */
>  	at_dma_off(atdma);
>
> -	err = request_irq(irq, at_dma_interrupt, 0, "at_hdmac", atdma);
> +	err = devm_request_irq(&pdev->dev, irq, at_dma_interrupt, 0, "at_hdmac", atdma);
>  	if (err)
> -		goto err_irq;
> +		return err;
>
>  	platform_set_drvdata(pdev, atdma);
>
>  	/* create a pool of consistent memory blocks for hardware descriptors */
> -	atdma->lli_pool = dma_pool_create("at_hdmac_lli_pool",
> +	atdma->lli_pool = dmam_pool_create("at_hdmac_lli_pool",
>  					  &pdev->dev, sizeof(struct at_lli),
>  					  4 /* word alignment */, 0);
>  	if (!atdma->lli_pool) {
>  		dev_err(&pdev->dev, "Unable to allocate DMA LLI descriptor pool\n");
> -		err = -ENOMEM;
> -		goto err_desc_pool_create;
> +		return -ENOMEM;
>  	}
>
>  	/* create a pool of consistent memory blocks for memset blocks */
> -	atdma->memset_pool = dma_pool_create("at_hdmac_memset_pool",
> +	atdma->memset_pool = dmam_pool_create("at_hdmac_memset_pool",
>  					     &pdev->dev, sizeof(int), 4, 0);
>  	if (!atdma->memset_pool) {
>  		dev_err(&pdev->dev, "No memory for memset dma pool\n");
> -		err = -ENOMEM;
> -		goto err_memset_pool_create;
> +		return -ENOMEM;
>  	}
>
>  	/* clear any pending interrupt */
> @@ -2086,10 +2080,10 @@ static int __init at_dma_probe(struct platform_device *pdev)
>  	  dma_has_cap(DMA_SLAVE, atdma->dma_device.cap_mask)  ? "slave " : "",
>  	  plat_dat->nr_channels);
>
> -	err = dma_async_device_register(&atdma->dma_device);
> +	err = dmaenginem_async_device_register(&atdma->dma_device);
>  	if (err) {
>  		dev_err(&pdev->dev, "Unable to register: %d.\n", err);
> -		goto err_dma_async_device_register;
> +		return err;
>  	}
>
>  	/*
> @@ -2098,27 +2092,15 @@ static int __init at_dma_probe(struct platform_device *pdev)
>  	 * dma_request_channel().
>  	 */
>  	if (pdev->dev.of_node) {
> -		err = of_dma_controller_register(pdev->dev.of_node,
> +		err = devm_of_dma_controller_register(&pdev->dev, pdev->dev.of_node,
>  						 at_dma_xlate, atdma);
>  		if (err) {
>  			dev_err(&pdev->dev, "could not register of_dma_controller\n");
> -			goto err_of_dma_controller_register;
> +			return err;
>  		}
>  	}
>
>  	return 0;
> -
> -err_of_dma_controller_register:
> -	dma_async_device_unregister(&atdma->dma_device);
> -err_dma_async_device_register:
> -	dma_pool_destroy(atdma->memset_pool);
> -err_memset_pool_create:
> -	dma_pool_destroy(atdma->lli_pool);
> -err_desc_pool_create:
> -	free_irq(platform_get_irq(pdev, 0), atdma);
> -err_irq:
> -	clk_disable_unprepare(atdma->clk);
> -	return err;
>  }
>
>  static void at_dma_remove(struct platform_device *pdev)
> @@ -2127,22 +2109,12 @@ static void at_dma_remove(struct platform_device *pdev)
>  	struct dma_chan		*chan, *_chan;
>
>  	at_dma_off(atdma);
> -	if (pdev->dev.of_node)
> -		of_dma_controller_free(pdev->dev.of_node);
> -	dma_async_device_unregister(&atdma->dma_device);
> -
> -	dma_pool_destroy(atdma->memset_pool);
> -	dma_pool_destroy(atdma->lli_pool);
> -	free_irq(platform_get_irq(pdev, 0), atdma);
>
>  	list_for_each_entry_safe(chan, _chan, &atdma->dma_device.channels,
>  			device_node) {
>  		/* Disable interrupts */
>  		atc_disable_chan_irq(atdma, chan->chan_id);
> -		list_del(&chan->device_node);
>  	}
> -
> -	clk_disable_unprepare(atdma->clk);
>  }
>
>  static void at_dma_shutdown(struct platform_device *pdev)
> --
> 2.55.0
>
