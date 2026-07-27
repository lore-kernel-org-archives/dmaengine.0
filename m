Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011030.outbound.protection.outlook.com [52.101.70.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8D3245020;
	Mon, 27 Jul 2026 19:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785179374; cv=fail; b=kkQXOQxoG6QSwOzeZ8+RzCLjV6SKKXVVO+fJQY92NME2WftNOPDiwvt6oym7lL+/YXgzZpIeK3R5jpEMSyjZk2CRnyTnuWoF+ThLh5p+2CcJb5JSqx00FJB5/U1ofeg1hEyTpUgn7v/Iv7wlYEhvC51Hr/zMK8OoQ/2+K9WpsGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785179374; c=relaxed/simple;
	bh=j5K7X2HMPBo6PaYHOoGIhJyhOTeAGryFKF1+iBnhzeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RYWCwLQUJtl4EcC9X/AxF7dYakZJEiH4lOpzx3vCj65FCVx4t9uNNS1tfwv7+UXPy8HteVQPojt/T2z+t0UgxlFdv82B2MEf8j4bzq0jZNtzH2RwykYWTQlCq3r4WSuPBRHcL1ShjFO3W6BrFTc0QxrMAsrwAosKoEifxc5NVoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iprE4beb; arc=fail smtp.client-ip=52.101.70.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iprE4beb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nMMD/gF1biaOIXSzOCDO1JBDUWsULjIdht8BOeRAne/Nos7n4vLpiiktu6WT8UN1GS5MTjJQsrZ/FxMBkH8lSUandl2rkYFLusBmzqvuesH28zaXdKgw4r1UYzvnNbvUPUZFEsQwuabHKjpF9hRcBabxHlLAy3bEnKR9peB0O+n0r1SG1W5kqnKcD8lXj9AFvYVNhiTR9TXVHw5zDozzMMcmuf9eQrxBnMq/T2fRkQAQZe3aU3ufDQ5qyTRQXEnlrCiXeZEZpBCGdPtH72q41dqp4ZZ8N9inU2rQelzAEhfo6NLsTK6XfTyU9SadFJcBUuGyRnSubNsjoudnH/Lxlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuvgEwI28bIo4PLuTnd5JLyAeVdW3uO1b+artvpD0GM=;
 b=H+VvJATbiryuldTyj/jylgglgVBd6+EHEGmE6PAM45IBQkbL5jGdiM4dpKzYP3XmcFlxw5TzJYw8yP3QPas+nN4HFmYxlov+nsGbEwwx6SUPG3jAZX7wSv8L/NLvnTLdTpy/JM+fT0F6pH3slwon7FOZ/v/d26HonhUNskPuLAThHECO7H+Ibg0KVsXPboSz0V+DTzZ8yVNpFE2HmpIU/YVt1N0zP01xRjVyi/0h+bQNgrNXYM9nB+PIrmMYxh//070dpnryyCdAFq2CxoZ25i1BmzFw6QcP26XWC072zmEHMfwSkBO6K48Hgip/8kDDWRQVyIMMxsD/9sjqCv+OVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuvgEwI28bIo4PLuTnd5JLyAeVdW3uO1b+artvpD0GM=;
 b=iprE4beb2gaf4YBlsHb5SXVqck1VFI79vK7SM67m7A5c+4cnumG1i+/NcEABhkAojr/VjzsiZ+vlIorTa9u8YVnXOTgBDX91SHoks9EtivOMwtxe4VK4U31bBe3fejq9zsp8EdjuwZVANXAhhD6RgE2nRLyNVqLx+si5ZBD7CxjsADUOUbr5A7C258hmU6DK56S4szYF2QG6+y5CL+L193Ku2O3+JkgiFVKg+dXCfzL09f3UxQvxEwnMWXcxr8OPpDh5YdPwUnaou0/lGDoILYtLc0iEpRaE0lFuMHD9F2DjpTj+IuIdibDB9IdFYZWNYECec6LU/w5zgRLft5vSjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10209.eurprd04.prod.outlook.com (2603:10a6:800:244::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 19:09:28 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 19:09:27 +0000
Date: Mon, 27 Jul 2026 15:09:17 -0400
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
Subject: Re: [PATCH v3 04/24] dmaengine: dw-edma: Make DMA link list work as
 a circular buffer
Message-ID: <ames3ZMAS4CBh0zm@lizhi-Precision-Tower-5810>
References: <20260727170323.2321369-1-den@valinux.co.jp>
 <20260727170323.2321369-5-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727170323.2321369-5-den@valinux.co.jp>
X-ClientProxiedBy: PH7PR17CA0053.namprd17.prod.outlook.com
 (2603:10b6:510:325::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10209:EE_
X-MS-Office365-Filtering-Correlation-Id: a124c133-8ff5-47c0-7f0d-08deec12940d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|7416014|376014|6133799003|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	GVmunstbLit7tOYR83oHBgai9bJTh41i5amMYZJBUkxsdi6YnC9cNqRPBbDKhVerNH4R44Od5PjVtwZizL1V4QSzzqqOslky0IaVHgG4J4zC9bdosGdZyUNuOUvC28MWMaFjOk7CCwCY6JLifboX+t3C6jPvpC9VzLD3luhO5XrEPcYWkQzPvo0B+Lq9g21I2fCF+qwA9fGKQOb46yU5Ag6cmIblu/zrveipQFjE2cjvbZe+Iw3Hk3cGxYb9eQWdRV9rjqoEaCDe2V0ja3gOWoqkPXuE1irMhvGRcE/muCTf5CHSP64GSYIOL3dwC0r7T2I3vrAAXjnf9tmD3VZ7z7aeX0CBUL7kNTn6P9SD5JnGe92P2hBagzoR+tN7fYViKhl2RLNo8KF2ig/ZfdF5pXltnex4OxFN8w1jCvzl4rhM5Th5RY3+48viSrZJ6QmXMhNiyL/RIJbdreetYASTXiU4DClhTXOseVCXZtvdoZX45MFaxkHcEuYjIemYnJBYFShgRiMtw32KlUoThEfMrCupUaQskcgPFcVo1guykGdhA9q2EP0MxFxw/YtIka8CCIbINbdke/VJ/rvvvRzsPhN9wT/lidhXd5676Opbk2p7dQTdbMLMTcBWafTx+1Xjsu482t7C0oiIrN/K7BPRsb6C9kKVopd+gbUC/GzHb4U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(7416014)(376014)(6133799003)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nO994P3eMrqtIJGO07XCaKP3AitbHZAg1Mkdt7sCfhiOuFVLUbkwi1wGbzrZ?=
 =?us-ascii?Q?ub270GKNwAwC8atdQw1NLUAUelDHqfG1YT1cZZV8WSlVN2r/oCYWbySa7H2o?=
 =?us-ascii?Q?jE9wCV0lZ+b2jyjlKDl8JFiBK4QOwiHuk+N43hT4D//N9STOzFfl/FIXpXBB?=
 =?us-ascii?Q?KUNCliUmVTe5g6qVfg50Xf4E9WONEkHfXCiLlxivQqXgGNICi8NKQLwCPu06?=
 =?us-ascii?Q?/fCkMr03b2BCdzPpwcurEOq95JvQhWB4B10c6qDMDSxkaiHAo9yBDqEbkISX?=
 =?us-ascii?Q?vVLJzVK4QN1W4RIy9MO7Pham8deT1/I70inpKOfxTIQ3w91mIQl7lUePVohM?=
 =?us-ascii?Q?vhfEIg50aERZDKi026+mfdh9b5XawFwL2fU0SZVOgoEfAbV00l7FXqkWzRPb?=
 =?us-ascii?Q?PVr2Lv5dFczaR/I+ofkvQHt+400nYQYKl/uqHcyV6NU3ZhE6vDiQX+Rhz1lK?=
 =?us-ascii?Q?dLIILdCSuJ+85w/cUIDjvDhUm0H/gRQUr5Qkl3JnhXoy9SAtB/4YMMescq/l?=
 =?us-ascii?Q?Vt4NzSnjeF4dRHJVEYeG7PfKfAfYbPYTB1CLbwR1dDT3+jFLg2dqal+n15ua?=
 =?us-ascii?Q?96dmiroeBqxW2h6cRhzFcjjbyyLgQvJYNGHgEGD+/jw/MYLVVdhG+yx72fqA?=
 =?us-ascii?Q?OE8LlAyLL4ReTH+B8zftHmVpqaJ/9S46o8+3LAUgKFNkpzQVrHnunVHKonza?=
 =?us-ascii?Q?yOQIxD9gZV/s7AJFgwT6y520+PYFKwnXGV3nBThEKU9ZYD+53PEUecVqibai?=
 =?us-ascii?Q?WlHux9HinnMhoY2finV7hQsvz2m8O9I+kVYic64RRuyjuHma4Y7L+N9fFNVB?=
 =?us-ascii?Q?hoz9jYpUctwJFIelXAu6Cuhbzdv/FB/5RjMWP+W1L4eQn9PyvqqasWA5mOGE?=
 =?us-ascii?Q?MUZEwLBl1B3tvuOm7w+gOqwHGfj2nnE2goPTwQn13ge33sdTALzZjjyuNncT?=
 =?us-ascii?Q?uJmChl9oUwTxUBOaN7GWOUloVoIhEWvucqqzymyiKP7/4yrAp2Ao4dbsxm2D?=
 =?us-ascii?Q?pZyvESaWb3zxo/Gx2EOM2hHe1Eld2uyJw0taVHA7g6W9l9rWyY+1GMpnuk8C?=
 =?us-ascii?Q?KEsx0PJ0GqhzCGx9rL8vlO0Yt4joaaug/gE8N9zBYf2kBDyyk0VCCd6Rxw5a?=
 =?us-ascii?Q?b/b9rvYr9x9/sVnAZU6ZqolV8520/rSrpata/N/mbDwY6o8cdIR48eI9pL6y?=
 =?us-ascii?Q?7v7EsfiV/XgguyTlTpUrVsDDGuh37zum7runGs364oW9zE8X9lD9teX0CMIk?=
 =?us-ascii?Q?T1/Y+gNISRMf2ySFKvl7Od9HMcCdwVOPAncHc4CnvAd3747SxY7XtzyPRfsb?=
 =?us-ascii?Q?7oaJUHEl9CpWhv1OcuZetQ49nR5lG36MF+vFedzNtXW52Gc6axmb6eUEwHyD?=
 =?us-ascii?Q?ZRotubGQFlF84LWNpSfb3n+SZUyz1PeXvdz68+2Cr4Q+mCxAI+wywgHOxBfs?=
 =?us-ascii?Q?TLYjMyqYBfF2EaTD+NYH3E/cyjspC0fzlQ4LD+dZplnm4UpBGv2o6Jsl3bEh?=
 =?us-ascii?Q?TbmXmTZhzH3xldGC71OLhOSflTEXPUYDr9tBHtfRXjiEEvy1Vb+Ucngci88r?=
 =?us-ascii?Q?z54KwXRmvJogUUP1pjukrTOmALPWNh8CiKxlrADb0Ag+XFm3sOm5gUJ/oC65?=
 =?us-ascii?Q?MlhHZqlIba7MIHPiPrK5wIQW+K8YyxhVO6S7epA4v+d6aLLbnc6iFs+/T7UE?=
 =?us-ascii?Q?d91jY/ayUM7+d/gaEOVWD9TI0GBgf71XpkLKhOK7nDLr2oYd0L1GO4Djat8n?=
 =?us-ascii?Q?ntAqgfL8iokkT91s4b6RHnUmdB/5H94pj3LplcGWeO3tVON8biav?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a124c133-8ff5-47c0-7f0d-08deec12940d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 19:09:27.2090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sn3mM3v9QM97gpmsQrwYvr2WbC2X+0nWSMn5WUn8AcFPpj609bo3XIGozuAn60/YTCaqu7kdl4DyJUxBRYHjNfoRvcUyKaI+GygDsEOUbRD4Maxa3j5l4g+MsMO6O5j4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10209

On Tue, Jul 28, 2026 at 02:03:03AM +0900, Koichiro Den wrote:
> From: Frank Li <Frank.Li@nxp.com>
>
> The driver currently rebuilds the whole linked list for every transfer.
>
> Use it as a circular ring instead. Append entries at ll_head with the
> current cycle bit, and reserve the final entry for the link back to the
> start.
>
> Clear control words before first use so stale cycle bits cannot become
> valid entries. Reject rings without usable data slots and, until reclaim
> support lands, descriptors that exceed the usable ring capacity.
>
> Termination and abort can discard descriptors while ll_done still trails
> ll_head. Reset the ring after the channel has stopped so the next transfer
> does not inherit occupied slots.
>
> This prepares the driver for appending requests while the engine runs.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> Co-developed-by: Koichiro Den <den@valinux.co.jp>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v3:
>   - Reset ring state after termination or abort. (Frank, Sashiko)
>   - Use ll_done as the consumer boundary from the beginning and move the
>     ring accounting helpers here, so the later progress-reclamation
>     patch can focus on consuming IRQ-paired progress.
>   - Calculate free space once per ring-fill pass.
>
>  drivers/dma/dw-edma/dw-edma-core.c | 125 +++++++++++++++++++++++------
>  drivers/dma/dw-edma/dw-edma-core.h |  27 ++++++-
>  2 files changed, 125 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index 6a25a050b89c..d7a8a43b71d6 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -51,13 +51,19 @@ dw_edma_alloc_desc(struct dw_edma_chan *chan, size_t nburst)
>  {
>  	struct dw_edma_desc *desc;
>
> +	/*
> +	 * For now, a descriptor that does not fit would stall the channel
> +	 * forever: reject it up front.
> +	 */
> +	if (!chan->non_ll && nburst > chan->ll_max - 1)
> +		return NULL;
> +
>  	desc = kzalloc_flex(*desc, burst, nburst, GFP_NOWAIT);
>  	if (unlikely(!desc))
>  		return NULL;
>
>  	desc->chan = chan;
>  	desc->nburst = nburst;
> -	desc->cb = true;
>
>  	return desc;
>  }
> @@ -67,30 +73,75 @@ static void vchan_free_desc(struct virt_dma_desc *vdesc)
>  	kfree(vd2dw_edma_desc(vdesc));
>  }
>
> +static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
> +{
> +	u32 i;
> +
> +	chan->ll_head = 0;
> +	chan->ll_done = 0;
> +	/* Drop stale CB bits before reusing the circular LL ring. */
> +	for (i = 0; i < chan->ll_max; i++)
> +		dw_edma_core_ll_clear(chan, i);
> +	chan->cb = true;
> +
> +	dw_edma_core_ll_link(chan, chan->ll_max, chan->cb,
> +			     chan->ll_region.paddr);
> +
> +	dw_edma_core_ch_enable(chan);
> +	chan->ll_valid = true;
> +}
> +
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
> +static u32 dw_edma_core_get_free_num(struct dw_edma_chan *chan)
> +{
> +	/* Keep one data entry free so equal indices mean an empty ring. */
> +	return chan->ll_max - 1 - dw_edma_core_get_used_num(chan);
> +}
> +
> +static bool dw_edma_ll_pending(struct dw_edma_chan *chan)
> +{
> +	return chan->ll_head != chan->ll_done;
> +}
> +
>  static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
>  {
>  	struct dw_edma_chan *chan = desc->chan;
>  	size_t i;
> -	bool first = !desc->start_burst;
> +	u32 free;
> +
> +	free = dw_edma_core_get_free_num(chan);
> +	for (i = desc->start_burst; i < desc->nburst && free; i++, free--) {
> +		/*
> +		 * Refresh the link element before filling the last data slot so
> +		 * the next lap has the updated CB value.
> +		 */
> +		if (chan->ll_head == chan->ll_max - 1)
> +			dw_edma_core_ll_link(chan, chan->ll_max, chan->cb,
> +					     chan->ll_region.paddr);
>
> -	for (i = 0; i + desc->start_burst < desc->nburst; i++) {
> -		u32 idx = i + desc->start_burst;
> +		dw_edma_core_ll_data(chan, &desc->burst[i],
> +				     chan->ll_head, chan->cb,
> +				     i == desc->nburst - 1 || free == 1);
>
> -		if (i == chan->ll_max)
> -			break;
> +		chan->ll_head++;
>
> -		dw_edma_core_ll_data(chan, &desc->burst[idx],
> -				     i, desc->cb,
> -				     idx == desc->nburst - 1 || i == chan->ll_max - 1);
> +		if (chan->ll_head == chan->ll_max) {
> +			chan->cb = !chan->cb;
> +			chan->ll_head = 0;
> +		}
>  	}
>
>  	desc->done_burst = desc->start_burst;
> -	desc->start_burst += i;
> -
> -	dw_edma_core_ll_link(chan, i, desc->cb, chan->ll_region.paddr);
> -
> -	if (first)
> -		dw_edma_core_ch_enable(chan);
> +	desc->start_burst = i;
>
>  	dw_edma_core_ch_doorbell(chan);
>  }
> @@ -123,9 +174,10 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
>  	if (!desc)
>  		return 0;
>
> -	dw_edma_core_start(desc);
> +	if (!chan->non_ll && !chan->ll_valid)
> +		dw_edma_core_reset_ll(chan);
>
> -	desc->cb = !desc->cb;
> +	dw_edma_core_start(desc);
>
>  	return 1;
>  }
> @@ -159,6 +211,19 @@ static void dw_edma_terminate_all_descs(struct dw_edma_chan *chan)
>  	dw_edma_terminate_vdesc_list(&chan->vc.desc_submitted);
>  }
>
> +/* Must be called with vc.lock held after the channel has stopped. */
> +static void dw_edma_finish_termination(struct dw_edma_chan *chan)
> +{
> +	dw_edma_terminate_all_descs(chan);
> +
> +	/* Preserve a clean ring; resync only if entries remain published. */
> +	if (!chan->non_ll && dw_edma_ll_pending(chan))
> +		dw_edma_core_reset_ll(chan);
> +
> +	chan->request = EDMA_REQ_NONE;
> +	chan->status = EDMA_ST_IDLE;
> +}
> +
>  static void dw_edma_device_caps(struct dma_chan *dchan,
>  				struct dma_slave_caps *caps)
>  {
> @@ -299,17 +364,15 @@ static int dw_edma_device_terminate_all(struct dma_chan *dchan)
>  	if (!chan->configured) {
>  		dw_edma_terminate_all_descs(chan);
>  	} else if (chan->status == EDMA_ST_PAUSE) {
> -		dw_edma_terminate_all_descs(chan);
> -		chan->status = EDMA_ST_IDLE;
> +		dw_edma_finish_termination(chan);
>  	} else if (chan->status == EDMA_ST_IDLE) {
> -		dw_edma_terminate_all_descs(chan);
> +		dw_edma_finish_termination(chan);
>  	} else if (dw_edma_core_ch_status(chan) == DMA_COMPLETE) {
>  		/*
>  		 * The channel is in a false BUSY state, probably didn't
>  		 * receive or lost an interrupt
>  		 */
> -		dw_edma_terminate_all_descs(chan);
> -		chan->status = EDMA_ST_IDLE;
> +		dw_edma_finish_termination(chan);
>  	} else if (chan->request > EDMA_REQ_PAUSE) {
>  		err = -EPERM;
>  	} else {
> @@ -645,6 +708,8 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
>  							    DMA_TRANS_NOERROR);
>  				list_del(&vd->node);
>  				vchan_cookie_complete(vd);
> +				if (!chan->non_ll)
> +					chan->ll_done = chan->ll_head;
>  			}
>
>  			if (chan->request == EDMA_REQ_PAUSE) {
> @@ -659,9 +724,7 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
>  			break;
>
>  		case EDMA_REQ_STOP:
> -			dw_edma_terminate_all_descs(chan);
> -			chan->request = EDMA_REQ_NONE;
> -			chan->status = EDMA_ST_IDLE;
> +			dw_edma_finish_termination(chan);
>  			break;
>
>  		default:
> @@ -685,6 +748,8 @@ static void dw_edma_abort_interrupt(struct dw_edma_chan *chan)
>  		list_del(&vd->node);
>  		vchan_cookie_complete(vd);
>  	}
> +	if (!chan->non_ll)
> +		dw_edma_core_reset_ll(chan);
>  	chan->request = EDMA_REQ_NONE;
>  	chan->status = EDMA_ST_IDLE;
>  	spin_unlock_irqrestore(&chan->vc.lock, flags);
> @@ -871,6 +936,9 @@ static int dw_edma_alloc_chan_resources(struct dma_chan *dchan)
>  	if (chan->status != EDMA_ST_IDLE)
>  		return -EBUSY;
>
> +	/* The hardware context may have been invalidated while unowned. */
> +	chan->ll_valid = false;
> +
>  	return 0;
>  }
>
> @@ -962,6 +1030,13 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
>  		else
>  			chan->ll_region = chip->ll_region_rd[chan->id];
>
> +		if (!chip->cfg_non_ll && chan->ll_region.sz < 3 * EDMA_LL_SZ) {
> +			dev_err(dev,
> +				"channel %s[%u]: LL region has fewer than 2 data entries\n",
> +				str_write_read(chan->dir == EDMA_DIR_WRITE),
> +				chan->id);
> +			return -EINVAL;
> +		}
>  		chan->ll_max = chan->ll_region.sz / EDMA_LL_SZ - 1;
>
>  		dev_vdbg(dev, "L. List:\tChannel %s[%u] max_cnt=%u\n",
> diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
> index 089f913fd247..761a5ab4bbb5 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.h
> +++ b/drivers/dma/dw-edma/dw-edma-core.h
> @@ -60,7 +60,6 @@ struct dw_edma_desc {
>
>  	size_t				done_burst;
>  	size_t				start_burst;
> -	u8				cb;
>  	size_t				nburst;
>  	struct dw_edma_burst            burst[] __counted_by(nburst);
>  };
> @@ -72,8 +71,32 @@ struct dw_edma_chan {
>  	enum dw_edma_dir		dir;
>  	u8				func_no;
>
> -	u32				ll_max;
> +	/*
> +	 * New LL entries are appended at ll_head. Entries between ll_done
> +	 * and ll_head, modulo the LL ring, are owned by DMA; the rest are
> +	 * owned by software.
> +	 *
> +	 *   software-owned      DMA-owned       software-owned
> +	 * +---------------+-------------------+---------------+
> +	 * ^               ^                   ^
> +	 * 0             ll_done             ll_head
> +	 *
> +	 * The link entry points back to the region start. ll_head == ll_done
> +	 * means all entries are software-owned and previous DMA work is
> +	 * done.
> +	 *
> +	 * Software always keeps at least one free entry, so the ring is
> +	 * never completely DMA-owned. That keeps a hardware-reported physical
> +	 * LL index unique within the current ll_done..ll_head producer window.
> +	 */
> +	u32				ll_head;
> +	u32				ll_done;
> +
> +	u32				ll_max;		/* Data entries */
>  	struct dw_edma_region		ll_region;	/* Linked list */
> +	bool				ll_valid;	/* LL context programmed */
> +
> +	bool				cb;
>
>  	struct msi_msg			msi;
>
> --
> 2.51.0
>
