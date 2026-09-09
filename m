Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011007.outbound.protection.outlook.com [52.101.70.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293E357D218;
	Wed,  9 Sep 2026 15:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788969318; cv=fail; b=ZPEe0hTDxXz8xE5Wn1hBadnHoXdfztT0uDtVU6Ad9z6yyZPLzgIpZbM+ozDkMrMXRNSiBjdwA6aEjP3fI/sPpkbahcaFgnj1iAkogBQMwo3bSrOOxoDNBaC0adl/8fa3aYY8is1DNwVf2WBoswaj+sZM1iyfv9MEqhR4ttX+sj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788969318; c=relaxed/simple;
	bh=Lx+sF3q2vNs/SSV+YGLsDtQlruZDKHc4zC/a3lsx7ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RfKucdooT01sS1ZLUZab9ooB4iOZJ8XSIpMt7cZxr1j6UhgT2POBBYR9aBiAyY5Bf0+peEK2vl8LXbkeiG7JaZQkeo1cxaIYQ0lJx+A8/ORVw/COenOniLnIN0hRZ+3r6FSzRHRwEgvhLh9TZP3wfC6EroL8+1gSW7dENYr3/9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OaEgqSG7; arc=fail smtp.client-ip=52.101.70.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OaEgqSG7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eTIEC0u9fRLI2L6JkFrbjsh3k+qQuY1fYUpVXTUzdgpJxJF0r5T5DpaMJmiss1bboyaIp+jHmLcjrAb9ERXYLF20hZGThiloyfkQoeANITzWYijfn4DYT8V92DxgGU3L6zc3DhOa+mg0EBASExkAqcYPvAHiIA/LfpsE0Gg4lfsCat7YxAE68jZXTxMWzx6vIVS3zaa4Cz0mBRwWHLSV278uyZNpX+Qcy7CRt/gvnqwjSJGnu+mNmQrwCPlprXnpfigEWCYDvQRK9HWo1+FgvgshHOEOfHrv/GhaelbeRmTIIifXbAZ2ZNGlMlp8DEpsPLvHEiPcKJcU02CTHgqTsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nw5W0VPLWzYTmn9DO/zWi76opJmz3B3VIUAF532AmVs=;
 b=Lkmu4MkWvow1trJznRo3+G7VsO5HAtP/RT31Yr354uL6q/56glvoc1x/X6+SJXZpccxgwLZmMfnaQUm0aWBBscEJioTyulauJIvNGhXoK+mtu9dNLK1qL3+Li/oR2zEUIhxT0VEh79AW/sXnZiPWWfJ4n665cnxhBqmdSLZA16aNC78dRdzKIbbCh8LIKeN7VHkZeu6OcpfPWzWsaYGlA168sRk8UlN34s4anM2f/LvBB5W5Iq3HEuRMQ8A9fyRipNKGFC9tJfy5Y3mc1aEEpuxNbG2i6FMSxASFd4mxk+1n+NNFGRXXagwJIMY/11GhxkeXp/MCpgHvZWFYPRhfqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nw5W0VPLWzYTmn9DO/zWi76opJmz3B3VIUAF532AmVs=;
 b=OaEgqSG7YV4kQRlq8fXWEeXM1z9UFjPsG1Y1tNCBlkFVfIrdGbW67VepHYeLB5nMqgcA/SkQGRnpGlEeEgjFc7u3vFd3QxI93Aled0tZuCRfRat29E6jaadEd2GGylBGU+LOXp+VU3BPDwJkggZC7EKIcJAXPNcSf1p11XCWP0nhffkz3dCsVIJr51eZ3V/80OgHhyRUe4qilIUBSh3l+06ZVYhapGIbf7P31sT/toczhmF2RmMkQUWCCZg/bEaznn75waU7YV0uPKc6hl2z/SZhf3uY3SVjTDvClxLbv14YqJZyWl8VTVJGSilXoGgSU8qI+7tX2i0y4yd/S8TIiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMBPR04MB217899.eurprd04.prod.outlook.com (2603:10a6:20b:7dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Wed, 9 Sep
 2026 15:55:14 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 15:55:14 +0000
Date: Wed, 9 Sep 2026 10:55:06 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	"moderated list:MICROCHIP AT91 DMA DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: at_hdmac: use devm_clk_get_enabled()
Message-ID: <aqGBWnp1EJi2HXTJ@SMW015318>
References: <20260908212607.590224-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908212607.590224-1-rosenp@gmail.com>
X-ClientProxiedBy: CYZPR10CA0003.namprd10.prod.outlook.com
 (2603:10b6:930:8a::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMBPR04MB217899:EE_
X-MS-Office365-Filtering-Correlation-Id: 62da3b32-e737-4a25-6b2a-08df0e8abc84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|1800799024|23010399003|366016|11063799006|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	L+fGSsjshSNzIRLSooh+z05figyT43tDQldzkM1Oqzi4gCZnHyOqP7FnD4DiiAltbE4vXp8noX5vWa/X16Q6Q40FNDXEMkGsi1lbXkNX9Nw9PDy14uziKc/3hONnghdyqLIbwfFTXkaidfaI+9vC4UsSw6IOTyTm8FVFwG8MjVnTZKQjhcG/KG4UBh2capn7e+cjgP2EpJmhReoUvgUflfldCbNxfP9pyQG8I6R5Y1F/7rBbrHH0Urou+CCERei1aZNsqJLEMSD9TUpe9NHdW54TmNeASVNRdOhGu6CeBI7E1hmjckcjC9EatOskcEJk77ePKBXHNfUhaKYlXTJ/WxQwVbVdCw4LnsE5tOpj+kdET2w252Z5STzRjnRAoLrnrJ6jKANt1Ta4neiuu+3N4B61pqGFgyRNS7a4o312Ipi36YoJP0hq/FetiL0q10Rn9t6HwCDm/lTcaF5sehoufrJE1tmzq1iJTJNb9mX+EmMGLYqa0Hb5pImy1NaozNTGdxc62g8XWZjBWj3+EKsK9FsiqfWbyA/FkvCOF4LnPpeWGfNBiHxI+yFFh5qbJK4UctMmUMg22DZYzx8rss8eD5/mD7mvzqkAO5aFYvudrm1HiDdZSpqLOGil+R5tBF6P/IPXkQvmEg7Axqd+J+/6o8LCuH9QXEueb7RarOf1U+s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(23010399003)(366016)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kfVDAza8EUY03+dBdzt2WSy/XyssmH25CmVu6BOwrGnMej6OyGE0Gaj6yOMr?=
 =?us-ascii?Q?ql+zXfo0IqsXvW8E85FhK8tpHgpLe/0BpdrPIWpkPa95tKPvEDa+iXeYTGIW?=
 =?us-ascii?Q?QGX5TJyroogERuF7eO1xGnhMGCmPY1OADuvAOAx27m1woIyU4T39P/5abCcH?=
 =?us-ascii?Q?PqAFI7R62LF0bBkJ5cvk8DB7ulenN0X8vPHsXg6K/rtjF75jpkPc5dVC0uGM?=
 =?us-ascii?Q?fL9Y/mv+g7skjt+S5NNDSD2pav733VM3gBk4g9PS2aA6K04BMYWypKmQFsuj?=
 =?us-ascii?Q?sccfVwfHJnq4jHYU5UQXtSLmvnmzchOT4g5nkwgw4RyetMCBkHoe8Smu2+sU?=
 =?us-ascii?Q?pyd0wyygC8oJsYeBiZCSGjLyGCGaKOnaExpZrkyZq8ssWTWMTobd6n5Rb6CQ?=
 =?us-ascii?Q?SrhvugpPhVoN5sGB4UvqYTfQ6sXY7xeFvo+EQh6xT5uPQNH2oe/WLnmMx5vB?=
 =?us-ascii?Q?3OzWrJuXe4etKY5UpaFTbB9zim56x00uUA0aNzyhJb0o0rPVN6uw4vtlpZnL?=
 =?us-ascii?Q?VW67S9KxKGaKgsGlTQl4c4a6QMeIoSbzrdTb3p2ohTWN3ldjUV8P4kxqGeMh?=
 =?us-ascii?Q?eMyPpXiEE52xcNVpq6Ij2AoRsZQFeOmqRJJ+ljtGwLfYtBKx7RLmaYiIRLcL?=
 =?us-ascii?Q?ScuxvBu4HvD9QjQt+iP0hcTOXiGDG8YGbTfrazPzIJKuiCNUUReYV6NWZWAT?=
 =?us-ascii?Q?XQ4rnEx2+xZurTDFwWUkkgghES//HQTURhjezp2GbTC09sY+LS0lWQc0C6Dh?=
 =?us-ascii?Q?rIoXqHM2Bf+8Iqq61FWGVuHhXZXFAOH32donHRGENuwKeOIuzyw9C40eUlw1?=
 =?us-ascii?Q?dj5QNpcOEp/HhX04DdgLSobw1izFT3iPqUZ6JL8/iYpNv3yDHY6H7RIvMzwS?=
 =?us-ascii?Q?MEUe4YvNAQz3Y147DBjw1yz3+Zu+gMFH9SmzVlJT60KvVZA/Z28VHJ0rVwWM?=
 =?us-ascii?Q?Tf3g5F458LkWrcel0QZDY7vcM1J5FcCgjp17Exs+bsGVG9BWDJcqLu6elYFY?=
 =?us-ascii?Q?FjCNuJL4Ff6+O3Ln6cPFeT49Jtmwvp5R4kXLelHz+7CV7egpZz0GA9f4ZIfU?=
 =?us-ascii?Q?lPMUiFU70hjOlaQ3E+pmpTcp1P+grp9lDkL0p7qO/YeebQ9ruQWVfv2DtX1k?=
 =?us-ascii?Q?Zzb4UQPMpsclEpu9tETUTY4D90foGP65jXTYVp5Mu5YUaizh0GkJW2Uo3JYx?=
 =?us-ascii?Q?ck6ZJRVNDBX5DEbubniYfauHLv7ohqtDyKXDc5F4L5FVKCShYyNcJn/cV06N?=
 =?us-ascii?Q?PRnnAZEU/1iraj3X4982oN8ESUy3VO62pmhZt/Asdz2N6BBR4jLfQ9a2RP0S?=
 =?us-ascii?Q?14hi3OsR0ac8P+u7ievaV5xG/VZRPhB6zbqJ0IYFonGX95WmlCyMBGVPmyYm?=
 =?us-ascii?Q?TUGVu532ftTpqI33wr8J+U/4//waeM77pXaA1au7eMheTenubZuzwUM/IEnx?=
 =?us-ascii?Q?65nQd0BMEm2XWFp9gYV6WgKlcnXmmwvHy2ZpNSFmlXyCdxJ8mL/vqdbwgqr7?=
 =?us-ascii?Q?QuYf6SDRKduHJdKE5RXX6HzQ9P5g7YPhd9u91OxmdqlTiEN0W8KY3azxMmzL?=
 =?us-ascii?Q?CJIHuD/P56ACcL2DiUy25qZe2kyYE22ql+Fh6aexpOez40aQ/+w73hILCFuq?=
 =?us-ascii?Q?AelWu9LM1rTnlY88flQc70FnIMtXa8FLQ6odfLqv7pc1PSHRL7UxLFKFqvah?=
 =?us-ascii?Q?n1Ipq4gtxmBnsBmkrc2HmsBSrdrItS3Rc6xPz1wIxxBW6SCnf6eykvuGmP1Y?=
 =?us-ascii?Q?uCF9GConeTatnOkln/v/j102XnByY8caDI7iGI8+97X/9aEOAy/u?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62da3b32-e737-4a25-6b2a-08df0e8abc84
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 15:55:14.3682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T+VAkhdAmAkd5M61j2xICGed6WF9o/1aDBK1wIubVWkUHisUlA2XRGDDKKGnzQM4GUDgUUR12fucej9lOmpn3xBMdEa9GErvyELfLp7HekhejYzJS7aeaamISKen1beu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB217899

On Tue, Sep 08, 2026 at 02:26:07PM -0700, Rosen Penev wrote:
> Replace the devm_clk_get() + clk_prepare_enable() pair with
> devm_clk_get_enabled(), which handles enable/disable and the
> unprepare on driver detach automatically.  This lets us drop the
> err_irq cleanup label and the clk_disable_unprepare() calls in
> probe error paths and at_dma_remove().
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/at_hdmac.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
> index f4d0c72787d1..cae26ea890fa 100644
> --- a/drivers/dma/at_hdmac.c
> +++ b/drivers/dma/at_hdmac.c
> @@ -1994,20 +1994,16 @@ static int __init at_dma_probe(struct platform_device *pdev)
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
>  	err = request_irq(irq, at_dma_interrupt, 0, "at_hdmac", atdma);
>  	if (err)
> -		goto err_irq;
> +		return err;
>
>  	platform_set_drvdata(pdev, atdma);
>
> @@ -2126,8 +2122,6 @@ static int __init at_dma_probe(struct platform_device *pdev)
>  	dma_pool_destroy(atdma->lli_pool);
>  err_desc_pool_create:
>  	free_irq(irq, atdma);
> -err_irq:
> -	clk_disable_unprepare(atdma->clk);
>  	return err;
>  }
>
> @@ -2145,8 +2139,6 @@ static void at_dma_remove(struct platform_device *pdev)
>  	at_dma_cleanup_channels(atdma);
>  	dma_pool_destroy(atdma->memset_pool);
>  	dma_pool_destroy(atdma->lli_pool);
> -
> -	clk_disable_unprepare(atdma->clk);
>  }
>
>  static void at_dma_shutdown(struct platform_device *pdev)
> --
> 2.55.0
>
