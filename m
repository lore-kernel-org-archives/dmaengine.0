Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795550082;
	b=jtAc5AH7d1CS9Up9YvgXf7KXrj7yBomQGG/1Lt8+rHdgK8aQIPxRITIcL24cfG/o4Mtu
	 tvqBwj8EmjJEiaVEepNuV9SZjm9+RgUdQAQ93FFA+cm4DuRyqvhJwqYHezu0sYj4ZEQup
	 jBFf2gCoJAL4foTT4RudNAjoz0c78e7zMTh/Ltltu9CjOlanSHSktEBUny/W71U73od+O
	 wfYbDHsl2yyMp9sXpHNHAjN8zVtUzivNTJiHSAPpiSeDlKGbrfzjaBKaSe8OrVTX/Ajz7
	 0kaqhcBsit3Qen4x5LedFTjm+vlfdqYXV9H5u/otedphW3hN0Rp1eYC44Z7um3trhbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550082;
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
	bh=YY8CPYRFju+GOeYrQWPaYTY9foJf7WdMcu7KbtENBAU=;
	b=a4zVkj0u7r6PZ9t1VwZkB3lhfRAzTiAzQ9Jbot5Eg1W6ErzJDe19NVpdz0it/+fP0I6g
	 dCG6YILHIZt+FyTffqZKe7kb3cSN1hx6a061LOWk+BmaTER/Jx2N+pbV7Dq1nsSDaKA7P
	 GPrAJF5p+f25KOU6dhiwMPTJJ6RRz8fGAunKu/VKqLykDVx+GmF3ewt3GuQzN7luLU3tj
	 OOOZBXDCzjMhGkRUq7+fw/rb4+d6HUkaOOh1kTn6OC6TvPvUXgaozCIUXDVsqXtq17BuL
	 sep9r0Ln2p8FQ1pI67SjYVnPi9apIPYjzlrvRMYMZQktlO+VFKR9fZ7us4DOfeyfcXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=xMXlraiH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.66
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013066.outbound.protection.outlook.com [40.107.162.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47087606A321;
	Tue, 24 Nov 2026 19:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47087606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=xMXlraiH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A23aX1D4PsqFdhLJr5ivuZdfqQnbUzbz+XRGk2tmuaDJQgK5eqUr06porav8W/hcgT54rcHhmmxjwuFaevrw3ns63ra3OmRVff2GaDQVZorrDQ+5mD+0gLcRxu/S+iW/31gAxwtSqjk2+rgfK1+KfBCWjDQbvO7MeLaL9HiA5wAQnmNJ5hzVBPYrjfExE5RphL/FONY7htKvlb/w6e+2PUtNO686kslNgSfQSZ6weFeq18AoCf3NHZBgGeyMUMZdycmlpxwQcNPan/V8XFkUuKbhbJiXeKl+9vgx+q/0ombq9RocANfXMGtQO9Gz7ApQ03dbduISSxx7HDYSAms9MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YY8CPYRFju+GOeYrQWPaYTY9foJf7WdMcu7KbtENBAU=;
 b=jGzg0s8G1a4OuxEJ4LXYYz5lsqEcaP7JTvhPAhYzpnMDVIU50j+3quYiKT4yMPyyZUPJzhpaIbZyfq2EJJUP+1dgKaPWNd09WCJTDU/bKFIRc+gLPiNuOEvYQanl5lk4PS2JHhvcEISE1iu0LyGkcZoysRwbGQQRVFpNDtpduvCq71tNEyPmx0bFxQ1icmUBc4XjGbInJ8wbCM9NwiorgGv7y8L9SumTZFSdQAHwOqDqPGKZIXzAvkEkd94DvP6lkokDz/MRo5vhQa8h4EHYuy5yIib66RWSofAg/0zu2DIbpAQJXzNGHFZ7ptticzvV4aYNUZC2U/4Bub+wmsLS6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YY8CPYRFju+GOeYrQWPaYTY9foJf7WdMcu7KbtENBAU=;
 b=xMXlraiHy5Yhr7jsCcw0FR5H+5rnxRhjqoAfTdRvIyU4oEPQ3UyDbsYT+8NcFx27Z4kXQh1izjLKuAlyNneyKdnuPhJL01erK1l3BPh87OCw8PzNJclNOwgBI8T9RNTJFzwargkNwTR2/TPiKrzCnfZO0V3UEI+ClKQJr3geQIkKCwEV6aX0fxvRZY31yHFH31Zl1KI0xU3AjAcDm05GdxLmJJ6QNSnzUbqVoexr6GHxIPczLd52MVYUnhCIw4XL/c9/kbsRIuThGNXO7ZGvvnNCXT/RPro5uvToobmgey6CtjIiuOR9GgjkNkKXt9MCCMEAehKM+Xw63qVcatB1AQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV2PR04MB12021.eurprd04.prod.outlook.com (2603:10a6:150:301::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Tue, 24 Nov
 2026 19:54:39 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Tue, 24 Nov 2026
 19:54:39 +0000
Date: Tue, 24 Nov 2026 14:54:31 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Frank Li <Frank.Li@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH v3] dmaengine: dw: Use devm_clk_get_optional_enabled() in
 dw_probe()
Message-ID: <awXrd_ojEzcxP_eu@lizhi-Precision-Tower-5810>
References: <357f5490-8920-4199-a4ac-3f105cabbc78@web.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <357f5490-8920-4199-a4ac-3f105cabbc78@web.de>
X-ClientProxiedBy: PH7P220CA0038.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::21) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV2PR04MB12021:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e8541dc-3d18-481f-5b70-08df4a64c626
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|19092799006|10067099003|261022075727099003|11063799006|56012099006|261021121427099003|261021123027099003|261026121527099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	xyzgQAC+mYrtgOnG/DFOlhVm41hKd8Ymv2G86FYRidNFAGlSE6I8pZeu6fu8wsT4t1kSmVklKVrcyvTa3QZouAq3sCi4BOUAsTUSZdifCllY1xE6c/0BeKmTOBli+qSAQvte2qEkh6N1rPvOdHC7cmwqvJVjYgdHtlb+oQQICYPEzqOoSM0sz2VLebMxpOM29G7775wfkkpH8g8YLA5PI3nxeY+UgZuDjHzqFx8Em8CLR7xZ4mAc2dg3Q/D4xt5uY8kXpeUvcXT2hZjxP4Uq9KZmd5pZnmXHC8okwGcKXjqaZvXQxuhXWvOWDnLISsLgF0wVe6ULeZLIoSsWcM0vlfd7vtpBlzuwKQjefG4FEq1JUbUhhALLsMZSQ121I1NBtVkZXCb9M0aOQ6zDKx9IAMsMYLd3k2R9AVjmMeCCznErlxe63orUuVpYI6s9F92sgX5jjklckAxtg+Rf7bkLmNmyNi+KwfO4Jfe8JsXAWLQPB3k4Zeb9GzCVT+qJ14B++nXwL/o/iIKqFhddyr3aIZJNbFThS62iQlDpjw7ECtidtJAw+FlgcvPmGTowLIpOnMgc+wQnGGFNDtNXqGwkWUTtmTIC0BqzKM3N295dNHmExqKXKh+o8lub141i+LxlgN6oyKKCC3KdNJtFJetWLBN734QlXM/DiuJ+aJcCIOA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(19092799006)(10067099003)(261022075727099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261026121527099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dL57B2mOl/pL7iEL7uj+7auA7G21mPnNyPHSWgx5MPSyqPbs4diVVrPR5oHs?=
 =?us-ascii?Q?3uj12L33frzlKXsa6ygjpVGueuKmRLwk5KZptS4fvYq+9qB51WwTc1j4ymUk?=
 =?us-ascii?Q?H9XLpWmHnhZidMGiCWhojS25G9jeP6bRT2ox3dWBW0G6GcCkfraH6ClG9Y6e?=
 =?us-ascii?Q?qURN6bwmfkvbrd3o52GvJSLHA8vcz98kvTRBxw5h7Vh0tK/1SuYoTJdDxl7J?=
 =?us-ascii?Q?0NptBennHllY4XaZ8ib7hDVAtIhLMPqNIL/mjxS+frRlJlYwS2HPdam35+jH?=
 =?us-ascii?Q?TaAo6ZTPb8/KPuHmu9EQKY9sVoYAdumcpLJMyts0JwlFhmK46Amxh3gLEXHG?=
 =?us-ascii?Q?Dp5yqmgQ06QVQH8cGpgwpFl3gKuzKAqXhc+BIPs7+QU8g8alykf31nYQVuiZ?=
 =?us-ascii?Q?Rv8dym/BGSpfPbBAXN3onh8hUrw1xRgFOOVMU/oMp6SUeH6SRyQNprOlh5ww?=
 =?us-ascii?Q?a0+ptPZuMh432C85TeEkaduLIVmELD390OXAF4rK21BcY38mlnrXWbRf1hkp?=
 =?us-ascii?Q?Zwk9xyBF2KUoNY+AJvipznem2dWJQNhtxb6crXk++e5axOR/JzANMgkedxml?=
 =?us-ascii?Q?V9vCvnrgmW5rv1WaoTVYfZNd4Be3T7+toGmxdQ5HhJBKAUUfWz9J4JKki0/0?=
 =?us-ascii?Q?e9dHltzCIMd7MtZqpXSzYEPX4OuN22UQk3k6/rDrFQL9w+As1+GJnb/2oag1?=
 =?us-ascii?Q?BME0f7Ha0PvtD9dwP43UXBzA6v+tuFBXvidT18ICDJ+wt3E1uatzhpnj9S3o?=
 =?us-ascii?Q?iG53kXvR5GEDkNeVwY/CY+18iFE42Pjq/cbfz6RTM8aHdSgobCQgOUcnUgFB?=
 =?us-ascii?Q?t02r6syPgMwEZSmGloahtik+Qtycm7S7DbRYKKxVbf3i+wwAQhjoPv/0CJzZ?=
 =?us-ascii?Q?4IkgCdQqucseyALEBiBDGwlnMn0vu2RuCt41h66dcExMvwkKfvSBgoSizk/9?=
 =?us-ascii?Q?BH6Vgu4Oais3wHE783XND14wz3fP2GQcQ6QZNhbW/1Fq5a6TDYQfV2mI3Gtg?=
 =?us-ascii?Q?ocn1g8I7CndyV2/bAVOM3E+bljyX4XfBqHkmQ7JZKjb84oYdylS/e26osoDM?=
 =?us-ascii?Q?vQ7+zeLr1o2yxUy+vg+yuHK+NlSXcOc0mHB0irPcV3H294o/3TafJ9iPyDGv?=
 =?us-ascii?Q?MkMHedOLWOnTuy04v9p3XAJdg8emgyYYD8l3syhaJyx0OKwC/QZWucCvRN1c?=
 =?us-ascii?Q?eDoN3lt34XLXmiyrOd47PP1AGfXcHbjZGldQdK1B37hyySGRQrysFQ77ErQu?=
 =?us-ascii?Q?A7FSodRqzB6FEjys1PWmJ9PwgVflWek8ZnUKYp9KFS+tCRZpmPKzI2vBQ75U?=
 =?us-ascii?Q?MQUe+k/z5wHuvC8MSQIfamO5iHiDuogkTQXm3uehuupCsyGLtVFtGgHcY8VJ?=
 =?us-ascii?Q?/cMMypc4vSd+8NGtgP5PLqSSgjb4+liSoxVqxF6F10DbimQaf3knEUcVMl2V?=
 =?us-ascii?Q?UptN64TXHz8UpmFMSLEI+rhc50mGZI31FMLLLLhk3aJjbc7rEE0cse+FXpTh?=
 =?us-ascii?Q?16ebxZCj43M8YXmI2aOdjYDFydd5iqnPsD61NMLfMhuXIgYFXgxhxdaSS45q?=
 =?us-ascii?Q?ZE0Z8wFkQ500kcsVjazmY3a3AG0z1SAhesyk9UhNUIojDUP6JATsoWyei7EB?=
 =?us-ascii?Q?FYiCL90bbOhbA38/poAHuSoBJAopQDxumW7/uPSLMd0ah7OmJVzD3fGQMc8q?=
 =?us-ascii?Q?Eem6JGdmWzkiZHBGVpbaufYWv/nyQMskGKpk58qb7VsKtsRFJbb/M3JiwSza?=
 =?us-ascii?Q?YINtfohymGMcHdDaTCuXVZr2Z/UELmupMdRK4aDdUqXtR53dULmV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8541dc-3d18-481f-5b70-08df4a64c626
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 19:54:39.2267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RlX466dbpJ51zMaBwxi4VZh0tmEBbfIcTG5/pqE3HpteUV0Atu3BMRHfNKjmAUR8FHYwWL+F1PQJg40cw4aPuYmp5R7Qij0biPc50oOI7DHImfNxvub6o5X/3Lh+cAdj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12021

On Sat, Nov 21, 2026 at 09:32:49AM +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 21 Nov 2026 09:16:47 +0100
>
> Reuse existing functionality from devm_clk_get_optional_enabled()
> instead of keeping duplicate source code.
> Clean up disable_unprepare() at error handling path and dw_remove().
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> V3:
> Frank Li preferred another wording variation for the change description.
>
> V2:
> Andy Shevchenko and Frank Li requested further adjustments according to
> the proposed changes.
>
>
>  drivers/dma/dw/platform.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
> index 7e76391475ac..13c44ee5e047 100644
> --- a/drivers/dma/dw/platform.c
> +++ b/drivers/dma/dw/platform.c
> @@ -64,12 +64,9 @@ static int dw_probe(struct platform_device *pdev)
>
>  	data->chip = chip;
>
> -	chip->clk = devm_clk_get_optional(chip->dev, "hclk");
> +	chip->clk = devm_clk_get_optional_enabled(chip->dev, "hclk");
>  	if (IS_ERR(chip->clk))
>  		return PTR_ERR(chip->clk);
> -	ret = clk_prepare_enable(chip->clk);
> -	if (ret)
> -		return ret;
>
>  	pm_runtime_enable(&pdev->dev);
>
> @@ -87,7 +84,6 @@ static int dw_probe(struct platform_device *pdev)
>
>  err_dw_dma_probe:
>  	pm_runtime_disable(&pdev->dev);
> -	clk_disable_unprepare(chip->clk);
>  	return ret;
>  }
>
> @@ -106,7 +102,6 @@ static void dw_remove(struct platform_device *pdev)
>  		dev_warn(chip->dev, "can't remove device properly: %d\n", ret);
>
>  	pm_runtime_disable(&pdev->dev);
> -	clk_disable_unprepare(chip->clk);
>  }
>
>  static void dw_shutdown(struct platform_device *pdev)
> --
> 2.56.1
>
