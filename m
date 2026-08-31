Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013056.outbound.protection.outlook.com [52.101.72.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DF55221C1
	for <dmaengine@vger.kernel.org>; Mon, 31 Aug 2026 15:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188839; cv=fail; b=nhhsFXnn4leXGuKRbGJbOCPdc2g5BVJZIpez/Omg6qqNw04gNb8tUouxlH0r6oAafWNMWzEmh53AGgEJ+UhE1Ck8+9oYkBxsWKJU5xPxQ5Ga31uKX7pHWLGrn4UyMtA9gbzLCCk4HdARGUKyaSJd6nKIPPE6f8f/UXa17nqo2Mo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188839; c=relaxed/simple;
	bh=LfiV9u4RfJZ4T4CkAAJJOqMlWEzTp4KQAIcJKFofIh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sazQbBE7Jsu38LS8oB3TUGcMY4L1+SskKTEkcxb6iEtYEAekK6nBw/3K5nxFQGa/rkBWraO2HdHyMM3uf0bQL4/jkN9QXkniOPfVkwguo7TrjeOO2eZU/w++3tgY37UTthQmFRsRqx2fM8o51KfWoFrEozRDT3N9qR/nMpX45Wg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xNymhAlQ; arc=fail smtp.client-ip=52.101.72.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xNymhAlQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QLEsc2bIduvNfpecNHmngb0KEHB52W/VmXfaHaQD8axqlI0kJYv1OXfbkukzMHFAqtfBrKlKvYrHLg7rmqjeO1sKLTYM+vEBkt8nkE+VTKvWGcaXIl9G9f/YvH70lMHGCxBz94xTW9xTjm+7q5mMRJKJ37ek3tmXIjaY9ymZRevLH93meWARl9uiZaF+ckUJDCXmi9uf+Adf80AcA4+mNmLNlDstMGyjuuEDY0tKHlOwKXC08nUo8fwj+FBV/ijEJGzJ/o/ac9n03m0tdBnsLRBueNvmOfl4SPbuF5qdJs1WY4AfA+n8vPOPGLOINtTwbh3s8S66cqTr5nQtHzWZaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crUA2Vacg+90gb40PTlcGqCojgQu6lx9aqAxqQXl5cw=;
 b=GP6m5/7/7fuET4rhPjUxgcqGW5tpGl34AnD+jb/fd/GKY55mXY++mbgtSj2sB2DtEt8TE0JkPSOLa5rmriPuJwHDY03gPHfBWhoB1Sr+0L1+I7RmsckI6KP8QsSCF1/LVdLU7rz3oZcd08kSBAxq6JXY3T/UUhPch6q7TM7pJvW4TZ9nR41yYNMeYBRGNV0w+l5DDnZ4Gd1R9t4TNQmqL7lhSBne6ullRbGqbGYwqLBeHFENypcnQks08UAuK4IJJdoHsbJ/jTKL7lfA7Wx90aQzU+P1UT+JXGMiR6DocGZ+cA5dN2Mb+K9d+cyN6fxSHSGV2CLlrKBUXe2qCY5+jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crUA2Vacg+90gb40PTlcGqCojgQu6lx9aqAxqQXl5cw=;
 b=xNymhAlQg5OVok/tWZmM3/azcZCYss+7y6UPl9QCnQzqtQ13zSJRQYXpmTlyqmirxa7wun7mr8SG3OQSIdSXxr8yKtyluXTXQOdFrP5oFVMozZHL9P83NMXry1UraKglrzc9RpEL+bI2F91jX/oZKZplwitlnbcFBmbkjnbKQaXOJ2LbQ4m43DMGLVODfgp2iMHpP/mPjzUMPduuknz3vOBZYNoIpBieXfGFqFoEHxrQAFSaoqSJfNxxWLC54ALJQXUYbpXnifABP4gGkcBVXAqt2EDUewLEiD3x2Y4LwKNAjOt4hw393XL4gz55AsgKwml1HsQk2yBysaFheLRDNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MRWPR04MB11489.eurprd04.prod.outlook.com (2603:10a6:501:78::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 15:07:13 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 15:07:13 +0000
Date: Mon, 31 Aug 2026 10:07:04 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Li Youhong <dayou5941@163.com>
Cc: Eugeniy.Paltsev@synopsys.com, vkoul@kernel.org, Frank.Li@kernel.org,
	dmaengine@vger.kernel.org, Li Youhong <liyouhong@kylinos.cn>
Subject: Re: [PATCH] dmaengine: dw-axi-dmac: fix cfgr_clk leak when core_clk
 enable fails
Message-ID: <apWYmJxYxIJWy2z1@SMW015318>
References: <20260831094438.2244538-1-dayou5941@163.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831094438.2244538-1-dayou5941@163.com>
X-ClientProxiedBy: CY8PR22CA0022.namprd22.prod.outlook.com
 (2603:10b6:930:45::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MRWPR04MB11489:EE_
X-MS-Office365-Filtering-Correlation-Id: 8726e0e0-c590-49de-26a9-08df07718956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|366016|1800799024|23010399003|10067099003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Yj/mcDeP+MKeF4oETSACZBegDJoVXVVaqjwaiZhAr/s6q1KB1SMsITwCzDroduIKdqzcUq1BYZ73MbQMEhyd880NlbyiT8+4cSe9D+davyUXkGAyCfJWhinfP5UO9IptRdN7Nt4VeBEro3+oUFNMk318Ss9YF28VuSoB0//TW816FFbrVW3ahJP7hebt3Ycd+uM4wkRH2ipnof4cedgJ7xVE6iaTiEvmnyWZgJcv5aE3d6uYTCtoCx1hxviwUfR5pKD5sX8WEU1Dlc0wvLi81i76MqGK7bxSbrNQDKv5smp5LVeBKzpf2UCZnWR9dFlPlYpOcbby0lpFn6diKtS6A451IlcRaUEyYk2VTR8IuN5loEA4DzBS7slqOiUhvUKBi3OiTiB2qjn7lpGW1TXbT6ZYYMRHX0Kzl+tHVvlBUhL9cWH4iQNlH2IYcAh+fRf8fmVa1n6Ghp/H+PksWzl66nHN+RCJIyKWjEXvqXXi1S2pLWN7SreAlcTbd+ztukrN8KYoA1VtLaHGNZfzXSMD2eMRHkPfLA4DuOCpInMYd/egbf/BSvQlRK5pG/Vonysepubp2dt9ybzRKHEOxSOpbOMslfT00NyJOnsJ6CJeiORGv55cNuDPKFHo9RlNgmWOCimHH3V5uvgCO3YRQoTnnPaZBkNbSpoH+p1CAeNXXZs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(1800799024)(23010399003)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h8/AuTyKOkaiFZX+MrBCAb9qX/CN8nri00A+3ac+Looz2xkb+q9reOi3YhPg?=
 =?us-ascii?Q?8OqZ5luv0Uc+9HWiAWkij7fK4tTdPRe0WqUu+j2CI5ITTv0fif82HpMlEMvn?=
 =?us-ascii?Q?BhBYVzTT3k3quDVbAkLJO3IHqOE50/olnSqyl2CaKpcuTBh7AKai1v5VLDJh?=
 =?us-ascii?Q?0Nicpoq/x4pNI7RaK5ViEAd40OsTLP6Hvy+ThDTCU2+2pAdO4+bJFgEsoqNo?=
 =?us-ascii?Q?4kn2rWWef/HghTHQ8nLLv0dQ08hX/97F7uZ5IEdb3UU+8/KARDCYFPpdl44E?=
 =?us-ascii?Q?uk3VY/Xi3snI0Pr+fXuANUIH3ZXhq9G966ovduOZFebAzyk7dP+5MDYU/vkl?=
 =?us-ascii?Q?fJADtNgNDzIcsdvOpnKXMzGU09daeedCu2svDWw2VrG2JSVsHrLITQ8VYa2a?=
 =?us-ascii?Q?hubnimoKl4Dm+otN/uPPJjiZvyMsOX5tuQQIWv2Gg8LI+iHuyCLR0UqGm2Mj?=
 =?us-ascii?Q?SK1RfzrbbXaBUSecEq3jEXdmLz4aWmsR+0wzKZ6ZXfeEB+ABbGsti+tMkUIW?=
 =?us-ascii?Q?AXRf1mmYTQUyyeU/CtCOaN91PHrIoEE5xypgy4KwXYXAAVDDTTNK5gi1Y5wn?=
 =?us-ascii?Q?LbFmQPTtmY1e61fHihHr+a2jfI8UhPuQw2YgflnPnrKT6ly20v5iE/NXHcWI?=
 =?us-ascii?Q?7N/v6ZR0h9R0tSWA+6QJHe5vaEdHkRpRAZhM/+jstpdNBTbsdhWwy0BsVUiz?=
 =?us-ascii?Q?CtIV9Z/+2onNLBm1o2iD43/gE+Y3/oUcFuOjppoM36pwSzRPhQclhdTYfG4V?=
 =?us-ascii?Q?P7hVYojqLlD/QNFhJsedXzIE0WENywwI3CXU3Co+vA5xlxtl75Tq57RWBrw0?=
 =?us-ascii?Q?odD6U+Lnz3/1H6eOOXjFyC7ghgPZfVDCscMDRzPxBmX7pb31Kiz7jyH8Ya3h?=
 =?us-ascii?Q?q8bhZ5qJGumQbYVZXGB6ECjg3E7+4hX7xAANvzyCfWMWiqAqekkuA8SXR86H?=
 =?us-ascii?Q?EFicDWw6FsURVlOphYRgVfwrTX7ACbxul6OLmy1JA2b50nk6pGRIlFdd7qXM?=
 =?us-ascii?Q?93WCtCeyoiuCbc3Iu1kUSG73YdpKOiDF1JnNI7xGpyXKzmhfxZcnNrIHF1W9?=
 =?us-ascii?Q?KaQXMJZeReC2L8+rzNbLeUrHkM2VYfGjmNicW10rdl9kgoCUcARvROyqSI/X?=
 =?us-ascii?Q?zYl1B5+uDM+HETMRDw/kiSKvYcSGY26ByWAA8pEH/XAvDSBaOIQh+gz6lDP4?=
 =?us-ascii?Q?NxFWn4l65u4t28ujA3VFKa2w88lNxGpC6xGNB0GckQrUvOW0+pbmRltjtz4l?=
 =?us-ascii?Q?dFcgAawSBz7JVSGhzb9ixVzB2iE8K+NjMyzr30u+QMKvH6BHa/ddIP0fmPUr?=
 =?us-ascii?Q?OfvNHVjQA2v83wdXfqsnAPUztgy85cRSG/tpzATdgEMFRrw3cc5GdI7DQkxW?=
 =?us-ascii?Q?3n8a2IaqrCLbAKu7zij9MfOiYwhuqMaGvnyW3+HkiO9MLQT4OZCIGYynHzCd?=
 =?us-ascii?Q?LFbx7bIINRC0xnNMobFQFC9qKKz+17EcNJz6F6dqpRa0suR6YcsQeCIfSkwv?=
 =?us-ascii?Q?3dvZDBl2YDN0Oz+X240Wp0xifT4n51/mZU2xLnyrg5yNrmxz0G2MggXNRZfh?=
 =?us-ascii?Q?CVawWuRqlhD0DIqUaOIdhT4zvJDUGvZf4n58mIHZNdatgkBtfbtl9it+XItm?=
 =?us-ascii?Q?tEdWpUmOvxjQW9eucjKfj8pPn1q70xL5LYYHR/EUBWub/JyKtkGTWRIshq++?=
 =?us-ascii?Q?YzSepA/e9Lgiq3Cr3nV95tC2e5ByZLRfCYGw6YXvj+WDsDGhqCOgb0/3VmwC?=
 =?us-ascii?Q?takOMVF6ssP8UG61h8O33XcWXcoKxPuXpfZQdEkGT42wfVWzw3fm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8726e0e0-c590-49de-26a9-08df07718956
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 15:07:13.0470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: egDVRy+O6Agwnv6Q7Dd8lcSYO8HXNkzDUGy/dwG4xJCCq8nHyclyrUR6K1AQMLkO+p13EKX80MzqFSY4Z2YTzen6fbpdcLMUKgQZBnOO1AEN0DHTeOr7MrZQtfgNyIOI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11489

On Mon, Aug 31, 2026 at 05:44:38PM +0800, Li Youhong wrote:
> [You don't often get email from dayou5941@163.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> From: Li Youhong <liyouhong@kylinos.cn>
>
> axi_dma_resume() enables cfgr_clk then core_clk. If enabling
> core_clk fails, return without disabling cfgr_clk, leaking the
> already-enabled clock. Disable cfgr_clk on that error path.
>
> Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
> Signed-off-by: Li Youhong <liyouhong@kylinos.cn>
> ---
>  drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> index eebed2474210..6ccb3fcfa397 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -1335,8 +1335,10 @@ static int axi_dma_resume(struct axi_dma_chip *chip)
>                 return ret;
>
>         ret = clk_prepare_enable(chip->core_clk);
> -       if (ret < 0)
> +       if (ret < 0) {
> +               clk_disable_unprepare(chip->cfgr_clk);
>                 return ret;
> +       }

Please switch to use bulk clk API.

Frank
>
>         axi_dma_enable(chip);
>         axi_dma_irq_enable(chip);
> --
> 2.25.1
>
