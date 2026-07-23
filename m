Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011052.outbound.protection.outlook.com [40.107.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CB13B95E7;
	Thu, 23 Jul 2026 20:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784840192; cv=fail; b=gCuRGA8F5+iDU/4sdpOm3V4JMPwJ8/P3Vu74eaA80NCTTmU6lC7HP3S6tvwiAa5fdmnLiSfrM+2V7xnDIVHY2RDckJgGGfzSu/MvDhCTX1/WMq0hC58lchJKIzRwMpcZKjPKaYWp5nfSjhTRGeBO+bSuFFOIQO1srTeUX2CxMYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784840192; c=relaxed/simple;
	bh=yQSjdzN6bJPsfwuxR29O4Cj+jIU4F8YhmI9BYXQ/k3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DRpd8xJsFG2S/A+BFAY5RzMEYMt+wu+nIilbIViYroahLHQ8R6bz46+3+9L6B8A265uPq6FQnxBXjPOCDS8l4tfnY9yVAkbMoKVcBCPeTBKEsYXaViebaQJwC21eHUYkOpEIXtJiWiss9iicsHgJfD7pxKQhhGin1PHuALoq+EQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VGTAmA5R; arc=fail smtp.client-ip=40.107.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VGTAmA5R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cds5taG/+SJ/UzggNoDwCG5QSe2+t946tykhXWpl/qkolGpzDzpu5qX4Iq7GUtc8J+ROeBGiI5sWzGP17q3AIxKYWmhWg0B/cjYqp7WmIeny2e+E00cnHQ7isj1IDmvmFecLdqVwHtUGwZLWZApamQ02qPgaf98wPl77FlY27C00ar0EaGCsVWjr7EiEvxYW/xSt/UEmaMwDMbl6uBsAopv86Xdh5jWlvjPCnY5fRs7ORHbqYl7x+g1gcdQbT4LtQeJHz2SoBbTCAMjBM1tO+Z++NZCZceHl8nbwF76hUeJPBNnavoi7RtqXdgtflgJG5wDgWHTtalZvVI7izQ27aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qaw4X5JMG5qvMyn2tXIor35518OAcMTHihSwcfo1TGw=;
 b=aBtfwN2x/HcRCB+YJ+bIclbKHoeuut/PEj0P7fmoNf7iMMmqrpBcJ6txkHjojKuCTEQSIn/fgRW38KGC3vdWSSa0E4Znzc+1GZg4Bi7XmGZZkcCG+9EG5uZ8nyHl8fJqNbzA02y/5SJritZ2bXmhKXSydzTDeimdlqprLMjVvX+S3/g3m2vfX/YRo2knr+ponwxJRBIquQpJQp/JD2cfUN9wCsaQgDCY+BGPU4uHc2V7XS7uupZYX+EAEIbl6bpslqDkk/AsWj7d6X/wD+iX/kGkIHkBvlM3qxaXEbSwF9UQ2joGVirBrZpbujL2kA/lu0M82k7xN+zHvSGtERC5Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qaw4X5JMG5qvMyn2tXIor35518OAcMTHihSwcfo1TGw=;
 b=VGTAmA5R4/RVVaflgZwGUvpDzZ8v4W2EHEnlJ3kz/rMeiu+R+oJmUhuIUlk/U5YQYZkm/r32JI7WItrz7AvGI6nCEGqYKoCFi8WEmIomfJw1kdgapWsL6xO07MAJdJqaXRqfbMta8fX0xKkvdQM7IQRC8dvHUGl6MkUOyaK9KK2yTBwwpcqC0xHDJtPta4/6dWbU9j+e/1xwhBu721eiYJTHSFxWLb14JXuEIKkLQ/8zau4i2BLootmRLi54RQNZMCUmi2Bx7nT7YP2ccBaHLVW94Bk76zpYWPPIuq1L6BFfjZP+2wMU4MWPH3zIpZJ3ShWWGgDGNkyGC9NJzN72Gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB8027.eurprd04.prod.outlook.com (2603:10a6:10:1e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 20:56:22 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 20:56:21 +0000
Date: Thu, 23 Jul 2026 15:56:10 -0500
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
Subject: Re: [PATCH v2 09/19] dmaengine: dw-edma: Reclaim issued descriptors
 from IRQ-paired LL progress
Message-ID: <amJ_6jurELEeuMDt@SMW015318>
References: <20260723084150.521366-1-den@valinux.co.jp>
 <20260723084150.521366-10-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723084150.521366-10-den@valinux.co.jp>
X-ClientProxiedBy: PH7PR17CA0058.namprd17.prod.outlook.com
 (2603:10b6:510:325::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB8027:EE_
X-MS-Office365-Filtering-Correlation-Id: bf26f279-a9fc-434e-4ef6-08dee8fcd9a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|366016|23010399003|6133799003|22082099003|18002099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	rY1AEbRHmViiQmnZFpyEsUNwXrRXGnXv/i/f1BGmohL2w+E5OsGwd7f8yduEQzT2T+rUQjMiG36nbIowjT+LGV9B5SATSwfpayBA7CK3B0gGEONAOYWZNFJvvSUoIa4/SQ6DP6JwRXxVYI/DsqyH/MFV9g/nJI5TrN8XzvT72LmjcfXcCHv9kpf7R8pe6vR2nwdzrbdbZSPPkKVSYpEbEmYZvjMD3t06tap7QeG690N0h7zpYwAFtPl+PZQq24GKzLGZqVC8wyHhU7XyN7FKIcDtdCNxaqBw2hSKBXn/T5yY9FdHZBIl5A3mcGqllyeLhD629XTzmgv7zdkzXvTfYa5gv8erJVqY0qGYW2ZusaqZqG2U1Q4ggRzZ/Zc81h/VEELF5K4U8OTv20MuUTLzLR1Q2Jj2GgubxtbmSikciN6pPOy6GzQdXv88fhEIHMy02/hJ8zq3Q4o1xk0TiUof/SrOndzYruQQuN4p6MW70tirOnUZL1X93Y1u/M6uHqOW2RUdfeguYQedrfXWq9zsPBS1M/lC6ElzOx3RXLVjvgaEyjhJoxaUWGlXnArBPpjRv03SpxcZKMJ7sHJVxxBo6e/0XdAg0FU8GM2F2QuRBUlERHPRCXORGJFMm90xcgwTxW0iA+ADJTnk8R3MD1WXH+wrDAvOy4TKceXlk6EwyHQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(366016)(23010399003)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RTphOPOObA93/SSGeTK2oDqOWQaYlf19Qh3vFcLcNjWd3rhRGfZQ4KnmRweC?=
 =?us-ascii?Q?uKbCNE9eXOrnEDxeYERJ0+kM3xGLx1wyzP7c570Ax6T3FC2a2pRAJMJoAD7C?=
 =?us-ascii?Q?RWtzrU+Uy9ACIUT5tu9b4indSgqpTzTApMCuULl+ZIdjqCl63L44TxEna9KC?=
 =?us-ascii?Q?QPzXA67aq5rimibFOvmdViBRkO7R9BOqaOBLEtdyyujwzRnb3e0eAm08hbce?=
 =?us-ascii?Q?zy2V6CbPX1G7JK3Web3sSdLrsd2GfcD54eL5zyJdO8Jp2wnha7C7twZMWEJ8?=
 =?us-ascii?Q?VG0PBybqg81Ci4R3ARgs9lb5+lrTY2ukUN0tDxSrA4SyPOk27EmcyvqEBklz?=
 =?us-ascii?Q?svRbGwrl7Y8RQMIOXBEqeswV7Va6In329W6YmHgK2A598OKLqRAkeG5YjAdd?=
 =?us-ascii?Q?t/2f9m+ILZ4tfuyhiGaup5NeMe0WJbuLmlZFdBjLOGd3XhCMqgYCgeKeoMuH?=
 =?us-ascii?Q?BsF3YdWcwrlP0BFCMJZPhq6R0cfpX2Y5L+BYsjaMtio7OSvtJaSs0nVUuLYL?=
 =?us-ascii?Q?HTWJ4jV0Om13FEkpFstC1ZHLPRsdQlhTPJ3AHXed4nTCMzUg3RtM2jTkcKo2?=
 =?us-ascii?Q?X5eR0fhiIiOG6dwrLEgLOQoGNaN3y4Lm6czAEdO1YTBso+KDPJfZ8aKz+gq2?=
 =?us-ascii?Q?EMMMHKfaEDSzwd44Os8V3bD0d2egDGaeUIsAP205VmaJ4gUW3srNZoOUL1fM?=
 =?us-ascii?Q?56nmgEiMP1dVU1IjDLCLLzSJ2tbqk19dXbezjYrj/V2kdlPhxLrZUx1ag28g?=
 =?us-ascii?Q?EWj1RBRTgSGE6/136F/QRnUvgUws0ybt61j5I1na0Ee8+K0Ma4cIQppRTY9w?=
 =?us-ascii?Q?vScbgkVr7jmLxzIQvkzjsXI4XiFyX6MWHyEhxLuRXExKsr/IWPOVMAfifelg?=
 =?us-ascii?Q?ekd2/uxNPPudNcTQjJ/XEwSgGMh7w3CNhLEtbVxC00A6AtXSZEbGShdsbzdN?=
 =?us-ascii?Q?VFGejOwKx51NsawJYnGAdQCUISK4lHbRobXekQTo2bsZFJfwfJplc5AA+Mui?=
 =?us-ascii?Q?PL606taDNxIygnRbUm9tHDK8G71/VR4MDPY9YFSCJa8tubVSbWJNOT7tFsc6?=
 =?us-ascii?Q?cRy5OPyP2cUqTqIS7q9I4TvOvbJapOP/0zLS+WxAnoCeubf0tM7rcS/PQhmM?=
 =?us-ascii?Q?243pl2mdtaYUkdIMkTmsgw2c3NeVDjI4nwOKE7BMnVhnaInUBxIFty+UnQ4D?=
 =?us-ascii?Q?ujQNgHUV9jPdBZw17IgIkhr/cU+2+olCxA8/VK3dWGdTUlgkjMGZvxIN9igy?=
 =?us-ascii?Q?M+IDAwWt90RxT6FWldo/S8ih6OD384X9V/UidytUyBq7VaQo3Cycp+1PsE0k?=
 =?us-ascii?Q?5SrgbS/679+dA3H8sy4DxiM0JAjpzealvS+5B8N8GH34BGhaw6VzXCOTFlhc?=
 =?us-ascii?Q?4F4N4BudKwKwPEarlUhWW2Cn4r6hdkLsr7g/C6uK3RvRMry8Us8xRdhLMLGX?=
 =?us-ascii?Q?+fbsZ0kgfd0Scs21+9e0uFhosDBWSaGOyq3javaJZAwe5gOhVVDzFPB+Frkz?=
 =?us-ascii?Q?bOWVDlHqjJL/VMYDfhGkPzKBOU2aCcgg5QJH2cRYVFCTWEDXulWkUTa9uUvO?=
 =?us-ascii?Q?ZdeZ8Hlm5//JjVvNRc3IjIK20RpFTKY/McxRiGKHLNFO9W3uyHqN/U1Y9D17?=
 =?us-ascii?Q?fIHT74TNr4MWYNFhYhJ/1ygAndpzYlrhwsqKxSl5FhubZWvxodJgRnfJgSB2?=
 =?us-ascii?Q?VankYqvyIsW5uQe10C4Y20tWvo9vIm/Ehz/B4j08MeghVPYyVoJSBobMtFex?=
 =?us-ascii?Q?uNjdGbzUK3pFbtfZ4fySrSNj3+lUkJxIEOEO5+vnvL4ibwS7HIVY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf26f279-a9fc-434e-4ef6-08dee8fcd9a1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 20:56:21.7228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VUPMk2sM+DYJlBiG++xwUfLow8HrjhbbcRO0sV2HlXBZmj79PExG2lHgUhKNC8qAeTCi6tyvysDhW3ZD7tq8v0rLMT0xgx1SVdkoZHrPJ7ns3ZjqzB/koCFbF5QuZnVE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8027

On Thu, Jul 23, 2026 at 05:41:40PM +0900, Koichiro Den wrote:
> Dynamic append can put entries from several descriptors in the ring.
> Track the consumed boundary in ll_done, reuse consumed entries, and
> complete descriptors in issued order. Keep one data entry free so a
> physical index is unambiguous within the active producer window.
>
> Sample DMA_LLP in the hard IRQ under vc.lock after clearing status, then
> normalize it to the exclusive boundary used by ll_done. A deferred read
> could attach progress to the wrong interrupt.
>
> A stopped sample points to the next entry. Keep a running sample one
> entry behind because legacy eDMA fetch can advance DMA_LLP before payload
> completion. The following HDMA watermark patch uses the same conservative
> boundary. Handle EDMA_REQ_STOP and EDMA_REQ_PAUSE even if progress empties
> the issued list.
>
> Suggested-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
> Changes in v2:
>   - Replace ll_end completion accounting with ll_done progress tracking.
>   - Sample and normalize DMA_LLP in the hard IRQ; v1 read it from deferred
>     consumers.
>   - Use the raw next-entry boundary for stopped samples and keep running
>     samples one entry behind it.
>   - Handle STOP and PAUSE after progress empties the issued list.
>
> Frank, dw_edma_ll_clean_pending() is based on the idea in your RFT,
> although the implementation has changed substantially. Please let me
> know if you would prefer different attribution other than Suggested-by.
>
>  drivers/dma/dw-edma/dw-edma-core.c    | 248 ++++++++++++++++++++++----
>  drivers/dma/dw-edma/dw-edma-core.h    |  32 ++--
>  drivers/dma/dw-edma/dw-edma-v0-core.c |  10 +-
>  drivers/dma/dw-edma/dw-hdma-v0-core.c |   4 +-
>  4 files changed, 250 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index e88bfb417ad4..44a0ff906f2f 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -51,13 +51,6 @@ dw_edma_alloc_desc(struct dw_edma_chan *chan, size_t nburst)
>  {
>  	struct dw_edma_desc *desc;
>
> -	/*
> -	 * For now, a descriptor that does not fit would stall the channel
> -	 * forever: reject it up front.
> -	 */
> -	if (!chan->non_ll && nburst > chan->ll_max - 1)
> -		return NULL;
> -
>  	desc = kzalloc_flex(*desc, burst, nburst, GFP_NOWAIT);
>  	if (unlikely(!desc))
>  		return NULL;
> @@ -73,6 +66,12 @@ static void vchan_free_desc(struct virt_dma_desc *vdesc)
>  	kfree(vd2dw_edma_desc(vdesc));
>  }
>
> +static void dw_edma_ll_irq_idx_discard(struct dw_edma_chan *chan)
> +{
> +	chan->ll_irq_idx = -1;
> +	chan->ll_irq_stopped = false;
> +}
> +
>  static void dw_hdma_set_callback_result(struct virt_dma_desc *vd,
>  					enum dmaengine_tx_result result)
>  {
> @@ -103,7 +102,8 @@ static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
>  	u32 i;
>
>  	chan->ll_head = 0;
> -	chan->ll_end = 0;
> +	chan->ll_done = 0;
> +	dw_edma_ll_irq_idx_discard(chan);
>  	/* Drop stale CB bits before reusing the circular LL ring. */
>  	for (i = 0; i < chan->ll_max; i++)
>  		dw_edma_core_ll_clear(chan, i);
> @@ -116,11 +116,26 @@ static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
>  	chan->ll_valid = true;
>  }
>
> +static u32 dw_edma_core_get_ll_dist(struct dw_edma_chan *chan, u32 from, u32 to)
> +{
> +	return (to + chan->ll_max - from) % chan->ll_max;
> +}
> +
> +static u32 dw_edma_core_get_used_num(struct dw_edma_chan *chan)
> +{
> +	return dw_edma_core_get_ll_dist(chan, chan->ll_done, chan->ll_head);
> +}
> +
>  static u32 dw_edma_core_get_free_num(struct dw_edma_chan *chan)
>  {
> -	/* Keep one data entry free so equal indices mean an empty ring. */
> -	return (chan->ll_end + chan->ll_max - 1 - chan->ll_head) %
> -		chan->ll_max;
> +	/*
> +	 * Measure occupancy from ll_done: entries consumed by the
> +	 * hardware can be reused even if the descriptor that owns them has not
> +	 * completed yet; this lets descriptors larger than the ring move forward.
> +	 *

not sure what means of this comments

> +	 * Keep one data entry free so equal indices mean an empty ring.
> +	 */
> +	return chan->ll_max - 1 - dw_edma_core_get_used_num(chan);
>  }
>
>  static bool dw_edma_core_enable_ll_irq(struct dw_edma_desc *desc, u32 i,
> @@ -129,9 +144,51 @@ static bool dw_edma_core_enable_ll_irq(struct dw_edma_desc *desc, u32 i,
>  	return desc->chan->dw->core->ll_irq(desc, i, free);
>  }
>
> +static bool dw_edma_ll_advance(struct dw_edma_chan *chan, int idx, u32 *old_done)
> +{
> +	u32 done;
> +
> +	if (idx < 0 || (u32)idx >= chan->ll_max)
> +		return false;
> +
> +	done = dw_edma_core_get_ll_dist(chan, chan->ll_done, idx);
> +	if (!done || done > dw_edma_core_get_used_num(chan))
> +		return false;
> +
> +	*old_done = chan->ll_done;
> +	chan->ll_done = idx;
> +
> +	return true;
> +}
> +
>  static bool dw_edma_ll_pending(struct dw_edma_chan *chan)
>  {
> -	return chan->ll_head != chan->ll_end;
> +	return dw_edma_core_get_used_num(chan);
> +}
> +
> +static u32 dw_edma_core_ch_transfer_size(struct dw_edma_chan *chan)
> +{
> +	if (!chan->dw->core->ch_transfer_size)
> +		return U32_MAX;
> +
> +	return chan->dw->core->ch_transfer_size(chan);
> +}
> +
> +static bool dw_edma_ll_irq_is_stopped(struct dw_edma_chan *chan, bool stopped)
> +{
> +	if (stopped)
> +		return true;

look like strange, you pass stopped add check here.

> +
> +	/*
> +	 * Native HDMA reports STOP separately. The legacy interrupt interface
> +	 * uses DONE for both progress and stop, so confirm a stopped boundary
> +	 * with channel status and transfer size.
> +	 */
> +	if (!chan->dw->core->ch_transfer_size)
> +		return false;
> +
> +	return dw_edma_core_ch_status(chan) == DMA_COMPLETE &&
> +	       dw_edma_core_ch_transfer_size(chan) == 0;
>  }
>
>  static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
> @@ -166,7 +223,6 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
>  		}
>  	}
>
> -	desc->done_burst = desc->start_burst;
>  	desc->start_burst = i;
>  }
>
> @@ -235,6 +291,110 @@ static void dw_edma_terminate_all_descs(struct dw_edma_chan *chan)
>  	dw_edma_terminate_vdesc_list(&chan->vc.desc_submitted);
>  }
>
> +/* Must be called with vc.lock held. */
> +static void dw_edma_ll_clean_pending(struct dw_edma_chan *chan, u32 old_done)
> +{
> +	struct virt_dma_desc *vd, *_vd;
> +	u32 done = dw_edma_core_get_ll_dist(chan, old_done, chan->ll_done);
> +
> +	list_for_each_entry_safe(vd, _vd, &chan->vc.desc_issued, node) {
> +		struct dw_edma_desc *desc = vd2dw_edma_desc(vd);
> +		u32 consumed, started;
> +
> +		if (!done)
> +			break;

this check should before dw_edma_ll_irq_idx_discard();

> +
> +		/*
> +		 * start_burst is the append boundary. done_burst is the
> +		 * hardware-consumed boundary reported through LL progress.
> +		 */

start_burst indicate the start index which will append into hardware LL
when there are free slots.
done_burst indicate how much already progressed by hardware DMA.


This required the strict desc enqueue and dequeue sequence.


> +		started = desc->start_burst - desc->done_burst;
> +		if (!started)
> +			break;
> +
> +		consumed = min(done, started);
> +		desc->done_burst += consumed;
> +		done -= consumed;
> +
> +		/*
> +		 * Descriptors are appended in list order, so later descriptors
> +		 * cannot be complete if this one has not been fully consumed.
> +		 */
> +		if (desc->done_burst != desc->nburst)
> +			break;
> +
> +		/* Hardware has consumed this descriptor's LL entries. */
> +		dw_hdma_set_callback_result(vd, DMA_TRANS_NOERROR);
> +		list_del(&vd->node);
> +		vchan_cookie_complete(vd);
> +	}
> +}
> +
> +/* Must be called with vc.lock held. */
> +static int dw_edma_ll_recycle_idx(struct dw_edma_chan *chan, int idx,
> +				  bool stopped)
> +{
> +	if (idx < 0 || (u32)idx > chan->ll_max)
> +		return -EINVAL;
> +
> +	/*
> +	 * Convert the raw LLP index to the exclusive boundary used by ll_done.
> +	 * For both eDMA and HDMA, once the engine has stopped, LLP points to
> +	 * the next element. ll_max is the link element, hence the following
> +	 * data boundary is 0.
> +	 */
start_burst> +	if (stopped)
> +		return idx == chan->ll_max ? 0 : idx;
> +
> +	/*
> +	 * Moving a running index one entry back cannot represent index 0
> +	 * without wrapping it to ll_max - 1. That could falsely consume a full
> +	 * producer window, so wait for another sample or STOP.
> +	 */
> +	if (!idx)
> +		return -EINVAL;
> +
> +	/*
> +	 * A running eDMA LLP can move ahead of payload completion, so keep the
> +	 * boundary one entry behind it.
> +	 *
> +	 * DWC PCIe Controller Databook 6.10a-lca06, Section 7.2.1, Table 7-3
> +	 * describes an HDMA watermark LLP as an inclusive LLE recycling
> +	 * boundary, which would normally translate to idx + 1. During testing
> +	 * on a DWC HDMA 6.30a integration, using that boundary for DMAengine
> +	 * completion let clients release DMA mappings while hardware still
> +	 * accessed them, causing IOMMU faults. Keep the boundary one entry
> +	 * behind the raw LLP for HDMA as well. Stopped samples continue to use
> +	 * the next-entry boundary above.
> +	 */
> +	return idx == chan->ll_max ? chan->ll_max - 1 : idx - 1;
> +}
> +
> +/*
> + * Must be called with vc.lock held. Consume a recorded LL progress
> + * boundary, if any. Advance ll_done and complete descriptors covered by
> + * the newly consumed range. Return true if ll_done advanced.
> + */
> +static bool dw_edma_ll_consume_progress(struct dw_edma_chan *chan)
> +{
> +	int idx = chan->ll_irq_idx;
> +	u32 old_done;
> +
> +	/* No progress sample is pending. */
> +	if (idx < 0)
> +		return false;
> +
> +	dw_edma_ll_irq_idx_discard(chan);
> +
> +	/* Ignore duplicate or stale progress. */
> +	if (!dw_edma_ll_advance(chan, idx, &old_done))
> +		return false;
> +
> +	dw_edma_ll_clean_pending(chan, old_done);

is it better dw_edma_ll_clean_pending(chan, from_idx, to_idx);

Or you actually only use how many done, not related current actual
posistion

u32 done = dw_edma_core_get_ll_dist(chan, old_done, chan->ll_done)

	dw_edma_ll_clean_pending(chan, done_cnt);


If one any small error happen, whole follow may mass up. I suggested double
check from_idx\to_idx, which match desc's recorder.


header of pending queue

	desc:
		start_burst 10
		done_burst 0
		ll_header 35
		ll_end	45

when clean up desc, make sure from_idx and to_idx include range 35-45.


if 100% depend on the counter,  assume a bugs or somethring wrong

hardware pointer 33, the go though 43,  here total is 10, so whole desc
mark done, but actually hardware only finish 43.

if everything work perfect, no such problem. But it'd better to double
check it, at least, report an error when this happen.

Frank

> +
> +	return true;
> +}
> +
>  /* Must be called with vc.lock held. */
>  static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
>  {
> @@ -424,6 +584,8 @@ static void dw_edma_device_issue_pending(struct dma_chan *dchan)
>  	if (chan->configured && vchan_issue_pending(&chan->vc) &&
>  	    chan->request == EDMA_REQ_NONE &&
>  	    chan->status == EDMA_ST_IDLE) {
> +		if (!chan->non_ll && !dw_edma_ll_pending(chan))
> +			dw_edma_ll_irq_idx_discard(chan);
>  		chan->status = EDMA_ST_BUSY;
>  		dw_edma_start_transfer(chan);
>  		dw_edma_core_ch_maybe_doorbell(chan);
> @@ -697,6 +859,7 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
>  	struct dw_edma_desc *desc;
>  	struct virt_dma_desc *vd;
>  	unsigned long flags;
> +	bool active;
>
>  	spin_lock_irqsave(&chan->vc.lock, flags);
>  	if (chan->status == EDMA_ST_PAUSE) {
> @@ -704,20 +867,21 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
>  		return;
>  	}
>
> +	if (!chan->non_ll)
> +		dw_edma_ll_consume_progress(chan);
> +
>  	switch (chan->request) {
>  	case EDMA_REQ_NONE:
>  	case EDMA_REQ_PAUSE:
>  		vd = vchan_next_desc(&chan->vc);
> -		if (!vd)
> -			break;
> -
> -		desc = vd2dw_edma_desc(vd);
> -		if (desc->start_burst >= desc->nburst) {
> -			dw_hdma_set_callback_result(vd, DMA_TRANS_NOERROR);
> -			list_del(&vd->node);
> -			vchan_cookie_complete(vd);
> -			if (!chan->non_ll)
> -				chan->ll_end = chan->ll_head;
> +		if (vd && chan->non_ll) {
> +			desc = vd2dw_edma_desc(vd);
> +			if (desc->start_burst >= desc->nburst) {
> +				dw_hdma_set_callback_result(vd,
> +							    DMA_TRANS_NOERROR);
> +				list_del(&vd->node);
> +				vchan_cookie_complete(vd);
> +			}
>  		}
>
>  		if (chan->request == EDMA_REQ_PAUSE) {
> @@ -726,14 +890,15 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
>  			break;
>  		}
>
> -		chan->status = dw_edma_start_transfer(chan) ? EDMA_ST_BUSY : EDMA_ST_IDLE;
> +		active = false;
> +		if (vd)
> +			active = dw_edma_start_transfer(chan);
> +		if (!chan->non_ll)
> +			active = dw_edma_ll_pending(chan);
> +		chan->status = active ? EDMA_ST_BUSY : EDMA_ST_IDLE;
>  		break;
>
>  	case EDMA_REQ_STOP:
> -		vd = vchan_next_desc(&chan->vc);
> -		if (!vd)
> -			break;
> -
>  		dw_edma_terminate_all_descs(chan);
>  		chan->request = EDMA_REQ_NONE;
>  		chan->status = EDMA_ST_IDLE;
> @@ -789,12 +954,34 @@ static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
>  	queue_work(chan->dw->wq, &chan->irq_work);
>  }
>
> -static void dw_edma_done_interrupt_deferred(struct dw_edma_chan *chan)
> +static void dw_edma_record_irq_idx(struct dw_edma_chan *chan, bool stopped)
> +{
> +	int idx;
> +
> +	guard(spinlock_irqsave)(&chan->vc.lock);
> +
> +	if (!chan->non_ll) {
> +		idx = dw_edma_core_ll_cur_idx(chan);
> +		if (idx >= 0) {
> +			stopped = dw_edma_ll_irq_is_stopped(chan, stopped);
> +			idx = dw_edma_ll_recycle_idx(chan, idx, stopped);
> +			if (idx >= 0) {
> +				chan->ll_irq_idx = idx;
> +				chan->ll_irq_stopped = stopped;
> +			}
> +		}
> +	}
> +}
> +
> +static void dw_edma_done_interrupt_deferred(struct dw_edma_chan *chan,
> +					    bool stopped)
>  {
> +	dw_edma_record_irq_idx(chan, stopped);
>  	dw_edma_queue_irq_work(chan, DW_EDMA_IRQ_DONE);
>  }
>
> -static void dw_edma_abort_interrupt_deferred(struct dw_edma_chan *chan)
> +static void dw_edma_abort_interrupt_deferred(struct dw_edma_chan *chan,
> +					     bool stopped)
>  {
>  	dw_edma_queue_irq_work(chan, DW_EDMA_IRQ_ABORT);
>  }
> @@ -1033,6 +1220,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
>  		chan->request = EDMA_REQ_NONE;
>  		chan->status = EDMA_ST_IDLE;
>  		chan->irq_mode = dw_edma_get_default_irq_mode(chan);
> +		dw_edma_ll_irq_idx_discard(chan);
>  		INIT_WORK(&chan->irq_work, dw_edma_irq_work);
>  		atomic_set(&chan->irq_pending, 0);
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
> index 8ed37e8a12cb..90dcbe415f57 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.h
> +++ b/drivers/dma/dw-edma/dw-edma-core.h
> @@ -72,24 +72,35 @@ struct dw_edma_chan {
>  	u8				func_no;
>
>  	/*
> -	 * New LL entries are appended at ll_head. Entries between ll_end
> -	 * and ll_head, modulo the LL ring, are owned by DMA; the rest are
> -	 * owned by software.
> +	 * New LL entries are appended at ll_head. Entries between ll_done and
> +	 * ll_head, modulo the LL ring, are owned by DMA; the rest are available
> +	 * to software.
>  	 *
>  	 *   software-owned      DMA-owned       software-owned
>  	 * +---------------+-------------------+---------------+
>  	 * ^               ^                   ^
> -	 * 0             ll_end              ll_head
> +	 * 0            ll_done             ll_head
>  	 *
> -	 * The link entry points back to the region start. ll_head == ll_end
> -	 * means all entries are software-owned and previous DMA work is
> -	 * done.
> +	 * The link entry points back to the region start. No DMA-owned entries
> +	 * remain once ll_done catches up with ll_head.
>  	 *
>  	 * Software always keeps at least one free entry, so the ring is
> -	 * never completely DMA-owned.
> +	 * never completely DMA-owned. That keeps a hardware-reported physical
> +	 * LL index unique within the current ll_done..ll_head producer window.
>  	 */
>  	u32				ll_head;
> -	u32				ll_end;
> +	u32				ll_done;
> +
> +	/*
> +	 * LL progress boundary sampled by the hard IRQ handler after clearing
> +	 * the DONE/watermark status it accompanies. It is normalized to the
> +	 * exclusive convention used by ll_done. The sample and all later
> +	 * accesses are serialized by vc.lock; -1 means consumed or invalid.
> +	 * ll_irq_stopped records whether the same event found the channel
> +	 * stopped.
> +	 */
> +	int				ll_irq_idx;
> +	bool				ll_irq_stopped;
>
>  	u32				ll_max;		/* Data entries */
>  	struct dw_edma_region		ll_region;	/* Linked list */
> @@ -146,7 +157,7 @@ struct dw_edma {
>  	const struct dw_edma_core_ops	*core;
>  };
>
> -typedef void (*dw_edma_handler_t)(struct dw_edma_chan *);
> +typedef void (*dw_edma_handler_t)(struct dw_edma_chan *, bool);
>
>  struct dw_edma_core_ops {
>  	void (*off)(struct dw_edma *dw);
> @@ -154,6 +165,7 @@ struct dw_edma_core_ops {
>  	int (*ch_quiesce)(struct dw_edma_chan *chan);
>  	u16 (*ch_count)(struct dw_edma *dw, enum dw_edma_dir dir);
>  	enum dma_status (*ch_status)(struct dw_edma_chan *chan);
> +	u32 (*ch_transfer_size)(struct dw_edma_chan *chan);
>  	irqreturn_t (*handle_int)(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
>  				  dw_edma_handler_t done, dw_edma_handler_t abort);
>  	void (*non_ll_start)(struct dw_edma_chan *chan, struct dw_edma_burst *child);
> diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
> index 62141aa32e50..3b69fa26bf1c 100644
> --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
> @@ -318,6 +318,11 @@ static enum dma_status dw_edma_v0_core_ch_status(struct dw_edma_chan *chan)
>  		return DMA_ERROR;
>  }
>
> +static u32 dw_edma_v0_core_ch_transfer_size(struct dw_edma_chan *chan)
> +{
> +	return GET_CH_32(chan->dw, chan->dir, chan->id, transfer_size);
> +}
> +
>  static void dw_edma_v0_core_clear_done_int(struct dw_edma_chan *chan)
>  {
>  	struct dw_edma *dw = chan->dw;
> @@ -375,7 +380,7 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
>  			continue;
>
>  		dw_edma_v0_core_clear_done_int(chan);
> -		done(chan);
> +		done(chan, false);
>
>  		ret = IRQ_HANDLED;
>  	}
> @@ -389,7 +394,7 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
>  			continue;
>
>  		dw_edma_v0_core_clear_abort_int(chan);
> -		abort(chan);
> +		abort(chan, false);
>
>  		ret = IRQ_HANDLED;
>  	}
> @@ -689,6 +694,7 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
>  	.ch_quiesce = dw_edma_v0_core_ch_quiesce,
>  	.ch_count = dw_edma_v0_core_ch_count,
>  	.ch_status = dw_edma_v0_core_ch_status,
> +	.ch_transfer_size = dw_edma_v0_core_ch_transfer_size,
>  	.handle_int = dw_edma_v0_core_handle_int,
>  	.ll_data = dw_edma_v0_core_ll_data,
>  	.ll_link = dw_edma_v0_core_ll_link,
> diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> index fb651a83f0f3..4440e3ebaeac 100644
> --- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> @@ -203,14 +203,14 @@ dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
>  		val = dw_hdma_v0_core_status_int(chan);
>  		if (FIELD_GET(HDMA_V0_STOP_INT_MASK, val)) {
>  			dw_hdma_v0_core_clear_done_int(chan);
> -			done(chan);
> +			done(chan, true);
>
>  			ret = IRQ_HANDLED;
>  		}
>
>  		if (FIELD_GET(HDMA_V0_ABORT_INT_MASK, val)) {
>  			dw_hdma_v0_core_clear_abort_int(chan);
> -			abort(chan);
> +			abort(chan, false);
>
>  			ret = IRQ_HANDLED;
>  		}
> --
> 2.51.0
>
