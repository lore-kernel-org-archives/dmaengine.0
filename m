Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020119.outbound.protection.outlook.com [52.101.229.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1857479876;
	Wed, 12 Aug 2026 15:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550275; cv=fail; b=hFOAFcrYEJMv00Lbt/WwDygmQpMleH+s0/zMrW8SZC4V7FFbswCTE4rtiDlU29+/CCScyW9l32GJXOZ0SBxzOYB2oR+skzls0jxmjFXbozzHeRBFg9ZDcTrBJPj6F6rHz3nSQoJASf3bMn1YJDT3E+gFvDYWQi8BfV0tmH9FU1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550275; c=relaxed/simple;
	bh=Pu8N86kNVtpHsXFhUHLqqYlb3zcDHfJg4YKK6COtUYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aHs2E9iHfdp0PxhJwLSJRE9aj2xvRL8v+g62WQf2IRdmAqF3jTbfoaiTuR2AarQtdOFraPVgVfDqcTh0Sqj4qAa8zaXKQMiaxSKp9cFjs7oa9UQNHFYQWEGOQsLCOltGS2NwqAvCIDCpQYIVTFc07EykCYRUEhMEXzZz9Oensto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=ECKYiVow; arc=fail smtp.client-ip=52.101.229.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="ECKYiVow"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yCYh/ze+5/DjGLNe/NbMgCDUQ0w8wGoF/LdmsMUhkVNZcbUzIwW2dHvE4Krs738sT+vHM7VlA1osK9oMb99t3SYBDt2WcV9rwofVKBkh0YHoM+pCTMCUYpWZbfU1iLVEgwClfWoDqyIWvhNXnzI3VuM1TThdadUCs7lyF81x72MwVRDthRSTuGVIHau4TPGMBiGA7xubPpkewsL3waPoN6TVUdFA1YQyJnn3sPDSd5TsHoF4e4uH/XEGy3WNZ0l7BfBxpIQsdI6R6CnHoicN/dhGp2TOhJTvjjdJOGEePNvJpXYZmZ4nlKrNNzFme8hwYMJW3h+DDKz8ERGdLaSD3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=st2GYYL/DeudcaNsVx2uvm7ia0VEeQboPdq7hmatszc=;
 b=dkHaqhGaPMwIeiepZHqvBHtSRYcLPCRYFIYxEVJ3G5BHSQFxTHJH0eEheFRBXpTGMyc565Eb9MPk7iGZwPGYSjqmO42HizhCMesKQ7uMQpyBX67XIIK5z5QBr1lH+BH4/oCux2AGfXM57ElR6OWVoZ1xUNSKOGm+yGViBACwYjFn19PTZjyj3GPX4FLLXDmNi5yBgud8IWFNiNJiKVWzYO9jkIvXPynDnYfkZ8deIGWP9kA8Fo4h6MWByxYy3wCgGroopJqTL6uEcISrMGxJBLburXVUR/q5tCt9CnYJZ9GWTCwCqvagM8f062GQ9QyWUC7qzd56TuiXbAmFIXDtNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=st2GYYL/DeudcaNsVx2uvm7ia0VEeQboPdq7hmatszc=;
 b=ECKYiVow+lznJej+SqIjBc3nqRjeyP2evXkO8i3gJFEhtFfb0mx5ibGXROB/1ESwOzlPzkXVIx9kMmGc0lSXW25hQsN5bSUmnjfCFl+JnXJa61NvwgWoQz/zPMHYPH4reHbkdCO20gyMO8MX6zyq4fsWOOJmLkYV8keY5sT1dGg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB7115.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:42f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 12 Aug
 2026 15:57:36 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 15:57:36 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
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
Subject: [PATCH v5 13/24] dmaengine: dw-edma: Reclaim issued descriptors from IRQ-paired LL progress
Date: Thu, 13 Aug 2026 00:57:10 +0900
Message-ID: <20260812155721.2807506-14-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260812155721.2807506-1-den@valinux.co.jp>
References: <20260812155721.2807506-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0137.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::15) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: 943dfdaa-b5af-4b21-69b3-08def88a6dbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|7416014|376014|1800799024|366016|921020|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Fj1HvJCPneWiVf2jugKJgk9Q+fhtB1HDBWRQ5AXu8XZH0yHkMQha8J4AhMkEgzBzK+fb5b0IjXy+AMhMuYffrrZg3vw4yPuJNfoD7O9szvbHn5+GkIw5AKdb46go5lgp7Sw4xLDf/wt6y10HSh1aQMC3pAqw9eOIDcesJsv26aNp+gr0DbhJ59zB39o/K2oYNdOVKpaI//6AQ5Lrdn2DgoWRu6FU970U5cVJyJXM0PwSJ45NT0QuYYrMZ92RohJ4teXlh6MbA4oWnw6s4RgWsnfMvgRX90jhqthLOGaY5dIt4u6TOJWaCnc+GR8iBttvlK+PVEh8jHCmijEy31Ptmivlz8k3eLiBSptDEYHMj+52EakmMJny9YFKJnUUQXtygyIaa/M6IkXGg4IvKMSqSZdlmoLekvSZ37SdQCIsT7UhOl/8jp1sLlO7kDroF493wKexcV/WJyRFr2pY207KnI4SpGCg2a1Tqv8edLvg0sqjMOulf4kSApRM9c00xBbL9l/bF5hpAiX7VG3oQNrIAVM4hjdceqTtgyIEjqnO0lMstaPqvwxNbWYusQkax82op64WRspx4Kg3s8+fKRbY8wxA+WbkJeoo0BYqSqIRr8mvSeNyA29IvVt5pYfUQkAQwo+VL5S/Ff75zcxZB8M7eGam/L14ku56fF4JalpJr6psYc+sOB0HBHtmbZfEFCzq9Z7xpcRnq3z+EgZlkR4M5w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(7416014)(376014)(1800799024)(366016)(921020)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?moJbzFu6JnfU0Gtp+VPrKsLP0JnG/Ii7nByQ+w+wHcO7A7wjDu/5Yy/mKSre?=
 =?us-ascii?Q?V3aU5kH6eoTIdxkCFjt72f8FDq7kQ9BUXwlibfG7mmNEFwLpHLsN61TpWPA0?=
 =?us-ascii?Q?oF9QxJlAZ7eEXSo/0s+0zrfi1AvDL5nsUrhD9U7o0S+tLUJ5/iSZXVOQnpwW?=
 =?us-ascii?Q?R8EhgYJxdNgMrypP4ieKmsezmna7FxEr3gmFJWusp0Dusy0VjAxwCwODxwKg?=
 =?us-ascii?Q?IznslG8BeQPApQSljzdhS/xfLpk34metpSeKYXDS2mPpN2lTtTs3AR3S6/hP?=
 =?us-ascii?Q?OvDhhdKc3bGFZie7H3iglpsD7LarPdVXqPfwE1Ns7jGoDDc2SykZyBZFWn7O?=
 =?us-ascii?Q?lcexFB3fKoNDT0Zscc0WjM4h6F2ZGfXJPo8bG5c3kOQrGke1sv7ILUz+gVzD?=
 =?us-ascii?Q?LB27rt5MB7Gj+6XoZ3ZB5EHeBVC1tIMcKGIGCILdYvHq63AG6722knozvBC/?=
 =?us-ascii?Q?bJeyET3QhfJCe1dDw8wtw1qSAi++D2ayd8lwl3OOTXPURTIKjfOBKpxlmao3?=
 =?us-ascii?Q?kk6R3IfMTDrukwo88b71CqsLk5of6Nr03MMjOem3wGTrRA9d26ZOHXXkIYW5?=
 =?us-ascii?Q?dr0CKXejXhlwqsPmAsiJVysNrmfF76iBA//0ncSRfjZrbulnBfWmVt349z5c?=
 =?us-ascii?Q?1pf3OZn4AB4NbpJCWtR1zlN4OLvbp6w+kQZY5TfNYBMAIHv2jjwEqWdS7C0+?=
 =?us-ascii?Q?X0sDAnlvh8he3MPHe7cHoxYnFnJHXLQVGRsxGEnTxcaBOX+pFrYHmrX/WM1u?=
 =?us-ascii?Q?kpDA0XMRV9YOFRvl9Vgh5PGki3ibvqtc6rRP9ch6uKZa1PIWRk6M+wyDCWVR?=
 =?us-ascii?Q?D7/RlMpiW69nNc1XSZSHHWaCaOa51MKucDVEG11Ub0gnr/P+pHCZz7MAl/32?=
 =?us-ascii?Q?dAH6DXGd9nbRp9CtAG8j71dG5/12uM3CblztM1YU3faxr1dYMvthqFWCggaz?=
 =?us-ascii?Q?rgOV3Oor5kYdNnLrAk7rXDuVbx8sVc8TBS78ymfqnrjbo7CUeWJzRC5R5eXj?=
 =?us-ascii?Q?pYtZf7v3XjRwKGA0kpS3s6/+jGYq0vGiuBTjVjn6xoiXJQ+hGmyOsX7ZOUmP?=
 =?us-ascii?Q?wapAtDvzmHxhNWwe2X5kq6Ho6tQRXUa5DMkoTc+dt9W7LWwiYRApmsO5C4If?=
 =?us-ascii?Q?4wIAUe4AJd2SthIxFRbodfjbeP6nBiY6aQgTKMI4xE0+SQbB68ljUiL/qlz4?=
 =?us-ascii?Q?DHa97NfRYZW6LU9M56dYGV4kzO+dotCkI+prY8AjiM+9uX4asnQi/HdQ86RN?=
 =?us-ascii?Q?qSKk9fWifGJmfwPAUYWkBfT6Cj66WzzaoEJp0Nkzq/Q+whq0PjBecUAQKcRy?=
 =?us-ascii?Q?2x/o/SSH/B+vnLfKYrHN1jTbEqA60PSddeo2ehLW1vMQ08Ozea4QGO0Mc1IJ?=
 =?us-ascii?Q?8NOvU5eW5JkXK7203eYwf7Jbx91GhgRUIycqQXdJmqwUtBtjifkUZrMkb5Dp?=
 =?us-ascii?Q?lgUSCSAz+iCOi5DWiFgPCKEZC9lheI59Rc7i95aOoupJMtlImiOreEY+Js+K?=
 =?us-ascii?Q?M6NedG/eiRSa+s9L20SWdRxlbI5p6JQc4i/VasHMjZMUcSBNMkcTq/2xknMG?=
 =?us-ascii?Q?1wZaui0aL+XoK9m81464Yd4bzgWtkIqVhuXsJizPmpN3Q7gJ3vnJAtr9UAvF?=
 =?us-ascii?Q?XLs2V0m7kSAZtydnVjw/R7w/jEDaQrOMNbOziazcGg4t0nDrC39We+NrlHva?=
 =?us-ascii?Q?Sc4Hs+9bGmlV9MvWpPzvLWtAy8z+GUqsQgxGVDiF3y+Z4yeuYILk9ZW9gN/6?=
 =?us-ascii?Q?2BeVP/824GIybH2xoYMHcUFwHPZPNX38NRe7JPEJ6RgC1o14klM2?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 943dfdaa-b5af-4b21-69b3-08def88a6dbe
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:57:36.4167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3VUUUAKTIc8ttigNeaqBG5DQOhYXJ75IKXJpisUooiDcCAYQCUn6xxjKk5ZTvjzQyOBL0NdT9K82RiIvZbpz5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7115

