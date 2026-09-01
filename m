Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010070.outbound.protection.outlook.com [52.101.84.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE7849F139;
	Tue,  1 Sep 2026 18:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788288922; cv=fail; b=TJKH7QKdieRivtONjZQDPc7Aa/rcRqfK1QJ6nps7S4L556quEWEySWaY1EojaX+LalSfcQfZHrZy15iIbPp7Mjv88++XPaPaJSIRZW61qb4IYf3J8bIjE9aTfHv8vKa1LKFE4CnZ7Sc1I9y3ur+MzrWtLPeI7phlZywRXDDOQ9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788288922; c=relaxed/simple;
	bh=ZMGhGBB1L+W2tKDl5vZfZFqHvU5y+KXZaZ9Zum6onFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ye66ZQ5+IUr0R56TlyLVUZWGRfdekFIQ9PJ5MGdwfrqtiWjFdPzJXJHZv25to+kzbfEbCX6s84B65P/D/gHkyE4pGK73UXxbw8KbcnXYdUvhe4BNFyDNJsULaEpzb7RU1BkTojc4sRchL5tiK8s7WUV0Geu4Tfv6DncOA4m0m5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=H2QXVtNN; arc=fail smtp.client-ip=52.101.84.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="H2QXVtNN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nHOtdnstumK5u1JB205DCxrOzS0MOcXf3jLii+t3+JvvXOiXYLABSO3kflkWVJo85tIYr/7XSI3p1mOxCFJEnD8Eg6OBeD+knRmFxQludwErZRqdw6nsO8i+z+srX3BvURO3aqsJttj5BwQcYzoTx6RYkbRVgdDiNM5VTrnBX99/clXJR0Z1Jt68uJ6kPUGZJjfNR0P1+qXRtM7KEa/CIp/rL8EHhgKgEOE/ef67uZaxHVJqXjktvWfUt5wFjyZYa3Y9VomvWlJXgx7ZB2cUDIdCvf1Cjp1OwocATRsAHth8ayazY32ttPVTkWrJETJyswRQzQcGJaio9uwlG0yB6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I3V4L972PCYRLwGQtJG/xvTKkjToVRvm3IQrpJBYjKU=;
 b=OiT+jOXyJTEkCsJQiNPSPwm3DBe6GawfeWue53TYcVrgD9JTSwpNATa0X9+rbJLhhDM2cngdGUvmsgefEFAZ3SraOBP1FlhyXUQqejo0lOaG241G/2U632ADfvZOfVPxq4KRLoYzg+sBLExvJcFBklmZit2xanKWK+7bdmI/nzE1zAAKovi9LPbKJgxOzuwOwOuwG+zvvdgm3GtviDFmPK7YRVdZuthHaGCPVGLdavnrVNxDqKe0YWYOi03AeUV3SZ9MNYZOpPG1rqAX6nIxoAdwCGtEx5C9lFQHq8+2EF/gmTfH1aULmwYLFRfC1cpgxnP9m8rOP6Id5Cm7GOAczQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I3V4L972PCYRLwGQtJG/xvTKkjToVRvm3IQrpJBYjKU=;
 b=H2QXVtNNOpraUQEEd0p22pTObE9g7gqcWnw+6Hwskk6VNGlM6Vhem0QT3kBypjJzPVhD/VPjvkBIBc5TzFCzMfF5aVQPbPnzSOcC/sX0oCK9t6zvIHP/QhuMf5UERNp82YqFEuXtj2C58ldciK6fYN/eG7bMzhMYwsrSHQb22sfERe9jLDP56VJ9LRX2jCCuTL+tgHimMXwBysvDjDwOyFtsoGAsVLEdjV4wD4oeBwrngAEl6SVBxeTmgMFi8CvL20g87LhNuqRHyNYIAOxus0kkhOo064fwlFfcHngd8WHUflEOQTdqB2LzO3iZiMabkZEzXBrlrNorp/4A5fiN7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10928.eurprd04.prod.outlook.com (2603:10a6:800:261::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 18:55:17 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 18:55:17 +0000
Date: Tue, 1 Sep 2026 13:55:08 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Pandith N <pandith.n@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sia Jee Heng <jee.heng.sia@intel.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dmaengine: dw-axi-dmac: Fix CH_CFG2 channel
 priority position
Message-ID: <apcfjKdEMLaat1_s@SMW015318>
References: <20260901-dma-fix-v2-0-d7f0459ebb14@ultrarisc.com>
 <20260901-dma-fix-v2-3-d7f0459ebb14@ultrarisc.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-dma-fix-v2-3-d7f0459ebb14@ultrarisc.com>
X-ClientProxiedBy: CYZPR17CA0010.namprd17.prod.outlook.com
 (2603:10b6:930:8c::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10928:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e01b9af-1ca2-4bda-b067-08df085a9038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|23010399003|22082099003|18002099003|56012099006|10067099003|4143699003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	6QtTJdCveJZr3r8ox83d3MmUhnwic9eU24lBO95PVI4entb42TYqQ1YEfkRbD7E7mrnyc4VQadtPvwW0ETavM0O6GIlkwq4OrxGxn/+P0dX/5WYMr7essVditPkTZ9lvAGbIl2UEAKgePFJ9ch1CsyjBXJdnAzylRFTgfcqCi8AS/8tv6z8WZRpLrEccgjCIURZ0/FniEyHV4W8CmlPHlbpVAcEFJyHId9rRc/dV3xAQUI33v45U2WXXZ6BTacw3k4OsnquiaAHAMwO8OeGJQPgy4+g0VApxko3lgTxwXx96jpIfAmvy6NSxGzIyIbl60ZOGCiPYCDV1bb1RhKlmDJ2BXv12KZT8Flb1ms1KFeKHhL0mto50Etdr0KHaG+gpVQTvr7fhTmEpu6pI+y36rFe5K5XuAaKOmetmzN64scsUBwx+te0cXtzuOxVtY4F8JHBwocaLPHY9hAB9G5qMoYXqZ3uNlhjOFu2pWoYbrfeu0TIh7l7dM3sR0MNlnyemmBQWyAd/GRQdINTnrgHDQE3UND5rWxxMjHnmil9YJpxTNaxBkH1/f0GT6LgS1W0XKc3yeQ5MI8+NTW8X2MC8klkLcEmE3l+4wwR2u2Xuj445K4Xw6F7i4P/Yd17rSew/tPhaRTSAkh7/yueZGDP9l3E0Gv+VU5GEHxlX2VA8fQ0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(10067099003)(4143699003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PtCsUPxegePVy0wrUkgwXGjPulG1Zu3Zh4DvJTllRw1mdOJM8G62wvO7+K4l?=
 =?us-ascii?Q?vShxjlWThXMXNkBMyYjOJV630ohwHoY9P16V45+LMdORai/LyAjHWnCTJBzp?=
 =?us-ascii?Q?yvji/Oqkyaam6HYdUV1kQ8FF5MbKSV09PLC/3Vh+9g7vlrdtaCkF6nPXOD6X?=
 =?us-ascii?Q?DFTYYvZRTbQEn4ghlT/3+XBG4d06W9MaHOuNO9otikHGVKN5zgapwEtcpzTq?=
 =?us-ascii?Q?L9djJuIJ0ce8DUOxB36k2/JB2aKQdkseN1NA2Rc9qrw93CdS3A4IlRXzMXl8?=
 =?us-ascii?Q?JYm8CsSr9PgDDMkyIrFsJ4kWNxOSh/kSBmKK/Kso3AaMoFe3eMxz6Qzx6nTB?=
 =?us-ascii?Q?7YiQ2GspY3efGCsFaqaElIeWMGZy7zvhvsAIg75bU5VfIMoV6WOVSlmCI1Ur?=
 =?us-ascii?Q?7hu7e7zS5kCwwYcGejOhh8V+Ew8Ihe69VM3fI6x1s1L3NDaGbAGQxQicfOw3?=
 =?us-ascii?Q?ckAIaSocSGZBQ8fgEI4cGmcoal+RsetFBB4gc6oG/pdotZVVg+s8ZL2B9RUo?=
 =?us-ascii?Q?T7woo37qDz6DVNWJyQiQialHRM9Yjzzc3HTk3LExuYr8hGR0T5c8QbghooQk?=
 =?us-ascii?Q?COa7jxv5NitVYTQEFnFzD/vCV7wsXkqVeKfR8YonJBGKuad1KD92jR53o8RM?=
 =?us-ascii?Q?gnwdDPdifDwavyHVwDr6DNE/lThrrnpHy0kNCwB+E8x+mpQtCVomBlZW8NKE?=
 =?us-ascii?Q?Odf/mjm2o16m4Uo+izUhxB6k0MHTF/CPnoKwY3OluFG78spoBQO4Z/kJ4XKX?=
 =?us-ascii?Q?+Kc9LccTtF1U+UMlDmwmgxmEN3xENj8gRdAyOv+dpcFnCPH70ygTtAymjhDl?=
 =?us-ascii?Q?cnkZMm///CNH5/h/wyiefNBPyKYGrJsRMZrG67FF0ybMWu+HfriZdUTOHcwR?=
 =?us-ascii?Q?nuAlM0mJAcuKOaZ8F6C7EhdahU9xt4sGjO6jrxCLTBI0Mx3kuLVmVBDvETJd?=
 =?us-ascii?Q?iJLkcaHKW1y9hxg39TJr8RtI8Nj2h85jXKhl8jFUeTaFYAleuVu7O8pRG6KR?=
 =?us-ascii?Q?VGl/Lj7rSungtbnvU8Uz8bvprEPGpxkC/5BdP1Y2jsov+XEIvu1X2OR077OM?=
 =?us-ascii?Q?jazEbI+zAZR8tayJqYIN5AHou6rAngniqNt/EkwqsJX1wguxB/HQZSOE1WZ2?=
 =?us-ascii?Q?/Tfxs/zPfEiOW841WSgLmKfIwMkCZp7+qFkPfJohkDUCOFzgzB0u1eOP0RIv?=
 =?us-ascii?Q?URJEz6Zv3TpCSgNAwnOIjSrpMmZUWu5vM78y+xBpwhwegRU6Ch3/1lFzOwPA?=
 =?us-ascii?Q?b4ZbUlnhJXtgzXmN3jlF4rO6qw7VZacxo2xIxBMnrve+ufRzZb9wxTo7m2yi?=
 =?us-ascii?Q?mEN6tcgy1ebQ4S5bwqEC7/qMqhyP60ydnFZkylT+vAAiggEjdeH2Gx3JaRFv?=
 =?us-ascii?Q?+RBDFKmtADtaDCXefF8lFHKTxImvrp3jPEXjpkDWtPGSoDkzS6x0zZ8CU+66?=
 =?us-ascii?Q?iqhoJPUyWaiD0oN80bJbfxcf31KA8AXzS9HA3Hj+d42A877XUkNpFOx85i6j?=
 =?us-ascii?Q?UfkPH2dHZvPi13FCoLKA44Wym+ZV5IN0n+/P/RkpgjvRNfPFuH4k9KrKhh+x?=
 =?us-ascii?Q?YIbC5iwT8MLEcHQxJOSxApB0T0U/Ffik4hrFvzU2nDR82dTwO1V9sfS2abzl?=
 =?us-ascii?Q?vvPjYXkoOM+yy3y5wbO67snRVzRLdbwabU77MRF8BqiJXHuhhkObGa488UNc?=
 =?us-ascii?Q?pmd71Jdo7vSeZ5JOTB15BHPgiwkKNSJB8Z+hTrkSX+hUr+UElcbD+aDRGtbV?=
 =?us-ascii?Q?/9PsFJLaAvRA09XFBH0ubUTDYFefIM6KZnFBpcT9InnyFBbTSdqJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e01b9af-1ca2-4bda-b067-08df085a9038
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 18:55:17.2916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KmFXCcbOR0YzmabKDa9dLkYgt+cryrI9MoNjxvivTSW67KQpGEzBwWKr3JdO2jlX+XAmStuANl9KRH18hQfpkz99efRGMfW86BkkvKKrzMUIf1kG1b3UaX2bdkI9FyTB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10928

On Tue, Sep 01, 2026 at 02:16:06PM +0800, Jia Wang wrote:
> The CH_CFG2 channel priority field occupies bits 51:47 of the 64-bit
> channel configuration register, corresponding to bits 19:15 of CH_CFG2_H.
>
> The driver currently shifts the priority value by 20, programming the
> wrong bits. Use bit 15 as the field position.
>
> Fixes: 824351668a41 ("dmaengine: dw-axi-dmac: support DMAX_NUM_CHANNELS > 8")
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/dw-axi-dmac/dw-axi-dmac.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> index 67cc199e24d1..97451bb8b16a 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> @@ -327,7 +327,7 @@ enum {
>  #define CH_CFG2_H_TT_FC_POS		0
>  #define CH_CFG2_H_HS_SEL_SRC_POS	3
>  #define CH_CFG2_H_HS_SEL_DST_POS	4
> -#define CH_CFG2_H_PRIORITY_POS		20
> +#define CH_CFG2_H_PRIORITY_POS		15
>
>  /**
>   * DW AXI DMA channel interrupts
>
> --
> 2.34.1
>
