Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011053.outbound.protection.outlook.com [52.101.70.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD724DF4D5;
	Fri,  2 Oct 2026 15:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955115; cv=fail; b=tHq9qPBv5GZTgMmLyewUbH8xdXGKDvxcvWZAQEmL8W0vBSP1TmIeRdfaRLCGfuVqEd2Xl/zyK9PDZbIWjX+a15gRCbYdnspfwTufvrMiLPxwe3S9p18pw/x17XtQ7q0FSlim/Pwr5PwuowRMPSJwP+BM8Si84skJcyYipwG9IlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955115; c=relaxed/simple;
	bh=Nyo3i79piYuupOD/qHuJPHnUQtj1sgzXsKWAAfeArRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BUyEFbrXJcWrCGfgz1dEh4QKVOgJku0GFx1R4ijE/zLV2m7k8kqaiA8SaVRSC4y380BPvl7N4OFrNs5sfB6dj7An+N5S8QknogxfwL/x5iAtLBaQZb3hcDSVgagXZVoXT7AmCiKlhTMCAma7pfDj879cp4Vf9pM51iKmBUrhV18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pxQx4A0E; arc=fail smtp.client-ip=52.101.70.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pxQx4A0E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e/ecSoWCmUqJsMzmznop4IrquGgBN21Bz3flB24ZXJve1ysNivsmi8f96N5TJKBH4ILiAlXmHbD7dCDk/hC7MGqhbeDzjK0/1RBQ6x5EbChMSfRra7SIMP7WsqETOQ/Eu4Ve66ybKJkIl4wU1AVmUfvnpV3bmfhuKWT+10jtTo8z4cWnRpGxr9P65vPbFTTX+zg9LPzOnh0DhGKr5l4Ta3uetXR2Mk0p7phjfm66CdbyHqEZb9QANYZIka/OLn3xYfSdCkw3OKWi7q08IWjJcnvF+V8dor2XLw+kXPCXmuLXVZthElpjMTOE85InYx11JHe4UyKpIZyJG6yltu+Fng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CsgjStnAIWHZEC1MHf7Xi3ng/UTUjmZOkfMJ59XZYHM=;
 b=uGqy6qXcNePUUpNQ9yZtHGDZ4/TGRhyCOykYxke7Lh4PqSgne9ZMItBS7K6hQJnxnG9OEUcHPPotRWgsh4MSkcr+LduVz6kLLdJ2oGVHszNRHQkTZOlPiPXQFNs8AXaoapwwWDxunyVQS4be9wUf6wFPvLCw+P2679tWEMq0EqI9MJaa4yNfSjBADOdF07Uo9PYUiAtIRPY8qlmRwuJK2d3wKaCLNOpkB2QmWtQkl0cX4a0giNkoMeLHaZ3AgIKsr7iu7SY+mk2/FfHqxWjCZA1y8+y3S2BOlBCif/dHx076BHG9F1qnqV2ZLjVdu471Douh2EzNlxS9IGHYRjnwlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsgjStnAIWHZEC1MHf7Xi3ng/UTUjmZOkfMJ59XZYHM=;
 b=pxQx4A0EL8M7+spjU9qQXu0T84NLOXyQY9WcZutpnVkpRBDQpcc7TmslfCMwnxI/rbvvX+EIqqj7AuyhYCWQyIjYg6dkxGu70PPWDmzy5Kx1Qkx9lE9yYw0eICinY3DtfHlIpWH6GkXtfV3iqoKJvDLFXfHymUnWAA90GOMYiZPdXo1OSH6YEsimNpSq61mT/JNQbaR3iJIFSxB6tZvuNeQ116L9veVWxHoB8gKo796vgZX/xMyqmChqjStPfkrSNZQ9+sIdDwfFRDGOTMAywwBrydIH8Wc255wJYzkZhhOpw5vTvv5Vmh1IYBsDBAbpSNrMeHibKkkrDdskM1ze8Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB8076.eurprd04.prod.outlook.com (2603:10a6:10:246::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 15:31:51 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 15:31:51 +0000
Date: Fri, 2 Oct 2026 10:31:41 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: dma: qcom,gpi: Document the Nord GPI DMA
 engine
Message-ID: <ar_OXbdMsP43JM9v@SMW015318>
References: <20260916-nord-gpi-dt-bindings-v1-1-857bf9e84999@oss.qualcomm.com>
 <CAMRc=MdVQ4xUFPtcytXt5Tqor5-fUjHiRvnpmxBsJpJbd1rHLw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdVQ4xUFPtcytXt5Tqor5-fUjHiRvnpmxBsJpJbd1rHLw@mail.gmail.com>
X-ClientProxiedBy: CY8PR12CA0009.namprd12.prod.outlook.com
 (2603:10b6:930:4e::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB8076:EE_
X-MS-Office365-Filtering-Correlation-Id: 448550f4-d075-4103-e9a2-08df209a47d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|7416014|23010399003|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	190OTs2Qyz5mnIR+3UVsDKX9mTpB2khRghOnzQQhxLytD5H0NVZ3lIG4fRuIoZ804AcfkgI4Y/iVjOeTjdyn/tq+9VUW19f/IsTaB9RdqAh9HM0J4leYRvvcfDHME7Tz2npLwqeHpb/ZK0L6RuFPRnZvOVFkKG1gimgPU8CsLeY3stlEFThUW51gSYPc7ZLH25tgiM5w/vHIP3gEZ3UH/xciCq5EyRvbT7jHo43FyMjpGum8Q/PdYu1shznv1WotGvKIsaTsZTxZ2qYVANoxOgIOtJrJHXMQ0omHnMx3L+lFKO8T/YCKFUOCU9yH8NyhL3Ct8ZawBgIsoRZY7tv642HiuRS9tdQQZwAE0NOBHGzW0HnTt0z1MCIDz9RDYzo3qfDmZXLI9FCLYOloHd8UrwyPvlMWFkArx0I6SD5LDOCUSLBlg+xSTK4loAxssTNE1y+Vkyzub3kEVQzW5oiGreEc2rIjwQZw8eSZ8NR1JAIxw5Tl4BKlneH2ws8Zcdh7nsAuVFIuRBVRUwFrTufjqT6gMuu8uyKhPGOVD5JtToh4Dok61qMbhjveEPjbgiy7fDwld+5eOfS4pwPotF1pUWsJ+xpWbj1OAl5SsCjVqtqQyq38/nMJIk/rq/hWI6uJI+8KCAmHCGfh0DsNSSzKlK1pMT5So8eWkdQx+Iu3gcs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7416014)(23010399003)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x1+qJdbyxt8L3PEveVVDHOhbBsMToopYJT7f+slS27CqJio7Xoz9SRfIloB1?=
 =?us-ascii?Q?GXu824VRuu0V22VDpZwowaRmdZDjr/17HUEuRNo5stfJ0CokwDVsuiMwlRK2?=
 =?us-ascii?Q?byDGwDh6Vo+WnmXwa9LzC+jjg1IpFw6YjCw0uD2pREd66FGA1CR1+HOAfodk?=
 =?us-ascii?Q?aykPAJY+rXsFW6WLTWKhe761kd95pJ63SfoEmCL4fIuAdkhtdDuYwbs6ePHb?=
 =?us-ascii?Q?JK++I4wshhBQ4F/ddp1Fa5a8d1xfK2EyPCPYTZ+0lkvmqjT1KhQH9IJCav7+?=
 =?us-ascii?Q?byYid1UO1jr0aXeXNCZk4gp4p0Wdn1QUhTUMPbdojBWAzvkgChx6f/l5e5YR?=
 =?us-ascii?Q?7fsUrOjiZdfkpHhlWLh/TwZ9pUy8ceJ+4UhTqw3nchP+ytQ80k8Z8/gjs07x?=
 =?us-ascii?Q?Ddsow8tRdfsO1cE8vfpwg+9GpxmEI1/CaSt9TLnxS7SKAXEO/Qt1ev97eEwf?=
 =?us-ascii?Q?ZzrwyqsY01aniG2PC82ZoNlybjhxaxAxca8SunmL9rTZRXTgia3umJucPtQy?=
 =?us-ascii?Q?KQKHQXRnbs74fg8PdG/S10fbjcfMYXe+0pzqNhzvnI4g5TQaULEMcGbg6YuM?=
 =?us-ascii?Q?8QGAAQ/f44eNoUD7GDvW4xpTzfUfYtKxYwj9FcxZZlDVwvxTSLIP0uGmyU4t?=
 =?us-ascii?Q?xGFsj0EaYJ7mido6frjyciE3Z5iMvUFIK9p/aAKBNCTZO5e55ZlqL7Z1lz6E?=
 =?us-ascii?Q?hd4NXVZ59ZwId7eUrJhasXfmur1fIO9ahRhxTCzMZzH8e/jJeZdYPrT7IVm1?=
 =?us-ascii?Q?fcL/BEQoz8Xr+BZqcGkpu8Xu0vKtTVIHuFgh+XCoA33q3t79qGyGhL1bFMie?=
 =?us-ascii?Q?//ww1E6JPjYJlGMMHsau1HByfun+US6k96KmB3+z1jI6GWHLdEQrYYUALKMA?=
 =?us-ascii?Q?L8LVWlMJtQh1RbCNVJJrQC2XSi+5Y0Py1C5oLdxsP1JWfLCUNk+uiuBtP45s?=
 =?us-ascii?Q?/05nMErwM3x9bYEkof+myADU0d39KjjRbAPFwL0fPhAoSrJJQeqVBHYT9BF5?=
 =?us-ascii?Q?envh5m4udT5flTDiPgnfKCWmXjBrpG5PoH5uYQDULoEawuIvgC/6YTHSFwWB?=
 =?us-ascii?Q?NvrqnRTYboNE2gLyhp1uCYh+9vRN1JAcKqWVtzOZB9PgU1k60AZW7dcSEAKK?=
 =?us-ascii?Q?euGsBrLhU6apCwbFHcSD1JoY1yz3rR23YQOTA62rQxsxg/qCBU2rzqCyaob5?=
 =?us-ascii?Q?PSWbXQ0nfuusJbNzC18VV4TT8UHFRb/byqMCXDV6Eir8VDjtjmVyn2fhkGoo?=
 =?us-ascii?Q?rbwb5Iq68wra2iBx7tKrhWrKUC63gzhOQPgxib0TSBCtN+4wQ5+99h3+XIN4?=
 =?us-ascii?Q?ro6ggX8lSgzE62jWv6nncpDHjA+I7Z1ZaU/j1z+DOxdh4zRHdkehrGat3e3m?=
 =?us-ascii?Q?iw+6+RfFNE98vezE/mIwlvKTW1SHcBgZUhV0Ib4SbnhgCaomKoY8PekkwzaJ?=
 =?us-ascii?Q?vEHoY0/XIJKD7tYiiU/wDGOAEh2HNsuvVblqiWylXrs7iL4DRhPVVx5ShjGB?=
 =?us-ascii?Q?01zD6T83Tgtk4A8p2CmpXDk9jQ9pq09rKjmVZaQpCW1c3QRXOLBskZ8RQHpp?=
 =?us-ascii?Q?2/f2X19Ku8jAOowjN4dp4riZvvcyJ8+q7HTxBNp2sc/dMr4NODmUk8wvrLRi?=
 =?us-ascii?Q?y1Zq960C1zLKIFidUeecia6nNuImuQ7y5dudMcgQ8ZG0fEd1TFy9M5UIvySV?=
 =?us-ascii?Q?eouUJvjUK+sy5LnLB7jbXS9/S1gC9spWrjmFayar2W9cE+79nztXvj6va8Xe?=
 =?us-ascii?Q?JVdIc52o4IQiZjYdAZz5rTDXmQbrmtu0739Au2Q9XQgzEdmHHt51?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 448550f4-d075-4103-e9a2-08df209a47d8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 15:31:51.5164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EUC8desCbl/D/fT2GLm/GtGM0xakksyJUr+n6qhLTqGeUi7ELFTvBCG1n9ygyRFYDUYGDFQ4nSaiTFU2wjRsi4cLNl9MLmOVFHtL2VU9HaIcgEX/F44yCe7xQKFimYoU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8076

On Fri, Oct 02, 2026 at 11:46:57AM +0300, Bartosz Golaszewski wrote:
> On Wed, 16 Sep 2026 17:21:29 +0200, Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> said:
> > Add the compatible string for the GPI DMA engine found on the Nord
> > family of SoCs.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> > index 54dca623223d51373a4d54591f3ebbf5e31fca17..ad70717b5b86e600e74d6cfe42015dc03db25ba9 100644
> > --- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> > +++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> > @@ -29,6 +29,7 @@ properties:
> >                - qcom,hawi-gpi-dma
> >                - qcom,kaanapali-gpi-dma
> >                - qcom,milos-gpi-dma
> > +              - qcom,nord-gpi-dma
> >                - qcom,qcm2290-gpi-dma
> >                - qcom,qcs8300-gpi-dma
> >                - qcom,qdu1000-gpi-dma
> >
> > ---
> > base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
> > change-id: 20260916-nord-gpi-dt-bindings-f4b10102d22b
> >
> > Best regards,
> > --
> > Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >
> >
>
> Vinod: gentle ping, can this make v7.4, please? Otherwise, can you Ack it
> and let Bjorn pick it up?

I have not seen dt team's review tags yet. You should ping DT Team firstly.

And subject:
	dt-bindings: dmaengine: qcom,gpi, although there some use "dma",
but avoid confuse in future, all will consistently use "dmeangine".

Frank

>
> Bart
