Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794860656;
	b=JkFTqGNe5JhneVk7UWq16l46hLDZpE9UL3uPAXTMx85sfY4D/L9b6qtemVhJzkNK+ETb
	 BjprCJXs72l5jU/LCwLwx9IZs6lRDIfdGV6MgjaaZRSYAF4sOcplFX32W0s1Cg4v7/SpR
	 eDaU2ln6yB4emLy8ZHcwV/ohxGzUn0yzgq9LT4rFTvLRJSx9+NfdksCGPBSHfp3/5Fy/v
	 FOpoMPJqJ1F7d7mGAstLEmmh63KoiZH4oSJYi73VjkFvoMEq+Rd1o1PbUzAz6zuj1499w
	 7vi537Y1Z7ucIirhyvAJhom5yCOrOkgf4fMxp0uI7Nt+0TD/D30H1YzNo0KDMyKifSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794860656;
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
	bh=VojVxtKo+2rNWYWFbQlhBRUa6oI5h3xUKRKgR6ZeCSY=;
	b=eoriWAcn3192eqlgv6l7ZGt4JjlHauXnNPcZmZFvRqUPKdCtQXUi1tRHRix9E6VGYfIo
	 tci4aPIdsX3seyw7AtKJ1tKC4rsNeuBTN9V0ECHZAtP0yVbQcIg/16rqPHlFds6CBZosa
	 q0B4U8YcvxfcI3O3H26l2dvOJiTxXfxgJjCeHl4rv90/n3wHiE5VW+XA6Ir5Y+S5LlmUP
	 bNaeo+unRr56wvYCK63KqncTxWF/vaFSE672Ev87feb/fUPY0Ts0txHkIPYXHvG8lC5Xd
	 Knnzb/mygWkT1YaXkBgLoAs5NLboQ52MkV46P7JYlS6l+Kiv9XeWG2jbkGjX0pTA/nw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ns9kRkXF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.10
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010010.outbound.protection.outlook.com [52.101.84.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12F7606A323;
	Mon, 16 Nov 2026 20:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A12F7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ns9kRkXF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/sqgPpYrZag5TXT6Bs2H5JE+hFguAnSKVlGJKaMs/E4I+1zriKq1pNfq/cRvkDYeQ3ZhHUJ55nU+dT2iu6bhxRsdtQ0JkkjD/jFQ3YqbtZojdN5EV7Tm9xRuYwvx7SHJmnJ4PquaKBMh0s1D7KIhoG8qsSDIDh6t/pBo5EV1yxZFR3TyN8JFexb4H1TO3zECIY4Vmkpd6m3643xlXbhYYv6/ET4ALxoiNaJG1LWxZeZBqOKOp6SG1GXit2a59EEA2uMSY41xywyFfmfu2KAATeHHdmanjyXY+UQ8tlHJEdfVBPgwCqHs3FYp4yRb3C93SzkcJQiJHxmYVV0iq/Ekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VojVxtKo+2rNWYWFbQlhBRUa6oI5h3xUKRKgR6ZeCSY=;
 b=vFtRc+dokLJ+B2tOZWVQDbg48BfX5UCRt0ncYtVV15aH5qrmqBs6pBsijuMA3h9P1lEoyBHTxBRA2UOeLARAgfeRJKPC+FO6FSBZSTHYQen7jLEen100gm1w70QjaeS1ZE9Aidal4NYdIaKunEs3NonnXdBU6avr+qH6UwU6fCUGmT73tawSgeeTqDjNuWlWmIy+ru5zpfUL3cS7CUarWa10LqasBzQZ+aESJN9DR1/QegJfQ95iwazeqjY7JSr1To4ZoFS5ctZBHM8okmIJOL/iQO6EkjH5hpdWNvNuoh7krTEUbvRLM8z9uL1IwA0ENdYbHaQaA2fV1cyNE3oUaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VojVxtKo+2rNWYWFbQlhBRUa6oI5h3xUKRKgR6ZeCSY=;
 b=ns9kRkXF/wK3RQiImZPkoi9F57JiyfzVhxZb2EoKG2/OdiuLepaSA2he2TJxrHM5od5patUiDnTWxd++fz2v3qZ4nerAfw0wvyGrt8Msi5hbFIQQF610q5VxgRxds/6FAfzHFRsSQ9LfqiIOz4KGVebVfffSGqThSBnQWq3eyntjieZFaYeP9a3yYsws2/BmSGMz52LDfjQ2dkAzSIxUhxHMWNV1PYZfwpi8nTKmntKyYelo1LudpsYX+OlXPatRd0VhJ37BNtagoZglsGczOQ3qT3lyzOVYr9Bpi+FqhGXXY31sA4GJYIXUMVzOx3xqNi4/gaHFhrrVExNLbDJUGw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVXPR04MB10492.eurprd04.prod.outlook.com (2603:10a6:150:1e0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 20:24:12 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 20:24:12 +0000
Date: Mon, 16 Nov 2026 14:24:03 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: David Yang <mmyangfl@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dmaengine: pl08x: Release the reset before
 reading registers
Message-ID: <avtmY1WaVWI_lxT_@SMW015318>
References: <20261106072602.77560-1-mmyangfl@gmail.com>
 <20261106072602.77560-2-mmyangfl@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106072602.77560-2-mmyangfl@gmail.com>
X-ClientProxiedBy: PH5P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::6) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVXPR04MB10492:EE_
X-MS-Office365-Filtering-Correlation-Id: ba350c43-f901-4903-2f29-08df441f93d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|376014|10067099003|11063799006|56012099006|4143699003|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nenWhUPnRnFeW+Ch0CEukQv7meD0mbXUCOMIK9XBNjQFgnCq5QUl70sYbrWh1QHhK77wjQR5B5KkBAFtyFnoXJ/Nq8QZk9AjAjRAQOM23FDaB3aigGB98XUMgFeScUzEo1IgjhKX6F8JS7BjGZpsJuUgs1TlWGX8jxxARCtvvBGf1xVX+0nAESrYZ05RNnfnswP3MTuC6J44AGZJEIieFPwFan5U5b0f1GQxMEizwUHmI6OD4e5VxJhZJCedW2SL2Xx4ujXICKh7M9qSQK37iG8jt+fi2sE5dE1rlGBX1PlL57CVv/tdmPl6XAUFXKQQ+g9t5p2rqJ1sdwZOrVUKfS4fcOK9Qude/QwY1V+6cshzJsKA00fuoANCTpzZuA0Qn+5vYpQs/6atyy4xya/SVWo7c8NyWzFJA+bdvzGw6B87yS1TY8rKh85bOxXC4DVCjYd7wzGqomuH3NpBQfPS0fvHTEOm6ilY1vbM3SvURXWvmsduNzN4T9+Y7E36RV2owEkusrpD6Dur4n9xHpfpSY/7VYTV2/TZzkYXoXRwuQdJSeft3g/dHJA6Mkj07+N4jeiZ9zzUxyQTto+cgDIxFNoDHrLO3imtmwA5zzijHyjTDzm9yCXvcq/vwNTKLdXDwgVU2P4kZPPi40IGjpx+Hs5LAZmtiAU93/vdsLwGqdM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(376014)(10067099003)(11063799006)(56012099006)(4143699003)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RV8Umin7fern9tj3RzYErbwNF8UHDIzDbqCPtxsarXXpQh96KTch9MUzljYQ?=
 =?us-ascii?Q?eOgB4GsRU20J+YHndftohGxIKVForUgAEl4/MMrY1Pajte4pa9FYq2rnOgZY?=
 =?us-ascii?Q?RmJ8suGC+PoCTUH1YorlWT+ocJ23Fv9qGlDoWx15/84oe/GhMhKwvZ/j/i8V?=
 =?us-ascii?Q?8dcLBhVddmkgrjRkYg/SMlblHdaJrkhVPlP7l4fZkxcORowQzDT7tEzVMpTo?=
 =?us-ascii?Q?dN5VFLiMB0gi3mB0SGTdSa1fHQjuZW0Tc6P2oZDU6a9nQzm0uNuK/HrYkcaW?=
 =?us-ascii?Q?mQhPG4GEM2COtjgEn/vT/xCYSBLedInE8rQx8cIGGuXQJvFk6jpnnlZaLaBN?=
 =?us-ascii?Q?3wNbKJASfQGdT6oi0mxADrh5W8KWMTLxIr25ciNcuf/gpsrxwXKH0jAlrsCZ?=
 =?us-ascii?Q?QaQayfgIQrw3sAlvFAivn/ab45dr489LbzHYm9rDkB/TNK6plJ21EeqjjARB?=
 =?us-ascii?Q?w28J18N9D5ZKdTp773h5rrbBVRCOvPo3nDip/WtEswf5rscooodskPz5aFE5?=
 =?us-ascii?Q?Pk4nqABz5w3GIsPr+I4HZcrsdWKN5xKI1TAty/+7aAp5yefRcO5gUE+U4aVi?=
 =?us-ascii?Q?bUDM6kCllm72VvXzMwEKIofuwjO1j/d74LXHV2XFGXLY10CTefPZpvOuQQ7r?=
 =?us-ascii?Q?kGEB/XPzu73RaFqT124hmc4JuvtvBRLk6OrmK7wZVN1nKETbD14Za/zIA6f9?=
 =?us-ascii?Q?6V1TT4UT93RUa1M4nFetvSXVwRWoCeC/n5xWI0udaJVcdj79eaZOBIac55Yj?=
 =?us-ascii?Q?rTON6CpQwi800iFE/GcVXxFMbaF3HjidFkaURsj6wq+HDsCGrmNqSmpSAHCw?=
 =?us-ascii?Q?w1/lbK1KOpD2IOwP+7BHk4uMtJwpii1HN3pODM0A1w/9h849f9ehSfOGkzBI?=
 =?us-ascii?Q?SbRrfvm4QgWbjPmdAFOT0xskYFcpUYyE6lA+mSk2TVyBj9efEzU8ccUlUZ8e?=
 =?us-ascii?Q?93Va2ROdJgf7H5VAwUfWaEwjmRayhlrHdBim+oEarOxgXLU2S23hXepOXAvQ?=
 =?us-ascii?Q?0nNSaD/HGPgYSDnKY2aI0RVxa1Rd7udDwO0kDaB5uT6g8G4DkHgDWsYLMkoi?=
 =?us-ascii?Q?6Wz8yMrFTKtT9UV1nx/kWdA2TdJbit0Jx25K4iHo0/IX3A9uOsWfGbqyrzL+?=
 =?us-ascii?Q?QcdhPXIzQGdtJzgqvGzgXxL/su6x5md8V4NRAeSeGyyU6Hhg8cqgd0jzv6+U?=
 =?us-ascii?Q?v9UMZ6FA3Ah2x5pA3o1yjIh3UsJLxDNN1hq0+h5Mc4pOB48CWvshMRV2/aUn?=
 =?us-ascii?Q?7/2Wp5CpxfOl7pG3lNzWtfEVpW6XrJ14/96H43DWvh09b4YpSxrrweDSsMLW?=
 =?us-ascii?Q?BTfaoGyWgApqtt/PFMnjbTN3q1VZE2RbanRnOZQy8aZut0Gw9q0D5LlTrmiN?=
 =?us-ascii?Q?IxEraKo8N4qjPDnHD1hODRwX2Ee5PJm884RsNbyqLmGdGCNotr+JOaEr8THF?=
 =?us-ascii?Q?gKx0absGvXwyO5y0FVpF1/qTSUaIdV4zS/GxKWcfNdM5tICdF3nS0uQMRzhh?=
 =?us-ascii?Q?IHLOJcq5Bt2BbrZ046y8/q0ialpCpqLS6A9mJTLP+fnhhBuXCxL/2wiGnX0G?=
 =?us-ascii?Q?zt9oOU9nFdXO9ouUg5SPgtuLwKoa34ljRGj+dX1aDxMuCrm+wc6rnG9Qp77R?=
 =?us-ascii?Q?KxHNPIOlt/TG6W4cf3nl//1lUPDDPjnDiObp68gT5T6ewCrgntpBvldrMbuP?=
 =?us-ascii?Q?+wL7GZ2NZukLBONgx8w9wbg03Ar6rBBhR503JhCCTIveBmHA4q9f3/OmepdV?=
 =?us-ascii?Q?oqEzcX2nBf4jTvccy88lQlEKB8YQkrZhpYZMbx6OjlOsquWWtcV1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba350c43-f901-4903-2f29-08df441f93d5
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 20:24:12.6769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pNkou8WsghFDaGTUI0U5q1/NqCk32tm9FkH+kNy5Xj6mKlNSWFU1XScS2ReXeoFIfdDbRMUn07Fvemo1lEJg1T3ReaHrNbHco9GsVhrgxdvbDajNWTwGinDxdTJBrHD0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10492

On Fri, Nov 06, 2026 at 03:25:58PM +0800, David Yang wrote:
> [You don't often get email from mmyangfl@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> amba_read_periphid() happens to release the reset. A node that carries
> arm,primecell-periphid never reaches it. Take the reset shared and
> release it ourselves.
>
> Signed-off-by: David Yang <mmyangfl@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/amba-pl08x.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
> index 543c2eb8cfa8..9f5e4f5fb877 100644
> --- a/drivers/dma/amba-pl08x.c
> +++ b/drivers/dma/amba-pl08x.c
> @@ -75,6 +75,7 @@
>  #include <linux/of.h>
>  #include <linux/of_dma.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/reset.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
>  #include <linux/amba/pl080.h>
> @@ -2695,6 +2696,7 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
>         struct pl08x_driver_data *pl08x;
>         struct vendor_data *vd = id->data;
>         struct device_node *np = adev->dev.of_node;
> +       struct reset_control *rst;
>         u32 tsfr_size;
>         int ret = 0;
>         int i;
> @@ -2725,6 +2727,13 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
>                 goto out_no_ioremap;
>         }
>
> +       /* Release the reset before reading registers */
> +       rst = devm_reset_control_get_optional_shared_deasserted(&adev->dev, NULL);
> +       if (IS_ERR(rst)) {
> +               ret = PTR_ERR(rst);
> +               goto out_no_platdata;
> +       }
> +
>         if (vd->ftdmac020) {
>                 u32 val;
>
> --
> 2.53.0
>
