Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011014.outbound.protection.outlook.com [40.107.130.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3787F258CE5;
	Tue, 15 Sep 2026 18:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789496091; cv=fail; b=HBy8pO3jjDoLJSolhKWfdew3N9V6R21CvDDwP7nuKDtFhblA5/eMA5VEKBGXNfGg+1TL2ChaymuMgHFT6d35z8WP3t/Ur6vBCN4wFvi7Fs3y7fClVuZGmFo6rOjHkeU8OVaa9Q4/BMrVs0XbN0IEKN1VMFji01Gu8Q7knQ4+WEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789496091; c=relaxed/simple;
	bh=S5iw0JKF5mfyGTyOT2aO48ANiWHB2LNGutz//LSGyoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Po0x1/r/Omij2UNj8BQcSFRjPdm92ktYl6HmW5YpwymXDf4c43XP+l52uzVdoJ+27X6Ramc5gkCtK1wEC28EKmjg7Z8B65G/FtAPVYSSu4hebFi+KQrGwu6dJToxX2hbIUUncRcskF3AsLQVV5ilgBcgOmbb4MgqcNmvcvLCQYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PDy8Mknl; arc=fail smtp.client-ip=40.107.130.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PDy8Mknl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m80frfDLF1DXcESqsY0BcCCoTn/2i11YV1rY+mTqtVuLIrU2kbBvCjR25JDKMeBnHFck2QBH8525sBQmXP5yDL/0q5HeGPvP3tnusc+bJA4n3q4rxqzYznSa5OKDSr9splR7sCQpb0TgQVTUNho9tmdYOb6RkgNOUrEXOweO9y3HJh0jVfQuBcyCMbhrLP1EVeQTEl5Fk9m4phHO6dFXzx2hRkk+EzfynsxuMpgJsvkx0x4sYCeErzz1Q0gne1w32ubT+r9R/JFw82f4M03fScwYTtRUo8SKax0zSOreZvQsGRIQQ4hoPnOxvdnXaCZ1vVyoNM6safmy8M69afJjoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ne+5wYMRYFgtilpOXcP/8FcYbqvyIMIdGoBJJyzUpIU=;
 b=DfUzTURJAvXMiiaCRMEgr6Cq0xWNCpaHSmY7YdAM6hBytKAcKLWZr5GcLU6uMj2uHW1f/Np2QHYtH5MrEYP+lRWRpLroD2tkwnElj5xO5O+rzNTtedPFZBxP0A8P6BiEtsTn4gwY9H/82HYEbYk6KWY53JwBJfvkZcAUI13LRi2Gb18NcuoGue+djU3tdBhor1TKlI/Oljc1ET15Vc6Y9tln6oxYZ4sj8wldOGiZnGEzo73d6e8A2n0WrKY5iiO6SwWm3VqrfE/rPCYZUnbaGR6AqfSyVFn4B6e/LeRu+5Hfdx7E1FOBy/EfRZyMVivw1C1j7dRtXvR5zL9W3bWRJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ne+5wYMRYFgtilpOXcP/8FcYbqvyIMIdGoBJJyzUpIU=;
 b=PDy8MknlKGtI/VRUXM2s3Z/Q7UM5rUGJHj/NDSjJpyXKYiZxMgBqVsYVHDL/dMXbApOdIOHLo2sJ7Jvv4c/wmrCLAPax5T0LL3USkk5B7WZyAk+khx0+0uS1dP4iMxSPbNLLgAnsesVVIrABdTkRfGSEdfOoQy2Rtk/5+J2v4GEWf4JG0LrVhm12DVF3HWnLikCGMmFa68unp0uYkD1K5eOZzkgsS4y9T4E4PeVOzQj6y0lZLMWrvFNtdgbJw+p372pH2bdYbI8NMVzTfoc4Tbit6QrJSxXC05tLoCtr4itejAwYpU2rtF2D6Mey11nN+12SSIX/6n47tgJcObZHfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV4PR04MB11451.eurprd04.prod.outlook.com (2603:10a6:150:29b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 18:14:44 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Tue, 15 Sep 2026
 18:14:44 +0000
Date: Tue, 15 Sep 2026 14:14:35 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Yuanshen Cao <alex.caoys@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/5] dmaengine: sun6i-dma: Support variable address
 widths using masks
Message-ID: <aqmLCxZlczPK-7Ax@lizhi-Precision-Tower-5810>
References: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
 <20260826-sun60i-a733-dma-v5-2-abc5229b441e@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826-sun60i-a733-dma-v5-2-abc5229b441e@gmail.com>
X-ClientProxiedBy: PH8P223CA0001.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::32) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV4PR04MB11451:EE_
X-MS-Office365-Filtering-Correlation-Id: 525c74ec-0c9d-49f5-a01e-08df135537f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|7416014|366016|1800799024|376014|18002099003|22082099003|3023799007|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	OoGP9MsBFL9ImA82CStja6evaoLy2ESG4EIQU2C+j9IBwA2dq2+7BPE6rV2ZgpKSNrp6ouGZwyfURMfsyUKWJrdR/amvXiHQOaZtDavEE6DrRWQ7NUS+dDTJgWIFN63tCDxHMeNI+2dgaAi/5N3dwSZM6NATBQNYE7lWPCzCAnCXiNn9FQ6hgxjK5uIaJ7y7ZQBVByXpd04SSaQyQ8djWfC5sAyfmCH55dK9uZ4VE/Z1gg/iVB98No1M5usqsTFgsrjFrUGUNnPa5DipuB4sOwMk4jwtL0pSf5aDaawT7j73eBCzUKIKzwhuwblZmvBYMIyPupUBhACOg0VS47Dv+sFJ3cu+/c2q0pbkDkeJZkhPNTEIk931/cbHOQR99M34vWaxCL65XQtG6t3DdCVtGCj8rCE6nyl68KkHQCKi17lchlzw2df3JKa4zFa9YNjqNTMBbmOn9mVyM8qjJMkvfUWjwGHLI0G4fEiwxGwAggdKRYGsBHVwtjbkKiWB9fhKCoKUfPdWTOv5Q/g+kZLFdR7RDdYmTokTpWo7E46h2kVMx1dHOx0Nt+zIsudF/YxsftuJiCMFjnrbZLJISWJz0HEgoTOIUI8reiRSAlcfAD1axbvdKFgVMEG7SXeBSEfSVtKbBDTHEgZBVrjHNHMLaBcMGLIWmAg/F0SkwE2TdE0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(7416014)(366016)(1800799024)(376014)(18002099003)(22082099003)(3023799007)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8OyAEryzv20iXRTu1Td+LeA7eUqjNEU043AaaNa+mnlcZOhGGfgd4tJUnpMC?=
 =?us-ascii?Q?0Wvgufu4QrZrNWMd8gIofP15F2k6veFMymskma0Hbd+PymCO1f6qYsQEzDCR?=
 =?us-ascii?Q?IOIpC+zFhD4MGSHxl6IrTDdTi+8OCpX3lRpO9EtwYNBja20pAruK2kL6Rf4d?=
 =?us-ascii?Q?XULRJV7a0ndKsY7wJSiPIzyRVu+/fiKl9rEtsPCH14aDt9OYWhtWNn4uxPuN?=
 =?us-ascii?Q?mBW0ZpE2LzeKOx+WToiOxZUoOHroFZF1Pz7wU7F8NtvBEgm3nyxwXF8aXY0m?=
 =?us-ascii?Q?TohAzJI3+sGIIxzUt/60YLY6enjWieWcgcjpBnnvS3nKScNC1f0E0UD75cBe?=
 =?us-ascii?Q?f0uVmNd1MV1edc70YHLjmN7FnFh5WO64AjzvFh4XsicKDcXxOo3yjd65qM6W?=
 =?us-ascii?Q?3USSXWgcq8zC6Fcjwhth8m60P0KaQFnDw8hcmR0F05ILOrCkASPS1TXDd/TS?=
 =?us-ascii?Q?ckNqb6sYV87HpriQIWxak+PBTwoRBFx+Khj+QcgktwZsIcHtoKDd5GdYRuNZ?=
 =?us-ascii?Q?RhBcNoJ58saty/y+Syu2+jyaVXNC6Z6eqbZTnQlaic1lLBMCLv0ABiKLZryV?=
 =?us-ascii?Q?e84Cro6BsGffliplGsi+C3+GXvrcd3BicDHWGcf3QxmLb4nnWD54xAmzxJFt?=
 =?us-ascii?Q?hTXUfGaNXpspWN3hUOoqfpe7v2APKBY3fgMcc4gEuSQlOHLE5AaTU2yokZOG?=
 =?us-ascii?Q?Gy47P3nIaqWOoW0WimetWQLpR4LLR3gjbGfKeHT5O7WxzXDA5X8uPyMFsbFv?=
 =?us-ascii?Q?UYrcPtK2INg5LG4jAoeEGGP38Q2UtkvIto47Kiz9Wrjk0t93vnfMbgKKAww1?=
 =?us-ascii?Q?jLYppBS9oTgwrOvM8L5XMtApRrLaT6Xe4k18He3dHpn8aVQDiyr0Bqk4qrQd?=
 =?us-ascii?Q?d0Z/ir+bKZObeJGwWwbfSXdBUcDgCJVfzHRyQMfijN4Sw8GRxCYrt/aKPQd/?=
 =?us-ascii?Q?gdPPvMON9qv7bzWqFeYUsmK3iwaoDXRgaq47IQpj/3GJ0UMfy0wyyIjWf9sJ?=
 =?us-ascii?Q?Yase8GEqgPP6ThSBqY3B6wS3nG2xOwrl5BN6ISiuK38f7IS5+nBnYV3NfWll?=
 =?us-ascii?Q?3FZ5kWi+zfxCYTWFIfI1Ls7evV3+fb6rB8pLDwyRm9szegdGr7ZXoynUbiiR?=
 =?us-ascii?Q?ebUuZe8PERjDaICsFeYlWh6AypEwpom7JNSFE/GRp6AyFm3rE7iTtMdr3/xj?=
 =?us-ascii?Q?3XEX8RqWlEcciSyLmeHAPslx2lxL49UB3ces60mFasw2GnPVPo0gJxtPaFxX?=
 =?us-ascii?Q?stoJqF0J77B6FX0NmWty/coAa3AhDxjzYa3BJb8uPLp/QdlQYqazCM7IMR+h?=
 =?us-ascii?Q?CtJBZZZo5ohQEn1hbFNXC8c6e9e7CAdnLbbSlCtl4HmJc9uNVvIVChxkvW3p?=
 =?us-ascii?Q?JnTBR2Rxi9QYCxoekbMO9AgmpVQXqQymq3uJoSqprnLb2EMIYaFujiyYYf/O?=
 =?us-ascii?Q?dg7cYFY7mvRTPmli3tN7xAFpBfR1cGqdAfdxM/aStFg5vMxBkCFn9iVVuVp+?=
 =?us-ascii?Q?wYlpk7FcL/rVH7AJkjcR+b0bWFdu3NHwRaZJGY3XEJMw+5g5bjK76Ygia9gx?=
 =?us-ascii?Q?TDGtZj067kH1mgD6mksVgz3/+sI/Kl10wJkizKEbuTnCaNftOR0gv6R9xPRS?=
 =?us-ascii?Q?gfbuEhpGymwNl8J/wdadNhLjLA2lbzkWWDzIjWYyKKJCpjvltoKGmbEnKM5L?=
 =?us-ascii?Q?lnIiTdzI9t14+agZIW/IzF6sMtNmO+zmmNQNg9ek1YiPqvKbkp8C4IgGol46?=
 =?us-ascii?Q?CKQYxTyUiM6+WD45N0D0N/LeiOo4621pxr3imP+wFj0w7Ko+CR4o?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 525c74ec-0c9d-49f5-a01e-08df135537f4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 18:14:44.3717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mwR35gmFnZZa3rNrSqPHgeYUNhH91aLrj9syrMFZmFmP1GRJXCRyF1UorCq+Yk8OC/pVr3eHlCBvhfsC+pHiGt7EGBPW4w3cwo5Ms0qzanEKcP4HkLKla96/K6v/JAXf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11451

