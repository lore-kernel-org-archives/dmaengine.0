Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795195789;
	b=yJLjVBR1cU+nPhU2fSHS+q6UoxgR6YaDNms1UrlDD6lkZtXvMAh5UHsJCLGbGBYO8HwW
	 vudIPoehORqTBgGQWEtzomhZNk6ly/NjW31wE9pRMLr/m6XwbRqdHlDYi98M9FI8c2C2Q
	 SGocFmoB1oV42N/tbZhMecJHdYX+cyOg4fTj/3bNy/BZiVmQr/0YSihSoLRnrouFtmTeg
	 ddmTYc840wYjzfDwf4B2B+hLRi46YQRIh7KIuQtK003jGaLypFCElCLsFBmZ66RxQtdk6
	 LVOpHJTf1j2i1QI46zBtae2jFaYzcAuE+lGQYQjhmxKQ0ixEJ/ENxXDT2Lf7x+8cq5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195789;
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
	bh=Ds8FxAraxfNEzC96p1nlN5Dc4ZsQmKimqcHoYpjfRXw=;
	b=sfhH1B69x0ALfnDNLIHv+m+tOYjVAAF5eFh57nV14PPKIg6sl85ht8dd9DCA7aXqQsm1
	 GaIi2IgFeDalM/GH0VOJuXF18lVxTD3uVpB3Euy8sQxMXPwEYAe7wXxYWSkAkpvP2m6p1
	 bsZcwz6GiYQvLw4j3QMDkCQ61i4Ut2piRJak2nrWlyjRtttEj1+dqA+9vIDfP6RF90SZt
	 4yBgEps8jkDq3pSYBsYkpwJbiMYgRTyTfwHIBDwCZ8+bvuQUiWg0mQydTf+Uh8qMfUtsL
	 KoWnV4ASjFdHvkSEf3ZS7aqnUIECg34CXE6BMKk4QlVGusIb58KPpfcja2J/rJ58AtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=pIBpiPzZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.67
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013067.outbound.protection.outlook.com [52.101.83.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8C4606A33C;
	Fri, 20 Nov 2026 17:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F8C4606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=pIBpiPzZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dS2mPRrcaq2tBzlQodc0+544AzR33afAYNt6Bf6/BEzQ0YGf2tEEluvbiTvK401N6FOxiVgSfR3sEx17ntJzc9hsQ17kVpmsObyZAlOGSM5lIGdODIWiPNNqWfw1d/SgYRVY9vmjolxPJNn6H/EHphLn+FhN5Tb4A4NrP0cjqIjxSIhksMPXoJrXOgEmviCCgHzVZc+1VB33YClJ8AQ6vV0heT24UTKuBHaaqFXdg+aALBU/WYl1H05CIcRXRoJFif+XrYC1w589uVSKebjS7J9RQadhnu8BViFj5xTnABdaSAvQ53/6zENnFl4ZLEdRWvRDJ/9NpLc0VPdhAXgpgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ds8FxAraxfNEzC96p1nlN5Dc4ZsQmKimqcHoYpjfRXw=;
 b=vpMiJ5la3+GzZuiiC1FFDb/8ZLRW7XE56SUsvdO+iMRI7DOCbgV2WqXx4MCNc/YKmAOjgvzM68K8MKQj59HIqSSGeFYk9r9d/NXDAF98dBMtFMiEqehc7Z6p0qZZrCGSAypDmlpxCyRiAzKf+nc7I9vdN8X3i2EcaSmnE/JG+ivc/JkcG5qvOhLSihyJU+XuBTd9FMPjA1YTXFif/X0fkyqN/1DG7BElW+d980mWNP8V5m0Vjh+5r6UpNS2MLM6fHNPuistRl0VVDhJ0JLnkubJ9i1ebpvTh6tVnNCQHa0l0kQBNLXBl/Kf7mrogoyfbqZhnX2Axwx3Yq0S8YQQopQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ds8FxAraxfNEzC96p1nlN5Dc4ZsQmKimqcHoYpjfRXw=;
 b=pIBpiPzZ3LGzgc0jhKSwdt0RHyU9RFfhAJG3wthSryQUHNnvHZJ1jSWSuoD9I2QjELOZGpORhiPIroRzeXbJv3K0RQL5tlVYoENbmHU0qqM8Bl/fKXuQZtLqwf1wugce+JdOMHctlCqwqDijWQh6eSDCBh5Dvg4PceAgz8LOapAbdvgr+UaDBelc4JU8iwYRxK1vueISJzYiXozzKSQNYmXU5FoBXTVk5Z4mJHXxoaPSSteHrbGzWx4F0CZCsDOcw9aGTBJWQoLLKgDk2P9AsHF64ua0iA6ofgKqRf2/njhvB58+O7+FlY4ExiEgLpY44RyzDU0bmyu2k0He4A9tSA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by BESPR04MB215853.eurprd04.prod.outlook.com (2603:10a6:b10:144::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 17:29:45 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 17:29:45 +0000
Date: Fri, 20 Nov 2026 11:29:35 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, robin.murphy@arm.com,
	devicetree@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 02/10] dmaengine: arm-dma350: Check DMA mask setup
 errors
Message-ID: <awCDf66NuD4FwZH7@SMW015318>
References: <20261117094335.1393735-1-Jelly.Jia@cixtech.com>
 <20261117094335.1393735-3-Jelly.Jia@cixtech.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117094335.1393735-3-Jelly.Jia@cixtech.com>
X-ClientProxiedBy: PH7P220CA0074.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::6) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|BESPR04MB215853:EE_
X-MS-Office365-Filtering-Correlation-Id: 32de6039-adff-4d2b-c195-08df472bde64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|19092799006|23010399003|10067099003|4143699003|11063799006|56012099006|261021123027099003|261022105027099003|261021121427099003|261009223027099003|261022075727099003|261102123227099003|261026140227099003|261028144727099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	CqY3Gnhs69EpeY48Hz6nsQfNQhqWptKSdWpCnQKYGU+Da/EBQWVG5UKFP8o4/sYNL5J8CEAQ80ww8UTtC2UUg3caD1Mx8KEUzSFkzBerPP4jzKre0f97X32/sJGPBhh6JDnynL6Gz064qXMdauDtqTVr9B8M3UG8eU0/1Typ0ZkIEMdI0Ovo34tvOCDE89afg+cuZ4hApSMuS2OxdS4cBnfqs5ma+I+hN9mDtoFnZng7Mmr94+NAbnOYO+g3E2nkRWUVmnGdVKvtYybB3asNbGnuUf9ZrSxtBZ9ac8eeLCx7yL0S8wgx5SFIyh2tqyQ+Z4vGKdEk5SNGTc3hTE/Vr87I3/7G2eT2Y1LKZ4M0oTez3lPgr0M9JK+oeZwHFCoCOfkZLWSC4hYcYBtbv9XIorFdOCuhJrcCoUsbdINsfBoo+i0gZEPwEkArjOem/qYrcMGiv2Meu5WsAN6syTbkcp9wF0D60DN7GiDiA7oo9jaEy3Z4y160rNJ029FBnzYGY1bCjefQmNjrBvmHjpkECmt38b2wCvepmJB/rpIoz/IoQkh7jS56aqbGy3U53orKq0cKknUCcFGMqfl0KIdFd60DZ6dfZ2eyST7dsbTHnQ2/faqCDBYoC7V7gU6WIKt8sUYsV2hiJ+ctKIZaw6wewPbB0dTTeOlVKRyt68OKfYs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(261021123027099003)(261022105027099003)(261021121427099003)(261009223027099003)(261022075727099003)(261102123227099003)(261026140227099003)(261028144727099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UEQIZ7QpfOaG57lSNrEOPPOOh8R9OzgVZBR0t+vd2LMAU0l8xSKpLUGCNNX+?=
 =?us-ascii?Q?oHv3geXpk5bGSNDXD21DrO+gVHgj1bTw1CF06Cn2KlpUXu5LAKah4v16C6uT?=
 =?us-ascii?Q?Hx4QdJmcZJ3r0tgw4UJIYA7ZKB7vfiXN/Cu1R0hFIaMNQujSnepTQJ6mmYGF?=
 =?us-ascii?Q?D1m0syugn5FoOIjLwdHfELc+h3UskJjSKDosthQnaQS5om0q9COL3A9xXNVl?=
 =?us-ascii?Q?niGNNEr82fES2ZJr1e5QOPlC3hhL1UZWVztq4fOE47g+eQRc6h95/QS2K3fs?=
 =?us-ascii?Q?ilS8JkFoJhihSSrTPjWtmH3G2JUFdisB5BKVL1EO3TSLBKPvvhKetKu+phha?=
 =?us-ascii?Q?Jt9nO7fGgb389Jf0PzHY52y8eLT8KyDNEkS8+4MzjdEfN94J9ql66C7tDqiE?=
 =?us-ascii?Q?L3jPgv05+HrqFcZR/6Mcww18OqIeivWy+agQWAKl+ckh/7ovx8iTST7kb32g?=
 =?us-ascii?Q?d1fHm/MABM8F49kGfEVCAUPojmFJhE/SHO+NS4XhJL8EEaZHqXLrMnsRSU28?=
 =?us-ascii?Q?mYRrTAdOvD4zS2stivD+346HNzrlRNcmw58bW6y7Lz5I7k/TM6blPFY5qkUq?=
 =?us-ascii?Q?0OvbBFA0xf8OG7qzRVO97/CLlSdDzc0w+AIKdJgkjlPmlXIlBU2rc7YYIAT3?=
 =?us-ascii?Q?plr7JvMHLgPoGEarfB1QzE392u3zMnNRzWYERe1piqdaEZDpKR9HDniOzGnD?=
 =?us-ascii?Q?2NJMVPtIPXX0/4qD7RQ1/gGEqfESa+zKVh3+Kq36iIq2zyw3mHVVNVBsHKkx?=
 =?us-ascii?Q?8D9ZTdftgHDOvmrXAYCfiWLx4gHmZ5VJ/0BtS65B10KzTWkO4Nhb3rzYLgj5?=
 =?us-ascii?Q?m8d3vdfZPeKxDCLxlrou5fuyzH/iQiJWiyy5d5auVJvRyw6V2hYxXagbmjnN?=
 =?us-ascii?Q?DurLkpFSWymSjaXONq+Ugvl+AR3sDnqb9pFGrnUI1i8SQhKG3UKiVbNWmAMu?=
 =?us-ascii?Q?sHFUlLwJx2qkXXHbV0kb4zzzZkuL6lNvcvCtsK+xNgCJfGu2NhANYVIqb1Aw?=
 =?us-ascii?Q?xIbIFejHQSB+CPkLuG9d5AmcKYvQIDMafscauo5/3QYRv4gS2u6hg+zLFZFs?=
 =?us-ascii?Q?ayU/dsJeLtCQM3/ScEnSNvMvXuzbxg5v5IoQmjLrvPWKAlj3PtQ3xUCpNHvu?=
 =?us-ascii?Q?MdXzgYaty1UGOvF4utWHz/Vw0GCGJdaBUlthgNQYO9xRSldWTrY3zStOchJf?=
 =?us-ascii?Q?iR/36m5zrltP6r4+rI6lP4rNsKuztmjYNV+woTuy5r5ZdHxdTHxSNTwOdjFz?=
 =?us-ascii?Q?HVJ/drV9IAVkQMOlvp21wIIkl6zhrXvrrusgywShMYbcTZXgbI39H4eW3jp8?=
 =?us-ascii?Q?V6AQ3GavhCNcynZWTTaOrSUVOhPbztoAdiU317f4dOJuI20mTyuSWdq0VgTz?=
 =?us-ascii?Q?k/xjz5FqxglJ1O7m1n9tO0ONvDujME6oLF2jlpxxmZXHHPjrpNodqfILeSuu?=
 =?us-ascii?Q?yjuKGRIsVeocSeKSkaXB/jS17nKQu7C1kre5iRg35bKfM5qvjey/r5rHwbcX?=
 =?us-ascii?Q?jZEApozRS36KG5SCumUUYhdKpdirlz45qYOTF3QFgU6/fUx4ZM1Vy5Rw/IRL?=
 =?us-ascii?Q?jMO/MlofUF59yFhbgOcyP/gfLjYjF3JH90cmBGo+T4ncjTT6FoOo+huWo3aD?=
 =?us-ascii?Q?aifdB7bT0Liyyk5RFmLX+fNJqqqg4BhXY9gRqVjAdEEN7iSXqnUlhIFANxZY?=
 =?us-ascii?Q?G6lFWxsfFQkTYoOhs7VESYnDIqUMMyCs+xwkLc6W0zgLc/6CWE7nBf0rM1SW?=
 =?us-ascii?Q?Qp22WliIXrC8HKQnp7MX9YOkEosMeLSHFngZ5YLqPV/Euboj0ugJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32de6039-adff-4d2b-c195-08df472bde64
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 17:29:45.2599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6IIu6mT0w6wAg4XQ749X54aaGrF1qifii+so02XRqb7lMPSoaxyhlHd+dNiWPb6gbIvJd8IWfluyryN/huIhG31S2CiC9CjpLTqh5PiY8ZEuG0zzt1nCfTxfIOnkLwn7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR04MB215853

On Tue, Nov 17, 2026 at 05:43:27PM +0800, Jelly Jia wrote:
> The controller's address width is used to configure its DMA mask. If
> dma_set_mask_and_coherent() fails, continuing probe leaves the device
> registered with an unsupported DMA address configuration.
>
> Check the return value and fail probe before allocating DMA resources.
>
> Fixes: 5d099706449d ("dmaengine: Add Arm DMA-350 driver")
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com

>>  drivers/dma/arm-dma350.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
> index fdc4cd224579..d9f1d2976034 100644
> --- a/drivers/dma/arm-dma350.c
> +++ b/drivers/dma/arm-dma350.c
> @@ -553,7 +553,9 @@ static int d350_probe(struct platform_device *pdev)
>  	dw = 1 << FIELD_GET(DMA_CFG_DATA_WIDTH, reg);
>  	aw = FIELD_GET(DMA_CFG_ADDR_WIDTH, reg) + 1;
>
> -	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(aw));
> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(aw));
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to set DMA mask\n");
>  	coherent = device_get_dma_attr(dev) == DEV_DMA_COHERENT;
>
>  	dmac = devm_kzalloc(dev, struct_size(dmac, channels, nchan), GFP_KERNEL);
> --
> 2.54.0
>
