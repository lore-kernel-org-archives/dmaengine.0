Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794943876;
	b=Y7IQb9vuTKQV63t4uh5YQrWHwlUxDFL9d1WgA25D3UKglVG98TGTZRzPRv506olHzb1+
	 jH6+aj7qvpjkixeyF+liyALiPnx4BYcND60Sk0s07Md6r+lir/gH+M2YF1IHHkdkFpSxJ
	 0DeopZIBukjnbqR7kgo4qJ1WdLDguO5oA3gFxmhtyXv4I52fhCkoyV5+0MZN/a8crM3RE
	 yk6a9UzNU6+hI/j47T0UMINUBiRjTAPIArigYGehAYr8VG576/OjyE92hu1p5b0Tnm0cN
	 BP4MUwGLlQgWG7zBzyHvoAvXVe3r5JqeyWTRuW3R6s07lbBVP0mdr4KVHTuVmXg0Yhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943876;
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
	bh=1ICqlzTUVZ+TLtRnCIgl4x5vtt2usjco2BP3Ek+M5x0=;
	b=aTa0VeqsLirxmIAHa5ZFFsSPjuoAbGHxbSJLRJimVMZNFzXxTlskqTgDYRCyntIuL7Yg
	 1hP79/QhbWT6RbvmDs7bCmas7+mxnwrQ15Ilau2HWvR12t5C6y+bzgVwGNKjdMv8Y/Cfn
	 eXgUt+y99vM8AdZy+3GFX9HgZp9Gk4/3E3KlsmpBwAvLmlHlnZDHbrvuzop3C/EtZZ7iw
	 qfmSyadWleZma9trnopJ1CskHflkG91tTMY8klneiDCOfAZmv3VzMm4HamSqDOWdo080u
	 W97Qeki8GQASkSv2KX82ddNYJu4GoDXoD5itkpT5Xd94J4g6RZggYL1x3Br/Q8RdANg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="P/7t7YNp";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.54
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010054.outbound.protection.outlook.com [52.101.84.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99241606A32C;
	Tue, 17 Nov 2026 19:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99241606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=P/7t7YNp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JA2nqqJwnNXaUmAvGAyglRD3APt6SN8nLWtEbr0hi9I2jAnEUCRKCK/wCczR67o/JvsCJ3F1mbGKsg/FsjaBNOBP9xv8HNYSdtLdSOBnUIN82MBjygyYzyy2E6z2/Dkchti/Ozb7tlAHKvJu/If0ovybCP8aKMJnLxOYo35wxLcMVmVaxuI3LgCCcLPfesjn+Iu6fefbN2LJ5mWBGb/C0bEeHT3VPHVMaQERK/iJ80Wp6YA35Y9YRYD36kWj/I6cPe8m0BqiHdnGwBt/C3E7LMakbtpCfjrcqlhnfxsrAIWvZNo3ChBnPIGGsYxUXDdfIqGyUA5bZTYxa7/MtBDDUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ICqlzTUVZ+TLtRnCIgl4x5vtt2usjco2BP3Ek+M5x0=;
 b=hEtWk6vSptx18ppLH8NxxW8g71LGpjlpeT8IIg3v1tIE7kGV1qc+Lvtwdwo4GrKDXJHYzhFsyQVQ0kIkAJlpI8QshVZGDbaDSw0joDhHgpOCd61DDdQQcuvzeQI/7Mtiumie22iOWuWoXlhvjyDhsvqOApK+7tjmBBT2UPNNAmWvtuAMLkW0T11w3lHXc59B1X7Ix9xWTOgd/E6Uy6BPzLLm3vP1Y+vW7XcnXB1Jxyh2HI6SPUI+qJ/ovd4v+ZEE9CHicbajPE7EZX5EkJ8GGX3k40PxkMYQUemc2kHlwnpzge5MzX03Tsalpzph/qwFAVLAfSCIhDoSYmIRNWYjYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ICqlzTUVZ+TLtRnCIgl4x5vtt2usjco2BP3Ek+M5x0=;
 b=P/7t7YNpq4y8x7IcgcgE8ahGx2PPxl0BaOTNqUoBtwCTpSGYtApbYmRQiLdRcLcZlwGVc6MgrVpCBnDfE8bmBtCMhuvMLnJ6XXO402L6c4FhSNpkYwMdqjvlCknNIz/grqjV1KbKDUep7uIxlxHgLNnWN/uA4Y3ry8wKyV4/GF1el6C5XVZALrKGWdK5G9F5Ub1TeyhmCoMLlqrDUcetbOkVcRdFKZKqzf91WmVKo56m0PQXM7Mc6i8eh0a/eRWdTOrQxNWichiiOplrwPdtk/aELyyo5sdIkr1ysogEoN/rU9srXVDUxOrdK9iSjSOz6lrpluCDnKpciFE6IoGE6w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MRWPR04MB12000.eurprd04.prod.outlook.com (2603:10a6:501:95::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 19:31:11 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 19:31:11 +0000
Date: Tue, 17 Nov 2026 14:31:03 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.li@nxp.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v3 6/6] dmaengine: plx_dma: don't invoke client callbacks
 with ring_lock held
Message-ID: <avyrd_b0yQ4Nqk-O@lizhi-Precision-Tower-5810>
References: <20261117165135.746241-1-logang@deltatee.com>
 <20261117165135.746241-7-logang@deltatee.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117165135.746241-7-logang@deltatee.com>
X-ClientProxiedBy: PH7P222CA0015.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::28) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MRWPR04MB12000:EE_
X-MS-Office365-Filtering-Correlation-Id: d3b174b6-242d-4240-be47-08df44e155df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|1800799024|376014|18002099003|22082099003|6133799003|261009223027099003|4143699003|5023799004|11063799006|56012099006|261028144727099003|261102123227099003|261021133027099003|261026135527099003|261022105027099003|261026130827099003|261026140227099003|261021130227099003|261026121527099003|261022075727099003|261021123027099003|261021121427099003|261021135927099003|261022115727099003|261022113327099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	5u1vAVVvnJ9+9N2NpoDcapn9NcZjBRDrcyn7k+uYVxxF27Nh2t4n7QsFsPELBSS/P88zgbgp2ahKE7xC95UmvBOoNDLQiTLOT6hzHCsb4RfAHGH1Yb/yWgVTgniyBVqMp/+iRNxgVgFRaWiBsI/nxLKEuCyEskjeCsouEI/wkYv0aOmvC5iSK5k7V+U5X2aumX4/vWe1TA3qTfgr/LrIeu1qyODoVPKFfrJHKQlUeZmiPwwsxxTfdME3krJmPctSYu+lIH8PnD1ygSn65wcwoy/zD30WfWHcrqSRJCBx6JVWsmRL7SkHRQzKwGALJg9WEe5vRbiBK32qTON6AvQgGvOAnirau68VHx+7zFSFkn1RQoW+beX6+HEwqA1mwsW10x+K7+jUMb1ajDB7D0Bj747D+g5m3T2ix2dASlLiYjFOacoaexy2uYoYgRPin3MfhckYIoiOB9aIovTDVIvZjb/8ITvLip8nSziEfSy6ewADspGVSHE9nnzUolyIm5KFgzd8tFppnjTWGe0fPeL7L4zpYA+YnKq5WiBMnhKsYHFILKaylyIgA2rxL5Xb0g09mx3kC8o7LSyPirfsC24nHVXfRW2hDPTUooUORPd4PfkN1jMkenkiH3i69HR0MPh2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(1800799024)(376014)(18002099003)(22082099003)(6133799003)(261009223027099003)(4143699003)(5023799004)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261021133027099003)(261026135527099003)(261022105027099003)(261026130827099003)(261026140227099003)(261021130227099003)(261026121527099003)(261022075727099003)(261021123027099003)(261021121427099003)(261021135927099003)(261022115727099003)(261022113327099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uvt/u8jH79d/VIHUPdLRinqgIUWbVwBCQ4MJ/WWbcJQFid/9k94Z+hiLU2VH?=
 =?us-ascii?Q?lznhDNUwgFoPpQ6iNCaNXtVDdIhMaVIE1HgR0+nAZpqxRfhf3HNmT1yQNxsB?=
 =?us-ascii?Q?S7PFKnY52JSvOdaTePKXp2yViNdMX5NMt7aFL5FjPVJKYU6eUUzNHO1N7vRZ?=
 =?us-ascii?Q?cvzk1N93wYMhDUeJ/fBcs0z7CggJXjVYVdnuKLOybDh0mTb5Id+Nyc/BkHql?=
 =?us-ascii?Q?kjp64PxDpThwAAucU+6YF/UL7cfp8+/8behlf5W9mwiafzCc3x6qsw2cybjR?=
 =?us-ascii?Q?GtNqzzq2Lydw3JKx/eVRc9eKKRSvABuVR5kBEsKe9WplRfLI5UDwEXDExjvQ?=
 =?us-ascii?Q?hT99NG0vk9nX6CTgEK1nIFzqj1YVGVLOtkc2/Tv/gi8D7SeztM+8kasTUqCY?=
 =?us-ascii?Q?J2usZtQp+4y/5uyMMgSaRFxv3cWgXmzK7BSNnIK3Ac6Nv7echSc9aUfi4z4o?=
 =?us-ascii?Q?7IaLa3+sp9DGCHzXdRJye8jAnZFDciLFfn9nsuAvVi2z5QX/zh1/SnY7eh+h?=
 =?us-ascii?Q?zIe6OJs7iX0nryWqDTz4gRdH2kZtdqaOIZpFxgiw8YSqwiG8ewODQ8tfLupr?=
 =?us-ascii?Q?Fc2I7W7hn2mm+jUF9EqAdda3jxYPTwOsuwMXkxmu+Izy2JqRQecwsQcsvad9?=
 =?us-ascii?Q?KcLDFRSO8jRFMLSE5VM1JRXJ5AmoXpEAdMG3tx0l9n0aftbjuF8Fj6MgXX4U?=
 =?us-ascii?Q?3ew397UO37ThS9NytDXNnqLyGkoZdjA7PVnHKJLoikbbrHB7WWcAoF260Gbb?=
 =?us-ascii?Q?wRZiGCscPwi2UHU9iIv5pCzmqr2SPgA2PON96D4/6R1bE0K6jqXimJn8EikZ?=
 =?us-ascii?Q?N6xi4GbjRIoHwZa9hKlhETUT9iHnzlxoF+bYi5d5eky+TS7h8/9/IjhsNIU1?=
 =?us-ascii?Q?vy82qxckCOsAhjQLoSaRzZ9JGpnT+BVspYMFR8gQksx6XkUimS+5ZtFytN5I?=
 =?us-ascii?Q?ryQ3DlXWaAQSyaNEYzUkNzBO5cfNPIfzapLzz1RvpukaRLY2p0Nx5UfC8rDK?=
 =?us-ascii?Q?bElsnrVmIwIbIf3iIwwMPDI1YPtcnluLMKS71Uo3zZQPC8kA8iRcdQJHrdpg?=
 =?us-ascii?Q?FyWbPqzcFfZuZ41SKSh7UNUjOB8ILaxNh2X3LhyHcKnR+NVaS97Smf1S6rCw?=
 =?us-ascii?Q?YZ7YlDmuH6RVvPAmX9YGwhO51G1CHWYhwSSlNEmfcWlwHaqN0/y1H/gIeyIu?=
 =?us-ascii?Q?2MBl4J/nwm31nH93GciP5wNmu7a4gdMlpmpRLpzYp/EM3HfvhWL8F7wzMFcs?=
 =?us-ascii?Q?biOXk/zbzOPBv7ZyqFpVAT1OeVhWPd2ZlVQAWhpDKwbo95WbUUGdndSLQSpw?=
 =?us-ascii?Q?JNGy5LGEiHqy5iZIgfxfM/IUgaspjV4kP87ixWtxCoK/INESPa7KJ79L/HaH?=
 =?us-ascii?Q?l2DgivP72jsp2jkKLN/+gmbx7vSudRv4HOzuOmdij3s7hu8232flQs8Ohq0v?=
 =?us-ascii?Q?36SeJ/6r3lN8I7b7LI0580uLUgMgRZB6RhuWA+zTRcjQGdkjMBemPS2OZDJm?=
 =?us-ascii?Q?K2rp7ET9AeaX6+zVOjbESBOk25wGTL14KCH2NC1sfTqS9KwWOhRyQYWFJD0z?=
 =?us-ascii?Q?QqVszfSXimv2nNbWaHUxTLshsz9ljkFVvyQhOdkK4k/t6cKrl8KAouXFyzQl?=
 =?us-ascii?Q?wjNxPJeMp+7H81dC6u5VZTa1jxtkQDtd1DoSAzFoJxBz7tRe/wyNLdgbrFpE?=
 =?us-ascii?Q?Y1eO+/Abp0FhGuvayEiz0720VHVp5G3z3cwgncwT3Uhu9yyBv740UlvhBHWP?=
 =?us-ascii?Q?IuKV2C/CGpZsiJHRZxmgaxAZncYEgjKENvPuzLSGemlO/KejEBAl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b174b6-242d-4240-be47-08df44e155df
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 19:31:10.9803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k2Ht267I1YQaab2rbaxNgR4VIu8oYzjg50GrEGn0bN0YLFjjWl4HVlCS0n72wEvmMeSweF6DeJPuOP6bwrf1qep0UrqZc0nu+D/9+dVmHe7IhcqX+Z1OS+9/53lFf8Hw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12000

On Tue, Nov 17, 2026 at 10:51:35AM -0600, Logan Gunthorpe wrote:
> plx_dma_process_desc() and plx_dma_abort_desc() invoke the client's
> completion callback with ring_lock held. A callback that submits a new
> transfer, which is common, deadlocks taking the same lock in
> plx_dma_prep_memcpy().
>
> Copy and clear the callback and advance tail under ring_lock, then drop
> it to invoke the callback. To keep callbacks in order and ensure
> plx_dma_free_chan_resources() can't return while one is still running
> from plx_dma_remove(), serialize completion with a new complete_lock
> held across the whole loop. plx_dma_tx_status() only trylocks it, so a
> callback that polls the channel won't deadlock.
>
> Fixes: 4d3df16840a2 ("dmaengine: plx-dma: Implement descriptor submission")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/dmaengine/20260717223217.B6FBF1F000E9@smtp.kernel.org
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> ---
>  drivers/dma/plx_dma.c | 45 ++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 38 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
> index 725df770d5de..09dc44dc8f61 100644
> --- a/drivers/dma/plx_dma.c
> +++ b/drivers/dma/plx_dma.c
> @@ -108,6 +108,8 @@ struct plx_dma_dev {
>  	void __iomem *bar;
>  	struct tasklet_struct desc_task;
>
> +	/* serializes descriptor completion and callback invocation */
> +	spinlock_t complete_lock;
>  	spinlock_t ring_lock;
>  	bool ring_active;
>  	int head;
> @@ -132,12 +134,15 @@ static struct plx_dma_desc *plx_dma_get_desc(struct plx_dma_dev *plxdev, int i)
>  	return plxdev->desc_ring[i & (PLX_DMA_RING_COUNT - 1)];
>  }
>
> -static void plx_dma_process_desc(struct plx_dma_dev *plxdev)
> +static void plx_dma_process_desc_unlocked(struct plx_dma_dev *plxdev)
>  {
> +	struct dmaengine_desc_callback cb;
>  	struct dmaengine_result res;
>  	struct plx_dma_desc *desc;
>  	u32 flags;
>
> +	lockdep_assert_held(&plxdev->complete_lock);
> +
>  	spin_lock_bh(&plxdev->ring_lock);
>
>  	while (plxdev->tail != plxdev->head) {
> @@ -166,22 +171,35 @@ static void plx_dma_process_desc(struct plx_dma_dev *plxdev)
>
>  		dma_cookie_complete(&desc->txd);
>  		dma_descriptor_unmap(&desc->txd);
> -		dmaengine_desc_get_callback_invoke(&desc->txd, &res);
> +		dmaengine_desc_get_callback(&desc->txd, &cb);
>  		desc->txd.callback = NULL;
>  		desc->txd.callback_result = NULL;
> -
>  		plxdev->tail++;
> +
> +		spin_unlock_bh(&plxdev->ring_lock);
> +		dmaengine_desc_callback_invoke(&cb, &res);

Common method is slice to local complete queue in ring_lock. Then unlock
ring_lock after while loop. Then invoke cb in complete queue.

Frank

> +		spin_lock_bh(&plxdev->ring_lock);
>  	}
>
>  	spin_unlock_bh(&plxdev->ring_lock);
>  }
>
> +static void plx_dma_process_desc(struct plx_dma_dev *plxdev)
> +{
> +	spin_lock_bh(&plxdev->complete_lock);
> +	plx_dma_process_desc_unlocked(plxdev);
> +	spin_unlock_bh(&plxdev->complete_lock);
> +}
> +
>  static void plx_dma_abort_desc(struct plx_dma_dev *plxdev)
>  {
> +	struct dmaengine_desc_callback cb;
>  	struct dmaengine_result res;
>  	struct plx_dma_desc *desc;
>
> -	plx_dma_process_desc(plxdev);
> +	spin_lock_bh(&plxdev->complete_lock);
> +
> +	plx_dma_process_desc_unlocked(plxdev);
>
>  	spin_lock_bh(&plxdev->ring_lock);
>
> @@ -193,14 +211,18 @@ static void plx_dma_abort_desc(struct plx_dma_dev *plxdev)
>
>  		dma_cookie_complete(&desc->txd);
>  		dma_descriptor_unmap(&desc->txd);
> -		dmaengine_desc_get_callback_invoke(&desc->txd, &res);
> +		dmaengine_desc_get_callback(&desc->txd, &cb);
>  		desc->txd.callback = NULL;
>  		desc->txd.callback_result = NULL;
> -
>  		plxdev->tail++;
> +
> +		spin_unlock_bh(&plxdev->ring_lock);
> +		dmaengine_desc_callback_invoke(&cb, &res);
> +		spin_lock_bh(&plxdev->ring_lock);
>  	}
>
>  	spin_unlock_bh(&plxdev->ring_lock);
> +	spin_unlock_bh(&plxdev->complete_lock);
>  }
>
>  static void __plx_dma_stop(struct plx_dma_dev *plxdev)
> @@ -337,7 +359,15 @@ static enum dma_status plx_dma_tx_status(struct dma_chan *chan,
>  	if (ret == DMA_COMPLETE)
>  		return ret;
>
> -	plx_dma_process_desc(plxdev);
> +	/*
> +	 * If another context is already completing descriptors (possibly
> +	 * a callback on this CPU that is polling the channel), let it
> +	 * finish rather than waiting on it.
> +	 */
> +	if (spin_trylock_bh(&plxdev->complete_lock)) {
> +		plx_dma_process_desc_unlocked(plxdev);
> +		spin_unlock_bh(&plxdev->complete_lock);
> +	}
>
>  	return dma_cookie_status(chan, cookie, txstate);
>  }
> @@ -516,6 +546,7 @@ static int plx_dma_create(struct pci_dev *pdev)
>  	if (!plxdev)
>  		return -ENOMEM;
>
> +	spin_lock_init(&plxdev->complete_lock);
>  	spin_lock_init(&plxdev->ring_lock);
>  	tasklet_setup(&plxdev->desc_task, plx_dma_desc_task);
>
> --
> 2.47.3
>
