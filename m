Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792601734;
	b=CiRSYrKJfz1xG841r7HfLPTLaq7rA3atwy0Zc2OT1IxuDNrDNp3ImG2GhmThU0tHv1fr
	 /dXmTl/n3Hs3GzLGO1JNq+tLxSqBPm9f03cVA16mz6WQ5ZKuDyarIQFKq6ZWssOlCtGTB
	 ezOOxGwIlq66NqGFoKHdl5BgDA6O4B78jnBcbnUy2e1eiqmv7pkKh6cAOrVLR6c7r6ZPR
	 PbyzDQafQvtKrbo8R6+ZQzJ3thV5Npai8CLcP9nZGTjVMmy54jQgzf3e4xviNZQX/iW1C
	 /pjmZWXLYFDZD08+GlrH+QbZ4nUkkz9HAMUNbi/a67UYrQXIWwCilaQLRWzK8qHvruQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601734;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=QD72+jzGPX/UIBcVnaK/j62YL+TlYbfOxttbbm4ZFSw=;
	b=F4raqxdHz5fN6p5oCrOAvNKUTuXMUCS4Q+Uk6/GpmNu4GgfeWcdVhwV0f7a7GNyqcA7k
	 EbHFVMywrJKYPZjsylL49awWHYvKyqhKGo/0yTL5J0OHFfFZmKQtzL78/OCnYTn8I/K2G
	 yVGEcBRVChZ0yRizcqhcGh4oBW1FBlSnzVodfCXv/mp26SRvhzpmmBviqo33hmZnHP+fx
	 UQK4tsO2P9rbXjg8LZvoHQcjnJ0NdSmtni9ajkH2SPKof3EN5h6F1HAvGdK+I60Qwney4
	 cShQA2mWzsva75rruMxCxgDYCV04IM5nCCLW5H4sx84rVA09HJ51m2L2q7kQ/35/o0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=iLZUnBKJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.45
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013045.outbound.protection.outlook.com [40.107.159.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE9A606A31A;
	Wed, 21 Oct 2026 16:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDE9A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=iLZUnBKJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oangS+XOyX73kkUXmwjwvqUVtouCSqRc6kvkK6YbcVGEq74rcL4Z/6qTOzNkdHioxMphkBT1mzVsw2QbQPJpbb6mf+JJbkap/FYJ9HI5PPyoylL8jMubNBxQ14pKL1cezN0zZEnW4pgD+WFPJXxGMsJrpzmqSGHOLfcHgSE++D/+Qdzq0AZaN/B1u1G4t4qvQyNAPFqcti5EDnXYUURwKyheSpExQeTJInSt0lNoK1DCGUb0hg4funXWh+CrzmpLtAUJxSnct9cFxCfkbFU0URtcd87xM8BVNN9oIOD4rkUEIr1R4TziOEhH5GGlDQEDp9uoZe24XayybVMA5+MrUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QD72+jzGPX/UIBcVnaK/j62YL+TlYbfOxttbbm4ZFSw=;
 b=PnJnuRFc86z9K6dsMBSCR4iozZLi5+xgAETw7g8DXApgakuZ+eIBZ03Nc/tpNgsly8whVzlyDlRZiddUvQnciHC97AT+X/VLlzLI7BfPlS2cZi76quIJ/QgQCQmDFXORvMJLlniTlVspew5BPGzEtsW415rkR01fsE0QL3n0biyDp676DluhWNnhZcC7/UNH1v1kmK/s0Ow1/796bNzwQuf4NrrIyubYG/h/KXAE9ax8b6dhS7nLyTjmh34A9DpqvFz8uJALhS4dhQLX0eANKSmbhPFB0lGCsesfSkHHEXvo0v0EXxK7GV2WqjwxwqYL+xIydYyJn6OC7mF8yZUlrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QD72+jzGPX/UIBcVnaK/j62YL+TlYbfOxttbbm4ZFSw=;
 b=iLZUnBKJKuAxd3Dq+7OwDJLZeD8u/rZwafAT6Vida5E7V/xfS4LB3UPyfZWLPnWu88aZtvQBqjFpdvdmosJgGx8YZCAFOnn/TY1Nbn7pYuPlwVlSQown4//xi4pYZuvHWz5B9BrCVHi0+HNYeSk6RY/55mnVVeQhVRKeXLDZQNULAj3STBB8HnQAQpqAwnnAHCW72sC+rDma7ak1QjSFm3/PuUDYN/u1xB3QJeGRa4CAzmbEG2Ht876gaaZd3BGx2VVoriDMeYvn0iZ/E3Xkb2D2g0s/hBow+JnwQiIqTbXz6IpU7KpS66DaQVcTCohmbstxGusefzLF4zAKYh4YMQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVXPR04MB10072.eurprd04.prod.outlook.com (2603:10a6:150:117::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 16:55:30 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 16:55:29 +0000
Date: Wed, 21 Oct 2026 12:55:21 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Ruizhe Zhou <zhouruizhe@resnics.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Frank Li <Frank.Li@kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] dmaengine: sprd: Remove obsolete 32-bit DMA mask
 fallback