Dynamic append can place entries from several descriptors in one LL
ring. Track the consumed boundary in ll_done, reuse entries behind it,
and complete descriptors in issue order as done_burst advances.

Normalize each IRQ-paired LLP sample to the exclusive boundary used by
ll_done. A stopped sample points to the next entry. Keep a running
sample one entry behind the raw LLP so an entry is not recycled before
payload completion is established. For the eDMA-compatible interrupt
interface, treat DONE as a stopped boundary only when channel status is
complete and transfer size is zero.

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
Changes in v5:
  - Adjust context after moving the issue_pending() snapshot discard to
    patch 11. dw_edma_ll_snapshot_discard() is no longer re-added here.
  - Fold dw_edma_ll_clean_pending() into
    dw_edma_ll_consume_progress(), removing the one-line wrapper
    (pure refactoring).

 drivers/dma/dw-edma/dw-edma-core.c    | 273 +++++++++++++++++++++-----
 drivers/dma/dw-edma/dw-edma-core.h    |   4 +
 drivers/dma/dw-edma/dw-edma-v0-core.c |   6 +
 3 files changed, 238 insertions(+), 45 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 1deaf2d0da91..363993c64c44 100644
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
@@ -79,6 +72,7 @@ static void dw_edma_ll_snapshot_discard_locked(struct dw_edma_chan *chan)
 {
 	lockdep_assert_held(dw_edma_event_lock(chan));
 
+	chan->ll_irq.idx = -1;
 	chan->ll_irq.event = DW_EDMA_LL_EVENT_NONE;
 }
 
