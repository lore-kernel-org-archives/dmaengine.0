Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=40.107.159.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792527964;
	b=3B8uHGhKnb3MAUuAIGHNRpejGnTCpSzsXo+lGV2wfuCk5qQ/7qYcXn8sJ/5/hbAz9dvN
	 ywFZRV0/8v8w0G+z8aQuZHFUq/pe99OD3YDQBGdKUg4BM7Fn7gZQDcAi0QcNJ6KKx1Lme
	 sI0vkk7SkMPBuFRlVERPYeli8dlp/fCWG8+M3JXM7SFWL+WxVlCKj4ppl44XXXpWwavZT
	 +qcmcr3ZvGAeJT4pq7y4UermYB/JeeRy8tOxVL6S+MKW5fx7kzEV4TCqL5U7AXkjay75M
	 j5Y52gSA9a2jYMeOqrmge+Xoqk28QQNDdUNcRrzdYhflbEDhJQPlEHReyPXkb2+M9tg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792527964;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=VKbBdiItt7yw95WTMPkkNCmsifzrP0vZV3SLuUSAdBI=;
	b=qQ6UpwbQ8fGC2WGHIMvbyIXZ92aZPPTsWNzw8zmlFaA4nHJh+ZTPZk2c2Q2NnHSBCVQ/
	 hvQ1sxMIVUe4lf4Jdob8ocJETEnyi72lOTeEuIa/RIugfR4xbkmA8B4V0R81QV5fRojmS
	 n1mtmRbfcPY9jjCww6Ynm13GIniEx5QbGQdxDP0UBSaYEVHxMxoR8dlBXeYsTh8d8QN9k
	 3gO2h35q+sQAuw0SmXWxxGwlpSZ3avItoM5k35p04uy56lnIW5vSHh8kI1GS91JJ+RKlB
	 2W6eCEPQotsRGzzVIxWkXTQX7xKR2vMOvYU0QCgu5JXEUtCuxEWT5xrOjfZFtl9lUNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Ws4WCm7q;
	arc=fail smtp.remote-ip=40.107.159.29
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013029.outbound.protection.outlook.com [40.107.159.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748D3606A31E
	for <dmaengine@vger.kernel.org>; Tue, 20 Oct 2026 20:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 748D3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Ws4WCm7q
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PhJzah7uEBqRv25jkO9NItldFJPr5Vs6K8LNxH52RNUn/Lo7MEn4h2Ku18pB9TvurmFR0ub2cuEA0DIPwdMnRVuer3JJzOuHo20ICKSgD5znSuNHKBuupiYEGVTTmjbdIskOErjU1LVYeideJjYU2Um2NASzIOPInpgvF3VKOahqMJimkPQE97Huoz9ebDsoE3Sr2ttaI5Lrnq4iyUi2Wfuf46isRP41XzSaq1E0hxowKi1hYI//3ysSxulvHdaJ8k9rGQ/XsTwMdQBa39CFk7W5geLYvbhq13k81xCLpeSaHxtDrKi/BvorOlkjWz8HJLkoZ+Qttfl5F9K7IXC0Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRIjwPxXVlFBb2/3ce3Cm39LR7ETthon0sCZA8mRJP0=;
 b=jCbDojIRLN1azcgI0QbEWJI7Yhr1pPQHsJ3KjCItiwQjCJ/nnQ/4P5L9N2SgwLeud9XanBhefjhsl0+IvzivnPw88t7ragMV/qnhgUdwhmgzv3c7rVIoR21Ew35y1q1CYvzXs2hWrHmbozdOvW1EvAT2cfL6xT5RVD2HIaU5ibYg+QP6yJISzioJPT3tLMwTJbir9UEqBtbwSQOMgAod5NKjnxHoAdaiCkvm4D3EsT/YoU+f/tq62O32w9Wr0MDTetxigyrv6A99MNeWGVQ/qDSRrQ3aHK/JTOCjrp6IhfYpD7zxIL7nSKG/xowyktUt8A9KUKujEtJsymFT0lHQ5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRIjwPxXVlFBb2/3ce3Cm39LR7ETthon0sCZA8mRJP0=;
 b=Ws4WCm7qoqRraLZTgTRebNJVgRQrhTSZeRhkeZeTozQZlO8HEEDNchgxv/tggz/xJb/0W1PcCFbsf8g6nT5qBDQ30kutSgE85QPFXfEvj5VZP+2V01k9q7X+Mbbl3VmgpHxpIVW8BQEt/FBUhPc9ahrVe5UMPX4npIW2QRwQFLxybjC8+X7DQpWeD9ZB0Bwhgg9Dq2jsz3mpftgW5dypN8MrCo+V+mu5aBHyZvqVLyJIrqq3XoJKE/L10Rle/cryKaUcPb8mUUq8CZl48KH7ncFDQYYDxsFK4OIHS3iv+EimQsqr4IwSC4PPzpIM4iVbid5bvhxEft6KEdvykimBlg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVXPR04MB11654.eurprd04.prod.outlook.com (2603:10a6:150:2c3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 20:25:59 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 20:25:52 +0000
Date: Tue, 20 Oct 2026 16:25:45 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Myeonghun Pak <mhun512@gmail.com>, dmaengine@vger.kernel.org,
	Frank.Li@kernel.org, vkoul@kernel.org
Subject: Re: [PATCH] dmaengine: stm32-dma3: disable the active clock on
 removal
Message-ID: <atfOSRpBqjDH8fbS@lizhi-Precision-Tower-5810>
References: <20260911184841.34222-1-mhun512@gmail.com>
 <20260911190038.955201F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911190038.955201F000FF@smtp.kernel.org>
X-ClientProxiedBy: PH8P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::26) To AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVXPR04MB11654:EE_
X-MS-Office365-Filtering-Correlation-Id: 34176ed2-dcb6-419d-2aa4-08df2ee855be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|19092799006|366016|56012099006|5023799004|11063799006|4143699003|261009220027099003|261009221227099003|261009223027099003|261009221727099003|261009223327099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	U3Q6/qoa6nICUNGj5fYKfEONwMwbF594i9o8iNyN4JVNTN2gOyfxx4d7IRxm/I46ajM1+rvOIeiOvGZq35uLZ7GoqXjsgMf5P8WGbSVaiE1mBFvW4GlVTGE89hzvIW3OPD+c/F4BIcU61D6TJSzDEa70pFFIqnXQTrOFqrfNBDYf/iO2c6+xyc3BAaJ07e6hwwmJUKrsJCgieFpEGbuUhJkClA9+mkh9FvmvSAQLoi/vEBFZGpntDJIWAttoguQ52L+eAfNHl7E6aaB1UEB73W6mpGr0sMBakJyfdc/uMFZAXl/cvYpVmbaGMbI29F0ceqJttc5IsF3rrxh7hY1VVYW+yTqr3eQOloXv3Lg3CwV6ktt9haeQVJLIdDDNaU2HBzNaQoaggehoPnTi+/IJBaf8uTkG4no6gKXFSKHhfaNBnaWTpmaRgvG8J4oG3MCHzoOqqfihG70nwqI7D+8NjY87UMCsXuE9OAX7Zp9/F+eyf0qnEASuKvFbFY7jdqyCKgdOoLmNK5I1/JRmAOcK5qkK0pGbItaQHlkuUmk2Q9N9VSUlvZyq5Lirzap7GY9MkLSE1/hKlQWjdr/zMKHP1lw5NSkUm5s/V/3NBmsX4gc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(19092799006)(366016)(56012099006)(5023799004)(11063799006)(4143699003)(261009220027099003)(261009221227099003)(261009223027099003)(261009221727099003)(261009223327099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?FWdiknsxigqB1xlCflAc0YHn1l+htNOImzzUREVIpNyRP0Q1Mk3jh/FHLO?=
 =?iso-8859-1?Q?nanCdAEf9lDwl8/RvS67nTUXZ369/KHN7Edf3t80sc2+caMFvCTaGhf6zn?=
 =?iso-8859-1?Q?caVvub4f3Wa6bKHriDiiNihhQH7WA1+ki+xmS+V+Jpvv3RyNhn+VpGwrl6?=
 =?iso-8859-1?Q?ykFjrQuAwwjapRcNdd7FJ28y7GPf8xoc0IwV+yT334ihuatFaML85hhCh/?=
 =?iso-8859-1?Q?PlElUBrkc1qkNc3sze7MPaXAthtDxYnl094Jab1VVFlkvUvy7MVPLXezi4?=
 =?iso-8859-1?Q?7iggIeTFR+bLNf6mGlPvJUU8A/Hmn73QaX+sCyxZgxyyUxx2T8RhChTWm9?=
 =?iso-8859-1?Q?PjE5lf0LXgxnqkEiMOPiOzyPYq9oaCv6HPjded8lq1l6lNGoW+7/bBvdDK?=
 =?iso-8859-1?Q?QcgTc4qEV0UWBh5AoL7VLr91dDNhYY7xjR5r4ibGMqMmQSuNoyfnJ4ETa+?=
 =?iso-8859-1?Q?5mdNEa1u6xNNlinJHjARcJ3k9HcDvZzEzYHo7ZYHWvu6woIe2vo8Wwouq1?=
 =?iso-8859-1?Q?ygvOdiozUKGgwOekAiPxWel8D0LaKza47g8dgtZ+LLF+FzbL9MvGX2z/IH?=
 =?iso-8859-1?Q?YtIHxWbfu9BQ7t2p1u9qC81JYEAlj7QY9BPjcdDSWgy0GpT7BXgxZKbGNy?=
 =?iso-8859-1?Q?rDTP17As/r10i//R7Qfgb7KEX5wneiHH6dd0N8i0xubZvNdmBQkqXGZ1I7?=
 =?iso-8859-1?Q?P7ZlwxjtyAiIlTj+wKS8xhU6Cnl5B6Lu1ekLjtNkPYWe3xGFFi0IED6zrn?=
 =?iso-8859-1?Q?9xwrvklc+X3W9kizolMucsvymsHiR9UGCh2fa0wH0PB0sX0xrnAsGsE2l2?=
 =?iso-8859-1?Q?f3DbglnfG6vAU1j2dKSPEKiUCnrdHyS0GQexV9BL+I/v6mI4uikj2S3wQw?=
 =?iso-8859-1?Q?IKnxZmO1ka316GTEOOqY7LOseZo5R5K1OVd0yYKmTv5kalzXo8HCbFLzSF?=
 =?iso-8859-1?Q?4LsGIoIRxwKO7ppVJ6p0jwxD9kHBdLpdmCzNA7pDcKxLF4r2E3S+gS4r6v?=
 =?iso-8859-1?Q?7LEBQgyUtPBEohRRPVy2jFLG+9xqFvSEBtVFBflle56rKWbCU2b/PydCg8?=
 =?iso-8859-1?Q?Bd0NySDXHpneWROaVohMbP8cAqn71mJ/lKdXIWK7gkwt2kC7vVuCF71mjO?=
 =?iso-8859-1?Q?O9U5a9NbdjG1KJowujWdaYGSpzB2Wy+/Sk6lgsP6AsshGyl0DFn/6gYlI6?=
 =?iso-8859-1?Q?GNpioM80zuzlG0jVw3bIiPeBvOVZTmoLYIYUEe5mE/BYW2Tvh35OGX68is?=
 =?iso-8859-1?Q?HBeXpcTZsz69QbYwWn/fbdYCWmRvaZ+CxSBaiEurvXZu6ThGRd8XpK6E+i?=
 =?iso-8859-1?Q?uxPhMrVv5oD0QcNPBwlz4DUYIA8tty8lRL028K//88Lszj3pIfEDa/R1Ub?=
 =?iso-8859-1?Q?P97oiw5xQG/hlM7nZRGFkXEioUzVx5Vo1KbivKr+MUr7MQISynh0+71peu?=
 =?iso-8859-1?Q?UKfrr7KVMHuZpoYvIx703pMdgyv3KaxxkeTdTpo+ReMOtWTj2+zo/aOKcR?=
 =?iso-8859-1?Q?dr7EchGaz44KsjewKuSbQe/omj6O+CBaodgudFR81pqFMU8m+AqLNqd8ns?=
 =?iso-8859-1?Q?iBq8VtVKbLokDrH9VEToR3C06eLmT/GsxHPMRqabTFVlaxjJYp2Tw7H/Rq?=
 =?iso-8859-1?Q?2qRmS7gSRh8mbJZP7J0SH7iUoweRVse5zTAQBz+vOAjJM8irrjkxiVDh6l?=
 =?iso-8859-1?Q?A/N34B/UXyrQnC7XjZyl93UNHOlA4Gp3FMwCqsHOhnLEHXhxbKHWJz0XGk?=
 =?iso-8859-1?Q?r8MZqJeChOiGG3Qj1eBAsTNBiln8sEYXQjzVDTLxqSVsHMcY1t0dRJpSEf?=
 =?iso-8859-1?Q?N+3YnA1fDI8o1k2/9XE48HJrRl67rYSWacehuGEpC8bSlCOgTpNV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34176ed2-dcb6-419d-2aa4-08df2ee855be
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB12445.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 20:25:52.1262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TSFB74H7EJmx9qnwUlgc033gyTSI/KfiRCK9dCDKWZFi8Cml5zRIqVMqj6IVMaKxvXuL/nZkQgC13GTHkID8mRhssgxHlKuo+/YVGtyMrktdn0Yk80bx9JkbaeECunmq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11654

On Fri, Sep 11, 2026 at 07:00:38PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>
> New issues:
> - [High] Devres sequence inversion explicitly disables the active clock in `remove()` before the DMA device is unregistered, creating a race where clients can access unclocked hardware.
>
> Pre-existing issues:
> - [High] IRQ handler accesses hardware registers without runtime PM protection, risking a crash if the device is suspended concurrently.
> - [High] Missing tasklet_kill() for vchan tasklets causes Use-After-Free and hardware races during device removal.
> --
>
> commit 267d53077eeb3e6ecf120df2e24f7e2dab91c06d
> Author: Myeonghun Pak <mhun512@gmail.com>
>
> dmaengine: stm32-dma3: disable the active clock on removal
>
> Probe enables the controller clock and runtime suspend disables it.
> The remove callback only disables runtime PM, which does not itself
> invoke runtime suspend. If the controller is still active, its clock
> prepare and enable references therefore remain held after removal.
>
> > diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
> > index 4724e7fa0008e..b4d68be5a46b8 100644
> > --- a/drivers/dma/stm32/stm32-dma3.c
> > +++ b/drivers/dma/stm32/stm32-dma3.c
> > @@ -1926,7 +1926,21 @@ static int stm32_dma3_probe(struct platform_device *pdev)
> >
> >  static void stm32_dma3_remove(struct platform_device *pdev)
> >  {
> > +	struct stm32_dma3_ddata *ddata = platform_get_drvdata(pdev);
> > +	struct dma_chan *c;
> > +
> > +	of_dma_controller_free(pdev->dev.of_node);
> >  	pm_runtime_disable(&pdev->dev);
>
> [Severity: High]
> This isn't a bug introduced by this patch, but can the interrupt handler
> stm32_dma3_chan_irq() access unclocked hardware registers if a client
> releases a channel concurrently?
>
> The interrupt handler directly reads STM32_DMA3_MISR without acquiring a
> runtime PM reference to guarantee the device is powered.
>
> If a client releases a channel, stm32_dma3_free_chan_resources() executes,
> dropping the channel lock and calling pm_runtime_put_sync(), which
> synchronously suspends the device and disables its clock.
>
> If an interrupt fires just before the lock is acquired in
> stm32_dma3_free_chan_resources(), the handler spins. Once the lock is released,
> the handler proceeds to read the register concurrently with the clock being
> disabled by pm_runtime_put_sync(), which can trigger a crash.
>
> > +
> > +	list_for_each_entry(c, &ddata->dma_dev.channels, device_node) {
> > +		struct stm32_dma3_chan *chan = to_stm32_dma3_chan(c);
> > +
> > +		devm_free_irq(&pdev->dev, chan->irq, chan);
>
> [Severity: High]
> This is a pre-existing issue, but does this loop also need to kill pending
> vchan tasklets to prevent use-after-free and hardware races?
>
> Virt-dma channels schedule a tasklet (chan->vchan.task) to process asynchronous
> completions. If a tasklet was scheduled by an interrupt just before the IRQ was
> freed, it remains pending and will execute asynchronously after remove() returns.
>
> At that point, the clock is disabled by remove(), so any hardware access
> initiated by the tasklet invoking client callbacks will crash the system. Once
> devres frees the channel structures, the running tasklet will also access freed
> memory.
>
> > +	}
> > +
> > +	if (!pm_runtime_status_suspended(&pdev->dev))
> > +		clk_disable_unprepare(ddata->clk);
>
> [Severity: High]
> Does disabling the clock here create a window where clients can access
> unclocked hardware?
>
> The driver registers the DMA device using dmaenginem_async_device_register().
> Devres-managed cleanup runs after stm32_dma3_remove() returns. By manually
> disabling the controller clock here, there is a window where the DMA device
> remains registered and exposed to clients, but its hardware clock is disabled.

It make sense, please fix this. you use devm_add_action_or_reset(), or
use devm clk function call.

Frank
>
> If a client issues a transfer or releases a channel during this window, the
> driver might attempt to read or write hardware registers, causing a crash.
>
> > +	pm_runtime_set_suspended(&pdev->dev);
> >  }
> >
> >  static int stm32_dma3_runtime_suspend(struct device *dev)
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260911184841.34222-1-mhun512@gmail.com?part=1
