Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795549010;
	b=5TOjiJmohbHAXvfBNSh0w0dDa50x/OpLSaL8Xts0q3MjAtivNaEPiIfQh4NhrSc/szal
	 cZQ5sw5HRw/l4BVVOek76mTnfUwu5AZetiRFPOesub1o0pvRKRuzgf1HzGL1pJa4I5lvH
	 IKBNlGfwORyvYohWbnS2gERIweKCuWAdj5QY4KKo83KotoeiSgNJhPQ+0uqJoclyUVZad
	 Q4pPhY30NwLLKLdmQVA3EW6mf4gPv1mX1F1F//qHMgYv8wHge4DcXW923SU8mgj7P3CnF
	 71nMm+GfLlH5r08N7xb5612+3KYewtGsHf4Np/+0TfltssYIkIpaDYNiqAIzQgBlPNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549010;
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
	bh=vUaR03SIHLPKcRnW08Ff3waJd3HTaW4Ofhq+LbICp7A=;
	b=nW2lRuyEcF/IAlp0hyskIArth4QCAVRkQvwbrDsYsXa8HCwBeOyc3tFL84/BjpQiDFPN
	 ya7107bVd3jcXG4Pb0vy50rG0K3HpkLJrcRmKSd03Jele/vw8rjTTEJQ8IhpodI5+f+b7
	 CP6RxoUUI6LoOT1Ct/tGQj0oIJcHBBgU3OFF542SG3DQUo0GanporAz3Rh61FozbkpV09
	 4jjI5WCz3Ztl182UhfCnUwaY3vKts26OqCKBbjMM2OrBjb2OyqoCpcu+PupAPmunFGmlw
	 bauJ4N9NPtMiiRWRiP1PDQAB9/J2CAneApDPQF40juAPlHwcyJ7I2Td/WRQsGWC4tnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=b1Rv6veu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.66
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013066.outbound.protection.outlook.com [40.107.162.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF46606A323;
	Tue, 24 Nov 2026 19:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DF46606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=b1Rv6veu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCoCsUfxDIkg5/WG/8/QdeeBnsMPj2Sx0XRmjtlMSRioiFAd94Uxdwj0RI7IcBh/IF9zTSXzSfRg2lRG45gIh1BLfO/o+dzWgIALZihUhwxDaJBZhs7YFa4sNEWwWWXgsVpc0nofttW/gBJ6NTBJc6AsWaxVtove+n1bn9VTuGYFqKSvCjPxYPRn3EhJA1edGxRTgCv1797RrNWtiFHaaxtD/KRnUH5o4PlWkgNowUdCc0Wem2zOjJyk1SPspV/dJ5XM2brzCTQbvn/TJZWeenW0QPOMendXLI3I+GOYpvpd+bRtdNKjCARlTbqLRccArPhjqFaJznA+bOUy8S1snQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vUaR03SIHLPKcRnW08Ff3waJd3HTaW4Ofhq+LbICp7A=;
 b=Qj1MuAgW6jCoCkhdJjtjhIuD5hgu/rq2PzOPJCHTdKRxipKOSKZceLez2zXIBP2t25JSNFOrCeMQI54xhi6GXQSHgNnLc3fMbV6rogfisaaLEaME+FJq7ukQZYNe5FqykuyGuYGiKvtCnWxj6xFNTUs/M6IPKkcE+/kYRem68mlbHZjcmA+FjDCd8LkVet4ljTa/h6epNzbQVygwPuVZOEm0m4forg2HX7OH1qTejnQ3Pd248bHM8ymRRWHuth91dZZkJNLZ3zHVMhz95dlutDTsnnY2AVkgPYbq4LOUKpn77xVYcjW1Gt4iKsKqdLjXJrNjUAlFJNLpXcH8Vx2Jeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUaR03SIHLPKcRnW08Ff3waJd3HTaW4Ofhq+LbICp7A=;
 b=b1Rv6veuKQoebcXjw7ygQXoIpEQGZHkfXi1zRPIfy8njUxecg8l5+veeiju5cUSpZfZkfJiuabUwEJw5mEoiy5pmNhPd7kI6M+w7Ev2OyaDIC5kBrtAH7GGV4nwSKtCw3SMcz5iXMf/M5hk0SKwStcctPlHZof+Fa1ENIADWTchjkwtCVRP/96AJ5hBbcVgqqYSt8xO4RrJNlOWQtAHmwvuVUDQV1uofZo/Hsq1urXUtrPw4+EscKVnHGIwB/JfnjACOO0IYKL0XVYms5KafJF5qvtFjTPTvSKAaRc9EXDeyG/2JumNQLj0x1l8ZpRZWdP0XlAw1Dp+3p+MP1IXMow==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS4PR04MB9363.eurprd04.prod.outlook.com (2603:10a6:20b:4e8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 19:36:46 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Tue, 24 Nov 2026
 19:36:46 +0000
Date: Tue, 24 Nov 2026 14:36:39 -0500
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
Subject: Re: [PATCH v3 06/28] dt-bindings: dma: brcm,bcm2835-dma: Document
 dma-channel-mask and DREQ flags
Message-ID: <awXnR8jz-Nd4QLJ_@lizhi-Precision-Tower-5810>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-7-andrea.porta@suse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123145728.29082-7-andrea.porta@suse.com>
X-ClientProxiedBy: CPBP307CA0022.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:2::11) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS4PR04MB9363:EE_
X-MS-Office365-Filtering-Correlation-Id: 43f8bbb1-1211-4fe3-5768-08df4a6246ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|19092799006|10067099003|4143699003|11063799006|56012099006|261021135927099003|261022105027099003|261022075727099003|261026121527099003|261021123027099003|261021121427099003|261022113327099003|261028144727099003|261026140227099003|261009223027099003|261102123227099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	I63TC6/JB2Fiys7cJGsWgZ+VPaTwPQdTFNL+1ObCBIFyYFLJi1sfN8KkhUpbE67GyF567TujRGnze9jCOs4GkjfWsBfHG96D9z6MnNRNrH8b3Ebnu3N9t4/uiT/gdXg05RPSlKJKhF3bh33NTPqdYcjXwnPvnhGpbnDSZ3p+luGXzrwdKbssIpgwHpNr39KoQwKOTO8Z1BNnjudoO+9eGQeEEusm5M2I6Z2GBq0EGoVqFli1NA5kpk/q4m5IWmp10wmfnY2Ys3r1yE/dkf5rgOxmzJ05WZcK0VtWnH/aJwXWG8SI11ybDcpZjY3ab3dIU58iowTi2HZ9eW1bhNzcx0P2J7DyHlWMeRLeeyn/yxHNFlS6j6D3nMAEp2mOdfrZ8UJPleC7IzwwnKuXKxMqaGsKWI3OebPGKPVeWM+1t0/rMy11KfepIAnyv+/YQGsZp73JpipEJdk/gP5fxTQYVhcPpAqFpBQhACt7MMTxiw2nXP4BUrd8H2cfUEsOaIs8aY7Qo2CT1hMLBuspLEBooW2DdJ5IcEc/TrCXfGV0NG3ZLUd8HDJcQ3psQY58SmBfg8jAGXuRCAH8usJuSRFKvtZgarnHiDl/+9Y4Y4asulolDJxMJXTjoxU0IkR/GfBysW2zWPdkkVK1IzKzPCTC2agp6upj9ChE99N7uF9vhLI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(19092799006)(10067099003)(4143699003)(11063799006)(56012099006)(261021135927099003)(261022105027099003)(261022075727099003)(261026121527099003)(261021123027099003)(261021121427099003)(261022113327099003)(261028144727099003)(261026140227099003)(261009223027099003)(261102123227099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?091b6C1e4d1dILCNvf1wIe11/Ux1Qhk2Cz7V6wABBUrDkLfNLWpsKPfXsaoZ?=
 =?us-ascii?Q?NhoJjhBYlps3MCSuwQhIhgp9HAbGceEVJpCnFwur36DxI44BEwliAnzRuM1L?=
 =?us-ascii?Q?7U4Pldyh5WfDbQWjtUn3bdWgiYAZvqJbwlyH9rIYyqsJx676nOO37z19LXYV?=
 =?us-ascii?Q?8wQW7OQBlr1aOugjWdUFHwe7iRoD1fy8j3jJweG782BBMeKSnkVBycTRfXef?=
 =?us-ascii?Q?C8i9EsBZdm5FospKmwAE/oMd64MlS4O5o5M3b48udJ25wp61IO04aP/YjWRD?=
 =?us-ascii?Q?UQfQjopV42CmMB5TP92ykRsqqvn6jkAETn8j590zx2tKbLllnJhP+9e1Kvpr?=
 =?us-ascii?Q?G1ZxvsR6W0ao49GmqBEmEsATSMYVkkLJZ1EuWpXfNBiRcGuvpK99fNAiqzkr?=
 =?us-ascii?Q?Dc66+wo/Ru4Nc6h3ufPL+0Y0wwwTvHGXgFdsR1vR00FabxEiYHe66t7Stwj4?=
 =?us-ascii?Q?yBaB9mOlUoB0RygDX7uuMggGvnJK28dH0KDWSVquUp+8Qm0nLybX+LqQvBtN?=
 =?us-ascii?Q?r5mAl4Lc0mGfmJUlX+75n9GNp87cbnWNB9oUIKDytIXiWW2NRuWtJozX+qQ2?=
 =?us-ascii?Q?ALGvG35Smy7Ac8PMBonO2S1RFHp8MTa8p7yEvratULG0oCVOU7VwZ2xt5phv?=
 =?us-ascii?Q?+X0E5yauR5/Kl0p5RaprF4KYbHBE0geCUaEw/jFxQNR1nSlDFldl/HGgFdGa?=
 =?us-ascii?Q?yjmG18a2iEt7dxt27qF7uMKnsxEAbNl+MTxyZKiY6SJBSY2llOCQw0WAj8oL?=
 =?us-ascii?Q?ELGNOeR03wZE6vda7Lfbyy/W5HUMnXS40ihOJ8p5pZlgzA8DXgc7Y31lLUB0?=
 =?us-ascii?Q?QlxWxwEc8cHkVfzflYxUGDzYK+JABPXtgjPvaQsf6a40gWREgcqp167cl0bL?=
 =?us-ascii?Q?ex4Kksk5QV/oin5kJ+mkNaKpBf35i72ua/eSYfR0Mx7eK/SRL/LftnQZb97r?=
 =?us-ascii?Q?SBr3iNOmlUc17KJbIkSNv6AffGLS+Di9/4NBDG7CS48Wt43s3iFPY7kPbQzV?=
 =?us-ascii?Q?YZYAxsXnb2RGHdMgg2O2ZqvRMtAfCXG0NOkUw6GN+jXcd5wuG+YroQZGbXXV?=
 =?us-ascii?Q?Fvv30goiuepj6ZhoNjdNVUowFr/S/K4a0XFUX27rzFzKcarJP8XbIbwbXehu?=
 =?us-ascii?Q?LSd33dGoMjGOX4qy5Cae2BmY4PxX0cQiXZ3zYiqczNocNTQkEfX5i8+ptFau?=
 =?us-ascii?Q?81YcKJZa+Kiz+ujtnZgLJF7Ba84yadPnlHfhjkWQtc8PCOMrYU0b7FQA0bmI?=
 =?us-ascii?Q?6EqWhAsFXxaIj7t4fUXIiF+6+c+giwsSqzRfozGgZ04K+FcASNLhJIG2IUJV?=
 =?us-ascii?Q?R/dCEQKSq7PyaKzcOc1sPuj47HR5roI3qsIWl4mjW8LICs57BezB8SfCVVEI?=
 =?us-ascii?Q?5XXwoEFnbI+ESLzgNSgWdj1es4wmc/TsHDN//xeq7agBZyOvgMaq5DyO2DSm?=
 =?us-ascii?Q?ILGmCJXP8s258E6HxEEyHYIEFHxVblou2WGKxDUh2pmcBys5uuyDyz7MR82q?=
 =?us-ascii?Q?KgURADpF3a+8Owb884YpZ+OObmEGQ5dh+fSrdBdQuDgLknIfUeiYoAT3awP9?=
 =?us-ascii?Q?4yV7fBUVvMx0w+qgH5M8WwLtBMA1yAMHzJ+5vb2oezo6uKvtOsLM1+45ARvY?=
 =?us-ascii?Q?djAAjn3qdwvQXtXn3yaHN4D4Bb26Nx9k0j9kaAVL9mKvTflJtP88X9vb7m5M?=
 =?us-ascii?Q?rQVjl6TEl3DHGoQvUlRBud/LMknZb7uF93aFuEhk0xX84uxDH6FS5/oH0PTT?=
 =?us-ascii?Q?OK6ZuEgV/G419izH7avEnZQzTNsCul9FnC/Mu/dFQo59lx5Tm8jV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f8bbb1-1211-4fe3-5768-08df4a6246ad
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 19:36:46.3550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YyuZYiHfV7QJGadnomvW4M6VOF7z0laidAchmQTEqJuxWpr4hH6LugQLTaKKxH0cxcffKHfqL4AxR4IAJkOQmnyg2j7mTcQcr7sH/hS/o818dEIAtfaGuGeg3J+a8q/B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9363

On Mon, Nov 23, 2026 at 03:56:44PM +0100, Andrea della Porta wrote:
> The available channels are currently described by the vendor specific
> brcm,dma-channel-mask property, while the generic dma-channel-mask
> property from dma-common.yaml carries exactly the same information.
> Allow the generic property and mark the vendor one as deprecated,
> requiring at least one of them, so that device trees can provide both
> for compatibility with older kernels.
>
> The single specifier cell is also not limited to the DREQ number: the
> driver interprets some of the upper bits as per-channel flags (AXI
> priorities, wide accesses, burst and write-response handling). Document
> the meaning of those bits.
>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  .../bindings/dma/brcm,bcm2835-dma.yaml        | 26 ++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> index c9b9a5490826..f619e395cf0d 100644
> --- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> +++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> @@ -37,15 +37,30 @@ properties:
>      maxItems: 16
>
>    '#dma-cells':
> -    description: The single cell represents the DREQ number.
> +    description: |
> +      The single cell contains the DREQ number in bits 0-4, optionally
> +      combined with the following per-channel flags:
> +        bits 16-19: AXI priority
> +        bits 20-23: AXI panic priority
> +        bit 24: use wide (128-bit) source reads
> +        bit 25: use wide (128-bit) destination writes
> +        bit 27: do not wait for AXI write responses
> +        bit 28: wait for outstanding writes before signalling completion
> +        bit 29: do not pause the channel when the debug signal is asserted
> +        bit 30: use multi-beat bursts

Add header file for such defination.

Frank

>      const: 1
>
> +  dma-channel-mask:
> +    maxItems: 1
> +
>    brcm,dma-channel-mask:
>      $ref: /schemas/types.yaml#/definitions/uint32
> +    deprecated: true
>      description:
>        Bitmask of available DMA channels in ascending order that are
>        not reserved by firmware and are available to the
>        kernel. i.e. first channel corresponds to LSB.
> +      Use the generic dma-channel-mask property instead.
>
>  unevaluatedProperties: false
>
> @@ -54,7 +69,12 @@ required:
>    - reg
>    - interrupts
>    - "#dma-cells"
> -  - brcm,dma-channel-mask
> +
> +anyOf:
> +  - required:
> +      - dma-channel-mask
> +  - required:
> +      - brcm,dma-channel-mask
>
>  examples:
>    - |
> @@ -96,7 +116,7 @@ examples:
>                          "dma14",
>                          "dma-shared-all";
>          #dma-cells = <1>;
> -        brcm,dma-channel-mask = <0x7f35>;
> +        dma-channel-mask = <0x7f35>;
>      };
>
>  ...
> --
> 2.51.0
>
