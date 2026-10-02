Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010017.outbound.protection.outlook.com [52.101.84.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB52D192D8A;
	Fri,  2 Oct 2026 16:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958893; cv=fail; b=SZPndV53S4/xmSr4oqmKa2HyBxEPKyEPrd+KUcNJ3ybj1WkLXmUIb58gpn51QH8HbMH/Myoj5GQB9OFado1PbZ9xS7KuqVQQUbcKi/o8GNXFFeKlpFpfCKDiW3UkKayie8mSIxTO7pNyULWU+EhbYJgLcOaRaWPPqUMaT+m6UE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958893; c=relaxed/simple;
	bh=FOAoOqPRdehBCFBltsRN2pi7CMxF5NG0EsiJGWK96pU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BlsH8YTyn0M5CaMr8gVqpMKkmbhA4bHt10M4i4/rt49a872rf3zDXaYuTKpaw4bbooiuHQyR1UnBgEbFnGvD3s/URC45KssMjPvmOtxIHt2Uuh8z8/D43xf+Asx5H1FcXB0uzFYlvKD8P1kqOB5eETNW+3cppKzxgix/TJo2pJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=q9nk9CEC; arc=fail smtp.client-ip=52.101.84.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="q9nk9CEC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YUAnpHN9iIHWitWe69H+SHpNBmtN5V1gu3sSW0DLBWmUdFzsJAObh8qf6u9tJS4v3fwc4iu+MEeBTVp+ifuJhkcujArJTWeO/KU2I/x/S90cMqLvaZURLWTKR7OhvVLHs79sibon19UzCQcX42Vb6Kt7KmNen31IxFXE/lc/gsc+ddub7Kquojr3dM6eU9l9AwsfMh6gqPM6DOGrD0gsMfzxe0KupdxeIj7R6EOlYrE6HhtHduufvjlylyQYxksIVigMAwywwfgZ/DzjXVwb5hwuG6Z46XSeFN6LPyv4i9MLTctevX5fZx9sUPDk0AyuTwsfSN6XU6a7USoMEgcWww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQwDsJ39WDrndej9t410q2fKrenjfYOWax4iuejMoXs=;
 b=uzrDCVxEbZIeraDjBZXEI2+8b5nb3d2LRBg5xzzJ/1zy98tI0uZJsZgM8zsgHnE4Oo3AseqTWSHiKXfchhYUhFy1D7TlSpUOWemgy0XkGdvmpDRTAgmYa1ICGUGWicyUhK7UsPOu1xvEzTx/lamG6Sm/u8BXv8F+zFj+wnzqcuev3RFw6jylVoM1DM/aaKYVFXtC5isWPoX5zMNDGNkNFRem5thOo+7NZAyS2fOxaLG++CG9k/iQIl8vgwUcGqzognxaiDyiMZsKrA6EZO6pVYrvSgAVgek+bWksQvDCD9uNSCc24+ghh8mlLWHGQikBDRGlb7AqqvzErSWRfZgtww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQwDsJ39WDrndej9t410q2fKrenjfYOWax4iuejMoXs=;
 b=q9nk9CECFJw1JkhRKKeZFo0FFJKAWex0R5SKI3xN58m1CEjnbWKwqH5wjiFfmAb1jcUWoWaGRwzlzM4QufJL6mbK27Oswc+lhq2RmAIodRKgcmBDm84FxrEoRiREjixRIeW0dhu6mabHsHZjfjp7FBpd5Frtr2IZrCWhsDPgbv0yjDfiN57KCH4Xf/2P5cSyEMELpsHCXN5MP0dhsTTwUeDEXOSuLpi6hsnWgTvyVDkK2Bb+X5kSj5NlsESBZWV9suXBIyk348vrsFu+ob55hn8JCH0jjJOF4YFhy4Ys3GmI9vhn7npHTTE3dfW7Mncbs7r62W4Al1ervEJIgQ6gjA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV4PR04MB11850.eurprd04.prod.outlook.com (2603:10a6:150:2e0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 16:34:48 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 16:34:48 +0000
Date: Fri, 2 Oct 2026 11:34:38 -0500
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
Message-ID: <ar_dHsVPOpqldZlZ@SMW015318>
References: <20260916-nord-gpi-dt-bindings-v1-1-857bf9e84999@oss.qualcomm.com>
 <CAMRc=MdVQ4xUFPtcytXt5Tqor5-fUjHiRvnpmxBsJpJbd1rHLw@mail.gmail.com>
 <ar_OXbdMsP43JM9v@SMW015318>
 <CAMRc=Mfb-YspC2DBCfq+gay5Z7FkaK0HzfgwSiULaUZUxjMSgw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mfb-YspC2DBCfq+gay5Z7FkaK0HzfgwSiULaUZUxjMSgw@mail.gmail.com>
X-ClientProxiedBy: CY5PR19CA0130.namprd19.prod.outlook.com
 (2603:10b6:930:64::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV4PR04MB11850:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f4dea11-7c0b-436d-2678-08df20a312f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|23010399003|10067099003|56012099006|4143699003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	ZLItaVqQwMY8SgPiTnjeM6/xRVm6EBBnoGB4OVEmyw6SCqMJY6/8ukU+i7bOs9PJ3aVoV+fepAWzfUAHRigUaj4pVyyENmTaL1qPqRbdK6gFTK28AXt6tLvEe5lhbeXPskHZ1N5vZZzF2qGpitKJ7yolqskfjq9rUmYd2UBjqnuidDbrDknVkCRBf6rYLc0Rmgq073Bxde6UOFBl7zM6TyWeqK/M3QbaWiXc9IvkMARg85nDARRjij0jTZyGQvuNx5CYhxj3ka8/fC+8CGjQDXlLuPYsGtnUYZSjz3m9kW30WOwK38DhhkFU1LxfvciIQvs7nU8IJyBInOq/mDxMNCNPwP4+ITtO6Qhs/lBx9LHjnqU9ZOBmm03CJWzKhESdxI3Wi7lGTjtlaP3s5BI9s5pOYR4Fc6CE61euHIZbbuMklz7/2Q6nXeO4gbPG46S4gzo13lfnrfjnN78y24oAea+QjI9pi+hPICPlxnbSY3jh33Ti7XeXuA+6UZFnwjYZucAeGgjEB1gFEWBDbiuJUnmZ1H+6S7yVJXRGGpe9bm4LgkFz1WlzQ0iYJPYEJKnCXvIJLhOZpIAZOefFHIxLr9P5BfyLY8J06Z+Q2WwPEDjQGNd4wZhwtXjfT2T1N9wmt3110v1vjS1b4Pxbb2yE0Iwh5uO2klHbvpEIGbCgAiE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TkcOGhDGdZPCFEzaZ3tbntefKtT0BVu8np1Uvzs4fp2BdvJQ0jWDtIYxzQJw?=
 =?us-ascii?Q?pXXU2Q0IFz8PAXIkcXKf0Uc8E31J9lvu0bOmbnsakSQmWGLAmzOnuPZzNrGV?=
 =?us-ascii?Q?wfl8FnyZKD5GGsUMCz+yxmhNbGOZp1vl1JaxsfTtA6m3feENqk6onU7HzV6Y?=
 =?us-ascii?Q?sukWeUykCuGeUNFTOmLn8OO7LyJKtS/RcX8lNjllSkNL9qsrYVcD6vCNcrYr?=
 =?us-ascii?Q?gDI6LzMpntfMWtttGnBOl4TyHJykeMJwGVt5mzG+PbEvuN0dcDAwLs9WE3fa?=
 =?us-ascii?Q?UQVHHNXwULuTbqIkc9ZXIkTciLPPDt6hdwyZL9Wip6Tz/Wxy/s2vbbP1ux7y?=
 =?us-ascii?Q?9QngsRwQ2DSYXQ4AlsyS9iXr4HAgCGxBpWBmpuU+WYplxQIVWksFOwYpIa7l?=
 =?us-ascii?Q?OYUQ2/ExW/8jcYOiy0ghmtocrTQqlVOvVooreq1sP/f4UJau3bg7cjLFjTlk?=
 =?us-ascii?Q?IYGVzP3FnICzyuSmjDWRC/QbTmpNu/T9Du/D6MSsOZr1nAyNRUyJkpTp1xtc?=
 =?us-ascii?Q?k/xZ5Itzq/Ftyw5qYMERYOAiWjoo0ahngCuZTe8RhveXRBw53QZRYr91F1IL?=
 =?us-ascii?Q?hXkSJY8oZ4q+8DCZ8xduOyARUOawTvZcQdvfAcjGEJi+R8UWT5hDJ92ihSvR?=
 =?us-ascii?Q?/Mm8wuosKMYRhMMiJCxs0ShaZONlT3bS+1p4bfVoje//+gnb2BJEphakdTfu?=
 =?us-ascii?Q?K8MNPnVp2ikAmw49SHZuqYOid16gGw6ixulS3tKR7s/piuRsQiAwZ+rUMVOu?=
 =?us-ascii?Q?WBSPkqTfaOzk1IzCPVuPfSCKsF+dhhOqc3ktTw/ra5toUF6eXmgDkrzZbMnz?=
 =?us-ascii?Q?pgvY6DGHy/GiCkHlwRSt8Xim0VVSQCRC53ddCpmsF9jMtSCxoCwBpDwDs6eT?=
 =?us-ascii?Q?FaAmfNed1bASs73tRwNK/6hqcXBXj26nQnUrn23NBTXVYDNmTfg5snGd4qwM?=
 =?us-ascii?Q?70QO71f0qDoFHwcpGnttFjnR3vxHO+hwjKy5mdOYg74UV45hrMA9jIKO+/DW?=
 =?us-ascii?Q?IDTbAp7Q2Yb8KOtyTCQ2WhzvF9yS3ze/qaW5+026/4Ppc/UIYwwptLVXZE5Z?=
 =?us-ascii?Q?N+vcSZcSxDQgFFfa37q5K5x7rrMiCScFbMGJoBQd9CEpPg7RearnA4aYcZQ0?=
 =?us-ascii?Q?etJGBp0PO9/KOSOrRBfO6pwdoJyr60ymqvMRzIJQ9i1EzbPxCu/ZXZ8+Dm4W?=
 =?us-ascii?Q?voDY11b5oUjX0e41U4pr47elTDHiaWCbsL3f+nXClHfG3Tb8Ku6EzlYquok/?=
 =?us-ascii?Q?DqMeC0sKylKFuiN0mYxhkAkCLgbruekgpB9L1J0d1i5CXaBrFHj4nCEn33Hu?=
 =?us-ascii?Q?57h0tea2rUikC448DpDKa+dv58TH82XTZtpKmmSptyrvkWQhdg+0NPGlPJ3A?=
 =?us-ascii?Q?qaTfz6tW1GanpvJh/N7yV/UzI1XeB6nO6LlQrRZWNcrqDB/pP4Of8gdxrMyE?=
 =?us-ascii?Q?PmXn/Tc9uT+ux9/oSPLlv7860bPtZhK75miaoKRGDu0zLoZY9GI+IpMrAXEP?=
 =?us-ascii?Q?UfI61IxBxiAcr9xZgzPVi/f/1OEBRO5C5D2hBHxFG7vDw/dDuubQgVkQktQY?=
 =?us-ascii?Q?gEAYWLgkUbE1PI4qQvmuN8JF5WCwhd/RYHZieLRGAbbKtxjFtLdEzmtNCpKm?=
 =?us-ascii?Q?wupzMqF00xB8HSs7hGA/eFQH/SV2SQIm7pJlqwgqFleEPrIjL/sr2LQzguWW?=
 =?us-ascii?Q?beLQrUG4COA8csrOucvqaM50YHlVe4YgCSCK8PUjmBgeywaEw/oGnjNDnSuo?=
 =?us-ascii?Q?L5C+CsicMHMsMw8fn1QjFRyXT+FAWNRMAKxQX8B4+YhJiRpWUj3K?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f4dea11-7c0b-436d-2678-08df20a312f5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 16:34:48.1505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9eEdV0oZB8argALcqrgDRJt588f9hxVMrew45lJ8iXQciNswmuIfHgaT6vi6TlsS4bfY/bwMu8to/PTxj+Lf9PYpnzqAgjhzi6uTg2CVBBpzVESCzNe7tt2wonF89ZI6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11850

On Fri, Oct 02, 2026 at 12:28:40PM -0400, Bartosz Golaszewski wrote:
> On Fri, 2 Oct 2026 17:31:41 +0200, Frank Li <Frank.li@oss.nxp.com> said:
> > On Fri, Oct 02, 2026 at 11:46:57AM +0300, Bartosz Golaszewski wrote:
> >> On Wed, 16 Sep 2026 17:21:29 +0200, Bartosz Golaszewski
> >> <bartosz.golaszewski@oss.qualcomm.com> said:
> >> > Add the compatible string for the GPI DMA engine found on the Nord
> >> > family of SoCs.
> >> >
> >> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >> > ---
> >> >  Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
> >> >  1 file changed, 1 insertion(+)
> >> >
> >> > diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> >> > index 54dca623223d51373a4d54591f3ebbf5e31fca17..ad70717b5b86e600e74d6cfe42015dc03db25ba9 100644
> >> > --- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> >> > +++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> >> > @@ -29,6 +29,7 @@ properties:
> >> >                - qcom,hawi-gpi-dma
> >> >                - qcom,kaanapali-gpi-dma
> >> >                - qcom,milos-gpi-dma
> >> > +              - qcom,nord-gpi-dma
> >> >                - qcom,qcm2290-gpi-dma
> >> >                - qcom,qcs8300-gpi-dma
> >> >                - qcom,qdu1000-gpi-dma
> >> >
> >> > ---
> >> > base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
> >> > change-id: 20260916-nord-gpi-dt-bindings-f4b10102d22b
> >> >
> >> > Best regards,
> >> > --
> >> > Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >> >
> >> >
> >>
> >> Vinod: gentle ping, can this make v7.4, please? Otherwise, can you Ack it
> >> and let Bjorn pick it up?
> >
> > I have not seen dt team's review tags yet. You should ping DT Team firstly.
> >
> > And subject:
> > 	dt-bindings: dmaengine: qcom,gpi, although there some use "dma",
> > but avoid confuse in future, all will consistently use "dmeangine".
> >
>
> Do we require DT maintainers' review tags even for a single liner changes
> like this one that don't carry much potential for errors? For GPIO I typically
> take small changes like this even without them.

That's my understand, Krzysztof or Rob may provide more guide line.

Frank

>
> Bart
