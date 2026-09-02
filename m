Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013069.outbound.protection.outlook.com [40.107.162.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D0A4A8FF5;
	Wed,  2 Sep 2026 15:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363322; cv=fail; b=ZiMvC57Ow7FouLjXazjnA6RjKszzbqQ/o6e0KdE2+lZ5WFFghBgpA5pStT/4x2bHK5Lek06eWqxw/8Hd0Cbjvm0URqe7l2P1qwBWyu8DLX5aeDjhKrFTOt/xQSogd0xzyWIqODwv4wQzxXr2MmEte1FqtetOBsOHg8AehSGbZbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363322; c=relaxed/simple;
	bh=3pDGk1sdO+u+/vd6Rc11g+/A69RfqhJn5koAeWzoonI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oG93+0oF1/z3T/grSpKvveONg3iMWUA7xiRxF/Iv0lTwY6uYRB13bKkIl3uHszfCfY9eMgnKZWOUW4vhNUVhZOp9yKo8ogmGhY4ZY4G3wpIZtG6+VnX5yDk5Es+WwukjzFyOQ3Ec9ueRJpVCAo9+1M9voylJrE4F0n19e9Yy+g0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wo+DVLtD; arc=fail smtp.client-ip=40.107.162.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wo+DVLtD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gogsaV2OO/j7fy0rzOjN/CrgEFv3lTyriswwIqEp97HItDDdIO92rNkYkrUJPsOj8eopZaT8bDMbzPBxz0okelglejNt0CeNGTNaej5jVYak+IWDEfGi6Nw0w7uo5k20mDZJWxl8ohPtEd/L1AWbxZa4eweRbLksbWoEmBemvdNPuwLNhVkfVT0iPUBQys30EQGaNERs34LVF4inzSRtlv2RjVq48WvqVEvTLib+Toeq7GbL8Al6VyuG3WTKy4pMD0pebybiH17ypTT8gmb0nS/WB5kkKTRcLyL23bYjxzDrm78BJFmcXDXti0dSIcT65i/t86KZ3hUmcI5shSl6Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZX+34Q98vSGKy/2GNRxnDxAPTwga6KrUjT019bg/qfg=;
 b=O8RdtEwtl4xAM9qIH4D9qm6uv9jKDED3aj4I2Ms16kEt9kX19Q8sEH5JF6QIKKn3CKc+Hm8Zo7VAK5eY9BG7vmSbh0tLF3iNKGNzADSDCt6kk8keagmrnJvXv9t21+x8QdqyAJACnW89pwvxzljL2lN1pmddPhfJ+Jb+zpkCQoBwUpe/xaK5ntmrERfz8QgRKyYlBjrDm24SNDyAd3932pODTJz6q6M06sQJh/jvPMsjF1n4wk9n93OfQjZd/CvwZeY5R6GvRq5L61or7xAQCACX8EdK3RxTKyemwr2ofIU9leIsV4a4FCGsYnJ/bjlFil2AuaQL2X1BQLWNAIzIfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZX+34Q98vSGKy/2GNRxnDxAPTwga6KrUjT019bg/qfg=;
 b=wo+DVLtDXlZRWLpoECdycKxvpwAPaWTpMzdUgj7ARGwfpn1BZaC8KoJjnmGqtHwBsPlVJx7ErMngcfM1zD7rdaiSZT/gwJZtYxEDzDyF50skpN74H8XCi43zM6Io2kkXrPTg05fKYdZVzkAt/FZdHT1k0JR2ViSsDuo0z6oTgRbQEiddrfeushBDQkHz6rEU+VqqKsUSCCVURJ5kx5U4YrjeLp515DzlaiSdVmIWd4iCUlC6SHgT4fNMGR0m2OrATQrOr9byPHS2YfJBeafFj6Mck3dPcsVAv7SJXP3ej8o/3eS6Xpy1vdYzR2CxXE0mXVxXR9MFOUUUCwMJjJ4mwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10898.eurprd04.prod.outlook.com (2603:10a6:150:214::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 15:35:11 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 15:35:11 +0000
Date: Wed, 2 Sep 2026 11:35:03 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Logan Gunthorpe <logang@deltatee.com>,
	Kelvin Cao <kelvin.cao@microchip.com>
Subject: Re: [PATCH v3 34/34] dmaengine: switchtec: use channel BH helpers
Message-ID: <aphCJwA34uefEyR1@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <c91231fb254131d62306600a19d8f97231b3158f.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c91231fb254131d62306600a19d8f97231b3158f.1786384169.git.allen.lkml@gmail.com>
X-ClientProxiedBy: CYXPR02CA0042.namprd02.prod.outlook.com
 (2603:10b6:930:cc::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10898:EE_
X-MS-Office365-Filtering-Correlation-Id: 219388b6-e51c-4d62-6deb-08df0907c69d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|19092799006|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Obyv8tBzBtfMM/65g1DeBNIZ6EzMMe58gqJ+sGYPWu5zhkAK1qYtiBWCJyY35viOyeZnryYLkcoOeZ+9DFfGK1PLjr+1C/MalHJzqKBjF62Bq/M3vxA/I1sqIm+Ipa9O8+NwELVYYDDi8U00C3F44t8mmTyvcbAcIo02UcqwsW+tMRJpm9EIIzU+yFUfamGJkaxLoEFGvHtNaLXZAOSB9Z5zukpdwtlQFAAoIVyQy/uo+7+scUc0GsQfaBgCMQaS4n4lCKIVHSHKpsiJNcg5rHdc8Q+/WaNpD06Rk4UJvje3nKuzGiUy6E8hM93rx7LPsqxbv8tTmhk0LtrHjSl2+038UAuqorUFgsvtnhXiDGIYOk91BgJfwEqFS3tCZI4GWQDBmpTtZTshNCvrn6ITeQ/vMyCPdiIiuIeWdnDMM7nvNaLEpKFyIc+/2Nx+7sSlmrKpGKnNprBazVDCgKiRL/q5Y1/ph2xdiX7cPjfKkPY8zYkeag8to7K2VFf9jesSyNgSQm/qepAixTTMw7Ie79qIw8Y0WhcvXH2PGM0qxA+oMkqS0lYo3uaoORKeSSIq3/I258161V0BCwYx5t2/yVYjnYcw+OYiDqki0FPqFnTryyAejxh7HRi1Duxn12uQAtBXUQGnLtie6HbG8sKfaokv4Il+QqVoeJ5zABRfYcw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(19092799006)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yCPrsCuchYaW/QTEXNb8Yhh1pU63qWfI5AfZBfp0OYYs06SYkgMq0oA6N0w9?=
 =?us-ascii?Q?eGvSvyiWVIvwPbBzysfl7S7/Na0IK19J0FhCs9dZ47GHDF8ARwpFvYcels4D?=
 =?us-ascii?Q?kGnR8XWZNjVE8X1UHvX4Jp4n0JBbarb4B2N4J5UBO3d3fQLp/6F/ZJJJwHsC?=
 =?us-ascii?Q?mTsmiErjG8ncPTcerxwoBrYe7kK5H5oLZWn6bbLCbU25xMhkZghGKHwiDcyv?=
 =?us-ascii?Q?9OX/ZfDOFXJvqjamCyjiKilCUD2cO5rOZzMNJnDy5u7itL1Q9pzTgOU0s251?=
 =?us-ascii?Q?MKjzA6lPjh+qLKN1vzlIe558+xyuRkkMMrkUT3mSP63l03FxA1t0E4Nnyc1i?=
 =?us-ascii?Q?vRHyQx48exOLyyoGXnkR/YI1CUrHyTd96qAxnquPoD+FLyYC69qmNQB8wgg3?=
 =?us-ascii?Q?12zLLF+/+s9L/3QF7jmJ2o9H8bpJodxskALlRHJzcEzSlSg46yqMuzD87HSQ?=
 =?us-ascii?Q?yAJdFIHY7Pow/5YV8QhsCCRz26kMWzxj7AXC+5z0U+9ZnPV+mUjBRqF9uZOj?=
 =?us-ascii?Q?l/WpSZ966A1x5fja9EUyTlpXdLtvGCT6GIFgu8eTCma+bnzuQB+5UXRtlMse?=
 =?us-ascii?Q?1lnXiWZ8Gsyt5KeygpIRUsnjirQ+SLGUuFfkwn4AoxjJAYVNxvaJF8+fLrik?=
 =?us-ascii?Q?5JqPo7Z7akyG9gI14Kq7RKMB8vsVLQgwJ0g9DWVqU/N4GfAbcADFC1PefhEH?=
 =?us-ascii?Q?2qBZ/Tqwx+sFj6wdJCLm1Up4ad0rVUmbVTL+93Ge0Dd3ElwmkqCEh8AGj6tR?=
 =?us-ascii?Q?tFetoiiPkphUEHAWvL4V+Iwc319bmiIY50y26v1L2DRz6EqWjAtqDvegHBu3?=
 =?us-ascii?Q?oDZilEuPNf7Zb1oe6WhrOfSc3NmFd1dOeJvONsNVt5DuroxslDe3ogN+XySf?=
 =?us-ascii?Q?0pBUo7lxYO42kOox9uaEX0zElUrOUUlixLRzCpG/3rbbGjcuaJkgbcpmven8?=
 =?us-ascii?Q?9jWWxTkVW7Re3r+wkzoXhxIvWYTrtEsT45QpIpb/jOOrcvp4w25qlL3cQ/5i?=
 =?us-ascii?Q?v4x3ne9dFibuGCRktPRuijF+MXhqO8zfNZFNM2CmFhPQk90cYU045YezQIrR?=
 =?us-ascii?Q?pbXF1NpyJ3+YLid7bDoBs855zWoxxiEVpKGimhy2MjfvVd4GYpnUBVDd72S/?=
 =?us-ascii?Q?XUP0LeoyEfxRd+iaDgc863wss+n1pbR1ZsUr3reCnBaHZZybISblHAlrSoII?=
 =?us-ascii?Q?Yagp55jMrXVC1Fp3hYBP5/IKobkVy9DPwCpkogvlQqAJ+VafO5Una2vj7yiH?=
 =?us-ascii?Q?K/V7uNWU8Hz5t+3u7eig0DPwdW3HWXunoRNjiRJzHdK5IUiLjuISkLp+9UCd?=
 =?us-ascii?Q?JIFLo9md5BDdiWXxhrgoLHRN1p+HHf/doz6HxUWFWjJEtaGzyDgsNoRdwpCN?=
 =?us-ascii?Q?IN4jGitOb+UU+4OtIQEb8FVHVWhKlQT6qD0IU5ERFjoJduPiUZcCzw3cuT83?=
 =?us-ascii?Q?brlyvFlue9+8nn0++s4L7ii9GxNudgp9Urx8UoTUTws2oCA+3gNlzALUa1Jx?=
 =?us-ascii?Q?pIH7ggmKxb2mEv4bN525djzPx5T027u7u5+aObSyp1lz9aAeqwwKkqjYTlp6?=
 =?us-ascii?Q?R9cUE9aQ8J7t3WQ8LPh7WZQ6ArO5X+RZ/dyLLS4JaWlF3RA40RpwPvc9hO+K?=
 =?us-ascii?Q?YrsVK96IrnME6WadoS+iyzhEAu/gFx/dff7E63YjgTPa9+Gwf1hli7Fd0fQv?=
 =?us-ascii?Q?mL4XVGO0oiSkqfrFVNfRfAJK636R6Hym/RQOda4EFDHa2V2XrKml/9T4mEF9?=
 =?us-ascii?Q?SSWApR1HQL57GUD546AIynhecHk9A3vu44m2e0wJ/k66BOJ5hZAW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 219388b6-e51c-4d62-6deb-08df0907c69d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 15:35:11.3654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ALTaD7L2cISSHZ7TXfKqJxU+XxS+5B1l5TJI+hAvk7Y7b+9ncdzuYtkDgNLWlnzp0VVXmVZt7edqzKvDPglsWaRm2x4OQR/B25kLrOYZKkUrrdL6a21VRbcgyX9jPO2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10898

On Mon, Aug 10, 2026 at 11:09:35AM -0700, Allen Pais wrote:
> Replace the per-channel descriptor completion tasklet with the shared
> dmaengine BH helpers. Client callbacks remain in softirq context while
> using the common scheduling and teardown mechanism.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/switchtec_dma.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/dma/switchtec_dma.c b/drivers/dma/switchtec_dma.c
> index 71d9868ce613..849f1f2f8105 100644
> --- a/drivers/dma/switchtec_dma.c
> +++ b/drivers/dma/switchtec_dma.c
> @@ -133,8 +133,6 @@ struct switchtec_dma_chan {
>  	/* Serialize hardware control register access */
>  	spinlock_t hw_ctrl_lock;
>
> -	struct tasklet_struct desc_task;
> -
>  	/* Serialize descriptor preparation */
>  	spinlock_t submit_lock;
>  	bool ring_active;
> @@ -584,6 +582,7 @@ static void switchtec_dma_synchronize(struct dma_chan *chan)
>
>  	int rc;
>
> +	dmaengine_kill_bh(chan);
>  	switchtec_dma_abort_desc(swdma_chan, 1);
>
>  	rc = enable_channel(swdma_chan);
> @@ -820,9 +819,10 @@ static int switchtec_dma_resume(struct dma_chan *chan)
>  	return ret;
>  }
>
> -static void switchtec_dma_desc_task(unsigned long data)
> +static void switchtec_dma_desc_task(struct dma_chan *chan)
>  {
> -	struct switchtec_dma_chan *swdma_chan = (void *)data;
> +	struct switchtec_dma_chan *swdma_chan =
> +		container_of(chan, struct switchtec_dma_chan, dma_chan);
>
>  	switchtec_dma_cleanup_completed(swdma_chan);
>  }
> @@ -832,7 +832,7 @@ static irqreturn_t switchtec_dma_isr(int irq, void *chan)
>  	struct switchtec_dma_chan *swdma_chan = chan;
>
>  	if (swdma_chan->comp_ring_active)
> -		tasklet_schedule(&swdma_chan->desc_task);
> +		dmaengine_schedule_bh(&swdma_chan->dma_chan);
>
>  	return IRQ_HANDLED;
>  }
> @@ -1041,6 +1041,7 @@ static void switchtec_dma_free_chan_resources(struct dma_chan *chan)
>  	spin_unlock_bh(&swdma_chan->complete_lock);
>
>  	switchtec_dma_chan_stop(swdma_chan);
> +	dmaengine_kill_bh(chan);
>  	switchtec_dma_abort_desc(swdma_chan, 0);
>  	switchtec_dma_free_desc(swdma_chan);
>
> @@ -1067,8 +1068,6 @@ static int switchtec_dma_chan_init(struct switchtec_dma_dev *swdma_dev,
>  	spin_lock_init(&swdma_chan->hw_ctrl_lock);
>  	spin_lock_init(&swdma_chan->submit_lock);
>  	spin_lock_init(&swdma_chan->complete_lock);
> -	tasklet_init(&swdma_chan->desc_task, switchtec_dma_desc_task,
> -		     (unsigned long)swdma_chan);
>
>  	swdma_chan->mmio_chan_fw =
>  		swdma_dev->bar + SWITCHTEC_DMAC_CHAN_CFG_STS_OFFSET +
> @@ -1116,6 +1115,7 @@ static int switchtec_dma_chan_init(struct switchtec_dma_dev *swdma_dev,
>  	chan = &swdma_chan->dma_chan;
>  	chan->device = dma;
>  	dma_cookie_init(chan);
> +	dmaengine_init_bh(chan, switchtec_dma_desc_task);
>
>  	list_add_tail(&chan->device_node, &dma->channels);
>
> @@ -1138,7 +1138,7 @@ static int switchtec_dma_chan_free(struct pci_dev *pdev,
>  	spin_unlock_bh(&swdma_chan->complete_lock);
>
>  	pci_free_irq(pdev, swdma_chan->irq, swdma_chan);
> -	tasklet_kill(&swdma_chan->desc_task);
> +	dmaengine_kill_bh(&swdma_chan->dma_chan);
>
>  	switchtec_dma_chan_stop(swdma_chan);
>
> --
> 2.43.0
>
