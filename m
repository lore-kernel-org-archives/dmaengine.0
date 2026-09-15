Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013041.outbound.protection.outlook.com [40.107.159.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44AA361656;
	Tue, 15 Sep 2026 14:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481230; cv=fail; b=imQUopRjdFXQwyiiZkHHdq01b19a4qiDHgGw7qZtumaKjDs4pUioJtm2VaVuHBuPD2u7YcPULNfGNCIs4KoSoG97aJ+2tjXIakz9lvHpsB8GxeIcnMWiFwEm725Z4OVDP2SauFoafObn2exg9M1G2AalxhwWXquMpXQYZF5WvBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481230; c=relaxed/simple;
	bh=rkjuAozto3uKeoyruy2k7lj9ICGKUi/SrWV1vUkmZHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hCtRmMg8g0eyydRLs/+bxN/v6RM2jbKOPCIxz6t+AsNntyu19G2wxyzDBHs4MfKenpFoLMdluT5jtGB3i1A2I9IVHN8bMF5a7HOy756ItBagzrrHoG4ZV4TDSyVNUkNJ7l7Pf7ww9Hc3x8uTECcw7m2DaON/vNlcuob6Y3+xdeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Emd79qmm; arc=fail smtp.client-ip=40.107.159.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Emd79qmm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uknN6/alGgFYizqcywUUHeiNdtpLMbpAS/lVItHndWyC7vVNEwwXRzC1v/U6dOxH8ESdcFqiz2r4ABnx5DnHrCcFbVY/UMl1GLdU/V5vUqZ56g1wp5jPpWgbiYcA/ez7rr0NVY8PTBDhlSR6eEmFE+ErVyocyM8qXQJfNxc4PxU6KQNeSNu+DQlV7tZATMceqA//54igbEK3HztnRbCD/Moi9OHhFJA2kMipqOPwJKShEiltLQF3Bj8/LD/eOaE9wg8TEV5HFb5Y9kVNpB9/ZOpYzVBmuHakXBlEIQRH6W7psf3Pl0yXA4DdAeZX4SdbGAwFnTfj3cGBQlPhDeuvGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tj9/FEam58RP09qhJr22Wb2RZ3/Kz/rmGS5qJEIS7UQ=;
 b=wLQBy/nVy939nWRKRhlJ8G6fFIdWjluS6au5H2+FxD9bw4vTd4C5vYyz035gXU4KsOrKM0Z9Y5knIC8mw7aftoIyqVlSA1F9L1xtJ6DzJMbZkhBltkBVMQ94EmGbIdpZT1PqnEafpIgubO1sTBozqDpBR4RSOqdwayifzAgSy91TUJefT50u4M4kyP7Z0HK418BB5wW3iX7rGAKhxXCicPFCbeRwqEA4TF0utVn0ccx+i9Hu8cPjPem4v8aq2UG+eFQn+VHr3+gYqHd2SHz0wtkYeUKW7hOMWTbLQ4Cago+/n51OHPKO69QXTkWR8IGjOIzEbdME4HsNzbTi8Pzwlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tj9/FEam58RP09qhJr22Wb2RZ3/Kz/rmGS5qJEIS7UQ=;
 b=Emd79qmm+6UWlSDmAsIIjHtn5JpNh+3RbwZ7E+RrANJ1nngiPWVdmXslF5hRTlqgNrWEbvaQeK2HNesOUxga3kx1AIfUYX2iw5PQLsA3vhQqDeTv2sdvcdsEWarSsh5Kco5whR//VTAxgn6TV7Wz0yWQT7/SPK9q1qCP6Yz0Udn1xKN0MB77Tpgy8aFjzW2Fn4gDf4LEEXZ5oc+KGPa3isDCP3XXaYfe0kva1RYu0/S2WXdTm4unV0io3yBheBljpfAkjlibOo7nfhd2WvUlhk4CMPVpVglDJ38S8Tfnj5+y47nddmXsXuB6D8FflrjCtccXSQ1Zx1rqIiBJMrIYxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB12110.eurprd04.prod.outlook.com (2603:10a6:10:63f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 14:07:04 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Tue, 15 Sep 2026
 14:07:04 +0000
Date: Tue, 15 Sep 2026 09:06:55 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Andy Gross <agross@codeaurora.org>, linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: Re: [PATCH RESEND] dmaengine: qcom: bam_dma: Defer IRQ trigger type
 to device tree
Message-ID: <aqlQ_y-um0yqo6jj@SMW015318>
References: <20260717-qcom-bam-dma-irq-trigger-v1-1-6405eac86f00@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-qcom-bam-dma-irq-trigger-v1-1-6405eac86f00@oss.qualcomm.com>
X-ClientProxiedBy: PH1PEPF000132F2.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::35) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB12110:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c7bb706-6513-49b0-6c47-08df13329e70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|19092799006|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	xcg+F2CMezk1J3JnDIUKXondq9HqE1DW0nVFB5gow0103AXw/2BWzvLCcm6IQqjTZTuwvYIFkpAH4SUpEvDjeXzjx79lCk7S1ehYFXiEEOzCluoRdIXTvjy7727mZWeLb7Bn9h8a1FY0yjHZvF4Spr98DH5q66nCdu4po+xdsCTjYo4l2wlDNiSoFOFggzn3jE0QxqxCH20OwhyJfp2le9UVssspRPxZu0IhoHXglGat3UMrOUcKmYqX6Ola60x8as7kG1ON4hTTewVV3ogavO+BFtOB8rwiAypxbQBUVIHl4EBwEIs6Ux6yqBJbQyEDQ5eKdfT5FdxRpJ4T8yRSRwKCVnO3ks5Yt/v/lJ8gUpz5w0IfgJl6uJ2+AnSeHQNTiJ9j+vXKW+IdhShnMLy1BOwnEwWVfqyZ86qYdixt2YKoYl5oiYDD6yMMuHe0LlP+H0+33/Bc32Q6wMiEIA0gAN4Jt6LQNBsl0kib9JL1s1bHrEYEkHOPot6QUvs0RXXT3ffd7fJl02q9C0k/qtl8oagPIgrW+59mIprIGarcA/iylqBmOzSY5fM1tr32aiDEslvViFamMR6k779EbljWb1vw+GzTKxTvNg7aDYr/YQJg09XTHbobHVSymkbG6ogr41DzIAxQXO1h9Pq53MW/aTh3NqRQ6SKfzSaTexA4Hug=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(19092799006)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9K8tKEcwjujFdISyGucnfMVM7/IpEd6j+xPZHk3qMxSQKsFADLJd8xLAN/Gk?=
 =?us-ascii?Q?JQbpyoQ+teGfrYCEVS0tMkKiNgHcLpS6v14esgSGU7nQ4jmLW3Z5AkOmVA3S?=
 =?us-ascii?Q?XoKh+YfyJ+Ei31ZEfSYrCi+6noi1pawkJKocWq9Q/FTLzQr8mBwoeEhdnKzb?=
 =?us-ascii?Q?x1YWe0KBYoGBilp0GZloOPhhkvYpJx+PN4l0qO4rFSd7YCMu4w+5kd0OryWU?=
 =?us-ascii?Q?cwcWkMIvH57N8mP/ZKJi3EJMWz983ixFbODLnekkKS5UuMR+cw1KId/UTIng?=
 =?us-ascii?Q?3/EmLbz5aA8aXsru8jJP4+e7A5VDBFhZsrSUCSEDp3aClWfHqPP1KPtnSeDp?=
 =?us-ascii?Q?E0au4x/S8rB4MOXQ6Mcb4oDnpAwXlFahWEJk0/pcUJH49btHZ+IyOud6j8oi?=
 =?us-ascii?Q?5huiIyVpZsqezKM9yIYgYDYb1apIZxQrb798V9+s+gPwwHm8ts84ODbUsAr6?=
 =?us-ascii?Q?h18+51d5lj/CIvnvWw3txcDVX+YJDmf8ixcyHDrmceEQm7+9pIMgxtK/ndsa?=
 =?us-ascii?Q?UrFqWlKTZNMP1hPikvnd0getpHlrOKs+tIP0HPTMZPdM37J5GtpuonxSN8Km?=
 =?us-ascii?Q?glapy6a4LmwScZJftUJBl1Osjma8BiVAsT/u6QbiGeX/0LJy5U56PTvW6Kka?=
 =?us-ascii?Q?U5DBvQpGIt925nfeM4DhqkBkujIz/a86DhI06DIYBK8+nXwq+SNYGdkLU/D/?=
 =?us-ascii?Q?RoDhnZfYkJbzF3WOHH7sdSXGlQYFVPkxG/xrd28XkJl6BN1kixWlscR7PK/M?=
 =?us-ascii?Q?womJhbsxn5d9pxD+6njBvSCtJ9tJOglhDPDkUcAfUp4LCPZh5u5JVGuhO0Ky?=
 =?us-ascii?Q?Izb65NeQseiXxHj0jAzMddeBUD7ZOOAHdSE0bo2b/bzMwnm2Z1AgK32GJoQ7?=
 =?us-ascii?Q?74qYzc48r24tDtuUYywOXmZdbOQgJlxAgcRQPrWAecZAok3av+8FcLAtp+5d?=
 =?us-ascii?Q?O0TDG0CLQF5torItWd5fq+xxLPgX4rwg80W+Uo4YY5s9pczZT5HIjY/LbIHW?=
 =?us-ascii?Q?2JfCVE0R9hsEOqrUbbufCc4tXM7CP12W4H9VRZwwXWkl2o8284eOBicuu42g?=
 =?us-ascii?Q?+uVS5rPqrhfeX3xfmG3XlOnrkQYJMWxFN7tk+fR0EPYtN3+3jukZpmC55vQT?=
 =?us-ascii?Q?fESoMSwpix5UpLaUiI2VWrz6iOLg0mj5M9X6JH8uO+ppmU72VERUoVSO5MXc?=
 =?us-ascii?Q?CLKIo9eCn3qPgI9Uy4bvnwOUA2lBXc8IQzNIS3zvKrtopq0xFHL7ZD0OSWHb?=
 =?us-ascii?Q?lcT4IX63S2lCTq97MVUIvfO1eyI8SObzyp0t9vx/wpb1x4QAp9PBm8NPFMTl?=
 =?us-ascii?Q?DKB0xHFqKrMuTRLLWsrTCceE2jfF8b3r0sHwZUVOZmqSwSM3VneH8lnbOIFG?=
 =?us-ascii?Q?FrvyGy0l4L09crjD6N4pf+iPiiL2YsL9TsmNO3qjvwuxJT8c5scfg0U8/jOU?=
 =?us-ascii?Q?VVtYdjUycjDQd6Dx4hgOWdj+/qkl+4zU+X9dlsA+3dX4uMucBKFuYav5bql+?=
 =?us-ascii?Q?nREqIJ+koVi/oil4279Z23us+28Au2nbR8olA3a7KXK9DXEigp4k6L4sP9Xz?=
 =?us-ascii?Q?vqx83nV1tHfYt5FpQOzbvcp5pQcXhyUV2R+lw73PpNyT7maCle0Vled51B1v?=
 =?us-ascii?Q?WRB54wtNTeb4ZijMQV1PSLD3p4IISP5A+0HqKC2IcDYfKUtu/MLvHaotS6UZ?=
 =?us-ascii?Q?N63AOJ7givJEXU3Q9bgxUD7gpWcrYlBJLR6VqXUO6eqfedpkRiDa83s3Bi0/?=
 =?us-ascii?Q?mZs0a+pEnV9jN/pTERa2ikRf5sUI42RVcxfCtUHtVXAF6FniEErD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7bb706-6513-49b0-6c47-08df13329e70
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 14:07:04.0638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FP0n0EdlCKpA5m43Mu+2XmUkES90vr/MhsJEidoV/C7IVSlBxyxpHmVoucwvJG6LKE0TNelZSutAaBubgWWERF5zhQR/Sl2HLV5/rEdR9Fbh2Y3bSGrRaSLOHxrUQTh8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12110

