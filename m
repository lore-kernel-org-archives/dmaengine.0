Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792522141;
	b=ce0W6RD0JChmL3kgBS9lJtcebBZWqfkalcaGxRp2jsRfRnJXzWv3nLq5Ex1sUnnAn+Pl
	 aH67YmLqtr+1BY9dcM+oyp1Dy5ictGOlqClEnYTQew6z9Kvctnu2qBvxFGpHfWzR6pr+Q
	 qU5FeQ/G1flRQarNwfXu6ruTOYrkcAgjyptHk1F8ERGTZEshC+Vtarw9qNvgOAvJCS+Gl
	 zoB878Bg/bwMdXlXwqVJwOgWUhKUMzly1xWyBWvmn8qQHhUpU46ywVK68S8lINgo5RRTH
	 MjcghnzVca16yQ40Q9LJ3pPZ1I6f7BYZljjoEHtffv/xdgEZYdqOGYKolndsw5OlJGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792522141;
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
	bh=aMHEmBlXKokOTMO7g1cm3ldnIC7TomiNxWpNWZHmEic=;
	b=yLGdDXP8bX7psDzAaWvypkqFLH85oOCpLCVYY8CvuQAArtAhBcETIvF8Zgvcv1svn9SF
	 LTOOydjdHJvuuMZGYbGyouOpTUpRkF6jnfAVufTLy6836wAWYe+uNYzB2umUCfgCm4acE
	 xcslusmdyOp8mbb0OgUtTzRbmRkjF3nBm1J+BthwW1ITkNMaHpnf2qGRj9qJ29QBg5wE5
	 4TznqN/yyXEBQmaORG4BFva1FEEm3jnP96mwmsPMVb9MmQWbFAR/mZ2R1rsFlx7c8K/Ra
	 daKXwgJmp0XhXdRQMbckYF+9rplBZkb5yezqiTLMbeBwcbYcCcHh6eY/sODcl78m5uw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=L0z5A3Ot;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.12
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010012.outbound.protection.outlook.com [52.101.69.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467EC606A31A;
	Tue, 20 Oct 2026 18:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 467EC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=L0z5A3Ot
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0La9ymID8BppUi8hd606Akm3sIJI++SkPYFW8gLGdQ5F06cHDx6k3gn+b1JtzFRbUbgJ7fgcQ/v4rPYQj8zR9bbf84IE/rekxWo/px4kFWrTJf47Gr7t2EwfJvjbn6PaBMjKHP1StyYqbPbXonTXLZnx2n6rvJDEwmBwebH3vkuSZtBah1b4r50EbG9xmQY03+e04Umabz2ytq4sMZkx7Xt+6Mqw8toqMLjoIdqHHPwwsJU9+0W+63W39yzWi4hc8r2JBRTbgqH4EHH8xAx2niF2Pg3TGGFh5e0QDc2s9GO8Pkvha0URom1qPf8QexozwVp8y7TCQA7q8E9IueGNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMHEmBlXKokOTMO7g1cm3ldnIC7TomiNxWpNWZHmEic=;
 b=NwRWKsP5G23AlVhfGLlHWKH/Tj4lrYtEMZxP1mrR4327Fk2uY58fSMwtPxan7gKUe5hjcCKsus/dEMoN29Ecctzp8H/N1JWJdSuT4lWTMVSP3VeTc6X71/xA2K+dggiNPLdv/T0tPE7bsGc7fERdUz90/nXdFF6R5/sRQ8q+S3H9lqlgNrT60hpWR362M3EOwvVCZnko3NerN+7UaUAfOMQzX0DblHcP1WtQ7DyLvudx3Q9KZE1KSL1xAiUTduBh65k89lDhTP3g7seycFaF6Fbf1Tk1y/aJXWpu0RH0OMprbMN/g1dZOq+EHpLAdDEha435Tzs527IrU7k7VO7UuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMHEmBlXKokOTMO7g1cm3ldnIC7TomiNxWpNWZHmEic=;
 b=L0z5A3OtsYDucH2iNT+wrqlf5NvYys8Sk+t2BP4HhMaxjt15prQZ7ShyjA7uXJX17/pRW0fnMrXH2tQTQuUeQzF4ET0GMASIFUt4xk5b8MjcpDA/oORveLYeWxEjdKOgRoDGNAXfPbe/KzWul+SvHMHyeiqMRCeQ1bN780SP1Y8fAVQygbp4UAkguquJa4gHZ36lF5jB4urEiUS5xY/4VnNS+/g+Hyp6Q1TBfuTeEyQTKNyAlFwKBWT8PlBWNcTguYzzpBbNJpNaAUCOiqT+93pr6ueZvfwi+xg455ioga+GSjEz+EPbYVnpLy6ZHFINX/nAjQnMn29tAabAI274ZA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM9PR04MB8939.eurprd04.prod.outlook.com (2603:10a6:20b:40a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 18:48:57 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 18:48:57 +0000
Date: Tue, 20 Oct 2026 13:48:50 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, vkoul@kernel.org,
	Frank.Li@kernel.org, bartosz.golaszewski@oss.qualcomm.com,
	pramod.gurav@linaro.org, andy.gross@linaro.org
Subject: Re: [PATCH 2/2] dmaengine: qcom: bam_dma: Do not touch remote BAM in
 remove()
Message-ID: <ate3koQtZP6Urv7W@SMW015318>
References: <20261020180804.140766-1-smostafa@google.com>
 <20261020180804.140766-3-smostafa@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020180804.140766-3-smostafa@google.com>
X-ClientProxiedBy: DS7PR03CA0032.namprd03.prod.outlook.com
 (2603:10b6:5:3b5::7) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM9PR04MB8939:EE_
X-MS-Office365-Filtering-Correlation-Id: 39dabeec-49c0-4d97-9f45-08df2edacc6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|19092799006|1800799024|56012099006|4143699003|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ruvhwn5SaFq8hu0EJmI3QCoriPOz+vyFAHLmqJ5/YNpsQtsUxtE75f2LLcTzGHMvJPGOfkQ2xKvgEoljgkj4pwc06mZRbAhQIkjizHWcC7hjAkbNhQLwIM0F2zBz5SN44uqsgQrskc+eskJgOQkzJ6UnI3FVjMubNLDgsDJsSfai0wEnAVlgLJ+f578/MYJ4YPRgSIrkMqWXQfoHeuNMRFLKfxTx2Li1WSW6ufF/cwuKcnBeqAvmpyGo5k7cxzQuWVXBczfx/57L3tGG23nMPxhsCyDZUeDgQarZ3fIhBp7v/jgkLDJoFKBMm8yCJLJh9pBxXwL/CGde9D8RJmO82Qt6L9HR8EGx9ceSgZTNw/x/WUdK+4P3CAnoqcg/42yBk8eVd55C/2h9OMxQIn+K8RmtqHMw8ZTGZN+aclmuRfZWnD8fFw84h8QiSJw8Nh/8Kev0pzIrODk2qbtMpvzu/qsRFR6q5s8laytZ9tkCpp/AH82/ty3vM9K+16N3W7vOOxCh0vGwwGxh+huo1zcgaLgbM+SxXjNVWxChmTgYvPSudptIU+rnKNVSIYDBLr0LY0OLEtmAwGF5JIaQawxzv2X1bTz+2kxwGKYGje5RBoCCHz8NeHg2Uu4PV3IFdk3BfsGXY3Df2uWU3qbx8CoD5enaC9AhgvqK8D7ldPbdTaI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(19092799006)(1800799024)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T8iHwTY7Pqf/ivJRHNLBIv0iGYDbaETkT4oC8wlrpgyYr/+K8q7ekoXHMFzs?=
 =?us-ascii?Q?EjJAgC0WbexINdcqpMlBXOFenrxb7QBJCgbM3bGV4KwAZoy8TBbGAZx5qRnl?=
 =?us-ascii?Q?REgelXqMltR4QXkHVKjjP5RnypHKn1bRampIbnfOop7TKaPJ2iS9fcDRb4QI?=
 =?us-ascii?Q?xoOhp8+1RT67J48MlsieYMYrlH9M9MuTLx0sdAr8ydyv0XG6Z3Jq+hvDp9NB?=
 =?us-ascii?Q?fMH5J1v+G9UNdK68YrU0zI4Lm+t5reGo+namaacbI0d7ZF0YkjkMR0O5rPJU?=
 =?us-ascii?Q?I1wnPZuvkJKg1FTCK6kf4F0eTxrPv9K2yRrmrB4CM8QBKoNYt2yiblNIQXsf?=
 =?us-ascii?Q?nhyr8+7bXvuQlsKNN/RVCM2Zl//DtUg/xSGRCPwc4uDwcBGgDWLDkvNkNGpk?=
 =?us-ascii?Q?iihf39OHRYpYzmqAyWFfgyhX+Vu097ooUBSxdxmJTXXqpfYZXxE6ZNr8eNVW?=
 =?us-ascii?Q?mebJSdqWQMxBdTWaDP+9yOqvvgejeNUr0n2XEw21B1tenrMQC+g4aNhfdq72?=
 =?us-ascii?Q?v3s/5Xt7fWUXGUdJbQJvPjm2rRqS4P47Zdz4VGAz9IO453my2n7GXn8cA4yg?=
 =?us-ascii?Q?I6H4fSBBuPZDw6elJdMxI7j6L6R5mgOtjmvHdm8Dlyw14vxhjnWCBDgYFmz1?=
 =?us-ascii?Q?eCVNaqME/UYpPypNvsij9Al2o0v2mixwC/JT+ABAJLJfw8VeaU/heR3wMlcO?=
 =?us-ascii?Q?LXFIcaNvDGeqz8NcxJEtJOGywhpaYrMEZFs4x9CBJ+dbxV5BIEl5bNO451YN?=
 =?us-ascii?Q?2helLQcuFsgQUojejqN5/1a0ZaS1kGv+7d0AFCIneTrYNRhsWOVxqbRGI2lK?=
 =?us-ascii?Q?AR4kTIK+qTszX++4okU0RoNSD+PYMhNpmPYKQC/LmGjchOgpbQSfdulbhbEw?=
 =?us-ascii?Q?rD51dsqC0H7QRNTITNN8UCjiaKatKTSxCX0Rx/tBl3eHn6bNbli1jclYj7l+?=
 =?us-ascii?Q?70f0MkS/4L6G3XK5XwSlHxs+8C2GUYCLKpbd1kaFxQt3Mgv5LFg0KyxkgaWv?=
 =?us-ascii?Q?An90afRt/YJP7PrvqLewL0aNuPKXQumOwuzGh7NQfHVwbmhQxfANvbLCdMIK?=
 =?us-ascii?Q?OnB35T5oNlx8y4VI5lJffDqlVkOUC+p2r+Mjb+m5Yy7BnkNjammv8QxUplM9?=
 =?us-ascii?Q?5knUPKg1XANPr7+pCZ/mbhLU5dFPdlc1v2XwJWmCPPqFdHw5yzqqip+Da1R5?=
 =?us-ascii?Q?5ShQyNfCnuWIlst7abOX04csqCaYNWu7J7Yd9qQZYfvi7D+BUDbqD1rs1arp?=
 =?us-ascii?Q?0PiSsZmPs+W1RqI9toDXaxtyo8NBOAT3TjhXIN4nny4m8YYDswJpvp9zDqcB?=
 =?us-ascii?Q?jRqvMD9oRZa2CxWhVreCfceerPtP7TJQRN0hDAfrkNgJ/DliBaUXu2s9yFcq?=
 =?us-ascii?Q?7K7CPejWkwBwEQsrpnfrNn7+3etS/HG7H7nvGfjNii1pEYXDGIeJG4+iiS+Z?=
 =?us-ascii?Q?jYi7nxxSNZex+wUd9j+g9dzPws/wh09wZBEzNQxsqcZykX8tL0Aotxt9aASb?=
 =?us-ascii?Q?gLZaZrDIeOi/6N/EzvNWRVRgEuls8GR1yR4eyEVNJPSjfxSzn3PPifTOWhIa?=
 =?us-ascii?Q?g+MsgDD2wHCw7h6WFqr6RfDI7z1fQraRaIbav/U/L/Vp8I486NFubX4tbB7T?=
 =?us-ascii?Q?Vk8FmYX8T6m/nSsIQOXcHwJi0g4uK9zcGEOQ9HnxdNB9PSfOmuxkGmAbJqU9?=
 =?us-ascii?Q?K3e/RBkSvuYAFvs6VNfTh/7w6bCxERut8mXDQJR5H2UVfDHvF/LAGm5MVYBA?=
 =?us-ascii?Q?hZmVPIPEZLeFjOTNXOp0Bju2ZpLO6eJJLtpgK36fP1xA8cYZ7Epp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39dabeec-49c0-4d97-9f45-08df2edacc6e
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 18:48:57.9099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fChq0InNzff5Un6pIzC4TujNILSV8p/SR8hPZLHZ5crwhP7XQ5lBamgch4EfqsBwWIHFUrM7EPJtTzmSXJNL1e6eOZ5SuiiwdbqoZSWrXAj3QwFJr85CZB8zBqJYu5Gg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8939

On Tue, Oct 20, 2026 at 06:08:03PM +0000, Mostafa Saleh wrote:
> [You don't often get email from smostafa@google.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Unbinding the crypto BAM through sysfs on X1P42100 resets the board.
> bam_dma_remove() clears BAM_IRQ_SRCS_MSK_EE unconditionally. For a BAM
> that is controlled or powered remotely the register may not be
> accessible: the clock and power of the block belong to the remote side
> or to the consumer of the BAM, which is why bam_init() already avoids
> every register access for such a BAM when the DT provides num-channels
> and qcom,num-ees.
>
> The write is also unnecessary. On a remotely controlled BAM the driver
> only ever sets per channel bits in the EE mask, in bam_chan_init_hw(),
> and bam_free_chan() clears them again. Both run on behalf of a
> consumer, which keeps the block clocked while they do.
>
> Skip the write for both kinds of remotely managed BAM, using the same
> condition as bam_init().
>
> Fixes: 5172c9eb89d4 ("dmaengine: qcom: bam_dma: add controlled-remotely dt property")
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/qcom/bam_dma.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index bd583f78e0c1..d818fa1dba57 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -1407,8 +1407,15 @@ static void bam_dma_remove(struct platform_device *pdev)
>         dma_async_device_unregister(&bdev->common);
>
>         pm_runtime_get_sync(&pdev->dev);
> -       /* mask all interrupts for this execution environment */
> -       writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
> +
> +       /*
> +        * Mask all interrupts for this execution environment. A remotely
> +        * controlled or powered BAM is left alone: it may be unclocked, and
> +        * the only bits this driver sets in its mask are the per channel
> +        * ones that bam_free_chan() cleared.
> +        */
> +       if (!bdev->controlled_remotely && !bdev->powered_remotely)
> +               writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
>
>         free_irq(bdev->irq, bdev);
>
> --
> 2.56.0.212.g129ede20d9-goog
>
