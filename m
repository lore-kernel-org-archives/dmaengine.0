Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013040.outbound.protection.outlook.com [52.101.72.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B274420479;
	Wed, 15 Jul 2026 18:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784141914; cv=fail; b=T6LCVAiuh4yUVVFkS1yNyQ1JZqpMOajY3p4S6kf1AWYf8ZgpA6sJD/5jPI3cqhuU/6I9gO0z2k2uStlmgg9CVGHJY4U3nn5qq8fhGEvsicSq00BQm9tsg2BUqpfSSvBpwLVX21UDJv+wOfscwjMTsu5ModQMrFCr7bGK+fueKeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784141914; c=relaxed/simple;
	bh=tKJ9q/zQTp6gamyQ3bQSt/LY4zuRyA18uo+2BML6Zdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AOXBKR+VJgSX4iB4XZkMiyzj3IqZ2LD4b4U3mIowmV04yrOzu0ULVA6AcOUUCf/m9Fcnlhv+tU9DZp9urp5PkXWaZUf6A80+pAZJuBvGBRgRoxwDxEIepWDAwVwhLt2qAPvAdjXi6aA1s7+L5vCJSjQOdNhBka3nzSuBlGgTA8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=q/ASfOSn; arc=fail smtp.client-ip=52.101.72.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="q/ASfOSn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=efgTcok1ya8rr7uLq+z0VdMQ0DUsfrcd29VqsVmUZsVY8qJ0vUKWvcrXhbXyRdTFLUQHWpR36O9agNzAirvUscXeHgGIQg53uyngO/bUMCizMpBu94D1VVqdL09BbfEum7pzsuG3F1/jSjqlwyWTQdtiF9Bj+KxC6oZBALEpB57HgfU7RZcVgy9CZiLEMKkeKLatFTeav66yyn2HOWUR4OzlgZEczYG3GGJcn6ImR0yuzMeb2ExQtPZCfwWlH9w4FdzkD5LBDpjzEV2wuW8XARr1m1NAGyB9FEU85KjJsCuIyzT7iLYb+m9u1JhDz2Mz7/G9J44IX8+BT9r7yjLP8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ctbAat+0hz/zxntKLp+2DF4CIiKkCtIErOcRzN1etek=;
 b=nvLSUGKl0GQHe/fmnFXXbGTPm49GR7sFlnRzZ4CImY7Pxjck3UYQFv6s8ngQXo5AUDaf5unAg9lDdC5iyv+xN6AxccvFWkeahoryB6wMhstphu1drAaFZz1ARwTy6+7eHJkJo70IgFhVeWQMqQrne2sKH1klK1N+2aFqpTAiMEbkMoUb5ps1eJO8/f8E2oTQVk3RLRNHjfp1o9CggbVOTWAZx9pj8i5k8FJrM/esidCblKYsHxwZkzk5Q0mVetkvr6EDavAFxmgM2RRE7q82UegnmG1LtM8X71gZsPuyW61neOhk2m8fRcsQjWpxUuNKscLmaGALs74E9GW9v7/XRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ctbAat+0hz/zxntKLp+2DF4CIiKkCtIErOcRzN1etek=;
 b=q/ASfOSnTR8+VRHiHyiD3ZWksCtQzcDUjtDkYxVAl/c/scgmdHvYPHjSJjivElqtVlYXqqGkR6bfz45DZ163lim8u3uLtohprKdWOD/DFuPQU3xgY/Z/LJiJ0cmfJn3FzlG3/st6mqDbWw4GewfILDHgKccSguJC8KhXStEaRxPdofgcZS2khnmFNqYxfDXP702jtKpU8ZszCrBLfYX3gOPR2k+hQbYazbnZJ8BVxpebvQxvVXS31jGUjWDwi+Q+mmCPp9Ha6wPHgwqc3WT2216p5Nn+EYg0hm+B2Uqaj4uhjHjswaFW+dkQKPm5UU1g0q8z3AaUCnhrz3Aa03VNhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB11481.eurprd04.prod.outlook.com (2603:10a6:800:2c8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Wed, 15 Jul
 2026 18:58:22 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Wed, 15 Jul 2026
 18:58:22 +0000
Date: Wed, 15 Jul 2026 13:58:13 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Cai Huoqing <cai.huoqing@linux.dev>,
	Serge Semin <fancer.lancer@gmail.com>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
	Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/9] dmaengine: dw-edma: Serialize channel state checks
Message-ID: <alfYRbDbpSI02unF@SMW015318>
References: <20260715175740.1110404-1-den@valinux.co.jp>
 <20260715175740.1110404-6-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715175740.1110404-6-den@valinux.co.jp>
X-ClientProxiedBy: SA1P222CA0112.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB11481:EE_
X-MS-Office365-Filtering-Correlation-Id: baa9c902-47fa-422d-9ce0-08dee2a30a7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|7416014|19092799006|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Tax0cUQi/OdvxS7TXATi+wd5W9TYfkqIY4vA+u+xHMzLvSOR5WBNRYrvvgvwdF7tU4cxygsA/M61IViHptFjYdPINnuCjiOXOhkHnWwtGCvP5hQR3t89bnzj0tHowhSet6R+RHJNg7vXzsyVDh/MUgh9vtD5Hvz5jzeh/BGZ1kIgsnd0ZjLK5uXKdRTH91MsRjCMyTVx3ft/6p7siPv9uUU057+XA0bIZeIovq1WYOLRzPS5aq3IGde3W4C3kB6kuYJQb0JzNG1LADM+yFraeCQJi2W6hUSN6d3jU9VDaNLchlL/EjaLlKVJc5dUxI2S+gkKJC2UyOpO08WWjfCLFDvxVKzMo1o7uTlr3aXDVgHTSrLL4qfX9Dy4XJIe9ATidRSh5L/geFtO1HagjMU2UG/3KI9Rof4vBX/lmmzBe7XwoW7aDw5zT82wa2O/1L3GYZ1aIYH7bECkTD9kGguyMk5L3WyaqLAX6OoN2W3LLrsTYr/OoMPJR+LXofociEYo9uUZuooGd3NRMVeut74thn11V2GjYC2h5kMldh60hb+gY/IgcYIlD14DmCEoisz6qWiE0y5VViejGgqj7X4vlo6lGc4rdO1+LLAJeNR8UBtNEStP2lLbQJAxVixgA6XvmE20R48dmUztxMk47MoAi2YjJEsYfD0PEtz+dpEUN/w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(7416014)(19092799006)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Nx6QjifJ6PKyOnw5mNy2LeQsN+YOogJVVxZfn7gTN8/LdlLdH4gI+1QVlKIL?=
 =?us-ascii?Q?fkFwigEnAJwx33fXykDtedknOZwrm0qIEeQvYD/u8GsHGOJl4RjuudSUfXyc?=
 =?us-ascii?Q?sj6m9gp05mzh1gkqfOxQFfp6hxy7xZFCCz2eyU6fmUhecIP7b+L9bfUsXxUw?=
 =?us-ascii?Q?lubAe7CIALl5kHXsRZcR73AxeM/QjYEfW/hsa/yiG9Dr+j1OeAxUIZtmiy7L?=
 =?us-ascii?Q?/NIHPWvWqEvPyN7f1f6YrT2KkE1nkX5fK2jSbzsh4e4n3cVwDIMD5H6aNcpS?=
 =?us-ascii?Q?84LFRro1Ca7KueynrHit02DCuot7DBqdxrpQo2pK/M/Iffmga02b3PmTEspl?=
 =?us-ascii?Q?CMhCQZHS+3CmzC08AWDGQVRAsd1xFDJ5u4h1yvjCMa4F1cJcmr+dmmXYsBMI?=
 =?us-ascii?Q?nVzwn6OgIcuhGo/llGhikqZGP2kDnuesfBXxMHfFoJgBfulfLezg8RP+YRai?=
 =?us-ascii?Q?crgU8a5Koby9DifaeMLQ9wc0k0njFF1CWtczz5Ecg18pZfq8asjR86orw9Ag?=
 =?us-ascii?Q?U/EqI3WnMstcyMxNVItCV4VbJhzw+R282Qr0pN5X7ihGIvqouhRgGUaNz+ln?=
 =?us-ascii?Q?JyHg6AEzx3vwvQU75W/Jk4wWQudRdFgFhh2w37BiCLNe7F3hU97RYybLcSZ0?=
 =?us-ascii?Q?qXz/WO6YQSsq5pusN9E949i/51xXoNgrKfW8B4FmJvs6bkJq2IwVBw0NJsJJ?=
 =?us-ascii?Q?pFkOo0xOJxTqI94v9L3k/PalM6WWEu0oFaDaLKVOla7ZCjg9b7L1cuAh1T1f?=
 =?us-ascii?Q?tcoMtTg7Jz37VKURgUgxbFl0krZjdrcXMSzmda5zMd7HNmuBSVJhHH46DrCI?=
 =?us-ascii?Q?8DF86AUZbpXAhBg7T3tCR70RVgibZp7T6FvT7KsEEQYgJW9f1RVSDLPp5deN?=
 =?us-ascii?Q?D+065pZ3j/NwUOEzEFvQapT7s3yZ+HEPRv3vQ4j9yFLs0msFWX5QAlYtQyiF?=
 =?us-ascii?Q?Ph2YQOkQ59sjz+82/Q7ilDb2GxP3CGHnBb6eH+jSMsr3+QWjYPBxZcUk/eRX?=
 =?us-ascii?Q?2ZRic+9ahbLFH3jsndSh0DQFKdYopD+yOrFmdZyw5C2bBXOlvK+Dfzq8x8ey?=
 =?us-ascii?Q?cDXBNdmREm3aI8b8EYXz66kTX0P/1AlP45nynyDcMAowG2GuX4iajkwd79HR?=
 =?us-ascii?Q?anMY6QyOlrqkvOlCjjD3i1wyHt9mz7l6XWK8Uh3kNqBQlrS7c4xvpFDxizOy?=
 =?us-ascii?Q?bLRdpExJMVXEu7r0mUAxUMfuLup/QwzHpBR1GsFS4sbYF9li6/sqOREnKc3t?=
 =?us-ascii?Q?xsY1nEsZlhVkXPmt2FeWPA/Dcrv3gwTcpJnNDjPG4RgOX9uuShvWxxgLSW2I?=
 =?us-ascii?Q?GvAx+yNImGSE/pG2YGeD2TDJLSbPziH69dEW+3Dzqgj7tq4sJWvbXJGyGj1m?=
 =?us-ascii?Q?gFGg2VrnJLIcy60gTIrywN1lCknQCyTerRX9n7TuSgvjnRfSKzFh1Bp5d+GB?=
 =?us-ascii?Q?Mh0yI3nCDv8vNV8aJ63/Oga2mmJvR3ZoSYFv8v/x1TnuYkMDEj3MssZwsFUQ?=
 =?us-ascii?Q?H1e+BiCYBS9hHCWt2nUYLajJhFoYdFW0aRUDcya14NGAE/bgau78W105X95P?=
 =?us-ascii?Q?gOa5+aaWdCB73ei2SRPuunCbTCES7fXUk1Hcf5hRn1itJxAm/hkp85TtCoMC?=
 =?us-ascii?Q?Z/hwSZqAoL2cXM4oaR3TiHtbCzBvk3g/DTagAfK2rYISw4QGVE3qPXYeVat9?=
 =?us-ascii?Q?XsfZ1WErEpCrHseUalcQrprtap4c5yHoMpMwZS/KiMPkq3v3l9kw9pycqdBf?=
 =?us-ascii?Q?tKrQbRtBK8e3xvSdFJ23JDGWt5k2yTxE10MkNw8kRA+ZE/7v8VUX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baa9c902-47fa-422d-9ce0-08dee2a30a7c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 18:58:21.9650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BOFv0D+6B8SfwrFLLL6OYFfVYFL4OHabQGPNrZILsdwECV9K54gcpozpoepDEwo57YWncEFDhyDL/ViHCkuy2GYy8qkhsIbTA6PycDv0hxOUX6NRKFEYW01li7zXdA7u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11481

On Thu, Jul 16, 2026 at 02:57:36AM +0900, Koichiro Den wrote:
> pause() and resume() read and update channel state without holding vc.lock,
> while the interrupt handlers update the same state under it. Take the same
> lock around those state checks so that request, status, and configured stay
> consistent.
>
> For example, pause() can observe EDMA_ST_BUSY right before the interrupt
> handler completes the final descriptor and moves the channel to
> EDMA_ST_IDLE, and then record EDMA_REQ_PAUSE on an already idle channel. No
> further interrupt will acknowledge the request, and since issue_pending()
> requires EDMA_REQ_NONE, the channel is wedged for good: terminate_all()
> leaves the stale request behind, so even reconfiguring the channel does not
> recover it.
>
> issue_pending() already runs under vc.lock, but it tests configured before
> taking it. Move that test under the lock as well, so that the decision to
> start work is made against the current value rather than one observed
> before a concurrent terminate_all() deconfigured the channel.
>
> Fixes: e63d79d1ffcd ("dmaengine: Add Synopsys eDMA IP core driver")
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
> Changes in v3:
>   - No changes.
>
>  drivers/dma/dw-edma/dw-edma-core.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index b06b299661c0..8b0e2af734da 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -300,8 +300,10 @@ static int dw_edma_device_config(struct dma_chan *dchan,
>  static int dw_edma_device_pause(struct dma_chan *dchan)
>  {
>  	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
> +	unsigned long flags;
>  	int err = 0;
>
> +	spin_lock_irqsave(&chan->vc.lock, flags);

new code, can you use clean up guard()

Frank

>  	if (!chan->configured)
>  		err = -EPERM;
>  	else if (chan->status != EDMA_ST_BUSY)
> @@ -310,6 +312,7 @@ static int dw_edma_device_pause(struct dma_chan *dchan)
>  		err = -EPERM;
>  	else
>  		chan->request = EDMA_REQ_PAUSE;
> +	spin_unlock_irqrestore(&chan->vc.lock, flags);
>
>  	return err;
>  }
> @@ -317,8 +320,10 @@ static int dw_edma_device_pause(struct dma_chan *dchan)
>  static int dw_edma_device_resume(struct dma_chan *dchan)
>  {
>  	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
> +	unsigned long flags;
>  	int err = 0;
>
> +	spin_lock_irqsave(&chan->vc.lock, flags);
>  	if (!chan->configured) {
>  		err = -EPERM;
>  	} else if (chan->status != EDMA_ST_PAUSE) {
> @@ -330,6 +335,7 @@ static int dw_edma_device_resume(struct dma_chan *dchan)
>  		if (!dw_edma_start_transfer(chan))
>  			chan->status = EDMA_ST_IDLE;
>  	}
> +	spin_unlock_irqrestore(&chan->vc.lock, flags);
>
>  	return err;
>  }
> @@ -373,11 +379,9 @@ static void dw_edma_device_issue_pending(struct dma_chan *dchan)
>  	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
>  	unsigned long flags;
>
> -	if (!chan->configured)
> -		return;
> -
>  	spin_lock_irqsave(&chan->vc.lock, flags);
> -	if (vchan_issue_pending(&chan->vc) && chan->request == EDMA_REQ_NONE &&
> +	if (chan->configured && vchan_issue_pending(&chan->vc) &&
> +	    chan->request == EDMA_REQ_NONE &&
>  	    chan->status == EDMA_ST_IDLE) {
>  		chan->status = EDMA_ST_BUSY;
>  		dw_edma_start_transfer(chan);
> --
> 2.51.0
>
