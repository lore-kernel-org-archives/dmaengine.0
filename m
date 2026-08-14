Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013055.outbound.protection.outlook.com [52.101.72.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82C03B6BF9;
	Fri, 14 Aug 2026 16:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786724944; cv=fail; b=iThumHQId8YZXY9NfKqJJfZjqxBgwPjWIAeT0l2f3z/kYIQoazHt5Evu3fRz1MIoPk3kpFVbndxqR9bgiyGtUYDa7WJcBkzpy+7k2WVmceqoAbkjovRfDo5hbl2yAqS4JKAaDlbUUe/sx2PsRTjwzjSE/pCTfyUTTJgKhzKe+dg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786724944; c=relaxed/simple;
	bh=B/JsMibIW263vb55vumvDHOnlTmyTqmcmVsWldMAt4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NVBEIyZuCBQ1gr+dXVB9oAZKDKOAhFUZ0xd9jMS/6n/UkYKnOxk9B64OweOBOuCBhxdLE+JhrJm3BXhOA2hYEXO6y1xijxaE/8ktsAP/+332nOnvo8CiAfk/civRAW/yAkhueGXejBvDD7vLkoVO4iHulOpSDOimJkSW2RQdo/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eJnvgKBg; arc=fail smtp.client-ip=52.101.72.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eJnvgKBg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQ15vlDBEbqmJfekmCKZfKti8VvSLm6sotOBMFSjTKJ0zsyEZUfogNndHGZJ0kyw5Rd5X5AuKVA0dgWMAHThvLCudX5wcVRU1hLz+t8WwX5YvuDRdys/YJnAqvbcl0Wk3gk6C8zT2pjl59LGNCMJtz3w1LtuQiQEeqjZuTIymZsgHdo4xz5Fa+J4RHiyZ6ijDBk6RB1vJAomnuOeJjBzJzZtuhfQyfm6bByXQiUdEAyd5BbBuwyXhJdcZ0ifZWs8McNfpWmCwNAoGKCduAHZnFKkiWdxOgYHDKMtvsPuxRdoKpZSJS24d7wPvH9fj5VgdUK42xeAgVgQs5o69MNLTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhYK8AgjQ9GnYK7qiqnbbQ9wIskH7BtBqtiThkflLNE=;
 b=RTKHhDhhax4E6YfTySrPEO24QaM5EqeUCdpKW6KoqY7SBLrWRAsb3R8y8cu3Hw4qxnSmYIm8txajAKtmeOMN//SIYw0T0roVSs3sggsAZuaHb/iydVfLnNbVzVzc377QwAhXJfDoR7XddHWPQJW7b+GVwAAP8cYDXLX9ZY8PSWP6OXfG58tgDFAHMImnYSbA21zW2pE1t9cOnTjrE5OtEkVZI4PK1OgmUZ8MPydNvZk/PnsIaeO22QWPCMDPSfI5kBqpkQN/mLIybNV9vo16dKuZYt4SWgnlnDC1A1jmoR9EtNE1EVvLAyVE3FlfJseoC8KVdcBIiFY0PYwjcN3ezg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhYK8AgjQ9GnYK7qiqnbbQ9wIskH7BtBqtiThkflLNE=;
 b=eJnvgKBgpIFLIYQth1GsdZoIADpZyV1VucdTYPINMhpX9b7Y07r8GisA54sjY9Wa03Z6x7hRIGbaDSNjZ0m2Uy/0YJko11i1nXDmrKACezoo+Eo08ZU9pHxWpPjaVwFMJTrMo1wtBbE0Nsj8fdVrtO3ukROvAsxipDoEOWMdafyJIsDyYtdytepvPzWgYSh9EIN3FuYVemvqJIycHezrft76ZQS0utQwhafTHhcb+RugJcX48zy1E+wdpj8arZaj6UFgJ1pD+rlOEF1NPAPr1/LNXiJr3xVsl7Q7ZWNT0Q2VzFoJRaPkB/V5NTyTo5Frfbe3Sb/uqTY/vbzzKOalyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by VI1PR04MB7088.eurprd04.prod.outlook.com (2603:10a6:800:11d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 16:28:59 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 16:28:59 +0000
Date: Fri, 14 Aug 2026 11:28:43 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Golla Nagendra <nagendra.golla@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, michal.simek@amd.com,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH V2 1/8] dmaengine: zynqmp_dma: Fix PM rollback on
 sw_desc_pool alloc failure
Message-ID: <an9COy3szB75cgPx@SMW015318>
References: <20260814045616.1661199-1-nagendra.golla@amd.com>
 <20260814045616.1661199-2-nagendra.golla@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814045616.1661199-2-nagendra.golla@amd.com>
X-ClientProxiedBy: PH8P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::20) To VI0PR04MB11784.eurprd04.prod.outlook.com
 (2603:10a6:800:2ea::12)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|VI1PR04MB7088:EE_
