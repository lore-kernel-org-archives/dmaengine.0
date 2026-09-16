Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012033.outbound.protection.outlook.com [52.101.66.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D966D44A3F0;
	Wed, 16 Sep 2026 19:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789585637; cv=fail; b=VWRQOEGW1gEUKwVIV+dH94SQjS1WAp1KWNuYkiMd+ImkFmt/0C0PcvS9CaM+PpCES1WVao90qwW3WI1+pMs1IB8pFGPKHh6oL3/HYDQRxDpNmOUHKVIbPsK+tu9duWtZ/B7A4NDRH8TG6ALcVo5Bz3rRXHEBCLCu/tR5alrB2uk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789585637; c=relaxed/simple;
	bh=Ls31iUgXnDOSkGb4MgN6S5m0iYy9yvOswRQ7yE/hWlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Sqt2IT5H/OoO68jVsXt+P8S4YemxHBcYj45qaS22GAFB5gkO6NhEX5P1XgXzVfSrgfDD7Q3B0NEeiLIUNkS3fwrBrEqukZAaffYtgQ7r6Az33mTvE0cMtKZDwyBde+T47Fl09z4uGT0Xib08cP4u0J0UWjmE9YPv98R395yNlUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=p29lF4Vp; arc=fail smtp.client-ip=52.101.66.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="p29lF4Vp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OiP80uqgRCZLzTUzTe4Oy12UC8dQiCQpvN2Eizntf7rknWXh2ondkXKJMmSJWakZv6G7wPN4EY/P8mZIHm1jSC6r3L2EjVeThm/oFQ3+/QKHEpvRQis7/v69/hMBFU2S3j6bDJcO/UHNsBBLGbwUOWY+51x5KyPh55uzHmIBQSYKU3/0FgHoTzzkmtpEKZlwRf7xYLUcG/zO7oraXLT+tAKzrLC4Wp59O2ESM2CLwPPfNcv0rQo0xcYyJ9hUNII4xzjzj4ToD0+fHx3u6oOg8qyTgohKfkAjR/dl3snOvrwYAN9Xke4xswlNhpRLa9V7c93K7GJv/57m33K027VwjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+6oPOUM0bmnWYJbG1Mof+Wh27qPvw2VsIJfZ7dN9PA=;
 b=aNkLctih+qlL514FhD22YDuzEu1GRHDhUzITercl4zRkDnhbNNSed8MWawtG6xTuNdtC+/ZPZymL5S6R9GjoTB5LdY9ZVhWFxMCH1v6sityAAtG88QgKi6PV/nK71cJ2hLKTYu8mICgR5EEZf4ewrmOCzeG7hZHGH7aS+HylxyGqZtPLIn5UxrnRBa68JS1/mHx4OpyM6HiJwnnbInlNWzJ8IrNDN4xtVeH3BIXPJqP/V59n/VRrdtb+N5XzAiFtQVXv35z8cUol2f4SVmvp/7xXwcSmyb5FCpa0NRD6d8XzFGWi+msRdeAsIqeJimBt77RuWM4jVbc1AQBsi9oSLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+6oPOUM0bmnWYJbG1Mof+Wh27qPvw2VsIJfZ7dN9PA=;
 b=p29lF4VpOaYzDdvXpovuEuZBJr0OXpHRa1iu89x5MyIRyPX7LaHecGayfA6Da3CZfWK6ExA3UtTRtBQSX/vF7SJ6qF6unk8FdVGUez0LM84UtcCCTnL9fBRmNILB9JoC+06V7RXLtiCgGwrXexOZDQyrNRLuLswlhp3jYpL3XRr+8tDufKYg0xva7ovDzVfWSS0L8tqkDtV/N/fWlIWSrhiu5grzmA+fZU3YtvaMoD6hWepRK7meiGwcItEK/FRBprMryA1SERqruxSUyS2OdKLpjXk8N2hXcYnHGyE0lu4K8qNiQIVKS/ykmPjuSbRvTsOxeUrhDmqevNebF/u30w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB7621.eurprd04.prod.outlook.com (2603:10a6:20b:299::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Wed, 16 Sep
 2026 19:06:52 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Wed, 16 Sep 2026
 19:06:52 +0000
Date: Wed, 16 Sep 2026 14:06:41 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Saeed Bishara <saeed@marvell.com>,
	Lennert Buytenhek <buytenh@marvell.com>,
	Maciej Sosnowski <maciej.sosnowski@intel.com>,
	Dan Williams <djbw@kernel.org>, Nicolas Pitre <nico@marvell.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: mv_xor: use writel() instead of relaxed
 variant
Message-ID: <aqrowa1TFhIDA-17@SMW015318>
References: <20260916182405.12985-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916182405.12985-1-rosenp@gmail.com>
X-ClientProxiedBy: CY5P221CA0141.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:930:6a::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB7621:EE_
X-MS-Office365-Filtering-Correlation-Id: 341db3fd-d806-46b6-065d-08df1425aa9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|19092799006|376014|7416014|22082099003|56012099006|11063799006|6133799003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	s+Mhn+B/3uoKKXxcYURnCtbv2mlmwyORfLF8NBLnLV+im2I3jIsMA8MygsLeYOx8nFWAVoVU8M3rUaFSlS7qq0c6ALVMORP3aTVvO5/tte/C92IfH48nJMwasBzSdrLac7YNp/zKF8gHPlPvQxF5t7PWR9h4Og14Jgq4TTncesX3nrbuFDBIpCSLpRRTb5NBgjyzZMh1h1wMywCldMZBOCE66XQw7tqgjdC+4IlAB62bMTV24ZtS3W6j2n3v9LcC5W7m9K72QtqeZ42bFZ0Vu6TwkydtxJXL4RGeCcPxdlSpFnJnb5QiOBziNu5KgszloQdWx/U8KIvA5k3FgJFNSknCu1SXPOsjRZrV/fFqnfmh2cCXFktbn24RZUbT+X+vqEHqZcK/sTUyP9opEo0iJsBFQyneAahnDtSm1Gj0CY4Zr1PvjUpDxGdBHnsV6ylUQVcYXnv4fXoEyrxNppXy5X2IDhClM1GC7pfj/oDKTaBlxEu8e+vvwr9zj7ULlB5Wet2mySveA6EdBTwRR9IOXeBPdA+7W1T0EQ+abjfd27DSDwWnIEP0ejLZJAettOwkk6vjAfVPBZHUa6Ywjv8FSXbcgIBtvvDuP6RMkYDJOs1fwDlNV0p1sIsmODqybi3D+e3ON4XCvMu851VO6VdPwpzFj0P+t2r9jXAC7Rzxzk4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(19092799006)(376014)(7416014)(22082099003)(56012099006)(11063799006)(6133799003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5IsOIBP8pp2uN+e1R4z72OjPQJjhKUXdz9Z8hmBsQy6gqkkA23zHdpMI1s9V?=
 =?us-ascii?Q?1dX+MRwPGlX/S3sZsWa6dgeAdCjFmdl5LrYM5fsk0lbkbM2zFj/EhISbFFnp?=
 =?us-ascii?Q?M6P8ul982HExIuvPoBdqp64dZKJlk0vmf8Gki4vQshGupxIMshCZBQ8S9jy9?=
 =?us-ascii?Q?JV7FH1Oy69t1Csdu5Gn+SXgGRd+SFskXJHc+QDyOvuy7KiJlwKacFfJuVbe4?=
 =?us-ascii?Q?Ewb5CH+4qThhF2ZPzWEUm6jlODvfUqSU1iPTs9BriNgH62WL8FeprL/Toe3y?=
 =?us-ascii?Q?8GY4GMMGUq8f/jE0E2SgMNB83/QGPqJfZDEdjgdRa2mdD1pPBLOIdg7bFLZg?=
 =?us-ascii?Q?it50Q+BnYJaSqAaFlN5TTWuiGXYrDFN4LUPJ43jqjKWZtKqnfCKSqmioiV0E?=
 =?us-ascii?Q?wVa0iZmPtEnJrSan3PTqYuAPfj4B69r8EpzoYgXV/fMG6phqHCjuPnkWgFRU?=
 =?us-ascii?Q?wQ5TMzStFCMF6VRX0h7rFsT+YoVkzl6q0IPf6iVy0Wm/wM19p4SofJxgzkuk?=
 =?us-ascii?Q?XWlQQQSmnFgyDIiZ3jvwBTB7vY64lXhbJL2nDAD4zB1tFJ4+FxaWD4YyyuHK?=
 =?us-ascii?Q?s4xGXaS1iwFYeylZhQo0sd8X+lu3M8Zafv+LHhr16ocOEWHKTdiiZkX8tlPb?=
 =?us-ascii?Q?geEekKwSiygUYjQvtJdvr6ma2HB34QR9MhwLogLWVS8hh/BJKAqAYjmaZN7A?=
 =?us-ascii?Q?MC/Y9/qxlxLqxne/t/+Fvi2HeypuDiOfH05k0fKGnFqDcoYFsE4F/QjdCBxJ?=
 =?us-ascii?Q?tuA/QoWUwLOp3RcFf3ms85Qm4j1G+q+sK5vedLZJxNwxFjT77sVP4XQfRriG?=
 =?us-ascii?Q?YecSrdVsSO4dPc60+qZhGvEdBpZsLLvsRnlOB2XwJBnvCyiaI7u+KnNlWJin?=
 =?us-ascii?Q?tfPMOvX81UGzW+ldzZLfumewEpzej5lHHs7LPgJ4EB/Qg96Fe2ZHyORNUI82?=
 =?us-ascii?Q?8ZjSn/s42fn/1LSD7Ulbln3G4ZXyUYHbuhhcgXEs6HnV60hWf/t6J3KoVfYe?=
 =?us-ascii?Q?1SjabC+SWS7uGwFhz77l9JmvekGN8oUTrsjzPePgya9t6e8FzWQ2dKxmOJlw?=
 =?us-ascii?Q?M4ybHwsq0+3Hr/gEZPo7eK6lQqqDp2uWDG7nyKP9CQ/R6tOzM8iUxqWzbbnK?=
 =?us-ascii?Q?SlAUj73IrM8zipD5TW78NvAMggOs6WK/A16/EKVLgSq3j9g1cGHTKkPOCxrO?=
 =?us-ascii?Q?8RFH9vcTUAUyqZdvrC5yJ+zE0+sutcFMzgkiijAdES2Z64eHd6Fisp6vsl6A?=
 =?us-ascii?Q?B1PxfCVlyoR77xNtyNHHwn/xYBkkKErcPZuBv1i/NmyJigec14saiDZ81WGu?=
 =?us-ascii?Q?XYMXkB+x9v7gobjl7hA97mlMNrInnXaNZlx3nlzXfDk5VwCdMbKK49lGx3Of?=
 =?us-ascii?Q?gvRp0ZW2ZpXE1a3oz83DKcE8xwHwVE2wav6J3tyUbYK7WXcXr6NR76vaQCck?=
 =?us-ascii?Q?ViTyO+N7tUmscuoCwSpZDqBcYngW8pKd9Mu0YCwYpWENZhkXDkVtemAHylX+?=
 =?us-ascii?Q?aB5hpTxagnUDtKiANCg+ZsDvNszWs/qLeUevapDBDg3Ef0Y6v21KzWPvf4/M?=
 =?us-ascii?Q?nySq14DXhhDPvwfoZoM/AeT+5Lry/XCCq7UbI2vRQr15ZrMiX33s1C0kNSGZ?=
 =?us-ascii?Q?neQW+t2HumvlFbWl+3fq8hiqn96nzwB1rJtZgjDQuEbd7JYfCAH7yOIMdaLD?=
 =?us-ascii?Q?v/HA/Y0ZEJiVFSmnsnVEcoa9q2+jwpoWd/luPI4eTr+jXd+mF5DsNetUaObi?=
 =?us-ascii?Q?jGbo9oBgfC7KdWHdXErgNgeGaaeP2VhMHZeddswr9Yfm68osPhuO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 341db3fd-d806-46b6-065d-08df1425aa9f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 19:06:52.2140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mrM+Sep5fTCeWRQsT1D6WfxbTgkbS6V8OcmEZdGa27gDzOpbYWW9vYINcTVBHsBBRw0yktLd+mjf5WHgTvzEWaKDqz2CXC1DFRfMfU5DbCDHbZeKF6yEb3uLh053dsG3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7621

On Wed, Sep 16, 2026 at 11:24:05AM -0700, Rosen Penev wrote:
> Fix the ordering guarantees between descriptor memory writes and the
> MMIO accesses that expose them to the engine. The descriptor pool is
> allocated with dma_alloc_wc(), so writes sit in the CPU write buffers
> and must be drained before the engine is allowed to read them.
>
> Program the next-descriptor pointer with writel() instead of
> writel_relaxed(); the full accessor drains prior memory writes before
> the MMIO write.
>
> In mv_xor_tx_submit() the appended chain link must be visible before the
> busy-status register is read. Use a full mb() so the engine cannot fetch a
> stale chain link and stall the channel after the CPU decides it is still
> busy.
>
> Fixes: ff7b04796d98 ("dmaengine: DMA engine driver for Marvell XOR engine")
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/dma/mv_xor.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
> index c4e0dce3ca64..0de2b1ad5c30 100644
> --- a/drivers/dma/mv_xor.c
> +++ b/drivers/dma/mv_xor.c
> @@ -103,7 +103,10 @@ static u32 mv_chan_get_current_desc(struct mv_xor_chan *chan)
>  static void mv_chan_set_next_descriptor(struct mv_xor_chan *chan,
>  					u32 next_desc_addr)
>  {
> -	writel_relaxed(next_desc_addr, XOR_NEXT_DESC(chan));
> +	/* writel drains descriptor writes to DRAM before the engine
> +	 * is pointed at them
> +	 */
> +	writel(next_desc_addr, XOR_NEXT_DESC(chan));

I remember this my comments before, should be v2 version?

>  }
>
>  static void mv_chan_unmask_interrupts(struct mv_xor_chan *chan)
> @@ -410,6 +413,11 @@ mv_xor_tx_submit(struct dma_async_tx_descriptor *tx)
>  		/* fix up the hardware chain */
>  		mv_desc_set_next_desc(old_chain_tail, sw_desc->async_tx.phys);
>
> +		/* make the new link visible to the engine before we read
> +		 * the channel state, the device may fetch it at any point
> +		 */
> +		mb();
> +

The first is readl_relaxed() in mv_chan_is_busy(), all io readl and writel
is ordered.

which part need mb() here?

Frank

>  		/* if the channel is not busy */
>  		if (!mv_chan_is_busy(mv_chan)) {
>  			u32 current_desc = mv_chan_get_current_desc(mv_chan);
> --
> 2.55.0
>
