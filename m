Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793986186;
	b=g8lo5DUvpn5pU+pcQ0N69g7iHvR2oCtd/XNP9/7tW1OzTw3s5hEMPudaygTLVr/3Ut6w
	 cHlVTdYr0UgNqLDNLUVtX9VbjowRylRdv7pUZhci8z049H3vK5GRucB4IrwEH1kokcxua
	 6cMghoCfXBUi1f5M5Aq+ivWkNnFYmr9kr38ERfHOCq04sugDFE9iXfN1TqA+Nwld2mgwW
	 USOcbvVnJPYgB+Z53DEEmqh+agaCTfO9vSkjmjCzJdC2Zqosa/Me0tZRkzzWxptUosYAu
	 KUKRIKv7uSuFqUd8DRPsCYzIowNEdTG56ICR6Kw98zMA5g6hP+BdGp28qqFUWPaQHkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986186;
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
	bh=ikf0HVPfUOjwBWB2m5b081JQC4K0KwdH4YipAsbUbEE=;
	b=ZyrGodlxW1xbWGMbRCW2vpQZrzPdThsnD86SY1WL2Nr8Qzh3YUqtPWYobsik0lDQ4l+k
	 uu2kD4BRrDq/s2nKNOpto4EcHmLSKfDHlfjJgT56xPdOTKv4sg6sK8Ffam/2lbroo1cHQ
	 qWpzkiqG8WJ1g/asKNAueWm9Dk93hYH0RXndfojT9bwBjZ8nHwPji9VSx6bge2jcPQ/BB
	 YZVW0Hq22RopoFtn/2USdxQ5R3lekz4YI8J81mWLBsnHL+GPNTOc/sPGbtrNJb4C+zI6M
	 2Gc2Lmr3t5SUDfO8RrKXJNCP9dpxYz02oNPsWXSqHYbwq7DEpyIkYeuyEe0laSoTt5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=jaFfpAQz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.1
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013001.outbound.protection.outlook.com [40.107.162.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1B2606A326;
	Fri,  6 Nov 2026 17:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE1B2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=jaFfpAQz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mX5ox14zLM9zMWCtGTlKWaVMGtM/uUWaLDCP+UY8myDScU1QzReiFW8X4n0nRG32QFE4h2/6ToM5EJn9pekXBM11cCK4CmgCHuL+Vsz0dleghqKFE7Za/zDLz19zzGVUnrch+MUo6lsa8pbnruny7z41IoLHPKXcUSyQqmecfFptbmFbLIXpmY+sLYBtj+0IKCYs2+ULElZQTZSGT2bupZSvUqjEmgXkzrF1jlSKysoRGywLXklCbbmOuBtn9x+Wn6LAmbW9Unp8SqB24jVlQ6ugW4R6Butgu93p+Dm4Moq3QcDCXlAWi93xzdGoTCB6pTXXvzfs/KCWVgQFWu9Hfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikf0HVPfUOjwBWB2m5b081JQC4K0KwdH4YipAsbUbEE=;
 b=dyZt69CEx5NLPBelD/aBedtJGSyE/aVD9Ubr+644Jj+EMe4AXNCUoUNgNWXrsiOdL1sVPtfZxlx0d5oCWEfPbo2ULELMMY9bp6f1KnwxEauEiNZmRfwxTa4hO29xh9s3Zi7ENNnfCwZuAujbrbda/rvJxIFlp5bYKZFlnUnD+mesyM1hWLltjtNMqca4tbtCjDkwzTv2a7tVFsPyYRqYTCb0EmclxcQfJnsqg6AaozBMK/GGitRAlgWQBa5gj1FpolQsB66VB4pBu/+OfTE9E7KJK273YE3jaqUZDdF/zDYUSfVhkNNGszM1Kv0fxhM3bu0KfT9Zh2LyPTJUc5VU9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikf0HVPfUOjwBWB2m5b081JQC4K0KwdH4YipAsbUbEE=;
 b=jaFfpAQz+j2oMJHlQ3NEqlJwtVf3DnDhBV60ookUjAAPwYgg3bxMVuHrEmTo+XsznBTunBU4qbo9G8mfKp4/KkT1LG38mhtJRFr8/rkgBWKkGflmIBPgi2CMm+VU/l5TAexDnYifyiI7rK33p97kERSUiwnPUugjtNp2/N2PwZs3aV+2nUMtcrfkICCj5hkazSzk0kMfhav1cKbmFWr3tw9TDGv70MvjhnI3/LNleL3l3Sl7v9edboYzI8mUkXM998ewG0a8ENDtCMwkqSFSGd75IrDRIS3RXOXLKmVXbAMNl2xj4jOF2JAOVdW18cE4ZXB+R5lmEj0wIut2l92eSg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM0PR04MB12076.eurprd04.prod.outlook.com (2603:10a6:20b:743::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 17:29:43 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 17:29:43 +0000
Date: Fri, 6 Nov 2026 12:29:36 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.li@nxp.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 3/6] dmaengine: plx_dma: use writel() for the 32-bit
 PLX_REG_CTRL register
Message-ID: <au4OgFX8RQCVuXVR@lizhi-Precision-Tower-5810>
References: <20261103155202.461725-1-logang@deltatee.com>
 <20261103155202.461725-4-logang@deltatee.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103155202.461725-4-logang@deltatee.com>
X-ClientProxiedBy: DS1P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:44c::10) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM0PR04MB12076:EE_
X-MS-Office365-Filtering-Correlation-Id: 82fc00a5-93a7-44ee-0745-08df3c2b8ba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|19092799006|11063799006|4143699003|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	UuvhZBeKDiY7/+6E9JX8uY44jSr/0cl/gCEQqeQbdTBiN3e6NDvAEqr/qXkE3Rq1PdmkE/lZx1bAKE+neHDsvTvJJ69qvA/DIVLnKVkz0XBBXSraXG2fRepzbP8j1CBSnoiBiXfwuSED0QpnldY6R+VC+VS/TMuz5X0mtS38lpJBiv0sTUVyaT8c6lhXfs7TWpuDOgdWFln1xLfc30TzCA7MXZcOfGVqaoMznKBax8Z3+I9WSlFZVXqP/sjLiE3ZRUWLFPLVi2yDz9+fTlGMUIopv9NNV9xdx1IW44ayKfFUD4SK8VjsrZmhUCUWIRej1BTeEghdJu2lgFUowrc34taThTEw8/s81qZqD5JcR/1TR2t3tp0Giot3XsJTJlifrCIp0ml+b22MJBot0mWNmD4coQQRgNvNGKbMFF0AkxGNQY7NTStMCiIrjuJAE7JMabZcfPXPaXhyDpg7eleUFyTe/YZlVUX5GULO+uxjpx/y84YwOdiVfFXTiBhXw/BSI61WSsmHSou5nIdkVxx1IbyLomCBFaYlrILex6o/cmEzpVd7eifmfhxtcyDbusmflZMSVXO52JLqjp6rlr0xJS5YawB42W1dOOtASoHXPDBGGYnf/Ivg4kxEa3Op09r+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(19092799006)(11063799006)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1l0KgBjnzZnu/c196fA412BI0XGrD2PuopDN+ylDusZ/ufanrizkOz/obRAf?=
 =?us-ascii?Q?/E9GgOX42zZaXz3NA9AaenZDM47QiaVH0zsgl8C26pQsIrtn0Fru2SAA7rc4?=
 =?us-ascii?Q?FMKKrbRrUXfxZt+jYjNDh/APjn3Qw+rwVu4EXvs62vW1NAt9y+RS9H10dvlO?=
 =?us-ascii?Q?bOod+H8GoKa0V5kP3wsPkYAO/VaRnG5fzZo4yTrw+0jeSMfWYfusS4dMXx3c?=
 =?us-ascii?Q?MhyEKdxEsJAX2A6IQr4FzvC3HeREsyMhcCQariN2Xq7HznjOra685pc+tyJb?=
 =?us-ascii?Q?/b53dDIgHhKhnZDkAiGnNIhv9tiDskQupssktRRxp93eJN+RomWLv5AGFwFj?=
 =?us-ascii?Q?R1fwnwtKgnyN/8o576CmHsBJrAVVeo78qH1i4VyDSgGNG0XVBuvA+LM/tu3U?=
 =?us-ascii?Q?aps/2vO/dGwH+aQuKMN5j053YKtMoKX+QI7BtM0aiCLIqahiZ/1RR4NyvtnD?=
 =?us-ascii?Q?m+vQwlXc9jb6XTqhYqQIOVLGX/e/yg5Wpn86LEAgICwtLjw0bjn3KPOqvOQa?=
 =?us-ascii?Q?F1nwa3l8TZFMPZ1MIwn5qYmZst42VvvEaCtnYvHJIgcxfbLynE34pPV9axZA?=
 =?us-ascii?Q?yfiXUZGCXtJtRSfFuKMuAhwjxFx7CP6uXQgbclQbhoTN70Ufj8kKk8fnTxkH?=
 =?us-ascii?Q?lU41ttn1BsKDQhm4XVzIu1O2L6UC0vdmeSnUTCHscnAph/gCatAtkdNEHB4Q?=
 =?us-ascii?Q?r7KzTEvfyRZvqtd7YdUxHTiWbWfmDJp6zMmXYbKbcGbkmUWGjqFnvr/8fINs?=
 =?us-ascii?Q?7+1xTF/FhCUbIpC898Ortgw37AR6HRoAoqSE3UNFkKLhs1nUmIP2qiqSRrF8?=
 =?us-ascii?Q?f9FdKvs8Tx0ZhLQcGBxh0GIagVLvDXMtiTwyo7uP4SW9xhEy/ZarTdAG7q6U?=
 =?us-ascii?Q?Xt9EIwfRcTkFsLwQqiFhz2g0/l2r98jSXrNUPYV4/YzrUNLdK4dihKkcIsQ9?=
 =?us-ascii?Q?mi94YP+Z8JEPIhDFSY2mXPgFXcV+7oqzw3dyXAzU+8yyxDvnZe+x4mePRHNQ?=
 =?us-ascii?Q?Rtu9rg4NEqa0BeN14JmZL4VkyJmZLVDw1Ya2GP317k7elqrqR/1P8OClF7lN?=
 =?us-ascii?Q?BWvJCSjuJsE6U8SH5JPaW/3v0RlvqWpPcv8kPeNfGGFA2TJ9+8b4MRewL+sB?=
 =?us-ascii?Q?ingAvDW/S0l3sebVKYB2+gaZX9qVG3kpTz00WLki8L0wP8cpUVn3lsstGrAv?=
 =?us-ascii?Q?EPEb0a6Ehzu/4aCHccXOFtEsIAZCOjUSYnZCF2Z91t/PLloC1Fr49ddQLlh7?=
 =?us-ascii?Q?JnPwP8LmEag0/olEVQYeD0BQUfhhINCCEj0fon0G7rkhJAr0Qf7cPccV9Swj?=
 =?us-ascii?Q?foiiTRdb97W0479/TmCsHc6VZr7BsX6tQMTBjTw5dhDlBskCiz6HQHL8MKL+?=
 =?us-ascii?Q?s0To0vwc1SvHf5Jt5UIuqX61TW1CokWuyDF0ANqNRBx2ID9O3TjsQamObwxO?=
 =?us-ascii?Q?kmSMEMetNkDDPzOMc+HF6+dR3PBkunFtNhoyVWtaFxvDATOB9XWPESZOJobe?=
 =?us-ascii?Q?TkCbslPn+Wkoj5I5gGqPf1YXI02WiEgUTxkHy5T4LizutQwTIsZ/7c1o71Ab?=
 =?us-ascii?Q?vnwX4vmPPeS/6JzEZZkDG/ZoQcWy+OC9grY4hckUNrhhVpQ6SqCah4LJy2Wx?=
 =?us-ascii?Q?XYivZH6eKaiRctZ3rRq9FHeE/6X22rz5+2R/LMKCxJ33q1xiwqD5O6sOHou7?=
 =?us-ascii?Q?11Heag0zsIEjHcTIN9zslJtIhQKI/b3AiFEPROyCJA6rABA/1/Ig/A+z8k99?=
 =?us-ascii?Q?AUF3clDwkU5dju6007V4d7nhj5/5BX/ylb+cFn/qj5Uhn4uQrLKB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82fc00a5-93a7-44ee-0745-08df3c2b8ba3
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 17:29:43.4713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D9HaY5NnTRd/SqlNEfN24cLuuTKTuY0giYnQHv1t6zQOmmhfpmNpNmltmXKMoA4+XCHU/4bnYCYJwJ7o6sN+qpApBPNPIcREqOP6B3arBFv4n2l7GGKkR1MND4J7d8Wz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12076

On Tue, Nov 03, 2026 at 09:51:58AM -0600, Logan Gunthorpe wrote:
> plx_dma_issue_pending() writes PLX_REG_CTRL with writew(), but it is a
> 32-bit register and every other access uses writel()/readl().
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/dmaengine/20260717223217.B6FBF1F000E9@smtp.kernel.org
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/plx_dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
> index bfccbb0c70e8..1c995f0c4463 100644
> --- a/drivers/dma/plx_dma.c
> +++ b/drivers/dma/plx_dma.c
> @@ -351,7 +351,7 @@ static void plx_dma_issue_pending(struct dma_chan *chan)
>  	 */
>  	wmb();
>
> -	writew(PLX_REG_CTRL_START_VAL, plxdev->bar + PLX_REG_CTRL);
> +	writel(PLX_REG_CTRL_START_VAL, plxdev->bar + PLX_REG_CTRL);
>
>  	rcu_read_unlock();
>  }
> --
> 2.47.3
>
