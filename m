Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794598629;
	b=T6s4a52yer04CLImlvgogmKFzjqD7q3iC0OesqNL8eWjrA7NF78TztYgDp80qu9r3zW3
	 WYsc+lvLUI8gre9+fkNmV/EEwzLPjKR1zTJjnA405cMq9NX9eaurqslB+otV2ks0uc1BR
	 GwocBObPrFXPwzh+qYJxxUuwxgOxC3986JC8zBuU4JojMGJ72l7+ycAs2MurhoHo3Hq6K
	 K/f9Rpqu/XXo68YZPHX6h9EEvnWzHA7MQgjES6K/U8rIfGtXTPtFepT6Hnl9Mng5I5+HN
	 92owzYFaMoQEFixcmkm0Ba7pJz7WQqxy6ZR1w0eCT7c3fesgtxelNkZ/wR6alCR4IqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794598629;
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
	bh=5eVBGiweIu7XkbTy8wPWthg91tixuE6kRgro1NUATUA=;
	b=yRBRCLJe/ngbLFLa94Wpi2U09/JLzX6FvFBvrSHvUFQeTd+MaJRZmgzQjXfWeyKYCxnV
	 biLJSVFvPu9OFEejLasvmcTOwYkXrK7+k1KVOdu42K+nbwKlbuOXXlg4fXufFk+VfYXuM
	 Ju7XrrzphTk7/ONddQE/mJ+TzJRL3/yBcv3svR80Nmpqxk7X+oyqWXOzUFpxdxSxKzB18
	 7M66jAYtd7SYCMPOOke2UbKgax5IJsXAsgptM+hf+Ns0zRj+DjKDsc/ZJp7xK1Ahxupa1
	 Ec1/B+Uc6zLRGPHO+zytiQ2gmGz82YgLXFhnIctY1pWd+Fv1/7BNP6xI2Mc+amj+kfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=j8zVeuM4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.45
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013045.outbound.protection.outlook.com [52.101.83.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3FA606A32D;
	Fri, 13 Nov 2026 19:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A3FA606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=j8zVeuM4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hsxS1UUu3kvImxpv6ATpLqj2zkDmMljatM7FnMjcIgnPjwnlscYkzb5fN7nU62h8Lh6kMgiqO4jXCPLmcB0gH5l7Q+9LptlGXFRv7/q3k1MQIzgHJLsCOSdUGWh8dgdlSirTQDgV3HAc1ggatWMzy6BMYnq88/Eic7x5Go0MOMxubi11/CDBvokHHIH2K359qMzp9zJXZW2xi/IgL2VuF1epMvr7tAsBMcN/Y928o7s8ELji2GZzPaaLBMTeD2XAgoQLyPwYZ1Njy8Su5F4drbuQkpTQAIbnWs3d0NkRVLYyKyPSQ+knXxBhNXaY5oKPQnh66la6pkhKxShmFp0uLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5eVBGiweIu7XkbTy8wPWthg91tixuE6kRgro1NUATUA=;
 b=pPP+sk9vJj5A/rHBsdMV2cAuJswDsVXK1JTtKXTfelTSBwZHGIiNYc1FG/UrJ8FeLjvKxS8oT1jsnasLIy11Dm3XVCm0WOjjBT3ZmA1g4buJgw1OyKsUyHtZqrxm/VEzrTrD1QMIXnUTDDLJCmgFiPnsyxfKN6n1LyVl15EpELRJTeN+8uEhe8TKreIvQfo1ursfj76QUBc5Z0QFrlqX1jbLB4C664QJ2d0stADXLe4sfZhPui2+GllBrL2TdrWfg1yt3j9erfz1m4fQ3IZ4els4L7aRsjpNF3E66b5aWY5eFvs9N53dWMFmRiH2UEcncMkoFGnYF2+xuwrgxD7J0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5eVBGiweIu7XkbTy8wPWthg91tixuE6kRgro1NUATUA=;
 b=j8zVeuM47Iyi7p7aysjzIw0R56EGg+tjuCZVbJep9SQWjyTNLum5HJSM5UpwHAHx/4LaO6Y46TZYKLOybww0XGxirU+H5yXr8oQkCbOKUiMhJezOhlcDbm1Cvtz8cXv8B0fiAAU5fWsRxAkTXxac4I6XQbtWtndWIafpJzBjdcMhNBM2A3I5aZ7bxaU6SU/XT+tQi87WWLYUs+zQwu2eoqDlf85hFMq7cbebLv5ze034vg7qn0HaE0qizdcjlGtIPR8UKGRVrAv1ftPViUpW/K7+P69jGX+yr9f8NYJtkZKdEhpEXRH44kaERLFZOSB60EAb7LY5EZ9ltYxyUwBAqQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB9281.eurprd04.prod.outlook.com (2603:10a6:10:36f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Fri, 13 Nov
 2026 19:37:04 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 19:37:04 +0000
Date: Fri, 13 Nov 2026 14:36:58 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Angelo Dureghello <angelo@sysam.it>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] dmaengine: mcf-edma: unregister DMA device before vchan
 cleanup
Message-ID: <avdm2rtTa4P80ypi@lizhi-Precision-Tower-5810>
References: <20261103-mcf-edma-v1-1-f6acbc569fc1@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103-mcf-edma-v1-1-f6acbc569fc1@nxp.com>
X-ClientProxiedBy: DM6PR03CA0098.namprd03.prod.outlook.com
 (2603:10b6:5:333::31) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB9281:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c7f2e03-dc72-4956-b0bc-08df41bd7ef3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|23010399003|260925021911599003|260925021311599003|260925022911599003|11063799006|261022105027099003|261028144727099003|261102123227099003|261021121427099003|56012099006|261021123027099003|261026140227099003|261009223027099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	h0OuHjQwFiE7Fm5dpCrxa3sH1cGs6hMfMw/bO5357s2DniqqRTkM1NjaGVOPUzhtXmMRhCsJK0+F24vtFuyGEy5Tz/MbkuuxaX5tJwX1vopoQQ8WGDdlJFLMJae61TM0yWsX5qcw5WZWLXrmEqcKd+jxUQGO3sYqL6hHQp8aiDqy4VSc6PyTgXVmghj7UVMBppXrNRPfvZbTLv0bRIB/hMNS20F1BbQaLD1tpKSkYXl9YqvQk4HyqN2nITiwDGHPvaLV2qmpm0CxTmmdXZEx7NeSaL6iSAyTkdroY/mvGwKHUslM5QToENKsB9GVksVJDIG1OHfBAgooSzOBwdwMDSNCE2z6CWjGlG/UWKAEbbImVHZ7slnuoHZJqo0Jm20k8ZRgL1bGs9EmY019yBnFf9cJIcZBZkt3mqIYmVnmBj+enBbVo9ZM0Zc6rOQxp78898nfFtFSpCRn1PXQewCzPAKceV0ONw0Pkb7+q3JkbsEIgFOGfxmz6ks3FVrurKqcgh3fF3O293RPT8KgIzCLrcx1OSo4fN07N8oPqCrC91YpeTlzJdBtHUDRDNxM1ud0WOgdiAYIHN6B17lucqHJ5q3hAZc7iWXEwx3CYUpqvadzo/dVGOsFbqBePwt3P8u7qGnaf1uszuIgrzgLKY3LdDn7FoA6KteWrDgS2vbrc+o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(23010399003)(260925021911599003)(260925021311599003)(260925022911599003)(11063799006)(261022105027099003)(261028144727099003)(261102123227099003)(261021121427099003)(56012099006)(261021123027099003)(261026140227099003)(261009223027099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Zmrb7oqbcQhDPgz+aROe7DqsSNQNLkOCLvpHSnJuSdVxvjbIbOM/0D44TuXU?=
 =?us-ascii?Q?OM8XXxNxKlY/wJE8wuOouNnkhIayyAa8Zs/nn90L9+EpMEH19cYI3JDUYu3A?=
 =?us-ascii?Q?v3XY3YlDmpiHWzUwzHUvzoR+AhrJ15Ho5AOTlAsAbgqn8gbxh9MXhtadrx0Z?=
 =?us-ascii?Q?ZzrA3YwO5KJ7uZhLXaNDN+kHfHX3aA/4hVRz/1zbxxLCPzhHMZFLM893UoMQ?=
 =?us-ascii?Q?5ScyXxRCzwa81kttNZPp5y6dF/yrFfoFCo6Uywzu4F78UVF0Lj4+VFuzyoK1?=
 =?us-ascii?Q?E9V3+U2bKyKeEyvEw2IYXkyL7D0n0oN3wY095RJePgEUv4sf/mRPfi48NDFm?=
 =?us-ascii?Q?g7r4IGtmmHbjpJNsR/wz7TNJ2/8Y8v9QQlMuMSDeIKEUyWLiNbKr2SwI/87z?=
 =?us-ascii?Q?gRaVQ5Yy5mcy4U0BaawVrd5BAVB3rwXFqjyeNG0FGiyj0QfNQAjSKln1n0GP?=
 =?us-ascii?Q?yEZMBjGGXwHuW+Tf0sqc1IowwbXytfhBR8Yf3Kw92WlISeLyCGpLjfq5StkH?=
 =?us-ascii?Q?q+f1nB3o2ClzJejI6cPgUFwcbNym2dCVCXZQ6a/Ugt1l3hEU0FL2piPuL6QJ?=
 =?us-ascii?Q?SeiOupJd4IwxbRYrRP8FOXzGzvD2eorFIA+wHREtxr0yVr4ZQfwykwX2QvYp?=
 =?us-ascii?Q?ZFt8l84RNFleMrI6hnufqIiqM2pRaqrlIhdKQyyOfCxAJZP8OQexqxDUGRRy?=
 =?us-ascii?Q?5BsaSXPheEeR8v5vAZ/TD6zT3m+nuVIeAPozrUc7mXU44vaanIUv8wNjGFy4?=
 =?us-ascii?Q?lY2A3GkL4esSF4gOgiMpDQ+1Cuh8CaiXXVTblDPQDBZlXf3ne/5oMc3TwTHc?=
 =?us-ascii?Q?G1RQ4c9ApG7nbtt+an3KLxFHZtDdWVW4c1fOtMCMZsNWD5y732k1N1Zl5ilc?=
 =?us-ascii?Q?qA84EsJo3S82ihy+s9zBblVvNOgDqIeyXzJmXuHXt7qit4/JqoRn7Yl6dZD7?=
 =?us-ascii?Q?uOEglo8eVgtmLNz6wOHocYo+3bDbr3Nr2piz15eV94EdiSgFbu7ZSsrOw/pK?=
 =?us-ascii?Q?u7ewma7rp+bEQ9/lVQbLcGcsuJ+WW+HQZVL3CU7GmYtiMCS/tBXLw6Xb0qSO?=
 =?us-ascii?Q?pnMRPAQH6hDex+oB/haQDrF5rkBKdOxOv2YlkYXWI2MRaRvxx6VlJ1/jXRRs?=
 =?us-ascii?Q?ffZOfoZBWbq+p/TvCYZeaG5R+yUEM0Rv72xvLpz8uRmaVre6Aji56k6wL3Yr?=
 =?us-ascii?Q?GY/P0MzJ45SITq0yE9w6pZd4pj9R7WkO+Eft0n8cOyyyDFbVr2xARkPplh4T?=
 =?us-ascii?Q?yze6AbmazGKMBynJAyNi8OKD5LbeLNCBW92lp5qjeYXU41mF8ikHCowDUJ/E?=
 =?us-ascii?Q?X1L/Jdd8HZU4zGdT5WYZ0v3V1nR+6g1ddRrM573bV/PHJJl6zHhHG273Wlco?=
 =?us-ascii?Q?wu5TrVZVJbyLbrZl/ZlJA1Ogfe1Kc638lEk0TnSVAIXnkn56RVrVQzGKNPyg?=
 =?us-ascii?Q?H/0HleBw6HDzNYmb1CrIqQezfkqTsjFETpXnwES5wsQVgkTJ5d7YfQqdK5J7?=
 =?us-ascii?Q?FoO8+J3mWWFoKrOw0mXqLKf/Bc+0STn/ob6Duly4DPgqi4lWLN8Vj776ZMjD?=
 =?us-ascii?Q?ax5ui+PErzlx5KMnKo0DINithyZpA8SI3k/wh1W4cjGwhIrOVi245ORvH5qz?=
 =?us-ascii?Q?ovXQNVDit694TidPMISnCdFOWBlKanjdFSCN+inhMEJ8PE8mghgkZlmfcZVh?=
 =?us-ascii?Q?LOy5/HEBLLAy2aKP8qql9l2Oe4QnimA+nUZ5TVdkMgfaQ/3laEGABAigdTMW?=
 =?us-ascii?Q?JtoYl5hoFWmSKRGcoco/8ZQ8Ysdjn+qi+P5iwkg5t4sP5w/OAEYj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c7f2e03-dc72-4956-b0bc-08df41bd7ef3
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 19:37:04.5298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5n/FuSulwNboovNpGsDfVRl48SOlT/J/4D4vvKYJg/UrFi0skKqjXiAtDoHssTFOLWCWzWAIzARAabzfdQk7aiglo7Bj75C5sdJy+cN1Bxjg9W2VoXtSKUnybkV22zAL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9281

On Tue, Nov 03, 2026 at 11:33:24PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> mcf_edma_remove() calls fsl_edma_cleanup_vchan() before
> dma_async_device_unregister().  The cleanup helper removes every
> channel from dma_dev.channels, so dma_async_device_unregister() later
> sees an empty list and never unregisters the channel devices.
>
> This leaves dmaNchanM devices in sysfs, keeps their IOMMU groups alive
> and skips freeing the channel IDs and per-channel state when the
> controller is unbound or the driver is removed.
>
> Unregister the DMA device first, then run the vchan cleanup so the
> channel list is still intact when dma_async_device_unregister()
> iterates it.
>
> Fixes: e7a3ff92eaf19eab14e8149758428e680c61706b ("dmaengine: fsl-edma: add ColdFire mcf5441x edma support")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/mcf-edma-main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/mcf-edma-main.c b/drivers/dma/mcf-edma-main.c
> index 9e1c6400c77b..2efd5f0b4f87 100644
> --- a/drivers/dma/mcf-edma-main.c
> +++ b/drivers/dma/mcf-edma-main.c
> @@ -258,8 +258,8 @@ static void mcf_edma_remove(struct platform_device *pdev)
>  	struct fsl_edma_engine *mcf_edma = platform_get_drvdata(pdev);
>
>  	mcf_edma_irq_free(pdev, mcf_edma);
> -	fsl_edma_cleanup_vchan(&mcf_edma->dma_dev);
>  	dma_async_device_unregister(&mcf_edma->dma_dev);
> +	fsl_edma_cleanup_vchan(&mcf_edma->dma_dev);
>  }
>
>  static struct platform_driver mcf_edma_driver = {
>
> ---
> base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
> change-id: 20261103-mcf-edma-c7a06df69dbd
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>
