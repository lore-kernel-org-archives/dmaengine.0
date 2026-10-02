Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013025.outbound.protection.outlook.com [40.107.162.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB413AAF54;
	Fri,  2 Oct 2026 14:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952481; cv=fail; b=WGXEIJKBQVgblma3Pjw+T9vmKpBRfDn9kBF3KnZrrzR2wwwkY4i7y1qvR+vtTtoQxyIN9jN50oslyptmueA+VCvx8iPl2d+NLWruUYyX47Ugih8oy8BY5uuKZwBRhkADtBp9sADonWFGE7GTqH+JJIIrGslDn6/jIWA35ghxXHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952481; c=relaxed/simple;
	bh=OqVQzSGNvzr8kOjVOa38LhowyiNtggGoE02VCHKDjFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S06EKuirZje6/IWboKMDRGFJQkdPk0bjIcoD6kxXlS3xW5R85MKhFENVcAKiKug998Zwjh8VtQ2tarsdpoaEK1NK0UHcd5b30dUUtqVph2tgD5NHVTxxqXz26Ef6t7cp3bVlWkROEy5INL/783c5awzfTBBJN3HPCPBTeG4c5uM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mOgmsZH1; arc=fail smtp.client-ip=40.107.162.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mOgmsZH1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFi9axVauePTof9rEmQH/mdA7lgcuLGFYsjAb5Cuh8ZOfih7VAKO9TWisgnamlDaNFr4esdkLQxWwBh6x7edyDw+Df/QEXqjAyrlOHzZGxSyVZwVZ0nAR6tfYLnY1Dhua63bEyuvGFzI6nGsfWtogWuTYFPBIMahmtYE7jJra07pnebrhAz9yduW8xvNxkFIAiP4gbgfYym88AigI+yx8ck64Ed5U4TLgKMCD3njpwU+7kjLwHLoKkmBiaYj+ZU2P/EAWimI9uhmwZ/sBqWi7E2tbFnq1N3MKNaRQ4ebJNMIRpHPNZtVodt00aaRB0Q7sB6vXO7nkyZ7NSIJHo4zlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ys12rwu1tph0QBsxZfXciLeOkv41RQffv57+sP7myDw=;
 b=bGVla5kpaumnhZuV3SNyqmO51zkGPcnNMuJ8F7yNlKfsrBd4ybovhwyWdkKCLkKBSC5gpXTv3nT4HPJa9R1WWirgZzsNZAFcxyjRNNw4DNMhH7uXl0fRX6lM7my/z22i9RkJYVlZDNhkpFs0T3ONNaPlSlNHJms6njrygl3aD2+0a82csIpcBO6sFgasDB0xaJ1e7w3Vkqlx9E72IU4yHk5bPP/1cMhrbq0TE0yMX0MSmqPMFh8GYZnUNTWTWJ1QvBYlSG56PhgapFX3sd3+nbGVJnYD5+pTHktYr1aYXdRreUg6AQ0f4ZJjNjlQIX7p0MRm5VcCzt58DzKpqRrYcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ys12rwu1tph0QBsxZfXciLeOkv41RQffv57+sP7myDw=;
 b=mOgmsZH1Uk7r41JszRDHsrMlPpYwxlKI+nsDpc8rIo4qmH9N+JxKcvn+WxTuSfaeJHCbwnwdUQHq/oSYVblwz0SQvRuqHuj4Bv1t6lR0BQVjto5G6ayFzL0yuNx0757BmRhiQU6+qktvh0WYjFrMh2knHmsiuqzDDEks8S+HO0OCThBUCQXGwXs8nwxZEVhm/vEXNcbJJEx6PfDiBCq41TM3srjP/9DqJlckht/LsAe4fCDfT2FpKFyclRAHs9X1JmA7L7qUYwpP4AnjCaqfu3PBj+mdBOX+1Xd1mp7XypNnnZkCNoLv+PuD1zKae62dXYEHTu2DJ3jKteoLhRRwDw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8488.eurprd04.prod.outlook.com (2603:10a6:20b:41b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Fri, 2 Oct
 2026 14:47:51 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 14:47:51 +0000
Date: Fri, 2 Oct 2026 09:47:41 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>, devicetree@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: dma: loongson: Add Loongson-2K0300 DMA
 mux support
Message-ID: <ar_EDV7FMDBr7xCp@SMW015318>
References: <cover.1790068409.git.zhoubinbin@loongson.cn>
 <fdd9fa87058b75fda0dbb805de7989fcd279137c.1790068409.git.zhoubinbin@loongson.cn>
 <ar2CuxAv9mRfiVsA@lizhi-Precision-Tower-5810>
 <CAMpQs4KOvjvOku+DEMzr+OdfRNQAm9QoXnG3B93ZJs78ax5NQA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpQs4KOvjvOku+DEMzr+OdfRNQAm9QoXnG3B93ZJs78ax5NQA@mail.gmail.com>
X-ClientProxiedBy: PH5P222CA0008.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8488:EE_
X-MS-Office365-Filtering-Correlation-Id: e43b2bbb-40c9-4ee0-a3e4-08df209421f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|23010399003|56012099006|4143699003|3023799007|10067099003|6133799003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	N368m04H8xXZ88mcvKkMp26T4XXOKvjwCiyD34ie2OMp2HSQ8b80o9S2Aj+vbRsclpsjqBoLyM5ivnUQyBJd1U1USTEK2X5Cg4Q/V+eN5fudy88SqzU0+VP07dQhD32iIy3rCFlz7r2N6mveq3QOLBr8DhT2mX37cqpUtiie6wjZxUIPV5dhe6XObjLORweMyXOK+LG8hWI9TJyN+kEuArChNvAPoFm6dnlIUxLbdPbucdnlfREeOCc22CxjDPyk+I2lHsF5k1JqAcQQVY2nxxXBAmgyxlf2NRS8+mrSK7GdLoq70qfzivyzXQLcSUEXHKb6PL2zB/o+AZSv/Szb9qMU6U9D/grhlTXEc8ezkQJpKhkZ/FD4kG9e628sZBq8xDdWbdIuf9/tcTrRDafRKS92dnpYtXuuKDnHHH6vhyolnXjYBilqNElcHztLOK8KaiSV2O0DPWO9kamtEwFDRGvLZnQX7FEhHuDVVEI+U/5iYlOAQXlYVNB/Ga/LWYGzrFPYwGy1FJ2NlRYLzrhbJu2Dc606M9ZwX63Ht7UEzN3JkFkhZUxxawddj+XG3tKE6YzeubX9OnyjzsxdimfdOkrGe0OGuLSTY2PhtLjDCfj7nIKof9VmvSyHZ1Sa5J3p
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(23010399003)(56012099006)(4143699003)(3023799007)(10067099003)(6133799003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEduY3VtS0RuUUFITmsxZDc4ODJIUmNOOG1YNWd5d1NqcmxqcVVTSVdIalNi?=
 =?utf-8?B?bVNsd01GLzFTWVlvOTk1MWE4YiszTFhiYmtCOXVWUVROMTBNdlgydVgzMVcr?=
 =?utf-8?B?V3gvQ0VqMVhTNXNkWFpweHdCS0YyZmJMVlJCdWI5dHR5ZENlNlphR3BISm9y?=
 =?utf-8?B?ZVp5QlVzUWtpdDhwdWJGcnF6VU8yU0VlOFN5U2JnNGxkTFNuSGxZbGladHdj?=
 =?utf-8?B?UFRZUGFoOHhuU0dUT1JudFBQeURpdE1DYWxqNWgrc1BZK1hibVFKNDBFd2lp?=
 =?utf-8?B?QWc0cmowVFV1cGptM3JjZGt0dW5WcUthMmlZVy9NTFpBdDhtc25yRXpnbDBY?=
 =?utf-8?B?YkxPWnhsTVd5YmY1Nm9RRnZEQ1RkaXJRVE1DVHBwWXhlMVdhWStrclVFTml0?=
 =?utf-8?B?eUg0VFBXZmZlL0daamh4SmlDdE5UMjJ2L0MvR2ZqcWFmSE9JOTdQZXFIeUo1?=
 =?utf-8?B?MkFMVkxiS1dteVJaZWpVQ0k4N215dzdDa0owZnhRNDN2aUdnQVBBL21NN1BG?=
 =?utf-8?B?MXFPeGtHdWJxdjlQOWVPNTFVU09WM3A1Q2VmR3lqNWNMNHFSdlZ2SjNIQ3Vn?=
 =?utf-8?B?K2pYK1BPcDcvYmQwZHJQZlJKUHdVdjBxSHpmNW1iK3F1VHNBZnFWT0NNNzlv?=
 =?utf-8?B?azQ3K1JvVWtubGdQakhqRUhhbW9TNEFiNWtTRHZOazNsQ3N6bUtHQlhQQXBU?=
 =?utf-8?B?c0VaTUJ5RVFUR3RZWWduR3BLSGUzYW1nRDBJb3JCWXVJZm1JZ0h5UU1FY3Fu?=
 =?utf-8?B?VkpxUllYQ041czdGN245d2ZzSG51WVFyME1LbVlYR3FINGFSK2Z1akxWeUhp?=
 =?utf-8?B?WHFWczFNS0FyNTNndkkvbjA3cVRuUk51c2wyQmEzaEZhWkdKSHNyUnFZeFlI?=
 =?utf-8?B?MzZvK2s5YWg3ZnE2QVVwYmxlUmtiSnZ3Mmt5ZXlRcXduWmdjZW5NYzJlc0ZX?=
 =?utf-8?B?Y0pJV1IzQ25ycnI3YzBEaVI3dU1ibk5UNFAveXhRQmpSQjAxRzd5RFRVVGox?=
 =?utf-8?B?SVk1VXBjV1graytINkJDWUl2RlRPejFRTGFXVGVGMEJ5SUtkR1B2M3NZOUNm?=
 =?utf-8?B?N0hwUVBnSXF0Sk9SUVFMWjgzVmducXpNTDV5eDVqRC9lNzNsZGJGbHNHNllp?=
 =?utf-8?B?OE9odS9BMklrclNuZjFMTUNacmFDTzRGVHVtYURnSWpwVy9PZEwya2hCSFJl?=
 =?utf-8?B?Y3AyS0Y2RXRYSlBrTlljZGpWaVdrd0NuSTNyMVFSL2RndlJWd1VGYmJ6S1ds?=
 =?utf-8?B?OGxYN0JBdldrNEJKL1plMERwQnRNN2VGSzhDSWdGbTRCVnhadnNWMGxiT1hP?=
 =?utf-8?B?NGJxV0FGQ2wwS2N2N0JSVTVxVUlvTWl5OWprTzFQcmVGdEZEL1dJdFpxb3o0?=
 =?utf-8?B?REczYVhmdnJaWHM4UFFKRVN2a0FkSUk2TzdHQ2NNcW9YUEhFKzJOY2ZwRWdC?=
 =?utf-8?B?cVFxWVZxeTFkcGhNWFR0MnVCc0xjK3FQNDlpNUZlalY1Z2JldnB3M0p0bElv?=
 =?utf-8?B?NEdjbzJCVlpJZGNuSXJxU1JXYXpiZW53MEN3cDlQU2Z0cHB2Z0d4WGwvV0ph?=
 =?utf-8?B?WHJvZE5FR1h1dTk4RHFXUENQNTZzU3E4TTBtT0VaWHpSM3pnS1VsdXE2aUF6?=
 =?utf-8?B?bDhiV09rUzhrTm1SNHZzdWp0NFZyb2ZCTGN1WnoyS1Nha3dGVjJudHowK1Qx?=
 =?utf-8?B?ZlhLcDhKcnpvWk9HNzgwWkZJYVExQ09uZE1tdXdEMmM1ZU5QWXVySlhKc2xy?=
 =?utf-8?B?NER0aXQ5L1JDeFVheURwVXBRQ0thZkN3OTFrREJRMGdNc3oyTGJOQmJiMVpT?=
 =?utf-8?B?bEpTOFhGSkVUZDAzNnQzdnlVVnY0dVpoM2tKRVIvRGJKaVRYcDZZZ1JsdUJs?=
 =?utf-8?B?dW5hVkpiZ0ZreHpOQWZXWnlRV0ZIdmRCcmFIOVhTOWwyTjJOQWhVQTZYMlRt?=
 =?utf-8?B?ZU1SU1FtTndwem5QSEJNZVJSc2xueTVKcHF2WXBtRS9wZTBRZ2EzRTVzd2RE?=
 =?utf-8?B?SkRSN1cxbFdYT0xqUU1qblRBRStISjFPNjFveHkxd1dENXlLRzVHUmdHd3Bz?=
 =?utf-8?B?QVNLUStTL2FFa3pCbURjQ0FQMEloZ0M4eVBXZTk3MkZCQVM0QkJKSnFFa2tT?=
 =?utf-8?B?KzFaUmxTUDhrc0cyZ0tURDBYU0VLSDVRc0pXRHlBMFhsZUdpa3k3bGYyMlAr?=
 =?utf-8?B?eXRFTENrWTVWaDBNOHYzMnNRQU5hb0h1UjZoR00xQytIaFJjR0JVTUxEalNk?=
 =?utf-8?B?cEhhOStuYnhidFZ4USs1ZXJCVnV5WExLR2hOLzJ3NjdmbTVzbWpNZ3BXbU1W?=
 =?utf-8?B?dlJiSmpjcnZYWU0rMnloSGpNamVNd3NnbVRQL3NKQ0I3S1J5NGoyOU9INDRs?=
 =?utf-8?Q?U6quu/YTKSj2dfsFkSVQqW4NebKyHbgh2BgiN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e43b2bbb-40c9-4ee0-a3e4-08df209421f4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 14:47:50.9918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZ8pcN10TGtUtZwBBjYhiuMEftGRvy3HV98Cz3hagpnQFaIXFhzyXVDKAKsYiTcwrF2XJDHgXc0yXhfSnIgP2Q4Ag700ltuZKx2Yx5gQ7lM6jQ6gz/TDw76JUQDKt2DC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8488

On Fri, Oct 02, 2026 at 10:00:11PM +0800, Binbin Zhou wrote:
> Hi Frank:
>
> Thanks for your reply.
>
> On Thu, Oct 1, 2026 at 5:44 AM Frank Li <Frank.li@oss.nxp.com> wrote:
> >
> > On Tue, Sep 22, 2026 at 05:25:43PM +0800, Binbin Zhou wrote:
> > > The DMA mux on Loongson-2K0300 is not a standalone hardware block. It is
> > > implemented as part of the chip configuration registers CHIP_CTRL13/14/15,
> > > which route peripheral DMA requests to the physical channels of the CMC
> > > DMA controller.
> > >
> > > Document this as a DMA router. The #dma-cells = <3> specifier contains
> > > the peripheral request ID, the target CMC DMA channel, and channel
> > > configuration flags forwarded to the parent DMA controller.
> > >
> > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > ---
> > >  .../dma/loongson,ls2k0300-dmamux.yaml         | 49 +++++++++++++++++++
> > >  MAINTAINERS                                   |  1 +
> > >  2 files changed, 50 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml b/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
> > > new file mode 100644
> > > index 000000000000..12b8f8af51e9
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
> > > @@ -0,0 +1,49 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/dma/loongson,ls2k0300-dmamux.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Loongson-2 APB DMA MUX (DMA request router)
> > > +
> > > +maintainers:
> > > +  - Binbin Zhou <zhoubinbin@loongson.cn>
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/dma/dma-router.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: loongson,ls2k0300-dmamux
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  '#dma-cells':
> > > +    const: 3
> > > +    description: |
> > > +      Each cell represents the following:
> > > +      1. The peripheral request id (see
> > > +         include/dt-bindings/dma/loongson,ls2k-dmamux.h)
> > > +      2. The physical CMC DMA channel (0-7) that is passed to the real
> > > +         DMA controller
> >
> > Do you have restriction between request id and channel? Does any request id
> > route to any channel?
>
> Yes, according to the description of this register’s bit fields in the
> manual, DMA channels are not mapped arbitrarily.
>
> We can broadly categorize them as follows:
> 1. First, most peripherals that use this DMA controller request
> adjacent DMA channels (TX/RX) in pairs.
> Let’s take I2S as an example.
> Bits [17:16] at address `0x16000138` controls the I2S DMA channel mapping:
> 00: Channels 0, 1
> 01: Channels 2, 3
> 10: Channels 4, 5
> 11: Channels 6, 7
> 2. The SM/DES/AES module uses only channels 0 and 1, corresponding to
> the bit field values 00 and 01, respectively.
> 3. The can/adc module is single-channel, so each bit in the
> corresponding bit field corresponds to channels 0–7.

Does channel dynmatic allocated or have to static assign, if channel dynmatic
allocated, needn't arg2. If static assign, it'd better descript clean about
restriction between arg1 and arg2.

Frank

>
> >
> > Frank
> > > +      3. Bitfield representing DMA channel configuration that is passed
> > > +         to the real DMA controller
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +
> > > +unevaluatedProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/dma/loongson,ls2k-dmamux.h>
> > > +    dma-router@16000134 {
> > > +        compatible = "loongson,ls2k0300-dmamux";
> > > +        reg = <0x16000134 0xc>;
> > > +        #dma-cells = <3>;
> > > +        dma-masters = <&dma>;
> > > +        dma-requests = <22>;
> > > +    };
> > > +...
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index b021fb623446..dc976938c58c 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -15344,6 +15344,7 @@ M:    Binbin Zhou <zhoubinbin@loongson.cn>
> > >  L:   dmaengine@vger.kernel.org
> > >  S:   Maintained
> > >  F:   Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml
> > > +F:   Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
> > >  F:   Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
> > >  F:   drivers/dma/loongson/loongson2-apb-cmc-dma.c
> > >  F:   drivers/dma/loongson/loongson2-apb-dma.c
> > > --
> > > 2.52.0
> > >
>
> --
> Thanks.
> Binbin
