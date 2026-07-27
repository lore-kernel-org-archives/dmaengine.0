Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012038.outbound.protection.outlook.com [52.101.66.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79ECD3CDBC3;
	Mon, 27 Jul 2026 20:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184541; cv=fail; b=UkwlKg98Z2qo7Ytpqau1ezDUZ2HkUZSi19uwGqKgIM4XsSdEn4hjd90jKwi+WPmKBIRty7nQZITtedZHbE8f6Am0l6aIm491TunuHruug3My2wzS+nfvZQMRISgQ1UTW4NhqNLa64bdCbSiG/xg76r2qX19PwA+UyEocdipfQKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184541; c=relaxed/simple;
	bh=XQ//wDTTGnY11mX96ZSRvr+f8+Dgc5OgBEC4t190LpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uJzr1RY7Ur3lXMfL7U8yejAF2/fgDqZZRD/8uo5VGPeFxYgKppWfKBFiu3CdvEX90f8I9+4yet2rs7RvUhIx7QTpSjrZ4qY+PmzQitDhiKLnatrFhPT7SBh40tQIRAQAPyyQvnojDhNWKAxdlr8hfY3tQ2kqUWZPcUN1+ffA0Cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MHVbi730; arc=fail smtp.client-ip=52.101.66.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MHVbi730"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DcyxdsjioT7dSDVolfMu6URUwtFc+n76dFMY4izZwnO84MC//SqsZnAHj53E75zRMijiecu6zUmcY9ZHOX8zl1cO1reuDrul7rSNAX034FOTwgi24jWtzzIWVDQuRmwAab2XFQ7oePGGzJiWakao01kwERC3e3G0msbNIfWOthU0h7TDbUhgAABcW1xwrMGzG0TOMDA3HFY12qTcJ4MjWmQfSiKdsiYRGyfLCofyIHMwiUOBglU/up/ZMDP2ApSXGINQDZ0GBGQgKxS9u6QMhT++oZeSaFUC43aapz9SK+kIRYeE0jOe61Daa+1bv4EiE2BxBOIIX7ZZD+5Z3Z0AvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGBHXBoS92tzG4/9ocAz2/is1duCo4gAV7MkR7kEz7w=;
 b=JgVKLChHct9D2V48TYtEJL405N1WXH2CdZDtuyrqrzdbShPSicPpsbNvB+8tkFRFS6YEyEfK6tDRpBkIWE6dBXe8ngAzcXRnvsAE3UbOzKjCCvzYEvBc92C0AJch02vbTDn57vqi6sFo+ZgTYrslwgyUB6+s4awrCXOwO5SjyRzd8oPStw2aLMd8pz5Q6jW1CnsGy0RuscwzQR613QKwvV8MOaNXJWGPhqFNb1j6Pc+LyyGKRYI5yEwdrzYJtr+6UZGY8ytzJ9oW0t5hViH+MmHp3EcrelHa1J6Tg1z96S0dISzEAHnRku9KU7N2WmbARrUZBJ2skXlgao55bzEXOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGBHXBoS92tzG4/9ocAz2/is1duCo4gAV7MkR7kEz7w=;
 b=MHVbi730fmIB/P2XspN3/IXeFhS9j2vcPpJlEdsj9PKNutuDvbvJ+LMuCoyeyS1q/87iOtzrIqCwlGtTww5pfQUSTF4KO45uBqTSpgWQIYcvIiehIsneGpUZeedh9t9z+pHbB5++2Z7zmDVE6REuj3bPAqosjaTMmZCYlOvEhqle4CFnOZq3YgIR5f2u//kNOZjLbm4/F14vce01yReDtcxsSqWAcnKVucfumlkJBcSa0g0QcJe3+rwAxt8K4eLtvaTqAJuBO9pXobKwwF/znLHOW+oxD0hAoN636N7yFvUDXYHOhliNBWk1jaFGc/8lEgZetom88LQF9EZPOalN7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB8PR04MB6988.eurprd04.prod.outlook.com (2603:10a6:10:117::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 20:35:35 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 20:35:35 +0000
Date: Mon, 27 Jul 2026 16:35:28 -0400
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
Subject: Re: [PATCH v3 11/24] dmaengine: dw-edma: Serialize LL event capture
 with channel kicks
Message-ID: <amfBEK4qPJNTkB1A@lizhi-Precision-Tower-5810>
References: <20260727170323.2321369-1-den@valinux.co.jp>
 <20260727170323.2321369-12-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727170323.2321369-12-den@valinux.co.jp>
X-ClientProxiedBy: SA1P222CA0105.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB8PR04MB6988:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b26f033-8aae-496a-5785-08deec1e9cc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|7416014|376014|6133799003|4143699003|11063799006|5023799004|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wrbVoHrzU+56wKHcK6W9gZXwlvK/huPQLKYIa4ZA2YeJ2VS+msCQ3TTfEXSt1i5/7MeNsiX4vYPYS3RDgKcCY9oz844dE839kqKiHxJHF0XrIXjMRgQnzfUmupvKeIQzC+v65b3vqI7xw4iezYHmQjbFoSdqdfEzbYkY7o7pJXKGfiBVo4wz3YZVQS8FN6RfGrAnDwPaaOcFkCKI31qZOlQ8uhNDpQVcjc+Ddnl/lVmPbkxpSXFdluJAv5Jx3cRy7PQqr58SyxVraPc3eEnv7fuo/8QJ6lypI1wAtXrw8CgaA8NI0UeArgfi9XJS5meV+hsBmy6S88EhpTBcQCunhGR1Wuu0KIpUElkCA442Efg8IkZcaiACDOTPvACRagW8nEsTR0MxItkk0tCmCxbqxD8OZQ32jlE+gpxI9go5XOwaH3XdR9iHZJT7Obb/7SAaq7FBFT9vTriZWbQtmb+UqnBCoCd43bDnNuYaxyFPFF90aLBELovpamToSegyIRR6afE11pxZSrB43gWVB59kMm6bLu8O900ouvtxiODfkrPbHXosZr35x5gU/5DslgXiBffWL3tStZEPyyrPfIqGYMBJz24x47rXOg0tyPARf+zvKO5GsrV72tJgFz16587C/TKgKpCR0PoeN74JtZelt9P69PlPthcvYG5Ec0PSmTY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(7416014)(376014)(6133799003)(4143699003)(11063799006)(5023799004)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gCcqdje48/XH+o7+xgTOhCXWwvts+7m9A+ojn5tKOe/BWxiXGMBjAmL5n1cX?=
 =?us-ascii?Q?Kp4yrdbnIrgqOxLZgE2Q4OPz7z80o6dYuTYEB7TtnmvkO6+P0v7o1gXkBEvO?=
 =?us-ascii?Q?//y6ccRrs5J/SQ6A5Hv4XkwSmZgXiarQqHolus7kbAHYbsRAQXt5yXHkNp6l?=
 =?us-ascii?Q?3vf3v6wU38cX2CpsL7hdO50afUMQo5OOktiOMUHfxuMyAgjN6Cpwy+0bCHgU?=
 =?us-ascii?Q?yGhsOi8QDNmrYMlqIf40HsO8qmYzX2zn0i6NRCJHWMNngwF7dmX64wHzNbn2?=
 =?us-ascii?Q?cxrEdWGWVy9wJj7wGTLgjC4hqNgfFtIqHGNC8+YiZc3QCRPR7RMeVyZ1yFMQ?=
 =?us-ascii?Q?3MTsLKGJkoqYmWueaTfyRslmm+wDzgHD+WzQ0vAkJyhx25MJfV8zlcdUrUpX?=
 =?us-ascii?Q?S4FbHO8X7+ZwBFIXLDQWqsw//qudRSr2YYhNljl/I9txVeinl3JIzi8PKfkR?=
 =?us-ascii?Q?D4jsHcwhlic80O4kyBLQX8qwEv0KrAis6dkFtgVJCgWTK9g+65oxaFYc7sR/?=
 =?us-ascii?Q?rf8+BVRnJcxdlIuoA6xPbM8d4G8DwrQhEp4yzgo+0DdJao5oDTkaTkUArtNG?=
 =?us-ascii?Q?VdYBItEEiE3qYgPpPtFBZOEa7MlHXwkzwHsa+DvcAtaw5EQHpPA1M7fAxjpp?=
 =?us-ascii?Q?sadRt7sfmONV++yIRNrHDuO1Cyn+aFhHK2I8+PSoOvPYJN9WYg/6IorLTBqf?=
 =?us-ascii?Q?m3fpdRjQvdPdfF00ALLiLYmgTvnb0iXPGaLyw9z/6GumQuJNSn0gjezejhBG?=
 =?us-ascii?Q?4UotdvNS3AoORpSxgTW7ltO+Uemj+TpQO3OSqDsVJMLGAo3wq2lbcgLxZt/U?=
 =?us-ascii?Q?NTbupcUkLwJy2jgu3aOAZ0rNq1idK4spgggSo+F4JyPERoANkHWCOGmIgdL6?=
 =?us-ascii?Q?WBnhfoFQEXSlPQRL5hAWH1IaXBdFsAp35ascjk1FBdWQUNMMHuvZP9WQpN2J?=
 =?us-ascii?Q?+f2/v1vKd4PlBu62lip76gtkqoC/V+9f52zgaG8rdkw5AvVJzx+Z9Wv8rrd0?=
 =?us-ascii?Q?C6/w1DkHe30JZ1vBxa/vh8/rKdWZVGFCxHZ81bLnkIRRZLosQcvt1AA1krP8?=
 =?us-ascii?Q?qaP0WnoOJVbt8BugtC+Y37cN2xdLanHPrP4d+69kWy8I5gDJ9KissFss0Rp4?=
 =?us-ascii?Q?UtPyQQcqb6bAXUTHqJNFaEL9iXbeN2IeOLT7ifsXVaJ3iarZ18YBc41YIuzj?=
 =?us-ascii?Q?pQhsXMBCzvffV+lo1ZD5zdyoP7NfOnqMJeImYGrw/1V8sP5nDSLaTjPOqO1P?=
 =?us-ascii?Q?PiqGtkjffHagw18RzznOm2597u6HBYGwQhN0f0uzG3z9HAdMAf0nTRm+dASy?=
 =?us-ascii?Q?Oc6bzgLRP96dBxG0eOAbJuNeiobwGCDshxEQvbfnJAPOmKHEQaBfBnbLUrQT?=
 =?us-ascii?Q?NOLkX/8aie+USqaf4FLAgalz57arTaCXpH50Asn/5d5p9K/4PS7bscj6TcaS?=
 =?us-ascii?Q?GLaa5s0qq8VtP/W7JsfYaeWFH3ffRfv56x4j2lR4iVk+dJXQEBGTxI76Xqvm?=
 =?us-ascii?Q?uoRQGGMP+CHXKyDA5e0Y1Uw+MTpULIGZbqZpLfrjUsVtBwwThRl+z8Cd+YcN?=
 =?us-ascii?Q?iiOGXLqlV7GJg21W6Dphp0z4a9/lwXK0nRwQ4aTDE2wT+86ympunJTuXsF23?=
 =?us-ascii?Q?sxlENwpYdtSIZZZgOBKYnP//4PCUsoJ1q9gInhvW6pjJwtQsmmmDKRlmRamJ?=
 =?us-ascii?Q?418tWny432tzNE4Rl7n2O6PC6GOP+0NEczQX6HKLn2ynI0+y0bTKWKXSbYqc?=
 =?us-ascii?Q?7oWT4xUkQQxOlI+Cy13KbKd9rA+anw0oMfliWkeUey+FdDvJ6npJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b26f033-8aae-496a-5785-08deec1e9cc4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 20:35:35.7874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: snpcO2lAcRN4K82MXcitKEOebPZCTVrS1xumfZcpB5vPrNmmoiPjg8ttd1JsrNQjkQC/fYykQGG7DOd/SrMOZGMZiqkbUv2yQVRJTwR3xAsKAbY9Tbh5Iw/Z11w8Qgny
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6988

On Tue, Jul 28, 2026 at 02:03:10AM +0900, Koichiro Den wrote:
> The hard IRQ path clears interrupt status before deferred handling takes
> vc.lock. If a doorbell starts a new hardware run in between, the
> deferred handler can apply an event from the previous run.
>
> Use the event lock to serialize the interrupt status read and clear,
> snapshot recording, and LL doorbell writes. Do not write another
> doorbell while a snapshot is pending. A ring reset discards the snapshot
> under the same lock. When events coalesce, keep STOP over PROGRESS.
>
> Changing chan->request alone neither changes the ring nor writes a
> doorbell, so it does not invalidate the snapshot. Preserve it across
> request changes. A later patch uses PROGRESS and STOP to decide whether
> a pending STOP or PAUSE request can finish.
>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
> Changes in v3:
>   - New patch to serialize IRQ event capture with LL doorbell writes and
>     defer doorbells while an LL event is pending. (Sashiko)
>   - Add explicit PROGRESS and STOP types for deferred LL snapshots.
>     (Frank)
>
>  drivers/dma/dw-edma/dw-edma-core.c    | 101 +++++++++++++++++++++++++-
>  drivers/dma/dw-edma/dw-edma-core.h    |  37 ++++++++++
>  drivers/dma/dw-edma/dw-edma-v0-core.c |  64 ++++++++--------
>  drivers/dma/dw-edma/dw-hdma-v0-core.c |  32 +++++---
>  4 files changed, 187 insertions(+), 47 deletions(-)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index e3d0559206d8..3970b066dca2 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -33,7 +33,8 @@ struct dw_edma_desc *vd2dw_edma_desc(struct virt_dma_desc *vd)
>
>  enum dw_edma_deferred_event {
>  	DW_EDMA_DEFERRED_DONE	= BIT(0),
> -	DW_EDMA_DEFERRED_ABORT	= BIT(1),
> +	DW_EDMA_DEFERRED_LL	= BIT(1),
> +	DW_EDMA_DEFERRED_ABORT	= BIT(2),
>  };
>
>  static inline
> @@ -74,6 +75,52 @@ static void vchan_free_desc(struct virt_dma_desc *vdesc)
>  	kfree(vd2dw_edma_desc(vdesc));
>  }
>
> +static void dw_edma_ll_snapshot_discard_locked(struct dw_edma_chan *chan)
> +{
> +	lockdep_assert_held(dw_edma_event_lock(chan));
> +
> +	chan->ll_irq.event = DW_EDMA_LL_EVENT_NONE;
> +}
> +
> +static void dw_edma_ll_snapshot_discard(struct dw_edma_chan *chan)
> +{
> +	guard(raw_spinlock_irqsave)(dw_edma_event_lock(chan));
> +
> +	dw_edma_ll_snapshot_discard_locked(chan);
> +}
> +
> +/* Must be called with vc.lock held. */
> +static bool
> +dw_edma_ll_snapshot_take(struct dw_edma_chan *chan,
> +			 struct dw_edma_ll_snapshot *snapshot)
> +{
> +	guard(raw_spinlock_irqsave)(dw_edma_event_lock(chan));

Not sure previous why use raw_spinlock, suppose it is wrong. should be
spin_lock.

> +
> +	if (chan->ll_irq.event == DW_EDMA_LL_EVENT_NONE)
> +		return false;
> +
> +	*snapshot = chan->ll_irq;
> +	dw_edma_ll_snapshot_discard_locked(chan);
> +
> +	return true;
> +}
> +
...
>
> +/*
> + * Lock ordering:
> + *
> + *   chan->vc.lock -> dw_edma_event_lock(chan)
> + *
> + * Interrupt providers invoke the dw_edma_handler_t callback with the event
> + * lock held. The callback must not take vc.lock.
> + */
> +static inline raw_spinlock_t *dw_edma_event_lock(struct dw_edma_chan *chan)
> +{
> +	if (chan->dw->core->event_scope == DW_EDMA_EVENT_PER_DIR)
> +		return &chan->dw->event_lock[chan->dir];
> +
> +	return &chan->event_lock;

can we change chan:: event_lock to pointer,

when DW_EDMA_EVENT_PER_DIR

	chan->event_lock -> chan->dw->event_lock[chan->dir]

else
	chan->event_lock -> create a lock when register HDMA channel.

So needn't DW_EDMA_EVENT_PER_DIR,


> +}
> +
>  /*
>   * Return the current LL entry index. A negative value means that the channel
>   * context is not initialized or was lost after a link reset.
> diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
> index b3098eb83442..43e33a400a3e 100644
> --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
> @@ -339,8 +339,8 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
>  			   dw_edma_handler_t handler)
>  {
>  	struct dw_edma *dw = dw_irq->dw;
> -	unsigned long total, pos, val;
> -	irqreturn_t ret = IRQ_NONE;
> +	u8 events[EDMA_V0_MAX_NR_CH] = {};
> +	unsigned long total, pos, val, active = 0;
>  	struct dw_edma_chan *chan;
>  	unsigned long off;
>  	unsigned long *mask;
> @@ -356,45 +356,45 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
>  		mask = dw_irq->rd_mask;
>  	}
>
> -	/*
> -	 * DONE and ABORT status share one register, and on remote setups
> -	 * every read is a non-posted round trip across the PCIe link. Take
> -	 * one snapshot and derive both views from it. An abort raised
> -	 * after the snapshot is deferred, not lost: only bits observed in
> -	 * the snapshot are ever cleared below, so its status remains set and
> -	 * triggers another handler pass.
> -	 */
> -	sts = GET_RW_32(dw, dir, int_status);
> -
> -	val = FIELD_GET(EDMA_V0_DONE_INT_MASK, sts);
> -	val &= *mask;
> -	for_each_set_bit(pos, &val, total) {
> -		chan = &dw->chan[pos + off];
> +	scoped_guard(raw_spinlock_irqsave, &dw->event_lock[dir]) {

use helper dw_edma_event_lock()

Frank
> +		/*
> +		 * DONE and ABORT status share one register, and on remote setups
> +		 * every read is a non-posted round trip across the PCIe link. Take
> +		 * one snapshot and derive both views from it.
> +		 */
> +		sts = GET_RW_32(dw, dir, int_status);
>
> -		if (unlikely(dw_edma_core_ch_ignore_irq(chan)))
> -			continue;
> +		val = FIELD_GET(EDMA_V0_DONE_INT_MASK, sts);
> +		val &= *mask;
> +		for_each_set_bit(pos, &val, total) {
> +			chan = &dw->chan[pos + off];
>
> -		dw_edma_v0_core_clear_done_int(chan);
> -		handler(chan, DW_EDMA_IRQ_DONE);
> +			if (unlikely(dw_edma_core_ch_ignore_irq(chan)))
> +				continue;
>
> -		ret = IRQ_HANDLED;
> -	}
> +			events[pos] |= DW_EDMA_IRQ_DONE;
> +			active |= BIT(pos);
> +			dw_edma_v0_core_clear_done_int(chan);
> +		}
>
> -	val = FIELD_GET(EDMA_V0_ABORT_INT_MASK, sts);
> -	val &= *mask;
> -	for_each_set_bit(pos, &val, total) {
> -		chan = &dw->chan[pos + off];
> +		val = FIELD_GET(EDMA_V0_ABORT_INT_MASK, sts);
> +		val &= *mask;
> +		for_each_set_bit(pos, &val, total) {
> +			chan = &dw->chan[pos + off];
>
> -		if (unlikely(dw_edma_core_ch_ignore_irq(chan)))
> -			continue;
> +			if (unlikely(dw_edma_core_ch_ignore_irq(chan)))
> +				continue;
>
> -		dw_edma_v0_core_clear_abort_int(chan);
> -		handler(chan, DW_EDMA_IRQ_ABORT);
> +			events[pos] |= DW_EDMA_IRQ_ABORT;
> +			active |= BIT(pos);
> +			dw_edma_v0_core_clear_abort_int(chan);
> +		}
>
> -		ret = IRQ_HANDLED;
> +		for_each_set_bit(pos, &active, total)
> +			handler(&dw->chan[pos + off], events[pos]);
>  	}
>
> -	return ret;
> +	return active ? IRQ_HANDLED : IRQ_NONE;
>  }
>
>  static void dw_edma_v0_write_ll_data(struct dw_edma_chan *chan, int i,
> diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> index 64a07fbc5be3..bbf9ee0392f8 100644
> --- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> @@ -177,10 +177,12 @@ dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
>  			   dw_edma_handler_t handler)
>  {
>  	struct dw_edma *dw = dw_irq->dw;
> -	unsigned long total, pos, val;
> +	unsigned int events;
> +	unsigned long total, pos;
>  	irqreturn_t ret = IRQ_NONE;
>  	struct dw_edma_chan *chan;
>  	unsigned long off, *mask;
> +	u32 val;
>
>  	if (dir == EDMA_DIR_WRITE) {
>  		total = dw->wr_ch_cnt;
> @@ -197,20 +199,28 @@ dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
>  		if (unlikely(dw_edma_core_ch_ignore_irq(chan)))
>  			continue;
>
> -		val = dw_hdma_v0_core_status_int(chan);
> -		if (FIELD_GET(HDMA_V0_STOP_INT_MASK, val)) {
> -			dw_hdma_v0_core_clear_done_int(chan);
> -			handler(chan, DW_EDMA_IRQ_STOP);
> +		events = 0;
> +		scoped_guard(raw_spinlock_irqsave, dw_edma_event_lock(chan)) {
> +			val = dw_hdma_v0_core_status_int(chan);
>
> -			ret = IRQ_HANDLED;
> -		}
> +			if (FIELD_GET(HDMA_V0_STOP_INT_MASK, val)) {
> +				events |= DW_EDMA_IRQ_STOP;
> +				dw_hdma_v0_core_clear_done_int(chan);
> +			}
>
> -		if (FIELD_GET(HDMA_V0_ABORT_INT_MASK, val)) {
> -			dw_hdma_v0_core_clear_abort_int(chan);
> -			handler(chan, DW_EDMA_IRQ_ABORT);
> +			if (FIELD_GET(HDMA_V0_ABORT_INT_MASK, val)) {
> +				events |= DW_EDMA_IRQ_ABORT;
> +				dw_hdma_v0_core_clear_abort_int(chan);
> +			}
>
> -			ret = IRQ_HANDLED;
> +			if (events)
> +				handler(chan, events);
>  		}
> +
> +		if (!events)
> +			continue;
> +
> +		ret = IRQ_HANDLED;
>  	}
>
>  	return ret;
> --
> 2.51.0
>
