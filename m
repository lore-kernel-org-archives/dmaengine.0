Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010035.outbound.protection.outlook.com [52.101.84.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE1F49F13B;
	Thu, 24 Sep 2026 15:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262177; cv=fail; b=rVbQswSfm3O6MstbfTHFMmyKVGUkpnvG/7khgRcD0VfVmG70rEdyqN6IaoP/NzRXV9mIOsKetAIAruTfcin2jwGG2w+FzhGBUQhDmPUvDW/O9eW2/in8NB5tgYv4+v9nQFugUlVooNsxdthCrRlvDfk7z7ftNDJL2MPZAiDqGA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262177; c=relaxed/simple;
	bh=Ev1p7YQEdiVnpFi3B3AYsvZVM0P0XAzTCreNwkcMYp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=D2GqS5xQxL0gmcSD3Z13rpPOL+NmUphZd7smweNjmvsnSJ1iYwyAIyE5bZamtTG/X9izp1dfNiASdMU1DH83Wxn4JXmKqpbr9FQW8mP2uWRj+fQVarmYaqXSk27lQ5ZH4W2Kpe9z5M2EziofjIR1Or+1UZPDelwUDPwmmAmPVAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XHOMsbFC; arc=fail smtp.client-ip=52.101.84.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XHOMsbFC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H7qZN5zVEmr6+OF6NY2vuJbxCW7fjDVGJK4udVfPHz2hdLM6buP3MDUmvV/WOQ4FQVQKpgHSvLVc3px+w5sDieWyO4XR6iphTJJ7Mnqlmh6N/o8mqNAdQdc/Zbjpd17D98N9RBjJdjuVFmLNedHSadZXZjcvlhdah39C5yhBMUJmzNojoYok+dn8zy97rqCvLieI3bBzaVOnXnZYiI3QhijjHwwSgRFc0rEVxgtC7pv1YXCkgmoAffqEeM4UqXp3er8dK7kCNiRblYRjergzbTnzq96F6JMer7UYhqAvbU4a3gg1mSNehRtJp8+YC98QXRgQcUGpd66R2IbBaoO/ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2zNDyK3Pj3yaDnIpGIHM36lQ5ozN/d9ZyzMDkErsJI=;
 b=Oet6MgHrhBcx7g7KIb+75C71vmoX2FfZUpeWWZA2+DSXouMZUJCm35Tl/gXXXOqJpktbfVU1/P/2gC/n7NVjQIRxrn2L7glf5FZregZdZIAd+2s1r7WKJUf6SdEZBrygci272Z9Xar2jRBhj+1oFDj8TJ18xzzvTC6anpaQqCApaeV3ghe4uMY7YujrwOppcLASTZXYytd2LnFNZ1vJuLjl3aj6qXs6wdTMuOUZsNT+IP9IMj3eTrA87svuRfGsVQZVjdDT5t4HHr9QEvdevXCWWlEDhqTSfYVvMYlx53Lu4WRBVgaHnq0o8HuwEN+aQGSHXU6oU18iO64+gRpmKtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2zNDyK3Pj3yaDnIpGIHM36lQ5ozN/d9ZyzMDkErsJI=;
 b=XHOMsbFC+g1G5vouIezOmZynzY1zHQztINOZ5l1nyARKthk6Js72GNLwQr/kwDiNUbBUHVug4FuZgjemvn3dls5kDN/ee7Tv2bZApT2uoHIHNIH4BywcBTBL5drQkgPY5YFim60qoXbTjOOBktgWFpxU0GyacFpufkGwM2DQkkxL7z1uUiTCuByE3vDaBQL+xeK14Qf940ixWQf8Y7A+EtVAH8EEpkeFA0Hq5cyzpmptE4ifmhYiKz5md6XtIZwPRamp7TtXT0rv4LxHtPDAhbqE8U4rpCNuoDOxRVsd0HgRBlLBXSo/QUlh/OXKstcUSfuPp9sIYMPyHCtifNwSsw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM7PR04MB6872.eurprd04.prod.outlook.com (2603:10a6:20b:106::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 15:02:53 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 15:02:53 +0000
Date: Thu, 24 Sep 2026 10:02:45 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v6 10/23] dmaengine: ste_dma40: Fix probe IRQ leak
Message-ID: <arU7lbV0SaK0Nrfv@SMW015318>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
 <20260924-dma40-fixes-v6-10-fdb6755020a2@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-dma40-fixes-v6-10-fdb6755020a2@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0284.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM7PR04MB6872:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f68a79a-ab54-422d-36b1-08df1a4ce82d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|19092799006|1800799024|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Sk3h3mGZuh4guyu/k+ZFXKQpGtj6DNlRP1/xb6W8BPoMctrW9ZZXvJ/D8xaJfra9a2enHdAoLpMIIttkzExAMUh5oICs4uruFiwWEccqiA2xVzgHjPore0xcZ/46rIqtBI4PEkwWZZFyw4H1KeuoKI+0N2X1r+ENHkGFlujJYBrM2coQPVIw19Q5TaskZyNth78Kcs5IhHUwAN/Ft/z3g0F9yC/pYTBz5tbSKQYlE9aSEXI936JATNmSMApZu2fg0N7PrHn5U56tCFpnkCLfgBBvftWwZnae90nNx/E7OxBUMFidKs4b6QHubdOB26897QoLkyQWSNhnRH8+VeBqtL5SXQ4WXxizb5JqRgTIJOy8oGq2a5jX1kHVNwYH51NYZQuOd5nAZxNXpmzCLs5K7nDZhP1mtQraRWJ5RXxptME6aMVk5qV9QRpoTAxTM3vRUTRElsnf9yEtorgm6EWs9PCAw/3i43TVfKouX4/dIvfu9RhBHkc+rPdsx25/wTXHASYGD4MjUaRSUHircL1Bw5Fc9DncZ8WgFQ1d1PvNleADKykLQoDL03wf9f4y2Lv3gBZ1eYUz7xZ8Yq1XdwQXEOzbPU2zrBxy8td3DbsHnY+K8uj/VuxdebGaRTWKym9t
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(19092799006)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P6V0KIEoBjHY0xVLmzOK5VZCYm4mnRkNuqAbGzXyoNt3fNGPQZkHOTAb659z?=
 =?us-ascii?Q?wOF4WLSVIjG+40kD5WRAAIEd/zhINuWiJT4sae0iRs3TVmc0M46eG7UFnEJ/?=
 =?us-ascii?Q?/5zIp3pBsFPnkfRVS/n17fgLV63Bo4/fMbwKyq8ZLak6xln3kI+V33WQYz+3?=
 =?us-ascii?Q?oQP9FEoWEYCbH8NuFff3P05nMkPZ9Vfl31d+jDXNwBCXRNsi1E4Wls0/4pop?=
 =?us-ascii?Q?w+LYR1WizPxmbBK5d1E6qm5vKXOu3RSbhGzM2ONXywtjX8eRDx7Zfkav0OVR?=
 =?us-ascii?Q?0lAWpsJDWDis1iUftmFJIlK/R+Xcdfk9k+LPeSCLQqgXfq6kRsP6PPcfitLd?=
 =?us-ascii?Q?Xv/ygmjBFH40LyKfL7ETS5s/6qZWaj0zF6Dmkt2vCMLwXBrt32Y7va8XOIAg?=
 =?us-ascii?Q?xtkpdOEPWPUghKz5cV7p2h/I4bLt/5jo6l7IJgHzY6sHjRwBJxKWSV78JGu5?=
 =?us-ascii?Q?XbAAaYLw/NxgBVofjnmxmUxc85wDr0TKiVTS3tPEHS1rSfz68NBUCGkPyRMr?=
 =?us-ascii?Q?Y1IFe1/NWTmpsI5KZnBpFaAmhtyC2H+ZiiA4lO2y8sVLrnQvTzWW56UuT1fF?=
 =?us-ascii?Q?ofRXUZIvO8+QUswjz9MlBA8tujW9+mcBiVbiMBu3QgwAzyDQUq2J4sTJDego?=
 =?us-ascii?Q?cFyiwHSECXNjIfaOsLKmG7H/bWMG69pNhKo5YzAqOgTosctiVgGIhPaLUaDZ?=
 =?us-ascii?Q?exh3r0MGTe3ehS8xhhJu26c1ua5Q5u3WWanDaZL25U/fxh7704sJAGJr/B0B?=
 =?us-ascii?Q?dzyIehtCsaK3cyrCR9AZu1Jv5B/VFMQnNTDuFbMwn9RHDm1bafwJHS6umUvL?=
 =?us-ascii?Q?c1ciS0IbpeXFK9NE+IptxEY/TuwKNCkgnvVbATKGzQQWvF3aFMdyiFTAvl5L?=
 =?us-ascii?Q?e1bsuCQXFxpM2fYLTj9NQpUmEzl/xXxsaK/p/9naXWlXZTDhWYLml+qIBcBH?=
 =?us-ascii?Q?3nMJQPjuzil6A+PVfYmgsbH1JORC7FfhZtzy9Cf25iS2N7hazr1ZRKnD2Gsq?=
 =?us-ascii?Q?i2YMnW2tv7YfHfclqBtAe5dks9cAdV7C3IXVIzSH+VHslNgOWyLqARqq7SpX?=
 =?us-ascii?Q?+X61i628IEmSTm8iloYIPK1Afrf+mKcyKpglCSa0sX1O/z49WTMJEZ+m3mvN?=
 =?us-ascii?Q?No9VKYpmFAKSiLokFlaZ5oYdL/UrzXMQbF/byeznCgb+vf3GS3uX/Tj+DrRF?=
 =?us-ascii?Q?i/b4AOS10vX1c4t/2fUbg3u6TN51b0Moct3s2JK+WVEf5NpVee8EQdtRoqKp?=
 =?us-ascii?Q?3/32JaC8vTlgks2yObVQVv0ZNYWE5IXT6bKOtrc4M7p+g/US00GvoMxQE8KR?=
 =?us-ascii?Q?ARl2ZK1dSobWIf1mlvCg/PbfJCIf8cGIFpQyEatZB+Jkk56onIbyYyEW3mF8?=
 =?us-ascii?Q?bDp0Iq7Ip3xNRGiYt9rO+gZqcy1rswgjGa7o2lygE64bJ6OvbG6wv+zIssK+?=
 =?us-ascii?Q?gB1+R81C43zs/LeTeHgOjYrx+L1eKq+GG7kn9vMuNnpD34uqfRvD6EvzigOh?=
 =?us-ascii?Q?UeexGHO2umGb5bZzmdS3xyyOuYKyJpN9gEoJUyb+0/KPIn8T5wGSrmQ4uEPn?=
 =?us-ascii?Q?2sjqdyoH1F9Z9+xUV0FBfU9IETQpxZXJFoCpdevwqN9MUsODhAtvcjbdKcNn?=
 =?us-ascii?Q?hWAqAyN6aY4q78QKyqrS8+4rXoLMkG+Cukbmocun1R2ZKPh4VifCAMT3oZHa?=
 =?us-ascii?Q?Q5DD6guiwp/OQ2xmPAcw8kCg42TI0mQ9twHO5chE2AeKnxKKOuAtNf/WHhSu?=
 =?us-ascii?Q?DUFJJXi6FA2toPfoHHrNDWLRFcEs+kWmfaCNPhNlAdIB+LuOcGDT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f68a79a-ab54-422d-36b1-08df1a4ce82d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 15:02:52.9192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PX5QXSTTmyNH7iuk5KsIERZxkwMOv3G8KRSb6VY/mOk9gRGfirWkuXoGips2mGasIwEQlkbsNcfU3TeeVpJ1Fvc5B9lDClDAETNxtFyWDAVTU+mogaHy8JwrWhznlGt7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6872

On Thu, Sep 24, 2026 at 10:35:22AM +0200, Linus Walleij wrote:
> d40_probe() registers the hardware interrupt before several later probe
> steps that can fail. Those error paths jump to destroy_cache without
> freeing the IRQ, leaving the handler registered after probe resources have
> been released.
>
> Track successful IRQ registration and free the IRQ on later probe failure.
>
> Fixes: 8d318a50b3d7 ("DMAENGINE: Support for ST-Ericssons DMA40 block v3")
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.kernel.org/
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  drivers/dma/ste_dma40.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 85789ee7c0c9..36f4cbd4da36 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -3718,6 +3718,7 @@ static int __init d40_probe(struct platform_device *pdev)
>  	struct resource *res;
>  	struct resource res_lcpa;
>  	int num_reserved_chans;
> +	bool irq_requested = false;
>  	u32 val;
>  	int ret;
>
> @@ -3844,6 +3845,7 @@ static int __init d40_probe(struct platform_device *pdev)
>  		d40_err(dev, "No IRQ defined\n");
>  		goto destroy_cache;
>  	}
> +	irq_requested = true;
>
>  	dma_set_max_seg_size(base->dev, STEDMA40_MAX_SEG_SIZE);
>
> @@ -3880,6 +3882,8 @@ static int __init d40_probe(struct platform_device *pdev)
>  		regulator_disable(base->lcpa_regulator);
>  		regulator_put(base->lcpa_regulator);
>  	}
> +	if (irq_requested)
> +		free_irq(base->irq, base);

suppose irq request should be last steps. use devm_request_irq(), anyways
request_irqs should be last step to avoid suspicious irq.

Frank

>
>   report_failure:
>  	d40_err(dev, "probe failed\n");
>
> --
> 2.55.0
>
