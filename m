Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013071.outbound.protection.outlook.com [40.107.162.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FF343C7C2;
	Tue, 21 Jul 2026 21:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784669910; cv=fail; b=tbxB05MqMCi97STTeCOwePADTEEHlcrthsCnGY0nXZJBhoW4Z04aAhmiXtx3dLUFgcX7pMi+YP9cojpVrKcIVVqhD9on7NiBBW67L0tXpW1OVCi7ieQGFCz8BbZsUhnRP1Vj9s3tpKmxeps6VHlzx8ohXsgEGbosmSk6JCG2c3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784669910; c=relaxed/simple;
	bh=2fWnOm9ZnMUaJXzVS0gQts5tTgyk/kkCfKAL+GrrWHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SoU6bvBmWGp5p3Xm9LwkFUR3T1vEX2R6mD1ojgZQhwG6JHFx1P3am1cWJClslhVnyzjI7jB+R1NYJnjK21v37Xud/vsXdef/CUVFLJCxZN3pdt83cbQL92NuHjirNffMBZdiXHRHNxO50ih5jjj6++OlTjQ3IpaEgox6cy1JV4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RGJvNh8X; arc=fail smtp.client-ip=40.107.162.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RGJvNh8X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rj9KiU8KxhrKOJtx1Vy25gVHRWdVtrWq2JVnh5a/uAjXBADTfkuKufhZzenW7/1aPUxdORbGgygrP0R55SMuOKENQLQVUYPs3q0C3gCg60ds7ot2Ah34IeaAEtvUqjzyBICUyOzQ4m1XwNV3+j/CY9Lki2+mc11os+LajOSb0xyY1q5cLnoq+uGlvwU0nHHWrpAM1AoRV/76CQxL7O2ffMQU08XXJKQEVP0Ppn+cOauD57WVXBSjjUmJsvgy6nMxC+libLuX8BOjSIpor72pjyiLbq3zaYqnIvS55AEoup1Vg1g/vKD+GZ/B1F+zG3iByWfoeyAAwGaQiW/TdzT5QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ty25UkBaA3WJsCEcAdcAcDbhC26DzqSD8zziw4WuAyI=;
 b=sFsBR34xiarE7E5uCpNKMsIZBf2uPjKPNZCgn59mX1FmlCLy1efNGS378vULM+xR6g3MvJdQ41La+oSSPzbFLZvCY7VEo9wmdyWNtv9SO+zBxBdG6Golbf94dS7LT/HTf1u7frSPx7/ofbRgLzAaJvfkeWerSpThbO81qmL3JTAv5wqpf4ryUAQju0soNcJeK66HbZW6Pe6cl9P6HPalRw7dqkQsvYtFHoMW7z8p0nt5HirV7CwShwPd/F6vCxQzdsn451uv8w2xG1gtrzQtWyzX/ISLxZCBVfg9vAxwMbOAUidNxUlnBiSYsVbCDT8E/+bMzl32lp4Nr05F0zHJ1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ty25UkBaA3WJsCEcAdcAcDbhC26DzqSD8zziw4WuAyI=;
 b=RGJvNh8XchP8ZmAe0KrmAllF5y0jGIBwrZldSTg4/MPBdvtgaKzEinYZ9LDqZkrCdSNFrBY4swXzBiipQ/q0ZlOJnKmBOMzgi/8gCDkFTPcvsbB/b5yOxxtpdLrS4X2EyJwHgJLzKYOCYMuS91KxEoeXMnCA3hhbfMLr9JI+akzB6+LvOuRvvnjS+lGkZHlOnkvjsDXKS3dR24JCYyqm3hyNH7UZOVMvtMsEKeysrbp0MX7eudYUBHs7UKZW7DAwJTXHB70yRXZomUx37gmE2cWDeGYbS7laCLLQG66va37hy99GdP0girpoeMCtuYLV9Oa9gi2qr2IbGxfnB8jP+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8835.eurprd04.prod.outlook.com (2603:10a6:20b:42e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 21:38:26 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 21:38:26 +0000
Date: Tue, 21 Jul 2026 16:38:17 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	Harninder Rai <harninder.rai@freescale.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2 1/2] dmaengine: fsl_raid: pass platform_device to
 drvdata
Message-ID: <al_myb34GW14qd9a@SMW015318>
References: <20260721195422.353794-1-rosenp@gmail.com>
 <20260721195422.353794-2-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721195422.353794-2-rosenp@gmail.com>
X-ClientProxiedBy: PH0P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8835:EE_
X-MS-Office365-Filtering-Correlation-Id: a81928cf-e52c-4829-3e6c-08dee7706588
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|23010399003|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZVAkn/w4ZotQk+IHXTI4oOqX8VsNWU3PAFot6USfL0Q4eMoG2uC82ph3IofcwdskOySVm5MCLpJlIkPcragkT7vnJ5t6tQCIIIp31ZB2SAG3L2WE87Z49K0xWOav+VuU0fwsiV668U70YND4aGHzwAfEedffl4GAm6QGgesf5xTJg0hI73s6dxVbyxASmKbaRDeILpezH3jPLmFN1RbrBcO/09alB6X3SHXLImFsrT2RZyofhbxyNGjvcLWHs1u3TrdPbfrHpgax8Waqr/gAvcHUOICcB5Z4XlaAScNKeB6+xNpAeB8uxSEEKejRuitHUfQ81DunvaJLpV1u98XkcsJp/U6E8fq3u4Qk3uGgCRmgVW5/dfCaPli3cRDGxyNtGFGiIMVT3GsqnkuVJPmBOppmrwuNIT2DHljwMMCqD8/In53PCEDxQRUHWgVjXTouQhyDzqYqvUqB2wLAp6FatOzjV3KDuVbIE6FTdNMtD+znHuGf5/EoAx09eFL52FczeO0s4zIoik3loTGzy2IHqi8VkwbYrH6rclX2MbPZGNLtJx7Sqn9mReF97ge/Sn91Z3k7c9mOQ1KXxLimvgrOgkWk5F4pZQdxGRJ+58Tw23nPWlgKoW+Zye/o6m6/xRdEi6ETlKTbP+NFIliNMT+IMNg+73/4YpSxZ06TU4sDFH4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4b9Z+1ASlJAOIEXKClRLU+UpXuKYH85m/a0Dy/CNKI1PNnU4hIbhIkZmp0L+?=
 =?us-ascii?Q?VnXXSz6fDu9NQ/++TSGEAGpS2KzAmhzlZFPbu2hxCZK4NwOxvAl20QzjQDH7?=
 =?us-ascii?Q?nbcH3dpHLcDqizCu0ceN0mJ4RoYerXLchXpkFWL9fm3qjO7uAqW83M1vq6ao?=
 =?us-ascii?Q?tKUE3RpRLcUbTnM6CJ26/S80PMOGVP4DV7qc/YM1DJvMr7mzHwtjWF3bAvvf?=
 =?us-ascii?Q?8rqDD7LM9pNHlv274elFWchpzTdeLH3VZktvILO+Vax4Dy3Cty0jae4an/Kf?=
 =?us-ascii?Q?ntMesneHrnZrkaiC721LiWHktL7s8RjN/YJDKhJXHxkLU7cQp9QMoHcsBs/C?=
 =?us-ascii?Q?6G03fgB1qM6hg+dnBJ0KkDe3shmdET3bAFRe1YmgYqiRvOBnPKetUNBau47r?=
 =?us-ascii?Q?48U4H55s2YmDiAaU0c/zmgfcyu9dMzXNMISUBPPMCmkDJbhgwzlMsHMS9NeT?=
 =?us-ascii?Q?1TR7WIFVzjcAMUXSZzM8X9LzTqIjaSvwxE6RHctXRi7ziZvxB+U1MDWjIIR4?=
 =?us-ascii?Q?JioFTprUNLU/3EhNnalc4SRwcAO52Hs67enr/52D3MZklMqJ8I/NrE2KCRos?=
 =?us-ascii?Q?smmtUXzWwM5m8H3l0pdZYJ930l/z/udyrmn5rW0GPQj1ySMujnix2FqXJo22?=
 =?us-ascii?Q?VvrYbZCotwA6G5Q8xAIpTyc7MKFwCw+4zNjSEVs7Wre/ljBeZ3Sii0gy6TUr?=
 =?us-ascii?Q?EfsMa0AcYs95Ge+dRIlfPNH0uGPooafpXqlgh7uTll9co+7FgcbrE5kReDA6?=
 =?us-ascii?Q?RVR5n02oidqDwgtEbno5nR5cn2NGySDSc60VdMEhVBxl5lHwQ93/gM5mmrid?=
 =?us-ascii?Q?xBGbMSKJfv3yyPnlpLaS1us161xC+Pyw5t2RLi3IdQDXh0Wxss+pkaivAoDJ?=
 =?us-ascii?Q?wjmL7HBWl/UJvh991uwHgZJuRYmXMnMjJO2LyvqcSpNHwq6oMl8HQP9QyIzT?=
 =?us-ascii?Q?gOUOjy/wGYLvvA6Pk+a0m000LhcVB3EP3pUTpqcTSFWK4DNnkQ01LiqxqYKQ?=
 =?us-ascii?Q?6g/aIdUEjgI1DwyT1Auc5D7GecuC6BaCfDfemzSWm4NhN6vy98L0CI1k0RYH?=
 =?us-ascii?Q?1YfrvB9tJw/C5T51eBVHB0AgPMTEm39csKUBM73kJvPpGBKeR7sQUxyTpj49?=
 =?us-ascii?Q?t1dIZiu4jo+adshBOcwZTXew9iXETvrCw36YH+3YR+C84dLwmzsJnL4nJieW?=
 =?us-ascii?Q?+abJO3wwr09nhNtgFInyC8deO9vJEeskIOKvBil3gQ2cKDWkYqFZ6R4IYOHA?=
 =?us-ascii?Q?knK17QHvUgJplIia+qa4PhmdGiEULQ7eiUbeiHdvtcQxq3JK6TBORaj3Uzbp?=
 =?us-ascii?Q?0EHXYJS5pKI+3PLfCLngJe8ormgos0tZkHzoWnJU9gx2g4DMmhFVMkE4aFQi?=
 =?us-ascii?Q?z/72UDQCgmiQKocB2W/luAb0vDJn+vHN8KBXC1WzuXGu/bwOCFvdBYE2Mtlo?=
 =?us-ascii?Q?8A0HnrWwHhMhZ4AcRtUFZv87kvvtHcETRBYRrIBIEU/CKMaZRmeAs75F5K5Q?=
 =?us-ascii?Q?WxwvvXDiyHk2uv7pxvLK89jZhnkGMRPxCIIBCoLDvGi5gD0RRZL7KmXrDF3J?=
 =?us-ascii?Q?oIuI4pXFr/fslKyCraj/0B5hAvRsLPQ1kuEvuOZAvlFYjeopSp0JwaeP0+fu?=
 =?us-ascii?Q?HQykz/r6AgTsRILTnyDZni2vJueeiiF36NJfF2a9mnhBz57F+xtoX7yr+hnt?=
 =?us-ascii?Q?CKFuqd5qQSvRJ7FW6TNQ9zzc4WSg5hUfRYqa/4qGDXpeI8Ir04QAVTJxHCWa?=
 =?us-ascii?Q?KOd3drcoLgcTTa3sk5kFeDenAQxuTgzZ3P3c/s/Ys96WsXuUs+lZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a81928cf-e52c-4829-3e6c-08dee7706588
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 21:38:26.1644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S0CR5v+LgycNBQW3OmbT9cdJdgxcdN83VTakP42rMZMGc4DJte97CUbCE7lDB0HjGIDguDD2ESzkPtbZvFSN3e2zl61vLQoGcrMXwtK2Ag9vx4Kf+WszHju4zUf5AokO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8835

On Tue, Jul 21, 2026 at 12:54:21PM -0700, Rosen Penev wrote:
> Simplifies code slightly and avoids having to take pointer of a platform
> device member. A platform device is always used.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/fsl_raid.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index da5228e121d1..2d54879cd6e1 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -219,10 +219,11 @@ static void fsl_re_dequeue(struct tasklet_struct *t)
>  /* Per Job Ring interrupt handler */
>  static irqreturn_t fsl_re_isr(int irq, void *data)
>  {
> +	struct platform_device *pdev = data;
>  	struct fsl_re_chan *re_chan;
>  	u32 irqstate, status;
>
> -	re_chan = dev_get_drvdata((struct device *)data);
> +	re_chan = platform_get_drvdata(pdev);
>
>  	irqstate = in_be32(&re_chan->jrregs->jr_interrupt_status);
>  	if (!irqstate)
> @@ -649,7 +650,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
>  	struct platform_device *chan_ofdev;
>
>  	dev = &ofdev->dev;
> -	re_priv = dev_get_drvdata(dev);
> +	re_priv = platform_get_drvdata(ofdev);
>  	dma_dev = &re_priv->dma_dev;
>
>  	chan = devm_kzalloc(dev, sizeof(*chan), GFP_KERNEL);
> @@ -687,7 +688,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
>  	chandev = &chan_ofdev->dev;
>  	tasklet_setup(&chan->irqtask, fsl_re_dequeue);
>
> -	ret = request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);
> +	ret = request_irq(chan->irq, fsl_re_isr, 0, chan->name, chan_ofdev);
>  	if (ret) {
>  		dev_err(dev, "Unable to register interrupt for JR %d\n", q);
>  		ret = -EINVAL;
> @@ -743,7 +744,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
>  	out_be32(&chan->jrregs->jr_config_1,
>  		 FSL_RE_CFG1_CBSI | FSL_RE_CFG1_CBS0 | status);
>
> -	dev_set_drvdata(chandev, chan);
> +	platform_set_drvdata(chan_ofdev, chan);
>
>  	/* Enable RE/CHAN */
>  	out_be32(&chan->jrregs->jr_command, FSL_RE_ENABLE);
> @@ -834,7 +835,7 @@ static int fsl_re_probe(struct platform_device *ofdev)
>  		return -ENOMEM;
>  	}
>
> -	dev_set_drvdata(dev, re_priv);
> +	platform_set_drvdata(ofdev, re_priv);
>
>  	/* Parse Device tree to find out the total number of JQs present */
>  	for_each_compatible_node_scoped(np, NULL, "fsl,raideng-v1.0-job-queue") {
> @@ -903,11 +904,9 @@ static void fsl_re_remove_chan(struct fsl_re_chan *chan)
>  static void fsl_re_remove(struct platform_device *ofdev)
>  {
>  	struct fsl_re_drv_private *re_priv;
> -	struct device *dev;
>  	int i;
>
> -	dev = &ofdev->dev;
> -	re_priv = dev_get_drvdata(dev);
> +	re_priv = platform_get_drvdata(ofdev);
>
>  	/* Unregister the DMA device first so no client can still hold a
>  	 * channel and submit new work while the channel rings are torn
> --
> 2.55.0
>
