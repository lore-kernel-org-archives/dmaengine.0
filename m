Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011036.outbound.protection.outlook.com [40.107.130.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76544B488E;
	Thu, 24 Sep 2026 20:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790282005; cv=fail; b=sWHCCbySDxSVf+yKqhRksrUDsYEHhHI1QZRElJAOGU6of5xc0IXbop7gy1sF9Nn2kn6qDCDSPQNnrHfPNg/z8WgU4r5cJdFheOjBZmNMaI5Vpc0QbauzOA/cxjoR/dSRv19qtZv86glVvi1qIRzWbdqaZYvAhk2kNoeQguCgq4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790282005; c=relaxed/simple;
	bh=SeipQGURTzkt3wabQiu64FZZXWuPUMKB0R6fjBbWkjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OprqRrFrQc50ujO6ZByfIXrSzI8UMUsVnB7d7kB71KKUfywqCDdwZMIxLrw17NVZPU6aiMrtiAOPHa3ru+G1x10qeYxnEJxAd+O9qeDGr9uTrrFOeS28SHPcDompJI0r2jHBo7TPP6Imjc6kMfGYZEhyN388R2mfY16FeppXZ7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nv/GTYPk; arc=fail smtp.client-ip=40.107.130.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nv/GTYPk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vNSKz7c/C/prAGa2+DCm/17N7m+iWAjv1cArJttT9qv0oP1+yGa01TPYk9eFhvY4s1NiMCnMmBP8Ox0h6dfHNX02bvi/uwt4lFwpeOLhdvz2nmvJOzKiMLJ4NeZgAOG22zn2Txg2NiEPjwlWBMtyilv+7hdmZFZ9FFdY99bKhGCw2TDtP6Tw91o+fV71OxyUCLJpGJf9A5uSW3ZkqiEDZFI4CeeKyCwvDaFU9J7h08A7+yaojGEvgxQaeXg6GSb3dAgAww/+VKQQxod45++6ItnB94ZcgwlFvXccY+2OFSJsjO3hgCbic0p2Iv4b4rW5qat3DahWf+XydpyvFJo0Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+I3cAZbub3xas+hAqNKn7vdTuIOrLOZLXBLTFNPVikE=;
 b=d2DhHNhjQf6IBQSGt4Yz2WXS7Y1I2c1FlJhtJE7zB1Umnwt6epRWXdkuTcOr32j0nZdfrAu7ufW8jqARTEKg2u/zLO/wLbW1ZGZe8ICoQNkK4zkYrSMjiBWBL3oGaveMwa9XXr5Hu3THIfR+36or+HH0ZHIs2gBbLhJDtuxDD9vYj0ew/rmtMyhIFPvGsQYB0pFh1VovJics8iILG8/1CJCGFvq5q1LaBUblHhVb7lEt9g2JfsTL5EikHV3Hw19ssdCN17DQ5c0OAs22tT62MSAsP4A7I0seRAX6qk5MmqKPnqrFmst2GyeZK1odnhHtkG7S9cZfDcGo5SxbYvu9mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+I3cAZbub3xas+hAqNKn7vdTuIOrLOZLXBLTFNPVikE=;
 b=nv/GTYPkKpezN9ZBd+FVceiiFI3M0FqT5eIMj8EZ1lEd+7W54FOCdGUYx+AVE5U7js/pdpaJSAZYjTB8vgfetUEz5LzDts9U3P/nfI5uB244zfjbHIBswzGri+QPU6LYhfHJ1SnF4UqH4nkpMCd1AB+jSduOJL8X55ou1D6N9nGqGXmBoTAUFoPCeveZdUgREqzB2O2ECJdqB1TM87c09zNv22HeFCmrwIolnCd+RDlClWLeR3HRSYdYOmsqxipVN8sVMkt7Ot1vgKMatEC1zmX/E0sRDpS+QNfsoz/mYLzYtwNDskiQi+J2Rbg2WnfcGH5nBmOewmN3W60uONgEAg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS5PR04MB10020.eurprd04.prod.outlook.com (2603:10a6:20b:682::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 20:33:18 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 20:33:18 +0000
Date: Thu, 24 Sep 2026 16:33:10 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 3/3] dmaengine: imx-sdma: Use __assign_bit() for
 ownership configuration
Message-ID: <arWJBi8iHhaeNfcr@lizhi-Precision-Tower-5810>
References: <20260903-dma-mask-v1-0-211ffd12c236@nxp.com>
 <20260903-dma-mask-v1-3-211ffd12c236@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-dma-mask-v1-3-211ffd12c236@nxp.com>
X-ClientProxiedBy: PH7P220CA0112.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::33) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS5PR04MB10020:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aea806c-1952-4ec3-5034-08df1a7b1154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|376014|1800799024|22082099003|18002099003|10067099003|4143699003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	P/RBBTrLRH8CWlBfJ00Vf3DUDrak60uOhwCWMCfZeKAj5vhnqjNGqg3ImsOibGbkG6E3f60zah861WMZ3dLDOdFtpH/C2KMI5FLFSbpHttEco7nrfsKkwRwFQ3gerhYwUTq5tkVbI/fr0alFUjFe68r/Xi6ACcG9Acdf+Fn19R4bVXhK/vCx1ax2nN8VBcliwdFmTc1fhsrBg9uZyJZPTep/11SwhpfjLJU8zvApHzVnluVAJGaizeSHym2DiodMVoAN2Fqx0VVq5nU1W4UW4g5qFhYvl+uKL0XyJmKYxLg0lujaJaFnJ6jmpzm7ulQGgOw1QBhcUyqBFFUndCaCE+Y8AcMsq0hk0f2FwR7EYVgOdVG7p56AVbP//Cqe4JkqM6t9jlYADYDvjmYE+O8iOGd+cbyWyEuLSkSO4KzIgKjVqbJpu3rEJZaO6luGntguuKsdtNVYSeTBDpiC5Ea4AP5xvkvYG+VpdNzHNV/dbDcT+JoFRwtJNQSno5400AOSghQUT0Pb2c4AysTUKUdJbKVIJt5KZwAFPLJ1uIrSDYPyZQzLdEgTFPQvuf86dUBrcIznFEziTb9LvJT2Uwbz/7Y91NxIB8boDTWNuMfiH6VC+xzWi+H4GV+n+Z98FOwAdwntLiNdlcIP4SHd10fHXueImTE08HLVf1LIXEtaOQY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(376014)(1800799024)(22082099003)(18002099003)(10067099003)(4143699003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3/s/bA1TGsDuUXmwoP7r3/mStMGY3JgKh29ff+l3/4ZHaMY9LEg3YLFxvSw6?=
 =?us-ascii?Q?qgPRofR9S/Xy3q4SdNyJ/oKwGSYsKuWxh7WswwuISoXWdZx/ChQdJCA71p0+?=
 =?us-ascii?Q?tz3EY0k0T7gsV7AkSvvlp9ufTjnwpCfIMS3Fcj/lgCp7wFWJzRNavKkTtrx6?=
 =?us-ascii?Q?CcqOpBgU6nIN4xeiKPkuU7wwkhBT1kYksqJ5jiaAmHWTQndQLbq5QjwAajfV?=
 =?us-ascii?Q?Oc4QyZMxJa8bqKUSGGI/UsJiPAbPTZKSp0G8/2SYyFJ91wvN+3ihxY8468vV?=
 =?us-ascii?Q?6M2wf7gt/+olpiiaN1+ZDtR2LjRRZDKHq2rCNviLbHG3Zp4iy/8tRjFo58vx?=
 =?us-ascii?Q?IBYfGdWqMnuIjVItjNFgHtLdcx/BIFjFaPq6MZ9E2lcMgs4iOXfbqG95apuz?=
 =?us-ascii?Q?1rg54nqac+X2QieGWaZKxE212JOlIwMRj0Ln+pebUN6c6VjS0HleOFxy5iTu?=
 =?us-ascii?Q?silbvxcvEHygSYjTLO1OVx5y0w5h+818aQRqVs4X8Zqe2ayFZOF3SJGfIxsA?=
 =?us-ascii?Q?gyoex5Yg1gNh4mhgL6zMkwI3DYcLaw58R328VKXCRyhhIt1DTE3FcGAcW7bL?=
 =?us-ascii?Q?pKdBzAm7OR8BiQs5EzIaQm29c9RAYNWCcPpWsBbhS2JLWOXF+HPPFJJkJl3Q?=
 =?us-ascii?Q?h1PGmxiJCRe5cFLGsbNjO9q01POqHVydAEdaTkuPUYYAacd2B/hSNHMpxJEo?=
 =?us-ascii?Q?gyAL07QbqPKobzxNqBrr2RCWAMJtAPVnLCFNMb6T9n8ZhTLTvNuskZ/3ejy4?=
 =?us-ascii?Q?98AZTi21U/radPCURR/KU8UsPFfiqXv1fRt64YVn6ZJ0Lz5ReoAuzK+7zx7X?=
 =?us-ascii?Q?xMzRjpqgAgK+OXJoKDS6WuGvSvP9XHbL4VaFaOF8nqIbuodZ7oxuCXx0AxN9?=
 =?us-ascii?Q?WIzO4WE5yyk9Ky8VLO6nelMaW6ufxoEgddy95imdcA3Jz63sTMsxglIVtNLX?=
 =?us-ascii?Q?aruuFkrp+q/Rp6xIix/3kUrZBArJtPVtpujTWW2VEEXGgvFJkEk3mPizEVkT?=
 =?us-ascii?Q?a9SsLHWh/N61RXOkS4nD8XYv/AtFVFVN1qUS8qDQ4MhKTcXSrFGLQnlGBPz1?=
 =?us-ascii?Q?+d4bqDueo3jDM0aP+pWKH65706kwex6zjzAlilyx241yLuG2YSH9XUIGKvG1?=
 =?us-ascii?Q?oTczOj29XYo53jqRvUejNepSlrDXzgCQ1/XGPAJhJW6L2P34R5lCkWHGKnzJ?=
 =?us-ascii?Q?+mUO3J/fCixVEufsNDtWhw3rOty7HPG8ImOIE+WZcct71QoVUiGdn04yxY+8?=
 =?us-ascii?Q?uz6nhWEMj2XOVD1SySlv6Ydc2gMqH6RAiG7nBIeMZ6Olg1il3yC4NavwA8dv?=
 =?us-ascii?Q?l6yR35QZEtJkbFlVbQe+QKmPu9/1Kjt5bkc8PtwXen9qYaVgyCemRlAM/Hgb?=
 =?us-ascii?Q?uw3A/xgs3prswRFDy5sJOnwNojiEg/SES/8ao7BM8bNld45Uf565wvaYZQU7?=
 =?us-ascii?Q?gBj+JFxM8b3Yzt4mGc5S0yV6tYYSZFAhq9ch8xf/f8pyYL/zCXUwaPa0+hrf?=
 =?us-ascii?Q?GTVFfLkBItxza7oYY8LZoHAeP8dveBb3bERl6UgL9F7ZLAQchB6q+vVTFW+v?=
 =?us-ascii?Q?R/hMN5jOTvdD3WjlWXOXIjjXvVEr1byMW/hvqrCKVorr+SKyMEu542jHLING?=
 =?us-ascii?Q?45tA/3ugQ7FkwcERj3fberqD6JR29vyTvlxgzMT/6QmoG7SHs23hLGXqjR5d?=
 =?us-ascii?Q?JogkhgcinrjmdDAkXGNP20asALWg3+OGP0tKJlcgF6CWK6P5TxnKj0PpYiUE?=
 =?us-ascii?Q?KexX2amvguxCc2eq9tww9GGxIooHorrLmJ1uBYUeoGZ+GDXOjhgH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aea806c-1952-4ec3-5034-08df1a7b1154
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 20:33:18.5751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QXSjYJ2aT0d34VYohyQEkqDlqJ2lgNo4WMr7R+6Jk+QjDIn/eiIoUMBrI9KdZ9EfshsmqcZaDlriO11OzfleF0CGCG2f9p3RuF8mrLAmgltxumUksV4yzDu3g0B28VrE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10020

