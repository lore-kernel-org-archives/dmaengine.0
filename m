Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011021.outbound.protection.outlook.com [52.101.70.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22D03AAF52;
	Wed, 29 Jul 2026 16:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785341611; cv=fail; b=gWv0alTSyfT1miA6IrS5nwXRi+oMcpZdaAjpd9iRRgHB2Ajsz9gqUvbgkvxJ53XqF5yqgk8vl8Jj43a1WnFXFPdNKzy6VmV2PEMV9oDBZfVgXCgYfASgWi5Obud6JUQHmAUslZZq2MnvhqY7GYvDoQcmMQsCwPHfqhjTt1HgdLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785341611; c=relaxed/simple;
	bh=pmFTh6Qin+d5fZWHwlzGGXNdsSAu2jI5jmI6eAtJQfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FywHjo5J0XiYgjkghYI1b1/n5Iofwkj4VFKW1TJfD1bWA+No0Pd3bKqyvlf/BkoTLWPKoajLOb5QeUDfjuPlqu2SxsIVs3xQb1g8oqEagYD3Iu8apBgfoJ5EHcf+TSvnnB52oMFYcCiOi+JTScty/iL2zqaAGeYsiXhZyozplp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tchIFkNB; arc=fail smtp.client-ip=52.101.70.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tchIFkNB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=trIS9ebxgMxMQU5rntQ/RNvCcGIzl9RjkS7lqenn/rky6eKCoQOFO/ZYclsPxpMEc2ltyQmVQ53CzewkqbOVYisvrsK0PNajTQLkjTE+xO24wyS3V/dSWGz+9PxmWxZ0XBZdAm9XJYCXV6O4vPK/qcPs7MyegMTd4SsixEFxlVI/IFvYYIGO3mfzhp6PCWtuuuJqYp+gCsirQhsB5kL1lEim7QtXHk+Vvg7MbN1hOjYMoHUAWY17CVQwNXWdTWzP0scznbmvjR7ixL+9Q0yzRr1LgDFdLbO4IGehXX0nGw06oFjIv/L+PLAJX3nKTBxz1zXnB5tTBhE8/8yyXKLC5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9bnonWqhO7Oq6WPAQ8grAiu5REHPREUX9flZ05Wo6E=;
 b=vSsYVaOVRkaOy71Wq0bxd7VBqGLCGD5yqZXq7HRiAYoGkVeKsmqXZ0nIE7b4jczacQZLXOM9jIWd1NyP9k8jMd/8/HeOmoU4oV9MJ+tPey126FXwixQ4modXNaHZvJnZmF5T00y3T6PQx3aZ1Mxs46pC7b+ks0e9WOBkl6F4d6U0XfQj/eLRZ1yj4s4GKp+eTLbPCNLknWgEIdFbAkR7AbQo9lW7+LFq9EZZqF4qAy3YAWLVEXADn7ywxWBAxty9Hbl+Q52EEdpwvQnVV3V9L7l16+t/y+hznTaIEKPsfaQHdMsJG2V3gzTi/ZBqvWppy4PpYOegZvW7udTl8JCSmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9bnonWqhO7Oq6WPAQ8grAiu5REHPREUX9flZ05Wo6E=;
 b=tchIFkNBh/hqKfVjmtbpOMGcUZSW+BjrZOotS+fkgHj0MR64oWumc8ObK/xl1Q0deD50LI2fQyc+AZq+HpFtFsqDVRlh8y2sojgiGpcCHkUoAWNxoe4+GjcY74fqbHu7uHt3OSUJ26InlgHQLT1smHcZ1Ed9jWHmkehGLrqXSZe/nexdFDb4DTpx1H9r08XRxhTEV3rMZ1cR+gCDGF8dOSQdeFu+/nn7KLUT4lyel1e2DAnng8tVOHn2K2Zcp4E1Sk29qsnXyDuzp+AoXldMsAbEUN/6pRUWHMxUfvJbvzjpcksyUi4CAXBVRk67IdavSHMQ7kKSDW8ySY3nRm+gig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10140.eurprd04.prod.outlook.com (2603:10a6:800:246::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 16:13:20 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 16:13:20 +0000
Date: Wed, 29 Jul 2026 11:13:10 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
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
Subject: Re: [PATCH v4 10/24] dmaengine: dw-edma: Prepare LL kicks for event
 serialization
Message-ID: <amomlhfcsFaReSXp@SMW015318>
References: <20260729143036.3087722-1-den@valinux.co.jp>
 <20260729143036.3087722-11-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729143036.3087722-11-den@valinux.co.jp>
X-ClientProxiedBy: PH7P220CA0109.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10140:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b1e7fbe-b2b7-4649-54db-08deed8c4e8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|19092799006|1800799024|23010399003|6133799003|22082099003|18002099003|11063799006|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ZyMJGLcDmVNLh03k3OP13e9VK8s7CYSx3eiK2eQ8wB0TNQdmlvi2qTSVVcggEqQExqgySAYd0o2opyg5p4fJH+ImyHNDWGL5G35b9+5anL1fH3Pxzre2stv3WkMBgWiAc83ayfhtGUZQSFMMjzO6TUZ7WKvxyn0tiLe2tfbOPb3wSh2oQ2mVknIJ28IRcAeP7tDZQrXc9zDELCnTd0ZqXnX/Qthf4iQeCxny9dcG5lynXla9BWdo+J6Bvk5iLxkP6JVEgjan/tk68/9MXwkfLEPz3WNB7p3i5w9SJGo0PeE2wUBIYB2hFDu73oqvednOMzY0qxWaKru85KzcB8TdtMs9oVxYeK5yNQhynSoOKoRM/ug4pTi4KjBJzUsMNj0/CNAhWzGcJgDy0dN3gokbIM/9j2etKRa7no6XfxKOo6VEKrrVNxoJPt6uchxgqIEtyaPfJkN1UiJD+u6V5woEh/6U5PhoqBF/iZkmcqpOFkg7Ft7JXA/hqN77/gk3ysHyZM+Swty7HENBY1vHieiwmIZS4/3LfW6BzXKOaGBekun5iMTyGJHIoAoNv9DKqSCNk6yPKJc4HrtHIXfKMIn5Z1vjCBJX1OGGVLJv7gG75Q+COcq3muJYgJjEJ2Hxh6OWkgl6S8lfCqdXiGfmDVn+zgXJcV3sxVv0b+rFTadXJHo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U62A0cMKB62FRpXvKHUW76VuE+cs1oDfofxq4JtKyYeLz6wizEv6aypXURw/?=
 =?us-ascii?Q?4iCXXKVgSWSS75vF2WLbdba+1EpM9FFgO29SdWb3aMq0Kfd/7unRu4NkJc4t?=
 =?us-ascii?Q?86uS88pvZ4gaPeG4BzXsoU2ffOr/Tq8cfIk1BM2La6o8t+HZe112gewFAQ2b?=
 =?us-ascii?Q?527MlSbAkSOWAA964b+uIDqRCszLQHr2ETlXC7b1+theHZZyNDv9ycIsy9Hu?=
 =?us-ascii?Q?pZlk09GKtUfD5mXSxaQ5/OoZSiiOUD6JuBZt6ILFKR2M3bcbCZeAF6EffHeW?=
 =?us-ascii?Q?egici14JmyQfLOOjidMvhbAei0kIqK0QSJ2s8DEtTBJ/UDxMxcTuiczrHeT1?=
 =?us-ascii?Q?TvkfEr97MUq3LNBYvi5xSW8P7XpgiSJtIvdcXaaxM7a7Fg7rVXon/RG2WQi4?=
 =?us-ascii?Q?onVCe4OAg5j6GWS1w59nDMYGU4q2l1tW6qVBYAij8xl5UhhkMPzyrc/5sEQ+?=
 =?us-ascii?Q?3ILpz/o0zZOzQOSmVM1mObSbY9Skylz570m62hJ7AeTkNN0x0k9WwrZ9RRxz?=
 =?us-ascii?Q?sFUiJ8s7UPIvCdmeRjwnWvqfRrwZHs+WaY4KZDqAJe3TCepIBnOTh0Sniggg?=
 =?us-ascii?Q?v8UEOMKohB0pZYYCCy5Y6RXTnApItm85By6QTboRysirUyie4yHSlPxUDjEN?=
 =?us-ascii?Q?dfv9/SbXGYglW5+2hsiCMWtp3KpyOw+PKHVl8dY/NPcleAQQeSBoCfqRHLqE?=
 =?us-ascii?Q?vD/swqkuzLbPDABSN/HVlk4HfGqE16kvojTllJEtaJ0wgSInSy65HGMPDuI1?=
 =?us-ascii?Q?RqV8WC6bXvY5fpfrIXKm5/JdcauH11rIxOBuKwhOUoASAWJtCjR5IE1e2Mes?=
 =?us-ascii?Q?NybkGm2+2ORmgeEInSaTF9ef4fttvjcdNz8yESKCPh8TvhdFOgzEFB0LMEKb?=
 =?us-ascii?Q?mAOi+9w1HN03OCjsZtkme0menyNc9sj1+CG5ZXVUW26q2UpKZe2gedyuNiqc?=
 =?us-ascii?Q?s6VBZN3LRwj0PAyGZC3f0G8vZuTXlWThszD78/nWeYGG0nhBlxoyOdcm6oTd?=
 =?us-ascii?Q?F6AZs0WQYqE6jq98eheYfUGZFLviyROJkWsMEaN7Szibow0StvrCZnGXtz6E?=
 =?us-ascii?Q?WouHQ+NgnpTQVvkZEFlpewZHGZL+rT7rCwZy+JSlryjticvim7GCOaLxNcmA?=
 =?us-ascii?Q?v0BvI6seSk5pIAda5K+jQJI7VggcoHVOBuiSqi6FPDBKq91GnFl8WXDJ4+qt?=
 =?us-ascii?Q?luzTd+yps2IwIgHqsDVTa0ARJ3uf8GZLAkSPC/Gpmq8aHrpf6D44QaMopoBK?=
 =?us-ascii?Q?ms9DY4sEjmJ8FL1u6PatEhNrwgjS4t+ovjJXvB3IsUNGZjgdds0Ih2LiW5V4?=
 =?us-ascii?Q?j7Jwh6HBm4BcTWyBRrHjd4fGQToYpcZRTJo/wcyQoFKj2cB0C3WpEAis6yyw?=
 =?us-ascii?Q?5o2Xu7ObUc9rOSFD9IjabSCzjdQ0cifquLhOjBVVpN+ARuSu1yyFF/Xt6iSS?=
 =?us-ascii?Q?K9aQK+pbtL2PJ2DJ7mtqcPBv0nkd3LOAFjNHvmU7iv1vlpl/R5nSTn7ZlCku?=
 =?us-ascii?Q?NybTqqA5m9+1ogLz+EFC9u7Xu38ntaRQFAUsJeXhRADVElptpEFyOcAUUBaV?=
 =?us-ascii?Q?H/w8gw/Vu/7Qv68VzZxJ3K3cB922b2ZjjV51mNSfqSeQhzopC79UC40UU0nZ?=
 =?us-ascii?Q?ZvIJp2R3lj4A38hjCAgymMrDmcGAAESurggl0TnitrGOYzXD0RQ6gJhHFGR+?=
 =?us-ascii?Q?TrAmCpQyJDOqiE3POKahou+9+MVpiW6Vldg1a5isf4OmmqPLu/WwPZNJUcLw?=
 =?us-ascii?Q?CiDmkmsY3cEQ2EqWLCJOCtuBvLwlwfJPX2+SVsxNNTbPSWdh80Yn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b1e7fbe-b2b7-4649-54db-08deed8c4e8b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 16:13:20.5898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T701xuffPIi96zY1Gizvsmv8SW8of9ly8sS5SuM7qVWicsIAof+YYnLarSX6tNPPGGa+egMmcAvIk0DOMLrdTOG7HcWIVW14sPKr7QFcO1d2LOTJuKV0gVaTM3kT0grD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10140

On Wed, Jul 29, 2026 at 11:30:22PM +0900, Koichiro Den wrote:
> Both eDMA and HDMA perform the same remote LL read-back immediately
> before writing the doorbell register.
>
> A later patch serializes each raw doorbell write against IRQ event
> capture. Keeping the read-back in the provider callback would hold
> event_lock across a remote read. Move the common read-back into the
> high-level dw_edma_core_ch_doorbell(), where it can run before the
> serialized section. Name the provider write wrapper
> dw_edma_core_do_ch_doorbell() to distinguish the raw write, and leave
> dw_edma_core_ch_maybe_doorbell() to decide whether a kick is needed.
>
> No functional change.
>
> Suggested-by: Frank Li <Frank.li@oss.nxp.com>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v4:
>   - Make dw_edma_core_ch_doorbell() the high-level operation and rename the
>     provider write wrapper to dw_edma_core_do_ch_doorbell(). (Frank)
>
>  drivers/dma/dw-edma/dw-edma-core.c    | 18 ++++++++++++++++++
>  drivers/dma/dw-edma/dw-edma-core.h    |  2 +-
>  drivers/dma/dw-edma/dw-edma-v0-core.c | 16 ----------------
>  drivers/dma/dw-edma/dw-hdma-v0-core.c | 16 ----------------
>  4 files changed, 19 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index bb57f2d39d1c..55849b0c862e 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -13,6 +13,7 @@
>  #include <linux/dmaengine.h>
>  #include <linux/err.h>
>  #include <linux/interrupt.h>
> +#include <linux/io.h>
>  #include <linux/irq.h>
>  #include <linux/dma/edma.h>
>  #include <linux/dma-mapping.h>
> @@ -254,6 +255,23 @@ static void dw_edma_finish_termination(struct dw_edma_chan *chan)
>  	chan->status = EDMA_ST_IDLE;
>  }
>
> +static void dw_edma_core_ll_sync(struct dw_edma_chan *chan)
> +{
> +	/*
> +	 * Remote controller registers and LL memory may be reached through
> +	 * different paths. Complete posted LL writes before the doorbell.
> +	 */
> +	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
> +		readl(chan->ll_region.vaddr.io);
> +}
> +
> +/* Must be called with vc.lock held for an LL channel. */
> +static void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
> +{
> +	dw_edma_core_ll_sync(chan);
> +	dw_edma_core_do_ch_doorbell(chan);
> +}
> +
>  /* Must be called with vc.lock held. */
>  static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
>  {
> diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
> index 6b0d475bb8b5..00ddcaacd671 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.h
> +++ b/drivers/dma/dw-edma/dw-edma-core.h
> @@ -304,7 +304,7 @@ static inline void dw_edma_core_ll_irq_clear(struct dw_edma_chan *chan)
>  	chan->dw->core->ll_irq_clear(chan);
>  }
>
> -static inline void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
> +static inline void dw_edma_core_do_ch_doorbell(struct dw_edma_chan *chan)
>  {
>  	chan->dw->core->ch_doorbell(chan);
>  }
> diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
> index 990cad7f0e54..e254e9f1e613 100644
> --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
> @@ -480,20 +480,6 @@ static void dw_edma_v0_core_ch_enable(struct dw_edma_chan *chan)
>  		  upper_32_bits(chan->ll_region.paddr));
>  }
>
> -static void dw_edma_v0_sync_ll_data(struct dw_edma_chan *chan)
> -{
> -	/*
> -	 * In case of remote eDMA engine setup, the DW PCIe RP/EP internal
> -	 * configuration registers and application memory are normally accessed
> -	 * over different buses. Ensure LL-data reaches the memory before the
> -	 * doorbell register is toggled by issuing the dummy-read from the remote
> -	 * LL memory in a hope that the MRd TLP will return only after the
> -	 * last MWr TLP is completed
> -	 */
> -	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
> -		readl(chan->ll_region.vaddr.io);
> -}
> -
>  static void dw_edma_v0_core_ch_config(struct dw_edma_chan *chan)
>  {
>  	struct dw_edma *dw = chan->dw;
> @@ -624,8 +610,6 @@ static void dw_edma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
>  {
>  	struct dw_edma *dw = chan->dw;
>
> -	dw_edma_v0_sync_ll_data(chan);
> -
>  	/* Doorbell */
>  	SET_RW_32(dw, chan->dir, doorbell,
>  		  FIELD_PREP(EDMA_V0_DOORBELL_CH_MASK, chan->id));
> diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> index 8edec9c95cf0..af4ab43d00ca 100644
> --- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> @@ -282,20 +282,6 @@ static void dw_hdma_v0_core_ch_enable(struct dw_edma_chan *chan)
>  		  HDMA_V0_CONSUMER_CYCLE_STAT | HDMA_V0_CONSUMER_CYCLE_BIT);
>  }
>
> -static void dw_hdma_v0_sync_ll_data(struct dw_edma_chan *chan)
> -{
> -	/*
> -	 * In case of remote HDMA engine setup, the DW PCIe RP/EP internal
> -	 * configuration registers and application memory are normally accessed
> -	 * over different buses. Ensure LL-data reaches the memory before the
> -	 * doorbell register is toggled by issuing the dummy-read from the remote
> -	 * LL memory in a hope that the MRd TLP will return only after the
> -	 * last MWr TLP is completed
> -	 */
> -	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
> -		readl(chan->ll_region.vaddr.io);
> -}
> -
>  static void dw_hdma_v0_core_non_ll_start(struct dw_edma_chan *chan,
>  					 struct dw_edma_burst *child)
>  {
> @@ -393,8 +379,6 @@ static void dw_hdma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
>  {
>  	struct dw_edma *dw = chan->dw;
>
> -	dw_hdma_v0_sync_ll_data(chan);
> -
>  	/* Doorbell */
>  	SET_CH_32(dw, chan->dir, chan->id, doorbell, HDMA_V0_DOORBELL_START);
>  }
> --
> 2.51.0
>
