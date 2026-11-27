Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795792551;
	b=Y2bXr0MuNb4C0wI8LlwCVNLng+NAzbSg5oAUaq4fqCVqtvkg2McaLMvPytYgMeTdftHF
	 iI6Xx1jhmN38uxoqqLfHIo17/9MXEIXnByZCGVFH2EaR31Xjr8+Ip90yZMoBxVedcxgpo
	 eNdykKps3/V9MgfJwZFPhhO07mq5hmN5dtQpOV2oHJcQ4z3CG3IlHujP0SWeZ1avnmU2T
	 qCBTPqMXLVowQmeL2xd1uFbCtR9IZyiqTcYWy1BnKQsVg3pBlnPXHeff5bAucR9bFQnls
	 c/FgOCsnPZOLLCO8V1Ou0wFiRAFOQK/daBOcmZ8aVU6q0h+ceu7naSg9oV1FD2FLIrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792551;
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
	bh=AJ/SMs5/tA3Aw//lrGhfle7qO8ScqhS2hToiALSXWA4=;
	b=rczMYwhCIog85i4knmD0AAllATJW/qS4jBLyMdmIL3rTaB/JADGtWFLL5ayGSOZS1OtA
	 QCbnNkbU9NiM0x5WTUKybSX3wItZdjlfgtsvoWjBTapKzCNx1JKim68N69FNmdn1OVxcr
	 0k8AE9aCKMe3LRNi7asJ+/4rFagpAauuCJfRG6OgMF1N47o8wttjCXGQd94AhKNH0hUcH
	 QBxgjP1zyL6NWQ/zzwnCInRez+SgGSA3ja4oxspCqfo0f/AexpsiZ64wMzgFhG8LEfK6A
	 3ECwv44NX1Yyl5RKfPJUh4WMBi6dLgkLKQJbzdUPdUkRjZsX747deSy4CV0v8auPYsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=mmUVLVlW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.56
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013056.outbound.protection.outlook.com [40.107.159.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A90606A31C
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 15:15:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27A90606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=mmUVLVlW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=La6LRR6QUVJkthMn3KPcLMo31TCV3upyszPZJEmlZ5mQsuYwvNhuMBD/DZcjducwt5FEbCBNQChwtduyF6EKB8aTJj+ckTm6rYu2UskJFv0WZ6gXXfCwFelN5hkUmg500Ov/VT42fwQeFM0XLwhSL2HC+5ZMk8nfai/l4PbiLH7AH3cVPOFBgQxfr9mmc864OzpziTXBckWrPu5NwZnpqU2zbfSy/3G4/7jbi1jtvKdPuCfGhJ7XIQkZcueZjsAmx1t2w/eUNy1s9N/nPSo6DstL6qqHJz0LFouvQ7Ths7ECNPzan4PgDH62FpDqjgJNudiJ5mzLfuOD+DHPa2bwTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJ/SMs5/tA3Aw//lrGhfle7qO8ScqhS2hToiALSXWA4=;
 b=MkKnBdDSnI4o29I5jPfhGJWjC3VVF7FhziEJUs5LHqYKg4wnPn3aDVIY3fy+VTulk4RF4sH30ti2/K+L5Uc0WroNZUtipD7BlRrEKcVvUv8mLPD3I9isnXwVK/B5OsHmPqZkmgtxzCaCXObd+9dXvptPXmX3jX/xEAqWx7WxB1nRsyYg5tTeB8GNIqLzDED7Q2JtqPNGR3oyPMNtFX6V3BLLW4fVSc6j65gk0fxWfeqcA58xoICq52Amvwp5hkAgN/jgkQZmgQtPyLmQqWJm/91x2Vvy22gnFTS4VV5XIPdD+ZFQ827TurmBw2A5HTdBMJgaf8hKYXJirglTJf0qZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJ/SMs5/tA3Aw//lrGhfle7qO8ScqhS2hToiALSXWA4=;
 b=mmUVLVlWIkFJAIO035u7BNMn/KYC4tCyGJU7fl4yhnmXD/t7Q75I5yy20nVmjo5X38MkqJF2qkHYC5SRgTwlFerK+lAMA8DSHx0oV1IHUAzTketXrmdrm1+6u8NPYSedAlGyqOTTcyKzsdyrOZdmVnhPh5QxiulxzilfSYUZiKVErA/Zlai7m5jnkqYXYPskz9SdgkMpvLQAthQ5jwamPPr1FiH29QliXCN0jmLS0UWtJpIzGCMc2YcwMncwDaWQG8biEWpX2wnE9EZSaia6V1xoZCM8Nwx+vJtdpgub2KYjAMP8maNE7+dTndvLbc4wIdakdMA8CkP68z4RNE86PQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MMZPR04MB619844.eurprd04.prod.outlook.com (2603:10a6:190:54::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Fri, 27 Nov
 2026 15:15:48 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 15:15:48 +0000
Date: Fri, 27 Nov 2026 09:15:39 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Tian Xuechen <202300460064@mail.sdu.edu.cn>
Cc: amelie.delaunay@foss.st.com, vkoul@kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	cedric.madianga@gmail.com, pierre-yves.mordret@st.com,
	Frank.Li@kernel.org, dmaengine@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dmaengine: stm32-dmamux: Unregister the DMA router
 on removal
Message-ID: <awmem4rf9yPfggMa@SMW015318>
References: <20261127113332.390552-1-202300460064@mail.sdu.edu.cn>
 <20261127113332.390552-2-202300460064@mail.sdu.edu.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127113332.390552-2-202300460064@mail.sdu.edu.cn>
X-ClientProxiedBy: CPAP307CA0005.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:3::13) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MMZPR04MB619844:EE_
X-MS-Office365-Filtering-Correlation-Id: ee2f7292-ab72-434e-fcce-08df4c9950f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|19092799006|10067099003|11063799006|4143699003|56012099006|261021121427099003|261102123227099003|261009223027099003|261026140227099003|261022075727099003|261022105027099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	dCVYujlLsY7dHnia4HNtcuMIotDPQZ/jyI1qLQ61TFIXswLxqMG54sbgsVguu7nvOu2dcqcs08oe/OeNNnPeT5P0zwao/kozZ6yo8SSShRkbBtd/eLAM/GcOcON2V5R+j3Y7ljxzSLhRzAEsIcS2dbwVD6DyqOwfe7D9kLLjz302AwugEmpbGgEcUnKeMBG+1irPxBIYI29j4TReokEJG7NdSUbiIc6xmGJu8CyNCvx2+zX4fDbgRJZy/ARkDWAMBpCFre2g3w6l2ae9hy+Z2yCkauVPL8mZdBrPUI+idwGEYj+kWYZGM1wmhg0aQ1+VXRPLmqf3779GwEu35g2gmQrdUzl8WIJEPOziEiJNORy3Fdhh3wzff9uPOgn4Cx5WWAgaQlVQmxNlIaKaRTZN3QcEHqafRrgG+cZTT3jDyMKzyxtCEXOINkDVJo9wNkH/Zk7x4IhmP49kLZ09mOiVMFKyCFnMh4OVPqbghe9lI0pFzIOGoKY2DKsKHPfWN2XTmZR8irIo4epSa9h6nXSGOK4M7BqTIP3FCrOmuAd39yMUxE46xOfpVMh9T6NIND+4F3Kncna33ToF/2Llvussuf0gdiJ8cOkd36FoHz5n0pZKZm+Uog4i43JD4DVjjxDxsTUCGAj3BHsgVYSy/roDMb84pRas7TR8Hw/spgvZ7qM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(19092799006)(10067099003)(11063799006)(4143699003)(56012099006)(261021121427099003)(261102123227099003)(261009223027099003)(261026140227099003)(261022075727099003)(261022105027099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0VqeX7yKK978/Z/2JEjfKdhscVPFx/TqIEz0LJ4lW0lNFrxgXW5wHJ8X+rzM?=
 =?us-ascii?Q?7ClmFORudzXHL0ty7siCvsYKCMF0n/gGH8MgUiQS99KBjmEcSW8whveS5o2p?=
 =?us-ascii?Q?G7mFIhJ7ZUglKJUpbVrVQxil8UYOle8kWkRKupJwqFA5d950rueQ9m09v7yR?=
 =?us-ascii?Q?aOBvQqBOV2NMfSgjPFXrRGeklaxWu94/vHGXUJ1kETKE1Iduz5+s2jHfg2QW?=
 =?us-ascii?Q?+oCgSD73ntFK6nMqD4L3i9PBScvxpUeDavwcdZWrUO84IX1TI74qOrRY7zQC?=
 =?us-ascii?Q?JZrTRUhL//8dKFVcFQX2aVDQTekIMyG7yBFe1ZUe7G15hANZKPnbUwQ3K74l?=
 =?us-ascii?Q?BbDKGyRvws/L9AgBu0EahCQHN1eKpiBCMVMmMOlzpqId/u77d4H36Eb6wicm?=
 =?us-ascii?Q?QEOXCYoa8273eREf7ykWcjybFEuPaxZWHCSqsogMeZEHP1chLVpALfpXCbEf?=
 =?us-ascii?Q?+skiCGFIo221/FO6VwydA4aLBWlX4e3AarKx7FA8ptdlRR0iBgwXj9j2GRWd?=
 =?us-ascii?Q?e7I04Cw+sTwtDCwzqzQy1wvVCPw5+mqe8Fx8l0WfuUnUAo3slpsP9h8pavuS?=
 =?us-ascii?Q?mBN5nCzR9bJb63g1upBtPaDBj6nPfuwJsL/menvKV7Er+ju1/ZhiydvNwTI6?=
 =?us-ascii?Q?RMbmZCsKwCdtlbWGIv7+hV31vNmS/kI5zpQa/GGtY/2EBgQLd2vjwppGaFSG?=
 =?us-ascii?Q?36K3slKnHrfvfclkCwEPrbkI2iwKe4SxQTmfYMPbVYtDEfxG9vmwZRe2+Vgj?=
 =?us-ascii?Q?oXGp/zB6TbHgIrISekqrbcYisRJLEN4DlWjvnCupnhstRz8pPDUochbGTAEf?=
 =?us-ascii?Q?gSWzlKlZMHxDoFysYzjv5HzhS0bGaYegXXnAFgsEmF8IzZv9cweexJALNorO?=
 =?us-ascii?Q?BjuWv5qqC5JQLJm9DCKkT1IoMSuY+/BMgNMd4O27uqFd8JD8Y9hl/a28zblu?=
 =?us-ascii?Q?EWJnPFKbRiUlcBC62aVIG/jHGwKCmPPiWZ4fdc09fox2fA5QNGUvjOq7tOPY?=
 =?us-ascii?Q?ow7Cf4J2I85sRaiXh6dLAkFJzpmQChMQnxm+W+luGKyGWTZ+cQ1ezKUuKTga?=
 =?us-ascii?Q?nnS+9769GFtjE/gQz+Thm61vZPi6fOf8HvsPS9ukq70EtOCduEkt2OibPHO1?=
 =?us-ascii?Q?D7GrvHnktmfpbyJOoWMTimHq0N3h8l4I4Ds3h7T0B6IGa8GepHQCrmYtURcN?=
 =?us-ascii?Q?zRSyU9cF+E5LnCeVB/Qdceehhyz4SCSk3NetaEQ3F3VBXEsMfkeRIURwX5Iq?=
 =?us-ascii?Q?umjjTrxBmYYaFhSY9vI1FIoMRSszfvrJyFZuDKPSb55pV0xTiD8pSw10ofaF?=
 =?us-ascii?Q?5CDRBcOrYQFuVAXBSPSZy2BEQTDaGZgKeD12T4o5Qd7p/DlwQ03D0lz9O1bg?=
 =?us-ascii?Q?9chPfY7Rh7GasGPEos46B0dKFWP1RequhVjEshu636U5NwmVRm+DF7UgJizu?=
 =?us-ascii?Q?MT80xjOjRNM5ZkpolqgT9e5zGf80wmm1PbBSwklwTva6tXZ51I3lZT2T9h9p?=
 =?us-ascii?Q?uOMqn+oLtPU4N4ULtj/evH0vaxhRNJmqEVA7SPSv3hewVokq1ggk8HbsvckY?=
 =?us-ascii?Q?lYpM6gabzlpOO7IklMMd0lEITVPrGuoZcR1vm4E5Aw5dN7CEeRmQ90hhQ78+?=
 =?us-ascii?Q?VU96rFTkn0cbcMzjbPsd1K4wsozQZRFKNCpUW3HrYxWPsUzFBeRWHUAQQmpK?=
 =?us-ascii?Q?ZjtNFa7vF+S305EdH7+W5XuS7BCvVVlINfrSC56vPwsGeVeCez/ASFP/RMMj?=
 =?us-ascii?Q?OO2WJ6L6Sv1nv0nYyzBZwYuQ1pCQuXW45hbi5nO9b4pNHdZzTI5g?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2f7292-ab72-434e-fcce-08df4c9950f6
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 15:15:48.4282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5R6OncxCzyRkS3aPcp5O6lSIszKtM0Nwn+IZW/Qye7bxbuSIRdNhX4uTUMi3XNJzPq0icLelKk/z1CgEA8IyNY9BHMaKSobTB2ufadjQKO0iE4rOsrKUSNtFaYaq1IzP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB619844

On Fri, Nov 27, 2026 at 07:33:30PM +0800, Tian Xuechen wrote:
> From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
>
> The DMA router remains in the OF registry after its device-managed
> data is released. Remove the routing entry when the device is
> unbound.
>
> This issue was found by our static analysis tool under development.
>
> Fixes: df7e762db5f6 ("dmaengine: Add STM32 DMAMUX driver")
> Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
> ---
>  drivers/dma/stm32/stm32-dmamux.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/dma/stm32/stm32-dmamux.c b/drivers/dma/stm32/stm32-dmamux.c
> index 57318715d9f3..6f49d78bfe3d 100644
> --- a/drivers/dma/stm32/stm32-dmamux.c
> +++ b/drivers/dma/stm32/stm32-dmamux.c
> @@ -389,8 +389,14 @@ static const struct of_device_id stm32_dmamux_match[] = {
>  	{},
>  };
>
> +static void stm32_dmamux_remove(struct platform_device *pdev)
> +{
> +	of_dma_router_free(pdev->dev.of_node);
> +}
> +

Add dev manage API for router_register()

Frank

>  static struct platform_driver stm32_dmamux_driver = {
>  	.probe	= stm32_dmamux_probe,
> +	.remove	= stm32_dmamux_remove,
>  	.driver = {
>  		.name = "stm32-dmamux",
>  		.of_match_table = stm32_dmamux_match,
>
> --
> 2.43.0
>
