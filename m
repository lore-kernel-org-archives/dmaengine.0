Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794861400;
	b=X/nFg7ceqSK74sQ3jlGm82CoBuXTaEf726cKA2J+M9AIvQ0GJaFKwL48H93EWy7RBZZ0
	 LqA76DsOkcua3NWQQV2Z+AlNZ6/NZmz7v0/5v9HVV9CDgSEJf+g42oGncyD0qfyL7esWH
	 r15UwWrFYpGRVGOOzyUMyFFOKvNxHAkr/qtfhLSTnjNoJaCPVuZaGWHFDIHSli45MmTfM
	 YGa5caIkwRg46oyaTpxyIioMgXJt6Zxm3h/iGwpU4HLi0cI0o2nQJ6E+Ot+gfz70rVCPH
	 6tC7KhDIrAZGDw74E6wGQotsnlS2kSwpsGh7r6x6B2MzUSsg7GFC0s1+DZuNogLHEZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861400;
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
	bh=sX+v9G6hzaLjMmMn9k3h5RvzSsVbDIu4YJr4hJXYi+g=;
	b=CGioUpai7jvklCMYBYMtbbWBLsGqDLYiLEyA3VtgBADhWj3ZyswqgZ6bQegLINGyHzai
	 wVsgdT1F7EXBWhVzcZ8VnAv+Prm9wNkE8ZzqjIptl1VrBnYFMl/Rje5HnxxzhKPHO3azV
	 RHW77PS8oNkR6vpBl7igirX+bfTEITjwziQkOnniICiVgj0FbxyGovRtRHV+InXtDBnep
	 aHW7DMFXWQ1ps8O8qPlpMBFC3YpR9ItjJxA/Os8uzE92A6YfWCUFroSsJhXZn+2Co1pqM
	 0etrqJsC59KRssI4XBxgwFdeFQfbL4+R3moOP7Q5t4NkB7yfvr//rk5FALVmJ7w9P6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SzeQyD72;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.25
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010025.outbound.protection.outlook.com [52.101.84.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE31B606A882;
	Mon, 16 Nov 2026 20:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE31B606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SzeQyD72
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vbv97SYqw8cG1PBQXxSPaHJOJEKaEB4KqkdyyV4UChcLzfy/mmw8jHOVVOwGDYvPDAmc/0VlYsnJ1EI/B36T7+ZQvw4FkTg8+Xs7cngNLdaacjtTODBgN6W3aHVfGFuLic2lUVHSKWCnVpvYDbWzR6cAIOLoFaQE+QHe9R8SPaIHtgfhEJ/Hi/WDyUYqS9D1fib5y2GF5/hvW6WGhHTH9yXFEz6Sf/IDhkyvpRYNfjL1FP+NExn++RcBVRqPtS6vqocDNLTb+UdhpQoIVUIms5LCrmkl9UwZggsGUTwnR3D1m2lW1PzPTuBFRIXERGVbppqsQmibbJnKuDzRsKkvDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sX+v9G6hzaLjMmMn9k3h5RvzSsVbDIu4YJr4hJXYi+g=;
 b=GxwGqf66MNUTaLWq9+STScKmA7J/y1NZhkpQOvPTauLBKutNCs2dXJd0LHeLmxE3ByOwwdC9tuN/FOU8SJxasc9eDquEcqn1gQyHHh8IiwgclHJmlqfS2iaSUr2Ej7DLp9oh+XbmwC4ThBN40YMLXB8zQTbc6OlwFJxUEUMgaj6KtZOysAbcizAZoN5eWD9dObuxtSOOVIE57Qod13GErMzVF+jOCrjFN+7FoHGB4j7CuZA5w1gBQAXFNstdz22NXDt41KInjss3lepqIxjU6qDM6J+GhgmNRrB9ug/nGr2GImz/WmLVtORS0E9M4q0oVkC6h+gs/b4CYsWYtRDVvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sX+v9G6hzaLjMmMn9k3h5RvzSsVbDIu4YJr4hJXYi+g=;
 b=SzeQyD72WjFp5Kit+8KIKQ7g70CiliBUk3x8dKuxDjeBYURRvbRWKi1OEcpHN/doVvlQC77f3pQXpmme9lMPJVVj38nxE4CtS9iB/sJTrP6A7mgRcrCx8pHCeoq7ELa7MGNtacPfDxy4BCE3SIpAjK56t3y4LmTq9H529WqbibeU2cUVtE5jx7Q+OYPOa3FoaT2VxehGMgFBl9EuefnhQ57TWCNcHD+C96eqhavRgQQnQMV5/uZtQA19Tcy2Esh7SAPmOnwsn0urDvPbxoLDuW6/2lpuaTW71W43PTcAnucUjAr5i2H5T5Sb/iN8byketJ0HwIez2AMWl88TcJ/lxQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MIWPR04MB272002.eurprd04.prod.outlook.com (2603:10a6:290:e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 20:36:36 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 20:36:36 +0000
Date: Mon, 16 Nov 2026 14:36:25 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Golla Nagendra <nagendra.golla@amd.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Harini Katakam <harini.katakam@amd.com>,
	Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH v5 4/4] dmaengine: zynqmp_dma: Add per-channel reset
 support
Message-ID: <avtpSXEdyeWpghqd@SMW015318>
References: <20261106-adma_per_channel_reset_v5-v5-0-f9990669362f@amd.com>
 <20261106-adma_per_channel_reset_v5-v5-4-f9990669362f@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-adma_per_channel_reset_v5-v5-4-f9990669362f@amd.com>
X-ClientProxiedBy: PH0PR07CA0030.namprd07.prod.outlook.com
 (2603:10b6:510:5::35) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MIWPR04MB272002:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f9ab412-5571-413e-3136-08df44214f44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|19092799006|10067099003|11063799006|4143699003|56012099006|261022075727099003|261021121427099003|261026140227099003|261021123027099003|261022105027099003|261102123227099003|261028144727099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	XqfeV3KF5nykoBqm49lcMYmoUmewJi6q5g50i6Nas1gf2HbGzdubEmWjXuCDBYxHro1XpJA+Bo+BoooubDmJPsuj8r/5dFWOUEewFgo2qNti7VFs07j6okRW0Cp0Jl0gqX7N0S6PBFTM0vMhtfjHKBRghq+kZYLeEEeW33ShEdbRjZRZIuPAPmH8H1m7VgqadVIcGxdJXqr69ihMbOjBVelbf76IgvgUQXCGvfSyDOlSYLTq2P4PsUQP+7J6H7Bk6dtNDv61GgGAzlm9YoBE5q8D/kcKos7bT2TbWM4sDdz2IjwU9yrI9lNvc/KtqWkpObOQ5O0t3pYwJlYbpcx92hbNL5Ay7+EdxQNHgFJk8QMiBNNFMkuBLOzncYbhoDchVEpPnl7XjHJc2nUILdhAO1EPd38ewF5T55+Mam4Kv0p0squrnqL2IDtgJviEhJwzmvI7jD1ocsDLB7kT5GWVeV5YJwBI4z5QRZOiH8huw7G3XypBRbP07dFsWJvVdzSHSj0O+ykfTC+cJbfcldG3jGewdQxsdlAt+jwuD//kIYHyJRfcT+woPTEAQUaLLPrOucR7nbf5qrFHrgIQ7pxEnjd0IUb+SdS2Zf2EsAxwhDDYJloDF/4ZIJCeGUKqH8THFN6IE9vN53Y6ekEH/zFr2TZSsTXvzdl5YD0UFolt5YM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(19092799006)(10067099003)(11063799006)(4143699003)(56012099006)(261022075727099003)(261021121427099003)(261026140227099003)(261021123027099003)(261022105027099003)(261102123227099003)(261028144727099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AplyKB7MV4FbcM5xlZwMVwxCjNOxJzeFJUeBeSbPMMb8owEn5lpRGPsrneMM?=
 =?us-ascii?Q?v7i36tV1Pk8z1KVqLZcCFNUCyPddHY1H9XVRywSrL0dmgJboq6i1MbgdQ8qu?=
 =?us-ascii?Q?k9AA0FFKKE/vpjcUGCuM87ldwmbg7wMIfUMjT3cwI9egF8J07CkpUfLUazQQ?=
 =?us-ascii?Q?QIrhwhEHFobks1ibNt9gnEPIVY+aZE8ttFploDvUxAHfNvlxIPBDCoGitTEC?=
 =?us-ascii?Q?E/ziXHNU3vDi5tvrhW83+mYgbitFnTh8EcwrJOCVMfjUglDIc89MwBwdIuPd?=
 =?us-ascii?Q?DYWDVFe/gxbszb0emmH6reGSaaOAvYi9NqxIQ4uJXL+YMnfAjSiidnLJZC72?=
 =?us-ascii?Q?J9M0mrQX5iR2VUBFVLZdT3+xw6Plgr/BqcOgUGfcxwAmVw78tZOnmNiOijYz?=
 =?us-ascii?Q?VmNxeIsZPRtCr8Z0fuCvyHA4xvUXuJQVvKUjEU4nI7Lxq1ZrJjuqxApTiSGs?=
 =?us-ascii?Q?TZh1mx0Tfy/Hg6+ZPAuhBXJp1+PZqBQ9llvS5Ayf7dk6Ng0akuDajpElIYKg?=
 =?us-ascii?Q?SZeWonowafX8E7b2acT1/gHIMR2Rgnc71EU+VIdD/x67IsRb56OZf43WUanG?=
 =?us-ascii?Q?1VP01zzaV1v0WCd2RBPdYWQlynKXNCVtS7EcOSpkCfAEImxP4UuER9zHRzn1?=
 =?us-ascii?Q?YBtPJaoSLM6q7mFMrIpTK+JJ1reqFiAtVKlvg9XmMZhxvlNbzyGo3peIid8a?=
 =?us-ascii?Q?HHsZFch7d1p6497Uue4tivROplco98s5vXn1LIgxA7kksua0xdiqsjvS/z3m?=
 =?us-ascii?Q?kpPTmpN3RMWl4fqg22n9zXhLrOywwLHK2lnaAnoe6kX11g3dL+ziVpXoS4K3?=
 =?us-ascii?Q?KDi58WD2qkUyTWQ3A8CsbchFTKfssvYgV9tthZLGEeGTXeeLTQm7tOhxaEiw?=
 =?us-ascii?Q?yr0h+OEH3BOSyCL7YEg95Rb4aAk5MeqqrEEsreQKo/wgARbmUoLzHLeAr2R2?=
 =?us-ascii?Q?Kyqd6vP4QQhUQIg0OU63Ql8abXQAfl2yexVHUmZAaLkj0p7ccu8Tg4E4P8cq?=
 =?us-ascii?Q?SENSjGcAAoyM0Nb0TwAV7vdRQi8lAp4BQZnOwiLkkbnBaBZ1D7GQsPT8Kytv?=
 =?us-ascii?Q?3G5rrnyaueVtdexWLBTJ12scEjEGmvY7lStrLHidR21GlRV5ThEgqXTzk6fG?=
 =?us-ascii?Q?jZr49lh/QUeExOp5lInjFZZtdNkXyq58rZAbHqwSevtsZ3J7FO4uDrF6d8av?=
 =?us-ascii?Q?bo7hdfjJTGMzltarz5b43tf70Mq7s1uc6j0J49f+88xz1FLkx/VLhzG3MX/j?=
 =?us-ascii?Q?OzO2JCXqyEq92Wr6tFitD19LC4S7HKal5Jvn48ruHgulDmUKj+vEXlepKVg4?=
 =?us-ascii?Q?ZsVFZLr7Dz2T3ctJXAj5OG0eXjBMsFQ0qV4DlUPWQy99WWk9uJTbCsLWrEq6?=
 =?us-ascii?Q?j1HPZeOs2+K7Vczrs4MPsVf1SlXOnz0eEnqADkwGqR0dDnuqwcTRDJ+mcgor?=
 =?us-ascii?Q?tORaKl2286KEgeg3GAevlq2RN6cGc4eSikwTDEu2ie/sUCVJjogT/25L6whr?=
 =?us-ascii?Q?FY0rGuqrfSbna4OHyStxC3H1Xnb424k50yTnQ6IcQgzSZHfZGUpyimnV1062?=
 =?us-ascii?Q?uswMTZW0f+/zyUnF7dfar0kSqTNpMYthsz7IadjaDupUsHBo0+mNm2rQD7yd?=
 =?us-ascii?Q?qzMLBCgTh11Jr/443viLV75b27Ukw3h5doEhZdQT0qBZ64Ygrhp1OxUjMQkP?=
 =?us-ascii?Q?ai4NUlulSxmrxeUpxnu4TKEuxYeVKOunLaqFkZwk6mr0CO5p2czvmSUTifnZ?=
 =?us-ascii?Q?juyMD03kZ4DiFjLiHcDesHKXcDGvul08U2GFnedqVfKI6U1jsq7f?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f9ab412-5571-413e-3136-08df44214f44
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 20:36:36.6510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zf3/kqePPboCzBgZycjJ1XiHM9XxxpGb0mXo+UV3f84GqJgejp95S3lZGnXCFlcy5VbE59GcWKFVcst7DITb+WzNVRxV1zuYRjYan9hU4ToAG2Ziq9OyoTUKz3269BeG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIWPR04MB272002

On Fri, Nov 06, 2026 at 03:40:26PM +0530, Golla Nagendra wrote:
> Versal Gen2 and Versal Net expose a dedicated reset line per ZDMA
> channel. Trigger a reset pulse during probe using device_reset().
>
> For Versal Net and Versal Gen2, reset is a required DT property, so
> probe returns an error if the reset property is missing. For legacy
> SoCs, the reset path is skipped.
>
> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
> ---
>  drivers/dma/xilinx/zynqmp_dma.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
> index cb0eb13f9b05..12696fa44c66 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
> @@ -19,6 +19,7 @@
>  #include <linux/clk.h>
>  #include <linux/io-64-nonatomic-lo-hi.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/reset.h>
>
>  #include "../dmaengine.h"
>
> @@ -937,6 +938,14 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
>  	if (IS_ERR(chan->regs))
>  		return PTR_ERR(chan->regs);
>
> +	match_data = of_device_get_match_data(&pdev->dev);
> +	if (match_data && match_data->has_reset) {
> +		err = device_reset(&pdev->dev);
> +		if (err)
> +			return dev_err_probe(&pdev->dev, err,
> +					     "failed to reset channel\n");
> +	}
> +

Use device_reset_optional() will simple code. Your binding already verify
dts, needn't check again.

Frank

>  	chan->bus_width = ZYNQMP_DMA_BUS_WIDTH_64;
>  	chan->dst_burst_len = ZYNQMP_DMA_MAX_DST_BURST_LEN;
>  	chan->src_burst_len = ZYNQMP_DMA_MAX_SRC_BURST_LEN;
> @@ -952,7 +961,6 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
>  		return -EINVAL;
>  	}
>
> -	match_data = of_device_get_match_data(&pdev->dev);
>  	if (match_data)
>  		chan->irq_offset = match_data->offset;
>
>
> --
> 2.43.7
>
