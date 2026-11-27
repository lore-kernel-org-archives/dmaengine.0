Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795792514;
	b=AC666HMccl5RBN6azNUAKaeOd+GKHLeS/isvhPBBSZwf0flkM0Qy0IKvVlPVkGfyAg+o
	 +9ybDruoK+BbE7mZJ1YVs6s0+bHcVz1k4UPPg1a6mCeveguo7xH1X+hVgXl5bFv1WDRuj
	 HVGHr46LIpPCzJhUNQy+R8AC5cGU2Wge3M1iRTkUNr/ijKQmlxCYOWL+sCaUJO6iowOZl
	 mybqYt478xGQfUgaH0bAsPXL1g9fQXUGHLcN5SLhkjCbc3YiQRE34dZh3iqosP9lY2+Je
	 UUTaUZ6XqZB63N9Atz2kgQRk9QQLtyYwhZp4bpEjbXNueUGp1i11iZozONtTyhNPewg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792514;
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
	bh=SAeSZ4o7+4d0gGnDggz2Dhzf8tQ8K/xk1ylMWtBgrRM=;
	b=ycp31vchz4Ohvs85MvZtFdYtza+ktLAjOjsShDaW+Royhu9RTmS3J3PLVLkNO6iBRWXB
	 eStP7PWVeb9XUubgm2giuf1FkTCmBgRJ3s+giy8iXeMV+jo1i7igGtKyUQgrxPaE4V8uC
	 wmcb48bn47Z7BOzH6Mb8UMdZooHuZG7eepoebD3Z0WZiOATOGHzo+Im75r7jCJHYzTp5n
	 PaNFDPgDConBm/FtcDnpz1FsrMAnks5s5tn0nzhJkR6PtisdSAvEd5DdBAVAYIsmSYOYI
	 WOoPuId0hNgSReJC/s+cBDV+JiQihnWExefP98N4RYO5NadE125s28vHRU8WZQGzisg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=tTSvXz8S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.68
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011068.outbound.protection.outlook.com [40.107.130.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC6B606A31F
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 15:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AC6B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=tTSvXz8S
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDIiJPXGasHzekv6zfXXdyUygNHHBTFbnFjajiT14EHFRDlqoe7QY9eOKt55tmRDgq+jzHwEKvk++Q1559cwpclDFBgwVfKzQytCCfPF5nQn72Rmb90movKazFngqftcJV3/IKllmWazKvUtLznu4nHWAKtN64R2GKHlU7VQ43sBWjTQYDaVV9sozeMsPUrEzMZIUSjy/ZfQUWaBFJYdA3eaokUKZKZeSM2YGfXhX1BrSUXpoLM7CCCwHVFKF57Ikqgk5wWoNU1HhBPmszMgmWj1iCvxjyPezSA7T+YJ33esdeZSXfTTTxU+hrxpUfT87wcfxPcOIVDMr1QYLNwLZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAeSZ4o7+4d0gGnDggz2Dhzf8tQ8K/xk1ylMWtBgrRM=;
 b=hn3I3623klJz5yqAyjUff57I/kAEot/fiLyis7jV+R6fvqVPRyNfuJH+bn/fkBaMRrH9dW2/r1e3ccG+M7UqFDmpXgkIBWAoxdDta4FTSI+Ug1pLJa23h7GvhSlRnETu+gflksfz6EozkqgfrXIMAiMvhj1e0LNa6DFjAZshTkEnntrSAUWwz+rMdVnCIZFnVi/0oVeDJgbEoJhUXWDuNn1OD+c8fmMoRz3tCGgIlmtfuALQUVDDgoo/H9f3Nz3t2C76izntDIdMvG4XVP81232Sn8A/W4BuMX4LZK3Wf8gc8HLS+YuiPxLPGgeJT6qsnK4EEqFNvGDhoG7eglK5VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAeSZ4o7+4d0gGnDggz2Dhzf8tQ8K/xk1ylMWtBgrRM=;
 b=tTSvXz8SVg2IzVGRsJNBYCz3y4Y+ZxboEwYgdonj/WIoDG1vQU0BSXj+Dak77poPQinagZF0iSEN/3spZ7hq0MWfiQVtarxkrzkTJlocOdW/giQRJRDMo5fd/EGjPWgVcjgY/grf8TKv83y5rWUzlkdYd0QNxuhVOoH9ulSAxQrglfwYwQnduPAaxtFqh0KtualKy57N+/Cfo44fZz+TMqpanXmcZupzvXjvfJbxpKTCRUnAfAsIRhj9Q2wlTr7hPT23ERki+FPUWpQ2ttqr47LctWEDxN+YMWvly2CbDX7yoEpT0MzJh1Fgji9GTRfyRdT/cykvbIJisbB0R7clWQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MMZPR04MB619844.eurprd04.prod.outlook.com (2603:10a6:190:54::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Fri, 27 Nov
 2026 15:15:10 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 15:15:10 +0000
Date: Fri, 27 Nov 2026 09:14:58 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Tian Xuechen <202300460064@mail.sdu.edu.cn>
Cc: amelie.delaunay@foss.st.com, vkoul@kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	cedric.madianga@gmail.com, pierre-yves.mordret@st.com,
	Frank.Li@kernel.org, dmaengine@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] dmaengine: stm32-dma: Unregister the OF controller
 and DMA device
Message-ID: <awmecq4gSJjJC6f2@SMW015318>
References: <20261127113332.390552-1-202300460064@mail.sdu.edu.cn>
 <20261127113332.390552-3-202300460064@mail.sdu.edu.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127113332.390552-3-202300460064@mail.sdu.edu.cn>
X-ClientProxiedBy: PH8P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::28) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 5d067992-847d-45fb-300c-08df4c993a5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|19092799006|10067099003|11063799006|4143699003|261022115727099003|56012099006|261021130227099003|261021121427099003|261102123227099003|261021135927099003|261009223027099003|261026140227099003|261022075727099003|261022113327099003|261022105027099003|261028144727099003|261026121527099003|261021123027099003|261026130827099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	qDdw7JSwgd815OLzBNHgFQBdIZyiwIpooLYL8bNsdzE0e4Sz4K26POqP0PTnE0IeotB3KW5KW4zYf7Zs5lnYQlekKdOnxs1MlUbx0igqV1GtgXKTjEEyy8F13rT0UQYOsHwOLKueKdwOisdhCK6q2vMfHTQQEha4OWAmYt4TOYdIWgZSuuhY68UV3hlt5JCOFiJtO+yS+ec0fSAGOUF0oPdRGusDR2UzYSBF8Z+tDpcyXh3ToQcshvET4TZmkvgYVVFz0AVn0Uewhy2KFCYFgkUnRcLDhVw7/zhoTnl4zdrrmKHrAAF34l8RVcA/7Sv3Xb+J9DCY0FQKwuPHZPfE5CB1LnEbdhOMSPATfJkaesYUBmYV5e2e/eTsySkFDrZ3ngU4qvN7ds/ALb9LpJ02+G/fIak2UzDeyDeXNg6HyGI2mnzPLGAXp7uOYh9Nc/gePN2byCL6QHfV4zt0l4HFZXaBgnGlVD+aPwdGWCv/KXnNBiV8Z4Pk0v5SCRoOdrStaiiT6EHs9d8cJkdsEEKKFTq3mfMp2EWC3YHa9WYhU3CWV3WZWe+V4QphWhgEks5nsVtB//+cz+7hVPjFp5KYGzUsxlxXnY0ZPAykLMs7V/bN0yV3HZxa1t026Qwceif/sIN2qg20scTd9i7eYDYSo8c0/3luTYnGunnqzwCP2V4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(19092799006)(10067099003)(11063799006)(4143699003)(261022115727099003)(56012099006)(261021130227099003)(261021121427099003)(261102123227099003)(261021135927099003)(261009223027099003)(261026140227099003)(261022075727099003)(261022113327099003)(261022105027099003)(261028144727099003)(261026121527099003)(261021123027099003)(261026130827099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JuzR0qttWtrpGFxo/fbBXZCGZ3cXeHw3bcL1mbmEbw8A7rKkRKYKi9kXjcvC?=
 =?us-ascii?Q?+e5WGtTJzcz0NRF1zwu9nUOtWNuZTe6an3xMU1gNFQoXnJdB6J9sXjnaLaQH?=
 =?us-ascii?Q?mfd5hRc+BZcIuQg9FeFG8GoOEii2cZgBmYKhBPe+C2iMX73OeMFDbhOLWdWh?=
 =?us-ascii?Q?+i2VmESMAriv2NaigFOBfJaOnCfxzYpV2FEK3m+5lEqLkIGFFBeDO3keAi4I?=
 =?us-ascii?Q?WZMRgOCZXDp9vERCN7sIS7ctc5+RzI/8xhsK2w031X107FUpwwmEn4EcK6un?=
 =?us-ascii?Q?WZkxywP9koDdNwmfJu++6RMilHeBPp5PzS5NipN3K3JMGVH+r3ZQbeX72J+M?=
 =?us-ascii?Q?x8rL5JdnJdDyQcUAZ5d/OqPmzO63FesFJhXr6uVZb4AAFBA9hYeQ+Pqqkg1A?=
 =?us-ascii?Q?gd5Ldy2m8w2yCPSvMjfFOEhJLeCTX1+44W0tCJToWTKz2sVBgRxsY+SnvFKx?=
 =?us-ascii?Q?EQBDEs9/yohBwTtr53hyICWtLmkDS0IAuuqCHfnZp28g8GIHd9yEjwXG9U2l?=
 =?us-ascii?Q?XfxTJL55uqPJ6Cpqhh9/v4zKsWUe25jitziyp8Z8cLHWNM6BHSu6iaiOznGS?=
 =?us-ascii?Q?LfRfyJ7yvfY9A74eKU4UmxSNv7a+yvXMMYCYOJJAqDs7HnlNQwpmeNEfB2Yy?=
 =?us-ascii?Q?cCV/DjLrpW0BuhcDgDmtSI0Hbm0NEgBOhnyznBYck1/81KTRq+9Daby1TvWu?=
 =?us-ascii?Q?K7loDy/7UufzWX2hcnJNWBSANz4QEt2JK/hdYwswQ7KSJ3EW84OifedwJiXG?=
 =?us-ascii?Q?u1QaWTSFtsVDN019lXGLdJ11gQKNTSO1xt5OgBdqs7Cxi3AhCKk3yanbOFYL?=
 =?us-ascii?Q?mlngF84mOjkjXe2BSNBGiHXdxB6TaZDHhJuChlhmIPAuRKhuK12OkqAOB7D6?=
 =?us-ascii?Q?V7aJZhZzlxUiThDOf6kuxtD8Rw5uO0nU9ovP0oPTW2RPe+cOiqzZhrJ6MZIq?=
 =?us-ascii?Q?41C5beO/ga4JPKY1U/pYCouLShTCx6lqbtW4GndNqU2lJ7D7Y9VtwQ40zQC+?=
 =?us-ascii?Q?9akVpa+TpgJEgWtQsCqQ17nYjyZlQqED8NGu5Ym1laDcpq1d6Mit7NoUSc0M?=
 =?us-ascii?Q?dQ6oG8x8CtytwecymN8kW0Kqc5h6cF1bSH5gbEycwIxkIpd6VDHX1rFZVXbK?=
 =?us-ascii?Q?EQ4394mQ5qstRPmdNUTOkt1a8tLlBgKfFcRqbBiPonVzt2knfDyN5IQoQvjt?=
 =?us-ascii?Q?5uI8PPoi1ompneN3j1N73pJNHzubaqcqYnWl/gqkAK1e9SNaA3tLxzI0e35E?=
 =?us-ascii?Q?OrcxOIqix7ls4WheVzlGRzh8ApQBZO0Ia5cjqMGR6J2c/g6VsefxabFrxPP4?=
 =?us-ascii?Q?oETnco+4dZjsRQOZSikt2FM3gGh6ZSaq4ZeKjBMdAwhPbIoz2WPnmrlV/kIa?=
 =?us-ascii?Q?dRMwTtnys7YSJh/+ZMlMxrqzxYk9juqPj7PURTvymXNc30q4to10Lhrf3dv9?=
 =?us-ascii?Q?1d72WTYw85jPUVaow1NtTc5VoZFJnTw/P7dKuDPHc6BThfX2TJxUjB9v5FkR?=
 =?us-ascii?Q?feePc+oDB4F1jGA6zOFRy1fioX9ys+anfD0MpwlCPUEarDKndyJbaindgWKg?=
 =?us-ascii?Q?f8BhSKJjYyl6QCE4fJLyxmoA12dM0ndFrvEZO0HSUl9jYYz9u9aeLNlJ+NJL?=
 =?us-ascii?Q?uY+7zUBlilT2ifRZzF16txV8VG0rqLJt6iTQx5M8KByvhaZtfExeaDYAchBt?=
 =?us-ascii?Q?GMqMKDe06GwBGzEFyhXoSwy3aZ+fNtiymc7kbV/lWgZgQzZib+3+VImD5sgf?=
 =?us-ascii?Q?k+M40uahvV2VIiHISUbijqMlZlmHFBp0RCvqgf+Tx+QnPNdMYHQF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d067992-847d-45fb-300c-08df4c993a5c
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 15:15:10.4680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +mb/kcQ8xx0Ek5v03eGSJfI/6ZC7gPQ7kI90RSHRclmMR+Lo+zWenk0n9Y3NJkbehBsPjs3Gbe9A4tXII5/qCMGqgpbbZS1PumxbkjiOpAvapthnaqYg02NiqE2UU5zN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB619844

