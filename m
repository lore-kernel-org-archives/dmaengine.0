Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795022137;
	b=T/1pCO7j/C/jKWV2kMDT65NXzxlrBcf1j44yI45hZHrab4l0lljqS1LgQXqo05fDCqGk
	 891gCEU/Z9Kf5ZGrfwMoMR+qS0ZokQ2Wno0eQ2dPNG9oswafl9naWGcpNi/fGodhkO5E3
	 KsqYrx2ak7PO/TMxkAmdNSPKO+jLsgFaY1Qj4WjGL+2NsJPXn5VwfI5RbHBwQmdWNl7ZI
	 oa5n2x9jmg8Hr1qG3GInBZAz0fLYhdx4MIONqlHyVVHuRRUeNXEm137ew0p5jVLhk3qdN
	 nWkJf2SwtEac/lk6jgRaAMRiiNt6JgYQGAYH6TtNv3lIFGxb6sDhmFo1KeL6JekvIGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022137;
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
	bh=fXSfYWa2fhjUhlvut7EoHcpOwzFdqoq+QOjqDYbWe/U=;
	b=3A8LEJVAtUTx9CQib5th4EnKWiIAJAjWpw66n71kRNlws0xuSRg35DnEpBUIE6kAKMtW
	 PXAYhaz5npxlXZfi8rBYS9JF27azspEi7m911xCVCo2YqTsoCdmnTzExgYphTrst3xnNn
	 SSASbTeBHU0XTdu8p1ZHD7iahjhY5Z0AN1jaVzLgD4SNVWoWzwRfvrQvRfFut1VO9FUrs
	 91Px5eTp5B9ZdV3Dy7OrX0nBbHrK10H6VtMtR1dHb7hhUBg+lv2v+a2YntFMabSiv4q4t
	 so4IX9BVo3YcQ4oj6m7BUesFHhP5VL619nU17Bt+TTYZEIXbpqzmOnl2U0bCz3TME9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=pk+kj5Au;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.29
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012029.outbound.protection.outlook.com [52.101.66.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC256606A31C;
	Wed, 18 Nov 2026 17:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC256606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=pk+kj5Au
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMPJR4pfQIhA0PIXikYqd9oUF4nOJS1Tgx0eFRILPXsq9wryHIgB6EXidBJ1ajhWSL4KSy8ZGHPK3884v5eckD5A61en02AuI7LsWg2btgVNHIeUTJf2BajYBEOT5n81X6/w9mbdUIIV7Kc3aqM5TtxacNCCz8PU1SstYivrVCwFOTs0naF5MU/CYAz5+S8dOddsePh0a7Zv7Goz1GJXDrbDUA/xDTMMPSgQ2oA2S9G02vDVJnNHr+DlwjL4c7q8mmkNSD3HIe8DyAl5vLx36rMJbRkXQm+Jtm8BXzGjdhzdELRJd2QoEcIiKQr+p3NKEVq8f8Wb0NPkUIyl9nbz9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXSfYWa2fhjUhlvut7EoHcpOwzFdqoq+QOjqDYbWe/U=;
 b=ogIWVdRMzWt2zINrNAlUWJUwhLSPnshZfogDeJgh/athBzLXnQi/WuopAP3fV4J/x7l3bYf4FQkkc8LK+jLcClfb2HoSskn+e96UTUElyqDlFRRmJhhCSnYHw4E/1F1pnxGu4tBk1rcWRLN8lAWacj3jKWUvYE6WRx/74ci4gYxsXy3py18AdvMdPy6XpKuvYjnFkRhQvj2RdtE1dpeiEL/rc8rlJvO3jSL+1yuXe7cBPw5D7uExwCIk6hZQPgZ/DPH80udZk0/kk2qNq7BHAEiyl+zWPvAmfAkQECDcKFFH2LLN7xEPKy+cdtYUYahEP4G3eVCLhxpgCP2xXZUP8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXSfYWa2fhjUhlvut7EoHcpOwzFdqoq+QOjqDYbWe/U=;
 b=pk+kj5Au3RZVFXwGp0j5i6tQ1Vl7n5U7XU0SNQ9iwPQBGE2cF5GvIPci223HfCiTC6LqPI6NNWa39y2BoSLbPFnj9a/iPw8UJQPSkyt1A1DrGSioNLNpvkhHXvJc8gMnxZQrjJD8BnQA+hVtaZkeI5PL0iN6NZ3fpRhZK3CVZMjYAoE0I+/Ne9c2BTf3T/vCfkg4qZnBLaHW+Y9ZFjwRmapPZ/MIumBLZi41BM9ELNZdiRxqA6WcxH42BehDKZdd++NL9CefPJ5gSKRqrPg8YmxV3RvphbGnyBn7cvw3sWlHvHtWCEpQynY2pHfz70hUsHWcriI8PA4GaMsDD0664A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS8PR04MB8450.eurprd04.prod.outlook.com (2603:10a6:20b:346::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 17:15:34 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 17:15:34 +0000
Date: Wed, 18 Nov 2026 11:15:24 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: "Golla, Nagendra" <Nagendra.Golla@amd.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Harini Katakam <harini.katakam@amd.com>,
	Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH v5 4/4] dmaengine: zynqmp_dma: Add per-channel reset
 support
Message-ID: <av3dLAxz5TvMf1J6@SMW015318>
References: <20261106-adma_per_channel_reset_v5-v5-0-f9990669362f@amd.com>
 <20261106-adma_per_channel_reset_v5-v5-4-f9990669362f@amd.com>
 <avtpSXEdyeWpghqd@SMW015318>
 <5cbd17e2-f3ee-44a7-9a6d-bde4380520d7@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cbd17e2-f3ee-44a7-9a6d-bde4380520d7@amd.com>
X-ClientProxiedBy: PH8PR02CA0043.namprd02.prod.outlook.com
 (2603:10b6:510:2da::12) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS8PR04MB8450:EE_
X-MS-Office365-Filtering-Correlation-Id: e8699656-ae2d-41ab-5695-08df45978e54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|19092799006|261022075727099003|261021123027099003|4143699003|11063799006|56012099006|261026140227099003|261028144727099003|10067099003|261022105027099003|261021121427099003|261026121527099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	yDSiku9Ulccn+RhD72a3u4zCPQl6rXVvO92iwlUiDp9sTMFgB650JTYK/0KrHtNP1Q8XN6VsuwjAAhTmC3jqxlr23wC2F8NXmV+Bu1zVfPf2NG6XhtkPbPqbGvVfBV+I2iyAWciJuAZh2/a8IeXi/VVwyw+fjRelsd/0cA9ofpL/W3APSgcK4/kwE8GtNtuCwBtOkJdO2lHzTIhp6p9hPsBn6hrU7VogUv0Oxq7E4A+gr4HEXPuHdMZtq45OT8rodQ22npv3BgeUbeXJ1R7P70AEsXYOuK+tSAvR/aLH83F9L4M8AuXg5y5HI+6pFUgwidkk9npWdm+VuzJ5KTelh86QKnFT3ETVKWnaWCgljsQYn8QpCpNq/eLVF6TarSCOA/WXmnQrtIy35MPkdM/TfbdjDhshezi1FDWftUX6Hidpv6GOrWljJN75aQ6qhlmVCaFz5B1/gl3bj/63XwMcziUL3shuX5ULD1BBNQ5nxcFnZp88uZHSYuaDUZUqWkHw+hZfqnliG/HxbKU2LZBk7465tHvby7+sbwRAoMiHOBgCgTkssx34SIu66Tfd8qrf4/tYt+ujLvs5mWd3Qh/Hvd/0DbBVYyVLDgQkl72lQltjWeUNv53C6PjhIpLpJo+fafTK+EkWyxUQ7ZjWxJR3v0tbxf4y5P+1QY9NizOz4IA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(19092799006)(261022075727099003)(261021123027099003)(4143699003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(10067099003)(261022105027099003)(261021121427099003)(261026121527099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6ckT1bhubWpzdIh9ymSWTUHsrpJE2Y6G4nDyDOfOCstK5L+VCJlAe+O/qV7p?=
 =?us-ascii?Q?RfLQ6DIKmVY8oj/4Zksy6LpFnusxsnsFY5wgM0MFyQEq5kzv4XecGrsp3LVV?=
 =?us-ascii?Q?KoxB5aejS2xgSMW9T6uioPrJNghD6cnHUKt5KhQ8RUBEqU+6YILU1xGzoC4E?=
 =?us-ascii?Q?JV+MivzJ+QVj/WMXn6O9qwsywWGWWPqBGfWjlyo8YtBcysnfyWZhNdDVnS6n?=
 =?us-ascii?Q?l7sACo3e888ihE1606HaeV/HkA5Bw96RSMSmXqEYa6Si4zM6xwadj6pCJ2mf?=
 =?us-ascii?Q?8RjJMu4JPWN6tfXRGWfPXwegxnLgETvBfHcer+AvO3kDZ8IqothZ+BRZb9KK?=
 =?us-ascii?Q?+a6ZxY+CeClWwhTov+ZzuI3l/UtAhQpu8LAVInkn0g9cAixlRxo4cDti2sHQ?=
 =?us-ascii?Q?Sbp64J6f/x8Cwkyh4e01hLOVkDOjawyeF0n2wmbcWzcpYWA1G8ywMT7w/KeV?=
 =?us-ascii?Q?iHE5vAdfjb2YcAzd67izkP5ZTvAJd/s7GsRR/cvlNH2EcYQx0AGGU75C3Fuf?=
 =?us-ascii?Q?OlJO7AsXIO8GVvq2xzQeSB/5YNgfRCnSkw6GikNHFE9PPaTrHRxpoY6Lt7jN?=
 =?us-ascii?Q?FP4wJ+X69l3yrxWi2Utgh4Qb7KlusqdSKyETCJnfjBvPWxNIlWg8YKqh0vEG?=
 =?us-ascii?Q?1JZPmeCyTsWitxTr4oHlfyfngv18hCMIGpin8TJxbgR1bBjy4Ll2lC+dCaTL?=
 =?us-ascii?Q?zoHT8ztJ9uhMWdgD+cnW7VmlPk8jxK8V8jivEdYRaoDkk5nplOsMPgCqbN1O?=
 =?us-ascii?Q?xtKsQQPFe6UZTUhiaVmV+M5tzHY06Hy1HzD7ct/I5G5/e0tFCEsh6ROmKW9P?=
 =?us-ascii?Q?y2Q4Q2mCuM0Gk5ZD/87OIyQGQ1MmJ0HT2AxxLvBD7Cws6clLbaQZNuSHryYl?=
 =?us-ascii?Q?1rd2/DHkslNctaxrnS4DAWTZuEABIjZaNAJwbqKSaibnxJ0B/yx0MEIh3/Ys?=
 =?us-ascii?Q?Xv2lfV8na/nofONaM9s0slP+rhRhI6nDuZVWjXbq1LO6CKt/k27hEehnUWV4?=
 =?us-ascii?Q?RnxAPH6x0ZJYiSQFjh/grBFWhuva3JyR7m2OBJM4d//sVyFoyA9BjvJzq6l4?=
 =?us-ascii?Q?4Xl2FwAPbMiuR45MsdOcbJcYXhhVL8oMEM/geK85uTDMmfEp1CPr9zS51eCw?=
 =?us-ascii?Q?l2IXgYqJVk5uzMgYHfsvBXkaMaZ0M5HEIFpxsA3t5AsLPuJNOI7/ee+a2V8n?=
 =?us-ascii?Q?npOOyH50BSbKLul5RptMTCCWWnh8ly1RZMdriGBYBsDP45IgEVd0tt3Ynwge?=
 =?us-ascii?Q?+xyZBqROIl7zO0hPJ7NYrfVbelKS3lt5Ht3uMTWR+WCARrny5tSPOUBNPGkG?=
 =?us-ascii?Q?66etITMp5flP4RAsxClF2sQMKL5Gjvbr7xarZqmnhjSJxZVmckq+cpB9UsVi?=
 =?us-ascii?Q?vyYHn4iCDcWo8r4n6keQ+OnKq8TwHpUOJOBu5J9B8/vBr6QKDpAMi5KhnmdJ?=
 =?us-ascii?Q?//6bL/0m8sDbuxgh5r2Cmgu934Cbh1irrVmYjonzmLGCZS8eFpBWH0xivCmM?=
 =?us-ascii?Q?PP6NVY54y+Zz44ha18JY93ytYjZTT01rhkrvp++YxoWkVkmgejN0gGS1tV9F?=
 =?us-ascii?Q?omqjY44FBldpCehJvNiwSWr3o5TQKT8kOuO7MKaQFPmKPvBVFJb1MFYjZEdT?=
 =?us-ascii?Q?+6w354Zr/csGBaPZbPwKQbhW0Sd2PHO6yEA4NXs0/M1XWfXMf4THZjwpferz?=
 =?us-ascii?Q?dKGRH/mH6SQba+FgzRtgi1XoCDidK8OEf6fSVfbXOGqfY8Km5iIQI8caIjzE?=
 =?us-ascii?Q?1tPxBOpGqe88NdxuEddtPgrpQcAw3aCOVMFcHWVcBxFxGKE193Em?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8699656-ae2d-41ab-5695-08df45978e54
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 17:15:34.1427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PtmDeMwL6OkcdAVs9zs11iD4c0FKsDo1pzeXYUrdV2cxvQ5APNDpJIsks1Sk2yy4oTs38xBN9wFw7l93z35R2r0pa4LOiJGjNZNuo75D63e19bPhanqHOuFyvwBRrP0O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8450

On Wed, Nov 18, 2026 at 11:54:30AM +0530, Golla, Nagendra wrote:
> Hi Frank,
>
> On 11/17/2026 2:06 AM, Frank Li wrote:
> > On Fri, Nov 06, 2026 at 03:40:26PM +0530, Golla Nagendra wrote:
> > > Versal Gen2 and Versal Net expose a dedicated reset line per ZDMA
> > > channel. Trigger a reset pulse during probe using device_reset().
> > >
> > > For Versal Net and Versal Gen2, reset is a required DT property, so
> > > probe returns an error if the reset property is missing. For legacy
> > > SoCs, the reset path is skipped.
> > >
> > > Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
> > > ---
> > >   drivers/dma/xilinx/zynqmp_dma.c | 10 +++++++++-
> > >   1 file changed, 9 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
> > > index cb0eb13f9b05..12696fa44c66 100644
> > > --- a/drivers/dma/xilinx/zynqmp_dma.c
> > > +++ b/drivers/dma/xilinx/zynqmp_dma.c
> > > @@ -19,6 +19,7 @@
> > >   #include <linux/clk.h>
> > >   #include <linux/io-64-nonatomic-lo-hi.h>
> > >   #include <linux/pm_runtime.h>
> > > +#include <linux/reset.h>
> > >
> > >   #include "../dmaengine.h"
> > >
> > > @@ -937,6 +938,14 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
> > >   	if (IS_ERR(chan->regs))
> > >   		return PTR_ERR(chan->regs);
> > >
> > > +	match_data = of_device_get_match_data(&pdev->dev);
> > > +	if (match_data && match_data->has_reset) {
> > > +		err = device_reset(&pdev->dev);
> > > +		if (err)
> > > +			return dev_err_probe(&pdev->dev, err,
> > > +					     "failed to reset channel\n");
> > > +	}
> > > +
> >
> > Use device_reset_optional() will simple code. Your binding already verify
> > dts, needn't check again.
>
> Thanks for the review
>
> The binding schema restricts the resets property to Versal Gen2 and Versal
> Net, where it is required.
>
> An unconditional device_reset_optional() does not enforce this required
> property for Versal Gen2 and Versal Net devices in alignment with the DT
> binding schema. If the required reset is missing, device_reset_optional()
> would allow the driver to continue probing.

Yes, but I suppose function doesn't work without reset at dts, which is
same as that driver is not probed. And new dts require pass CHECK_DTBS.

>
> Whereas, in the current approach, the match-data check limits reset handling
> to Versal Gen2 and Versal Net. Calling device_reset() for those compatibles
> enforces the required reset property and ensures that probe fails if the
> required reset is missing or cannot be applied, in alignment with the DT
> binding schema.
>
> For legacy compatibles, the driver skips reset handling even if an old or
> unvalidated DTB contains an unexpected resets property.

Fixes these dts.

>
> Hence, we prefer the current approach. Could you please advise if you see
> any concerns?

Similar case is about clk_get_optional(). Only check critical problem, like
out of ranges.

Frank

>
> Thanks,
> Nagendra
> >
> > Frank
> >
> > >   	chan->bus_width = ZYNQMP_DMA_BUS_WIDTH_64;
> > >   	chan->dst_burst_len = ZYNQMP_DMA_MAX_DST_BURST_LEN;
> > >   	chan->src_burst_len = ZYNQMP_DMA_MAX_SRC_BURST_LEN;
> > > @@ -952,7 +961,6 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
> > >   		return -EINVAL;
> > >   	}
> > >
> > > -	match_data = of_device_get_match_data(&pdev->dev);
> > >   	if (match_data)
> > >   		chan->irq_offset = match_data->offset;
> > >
> > >
> > > --
> > > 2.43.7
> > >
>
