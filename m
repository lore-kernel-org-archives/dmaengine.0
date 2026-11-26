Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795709032;
	b=x5BkMPB5EoFBaC13vCvK8rcb48oXq70OwLvbzFFPfZyTpZ/2EY528evZ+QYrirXImH7R
	 FfFCwI7YS9+sM5wt6oYDDIkuGSewz2SU7B+jxXkMbjv0zkK2aaG8rPFOgPyMKAGnN/L/1
	 nN54CeYOWMvJrUEy1Cpeo01Y8FQl6XP2NrwKnFXxSI/hnxHlDn+FjizTKAjRtxtUn4mxa
	 atdF5MzNad2NBTDOu6hbQQbYBhP3IYz5RIIDlqhSlZS/7wQEJLZ9pOptNtPprHHysjta7
	 TBa32uw5wAYtjt0kjTR10CGmO5/nxJUWogjQicEYGOUPYumBEaUcGNP75ufYytwXSHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709032;
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
	bh=TdXwO4RKPOhdubP8pg6bfFbOY606V1W7/iGyevDJuJE=;
	b=JeYkRm2ywg2nZWPW7Xwk7f7elygc5z74i+bsFo0eb8+I6FvKlnPpPdEHRo1WusHZT5AE
	 2nX9tEjiAi8Ar8IvsleKfZIkvWEIFRfgoeAR7FUaww5NXx/74dnZln6xlkSvo/3m/uJWk
	 xx84VuE9E+1xrBUeE2132zyyh1cUZ0zgp+vof6jMBlNktxD5J63CV6PgxjoI5bheuoHmY
	 LIfwpicY/FfF5Y7djQ2eSGiTRbKzBfX9jZHGqdKSLKI4hxjnrt6K0ERDULtmbbn0WfRXM
	 Wy0CyA3tUTRDZoJwOZtn+NcZ1TiDY1DS0hTeONOfnzlLVUqbTFaD+IAsn74lL+XTzDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=cQuKl8bz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.32
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013032.outbound.protection.outlook.com [52.101.72.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D448606A31C
	for <dmaengine@vger.kernel.org>; Thu, 26 Nov 2026 16:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D448606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=cQuKl8bz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=js6vkwZU1q6Nsd1nRWOJ0FNV8m1Ii0OIps5D/jdZE0gB88WqfoO8Yav2S6P3kTQWhx4ZZJg+kjriplOQewfmOalEZmgJtcPM53DSkxBcAl6adRlTDS1NIA4pfysvo3zP447DxQTmYU7pBUS3v6trK3Y2rSqfE9rbTVIqkh1ERHnjjvYvC1MHixq6EsDAqhu2bOdKYvWu9p0jKLViWutTXUlaITJ9yIryX4fH3LjmaGKL0PD0zzc84Bzq+OrKGb8R+lHlYRiv1pYDFOSog7aIqZG3YI+KoLmtghXvrHWONZTAALv2bPpQh42AZGjpV4kOSyRmK7pJJVu5f2Bb94VR1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdXwO4RKPOhdubP8pg6bfFbOY606V1W7/iGyevDJuJE=;
 b=O87VPRJ8zrhIO4KrXWCx+lh3XNXPpi3tnCYHE1VIEpmocZ+tFpPED89+tBahdjt4py+DQTZoRF2Vde81GRB5rSsUr5gt61mcZCrBDngzgoZZ0O586KsYxksYZMd82lRvtB+SSHb0ZpZPnHhvBybmFgI1zSlEFRrqa4r2xQFSfvuLeqlSCvu/QFDWLf7UEBfB1QRTvbAb/9t/T6jD1ySRtFKgG+8Fkcx5/JdEtutK1UmtFHBxzDfJObXVwVIg/DLagKrA/Q5PlR63kmPr5RABBFSVLSZCDcvKK/UkZ3IsTdPlFFENR76oUci8oOtYse6n3yCp09aUqh4iP8UM+4A3Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdXwO4RKPOhdubP8pg6bfFbOY606V1W7/iGyevDJuJE=;
 b=cQuKl8bzJTwWutrOKmzxm4sISglF7sYsObp+nL8Jctir3tXCxzke8CE/rr6On7a3JDUbOuZk8ed1kIcpxAjLqtPZJCdX36i+r6hXsGS3bYZKBLBRrYaaAabnTUm1ArKXvZhyGh4tzQXJLZyFv94kSX0vRHEZoeMeilEX8qZjAqUpeDDn9TwqKJfy0WULI19k8gBerxpZdCtyco9WOLhUIMF9wcpSWMZejlz3ugQdROLMPp+wgvl1ZXvR5PEMYq58INrjsN1yEv+hTV85LKpPnTUlPdyhfGEVbzlKR2xvtCYf8ZUvpuPWwAbVZAUHnTy7CrqZ46sf8T4ciR1ToWx27A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DBAPR04MB7367.eurprd04.prod.outlook.com (2603:10a6:10:1aa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 26 Nov
 2026 16:03:48 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 16:03:47 +0000
Date: Thu, 26 Nov 2026 10:03:38 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Tian Xuechen <202300460064@mail.sdu.edu.cn>
Cc: vkoul@kernel.org, vz@mleia.com, piotr.wojtaszczyk@timesys.com,
	manabian@gmail.com, Frank.Li@kernel.org, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, liguangshuo@mail.sdu.edu.cn
Subject: Re: [PATCH 1/2] dmaengine: lpc18xx-dmamux: Unregister the DMA router
 on removal
Message-ID: <awhYWhhDb1eQYe72@SMW015318>
References: <20261126132806.4091183-1-202300460064@mail.sdu.edu.cn>
 <20261126132806.4091183-2-202300460064@mail.sdu.edu.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126132806.4091183-2-202300460064@mail.sdu.edu.cn>
X-ClientProxiedBy: CPBP307CA0024.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:2::10) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DBAPR04MB7367:EE_
X-MS-Office365-Filtering-Correlation-Id: 127d432f-1990-4ad3-fab9-08df4bd6dacd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|23010399003|1800799024|261009223027099003|11063799006|261026121527099003|56012099006|4143699003|261102123227099003|261026140227099003|261022105027099003|261028144727099003|261022075727099003|261021121427099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	eCj9s+s5hGEtVk/sy2xmjsTMrMfLG/6An/JxoVs6jwP4TtDnFRJmeLsbg60y4t5Oy0k2x/v8VpE22sl0zr4N4oOVMXWbQuNjHosyJRRnrDyVZIoCSWOtDsQjz1cSPQU86gNT8xPxjvFhMR/ObWXfBRN3dPFdd2YfJ5iL/1uB9MKVH1PNv0Zd1oIRp/nokVZ5FCGZgRyEDvW14uvwCwSVvWTZrUtAtY+V6+HD47TlVksSJ2IdYxHLS6b9q/jHXEqcekH8izobPAnZaGVVSmIlrSVwUWdt8fuC3ZmuQNxeRDWxKy6peorrhg4j/83hd4LKj+TIr9AmKA4rgE6KMlYKBq9+uIn1lsnBoYZC3bwRY0A4kuOHvZY0WniflEw28rw5nBmKHWed5gOcoo0scqyKYf0ljHLDm62bJFliyi65WXgxRNUrayUr+jXW2RwRulkVYsEw4+XbYgyhZ43QwcfYDyIG5O+W0tKvBTeymYQ4B8G/7UCCexsVK0glGtps1yqA/K//VP7vjPb049UjAFnynBchulBubGGk/dTf7zyGfuN7eMgRWt7pnJ7xdDgTRUmQefslJDypuy9qQYJdpoaF9UE7m7eyXO7bVSqwk9ZZXl1Jp+e50HBnxPc44/Kyi2pXSPbr7SxfLwFnb4rZp7CzIKOoay3+2GH3v6Y6XmyQIGo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(23010399003)(1800799024)(261009223027099003)(11063799006)(261026121527099003)(56012099006)(4143699003)(261102123227099003)(261026140227099003)(261022105027099003)(261028144727099003)(261022075727099003)(261021121427099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8F/LDONsrZgSYsSB7Gm+Dbz38rCoT93XauIxATLkHN51/GDmNSM/KU/97GAH?=
 =?us-ascii?Q?9iIacCxZVPLzZ23R6SJ/dTQrmyZmujjcJazUq+X8efRQ453MrU6jJpnN7H+r?=
 =?us-ascii?Q?4hKm5ZKIh20IiCaTiAHcwiIrKwN9Awza9pxOICDvZM9ZyBubU16uArCZg0nL?=
 =?us-ascii?Q?OQL0nGG2JGI+dwslN98xVAoUQRjQ8ddZmMNX4MZBbZlkHsEbNmnxl+vxLJwT?=
 =?us-ascii?Q?BmfYBLXb+5WRRARn7eVmAzep8/US2CfkA1HXa0IM9Gz37I7RT5nDqg+TCxwn?=
 =?us-ascii?Q?sNoZxAFE1CtfZOw0hWSmNrYkQDcLQ3m2Gwzm96AFceY9Ho9p6PbZOWnDTw2C?=
 =?us-ascii?Q?hnmWuwBRHn0UF3KgJ5tLMkPLf80Hp9KOsTjApO0bhStbu1RZrarKR7WZpU05?=
 =?us-ascii?Q?7oLsrag6jTLlt8ij+PcdSXqm13z/Ka6l/fHjYeyVwa+MJW0OhQxTWqb4Z1RD?=
 =?us-ascii?Q?dh8pbpJzzZfwVUrm1iLNebaGwuTTkLjwFSIxdT43GOSy2hABBvv2jOrLc8rC?=
 =?us-ascii?Q?N4UMfv5qKMvmWpv1pmlNVJNt7HuHZXZgaba1eFi0WAMpM79nPMZfSLfSJEyX?=
 =?us-ascii?Q?Uf9nbY8dJirikxvMTeOz98pFiYDs+z/9e3jyaz2Lx6jCTEImivmNQocpAP9P?=
 =?us-ascii?Q?rwFFmIJ7fdt8HKIgIzBqnOERZ9gEZOnr/wdB8FLa7vqNKv7NE/xGmGi2D+24?=
 =?us-ascii?Q?xHejbsKXVv/0XXIAcZea5GE1PIc70//mVsNPliKqWxZmn/FPmw6IVjK0ZwjX?=
 =?us-ascii?Q?M+K7vW45cDPLHzTwPrhmA6jMZhVrKHlhNPwPagADklUYHdqh+CvK4N8WJ2V8?=
 =?us-ascii?Q?FsqUqW0TI4Mv3gS+NuzSZAauNz4YqkhOAFtPe7cHP9kh9DSpzB0z0w/5dLw0?=
 =?us-ascii?Q?QE25bsdV/VgeDO0JfVyTwdkwz/fjuUsLSXgHQ+yEBkCUwg+NwTexvRCMp9R6?=
 =?us-ascii?Q?VOCGs1DmxgN0hw85cX5cHMEDaa80knabEUABlqp0Gmqyk82UbTFg+HbAffSJ?=
 =?us-ascii?Q?dZnmX0k9adkYplAmhdkRwzDV4X+zXIa7ZpPEFvfwc9f4+lTt5Q9fgIrRQR4u?=
 =?us-ascii?Q?dlKWz4Y+t1HWp7yXYOxNTpbXr2c3d57FXW0tNJX7qOD8DZgAEPBRoldRNFaE?=
 =?us-ascii?Q?o7RQbmaahNQ5tohbFLnHjuXJ+n8q8+X03zvuGLnlZ1KeE3EuiFOnJelC+ijl?=
 =?us-ascii?Q?OoGISjm5h/AyyIpLh2vuocaX0AW3F/EaHXfgeGCYiYcVAuEZDa4ivvWj/Rt9?=
 =?us-ascii?Q?hdXl9WhFTiYyeIxh3+vmrRD3ezY9SxeSmTUYM0BePc3Cvd52odVlNmB9UjDd?=
 =?us-ascii?Q?ZB/6KV91Og4n7JOcRrsa2xbYen/H0qRVKse4Sze9H55Bu2PdFV3hWhc3AGk3?=
 =?us-ascii?Q?00cUFT+7YHirzAArU0zP0Htqf3GNNXpIBqDkrI6ESlXrox+ypZodTn0i4Yed?=
 =?us-ascii?Q?1KMnlDTxOaZseh7KIcgsjXNpM79ddtwrMXXx4Oy8ONUSVtKF6ieJd43qhhN5?=
 =?us-ascii?Q?w/deu1LvyWa3zVBx9OQjVPxdtj3qdrne6kQuyZxFkSwyGnatYW7A4hzD0clB?=
 =?us-ascii?Q?3ooEM0vIChAq47821d7e1PQefGeYZd49nTJyIg1N9cjzIVJYoBbI6YLVErqq?=
 =?us-ascii?Q?H2piXlUISA/V25DzVdzA3BUiAXmnDEktJDRYn+WURACee6QeX5YXniIPIGJb?=
 =?us-ascii?Q?b1hLC+1Bl0z/sDTBMrZU+lSEQWelmH+iSU+IZTSc/XlI1BQjmXtIZQmFK1Sn?=
 =?us-ascii?Q?Wz9L6vj5J7VwMx0pEd5Ryg65WOmmkSR+1FeLZp3h8mlrDcXkYLD2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 127d432f-1990-4ad3-fab9-08df4bd6dacd
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 16:03:47.8275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WqAGUQhp95iJl/nFt0VhlE37dnKX2vRjvMactik9GKQ44HVcuqR9/fJKJNhtjiFPqQ28+w5KC0E755n2CrKc7uIxsXLOatlx/bNj0le/V5eEQbei0kDOoMiOEG7ReqyP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7367

On Thu, Nov 26, 2026 at 09:28:05PM +0800, Tian Xuechen wrote:
> [You don't often get email from 202300460064@mail.sdu.edu.cn. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
>
> The DMA router remains in the OF registry after its device-managed
> data is released. Remove the routing entry when the device is
> unbound.
>
> This issue was found by our static analysis tool under development.
>
> Fixes: e5f4ae84be74 ("dmaengine: add driver for lpc18xx dmamux")
> Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
> ---
>  drivers/dma/lpc18xx-dmamux.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/dma/lpc18xx-dmamux.c b/drivers/dma/lpc18xx-dmamux.c
> index 40a338f0d44b..412d425dc1ab 100644
> --- a/drivers/dma/lpc18xx-dmamux.c
> +++ b/drivers/dma/lpc18xx-dmamux.c
> @@ -169,6 +169,11 @@ static int lpc18xx_dmamux_probe(struct platform_device *pdev)
>                                       &dmamux->dmarouter);
>  }
>
> +static void lpc18xx_dmamux_remove(struct platform_device *pdev)
> +{
> +       of_dma_router_free(pdev->dev.of_node);
> +}
> +
>  static const struct of_device_id lpc18xx_dmamux_match[] = {
>         { .compatible = "nxp,lpc1850-dmamux" },
>         {},
> @@ -176,6 +181,7 @@ static const struct of_device_id lpc18xx_dmamux_match[] = {
>
>  static struct platform_driver lpc18xx_dmamux_driver = {
>         .probe  = lpc18xx_dmamux_probe,
> +       .remove = lpc18xx_dmamux_remove,

DMA engine driver almost never unload. so it is not urgent.

Please add devm_of_dma_router_register() API, other mux router also can use
it

Frank

>         .driver = {
>                 .name = "lpc18xx-dmamux",
>                 .of_match_table = lpc18xx_dmamux_match,
>
> --
> 2.43.0
>
