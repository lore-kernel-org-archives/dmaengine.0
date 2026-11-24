Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795548049;
	b=Lk4tnRIk/P+X0m3NEbgkaxif+vca2Xcnkd7Ea2mRCdceVUJsaFNQWYS7KS3JTRCKU0rh
	 68t36cXUz8o7xGBJ5gGUKwsVkuEx28h7Hf6+KvezoFNRNvpLTy008GfGqYSUgiW1k73eU
	 FsOCkOhPBu3n++H8N6zi8kIdPMLDxHKjJ1cYieiQ+4oVr7dRlcNYmEZXgPxZ/7w2YeWUR
	 VUiLoj0vf4UFTcH59jS4HcN1ZVZjZMadtEZXH6N+OWoIA/lASNxm3NhIvJvFUGWQQaPm1
	 bFGKC+WJVNmWiV/RhZ47cy0vir6kapXxG7DQJe3LsUn/6kDKHLCT+pojJoOUciVpOwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795548049;
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
	bh=UUX283FTJ3Eit9xaeTKCL9fIV7FQ1ssXq/6S784oV/U=;
	b=jop16zcCkGhOi5YbdoOPzTV9LMHWkOBSZt0WPBqkZdcXhUYuCYKPmSwd4OuJD++0fXjQ
	 +ZxjcVlP1MeJvHiy/wpTdPuDIsWQOexsugLhheMQAHIWz2B43HQQwvQ7Mt5fPGMCJce4B
	 kltkxr1SRW+5+ytjCSsXcpgO0i1EWa+p80hCXXI5iSoP7GB8eqlu9E0Zp1qqRsuBYFMur
	 CuK+//1sjy8iuXNVn8sxrL76rK7YeSQDmTlP33Z+RHGxFkjCxcECgwkY18z8FNAf2SbfM
	 NS+T9ZL9G2R6ASx9Hk113wOF3iY/u3BXa7slagKa+XxKViXgpzyXCYwMj6nwB3ATzqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=jxoOJYul;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.24
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012024.outbound.protection.outlook.com [52.101.66.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56FC606A31E;
	Tue, 24 Nov 2026 19:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E56FC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=jxoOJYul
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RR1YM9OGV4GcbpqppUnwCcFKKbnh5hENBNQ1iwwkr1GYjMC5soN4FLy1TPZN8iNyoS8ofFMANjRNiB5Ga6cegDHr0OVo54h6vRJSKi4YlQn9er20FXS3BcXVwvDFQwjCAlT0FjDerZUfQ6/NqxREagFhzygn7IasVqhAy/NhO3uM502uLBxZ7M2dWPpTBvKuEFN5JFm4IiEdex2mOnjkBETF5qudTG/QIbaJhFCbSW8QPwfnmIMqFSPwZRj/sHRSvLJdtSf7bVikXGJN2/8z8jML0rJabJluJxHDFKNGmz1MzM2K8sXPps1GpP2QetD+al6HR7+O/YSeB/r8vSwoow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UUX283FTJ3Eit9xaeTKCL9fIV7FQ1ssXq/6S784oV/U=;
 b=VqN5wsn1YWwr+5IswyO7GigDPwvvkSAbASEBNGxlptDjS0ARpoq6eecSGRHHKCPUImW23h59kZleY6Vb+ItUNl/3gcqU7rS/6i1wPgNNEaLR4oYfBt8wsbC7WwzBHOaIyjRES1XaH7L+TKtSC8KESuoOBj8+bGibXDCvX9HCeP0IOUoyTXWMJZvtihrinGXlxFfqLLeokD3zVT7udi38JDZ22GFOWzunmU+5on3FXqSpCxVbdCKV+/uuqUCOAQFR1bae6B0fBrOKwGtQq6SIrw5kI/D7INsAqs0KLRHPKc9uKmGvmdoSrmTxXZOc/liO3CkCKp8G/QckSU2wcsIbCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUX283FTJ3Eit9xaeTKCL9fIV7FQ1ssXq/6S784oV/U=;
 b=jxoOJYulTLaQ+9U0jwsVIhHAmk08YP4rxgv5o/YOuEQ23WFSidCM+6rZI9rhgEsrhzp5i6YBkJ3EHNAxRUOtXq1wORnPP/plFSu/RM4fDzvb0DWEPCVMhq4K+42i/uUMyn9NHWEHPh2S8Nn8+6Sjg4N6/aRtphxB0cItld4mMd31ZBdZu2UNFuQq9M3wkWZgVYamBaWX96WnzE+rtqI9C0MQlkS4m63TgpsA7ED8mSwYEB24XdaNNtRdtgRHF15f7xMBpOpLw74gBKj3OnSFk/VnY5J8+wVEZFO38UtIhAt8n+EAmAjg1ONU4iUESUgOtT6sw7zMlx223P8oZNh0fQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS8PR04MB8755.eurprd04.prod.outlook.com (2603:10a6:20b:42e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 19:20:42 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Tue, 24 Nov 2026
 19:20:42 +0000
Date: Tue, 24 Nov 2026 14:20:32 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/28] dmaengine: bcm2835: Add support for per-channel
 flags
Message-ID: <awXjgCtgR5wtadnb@lizhi-Precision-Tower-5810>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-3-andrea.porta@suse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123145728.29082-3-andrea.porta@suse.com>
X-ClientProxiedBy: PH7PR10CA0008.namprd10.prod.outlook.com
 (2603:10b6:510:23d::14) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS8PR04MB8755:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f753dbd-6d10-4087-201d-08df4a60083a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|19092799006|7416014|376014|1800799024|261102123227099003|4143699003|10067099003|56012099006|11063799006|261022105027099003|261028144727099003|261021121427099003|261021135927099003|261026140227099003|261021123027099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	f5V2EE16bLA9d+R1tNgyqSxUuwQXAynyebp206IuWvg5LERIdSwM26EhDc4kBrwfB39W9JXj67cns1ROu6Gk9RDxg2G88yIm88xg8YnCXzzQTd6EKmIfi+ybySiGh3pFttENcH9EDYpHB2qLXiBE1QO/bDGAeqjy4hJM2krtXgOCIAVEOkkuEECCPGl5id1lmVNAvuZES1oMZTyJAGrShdR3l3rhgI6AGNl7ARu+ebY3gcG4MBTN+18RNU9OKZXU19nrHh0xXiQL1+lTN6+JtyP7FaN/TKN7utDlYC/q2Q00vRCu4KuY5Xv/vYblVLfiMZei0YisJNrIL4MyCEd3gBYdDzW2aWdFNL2PCmMovW2P0wUO3hqyv+gQB6sI0KIPmiMeM/eP3nLddgI7Go3aZeNXdZF8u0pGlHyjjySYLJfs1/T4z5zUJWsuve4yWTT74l2OlV+clV/UAn43QrOCPydNqrIQTZj/xkOKqQmo4ouQ22d5bgrlG/jiH7p7eMXzz5L6SHtBohT7HWMCPfVrtHicEjXCBc6jelU+aFsqoFAmiJ0Q5lLSvXQC8HzbooToWj7yfIXnzaxQDi62x3XmT3O0VMSyWp57AZJ5qniUCsJraWwOHd4mm0nt1w4M1gG5fGy83rI/HHILstXMmp6NZJr0cPYJgWjR/7WwBwvN35E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(7416014)(376014)(1800799024)(261102123227099003)(4143699003)(10067099003)(56012099006)(11063799006)(261022105027099003)(261028144727099003)(261021121427099003)(261021135927099003)(261026140227099003)(261021123027099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NiYTwTZw6fVmdh91Nt2mZsp1clUFllVAAMkGi6gXFlqiVIbJP5dxJwrOyW5t?=
 =?us-ascii?Q?9Psyv+Q3EQeDtQUbySfxNUVH+1rQ8YNnGRsL+Xdr5ZZhBmNWusGfO8ademhX?=
 =?us-ascii?Q?KAdujNJ0zQ05RDvo138rOiAt9KtdWi31HM6CIy9H91oQw8STBwR/M7CRd3LJ?=
 =?us-ascii?Q?W41jJBIUHeV8I5vnJmn+SpqttEvwwehlwdFqxQOwtTT02Kcjgq9qvH4PDITm?=
 =?us-ascii?Q?2GpTAmu8jI3+wkc9J+2o3diu3IaKoN/L65wnlOXHpYSQ5OLtj8I/RdsxGDcP?=
 =?us-ascii?Q?kA6xf9Z6g3QSOBW/irddjsBgliV0gBglCMCbwFJW1QlGIBxfb7K3zX5wk+k7?=
 =?us-ascii?Q?rLIhfE0FkVt2ln1euaXo83UpoB/OV5ta7nxzW78YRwjSrLWC9XMRkFxrebv8?=
 =?us-ascii?Q?r60RwSb5gHm7f7ncx9xRflDjEgCYnybO7a/VZuPHBJjqH+TIUc3rPoCRL6Q3?=
 =?us-ascii?Q?syPUQemuqqHZd49VC1TUHIDU/rYu0C+cfT1ufry3AexuMSdrxKHYCpVyvTtV?=
 =?us-ascii?Q?NEns8NJ1wRaChp3R05t7u6cDJWPjS87I0IYB9cX72EuFZ1YuVFwrXac1zYoO?=
 =?us-ascii?Q?Lz72RhhHih5UsXl37tALEhRo2a85vXN8ZHdOirjCFcLjdPsSUy9wSftwTJbN?=
 =?us-ascii?Q?XnEn8HHjsSDqT/UeL/z2/x85jDRYElVu7bKBufXtOf7pVNc7Sv/JOwilNuxn?=
 =?us-ascii?Q?0ATc/u0IlHhIpwY8fD0jg/2jNTUHbvGa2K9FEWD26TQzzs3yjT32JsbyzTL2?=
 =?us-ascii?Q?tEm5L+dxlPYzNKfVeFnJByY5h9HGijfArHJcZ/fJGttxdqKlANe/KqB5dilD?=
 =?us-ascii?Q?YeNH1rSztiHTRQBexltiUYn/PMCUWL+Lv1n/A8csacODXiKyQEjka6NoccUm?=
 =?us-ascii?Q?PnjF1x7V9ax5GZ/G11OuhEVj070RbKiAj1HtaCeKO1I+o9MA04vvS5PJS62k?=
 =?us-ascii?Q?j3egRcRmsTPM6kDwFZSD9xhpgVAmQwoixzPlsu4zBZU4mZUdopaaBp6hpqxb?=
 =?us-ascii?Q?BrUs+dBwbqmLB7SK19VJIWN+nLK+WQNo6QZLQq7an8UHg3tIBcgzopQ/zu+X?=
 =?us-ascii?Q?wDbv9ymstRlWNtQBzdOz/CKnL7TKWqfmR17c9lV5nFtsEHMKixRleqjt+Woa?=
 =?us-ascii?Q?vYMxwgbMl8AydHfzHzrUhS1/4y5JsAzjOnxSVxEYjs+vKQdELfq5AGKQqvao?=
 =?us-ascii?Q?sdCroVeHoa2yMSYo7418bu83vZTX6kAdjvIJkefzkl9Vs0nmD1j87DCgxIoR?=
 =?us-ascii?Q?+3mckZg8yncMYppaNZ/ztANzTkQMVea3vnHtkhUDfb4UC8T09fMh2KTV058X?=
 =?us-ascii?Q?6pf8bcgZVljUB8gxjqwSx12hteUiqhLkBi+LYjyv8/qspA7AKKeyABA0whcK?=
 =?us-ascii?Q?Pp07VQtTeIVBQSx51j+C+mqgRR+m0xhlmocU2SVnU4i3eM4R6Z1XQ2/Z1yQz?=
 =?us-ascii?Q?fTUK1xsCNmZKsIOfLLmphywwNfyOy5GUXZDq2viKZVq6w6aAZcXvzLbVohwk?=
 =?us-ascii?Q?iiguqvx38sfUe+3yMtycWHNQGLEaidm/n3nlm2gGk42aj70tWE021RRWUgxs?=
 =?us-ascii?Q?A0akN7iZY1tSfW+04S58OASgaVZSADR0IqLh8Zwnq5RcI7uvO5V7Y+vzmWIE?=
 =?us-ascii?Q?kk3XATfSHzUyst7UCqe3ttJ7s2tU4LuJ0fvXZXiQtoGuoDQ9U5cGfpJsy9LC?=
 =?us-ascii?Q?mof9gczx1n+G0J9D+M3QuZ6rAdhHMezonvxYeqPYDYMxSWJVJEMpceShs+vU?=
 =?us-ascii?Q?tP6MiFCSu9br57lTWoFxbw8XLUBr1O73mKiquJQjOFOwppiFYorC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f753dbd-6d10-4087-201d-08df4a60083a
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 19:20:42.6032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XKxIROcJvepVlAJNVFD29uHYclBhhGvYIGh5gCOmviEerItFm6Edg59sBOCeKRKM+sWTQGda86IKJdC241fGo4725g3/jLX3gH5Vn/a2f8yLAekiL51w1hB8JmeDwOIx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8755

On Mon, Nov 23, 2026 at 03:56:40PM +0100, Andrea della Porta wrote:
> From: Phil Elwell <phil@raspberrypi.org>
>
> Add the ability to interpret the high bits of the dreq specifier as
> flags to be included in the DMA_CS register. The motivation for this
> change is the ability to set the DISDEBUG flag for SD card transfers
> to avoid corruption when using the VPU debugger.
>
> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  drivers/dma/bcm2835-dma.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> index b19182c6e3df..690f5ba1c439 100644
> --- a/drivers/dma/bcm2835-dma.c
> +++ b/drivers/dma/bcm2835-dma.c
> @@ -137,6 +137,10 @@ struct bcm2835_desc {
>  #define BCM2835_DMA_S_DREQ	BIT(10) /* enable SREQ for source */
>  #define BCM2835_DMA_S_IGNORE	BIT(11) /* ignore source reads - read 0 */
>  #define BCM2835_DMA_BURST_LENGTH(x) (((x) & 15) << 12)
> +#define BCM2835_DMA_CS_FLAGS(x) ((x) & (BCM2835_DMA_PRIORITY(15) | \
> +				      BCM2835_DMA_PANIC_PRIORITY(15) | \
> +				      BCM2835_DMA_WAIT_FOR_WRITES | \

Your commit message said "ability to set the DISDEBUG flag", why need
other flags here?

Frank

> +				      BCM2835_DMA_DIS_DEBUG))
>  #define BCM2835_DMA_PER_MAP(x)	(((x) & 31) << 16) /* REQ source */
>  #define BCM2835_DMA_WAIT(x)	(((x) & 31) << 21) /* add DMA-wait cycles */
>  #define BCM2835_DMA_NO_WIDE_BURSTS BIT(26) /* no 2 beat write bursts */
> @@ -433,7 +437,8 @@ static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
>  	c->desc = to_bcm2835_dma_desc(&vd->tx);
>
>  	writel(c->desc->cb_list[0].paddr, c->chan_base + BCM2835_DMA_ADDR);
> -	writel(BCM2835_DMA_ACTIVE, c->chan_base + BCM2835_DMA_CS);
> +	writel(BCM2835_DMA_ACTIVE | BCM2835_DMA_CS_FLAGS(c->dreq),
> +	       c->chan_base + BCM2835_DMA_CS);
>  }
>
>  static irqreturn_t bcm2835_dma_callback(int irq, void *data)
> @@ -460,7 +465,8 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
>  	 * if this IRQ handler is threaded.) If the channel is finished, it
>  	 * will remain idle despite the ACTIVE flag being set.
>  	 */
> -	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE,
> +	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE |
> +	       BCM2835_DMA_CS_FLAGS(c->dreq),
>  	       c->chan_base + BCM2835_DMA_CS);
>
>  	d = c->desc;
> --
> 2.51.0
>
