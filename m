Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794602504;
	b=wFh9uYFu8aN8ndYZpyvnToYb96fPyB1DdUswT9wz+W3cYYS1i84Ahp8fejI26qqZ4zm2
	 6hp/8p8E+qAVGXD23g78yTbZnmro5hYuuQ2urHG1l5B2aTfVyHyApuzsPVK0fOrz60G3E
	 jLckcIQOUbLm59RQUn/Qb3cQw7Qq0bzty9sdk6I9T0eqYpEzHmQXfMEK81vWIdaRfYYWy
	 F5StuJEHK8Cmf8+7ua3sGYWjDxouiJevxuUaZ4mw0h5cg8BTvSMlOFbgO0wd3fCG+JYOy
	 ovdLgZVgOWVyVEirk26pOAXzXRSJg6nEUWuFr09OexhuXxWb2wK0U2gdExzXGoki85Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602504;
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
	bh=Cm8nmr+zJFrszP9uaqJwYNHIE4OfO6n4XC838CbP88I=;
	b=dGuC56NwXIoJj45llamQMrXQT0oGsJU5wJf+XdlbOeII7nFzjExzO+TNAcMROZHDxaEe
	 rcHNeervJjmekEXqI2UOzwztQ4m+a75prIrSM67gkdGW1+uCooKEl4lrKc0kXFiM/9Hmw
	 ULYKGIw3UmJl0/FJ/2XzMkt7CfWFiUv7HyxRuTMmZ24487DgA1/6rx8bTTjmr11q5Z3Zf
	 C+swbkCGCLP5PsjKEzMZibvgxLGcv2kGhm6ibXb8oBhsGOSJfLgyjNChpWFEe71Gm110v
	 ruFIUA+VbzK3rVbB0vKQqtqoI/UcFO4sie7G6A7YP5dOyyrSgaHv/JjOozeHWDUv9Cg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=OaGokjYY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.38
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013038.outbound.protection.outlook.com [52.101.72.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35B0606A32D;
	Fri, 13 Nov 2026 20:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F35B0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=OaGokjYY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c6uSDoKKmjbav2nlPNAtXMn3ZOoZKsrAcJFcRzf1rGwXdouvajDwdbdm7N1ed4kM7XZggiggrpe+jEzeHRKUXrxSPj5y47/XpvUq6TRQOKmhE820DakfT3jJty0fiLdzz6Zxpc5n5wVKD6MEtBWY5wScTbLcp9DaTV1xWYG90uSTvtwcOg+2Y87G14hCL1p4K3nXq2FcYwUWpG8/fceEYQ1cRQKFPNOmX04SO0X9z4u9HlbqZYeIuaqpfCWMoeBMdmf8iPr1OfXs6SFbL71krDDbe6Z/45iKNW1CnvfzytwPPn6ZjfBaL5rHtG2FtmDXn00SVt0+LeozVxiRDo4uYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cm8nmr+zJFrszP9uaqJwYNHIE4OfO6n4XC838CbP88I=;
 b=kJpEPjwnhjm3q53V2e78r3y4ybcMoO3uc+YP4yX/owOXfxlVhTY+wnAKlGkR9O4YFYbPJ4vUNOGIyyHMEbr/dMBtfKQ4mVI/63YrgPU9SnUb8xNwK46dKigY5PQYRAkQqy0YAjueO/X2cdAwgciL/6kRPcE+qJcQREH4feh520YsGCUWdahZFkSPB7GafQibeqM2W5AVhgTGVorn4RdVQUjfxLKouvdNlAmcqJNUh3a21yCjsQ9WBbt8/XZ+L/S+0iKmiXaIQ2u3bjkQTsKf/1ou2bz69VAY+q9q4PD7COmzIopH+3q5JSO45B6gsFrcKS4NPhPsPC1J9q6/JdAE5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cm8nmr+zJFrszP9uaqJwYNHIE4OfO6n4XC838CbP88I=;
 b=OaGokjYYZfolQL6eduyaq0sYV33+JaeBDjg2cAJ6NHnCDIfFYodCo4LJBhPvIJl6Vdy236oAf+puBcLaHaIUnu9ZMpxywAzNSxBP06Vem3pz9U8dWlT738xJ7FJWt5NKpvXptYTyJBNwdVCsm1OwSfa9NJxUk0n+EZrSAA4hEwP9f3gOtOl9Ng4kZ80pLtkLyWMAIMdAzbx1nQGakawmn4I3+SAubozNE9mkUmyMDS9VBJTrs5BtiwyqSCJx6MIz+Ygt4lnc+lkNrIkHaNhMgg93GpDHLOsdDV/6VxHJyKR9HJnWeeGziuocsImzjkrE9/VOSnKFtsu6bpEvmLmjdg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV2PR04MB11637.eurprd04.prod.outlook.com (2603:10a6:150:2ca::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 20:41:41 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 20:41:41 +0000
Date: Fri, 13 Nov 2026 15:41:34 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Jiale Yao <yaojiale02@163.com>
Cc: Linus Walleij <linusw@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Dan Williams <djbw@kernel.org>,
	Srinidh Kasagar <srinidhi.kasagar@stericsson.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] dmaengine: ste_dma40: synchronize tasklet when
 releasing a channel
Message-ID: <avd1_vOb2nvY1qRc@lizhi-Precision-Tower-5810>
References: <20261018040724.534641-1-yaojiale02@163.com>
 <20261018040724.534641-8-yaojiale02@163.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018040724.534641-8-yaojiale02@163.com>
X-ClientProxiedBy: DM6PR06CA0095.namprd06.prod.outlook.com
 (2603:10b6:5:336::28) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV2PR04MB11637:EE_
X-MS-Office365-Filtering-Correlation-Id: aa6ea96a-01f7-4f62-ae9f-08df41c685b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|23010399003|376014|7416014|366016|18002099003|22082099003|6133799003|56012099006|11063799006|5023799004|4143699003|261102123227099003|261021123027099003|261026140227099003|261021135927099003|261026121527099003|261022115727099003|261026135527099003|261021130227099003|261022105027099003|261022075727099003|261028144727099003|261022113327099003|261026130827099003|261021121427099003|261021133027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	7kIa194omfnXpsr0hUxQHPwW5YD18NDnOsk9akmzIlFsIhN5X74g5IYsoKcDDfFuKHAvyhsRIxsdg6pKCnee6I1Q74xanwf5dDw4sKJBVFJLkAp8cjQraVj3mKv2LmX7EQXB1GYJDKWNmAq9Fx2BvHz/42P+6Y85T0rqa9j54YjHnTsF9ghZDUMiVhxSGcux7VuE99Vq5pdUwXLmsT6s1aHytDpaieEcV7a4mnImW0BK6flT1PecOK57rZDlWn0ixLG7Bm94YOTC67g8t/kTBZGr5QMEMwP+xZlKjgdMKul3Y7ZseSjL68tq3t2pXT2pK2RcrgBMX5br8kG1XW4D1t5O2vzFDDPqbSAvEs0Ego97mQkH4KGwkbnZ53m1ed69sQ4h+RpjiZyJk1PwBLA/kxbt7po0Am8XqUvrH1RHFa3lJqmbluUkap0mQzVfbq4EOgXgz67q95Gb39OgrvOxc6+mV0nElUxIo+dGowHRpSDzYVp7DW1RuRID8oqCsopWod7PBNZueFHBlhHloJs4xkvOff3sX11YpP/ofr2RFBXDWFuCfmV8y/qYtloPbH9I64YbKiG9SH2i9pQHb22eO6KqU6G0MoW8kV4TFyhIpB+iNIsDecOE6fvAdD91P7TvJuGY38z8bzt2aknQLA/YMwLt1tZawRAe8Al/EfZ3E54=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(376014)(7416014)(366016)(18002099003)(22082099003)(6133799003)(56012099006)(11063799006)(5023799004)(4143699003)(261102123227099003)(261021123027099003)(261026140227099003)(261021135927099003)(261026121527099003)(261022115727099003)(261026135527099003)(261021130227099003)(261022105027099003)(261022075727099003)(261028144727099003)(261022113327099003)(261026130827099003)(261021121427099003)(261021133027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+5Fnm/PCXU4+io1WHH8QFiTufBpbK2PDTGX1E3qy2VjgPnhB8ogb+qJmyeLo?=
 =?us-ascii?Q?H0y8ntfsP5Hcmju0GCQe8Mr2AnxNCMO0lUeCw72+zDjLKppD8hKLRErZ2PEJ?=
 =?us-ascii?Q?0FFujO3xYX0ibsmXeb3exxP3B41EStt8xH8NRCr7sDxi6iMHJYaZbW+0Fs2W?=
 =?us-ascii?Q?riU+B3E+mJE0scQOlUnkr5S52LhjDLjUDZBJJHf/zR033DzEtwHOIKJLcYhi?=
 =?us-ascii?Q?DAC1o67AmALh3h3KdJPcMWA39X3vRa38VCFlC7cN7QEyZi6ioa8sbl3FXZxj?=
 =?us-ascii?Q?EXBaZmazEvArOikk3dAQteW8ZytliwyPT1xGk1TDdZGidt8GBQH+pC5FO8M7?=
 =?us-ascii?Q?pzQAYnsE2oERnX1cObwES4EvW6R7cA9ixU6j74/uHdj0mvXSRyYRU6EGP90b?=
 =?us-ascii?Q?RXiAVSXCrftY/x6Bc/VyiAxKfk+UR8wSyn11QAaFV0aUNEbQvgEfLjVoNxgn?=
 =?us-ascii?Q?JMZ6LvAli2dIxvDvRNF128WKDn9QNTmZOHuBrbBDvLgwISPkfSfQY/4VBecf?=
 =?us-ascii?Q?iH/QUnaLCUFU8iaPJn3b+cQyByKRf0bhTolGCS6UmIJ/ErNbiKNZyBpw4p2J?=
 =?us-ascii?Q?1Ip22BT4HUts0EYebqqhTqpW6qS1F/ha8E/24DGguLGnsfWgx2xH2cHIJ5AV?=
 =?us-ascii?Q?n1FuBXZVb2LtKhh4IIUariS+RyxrOFDrGnyzIV9IdC2vFzvDd41nst/GdXB1?=
 =?us-ascii?Q?0ruR83KpjOMvkXFxMu0qczZ+4nnXflcnj5QyR1l87gWbpehUQCtTHsLXlOqy?=
 =?us-ascii?Q?8GW6ZCzO8v6Q6MYRWqRidq16u7JmQz1ynDMMwISTuIJFNVCHs8MG0+TWO/4P?=
 =?us-ascii?Q?OPdVEEWo8MlJlPSBFFQNJAHroGaPGvqRTkodmjKSW+HRBVBapurX8Wp9BdTX?=
 =?us-ascii?Q?d/v7zim1jJxRlawjKmoaO7STRlCcrw7EidZ0A8khSxRTZjROW6Yrvua6wff7?=
 =?us-ascii?Q?gL4CTV7OrxrPHzpZgLm5uG41/FHCI51KUZPH1GOpyUhK1MeaMRmERxIH3Pr/?=
 =?us-ascii?Q?y0TzWem++XECImFD1fUPaVAe7PVYvcdkywvL75/+dcCmz2JlA+wOLuNeyeey?=
 =?us-ascii?Q?5wtLMfFi6W/Rlhr81Opj2xGBPR7ETRJHzlI/FDckc8yoB3n0G7XqAvMIgLOg?=
 =?us-ascii?Q?6r0S3fOCcye3JguohgNr/DCq9NGbd5DM6mhVtTai84cas7SS8ZpTVXxvESyH?=
 =?us-ascii?Q?WOqCFTqUXwFai0oKKcQ7Ku9FC7SAiR9WrvN0rinJV3Pl00EBMSu7j/ZsrJYq?=
 =?us-ascii?Q?hAbKXyS4i5+o6duJo0Uppedsm1NNpEGgZukk2gmDW8o/HKg3olKOaw5b9xQW?=
 =?us-ascii?Q?nxnDMuUG5RTM4XssqCNsDMZIt5IvNe3fIRYnNILRwR0cJbiPs1D5jR1sRGgw?=
 =?us-ascii?Q?7Kfdz1ml8nSGLfgSpbY5Cm0j25Hmu/yJ2gJk/FTaNhTSTqg+B461Y2dce1pv?=
 =?us-ascii?Q?nigcxotx8MsEwDebjxaVImPsp60JV6PLQeH28JjuSBf1tQaZk3YWPXQ36fFr?=
 =?us-ascii?Q?+EY7JUKNmfcnEMn3wuelXdya624FUVdZvyyMkocPyVbCaFoUsjyFuMgmOZ2M?=
 =?us-ascii?Q?awQjhW8XExAb6/3Iqj0rpZimfkxvid79Mu9fl578vgWjoY7hfS8usSolRYT/?=
 =?us-ascii?Q?URspy7wlqA6wHb6YYGaPTrOU6NTK3V+L8aO3D84q/6xbGgIpAsErkaOYy5UV?=
 =?us-ascii?Q?m77XDUU5wiGm6tOjKsv8IgBcM1pAAEyciGy0qd6M/oy7JS4fU33oVc2U4ZNe?=
 =?us-ascii?Q?wv4H1rPsxYh+2QOVhLGWuj3GOeiB1d9CDGS3RCW6SmQBa1p5Mn8/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa6ea96a-01f7-4f62-ae9f-08df41c685b3
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 20:41:41.2913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GuGUbFn5fErKz8tr3R0FKcJNVgrai19Ff1fc1qWyppQUWRVurfCWL5VGl7XA03Dt67lxqCtPrF9C4+AEHh1SJ9aow/25EeupZHygUaaTaFM+BbKFwsESCWVp8n3PrEgy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11637

On Sun, Oct 18, 2026 at 12:07:23PM +0800, Jiale Yao wrote:
> DMA completion handling schedules a per-channel tasklet that processes
> completed descriptors and invokes client callbacks. Channel release
> terminates and frees the descriptor state without draining a tasklet
> that was already queued.
>
> After d40_free_dma() removes the channel from the interrupt lookup
> tables, kill the tasklet before returning the channel to the DMAengine
> core.
>
> Fixes: 8d318a50b3d7 ("DMAENGINE: Support for ST-Ericssons DMA40 block v3")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ste_dma40.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 0d9ffa3e2663..647a265590c2 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -2484,6 +2484,8 @@ static void d40_free_chan_resources(struct dma_chan *chan)
>  	if (err)
>  		chan_err(d40c, "Failed to free channel\n");
>  	spin_unlock_irqrestore(&d40c->lock, flags);
> +
> +	tasklet_kill(&d40c->tasklet);
>  }
>
>  static struct dma_async_tx_descriptor *d40_prep_memcpy(struct dma_chan *chan,
> --
> 2.34.1
>
