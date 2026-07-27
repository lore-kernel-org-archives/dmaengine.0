Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020093.outbound.protection.outlook.com [52.101.229.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA68434E42;
	Mon, 27 Jul 2026 17:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171833; cv=fail; b=VtGbkXnGq9NMzF6LH9nJM5rxY29tVVOvBdByv4QbMQY6/kPDH1XSxmT9/NBZQstFY+a67g7hzr5f7mJQUDRo1D89oSVLMNjM8oTlhqNY7ilZxgYP/UxAibR+nUJq5nXuEye07Aihrt9qKrFL+/rlvvY5iIhpoPoFdMEorvj1QE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171833; c=relaxed/simple;
	bh=SW1C78DINgniVclwR1GXpIa3VcT4LkGUTf6DxwCoZfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XwhyLuPKzbLmk0SZEkA4KPCBkEeCxELVrt7APs86qVhknHq1Tnk6JOe+AyHZmsv+VhuuY5YviuPYefmirkbOjkta2+H5XHvXAv6c8r1h2LBQTkMW5iC05yMYHDynpsOn8ADP0+XL+/VBjVnKlKdvLdHCRtf3q2g2wc30fQj3Bvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=M0CdckK7; arc=fail smtp.client-ip=52.101.229.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="M0CdckK7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqB+UDKG6fi6piP5fbr3/fdOIeV2qXgiq4dOm8FqZf1lj0+I78UjO+4XKW4nWh3cDkGF/kUpS5jZJMa4/B7T6FhUzTNCi1J4saIAbHkgXciT6E4yY9G5EhukPwbbMO5h7PiPhotaSZJ3O3IioPL8ZsJq+CO1XE9fQ+rudLMRv/HODCbN11NunERYra1BOp/shIv5W6+nR+eqjIEwULK2L62/v/xVj9sFe5sYs2sQQE4+3H5bBksG4yp+QudY9ov9WKSNlgCqkh2K2cKUpPhndPR3q+yb1gtzCaUKkA/WFMxr5IynEvBXocnztUaxeWD1I0lnyra1KgJmly8S6fBpfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wdyOIxt+TgOXSqtOFEnp8lGG5MU9mAvbSWbg02xVuYo=;
 b=fn/JpIRGRmKAFQG4aH5+l57A8ye4AsX8N0//Q9tWLyIdX6vCaYni8BUqS4eQNqARQNMXfkamWUBpTF/yoRIp8S3fpZ6D5umuV8J0GBGEI1p4yVashMXMa9xqSnf9otlgkVI9jGALOhXNBDtw/8L/4N1y/2TOuzHd5vq+2H4PbNmdCvixcT4OKlLLjBU0LJRCZppuW8EPWNcs+MZEQPXsyVrWMVaekhLONsLF6Ip3Ey67fgTCeA3cI31dS9exDBoAaHc25S0VvWgv2YU3hwdHgoOkLRg12DAobaDBzY2ibgyM3Tf3bimP0qqI00vv0CC//eGmCUn2hC55MLtHKf3aFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdyOIxt+TgOXSqtOFEnp8lGG5MU9mAvbSWbg02xVuYo=;
 b=M0CdckK7fQiKSsxO5eVO4Mq0KPCMvTfabIAuDh9zkSp8GOb8bflkx5KS2MIrVw7bzPgsaFqVMCYSnJmWnGe/7o7ImWpzpak8/XgyFF7GkFdWBSsUrW2hBEFF20xxW9Op0wsVLrde0fomrt0Zao5gIRzrTZjOEqN0oaGoAXC3Fu8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB4609.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:1a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Mon, 27 Jul
 2026 17:03:42 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:03:42 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Christoph Hellwig <hch@lst.de>,
	Serge Semin <fancer.lancer@gmail.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Niklas Cassel <cassel@kernel.org>
Cc: Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/24] dmaengine: dw-edma: Reclaim issued descriptors from IRQ-paired LL progress
Date: Tue, 28 Jul 2026 02:03:12 +0900
Message-ID: <20260727170323.2321369-14-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260727170323.2321369-1-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0134.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::13) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: 23c47eab-1b65-4384-c284-08deec0102cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|23010399003|10070799003|18002099003|22082099003|10067099003|56012099006|921020|6133799003;
X-Microsoft-Antispam-Message-Info:
	sb9YbOYas5dy5HACYDIk0klxoHGKsJu1rH0pqlPEgylkjFSJXwcohkz5Zku1BOtQZ6zeFy0wgiOu+9HWPXXt6Nu81HVKJfkG5SZLsJRp7VBXrsfcR5qCNKHg1t7QY5Oi225Ent8ZMrtsi6PUuURAZWoFcfglTzgmnnjnfKDLTICp0L6yCg8/tj6QelryzaUk5AK5XSHKtAMaZm04LH6nZSCKoqoEPl7RaqR0G1R8hZKBI+SThEtSUMJGenSsmgE49aw9r5XUywpvajxcqDY0I0BM3XxTh83rpGEmWN8BiwWKNP+O+O6Y/Wn4LJKYflnSf8f3U5rfCoTfehDjEbpaFuDcWLZKwj0O0+rpOFaP1IWwM1TMHpxpsBP8dYgI2Zao+pLjWV5NiYlkhqe2kTW02+bvjny3YSiepbT4DtmVPIn/62W7W4t4fkcJOp5KLMoyNgr/bwjnJmTGk5GbfrHKrrStK6pePRSUlVKXvnMB7i7MrSNCm1XOa2PSb53NMJnqHRkY8dn9XtSBSvp56z7vNzedhz3jeiPxC1cLaLuh+/iyh/JH5XoeDfcxFmDnNO6TfHjYwlZyUyhKzMh0+jqsGN9SJJCR+MtrRShQ2x3+6wsbBaxb1WbrmzwMSHQawduTZmSgyLd4shMEuAQE+MMz2jfV0cOui8pfkN5mCJVwi339ORKIC0Bk2jKUExrIEOroY/OnDEFD2f7XfDgeL198uw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(23010399003)(10070799003)(18002099003)(22082099003)(10067099003)(56012099006)(921020)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tPxJ0BYDRnPEpZOgUY0VqwEqYOngtgxp+U82glldWqbiZqC7IKRCihWmb10Y?=
 =?us-ascii?Q?z9/QtPyYue6t8lUPLoFmnWupcO9T7bnHzfwaGyj4rOKdFZRdKGWpeBNTOo4M?=
 =?us-ascii?Q?x0rnA4LstnlCDWUctyZf6tqXdOMpzyumeVqn8dmAGuQmt+PTWM4+IXCTB7Fx?=
 =?us-ascii?Q?X3DQK+YVoM8DEnGgPR5pBhM98zYhY0AUPEOocsWPntMnYOWW041sF9FhOeYh?=
 =?us-ascii?Q?2WtDEAmx1jsJhrIDndnfOLG8+sDIzHd2y/1wqxqFt84ei3rDvF+YYtUdbOoZ?=
 =?us-ascii?Q?RxWY3Wq+Qk7tu+KBSS0d+uQu5QfYhjYzZMMelSDvy/rvmCgJrDW3sH9nnXyP?=
 =?us-ascii?Q?HBTA6Vv+vqstaKlhH80187j3YtaeMYO85OPrqxp6zc0vB++A8MPNnmn1dm2R?=
 =?us-ascii?Q?O6I6eI/jxGdz7o5GHVFXY6lnJ/0ymTwwhcOrsotghJZT036SXSZayhQO7iV9?=
 =?us-ascii?Q?O7TEG3bWITgPANjchLjoLak3e4futcVMFgm3alTSZBr+X4/s0sU22WiNpe9Y?=
 =?us-ascii?Q?F+LjjK29P9RPtQqhf3j/a0mejgTOVllZpZU799tA+Zi57QbcMwYamEeAiG4c?=
 =?us-ascii?Q?JXTBY9GBS6EA2+37h5oiI7zt7KTtnvlGgJayjfxMRXDaw/c56rjP4djZ3wId?=
 =?us-ascii?Q?roncaaEWDRsoz5tIld+W6HxjBrm0yBcYwuacZTgBRYwRRpmZXXA+aPDMaLdE?=
 =?us-ascii?Q?mVOutTbC1fSdr3tDXFNtipkFqAjmtEYVovJsjyTqIkwviF/yq6JdgkpQ/9Am?=
 =?us-ascii?Q?i8tI+horG5mH1iU3msTrUHFG1VVVScqesn2bHheF1z6b/Bezx6O+aSXIeylG?=
 =?us-ascii?Q?7aHhWhbZvDWh0SQo7nsNFfn9iGPr6RyFIO/IsZYOmLolAdIpaARH8rvpbJPm?=
 =?us-ascii?Q?6GqKYCvaTu2tcfKz+hYZw+yohzApyZpFJje014d2E8VVh1VqTBDI1dmPhxhh?=
 =?us-ascii?Q?H5tF2Tav1eh+Tcn6/veO6z9Q6Bx47AfbgbH1ChAF5SsioF4HwFrCUc+A2yVv?=
 =?us-ascii?Q?i2AmIaq40bneUwXeVnDqcjIdkU5WRFg+iVkMWKTP20/0pTWrfbaLpVXDUZgD?=
 =?us-ascii?Q?+Oz4nus135seVr57ybutY1WytzZU6zn45lb0x059AR9olRwaRFPh4yl8XGJ5?=
 =?us-ascii?Q?JQ+fAcZ/XCjsYkVNnTmjxtm+xhTijRfpuS7Oi039YD6tWvcFgoU+shlfl7X0?=
 =?us-ascii?Q?j4lo6cn+1l5AnN0fJ5clmbLlOT/9VfPKvuDDusDqDTt1eY8EEhVCNtLIBZ+l?=
 =?us-ascii?Q?2HEi73Pm3PqTSJ4gHtH7869f9OGxQiKoRYOEMWXOnq/1bWAKUQxeB8IfKEnL?=
 =?us-ascii?Q?Q15acaTNhcQGTPJA6ruufH1HGoeqNv8pYcRuyY4DogtD5LfN6XbrUBUxJTZB?=
 =?us-ascii?Q?HNhGav9ds7OcovXj002lCkqGDROH4tj9DbhcTUpZNqhwOT4NPp1nX59lAuXO?=
 =?us-ascii?Q?E3VB0v2GiAiP2/E+wJy5YiJznhd+GUmgYHmdDVVoaVvqVvxkvJqfcruBROK/?=
 =?us-ascii?Q?nHEnV5jOO3WB+D1Y2YyqTWmA8Xs8E9ge64piuRPzdv5MZtupiOTylm5VNEII?=
 =?us-ascii?Q?C9KBcQQlUhpt0qBU1/2JYj1EktK4Skmj5pnbpe8XbNpaJp8p1QP0UDDjbBvk?=
 =?us-ascii?Q?eeC+rlN+f7v2NphIm746E+1YKIIyOorcy+Yo3i7TZpcmZ5TINQmoJHmSBxMJ?=
 =?us-ascii?Q?lBXy4NUuulPu/ylQZLNmjPYFyqLNIuygkkp8FgFHcC3dvkoYgWqMvptxqPLZ?=
 =?us-ascii?Q?/R/m8Q6XGaGt5ecQiiLBWqISNcaZizFAO6ONQpLZeLFJGqpj2iKz?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c47eab-1b65-4384-c284-08deec0102cb
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:03:41.9903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZV8iwRDWJw/Q1HDBcwKTh3Aykn9f3QMhVV7AfCApZbgwHoltkYZ2DYgLxhIVpnkO73MV6EOPF+2nRkZ85rWpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB4609

