Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011033.outbound.protection.outlook.com [40.107.130.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DC04A387B;
	Wed,  2 Sep 2026 14:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360194; cv=fail; b=ITGTQcdHZoEm8e8fgTAsOBO+Eoxc+9n0AeO6gbpzU34N1fKOCF4C618t2KM+V0Yan2iv0NYqWMC6gsJeAiDF2yFGoBVLTtUaYw57w4LOCfzdJ3AjkcARMX73sxDDvZ9deOMZ3CiRz36HfPUjdAIiaBlN+LrprkbmRTIXmgFF+3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360194; c=relaxed/simple;
	bh=3e39I7G6/xWThhRfoBC1HT3WfMubFhgDVXjDldb1kYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VZqHYoMGm/YG9PePO7nBHBmU/iNkFlUPM2DcDZWhRq4g9BlY1ycV1GaDoAwCTNRmthMDhzadOd79UWL51zel4IxCrgZ7C1VaugxC40afQz4vYWFRV5s6qBEfU2EQpi+Sjz05E29+vDzZBeTyBPB8/wcBzb/H2PCnu4j88E8fkhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sPKZfeYG; arc=fail smtp.client-ip=40.107.130.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sPKZfeYG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kMhAOuKYFFIgP4aPFb2Ebwt+t8le0sN0rHNxWgUWaNN3jl60WUGuCyHzYTk1NpEIluTtj7Ny+sB+BaTHJngQcG6uFH3dZQ6OaDDbnqgFyFsjHpb1jxPdXCx6fBs7BzWgWwmcwfKheAO3QWfLf8bEU1QLmhZZz5eXT6Nudi6uZjut2CLj8JB1QF1bNCYljtr6Q92pHdUnfWyaamT8oKX9gyoUYYuQ5d3AAE1ULH57pw/iQQPT+2etIPDMyaCVAwF+/3C3wFtq0AvVvTi9rhE+jEXKgZO+AGwKyMADOLmF9K8JH74wUXkNUPq9w2gtU/iW3IW9222vLYDt52G1qDfgGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DivV+feNAJ52LEp2pHhaG4CHuVYbhXUarNtxY9gL2+I=;
 b=i5D6HlYpK6wW/THeJUIIVpvdQQ4+2oyz+TBudTNY3vA5p6gPkjH5Peeguo0uJkUqTbtQFd5zBa8vdBzJjzTmFOKVU1AAEaBVpJpMCNf8jLKDmAXomEFJewJ2xNGfjQSmWTTfj8BS/CJSAMMmMkrhgQ9bSHFH57GfXxMvJ074jdD146HtkS2YVm3oD/wcjh9EKRaIjSMtg/lj9sSAtWMNC5edxaGYHn5iK5YByriJAAV2lrKPdvHKbYecXYoEtOg+lFDT/I+7NxECh3n8m2s2CNxJZQIDOgp7ilLt2Hflicqef1u/b13KzbwabYmaZTAhueYqyfFWXfLja2/R6fcvpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DivV+feNAJ52LEp2pHhaG4CHuVYbhXUarNtxY9gL2+I=;
 b=sPKZfeYGdNqI9ONVpgjIIe4KKLo+F+kzBoqdOOfWaAijYKWZRe8/ejVWkmXN+aLof1algHg3AdSmzPbQ0/TbCU7JsCsY00Mj3JGCZdQew7PDTovq1da8nSnJH5NlrBcVM2W4YnnVszNc6XSTMUZb0BYNi106JwE5Y0rQJdn/rs2eB6+O9zTMr3PhOqAUnbQJ9QSjkWap/yuzC+9QLHqbqXWqZH7Ig/bFcomr2SzUDIH7fBgqxRv3Om9YKkKuyeNR7hiSdGPWDal3NBLuptGW9BWbnW982jQNWuu7KkAYl668gBid3uxJ+vi1FNdAfT8nkuiu3XKDuQHs7+eVCNq0FA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by BR0PR04MB387970.eurprd04.prod.outlook.com (2603:10a6:2c8:35::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 2 Sep 2026
 14:43:10 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 14:43:10 +0000
Date: Wed, 2 Sep 2026 10:43:02 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 17/34] dmaengine: ste_dma40: convert per-channel
 tasklet to dmaengine BH
Message-ID: <apg19mXInwy5ilpZ@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <72495a21d3eb7ef735400e1a52deb24f3e70c944.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72495a21d3eb7ef735400e1a52deb24f3e70c944.1786384168.git.allen.lkml@gmail.com>
X-ClientProxiedBy: CY8P222CA0007.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:930:6b::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|BR0PR04MB387970:EE_
X-MS-Office365-Filtering-Correlation-Id: c5d6b1d3-4ac7-41c5-8c12-08df09008226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|19092799006|56012099006|18002099003|22082099003|4143699003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	PwcVkUUao4kLsKQ6XQZuQbb0NwPUBOtcH7XhRLeR2oIpD5vxkZKmx+bolop8HAGHEgmxcxeqzI5DbUX2ZemaEyw6dmzW/598816ZDFiwBPQOMAevV1zvVOKjOWh2NVyCDjH+qvlupm+YUbNurbb5/nQR69IpKNrdd/gNoKOWOdQNkOk4ctsTysiCylglA9KtPrPoe111UkZTbTtrE+cw8ntyb85ndm0iTfJnp+8JCg+khJ0SXefUe7Qa6IdYrIOPdccDp6YkIYK9WPNAE96zfQS7V9io7p3oxHsZxInHzRlpDizhl11niDQOgecMHAkX/rVMDA3vBIkjg+u0m7Fdde05xtEm6OyJ9MKFkDi3sGd+0VxnYC9EPmB8ApJYiiopx0TLPxpwozZUGh8H9ZxNyDvx9i1NfbkGh9VVplC20EBxVn/j6+7khFwO3FDipM0/JugiB+0uly/omjPlfA4Or9WMYXxOhg89MiOuAWzXLeUAhazaWE7sp5JvImNhqEU2fiZbQGLktYZ5AOEqSTLiIqD1DdXWPRbsCVA+4jFm2jE33FfkZGxHEBhY02vsKzxgwHxAGNwywck53tIKp8V2ekA+83ytoj86Pcr0DHaOpIXKcK5KK67owkfuWbkl7HtRjI020ygI5JKRMlLCxOXnLtWega6ZyrsI1Y0xez44bXc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(19092799006)(56012099006)(18002099003)(22082099003)(4143699003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5aMfwQBz6cZewN10C+tVZMHLKO1nhEAQVEFQa2oGfQYdlT42dm25cFUqyQ59?=
 =?us-ascii?Q?RvdQAXOR9LkdXX0OVkSX4/epbTCBdkrVubrDb0meXESZYBkMYRSq/KUGJ5Hn?=
 =?us-ascii?Q?L38lGBMfH+Ab0YpYJiZMcpaRnXMIXRtSxzCd7rz20RyTphHyl5jGdQpe6spG?=
 =?us-ascii?Q?YYhDIppZksnznxyMWzRaj283Obr/WxgfzYW949lEED18ivw15NDfox+feJ1g?=
 =?us-ascii?Q?HvZouLYD0GdjAuhERwHB8qvymGs+neoNLCU8002rWz9EF8U3Lp8QeKc/lLS/?=
 =?us-ascii?Q?rJL5dwp8gzBGXO78qSsJOnpUo1kSRIHUSSS2XU3o1JI2PbLaA1VuB0Z5ouwN?=
 =?us-ascii?Q?Qrx4pDULEnm3Q4od3RWoyTYL6UTdaqnagLs4J2haUIoM8OSk8nDj8ip6Bppp?=
 =?us-ascii?Q?jm5+6uQsBQtoFR+D82Ks5HdNlw9ePWuvZg2EBdRHydnM2PKaPlvW7EsmD+LG?=
 =?us-ascii?Q?Qpt1KbdbRP4UKw2rDqDpjwNdFsoG2wclvBNvbqKm4ji36Rrn3VPqy2vS9qp+?=
 =?us-ascii?Q?3T4WYoaSftun/auZzl+abCyWEGAZpg+8MkDyEakEQ9qpwS/vu2eoIDeEju/i?=
 =?us-ascii?Q?ZY1ksE/IOBdzGpT090qbQCfuX6jiYX7xnlYe7a+glBacQsZ7CFgpB5RE8bon?=
 =?us-ascii?Q?kVgGg9tgWlll1FIfzydPlJOiP9y7ZxaesZxuaDe8U1h73p8pD+fdjjVIIXMo?=
 =?us-ascii?Q?2Y5yR6vAsohi8y0Ihhk4MQzqQeUEv0lZ+lw8YJUMj4Ljb7vRSU/tXAkHB2DO?=
 =?us-ascii?Q?B0DEVhqMyt7UrnNg/f5mQ5nx7OXDJ5hvlnR4V3z7AZ2hPhK6XN0GsNVWtdIw?=
 =?us-ascii?Q?6YOxylPAEFWwKiuFqzSV/SrOgCtnKS29pYXmGOOM1fY/FBYvH3iWcUP2r4t3?=
 =?us-ascii?Q?h1o26og/lPHTCOgRs+VbVBst45fS0DCdxmBXO+rFWHYnlsSfZkg7jFC24QC3?=
 =?us-ascii?Q?sOLO4VETynxylDkVxDfiIwaFSN/fo/vzzEZd+n8ghaWIVUAM/GHPy+8GYYce?=
 =?us-ascii?Q?lSlwxhHyP9YjW+K7HDBovE+slMct/UwRXlPO6D9CXKTZnatRTZN5EsrIlpfv?=
 =?us-ascii?Q?ubeaqvK3zdoCmLUNwIc+eygt9Mko8Rvm3WhIJFoUejMjkGpZ642wzZrq5yBy?=
 =?us-ascii?Q?vvzQ8ArtFT1W6iU+YEwpHvV9i06lM9h0U33aL3H5oAk4Dr2XETpwWyg3w1kJ?=
 =?us-ascii?Q?nrDXT4GYqh17bQ4nSPnHwJlRvhSnL8yZRB+8NaN6K0XhTTnyCFBdsbAyBwbP?=
 =?us-ascii?Q?TCqUnsexFNBTXCjFYsrgoprPDmodU/nTcYzM/w7kkRhUXnAQpglfl+soFFTQ?=
 =?us-ascii?Q?XsF3Ve+vAhmgalk4cbo8hxoCBPm+T6LNV6vpyUcx2tBYhwb9bOrJLAYSLFqW?=
 =?us-ascii?Q?0ALX78jyQP5Zt0gw9UOxwYYTVjDcOeAA/Mial8u36eNKTtETha+npXJsO8qw?=
 =?us-ascii?Q?ht+zhj/1BNNvmFifTft05Wo+d8bxHI5k/lR3rK2VHDfqxo+vQ1T7ZMktQLSa?=
 =?us-ascii?Q?AWu7x3iRa/8H8worNcl70+KfC8n9/IdXmbOY8GlsoTelqyt3nYSykX/n67Gq?=
 =?us-ascii?Q?NMqbQ+mfmaGLamv/V+Mj9sR4A/HtwQryPtBAOcZvM28RqeHgVZIc2TEKrvJd?=
 =?us-ascii?Q?R7GfLMziC6lYWIa7kBfN3PRW9bRF8J98kfvaZ5UjwgBQ519OjevxE51F/avD?=
 =?us-ascii?Q?cKdLBGP7HnzIJKXRRxaFfbsnOgoVYUOh9mG/Iv+JcY6LYsL7Aom+jeVmNCzV?=
 =?us-ascii?Q?qcrJAREQXZScLdYpoRG4a6EkFCsqKXZDYdXSsfzns+LyweqCuUvY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d6b1d3-4ac7-41c5-8c12-08df09008226
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 14:43:09.9939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9xwjXmuxjIscj8k2CUWX37q6asV8tYJcTubplp4ZU8cbYCQxZ2OK6iVvCDIq2yxp68EVP3JtDlznQ6DNeZ78MocdymItDqCMx0cWCbiZq5o4RauB/J8TgvxDzPRy40Z6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB387970

On Mon, Aug 10, 2026 at 11:09:18AM -0700, Allen Pais wrote:
> Replace the per-channel tasklet with the shared dmaengine BH helper.
> The handler continues to run in softirq context while dmaengine owns
> the common scheduling and teardown mechanism.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ste_dma40.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 0d9ffa3e2663..e6dfa1fc5e5a 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -461,8 +461,6 @@ struct d40_base;
>   * @phy_chan: Pointer to physical channel which this instance runs on. If this
>   * point is NULL, then the channel is not allocated.
>   * @chan: DMA engine handle.
> - * @tasklet: Tasklet that gets scheduled from interrupt context to complete a
> - * transfer and call client callback.
>   * @client: Cliented owned descriptor list.
>   * @pending_queue: Submitted jobs, to be issued by issue_pending()
>   * @active: Active descriptor.
> @@ -489,7 +487,6 @@ struct d40_chan {
>  	bool				 busy;
>  	struct d40_phy_res		*phy_chan;
>  	struct dma_chan			 chan;
> -	struct tasklet_struct		 tasklet;
>  	struct list_head		 client;
>  	struct list_head		 pending_queue;
>  	struct list_head		 active;
> @@ -1587,13 +1584,13 @@ static void dma_tc_handle(struct d40_chan *d40c)
>  	}
>
>  	d40c->pending_tx++;
> -	tasklet_schedule(&d40c->tasklet);
> +	dmaengine_schedule_bh(&d40c->chan);
>
>  }
>
> -static void dma_tasklet(struct tasklet_struct *t)
> +static void dma_tasklet(struct dma_chan *chan)
>  {
> -	struct d40_chan *d40c = from_tasklet(d40c, t, tasklet);
> +	struct d40_chan *d40c = container_of(chan, struct d40_chan, chan);
>  	struct d40_desc *d40d;
>  	unsigned long flags;
>  	bool callback_active;
> @@ -1641,7 +1638,7 @@ static void dma_tasklet(struct tasklet_struct *t)
>  	d40c->pending_tx--;
>
>  	if (d40c->pending_tx)
> -		tasklet_schedule(&d40c->tasklet);
> +		dmaengine_schedule_bh(&d40c->chan);
>
>  	spin_unlock_irqrestore(&d40c->lock, flags);
>
> @@ -2815,7 +2812,7 @@ static void __init d40_chan_init(struct d40_base *base, struct dma_device *dma,
>  		INIT_LIST_HEAD(&d40c->client);
>  		INIT_LIST_HEAD(&d40c->prepare_queue);
>
> -		tasklet_setup(&d40c->tasklet, dma_tasklet);
> +		dmaengine_init_bh(&d40c->chan, dma_tasklet);
>
>  		list_add_tail(&d40c->chan.device_node,
>  			      &dma->channels);
> --
> 2.43.0
>
