Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010037.outbound.protection.outlook.com [52.101.84.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2056C481672;
	Tue, 25 Aug 2026 14:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787668817; cv=fail; b=C6fIGJWdcnp3+lFb/RrC3h9UWRqZA4R7KX2OtelzoYGrXq8ukvMJ9W51vnCaPMXH/3mjONS2nu80lZmIxfmE8tt3PPWnAV6MaMzgn+mNMWCESL83BGOoPhEo17IWi0iW/Er2/erAXwnwrs+LXNLCIaJliquNYd3kEGBP0S1SqiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787668817; c=relaxed/simple;
	bh=zEwp5/iTWo4Tc5vh3dF51r+NgM/Khm7Gycdr+NLjHiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EFN+kVak271OAIjkxUStGzpNMAUTuAiXwJEb60vt9lM1djzQTG9irJ4M5IdrIzGVL9GLsFsRmwFleIqLd0+F9FTeyKejtctaht2hUkYu5MFoxYznUf+pQV11YewGFgmZ143x5IV6W+xnbOKGcDzQa1AS4J6lntiLfVfRjMGcCj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=O9vRRZw7; arc=fail smtp.client-ip=52.101.84.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="O9vRRZw7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rCuAD02RrpOhYqq4mW/jkd+Mor9bp4hdT2VI99ntU1gjgwX3v7XGt5TV0JhdK1eD8kOHfqBVInS4IixJ2mQXxGSeYwGpFTP5/2xlzhK0T2GmbnraT5mERXuVL9ocf4lsX4rXNybTOipoKCg0BgLjc796mzr3+9jAAVbOo2WO5zMiSvuUZgGjCdqkeT7ew9CSt73eepdLFAOJGuM2tXBtaQOZGzry+u899wdrZe6Cf7IFBcWwR8HsZ4XOneI+pCWAbzWFHguMGOB3+8n9ZPKug9HNARG7Ppq1o7FZlcc3rVaVlYCqyHKa1toZd1/qrVTkpYj+mK1p3Uw2tOmv4sisdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7bZCJ5vl+52HJFDOg9K7MLDthY1/tB3rV/uZn/7Xa8=;
 b=iSYAkmNr1yMMdhmYVrdKbccmcb9B3KaRuTzbJE9HdLVHznoM4lmVqFZt5O+zMiRP0KTgsc/6Js30VEyqj9kyQ6htesBblm2VIDQbqlUqkE/ptB2zy+lVuyKYoy8K9bS3lsaVc2ii5goJZrt1xpAZPX2TCLKw4V5/4bj5AQ15ZcD6G59lc9xXELXgaVVR7sQXSRi5iQ7rrNoizbgyYh+tAtUVW+drUD0WowkBHNKbuNYPkXJN7s5s3/ny7vaJWhHaCqrr0nuv5VAQdF2sujJNDQ7linhRjxStgNwZkt8SPjOgOP9elF1ms1VsuDYPLX3hrxhMHTCvmqsjwhqiT6Kveg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7bZCJ5vl+52HJFDOg9K7MLDthY1/tB3rV/uZn/7Xa8=;
 b=O9vRRZw7ql2dkHPlqxdM712XXLmTJgKFqZhaH/7Ym/wHbl5cn5r/7njJZIptoQfk0Qa4ispDg1YMHCKwThnkuIELANNTVCk/4P9ENB/trLj+/1Mt7IU+ZlENbNsr/a9Lt/h3tlBMocp08p/1ufts+cckVZhUc1XHeUFvMbs7BkMdjV0QyEbcodrjWdYRoOysP/wI8s3xeMyu7hRiH1zqjsGdebGXnJumFSGZusT+KYUjOSynO4FMGrqqBUz83+p7/s+ubkjDC01lfQoRkX/htpnUIhKs/D5W0Wr/by68tK4XM7IeUlLJMbgAqizKqv8eYxrNsan0IUUZqovhljjSTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 14:40:05 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 14:40:04 +0000
Date: Tue, 25 Aug 2026 09:39:57 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: bestcomm: ioremap early
Message-ID: <ao2pPX3GZ5x9rFMM@SMW015318>
References: <20260823044900.11466-1-rosenp@gmail.com>
 <aoxiYtuTC3dULO06@SMW015318>
 <CAKxU2N_tmhkqh=wW82zrsHh56LuMKro-MzOFzJk5ETDx61xprw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N_tmhkqh=wW82zrsHh56LuMKro-MzOFzJk5ETDx61xprw@mail.gmail.com>
X-ClientProxiedBy: SA9PR13CA0150.namprd13.prod.outlook.com
 (2603:10b6:806:27::35) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB8790:EE_
X-MS-Office365-Filtering-Correlation-Id: ca0506e0-fb67-4c08-50e1-08df02b6c063
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|23010399003|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9TUUDDLLCUQOs1qY5mh7Y5IoZ9X2iYfwzM1e5BAKvfdlX6G/YhYFICz7DEsRWq3//qNKUuhJVRHYnXJWaAPXCIkzAih5gSDfOWXepn+PTCaKZ3B9wk05vvToqHNT1TeaGNn2cFI4XVeKECDFj0UKu78hZkpojX0n69G/hSjXxST4qoqMqYrJ1PbU+Y0lffjMz2aqTpMiLDV23SRO+WuODNNibiNZp+ANOFCzLB55ModIgksnSodj91ORegD9D8kkkE+UllUmFMTE1zxzkmKFNixVEEEwBAWNnDc7dlijgBsCmvWRAtgmKf9tBnM5HkHdRjTC31ofbJ6iEe2vVNq2iEUdA9Jd7wxw4lN8EkR8y0E9J/gcPLtHgordOWGjMDFY+MjgZfYlDO0+DRfyTnVf/A5AwjI8JjbkCD/9USfZSoBHOIZ0xUxqM1K3OJ5QqczJ7i4olza9p/ChvCJKWDsfDMY100xnfMaQP56R2XXfeppeALkwgJymHfMt7aemu0z/hymZLiMZ+jKFKsJJjX62qS6nSkPLsH2riLI/Ud2lHsNZgdB+WXqZ+Z9B/akETOo7Sf9y3Qg6+cbgy84w5ZKq+n6mkz5sMTRHo6521WyRnH83tAqQx+KEl/b1Kn94Pa1hcnsF6Taqms67HGh8Bttt2J0g+u0b4bXj37q2a3SDTG8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(23010399003)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d29pS3BMOUdyeGw4UEw2OE0yVHd2RnBmWFEzeWYzRXZ1cGQ0ZTI4N2NHYTlw?=
 =?utf-8?B?dndiSUcvZm9UNGROL3J2Y2ZDOE5udW5Ba0tldHRXY25hRFFKcHFGWkxEczlO?=
 =?utf-8?B?TDVKZXpqT0pCWGNtc3daSWlob2JoWUh4UjdpZjdla1ZKT3FNMC92S09xYit0?=
 =?utf-8?B?RE1rSG1wREJaRWJEeCtPZ1FNTmFGaDhEc2xCOGd3TytCTlVadjdHRGVjWjFw?=
 =?utf-8?B?enU1SGEwZ0NJSVF0dERUc3dPYkpDTUtsd0MzUW5vbWhxcXAyZ015Tkh2dU95?=
 =?utf-8?B?WjBEenhpait0cWxEZ3dSL3pvU2piOXhGSThUcExEREFJMmlHdkg4YlNZMEFS?=
 =?utf-8?B?dmVIaFNGeGZZVmE1SVl6Q1NLckpBYy8rcThwMzUvZ2hsaUZ3WUpqZDAwdnA4?=
 =?utf-8?B?bForZGIvelVDQ0swc2dEOU9Oei96b1oyZ3BCQ1Jtc2N1b0hzUnNXNXVqbThy?=
 =?utf-8?B?TTJRVmFIcjJlMUdBL1pMaUlTZEUvWmVyc0tKWjB5UjNUTmI2bHp3TlhWTW5Z?=
 =?utf-8?B?RGtDTzVTZ2FCc1Q1b09ZbXJKUUx1UG1GS3cyVThEaVBlTUgvc2NOQVRqay9G?=
 =?utf-8?B?blFkSHJTM3lPM3NzNUxEKzZNaE9VeWJqRUlRdExrSWloWXlsTGdUcjBUMWps?=
 =?utf-8?B?YU90eklkWGJtVU5NaDQrTiswMkhoMU91RWJzMnY4blVJWkhhRjJOa0taN0N4?=
 =?utf-8?B?VWVvT1dBeUs1ZnFyaE5XdEd2d1pGTjFuS2dySVFZaHA3ejRiYUV6ZFdRVFJt?=
 =?utf-8?B?ak5SUVVObGtjZW4yN05ocTNYNVdwMmRQQXdhZTd1NUpad3V1WFhUSGpoRmZm?=
 =?utf-8?B?bEpLNjdkNFlaZkFnN2QyV2tDZXpFNFhVZDZXQWNnTnBiaWVhNjZ3N0JpVWd6?=
 =?utf-8?B?ME9oLzJzVndvZFNhaCtKbzN3UWVwZTBMUm5wdnlkbEQ2c21sRmR2VlVYYXIr?=
 =?utf-8?B?TkQrSEUydWhJUkhUdmFaSXBRcDduNVdOaFRnek1rWnpLZ1hOOHZOUTlwWTJs?=
 =?utf-8?B?WmxFTTNrdmx0c2FkM0tqd25qOFR2M1g3OWNQQmFINVpzSE51cm9IRXpsSkFU?=
 =?utf-8?B?aHgxZzRRNm1kamlPMkZiM0NZTjYyY2g3QjhYZkNaMStIR3Y3QndIQmJrMkdw?=
 =?utf-8?B?R29aeTNiRlF5ZDUyMUNHMGxiSzc0UVJuM2dmUVZrWnNpU2VxSmxiZHFmZzNv?=
 =?utf-8?B?ZVpXNWJhT09SUHdScGEyaEVxR2dxbFc5NzBrWjRGR3dVaHd5L3Jnb2p4bmU0?=
 =?utf-8?B?bUkwbDBIMEFqbGVqdVk3elJaUXFIZE1wdVpMK1FRTkxlVmNyRUJOMCs5TVJ4?=
 =?utf-8?B?OTJCMHB3VkdsNEhQcHBSQW5KMUJNaG1WZTNHeXU3aXZ4RGZNRThFVnJkZUNZ?=
 =?utf-8?B?bE1UN254ZGM3VEJ1a3o2U3N2T3hYMzVMcnE1YkFSNTNNZUNzRFZqVzBnUlA1?=
 =?utf-8?B?N2w0K0ttcy96MW9aZlZEbTQ4cWZqb1FTcFhocXlvWHI2d1FWV29BUGRVWFNa?=
 =?utf-8?B?Vmg1VGY1ZmRzdVVFSCtWU0EzeC9ucmptd3VCL3VQek1BVTMzejVzZy96T2tZ?=
 =?utf-8?B?MjBQa2NSaU1oNnNrR0ZpQmpGbXd6dHA3VTAzdjFRL1dqN0RJOHJmcCtxK21k?=
 =?utf-8?B?enlYK0x3WTlVUlE5b3lWVEJiNUVjeWNsdlZRZmNzTHhHeFFYeWVzd2w4bERu?=
 =?utf-8?B?aVo1TlpianMvRXhqWmt6SUFGb2M5VFFwQ3lTaHYxbDZKQnB2NTNlMENHc0Zo?=
 =?utf-8?B?VWlKa2lXOENuYUx6SjlvYWdxekROZ2pwM3NsVC9UZnR5ckZtRmV4azZIdWZE?=
 =?utf-8?B?WlBjaGZQaEhud3RIaEdYQXRTVndmanNkaGgxU3FoMEFOZzM5ZHphQ2ZVOTFj?=
 =?utf-8?B?RDVCWVNROTVlVE00TjJiZjkweHNveDl5MFJidzlyWUxUcXc4V3pEOGZ1RUNF?=
 =?utf-8?B?akdraXVCeU0rcW5hb1dTT0F6YnBuc0FPcUZtNGE5N0dIMVY4NzM4MnV5d3pO?=
 =?utf-8?B?a3BNeDB3OHZYN3duSE5YQTEyRmpsaFRHbWFubC9MRVplMGlCTUNPN28vVnFI?=
 =?utf-8?B?OXQvQzl5a2Y0K2h3UnhhK1JaNk5tU3F1TDY2S2lIZDc1L2k2U3E3S1d6QS9X?=
 =?utf-8?B?Z2hRYzdibnZjNFBEOE9obW9jR3ZuNkNSaTB4cEJNMm1VR0Z4by8rNEZaUElZ?=
 =?utf-8?B?WXV5TkJxZUQ5LzhSNmtrK1YwQXlQR3Q3c1VGeDFzSkNuSm13UldEbi90L3BT?=
 =?utf-8?B?Y3dQeS9vT3hSMjhUNjJCRUprY3JZNy9HazdRVmF1cXoxeVc1M2lyUy9IVTRk?=
 =?utf-8?B?ekNZajU5d2MycUlpbTBFTTZFZUkybEo0T0RKamJIYVY0Y3Z2U0ZrdjNiU0lM?=
 =?utf-8?Q?VovghQ/A4r4RcR8b8vZZVrlWkJIYY2U1Pfn3L?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca0506e0-fb67-4c08-50e1-08df02b6c063
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 14:40:04.7676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xJRXqTO4a3zy2Czq/U/5eN5GDXjLWKh4LK6os/2020xAWVSma5YGZwKYcaXoRyQIzFkgacR1sF/idAuSBFTXyMDkIS75ORDFwTXgVGAVrZxcvG9Br+RoVYs+fZFtrtKq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8790

On Mon, Aug 24, 2026 at 01:24:06PM -0700, Rosen Penev wrote:
> On Mon, Aug 24, 2026 at 8:25 AM Frank Li <Frank.li@oss.nxp.com> wrote:
> >
> > On Sat, Aug 22, 2026 at 09:49:00PM -0700, Rosen Penev wrote:
> >
> > subject: dmaengine: bestcomm: use devm_platform_get_and_ioremap_resource() to simplify code
> >
> >
> > > Doing so allows handling potential -EPROBE_DEFER before any work gets
> > > done.
> > >
> > > Replace the open-coded resource lookup, request_mem_region, ioremap and
> > > the manual iounmap/release_mem_region cleanup in probe/remove with the
> > > managed devm_platform_get_and_ioremap_resource() helper. This removes the
> > > now-unused error-unmap/release paths and simplifies probing.
> > >
> > > This also fixes a resource size mismatch between allocating and freeing.
> > > From sashiko:
> > >
> > > >     release_mem_region(res_bcom.start, sizeof(struct mpc52xx_sdma));
> > >
> > > This is a pre-existing issue, but does this mismatch in size during release
> > > cause a permanent resource leak?
> >
> > %s/?/.
> >
> > > The memory region is requested earlier in mpc52xx_bcom_probe() using the
> > > device tree node size:
> > >     if (!request_mem_region(res_bcom.start, resource_size(&res_bcom),
> > >                             DRIVER_NAME)) {
> > > However, the error path above attempts to release the region using a fixed
> > > compile-time size: sizeof(struct mpc52xx_sdma). Since __release_region()
> > > strictly verifies the boundaries of the requested resource, if these sizes
> > > differ, the check fails and the I/O memory region is never freed. Driver
> > > unbinding in mpc52xx_bcom_remove() also uses this same fixed size.
> >
> > Needn't this paragraph, "devm_platform_get_and_ioremap_resource..." already
> > clear enough.
> This section is generated from Sashiko. Same as the above.

AI provided more detail information to help us understand situation, but
sometime it is long-winded.  Git commit need a nice summary. This is
simple code cleanup.

Frank

> >
> > Frank
> >
> > >
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> > >  drivers/dma/bestcomm/bestcomm.c | 45 ++++++++-------------------------
> > >  1 file changed, 10 insertions(+), 35 deletions(-)
> > >
> > > diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestcomm.c
> > > index 432b43520ddc..44ff4a42376b 100644
> > > --- a/drivers/dma/bestcomm/bestcomm.c
> > > +++ b/drivers/dma/bestcomm/bestcomm.c
> > > @@ -13,7 +13,6 @@
> > >  #include <linux/kernel.h>
> > >  #include <linux/slab.h>
> > >  #include <linux/of.h>
> > > -#include <linux/of_address.h>
> > >  #include <linux/of_irq.h>
> > >  #include <linux/platform_device.h>
> > >  #include <asm/io.h>
> > > @@ -365,13 +364,19 @@ bcom_engine_cleanup(void)
> > >  static int mpc52xx_bcom_probe(struct platform_device *op)
> > >  {
> > >       struct device_node *ofn_sram;
> > > -     struct resource res_bcom;
> > > +     struct resource *res_bcom;
> > > +     void __iomem *regs;
> > >
> > >       int rv;
> > >
> > >       /* Inform user we're ok so far */
> > >       printk(KERN_INFO "DMA: MPC52xx BestComm driver\n");
> > >
> > > +     /* Get, reserve & map io */
> > > +     regs = devm_platform_get_and_ioremap_resource(op, 0, &res_bcom);
> > > +     if (IS_ERR(regs))
> > > +             return PTR_ERR(regs);
> > > +
> > >       /* Get the bestcomm node */
> > >       of_node_get(op->dev.of_node);
> > >
> > > @@ -402,35 +407,13 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
> > >       /* Save the node */
> > >       bcom_eng->ofnode = op->dev.of_node;
> > >
> > > -     /* Get, reserve & map io */
> > > -     if (of_address_to_resource(op->dev.of_node, 0, &res_bcom)) {
> > > -             printk(KERN_ERR DRIVER_NAME ": "
> > > -                     "Can't get resource\n");
> > > -             rv = -EINVAL;
> > > -             goto error_sramclean;
> > > -     }
> > > -
> > > -     if (!request_mem_region(res_bcom.start, resource_size(&res_bcom),
> > > -                             DRIVER_NAME)) {
> > > -             printk(KERN_ERR DRIVER_NAME ": "
> > > -                     "Can't request registers region\n");
> > > -             rv = -EBUSY;
> > > -             goto error_sramclean;
> > > -     }
> > > -
> > > -     bcom_eng->regs_base = res_bcom.start;
> > > -     bcom_eng->regs = ioremap(res_bcom.start, sizeof(struct mpc52xx_sdma));
> > > -     if (!bcom_eng->regs) {
> > > -             printk(KERN_ERR DRIVER_NAME ": "
> > > -                     "Can't map registers\n");
> > > -             rv = -ENOMEM;
> > > -             goto error_release;
> > > -     }
> > > +     bcom_eng->regs = regs;
> > > +     bcom_eng->regs_base = res_bcom->start;
> > >
> > >       /* Now, do the real init */
> > >       rv = bcom_engine_init();
> > >       if (rv)
> > > -             goto error_unmap;
> > > +             goto error_sramclean;
> > >
> > >       /* Done ! */
> > >       printk(KERN_INFO "DMA: MPC52xx BestComm engine @%08lx ok !\n",
> > > @@ -439,10 +422,6 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
> > >       return 0;
> > >
> > >       /* Error path */
> > > -error_unmap:
> > > -     iounmap(bcom_eng->regs);
> > > -error_release:
> > > -     release_mem_region(res_bcom.start, sizeof(struct mpc52xx_sdma));
> > >  error_sramclean:
> > >       kfree(bcom_eng);
> > >       bcom_sram_cleanup();
> > > @@ -463,10 +442,6 @@ static void mpc52xx_bcom_remove(struct platform_device *op)
> > >       /* Cleanup SRAM */
> > >       bcom_sram_cleanup();
> > >
> > > -     /* Release regs */
> > > -     iounmap(bcom_eng->regs);
> > > -     release_mem_region(bcom_eng->regs_base, sizeof(struct mpc52xx_sdma));
> > > -
> > >       /* Release the node */
> > >       of_node_put(bcom_eng->ofnode);
> > >
> > > --
> > > 2.55.0
> > >
