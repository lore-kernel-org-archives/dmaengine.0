Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013024.outbound.protection.outlook.com [52.101.83.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE924A9D7B;
	Wed,  2 Sep 2026 15:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363593; cv=fail; b=H0cQO5hSkTErsNc7rmL2m2/KFvkr0rsfYooQSy3v77LwfK9YR0Piy77iWDvhpU+xtkHZydzP/hXJcorLHEcJUU8OpsvAYltqjiu3w9h+yJ509OUzXoFdYv64mZia2GbvVTg3VbiIgZA6meA0PR5s1D0Xe3cHEoVjTyz0nu2W62I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363593; c=relaxed/simple;
	bh=nAt/1AOiNJaMnzx9b5t9m82c1t1HnGuDGUen3j3AyGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XgLw/hOkzMNn7aqBA3rGCKRA96++iMdj6LMRCY8GS81H9xXYmzffgi4UlNIBRrrMZfgLDcXFe1lIboTeMQ0Ayf+ZqKA45vERFP/A4MNTJLm3Xbsh9r15pay95X/CAv6u3LrDwCZOWEEB0bX5sHfPNly+hiN1QpdRL7FSSdJwL/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gO/akj3S; arc=fail smtp.client-ip=52.101.83.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gO/akj3S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qonjqzBLQygb2Rc/zWsE8QCxsJQHHgySdEbjZ5gxJHmMnQmrkadvo7pIqASdpPvw9Dj+8PypmEmeRD64WpG2d0pzRsVsqBnOXN4XjjA+YoTZB5j/dlkDy6lkg+5qC6tDaZXT1s3D1jJ+TyR7QPzT6L4jj+LPWR1UMWXkiSI1QZ3d9PFR+7FZfdXrXV3p3Hhn7yxm9q0Eo4SMTK6KQIFJU9D8AFcnqssSbj4RfiDkPvUYKtTd+fXSskMRRsKx5dGoCjz+/YbNkjzUNZV87IGWnsVCDSXSc9NMz3soj+JGHG4364yqJ9ORzYJ09Jlv8IxQ7+PxOW3Gpwsr6cSTXffJKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isJAxm4pAM+MN4u01HPNUs+caxqNh5FAKGsgPyuu3KI=;
 b=LIbjDzSKwjClaSFi1M8S2ju9h0xYa6YeoDatAVdbCoWchhmkyS2Weblboq5pmvT4sQ/u/hp7wQZnLikVcsbsewzyHRyhzTymwUvjfSPweYTKiU+0FtvaO0SifIbG2OnwOnYKSQbHZzopWwuuft2JUTiAnF/prwE5CIS31JxWrCk0WbQoXZ3AbK+7Ou9hwUBuJvs3F4ovbNcxu7M7laGfSPkFSjyQ58oPkLE4Tu9QgSQv6WXj1OnvFFhVStNPklK483+clUHJmiGriXVIlKSG+v2mX62s1cMNMiX8+kIbRRy3gCcWOckNj+zwM2oPEoLW8Lp4xhNTVmIcWVJ/+iY+CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=isJAxm4pAM+MN4u01HPNUs+caxqNh5FAKGsgPyuu3KI=;
 b=gO/akj3S2tfMq1oWH/v7FvQY6d0TRYuDIV6YJP9BkTO81nVnIEPoEWSuJo62sE+e+UNq0Hzd7jDT8sz2ZRdherAxrYRQtXNpvyVaTj7VsKeyqMDO4JmsD6hsj6xoQWwZ5SaI7/cJuF7iW/Bv6VmeqHgevocLcjkhPvmW9v2RbLrl/Lnbf/pU+rd1hZoxLEYkvdSpYTFHoS2XgOyZ+ybjQWRnVFDi8HGxqLnmFcA3oLI+w4IvAtwURVY++utE5JUJSjv+V22aO1G1Iji79fYs7YXNaa3lNS4sU9Vbt0z6oeBeaEYdJDc+wS9FOxJvhxSIujZ/xmiD/EREaVBT/B7+pQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB9474.eurprd04.prod.outlook.com (2603:10a6:10:368::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 15:39:46 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 15:39:46 +0000
Date: Wed, 2 Sep 2026 11:39:38 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 28/34] dmaengine: sf-pdma: route error callbacks
 through channel BH
Message-ID: <aphDOns0k3TWXWEZ@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <8538eed11abe0c92b1a5b2830baf7a3f06ac698c.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8538eed11abe0c92b1a5b2830baf7a3f06ac698c.1786384169.git.allen.lkml@gmail.com>
X-ClientProxiedBy: CY8PR11CA0034.namprd11.prod.outlook.com
 (2603:10b6:930:4a::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB9474:EE_
X-MS-Office365-Filtering-Correlation-Id: e53d2f54-bc6f-4081-050d-08df09086a83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|7416014|23010399003|1800799024|4143699003|11063799006|5023799004|10067099003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GunaXcEg4Q/GxHkV++lde8sbsR0AFTdkfiSwIpYpco7Q6pZN5tm0cygwKu1k8Axfr9qK7f10KlpQO20IaQhPLrUK7BVTUvdlMCxRk2guLk/AgiuoSfRqUjFZzGN0OdL+M6Zh2BANCyRTlvppR7unCpU2fLZe6GmORrUR1C9e9UOluCaHY2xzBB9VAfbU9uhjEHKATOxrQiI4odveLBsoC4Ds3wSNU5/h7Cts08h8VXqr/hdsKdJiF73rSn1igmnV7YSnF1xrB7z3o1dX8/2gJ0S+8soRqr8Q5lFCn1J3YQPjxlbfF994aS/SkHC1lNxtl2D+ywcgnrlDIUOS/lb4OqSARDgjrPCzKSL5IjR7BvUWBrcdkIJxQJEwXQ4C6l4XvIkoocYZmEnxx29VmwXTr/Me0O1voIKmIrjRMtqiMIcIhg1Bx/38pM2I0yKlEmqEsaE3aJ1pSvEBdWUHYJiGN1EYxArrOEQxZAoeNACPm7la5wZKEtoDkAir3bGO+wKFPdfISsvbQKwA2NDAqZ3CLIv66bjxMcByHHr/+aN80phCbB21TSW72shlBhZGZf17e8GqoiuqQchqIcYTx7deJA2JbYWkMYSh9T1xrKgX3DTk9ZVVCWYSzofn00TqAdv8tWCoRKnSKTLmFthFT8mx4N5Nrxvlz0zJ0g0XCwx8ew4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(23010399003)(1800799024)(4143699003)(11063799006)(5023799004)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f9YsHHwaMrFxERzDL27KMGTi9yU3wskS++1HzeEOo9IzKzptPb4CB7JH5SdG?=
 =?us-ascii?Q?3zSxuMmuhzfTFgUaMuNh5juF//F2eMcC8DBpreQcBY1i1h/PkAYBGX4U6BKL?=
 =?us-ascii?Q?x+WKQFNzh52Gfp6FbUqlbb5PKdwrFOXJBsc9+0+dHis9kJ8dSkghImPKhoeu?=
 =?us-ascii?Q?r143gnmZI5VTV4Tyy5+GdGeoIo1JAto61d9NMO411znDnDHrY6eKa2orLAK0?=
 =?us-ascii?Q?PMJwOeuANhJz3r5vKLkl4w4ZENDPbnTULSXnQaiPM4s8FC/2y66W3nO1bWIX?=
 =?us-ascii?Q?qGBNBWKJN1NiRqlR9QeoflkYPyevXtkSUByUsvzvh2s3vc7CoM53Je0HyQ2l?=
 =?us-ascii?Q?pbTuMNjhoLKhhT+6k/0R64nDc7DfDcosbiZ4nZ7ddG7+5em/Q42kVCJ+W5mY?=
 =?us-ascii?Q?r9U5+hpWM7bGTz6PmLQXNL3z2GZC0sc21ThBGg9OmmTXTvrM0RH6FsvyngdW?=
 =?us-ascii?Q?0140SJLWDCLVYQzj4ymAzHmky74e9KlV3Cdlw2ovYb4yXFRuAwsytFINWHS9?=
 =?us-ascii?Q?Q62GZKda51bhTqRPfb/XDLfYE+kQpr07fpEBabT9kF+AkN60tV84WlFPyjvN?=
 =?us-ascii?Q?x10e+ITVdy0CVCj2/5XG3eooGYD36NxFwIrjddhmlpzCXYDSdrqAKYJdGcCQ?=
 =?us-ascii?Q?cuz6v9QG5h+PgC1njT7+pCAyowK1VNjroWhpv2q1rlj8X9Zj5bitD9NwZfYk?=
 =?us-ascii?Q?AlG0GAWxwz1iN/6mqZqa8clRh/LFNKK5wA2QdZN5MATxpND7G1wC1TyoASOk?=
 =?us-ascii?Q?VE2zBaSCd8DoCB1k4+Ac4wlNAtBk0+LuewEd67tg4U3tCsa0jGWQF2yHv8qP?=
 =?us-ascii?Q?ssFcfndKRCQB+Rc/D844Z0bwpCYrA0NUvFd19DZk5HvEd/FqCXDcWwkAcGbx?=
 =?us-ascii?Q?KFPgx3hg8w1Zt2tYp2nXkcLZ7HlMyCCtH1ANmhmlv465z2F9oLmTWvuhOav2?=
 =?us-ascii?Q?EjnE2ZuNm+0H/ObUQdoPVjfQNNG2UCIblyxVgwxQNK07QqeP7nb3sXQqQe9p?=
 =?us-ascii?Q?F0hNUjVzOPDpGWTP/4v0TUQcCfFNJi/VISS37uzt+II0+59kQmb0WtmM+fWo?=
 =?us-ascii?Q?TOn1AmWGttTJhMtUrV0P/rlfuw6J6ruzoLvsNO9iewcVCUdpTzsdjqdQh4hp?=
 =?us-ascii?Q?ALOcyZkU9PpF81YAM5KTB+7RIeR3ejRoP2JdNShxrBciiWYK4bV0ztbZl/RY?=
 =?us-ascii?Q?evOkRpK5Xy8HJtfKlY/BnbCZAKJDXAqd7xRwIImoVgrPfJtYgyLINEa8NeMM?=
 =?us-ascii?Q?dVPD3lv8V8nKfE3pORc5K4/zSVobGur3DZ3l1G3U844r9uDwbt1GLU8l5sDu?=
 =?us-ascii?Q?XZFhHjNN4mvQMAdIfUA9cmJDWK9oOs6nhNY8qpRe5TXngY51tYfiFU6Sjze+?=
 =?us-ascii?Q?eyfTa9fjIrx65qUA/SR8G5VUdBxz2SH+gDLKXtHR0qBz+UGEvCEyJURsjGRI?=
 =?us-ascii?Q?ezd9OrX1dZnxLYBuqQNflkYmGJPWvFZ/fL/GauSHlMbGe1pDIFf3QUYPAaQ2?=
 =?us-ascii?Q?jTrM1VQMCoTVsXsKWBSK5F2NumozEiKjCPQZONGvxY3w0wURUMx7++7Kylqv?=
 =?us-ascii?Q?/r4REmml0tRO1EhS0vo3QoILyvhMK4Y+vqGsjRrp/gYhPtBDAEq87nglxEXL?=
 =?us-ascii?Q?3ZROdaZIxNNeNx1gcEpNjtMxVBdnkqDqhA9zODKgGyIltvvrWSrlTwwiclWm?=
 =?us-ascii?Q?lSC8Thjz8JWJ3eR4P3nDGpHf0oTRPx/3Ctw8Ip0PYXGrHingZ3bciwabSX8P?=
 =?us-ascii?Q?9fLb/Wa2WUYiXm0CIklH/HtEsPDmLhMjmPhUFNHOgLXXYc+EspC0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e53d2f54-bc6f-4081-050d-08df09086a83
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 15:39:46.2945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJPNPh+LB6mQLUgVr1nhya5hdEBVXGmN82tPhg9tB1+9RR2mMceJZYxSCQS0w7UrEFDvy/9/ZYWxIVTxfNrFzmH7G9tW1RjqTDNEdJKu8IMbxQT9Dda9gioBxNs8O+/o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9474

On Mon, Aug 10, 2026 at 11:09:29AM -0700, Allen Pais wrote:
> virt-dma now dispatches completion callbacks through per-channel BH work,
> but SF-PDMA invokes the client callback directly from its error tasklet
> after exhausting its retries.
>
> Complete failed descriptors through virt-dma with an aborted result and
> the remaining transfer size, then start the next pending transfer. During
> removal, kill the producer tasklets before the channel BH so they cannot
> enqueue callback work after it has been canceled.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---
>  drivers/dma/sf-pdma/sf-pdma.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
> index a08ca355dadb..ab2029af0c0c 100644
> --- a/drivers/dma/sf-pdma/sf-pdma.c
> +++ b/drivers/dma/sf-pdma/sf-pdma.c
> @@ -328,7 +328,17 @@ static void sf_pdma_errbh_tasklet(struct tasklet_struct *t)
>  	if (chan->retries <= 0) {
>  		/* fail to recover */
>  		spin_unlock_irqrestore(&chan->lock, flags);
> -		dmaengine_desc_get_callback_invoke(desc->async_tx, NULL);
> +
> +		spin_lock_irqsave(&chan->vchan.lock, flags);
> +		list_del(&desc->vdesc.node);
> +		desc->vdesc.tx_result.result = DMA_TRANS_ABORTED;
> +		desc->vdesc.tx_result.residue = desc->xfer_size;
> +		vchan_cookie_complete(&desc->vdesc);
> +
> +		chan->desc = sf_pdma_get_first_pending_desc(chan);
> +		if (chan->desc)
> +			sf_pdma_xfer_desc(chan);
> +		spin_unlock_irqrestore(&chan->vchan.lock, flags);

I am not sure if logic is equal. It'd better someone can help test it.

Frank

>  	} else {
>  		/* retry */
>  		chan->retries--;
> @@ -602,9 +612,9 @@ static void sf_pdma_remove(struct platform_device *pdev)
>  		devm_free_irq(&pdev->dev, ch->txirq, ch);
>  		devm_free_irq(&pdev->dev, ch->errirq, ch);
>  		list_del(&ch->vchan.chan.device_node);
> -		dmaengine_kill_bh(&ch->vchan.chan);
>  		tasklet_kill(&ch->done_tasklet);
>  		tasklet_kill(&ch->err_tasklet);
> +		dmaengine_kill_bh(&ch->vchan.chan);
>  	}
>
>  	if (pdev->dev.of_node)
> --
> 2.43.0
>
