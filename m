Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010018.outbound.protection.outlook.com [52.101.69.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4A151C06B;
	Wed, 30 Sep 2026 21:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790805406; cv=fail; b=JNTKW2W0sqBp/t8ASqA5fObBxXhbOlueOIvCQvHINn6txnOUjjYEMQgw0dWiUt0CtONxzdmzf9Z8zyYjPnwSapVD+PUlcFbXpz06Z6KUWNa9tfxgr1ZiDKNdGfWAOD8kc8VFkgFmcxBay3mSGXEbBgyQnMed6KsLDVQaa6axMKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790805406; c=relaxed/simple;
	bh=Og+fWI0Mu+iKLOEclouO/+T68xGEuKUNkbLkCLzy+Ig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oTqatCLB64Es6hR1IOWEURLFeC4KML7x8ZoNEUeoHwAZIV6Cr7xTKVOCtULIR9VSPsq8YQm2VEbHgQys4fFcdj9TGd7Re22zXqmvfimW3MH1nvszoSSxWBST2h42Epl8IS+f5XEl9Zjjjfusy073SrgezQSnf0mh5RgEHaxBX0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iaWtV+aG; arc=fail smtp.client-ip=52.101.69.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iaWtV+aG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZAUKfuwjD0FVPG654gt3zBPMLLUbBDPZQA/TqaCgnOUPyT+3wCCdP28vNneWz8KqpgUMKcJveAdidMbpQddf3UEAeqIv5SBfU1PtnygYdcNPnwO7JChTlxiGjozg9A4jtgCzchSntuhn1h4kMVobjrDy7eeGhSOFLH20f5OtHx5+ynFWmLL0AupwhS+agqkn8crWqPU7hkaOPfh4+mwxiWLJhDgP+2ZK+11p5nB7KV7znANgz55e7h9y3JMuCK+UpKQNytHgBDMxfWBsotehEkHoCkFH4HlKbd64cpNRsbxR/3m/rDnhoZ/B2yo3Z/0e/l4A4TV3foR33ZGvVuVGeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyeKDyH2tK2GVMbhQrGRg/9TyRyebgZazp3IQOFl7Zs=;
 b=yJguelrF2Yz1SbEOUn/SfMgB22Up4HIvdkYk0XUnL5sRthF4Al/YQTZlc8Q5P0rBFQmnJVpekJBpEkHMDzyybIem2MadfxZPobYuNjmRRpFiUm0Ap1s56qqsAiKVCgvMaRN9IqZZTMXAvgQ3Ws9R9DhIFAWRbBnlSMyTudft6FGYdbzwgKtulpTfOwd1M3PYzc61EqiELmCMqz38H/kezNeGO1bSiqXsgrIHUzVje3xXSQ4V8yY3z3zL3IxY2pjSP4YrX66aCc9DP1kaLRWIRGKTez/2rS40ThYENfGGDhmV9q+yOq88JOrNGDkZSFYUaieAHP6SX76QaO98j3jiUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyeKDyH2tK2GVMbhQrGRg/9TyRyebgZazp3IQOFl7Zs=;
 b=iaWtV+aG2WO1nZBZxolY1xLZakpDkjRjJFxDoXsyS+UhTddaU/kJxmhsn6rqyCCehdEkBM6SHGbwzCu3fS8cTEJvZi0A1KkS1YzYaBgPEdvNtb+LCV2MoRRFLrTDBzAbJpOdsPYaWTfJIebiTiMHt8bLPj3SolzYMfZZLB9C7Ui3e7YWA3qoAevh9U+4Fks4ylNJ46EFNg7rlA8hj7TG8QIcz9mz8IxWk2VXDcEglCO/OvbxyJSPf19acSC4AnuZ6vGUC8vX97DmcF1XOgqzNyELSdXF30FQQtHn7kE5UQ+gmC2CEGWMYjJyQUwKyv/07LXjciwdSy5hlm/huJOF8w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBAPR04MB7477.eurprd04.prod.outlook.com (2603:10a6:10:1a9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 21:56:40 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 21:56:40 +0000
Date: Wed, 30 Sep 2026 17:56:31 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>, devicetree@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>
Subject: Re: [PATCH 3/3] dmaengine: loongson: Add Loongson-2K0300 APB DMA mux
 driver
Message-ID: <ar2Fj9vM4GiGRPby@lizhi-Precision-Tower-5810>
References: <cover.1790068409.git.zhoubinbin@loongson.cn>
 <a7d2dae38291f9d23e5a930a394bc85d6c1db438.1790068409.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7d2dae38291f9d23e5a930a394bc85d6c1db438.1790068409.git.zhoubinbin@loongson.cn>
X-ClientProxiedBy: PH7PR17CA0032.namprd17.prod.outlook.com
 (2603:10b6:510:323::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBAPR04MB7477:EE_
X-MS-Office365-Filtering-Correlation-Id: 516d73c6-62f3-4d20-40d6-08df1f3db50b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|1800799024|376014|7416014|10067099003|11063799006|56012099006|5023799004|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gIgcGhrMCb60Wxz+K/EJWQ+vf4ynpBNCKSohS0yOA7+ypXKc2IAob8L98hcEzjRH1VDjMyx5LYpoE9rPXXI/LBFUmsmUvYa5y2uYXALaqFpNE+Ks/pzADI+V/S1yHcVdvimV8EjaqAzePLG13OIZo167kTL9+cAdtR8gzl+Jg9MdM+Ab5OxWjJQzwGcxhxiZATBYJT5bS/YWXA34ZooaIeWWo3ls6laaM5s6RQEq/7dV3G7DUsjQ00DidKPKYFwGd6u97QPgw5kvkcIQrsRWOA2lRScu1ZTgTH0t1TA37JbUucqX24WnJsM87lR59ie6h78lgDEPBQOJ4AvHle45tjCutvTXnKK1Px4oVflZPZu2oCkjuMH+s1g8xuAiI/FPIq5tThH66iMJecDecac9HU3IqjwiszYt2UR8lfcjpQMS0tKtJ+23AXf7QaE1iso1N9wvLEjPMv20ysvHUp8WkssvJ1txL9QMBkQS0dgTMGILqUH3jG1ZxQeRA7nkXJFw9cUB+XNkMw58e0CTS0jcaBQKLPpVAYABa7BLEVQVV60ANLe4jIc+D1Lqc1g1BYbKZ6LIFCDiDelR2DdQf90IMVOUsRA1PHeKkLLN7/nemmmxH6bkzDLxnzN+WnA7q75uqYSTUbRdyPYyX6tlLhlxF5iz7GgMdb9QA1ihebtMYXg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(1800799024)(376014)(7416014)(10067099003)(11063799006)(56012099006)(5023799004)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGFlRmJzcUdPeS9sQ0R6SE9acVQvYmtyUlZrM0xEVVBuS2o1RG96cjVJeUpD?=
 =?utf-8?B?bHdhSnUrdXVoeXJ2ekFFTWtMTlJpUGZyY1FpazExUmRCTlJmSEtGMWdsd3Nu?=
 =?utf-8?B?WDVIOWkyRDlkSjQvNk91UGx2ek9RU3BMZ2RXVG1tK0NHOXFhekl1R2FFWjYv?=
 =?utf-8?B?NUl6VkNzWkNtOVVKOG44SkZGdzluNHdRbGhoQnZQNFp0RE1QeGRxVjR2b01y?=
 =?utf-8?B?dnoyczZteHh4QTQrRzA5YytBQWhYcVc3cGFqaE8wWCtnQUlHMERSbXdYTjhE?=
 =?utf-8?B?ZzFSNk1MYWZldWJsNmtSZmRMaWQwdFZ5dnZhaDVVS1dHbFRuWVp6NXJ2eWV6?=
 =?utf-8?B?M2ZNV0lLeFBHUXZNSUVSU2huQVVORlZiV0I5NldLcWptbjQ2bUtUT3hDemQz?=
 =?utf-8?B?VnRUanJPclpybXhCd0lXNTN2b2luRHh3cG8wN01iSGIzTnl2S2pVNTk4Y1Fu?=
 =?utf-8?B?WERXOFhNNWhBNk9ZR1hzSE1LbkV3WEIybHpYeWZTVjRCM2NicFJUVDRwNHZm?=
 =?utf-8?B?dTI2TDZkNWY2T1BhRks3SUp5aDVGS09pck41MmtabUNzVlRaTVVzdmN6VUJ1?=
 =?utf-8?B?ZXYrbW00Lzd3ekZlU29tNHJ6SnlqZENTN0JhYS9iMUl3Z3dGRmNFQ1pDT3FE?=
 =?utf-8?B?Q1JVeThEMmptY3hySkV2TzlRSjdKSWNXWEk2OXRQNzFIS2RIUklJUDdQL2Vz?=
 =?utf-8?B?WlhLZitLbjZVK1FyWE9taTN1c3RtOEVGbE8zbXhicmV6b0pURnVMdy8zNWdE?=
 =?utf-8?B?M1dQelA2V1YwV2lHdmZkNk85VWMyTEtQVVM3RXpuM3l0WHMrSEVGSVpVWmZV?=
 =?utf-8?B?bTlXdk05aVgxVjlJVFZkaUlkNVZ6dFJaWlNRM2ZGUXM5TC9IVEg0OWRzYmJD?=
 =?utf-8?B?V3A4TG5EclNidWNrbG1RaXE3ZFVxRjhGTXo2eXdDMVFiWGVWdGU0bnNRL29W?=
 =?utf-8?B?SnlZdG16VHpaMnlhL1RONnluY2d4blVBR1gvVEcyUDVUbGdGWUxQaXUvUTZq?=
 =?utf-8?B?MXo5QTgxdjlPUkVtbWJOSkxPMXpFR1VQUXMwVkxONUdMaTdrYXJoa1p5cDRq?=
 =?utf-8?B?bWVxRStWSTBXdDI5NE9Gcjl6V2Q1azZ1VnRxa3ZRTzhCTFNIc0Y1eTJJWHQ1?=
 =?utf-8?B?bHpXUWxqcXNodGFEZzJkMEplRFc1TjdOUHhVb054Sk8vNmRscTVybWZCYytl?=
 =?utf-8?B?QUMyYy9qRFNQazRIZUhJUFpKS2hHbWhjelNZSlBkQ0hEM0ZVcityWHdINjdi?=
 =?utf-8?B?a3dqZlB4L3VVNmg2Snp6TkpNbXBrV3hyRGlzVVZ6T1hZTWw0MWJ0a3Z1ejJ2?=
 =?utf-8?B?UzZ4RDhFM1NkUGhYWTVjZEg3RE92cHI0UlBOc1RzRlJwTm91dGFVbnZiL0k2?=
 =?utf-8?B?dEhTdjc5RXMwc1NEZjZ1Q01RMFhLQy9ESmlBRHpyU2s2Tk9qSkIxMjFNVDhH?=
 =?utf-8?B?TVRyT2k3NExXeW5HaEo4K1JTUElhS3kxL1hvZ1dUUDN3cExCcnk4bEkvRm5a?=
 =?utf-8?B?Q25wRG1oY1dKaXlsMG9sNjFOZW5HZ095NDc4dFU1azBnQWNwYjExakp0ZGNn?=
 =?utf-8?B?QmI4TmZkRkhDWGp4T2h5TEJjOURQa0k3c2hDa1dMWGd5OEo2WjlUdXRxTzhp?=
 =?utf-8?B?eUllazFmZmJsb0lnWUNzZUdTRXl3VDh3VHNxV1ZpMERlZVRobjBqc2w4NDl4?=
 =?utf-8?B?RGs3N2dxclBtcmdWZnJTbkpaVndRQUt5YVpUZG9YaXlrQ0V2VjFqWlF5T0hB?=
 =?utf-8?B?cFFPVjRPbjlsb2o4Um1qQ1RxUjNtNXFoNDBrUkdCbC84VEV0MzJzZkpGUElZ?=
 =?utf-8?B?bEFQVWZUS3RVRU41bVNHKzFwOXVaU0RGOVhlQWtqbG5JUEZVbFZTMjhVSlB4?=
 =?utf-8?B?VGhVbDRPQnV6OHNYSnJwRW5UVE9iaXhqNGdoWDhNT0tIRTVQa250M1RXdEV0?=
 =?utf-8?B?b09Tc2k3ZHRGcXhtVU5FV2oxRG1VMUk4VWxOZ0haY1FBQmJjcm1Zb215R0hx?=
 =?utf-8?B?emRGbEp0blZta0lSZG44ZWw3QkJTMExia0ZnM2U4VE5PYjY2QlNDNHpxNDMv?=
 =?utf-8?B?M2M5QllRMU1GQlRYam9PZXJKYTk3UmZCVmh0aDF3YU5TaGNWd0lUNW5Qb3M5?=
 =?utf-8?B?aldqRG91cHNrY1Z1ZXN0dWd4T2Z5dmllcDNPaGorY1BaQnZkOFRFODNkd3U4?=
 =?utf-8?B?WGk3NXdRUXFpaVFzS2NqUVlEY0FuSmVUWFNMVURPcElBMTVwVExCQ3lUc0xp?=
 =?utf-8?B?cHlXQmdoVkhzNVZFYSt2bjBlejROTlIwanVBcnR1R3JxU3drMHFRS2pzQ1NE?=
 =?utf-8?B?RGV4TTd6ZFgwYlhxWUVJOGpRYjFQNGk1UWtkWEI4N0Fab0dzL2UxdDFSY3dv?=
 =?utf-8?Q?nMGM+89eSATFDKLsKdORYShcovUTWB8THaDoF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 516d73c6-62f3-4d20-40d6-08df1f3db50b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 21:56:40.2565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R2vw4NgZvsfrwvvD3eI5jqXRPgV4iPbzLX47dTdLJJrcQGMDlfjxt+r5SoodUmckmeYm2OguqYhP9tc+wHwSUKtiLbcxvQ2UR1uoWNGk/vYj8+ec7RoK4CYa/QV4PS7E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7477

On Tue, Sep 22, 2026 at 05:25:44PM +0800, Binbin Zhou wrote:
> The Loongson-2K0300 DMA mux is not a standalone DMA controller. It is
> implemented as a set of routing fields in the chip global configuration
> registers CHIP_CTRL13/14/15, which select which physical channel of the
> on-chip CMC DMA controller handles each peripheral DMA request.
>
> Add a driver that exposes these routing fields as an OF DMA router. The
> router's allocation callback validates the <request> <channel> <flags>
> specifier, programs the corresponding CHIP_CTRL register field, and then
> rewrites the specifier to <channel> <flags> so that the parent CMC DMA
> controller's xlate is used.
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  MAINTAINERS                                 |   1 +
>  drivers/dma/loongson/Kconfig                |  13 +
>  drivers/dma/loongson/Makefile               |   1 +
>  drivers/dma/loongson/loongson2-apb-dmamux.c | 380 ++++++++++++++++++++
>  4 files changed, 395 insertions(+)
>  create mode 100644 drivers/dma/loongson/loongson2-apb-dmamux.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dc976938c58c..82b32e14581f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15348,6 +15348,7 @@ F:	Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
>  F:	Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
>  F:	drivers/dma/loongson/loongson2-apb-cmc-dma.c
>  F:	drivers/dma/loongson/loongson2-apb-dma.c
> +F:	drivers/dma/loongson/loongson2-apb-dmamux.c
>  F:	include/dt-bindings/dma/loongson,ls2k-dmamux.h
>
>  LOONGSON LS2X I2C DRIVER
> diff --git a/drivers/dma/loongson/Kconfig b/drivers/dma/loongson/Kconfig
> index c4e62dce5d4f..18edf06ef64e 100644
> --- a/drivers/dma/loongson/Kconfig
> +++ b/drivers/dma/loongson/Kconfig
> @@ -38,4 +38,17 @@ config LOONGSON2_APB_CMC_DMA
>  	  which has 4/8 channels internally, enabling bidirectional data transfer
>  	  between devices and memory.
>
> +config LOONGSON2_APB_DMAMUX
> +	tristate "Loongson2 APB DMA Router (dmamux) support"
> +	depends on LOONGSON2_APB_CMC_DMA
> +	help
> +	  Support for the DMA Mux controller found on Loongson-2 SoCs.
> +
> +	  On Loongson-2K0300, the DMA Mux routes peripheral DMA requests to
> +	  one of the 8 physical channels of the on-chip CMC DMA controller
> +	  by programming the CHIP_CTRL13/14/15 registers.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called loongson2-apb-dmamux.
> +
>  endif
> diff --git a/drivers/dma/loongson/Makefile b/drivers/dma/loongson/Makefile
> index 48c19781e729..517826a003ac 100644
> --- a/drivers/dma/loongson/Makefile
> +++ b/drivers/dma/loongson/Makefile
> @@ -2,3 +2,4 @@
>  obj-$(CONFIG_LOONGSON1_APB_DMA) += loongson1-apb-dma.o
>  obj-$(CONFIG_LOONGSON2_APB_DMA) += loongson2-apb-dma.o
>  obj-$(CONFIG_LOONGSON2_APB_CMC_DMA) += loongson2-apb-cmc-dma.o
> +obj-$(CONFIG_LOONGSON2_APB_DMAMUX) += loongson2-apb-dmamux.o
> diff --git a/drivers/dma/loongson/loongson2-apb-dmamux.c b/drivers/dma/loongson/loongson2-apb-dmamux.c
> new file mode 100644
> index 000000000000..b6f1f4112d61
> --- /dev/null
> +++ b/drivers/dma/loongson/loongson2-apb-dmamux.c
> @@ -0,0 +1,380 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Loongson2 SoC APB DMA Mux Controller
> + *
> + * Copyright (C) 2026 Loongson Technology Corporation Limited
> + *
> + * Device tree bindings:
> + *
> + *   2K0300:
> + *     dma_mux: dma-mux@16000134 {
> + *             compatible = "loongson,ls2k0300-dmamux";
> + *             reg = <0x0 0x16000134 0x0 0xc>;
> + *             #dma-cells = <3>;
> + *             dma-masters = <&dma>;
> + *             dma-requests = <22>;
> + *     };
> + *
> + * DMA specifier: <request> <channel> <flags>
> + *   - request: peripheral request ID (LS2K0300_DMA_* or LS2K1000_DMA_*)
> + *   - channel: target physical DMA channel or controller index
> + *   - flags:   channel configuration flags forwarded to the parent DMA
> + *              controller
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/device.h>
> +#include <linux/dmaengine.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/of_dma.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#include <dt-bindings/dma/loongson,ls2k-dmamux.h>
> +
> +/* Loongson-2K0300 registers definitions */
> +#define LS2K0300_CHIP_CTRL13		0x00
> +#define LS2K0300_CHIP_CTRL14		0x04
> +#define LS2K0300_CHIP_CTRL15		0x08
> +
> +/* CHIP_CTRL13 bitfields */
> +#define CTRL13_UART0_DMA_MAP		GENMASK(17, 16)
> +#define CTRL13_UART1_DMA_MAP		GENMASK(19, 18)
> +#define CTRL13_UART2_DMA_MAP		GENMASK(21, 20)
> +#define CTRL13_UART3_DMA_MAP		GENMASK(23, 22)
> +#define CTRL13_UART4_DMA_MAP		GENMASK(25, 24)
> +#define CTRL13_UART5_DMA_MAP		GENMASK(27, 26)
> +#define CTRL13_UART6_DMA_MAP		GENMASK(29, 28)
> +#define CTRL13_UART7_DMA_MAP		GENMASK(31, 30)
> +
> +/* CHIP_CTRL14 bitfields */
> +#define CTRL14_UART8_DMA_MAP		GENMASK(1, 0)
> +#define CTRL14_UART9_DMA_MAP		GENMASK(3, 2)
> +#define CTRL14_I2C0_DMA_MAP		GENMASK(5, 4)
> +#define CTRL14_I2C1_DMA_MAP		GENMASK(7, 6)
> +#define CTRL14_I2C2_DMA_MAP		GENMASK(9, 8)
> +#define CTRL14_I2C3_DMA_MAP		GENMASK(11, 10)
> +#define CTRL14_SPI2_DMA_MAP		GENMASK(13, 12)
> +#define CTRL14_SPI3_DMA_MAP		GENMASK(15, 14)
> +#define CTRL14_I2S_DMA_MAP		GENMASK(17, 16)
> +#define CTRL14_ADC_DMA_MAP		GENMASK(20, 18)
> +#define CTRL14_CAN0_DMA_MAP		GENMASK(23, 21)
> +#define CTRL14_CAN1_DMA_MAP		GENMASK(26, 24)
> +#define CTRL14_CAN2_DMA_MAP		GENMASK(29, 27)
> +#define CTRL14_CAN3_DMA_MAP		GENMASK(31, 30)
> +
> +/* CHIP_CTRL15 bitfields */
> +#define CTRL15_CAN3_DMA_MAP_HI		BIT(0)
> +
> +#define LS2K0300_DMA_MAX_CHANNEL	7
> +
> +/**
> + * enum loongson2_dmamux_type - Type of the mapping field
> + * @LOONGSON_DMAMUX_PAIR: 2-bit field, value selects a channel pair
> + *                        (0/1, 2/3, 4/5, 6/7) — used on 2K0300.
> + * @LOONGSON_DMAMUX_SINGLE: 3-bit field, value selects a single channel
> + *                          or controller index directly.
> + */
> +enum loongson2_dmamux_type {
> +	LOONGSON_DMAMUX_PAIR,
> +	LOONGSON_DMAMUX_SINGLE,
> +};
> +
> +/**
> + * struct loongson2_dmamux_map - DMA request to register bitfield mapping
> + * @reg: Register offset from the controller base
> + * @mask: Bitfield mask within the register
> + * @shift: Starting bit position of the bitfield
> + * @type: Mapping type (pair or single)
> + * @high_reg: Optional extension register offset (0 if unused)
> + * @high_shift: Bit position in the extension register
> + */
> +struct loongson2_dmamux_map {
> +	u32 reg;
> +	u32 mask;
> +	u8 shift;
> +	enum loongson2_dmamux_type type;
> +	u32 high_reg;
> +	u8 high_shift;
> +};
> +
> +/**
> + * struct loongson2_dmamux_config - SoC-specific DMA mux configuration
> + * @maps: Pointer to the request mapping table
> + * @num_maps: Number of entries in @maps
> + * @max_channel: Highest valid channel/controller index
> + * @parent_args_count: Number of cells to write to dma_spec->args[]
> + *                     when forwarding to the parent xlate.
> + */
> +struct loongson2_dmamux_config {
> +	const struct loongson2_dmamux_map *maps;
> +	u32 num_maps;
> +	u32 max_channel;
> +	u32 parent_args_count;
> +};
> +
> +/**
> + * struct loongson2_dmamux - DMA mux controller state
> + * @dev: Back pointer to the platform device
> + * @base: I/O-mapped register base
> + * @lock: Protects register read-modify-write sequences
> + * @dma_np: The parent DMA controller device nodes
> + * @dma_router: Router structure passed to of_dma_router_register()
> + * @config: SoC-specific configuration
> + */
> +struct loongson2_dmamux {
> +	struct device *dev;
> +	void __iomem *base;
> +	struct mutex lock;	/* Protects register read-modify-write sequences */
> +	struct device_node *dma_np;
> +	struct dma_router dma_router;
> +	const struct loongson2_dmamux_config *config;
> +};
> +
> +/* Loongson-2K0300 mapping table */
> +static const struct loongson2_dmamux_map ls2k0300_dmamux_maps[] = {
> +	[LS2K0300_DMA_UART0] = { LS2K0300_CHIP_CTRL13, CTRL13_UART0_DMA_MAP, 16,
> +				 LOONGSON_DMAMUX_PAIR,   0, 0 },
> +	[LS2K0300_DMA_UART1] = { LS2K0300_CHIP_CTRL13, CTRL13_UART1_DMA_MAP, 18,
> +				 LOONGSON_DMAMUX_PAIR,   0, 0 },
> +	[LS2K0300_DMA_UART2] = { LS2K0300_CHIP_CTRL13, CTRL13_UART2_DMA_MAP, 20,
> +				 LOONGSON_DMAMUX_PAIR,   0, 0 },
> +	[LS2K0300_DMA_UART3] = { LS2K0300_CHIP_CTRL13, CTRL13_UART3_DMA_MAP, 22,
> +				 LOONGSON_DMAMUX_PAIR,   0, 0 },
> +	[LS2K0300_DMA_UART4] = { LS2K0300_CHIP_CTRL13, CTRL13_UART4_DMA_MAP, 24,
> +				 LOONGSON_DMAMUX_PAIR,   0, 0 },
> +	[LS2K0300_DMA_UART5] = { LS2K0300_CHIP_CTRL13, CTRL13_UART5_DMA_MAP, 26,
> +				 LOONGSON_DMAMUX_PAIR,   0, 0 },
> +	[LS2K0300_DMA_UART6] = { LS2K0300_CHIP_CTRL13, CTRL13_UART6_DMA_MAP, 28,
> +				 LOONGSON_DMAMUX_PAIR,   0, 0 },
> +	[LS2K0300_DMA_UART7] = { LS2K0300_CHIP_CTRL13, CTRL13_UART7_DMA_MAP, 30,
> +				 LOONGSON_DMAMUX_PAIR,   0, 0 },
> +	[LS2K0300_DMA_UART8] = { LS2K0300_CHIP_CTRL14, CTRL14_UART8_DMA_MAP,  0,
> +				 LOONGSON_DMAMUX_PAIR,   0, 0 },
> +	[LS2K0300_DMA_UART9] = { LS2K0300_CHIP_CTRL14, CTRL14_UART9_DMA_MAP,  2,
> +				 LOONGSON_DMAMUX_PAIR,   0, 0 },
> +	[LS2K0300_DMA_I2C0]  = { LS2K0300_CHIP_CTRL14, CTRL14_I2C0_DMA_MAP,   4,
> +				 LOONGSON_DMAMUX_PAIR,   0, 0 },
> +	[LS2K0300_DMA_I2C1]  = { LS2K0300_CHIP_CTRL14, CTRL14_I2C1_DMA_MAP,   6,
> +				 LOONGSON_DMAMUX_PAIR,   0, 0 },
> +	[LS2K0300_DMA_I2C2]  = { LS2K0300_CHIP_CTRL14, CTRL14_I2C2_DMA_MAP,   8,
> +				 LOONGSON_DMAMUX_PAIR,   0, 0 },
> +	[LS2K0300_DMA_I2C3]  = { LS2K0300_CHIP_CTRL14, CTRL14_I2C3_DMA_MAP,  10,
> +				 LOONGSON_DMAMUX_PAIR,   0, 0 },
> +	[LS2K0300_DMA_SPI2]  = { LS2K0300_CHIP_CTRL14, CTRL14_SPI2_DMA_MAP,  12,
> +				 LOONGSON_DMAMUX_PAIR,   0, 0 },
> +	[LS2K0300_DMA_SPI3]  = { LS2K0300_CHIP_CTRL14, CTRL14_SPI3_DMA_MAP,  14,
> +				 LOONGSON_DMAMUX_PAIR,   0, 0 },
> +	[LS2K0300_DMA_I2S]   = { LS2K0300_CHIP_CTRL14, CTRL14_I2S_DMA_MAP,   16,
> +				 LOONGSON_DMAMUX_PAIR,   0, 0 },
> +	[LS2K0300_DMA_ADC]   = { LS2K0300_CHIP_CTRL14, CTRL14_ADC_DMA_MAP,   18,
> +				 LOONGSON_DMAMUX_SINGLE, 0, 0 },
> +	[LS2K0300_DMA_CAN0]  = { LS2K0300_CHIP_CTRL14, CTRL14_CAN0_DMA_MAP,  21,
> +				 LOONGSON_DMAMUX_SINGLE, 0, 0 },
> +	[LS2K0300_DMA_CAN1]  = { LS2K0300_CHIP_CTRL14, CTRL14_CAN1_DMA_MAP,  24,
> +				 LOONGSON_DMAMUX_SINGLE, 0, 0 },
> +	[LS2K0300_DMA_CAN2]  = { LS2K0300_CHIP_CTRL14, CTRL14_CAN2_DMA_MAP,  27,
> +				 LOONGSON_DMAMUX_SINGLE, 0, 0 },
> +	[LS2K0300_DMA_CAN3]  = { LS2K0300_CHIP_CTRL14, CTRL14_CAN3_DMA_MAP,  30,
> +				 LOONGSON_DMAMUX_SINGLE, LS2K0300_CHIP_CTRL15, 0 },
> +};
> +
> +static const struct loongson2_dmamux_config ls2k0300_dmamux_config = {
> +	.maps			= ls2k0300_dmamux_maps,
> +	.num_maps		= ARRAY_SIZE(ls2k0300_dmamux_maps),
> +	.max_channel		= LS2K0300_DMA_MAX_CHANNEL,
> +	.parent_args_count	= 2,
> +};
> +
> +static inline u32 loongson2_dmamux_read(struct loongson2_dmamux *mux, u32 reg)
> +{
> +	return readl(mux->base + reg);
> +}
> +
> +static inline void loongson2_dmamux_write(struct loongson2_dmamux *mux, u32 reg, u32 val)
> +{
> +	writel(val, mux->base + reg);
> +}
> +
> +/**
> + * loongson2_dmamux_set_route() - Program the DMA request route
> + * @mux:     DMA mux controller
> + * @request: Peripheral DMA request ID
> + * @channel: Target physical DMA channel or controller index
> + *
> + * Computes the register value according to the mapping type:
> + *   - PAIR   : channel / 2 selects the pair index
> + *   - SINGLE : channel is written directly
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +static int loongson2_dmamux_set_route(struct loongson2_dmamux *mux, u32 request, u32 channel)
> +{
> +	const struct loongson2_dmamux_map *map;
> +	u32 reg_val, route_val, high_val = 0;
> +
> +	if (request >= mux->config->num_maps)
> +		return -EINVAL;
> +
> +	if (channel > mux->config->max_channel)
> +		return -EINVAL;
> +
> +	map = &mux->config->maps[request];
> +
> +	switch (map->type) {
> +	case LOONGSON_DMAMUX_PAIR:
> +		route_val = channel / 2;
> +		break;
> +	case LOONGSON_DMAMUX_SINGLE:
> +		route_val = channel;
> +		if (map->high_reg)
> +			high_val = (channel >> 2) & 0x1;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&mux->lock);
> +
> +	/* Write the primary register field */
> +	reg_val = loongson2_dmamux_read(mux, map->reg);
> +	reg_val &= ~map->mask;
> +	reg_val |= field_prep(map->mask, route_val);
> +	loongson2_dmamux_write(mux, map->reg, reg_val);
> +
> +	/* Write the extension register field if present */
> +	if (map->high_reg) {
> +		reg_val = loongson2_dmamux_read(mux, map->high_reg);
> +		reg_val &= ~BIT(map->high_shift);
> +		reg_val |= high_val << map->high_shift;
> +		loongson2_dmamux_write(mux, map->high_reg, reg_val);
> +	}
> +
> +	mutex_unlock(&mux->lock);
> +
> +	return 0;
> +}
> +
> +/**
> + * loongson2_dmamux_route_allocate() - DMA router allocation callback
> + * @dma_spec: OF DMA specifier <request> <channel> <flags>
> + * @ofdma:    Router's of_dma structure; ofdma->dma_router points to our
> + *            struct dma_router embedded in struct loongson2_dmamux.
> + *
> + * Return: NULL as route_data (nothing to free), or an ERR_PTR on failure.
> + */
> +static void *loongson2_dmamux_route_allocate(struct of_phandle_args *dma_spec,
> +					     struct of_dma *ofdma)
> +{
> +	struct loongson2_dmamux *mux;
> +	u32 request, channel, flags;
> +	int ret;
> +
> +	if (!ofdma->dma_router)
> +		return ERR_PTR(-EINVAL);
> +
> +	mux = container_of(ofdma->dma_router, struct loongson2_dmamux, dma_router);
> +
> +	if (dma_spec->args_count < 3)
> +		return ERR_PTR(-EINVAL);
> +
> +	request = dma_spec->args[0];
> +	channel = dma_spec->args[1];
> +	flags = dma_spec->args[2];
> +
> +	if (request >= mux->config->num_maps ||
> +	    channel > mux->config->max_channel)
> +		return ERR_PTR(-EINVAL);
> +
> +	/* Program the SoC-specific route register */
> +	ret = loongson2_dmamux_set_route(mux, request, channel);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	/*
> +	 * Rewrite dma_spec so the kernel router framework uses it to look
> +	 * up the parent DMA controller and invoke its xlate.
> +	 */
> +	dma_spec->np = mux->dma_np;
> +	dma_spec->args[0] = channel;
> +	dma_spec->args[1] = flags;
> +	dma_spec->args_count = mux->config->parent_args_count;
> +
> +	return NULL;
> +}
> +
> +static int loongson2_dmamux_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct loongson2_dmamux *mux;
> +	int ret;
> +
> +	mux = devm_kzalloc(dev, sizeof(*mux), GFP_KERNEL);
> +	if (!mux)
> +		return -ENOMEM;
> +
> +	mux->dev = dev;
> +	mux->config = &ls2k0300_dmamux_config;
> +	mutex_init(&mux->lock);

use devm_mutex_init();

> +
> +	mux->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(mux->base))
> +		return PTR_ERR(mux->base);
> +
> +	/* Parse parent DMA controller nodes */
> +	mux->dma_np = of_parse_phandle(dev->of_node, "dma-masters", 0);
> +	if (!mux->dma_np)
> +		return dev_err_probe(dev, -ENODEV,
> +				     "Failed to find parent DMA controller\n");
> +
> +	mux->dma_router.dev = dev;
> +	mux->dma_router.route_free = NULL;
> +
> +	platform_set_drvdata(pdev, mux);
> +
> +	ret = of_dma_router_register(dev->of_node, loongson2_dmamux_route_allocate,
> +				     &mux->dma_router);
> +	if (ret) {
> +		of_node_put(mux->dma_np);
> +		return dev_err_probe(dev, ret,
> +				     "Failed to register DMA router\n");
> +	}
> +
> +	dev_info(dev,
> +		 "Loongson2 DMA Mux Controller registered (max_channel=%u, requests=%u)\n",
> +		 mux->config->max_channel, mux->config->num_maps);
> +
> +	return 0;
> +}
> +
> +static void loongson2_dmamux_remove(struct platform_device *pdev)
> +{
> +	struct loongson2_dmamux *mux = platform_get_drvdata(pdev);
> +
> +	of_dma_controller_free(pdev->dev.of_node);

of_dma_router_free() is match of_dma_router_register() even through
it is the same.

Frank
> +	of_node_put(mux->dma_np);
> +}
> +
> +static const struct of_device_id loongson2_dmamux_of_match[] = {
> +	{ .compatible = "loongson,ls2k0300-dmamux" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, loongson2_dmamux_of_match);
> +
> +static struct platform_driver loongson2_dmamux_driver = {
> +	.driver = {
> +		.name = "loongson2-dmamux",
> +		.of_match_table = loongson2_dmamux_of_match,
> +	},
> +	.probe = loongson2_dmamux_probe,
> +	.remove = loongson2_dmamux_remove,
> +};
> +module_platform_driver(loongson2_dmamux_driver);
> +
> +MODULE_DESCRIPTION("Loongson SoC DMA Mux Controller driver");
> +MODULE_AUTHOR("Loongson Technology Corporation Limited");
> +MODULE_LICENSE("GPL");
> --
> 2.52.0
>
