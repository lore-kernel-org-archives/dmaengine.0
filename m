Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.83.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795107204;
	b=1Kj3PMZoZhWIIZN5wVEr2LqWKupWUeEeg/Zs0wou74QHo5tM2TMrZUSMvkbhifYWfC5h
	 d7LumRxWapg5eEZi0yhxz8IL0hfjwJ54jSmyVSo8iBC3ihftkxC2ktCUNCWbicNWShTTv
	 5PgxlnttAsjr2JacrvBb/c1osZ37dKxe1MU9b53e/vKqCH85IdlRjd84adc+yOX2gc+v8
	 IA9fGV5iAQs1b+IN5U6T0Q+QjiBcXzvkxez+3GVwL80xSPREpvcXSO45kHD9GyLg9Yw/s
	 6XNTOosab0J7OOf6epk9raKwwpl9xGZJGd4Q0/5viXUSqBY3vhDfb8RXuQ6w1QcR1sQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107204;
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
	bh=heLvezIDCKlUx9MMqXBlcJA7mE8ytsVbr1mrXkAJsA8=;
	b=Et8EL1KAePAQLcDwgUfqUtyVhmOQ1aP4JMSPNH0RgThU9LUpqQ4nkCT0yeygan+onnzw
	 QdtZ4CXBndcQ7uYXF+fop/jcspSYc2MlmUm0JBb7twYEgcDYm1prXODtMtxkCva/FDcEF
	 JrILQWdRFri5nRy5iVpVYdiuYIddSwCOCfQBgBw4xkDqOwfR1UJowtpLPKygQw3f3uqwv
	 KyqGJ+xRQoqLBRCKOvj4e7n9HJmST9u/g3IMNJUrORAm0dYV0xji46tiW8lCh0tuE3i5w
	 spOO3z8RVlibpkgVYyNwCllslIhW9OsIxiHgSx+UDgr8XF345hgEOweTNx2g6pwF7Ag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=iYmAZ3J4;
	arc=fail smtp.remote-ip=52.101.83.1
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013001.outbound.protection.outlook.com [52.101.83.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F5C606A331
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 16:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20F5C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=iYmAZ3J4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUxbro8E1tw7xlWxL74i8f0MYk5UjPV6ybyO2bBLuuB8Rg2B1duP0pLyF6yA9/wE0wAsWMs9dizpSHyLNZOK7Vkcp3qSZyUAenTPD4aiwPHoZPtUFPGGe50cVZqGIbI5xgiteO+pCXunb1URtrhfVOoN60zx7+ojqjwGxtxb6b7NetEMLzON5ruEjau0KkJ+xH5tjny+fW3lGbLUeV3+E5DDdrGTWIjBem2cUeUkhE6OWfoVdxQU9XjHA14LJQ2bUJEoqOKBPQt0qtzm54epC978bCOZLovvmN3UkRv8hxEyu/J/9quVp4BtW+agjZgYyl1ZjZc32f7FonEttEfYKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4ZY84NKt5TdGcoPqVknm7AoCi+LMxU3xHaShfV7uhg=;
 b=d+kUK80+j9RrkJWK8eX7aLld/o9MbgtCJR9S1h035uvp6bDUubl0X4RTNw5ZACELFtDkM8JJdSD/ENYLGqArSDaFJ4sjFlyGWoOntymr9qOpWj5u3JZCswp/nAOdsn84r3ID3+DHyEfPns+oD7V94NefO3+fwBStX3+/ULwrA3ErZHVxet5ZIiWEK5HWC1Gigw2gZ8HjQ5ghhy/JeNMjKFLWmYzfmY0+9Fh/kdmDREnWH2TbxqIYExTgMt25V7UP7j3+infBGjHqcIhx24Hsz48dkgCga+HhV3JIJX+kNTqOaiblLn8GVJh4XKmjx5+IFKp/I4iy0O8hXCC2AY3jdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4ZY84NKt5TdGcoPqVknm7AoCi+LMxU3xHaShfV7uhg=;
 b=iYmAZ3J4ysOUoAihcf6j55+UjQHn7K035QrNL5k97npBBDc83hCo8w1ax+EekeUZ6aXae1kpkHibLoGv+KlvGLXhrGQydN6csmTPdvFrlaU4En0y14+3eMxIHMYTVn2OXo+OD1LdCUa13hLsPuUsbFufsqz65u/MWOhilXPIyQfYiYqhv5U1ZQ/ddpCYS3bFM4PIUoBY8Czi0LnepxwUXCs/JHpTiG36/7z1aGBluHh/1Noc2MOWPcexjf9BQd4Pi3d2nlD10TFLmVxufGlPV8UA9s2XICurqFbb0J9MVgU0/PjnOIO61YQvEaNHTlPSZkie8VrxDWZYnNjXr3lrYQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS4PR04MB9573.eurprd04.prod.outlook.com (2603:10a6:20b:4fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 16:53:19 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 16:53:19 +0000
Date: Thu, 19 Nov 2026 10:53:11 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Markus Elfring <Markus.Elfring@web.de>, dmaengine@vger.kernel.org,
	vkoul@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH] dmaengine: dw: Use devm_clk_get_optional_enabled() in
 dw_probe()
Message-ID: <av8pd_aQFFSSMkDg@SMW015318>
References: <8e3534b7-ae64-4c1f-819d-0ba390737b84@web.de>
 <sashiko-outbox-223487@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-223487@kernel.org>
X-ClientProxiedBy: PH0P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::19) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS4PR04MB9573:EE_
X-MS-Office365-Filtering-Correlation-Id: f81cd875-b7aa-4fbb-00ad-08df465d9ce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|23010399003|261026140227099003|10067099003|260925022911599003|4143699003|11063799006|260925021911599003|260925021311599003|56012099006|261022105027099003|261021121427099003|261102123227099003|261009223027099003|261026121527099003|261028144727099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	oSw/1Ta4/3fA++RKFGXkBhf/XA2zD1PQp9GUnskoYaSqLUte5r5BiQ3cBz0RsHavkROMSPAlb7wnEbz9WFidS/1jusGMkeJmBqpVqBzOonWqu4bmb/6O1tAZzm1rYlieG0cD7sStcbDvPZ//wh6MmRZjkZNUe5Nc9F0r2K40FJV2B4/DiC+tTjvz1CTVqlvuQ4czT4Zbu+pSrbcLNZYUj6kiCWUADt4I3zI4UAgnQPZ8tuGr9S9/BG9yLoXOVVwXfyBD0qs9kdSi01exOZiNqL9Dg8+cLpxrbncTnjI/1fP2m2A55zqlo75j64b1sEuLTp2sLPzxU2cEmGnPC2m56v31IitisSkBYSERQXIK5nWq/NjrYKjw645z1xabN7Z4JPGUH/f+ZUj1H9NUE9OBjLEuZzj30fNQggwaACXo3tre8wPxcFMEZG1iFcpMtg6+EmnDQAXWgRXaMnDTBxyh64s2NpKZf0IGI0+mP2AgCRwZZ1RbjCiz1kUq4ViBOfGpiXZMSePvdJtzwAWFnSieKxfrdsiU15n/vU+Td/s0/Cqf+xhVC15bKuq7wJ5mdvf1+F0QP+es1tsZz08s77WhEvqM7AD2WozrbufyADh7tJQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(23010399003)(261026140227099003)(10067099003)(260925022911599003)(4143699003)(11063799006)(260925021911599003)(260925021311599003)(56012099006)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?W0t3r3HCYOFHZyjqaVwpKy7LPLnz6CWiMLCm1vkUIrBaaDqmOv0dk+i917?=
 =?iso-8859-1?Q?3a2OSJA75HHA+q2rBGmZ6hHXo/cxEI2jjE1bo9ltY9HvVOyyllaHudS4n8?=
 =?iso-8859-1?Q?7F94xxIl44SbQnS8QXRfnqVc9kCi5LqoP9tbKtfBMxI3wnRaZjA3syKvRp?=
 =?iso-8859-1?Q?JAr3fZnPc2KC0VfyVPUDkj5KFg8meQfnerUCPpOysVAzRWCYkJcsCyPWTC?=
 =?iso-8859-1?Q?AqzSZrFXkoO7TtlFjioaH/u7JEd912CntRRVRUBThz7jZv6HR+fxW4pLiz?=
 =?iso-8859-1?Q?5iEUYtu42VyfVrblfa2wFIL6iKwW4+rh+msoXTFbI4sW+lsSOC0fz3GEQK?=
 =?iso-8859-1?Q?isEkCB8GhPLM0WdH5Dtyl/xOk8g59hAGqEAo2eRK2o3XaF4MvAOAulSuUW?=
 =?iso-8859-1?Q?xItrW5NEsdKahOou0gjLkojgcScDvlEcBivuOc+86zjM8EsOJ1E5fhIrRK?=
 =?iso-8859-1?Q?SigDf2AIZY0/QQBNMtiWkritMJoq+4u52CBXPjgJ5hoIGDDMqIAvdhX2kY?=
 =?iso-8859-1?Q?xAsOOzWwS51BynZt0uyeD0Hy2gLnuTJaYUTB4dDOJCUzlboU9tmYS0MJPb?=
 =?iso-8859-1?Q?GcCbmY+nuqysaIAyzr4Innr46IiagU8XhNQJwAoI6Ie3V+kUGulCi7vBS1?=
 =?iso-8859-1?Q?VRBdyBtRODZacWzz6WQTTzT7rovrRxXFgjq1TRwxF9WyaZv7PMxoR9aiHE?=
 =?iso-8859-1?Q?NTJNxNnYL20ykxVfp+xEHf2AP7Fwha/FrO6wYmpujze/Cs7l4FbX2Kqh8q?=
 =?iso-8859-1?Q?kWOeYxq4pZHO8X8n5lGQH4g1UmXVuhhzhuqMGHpCTMkoS3bLqj0MVNVd0t?=
 =?iso-8859-1?Q?tNWU2VUb7Wu2ouVNvVGFn/hwSS30AjOecDeEKHTdCwnQpBW4WRv/a/Rrsy?=
 =?iso-8859-1?Q?EuLNUo/1m868CV7ylyqm9wQ35c0bGAqObKgJvXwmO2aJI/tHU1q1O2JUM4?=
 =?iso-8859-1?Q?Gz0ZaLqG2y//aybGSEJi/KS0mbzgR2so0t8hrd8pHvcQ8z/PIKcUXHRwiw?=
 =?iso-8859-1?Q?grIDO6gBlemEfr0nZfD4ye+3rufc5nu7Mij8N4w2ojAnUjGCGtQZhbqYdJ?=
 =?iso-8859-1?Q?O3w31HRtmN4jeH7Cld5yxTQtmsjkPb3urGmET7pq13FcKgqR9b4Ykgysg9?=
 =?iso-8859-1?Q?z3ulkmwwROpp9bj0wMJsJR1f9ogpjlT5St8V5puBCpjFewE6iwrsohCYmW?=
 =?iso-8859-1?Q?OERMHBRzJ1TVY+o6Q6/v09y3mkGSqqIsIWufWdW7/JK4OjAj3UirCnS0Cz?=
 =?iso-8859-1?Q?8fwdbehU615TZlkT1BbklnVEfLQD8s9Nq7t9IKP/m9XprLpsJZUK8Qo3CD?=
 =?iso-8859-1?Q?sQ+AttqpCxaJ9LicI/kxBIbck045Z0EAIaxdygH8eCD/KuQ3crNvWKR6IO?=
 =?iso-8859-1?Q?5PhqaptmgARgz6CAQJ1dX5ZTKJM3IG3akn8eXrDWUsKE6lj1daNN9vf50O?=
 =?iso-8859-1?Q?/XzSQpNpDl4OciO5IgtqcalA8I/j/6PK+e1Ta3ThkMW/CmktB7noqOM/tW?=
 =?iso-8859-1?Q?x8HB8KmFnQzW5KFdaPjW9YDowPC3jRCQR8SKiHImgf+ka3W6girwpUaGFW?=
 =?iso-8859-1?Q?vgeahOVDYb0bU8VLIsSqV7XXSaM93pCxzAIPMPdb3O1h5pIPIj5Ejl4bGi?=
 =?iso-8859-1?Q?dNMDNLZA4xB6Qkx607Kqn9tDN/szieV8c9+lRRVLPzFKo6Q1aFoFeSVmZi?=
 =?iso-8859-1?Q?wsImQNrjQGiSQo9Sv/9OT+eFYkh5rW0a7edz6wFro4EjwuyBI49P5qJiwd?=
 =?iso-8859-1?Q?fmZnr6B6Aj/76RV0goAvg+8+nHVoYJ1P5c8hzk5GA4n8k7a1QzkiAjM78+?=
 =?iso-8859-1?Q?h4QXlNt0Ay0tElFyuT02kCCiQnVGTiYmRQgI3mYGLlAU8UqWhQpv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f81cd875-b7aa-4fbb-00ad-08df465d9ce4
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 16:53:19.0090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kIXWkr/HUt6OKZSKWKGgSZeRGUcKKEWTAQ0HAEcPnBQSPrc0vdQtb/3qbdqfQNa9knrOOxpkUpJHNHkBTwD2txZ4Cz0jgfZPyO/dV3T6z7Lgrmh3eMnBm/d62Xn1PqFv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9573

