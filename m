Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021094.outbound.protection.outlook.com [40.107.74.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D4D4C77BE;
	Wed, 29 Jul 2026 14:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785335463; cv=fail; b=mgNyuWxWAImTaFVxQldthU65U7fUD1AAw/5xg39FlymBOEa82K/1TdA1GxlHkBjdsr2AxiooLUipSGs3VNPV8RZq+vIQ54ACGfynpjmE9D0Itx02CDIsJu3gzWpoZF8ntj+Cmsd3xatMxWPLLM/41GYekegrW+K7U4AufNjDud8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785335463; c=relaxed/simple;
	bh=55aKbKqg7Vwxckqov57gcu2ZrtbXrhlNuUfSNSNA328=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rENAeBJwaH4QBKoHcjpYlIRMnTnMNxTZmwS73WbV9vvOM2Taen+S9t4b9ZJVUPfuBNJ6mjI1gghrFim6Y8Cx42yP1aTY5yDgdWd0yQn9Qj1n7v6INqKMJm032Nn78XdI87eIqpXQt+FBD0ntZanloPpB75ozwHoQaxz6SkCcXmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=kMzhfnNf; arc=fail smtp.client-ip=40.107.74.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="kMzhfnNf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9bKoN+v4r2a39Ph1V6H7zaYdxCoedap+MmEUtOQotVCwzkkVWkrpzCsk09s+E/2qrUbRWY4cDLROxZE/JtAiTTfh86PH1FzcZpqVstau87AlU0wXLy+g9vT6nJyJwZsPfQEhFpXBVsX8uD505kRXNwXmJ7kaSMOu47yw/mDViAf+/gPQKDdx2a3rpUYQDeUth4GiN0sSPI3c2op+76WG8kZCFDDRZ9DhEuV7pgPiJOjKd17cFl8MeZJ4zsOpFOulSlAGhY/YEVALxm/NKYLRewOfuAwXldHnamySx9KuYLLn68oOBFTKmcKVhb6ALSLjSGYtQ/+jJkdU5msAm0y5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqrjppNixmPwrIh1IBFMBMEMvLB4bpnPS2zKb3Ozuhs=;
 b=N2iv4kvdeaF/8Yfk3e7g5O26KYnjtu33S8Ndi1ISTyQ51/RtApbmBlbujalUmmfMvpzEM8pnCjv0foPe/T1iHgyhuKaXOuH1J/swr+LmLS68bULYfjSJH/MtNo2pqJ2tgSdKeld3VlI9l+D05T79hZKXw4AM+lQxR9leWf90qdM5wel/jXHxHqPz5mzwwlW+W74C/hXZz2VFPjvMCSM2rLD4x+PMD/YNFdByxugpo3d+ROQlylAkG82+hjrdW7M1zs1HVxksUKPGtDj27W1a4464ppRuRqWU6dZXzO4xhp9E8Ul/hllklVgPqNa3pk+NPM3yzIPsMDbVwweLQDkV1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqrjppNixmPwrIh1IBFMBMEMvLB4bpnPS2zKb3Ozuhs=;
 b=kMzhfnNfC0Z1xW5MX5cUqY7FOlBcB223xPsvRmU4rh+7HsLiDc2nerM/axVYOOmQsveadxCRh2AfRhHTrjvGQx9rkXOdPW5oWiYgZahqIsNgUoTLq44uH1bxow1rdFm1tIAinKLdMNLx5IQ5Zz94g8rXcNicDPuimCm7OusnTlw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB5289.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 14:30:51 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 14:30:51 +0000
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
Subject: [PATCH v4 13/24] dmaengine: dw-edma: Reclaim issued descriptors from IRQ-paired LL progress
Date: Wed, 29 Jul 2026 23:30:25 +0900
Message-ID: <20260729143036.3087722-14-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729143036.3087722-1-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0158.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::9) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB5289:EE_
X-MS-Office365-Filtering-Correlation-Id: bb244f47-1f4a-4b33-63f4-08deed7dfdca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|7416014|366016|1800799024|23010399003|921020|18002099003|6133799003|56012099006|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jBQI9i5PKsWB1KtzGD0Oit18vvsPvsnE5nK6s5zcZRbwskcM8UlLi+Ygss0qiZlfmT5i/W5g9pegfsDUIhAX4AI+62un5w5lz9vGB80lQ7e122J6vC5YU/iPMNZuwHmCxUr1eF2X+d8xKAkqlwkr+GNkH/X/pdIIFdK2RHlov05RT2scK7+V6ZwV8GC++CxIMC2LElSNKaWeZX9L9IBd7wfM8BYphaZgTD5gb8kizlFR6qNQhWT1YzTDruHSXJ+kF6Ujb+Wbh74GSiv48afoV36LwEhVIJp0pSh/kof9O08VqeBnK8I1JMDl/dgf0SXPEdJ3A1em2RF+tIVIlXRIV78zdljnFpaRHRsfMBTkaW5UmUZay+vcLF7VpKg01q5JqXwzS4Db6V8lmaZLKwXjt4iT8Tv0jvaDpL039CClKCkQjtlNrEu2jTUfnDMQbMFUDqRXZ/Dow7UK62Na/LBflZDNqbyPQs1we0XJwFFR/ma6oBtKOqRZ+onOWpC6mtpZmBiHeDrolpVIG9eqPqdbGwngRnswxEWWwgpbYD7okP2swJZdXwLuwvsHYSb7LRGCgwWBndumJxT4yAZ9laO0ukmchlWhtEBsC/Vf/B2Z0cyHoRdLgTykosECSWdidBwodUfymk2yZ9YThB5IH01+aSatcI3FBM3jM3LIGWMbx7dU+d8LRy0EpCxAxpL6hxM0MM5hnQ/wXKJPbBzAtzzJxQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(7416014)(366016)(1800799024)(23010399003)(921020)(18002099003)(6133799003)(56012099006)(10067099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cOoxR85W2eMFojBhVSNi+HDw2Z+zvsiaS0qS0ZhIDKwCFh/wDYQAqWF1qgJc?=
 =?us-ascii?Q?9k6hK2XqmflJikKJHqbqmCH0liVbYe5x05TxCiQi/zskdr2psP+o6sR5XvU3?=
 =?us-ascii?Q?COltO02xU57xLrS6l+a4oU2A7uDdySU5JjzMhaYuFsZPD4Y6dChJV09iRCvg?=
 =?us-ascii?Q?3QA5ufzXzLHPQ1IZVbfFg1PDjbwBcf+hqV3tuJX7LzJ8jDYX85qHWP1tDnBl?=
 =?us-ascii?Q?/BHqK1GG7HEe7z26OCZXs1I9cDSEGsKJtb4ue5n0ffn8z3anYgQkRSGM2oKI?=
 =?us-ascii?Q?P/8C6WVJx++mS0aeHvrnZThbxjEiDXzBIYKYXmqhGxTTHNX1CCniTB8B4hrt?=
 =?us-ascii?Q?DmWF0963Rcjw5yhFKEOWlt4KejlODIdaDSf4XPJJ23KQwxl3VHWLQtT8N8Ok?=
 =?us-ascii?Q?pLSPh+SdD9q/mdnQo3FKduk5ErQOZHxoXXEsIdYfzYzAdoWUd02Ir5jkjRG4?=
 =?us-ascii?Q?BRdne+ouFKR7wjM1xBfTPTJXEA36MK40dQ6qY3A9H1ou8TDmuk3vzWcSTCgb?=
 =?us-ascii?Q?3XqbskvHkwd4l9cT12wvkouM6IILnTfIVFVY7g50pyjeweEk1UajC9cbhhTM?=
 =?us-ascii?Q?DH7cNhGKdJMJDpOPTm+6+YTSGFNBr3k0hBnJt9zShdOPj+FmxFWvR4CE+oLL?=
 =?us-ascii?Q?0HWy6byH++ChnXBTI5O6CKbgbuCMB1uEI32BUvecQX1fPHXxR8E2rskpxWAO?=
 =?us-ascii?Q?ew40xMihvm9Q5nw04hN9owbAKAuak0ZiVJlGAL/oEMuoP1v/3WUZkpL0xaiX?=
 =?us-ascii?Q?mxZicadcq5HDJqz85DxctIp30x64WHtKEZQ+idRd4e2btjgzAGl+JIAM8qAY?=
 =?us-ascii?Q?GglzrdKBXoL56KPPY9XbvVgZgJicPFCmJLToG6CO9IdJHVw/RoXVGwledoXo?=
 =?us-ascii?Q?qykEW981PxYiIy5EQoBUOxctXFqnhW4/nsdMgT8fQ+dWkn9Z5LdV03sBS0zv?=
 =?us-ascii?Q?2nk7zOfsYWTemveU/+H8sVUlNeKSl4SZw4cH7Iplqe0ciQU3niTG7axlN90U?=
 =?us-ascii?Q?Y9RRxgNi5C94HTw5E0vH7aV2wUenVuULLfDHXL5A9wSU1HZ4tkg+M6HRz1E2?=
 =?us-ascii?Q?N9SyfYMfwakmcyrlhTB8c8mXh2MoeSD3oWRVWTayQs9OLLp2+TZIbv7RSazo?=
 =?us-ascii?Q?7ANWHONG6I8cFOOAbCo93OGc4xxnpH8shmc2qVjNtebc0Pye6w8rQETCYcUN?=
 =?us-ascii?Q?DkMIZIIlSKIyXRRGGou3hfa1iZhYvZrSoxrWeBj18McHkHbxK+pAsSB+ecig?=
 =?us-ascii?Q?L2Tph7oisAV06oQ/HfT2KxQNj+FOfItOGenciK6MDQ/HiZvp4cp3bigaDSQz?=
 =?us-ascii?Q?wtJY96Xk9KfkaNTNJT+vZrYSN3wUTjTHjAQ2n5SFg+zRjK62TWsDZAXsRaCE?=
 =?us-ascii?Q?hIY7P1Sf1FE3kTmzqowxSTXtWtmGkTIozPQvWdxr2+HrLV8fkECUH0lvH8d+?=
 =?us-ascii?Q?KpFTMWl3RBG1p6KSPt5ci0M7MVF3EiMcGoM4YBnv+WMciG9T4OloePGFEhHe?=
 =?us-ascii?Q?JVE/OeyqSqc0RgRtU4GBflR+3rCM8JV0l3/fKewld62JcsCejHD/hLXno/Hk?=
 =?us-ascii?Q?x7T3N8gvc21c9OooCfmkGDE/zx+PEdjqdC02GoaMHG+S3/qP72Mf819LsL5S?=
 =?us-ascii?Q?EQZg7YgTluzSPb2QpBiyvERm864vWD8Q3ux8vaZiV7eo3yXZ2Ei3XNvUregq?=
 =?us-ascii?Q?n3XWUuPX3iQHIwaUMHIAUY5Q17IHweJHIdSctkzscL+r2C0uYdPL1BWdWZgq?=
 =?us-ascii?Q?GYIl9oYdAja4iUHi5519ASTXYHhoaU0hghbRwIrVbRFYhFYOaomL?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: bb244f47-1f4a-4b33-63f4-08deed7dfdca
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 14:30:51.8474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: onNDiAfLF89Dszh7+aQuDsRjII/aRKMHcC/c2M8nyEC+f3v3QMUDESc8QX9qkBc/m0BP8RABeExux0zCQnEbvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB5289

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
Changes in v4:
  - Rephrase misleading "legacy eDMA" wording; it refers to the
    eDMA-compatible interface, not a specific map format.

 drivers/dma/dw-edma/dw-edma-core.c    | 289 ++++++++++++++++++++++----
 drivers/dma/dw-edma/dw-edma-core.h    |   4 +
 drivers/dma/dw-edma/dw-edma-v0-core.c |   6 +
 3 files changed, 254 insertions(+), 45 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 4c4f19bf3c16..75d659f65a6d 100644
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
+	guard(spinlock_irqsave)(dw_edma_event_lock(chan));
+
+	dw_edma_ll_snapshot_discard_locked(chan);
+}
+
 static void dw_edma_irq_events_discard(struct dw_edma_chan *chan)
 {
 	guard(spinlock_irqsave)(dw_edma_event_lock(chan));
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
 
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index 82c0d66747be..36fe8c69769d 100644
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
 	 * LL event recorded by the hard IRQ handler. The event scope lock
 	 * serializes its capture with a new hardware run; vc.lock serializes
 	 * its consumption with LL state.
+	 * Valid indices use the exclusive boundary convention of ll_done.
 	 */
 	struct dw_edma_ll_snapshot	ll_irq;
 	/* ABORT is terminal and remains pending across LL state changes. */
@@ -189,6 +192,7 @@ struct dw_edma_core_ops {
 	enum dma_status (*ch_status)(struct dw_edma_chan *chan);
 	/* Called with the event scope locked. */
 	bool (*ch_abort_int_pending)(struct dw_edma_chan *chan);
+	u32 (*ch_transfer_size)(struct dw_edma_chan *chan);
 	irqreturn_t (*handle_int)(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 				  dw_edma_handler_t handler);
 	void (*non_ll_start)(struct dw_edma_chan *chan, struct dw_edma_burst *child);
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index 451e421b11b8..a29a2683512e 100644
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
@@ -676,6 +681,7 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
 	.ch_count = dw_edma_v0_core_ch_count,
 	.ch_status = dw_edma_v0_core_ch_status,
 	.ch_abort_int_pending = dw_edma_v0_core_ch_abort_int_pending,
+	.ch_transfer_size = dw_edma_v0_core_ch_transfer_size,
 	.handle_int = dw_edma_v0_core_handle_int,
 	.ll_data = dw_edma_v0_core_ll_data,
 	.ll_link = dw_edma_v0_core_ll_link,
-- 
2.51.0