On Wed, Aug 26, 2026 at 02:40:28AM +0000, Yuanshen Cao wrote:
> The Allwinner A733 DMA controller supports higher addresses (up to
> 32G) compared to previous generations. The existing `sun6i_dma_set_addr`
> function uses hardcoded logic for setting the high-address bits in the
> LLI parameters.
>
> Add `src_high_addr_mask` and `dst_high_addr_mask` to `struct
> sun6i_dma_config` to handle different high-address bitfield mappings.
> Update `sun6i_dma_set_addr` to use these masks via `field_prep()`,
> allowing the driver to support variable address widths.
>
> Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/dma/sun6i-dma.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index f305fbfb3545..1ffd870d9594 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -7,6 +7,7 @@
>   * Maxime Ripard <maxime.ripard@free-electrons.com>
>   */
>
> +#include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/dma-mapping.h>
> @@ -103,8 +104,8 @@
>   * The LLI link physical address is also mangled, but we avoid dealing
>   * with that by allocating LLIs from the DMA32 zone.
>   */
> -#define SRC_HIGH_ADDR(x)		(((x) & 0x3U) << 16)
> -#define DST_HIGH_ADDR(x)		(((x) & 0x3U) << 18)
> +#define SRC_HIGH_ADDR_MASK	GENMASK(17, 16)
> +#define DST_HIGH_ADDR_MASK	GENMASK(19, 18)
>
>  /*
>   * Various hardware related defines
> @@ -147,7 +148,8 @@ struct sun6i_dma_config {
>  	u32 dst_burst_lengths;
>  	u32 src_addr_widths;
>  	u32 dst_addr_widths;
> -	bool has_high_addr;
> +	u32 src_high_addr_mask;
> +	u32 dst_high_addr_mask;
>  	bool has_mbus_clk;
>  	u32 irq_stride;
>  	u32 irq_en_offset;
> @@ -687,9 +689,10 @@ static inline void sun6i_dma_set_addr(struct sun6i_dma_dev *sdev,
>  	v_lli->src = lower_32_bits(src);
>  	v_lli->dst = lower_32_bits(dst);
>
> -	if (sdev->cfg->has_high_addr)
> -		v_lli->para |= SRC_HIGH_ADDR(upper_32_bits(src)) |
> -			       DST_HIGH_ADDR(upper_32_bits(dst));
> +	if (sdev->cfg->src_high_addr_mask)
> +		v_lli->para |=
> +			field_prep(sdev->cfg->src_high_addr_mask, upper_32_bits(src)) |
> +			field_prep(sdev->cfg->dst_high_addr_mask, upper_32_bits(dst));
>  }
>
>  static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_memcpy(
> @@ -1283,7 +1286,8 @@ static struct sun6i_dma_config sun50i_a100_dma_cfg = {
>  			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
>  			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
>  			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
> -	.has_high_addr = true,
> +	.src_high_addr_mask = SRC_HIGH_ADDR_MASK,
> +	.dst_high_addr_mask = DST_HIGH_ADDR_MASK,
>  	.has_mbus_clk = true,
>  	SUN6I_DMA_IRQ_A31_COMMON_CFG
>  };
>
> --
> 2.55.0
>
