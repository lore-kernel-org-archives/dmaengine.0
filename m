Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011035.outbound.protection.outlook.com [52.101.70.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C1B1E5B9A;
	Wed, 30 Sep 2026 16:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790786904; cv=fail; b=GvmCheDVgzcwadG90yzS1Xh86jZdyc5lRuJbgHm0Vxh+it5oIOs8/7rDSMU1luBRFn/7j5D/4OSt/mtC/su6eumtVMjRfwKq8v0HSde1JBmrL39lQiJidBkVJdSBDrpS6VpJ1i/cVMJuyQH+iW5I8GJkER7uH159QAFkp3wmxpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790786904; c=relaxed/simple;
	bh=Wo2Jx5co+H6GTvVSnooM0Kj2Xe/xwdTmtUCXrSW7g1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VLwfm3e154g0IclBG5L7rIKiaS4jB/hcZzMHOGUeeX461t05IuyfmpJ0XwospAKUcI26My3xU+FbUKUXSW2kculFcSnX94GsXCQNLq52zpojAWJQ/5zPzD7thpOWo6N/psWwj4pUYJf9uambI7OB20831Hmafr45VUCSH7bpECU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cyXm71LS; arc=fail smtp.client-ip=52.101.70.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cyXm71LS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=thyT8Gbr0U5RhPoqgjKWzZdEyz2tpbKW0kf5RLJh0oWvPYcO1BUhVzXfbGPuW0AncbHZ6Z/mTn+jA0EJLsYHy5UmzQzoCKDgbinJ1xp+VxefKS2GaWusF4DQU8d68lL6ZluwYqnEDMip9TZ9pQ9x0gAQoK2HlGfnkXDe3nOEiE0AeqWHjbqqW2RTddHDKYlR9ImSqOn2BNlXsDhELGovRphtTfPWKvuLNlOfGPLZGn+J8N339tpixt9sJJldk2oa/RCc+WGt2zjixRQmt3u8fKAyAEpT98XUuBz9xEwQunr/RtTbCeeh9xnrAdHQrWxqUYzKFGEgZI+3qTYNQ4EH1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxgTMInDvhayzkCK/ubo820mWefqKYhuLFX71VbW7Yw=;
 b=xpP/6cdCBC4/NZ8c+caa1jmAp3bogTUgFKNV2KnwoMXX6uPPQyFaBVFGdyqsgUlWaQGJRKO8K0w2kZb8t9KhHMY0NdkXE/unxUewK0lrm7hk5LusBKfNNXtmKco45dmhHK6/nWXfzc6+1gyqb9Twc06EAc6iAUCuOL3mgFrLwUvyBndOqerQW3eKbj3V8Dbz+FYpQ2h5qHVPlaNmGZgtQzMjlu2yHf3AfMm94HsDelDC/Daj9kC+KQyJvo1fhLYKVvH80EgJJNufjldwz3ihMRmVZEuqAZDIQKczYBvJSsTkcSz6v5xoYJ2XuNHglUsOiORptX9227UuqeSusnAhHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxgTMInDvhayzkCK/ubo820mWefqKYhuLFX71VbW7Yw=;
 b=cyXm71LSGc86fIPIEhAOlJ8C2MZ6a7uvIRujEZrCANMOvyosoBdadpmCvjGDyoERIl/daWq4AYanXndMG5o3emlt1H0JayLairObsqEG5L6C8DOFuoBzroWeqldWPaBdCjb2G0CE9VAcaPPGxC2rmT+14uGaNIoEil1SNcsaP+u376q+1AIpLaPDaKk12TEjQCoSpb1pFG0BIKKct/2eDy5RlofbBk60yU1inJ6A8eOABBckUgZwiGpOXUUjIqWExP3Nq5K5VvYTwoqqcTBfF6vcMsg+w4owXBws2oGEyKOAMLWv3VR4GYHznae7T5VY8rBq0NIyQc4G/wYP+PfiDw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB10885.eurprd04.prod.outlook.com (2603:10a6:10:587::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 16:48:18 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 16:48:18 +0000
Date: Wed, 30 Sep 2026 11:48:09 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Andy Gross <agross@codeaurora.org>, linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: Re: [PATCH RESEND] dmaengine: qcom: bam_dma: Defer IRQ trigger type
 to device tree
Message-ID: <ar09SfoQDLDckrv-@SMW015318>
References: <20260717-qcom-bam-dma-irq-trigger-v1-1-6405eac86f00@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-qcom-bam-dma-irq-trigger-v1-1-6405eac86f00@oss.qualcomm.com>
X-ClientProxiedBy: CY5PR22CA0088.namprd22.prod.outlook.com
 (2603:10b6:930:65::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB10885:EE_
X-MS-Office365-Filtering-Correlation-Id: 15511033-7182-4527-a767-08df1f12a122
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|366016|376014|260925021311599003|260925021911599003|260925022911599003|10067099003|56012099006|6133799003|3023799007|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fW/brhD/h8pkR2cVA2i9zkyy+wXP1bswSQAtFCfUnEZQeMYR2NFVes4ih2CTHFfuXbprGW8397lkLDArxzwI9gyB5XgmtxnMvTN8ClZr8SgeSZWlfISiDNPtN3dNCy54IGNHNAkuvgwDsRkqFALno4bLG+rFxoao3kA8pNeycVqRf3YBufZ6AsOvQKztRs3yVspZvm7/Pu5AmGJxLgshCuq59Gwl3pHfwB3fVmbguRAVlkUYrbUN6lZW5G1MIaMB0/wEbNtLzzwN7SpVyxdV+WJPbfbA2H7H7umT2X9f4ro1Wy5zNlnC2dkig5Dh3UlO81zk8HYGlQNWVWEZ8DnchUROMPTezVrkYtD8dnwzDVrbBAeGYzP4h8p6a9fCD6qVZcIS1REr723E2W7JKfXxC4VuWe51OQbBJLFvotZ3OaXcuxXRAj5VymWTHapdJW7ebK4iulv6irlt829jE+wLFbkqw0dG3CK1IRqpcbU2TxkXpa2VQEWtNUFrSlm8jwyQOfba2C4SzWPDJB5o4chTu9g247ldXmapshQbwKTOPH1TPko4aUqf/+QomYWhFnLsYrUy+S1VzcLQuxhM3y+geKpmTNouSSsF3auYV1jnhD6jzqonyNrRy74wWN9qzvy7D0IAEP4LmMJqJQ7/xoqTQlF4YJmAvT5fNjxM8nP9A3A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(366016)(376014)(260925021311599003)(260925021911599003)(260925022911599003)(10067099003)(56012099006)(6133799003)(3023799007)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HCNiraI6h3MEQVaAWGOQ/HFRw43yT/vR5nHGrHSHfjDqlhqI6QGYwlykmngr?=
 =?us-ascii?Q?IkJMJ9zJUO5cwzqMfcwUSq+7KPPi3CPf5IWbMARQ5rASwTdM9A2akSkYbKua?=
 =?us-ascii?Q?CsEaJxPwX4yZPVihPREJsBgjd/+v4re1k/bHhOGItKEKEIotDfE5OH3ja9Es?=
 =?us-ascii?Q?QFmhCrcccS7OC5hIwhCOP4t0ot3qO+5jRF7N1n5VDv/BDk8IrEE3z9OLKskj?=
 =?us-ascii?Q?H5ujjvd9IaGsnG0yX9ZkcIBXhS+48ZIfKcSh4YHrzo4cEL0eBmVcuBbeBRUw?=
 =?us-ascii?Q?ZayF5H/KCyWOhF0GAp+zsHrfk87GayNUJKriGNaxgB6p5U4DMxokw+hUJ2vK?=
 =?us-ascii?Q?VEtzSGx1KrT5bmxhmx9ebDWO3tkSWxW1ytftSg4lF/QSr+cjhxyJpfsWJJC9?=
 =?us-ascii?Q?+r5YUhvagtIunQ7pSDOSwWYentAqh2sV3VPU5KDh+uN6qldyyJQRQLTLs9LG?=
 =?us-ascii?Q?jkj3mQa3p6nQQiNN1UQ7yms5IraQdtQpWM5pt5j4jSy8iGATA1iK67eVY9fw?=
 =?us-ascii?Q?klsZOHr0zN4qGvhsRaa021jSDHIfQH8Vr8WWrKGc2RaWiHp8jLJG/0QURF5k?=
 =?us-ascii?Q?dU4oDR3J6okRZW/m3AO3Okxlc1QQq1uB6vb1gxU1ehViMT9rWJIt4W2yXMA3?=
 =?us-ascii?Q?XyfDoPhub0Hts+SJXkfKoR2c4pIn6TMtWAZ1eOcoDXywo3OnpVa4j7aBn76e?=
 =?us-ascii?Q?uJfXlI1yiqfpnxSybItEu7yVi/GZOIFNqqx3W+pyETJHXxVXhKwEFR4xGxFq?=
 =?us-ascii?Q?eVHLCDRivS/x2Kzr3y1FSY0398z9sjksRaunrWasZhVKBbBrOGysoUJxfsFa?=
 =?us-ascii?Q?SPv3RYjdBCmVw/+0kL5ccqNisJaX0WkImyi+s+MujyuFyVpZA+nSrDPh7qXJ?=
 =?us-ascii?Q?NAWHQcNUMGRM2cHsabydCMTmFLtPDk56YKqEcWVew8BA9mTPc7yl0QD5iEzb?=
 =?us-ascii?Q?KT9JFlsZWokhrAylSgarPPnoqf/LDZxNC5PwLsYlstzK49HybQTp5J8O/wPs?=
 =?us-ascii?Q?WbhcYWv5kXkpjF2lrAOr8Rx9OVp5xrn0ifm6iVTCdPATDIPFEAWKTJKH7atj?=
 =?us-ascii?Q?u9sgsl7NW2eeL1Kp0xD7FgIeyRrMuVYD28lWmo0uBBhozJTTOUwqKZP+Bhy5?=
 =?us-ascii?Q?ehzMc/Iq5Qel8Ktuopa4CPchIL+riYwt1OuJv6eST6vBcido2qIy77yEWEUW?=
 =?us-ascii?Q?rCAX8h+FBliw6vxkcrUoghvjYguOXzxzVOZX1B6f7aD0Vwe6WPXSobhKjYrr?=
 =?us-ascii?Q?WCsYE40vceA4eVPjaWWDpXFkM8YFw1MQEO7muxkNqkNCc9ViYyk80p+gyE/H?=
 =?us-ascii?Q?f1NFI/wdsiV/I1Vw+TRmJpNnUVxLV6VDpvggehkGZV94F+DsXPcjN2Pu6kMF?=
 =?us-ascii?Q?kW03ua0tqjWn27i52Acd2tDzlYZA8zbpp3lMQYY8Ite/SSEuNFxIzwh62omU?=
 =?us-ascii?Q?s55hbx5pf4l8Npsxr0V4oHCncLjT7BA0gW1bBZDJTiuI1mxz5zVEa7UriuIT?=
 =?us-ascii?Q?02O1I7weVuVE3tfxCEoKiCsuiChmk4sBKB0HMsd0yWeo7cD3mYOi0AFmUz2x?=
 =?us-ascii?Q?76Dlu2p40W/w7lBNkcO+brPo7F4hPfjGCv6Uz1a2H+mrwMO4FH6EoLZosDUe?=
 =?us-ascii?Q?wMbvmUB6qAClmDe+n0/bJxJ1JGcWMmOyf6dBTbgHaIWojt1Hk/b+ufrwoEzx?=
 =?us-ascii?Q?UOGdSdRRWYxFxYJL6lVAwnPehGiQHCN8KI/Kpg+LapL/UoEgOnHNSw5vHOE2?=
 =?us-ascii?Q?qxvGEAR3rYg58J4TfofFeepGoxAYKc4kSXq3ARFsxrtdySMcU471?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15511033-7182-4527-a767-08df1f12a122
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:48:18.6489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1EuJ9LkYw4qALQskqxp8i7iKSLS9PEsj6lPnOqDnjanbLPmXMjFt0fB0VQSBW0rK/xq2v8pTYKasuvACDbPXAEjLaiNvgwwPbsWydhyJcXl4kIOQSVdkGwnrUyWk3L0h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10885

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
>
> Fixes: e7c0fe2a5c84 ("dmaengine: add Qualcomm BAM dma driver")
> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

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
