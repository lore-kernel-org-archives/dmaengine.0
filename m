Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011032.outbound.protection.outlook.com [40.107.130.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CF7429025;
	Mon, 27 Jul 2026 20:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785183150; cv=fail; b=RF8B2unGp0cuLQgm0/cA7b3UvQTsSI/Z0dJNMVDUwXsclqIJ8TCd2rn+TPs3Dk21XoSRHEtOd7L7AkZfQLR/6o7DuiiFfrK1T7lmMjgBBfjrQmxMlbH2cqwGR2sCLwNvr9N/PqOoYdys+DP6PsTJO47sv4nQ6eY2qjEn7ImhwNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785183150; c=relaxed/simple;
	bh=EZ1EOuId3PHmBWyBd5lUacPRG/f7/rrjrWMCl6Shtrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RI3BVoBDbFOME3a/Bd917DmCXmI9S06SX06C7Vu6JNTUw93nekecjAKxRJe1Dl9pjJ7alKfJYFDpJkaP7Nd6PlqKv8p6vFmYKKTP/nJyijgoNtEv3xsPyIEyFEVGaWA4eFgPsyZGoxPUmY6zcK8PLDVtUcRtX4iNCsP+cQTt2a0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cOzJFMpQ; arc=fail smtp.client-ip=40.107.130.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cOzJFMpQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vssRRPBwJeAEkaViEEekh5jtINok0EL21/EO5RhPq8wKHu6768Hl3TyfsBakm43UbLj9GSBrmGzgo+xzy9pLNPrG093Qwi07s4St/T5WZVhBrBeXY5MegkrRKMmCr+4AkV6axgDXnoIXaVzm61GOlxlISqcdW+t8xgmt/ywg8PI+6kHVglRmd772vT2XxczPl7RHeeez80/sIAZXY2o2eo3T9W3mI+j2UZrK2zXE/wKJfmF1Zm/ffan6IcsPQ1v/2lGvDlQFxomTxYvl8m5tpawESLuXRnxxPQAaIOTXamyuMiAdkeSZUX90MvvtoQgMN6N6HmTHqzNRpWz2q2WkUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+2mxCiCMF0JBbcp2SfD3JWnKvSz6dCbpbnKar6czSSg=;
 b=R96am5x/iQdjP8hH/3AzeD9j0Q4GX39cn/HGLM+CCKRTDnc5xpp7a7bDodMt6F5AIf2g6gx5cUqRxdc4N2x5iZM3I7p+xJX8DKQXR+23Y5rMW6m+KYkPR/VF5UylsZ2Ey1WZ7D2d0D+dwtrDuCh0RnmXyq6hn4GjtrBjUsSVzsCBRhYbCaMzaiIh2U3dKd79d6XfHAGnUJEh1tkge/UZkm7xzNIQd8sTQ3afrPB7+EenIiYb8Ame32SZC9ho76ClQLeIxnoB6ZMDag4bgX13Qbn/kRpAKQJV7g8e7F0ptvhEj/VvOSaQu6BYC1UMRYfhSr2bUo2a9MC8d9hy0VhDDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2mxCiCMF0JBbcp2SfD3JWnKvSz6dCbpbnKar6czSSg=;
 b=cOzJFMpQoDPECR9dFtitzsPI6ZcYi91uqwODmGx3s68v4G6nWwac9JVc0makeS6ZfpvhF9TDHV25meCtTk//CoK9+/oirXjucBsd+wo7ivKrc6ywgYXC8KHg+BZowejoGSefPO9qlovQaVkBp+eZ7C8Pe+Gv/T56Z4f0a4mYRod/br5TlwM09hvtTgCEPHUK99/qFiaMcoQvjnn764RnHw3oTCSmL5ZrFnFeztR5tmaAedTww5IZEeHJzFmViWTL0f/uSfpFidly6qb6c/Yp6Iz1NnaKzpAL+Pdr08ikTSyHCw6KONtkY8G93s8is65dm7t5yZxw2qD7W4ElffMk0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB7005.eurprd04.prod.outlook.com (2603:10a6:803:136::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 20:12:25 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 20:12:25 +0000
Date: Mon, 27 Jul 2026 16:12:17 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
	Kees Cook <kees@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Christoph Hellwig <hch@lst.de>,
	Serge Semin <fancer.lancer@gmail.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Niklas Cassel <cassel@kernel.org>,
	Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 09/24] dmaengine: dw-edma: Prepare deferred IRQ
 reporting for LL events
