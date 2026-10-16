Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013069.outbound.protection.outlook.com [52.101.72.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA27934EF05;
	Fri, 16 Oct 2026 14:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161993; cv=fail; b=Arkg6Mc09vX8HkP95giD80IMv0uOQOGrAC8nf7fhZIKhzY2QkG7/mgMv9kAIRJR64b4BhsMEmrwPOLYtEl+SYwrBhpnQ63yj5dJuU7ITW/BR8h2WKAE2Z16I7xvmfARayzMFX6bAjTOfmK4ET54GiTzw0gX5dLRZ5SVKGR1aeFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161993; c=relaxed/simple;
	bh=JXIbAzCocTDHa40jJcoDO6sk9u5yI5n487YTN4hqUeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AVqX596TDrOX7ibgu9noU3Jl+kRa0NqlvTCyn2UQBnTqfV6ZTaS6VaBgC2aaH/EmX2bhNEwriM3tK3zEaK7jbx9i6KmJakJE8DdVRBoRW0TXLjfg1L3YSzbqklabenUxvZ9txgrXc0aoz5/cGkuznC5f0ISnSuDG7TRq/iMRiC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GK9Wplk1; arc=fail smtp.client-ip=52.101.72.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GK9Wplk1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ACVAk0djHD6GQ0so/YZggZPp1MrNP1MDsl4uR427/kvd90SWm70LlWDsGh3ZD/y6oHpgSLLxe5vdQZDNmMBcISH2WeVCD4SfmVl2eQwXqJ4HfeYeHuDO85/6kdQB4d4XjI39asl7upHWtAKZmJY6NTRhAH5+F1Nghys8PG4hlYz8073S8x+0lja5iCdehCTd/BGURUvYPVT/0ejspraQcIH7qgUCDepLw3g2njcCOPyd7Tz9DsxUEat06hh5Hixucgf7t1kpJyql/iF1MwENmFrV2C1Uv2fElknSf4VAPWRfVod5p1BGgldB+2/I454oNxqyi0aCZ/7TkUShLEbe9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvLMHjyHG6manfrKMnOX4kcmIpAYvxVr5Lq6DrGlJ9w=;
 b=U862rktD/goBsKeeLc/TWhaw1e7QMC6uG8tXYnyP1mJ3Qtydhy1s3shBIY204abiSzlgimvhBiehYLwgE21wTbploAvRfJvfdsB3ugBDVA4UjdaRPdfyNcoNQrKo3SCnjiixUWgnzFbCJjDXZePmyg/PnXXhGpQN8k2Jma5+WYQtPP2u3zAefusJZnYgAJlCYducY6+hwIemE2TjjOMRivJsDm7V+NACf5Cdxokp4HS9/Hv7qa5Lhbfosg3gwbjra7vVL2arccoqsm4BjY4EIqnRMAqMBpo0fNeEUo4s/GbjYhXzl5l/+I9vqiR1BHPcMKzpZUcTarJ0wV/oqFIZ1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvLMHjyHG6manfrKMnOX4kcmIpAYvxVr5Lq6DrGlJ9w=;
 b=GK9Wplk1wEui6nOZkTonYyUa01PMFOJWNuQkRBwyA2+jMmCKfg8TZKNVSxIE4U+jf3GkuhX6VZPSJxLXuEcfTwz+ch/fBdcNVF5lPPkQSGpUtBGqmwRDfXa1hqe53wSlWj+XbcLAOk/jQ0aG+dN0R6tZ243xt89JJGJR8OofiVZM9ZL3DuzUhZDpUTs52ZVjhVJtCZA3mmmItReQRZUzJEd1Bt7LznwoZljF5dDgzk/MwHrlYQ0KGtaL1UEz7CBgYaljJcJovz2DLtn4ZHA0noABwcuydn85CgX20DxVeFei0jO85AqlTqhzDwDrNfPuFf1gCsSbkNv46+cTIx2RGQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB10012.eurprd04.prod.outlook.com (2603:10a6:10:4c1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 14:46:28 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 14:46:28 +0000
Date: Fri, 16 Oct 2026 09:46:19 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: xianwei.zhao@amlogic.com
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] dmaengine: amlogic: Fix regmap error check issue
Message-ID: <atI4uyEBPRbpJ1tr@SMW015318>
References: <20261016-fix-a9-dma-complier-v1-1-024421d5b3c8@amlogic.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-fix-a9-dma-complier-v1-1-024421d5b3c8@amlogic.com>
X-ClientProxiedBy: DS2PEPF00004563.namprd21.prod.outlook.com
 (2603:10b6:f:fc00::519) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB10012:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b8c751b-ae39-4390-ec4b-08df2b944259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|19092799006|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	JBAT3/WNbNoJS/kkPMRz0T2mELbUDkishbelAYZjiH9IXM9ProuqTSItMJQ1dcS5vDsBVmUhF2XIA0MN2EbAekeyufGfSlUeyYncgbFlC9lAgbCN5U394wt/+774PEiCqQb/EO0TpHOilCRrzzcprHuisVDpeHcBKjp9LjSQDqbN52GaQx8kxePfVEnkc841V3mqQpSHLikUxJ7dZkH4orFmxjtTp9eyErHJUroN8gATsh3QVaqshHlG3CkNWLqdUwqb6m/+MP0+BB5j9TwfKNFjm2QU5p7M57/VtF4YvfabeeZLK+mXtj/r3oDvvcKclH/+daGCUUZxtINrRDs4JFwIlwNsR34ZGzmoFIFw9AKg1KyjILNa+DE+jWm10j6Fb2VcjKa9fLVVfw2yj4D+Od3YJXF7hmg7TUbUI6JDr2xR6ToYuOWIukAt0ShXCkYI4Xi/02fyctna/47FBCr25ioxJ80uH1EAkyzTxXYeAkuxDmo5LFB0/CNyQB5I24IAwqAedTIiexcCYvLjbYS4512yqpaMNytKEjNKfMslrmeGsLbnfY7X4NG2n5Md0RD9zdDnb4uGrrWvkYtOcjjBsqv4s2oVm63g8WuPxSj2xE066gZ8wQP1WS8/FZEgaobf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(19092799006)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Yz9nP1E/Enr/EF1d5Hf4rw5gdXhpSGV8nnkbVy56I0aWgy2fVlckZfO/ik9v?=
 =?us-ascii?Q?wvvT4OW0vqOgdVHlRlhOZyOGDaz7LFHolJjixz1HjZOvghWvECYMLzm0hTJ6?=
 =?us-ascii?Q?CqeOauhJRN4FNhA9SuFSXTrF9FlPPBFaKJBuM93BPPZ+FOE26c0sG0SVAtVZ?=
 =?us-ascii?Q?0ScGgE3wlMHAmweN454olxLSQq19LUa4UoIlyh4rt2Q8JZAHGsC76aPOv+a3?=
 =?us-ascii?Q?H9x0KzsMe1NZzCWkyG0d6JIOFSw8nsHAHWm7DERkNKxyAgvic6PO0DP0Utvx?=
 =?us-ascii?Q?KU1HBjwsqz3cNd2rG8n8dSyC6zUQNm/VnGJzKtBAWtyt8gNSTHE/oyQToWVF?=
 =?us-ascii?Q?Cx5vuP+kocjrWQTpMxGQiEWWAWapo/JKSDBoYN/Vjb8+PdviriUaP6CXE2Wg?=
 =?us-ascii?Q?N2JE2T/c7CtEsXGINOtne9cmBZGoXd2UzmhdyRnq5AKRabhLGxdBZ5RN7d69?=
 =?us-ascii?Q?U+ki44cMCBHQ/HchXAhUB0rj06yLM6HYJIo2FHmPP/+nINi68DAhsptFjycB?=
 =?us-ascii?Q?Anj172J3EGWBz73o8zM9H7qJJKxD1WSFf25GHRsDy1totfKXta3EmgVujkza?=
 =?us-ascii?Q?2lJSBTg7lUFrhK3+J+tXLsxRcrRqWRl7z9G09ubAdsBgNyXnyL5RirIjyPOK?=
 =?us-ascii?Q?MEIj6vgnBHnwxXOZLtX+4n8ROfhKaduDgXK2QMPTg7KGmf5FmVYyPS1Se4Gi?=
 =?us-ascii?Q?xv94gSN6+cAbwgeJBeu/67UsL4PIVXCSKE/zGCT/1Gn9/b4at2oKO/ZcwiZb?=
 =?us-ascii?Q?CfZlF7Jm3Wfp0OpOg3nH6RjG/OmG3pp83efeTtOqoonJCzX0Z4SKn/J1MY3u?=
 =?us-ascii?Q?l9nsyEsUZTp1SgeZB0/eXUrwcodTCOprtBH8CKHVtBiodeiEuoDWtvTsHsGR?=
 =?us-ascii?Q?CnKltuuhoMJpxw2OTHSAwN1Wa5vgLSaAEHetatPpqm4KavBqBvcIxPr1loQs?=
 =?us-ascii?Q?u6JqI98aSv72ctEpR8WJmJtR/C0ULaQplZXHvfNR6YsdHbefYsR/3g1TwWfK?=
 =?us-ascii?Q?0n01NifIyqe088+ojQniOQwtSOtDnXIP0U8bMEMakfeUU0AAfIKo4Eo34Ksk?=
 =?us-ascii?Q?/QYBOAoYaGvj7wCoij23yMydCf7LGUQk5PLGDCOHlzFfop41sFuG2xPFQPB4?=
 =?us-ascii?Q?JXyMskTrHj0xkAyq4xUtBc5rQNz7TZGvNfh1aVszpeDDnewfcTWupwbEdkbb?=
 =?us-ascii?Q?3ALK9ObGdaO3alSYIpzG0DM6ZvV4s4w87StvAb0m8mV3GPgb62mF9SSppdA6?=
 =?us-ascii?Q?xC4Ls+9UTTZiXHr+wqEqDH0wlWFcCD+4QA6TCeeYmCxRcKUjVJkd34nXc8pf?=
 =?us-ascii?Q?V9L8deI4J/zXhTTGJK3QmdiBHIB/3VQz8WhVyk2RIfLEu40F5ic4hbpY65Kz?=
 =?us-ascii?Q?YUMi+jiUQOjEq3G1QWmSx/hlT3scbtDrr/Ueq7js5gjal5hGO/P1UwoFdK2X?=
 =?us-ascii?Q?qpKx1BTjXA0QXJAufwVYBRtJV3OFaCvbK5vLARrf0GkViKI9SdDuPLuF3qdO?=
 =?us-ascii?Q?TOgedGwYf1dmpRaM1Y0uGE1NOLudHjbFBPt8vjIqcSHuPnnhmySvYjHAZqJf?=
 =?us-ascii?Q?m004WD39uA/py6QJWOK+EWWWH4gQ+PBZPrSax1v1c8ijHrWCNKvrX4UIzSUy?=
 =?us-ascii?Q?k/R8dcBn8xpplxdUfGl9urtRgce2w9pHsjGOOzk/Gi1oOzUD2/na5a7JuiRj?=
 =?us-ascii?Q?C60ycGZKJZOlA6UyFWnJGf5bZFrx3v+/B5N8sgsP7Udjwtzst1atqByzgY4C?=
 =?us-ascii?Q?t5XAvoULODKJSAlLcAr5wmXmMJO8bAa7d6yN0z258qz49ST1Ij7i?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b8c751b-ae39-4390-ec4b-08df2b944259
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 14:46:28.0224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzJx0MAaE137aZnCI8QdqyKTT/oG2eMiZ12gVgpzFXxA3cxPLH/SagqwM+9BCRY1z4GRCCfPVNDmc38n0ztFA97fr9JEb+Rpcqv/jmiqLTcUECO5mDQi3FUbTSZMqd3u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10012

On Fri, Oct 16, 2026 at 03:00:17AM +0000, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> The func devm_regmap_init_mmio() only returns an error pointer on failure,
> Use IS_ERR() instead to make the intent clearer. And Fix the following
> compilation issue at the same time.
>
> Smatch warnings:
> drivers/dma/amlogic-dma.c:636 aml_dma_probe() warn: passing zero to 'PTR_ERR'
>
> Fixes: b84b5197e344 ("dmaengine: amlogic: Add general DMA driver for A9")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202610080953.C5TYlCaA-lkp@intel.com/
> Reported-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Fix regmap error check issue.
> ---
>  drivers/dma/amlogic-dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/amlogic-dma.c b/drivers/dma/amlogic-dma.c
> index 78ee2337ae71..684121d13fca 100644
> --- a/drivers/dma/amlogic-dma.c
> +++ b/drivers/dma/amlogic-dma.c
> @@ -632,7 +632,7 @@ static int aml_dma_probe(struct platform_device *pdev)
>
>  	aml_dma->regmap = devm_regmap_init_mmio(&pdev->dev, aml_dma->base,
>  						&aml_regmap_config);
> -	if (IS_ERR_OR_NULL(aml_dma->regmap))
> +	if (IS_ERR(aml_dma->regmap))
>  		return PTR_ERR(aml_dma->regmap);
>
>  	aml_dma->clk = devm_clk_get_enabled(&pdev->dev, NULL);
>
> ---
> base-commit: 42c31fec1ca76b8b5f7759def122d418dff2cd4b
> change-id: 20261016-fix-a9-dma-complier-178b6e667983
>
> Best regards,
> --
> Xianwei Zhao <xianwei.zhao@amlogic.com>
>
>
