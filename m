Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=40.107.159.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795547054;
	b=YwOz/f4JkX/QSQkbxv/mlGTd2hBQpUoqPlo8TdJpRAK0eli2H5Yi9SB9QKgKfLuhn+cg
	 w5c45aYVOnjIqLITM0R5qMIpRNOueSuzNnR23t0flQ6V3BsB+9nW+yWL4pNONAXd9Bgoa
	 tlKX5d7MRWFDIV40qt8izPfKThE/0IFVZZSnmImegETD9tYYFkDaQY6JEZW3pDjLs0GLS
	 AEmwP8CvvhoJYe8mwrykybTjddbM/+mhe1WuaRd5A/coDUVHm+WMBO/tI+dlzUG9HYCHN
	 lCMTl319OL7dq4CX11QGAH04EZYrCROB93xgdNUjpckR29h5HGrnsSt2hvuKBN/Mvag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795547054;
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
	bh=NIi77ZISdUl4L5ymADSDxwmE2kQNe2/OIcxpToZgsBA=;
	b=yBFKP1hmtmx8Lwa8YOBwqtJ6AUeyAcgT/qV7bqUnTVBZVe3Lczp13JS3vxF2ZPi3B8VI
	 qpdmMBqGlhMDsjCKCRwr2s53XjXYEk0gSnNgwcPY+47WR0xpwZAM+oOxvG/usMAeuDyg0
	 /uD+rBy9OToQaKrNp+ACo4i+hxVCrhyBrySpeiKsP/V6OCMvmavSqNIzRGhO6g6/QXARf
	 We9xeYoSuUoM1Wns2K5qe23mg/vsVeOD7zQXnfly5UdgUSJqHxXYlzPni6/fE83HtbgwI
	 8GRjRh7E2X3XV9e9lDzLzHvvJtgkMAhPRvCByhbxWm8E9ml6x4SI0D/9ePxuk6p49ug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Hot2KgRp;
	arc=fail smtp.remote-ip=40.107.159.54
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013054.outbound.protection.outlook.com [40.107.159.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260EE606A323
	for <dmaengine@vger.kernel.org>; Tue, 24 Nov 2026 19:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 260EE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Hot2KgRp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mAd2HlY0krzVOOvPahaVMcOk/ozZGHJgKIQbdrwMF81NClCSi4SGyN+YY1nfZd5nCvI1gAorSvTIeE3JO5wG+jwW7MW5/EKTW1x1NKAxQ8A6MvUooy6dJNVugtCOPgKQVOH+jwLdqNWuHbvJufwEPgLldMtklqbcxBXdNRRrg4SRRYL4kar41VI3tIn5YhZAWPjznhkQ5Xx1Tyr9LN+gS4FtQRJvHYOpJnGuJ1QcPGk6LBD28CExapTv/9UDo3sDzAF1EopZ1e8rewYf6UTqU5VMC3hsT3E53IFrSbq1vSs1PN2MGF71OhOJ9HTWBDXNz53Gqg9rRPQnqnL8hSyl7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAdr2GgZKoF8FC412Q1O2pPgkpIIK1umQhkSTEVHobY=;
 b=yfqhYJe7pZIU8T5eZQcJPxNS98s49warlBtUAhQ4NK/NS2DO0A6DY85Ga70O52pGrU86VSEiOM4TinmVVwAkh+XqRKb0QGWjRpmakb/EVRQMa4lbqlWMH7EvgLyR+fBS8/5PyW25x1aW7lR6QSDTuNjtJA9qrXu1XFA7re1+EfTR8qfhIHliA+ZawZS6/0+m+v1sq2t+gMD6E1SAS2G+t+dPMlhu4ig2FUTDmQDAQ7VKceTIJIwB7krbpnG1p4wCPMpfRvnxfFgab/0aCyEgfyfWwK9fwcs3skXaIDNzzI0l4Wc6H18JsRFe1AroVKtIRYLJ2fEUmB9fAu2jlmPvlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAdr2GgZKoF8FC412Q1O2pPgkpIIK1umQhkSTEVHobY=;
 b=Hot2KgRpP8dmSJd7hSVqVSvGfXDM8BdLIziAp8NE+PKrtVnLgjM8AJ+bDSzo5C+3ZC5CibO5+LdBYXAD0hWDpdyjq2UAWK1ujqMHyniQlW4Q5sHyqlU9IwZqp46vaGG1bQ+5jKI+rFaDlH6E3ooEWjUViIfF71ankf5yF/HQu2h2o0MzhOtE2CKScrdTmxsAhgUsE4OY+gvYTnwH68+I3wPyttndO658h+hGNwTqF0ProCvY8auLbEFpLh85h4gUPfJUgntAOt4Ve8FmCnTAnGC4P2hxhe/hHpbtoZG8Y4SeVADrpHmedp+L1wVDisVah1A4/kk79GE9uRQhJ+9+3A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV4PR04MB135723.eurprd04.prod.outlook.com (2603:10a6:150:409::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 19:04:11 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Tue, 24 Nov 2026
 19:04:10 +0000
Date: Tue, 24 Nov 2026 14:04:06 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Logan Gunthorpe <logang@deltatee.com>, dmaengine@vger.kernel.org,
	vkoul@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v5 4/4] dmaengine: switchtec-dma: add pmon sysfs
 attributes
Message-ID: <awXfpjkv0MBDvYyK@lizhi-Precision-Tower-5810>
References: <20261124155024.920403-1-logang@deltatee.com>
 <20261124155024.920403-5-logang@deltatee.com>
 <sashiko-outbox-231501@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-231501@kernel.org>
X-ClientProxiedBy: CPBP307CA0023.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:2::12) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV4PR04MB135723:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ba8068a-2c8e-4801-aad6-08df4a5db916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|23010399003|376014|366016|6133799003|22082099003|18002099003|3023799007|261021130227099003|56012099006|11063799006|261102123227099003|261028144727099003|261022105027099003|261022115727099003|4143699003|261021123027099003|261022075727099003|261021121427099003|261022113327099003|261009223027099003|261026140227099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	aMaiUy4bUcFDNxGc7x5aitIqTevBDmrIwlT0s+fYZwISAOr4bbG24piJOmu/iZ4VDTOc6Z13O1qlP7DW32lQtaoULHRp780n67Pc1IvW1noZqtWtH9RTbaGhJRXrunU9DRcfsAQDqccI77LTteX/xLWSuuEpVRfoX3NLzWTZJqGE3Qez2lilnyaIWMa9PBrXyVfVat/PvaTdoZo1GdsbkoMOa1Ie3BqvrRyWPZJjeeMvn9ovim/7w8Y4jXgyLLJUjr99X7f9agKoKQTjkrVFyMcVOKraBoqMaSfTJCecHSD9SjVmMLfwLIYim0S3tNW1eQJli8HYnV0rIPekmB2r+ePuKoEzwauy3jOcFn67lbnQa1woHo02eDsrG6eW47ZBW5wNqpQpt95l+HYl3cuRNOf0KSNcSpnpQJNQya7bqd5Rl5O5RMzYeJZEtai6JbcVADkgUql5W5/ccWE+OCVlOWF1DlCEoic5EN6qrhmnHcsK80zH0QI5KHzYRj4zBSXeJq49tk0ohug4l0dyfwvR8x2WcD3E+M8yd0GlGD+Fsoz0PfYZdpGbkwju/GPeCR5Pe+/gLmlUgzzed4mcTlDBpH4746zRT0qHl/LRoo0aeTM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(376014)(366016)(6133799003)(22082099003)(18002099003)(3023799007)(261021130227099003)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261022105027099003)(261022115727099003)(4143699003)(261021123027099003)(261022075727099003)(261021121427099003)(261022113327099003)(261009223027099003)(261026140227099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?M3xkkhmSiKJSLDt0UkJUK6QC8rEf6FQR3TeE5I5GKMmKOzOZLtTGIuxV4F?=
 =?iso-8859-1?Q?1pxnfn3kgflf8RAZzvj1pzoF/YDPuOO1uwqJlEBu7VKW0TMBEjodOt990S?=
 =?iso-8859-1?Q?bjDq7/iKczedu+2cFy7IxBOKr6ypT6p/dNvyOm19BIxXwBps0KHUir/8G6?=
 =?iso-8859-1?Q?RgatYe36P8DlwpCsteXWzvcf172XbgATDCV1ybzZluYv1gMz4srMEfipFn?=
 =?iso-8859-1?Q?yX1ixFiDVT5dBdxqiisceXL6AwuETYE8LI1/m/iz/quF5lFifbHoUHU2bY?=
 =?iso-8859-1?Q?5heX5isfW5pcViR+kMmkvCX8GFWP7f8mnP1kyT3+zoNHE4ZU2PM3Q0y9nU?=
 =?iso-8859-1?Q?IIH0ymKqsFYiVJFYGnDWPeoc+vic+3hLEyJ8gTmsMsFp7mjuRRAok2Mfn+?=
 =?iso-8859-1?Q?0xJzHiCb7vG2W1eRQGtY8QcDYU1yR3OkNKbWcHOmAtsZniARxzxSflPxRq?=
 =?iso-8859-1?Q?+9hf9XDQvDArBwjfDT75O3GIzqkvYNTcJrJsB8ujdjNuEWQ5HMbiCxLyoK?=
 =?iso-8859-1?Q?4M36ca0S55F2Dxmb3ZhzrT/pcoCyVZaNKkP3n5jcXVPmaqxejKfVv8myMX?=
 =?iso-8859-1?Q?ufjlftdD0pRjdFuy5dXduEBA4/OuqpVOJgMeyE2Mzuy83hLzAgzdYPhx6v?=
 =?iso-8859-1?Q?Tw2vSwDLt9A6LNEEBt8nb21xCrIsEWseW9VxfsIKh2FTfmtFInXYuKki06?=
 =?iso-8859-1?Q?YV+9ccZ9aMgz0bdRE4Qk4e9i/yFU7+G33tTDvosQTLbf7Yst4Vr3pLT6/N?=
 =?iso-8859-1?Q?Pgh4BXn9pzFuYCoGsEPGAImote+raEZSfMzT7lpFNLdvHbg6pyQDoeXJKV?=
 =?iso-8859-1?Q?y5gg3ou/FU4Wbx8gPO0F8dCrFdN61pm+BTsQqhqCly75liBe8cY5NOrzoq?=
 =?iso-8859-1?Q?HQrklfe0+CnOjsdfHp9vEiEjLA1A3J3fKwhllafReD4dhjmDcPMj4m21qa?=
 =?iso-8859-1?Q?uCNdUWvFFSYNjWu95QReexlO7A9bd+FYPx8HwQeo4lIPfAvvZVMAuP0/rY?=
 =?iso-8859-1?Q?5mEz2AK0tJndESsl3v9ZNbfT/YmTycUiI/LAP3cEIt3VJTdC5FDeoGzz+N?=
 =?iso-8859-1?Q?ZqUv/fDk3Ox09+rxXvb1zvoUk99EL/EtiYeSjdui4dLUaSuto2oZ75EuVD?=
 =?iso-8859-1?Q?qP4JjLbmPy0oaZn5i8/gEc3A4MHjKylkPc1K2CI+uGTu2NLVRpXQYK20eB?=
 =?iso-8859-1?Q?0vlJ7WroeIdfB2LrO8dufPLAhB2QPuUVFVY3yFb6mK9ldcOEiUaR4rb67N?=
 =?iso-8859-1?Q?Bo5VV1OFd+E4og0m07XR2+7LrCXsi0XsBVN//YTm+qsc1csfF/kS9rGGuB?=
 =?iso-8859-1?Q?Nr2Z2VGjeh8q4Q1EpAv7F+hcaKLtAUW1Xgcb8bV9O9KZKDUvVBWa75KHIZ?=
 =?iso-8859-1?Q?Eo3c+nXscATVwbQEuLSQlaxvQnQSAXfYW5FuCkBM3t5SEB7/sXulUccPoe?=
 =?iso-8859-1?Q?X/9Wrynx8IoUv/EWNDFe8sn1X8j0+cHEbR3PQYIJR4kT0+55+2L25lMm2M?=
 =?iso-8859-1?Q?L1NLHRNwAEbhqAvGOV9uxCXcpgr/fAEs0Fzf2MEHQm9u71csk5PpHOjBtg?=
 =?iso-8859-1?Q?hPK5vD9nbFp11rZSToVz1xyr8uht9LdVj8cjOZqrHgTxb4z8nqP+jLByXh?=
 =?iso-8859-1?Q?Qs8xHqEAc3fCrjsbG7tN5aN555jJLAlvQZZozFc2uisc+m5S06O3NeRP+S?=
 =?iso-8859-1?Q?Nep4/0DUxt6B0CK36tGKJaZxNHiJupW7rUeM0viyut29j4drwln/dwcJP1?=
 =?iso-8859-1?Q?dwIEGjCzFGicWeoragKst0fHHe//X1I3LYuNJVI8mTu43DgnGbxa5/j4Yx?=
 =?iso-8859-1?Q?akeQK1tZqcy63quK/KHhaZl5cY53gKdnGH5hRu3rw0JDwKtwJEP7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ba8068a-2c8e-4801-aad6-08df4a5db916
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 19:04:10.8487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yqwYL9Ptb9ckPZoytFHknF/l+a6WaE1M5w/mW41m41P2fGG2AyfBTOr4nEjcpMencAlH3k4vn4oqdU72WJaB4Wg3+3422a4CqoFtI1tv4bAV31qOxYavXgQHs6tIcWay
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB135723

On Tue, Nov 24, 2026 at 03:59:03PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] dmaengine: switchtec-dma: multi-line menu output in
>   latency_selector_show()
> --
>
> commit 88f647b9334dbbed040eb8ea50d2882f9874a0c9
> Author: Logan Gunthorpe <logang@deltatee.com>
>
> dmaengine: switchtec-dma: add pmon sysfs attributes
>
> This commit adds a "switchtec-pmon" sysfs attribute group to expose
> Switchtec DMA performance monitor registers per channel.
>
> > diff --git a/drivers/dma/switchtec_dma.c b/drivers/dma/switchtec_dma.c
> > index 1ebe17095c61a..774b418330ed7 100644
> > --- a/drivers/dma/switchtec_dma.c
> > +++ b/drivers/dma/switchtec_dma.c
> [ ... ]
> > @@ -1215,8 +1222,274 @@ static const struct attribute_group switchtec_config_group = {
> >  	.attrs = switchtec_config_attrs,
> >  };
> [ ... ]
> > +static ssize_t latency_selector_show(struct device *dev,
> > +				     struct device_attribute *attr, char *page)
> > +{
> [ ... ]
> > +	len = sysfs_emit(page,
> > +			 "To select a latency type, write the type number\n");
> > +	len += sysfs_emit_at(page, len, "(1 ~ 5) to latency_selector\n\n");
> > +
> > +	len += sysfs_emit_at(page, len, "Latency Types:\n");
> > +	len += sysfs_emit_at(page, len, "(1) SE Fetch latency");
> > +	if (lat & SWITCHTEC_LAT_SE_FETCH)
> > +		len += sysfs_emit_at(page, len, " (*)\n");
> > +	else
> > +		len += sysfs_emit_at(page, len, "\n");
> > +
> > +	len += sysfs_emit_at(page, len, "(2) VDM latency");
> > +	if (lat & SWITCHTEC_LAT_VDM)
> > +		len += sysfs_emit_at(page, len, " (*)\n");
> > +	else
> > +		len += sysfs_emit_at(page, len, "\n");
> > +
> > +	len += sysfs_emit_at(page, len, "(3) Read Immediate latency");
> > +	if (lat & SWITCHTEC_LAT_RD_IMM)
> > +		len += sysfs_emit_at(page, len, " (*)\n");
> > +	else
> > +		len += sysfs_emit_at(page, len, "\n");
> > +
> > +	len += sysfs_emit_at(page, len, "(4) SE Processing latency");
> > +	if (lat & SWITCHTEC_LAT_SE_PROCESS)
> > +		len += sysfs_emit_at(page, len, " (*)\n");
> > +	else
> > +		len += sysfs_emit_at(page, len, "\n");
> > +
> > +	len += sysfs_emit_at(page, len, "(5) FW NP TLP latency");
> > +	if (lat & SWITCHTEC_LAT_FW_NP)
> > +		len += sysfs_emit_at(page, len, " (*)\n");
> > +	else
> > +		len += sysfs_emit_at(page, len, "\n");
> > +
> > +	return len;
> > +}
> > +
> > +static ssize_t latency_selector_store(struct device *dev,
> > +				      struct device_attribute *attr,
> > +				      const char *page, size_t count)
> > +{
> [ ... ]
> > +	if (kstrtoint(page, 0, &lat_type) < 0)
> > +		return -EINVAL;
>
> [Severity: Low]
> Does latency_selector_show() violate the sysfs one-value-per-file rule in
> Documentation/filesystems/sysfs.rst?
>
> Reading latency_selector emits multi-line usage instructions and a
> numbered menu marking the active bit with "(*)", whereas
> latency_selector_store() parses a single integer from 1 to 5 via
> kstrtoint(), so the attribute's output cannot be parsed as a single value
> or written back to the file.  Could latency_selector expose a single value
> (or a single-line space-separated list of tokens with brackets around the
> active selection, documented under Documentation/ABI/), or move the
> human-formatted menu to debugfs?

Yes, this is one problem, which need be addressed.
the sysfs one-value-per-file rule

Frank

>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261124155024.920403-1-logang@deltatee.com?part=4
