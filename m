Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792522064;
	b=2f4e4JnBQptIAxXIwCrSH0fS8bqC8uC4n3DAml6E7UOl9MVbD5FF079xYQsGKGulhHik
	 OrJYRD1ZKqOaVmTCgdrN+7GBTNC6HA4oOsooa6KPO9hnKRVqz+P2CBXLK3FvvQJKkWKk8
	 QDBP6zPwNLYJK3nFEwnAJH8lYBkly7rlOwLryjDfjO5thzOcczQizfySMbML1Wne5OI4m
	 T7DBtzhe2CRjD/e/0BCocIY7yzVqhsAwh31z7wlmEW/bXMnLqGA8o4ObbaEfZCV4lB6dq
	 7Tek7/+TB285KhkTaxp4nPYybT8ugFEem0K3qIkrEQdP1L0rwHjukMCQz4UbHyYI9nA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792522064;
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
	bh=x1VVaEUDzb2/nrNG93+ykjC2fHUXOiU55DLUJIrnj3o=;
	b=RiJKflq9+TxTDbCAvFYfFkzrxkNhCgRA96aPO+edVbHaNavO3NZgihLZcVfwepZTGj1y
	 AhmhuUX8ywYSDAc3uidI4rFJuUs5IPXwf/O1gAPwI63+PasgB8Us+LsLyy9AXls5uSR03
	 4LMWwGkT8kBybpi32MH7Tjs9Ke5rVQgEHYyeDqjV2aRTWqgzbZvSc8taizquBJM8KTDSu
	 LO6G8UaAo2U72Pt7+ytMqsVkNADd6PO7rgJpuelctMIjpZxkWEWQenzgn2I6zwpuNqxYB
	 Xt6UHBX0H4ClgnfzI2ftPANnPignN8IRfd2Zw/m2UZ9/vC9jpkwZDdqYfwHpkZDcqhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=fCv0MJk1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.54
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012054.outbound.protection.outlook.com [52.101.66.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AEB606A321;
	Tue, 20 Oct 2026 18:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65AEB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=fCv0MJk1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ho9iTVYwKOljrWaOqCqPaC1ElHpTun6lz5vP9viH3t+cQ4Yh7X/px14RyijKew19Rj/vHsVBsWrOEgkpijvBIgdwQXJzBOLHAuvMOLMU9gYkR/s72PUCMfcYBcnCEEqWpL2cUBgbqmoNij42bCIJKrTKT4IcuK+BRjnrE5+uXqN8hkqGhWHHzSs0WqGBg6nhWHp8k+o+orbS91/a7V2I1qMAvwji9zlhQ1sdWcSs6c6gPBEASOZDkZ22z83wqCjEzjAD7bGmsUKFupCKFbWwlC/qKtWNI/akxJ8Bi+wTDF0Op1WbnWDGEZgsX+NgrhiWFPggXVf+3GcjtVJ5AbkflQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1VVaEUDzb2/nrNG93+ykjC2fHUXOiU55DLUJIrnj3o=;
 b=p/XRbRY62jkf+E6Kr8l63BAztEGaWAkKPgRUrM43686AbszPsXIrXdaLgB8pqX4QDzTTW7s/W3cKBg/g4WWVgNGhswad2elKFK2wFsyajOfxRvQTCg7cE4lFAK92+xDQlmzeJLzusnDDgLQelhRiUldJysi7Ax4xxtR/UkKndHX3e+FWyh42nua+LG/hpugk7U3Wa6/Z65opdi6I4ZA4uszI+pHoBIYGrtupFemY1z7WXanJ73Pe1G/baQ9FAbCVrPRMlv2G/+VbOfWKNsCO8QM9Z7TQh+4z1nM9fwytjMOG/PqLxNOjw42vxQ96oHN79FK3TtIta9p0US+icIENrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1VVaEUDzb2/nrNG93+ykjC2fHUXOiU55DLUJIrnj3o=;
 b=fCv0MJk1G7ETVWx+nKQDrm/37OYYaOrN6O0Qg1fU3c3EMonVMWX48B6c049J9bfFFpoX+REkLLfWZqKCbkuDBC1VwH+WhrKF2++Z5AtCtJee2boyF3/HNiUkBWHg7+F7gVRHVZdu6xivu4T4wNjYfonNAxsdY3H0jwiRRd/rF1fRGERYJ3F4y9Flq7UlHK+uoinkMrUsX0r5AdCcOIetD/FUPrMubf6O8zi0wxXvNtUXm7RU+olIcR4/uUbTJxW1C4eDpRdZVmsQilslJ86fFN7kMUJw/9QqFYxT9beIh+v4Or2kEhvIDt7OTo+/Rq8mBDfs44MaagVHYX0X02iOUg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM9PR04MB7667.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 18:47:38 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 18:47:38 +0000
Date: Tue, 20 Oct 2026 13:47:30 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, vkoul@kernel.org,
	Frank.Li@kernel.org, bartosz.golaszewski@oss.qualcomm.com,
	pramod.gurav@linaro.org, andy.gross@linaro.org
Subject: Re: [PATCH 1/2] dmaengine: qcom: bam_dma: Take a PM ref at remove()
Message-ID: <ate3QoD2ESDtB9wq@SMW015318>
References: <20261020180804.140766-1-smostafa@google.com>
 <20261020180804.140766-2-smostafa@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020180804.140766-2-smostafa@google.com>
X-ClientProxiedBy: DS7P221CA0034.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:8:25e::16) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM9PR04MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: 60c5b170-fdf0-44e7-40a5-08df2eda9d2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|19092799006|366016|56012099006|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	EGnBMwdDMUHNaN/FetKcydiCkUoJJRkSpFSnX+AFVLjR35/Q5IZnDV2zMjIF/7qfX9DoUPE1Sgsh4Fm7FxOgD102pwwfrgkbn3eRCj0l32OizUUdhvbIvZLgePVaFCnsojPAxTEozBjHPMdh+2BudgoKF29VktcbisBEyuwqYg8UNM1J/R/L7gIi1uLtd8cTEmfIWbq2eXXQfqGHspUbqxNpT3C115wUJq6qDjaGX0e3FeXnMPRvv2f41Qg3iJGvsKmMjAi3w3P7VNYjlShSUErPztjkmxEeupMtjo8k9OYTY1dy4R/F0ksIZeDexO4oW1xAS2Xuky8PF99WVLqqUUhfmEH0UGHRWfMyZXr3dkna2Zv519VrQPaXr4DnnvQ7ajdH+J4JIv2OW6GB2bzFm2FSaj1nkMI3oI9fQV10DFjpqy2qvrNsij81RPsJHyWqkb+d467eDxgqcstkGiYdIn6RK5I/pVRj44GANYKp8dahiTByZjUpDd/WnLy4aEKcUor4DCbb5N43KoryXK321fEFqepKjExUchLhKW0egaldHAhiZ6m11Qs8IEuaqfT14GWZwLLlKbVQTILwBHlCNd+6Qs6l/rBRRxkC4r9jSiU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(19092799006)(366016)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aEH7kccZQn1An8vW5I9XOU+wxoRpcmNxd97Wwz3Ew2/9KcCSsJhjX4I12vPQ?=
 =?us-ascii?Q?HMiJfk/RLhTvC9RAaShflf2ZQqO/lZCFy6C+c9Uy1cXDi23CvOjSRYI8vKDW?=
 =?us-ascii?Q?v+Wh/9bZrH0j0+0Nn2V4dwLELs76sS3KJ01djWGPLMWKc0Gxxmv0tkKhw2Pf?=
 =?us-ascii?Q?qBnw5mHO4rC2O+S6CLcD1bQD8BVlX5d7Gkn+Z446JoJyDnAGxNZX7eterJ0s?=
 =?us-ascii?Q?XTtTecvVeTCBzsrGP8l9Q2gFlEeRrJbRbPq/1FmRnzluGR1u/r3hyOB/g9GX?=
 =?us-ascii?Q?kiQGL517qVPNUAR5T5CQ8brGXn1aMWWjJUhGf6IGj9x6V4q7I4lQHEoQjt10?=
 =?us-ascii?Q?J9+tdPVMD1m2dD/bBOy82Z7gYCHVWDrhB24lGLrCPgHbE1yTVoQo2na/h4ds?=
 =?us-ascii?Q?bRsgDAAb+C4Kr/OgqI73xKmIxNvLORRTcNEH91aqlAHw6edYz5mssw+BqEuq?=
 =?us-ascii?Q?zXecs6kaUjkiuGuWyjW2BwBtCLakMY/jWmAaPNbYosp6d5p57qHuZohN6p4s?=
 =?us-ascii?Q?jqLCnEy1QuIEnKC7ETbsR8MIqGMtZWyBz6AAjDRZRO0cWmucCH1IFZzStwSE?=
 =?us-ascii?Q?hAZzKG7Gr9w6M9QbTkz2mTZD/Ae34vgizDm8eWlgpz5iE7ehYNdHeTYfI6yr?=
 =?us-ascii?Q?90MBGymI7u4k0xR/ti4YZNMy0q5nhlcTAn98qbzLm5C7V5cnw2HkaYNDjzuh?=
 =?us-ascii?Q?p6sEpgGduUy9IsdEyly/vur96XkNSP+JwOuBk65YgtfzsTmXiS62y2wzBhfv?=
 =?us-ascii?Q?kV/XWvRprWAhDeZSpAtAbJwGRUZpd/9cGU2R2qL93IQpZF8kY2Apelt8r2bj?=
 =?us-ascii?Q?8Q+1j28lYBLe3EsVpxDwFZBtPFWb+t3PS/MrwDKTNPuYMnJ4RRPYq0pbqr8W?=
 =?us-ascii?Q?s0hBLr93AzYV80tCP/zr45UHii59ldYzsXZ5jDWwlua6VaqtPINkIvmV/6Bz?=
 =?us-ascii?Q?+JWIZO9OyHHbR2ouoS0rA+Igy2nk4z2DZDLdLZ1z8FAkRuCkrMXVUl5N0twY?=
 =?us-ascii?Q?FzPVjjFykntI+L+2MQCgvdKryrty9Xd/uHpgAwQOLcExvn8fKcUgoDQT3bS4?=
 =?us-ascii?Q?hfdBldHhdigkQamaqFIhgf4CDOFxK6aPEUPKAFOakrkRl655p/m2xZ0wIgfZ?=
 =?us-ascii?Q?JLb3RxwdmwjHyDFn8hvsDIIHMdJl87TI1BXKTGsfZJgOwu6vmBjHY22jlUYt?=
 =?us-ascii?Q?98J4JqO85RKRDcQwxyo/VioE0eWwJTavohJmrz2bU2ZLLFpzoCsVCJnS0/09?=
 =?us-ascii?Q?x217msVSmb0NZcSN1gBibJZ/tUYxBNaG7sTcTvs5Fey7joKvs481AU86HdLP?=
 =?us-ascii?Q?wIu8lDW/GFxYDI1m9d7nNm86BLsHTQ9zrX7WX/vngh3bozltL8rHZH4mAJJD?=
 =?us-ascii?Q?+K1N9m0arpCMAvU/znW5Tx+ZKwKvARnaqNg6KmikZcPhXMAuRvXWL4TI2xdY?=
 =?us-ascii?Q?dMHhaA1zT7MqrKDskO/7uqQf5DQFTBMXARx4FZU7s5LegSjRnrb8DklaqZfg?=
 =?us-ascii?Q?tRDl43fWpHdVcxRaosIl+od4PM44rawi0LH33qR7QmTo7P+pWXc6bMrL7TQm?=
 =?us-ascii?Q?RU2WbaMABIbMogkdms9MrgFq5qiw+eUHB44y425oK6syJAU829FYyL2SnUPN?=
 =?us-ascii?Q?J+cITQCEd6fGhjl4Lw/llAWgvSoXcQoECEClprl78iW6rM8nFDT+bquQnUvd?=
 =?us-ascii?Q?2BSZKIHlvq4dyl5YiBMR/VHU7uutLfiflkJnUX36cLHnZuyHs2kaEWy1i1t/?=
 =?us-ascii?Q?84lWJG/ulU8PkaxrL7n4pCyOCh+SD3H0IFD3xJ6lQNuVnfW+cWBK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60c5b170-fdf0-44e7-40a5-08df2eda9d2d
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 18:47:38.6755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MB200jm4DlGR8QYWn2RBwE+A8PO6Lvd/eQye3e25karfj3eU3Zvntpz1GDrlfXyitcnp/YeNuV9RStATqKgH5SGjAQoMF49ZzkMvJ4qXmwTvQPQT2NngeckTNGiZ25rp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7667

