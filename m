Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793117336;
	b=CR5uJAcVEwX+Ldu1e38LCMST1K9n65YHhcnyBZoTC2t41OFcio97n9jnnygsTtJVAyKW
	 GMUhZvqTr4Id4ucykxXsQbn3r/sg+vDdb2nly59JdmvGkYSogXjuRkQaEScxXm6c157CA
	 6hgTEoRYgyqhjDhDVSx32gnjOS0XG1ueu0UaOLDK7r2DWZd7EaCd4IDRb5F5jvniIsQq5
	 xX9Rfe+T1elluVq9r0lRnAeX1n/aFHdAWCJRVdkZHWAFPuAC58pcMED/hNiGnAqFFUcSR
	 MjE/AUeqZca6kEuqzdiK+yU9bn50QSKsMVoHwUIit/Wa2GkMu7wbwjiN+aVmJlvN53A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117336;
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
	bh=5RyGDwcytJ8hJxrKJSsI9XtTSq7oItT+Ghi8cEKkFnk=;
	b=NnnuizMZ6JD2EdlqbGyunL7hAyXom38olwtRcc/g6fiq8/0j4dXpVjfmDyqNh0HgQH33
	 YcuaDY4D9cJq0SMUBYle0940AjRD1q7bsF/xY/k29Xip1oUu9gHBMnPThsMlhOYqP3AYU
	 8wNr0j1iEao+d6ySHM5KupjtRSpJV674eJ6EdzuOz3MMxdITGcxDftj6EevBr6/FFvA+8
	 kjdbSSXBDLh1axqeOGaqIoIBw4n08UdPJbRhcQIMpPH0HPIw4LxlpxP30MVNCoJALGBDu
	 2VgC23XBkdZU3lh8YIwF+93oHHVILltJJtG1pn2JzUnV+pPKSBLrytbN9vmUvxORepg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ptYl4mH0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.24
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010024.outbound.protection.outlook.com [52.101.84.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAD3606A31B;
	Tue, 27 Oct 2026 16:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EAD3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ptYl4mH0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tUsnrc4TpzE925659OCWGgbYhKVkQmCxsVTfEZFT4UKCnTA4dfu6x3UVQaTM3oc4LowHOCoOL/0iZDTIS6yHJvnhIFwEhM8QcQhFNw8U7ml4TwTs8/6V+sVSesetscMLqcdJH4fXGpcivQmM/zHu1I2h2+Hdzyd24WmSIUITk9M2L5NGgW1AtTePsy9wX29wGIsB++19UEUAsVUCePXbw85HAcIci+JOMrHakWbXkl8ROkw/2i4fVpr7u8iVBvgSrQatapHc8hODTWv/RYhAh1Q95YVciJz3h1pcBcmfI7ZJHoU+aZ9OLOrE3Gyo9rB6frhyxSTfPqOsoemd/n4qRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5RyGDwcytJ8hJxrKJSsI9XtTSq7oItT+Ghi8cEKkFnk=;
 b=yCBtuAGdeWov1xSfM2J4LtkfRGfHgNcfC6/C376R7ljMkYazujOELpRvovmh0ggLr4YqqyjpAiCYjjX+ZchB8UoO7kvaaG4bo20Vs8OdbXZnEtMdZdAvNir2IK9tgzJ9D9o1cdv2D9brddlg4EZEtvV0gAHd4ohUfz9UA+uCNjHdgzeURV22OCIDMDOdMnX0PDmrI/fySdQS9Z+q9B/+Q8ycett78bhyvpRJMqtOtXQiE3c4iwts/fpqKodf/WwxengC1Yrh1EMN67g/hUuYj6W8spNNFWIPgDAMqxRUjNJ3BufYf/O+4l64z3Y/KxH6XUXVdAiRsLQP7Kb5Giovzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5RyGDwcytJ8hJxrKJSsI9XtTSq7oItT+Ghi8cEKkFnk=;
 b=ptYl4mH0sSoInDkKquKC5Il4F92j6o+02DrdRpjgZv8Qw5iSqEdc0lNruuFHDYCoA1knJ8Or32v0a2CdeyAzD7opTpEDCGojlsBxk/iv2YNo+BQisKpgcvLkSHuLmOGZpnczJ1uqEoGI0qY8XL9s5xSge6mIXqcBtj8CryEN3U8psqkOLkoj1fRX2wZg8dui2pJm1Qyo7ahJBD4bHQf1Wlhy3hXrTaLWn8IUhejJ6InvirUVXbQLjqekvhiT2DAm1uNwDk6Q0Y8/9Rd3Eehkhdo/eHpQYlpckt8kay8GfXtjIG1I1f8a3XC+zk97HdctR3mRtiCwA7DQxAOFiR7GGw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU2PR04MB8533.eurprd04.prod.outlook.com (2603:10a6:10:2d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 16:08:53 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 16:08:53 +0000
Date: Tue, 27 Oct 2026 12:08:45 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: sun6i: constrain descriptor addresses through
 the DMA mask
Message-ID: <auDMjWOLY0g9jTb6@lizhi-Precision-Tower-5810>
References: <20261021-submit-sun6i-dma-descriptor-mask-v1-v1-1-76e72bd52e57@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021-submit-sun6i-dma-descriptor-mask-v1-v1-1-76e72bd52e57@gmail.com>
X-ClientProxiedBy: PH7P222CA0026.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::29) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU2PR04MB8533:EE_
X-MS-Office365-Filtering-Correlation-Id: b8683704-cd4f-46c3-4583-08df344498aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|366016|1800799024|261026140227099003|11063799006|56012099006|261026121527099003|261021121427099003|261022105027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	hd37qCOUyfPRHSGQJyJCAN4vs1Hc84bul8UKUq0xfF+k31a1nLrb9p1iNkx4+Fan5MeAUmf5wapz43h/zveQN3l+v40AMXW81DqYIUc566x8q7vWS47VwRNACN6bJfgL7HDIlpoe7+3juGmJzQnodqIXMa817MQ4uoCnW8TK+o99ZHqxmd2hX4Ro6ry8u1GLYhJHKsyGlWUEvLhEurZAkPsvGTTPmgaVn/ZdyptQP1bk0ZJhUZtvPL6Ij7LU53vMjWTUIxRLp9jqWIG1+YpeC5W33JAOdTWFPxnfDn0B9aLue3ng43RbBXY07eM9HhZRrqiiNbHQht/CEsIgAbbGw+uHcUUEnLEZswrpQIdu0bQBBzJcHqku5+EOZwZC5pIKeYFqLxvenwLWhcPS+zyh6lZF+iIPkIuMdCWVyj0IT0BsN+zijeMDBuldo57J5iNXeu1t1kaSaO8j6O0bs8xuwnk66lq6lST8gLk86dbtyEwCTpPnwacQegRKpJcB2DNzDHZ1iUM4Eh2Ml5H0rv9bLJQMPIj/IrsUDjb7QhFwQ08DEqfRDQqlAxZbpEBzCFFOObYeRCc0glWeaNd6Mb/Gqr8KEG0H8HPQ0pAP1UrXub9Nxvw1qT2u6pX8DsRzFoFksMcJBOSUQG7e7cUt38Tkt6bs028M1tIsPnz41LLPiv0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(366016)(1800799024)(261026140227099003)(11063799006)(56012099006)(261026121527099003)(261021121427099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fEk+EZrT1JXmCan5Ct71NmLoFFIuNdEcE9a5LNyCh3SuXcX3iGcO0SpJbM2T?=
 =?us-ascii?Q?/OMjofNwmJH2RbGTyfRf8V3TPox0qKmqHAJWnDLqOKDHRWajKR8EmaBaV1bt?=
 =?us-ascii?Q?cljTSKLgbRYkfL6glVXkwAxh9aLgLzwArJASamNnDmEoOOGREs38cwTJ3gBL?=
 =?us-ascii?Q?2FvRvdN2BF/z1dQ1x8bzyraLE67ZNZVZIfKP05KsVqE9cCl8Ican1Q0RjHPU?=
 =?us-ascii?Q?XfVYy5/I1kOs9HqUiM6298+hlquIW9vvvC2S/U5jZz/0/bc6/7mBOSyYseeV?=
 =?us-ascii?Q?RYpgSwCTtaHVnoufWYcCOHXKCmb95b9eCTQClXIivRuhfViTG/zjb84vVjqS?=
 =?us-ascii?Q?d/3sH5dlOmy8j+0qmaAbe8OPnJTmipTpV8sac/l8rcciI5OfbpaBggcTr4s+?=
 =?us-ascii?Q?C7jsisYyYghVtRQN1+6034S6CMZea2FFhUwYh2kYqbzCbnKKM8dFs3+rB0Kc?=
 =?us-ascii?Q?wgfnQhbBDyALKmBPQyHwJIub+BwIoWiEiWGszQidJrIFWW/BZs396wYJJOfP?=
 =?us-ascii?Q?3JDb5zPPv3JBUPhkpnltl/DUDnNEF2DA7XXUaE+6lPYbSLtJpugu+ro2nZ0R?=
 =?us-ascii?Q?ZYwvCWDxAcOtrsabzeQb87Ye3GRQ2JiB60b5bjbPBudD/9MwU1dno9NXK+wn?=
 =?us-ascii?Q?uqBtT6xv+cIwEMPXQZQ8KBgrmMUCfGWUMk/4dAcHHgoxQcjGKGpH1q14iKgy?=
 =?us-ascii?Q?7u7RpiO7v5KjizTrAjjONeTR6Y09TAXluukMnwxL0+oeZ7fFL+lia+BpGayY?=
 =?us-ascii?Q?hMWcAdaiPdOkKz6EDnHs6N9/UGj5GBelv5w9wa72KpJDMHE/Ma4EA2fyZe/h?=
 =?us-ascii?Q?8TYh3+u+paBSdfWkJNzsdq2WchMIrohBJ/dDUJ+5u8vyzz4X6p/8sjZ2Nwjp?=
 =?us-ascii?Q?h96drOcep/XJyAc4zMr9oNq/oZabDQXrUCkHeFGePTz7tU5QKPruYsHUd7ud?=
 =?us-ascii?Q?PxvkSscBBJn/+HNS6U/swSMKZcVFTrMSXPFjieOr3J+v6HY9qZniptzv36r5?=
 =?us-ascii?Q?D50gzT+2qDAZM0cedF5cwtxS7ksTWYJ7QsBS2xO77wl6SFtreyj5x9w3Tq7S?=
 =?us-ascii?Q?qCFBLrWgSdhu1+J2zFOKxn5WBDxSZRwMpFyquh3jwfGOebBVodu90IgQC/Ue?=
 =?us-ascii?Q?K0P9buWQoMO0mYC/hoI0I68+oiPVmMhZKUdJF8ldOU/m6SS862mx5qwd1eAP?=
 =?us-ascii?Q?44Xv216yKzRkqt4wtj59LndvLCHdnPPSWtbuLEcpUr5HONjYJUJrvg8szrt7?=
 =?us-ascii?Q?unwtms3gEMOqufNx6qi7IQU1cZpxrhgpM6B3+n1E9QVifA7VotuU9sv3iKYZ?=
 =?us-ascii?Q?f5uWLGS37C4BbwK7DNIZ3LNe7q/C5Ul3oQhAP92T24n4GGgfKR/4OadB8K/h?=
 =?us-ascii?Q?P3nglG4RG9GOx1o32Bk9Pl5QBADI5MZPebPqpJdVaGnRrZspmZCKTQAuAmlX?=
 =?us-ascii?Q?aN9G0BuFVj7NiDviKyJcLYsMk5eY5M1+2vxkUpg0MPvDHAHRKvJ9VZcygPC9?=
 =?us-ascii?Q?YbdRmKMfSunMoyX3p7+vefu6jfhKdDYRDQ+jWAXNoVUUtTR6UKS6bhHK9ECP?=
 =?us-ascii?Q?5HiEZWGF4yvGu0p+IQDcte91NAx3mjKW61FtrbdJqW5T3wZNIcFFc4LSC7BD?=
 =?us-ascii?Q?S5CSHVQ3qy0Jzkg8f3NyP+9hBNMo4DyyQWdDXNoLBvlRmRdLcEntVZVpqChZ?=
 =?us-ascii?Q?g/igfopk/4KZsXgPDK6HI5/BYOjfLDpTauKWb/ZYmTOFxAYCrPziRTMrbFoN?=
 =?us-ascii?Q?vFPGdxZIxH3eqbhT9+ZSRXPDXKZz60Hw4x8d2wdeXfcxFfpNu3Dn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8683704-cd4f-46c3-4583-08df344498aa
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 16:08:53.4337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IamZJ49PzINjXaRlirkLRJZ4+j59/+e1nCHflEUYjRSpPdc6YC0Y65m/k2wEIy1X9MnHu+qys9BNrBy/SFSE5H1K0FdEY15Wv5CMVHgU3OyEhvExA0LvmG35Qj/uydVm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8533

On Wed, Oct 21, 2026 at 03:11:29PM -0600, James Hilliard wrote:
> Descriptor allocations pass GFP_DMA32 to dma_pool_alloc(). The DMA API
> chooses the memory zone from the device address mask, rather than accepting
> zone-selection flags from the driver. These flags can also reach the pool
> metadata allocation and trigger a slab allocator warning, as observed on
> H616 when preparing the first UART receive-DMA chain.
>
> Set a 32-bit coherent DMA mask before creating the descriptor pool and
> remove GFP_DMA32 from its allocations. The driver does not encode the
> extra descriptor-address bits supported by some variants, so descriptor
> links must remain below 4 GiB. Keep the streaming mask unchanged for
> variants with wider source and destination addresses.
>
> Fixes: ec31c5c59492 ("dmaengine: sun6i: Add support for 34-bit physical addresses")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>
