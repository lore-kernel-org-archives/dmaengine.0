Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795548498;
	b=I8PBADZSf8B/R/e4xnsT/nFqP8eEDR8J3RKpFOxI4tE/kOm+lfIzRyRmk/yaqmIerR1R
	 GdJ8OQTxe6YGs8U/Qj8s/nacILhWrTuqox98j8EOLhSafjyx6mNYFX30AuE6JxtJxfBPJ
	 o0xTAjovHqq+xkkVaGZPi8i/e5csvuVcEM7fYTzXOFgddz7v+cxHo6j5HA54TONrEltt9
	 InrJPrSO3rgYaauFJbat9/GfNdYYPJJpsCq1LeWjt62LakigXenL8f6paiIHC0OmFlEmx
	 QQxeY7KWXzkVqG6bPE/tWMiiQMKGr9eNAb0DA2sJky6I/bT3io57WcBVlKE7xxpbl+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795548498;
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
	bh=jurOvTIfwj1DacQ6hf2SxDRcWNzzHaqnF8zsmGxt5CA=;
	b=jXx7g0DH7ZaG0c/eMGZwMseA01jmN6hI+fjtg797C/3QznMJfqIhAfzGF6nGGk3ze0Sp
	 8LDIpoI4KSjoVKtbrt+F4mLyuPl1W/4H53G6PMjBfywSqi5rGPjuxT/tRro8YkdJJm69Q
	 7woSXm4g+71NWvhcWKs3ZY2KsAiKL+MAzy+fSUrHVXqNe9U5rlfV1YiTZqLJL6n6oOdWo
	 bodywJcE+ZOILwjzvHU71Jt9sXDcjIqhX/nYRTWUAc8dNd3UIB81jynHPyxRJXpT+qN15
	 XICOD2ov6QVwYroNrWJNJIWZenMvZLUlZw3A276rWDmotHdRAMGU4tDOX8785A0OdYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=CnVIU7Rp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.71
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012071.outbound.protection.outlook.com [52.101.66.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE33606A31E;
	Tue, 24 Nov 2026 19:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EE33606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=CnVIU7Rp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jwyQYjV0Qb6l37j9AKqWTsLQZgVtahR8zYzZRFu/4y6gUklOBbMwt9uMzTQgjgmq4kBapIbgCXI5N3MQNZF1u4c8IUwaUjd7lbqOZiWlouFpujqhENxIwj7vUcGSsM9N8RrO1FUMeW4ictB3R0GAhMccKkZ80kEXqaBbPAGCY/glT7QrDxp3uI0oP8CC/CAMzfh97jY12iJCk69q2NyHT6pFwc0wHHtFBTFxDx5qhLlDh8BS2OBgv0jc31MIrW0F9zLiEfy0P2fSKIAWdoOF6MG9YoYGfsVzcbGnq5h9cAo1e/AK2FnhSPHkoZJ21rs10UJRPaF2jIa8x5/jgmE6VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jurOvTIfwj1DacQ6hf2SxDRcWNzzHaqnF8zsmGxt5CA=;
 b=WW4So7nsYlIToMzyfUQLMQai+/qcvrWFS4a6Jcinimfux6s8zr4zjkuI93CE7sxJtEaTvjtd5TtkZb0j/91+Nm7+qQhlJptNqTyTzanQ1THXNaMv+oROZCiemyEyrEaun8ULGvmkMzaSNk8Z7sSC6nD48ztgjuTG5yaZAjQAZyTRyoNlIxf49GzZ0apHjr+acjmSq1jg9pWqA5egCnuklHhft+qZ64yh4yRLmGthpsqj9hiDQB2woaOit5q2FEvdDKYMKN/uHuWvM3wmhB0Ax5G+mFG2Dhqc8gKHIeWB4MppvZHB8FTfsZA95wz/QCvB67xVnluSf3++KE390j6eAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jurOvTIfwj1DacQ6hf2SxDRcWNzzHaqnF8zsmGxt5CA=;
 b=CnVIU7Rp3dgQiQmqeFSrwOWx3yhWRqcwoie9bo6GfLEvisI6OyU7hp3g5RUxG0LmsQieS5FairlWvVTVKI77HxOgqHOi5xUEN7LPIVUdqYB3cKKCkSC+u+bFfUW3Wblfg3JvIqRmlKMPL6QBaEPP0DOiZkJpcpBGE9TZKqN2nhqlDAZxs52HMcL620KwB/ZxL80OmtzBDhU6oxrnMADZZYZMRSCgmSrYdK+XEP645ryWHw6HJYWnjLr/3uTY24u2mUBdyawOvvLYtgctscBtT7Kaas4FuSxVjWzevAo+1ySWx91vWjRGhyrgmj51u4049C3qwEib+N3VBStL8szPdA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB8430.eurprd04.prod.outlook.com (2603:10a6:10:24f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 19:28:14 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Tue, 24 Nov 2026
 19:28:14 +0000
Date: Tue, 24 Nov 2026 14:28:07 -0500
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
Subject: Re: [PATCH v3 03/28] dmaengine: bcm2835: Add NO_WAIT_RESP,
 DMA_WIDE_SOURCE and DMA_WIDE_DEST flag
Message-ID: <awXlR5RAVl8XMVxA@lizhi-Precision-Tower-5810>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-4-andrea.porta@suse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123145728.29082-4-andrea.porta@suse.com>
X-ClientProxiedBy: CPBP307CA0017.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:2::13) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: 129b296b-68b8-4fb6-fd77-08df4a6115bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|23010399003|18002099003|22082099003|261009223027099003|261021133027099003|261021130227099003|261021123027099003|261021121427099003|261021135927099003|261026130827099003|261026140227099003|261102123227099003|261022105027099003|261026121527099003|261022115727099003|261026135527099003|261022113327099003|261022075727099003|261028144727099003|56012099006|4143699003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	KOY4EIxQxgm2IjfbiWBTJbX5CzHeD0tOQq+1SuBHZ5MNAjiBt7XRxR/W7Qkmt2xoUvTiRLFeLF1P996QfLcfybtSiVYUhC8FuOcoKrAvPhsQUcgON7NrCB4fZ5ulyySlQ5UgEDrEQClQ1xdmWybtAthCliURsab+ENhFnMYBXP+WFmZW7qSi0d7kIEcU5w2akv+dlT6M784tHns0UO+ta6m6kCJoqrQZjPNodYuX+fDqe3qU49+WF5D81mD+nSezZAtXcMDI/feA41QVxqAqYKExNpqZP/XJ8Ce1YvmpSp3GnWSMg0pzNJmDFDOs9DnM2azzp8SajvNfwiV5+o6J1s+eaxivDfl5FQgqMGbYgengCxq5mtMLBKsz+w9zluutRBETeRefAPExuG3BkQe4gIeZx2eODwB2WUl53tfcOX2tLHM75PXv5+Ld+KMewEm5apXXabsq87m84mK6rdgFxDmGeMI5ZTgsjxub3UFPH7RyE++2hqKiYt/Qe+p1+uP+vZgwDG9doPpZjBhd2ayiYLs95PCydwVc05eqmuVGl2lC+dlLyCg9VlNAzkl9JjlhaePfHz0mfP6GVBs/4FLLpWAQe0Bank1ufpuGKv9NGfqKnJp8Oxz460W9lo5umLEscwJuoIOnrNsrvbI6OFy43wA7/q/RGrxuDQ1Kj/P/AFM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(23010399003)(18002099003)(22082099003)(261009223027099003)(261021133027099003)(261021130227099003)(261021123027099003)(261021121427099003)(261021135927099003)(261026130827099003)(261026140227099003)(261102123227099003)(261022105027099003)(261026121527099003)(261022115727099003)(261026135527099003)(261022113327099003)(261022075727099003)(261028144727099003)(56012099006)(4143699003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z3SkXdNZnQ6duPdPhtSi5dAnM8rbio8O/tAAp6WHESJHhkSoFFdfdCdfc0zF?=
 =?us-ascii?Q?z7N3foDuuIjeWaVDvVmDtP4mwxjDk6z8TQWXCMuQOqb8Aya9oIPNpw4BfQ3l?=
 =?us-ascii?Q?NPkmcIvM/gCmEd7EitxsImeE17sIOYI+rb09xY+Hg8uo/QNiG7t/vytux7s1?=
 =?us-ascii?Q?N9CWCKUg/DSnlMLnabMWCW4vqp2h5Aw4xkWhS7XZRXGWrP40g8/UajU42g+D?=
 =?us-ascii?Q?N68FwHntZRltTP+5/vG6ou9I2uVdMhceYcQUO/xA+4MKdw3FsLQPU12uWRaH?=
 =?us-ascii?Q?wLaR7IeN/oWYUZky8YLaFpOlH3u706T+UaMSfVrVRhQ9C9jfrFnQLHoYV7e7?=
 =?us-ascii?Q?XTVGXfXwDpgKsf/jnukqSmWkK7wzA2lA3ldvE3dZ7hR8ahPEDWK3Qy1Hp7FA?=
 =?us-ascii?Q?kJNMqir5e+/IG1cN3aHIkStRU0YCxMTp8MueKV6vCO/iZ4Tuc3lhmn53CcmT?=
 =?us-ascii?Q?zSDuC8e0I6c436R/mn8WNzWGBSuTZ9iKx8+1VUWBM2IYSGytowYHTS2FmRBM?=
 =?us-ascii?Q?HprwwowcMgQJ9TQru5sBU6nV/XCULIjZn6sbOYjnNosXz1cLC2CGmZyDgW0X?=
 =?us-ascii?Q?7uKluP9JiE4x8za/gFOHUyGLIeY0VlR3owXEuwcASS/ocSGYF1BQRWcO1ThX?=
 =?us-ascii?Q?lrQq3uWHlZctI2F45/gQVjICg39DiZ/wUnNb9j6l2Jaypk8iltICpdQMyL5M?=
 =?us-ascii?Q?LjETwTQlcYf9IOKBuNlJ0KXfCyEoGAfqWeaf2CCfw0q2Q/YVU+pLtOaIm7FQ?=
 =?us-ascii?Q?aPpYcYYSnY7ninWaUJmKmZOytMoKAOdmr7BCpoNSItl0aHArLxQaYQhIVtgV?=
 =?us-ascii?Q?IG/bgayiIwLPp8ZAxp+y50gP13/Zr6UkjjCzHUGQC7sd67ViKPAIvRaCO93K?=
 =?us-ascii?Q?05KDUQQLZ5WydL7O4o7sGjfPZAnEJW83+/DFTL1kYgRE78HTRlIBoA5Gj0+J?=
 =?us-ascii?Q?Kjvs6WTZaxf3RsAsF2h+iEjovEN0t4LlaHezyj8r2ZjAfJS1YgybjsYqsgzv?=
 =?us-ascii?Q?KFGHf/6D5K+kyPvooeJvSwG6b+v3xgSL3iCMw69I14j8Eu+EAmUNILLoLEXm?=
 =?us-ascii?Q?EQ5qWT9uo41MPYsYFHM/r0QPbkWb4bBhOX8QVk3E7HoXUT6vHxL2vj4iiLSO?=
 =?us-ascii?Q?+HjlpKRNLwUJRrDBJBCOFHqzaMnnOQN1E7j10vew38xgr9bJU8Vn1IyNsqN/?=
 =?us-ascii?Q?85iyx/V9rxezdm4dPT7KLEhAjcupn9Tw/acAJMx0gQjL0Y2xzxExxKyz1lYp?=
 =?us-ascii?Q?Cnjrm09oXJZKcP2HdFl9lKtVhc3DBHYCs4PdvZTdxwKCq+F8y3fipT44dw08?=
 =?us-ascii?Q?3TJ6g2ZKkKYEiFwWpTiHH5EPdt4S77+5XYH/mveeMfkPqw3Aef696zv1ZzTa?=
 =?us-ascii?Q?oygPCb8BUncau/O5kMbBItsE1EWqpLVPcXXN8G0kXQjdkKe0Tmxr9vFxJGRL?=
 =?us-ascii?Q?IMZUpYejA7bv/9+yfxl0IPcgGhFYLs2tui7/coWRJt7xIGLSrC+7KK7k6g9/?=
 =?us-ascii?Q?OptVZeRx2QaAvEufOfxCr6xhLhOtPGOKTp24eu5NbA4Ij2hvTfjQRRh274q2?=
 =?us-ascii?Q?WiJPHMWYMD/nIPJnkUpeUl9OrKn/uh2H41ZFnh2dVAFbSaSjAVj6uSDnT8JE?=
 =?us-ascii?Q?cER1DCFHy071sfQslWknJLcSZpTA3s7Qd8HiIpGKrkHiaeek+0Vh2/gwY3sz?=
 =?us-ascii?Q?uw9iQOeCZiEe+Zykh11cvjCkMws0iM32EiPKerYKUIh/rioE8P0rysdab1FK?=
 =?us-ascii?Q?yzT60hOyY9IwcSbciqRa0MluE0kBz089zEMvL6lY55RFFRvq7kYw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 129b296b-68b8-4fb6-fd77-08df4a6115bb
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 19:28:14.7481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6KQvXLzEznOVrnEaVixblbC4wGpYtDuy16z8yC1nYaahKsyZdNFO/SGKGlMMQB8AlhmSFba30EK59+Mz3s+kogww3PAJ5xBLvr8DAZxyDdlzb29uklJIxnclAxOgIQXu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8430

On Mon, Nov 23, 2026 at 03:56:41PM +0100, Andrea della Porta wrote:
> From: Phil Elwell <phil@raspberrypi.com>
>
> Use bit 27 of the dreq value (the second cell of the DT DMA descriptor)
> to request that the WAIT_RESP bit is not set.
>
> Use (reserved) bits 24 and 25 of the dreq value
> (the second cell of the DT DMA descriptor) to request
> that wide source reads or wide dest writes are required
>
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  drivers/dma/bcm2835-dma.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> index 690f5ba1c439..118ba2f71dc8 100644
> --- a/drivers/dma/bcm2835-dma.c
> +++ b/drivers/dma/bcm2835-dma.c
> @@ -145,6 +145,21 @@ struct bcm2835_desc {
>  #define BCM2835_DMA_WAIT(x)	(((x) & 31) << 21) /* add DMA-wait cycles */
>  #define BCM2835_DMA_NO_WIDE_BURSTS BIT(26) /* no 2 beat write bursts */
>
> +/* A fake bit to request that the driver doesn't set the WAIT_RESP bit. */
> +#define BCM2835_DMA_NO_WAIT_RESP BIT(27)
> +#define WAIT_RESP(x) (((x) & BCM2835_DMA_NO_WAIT_RESP) ? \
> +		      0 : BCM2835_DMA_WAIT_RESP)
> +

why need recorder these information at in hardware control block if it
is reserved by hardware?

Frank

> +/* A fake bit to request that the driver requires wide reads */
> +#define BCM2835_DMA_WIDE_SOURCE BIT(24)
> +#define WIDE_SOURCE(x) (((x) & BCM2835_DMA_WIDE_SOURCE) ? \
> +		      BCM2835_DMA_S_WIDTH : 0)
> +
> +/* A fake bit to request that the driver requires wide writes */
> +#define BCM2835_DMA_WIDE_DEST BIT(25)
> +#define WIDE_DEST(x) (((x) & BCM2835_DMA_WIDE_DEST) ? \
> +		      BCM2835_DMA_D_WIDTH : 0)
> +
>  /* debug register bits */
>  #define BCM2835_DMA_DEBUG_LAST_NOT_SET_ERR	BIT(0)
>  #define BCM2835_DMA_DEBUG_FIFO_ERR		BIT(1)
> @@ -605,8 +620,9 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
>  {
>  	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
>  	struct bcm2835_desc *d;
> -	u32 info = BCM2835_DMA_D_INC | BCM2835_DMA_S_INC;
> -	u32 extra = BCM2835_DMA_INT_EN | BCM2835_DMA_WAIT_RESP;
> +	u32 info = BCM2835_DMA_D_INC | BCM2835_DMA_S_INC |
> +		   WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
> +	u32 extra = BCM2835_DMA_INT_EN;
>  	size_t max_len = bcm2835_dma_max_frame_length(c);
>  	size_t frames;
>
> @@ -636,7 +652,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
>  	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
>  	struct bcm2835_desc *d;
>  	dma_addr_t src = 0, dst = 0;
> -	u32 info = BCM2835_DMA_WAIT_RESP;
> +	u32 info = WAIT_RESP(c->dreq) |
> +		   WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
>  	u32 extra = BCM2835_DMA_INT_EN;
>  	size_t frames;
>
> @@ -688,7 +705,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
>  	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
>  	struct bcm2835_desc *d;
>  	dma_addr_t src, dst;
> -	u32 info = BCM2835_DMA_WAIT_RESP;
> +	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
>  	u32 extra = 0;
>  	size_t max_len = bcm2835_dma_max_frame_length(c);
>  	size_t frames;
> --
> 2.51.0
>
