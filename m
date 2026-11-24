Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795549201;
	b=Em+CvHd4sO5eIwaMN0KjT+jurpxHM+xHrVby1Rbqv4ICHTZtCpYw9uwZ5Pd4OF+M5F/P
	 lWNiQ2VzkfagYV4eV0308IKG3m5O5iqToF6SSDE98pimkfFojTetfm80uwII2c/BEArnU
	 C0NNvjIcNW75l2BiZGE7dEb9FFUaY+VLEVBfvEs25l6rTKEexaw6fbPE6FPAH0jjTPbu8
	 rv0Gc5WDQiC28w/hs7+VY2z1UEoSO1OyJonN0bmejn34u8IH3L160XHG43yvFza+6ERxD
	 ddWXUC1M3sbMBh62EtZyOCClDqD6q7IumJfZey4FomYH4EWolmW9JEdW7ECBghBRznQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549201;
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
	bh=zaef8mz71ctWnLNnuos221O8qcYMWVjUMciwRjPURmc=;
	b=vXVZcZd2/P8zroNQ236FAFXwX9Ic4P/ykuB2ohlMF8CoJ7JOvFqOuAqN3Qaexfrjb4ia
	 pNWgl8A3ECYPe+3+FB1mnBu13S4w+QmWYQHHTZa4W2t2anp9RCCP5UbRbHJ4rGBesnT8p
	 tczCT3Lz6f/A7OC1Mds11PtNBCRrvxPzMm7eSTlP/SdlgGiZCArhm6qybk/4cPga5+9zd
	 Su0RTFZ9OWH7i56VFj7OeF40unYmE9XR+KJyRDRnjvks3aMXwiUPvK7ODhAQpwgr+sFvB
	 aTK2yYBroJQ1d86zO3JlHlx2giX2Ot99Np9FC0lcB6lSoV+kRDrpVkt58pCkjl/xjqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=lJPu6rW7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.8
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013008.outbound.protection.outlook.com [52.101.83.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C4F606A321;
	Tue, 24 Nov 2026 19:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81C4F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=lJPu6rW7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDHSlbXlBC8prej9il+MbH+LicRjtLs9k5T/Pdyp5v93bonesgdSqvswwcrbXKRQMrJSrdiDoUf1PYeEW6e0lpxXSfKw/GDSRuZwUWz62GIkFzKSbh6cEXI/plBifjbwOv6RvLncxzT1sIeZFLG5sIe00cSybdFANXVDkWl8rbcSp+A8uK9gJ6HGIOvx912lixdEFNH2SDv0YVXwIcR0p5/rAOMfkQSHNmu4G2v74hftWjPcJ5rttoh5H2DjPE6A8HbBYbNs7vpUhO6TWMOqzYzBhoCq1ozbZoA+o1of0eRg3z37xYTpiJ0e0u1/LIA83GWDaEtplomeROLL8hqZsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zaef8mz71ctWnLNnuos221O8qcYMWVjUMciwRjPURmc=;
 b=AzHZx5zg1fG2hWUlMvv6OAaALSPylTxcNcwjJwtIGRVPXbB6kt5AdR69VpzsOv4XTBSIenBO1G8yB97tVl4F8P+I9qksVgtDfgvav6/mdBugirDAVGoE63O8vwRB4cHA516IDea4OWhKURg0eTpV/f0PpyhEvMLrFA4v221tPiLgS5p+8HE6bMQsnrgLIltmzMKUGwhaadcJvhLKVBafO53uqBDVytmjHIzAPOkkNwGChAH1sNP/0UXxSb33GGZ1gfxTN3w9u+JCFnBx+7X8I9jCTecTHpxK1/x56Wp9shPYPgtF/iYT5xCrCo9DBOJNlqUxksh1obSPIn3WwrRt2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zaef8mz71ctWnLNnuos221O8qcYMWVjUMciwRjPURmc=;
 b=lJPu6rW7FeK+yjFfwdyKM/IUaePrsRBiNLoye3wfIZPPbaMmwja+9WxbtMD+XNg+0cwjpcooLqVS0gye2LX5gBXCirEbxhsHY7/2ZHYXAkXGlGTQ9p+fOl3It8KDG/JsMgjSBQiI/66iYG/61AFwoaFlE4vdaYDRdBpodu5WKS+0THfEYWUr3U3B2hh0LlNCqHOasIy1g9lj66cVrPqI1Je8RY/eAdm1D4sxuW3pb6X45sxSBaqUTw/+jhgHiqKX8oATwOD+hq7834iurwtl4Btk19z2bM7M+Cmy0zyZ5NoeAnu/eDMH4SCQ5E/M22u2lC2XDwua5EXeSHRehKl9LA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by ZR6PR04MB759890.eurprd04.prod.outlook.com (2603:10a6:910:db::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 19:39:56 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Tue, 24 Nov 2026
 19:39:56 +0000
Date: Tue, 24 Nov 2026 14:39:46 -0500
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
Subject: Re: [PATCH v3 07/28] dmaengine: bcm2835: Support common
 dma-channel-mask
Message-ID: <awXoAqQhSWa95FH9@lizhi-Precision-Tower-5810>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-8-andrea.porta@suse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123145728.29082-8-andrea.porta@suse.com>
X-ClientProxiedBy: PH7PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:510:339::18) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|ZR6PR04MB759890:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e17fe7c-aa45-4b25-52f3-08df4a62b81e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|19092799006|1800799024|11063799006|56012099006|10067099003|261026121527099003|4143699003|261026140227099003|261021121427099003|261028144727099003|261022105027099003|261102123227099003|261021123027099003|18002099003|22082099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	95iLH501GGIjfiK+KMJqbVrsti7A5KXx7SnXEFNWgWgfXyFbtnD4/WI8IIuXVrw19vxHEsBWD7vLusr09lbLpIIY5khbnInT3HXdGcVf1SdtTf03dchUg1e40duDEwQilVJR0XbXQ9StdjoezQ7q58h6iWg6ZR1RHfYh9yKI2mKXCDx+UXuKp3Z5ifLcLAdwjGOkB9Sz4k3fkFReNfIsO9riL6Y8yWS9dZXyp1pRDpTPucVxPfe7Gc8O+hQIV3PwoZYpKhap5kg7dj1T5LGxBhPDmw6l8H7RBkBn4xpc0+JX7fZYN71PsRZTpU6eU/9C4AWrhfrFMIE5EDqZUSHhyb31yUqeLaXTfxBRbqBYgev7Oja6RWYpSkVLfInMZxHUozeEzzpNc5COzStdEqau7cunKxfvEUlWN9ThoQ7KNSBFeMh8axeJh8furOMGn5b2hAvoK4a2NlNvC7feMcfvZumzkUXZP9TbaDJnM41fXEoLPk/Ke57vcwWm3Uws1z0uYXXxhzIfN5acLeXaNYGkaPHvYGERaGL3Q8hesYa9s8JsEfqgunhXBiHR8g8BitCtptw7CG8hkElEUEFqZbuJWaxf8Zibt11Np1fd5OqShIS5GGYnpYl8qpLQHSEY34txcsuPy4gE/m7IeuBkcgqojtje222BbA5ZrsndT6/U2YM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(19092799006)(1800799024)(11063799006)(56012099006)(10067099003)(261026121527099003)(4143699003)(261026140227099003)(261021121427099003)(261028144727099003)(261022105027099003)(261102123227099003)(261021123027099003)(18002099003)(22082099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q68B8ag1oeoQWvhxf8HaAkBSsqDHWTL7W0jEye77GOl/pfSLG3hb4OyLHqR7?=
 =?us-ascii?Q?6T+OXHfo3M+4/JEYlTYY8NLMAWbEnR8rIkzK3xpGxp0EaSxbNvDk4lYUM/sV?=
 =?us-ascii?Q?ueo+Mga2cDm9Rem8he2SzqK3qfMF10WmLFpz5TRhJ2tsZdHHbdIq5XmzdEly?=
 =?us-ascii?Q?/zgjr5/NMBqqoD71o2gvKwltbhSkWyyDhT2nW+U0rUDCDXj6Jh0MM7FlOT7G?=
 =?us-ascii?Q?N8TdpFTDVwTlJRZSOclhvXPJ2X3N0OVsTWXcwBC88AsNe8MeOLyvlvW4/shm?=
 =?us-ascii?Q?SriIWLK65IpXlF0JaKt9Z4FCW3Mzzf9G2WGJn+5nRjXc6OIn4frLmoR5OKtQ?=
 =?us-ascii?Q?nWanGP/YMKM0h5KWjQHuPHSurXY4vafJ3BqOBeJ0QUFsd1IweVcVfmTbiWsL?=
 =?us-ascii?Q?iDLuTmzXbU/fRfG4NRaixB7cMVaT5tw1CJklerUmJowXvyZPyoJvUchL1HKh?=
 =?us-ascii?Q?BtueBa4cmYrL/1DZbETEFKLa99Px1o08GJ9a/qxE6KgkXL9cd+48D3GyXN/N?=
 =?us-ascii?Q?PfHCdb2zzP8yC6iUpwclmISLAGLdWDV3FoxUtE5VtOIKHjuXYgGXmcZaKTj4?=
 =?us-ascii?Q?LJPfmb/65nngWCptvLxeN3TW79hdP0tQnYBvqwYyyPGSfFg92LnKUgEW3A8c?=
 =?us-ascii?Q?2AVPt+aA7jhiqSEFIOdFJCsWJ/thr+Zjx4hAN/rrgAA8Jmsf5h2FxRc/jch+?=
 =?us-ascii?Q?9oE0sHMSlMpBCOTMELD62aSdXry6mcjLMTXgopqjkamQuDp0VZC3npyDJdha?=
 =?us-ascii?Q?7Et2v5Q2Qtc3FLL/DgCW2IUnBkxWqR3AQdEh1qwK1Zhq91ntYk0l0cfkAmxD?=
 =?us-ascii?Q?jx+XZifEb3dw/pjVt3QvS1JKAjaLZ/vuavwnXrM5CJr6zNkK6sJ/Oo89f0k1?=
 =?us-ascii?Q?7o3J5Rk9/R5XCr4IVuGd4mPhDydBt9RYzdWucyAuuuBqfZGo843v7LFPi3/3?=
 =?us-ascii?Q?ie9bnIuDxhgqjONRhew4wgegnvM4TcVcxtVLGfPlDy3Hgr9G0k47Cs18zPG7?=
 =?us-ascii?Q?qITa3zOQSPt1hVGS9NzZWsyZnl3G6q9lsxpmGNtyWTom6PmhR85RKK2kZ9bS?=
 =?us-ascii?Q?TtTkcu8cIBzRuNdoHMk1dYusVDPVA3o0wJhsgW3+s7yIIz//LqNwsOAOJhoH?=
 =?us-ascii?Q?2hscQ57adia+hciGo6/n4iUSMVpcXiDsXKu7gIzwBNEGNOXuDDLoRBryXCJK?=
 =?us-ascii?Q?5Rj1SJRyYON041aCUiIsss46NlzzSLWED6NBd5daMPlTe6Hoy7rJ+46PDaQp?=
 =?us-ascii?Q?+wvlfCdwtLJddq5odkhTKxYW/xTfECoyGqVOqeuGx7nV3WQ2bHups/Cy55KU?=
 =?us-ascii?Q?/VWsg6slP/ayBxtcMsIkbR0TQXgqEzmEFNFLQJRbbgzB6zHjpAPl0Rq5qCXg?=
 =?us-ascii?Q?HnEP/9UK/2tfa6+FgXgNYfTtBcLb8Heia6bL5k7bXBSzi8OXFsr11tN4Czta?=
 =?us-ascii?Q?Y2o64LdCPlbu2fRSgOcLdQzKx8GRYhKqiUwtc+zNqCF50ng2JIcUXpUzbA7p?=
 =?us-ascii?Q?pQlt6cTLKcq4HHDwnSuk6h5U1MxbEi60zlwzTLBVNvg548yrWN/iCFHmP2/E?=
 =?us-ascii?Q?yzGSUHyIWbQE5K04wrtKauS4jWD8XyV34w0kcIUD6U/t5gbakr3Eu2Plvp+B?=
 =?us-ascii?Q?50AVgfxeW8WupEl+YzYcSES0c2HsaOOHBELIyMF1Zu1hGOhmk7HmmFbQJeSu?=
 =?us-ascii?Q?2lCf4bSF2B5DwDmtJQoN+2EMGFTzTSdxqi/qaJLZTswG+7/AthDnoHgTgylH?=
 =?us-ascii?Q?uB3aKfn3z0nO0PuB4+GRtslbsaZ1Vi6VK1W+zfPQHB8as1ln5T4T?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e17fe7c-aa45-4b25-52f3-08df4a62b81e
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 19:39:56.6851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DLtTuZnukIcDfY1scIdpqPs9XjE1x3NMZCeQT7f/tNlRkFaKMrfhh8NEMoWFNZN+HeQG3n6OlZg1I2CcSyUPnrDIrehgfYhnYe3Lrm83jYXmq2s75Pup0323IkxXj6iP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB759890

On Mon, Nov 23, 2026 at 03:56:45PM +0100, Andrea della Porta wrote:
> Nowadays there is a generic property for dma-channel-mask in the DMA
> controller binding. So prefer this one instead of the old vendor specific
> one. Print a warning in case the old one is used. Btw use the result of
> of_property_read_u32() as return code in error case.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  drivers/dma/bcm2835-dma.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> index 51e3a40dbaec..1087157fb242 100644
> --- a/drivers/dma/bcm2835-dma.c
> +++ b/drivers/dma/bcm2835-dma.c
> @@ -991,12 +991,19 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
>  	}
>
>  	/* Request DMA channel mask from device tree */
> -	if (of_property_read_u32(pdev->dev.of_node,
> -				 "brcm,dma-channel-mask",
> -				 &chans_available)) {
> -		dev_err(&pdev->dev, "Failed to get channel mask\n");
> -		rc = -EINVAL;
> -		goto err_no_dma;
> +	rc = of_property_read_u32(pdev->dev.of_node, "dma-channel-mask",
> +				  &chans_available);
> +
> +	if (rc) {
> +		/* Try deprecated property */
> +		if (of_property_read_u32(pdev->dev.of_node,
> +					 "brcm,dma-channel-mask",
> +					 &chans_available)) {
> +			dev_err(&pdev->dev, "Failed to get channel mask\n");
> +			goto err_no_dma;
> +		}
> +
> +		dev_warn(&pdev->dev, "Please update DT blob\n");

"Please update DT by replace brcm,dma-channel-mask with dma-channel-mask\n"

Frank
>  	}
>
>  	/* get irqs for each channel that we support */
> --
> 2.51.0
>
