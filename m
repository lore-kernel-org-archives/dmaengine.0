Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010063.outbound.protection.outlook.com [52.101.84.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF32E3624CC;
	Fri, 14 Aug 2026 20:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786738689; cv=fail; b=krRRyPBoGTIzKdfp4eE1VRgKxDkhjwtrMo3OWjtsWCYGNYd5CWsON6O4hn3zI1gsjhkERPq2o7fZlA6XVFRVeRSseV1H0NydykFzvMG5utfeTQchQ/lYvhH1WYUI8ywmOuKr5KLu8p+ELsyNEBU04HjcCEKUU/P2Abg2nQCmr8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786738689; c=relaxed/simple;
	bh=/zYm3BAixEQO1vCAQM1Q3C4pVdyh1ToTxayIWJBUfdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZJsygKNVeLMPfG1WGNsVA3fB48rIlDHKTvTT8J/GoJb//VW9f4A6C+PJRpbLU3CbxAQkjpRtUH5uvjhFzRQkNrdrltuLqNKmR4Xq5rJOxe783SFWKTkxsQIg8yrWxxawrZI5EgHsGqIGJMRpx5gUROd8b98nkwmn6wVrxcgPvdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=c3PsAh1w; arc=fail smtp.client-ip=52.101.84.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="c3PsAh1w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hcplm5F4nS1dA3XjYCbvT2xe27rfgYqeLhkZcxbNrPM0kQpm+/djGD/P71TyVPuxSWCgVhpQh9OTfSjuIkvnAchWi/NGNWT1vHdjfRI16eZ3ITSYbHUDNS7HUp6ec+v4jeKRIFSde4Kay9DuZs71KelWJIk/AWfHyllYmqi1gzt5BqnNZEXsJfFhC9FKW6sl5pA0QfhvcGINsS8KQqhykWMF9Uoe65QywR4ny9e0/gYJ0M9EvZlLztwwjqdca5xgHu2EuALdm7J5RzfAs1eKo3IeIavz9dR4tqlqwsrcbAz8gxxvQZPE7wsKrsuumI96mQIdNE9GnWWpW0oRTk/bVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+70hAGVzvAAsTrUAoH9tPw43XI9ZpohG+2guBG/g39Q=;
 b=YuHZDR01lx7DSmBa9vfmG3Y+R4NFpmjsypSXFGAgwE+BkiY9oU2lyVQ+cTlELyvM2gjXKLz4aJm0dmd2spKT1P4aoRaB3ubMtaClfby+2gzaTYC297clf2kkyLYPt7niNfL5zT4w3/52NEiH3msIS/f84rDkWx1lDQmeIjICrgCOW/g0MJWIR6OmR5eHGG/qn7Rni29WRJ98guqEj1SjHfTUSsSXYRmQ3QIBa0y7pahUYdvjYZACs5XK6YoK8GggqHzjE7V7GloSqoRpr5V1tn1BLP5MQ9JBrSDQY9YxS+Fs/dcVe9/m3kHe5o/JbhEtHj9zCF8Q4F/byB1y5aGwxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+70hAGVzvAAsTrUAoH9tPw43XI9ZpohG+2guBG/g39Q=;
 b=c3PsAh1wI13p4/8XkSWYmEhTFWA29KH/z0kCsWbBAVupjbE+YDXAk+F9hgw7GDgp9hPZhudKKxBCG7K7z75+I2NsixeL/+YYkAopk1o7M3DrGGzDSqM873pB0nRL7nBu7Cx/lAyJ/eC0UJXKI8DUuGXco9WzqGraEQ0QvD73aPuyZKLxqorXctuNLqdG2+uFsHjhxWeJepE8HmqF4jecs2Eds8js+lzd+oqS7Hljy1GE4S9phQk8wCMug6ycFD5SD4CAfySehFKT82QXxJkw1k/8O5gtkNUjMOZLflUmvU6DrIzQ7OvSuyT57six7gu6ipGkeDawSkfRMVtvX2gpFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB12268.eurprd04.prod.outlook.com (2603:10a6:150:2c7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 20:18:02 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 20:18:02 +0000
Date: Fri, 14 Aug 2026 16:17:54 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Yixun Lan <dlan@kernel.org>, Guodong Xu <guodong@riscstar.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v2] dmaengine: mmp_pdma: fix wrong extended DRCMR base
 for SpacemiT K3
Message-ID: <an938oW_b_W-AYeE@lizhi-Precision-Tower-5810>
References: <20260727-k3-pdma-fix-drcmr-base-v2-1-afba55cba1f3@linux.spacemit.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-k3-pdma-fix-drcmr-base-v2-1-afba55cba1f3@linux.spacemit.com>
X-ClientProxiedBy: SA1PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB12268:EE_
X-MS-Office365-Filtering-Correlation-Id: bda2f911-cc09-4fb0-4c80-08defa41241e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|23010399003|10067099003|56012099006|6133799003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	VoC/PKMp3kwZemy1SurbsrVlR5XQKhjDFtAtKYreRPiLqH5j3iRKgf6mB08g/+F8Jjlt5/Pwya9TbVG1yxB0TzOPHvAa1J/+DVDpPd6JkWvXzEZLN+v9OX9lHQibz1Njpc9GDM0ndxktlHFFaaQhV7+AIzZhPQo70g8XdyC/nOhOuODQnzYLMED5H5kRJg0yV1XxYDSu+xiXP5hbYK4ScK5aWukQB/wN/uh6pK9yy2k8WSGt1gNqzVBai7CnRkkl07sozVUnEfP0WiLQj3yZfzbHAXOAZKKBrGhnZ059H/UIwKGoGdZ/PlxSK44gv7khGm9CKi1mEWsEZTeXvvr8Qq4gqdKpFOph/sT7twAjqu5uBXRCEEwLccnfb2exNB1/fhpM3nc2Hsbc92Yss3+4F6Hz4CdMV/ZC28UjHeQPQRbBKLRKUdv0pbj3s29ZKB8lzeyq9H9H8oeFkHwz5REsqXXd5h5cp3TTJGwlFV66DkBr+p5351AG1s9RA4MJALcyooraoCL8z1Sb6uaZKxi9C3h4QUFHAUMjEOdrvFHgweVZ1piQDlpIk4i0RujHm1aR21xIDdKg83B5jCT8RIDdkr4P3mAZRTdQZaHwoHqABxmgHVQ6i2KU6uR9hxR6r/HjMmIZ/6t+dzRey1UI488PctLGHboX7iIt+oJl3C0TjSo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(23010399003)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GxVC/DSel7ccdGWfwPtIQFGExdp/OkzKUSDyYGdLuWq9+QgemtRzSSYiAoGX?=
 =?us-ascii?Q?JPWo2lvtFY6agU+bJJZaTRNcAaP+jv2o3TIUk2Gxn/VbaQTU9wMOxhcj66yJ?=
 =?us-ascii?Q?3bABkJc3i4QOETyht5K+h+Yhaiv6rWpIHg+NopOivE23ucurON1xPw4QoP81?=
 =?us-ascii?Q?4D1PZg6q/N8RYP8ByEEo4LW9Pv9yM/KNkKTpMRRk0UqUt7m0RYrf8Nm2AU2+?=
 =?us-ascii?Q?NW1vi80pEsC8MHmFRrgsf8udjBA3NV5CQ3D3v2T7BPdqA+rg/0kqequxUMKb?=
 =?us-ascii?Q?4TIndEgTX8H2jCgHrU96qoswL4UtXNihZDbftTP/uZgpoi9yOj9eRduUJNNd?=
 =?us-ascii?Q?FQJ0aH6ruJRCkT46SGSGUZ0+YbXpkua3mogO/6oar9efY8AO+jUTD2iHM1Zt?=
 =?us-ascii?Q?miM1/Nu+/bY4shEUQ7kJIyGpauojQtxvD6fUgfjcOHj0imC4XpK3ZhsuH0SF?=
 =?us-ascii?Q?ryRdZZOUWvvGFdx/RwmpBiR7YIey8Qfyg+z7jzcvt6T/z+30mpjZVtT9j2An?=
 =?us-ascii?Q?TEB/4qSo1ZC9sa9A9NuWVUMO7YtDgzn+td8+yowYwh3o7IrVEop2rD4q43Za?=
 =?us-ascii?Q?N3hX+5MDt5o1DSEsvRoT8DKHlKsibo2IQ71lADSdOHB1lcdh42V1cT9usyWr?=
 =?us-ascii?Q?B19eg6T7LSeSNsSNNxAq7NtN/grTYbgwOi+/wDXSICpn+jhM6xjYxtX08VWW?=
 =?us-ascii?Q?NnR4QBnk+OWvabR47K9bqfEYeP2W7mujChOCzEHt7102IScF/M9Bbf1353p4?=
 =?us-ascii?Q?VXDVUfQltMC0BXHlYscV91OPcbNwF49sKUgphwvG+YUoEes50BaUs6M0fGOM?=
 =?us-ascii?Q?HqENWyxa6wK8yIU82+FKb4q91Mx+d/shqjPDzexWX7/i5RQeY+jLH5GMFNJj?=
 =?us-ascii?Q?g++z7t/3SM6NcoXQlpkq1widI+Fcg6ouRXhWf3VmJ98VsXDIkGroNsg2Xbrp?=
 =?us-ascii?Q?ablUrNxK+KglpVySXoAPQg0fyLMkSYjJBpCpOpfKWMakcne91p9tP6ZPNXwY?=
 =?us-ascii?Q?eOVIHKt7pvDRFRYE6LGDrvHAqbpUxgLsdwi7ZoEuC1tftGQyoEpK/1ITYwuw?=
 =?us-ascii?Q?q61Db6F5dOLHYUIhNTfkW6H7nORwVLqMN0cRROUyijfg3Vp0nnIfT7ikr6n3?=
 =?us-ascii?Q?fEiOIXDKTiH3mwrynKueWNB9HvCRVg7jq9VU1RBPt3pefUHvkMFRRWWCcutu?=
 =?us-ascii?Q?jNcYSRVehd4iehOYz8BgHSoG3jLDgStOFARPsVhnfsQIaI3JKwkjoAKRFLLr?=
 =?us-ascii?Q?pG/TDSu/h5yLivF/Ewc+Pk5JESeLw+RynPLGfzN+WeLqo2tXp30YWXh9awtN?=
 =?us-ascii?Q?Ku8ILbRgUPRxdFDzfrDU1fJs2sIi2kHT2t+NZ3ihq2DmdrDCqt4cY/Mt6f8G?=
 =?us-ascii?Q?VRtMgofCF9JRxZLra41MMkQqFNNJtf2NQaf8UPGK3ZfyaWfVzHG40+PqOQcT?=
 =?us-ascii?Q?lA6TpIGPeSN6GWNpVf3amjzNkOtekmvJi49RVLiu5ayxiR/fXO5zZi2MsX5F?=
 =?us-ascii?Q?zxDyFX1678IZZkEOqx+pI5IhYnBnSVtSt5t0tH6dlnlsxM2V5LWC0C740trR?=
 =?us-ascii?Q?6cgyYrgsnmm/qBm6xq42HHdV38WJVajWaK5AHO5Y2gZbWt57gZOuwEr8jbGa?=
 =?us-ascii?Q?//aiehddOfxzrMASO5O72DMC3AJTfqMIghHw7zeA6PNziSBBpjJW2bFgvMvd?=
 =?us-ascii?Q?u7i2x5Ekg/i2LvNLNqC4w9IAkcJ/dCRn8cxC4QykJjo3XX9CyBWdjUnbFddw?=
 =?us-ascii?Q?7yGgMhmt8UKBDL+2o5zSAKMW/I3VLAf1ZOq8H/1NaiMLjypWsyqD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bda2f911-cc09-4fb0-4c80-08defa41241e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 20:18:02.1121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tST6H0z4HD8CSFghaWtS2kgrptgymboUDO5zVlAKMasKq0/zOwPt+Xg22hkOBfLpSoT2i7wKbC5VsFypUvMSjPv800p7ALyUIzzLX/kw+ieLQo4VNdTERS2g94d4mNWe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12268

On Mon, Jul 27, 2026 at 01:26:15AM -0700, Troy Mitchell wrote:
> The extended DRCMR window on SpacemiT K3 starts at 0x1100. Commit
> 6587b8661a0b ("dmaengine: mmp_pdma: add SpacemiT K3 support") incorrectly
> set it to 0x1000, causing DRCMR accesses for request IDs >= 64 to target
> offsets 0x100 too low.
>
> The 0x1100 base has been verified on K3 silicon using real SPI and QSPI
> DMA transactions. The K3 DMA documentation [1] was updated on June 24,
> 2026, to reflect the corrected register addresses.
>
> Drop the bogus DRCMR_EXT_BASE_K3 macro and reuse
> DRCMR_EXT_BASE_DEFAULT for the K3 ops.
>
> Fixes: 6587b8661a0b ("dmaengine: mmp_pdma: add SpacemiT K3 support")
> Link: https://www.spacemit.com/community/document/info?nodepath=hardware/key_stone/k3/k3_docs/k3_usermanual/16_peripherals/dma.md&lang=en [1]
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> This is a minimal fix for the wrong DRCMR_EXT_BASE_K3 value introduced
> by commit 6587b8661a0b ("dmaengine: mmp_pdma: add SpacemiT K3 support").
> K3 silicon uses 0x1100 as the extended DRCMR base, so the K3 ops now
> reuse DRCMR_EXT_BASE_DEFAULT.
>
> I deliberately kept the per-ops drcmr_ext_base field and the
> DRCMR_EXT_BASE_DEFAULT macro to preserve the extensibility that was
> introduced together with the helper refactor, in case a future PDMA
> variant ends up using a different extended base. If reviewers prefer
> to drop this abstraction entirely and collapse it back to a single
> constant now that all known users share the same value, I am happy to
> send a v3 that removes the drcmr_ext_base ops field as a cleanup.
> ---
> Changes in v2:
> - Reword the commit message to remove the inaccurate K1 comparison.
> - Mention successful SPI and QSPI DMA tests on K3 silicon in the commit
>   message.
> - Add a link to the corrected K3 DMA documentation, updated June 24,
>   2026.
> - Link to v1: https://patch.msgid.link/20260615-k3-pdma-fix-drcmr-base-v1-1-ee1af124199f@linux.spacemit.com
>
> To: Vinod Koul <vkoul@kernel.org>
> To: Frank Li <Frank.Li@kernel.org>
> To: Yixun Lan <dlan@kernel.org>
> To: Guodong Xu <guodong@riscstar.com>
> To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> To: Paul Walmsley <pjw@kernel.org>
> To: Palmer Dabbelt <palmer@dabbelt.com>
> To: Albert Ou <aou@eecs.berkeley.edu>
> To: Alexandre Ghiti <alex@ghiti.fr>
> Cc: dmaengine@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: spacemit@lists.linux.dev
> ---
>  drivers/dma/mmp_pdma.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
> index 386e85cd4882..78e3e07e681d 100644
> --- a/drivers/dma/mmp_pdma.c
> +++ b/drivers/dma/mmp_pdma.c
> @@ -52,7 +52,6 @@
>  #define DCSR_EORINTR	BIT(9)	/* The end of Receive */
>
>  #define DRCMR_BASE		0x0100
> -#define DRCMR_EXT_BASE_K3	0x1000
>  #define DRCMR_EXT_BASE_DEFAULT	0x1100
>  #define DRCMR_REQ_LIMIT		64
>  #define DRCMR_MAPVLD	BIT(7)	/* Map Valid (read / write) */
> @@ -1219,7 +1218,7 @@ static const struct mmp_pdma_ops spacemit_k3_pdma_ops = {
>  	.get_desc_dst_addr = get_desc_dst_addr_64,
>  	.run_bits = (DCSR_RUN | DCSR_LPAEEN | DCSR_EORIRQEN | DCSR_EORSTOPEN),
>  	.dma_width = 64,
> -	.drcmr_ext_base = DRCMR_EXT_BASE_K3,
> +	.drcmr_ext_base = DRCMR_EXT_BASE_DEFAULT,
>  };
>
>  static const struct of_device_id mmp_pdma_dt_ids[] = {
>
> ---
> base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
> change-id: 20260615-k3-pdma-fix-drcmr-base-326536770427
>
> Best regards,
> --
> Troy Mitchell <troy.mitchell@linux.spacemit.com>
>