Message-ID: <ame7oQVMFF0_69I4@lizhi-Precision-Tower-5810>
References: <20260727170323.2321369-1-den@valinux.co.jp>
 <20260727170323.2321369-10-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727170323.2321369-10-den@valinux.co.jp>
X-ClientProxiedBy: SA9PR13CA0149.namprd13.prod.outlook.com
 (2603:10b6:806:27::34) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB7005:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ea5602f-a563-4a91-bd2b-08deec1b5ffa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|23010399003|7416014|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2NMS1zNgazWEFm/XqODxvU2cb/uXP4aBozhKPBg44E/CNuzalczxuk2z6V/7Y8l+3PEj++hdkqtL5VFzw1rspurQSOcyzyMqeulqx9Y35LBtb5Kw9/FT/geSVk6u+ptu5HWKwvfCGwAoQy6UhGZGoXvGLyxvFiFz9jbm5qDxbODX0eGBaPWMTrWJgLMG8yHHzZD4UE/SSz12CcAM7olqA+UNppAnkRAVWDduVmWorbqRdf5Hi0rrdrOYrv2EICLY24YWSlePlIEuL9dem9pG47++ezvYO/0fYFSlJHXeLdRrdmp1O2deme7+9FHZwAIimzQBjT4+4dnqCe7FUn8eaWsR0xe1vSIOU4u0tKhRBdHH//j8t1vKlYNlT6Li15P6hsrJUfOtSSJ/2rOu2EpvfK9nROTBaC8kyMHPJ6x7BO/T3aOd7JXDjf3C8hpWfjwImolJjPtbmQzhLKLyYAO0v7Ybd8dbKb/FVAey6tPP8nHcIVu5mZI1YKInTyulf+n2EzxX4pHmPybqTs9jbJ8v8jo1ew5s9oF8a1N3IrFt6Q4zw52yxeuinGaIV08E2U+AHU4xOtVLwqGOn3kKM6uL9QsS5F612cg9qll+46P+PndM+qVhhiTrWbUa5/E/En/Ygfdn9qAksqXFsvuLE9Gp+t/Xt5EKs95yi4XKZJES4Yw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(23010399003)(7416014)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TLuNR27JFGGMPeGMSR/E5988inuyNRVKHAB3+TqwFtZGFO/aQ7Vxn4RMX44k?=
 =?us-ascii?Q?BmzhkbY29lvsq8Rm9xWZ57l8DDDqAJzh2WIBbdCGzq1U3covyuTDsiEruvkx?=
 =?us-ascii?Q?JGmT50QkctuUWDLZPvN0b3rPgScCREiwa4Z16xotoN74XMKeFDtdkTBH59T+?=
 =?us-ascii?Q?SD9+wnLRwZfO0Kiy8p5GmXJxXw+8n9hJ5YXLZ60GhTrgjingT0mWgV1r9dQI?=
 =?us-ascii?Q?Uif42TfhR758UVmwasa4/9fVotcOGhq7s4ZVGDBxHYmuL/B0hxNYdTHSd+ee?=
 =?us-ascii?Q?RK05mGA2PMcl6Pbe49sKUYvA/wyXf92q23lJIrzIHJ9+rKf25fP2YHpoAiF7?=
 =?us-ascii?Q?m5VcVxBbo9drfzO1yR07WiTqOznheCS8ZwqK4bUgnOriESEAhQq4MarmyTFy?=
 =?us-ascii?Q?jSnT2gyRhkULLlHrWnfZ50XaBaxYRo9WCv7d6p0pU5YtyFDfCXlw35VrmG8s?=
 =?us-ascii?Q?MHtQ2M6TM9RymgPMNkzUXnwnWmIlZJ02utHFMz5uTtjvrB8ORT5XgeAaQ4S1?=
 =?us-ascii?Q?+EpO4NSyGEKo9wflluOF0EW1fEuF4L+zGuEl4F/YowVtmB0tN56ZHiqNA68t?=
 =?us-ascii?Q?uoQWQpuHSyDOfJ2z10QRncGRjiLgQH78ymraK9T2zMWHETggHdhGpx/2hUCO?=
 =?us-ascii?Q?DPvwTOsyP7OxPv8w/mLrhBv7skZEnI8CKFgWg9zYBWclrDPNq/wLOK/3wa80?=
 =?us-ascii?Q?+/KeU2bfjAOYU+0ikwqWWvyL1WACMejXFDHbdW7fcjYmqC9aGrG88wUyWWU2?=
 =?us-ascii?Q?iBJ95dO5kN0ySyde0sBI0f/UfDMejEqG5YH/34z7rEFgO4mP2MbKReTyEY++?=
 =?us-ascii?Q?O8q/whQIwOb7DSxFyVPGEVyTENLl5ffcrRbaA/NdBkT5S/xU1n3Kv/HhVEWg?=
 =?us-ascii?Q?IWZFFcFzKdUqmKr0ypYBqajxXsK0w7sX5TNn4cEamaiJ/ebNVh0iOuud3r/s?=
 =?us-ascii?Q?aJM+86YbQCTBTpIlxdIFZSQgcQU48wVplMicNwMVGrktxaOtsVPZuUaDvClp?=
 =?us-ascii?Q?ggjF9PqNfzRAGWlkaY9/7xjHF7RXZ07EX2EzP8wQBlOyJ+s02f24wKoDDzV0?=
 =?us-ascii?Q?TvAKbdtKMezQx4CHfA0WJPV3oGEvS/DsnxQc/VctEm76Yhk6f+PQ2g46paNh?=
 =?us-ascii?Q?NPAUWk+nLGlDfSeff8JrjhFJf2j1eOcUldj78iLqGc07WYdegjAobh/RBWVP?=
 =?us-ascii?Q?LDnjKRQNBac457yUm7kHhzd4PTSJPCq8DroNhIYe0hiBl/U/5pXAFTMC71Ee?=
 =?us-ascii?Q?oHSiEOLgMBQhj7TG4iZn87Dm+KF3DuVS+5acjTYk/DuZO9KDVKkOS33qpQcE?=
 =?us-ascii?Q?PlBZJCfoJXUT5blGKontVOkkaFbM+WAFNDsnqBCm5jT9ISa6kHHFLz1hvLuL?=
 =?us-ascii?Q?Ks1dcFE+VI31z0UL8bUcYRo1YBGNYXUz49yWASGAc67gSstAXYQDYsmpA66O?=
 =?us-ascii?Q?SYoBikPG66F5+wjeP60EE52jy2KOGJPvsqZpxg6B76w03T5iJIRWhJc75MDh?=
 =?us-ascii?Q?z+cAndmHWoD5yzHLPLVh4VIuvpaOFCuhANFtw+V6MqJNBMMQKcpqagMQ8feU?=
 =?us-ascii?Q?IvkZqgyelLPSTz5tKJicRcnrF/J61sS1TvJlGFX3GJ0+2FCztfaOSZ+E3TTG?=
 =?us-ascii?Q?QA71VOXiL0RcBk5ebsoLM0ZGLT/N3kvHyCqa3W4MRI/8x33wt8YOR3nS0mZu?=
 =?us-ascii?Q?RtiQAYTIGdZMgfvVjs97FkhUPHCgipYFivg9VRPwqxYMpO+bc5oOIj0RS3nB?=
 =?us-ascii?Q?i2cWFthpQxUzNgYzqfSDl5vMGVpfvGg2q8p9wYTETLBa6U6dwS+z?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea5602f-a563-4a91-bd2b-08deec1b5ffa
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 20:12:25.2935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gIK/xWxRnwLzsEz6zQ0dkha6gzgEsGMH3Ujk1IcF7hHKjrs2kH5fFxEvj86anq7iRS22qCn55q3ituyjFp+JQ2/w+IYQQiqgCrr82S3WpEZtzBvKVmtNlmRQq3fetLhp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7005