On Thu, Sep 03, 2026 at 10:16:14PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Replace the if/else pairs of __set_bit()/__clear_bit() in
> sdma_config_ownership() with __assign_bit(), which does exactly the
> same conditional set-or-clear in a single call.
>
> No functional change.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/imx-sdma.c | 17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
> index 63261ab6402b9..da565409beaaa 100644
> --- a/drivers/dma/imx-sdma.c
> +++ b/drivers/dma/imx-sdma.c
> @@ -710,20 +710,9 @@ static int sdma_config_ownership(struct sdma_channel *sdmac,
>  	mcu = readl_relaxed(sdma->regs + SDMA_H_HOSTOVR);
>  	dsp = readl_relaxed(sdma->regs + SDMA_H_DSPOVR);
>
> -	if (dsp_override)
> -		__clear_bit(channel, &dsp);
> -	else
> -		__set_bit(channel, &dsp);
> -
> -	if (event_override)
> -		__clear_bit(channel, &evt);
> -	else
> -		__set_bit(channel, &evt);
> -
> -	if (mcu_override)
> -		__clear_bit(channel, &mcu);
> -	else
> -		__set_bit(channel, &mcu);
> +	__assign_bit(channel, &dsp, !dsp_override);
> +	__assign_bit(channel, &evt, !event_override);
> +	__assign_bit(channel, &mcu, !mcu_override);
>
>  	writel_relaxed(evt, sdma->regs + SDMA_H_EVTOVR);
>  	writel_relaxed(mcu, sdma->regs + SDMA_H_HOSTOVR);
>
> --
> 2.34.1
>
