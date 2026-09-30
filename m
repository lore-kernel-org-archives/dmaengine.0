Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012026.outbound.protection.outlook.com [52.101.66.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1AF41A502;
	Wed, 30 Sep 2026 19:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797339; cv=fail; b=t6t/o1JLiQNNS0PDLCDdfLFNBoNcb7E4pAXf3OHsJq8F/MzcWVfin/G+fw12p/RHdgyA9IqPOm9s8eG23Cby2ehW1UO8dMzD+XEgw3AlhDz3uLUlmDshPvmWBmE/vC9qVCTVvoQlQb6ZXHak72CUauDqfJKypVuGsLnQ81ZJJNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797339; c=relaxed/simple;
	bh=+vrf0Tdr99xwkf85vo3rjvWPFeUvlS+P1d6Nn2BEc3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hp8YTrr5QZRA2KK4KxFJioI9PzpWVDPeRlNI3cPhDD8zSGzu/dMvD7jLgJh6FFF7NgPXXACe+q5Hm1TrCdWNovLlIrxUG7r08IXaUsZcE1/R2hE03oweevtVc6povg9LiQFuqBpsa/FL+ntAG5gR5iOWX8Im8KIjrPNNQsg7a3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lxIECXK7; arc=fail smtp.client-ip=52.101.66.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lxIECXK7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJhPW9zeayNHVldxSSBT7rouBAMQz4SuJ3cUgNEi0maEkLlgSzqzdLsEx/vUhtry9ecpyDiBZtAo/fk6vScLdX741uNqr8118AXfO77hm16EbaAqEPTe19r/9SaPX/2n8locBXEGh25Mk3d07Eqh8fVr4zdpJTkVCIjXnG+dwhoZLRXdXppauFXfXZss58e4hJ7U7+TRnwOCgzpMUKbfKmto4m2H+6wpzQVUIKd0GVJzlkxFZH9H5cwDNucsLsSFfhr3kwfFGs5C2azzDOg8HBQO++t4qgjTL0hhMGR2fd9kP+6uUIwBc8ysyfDYamVRIagWLX3nWaNA9ZYiPs8fDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAYqLUZAq5AnAetgUBJCm8VJFHzKXSyq7e/dJsh8Chc=;
 b=lGcVn1ik8bfRewpiblpIWPEDvPcIfjx6nVGe/OKt8q9Rk7OVvwGTTIGcO5MId03TTlLrtLPxbyccJ1wRy+vwT1ozfhm4B7zRt0kLQvjVQyRNjTJIGpjaAf2Y2Bea4ZuMIN24ThYlYNykC0Zg/h2O5/xIAjd6yNXvaIM5qZDrm8oGefoaiotIY2mWtTErOCp4BkyR0wnTYhObTJGaN73aFcga0D0KXLNhrv9SCsE8XaoF0kTHHjH+j/zsadNOfLp8w7ZsfAuX2eKzxba6XTPSH2NBu7EMO3YrwqRihLhlr+Sbb2xN/B/a9TjuNNibXUN1tAoCReClX/vlzODliKvSfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAYqLUZAq5AnAetgUBJCm8VJFHzKXSyq7e/dJsh8Chc=;
 b=lxIECXK7zgI/vYbPKZsROsH9U4CbCd1NKzd8vPreayXeA3SK0XcEq37sZylsVASjbKfhjnjHt83twIfCSSFJXv2bjH8z4c3YIgjPrMJRUfAiFu70UyDoYKqj//YmICc+zDfiHYWqG/hKLIIYk4Q1WVU63qT8Mj5qRMiK7UGhTrRSkHH69HYEeYNdbkWAY0uCZdFakR8PolQRPA6rBFsKwJqzyXgjpePKRE+pNlPUWluV5B/Yhq9wLuQX/TQJZMeG1FSEKPO857MYXBoSjjhwMFldUQ2QLTbj3wS5QHuINPnz3Oeri65p422NosiOkJWjgs+9wC1vn/njcsqSEUTUKQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DUZPR04MB9781.eurprd04.prod.outlook.com (2603:10a6:10:4e1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 19:42:14 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 19:42:14 +0000
Date: Wed, 30 Sep 2026 15:42:06 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Slavin Liu <bolin.liu@seu.edu.cn>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, wens@kernel.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dmaengine: sun6i: Fix use-after-free in slave sg LLI
 error cleanup
Message-ID: <ar1mDmkjSgs934sk@lizhi-Precision-Tower-5810>
References: <20260927003951.11210-1-bolin.liu@seu.edu.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927003951.11210-1-bolin.liu@seu.edu.cn>
X-ClientProxiedBy: PH8PR02CA0006.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DUZPR04MB9781:EE_
X-MS-Office365-Filtering-Correlation-Id: 79530305-5359-48a9-fb8d-08df1f2aed56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|7416014|19092799006|1800799024|18002099003|22082099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	vORaZiz95WE3mTwkGRcGO49v+rwHCjzNnBUtQecigGbiBB0SnCnT0ywDNmHFkw0pi/yzG1dF1Tjg1al8oqrFon3Ny1VpWXe7FzLEcXWtMmQbJ9CsUDxPs0dZxcDVLVxd8eP7mjiEzljPZwXxuvkEq0vWbdEJltHI4pgPiACtr7rcMhqdhAMlDk6ZnNni4cVxr0t3B63eBqxwXx3N9yAQ/BV5rCA/KeS9jGdEA2/MV0e2Ao3wUrfc05ij7QHAn2xjg79spNnSEGtnb3ZyOIsmdyT/Om/8hTsheqHyP83LhlZdSm1rKPHVRtK7xKcI2n6HLTpHR0PJgiaFjbCUZIJWnMc6FnERwAKr5LHrYSpUXvbTEf9BvqLTSh5P0BLvQiixioQCF/gEy++mumz9tz1e6ry2BQJxlnOfaK7Yp7h3LtniE0d+OMG2xWtpfVYZ3/QICfMYAON0cfPF0P34dpGooR8+c1PUmwy+onZ5xBeZ05ivhPhKL4RT2khxm3wZUkLpMy38CPmiziWiW2QIO33gUS+K7lIvDUmHXUnH2fp3QPwVAgnA7CH8I+yCx+tGWgoeT3BaroD5hAH6LN//RSK2x59ohHeRRJe7ksheIs/Bx833aNFIwpBrKPWZBJ0ImllZ06t16WXponPG/wen/7pOUEwydU9pB7XVZLZTl9RUe74=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(7416014)(19092799006)(1800799024)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gq0+vDL/UaHiKibfUUDfgLNGhny13c7tsa4uggSyxJ4K+QMGqEBIcra8lHIg?=
 =?us-ascii?Q?kZuWteHxRB/2G9pumITlB3GKElDCRIAncreEuen/FwGvObyN6/JIIPj/pI+z?=
 =?us-ascii?Q?CYYmM7uTFlE0NzDFg7dvsfAICwRwdUezWHY+CNDLza9stg5WWgguW21u6g8i?=
 =?us-ascii?Q?JO/01UYtUY+f7oBjIr2htqNQQo2v7FFI8ztblXkhxVrqbwN7aRHcGmwznBnv?=
 =?us-ascii?Q?mdCJeJSZ0yfozHL0GZ8fnIGK6wRnYWrGGEbhOks7987+/Mknn75SmJmQkNMH?=
 =?us-ascii?Q?3dCuMu6HVNYA4jbTpkZMVgCzq0wvbqAYreS4BMxZuYZUjTs3FXRybs5vWDDA?=
 =?us-ascii?Q?YuzW0cf5LaG1tWf2bKqUxfwn0MvJ0jr0D+c+zqRbw21Bu6w2eoGEvCgGihcA?=
 =?us-ascii?Q?Wm1vmo4mvD6dku//yPl/lI5/DPfpGsyQyKoLI/7kaCNIx/EZl6zllhjKjI6V?=
 =?us-ascii?Q?HgPYg/tZWjloySPXyUfFYNv1opVoCcNjsJZ0TtnH/KkllFYLdGvb9EQmwLAv?=
 =?us-ascii?Q?TcmoUH3ba+Wng3dT9vByYpG9z7vT+ruLH80YeCfhrG3ASG163xpXacwd4kLc?=
 =?us-ascii?Q?i3MLT+P4ducI6ghU5AqUyyPRk0Da2t4oJyAImFOpRkidx972OGJ//lPtjVyb?=
 =?us-ascii?Q?xzCKwse/DYEG1dMM11dCr6T7/H6Bqnf4uY/ZKBIWoIUsS3lkasW9QPcWE/Fr?=
 =?us-ascii?Q?PCqfyOZzts4M3HOhceYBowdnGe1dAlndlIR/1RIZwUfH4uK+ECBQkgyI0AKI?=
 =?us-ascii?Q?Cq7TMYAYieyzD8tf7+oGYNL+nBY+EXUYUPiDIcq5+u4L6LKvwSHlo7wi3vb2?=
 =?us-ascii?Q?ymNRXhcaC8WjftmBxesmTIvaQHEkRlry9Ohgw5Fm/Af19+rP2ledjQMci600?=
 =?us-ascii?Q?FGuAq1/dc8g9VcV7IKbB03kO1t3aClTaKOPQCJ8aC8mCvmIU66L12Cihw49Z?=
 =?us-ascii?Q?LL1kDziVFSr8Cxn9EKSD6y58VIPTXhRSMKDOP41EEKF7MR1+w4TUHyWmBqHG?=
 =?us-ascii?Q?gP/PGac32oMquEizJ+YJ6TcAZag6K2Q+OTt1fBoaVkfPX1kKR/ocKktNluzR?=
 =?us-ascii?Q?D4JIsCT4xBylNWJFZTRuAJpwlfrz36ofd5BHGu7afIzzOyzN6GVbc8jhWlk0?=
 =?us-ascii?Q?otGQmneLfgpFn35nDGz2oUWEgxgP9VujdduIg6YLQfzeRSB8eeaCRRnKnWep?=
 =?us-ascii?Q?kTDdw92gvIIodLhi9KgrFLpkUk1/DNQY06Akd6na6i8BaXK5+Orpq9B9zJ+u?=
 =?us-ascii?Q?Zhnp5rsYe1ACh15Qa3y0j1xRrzg+9Yq2aNJJ3zr06p6JMb5LctHxluUGYoxI?=
 =?us-ascii?Q?PcLZwM5+ZwbBjypQaALCOl9UQQ/sxidUKM0I9v6JnkZktw/tCDL3eIzzj5o3?=
 =?us-ascii?Q?pRZN8W6AgSxgPxpM7su3s10tazC3zqrgKTApcXEDK9tcuzg26LR6BxOezqZh?=
 =?us-ascii?Q?Nqe9Dap7/seKcVIMsHMGglGxzZxmI1Gu+N6kpBVK+VKDE0+BqGYjm6Ls8FU5?=
 =?us-ascii?Q?yB/8V07FeQU4Ogy0OE4QoEaYXhX+JjVVY/3PMlYERAYXIQec+VCFNnUu/zAv?=
 =?us-ascii?Q?95ujDr+g85RWOc1K2it1EjXbOg5cxK7dmj7Nur7YU9oD4299txcvBBNbWudw?=
 =?us-ascii?Q?nuMDV24gxOH554hLkUEowJ272zMuJ5QKIvIxfXsWuQwVVokE1mAJJvsSHKDl?=
 =?us-ascii?Q?yuc+Rr7GuXtUm+QsxiKQwbG82iYV5P0i1shDNXddYnLLsPh2rZLGRd5QglkS?=
 =?us-ascii?Q?+EKh9O91wUhydv/wNreFXpvXFg/2yuSXegyZjWL3f7/l+OIXuyxI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79530305-5359-48a9-fb8d-08df1f2aed56
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 19:42:14.2430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTOMTHBW5lsWchNpawfN6UJjgeAdVaNYQkWJ4n4PLLlev7K3JW18G9/XfoN9+LEs2koaQ2bKp2gnQ0Y8kJugMYVM3OLoAPogQtG98sZeL1+MFoBOSjBoLIIpe/C/TSvQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9781

On Sun, Sep 27, 2026 at 08:39:50AM +0800, Slavin Liu wrote:
> sun6i_dma_prep_slave_sg() chains one pool-allocated LLI per
> scatterlist entry.  When a later dma_pool_alloc() fails (GFP_NOWAIT,
> so it does not wait for reclaim, making failure realistic under memory
> pressure), the err_lli_free path walks the chain to free what was
> built: the loop body hands the current LLI back to the pool with
> dma_pool_free(), and the for-loop increment then reads
> v_lli->p_lli_next and v_lli->v_lli_next from the memory that was just
> freed and may already have been reallocated.
>
> Cache both next fields of the current LLI before freeing it.
>
> Fixes: 4fbd804e009a ("dmaengine: sun6i: Fix memory leaks")
> Assisted-by: LLM
> Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
> ---

similar patch already in next branch

https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git/commit/?id=f472919f4c0650d7fb22bb230eacaada0c6ee951

Frank

>  drivers/dma/sun6i-dma.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index 7704b016aed8..025a43d0298d 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -790,9 +790,14 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
>  	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
>
>  err_lli_free:
> -	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
> -	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
> +	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;) {
> +		dma_addr_t next_p_lli = v_lli->p_lli_next;
> +		struct sun6i_dma_lli *next_v_lli = v_lli->v_lli_next;
> +
>  		dma_pool_free(sdev->pool, v_lli, p_lli);
> +		p_lli = next_p_lli;
> +		v_lli = next_v_lli;
> +	}
>  	kfree(txd);
>  	return NULL;
>  }
> --
> 2.34.1
>
