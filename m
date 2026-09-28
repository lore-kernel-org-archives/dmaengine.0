Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013024.outbound.protection.outlook.com [40.107.162.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525E84EC665;
	Mon, 28 Sep 2026 16:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790614266; cv=fail; b=QaqP0dahHZo3gm/eMDwtEOmBhH7VLtF2xIkMHRYat1EJL8v7jVKpgz4MJaFb6e32NqeL0FW40D2JrIwJwolWwUGHgWn0RIhUBeJS9noNmBb0+jOZp3XNtBz+bMS/8JrjbDvLia9jhoaqEq65hm/O3CkPve6TVQN2njFimWHjkg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790614266; c=relaxed/simple;
	bh=P7dmBVnIAkyyUofnEH+9QguF6Zg+d2mWvS0BGKE36no=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nYSYAjbPs+sX2lP43sUez/ojJcHFDYRt5a7w+8CBjWUDv/O+ymeUpaPLkxEDcrc6t5ZEXuZPY14RDUQPDoNKURurabdfgz+l2vv4TJL3oyn+9Y4jJvAwCr5urP1DsgHyOXaLVj57O/QcU4sBvPLLR3nzcyBh+UrVSPq2/LD78fQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EgXLCg0K; arc=fail smtp.client-ip=40.107.162.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EgXLCg0K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7RiIunV42GUg05+RpcHkzTcQ6DSfJpnnoRdlWuKkST72zJ6obj+OTgpx8mJ18+IZr0S/Fk3+rA/98j9BTRkB07zSQw0o+ywlihhdfjdzztluGzqmJLTehxzZnSW3Gdy+OB3+X5a7C8Gx59UMXFNrYIntjvlqUa3cj/WqdI2xwBY+wsbxQcVW9nhDQoEA5W/4zAvLIu6pk3sMlcEFGxS/m5mhaYc74at4nUEQw0PuoxWA4rNYnOXul2+hoBxl0jVFIDRXzDxbmyN1sQz470OiwYG+ViSq6lazmImnULtIRp0azTtcXtXKPvIEve7CYgV/WFF/kRSXJ3Qlf4lPoImvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JviNqB35qMFA/PWp3vMu5CRmk1VTCFM/eT2WZ6JzjHE=;
 b=dsqM/wAr8wDGlHa7udRd2tBOMtG49oQgDdy3dyNRhS4vO4tBUs8S7lxbfq5HOLfF/NRixGijFNDGzLrEGhIgUAyDMn1aXBR6hiz/H0D2Yg31zyfThqrDqHSZqh2zeyXViUY9EbDVCpU7GLIz09UiRirphiMJ9dC/UShMtC3pMBQY8+cQAwfVVlJxaXBzVMWGeMON3UtVUsHbMjfN7qqHQTVX4V+SQO00ycbvM9/8yxhXyRH9ZtYtXBRZ+6ZtJDPEkV7kxD8qXaxdQH1Qk6FYoluNeu06qcgoN9qP/ML7LmCxXhqwKAm4iMtwujfzYgVkwX76zwQ9afPTXewLN3Adqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JviNqB35qMFA/PWp3vMu5CRmk1VTCFM/eT2WZ6JzjHE=;
 b=EgXLCg0Kkbfcgn7X64w2Weks7ZsElLLp1lfOITBAe4FgRbDzPfMxxU2mbqERqqffSODMy+19PbXqBKDgRZ0TqmXhAqRE6Rc8KDPZpU1GUL68B6tgLHBDukOQ4BJ/mJq6wCwgc2tQ8o543vP1JafEOuOQyPxwiqVOX46VNRVynxMmv1Q6kSJinzNo0hbBBfzqTXjcYRjNs1DGTx1xRoq2f8AVoa6yxhlWHiLgOxUQZgb7J57ujm7Zn+Mt+5YQQ0l/dCAiPoSbX8/ZinpoLcKxTuDczlHW5OgvW8XuT/C30FtVvFbvoPt7o6WOy8/Dguwj590c+tnYpvR98YRkbYz2Jw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8723.eurprd04.prod.outlook.com (2603:10a6:20b:42a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 16:51:02 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 16:51:01 +0000
Date: Mon, 28 Sep 2026 11:50:52 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v7 10/24] dmaengine: ste_dma40: Fix probe IRQ leak
Message-ID: <arqa7B36P8hUVbLv@SMW015318>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
 <20260927-dma40-fixes-v7-10-89f595e8851d@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927-dma40-fixes-v7-10-89f595e8851d@kernel.org>
X-ClientProxiedBy: PH7P220CA0097.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8723:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f0aaf1e-2cf4-44cb-3c9d-08df1d80ad7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|23010399003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4sOwMrAu5rsaUlCF1dT7KKWzxOoL19h1tNsgpIKPPdrt6v+RzdR8jKoBcGPNNa9q9BcViWzeyAyf6BCa+wLA9oNibUYM0XluaYOzp4he60EoUoMbXIQSC7QgTUnv0RGa2kXKs6LEjvdpD4mBeZwrgWKJVBd1Ibd2tX7xKMMVlm2Om1PbGDP6WW9sIgmUxCH4KPkA9bn3874oNufv/gRo9f15tuBnZtPZUM8Bfls8ZPNsUGaQ8yBbrk30NoXfKAJkUxuT8onHJnoX9j9+w50phkr4MxSgDQnPEMQYFd5DTmLgXkuP3z7AXaaMFkwZLVgHgpHuxfyBsnfMYJ1MkBSInTUPCX+RAZCz5EUTkTXB8YIiCAXL1fI/jmn3Ge+12nBTx4IUIu+vObJuvJX5hIhXWr/QP8dioU17uBSB298NnlQ1Mt1a3FfmpyxDsMQTAJpggEvb6QnbIKVMrHehdFBAuTGYppKula7gG7tMCoRPgEN42PE71xM+RPr9Q1gj63Qxh4skJjuI7+29IuAGrCjZHcLyIvAyxRxqZEN0s6TDtjbkQ9eNzrISSbBTxdxGGnpLLumGcGNaP+KWBGgLiyOYJ7PwYL8h8f0ros30SiXcltjY5gkRpLpG3uK7iVsHWHpI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OlY6zOZ6+22gK3ZtSRmMezztF2E6hjuWjynDkU3n0asC36eztmknfpraud5h?=
 =?us-ascii?Q?1P90Kha7yWwJvH9QCBDEfR3YP74wV9iBAONO/ZIjTHBBrLAPVj0mwD7Fw/U3?=
 =?us-ascii?Q?dxfAVFpZF3HgXjGLmY67emJ0ZNy2uxiZ1eCC47mf9ZbgtlM1/hOoBsQ06fV1?=
 =?us-ascii?Q?4/Hm+A4+x1G6tCw02MNZUHLbUOy+k2o789hbvzqe4e7MkDcV7jt4yCOEC2bW?=
 =?us-ascii?Q?zLHoQ03cQQ+FHC2UrC0akGpIRPIRPy6RS5epez5XOsxHG8I4LRLtnBWaHw65?=
 =?us-ascii?Q?mfjkQqyO0Jp4F+s8kGz3cf2XIi+DKVMmO7PNZ4xOg1ddhALvBzzgdHye4TMF?=
 =?us-ascii?Q?zRtA/BuKPyU3vy9eGhvmm2K4KS96DLUFRpMlCTcPe3SVu3JAN4Rpu4BE6CVn?=
 =?us-ascii?Q?A50N1zUw4yx4WSN0yQ2xVb4iVfXlmGSdlpcsHVmqkGUKZe+ym8rmBmpUWKo/?=
 =?us-ascii?Q?FuhRUHeUudyIDk4geo2GntN1Z6BT5SpsLjF40Mi4Qvg0aBQDt8Qi2+V+sCBH?=
 =?us-ascii?Q?+0FPW8n44EqSh+Dccko8/N9iim8YcfqwZ9v6fDwW77BCh4/dvvWV8Ulv6dCi?=
 =?us-ascii?Q?2wSsGYO0m1Gs+E/6CT46KmWZIOcef0N2/4wFBTyGttO9I8sHzMA+sueo/hnP?=
 =?us-ascii?Q?TsIN83K7pSCm7sSE9EIGWBvSlDi6ktf7haYdR/BnNLgxPzqCmTccGWEPTWMY?=
 =?us-ascii?Q?U5YERk58qmzrmSSPMzZ9B2yEfgCpbEGGT7/Au9kfnB68kTMpE3En8FViZS2U?=
 =?us-ascii?Q?cyQljC48r2DFLuc4vT8XfYxeV1Y5u+aozRgEAkKGta3CTQTNr18VAglZPGxN?=
 =?us-ascii?Q?lYQ8bgGoNoMb/SbApdwdPvsQ9777QI4NCtZajwtS8g1hOH7OdKyIp2zqUiyJ?=
 =?us-ascii?Q?LQQqbZKGQrB8bngtD5af1BOhJE25BHsije5nfS4295WCeooqpzJrflm60PJ9?=
 =?us-ascii?Q?Su3p8iV8X2zDlZTq0U9kYLMF03Nkveuhp0+UvUEPeXZXm/RvW/5iTYsAMZ0d?=
 =?us-ascii?Q?OWJBuVx18/SXnlrtVR0jBvUnzU6HZA94ZTj+EyFPdrOqkBGKsTclchvjEpPD?=
 =?us-ascii?Q?cf70e89HglrLhxyVz4KhsZIWH+oZ/ndbvouhlZ2KSkU54P+lLH4S7CZZ8qn7?=
 =?us-ascii?Q?4avAUAeKXhqWz7TZ3qlTYLRanbd8PL4B4iW9FPO6crk/2NCFtb2MRvJ+ITEe?=
 =?us-ascii?Q?eVViCJtwQK4f1f7Tegh0cAt7K2QsMB4SMv2IZ14+6YrDcaQyu9AMp2WTAtGi?=
 =?us-ascii?Q?nMtmUvAkfdaz/RX51mln+vxHlTZ+nVPC3lYmjjLY4aH8yW+FsRDma4ei6uJE?=
 =?us-ascii?Q?431mKqc3tvlgKLWC0idkC5wDFKbOqdGU7MiHw1EC17GqGi2Q2fXIdinKMdBk?=
 =?us-ascii?Q?HL+eSayGhEuSRiMKa1gZdpqi0c27qXukslPcVDRgbmMac7pBhuv6QgV5l5YI?=
 =?us-ascii?Q?p/ANfQQHjVotj6pKhAJiI+tcQj+Ha17b9OYgESBvX4YgaOTIp2H11nQuDuUi?=
 =?us-ascii?Q?BbK92wKOvKPGLqhD+GCFc0BaKy8cwERZAFCqbvNns7O2Ur+UHkegIw7zbQFh?=
 =?us-ascii?Q?SGMKtu8HYJ66JPVTkZD/BmYrEjgpIWI9AkNcQxcTKREtNafGFnl3cwplVi6a?=
 =?us-ascii?Q?qYYV7j1eAzNayAd895YvePQNNk+b4WQv97HdTrihXCMbQHVSFxX1/2OUEU+y?=
 =?us-ascii?Q?ks4bfH6TDfp2AzLwU5iudgNlkWDgRJFdVITJGpRSGBHQIECUDkFNWz5mfJYc?=
 =?us-ascii?Q?9Jk5a0Q6lccAVftbgP6mo3mveMSrpLKcH7ckNs0BWfTRYjCUL9w/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f0aaf1e-2cf4-44cb-3c9d-08df1d80ad7c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 16:51:01.7292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AwavUc9S7WKtxJ1uqBUy+IX5kbGjfQ1cjuPcASh0nAfUWMMfHpI+VOQ7TgMx1/z9sAn25t+F8YWZdnNVB1c6KY6aPnkYZcD56Oiwab6gzivJu/i1uHKbHs0Rn6hxcFl3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8723

On Sun, Sep 27, 2026 at 11:03:23AM +0200, Linus Walleij wrote:
> d40_probe() registers the hardware interrupt before several later probe
> steps that can fail. Those error paths jump to destroy_cache without
> freeing the IRQ, leaving the handler registered after probe resources have
> been released.
>
> Route failures after a successful IRQ request through a dedicated cleanup
> label. Keep the request before DMAengine registration because that
> registration publishes channels to clients.
>
> Fixes: 8d318a50b3d7 ("DMAENGINE: Support for ST-Ericssons DMA40 block v3")
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.kernel.org/
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ste_dma40.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 3bf89b057ccf..4c545a947264 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -3846,18 +3846,20 @@ static int __init d40_probe(struct platform_device *pdev)
>  	}
>  	ret = d40_dmaengine_init(base, num_reserved_chans);
>  	if (ret)
> -		goto destroy_cache;
> +		goto release_irq;
>
>  	ret = of_dma_controller_register(np, d40_xlate, NULL);
>  	if (ret) {
>  		dev_err(dev,
>  			"could not register of_dma_controller\n");
> -		goto destroy_cache;
> +		goto release_irq;
>  	}
>
>  	dev_info(base->dev, "initialized\n");
>  	return 0;
>
> + release_irq:
> +	free_irq(base->irq, base);
>   destroy_cache:
>  	if (base->lcla_pool.dma_addr)
>  		dma_unmap_single(base->dev, base->lcla_pool.dma_addr,
>
> --
> 2.55.0
>