On Fri, Nov 27, 2026 at 07:33:31PM +0800, Tian Xuechen wrote:
> From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
>
> The OF controller and DMA engine remain registered after the driver
> releases its channel data. Unregister both in reverse order when the
> device is removed.
>
> This issue was found by our static analysis tool under development.
>
> Fixes: d8b468394fb7 ("dmaengine: Add STM32 DMA driver")
> Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
> ---
>  drivers/dma/stm32/stm32-dma.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/dma/stm32/stm32-dma.c b/drivers/dma/stm32/stm32-dma.c
> index ba8121d37f51..6392c15b4317 100644
> --- a/drivers/dma/stm32/stm32-dma.c
> +++ b/drivers/dma/stm32/stm32-dma.c
> @@ -1761,6 +1761,14 @@ static const struct dev_pm_ops stm32_dma_pm_ops = {
>  			   stm32_dma_runtime_resume, NULL)
>  };
>
> +static void stm32_dma_remove(struct platform_device *pdev)
> +{
> +	struct stm32_dma_device *dmadev = platform_get_drvdata(pdev);
> +
> +	of_dma_controller_free(pdev->dev.of_node);
> +	dma_async_device_unregister(&dmadev->ddev);
> +}
> +

Please use manange APIs to fix this problem

Frank

>  static struct platform_driver stm32_dma_driver = {
>  	.driver = {
>  		.name = "stm32-dma",
> @@ -1768,6 +1776,7 @@ static struct platform_driver stm32_dma_driver = {
>  		.pm = &stm32_dma_pm_ops,
>  	},
>  	.probe = stm32_dma_probe,
> +	.remove = stm32_dma_remove,
>  };
>
>  static int __init stm32_dma_init(void)
>
> --
> 2.43.0
>
