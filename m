Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795709160;
	b=yzAo5UogYXPIbCi7LVtAqmIZijtFpo/qNpFbbllgl5g+E9kJ5IP4FsUOCCpbr3odEVve
	 Yi/pwb/xU4P1tANHsSIFk6QpMPETYEV4A4Kd9xnN5CNxBZb3q6yD0sSChW52KFP5lYfoM
	 ioeNMtvw76gF/2+ZYCjYQtmd/0e3sLhLbmKLRhBH6m0R21DnSRI7cxnoU+96hmG3rUQFL
	 oztpdBQfpIrx7jSGLKSG/bc2jH3dcnb8Mo+8yTLzSGh/2lJUTspeiJ7sFUeBS1GDNASe+
	 YE4Tu9MPih9njPiI2bBVUmBu2iuG1Cisfe1PMm1+iIVCddyx7HqYhyaIoXuAt2K2YHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709160;
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
	bh=bavOutTJQYS+VDZuO+vw0A3Jd3ZZeSuOqWea9Q7mp7g=;
	b=4CuGV0Bh7jIyMyEG+XH8BpQ6tR8guhnLCIPgky2IWHyd5FtjKhIkYxXZfLs6FyxcgTks
	 j9KpjXGoTBmU2m9j9Oda6q/F/CLgH8YI05gddIO3tY8ZkeAB66uLBBQdx12XvVFicNKHa
	 Bp+mtIshF6q99rSCxsu6Oz146WRTDl4Tf+q/erm+hXhefDCG7z2Z0vfiAmFgGdTPtovxP
	 YHbO2hLuia6hr7PVHo2cp5eooVZzO8TzmVS+qkNstfrwhpnNuSKJtFP+7jKmtjplOTszx
	 LPi2yngC/VdDpsulYmMDfdaAbNtRIdeVVnGHaNnFBPOHAadPdmz7pKhjyirgdvqO20A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Pc5evAKT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.39
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011039.outbound.protection.outlook.com [40.107.130.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC183606A31E;
	Thu, 26 Nov 2026 16:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC183606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Pc5evAKT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKikJj49lVnObBIxn1sc45N9Nyn5qOpx4zK2/P9xGHrUlwMDdB6hmELVLHMScKGhNc1BVUF6jLETHoz7RSZicEMjOdvr/Y0WK0UmWPuNUDCsq0ZNv06SLlvDBXeBVcCCbwu+f/Ie+O8IaO/G/V+bbbuQY/GpeIgSBFuqegd409/mA5EHjvih1vLaQhRJc4EJ16ZBWgTwocXhsYo62Z5BTI3AjlH717Q41v6YftbmsEBiDiSkNAHdczg/Wmm2xw6eg3F0R9vMYViBfJa0Jo2qwWXPDl+FggocqPs9W690sCT/Ov8O36Uzh05qAU7sjF7N2Uep+61WqP2Zr7ZtMh6AEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bavOutTJQYS+VDZuO+vw0A3Jd3ZZeSuOqWea9Q7mp7g=;
 b=rRm3es4mnY1oTimi3SYNpocZLU/kG8tWaZpLoHZxUWO115d5rwLuSnfhiyH8mOGJSQB5opeYw9UAOMHNv9OjLpTEV2UnIy/ygcuueXaPv3aUTSCC+V9zKGizFJGwBWbpb9lHNaUGGfeNXVNAl2IpUtqwzxK34JDOLep6+Sgi6C4wrkWa4VlDn/Iw2eqlUMqw/nJAAHJn4YQSA7IKMlokEtVw4KIXOqaPLGigINTU8OjmqPHq+J5dNfm4hXgC9UYAAxIpPoO2Dl1Wufop2idKb8Km+eJ0tm36wsGwb4SRY8GlcgN6E45EaWE6TZUrQvi3M5rFN+bo/DY5eQ47Xk5Y+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bavOutTJQYS+VDZuO+vw0A3Jd3ZZeSuOqWea9Q7mp7g=;
 b=Pc5evAKTyBAWtttyUVM4Z59jL97pLuMwwe9zJH1GzC0s2OqgWKfXPs5KOf7PB3cCtdSWbYcf50wItShDVsnoYzd8U7+GFcziynzr6tuhZKRIkUbJgyHfnx/MbESI/V1hsDcVvSiBZcOXduQvnaAiJmbGRPdrpAs2mbmz97C4iT+S3vSFdIFYfIkqYE789xp617UV7da6tgs0JCsqRYJR2w+ZSPij3sIqHkkzbNZohr+8JKZ/7iMXYrGarrHegtCaK2iEF1/ut6ufAkZGKljkHjfeYe4azml7ovCUgu54lsl+DExPhtPaOQNWkQOjnYbSQdvEHCFmeUhkKtiRlGaFoQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AMBPR04MB233694.eurprd04.prod.outlook.com (2603:10a6:20b:798::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 16:05:57 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 16:05:57 +0000
Date: Thu, 26 Nov 2026 10:05:48 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Tian Xuechen <202300460064@mail.sdu.edu.cn>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org, liguangshuo@mail.sdu.edu.cn
Subject: Re: [PATCH] dmaengine: qcom: gpi: Unregister the DMA providers on
 unbind
Message-ID: <awhY3AGN31LJvH2p@SMW015318>
References: <20261126132809.4091225-1-202300460064@mail.sdu.edu.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126132809.4091225-1-202300460064@mail.sdu.edu.cn>
X-ClientProxiedBy: CPBP307CA0022.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:2::11) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AMBPR04MB233694:EE_
X-MS-Office365-Filtering-Correlation-Id: f41d9ce5-d415-43c6-ba24-08df4bd727d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|1800799024|366016|23010399003|6133799003|22082099003|18002099003|10067099003|11063799006|261021130227099003|56012099006|261028144727099003|261102123227099003|261026130827099003|261022105027099003|261021121427099003|261021135927099003|261026140227099003|261022113327099003|261021123027099003|261009223027099003|261022115727099003|261026121527099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	JlolQmuGARiZgew224unIRkdzm0lr+SgsfJeu3NCV0hr9d7Vnx6SASYboeMM9d6oeNYheVNffBpJPe2IkqaeJdcchZHd9ipdEpTm7tPV76ZvNkrLNM/PubXfnfnxLZ1EB/rs7yoOYIXfllnoOrJL/mpZ6jFX+UU0TgXFi3bE1KlfscYR38e+Wwo0DUNs+bvVCso5LP15Llwqx/VEOO+mZpSI5FrpM7KsBzH68mj/YFro1aYbqqkZciF2R3u3IjQqVPawoQCe5w4nXWRG1xFGm9Bc+h2RjtPrrC7Y+j1QeaWkRQcOzJw+gu8F7KoOqYAnm58F1nhhEogHPsjTtN0nLCScrllMIBNsiB9RSNvzdgvL1RQtRVcx7figzrnTqXt0d7nk3xe39yHciJzvY6CYu+XPACaS6b93dfDHS3Im6BayfZnWJTo9T9H+U/Vs7bn+YqSgRBSwrQ/5zRWdi29j/1RRRfpoL//Oac5NF8Lt/8X2BlOXkeEfHGP4hhAWSiJ64ANhfFOa3VQI3zcUQ4lcRdoCKtsIoZMu4jqzV4an8xkjlDBoR2gcpxj/EyywQ7fYPZfMvsLsOEIBbJGMsoaTTca/ZKCl5kNmunTSvMv2czBDWCSmqgp8hYTIAnbZoPaPcf4IedlKRdXJptTmBFQMZhcpApd/mdFNQSmOSWyaECQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(366016)(23010399003)(6133799003)(22082099003)(18002099003)(10067099003)(11063799006)(261021130227099003)(56012099006)(261028144727099003)(261102123227099003)(261026130827099003)(261022105027099003)(261021121427099003)(261021135927099003)(261026140227099003)(261022113327099003)(261021123027099003)(261009223027099003)(261022115727099003)(261026121527099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rjSkubsbtlHww+q1byqdsJg2Imb90SksJwp15dxlpLftp8bt3ZsgoOwS7wwp?=
 =?us-ascii?Q?OFkvnJ1ZAiiKPp+egTopGrYLSojVahgIFH6fdbfi4ixfeqAcw19Xiox5nZ1i?=
 =?us-ascii?Q?BMk7jE8gC/VEAwYKkxX9jAORpaF9O+WI5MtEkNGQfuszfwBGngDxY0GkIjhx?=
 =?us-ascii?Q?ezJx9+xlOYRRzwDz2cuxsq6WHzTLcPkyZ0DZwk1P2NcoDHuMD8bin10cmjvO?=
 =?us-ascii?Q?sbkcgsuIXjtDyxEFbbdsBUlD7AnmlK9uP+Gz33X2BOYgka15U6xpwzCI8Lko?=
 =?us-ascii?Q?stsUFGskCWnSmJaDQe/W9A/GW3QZzhUPdqcL6p46G2a9yHlK369i0vA/NYUA?=
 =?us-ascii?Q?JPafZXYSL1npEfKKLvNa/v7S1M8PvrhUtm9hsCetPzCDYEfChbP1qKsQN/Lt?=
 =?us-ascii?Q?dfSOqv12suWi9o5Oi+KnHTM2CMN0hx5lGtrwt/m0950KmQ1FBI87Qq4ADC67?=
 =?us-ascii?Q?CEPHBoH6T7HiFkEdqlUSmX94jmbhT0JqvrWokM6y3BxQyqRo3fkK7F6gDGOP?=
 =?us-ascii?Q?8NpRpyWIVN9d24dTzSkA4C6BRCMOM/KBn+lSvQU/RAsnoDocCBj9OXHJeVdO?=
 =?us-ascii?Q?TVVJpnYmdumFE5zVNHxeyIwu66mlLPV2cLhADCDyRJQHG2AulwAVE029PsaD?=
 =?us-ascii?Q?VCS44NnVvbXbLSlyNrLVmfaZpOD0F39sOJCgqZ3tvxAxhap4Mpi4YFwLW3Jt?=
 =?us-ascii?Q?NJybRvZXOoGV/u541yg/tN8O95OQ/5YQ/iY41ZEAiB5wmgfNglYTTbTKYzig?=
 =?us-ascii?Q?3X5duxFGzNiXN0rQSZMTLD7Y3Lr3MYYqSOjryb7nTk+h2sS9wossvlmwtL76?=
 =?us-ascii?Q?obYjXGx64SpowVdJMLPuqTdZcf8vG8zYgO7moBSkxVseGktv279KZWJdFBI1?=
 =?us-ascii?Q?8X5RRFTb3UlI9YVLq2/0XHBftldwBvn9Ri5ErSiOlae95sG/+/+yUynZvqMw?=
 =?us-ascii?Q?0rK6WKoHP2Aal0BbJowV6urG49fHonv3RKBLI4dxpxL9FkkkPezv9QoL3Pdm?=
 =?us-ascii?Q?5zQ1IJiVKxmo+HiCwLYipAspsz1Y6Pqz2INJ7bSyD5vsH2E8AvaejXMjk2T5?=
 =?us-ascii?Q?mAQVN41Sb9uxvABQ69j4Y+gKB9A1H+aoSxc0yPXGywSNy3O8iMUfwN+1z7He?=
 =?us-ascii?Q?vfz4N3Z2E1CdOBCvzIenKBj1rOslstTejmCt/07TkFuLGOuVgnNWQsJo5mg1?=
 =?us-ascii?Q?gC/RW7pV3C519Gy76Hjwdr7MKWbFEEzO2FREIxW3kYpBVSsFCiMWfCy8WEvQ?=
 =?us-ascii?Q?n9fMvzbuJgZk+Hyiba1Vlie0TLvQU3IxRe4Kznh56WLJLSqnRE4VPTT6LIcU?=
 =?us-ascii?Q?ZC6EfKpCU3Gybwj99AireApBHVK6Yx81E6HGJQ4A3EJjS7s4Xben5SaCclyh?=
 =?us-ascii?Q?26nthO/8iBqHrQHusDvlmKWAwC0O5uWhKJyuaKKmfjU1wCxEWIhzqrWX+cop?=
 =?us-ascii?Q?dD34pIkUAe7lyJSv1lz/1sSR0/vzgOsKRQfrz7lFy2jf9aOKT254p2Q2a9+c?=
 =?us-ascii?Q?TyfjafPaZGMpF01NSstgJiWZYQb9aLzpQcnNSGENBnyRHiKkdXQmhH9XylHM?=
 =?us-ascii?Q?xpY6QnyeFv7O7HYKnJB4qbvLY65PSfC+zSZGeB9TkSD4HRWHRgP4w2g7IcSy?=
 =?us-ascii?Q?QeWKjlHl7P9JAhQHNdH5jzeiyQBkKZY1VFbpJsJsEf3qC86EW73xsz6Z9i7c?=
 =?us-ascii?Q?uVpQn7Jna3cy0qmg4r05M6kYStxXMLH+mDXV6CDl83N1IQIX1RRxhvDa9BvU?=
 =?us-ascii?Q?IFUz6XeYwlHVWauKYJDQ2A1++Qxni7uIA3msLL4lU3TC8eTyuE2j?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f41d9ce5-d415-43c6-ba24-08df4bd727d4
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 16:05:57.0420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJK6UbKlnth1JgS/dBJmeVgO6Wa5APR7iJ2f/8z8OZxffvyeTTQpFavKSPrj09sD5zKhS/uGlAyY+PC7CY0KucIvbY1aWlxu5IFAcFiJtWHba8uVaNO2vf2PvIck60WF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB233694

On Thu, Nov 26, 2026 at 09:28:09PM +0800, Tian Xuechen wrote:
> [You don't often get email from 202300460064@mail.sdu.edu.cn. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

subject:

dmaengine: qcom: qpi: use the managed APIs to register DMA engine.

Frank
>
> The GPI driver leaves the DMA device registered if OF controller
> registration fails, and leaves both registrations in place on unbind.
> Use the managed registration helpers so the OF controller and DMA
> device are unregistered before their backing storage is released.
>
> This issue was found by our static analysis tool under development.
>
> Fixes: 5d0c3533a19f ("dmaengine: qcom: Add GPI dma driver")
> Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
> ---
>  drivers/dma/qcom/gpi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index d3c3d0f35afb..d34bcd737b60 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -2284,14 +2284,14 @@ static int gpi_probe(struct platform_device *pdev)
>         gpi_dev->dma_device.device_resume = gpi_resume;
>
>         /* register with dmaengine framework */
> -       ret = dma_async_device_register(&gpi_dev->dma_device);
> +       ret = dmaenginem_async_device_register(&gpi_dev->dma_device);
>         if (ret) {
>                 dev_err(gpi_dev->dev, "async_device_register failed ret:%d", ret);
>                 return ret;
>         }
>
> -       ret = of_dma_controller_register(gpi_dev->dev->of_node,
> -                                        gpi_of_dma_xlate, gpi_dev);
> +       ret = devm_of_dma_controller_register(&pdev->dev, pdev->dev.of_node,
> +                                             gpi_of_dma_xlate, gpi_dev);
>         if (ret) {
>                 dev_err(gpi_dev->dev, "of_dma_controller_reg failed ret:%d", ret);
>                 return ret;
>
> base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
> --
> 2.43.0
>
