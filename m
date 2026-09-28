Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010031.outbound.protection.outlook.com [52.101.69.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47F83ACA68;
	Mon, 28 Sep 2026 16:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612856; cv=fail; b=FRwR25OVVIpyDpUj7llcvvljobzuxILvviwAHjpvTxwLdL5wMjrpBtv7oHeWaMIxTrhIDk1XuiQhnYPdAGfHRXgWNt7MaISB6fzx+Gu6KD9scQqQnr5qYoE+7i62YDYDiNiX/ImNvwpSzYCKFxZP5NizvItqI56hfNiYaUrgx6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612856; c=relaxed/simple;
	bh=CwEJJ+N6Hvb9A2d29ULJzChhE8PSSxcFU0R9VchP26Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cg8hzymBn2r3C+BAn1zIOitjZ9MEfYj9leO80ndvQmjvMNqW0rW7wqu/nAfFRMfgQHs/uBLDsG7C02lfTKN5HawIrnuwqRRDaVVEpYvJ8UnG2Jd65pzbjeLbn1GSgMj+5dXoblOCbENHFlSDMKXfDyerZLUWuRgJrugeRwAMEy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IAl51tz+ reason="signature verification failed"; arc=fail smtp.client-ip=52.101.69.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IAl51tz+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGzJ7ZgscWDP7JFktkiAxQT1QSZmfkEPaFBB1QPe7ClqcKx5F/Sfy2tgRM2S9EOT9RLiRps4dZjo9wXHh3qwx81N5jJSwYKVQ+TEMuDXo6wh7QGXRF9Dxyq3I71zYeW6s0NPEbgYsBVVXtRCmzvQVLhGY0oNGW9hTlnzSVLVihzlwDm7je0Y3VUvtnArSMRebGDrqJNXf5Gq9fLki54IKJhUVe2JrmB4AogPCIrcSsL3gYBKdDRb/O4wl06eq50nYbMiA8XdaZ/6jB61uNMk2g0U2rSVebUz2kmOq2fywEAAh4G46D985CtUIV31CQrDH8aSJkYAN9BRmnp0L2qmZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtYo2cWHjGJ6qoeaZYG6t7OrBaJkM1C9s92X7BYMWFg=;
 b=sVTm0aiLvgenRptvsFsMkEF8h825sifPb9V0CKeZzLvyZX7XGGdb1URZLcNaXfNWAD3uK1xI1Vn0tCHYayhn1Unj8nd0AlQr+Ou52kHcAuXji8IlYVofRKfxRWK2aJu8KgvXQeLir3Sh7f4y2iUXvtm3Z0RODWKRQS0oTE5R69uQgryLt03+QJ/uhOcISzgY+xOOEWX9MfT3VKeTwocVXw7dE9SX6kv8JTKzor0jgQ97yjGlqV/3/Op3ncwGl8zOG3mD6DECvMZ+3gTiiPIO+80dMqu3MBWr+Vq0QjqBSEwFH0a18vbYhm9dBJ4ascpK5rAFMyMTP+qhqm551llDvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtYo2cWHjGJ6qoeaZYG6t7OrBaJkM1C9s92X7BYMWFg=;
 b=IAl51tz+64+eynBdNtwDkVQG6G0s/tzYbtqXYom/rUqUqrIvp9Ve/c6Yq5V4eNFGePOs2oOOGho0HKkpFoyFpgnoBZEaPSBJc2poUXy8NDIG6y7+YozY2Jz+9Phe7Jyfl6uY4nESDApzqPUF2YjGD8CBX1iLx1Hk0UaPivhWBtT5/mIONVj/m7Ed3e5jjP80CbjqjZXtnhxGqUv2fkI+/+HFzfLRUILm7vxDxWfkIW6TdHTSzy76Fe1lGrtSjN5qe3UF7+B3v7Ec6vydC+Vj3j4BEVAG13y8ThaW235nb1vM6KRQr8kUX472Mq8wWjCK5YlUKyQu752e6fGApJ8oiw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB7557.eurprd04.prod.outlook.com (2603:10a6:20b:294::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 16:27:31 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 16:27:31 +0000
Date: Mon, 28 Sep 2026 11:27:22 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Andy Gross <agross@codeaurora.org>, linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: Re: [PATCH RESEND] dmaengine: qcom: bam_dma: Defer IRQ trigger type
 to device tree
Message-ID: <arqVap3Ky6vJEhRt@SMW015318>
References: <20260717-qcom-bam-dma-irq-trigger-v1-1-6405eac86f00@oss.qualcomm.com>
 <aqlQ_y-um0yqo6jj@SMW015318>
 <64fc0855-3dd5-4668-9d4d-bd82be246de8@oss.qualcomm.com>
 <b60b699e-7921-4a5c-b110-50448e660f44@oss.qualcomm.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b60b699e-7921-4a5c-b110-50448e660f44@oss.qualcomm.com>
X-ClientProxiedBy: CYXPR03CA0050.namprd03.prod.outlook.com
 (2603:10b6:930:d1::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f22bb5b-156b-4cf9-0955-08df1d7d64da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|19092799006|4143699003|6133799003|56012099006|10067099003|260925021911599003|260925022911599003|260925021311599003|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	59Fzq4KaIQlNVLeDmOO/ACyKCcitDpqBvfIDztDCSF6fiUWl/rmGtHZ52jiCMi9PyCil3nQGbtrqbsvhKgQjzMbeBIa73Ptm0K0YlrqTcycc79KnwCmZ5C7s/32YQyq3zYGpegZ0GqmhCtvLw9h/jGwBN46N3STOxLDHE1IG+Dyv/vwsc96cz+G7JzNFYStqwvB6e/tu8FvkZn9AhYELiGgbyO8TZxdV1q+73bRvEZFfscFN5/8G2l2y/XGJ4qRmv+AwAlFhl/jOcpkzj2Tw+y1nszOyX9k6arhG1ztJjjqY/cdJFk5rE/uWZhO+g9QoRZHqez++ff7ozCcgA1aMj4vSFIbH04eR0/pGXKj+PhZnccNwj2/ASygICJ43AJz5A/sFUmerS06TNmQ31mrnb/AGmw9omdDqNEgM9C8fQjseMsbId5Q7GujkfKJO1n7YDLs87vLo3fkD/4ojVNd5jCh7LTiEp+Rig8fnADBDy+ZYv0A3wkz6u0htiKFk4mxN93uOMf72eBFQ4v9ZpmtMskquixUBuONYdVpQbHv6mNAmrUBPUTKY1RHN18V7vRPVV8KBFLL2Tj6JXiIG8tU2QAaaiS/FZp02J4Qi+20w5Zl4gnnE1SykjW9Jw1B6IjP+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(19092799006)(4143699003)(6133799003)(56012099006)(10067099003)(260925021911599003)(260925022911599003)(260925021311599003)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?g86r7e4kk8YOi8zkD62CdxKr2bH7i8S5VfV/ZknIAHKQ8KQnfb9kA99i0w?=
 =?iso-8859-1?Q?Rixp6Ah8PxoOj1M/LwD3JzvdVBuMaN57anaAve5ZUOYUXToN0aH5ehgG2d?=
 =?iso-8859-1?Q?8HEnakgF8ulRZizTmLXjouDTpqdtNOOCre3QjjaH8ryA2kqmR6eYwmTfqL?=
 =?iso-8859-1?Q?WEE+p5Uck1N14MPJ9IKy9USCa5aSAriS2TUV6A66ewVZQACFFTCLyjoYdA?=
 =?iso-8859-1?Q?B4/9aZW+T/xiGDddzqaenEHcA2qAOppYLuCqjtLBuoWO8fy+NXw+4slLZi?=
 =?iso-8859-1?Q?hJEet1tJmilP4BJ1KVCnkRFSOHyRYGSATwwkeaIZAFau3h4W+7poWRpoYt?=
 =?iso-8859-1?Q?rEhbjg2tHA+B0DY82LPkohVRXiDehjmP5BCHW6yXPDmfnKdb0DeC+SChYK?=
 =?iso-8859-1?Q?pq4jqKtYodL5tI/+1v2Zje4wGKDT/vQbntgWmqz8DltuABEklWnL9bsFPt?=
 =?iso-8859-1?Q?SCbS+6DoGaQZXdrgLBKbJC2AR7u29WHwWWXx9qK+xN79krAa+QVrjAcFZ7?=
 =?iso-8859-1?Q?FWdD9N34RKKSvlJv16IMA6sj1OzCZvN3VMjjCCphQV6OZoSUbegJWVjVUc?=
 =?iso-8859-1?Q?SmZz0uOzClNxh5+wRVGFEn8wOwsuxgY78/JJpUqW5lTPRRZBD8ojvl5dZ7?=
 =?iso-8859-1?Q?DHM+bfGxyAzSeDHh/si/WYHyfP/QKhQsoE1BETi7igD5corg3wiPvuK+Ao?=
 =?iso-8859-1?Q?ieKFxASXw9fHBjfZCPvtuXXSq78dz6Mbsz6cQdG1xUU7cnei6Abb6dMEJb?=
 =?iso-8859-1?Q?NwTtzjzX6XPvnRLmU02DfVgidge4CFJn4Q4H5pqUnxKnZGTU7XBaeYeSk9?=
 =?iso-8859-1?Q?uEqIyY4sS7+8Jgcy0XB/w9yukJ1dXx1XsidLGgBz5P3Ax8V/3BzKFZE6bL?=
 =?iso-8859-1?Q?rl/aBBp5CqYKA6HB9iL1zKKTfy0P5SSR227B/KThWZA4vZUZOPVHL1Tju2?=
 =?iso-8859-1?Q?mwKlxyeeYVgbPck361O2zCyr7+jRuVwmmnd7yVkPSpcZqRnWApuDiuLzTW?=
 =?iso-8859-1?Q?Zu1F4ZpxDZB+/KSk5f4mHEXfCTKYOh2UWN7Gt8d4On5ifB4PVU5Cqf2Xxr?=
 =?iso-8859-1?Q?LpV1WzaXTX99sbu9ocsXLmujm5azdS5TwwQqIA7e7YMM7keQuobX60wZ5S?=
 =?iso-8859-1?Q?g1CvFE9u3Iownh2WXA6mEkx7onnKhndkavCTvx9mvlmJAxbdb2LgW09tfq?=
 =?iso-8859-1?Q?tZf7uCLOon79CTuBb3AMz2T2RXWeYpC6a22fzOJmxDL5HM9XJOgh82kJdt?=
 =?iso-8859-1?Q?EuRZJq3fyA0Fmf2NN4ulacuXowt7PsTobyoHs7qrTszT6P1thokG2gtFB4?=
 =?iso-8859-1?Q?ye8PVY5PQKW0yLMf5tLBQvu2iI7r44H9JofwWmQQklTHHfv3Q5zYsVJj+O?=
 =?iso-8859-1?Q?I4JcyM6YLqpefR90Fpn+nmhZ1hLkz+wK3QsAv8dY6ZUFkRRGpYgqybPTAJ?=
 =?iso-8859-1?Q?b0qDp7FOQ9fkB1q+IOmOGmgNIMRum3EguwZCAG7MbfgPzJtJWmpI5cLkbV?=
 =?iso-8859-1?Q?+gDXTtddZXLd+717dk5ldfYHktiHxYrqh0+YaF4vTwacvPShZ78/zUDN0l?=
 =?iso-8859-1?Q?q+uczgVbuNZ2wHP7VJESpb4BoVtpL7dwJhTtg8LC9S2b7z4R6X7RNyMVjN?=
 =?iso-8859-1?Q?Ju+/qUI61okwCXF/qMQrQu6O99MD2N1S1ZV+30gDjt/DgHqlcfOQvYH0gK?=
 =?iso-8859-1?Q?FwE0ROKWNhK2tiVx3UuxZeANWjrka1dQbA2X9/FWciFLozYGKZ+Tv3ysOI?=
 =?iso-8859-1?Q?w1ZG/QzVnQbkU1gu+v7ROn174hw3EXFf4CFCjkPDM2RgvpTGWfeQ8dQUm7?=
 =?iso-8859-1?Q?6sp8BliL4SYl83tAWO7nvTgXXllO1J7wPNEasWEvt9hBEffp2kk1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f22bb5b-156b-4cf9-0955-08df1d7d64da
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 16:27:31.2117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNb9cNX/au5JPOe21ZDBJBqWUgyepIAX3PXFJS5uK3LqfeQ2BWzHqmb3QvgizE7JhTP+22OVkN2zTNb0xi7k6c+FvDajm1MpjV5F+yPCVXiVmdGYFHyL6CHZm8CmE77y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7557

On Mon, Sep 28, 2026 at 02:38:14PM +0530, Vishnu Santhosh wrote:
> Hi Frank,
>
> On 16-09-2026 08:30 pm, Vishnu Santhosh wrote:
> >
> > On 15-09-2026 07:36 pm, Frank Li wrote:
> > > On Fri, Jul 17, 2026 at 10:30:28AM +0530, Vishnu Santhosh wrote:
> > > > The driver hardcodes IRQF_TRIGGER_HIGH when registering the BAM
> > > > interrupt, which overrides the trigger type specified in the device
> > > > tree. On Qualcomm Shikra SoC, the A2 BAM signals an edge interrupt
> > > > to the apps processor; registering it as level-high causes the
> > > > interrupt to not fire, resulting in missed DMA completions.
> > > >
> > > > Use IRQF_TRIGGER_NONE instead, which causes the kernel to use the
> > > > trigger type already configured by platform_get_irq() when it parsed
> > > > the device tree interrupts property. This makes the driver
> > > > platform-agnostic.
> > > where show this? can you point me doc or code?
> > >
> > > Frank
> >
> > Hi Frank,
> >
> > The BAM driver obtains the IRQ through platform_get_irq():
> >
> > bdev->irq = platform_get_irq(pdev, 0);
> >
> > in https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/dma/qcom/bam_dma.c#L1270
> >
> > It then registers the same IRQ with:
> >
> > ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
> >                          IRQF_TRIGGER_HIGH, "bam_dma", bdev);
> >
> > in https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/dma/qcom/bam_dma.c#L1335
> >
> > The comment above IRQF_TRIGGER_NONE in include/linux/interrupt.h
> > states that when no trigger flag is specified, the interrupt uses the
> > trigger type already
> > configured by the machine or firmware.
> >
> > https://elixir.bootlin.com/linux/v7.3-rc3/source/include/linux/interrupt.h#L25

Thank you provide it. Kernel doc or comments may miss match actually code
Do you know where exactly handle IRQF_TRIGGER_NONE as what doc said?

Frank

> >
> >
> > Therefore, IRQF_TRIGGER_HIGH overrides the trigger type associated with
> > the IRQ during
> > DT/IRQ-domain mapping, while IRQF_TRIGGER_NONE preserves it.
> >
> > The Shikra DTS which is still under review describes the BAM interrupt
> > as edge-triggered:
> >
> > interrupts = <GIC_SPI 74 IRQ_TYPE_EDGE_RISING 0>;
> >
> > This driver change is needed so that the DT-specified trigger type
> > remains effective once
> > the Shikra DTS change is accepted.
> >
> >
> > Thanks,
> > Vishnu
> >
> Gentle ping on this patch. Please let me know if any other information to be shared
> from my side.
>
>
> Thanks,
> Vishnu
>
> >
> > >
> > > > Fixes: e7c0fe2a5c84 ("dmaengine: add Qualcomm BAM dma driver")
> > > > Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> > > > Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> > > > Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> > > > ---
> > > >   drivers/dma/qcom/bam_dma.c | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> > > > index 19116295f8325767a0d97a7848077885b118241c..6c3e2ca8a572fd04c925de0adbd5cc0616b361ef
> > > > 100644
> > > > --- a/drivers/dma/qcom/bam_dma.c
> > > > +++ b/drivers/dma/qcom/bam_dma.c
> > > > @@ -1303,7 +1303,7 @@ static int bam_dma_probe(struct
> > > > platform_device *pdev)
> > > >           bam_channel_init(bdev, &bdev->channels[i], i);
> > > >
> > > >       ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
> > > > -            IRQF_TRIGGER_HIGH, "bam_dma", bdev);
> > > > +            IRQF_TRIGGER_NONE, "bam_dma", bdev);
> > > >       if (ret)
> > > >           goto err_bam_channel_exit;
> > > >
> > > >
> > > > ---
> > > > base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
> > > > change-id: 20260601-qcom-bam-dma-irq-trigger-0366e7e86f17
> > > >
> > > > Best regards,
> > > > --
> > > > Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> > > >
