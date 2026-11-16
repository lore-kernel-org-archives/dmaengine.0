Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794864940;
	b=vGqt7kKwczSu0cCut8RIYnUxNBjcpa8EPLu3IZSTxExSp0xVNUPrJUF3aFA3Ee2wgPrQ
	 rb0EGnqOqDKv2rId+WXAQY1SYk+YNhAfSiMvhRaefpj9NK7fkvUmKdzMtqVX0BNqcvwbm
	 RJbf1sE6bxfnlXgs/3lnrl6DELPyld1XFAXmM4bmqBaAQIFp2yu9mWc3/uperZPgO1Uf/
	 AFQ+LMlS0gSlsjUT7wqTln8ITGE2xO7ntAz5YabR2ZFmipSYOt2db8jAfLD61EwZc2Ar2
	 ORIaVohKpOIg3SY4YNSgT4/4UDf4VMw5O4e2PSKctOL/zFgkEIq7z1aj7MxbLOnJuTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864940;
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
	bh=OIy31LYEsRFTV1eFgZfVwe217CIL5Q5t7WG9zGrh51Q=;
	b=Ts/Q/SRX2aq+i2HWsBQGnoDqH45m+HLbaBKyTRY7TmMg7vtjOyAsyfWqVPITcWYQOF2J
	 0SXtIfxBlSN+jeqnWHwPDVcLSeiwVYHBurVZB7yJgQG7jGIBEGbbS5t31jWxKunUOdqP4
	 gNenEOjZ/d+mKCscmighI1BkBdelqx7hxtSlYW0tnL2DXB7jQWOWX4M8IMb4SU0GzQQJB
	 x4GAn8JqlVocBvhyjl84HNaSVf8DtSZQ8Mgn1u+UbEWuZNRQBU2DTSuQbJsmR7y1TyJxW
	 qOCLa4znKg6N+IO9j1TeueX4yZzUHzKTRiz7jopYBc9JOkT4ImwhIfvRxF/nYKFME6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=xBc77XhS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.42
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010042.outbound.protection.outlook.com [52.101.84.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F143D606A88F;
	Mon, 16 Nov 2026 21:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F143D606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=xBc77XhS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6ocXbVEBuXZJDYg4wwr7FSPOzyeGH8fsAxcLJuYkQScTrHN+1AWg/sleQK9cKnqOeW2x5VY86kFKkT2saBes5qMKOy7IarjSqY44aMQTYnVLkjF1VfKmkGY7EXkVaob4v7KI7gQRDHzMUq6/n489mgnObdPDBoLYKLTxfdMd2lKhR3oDuJzSQ9Gz1/D/1r6l4Mt6/bvo0TodcwJBGciDUSD3DvyurhNW8ay/qXilrEK2o5lK75WDyVntU9r8kTADACytvYqSSgoHMTNzVUwGDLaqEM3IhZibNXM5Y2BT3TifFltNlSyrp6gvEoRgb/2teMZBjn+u7gALgUaYyuC/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIy31LYEsRFTV1eFgZfVwe217CIL5Q5t7WG9zGrh51Q=;
 b=CbDHbakDyQaYmVf+KmW3jBolkALD+RWTBhVi/T8HH42Swt6pHjDWExiUyLQanzgKbxKorpw8JnPgHo4kiqeiJwguuCTw7Cz3sX45K7zHept1DBhh6NW33HUD5TiZ4763hYo4TBC+bcaFGxMBzrzOg4R5i9eYOvH8U1Ba7GNYRu187OW842rxScMsfLlcI9uIJx8nmiaBsvY+Znlqmd46V/76OtiUIol3rFTlFPgQuNCCqRxvH4gd5T3cCdMphKNjtszrZl3/N0InVs6woo2ezrldehd7P43xicfjnyOAePN0rORvrl6iCaVPAx1aNKVqWkgPUTpCWpnmKp/vUmOLfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIy31LYEsRFTV1eFgZfVwe217CIL5Q5t7WG9zGrh51Q=;
 b=xBc77XhSsXCajlnUm9Z9GqMwz4Hqac/JArtPplHB8bdVQVzoCz0H+dFgLzdCBO630M0Mv9o8uVyrNduoaEvzNSG5C+wgsP2SU0iM44GiKgOMtFT/UK4+zwe9dlFO12UTdxAJ8UfeuyIbgybCiWZ92KH6qN2IeotsCVhDZB/yZKR+Vakq/DYXutW91RD5uTfmbg2KvlGnfrixAVA8pphuV2rGc773+VM4iwNiEJljXfmU9hv9SyDPPeOpsfCDv3ZJx0aa/Bkzh8sGcKCSdQ5oYpD/D41y0iQynoJLAI8ThJXTd4nGa9bIzk262kDZV5EAtkM3NlqMHMT60tUWUnLWlQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV1PR04MB10378.eurprd04.prod.outlook.com (2603:10a6:150:1d4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 21:35:33 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 21:35:33 +0000
Date: Mon, 16 Nov 2026 15:35:23 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: amelie.delaunay@foss.st.com, vkoul@kernel.org,
	dmaengine@vger.kernel.org, Frank.Li@kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ae878000@gmail.com
Subject: Re: [PATCH v2 2/2] dmaengine: stm32-dma3: defer clock cleanup to
 managed teardown
Message-ID: <avt3G8DLXbFgSfxi@SMW015318>
References: <CAGEsz8ENCW++SA9cdh5=2EVmto=2-2axzTwuNhaKv+xW02Vvtg@mail.gmail.com>
 <CAGEsz8Hrng-rnKE8hVKUo0RZD484HuSUGc5rWWeGNa6JsdaKoA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGEsz8Hrng-rnKE8hVKUo0RZD484HuSUGc5rWWeGNa6JsdaKoA@mail.gmail.com>
X-ClientProxiedBy: PH7P220CA0094.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::30) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV1PR04MB10378:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d74b92a-8f22-4c92-fe8e-08df44298b8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|366016|7416014|376014|18002099003|22082099003|6133799003|11063799006|4143699003|5023799004|56012099006|261009221727099003|261026121527099003|261026140227099003|261102123227099003|261022075727099003|261022105027099003|261021121427099003|261009223027099003|261028144727099003|261009223327099003|261009221227099003|261009220027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	I5mRqysQiTXzJ1AaeCnj8BUoTf6P2e6JWVMSN/mt98kHBHaptbcOh/Fxg07dO9itbiQxf6N373ZUOCd7UYgF/jIFJ6yk3WM/Xl8AbAN4YC0UbnusGFG5A460RJlCAIPVbJ1ytKrmp6fmxLdcjbQf2jpeY7oFNTsd9eFUPPbH7AS+DgV+rELLm5f8VAdtOyKgb7PwCYjZFWQwsiw1t3iLQv2Bf3fYXfZXUQzJX4vhXz+ZnuRy3c7TDtYJGJW+2VHo0Zk8YjU2aqR79MfLvIBu6bxenFzYq7miyM68or8X/9a84zZiWAlCJzXVaOT5spGuyY2kJuIfvM+7rrK27y4+40lVh6NaUEw8qfZBBB/yJrzBkQndkYVW6G0MapVJ2IHfEVoKP6GQ54pR54blW8wDjLNBYdOeyb+RiTKr0af7lHVChOAPr5t/ZMr5k+vO1Klih0bdoXmoKneihHFRcH55RXESO5WMIEam+KudBR7E9kDl0CoZywLlR4LLFQAUH/8kELpJPjmSakIguBjKcJlHN4RrnzMxZy8JTBIg9qOgqeLlh07G9joIfr9Ge7OkfkwgsnewKUZVYGbROT3jZiOy6snYT2KfSkK/IvoAzpL+jDni600Rh6qc6dAVKXSIDVKqXGI+6b3vF4WgX9pH/sKDgEa9tm8Vg8oQe9QUMyGL4cg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(366016)(7416014)(376014)(18002099003)(22082099003)(6133799003)(11063799006)(4143699003)(5023799004)(56012099006)(261009221727099003)(261026121527099003)(261026140227099003)(261102123227099003)(261022075727099003)(261022105027099003)(261021121427099003)(261009223027099003)(261028144727099003)(261009223327099003)(261009221227099003)(261009220027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5mVpfAwDxNcH+/o3ffS7nMEloHAP2F0QaIMZrd6v74NxwCiqx9MeJPWktHOY?=
 =?us-ascii?Q?NzTgizQUKKE2KUNc3V9Li9Oghk8qt8952UUVLJuXSORnymWhY4swPPmf/Rli?=
 =?us-ascii?Q?bq+CVjSUVY+Myp7KtULiudPKmvE5abBIxhQg/X9+K7vat9bmXWvfFlHjDgFr?=
 =?us-ascii?Q?gFgWlpN75UTfv+S9bOeoHGQjsH9tXszbhZLExUflJPpAfn9OacgTC8REbhsZ?=
 =?us-ascii?Q?8Tfo1DD1n8odZieiofUba6V/wF9pI9m9yespUmMw2VMwzkDSnhQUgx7XBttQ?=
 =?us-ascii?Q?w40/czIwR7nz9PBcrUiZa0uP+7K3HN7aNbd6sb18h4hXT6eteM0NfDyi26I0?=
 =?us-ascii?Q?tEaFUQr8SUvsMp/jHWWPp+4GFTLKTVZag9y2ZLABh5wNvpj9Q+Drjtf3Konh?=
 =?us-ascii?Q?LCqYcM/FvpVHCMwD5lxCKelKpnfLOyKRbZeoXyvYNoL+n1jZ+/O8o1tlBDzi?=
 =?us-ascii?Q?+Gl6W6DcnGKh9Qb25BsEW9YCEWNqnWoOF7WtloeAQvu2C4N/Y7wWZ0/eR53z?=
 =?us-ascii?Q?HSYU6nPbFq64eVmEXWjexzwAU8VKjpRvZ6QKtU7+ecxMkzhPJ8DN2YPip16g?=
 =?us-ascii?Q?wdWAriHcjs6+JVWYWxNVlovPTGAZwDHFTW715h7dlTSNrS2TA36j5RPSZBXv?=
 =?us-ascii?Q?oKm0NStwY/3KPjmiHXZhFIUFUV8/sn4gTPpdcvszqU27X4ZUL+nqmwN4c+nR?=
 =?us-ascii?Q?CE3FZNJCcY3KbGdY0D5KjSc1VbETzqhhqpY1hfefS0LxUZ+V5C1y7G+GlyrK?=
 =?us-ascii?Q?IJmGY2VjtDDyZdhAcbsLnJm28SFb1Fh/u2oRyzKyYXAPx8ilu7rcdByDnlZf?=
 =?us-ascii?Q?C30m+4z/hrLdammXMLfgHjsAAtsFyETx7peXqYsiGx8YYq+yGH4PPjw1DQOc?=
 =?us-ascii?Q?sxWGh78Ezr9yZQ1IJY3sBA9IaGLnSvknXCamTOFsHfQ8YAVj7j7Hf3GksoEb?=
 =?us-ascii?Q?rDHrlwruQEueRBWqVEJcItg085p44mRQUlsUl0KLwi4inMfBaYm0m7Vl8mok?=
 =?us-ascii?Q?dgZeAoSE2t5WsBhG3AcuyLE+bBng8gnjtvq6MVd+1I58ecNyHYXLfXo72fqZ?=
 =?us-ascii?Q?pzKPs18Wc1Yl92mXSYVOeWmxMpa416iT64rnGxTvXUH4H41tf45+r1XSCt+/?=
 =?us-ascii?Q?TBYjxOgl0mk52m174fR5Vrs9pWoKkQIz+KcpngnRF/2XlLXgP0crRm4RAx/Q?=
 =?us-ascii?Q?H+De5Lomakr9nPIfF7mZfK7blYMYsU/hnpDqv4XBaUpKPlHmG2/tj/2QjWhe?=
 =?us-ascii?Q?iRTCPKTW9AhgrW7hc1ok+R73M/3vVYpI13+IepRDlz6fdsc+rihsYPY4Mv2c?=
 =?us-ascii?Q?W99y3iQHGVCL+u54PbmK8fy+0gCiTjmXysKzCdteXLOfc6mHxqbnVBa86XGR?=
 =?us-ascii?Q?7wqEM8NOYJrlmJ2ur1BifsS33Uz88DKZcaPs4axC3XAWrNtyHjC1HLOim3vZ?=
 =?us-ascii?Q?qzJfcYO9Sj1dfapPqOFv6EsYN+QYmfytNSAPxThoStlRoHRwmBMmgKYAk+Vw?=
 =?us-ascii?Q?bxqSQ+mO3zEuwyeuLByULOcDDeL1KLgqbA2l+8lbJXpjZ/mkKxTLAojXIVEn?=
 =?us-ascii?Q?rt8+ZN+tFfj3OTxtvLdRlqJml07u+6yB/hgczQ/iJcFZr0pLvfLgGJ7S7gpQ?=
 =?us-ascii?Q?KDwAs9j5s7un+RL2wKo4BVZeuhtMD5lT6a1yozDZujjfYZZ/yk1xy0Q3OBcW?=
 =?us-ascii?Q?z0nGxVJehajchBAClvHk+sYeMExh32wjQo0lmcD57ypVkKs+Tite9U9fr5g8?=
 =?us-ascii?Q?yUnmBvLEKJOGBt8MjvgmezsYU1rZuj+1hHxEDn34cL7gD/7m5ozI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d74b92a-8f22-4c92-fe8e-08df44298b8c
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 21:35:33.7652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hFXM1FCDqVSZghZ1GgsSbTnBa1QsVddWVUxIhedgMykxiJ7wR2x+7CFFHOTvcFNAjfV0jfCbk+EJzpo4kL2HBt1j3vNBK65XqtWV4gWwb/JxOttuUH06I/Ez7U4ORQUS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10378

On Tue, Nov 10, 2026 at 01:05:14AM +0000, Myeonghun Pak wrote:
> Probe enables the controller clock, but remove only disables runtime PM.
> Disabling runtime PM does not invoke runtime suspend, so removal of an
> active controller leaves its clock prepare and enable references held.
> Probe error paths also disable the clock before managed DMA registration
> and IRQ resources have been released.
>
> Register a clock cleanup action before acquiring those managed resources.
> Keep the existing remove-time runtime PM disable barrier, and let devres
> release the remaining clock reference after the DMA and IRQ resources.
> Skip the clock disable if runtime suspend has already released it, then
> mark the device suspended. The PM stubs also cover CONFIG_PM=n.
>
> Set the initial runtime PM state next to clock enable so that probe unwind
> can distinguish that reference from a runtime-suspended device. If setting
> the state fails, release the clock immediately and return the error.
> Use direct error returns once devres owns the remaining cleanup.
>
> Fixes: f561ec8b2b33 ("dmaengine: Add STM32 DMA3 support")
>
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
> No hardware runtime testing.
>
> diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
> --- a/drivers/dma/stm32/stm32-dma3.c
> +++ b/drivers/dma/stm32/stm32-dma3.c
> @@ -1721,6 +1721,16 @@
>  };
>  MODULE_DEVICE_TABLE(of, stm32_dma3_of_match);
>
> +static void stm32_dma3_clk_disable(void *data)
> +{
> +	struct device *dev = data;
> +	struct stm32_dma3_ddata *ddata = dev_get_drvdata(dev);
> +
> +	if (!pm_runtime_status_suspended(dev))
> +		clk_disable_unprepare(ddata->clk);
> +	pm_runtime_set_suspended(dev);
> +}
> +
>  static int stm32_dma3_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
> @@ -1755,6 +1765,16 @@
>  	ret = clk_prepare_enable(ddata->clk);
>  	if (ret)
>  		return dev_err_probe(&pdev->dev, ret, "Failed to enable clk\n");
> +
> +	ret = pm_runtime_set_active(&pdev->dev);
> +	if (ret) {
> +		clk_disable_unprepare(ddata->clk);
> +		return ret;
> +	}
> +	/* Release the clock after the managed DMA device and channel IRQs. */
> +	ret = devm_add_action_or_reset(&pdev->dev, stm32_dma3_clk_disable,
> &pdev->dev);
> +	if (ret)
> +		return ret;

devm_clk_bulk_get_enable()

if (devm_pm_runtime_set_active_enabled()) {
	...
}

At remove function

{
	pm_runtime_get_sync(&pdev->dev);

	...
	pm_runtime_put_noidle(&pdev->dev); //return pm count drop to 0,
					     devm_clk*() will disable clock for you
}


Frank

>
>  	reset_control_reset(reset);
>
> @@ -1831,17 +1851,15 @@
>
>  	ddata->chans = devm_kcalloc(&pdev->dev, ddata->dma_channels,
> sizeof(*ddata->chans),
>  				    GFP_KERNEL);
> -	if (!ddata->chans) {
> -		ret = -ENOMEM;
> -		goto err_clk_disable;
> -	}
> +	if (!ddata->chans)
> +		return -ENOMEM;
>
>  	chan_reserved = stm32_dma3_check_rif(ddata);
>
>  	if (chan_reserved == GENMASK(ddata->dma_channels - 1, 0)) {
>  		ret = -ENODEV;
>  		dev_err_probe(&pdev->dev, ret, "No channel available, abort registration\n");
> -		goto err_clk_disable;
> +		return ret;
>  	}
>
>  	/* G_FIFO_SIZE x=0..7 in HWCFGR3 and G_FIFO_SIZE x=8..15 in HWCFGR4 */
> @@ -1861,7 +1879,7 @@
>
>  	ret = dmaenginem_async_device_register(dma_dev);
>  	if (ret)
> -		goto err_clk_disable;
> +		return ret;
>
>  	for (i = 0; i < ddata->dma_channels; i++) {
>  		char name[12];
> @@ -1878,12 +1896,12 @@
>  		ret = dma_async_device_channel_register(&ddata->dma_dev,
> &chan->vchan.chan, name);
>  		if (ret) {
>  			dev_err_probe(&pdev->dev, ret, "Failed to register channel %s\n", name);
> -			goto err_clk_disable;
> +			return ret;
>  		}
>
>  		ret = platform_get_irq(pdev, i);
>  		if (ret < 0)
> -			goto err_clk_disable;
> +			return ret;
>  		chan->irq = ret;
>
>  		ret = devm_request_irq(&pdev->dev, chan->irq, stm32_dma3_chan_irq, 0,
> @@ -1891,19 +1909,18 @@
>  		if (ret) {
>  			dev_err_probe(&pdev->dev, ret, "Failed to request channel %s IRQ\n",
>  				      vchan_chan_name(&chan->vchan));
> -			goto err_clk_disable;
> +			return ret;
>  		}
>  	}
>
>  	ret = of_dma_controller_register(np, stm32_dma3_of_xlate, ddata);
>  	if (ret) {
>  		dev_err_probe(&pdev->dev, ret, "Failed to register controller\n");
> -		goto err_clk_disable;
> +		return ret;
>  	}
>
>  	verr = readl_relaxed(ddata->base + STM32_DMA3_VERR);
>
> -	pm_runtime_set_active(&pdev->dev);
>  	pm_runtime_enable(&pdev->dev);
>  	pm_runtime_get_noresume(&pdev->dev);
>  	pm_runtime_put(&pdev->dev);
> @@ -1912,11 +1929,6 @@
>  		 FIELD_GET(VERR_MAJREV, verr), FIELD_GET(VERR_MINREV, verr));
>
>  	return 0;
> -
> -err_clk_disable:
> -	clk_disable_unprepare(ddata->clk);
> -
> -	return ret;
>  }
>
>  static void stm32_dma3_remove(struct platform_device *pdev)