Message-ID: <atjueZj8B2M6FXxH@lizhi-Precision-Tower-5810>
References: <20260903115441.912500-1-zhouruizhe@resnics.com>
 <20260903115441.912500-4-zhouruizhe@resnics.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903115441.912500-4-zhouruizhe@resnics.com>
X-ClientProxiedBy: PH8PR21CA0024.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::23) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVXPR04MB10072:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dbfa3ca-913b-4cb9-5051-08df2f941d07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|19092799006|23010399003|1800799024|261009223027099003|10067099003|56012099006|261021123027099002|6133799003|22082099003|18002099003|261021121427099002|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	6ZIfSzYZceixP0WOMdv/Wt2Ef+RENXQhoNE3LeSo3+f8gJ/2+10CCI4YyU/Em38NmF5jKKUbzjctkBC4b2kFtucSzKz8Gvzbx1FjjmcfChp0z5yYlG0jA9avdypwgRhB2yI2WRE84JE/Jk/i9kqTDT2LdfjdDhEZFcvP4dbwCl5YZXe+3TCdiaOZ9YaE6VbqZgMk0+wMs+rhWDz8cc6haxmFwpPV9ilX6qlpdz4ySquoomHJoy0O5gnWgJPMmxIqxdKXx/SzkhvI3qlxt/4PQVHKheN4ZL77R1d/FMlbNzMSjAilXNTfJL0lSHvM1jtrGqdTZaENheOabKKAOTsAEg3RyPbE9JAWfi8vZN/Gw8rWv5I1w/jvp4ay4ETMJYiPAJD1VzwZ+UFrMdrxJY2N8jbtAISHbe4lbN6FgOU+90Dxqrb6KX/8K6cNte+WD1QUCgP70BU1xncptyjHIFhMcx6n4ek1csCmMu06X5y5+kPD7EELaY61YrSXw+0jne6mZKpTms9BnyGrldxLEeRsxkuLhoDytRxeWM9M2llkAPcA9TCIXMkihBFv38bjUDpaqQBZslTmZb4bWo03HkKd6Ys6EguWpG9uqT0uqBYJ0FA0hSDoJKWnVjImuFp83OLr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(23010399003)(1800799024)(261009223027099003)(10067099003)(56012099006)(261021123027099002)(6133799003)(22082099003)(18002099003)(261021121427099002)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0A3Y5Qwth+ZAVVdHIDR+5348d/+ze6MHFpBV+W9gAvDfuSeNeAvu/UmUPRUw?=
 =?us-ascii?Q?xpTR4VgtsSUMaRU8rgSiZUEnU252gXBM5N518XzdUBtMubxcLWh5T/WO4Bh1?=
 =?us-ascii?Q?CtPYuKNHuyydekPRiE8eEqXKJ6Z5AgD6nNIQLy/4M4aJSYcpjoel/XVV/KAS?=
 =?us-ascii?Q?opy0qI+i0kA8lIqeNtLqqPr7ylLZhA1vyxDN3DWFPjWxriSs3YvUpTzaCvqr?=
 =?us-ascii?Q?CNzuIXR25R0ov8L1fEf4MMVktOrHykdkNOFyPfP+mbtnF+HkeuG8CEQt3Y7M?=
 =?us-ascii?Q?3wxqA07j3Vb0SRaCvkcF9nwxkW+nMgceYrklbzV+9ut/m5cx+GFPGdoEbgLw?=
 =?us-ascii?Q?n/xi5vuEEXXWXemJwhxxe+JVHLKgKFEtDkYXCZUU8oJZEb8896sJZ5fOhUje?=
 =?us-ascii?Q?sCExp7GA6WQS5bG0/jYS4ZOyUDzAGrvD97ryGajPu83z88DIKeSksLH8pDjD?=
 =?us-ascii?Q?OLb0jMRWDPeVgUK+0+YQLYWR9moBgyH1RozccnpFbAfEm8iOTwQ4q8J/WXk/?=
 =?us-ascii?Q?GWQfd2BmbYSooveOlnRxx2ZscvP4GqwRo6TNchTE/B66W7i9ZZnPVg/dO2h5?=
 =?us-ascii?Q?2QACUmKgDIgeg28Dn0tnJ9Jjhz30E2pW+13rQ1bztxv5DybE1Uh2Xa6ucGNe?=
 =?us-ascii?Q?FA6OARD3ZNDwnIanV8/rp/ESFCF0VeWbAHQLRfL2XIStdehXj2GTp6lnS/+e?=
 =?us-ascii?Q?gp3syBTK0Atjh1zRLaFPKeIZut+JDehonSHqVc1WG6htfKunfNOS8py/c9hw?=
 =?us-ascii?Q?mavRzIK1FlvNNcGt/cVxc0O0uvxJR2VJLk25Rca9Zndjp2wHMvSoDg6p0C9G?=
 =?us-ascii?Q?nz9AQTzJ8Xfafkrsei/b4/M1niXi5+3bPffKjB6/DQURcAhufDdt29/b5y6B?=
 =?us-ascii?Q?Zu8HUBiuGR+Dx9g4PjzBVEwcdyRDrntkCQ3BvBBrSL1GrvUMQrS62chQh8ZX?=
 =?us-ascii?Q?Jr3VoOPaRdUTMgCIQUs5/ZcvlJ3plKyI850ol/PMJm3i9ViBpr9LGtIUWhH/?=
 =?us-ascii?Q?vDfKTePFIX0VbA6GxUQiToZjIvNVWsCuDKvReG1aC6NyW+S4pcCgxH8MlYgY?=
 =?us-ascii?Q?f9z/5om0rjms4RMYpimYAE5yUh7xAlqO5XghSAbsMab6pZlVwn13SPkvDWe2?=
 =?us-ascii?Q?wEMpL9rTAqWLR5Z1ijNnEcDQaXc2GEpMepTwAG50HNnTyQUZ7Rxv+1NXjKke?=
 =?us-ascii?Q?MdyE8/uTACg9UgzI3d7cDA2m7sjpcWg0hc8dyxsrMpFst852GJbz3UpaI0QP?=
 =?us-ascii?Q?mRbxrrfpkXzLC/VcIRytGi31yDWl2Qj6j+ohjoYtO5M3UNdUXktbriJ03zUW?=
 =?us-ascii?Q?MJsjRZSLL8D26i+c/LVjQ82mrkFPnyGUGtarGtSE/fNtXWhm8oi1t4wbYnPx?=
 =?us-ascii?Q?B9kFqADaw7mfER8VNGnOmFW7akMpOIQyjSoBkBn7rwdLuPtxUzybkxdoDe4D?=
 =?us-ascii?Q?bo9CwEX8ZnxPAI5730EAM/QEJI4exAJ16r+K31MkCjMX6i/0oXW0PufShq0w?=
 =?us-ascii?Q?Itbs/nLf89uAHiStAv2wTVL0OCCgbyBI7hPmlLq1ghlwJamA53dsD/gT2pKe?=
 =?us-ascii?Q?qhC58E2kjV/cj89vquM5IUe1zAT6dB1sVnisCg75dmcpqG4XVuMrJGeCnbjk?=
 =?us-ascii?Q?Q5Wlx6CP0wD0kywssTrtRYXighAQQxie5D9w0TdeaVOeTaxFcb54uM/dzuU4?=
 =?us-ascii?Q?D85AM+R/+qLV9yP0DDpPlK2GeUFT/yBwTYFNx7sgUGn6Zrt9649C4SBg4PEk?=
 =?us-ascii?Q?1yoyks1vDK2kZe3YEfn30jmJCVGLdqZm+19KkjTNMQyDH665Rbf4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dbfa3ca-913b-4cb9-5051-08df2f941d07
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 16:55:29.9245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BZZqN0KGFWVkF0LYPu/uEP/X9XmzmREfqe/08cbC7UfrXhayyghVNlcMxkvej+YmhoDaH43USls9EH+ipAX895y+mVR/K4gw3EI2X9jPuhkgNwDm+Dq1Urg4gcRXUQXc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10072