On Tue, Oct 20, 2026 at 06:08:02PM +0000, Mostafa Saleh wrote:
> [You don't often get email from smostafa@google.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> bam_dma_remove() calls pm_runtime_dont_use_autosuspend() and
> pm_runtime_force_suspend(), which on a BAM with its own clock disables
> bam_clk, and only then writes BAM_IRQ_SRCS_MSK_EE and terminates the
> channels, touching registers of a block whose clock has just been
> removed, causing the board to reset.
>
> Sashiko(Locally) also reports, it then calls clk_disable_unprepare()
> on a clock that runtime suspend already disabled, which can trigger
> "already disabled" warning in clk_core_disable().
>
> Hold a runtime PM reference across the register accesses and the
> channel teardown. Once the hardware is quiet, disable runtime PM with
> the device still active and drop the clock exactly once, balancing the
> clk_prepare_enable() in probe.
>
> Fixes: 7d2545599f5b ("dmaengine: qcom-bam-dma: Add pm_runtime support")
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/dma/qcom/bam_dma.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index f67a93a37d48..bd583f78e0c1 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -1403,12 +1403,10 @@ static void bam_dma_remove(struct platform_device *pdev)
>         struct bam_device *bdev = platform_get_drvdata(pdev);
>         u32 i;
>
> -       pm_runtime_dont_use_autosuspend(&pdev->dev);
> -       pm_runtime_force_suspend(&pdev->dev);
> -
>         of_dma_controller_free(pdev->dev.of_node);
>         dma_async_device_unregister(&bdev->common);
>
> +       pm_runtime_get_sync(&pdev->dev);
>         /* mask all interrupts for this execution environment */
>         writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
>
> @@ -1428,6 +1426,9 @@ static void bam_dma_remove(struct platform_device *pdev)
>
>         tasklet_kill(&bdev->task);
>
> +       pm_runtime_dont_use_autosuspend(&pdev->dev);

After

commit d1706f9da9f40dffe8621cc0ee03b847f41f1d6d
Author: Joshua Crofts <joshua.crofts1@gmail.com>
Date:   Sat Sep 19 10:24:28 2026 +0200

    PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()

    Add a pm_runtime_dont_use_autosuspend() call to pm_runtime_reinit() to
    ensure autosuspend is disabled on driver teardown.

    Suggested-by: Frank Li <Frank.Li@nxp.com>
    Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
    Link: https://patch.msgid.link/20260919-move-dont-use-autosuspend-v1-1-f6e2d1315c23@gmail.com
    Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>


Needn't call pm_runtime_dont_use_autosuspend()


> +       pm_runtime_disable(&pdev->dev);

Can you use devm_pm_*() call to fix this problem.

Frank
> +       pm_runtime_put_noidle(&pdev->dev);
>         clk_disable_unprepare(bdev->bamclk);
>  }
>
> --
> 2.56.0.212.g129ede20d9-goog
>