Dynamic append can place entries from several descriptors in one LL
ring. Track the consumed boundary in ll_done, reuse entries behind it,
and complete descriptors in issue order as done_burst advances.

Normalize each IRQ-paired LLP sample to the exclusive boundary used by
ll_done. A stopped sample points to the next entry. Keep a running
sample one entry behind the raw LLP so an entry is not recycled before
payload completion is established. For legacy eDMA, treat DONE as a
stopped boundary only when channel status is complete and transfer size
is zero.

Record the first outstanding physical LL entry in each descriptor and
verify that it matches ll_done before consuming that descriptor. On a
mismatch, warn and resynchronize only if the sampled boundary has
reached the descriptor; otherwise stop without completing it.

Reclaiming entries as they are consumed also lets a descriptor larger
than the ring advance. Keep one data entry free so a physical index
remains unambiguous in the active producer window. Clear any published
ring state on termination or abort before starting another transfer.

LL progress now has its own completion path, so fold the temporary
lock-held DONE helper back into its only caller.

Suggested-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - Keep STOP and ABORT ring resets when switching the consumer boundary
    to ll_done. (Frank, Sashiko)
  - Use explicit LL event types for LLP normalization and clarify ring
    occupancy and one-shot snapshot handling. (Frank)
  - State the strict descriptor publication and retirement order.
    (Frank)
  - Record each descriptor's physical LL boundary and check it before
    consuming progress. (Frank)
  - Split event capture and channel-start serialization into preparatory
    patches, then fold the temporary lock-held DONE helper once LL
    progress gets its own path. (Sashiko)

 drivers/dma/dw-edma/dw-edma-core.c    | 289 ++++++++++++++++++++++----
 drivers/dma/dw-edma/dw-edma-core.h    |   4 +
 drivers/dma/dw-edma/dw-edma-v0-core.c |   6 +
 3 files changed, 254 insertions(+), 45 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 5bf08ff0fe46..d4c0be2cbaef 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -53,13 +53,6 @@ dw_edma_alloc_desc(struct dw_edma_chan *chan, size_t nburst)
 {
 	struct dw_edma_desc *desc;
 
-	/*
-	 * For now, a descriptor that does not fit would stall the channel
-	 * forever: reject it up front.
-	 */
-	if (!chan->non_ll && nburst > chan->ll_max - 1)
-		return NULL;
-
 	desc = kzalloc_flex(*desc, burst, nburst, GFP_NOWAIT);
 	if (unlikely(!desc))
 		return NULL;
@@ -79,9 +72,17 @@ static void dw_edma_ll_snapshot_discard_locked(struct dw_edma_chan *chan)
 {
 	lockdep_assert_held(dw_edma_event_lock(chan));
 
+	chan->ll_irq.idx = -1;
 	chan->ll_irq.event = DW_EDMA_LL_EVENT_NONE;
 }
 
+static void dw_edma_ll_snapshot_discard(struct dw_edma_chan *chan)
+{
+	guard(raw_spinlock_irqsave)(dw_edma_event_lock(chan));
+
+	dw_edma_ll_snapshot_discard_locked(chan);
+}
+
 static void dw_edma_irq_events_discard(struct dw_edma_chan *chan)
 {
 	guard(raw_spinlock_irqsave)(dw_edma_event_lock(chan));
@@ -121,6 +122,7 @@ dw_edma_ll_snapshot_take(struct dw_edma_chan *chan,
 	if (dw_edma_abort_latch_locked(chan))
 		return false;
 
+	/* Consume each snapshot once, even if its boundary is later rejected. */
 	*snapshot = chan->ll_irq;
 	dw_edma_ll_snapshot_discard_locked(chan);
 
@@ -214,7 +216,13 @@ static u32 dw_edma_core_get_used_num(struct dw_edma_chan *chan)
 
 static u32 dw_edma_core_get_free_num(struct dw_edma_chan *chan)
 {
-	/* Keep one data entry free so equal indices mean an empty ring. */
+	/*
+	 * ll_done is the consumer boundary, so only the distance from ll_done
+	 * to ll_head is occupied. Descriptor completion is tracked separately
+	 * with done_burst.
+	 *
+	 * Keep one data entry free so equal indices mean an empty ring.
+	 */
 	return chan->ll_max - 1 - dw_edma_core_get_used_num(chan);
 }
 
@@ -223,6 +231,25 @@ static bool dw_edma_ll_pending(struct dw_edma_chan *chan)
 	return chan->ll_head != chan->ll_done;
 }
 
+static u32 dw_edma_core_ch_transfer_size(struct dw_edma_chan *chan)
+{
+	if (!chan->dw->core->ch_transfer_size)
+		return U32_MAX;
+
+	return chan->dw->core->ch_transfer_size(chan);
+}
+
+static bool dw_edma_ll_done_is_stopped(struct dw_edma_chan *chan)
+{
+	/*
+	 * Native HDMA reports STOP separately. The legacy interrupt interface
+	 * uses DONE for both progress and stop, so confirm a stopped boundary
+	 * with channel status and transfer size.
+	 */
+	return dw_edma_core_ch_status(chan) == DMA_COMPLETE &&
+	       dw_edma_core_ch_transfer_size(chan) == 0;
+}
+
 static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 {
 	struct dw_edma_chan *chan = desc->chan;
@@ -230,6 +257,9 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 	u32 free;
 
 	free = dw_edma_core_get_free_num(chan);
+	if (free && desc->start_burst == desc->done_burst)
+		desc->ll_start = chan->ll_head;
+
 	for (i = desc->start_burst; i < desc->nburst && free; i++, free--) {
 		/*
 		 * Refresh the link element before filling the last data slot so
@@ -251,7 +281,6 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 		}
 	}
 
-	desc->done_burst = desc->start_burst;
 	desc->start_burst = i;
 }
 
@@ -351,6 +380,134 @@ static void dw_edma_finish_termination(struct dw_edma_chan *chan)
 	chan->status = EDMA_ST_IDLE;
 }
 
+/* Must be called with vc.lock held. */
+static bool dw_edma_ll_clean_pending(struct dw_edma_chan *chan, int idx)
+{
+	struct virt_dma_desc *vd, *_vd;
+	bool advanced = false;
+	u32 done, gap;
+
+	if (idx < 0 || (u32)idx >= chan->ll_max)
+		return false;
+
+	done = dw_edma_core_get_ll_dist(chan, chan->ll_done, idx);
+	if (!done || done > dw_edma_core_get_used_num(chan))
+		return false;
+
+	list_for_each_entry_safe(vd, _vd, &chan->vc.desc_issued, node) {
+		struct dw_edma_desc *desc = vd2dw_edma_desc(vd);
+		u32 consumed;
+
+		if (!done)
+			break;
+
+		if (WARN_ON_ONCE(desc->done_burst > desc->start_burst ||
+				 desc->start_burst > desc->nburst))
+			return advanced;
+
+		/*
+		 * start_burst is the next burst to append. done_burst counts
+		 * bursts already consumed by hardware.
+		 */
+		consumed = desc->start_burst - desc->done_burst;
+		if (!consumed)
+			break;
+
+		/*
+		 * ll_start ties the descriptor counters to the physical ring.
+		 * If accounting lost entries before this descriptor, skip them
+		 * only after the sampled boundary has reached ll_start.
+		 */
+		if (WARN_ON_ONCE(desc->ll_start != chan->ll_done)) {
+			gap = dw_edma_core_get_ll_dist(chan, chan->ll_done,
+						       desc->ll_start);
+			if (gap > done)
+				return advanced;
+
+			chan->ll_done = desc->ll_start;
+			done -= gap;
+			advanced = true;
+			if (!done)
+				break;
+		}
+
+		consumed = min(done, consumed);
+		desc->done_burst += consumed;
+		desc->ll_start = (desc->ll_start + consumed) % chan->ll_max;
+		chan->ll_done = desc->ll_start;
+		done -= consumed;
+		advanced = true;
+
+		/*
+		 * Descriptors are published and retired in strict list order. A
+		 * later descriptor cannot complete until this one is fully consumed.
+		 */
+		if (desc->done_burst != desc->nburst)
+			break;
+
+		/* Hardware has consumed this descriptor's LL entries. */
+		dw_hdma_set_callback_result(vd, DMA_TRANS_NOERROR);
+		list_del(&vd->node);
+		vchan_cookie_complete(vd);
+	}
+
+	WARN_ON_ONCE(done);
+
+	return advanced;
+}
+
+static int
+dw_edma_ll_recycle_idx(struct dw_edma_chan *chan, int idx,
+		       enum dw_edma_ll_event event)
+{
+	if (idx < 0 || (u32)idx > chan->ll_max)
+		return -EINVAL;
+
+	/*
+	 * Convert the raw LLP index to the exclusive boundary used by ll_done.
+	 * For both eDMA and HDMA, once the engine has stopped, LLP points to
+	 * the next element. ll_max is the link element, hence the following
+	 * data boundary is 0.
+	 */
+	if (event == DW_EDMA_LL_EVENT_STOP)
+		return idx == chan->ll_max ? 0 : idx;
+
+	/*
+	 * Moving a running index one entry back cannot represent index 0
+	 * without wrapping it to ll_max - 1. That could falsely consume a full
+	 * producer window, so wait for another sample or STOP.
+	 */
+	if (!idx)
+		return -EINVAL;
+
+	/*
+	 * A running eDMA LLP can move ahead of payload completion, so keep the
+	 * boundary one entry behind it.
+	 *
+	 * DWC PCIe Controller Databook 6.10a-lca06, Section 7.2.1, Table 7-3
+	 * describes an HDMA watermark LLP as an inclusive LLE recycling
+	 * boundary, which would normally translate to idx + 1. During testing
+	 * on a DWC HDMA 6.30a integration, using that boundary for DMAengine
+	 * completion let clients release DMA mappings while hardware still
+	 * accessed them, causing IOMMU faults. Keep the boundary one entry
+	 * behind the raw LLP for HDMA as well. Stopped samples continue to use
+	 * the next-entry boundary above.
+	 */
+	return idx == chan->ll_max ? chan->ll_max - 1 : idx - 1;
+}
+
+/*
+ * Must be called with vc.lock held. Consume a recorded LL progress
+ * boundary, if any. Advance ll_done and complete descriptors covered by
+ * the newly consumed range. Return true if ll_done advanced.
+ */
+static bool
+dw_edma_ll_consume_progress(struct dw_edma_chan *chan, int idx)
+{
+	/* Ignore duplicate or stale progress. */
+	return dw_edma_ll_clean_pending(chan, idx);
+}
+
 static void dw_edma_core_ll_sync(struct dw_edma_chan *chan)
 {
 	/*
@@ -563,6 +720,8 @@ static void dw_edma_device_issue_pending(struct dma_chan *dchan)
 	if (chan->configured && vchan_issue_pending(&chan->vc) &&
 	    chan->request == EDMA_REQ_NONE &&
 	    chan->status == EDMA_ST_IDLE) {
+		if (!chan->non_ll && !dw_edma_ll_pending(chan))
+			dw_edma_ll_snapshot_discard(chan);
 		chan->status = EDMA_ST_BUSY;
 		dw_edma_start_transfer(chan);
 		dw_edma_core_ch_maybe_doorbell(chan);
@@ -831,31 +990,30 @@ dw_edma_device_prep_interleaved_dma(struct dma_chan *dchan,
 	return dw_edma_device_transfer(&xfer, dw_edma_device_get_config(dchan, NULL));
 }
 
-/* Must be called with vc.lock held. */
-static void dw_edma_done_interrupt_locked(struct dw_edma_chan *chan)
+static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 {
 	struct dw_edma_desc *desc;
 	struct virt_dma_desc *vd;
+	unsigned long flags;
 
-	lockdep_assert_held(&chan->vc.lock);
-
-	if (chan->status == EDMA_ST_PAUSE)
+	spin_lock_irqsave(&chan->vc.lock, flags);
+	if (chan->status == EDMA_ST_PAUSE) {
+		spin_unlock_irqrestore(&chan->vc.lock, flags);
 		return;
+	}
 
 	switch (chan->request) {
 	case EDMA_REQ_NONE:
 	case EDMA_REQ_PAUSE:
 		vd = vchan_next_desc(&chan->vc);
-		if (!vd)
-			break;
-
-		desc = vd2dw_edma_desc(vd);
-		if (desc->start_burst >= desc->nburst) {
-			dw_hdma_set_callback_result(vd, DMA_TRANS_NOERROR);
-			list_del(&vd->node);
-			vchan_cookie_complete(vd);
-			if (!chan->non_ll)
-				chan->ll_done = chan->ll_head;
+		if (vd) {
+			desc = vd2dw_edma_desc(vd);
+			if (desc->start_burst >= desc->nburst) {
+				dw_hdma_set_callback_result(vd,
+							    DMA_TRANS_NOERROR);
+				list_del(&vd->node);
+				vchan_cookie_complete(vd);
+			}
 		}
 
 		if (chan->request == EDMA_REQ_PAUSE) {
@@ -868,25 +1026,12 @@ static void dw_edma_done_interrupt_locked(struct dw_edma_chan *chan)
 		break;
 
 	case EDMA_REQ_STOP:
-		vd = vchan_next_desc(&chan->vc);
-		if (!vd)
-			break;
-
 		dw_edma_finish_termination(chan);
 		break;
 
 	default:
 		break;
 	}
-	dw_edma_core_ch_maybe_doorbell(chan);
-}
-
-static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&chan->vc.lock, flags);
-	dw_edma_done_interrupt_locked(chan);
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
 
@@ -899,7 +1044,37 @@ static void dw_edma_ll_interrupt(struct dw_edma_chan *chan)
 	if (!dw_edma_ll_snapshot_take(chan, &snapshot))
 		return;
 
-	dw_edma_done_interrupt_locked(chan);
+	if (chan->status == EDMA_ST_PAUSE)
+		return;
+
+	dw_edma_ll_consume_progress(chan, snapshot.idx);
+
+	if (snapshot.event == DW_EDMA_LL_EVENT_PROGRESS &&
+	    chan->request != EDMA_REQ_NONE)
+		goto out;
+
+	switch (chan->request) {
+	case EDMA_REQ_NONE:
+		dw_edma_start_transfer(chan);
+		chan->status = dw_edma_ll_pending(chan) ?
+			       EDMA_ST_BUSY : EDMA_ST_IDLE;
+		break;
+
+	case EDMA_REQ_PAUSE:
+		dw_edma_set_request(chan, EDMA_REQ_NONE);
+		chan->status = EDMA_ST_PAUSE;
+		break;
+
+	case EDMA_REQ_STOP:
+		dw_edma_finish_termination(chan);
+		break;
+
+	default:
+		break;
+	}
+
+out:
+	dw_edma_core_ch_maybe_doorbell(chan);
 }
 
 static bool dw_edma_abort_interrupt(struct dw_edma_chan *chan)
@@ -962,21 +1137,44 @@ static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
 static void dw_edma_record_irq(struct dw_edma_chan *chan, unsigned int events)
 {
 	struct dw_edma_ll_snapshot snapshot = {
-		.event = events & DW_EDMA_IRQ_STOP ?
-			 DW_EDMA_LL_EVENT_STOP : DW_EDMA_LL_EVENT_PROGRESS,
+		.idx = -1,
+		.event = DW_EDMA_LL_EVENT_NONE,
 	};
 	unsigned int pending = 0;
 
 	lockdep_assert_held(dw_edma_event_lock(chan));
 
+	/*
+	 * Classify the LL event before normalizing its LLP sample to the
+	 * exclusive consumer boundary. Keep STOP even without a valid
+	 * boundary so deferred handling still sees that the run ended.
+	 */
+	if (!chan->non_ll &&
+	    (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_PROGRESS |
+		       DW_EDMA_IRQ_STOP))) {
+		if ((events & DW_EDMA_IRQ_STOP) ||
+		    ((events & DW_EDMA_IRQ_DONE) &&
+		     dw_edma_ll_done_is_stopped(chan)))
+			snapshot.event = DW_EDMA_LL_EVENT_STOP;
+		else
+			snapshot.event = DW_EDMA_LL_EVENT_PROGRESS;
+
+		snapshot.idx = dw_edma_ll_recycle_idx(chan,
+						      dw_edma_core_ll_cur_idx(chan),
+						      snapshot.event);
+		if (snapshot.idx < 0 &&
+		    snapshot.event != DW_EDMA_LL_EVENT_STOP)
+			snapshot.event = DW_EDMA_LL_EVENT_NONE;
+	}
+
 	if ((events & DW_EDMA_IRQ_ABORT) && chan->abort_pending)
 		pending |= DW_EDMA_DEFERRED_ABORT;
 
-	if (chan->non_ll) {
-		if (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_STOP))
-			pending |= DW_EDMA_DEFERRED_DONE;
-	} else if (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_PROGRESS |
-			     DW_EDMA_IRQ_STOP)) {
+	if (chan->non_ll &&
+	    (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_STOP)))
+		pending |= DW_EDMA_DEFERRED_DONE;
+
+	if (snapshot.event != DW_EDMA_LL_EVENT_NONE) {
 		/* STOP is final for this run; do not replace it with progress. */
 		if (chan->ll_irq.event != DW_EDMA_LL_EVENT_STOP ||
 		    snapshot.event == DW_EDMA_LL_EVENT_STOP)
@@ -1223,6 +1421,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 		chan->irq_mode = dw_edma_get_default_irq_mode(chan);
 		INIT_WORK(&chan->irq_work, dw_edma_irq_work);
 		atomic_set(&chan->irq_pending, 0);
+		chan->ll_irq.idx = -1;
 		chan->ll_irq.event = DW_EDMA_LL_EVENT_NONE;
 		chan->abort_pending = false;
 		raw_spin_lock_init(&chan->event_lock);
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index 2bfbd1b25703..3d4844b5c6e3 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -76,6 +76,7 @@ struct dw_edma_desc {
 
 	u32				alloc_sz;
 
+	u32				ll_start;	/* First outstanding LL entry */
 	size_t				done_burst;
 	size_t				start_burst;
 	size_t				nburst;
@@ -83,6 +84,7 @@ struct dw_edma_desc {
 };
 
 struct dw_edma_ll_snapshot {
+	int				idx;
 	enum dw_edma_ll_event		event;
 };
 
@@ -118,6 +120,7 @@ struct dw_edma_chan {
 	 * LL event recorded by the hard IRQ handler. The event scope lock
 	 * serializes its capture with a new hardware run; vc.lock serializes
 	 * its consumption with LL state.
+	 * Valid indices use the exclusive boundary convention of ll_done.
 	 */
 	struct dw_edma_ll_snapshot	ll_irq;
 	/* ABORT is terminal and remains pending across LL state changes. */
@@ -191,6 +194,7 @@ struct dw_edma_core_ops {
 	enum dma_status (*ch_status)(struct dw_edma_chan *chan);
 	/* Called with the event scope locked. */
 	bool (*ch_abort_int_pending)(struct dw_edma_chan *chan);
+	u32 (*ch_transfer_size)(struct dw_edma_chan *chan);
 	enum dw_edma_event_scope event_scope;
 	irqreturn_t (*handle_int)(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 				  dw_edma_handler_t handler);
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index 91b5d331cfa3..5efeaaaa404e 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -318,6 +318,11 @@ static enum dma_status dw_edma_v0_core_ch_status(struct dw_edma_chan *chan)
 		return DMA_ERROR;
 }
 
+static u32 dw_edma_v0_core_ch_transfer_size(struct dw_edma_chan *chan)
+{
+	return GET_CH_32(chan->dw, chan->dir, chan->id, transfer_size);
+}
+
 static bool dw_edma_v0_core_ch_abort_int_pending(struct dw_edma_chan *chan)
 {
 	u32 sts = GET_RW_32(chan->dw, chan->dir, int_status);
@@ -673,6 +678,7 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
 	.ch_count = dw_edma_v0_core_ch_count,
 	.ch_status = dw_edma_v0_core_ch_status,
 	.ch_abort_int_pending = dw_edma_v0_core_ch_abort_int_pending,
+	.ch_transfer_size = dw_edma_v0_core_ch_transfer_size,
 	.event_scope = DW_EDMA_EVENT_PER_DIR,
 	.handle_int = dw_edma_v0_core_handle_int,
 	.ll_data = dw_edma_v0_core_ll_data,
-- 
2.51.0