On Thu, Nov 19, 2026 at 04:12:30PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] dmaengine: dw: double clk_disable_unprepare() in dw_probe() and
>   dw_remove()
> --
>
> commit ff07f5838666895fdb235cca7d9f7155e7085b00
> Author: Markus Elfring <elfring@users.sourceforge.net>
>
> dmaengine: dw: Use devm_clk_get_optional_enabled() in dw_probe()
>
> This commit replaces devm_clk_get_optional() and clk_prepare_enable() in
> dw_probe() with devm_clk_get_optional_enabled().
>
> > diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
> > index 7e76391475ac1..9bb3c2cd08570 100644
> > --- a/drivers/dma/dw/platform.c
> > +++ b/drivers/dma/dw/platform.c
> > @@ -64,12 +64,9 @@ static int dw_probe(struct platform_device *pdev)
> >
> >  	data->chip = chip;
> >
> > -	chip->clk = devm_clk_get_optional(chip->dev, "hclk");
> > +	chip->clk = devm_clk_get_optional_enabled(chip->dev, "hclk");
> >  	if (IS_ERR(chip->clk))
> >  		return PTR_ERR(chip->clk);
> > -	ret = clk_prepare_enable(chip->clk);
> > -	if (ret)
> > -		return ret;
> >
> >  	pm_runtime_enable(&pdev->dev);
> >
>
> [Severity: High]
> Does this cause a double clk_disable_unprepare() on chip->clk?
>
> devm_clk_get_optional_enabled() registers a devres cleanup that disables
> and unprepares chip->clk automatically, but both the err_dw_dma_probe
> error path in dw_probe() and dw_remove() still call
> clk_disable_unprepare(chip->clk) manually.  When data->probe() fails or
> the device is unbound, chip->clk is disabled and unprepared twice,
> underflowing the clock reference counts and triggering WARN() splats in
> the clock core.

Please fix this problem

Frank

>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/8e3534b7-ae64-4c1f-819d-0ba390737b84@web.de?part=1
