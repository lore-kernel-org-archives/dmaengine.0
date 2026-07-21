Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013056.outbound.protection.outlook.com [40.107.162.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B1E3998AF;
	Tue, 21 Jul 2026 18:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784659293; cv=fail; b=A4KigyTXWxfsl2jWwquYQ876o4Wn6MvSZjcpqEHlyq1UhFarwp4D3gvbK750CgpQpCR1ap12X99plsm/Hyue669TXolQ3S+Yhiy7jASJTv5m6PYRCEEQx1Cp0ODbXPhwV8uOk+hMrCyX0K/N7TSlzow1TOw2BaebGBnepK/isXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784659293; c=relaxed/simple;
	bh=PPKqoZWZ+tWz1hrXT1sDgRu+oD+Btdi+3KvLNRibUVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=K9RcwyD7V+PskPl0B5/Bu6rRyQEaHBMsRlfyr2bPRzi533IRmiXTwirzGGkG+VCHfOkU40BTZ6ZEDvF/Bu9MV1ofuQmKhqBNUqdfIcYPIAc0yyyeEX8ge2maEOdMSnSc78qC7XFwWgFCe4Wk2gYxjzTjoN6RINEJu1REM6XcUHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CXZSFlzm; arc=fail smtp.client-ip=40.107.162.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CXZSFlzm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CmzOqSedowUHd2thxPDF5LJUGf8RayS9V4ytIZoxonjHXMEvHZiwTcMsc3SwPhBMFBObI+ouXdLTMkRFpQEGH7cZydoeATroCRCtQWjxTq2H0KfP4M6MgIxn7oebLXuyGROFu4GUjeN3nU6ztrYUdrSOGeavP8/ZdrFma+l5FHzdcm6m8zJzvJN5BS4STDJGqnkm4UBff6BzxAJJerCRC2YrEqBDkCsoZrXt44dpNTTylFR7E6+f+L6NK3AEAy2XIW+bz0/S/1upB1P9xM3FbDOI170ljlfjCugrSpbhvMUx2wt8bHyhrwM8OetDgO4OXYtC8aDPR2V5YYTU45Yr4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJjKJ2DQ7Z9DXrRsKGaM1YzviohwcIinKBWTWJ6Gkho=;
 b=DAwcJ1mNOzHh1Z5L8dt7sbgxfC+5yhvQNK3DnWmhKzquHS1LzSoJTnvOI8rDst8NiQe4c8GKIFpNdP6HyJqRm8aNVBXqK31sQKEyl/umKgRLR6hnfJE/JrZ7+V1ZiwDBd8iCaTuot0q/zBMk9y805erjq1X4kClec/3zvgAasKgeT+B3sORmKwjSoGCv8y7zqEqSGZdh0Dk/m3BU4v7SzIvqbIBxd5CISY19h7Ab75pbWx7/1McNpfWBchOnGjvbkuEFsl2giQpafSqjHeReFpNqrmzkXF19iMMCDKRjm3J1xfJzvrzrHYw8sy2qYC0MLbCh1fEpbkcpsYkh7zZtzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJjKJ2DQ7Z9DXrRsKGaM1YzviohwcIinKBWTWJ6Gkho=;
 b=CXZSFlzmN9VuXwEJFLZTk6VQQt6ZiVZn8mNiyP9ttK+GKOUj33Wid57BNMstAxiuHErEGuNKNJqzfyQtTgwRRpkRVVyuLOEMY1HL0TI4PhJ6kzt7DlUSsE7UUgQftBDgCQOOgmU/0FhZDZgiqrB4nNBhyNktDBqnQY7uTYjiFEE1mQyv0l8/jiIxRqmIU8pEMIoUTjE4GrTFLixthXjoPZlHm9gl3YFriDB72b2xLMwVhK4XVdsKgm4BnZ5u1vlhnX6+ZJiREidprIt8xHNciy8O0WU4egnuDFGNhh8Hjs0sM8BjHPXl6CqWN/l3DrRhQTGcyfQps1ozrVyIpZJkcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by GVXPR04MB9925.eurprd04.prod.outlook.com (2603:10a6:150:112::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 18:41:27 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 18:41:27 +0000
Date: Tue, 21 Jul 2026 14:41:20 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	Harninder Rai <harninder.rai@freescale.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: fsl_raid: free resources in probe
Message-ID: <al-9UM5P1jD9Gtul@lizhi-Precision-Tower-5810>
References: <20260718231716.230144-1-rosenp@gmail.com>
 <al5G-QqO55iNJpbe@lizhi-Precision-Tower-5810>
 <CAKxU2N-PArxj1UGWyVhx_Qieu+N2jH_0f0__vTLKtVZiU0XcnA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N-PArxj1UGWyVhx_Qieu+N2jH_0f0__vTLKtVZiU0XcnA@mail.gmail.com>
X-ClientProxiedBy: PH8PR21CA0010.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::10) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|GVXPR04MB9925:EE_
X-MS-Office365-Filtering-Correlation-Id: 97259f8f-4b79-4805-a9f5-08dee757ac2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|22082099003|18002099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ZyIaGYubtFeqWshc7FbXUmzuEEzDF25MLLTqv4Qu24udUZsmoEUU1acMJ7Pkgdk2qvZRdq2UrCUEhtJWGB1s3wUZ5b6+h/jDiJi08taTC9VSioVJdtp2enAphgwCAS08v+uav8o92vqDzbHhSUJuNwYHOuAgUamOe1C8laC2t/hEZnZC6IVnlgVz1Xrhdqtv0/SwO85Yb8LDhoGR+gC7Ea83yN2Lho1AxdR1T6gO9LCjjQE7Sbopii1AlImLAzuXxAWbIV/BPZmm+QE1B3sLvx3RAnt4TGldEmAjyGVfEO90IJ3UN8ickrkwGsk6YP7JGVwlgfG13xR7MCDJvant8uQbbX7QTHajK7er2oFSNFi5cUMDndoj+Od6ft34NBM3a711UQzAvZxvB/YRfZkHLJ7jUfYH0+Ynqw71Vrq4iN70Fkj0IABuQU+a03qzTkv7GdIud4W5nNac7PuOwm0RatwBnaNhl/4iMyMhBHLQ8y2tyhgxm/9LjlJnb52MAMpKsXFWZnnKkpW2eodg0fgvSuGBVsz8q3d34+hqA/v2jL2p7fTrGUjehvV+ZTQja6s8CAeLKEP2P9oSvDX+yHRfQxaApWhbrM7O42ZQ4uSOPQb7TFzyV41MLHkxtw1s0d0m+iNr02vW2RVSO/iimpEjH5vtyDp936R1NtY2x0JnhrQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2JydkZvZ0JHQzNZZGxIemZPL0loUE9UUG00U0wraTEyTnZod0dHcFZZMUxk?=
 =?utf-8?B?TGlJcFZ4QzF4Q2NINytlcWpsS0ZLTlZXU1pUeDBoUkJoVW4wMk92R3h0Lzk2?=
 =?utf-8?B?VklOTVBhU1lqRVhoc1U3eW9WNGNaUSthdUtyWTRzdnQyQ0ltTkZkRmNrb0M4?=
 =?utf-8?B?UDBtN0lKMXdwcGN2emc4aU95M1VBYmkvWE5zUTFiOE5nWER6TzlQa0VtZFZD?=
 =?utf-8?B?NXRMaXE5QSthcXhRQk9Hcms4ZHovckZtNWtoc0M5UnV1NmE5cGFEdkh5cUF4?=
 =?utf-8?B?L05QV3gwNmpocDM2S0htRlZpaDB4SVJUNUNVM2JVNUQwdDNoZ2FkS2lMWnhJ?=
 =?utf-8?B?YklLeHZWbzk5cWFKSDZyNVlDNmRuOHRITGVJMlRqSHNKMUR0TGd3L3FoZ1pC?=
 =?utf-8?B?M3Erd3JhRXpMdytTdlZiMCtEMkxJM1dOV3kwSC8xeGZYbUExT2VXcDNibkRO?=
 =?utf-8?B?MDJmMVF2M3lGR2Y1WHJYdmxsbS9DY1FCcG1ici9SSzB1TVZaeWVNN0w3dWs5?=
 =?utf-8?B?bXkvUnBsbDVjV2IrUWNUVlBWVDFiMnBSVDU2VDFtalVjdUI0b3ZWdTRFUnc1?=
 =?utf-8?B?WFBCZUhzWEhiclFoWSs3REJaeUQyVlMwbXI0QUtBQVFCOExWUWJFbmk4OWlz?=
 =?utf-8?B?aTBMcjNMN0ZBVWk1clBaLysxanNWaUhldkZ1OG12T0V1Q0UvbWhZUlBTczNy?=
 =?utf-8?B?bUlXbVhGM0piVFl6WEJsWXFkSmFhVHlhb29zOTJ4NGFkUXJkREhjRG9XcVhO?=
 =?utf-8?B?L1c3d0VCTXlMTXo3V0k4MjVPNlVIdjBYTG1VaWpBdk5nUlU1em01RjJtRFJS?=
 =?utf-8?B?RTc1Z1BNL3B2NWlIVVowMnVwRHErcnovMWRlWjBYSEgzTURIOSt0MGpYVW1T?=
 =?utf-8?B?bjd5Y2tCSk5QS1F4bmMrRlhPQ1ZzVUdScFV0RlowdEZvcEdBWHZPS3NxWDQv?=
 =?utf-8?B?bTRTN0s4V0NibkhwN1ZRc0w0ZFVobU5DMGkvbGIzRXFwdUVoeSt3UTBQZFdB?=
 =?utf-8?B?Z1lPcmlTZ3hlbkVNZXBHYUxjSFdHdHUwNllubkg1SXUrTm42T1hLa1NhZ0pj?=
 =?utf-8?B?ak9icm1BWTNWZ0FhZDJTVnVKaUs0bGxMNHA5djNHL0hxeHdMM1d2Y0ZyWStm?=
 =?utf-8?B?Y0dEdEo5d2t6dGxFZHA5MHN1VEd3RUZ2VFhvQ29uSkRPQ1EwQ3ZVN3VWS0dW?=
 =?utf-8?B?WHdHT2kralJtSHFxQjZvREhIWFFZOGlKT0RhZWxyVndaM3FLdkJzZXM4bEE5?=
 =?utf-8?B?bTY0SUtSb1BZeTIxck9pNG5rT0l5aTh1aUpPMWV4OG5yZUREMDJ4NHZ6VlhS?=
 =?utf-8?B?TGtZbW5sSURPOHhpdWJuMHZLRllVQkt3RWNSTU5najJDV0VoQnJoUEJTMlRt?=
 =?utf-8?B?bHI2Q3hyRTcySHlNQVdXbE5ib3BySXI4aGJwN1NGUmZ0U0ZHMnlGRGtkUTAr?=
 =?utf-8?B?Q20wMHdpdG5zRTdOU2UrSGVZc29rYmgyNDdpdlpOTDJvUXRkR3ZNYnZGQTdM?=
 =?utf-8?B?WnpDUzRsaTFsblNOZ1lKS05HZXRPenViYkxaeWZsaURqYlhvc0xwTjZlYTEx?=
 =?utf-8?B?U3dLTmFFUEtWSU5DekpVTWptR283UkxjTTVtVVA3V0ZUM0QvUE5Wd3JzTloz?=
 =?utf-8?B?dEFrU2kwd0RNSGtGMC9yc1JUbEY2UVQxZW9wMEVsNVpnQk5UV3ZYUnltckNS?=
 =?utf-8?B?dzFad0hBa241dzhMMnIvVW16NXJzZm02b2NOc1pzWmVQdkFWZVVTd21IZk5q?=
 =?utf-8?B?RjMvRiszNmxDeXV4WStLckVTQzNHd1h0dERlMGM0dVlXMEVXRVJHcHhCQ3Ny?=
 =?utf-8?B?TVhXdmhIZmllRXRuWVpJQWdmdjZCbGpDaHhOWGhCdjlKWGR6bnVwemlzeWpQ?=
 =?utf-8?B?dlZXbFNBWGFEajhUQ0piZTZoY2RYei9tOUE2T0FoQW9TbXo5QXYwczd0UnVu?=
 =?utf-8?B?RHNrenNrNUt0eHc4Zmp0a00yYzJGOFFyVVlwL3ZZRktJSzV2bGJkdUpqaitE?=
 =?utf-8?B?bW1xR2dEc0VmdnRlZGYyUUU1V1ZKUHRCTHRjcDB6czZrRHVjVTBTdWZURWNa?=
 =?utf-8?B?S3NROUNTMk5teDd6NU1YTjhLejZ4d1c4R1BRa2hCa3BaYTJyUXFsb2hrakhV?=
 =?utf-8?B?WTJFNlFNK1YyVkFGbHU0cmF0RGNDeG9rNzh2TUpNYkFKWDIvRkF4a3BxRnNr?=
 =?utf-8?B?S1JVdlZsUDJLZ0Fya0tHcDZIWFNpK1F2emx6K0U1TmdCeVRaaVAxMTI5YkFu?=
 =?utf-8?B?ZVZ3OGIwY2JyWmtqb0FTdGRyL3RwQUk2KzUrbWFaTDg0VThCOEFnUW52eWNG?=
 =?utf-8?B?alJXS0kwMVA0Mi9KT3QydllmQ1pRMTFRMnk0OHFqcmQvMnRTQVAyRjNYOUxI?=
 =?utf-8?Q?Z7owz7JeGChBBG2dPUvSsyIcAyflkvXIZdi3F?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97259f8f-4b79-4805-a9f5-08dee757ac2a
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 18:41:27.1170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +k5lY7dWXQQeEO/ZHXo16ix2HIjmGtlDkFaJO4hB74jQWYh3bVdDCp5Rkcurgdd0kr/bFxJFEyglJYpoRDP7P/RaRFacaTs94/E/7I8xKu8JgWVWd5GCiiNMDeNvTW/h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9925

On Mon, Jul 20, 2026 at 01:15:13PM -0700, Rosen Penev wrote:
> On Mon, Jul 20, 2026 at 9:04 AM Frank Li <Frank.li@oss.nxp.com> wrote:
> >
> > On Sat, Jul 18, 2026 at 04:17:15PM -0700, Rosen Penev wrote:
> > > Add free_irq() in the error unwind of fsl_re_chan_probe() and in
> > > fsl_re_remove_chan() so the interrupt is always released.
> > >
> > > Also add tasklet_kill(). Present in _remove but not _probe.
> > >
> > > Also add platform_device_put on failure as of_platform_device_create()
> > > increases the reference count and needs platform_device_put on failure.
> > > Requires placing the pointer in the struct for the _remove function.
> > > While at it, use platform_get/set_drvdata as there's no need for using a
> > > device pointer for that.
> > >
> >
> > Can you split these patch, one patch just fix one problem.
> > 1: replace dev_get_drvdata() with platform_get_drvdata()
> > 2: add error handle one by one.
> I think splitting into two is fine. The problem with splitting the
> resource patch in two is the intermediate state would be broken.
>
> 2 files changed, 15 insertions(+), 6 deletions(-)
>
> is a small enough patch anyway.

judgement is done by logic, not by code line changes.

This patch is do two works,
- fix missed platform_device_put(), ( which create by of_platform_device_create())
So add some goto label.

- use platform_get_drvdata() replace dev_get_drvdata().

These two part should be independent. If I am wrong, let me know.

Frank
> >
> >
> > Frank
> >
> > > Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine device.")
> > > Assisted-by: opencode:hy3-free
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> > >  drivers/dma/fsl_raid.c | 32 ++++++++++++++++++++------------
> > >  drivers/dma/fsl_raid.h |  1 +
> > >  2 files changed, 21 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> > > index 0b0b4e8fc821..b1a10292324d 100644
> > > --- a/drivers/dma/fsl_raid.c
> > > +++ b/drivers/dma/fsl_raid.c
> > > @@ -212,10 +212,11 @@ static void fsl_re_dequeue(struct tasklet_struct *t)
> > >  /* Per Job Ring interrupt handler */
> > >  static irqreturn_t fsl_re_isr(int irq, void *data)
> > >  {
> > > +     struct platform_device *pdata = data;
> > >       struct fsl_re_chan *re_chan;
> > >       u32 irqstate, status;
> > >
> > > -     re_chan = dev_get_drvdata((struct device *)data);
> > > +     re_chan = platform_get_drvdata(pdata);
> > >
> > >       irqstate = in_be32(&re_chan->jrregs->jr_interrupt_status);
> > >       if (!irqstate)
> > > @@ -645,7 +646,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
> > >       struct platform_device *chan_ofdev;
> > >
> > >       dev = &ofdev->dev;
> > > -     re_priv = dev_get_drvdata(dev);
> > > +     re_priv = platform_get_drvdata(ofdev);
> > >       dma_dev = &re_priv->dma_dev;
> > >
> > >       chan = devm_kzalloc(dev, sizeof(*chan), GFP_KERNEL);
> > > @@ -656,8 +657,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
> > >       chan_ofdev = of_platform_device_create(np, NULL, dev);
> > >       if (!chan_ofdev) {
> > >               dev_err(dev, "Not able to create ofdev for jr %d\n", q);
> > > -             ret = -EINVAL;
> > > -             goto err_free;
> > > +             return -EINVAL;
> > >       }
> > >
> > >       /* read reg property from dts */
> > > @@ -683,17 +683,18 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
> > >       chandev = &chan_ofdev->dev;
> > >       tasklet_setup(&chan->irqtask, fsl_re_dequeue);
> > >
> > > -     ret = request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);
> > > +     ret = request_irq(chan->irq, fsl_re_isr, 0, chan->name, chan_ofdev);
> > >       if (ret) {
> > >               dev_err(dev, "Unable to register interrupt for JR %d\n", q);
> > >               ret = -EINVAL;
> > > -             goto err_free;
> > > +             goto err_free_tasklet;
> > >       }
> > >
> > >       re_priv->re_jrs[q] = chan;
> > >       chan->chan.device = dma_dev;
> > >       chan->chan.private = chan;
> > >       chan->dev = chandev;
> > > +     chan->ofdev = chan_ofdev;
> > >       chan->re_dev = re_priv;
> > >
> > >       spin_lock_init(&chan->desc_lock);
> > > @@ -707,7 +708,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
> > >       if (!chan->inb_ring_virt_addr) {
> > >               dev_err(dev, "No dma memory for inb_ring_virt_addr\n");
> > >               ret = -ENOMEM;
> > > -             goto err_free;
> > > +             goto err_free_irq;
> > >       }
> > >
> > >       chan->oub_ring_virt_addr = dma_pool_alloc(chan->re_dev->hw_desc_pool,
> > > @@ -739,7 +740,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
> > >       out_be32(&chan->jrregs->jr_config_1,
> > >                FSL_RE_CFG1_CBSI | FSL_RE_CFG1_CBS0 | status);
> > >
> > > -     dev_set_drvdata(chandev, chan);
> > > +     platform_set_drvdata(chan_ofdev, chan);
> > >
> > >       /* Enable RE/CHAN */
> > >       out_be32(&chan->jrregs->jr_command, FSL_RE_ENABLE);
> > > @@ -749,7 +750,12 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
> > >  err_free_1:
> > >       dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_addr,
> > >                     chan->inb_phys_addr);
> > > +err_free_irq:
> > > +     free_irq(chan->irq, chan_ofdev);
> > > +err_free_tasklet:
> > > +     tasklet_kill(&chan->irqtask);
> > >  err_free:
> > > +     platform_device_put(chan_ofdev);
> > >       return ret;
> > >  }
> > >
> > > @@ -828,7 +834,7 @@ static int fsl_re_probe(struct platform_device *ofdev)
> > >               return -ENOMEM;
> > >       }
> > >
> > > -     dev_set_drvdata(dev, re_priv);
> > > +     platform_set_drvdata(ofdev, re_priv);
> > >
> > >       /* Parse Device tree to find out the total number of JQs present */
> > >       for_each_compatible_node_scoped(np, NULL, "fsl,raideng-v1.0-job-queue") {
> > > @@ -864,21 +870,23 @@ static void fsl_re_remove_chan(struct fsl_re_chan *chan)
> > >  {
> > >       tasklet_kill(&chan->irqtask);
> > >
> > > +     free_irq(chan->irq, chan->ofdev);
> > > +
> > >       dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_addr,
> > >                     chan->inb_phys_addr);
> > >
> > >       dma_pool_free(chan->re_dev->hw_desc_pool, chan->oub_ring_virt_addr,
> > >                     chan->oub_phys_addr);
> > > +
> > > +     platform_device_put(chan->ofdev);
> > >  }
> > >
> > >  static void fsl_re_remove(struct platform_device *ofdev)
> > >  {
> > >       struct fsl_re_drv_private *re_priv;
> > > -     struct device *dev;
> > >       int i;
> > >
> > > -     dev = &ofdev->dev;
> > > -     re_priv = dev_get_drvdata(dev);
> > > +     re_priv = platform_get_drvdata(ofdev);
> > >
> > >       /* Cleanup chan related memory areas */
> > >       for (i = 0; i < re_priv->total_chans; i++)
> > > diff --git a/drivers/dma/fsl_raid.h b/drivers/dma/fsl_raid.h
> > > index adbfede330a7..34d362803610 100644
> > > --- a/drivers/dma/fsl_raid.h
> > > +++ b/drivers/dma/fsl_raid.h
> > > @@ -270,6 +270,7 @@ struct fsl_re_chan {
> > >       struct list_head active_q; /* already issued on hw, not completed */
> > >       struct list_head submit_q;
> > >       struct list_head free_q; /* alloc available queue */
> > > +     struct platform_device *ofdev;
> > >       struct device *dev;
> > >       struct fsl_re_drv_private *re_dev;
> > >       struct dma_chan chan;
> > > --
> > > 2.55.0
> > >