X-MS-Office365-Filtering-Correlation-Id: f5423a2d-8711-4023-0816-08defa212410
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|23010399003|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3tb9uUZRxlg+NXOLZc8xbq74kOhk4uQmVh1gieFMQenuId8sJ1tbScTBBgqyoHtVgifC44ZSh8qbdmvTt9EX5qvHxU5yg6vHSsfk6hn4QyUn4sLCvN0fmyuXTDJNH/dbAJLG1KGpjlnnZWI2cBzGCWX2b6fgBfPSRS/RIs2B/42tteJQp9ZbWJWTmfayKZsQ3k3eWwYWDwlYeiOSOQ5G+yGAPCIImTnFHFIucasKJhdpPI+HPD7Vpy14MJ8NVRGQ2KhsyLkAm5xK9SGODtmWDV6WdgRkL7LgvnNGI8tleitTN6cNbBHIG/JkwtTIEduWqDHeHZk8bwrhLqOh+3TDWDT+2R2NbVhvnF0QbcClMDdPMfnl7IedwJgRL4T3RvtlvYTBIAdA63w/LZ/hN+tUXkw34YkZqN8mv9gpndwXu4XaFGOPkhzsS58lFDza9ce71BGhm9v9shK+8ci1zlToLTTLwTen9aDjQzivo8LevHgYyCdftveAHbsV/r8UZBgxTJDfdV51Nrfoapjb78yadPGaZa4XNKEwUwNBxCU8GWKpIR77nhc3jz8YiittwvGm4qzpwCcFQctHLe6SWGNP/R8mQWxEevrWAK62NaAwxroByYU+oqc8CMN4C+xeKQ9nngHqD0Ot3XZuzcRgTOfLEsyrGLGCk96ZKf/89vRhrn0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(23010399003)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e1yDab9JoBbWW343dVJIMZtzvSNotjOS+4wJTTrxhw/2FxFJKrbTBVV40YtX?=
 =?us-ascii?Q?3l+qTwG71CZauy0KbXb28+qm1TpNU1Ohno6Z2D2ET1dRO4VLxueD2+rkJn3C?=
 =?us-ascii?Q?phGojBm23PfXFMK5zw5ZZ4JP3NDmlvSq9hbrs1GKWioLfywyeswCTznjD/f+?=
 =?us-ascii?Q?bAiKS500KlA18jzBXQtwnbzVOAn6RzJtOK8J02bSonb/2NY7bkC8jhYK8Sad?=
 =?us-ascii?Q?I3ooGBHTRrl+0Je+9+jwZfB66uz+Bea0PTun5Ro6uy/DuSqloFvsgWapm6AM?=
 =?us-ascii?Q?2kJhOPbJzcCz0/lvxXA7ByacZri2qm5cpBAFZUQhGfseurHFTXpd6WgKzMP+?=
 =?us-ascii?Q?AkOjmIUG+SRBSUqCX8w3tfE8XKu8cY4fPTpQRV60tjRPoez28pb6Suw8Lw5s?=
 =?us-ascii?Q?3+wtkhOU3X0FPfU9HPTx3VtAWN2FK/utWc5y50RZDQe1hy8/V67KhGP3+2sP?=
 =?us-ascii?Q?QR/vv9bLRUjH3z9gLskyxz1091Ou07q0Ju/KZKK35VQ0n4xTeMBezrIPQO+R?=
 =?us-ascii?Q?pqmjUQlXHV0Yy/qrYNYC/VnjLo3eLRsjeSyFtl2fnN2KRc+sUTitkSVUuOgB?=
 =?us-ascii?Q?wfzz/IA4FDg50gta288hE8VgcyhiYKQo4Pd+yk+9lEKhV7vtZ2W6n4REOCuc?=
 =?us-ascii?Q?VCR+/QLItqHOSsTeaUbHNZ4qE9hxJnixqMfQW4RAxmLBeH/222koVgduX+Gc?=
 =?us-ascii?Q?EFzgejuDHHEnzTKjqmPSPTbnblOffRUQvrr87LgRePJs7DWp5YA/vC0kMFdI?=
 =?us-ascii?Q?ztn+QddX6ile0zFB7DOfWdHkLl6NPxjfxYvckHA6ba22DAT2qxemoLygIad0?=
 =?us-ascii?Q?Vesv6HqAckVqtkfPlG6EKjgCDQo166Ft9hozw+Gcw0DAwB17w5Ea2zw93zgP?=
 =?us-ascii?Q?e2doFpv3K/fuSt3EofBYPNB85DgSKaU7bwkmG5TiTd44g5NnzEpnkZHMPpEd?=
 =?us-ascii?Q?BsgAzrpYoflIESSqtklPOPynSauLdTX1XiIH7XSwY3uygf4uIeSH3m5LJxzo?=
 =?us-ascii?Q?dBmgMFDMoC792MDK/wIALm1f8yOPW3rGOz7t5TjBKirV6W/MQ41abai7d/WZ?=
 =?us-ascii?Q?5bNMTuCorAMi7VywYVD17L8IG2IdaE79o/4O1BAwVGZoJ0+lp9aHXAndhTyz?=
 =?us-ascii?Q?8K602WakA8GIfslajZ3CXYghu8x2BT0EbcEq+iGPZu/sMk0Vsiqhfn2FlBdS?=
 =?us-ascii?Q?pxZ/hZCbcgctV9/99U4mgznqGeMFY2ncvPyrBAeH3lUDqpaAAlf1usOtJ7ty?=
 =?us-ascii?Q?8y63TBWGmHVuE8t834oVJL2F2x+Exiv2UmQ92VFYI4DB7LiIykAWqDVMvz4N?=
 =?us-ascii?Q?XU9CiV1VgWYg1wBJp7W+KOoKeIFwYfgICUFXruo8LBXQlegd1utBjEvglkGX?=
 =?us-ascii?Q?18FB4/G6DRbcpx+xT7/lVQhxlJ17Evvu4I5tsyVxGbdyW1KyL8G5coTJzF40?=
 =?us-ascii?Q?Ohe4j7rfrlMijUgserMGe6Dd1Ie7iuGkwSsLLgoa0a/uckblELRU++M8BcNi?=
 =?us-ascii?Q?AmdApAUb8asQDNo1v2VYFTzAJWJBiZ0Zkb+D/6fZuP8UKVryou/U/KvcoArJ?=
 =?us-ascii?Q?3PJkLOZYRvBhqfLXAqbGjnFaM/nf6LZd6KVlrg5a8GwEd6/LLcakr2AKSTUT?=
 =?us-ascii?Q?mXl/3urZ8GXN2u4NYKhAiNhXcrvAAdxGsakZsWRxXgY+IG/cKuFIQhc0XCJp?=
 =?us-ascii?Q?ldaa61FAMkVhsXhY+i29/WnMgZ+xcIw04ziyXDBPRZtnipLULydO6D7KMb8I?=
 =?us-ascii?Q?n9mKoeF7RDYI3C6wxsOtdIC9vU+khvz2E75pcZKVWU6aCxqQNcEd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5423a2d-8711-4023-0816-08defa212410
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB11784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 16:28:59.1729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDexwEpcwG9bTpZWpBjrgxpTlw52IqLMy+BmXTKl0ZgCQiXKZOMSFvHJ5FfnI8enhBuXRS5LjHIPf6vO4HxmiRzzZca3v4h7KLeKPzsmA7qE5fcL6Ju5Fz7+iJ2EoVkj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7088

