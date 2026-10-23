Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792784292;
	b=0jLLUusTuD4gzaAhDIRIMqCMIZfe9OJw3hHLYhMVLkgiOkIQQh8tf7uKO3grLRxHQWNC
	 HwIsRVhvS6wMam7Y6J7b04x3rY7Tecg6a33B5O3R2m/Ymcm/8OcOoMP6zbs2rhZyAlmvF
	 GGkAMY/oE9mSJhCsRtN0fdTgBlbi0KjNq0G1pfk+Ai6wFH3cEJWS/fxYkvYFBVkaOlxEZ
	 j6KlICa4LAQ1qchZFE7wj2S/17Synq/ku04/IL6oUi4MIRGB+S1Kqa5HSSzYbDbIbtvup
	 oDcPsT7Q+0G0JfnBJih9+eDfGSGYxNvwKxKc7y6fH03OU2z9mgqk4MK8NLe5Pd5F42Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792784292;
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
	bh=q5aOef4AIJ6NC76DKf+Q/vMSaVUAyMGbuC0/6TCZ2uI=;
	b=ioqqrGGgxi8o5u4zcdauDnnAeQOrces9O5xIOW25chS91tuEQh43HcqqRxCfKruvJBCt
	 Jgxzn9qCkNJ+HNiEfk6GlEaAT/GWLg8HtVy/mPPqxeN8RNKY4T8hZQoFhNkoxJtvHBYzO
	 qFEj7sXc9NAnjdKyZQtaKgyuU7Ow4+01onGhkVvMzA1EwKWS3qM/ITq+HC4GDHEHxxIjG
	 mqjHs2gJ7xg44ng6vPkerYImbli1HpmFuZSyukxglSZVNZhOiht/khD83wOzHoPtuHo99
	 ZHiUIF7AM07EEFIBdqpG2ThsJfiOb/y8OyrSg4OzQhgj18ZHv8RLYbkCHNd1S3DBpnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Brvb2mE2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.33
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011033.outbound.protection.outlook.com [40.107.130.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E814606A31D;
	Fri, 23 Oct 2026 19:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E814606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Brvb2mE2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0WntiXbfIL28qQ6n9Nu7iWIfWFpu6PwYQ5qLqT2ZkdZ1VgVHmSJ3d410X4y5zYTiQ5esx7HonwC8B3orbNGMSNkSn050p2/CwLbBPMvqUoMlsH0SQealbb7XWpk2A/aVskM61Vh0TARZ7RZ2fNhCAvnxsPhs89Hx/OnpWnQ2h8wgByJ+fbwCOi7zepw5OmCvB3U9R9272LUtCwuyXDZKQ9RPT5MXzMyPJeYPyIkBubK3m3tGYRQPi5wTT7WY0ezvKhwaLyHqQl98rk/mqCVnpCJdEO3f/pttUfqX6mIoQyToNlGpr1nIc/HujmiETDZiA8jrsUmruu4jFQLBQhDNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5aOef4AIJ6NC76DKf+Q/vMSaVUAyMGbuC0/6TCZ2uI=;
 b=yrumYYpPz1IE12i+A1zbLT2AkQf9bUwEPniTsbl9VxWLj+pEl3+o6nsNv8x18/w5J7AhllhqhYEw/AQ0l3eswuyT7cwYhjJcafSwvuSLszDmMvAILLRL2YcnrTX98qlb5r1R9VaKGf7jskwsXZt9baXaHAJwbiqLMmhZzonEXdbUkw1N1AcZUvbnEhSAc1WJSVw03FMXnwcTY6rVQ5p4pYVM6C+Z+dcnlGvL06pXXJU8gmAJVITqD0VZxHb/O6Lz/v2dKksLlYRutGBlBCz7QlHXOiaxXRWNJjKasKgUFMA36WXihmJJagozhQPk3yiERrMOQrlNGR9ZurDHQyvBsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5aOef4AIJ6NC76DKf+Q/vMSaVUAyMGbuC0/6TCZ2uI=;
 b=Brvb2mE2WTED7i3RU+Z0rz4Jot0Lxcl9zsdwQIV0v0hfPA5xeBniTr7E2NJJbqacxWnoX7nQBBGL2wAI7Oboi7r+qbNj3Vvx8QAftDN97Y9MpTIW1+PzHaaINt6rkSRebvSS+WUfCxMCKtm/CFGRlM5SL5B+q4nKqxBhFZsUfwl6z+mAfKClGLn/vPqyUFZLwZpUPIlS70qOU/uReslz2zIs/R3axSOoekDDddYw3vp1q/+kUlybd1QDeQzyLNo7fR79WdDCVaBrtaG01gZnXUBq1jTzKCuNcNDxcfbVAuIXAOsMJm9XGl4SuZCpN1iHeSd4zhLCUn5D1dytGLXN4w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS1PR04MB9238.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 19:38:08 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 19:38:08 +0000
Date: Fri, 23 Oct 2026 14:38:00 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, vkoul@kernel.org,
	Frank.Li@kernel.org, bartosz.golaszewski@oss.qualcomm.com
Subject: Re: [PATCH v2 1/2] dmaengine: qcom: bam_dma: Take a PM ref at
 remove()
Message-ID: <atu3mEp6akaVPSya@SMW015318>
References: <20261023101536.3965344-1-smostafa@google.com>
 <20261023101536.3965344-2-smostafa@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023101536.3965344-2-smostafa@google.com>
X-ClientProxiedBy: DS7PR06CA0038.namprd06.prod.outlook.com
 (2603:10b6:8:54::19) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS1PR04MB9238:EE_
X-MS-Office365-Filtering-Correlation-Id: 818b9d99-e278-45b1-83c2-08df313d2a39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|19092799006|366016|56012099006|4143699003|11063799006|261009223027099003|261021121427099003|10067099003|22082099003|18002099003|261021123027099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	8BjrngkhbZHwBr71OG4sj8vftKL53jXS3WmGnUgFp/dkC2ViS5Vjz4IfUYnTunf+rVwptMhe1wjcwCJEJAodY6PjQ0ObJK8jDJ8C2GW9TRf4/HrblquWpe93TcmdBIP078y242EyxgVBlyhw46GVmzN+nXk1b2XnkylEnTv0dChT4F7ISPEfnX0XDzLbLJINUQ+5vjgvTzMr126JkF4wkBfMj5McCOtaw2Oc1P5TVEr2RO612QYZ9oKpX1jRPgixrUbw0CjyyX2oFXK7wTpLZgeNDZGxeA4NyPGZKLEQWfF91QBIC3wYPDZG8+bejO2Q8ZJZbn4Trueb3L3QBw4B8pOj0rTDlBzunkuL4k5jM/aXszSAabWfBTZ8GE5iZcVNxQAS+9YtOIl1aeFeSfyNZBhngOVKKDZDaxYrQVqOt8qPVd9pVJDJmY9GzEB2/t1wJ7xdSQLGABn0WTaRVC8EDZex/92HlK0h29XeJcnLg/IlJbiV5+c72kDu0WQ1G2EN3/ZIt1XDvh6mUO2sIbZXJUI5tVh/9Cxbuu65dR8vA02B9D/I7oIQ3SG0jozeXpLquaXMtLFE7HL1SMtfn0xN10q12wl7PzJjC2+zE0xm7r5SWRhNgRHlgIVf9tXTUrDDCqBfGGL4hgKfcMB5xAPBdwhHbT5tHRkqcbk4KPEmceU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(19092799006)(366016)(56012099006)(4143699003)(11063799006)(261009223027099003)(261021121427099003)(10067099003)(22082099003)(18002099003)(261021123027099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dNoS/MQaYM3/3XQserwp//irFOwtyfDxfH+/kDsN1+Y9mIdP7TqoB4HXurTZ?=
 =?us-ascii?Q?mzbXJZ5KuPEHeCvi1QgJfEYH6tpLsApacr6jdM7LLJlc+ldwKQ+0pu85OpDJ?=
 =?us-ascii?Q?GskMEVafMHW1urWMvnS7rEmVeSl23xt/2SygT+JVppawT5WJKrHd8QRIuei5?=
 =?us-ascii?Q?EY9UzUHpx+dJGGC5nt7yIFViemttmvXDU0uPWdzMbfOi40x6iVNFHhtnZ9rX?=
 =?us-ascii?Q?r/kPaFdsoWyUnahWnL279i2NsRjvhchaI6QkCwoD4kJgDfqsALggb10lFTXB?=
 =?us-ascii?Q?BBOuCrAfJiUzMoPhYBI8wUBba+xrg1F1rsvzbhpUrXFSo8oOG5bf28fZ54Bl?=
 =?us-ascii?Q?ccalixCg6WZ4feD5wfBw8Q94qqUEjkuciFXR3jBYehVU1Ss6bO5ipc8ulb1c?=
 =?us-ascii?Q?kuinAFsfWBu4Hl8pAVycHmzllLTj+yP0B1vetKdPYFJktkNLx5JdLoXhfwwP?=
 =?us-ascii?Q?MC9Nr6n/ZmRBA8YBk6gPoRqy893Gc1lkww/NjS/JGMD2uHkU7cZtHs1jOZwg?=
 =?us-ascii?Q?TJpmks1he3Ud+cqT5GAwFA1kwbAR8uc0vPNcMWXxvebiI8Kq6I+R9fQ6lLiE?=
 =?us-ascii?Q?TO4UQXt87NV+zgH7CPUf4hxOfTR7PD+/55em7JW9LGrJYnbPxTh1wu/yYlDd?=
 =?us-ascii?Q?kBW9YsbPaKcdQwp9PTAtY0BrEtKzJETmpdNuzABdGMNAcgfX0bZjdiuGo9Og?=
 =?us-ascii?Q?/tZYoVtv+fG6jEYBIsNWpRKktc5uHkxAUiwQqxdyPZPu7fo9qnXZQ6MTpWzk?=
 =?us-ascii?Q?f/3UsPxHV35BIkxXjCQsVKt9UkpzWYEJ5s6vDQcuAsi5WzyZEG4cA99pjHj6?=
 =?us-ascii?Q?2+DjLyDrb84I4xRAE2SnBeeTcN+Rq53w/2IbOub6oUm0MOZl9YHVIEj459G0?=
 =?us-ascii?Q?kBQ/PUb7YCZgqtZctORR9tyAdBy8RpZhzVJ8WzUbv7/AL6Djb23LtcYEVhl6?=
 =?us-ascii?Q?dW6zSMkRY7IYe6A3AvftGgVnHhpneBWZ+a8Kw5jMdfrJTv2jyAied+uo2QS0?=
 =?us-ascii?Q?W90DQsJjmvtJWWX8Ld5H8ZaEhzqAlsR1sy6QIGPdhSQMb7VBrxmQ1Kxxm+V8?=
 =?us-ascii?Q?kxCiaiHPzA5ix2fw5NbxhpZ1wq3tXPkCieLKYjmHWbaWEVQH8DGWxMuzlXUC?=
 =?us-ascii?Q?AOrC6g7Kv81v+tp+mbIkigUXmxiXNWb3Rx2lxh98s/BDr3WujHOkEYN0Dp/R?=
 =?us-ascii?Q?pN1AfYQEPVM/B3B1U9mbdN+5pA+FoTmatC0N8GqovnclSe3CUA4b+OvqSyfH?=
 =?us-ascii?Q?lGpEgtt/k4suh6eWrAk0Lvad5Hd44/DVtefFnl9zWqeSurj9l4yHnXmtgGIq?=
 =?us-ascii?Q?HWkc0FlSRT3YHOywcgCKJ4ycQl6MmERb8qVFEwnsHykbTQqWSXtn5PO2DTFy?=
 =?us-ascii?Q?dsauS1H53ZW7nfs6qMu7MwnCPO1v4/d7tq3A52eF3g1mJeL7SQPNIFcTVn90?=
 =?us-ascii?Q?hgzNqjC9ypurmNb8zFXUNYSY8+pdY6Ar4uUB7rpi7qL6P7+TzyFOeTJXMqCf?=
 =?us-ascii?Q?t84w3Fk0NaDi9aWBwPqy+SyCG8rLytx+tCWNEuY7Pocqt9cTwefRRCjKj0DL?=
 =?us-ascii?Q?JFRKsVktxjJF5y4XWVforCVHDPqvNSr8jOXPSRl6nWxlNChsXc/LpRpeD/zZ?=
 =?us-ascii?Q?ka/b4qVgjOnApTW9PeJyAS8DmWH6fSpjXG4XocO7r1rGwD8579R0bMgWO2gz?=
 =?us-ascii?Q?C4+a6Fhijlpapio08DyMdtpEyca8gQrJDogz0zRTOcxSfchoXcip/2E8mJ5y?=
 =?us-ascii?Q?taxnSASpOMovTGbWrfQ5obi493DiuiHziSATgvm1hoLJAVjREGUz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 818b9d99-e278-45b1-83c2-08df313d2a39
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 19:38:08.3333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +yeNq7lQwgwzoOnHgGV7p4pBuuyQTzo9KzZXSl7drPQr9LiGG3XfhpkToTJV+Jt47en++LflqudIKjHqsLspHWRJXQVCdDe2jgR+llt5IGNiIRPDfMsWuoAkQG4OqpF2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9238

On Fri, Oct 23, 2026 at 10:15:35AM +0000, Mostafa Saleh wrote:
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

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/dma/qcom/bam_dma.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index f67a93a37d48..8a1f4e5d24d1 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -1403,12 +1403,10 @@ static void bam_dma_remove(struct platform_device *pdev)
>  	struct bam_device *bdev = platform_get_drvdata(pdev);
>  	u32 i;
>
> -	pm_runtime_dont_use_autosuspend(&pdev->dev);
> -	pm_runtime_force_suspend(&pdev->dev);
> -
>  	of_dma_controller_free(pdev->dev.of_node);
>  	dma_async_device_unregister(&bdev->common);
>
> +	pm_runtime_get_sync(&pdev->dev);
>  	/* mask all interrupts for this execution environment */
>  	writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
>
> @@ -1428,6 +1426,8 @@ static void bam_dma_remove(struct platform_device *pdev)
>
>  	tasklet_kill(&bdev->task);
>
> +	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_put_noidle(&pdev->dev);
>  	clk_disable_unprepare(bdev->bamclk);
>  }
>
> --
> 2.56.0.307.g5fe7bd680c-goog
>