On Tue, Jul 28, 2026 at 02:03:08AM +0900, Koichiro Den wrote:
> A later change serializes status capture, interrupt clear, and event
> recording against channel restart. It must also publish all causes
> observed for a channel in that critical section through one callback.
> Otherwise, the deferred worker can consume one cause before another from
> the same status pass is recorded.
>
> Replace the DONE and ABORT callback pair with one callback carrying an
> event bitmap. For now, map the bitmap back to the existing deferred DONE
> and ABORT work, so behavior remains unchanged.
>
> Also split DONE handling into a lock-taking wrapper and a vc.lock-held
> body. The later LL event path needs to validate its recorded event under
> vc.lock before running the existing DONE state machine.
>
> No functional change.
>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v3:
>   - New prep patch split from the LL event/restart serialization change
>     to keep its functional diff focused. (Sashiko)
>
>  drivers/dma/dw-edma/dw-edma-core.c    | 44 ++++++++++++++++-----------
>  drivers/dma/dw-edma/dw-edma-core.h    | 16 +++++++---
>  drivers/dma/dw-edma/dw-edma-v0-core.c |  6 ++--
>  drivers/dma/dw-edma/dw-hdma-v0-core.c |  6 ++--
>  4 files changed, 44 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index b84aed59bf77..bb57f2d39d1c 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -702,17 +702,16 @@ dw_edma_device_prep_interleaved_dma(struct dma_chan *dchan,
>  	return dw_edma_device_transfer(&xfer, dw_edma_device_get_config(dchan, NULL));
>  }
>
> -static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
> +/* Must be called with vc.lock held. */
> +static void dw_edma_done_interrupt_locked(struct dw_edma_chan *chan)
>  {
>  	struct dw_edma_desc *desc;
>  	struct virt_dma_desc *vd;
> -	unsigned long flags;
>
> -	spin_lock_irqsave(&chan->vc.lock, flags);
> -	if (chan->status == EDMA_ST_PAUSE) {
> -		spin_unlock_irqrestore(&chan->vc.lock, flags);
> +	lockdep_assert_held(&chan->vc.lock);
> +
> +	if (chan->status == EDMA_ST_PAUSE)
>  		return;
> -	}
>
>  	switch (chan->request) {
>  	case EDMA_REQ_NONE:
> @@ -751,7 +750,14 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
>  		break;
>  	}
>  	dw_edma_core_ch_maybe_doorbell(chan);
> +}
>
> +static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&chan->vc.lock, flags);
> +	dw_edma_done_interrupt_locked(chan);
>  	spin_unlock_irqrestore(&chan->vc.lock, flags);
>  }
>
> @@ -793,20 +799,24 @@ static void dw_edma_irq_work(struct work_struct *work)
>  }
>
>  static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
> -				   enum dw_edma_deferred_event event)
> +				   unsigned int events)
>  {
> -	atomic_or(event, &chan->irq_pending);
> +	atomic_or(events, &chan->irq_pending);
>  	queue_work(chan->dw->wq, &chan->irq_work);
>  }
>
> -static void dw_edma_done_interrupt_deferred(struct dw_edma_chan *chan)
> +static void dw_edma_record_irq(struct dw_edma_chan *chan, unsigned int events)
>  {
> -	dw_edma_queue_irq_work(chan, DW_EDMA_DEFERRED_DONE);
> -}
> +	unsigned int pending = 0;
>
> -static void dw_edma_abort_interrupt_deferred(struct dw_edma_chan *chan)
> -{
> -	dw_edma_queue_irq_work(chan, DW_EDMA_DEFERRED_ABORT);
> +	if (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_PROGRESS |
> +		      DW_EDMA_IRQ_STOP))
> +		pending |= DW_EDMA_DEFERRED_DONE;
> +	if (events & DW_EDMA_IRQ_ABORT)
> +		pending |= DW_EDMA_DEFERRED_ABORT;
> +
> +	if (pending)
> +		dw_edma_queue_irq_work(chan, pending);
>  }
>
>  static void dw_edma_emul_irq_ack(struct irq_data *d)
> @@ -906,8 +916,7 @@ static inline irqreturn_t dw_edma_interrupt_write_inner(int irq, void *data)
>  	struct dw_edma_irq *dw_irq = data;
>
>  	return dw_edma_core_handle_int(dw_irq, EDMA_DIR_WRITE,
> -				       dw_edma_done_interrupt_deferred,
> -				       dw_edma_abort_interrupt_deferred);
> +				       dw_edma_record_irq);
>  }
>
>  static inline irqreturn_t dw_edma_interrupt_read_inner(int irq, void *data)
> @@ -915,8 +924,7 @@ static inline irqreturn_t dw_edma_interrupt_read_inner(int irq, void *data)
>  	struct dw_edma_irq *dw_irq = data;
>
>  	return dw_edma_core_handle_int(dw_irq, EDMA_DIR_READ,
> -				       dw_edma_done_interrupt_deferred,
> -				       dw_edma_abort_interrupt_deferred);
> +				       dw_edma_record_irq);
>  }
>
>  static inline irqreturn_t dw_edma_interrupt_write(int irq, void *data)
> diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
> index 95bd4bf47ea2..6b0d475bb8b5 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.h
> +++ b/drivers/dma/dw-edma/dw-edma-core.h
> @@ -41,6 +41,13 @@ enum dw_edma_xfer_type {
>  	EDMA_XFER_INTERLEAVED
>  };
>
> +enum dw_edma_irq_event {
> +	DW_EDMA_IRQ_DONE	= BIT(0),
> +	DW_EDMA_IRQ_PROGRESS	= BIT(1),
> +	DW_EDMA_IRQ_STOP	= BIT(2),
> +	DW_EDMA_IRQ_ABORT	= BIT(3),
> +};
> +
>  enum dw_edma_event_scope {
>  	DW_EDMA_EVENT_PER_CHAN,
>  	DW_EDMA_EVENT_PER_DIR,
> @@ -152,7 +159,8 @@ struct dw_edma {
>  	const struct dw_edma_core_ops	*core;
>  };
>
> -typedef void (*dw_edma_handler_t)(struct dw_edma_chan *);
> +typedef void (*dw_edma_handler_t)(struct dw_edma_chan *chan,
> +				  unsigned int events);
>
>  struct dw_edma_core_ops {
>  	void (*off)(struct dw_edma *dw);
> @@ -162,7 +170,7 @@ struct dw_edma_core_ops {
>  	enum dma_status (*ch_status)(struct dw_edma_chan *chan);
>  	enum dw_edma_event_scope event_scope;
>  	irqreturn_t (*handle_int)(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
> -				  dw_edma_handler_t done, dw_edma_handler_t abort);
> +				  dw_edma_handler_t handler);
>  	void (*non_ll_start)(struct dw_edma_chan *chan, struct dw_edma_burst *child);
>  	void (*ll_data)(struct dw_edma_chan *chan, struct dw_edma_burst *burst,
>  			u32 idx, bool cb, bool irq);
> @@ -262,9 +270,9 @@ enum dma_status dw_edma_core_ch_status(struct dw_edma_chan *chan)
>
>  static inline irqreturn_t
>  dw_edma_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
> -			dw_edma_handler_t done, dw_edma_handler_t abort)
> +			dw_edma_handler_t handler)
>  {
> -	return dw_irq->dw->core->handle_int(dw_irq, dir, done, abort);
> +	return dw_irq->dw->core->handle_int(dw_irq, dir, handler);
>  }
>
>  static inline
> diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
> index d497d36f5b28..d883ca446f5a 100644
> --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
> @@ -336,7 +336,7 @@ static void dw_edma_v0_core_clear_abort_int(struct dw_edma_chan *chan)
>
>  static irqreturn_t
>  dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
> -			   dw_edma_handler_t done, dw_edma_handler_t abort)
> +			   dw_edma_handler_t handler)
>  {
>  	struct dw_edma *dw = dw_irq->dw;
>  	unsigned long total, pos, val;
> @@ -375,7 +375,7 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
>  			continue;
>
>  		dw_edma_v0_core_clear_done_int(chan);
> -		done(chan);
> +		handler(chan, DW_EDMA_IRQ_DONE);
>
>  		ret = IRQ_HANDLED;
>  	}
> @@ -389,7 +389,7 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
>  			continue;
>
>  		dw_edma_v0_core_clear_abort_int(chan);
> -		abort(chan);
> +		handler(chan, DW_EDMA_IRQ_ABORT);
>
>  		ret = IRQ_HANDLED;
>  	}
> diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> index b181603bf2c7..afc2f24fecd3 100644
> --- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> @@ -174,7 +174,7 @@ static u32 dw_hdma_v0_core_status_int(struct dw_edma_chan *chan)
>
>  static irqreturn_t
>  dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
> -			   dw_edma_handler_t done, dw_edma_handler_t abort)
> +			   dw_edma_handler_t handler)
>  {
>  	struct dw_edma *dw = dw_irq->dw;
>  	unsigned long total, pos, val;
> @@ -200,14 +200,14 @@ dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
>  		val = dw_hdma_v0_core_status_int(chan);
>  		if (FIELD_GET(HDMA_V0_STOP_INT_MASK, val)) {
>  			dw_hdma_v0_core_clear_done_int(chan);
> -			done(chan);
> +			handler(chan, DW_EDMA_IRQ_STOP);
>
>  			ret = IRQ_HANDLED;
>  		}
>
>  		if (FIELD_GET(HDMA_V0_ABORT_INT_MASK, val)) {
>  			dw_hdma_v0_core_clear_abort_int(chan);
> -			abort(chan);
> +			handler(chan, DW_EDMA_IRQ_ABORT);
>
>  			ret = IRQ_HANDLED;
>  		}
> --
> 2.51.0
>