@@ -128,6 +122,7 @@ dw_edma_ll_snapshot_take(struct dw_edma_chan *chan,
 	if (dw_edma_abort_latch_locked(chan))
 		return false;
 
+	/* Consume each snapshot once, even if its boundary is later rejected. */
 	*snapshot = chan->ll_irq;
 	dw_edma_ll_snapshot_discard_locked(chan);
 
@@ -215,7 +210,13 @@ static u32 dw_edma_core_get_used_num(struct dw_edma_chan *chan)
 
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
 
@@ -224,6 +225,25 @@ static bool dw_edma_ll_pending(struct dw_edma_chan *chan)
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
+	 * Native HDMA reports STOP separately. The eDMA-compatible interrupt
+	 * interface uses DONE for both progress and stop, so confirm a stopped
+	 * boundary with channel status and transfer size.
+	 */
+	return dw_edma_core_ch_status(chan) == DMA_COMPLETE &&
+	       dw_edma_core_ch_transfer_size(chan) == 0;
+}
+
 static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 {
 	struct dw_edma_chan *chan = desc->chan;
@@ -231,6 +251,9 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 	u32 free;
 
 	free = dw_edma_core_get_free_num(chan);
+	if (free && desc->start_burst == desc->done_burst)
+		desc->ll_start = chan->ll_head;
+
 	for (i = desc->start_burst; i < desc->nburst && free; i++, free--) {
 		/*
 		 * Refresh the link element before filling the last data slot so
@@ -252,7 +275,6 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 		}
 	}
 
-	desc->done_burst = desc->start_burst;
 	desc->start_burst = i;
 }
 
@@ -352,6 +374,127 @@ static void dw_edma_finish_termination(struct dw_edma_chan *chan)
 	chan->status = EDMA_ST_IDLE;
 }
 
+/*
+ * Must be called with vc.lock held. Consume an LL progress boundary,
+ * advance ll_done and complete descriptors covered by the consumed range.
+ * Return true if ll_done advanced.
+ */
+static bool dw_edma_ll_consume_progress(struct dw_edma_chan *chan, int idx)
+{
+	struct virt_dma_desc *vd, *_vd;
+	bool advanced = false;
+	u32 done, gap;
+
+	/* Ignore invalid, duplicate or stale progress. */
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
 static void dw_edma_core_ll_sync(struct dw_edma_chan *chan)
 {
 	/*
@@ -834,31 +977,30 @@ dw_edma_device_prep_interleaved_dma(struct dma_chan *dchan,
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
@@ -871,25 +1013,12 @@ static void dw_edma_done_interrupt_locked(struct dw_edma_chan *chan)
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
 
@@ -902,7 +1031,37 @@ static void dw_edma_ll_interrupt(struct dw_edma_chan *chan)
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
@@ -965,21 +1124,44 @@ static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
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
@@ -1227,6 +1409,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 		chan->irq_mode = dw_edma_get_default_irq_mode(chan);
 		INIT_WORK(&chan->irq_work, dw_edma_irq_work);
 		atomic_set(&chan->irq_pending, 0);
+		chan->ll_irq.idx = -1;
 		chan->ll_irq.event = DW_EDMA_LL_EVENT_NONE;
 		chan->abort_pending = false;
 
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index d709aa274300..27cab6ca5e67 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -71,6 +71,7 @@ struct dw_edma_desc {
 
 	u32				alloc_sz;
 
+	u32				ll_start;	/* First outstanding LL entry */
 	size_t				done_burst;
 	size_t				start_burst;
 	size_t				nburst;
@@ -78,6 +79,7 @@ struct dw_edma_desc {
 };
 
 struct dw_edma_ll_snapshot {
+	int				idx;
 	enum dw_edma_ll_event		event;
 };
 
@@ -113,6 +115,7 @@ struct dw_edma_chan {
 	 * LL event recorded by the hard IRQ handler. The event lock
 	 * serializes its capture with a new hardware run; vc.lock serializes
 	 * its consumption with LL state.
+	 * Valid indices use the exclusive boundary convention of ll_done.
 	 */
 	struct dw_edma_ll_snapshot	ll_irq;
 	/* ABORT is terminal and remains pending across LL state changes. */
@@ -189,6 +192,7 @@ struct dw_edma_core_ops {
 	enum dma_status (*ch_status)(struct dw_edma_chan *chan);
 	/* Called with dw_edma_event_lock(chan) held. */
 	bool (*ch_abort_int_pending)(struct dw_edma_chan *chan);
+	u32 (*ch_transfer_size)(struct dw_edma_chan *chan);
 	irqreturn_t (*handle_int)(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 				  dw_edma_handler_t handler);
 	void (*non_ll_start)(struct dw_edma_chan *chan, struct dw_edma_burst *child);
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index 20dff21a0603..b9d6205157b3 100644
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
@@ -677,6 +682,7 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
 	.ch_count = dw_edma_v0_core_ch_count,
 	.ch_status = dw_edma_v0_core_ch_status,
 	.ch_abort_int_pending = dw_edma_v0_core_ch_abort_int_pending,
+	.ch_transfer_size = dw_edma_v0_core_ch_transfer_size,
 	.handle_int = dw_edma_v0_core_handle_int,
 	.ll_data = dw_edma_v0_core_ll_data,
 	.ll_link = dw_edma_v0_core_ll_link,
-- 
2.51.0