On Fri, Aug 14, 2026 at 10:26:09AM +0530, Golla Nagendra wrote:
> If sw_desc_pool allocation fails after pm_runtime_resume_and_get()
> succeeds in zynqmp_dma_alloc_chan_resources(), the error path returns
> without dropping the runtime PM reference.
>
> Route that failure path through err_pm so the runtime PM reference is
> balanced before returning the error.
>
> Fixes: 8982d48af36d ("dmaengine: zynqmp_dma: Fix PM reference leak in zynqmp_dma_alloc_chan_resourc()")
> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> changes in v2:
> - Reworked the patch so sw_desc_pool allocation failure goes through
>   err_pm, ensuring the runtime PM reference is dropped before returning
>   the error
> - Updated commit description to match the new behavior
> ---
>  drivers/dma/xilinx/zynqmp_dma.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
> index f6a812e49ddc..9f1e69700dd0 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
> @@ -483,8 +483,10 @@ static int zynqmp_dma_alloc_chan_resources(struct dma_chan *dchan)
>  		return ret;
>
>  	chan->sw_desc_pool = kzalloc_objs(*desc, ZYNQMP_DMA_NUM_DESCS);
> -	if (!chan->sw_desc_pool)
> -		return -ENOMEM;
> +	if (!chan->sw_desc_pool) {
> +		ret = -ENOMEM;
> +		goto err_pm;
> +	}
>
>  	chan->idle = true;
>  	chan->desc_free_cnt = ZYNQMP_DMA_NUM_DESCS;
> @@ -516,6 +518,10 @@ static int zynqmp_dma_alloc_chan_resources(struct dma_chan *dchan)
>  	}
>
>  	return ZYNQMP_DMA_NUM_DESCS;
> +
> +err_pm:
> +	pm_runtime_put_autosuspend(chan->dev);
> +	return ret;
>  }
>
>  /**
> --
> 2.44.4
>
