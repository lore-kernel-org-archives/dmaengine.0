Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010036.outbound.protection.outlook.com [52.101.69.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2573EA979;
	Mon, 17 Aug 2026 13:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786974441; cv=fail; b=VPW4aLPmVE1E5LeaD2YO7VF85x5v6x1oRnaUCqL3hIo3Hr5QA6ZBJyKN9UMaqww6yqePKhK330lZL02gvxC3v6XDr9JJZakWRgU2O//g1jwvXky7H+lJUqBHUQj6jtm5q+OosQlGj8WVwui3M3gxTDRM1SaJiDYkXF2fkAgVKyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786974441; c=relaxed/simple;
	bh=1h5tO82TUmxbHfPLx4SFMtatjvHi2EWmMBJg+QhU0bA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sn/pAY78qJRMpsXaUJ2AiFd+0KhMLRjDXBrDDoo9h+puc7KjnNKrOlBLqljVG7rUvWQBKHIZaUg9hJBpCDIsETgCe6tWXDShhdmsHno4/dEH8Ahx4zgm0mjLwy0CecfPOE4cquRwypFvzlW5PwCs+LLbTHeq9yRt5Rsol2zcjNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SdjG6T7I; arc=fail smtp.client-ip=52.101.69.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SdjG6T7I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UeLlr4r6vE2HBh5Irr9Ve+FSb+q//VIWJ0Qdp9mGJk6+QpN2oVSlhNglnuS9kn6F7v9YjrPEtxjz5IRVEf00bmfcGttzcMhDLIrOVkTlhuLMFVRbmQLrHM87tS8ZtGqkdCPeSDw+StXlGIGp09BI9+GDN8AnuCg4uLu25gfsC1OIyXX4QwOwZyymJyxHRorIC4bnbAPmsBaJX7BxGfDkbRrEJUOHlJjrsjiHDNCzKh9YPkZe2kB53C85GHWaXSc2Vj4OGQEIit0zjhKSvLf2q77sufUlQLPwsVidAH47eRGy6KL3qAYA0vHmC8kLscwmb18RFxAUdveV5ASzRHSv7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i83YtrA8pSoyiSbaCWZ03LKsKZZfC3uOeN1He1BPLhw=;
 b=OWYCh7NNE4je+z1ip/fjwIBfIGYJbYF2Ci2s5NKFI+rF0EoxWoMLiFbUnx4KA9m0HfQD0VRYKH+HKUlg5SnV61tuvvjzwhPMheuLX7Dv1j+U1Rn52fyuNQh7Feoro1HnbDHnTxfvzUISCccY73ygosSWYIJ1JlG6e7i4jow3ZbEY+rJkTSIldf/C3iaz9KXadwN8ySR+nRCgb9Nckw7fO7ZKx75lw7o7hlejHzcE5qFvdvH9Bknozm2T3VuJmd3uDzPiNbhzIDTcJQu7s1oOilRPZ8FubkHEwa9uz7EKuX4tHyo8KxmqBntFKsF6Ph1/b1gYrB/ySJR4wYa8FrCGFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i83YtrA8pSoyiSbaCWZ03LKsKZZfC3uOeN1He1BPLhw=;
 b=SdjG6T7ITT6p5OmDgpVShhPTJIxIcxd8uPcfKkYMN4v+6LcCe3UDKyyu4JFbR4/WuSKatreWhyCRDci13CGhJF9/f6HWA9ZGSaj7Wumf8NbJups9mR8cWWU1Bx+cqXSyIhHLTFZMOusurmPP+kl0n9fXAB6YhAn7RgwehQOVd5/0IUcPAqBmieG/ItR3Xc4QQj1BUcQs7dNVGTcgBqkXSa56dmenYPrL0zj6Q0TK4aPZBIVDi3Dikulpav5HwbD0MZZx3q4ZtoNexoPY3TZofHTlUtlSlh5DLY/DB78FebC/65e7n2INaP1WA7AhdxnnFmyFZ+Z6KzvDFsgPGeXpnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB12323.eurprd04.prod.outlook.com (2603:10a6:800:320::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 13:47:11 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 13:47:11 +0000
Date: Mon, 17 Aug 2026 08:47:00 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Alex Bereza <alex@bereza.email>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Kedareswara rao Appana <appana.durga.rao@xilinx.com>,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: xilinx_dma: Fix hardware buffer descriptor
 reuse order
Message-ID: <aoMQ1Iz21TuUUWfD@SMW015318>
References: <20260817-fix-hw-buf-desc-reuse-v1-1-d79827a844c7@bereza.email>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817-fix-hw-buf-desc-reuse-v1-1-d79827a844c7@bereza.email>
X-ClientProxiedBy: PH0PR07CA0103.namprd07.prod.outlook.com
 (2603:10b6:510:4::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB12323:EE_
X-MS-Office365-Filtering-Correlation-Id: 65f144da-97cf-418a-1865-08defc66098e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|376014|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xxa/ntAl8KN26ls+U/OT7WavbTS2JqsW4unsI2I5yhICRGnx3KmkMNzxlYUD6wwaBaRN7voNLCgRvMYXoRF2aclyzyBzH3hUHMCDLjMvfxtA9G80a1Mr3o1d+UNY+hG/dXxcem6fZ6yI37kvepHd346O1Zfi1qhIMNZiwxLyXtPNCQWX+tv+TJlfHWSxocWjDLqZ+KDY25g5kLxBGykIVaJurHdp8RFLG2mAZfh2M77SyjPKx/65DPfw9RHDM2glOZ9PcuJ0wQ4O4IB0gWYZcsWKE7e22bzpkXnbBWYoaJHoilia+7e3DmK7t8yxKayawPug7otRKcFuTQjizAXIQkEv9hGG2rSLH6uKuYUHD7Phm98q4+UEfHCZ0StUCrYq0N7zuaYXG5nfiOB/zxyAdobuxzJtwGBAcKDkFhecFx4KtxIoc3axViZtzg9TnXA0TLk7Cp9yj3TDgIyanRxpNFE1dlYat05jIcbq/SGazMDHJ+CkMNJq75KKU3FRqFfgQIiGE72k4Y+40FtY8gfZlZiZSHEO4AppzzTC25jLHQ2cc8BnxPJlSlcwrTnO2j2JSq2KHn5g9yb9F1OIo5BsPNBW81wRWFU/8fWuJ6PfeX9o1SQ1XvzC3JX4cyFX+SmNoqUq/FIkFMoMx07+cmkn/VM5Q4m++qcSknoBKowsH8k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(376014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GuoTcv71q7VUFOMMobMLNzlLz4i2a4MCMwChBx43SsjWwV2YnMv6T91HlYw8?=
 =?us-ascii?Q?i3PojzZUi8wioLb/gytElcX2ahZHfQ77WgoGCMjrOpdGq4hiSADTlG1wZWG4?=
 =?us-ascii?Q?X8aPpf8LSkCtJvWgHbnECJaKeqAUleyYy2Fc9UCRBEYWkTfpqmgNzzKIkn9U?=
 =?us-ascii?Q?Wh2qN1FDPohFwoc12Hb0UhqfnGTpKbQUWKW6aSOcvmBP0S1fkmKTVMBTO7vF?=
 =?us-ascii?Q?g3I2neWGYZRW7imnVyBN9GQDbkrAWMKsTFvI9oJjmWW1WzNGVhFUqv2T6Ndv?=
 =?us-ascii?Q?mjid4/7cM/64hzZuu1/fAetb4VHRH3FFBp+JqVSS7iHr7YqeM2/Ml0c6kihu?=
 =?us-ascii?Q?GLM8Syd37T3ajb1eMywMU+P2O6JDMt+m3dw/hDt3F2plCP5NsY8S0oxkY//n?=
 =?us-ascii?Q?qrfsNxBKSmaHD66AXeCGXtu+x2cfG1de/PqctyddUXwwUp1MxT7nsHvEuEDl?=
 =?us-ascii?Q?KE0xZQ+y4z3HTjdK4A91rewNpYtLSWzZzHep3cn1/rYBS03L4HA8aHZEOVag?=
 =?us-ascii?Q?M5XYy3U7EzQT9Rsyd8LJNhKrPDI23TVUEmnxLJl2CohjZ95ZedpbRqCUWKNw?=
 =?us-ascii?Q?KcZV39lV+GhzA0ETG711K3mDyhRyN51WBSLidTdh9rNFWkX+ph4lsld2CCLw?=
 =?us-ascii?Q?nnGGnVSQihpktqo9dnNmGrlPksLHf4R+b55/qzu1f+UpL4Gg5rnK2t237z5X?=
 =?us-ascii?Q?dBRekteOe71LbGmXUwYTgUDj3jlFYLYOL/xhuOmIo/We5HymTkujum4ZPvbQ?=
 =?us-ascii?Q?T86VcJxb2C8Oo7EAU4YY54sM3lcPHsXlj/hjHkHZGwoSvzm7dRWohtPQn2nc?=
 =?us-ascii?Q?NmCob8VADM/5o1PXmekp6a98XxH3I6L6zhR9JK8P+tEWYzuGkeKvRL4mrL7J?=
 =?us-ascii?Q?AWEmPTMd8lj2lz8Hb4YVur8sk9hCNKN4LJhsT/aciQTIvD23QJ8P3akOcYvI?=
 =?us-ascii?Q?TMejtt2+ceaFZpymZWB7wuUm2NntK00gGZR3IR5GvMQiVc3DZl6C6cUz6IqH?=
 =?us-ascii?Q?AZ5qnGj7d43d4MUBjF8gt/69rHljJgpYw20DK6CyJaHGou1QkPQLdGbv1NmP?=
 =?us-ascii?Q?F0z+JMOZd4RzNxVMLPJT0jaCZU4EW1Dhz2fpyfG8AGechR5c++X3LjO1d7f4?=
 =?us-ascii?Q?8Ba/OV9i3mV2AJ44dYAuBFTj+HV4OIGxlD2Ebfvm87R7nHniJ6SLhHBUdXyY?=
 =?us-ascii?Q?oT0gx8Bg56wJXf8rPpG30bMHVlC7hxAacLfOfoQypQ0F3fRjb+WUtpdTcq8/?=
 =?us-ascii?Q?GMYWcwyfSwmbj+YfBOtC/GNkOU5Gie9DLpQxCJb5BG4ysSolBJnzhMr8wdwc?=
 =?us-ascii?Q?cKxgaxO8J8qfwvsIerjfZagGQNWM933uy5+k0n5eTgalsBqnoihZpsbBTwI+?=
 =?us-ascii?Q?BLO+8hkFDhUDubowgNgf8ppFfBepQ/cQqTwBB1bcJJ5KKRH6i+X/otG/gJfd?=
 =?us-ascii?Q?G6Njy+5iLuiQ/F6oirbPixlOniimP0mPmSP+rClVN+PJ/vg+iAB2lFLwNzSZ?=
 =?us-ascii?Q?Cfa8dcKqvYcOuZ+yXD/LL2Ej4CL+Fhhks6Y9hDJrUqvIYkYP/h8dCdyXLYq8?=
 =?us-ascii?Q?hZ25E0Wp5KtRsQhWZz+YPLcwlwn2xv5HNG00PvheOiUe+EbiCIYeM423eSsD?=
 =?us-ascii?Q?bKV8+QLpZMF0RCB3Y+PUWfM8X63h+tmVFMgA42SL3hfBp6VEPHw91fgHO107?=
 =?us-ascii?Q?6/ss34SEiuh72R0ZlGXUTl1hDKOtEpZEVjmE44MlOQqQGv7bvXyZVKAOgLGW?=
 =?us-ascii?Q?spgA72CVb7p66THvxvfW/6vtBTfO8Nck13qwZd0HAkT4iG6f0lKa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f144da-97cf-418a-1865-08defc66098e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 13:47:11.6248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JXhyotauqYmBqLyiGoWkk9em1tzE/PJD8a7YdCxdHr4xsAEfsoeCXQlUbE1T7mD5g+/myotDg7sZESvDyaR+As3BQA49S0pJl+LCVrUw0HEGMHeTjE7RvJ8ZG/H0mlTS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12323

On Mon, Aug 17, 2026 at 11:23:55AM +0200, Alex Bereza wrote:
> [You don't often get email from alex@bereza.email. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> xilinx_dma_alloc_chan_resources() builds a static ring of hardware
> buffer descriptors once and the driver uses this ring throughout the
> lifetime of a channel. This requires the allocation order of hardware
> buffer descriptors from chan->free_seg_list to stay in sync with the
> hardware buffer descriptor ring built at channel allocation time by
> returning oldest descriptors to chan->free_seg_list first.
>
> When chan->pending_list is not empty e.g. during
> xilinx_dma_terminate_all() the chan->free_seg_list and the order of the
> static hardware buffer descriptor ring get out of sync. Descriptors age
> in this order: pending -> active -> done. So freeing pending_list first
> returns the newest buffer descriptors to the chan->free_seg_list first
> and thus breaks the order required by the static hardware buffer
> descriptor ring. Then when the channel is reused, after a wrap around of
> the free_seg_list the DMA will find a hardware buffer descriptor with a
> length field that is still zeroed and stop with something like this:
>
>   xilinx-vdma 86000000.dma: Channel 000000003a21d7b8 has errors 10, cdr 6de4c000 tdr 6de4c000
>
> After this no more descriptors are completed and a consumer potentially
> blocks and waits forever. The only way to get out of this error state is
> to rebuild the static hardware buffer descriptor ring and the
> free_seg_list by releasing and re-acquiring the channel.
>
> Fix the order in which hardware buffer descriptors are returned to
> free_seg_list to ensure the mentioned requirement holds.
>
> Fixes: 23059408b6a3 ("dmaengine: xilinx_dma: Fix race condition in the driver for multiple descriptor scenario")
> Signed-off-by: Alex Bereza <alex@bereza.email>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/xilinx/xilinx_dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
> index bef2b031dba1..0817b74f7450 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -920,9 +920,9 @@ static void xilinx_dma_free_descriptors(struct xilinx_dma_chan *chan)
>
>         spin_lock_irqsave(&chan->lock, flags);
>
> -       xilinx_dma_free_desc_list(chan, &chan->pending_list);
>         xilinx_dma_free_desc_list(chan, &chan->done_list);
>         xilinx_dma_free_desc_list(chan, &chan->active_list);
> +       xilinx_dma_free_desc_list(chan, &chan->pending_list);
>
>         spin_unlock_irqrestore(&chan->lock, flags);
>  }
>
> ---
> base-commit: 0d995da5fb97e8c312834575604d4423eb6225b7
> change-id: 20260817-fix-hw-buf-desc-reuse-b730e9e02185
>
> Best regards,
> --
> Alex Bereza <alex@bereza.email>
>