On Thu, Sep 03, 2026 at 07:54:41PM +0800, Ruizhe Zhou wrote:
> The DMA API guarantees support for masks of 32 bits or wider and
> explicitly identifies retrying a 32-bit mask after a wider request as
> incorrect:
> https://docs.kernel.org/core-api/dma-api-howto.html#dma-addressing-capabilities
>
> Remove the obsolete fallback while retaining the error check so that a
> genuine DMA setup failure is still reported and aborts initialization.
>
> Signed-off-by: Ruizhe Zhou <zhouruizhe@resnics.com>
> ---

Eventhough needn't check when 36bit, but remove fallback is correct.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/sprd-dma.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
> index 087fea3af2e4..b9f705dd80e5 100644
> --- a/drivers/dma/sprd-dma.c
> +++ b/drivers/dma/sprd-dma.c
> @@ -1117,11 +1117,8 @@ static int sprd_dma_probe(struct platform_device *pdev)
>
>  	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(36));
>  	if (ret) {
> -		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> -		if (ret) {
> -			dev_err(&pdev->dev, "unable to set coherent mask to 32\n");
> -			return ret;
> -		}
> +		dev_err(&pdev->dev, "unable to set 36-bit DMA mask\n");
> +		return ret;
>  	}
>
>  	/* Parse new and deprecated dma-channels properties */
> --
> 2.27.0
>