On Fri, Jul 17, 2026 at 10:30:28AM +0530, Vishnu Santhosh wrote:
> The driver hardcodes IRQF_TRIGGER_HIGH when registering the BAM
> interrupt, which overrides the trigger type specified in the device
> tree. On Qualcomm Shikra SoC, the A2 BAM signals an edge interrupt
> to the apps processor; registering it as level-high causes the
> interrupt to not fire, resulting in missed DMA completions.
>
> Use IRQF_TRIGGER_NONE instead, which causes the kernel to use the
> trigger type already configured by platform_get_irq() when it parsed
> the device tree interrupts property. This makes the driver
> platform-agnostic.

where show this? can you point me doc or code?

Frank

>
> Fixes: e7c0fe2a5c84 ("dmaengine: add Qualcomm BAM dma driver")
> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---
>  drivers/dma/qcom/bam_dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 19116295f8325767a0d97a7848077885b118241c..6c3e2ca8a572fd04c925de0adbd5cc0616b361ef 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -1303,7 +1303,7 @@ static int bam_dma_probe(struct platform_device *pdev)
>  		bam_channel_init(bdev, &bdev->channels[i], i);
>
>  	ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
> -			IRQF_TRIGGER_HIGH, "bam_dma", bdev);
> +			IRQF_TRIGGER_NONE, "bam_dma", bdev);
>  	if (ret)
>  		goto err_bam_channel_exit;
>
>
> ---
> base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
> change-id: 20260601-qcom-bam-dma-irq-trigger-0366e7e86f17
>
> Best regards,
> --
> Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>
