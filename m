Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020112.outbound.protection.outlook.com [52.101.229.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70209476697;
	Wed, 12 Aug 2026 15:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550272; cv=fail; b=PAZxnvPPfffzZ6dKpKYMzZdTxqIi20KdiI0r2hGhhr8r4rzvFI0ycGUNgTPPPM/3OgAUVAA5GBLHSKJybYv5Q8aq4GE/NUr3X1sQjZjTeMd74jUJRADjmR08Qq7QKKEn4cVUcy4gsy/4okPOjoxHi8PTclxtySAddyOV6MBfksA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550272; c=relaxed/simple;
	bh=0q/+iQ+RFZgv7TelG+NPvuFde80DfHOQrSwkdrFCGw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GkPYIVjuPvphZ6hZ6qG69kJuSdklTfiMC/rkZ9cbP4TVRZ0KEq5UIYZmkLRyQMriBPPjMT+U3e9XSLj3t+L4Cd5l9vojLCBGsp0uX8Go8BZ87AehKT06bsn/2BsonlciiOFwglwsCA2OGeKsAwR3lX+tbPhFr3zaJTFw50GG4MM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=UohDVUd7; arc=fail smtp.client-ip=52.101.229.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="UohDVUd7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nb6QHXfmG7iLl7jcLcDnGGpPcJSK5qyg6G+wO3Ftx/2WMYKngkJy9zFkcYVR0fLeIsoHdi656Qkp9LJuvot7IdaQXfyH1HJRHq8tcb7ASW61BOjM0kHT1LxFlzlNmZgcMooqlpaMc0Ju3wV5dYZGJXtyNVzuudq1EsP4qTGYoeL/7jbIcS/klSd0y+sqQhX5aBoje87a4Dm45GZo04m/TidFhaPgR6q2fS17ayogno8IjwMvZHymwEfJem1Hfu7nFQ5KbCTg9X0xlMaa8eWnKMu3JI1ncmE6eaFONE6NFK51M8jY+PNa3ArLKcJxbjV4/802j4kqRD+t+5EYJsuVBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KoDJXxh6CfK6spMKyoSpqY/RXlhSGBfrvV5iyL+pruo=;
 b=m+CbSFLHxfKSjvLavj6LuU3oYSGoqqMVR3GaVu3u1mwt4X+rHNaBzM8GqBvxHO/4TLiF3yCSxYG1XNNKJxzsBWSBQY3ArEguR4ppI+lIEV/sLEw4DcI8gsm8mySVRqzQkatModQv7fEryq7s+srTZVPpSo+PY7NHm95l6bwnSWDN8RbccynZ/B1c5Y5+L8anyVKq7iOJjCmQyjArqxLBgtWjeY++mZHOVYT884rwW2sX7AUdXPnA6BK5C4MY6354H1Ar138c3//wjRciCDqEtKLAPIP0DPB8s9dGCeGkAootwZMutu/Sc6LTinaYIzbseh3vKnkAx2OBtoKI1QWysQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KoDJXxh6CfK6spMKyoSpqY/RXlhSGBfrvV5iyL+pruo=;
 b=UohDVUd7XYvDtdBori7B2hwalf1IimWOdAey2byLCBpmz4+BX77sozELRwsoPxwpHbVnsyHznJvtMsaJQRB1MqaJxy4wJ0TnJ8Bpd5lk8lJZqdErX6kDpE+LY6anikyM0JJ4Y0nkV6z+EyKdIh6pR/YTXvgQoVgoYR024NM2vmo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB7115.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:42f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 12 Aug
 2026 15:57:35 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 15:57:35 +0000
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
Subject: [PATCH v5 11/24] dmaengine: dw-edma: Serialize LL event capture with channel kicks
Date: Thu, 13 Aug 2026 00:57:08 +0900
Message-ID: <20260812155721.2807506-12-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260812155721.2807506-1-den@valinux.co.jp>
References: <20260812155721.2807506-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P301CA0001.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3be::12) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: f88e41a6-7cc2-4149-7ab5-08def88a6ce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|10070799003|18002099003|22082099003|56012099006|6133799003|5023799004|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	+mB6LKaKmTL6XBokYMC089AqfaybKT/shwMEHtkvuSATmTMnOAJh4Pq7fVeFIGilVJeS2Fv+N6neH9sasXbCu1C1YCUW+CSKn+er1hyam3X7h7PBbb2tKsKh0WTFEZtSQ/angaDWMtro3gKIYWzpLC4wpUjPfYztTUed3LGDB3KXAapZQDYnL8JzDF1+CWHXedBnV2MprQ6CXaFwCe3jEJVHbHgbrK/hlNrXt0c9fLb3UjV8AqG0XQJ0ihnrkb4z8tpZ1ilJ7vrxWaMHL2Tg4XH60AuCJCzxrr44srSP1ilpgzyZK9YEevGKCDhAZ/a9bWi5zic5zPNBViciFeJP5ubyowC2fYE01ySlLIg+j1YXBE8uf1J1tUdQUr/V0i8+mO0qW69COuHilfr7lnQykIoNho5RHqXLxwdNrWrJybt5kom+hTJ2w/KmDidNYde43j0w/eOqBiP9UrhlRwYS2QmNyIP//12VRSIVieuoZKonSYItH96FiBWUQmCUYGBaFCU1DvGH9MYPNjCCqDpMj4tPuTNxabMVYJj6OAuKKSQeqt5ng5t33j4f9+fnWjKTrzdQ2SOUQfdotEdZS+BI0KX3zBR7VoSUsst8UvwXyG7G0QF0ukjZfWxCe5slr56CfjvH+9PrpHH+uwT0KjcaaF93vrEFa0xrBiXSauml5gqn845o0mgLad1MgJtBcR1falvOtROJdFFRHO9M0dXsMg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(10070799003)(18002099003)(22082099003)(56012099006)(6133799003)(5023799004)(10067099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aujMsjIqjgwnqDJO16+qyfTotb6/Ub19vSYnRy8wRsG5onPkd4omX/v3JS2+?=
 =?us-ascii?Q?jcCCULLXdecejPxsbf1bzI4ls9ydlZ+OmQNUue2454ntmAz1vexH2sas546V?=
 =?us-ascii?Q?tewozRkg3s1YcGnmroEdr6ifBXw11z8DJWcwnc+dQaMLGZqCdtWt5MKmO1ae?=
 =?us-ascii?Q?5BQs9XiDYfp/+XkAACW6+cGscK1WJP8TJkT2Mgd7sKNoK5KlslVmEZ+8MqMH?=
 =?us-ascii?Q?YlXpWrPjmnCglT4/F/GN4J2KFufbir37DBeLmyRedAExxVEiWmVIufOtU+CP?=
 =?us-ascii?Q?n14oXUBt4uOkWinKNi1mlyRbx58NgeuOfbLSwMWMLCHLsN+uBgifGzu5fMYg?=
 =?us-ascii?Q?3QRvK0SkOBmzrES4CrIO8/qSX1PJBEWdD/EfcDgzdzERj2C+qDYovIqoxgyj?=
 =?us-ascii?Q?PWCmJCmPntijtHWMc5I0O+9ssFNQnk+t70TIhLulW0ap6fSxnBBZD96xwxpU?=
 =?us-ascii?Q?dffKeIFgaHFQ2GulBVcohi9KSouvxW+KWBu848AB4C0I29ee7yHozz58ib7A?=
 =?us-ascii?Q?j0nczNdrPNCGmQnplCspL/ELp762uNOjt98jnpC2fHHy5z9uProYTKs8z4rK?=
 =?us-ascii?Q?Gp3WifrR0lnG2Tj8bUt8hbl4IN5W/Q8vsrMOrQDlVpaqyB3u5+ovks4Byx79?=
 =?us-ascii?Q?0yZYRVVFjP1YvbLq076N4tzIV97Uyz/2HYkvYfP2qO1lzsSKD/1KyfNdx7Xo?=
 =?us-ascii?Q?SkX0LtJ1hRDzwGVqvXQPsyNGQgd4rUVZXKSL9WOxdLt2W7JpNUKsmcA6//xR?=
 =?us-ascii?Q?dQUM6fBV4iWhfRMmexU6mRx+yMYDRM5FH3G7qVs0tomB0TPEKMXQO75kFT8/?=
 =?us-ascii?Q?34RRlT1HqlqurmUIlIEYj9rOxJndNPGbNfg9lfJmNQBc+BkqOgxJmlJeL+FE?=
 =?us-ascii?Q?iWMHCr50AeLntoNOjIGMVYFuT5Egom20yV1NDfA38Itzfjrho+GOHKcWv9UB?=
 =?us-ascii?Q?ndPAj4PsOVn1N6c31nln0NsDqh39iKfROC9UhK0ASpyzxx0Pi37rdR/BhvS6?=
 =?us-ascii?Q?1yFFswyZ8ybcoGcI9lgvtU7UEH3nOBgr4TC6NQubTY10L55hwkip6DgjHe1D?=
 =?us-ascii?Q?pm3ecVmsdJgC6ovCiOMX6Q0jCkUS+bTiP4aDo7g24bb9nvyCK6KCnpfmurKd?=
 =?us-ascii?Q?YISLQMyKs493MX86JiJQpZ5HYREVDoSrmgNwI1FHcwSstSCv6RLR/d0tUs6T?=
 =?us-ascii?Q?wg78KGq0+Al4tSXFmIha5+b3sMFOZIcUvr+l+Jzmc2SOvJ9096rq4FHnbYzp?=
 =?us-ascii?Q?VJrW/907gFwXpspNnebH06Ye8XLsCd5N8dYEDeM12CWmwu65JlH75kPa93e/?=
 =?us-ascii?Q?lZBd3xdOborCDpw+l41sAo1mby9NTv82JNtM89SWRJtf6CD94QqMnoDGBgAL?=
 =?us-ascii?Q?+cLdXJL+3ZI4LZdhr9KNUkS/jNYs1yUlcbDuPHvb3j3Xuwl4VtewdImchJyB?=
 =?us-ascii?Q?lC9a+eeRKtAZe3VFHvzt8qHCust5Y3VEhmUwPL8P1AYP3NTODdtTEb3bioKa?=
 =?us-ascii?Q?5A/o/tAnc4u9w7k9cpLRjBVRnrnC2V5Pr4EbdNJf08/Xzapsp1iiWa7mspFR?=
 =?us-ascii?Q?lEvYmsP51y1vZhVRqxq5pjHCIzcCwErIH3KWfra33Q8yMJbg+PJiKnXX36+p?=
 =?us-ascii?Q?Z0Hxh6Y74C17JTx3mf2qUZ38Bh5FrLVSlxljR2VIoN3RfzVQAhHKDedeT3N5?=
 =?us-ascii?Q?BYOchc+1ZxF8QjzKXWrT9G0shC8ScFSOMvGGxaxeEi9vNxTEedtzqxz2BmU3?=
 =?us-ascii?Q?R9BUVoOGnQ3EkgvBPLZBZhftFOxHBgGnoxDNysmeeYixXd+bFA0e?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: f88e41a6-7cc2-4149-7ab5-08def88a6ce4
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:57:34.9839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ui9brD4V4+HCKopIlZ5xtyfh9RFoity6UhlZj3HKnR8xRcUz0CkAszeKMHAjd4QIjacTHvYVccCk6U8tdLLz0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7115

The hard IRQ path clears interrupt status before deferred handling takes
vc.lock. If a doorbell starts a new hardware run in between, the
deferred handler can apply an event from the previous run.

Use the event lock to serialize the interrupt status read and clear,
snapshot recording, and LL doorbell writes. Do not write another
doorbell while a snapshot is pending. A ring reset discards the snapshot
under the same lock. When events coalesce, keep STOP over PROGRESS.

Changing chan->request alone neither changes the ring nor writes a
doorbell, so it does not invalidate the snapshot. Preserve it across
request changes. A later patch uses PROGRESS and STOP to decide whether
a pending STOP or PAUSE request can finish.

Suggested-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - Drop the event_scope removal now that patch 8 no longer introduces the
    temporary API. (Frank)
  - Move the dw_edma_ll_snapshot_discard() call in issue_pending() here
    from the progress-reclamation patch, avoiding unnecessary removal and
    re-addition of the helper in between.
  - Take event_lock directly in dw_edma_core_reset_ll(), avoiding a temporary
    event-discard wrapper before ll_restart_armed is added.

Note: The last two changes are refactoring only and do not change behavior.

 drivers/dma/dw-edma/dw-edma-core.c    | 110 +++++++++++++++++++++++++-
 drivers/dma/dw-edma/dw-edma-core.h    |  37 +++++++++
 drivers/dma/dw-edma/dw-edma-v0-core.c |  65 +++++++--------
 drivers/dma/dw-edma/dw-hdma-v0-core.c |  32 +++++---
 4 files changed, 198 insertions(+), 46 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index e2eba6d72b53..fc83f12560a5 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -33,7 +33,8 @@ struct dw_edma_desc *vd2dw_edma_desc(struct virt_dma_desc *vd)
 
 enum dw_edma_deferred_event {
 	DW_EDMA_DEFERRED_DONE	= BIT(0),
-	DW_EDMA_DEFERRED_ABORT	= BIT(1),
+	DW_EDMA_DEFERRED_LL	= BIT(1),
+	DW_EDMA_DEFERRED_ABORT	= BIT(2),
 };
 
 static inline
@@ -74,6 +75,44 @@ static void vchan_free_desc(struct virt_dma_desc *vdesc)
 	kfree(vd2dw_edma_desc(vdesc));
 }
 
+static void dw_edma_ll_snapshot_discard_locked(struct dw_edma_chan *chan)
+{
+	lockdep_assert_held(dw_edma_event_lock(chan));
+
+	chan->ll_irq.event = DW_EDMA_LL_EVENT_NONE;
+}
+
+static void dw_edma_ll_snapshot_discard(struct dw_edma_chan *chan)
+{
+	guard(spinlock_irqsave)(dw_edma_event_lock(chan));
+
+	dw_edma_ll_snapshot_discard_locked(chan);
+}
+
+/* Must be called with vc.lock held. */
+static bool
+dw_edma_ll_snapshot_take(struct dw_edma_chan *chan,
+			 struct dw_edma_ll_snapshot *snapshot)
+{
+	guard(spinlock_irqsave)(dw_edma_event_lock(chan));
+
+	if (chan->ll_irq.event == DW_EDMA_LL_EVENT_NONE)
+		return false;
+
+	*snapshot = chan->ll_irq;
+	dw_edma_ll_snapshot_discard_locked(chan);
+
+	return true;
+}
+
+static void dw_edma_ll_event_discard_locked(struct dw_edma_chan *chan)
+{
+	lockdep_assert_held(dw_edma_event_lock(chan));
+
+	dw_edma_core_ll_irq_clear(chan);
+	dw_edma_ll_snapshot_discard_locked(chan);
+}
+
 /* Must be called with vc.lock held. */
 static void
 dw_edma_set_request(struct dw_edma_chan *chan, enum dw_edma_request request)
@@ -120,6 +159,9 @@ static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
 	dw_edma_core_ll_link(chan, chan->ll_max, chan->cb,
 			     chan->ll_region.paddr);
 
+	scoped_guard(spinlock_irqsave, dw_edma_event_lock(chan)) {
+		dw_edma_ll_event_discard_locked(chan);
+	}
 	dw_edma_core_ch_enable(chan);
 	chan->ll_valid = true;
 }
@@ -269,6 +311,17 @@ static void dw_edma_core_ll_sync(struct dw_edma_chan *chan)
 static void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
 {
 	dw_edma_core_ll_sync(chan);
+
+	guard(spinlock_irqsave)(dw_edma_event_lock(chan));
+
+	/*
+	 * A recorded event belongs to the current ring and must be consumed
+	 * before starting another hardware run.
+	 */
+	if (chan->ll_irq.event != DW_EDMA_LL_EVENT_NONE)
+		return;
+
+	dw_edma_ll_event_discard_locked(chan);
 	dw_edma_core_do_ch_doorbell(chan);
 }
 
@@ -452,6 +505,8 @@ static void dw_edma_device_issue_pending(struct dma_chan *dchan)
 	if (chan->configured && vchan_issue_pending(&chan->vc) &&
 	    chan->request == EDMA_REQ_NONE &&
 	    chan->status == EDMA_ST_IDLE) {
+		if (!chan->non_ll && !dw_edma_ll_pending(chan))
+			dw_edma_ll_snapshot_discard(chan);
 		chan->status = EDMA_ST_BUSY;
 		dw_edma_start_transfer(chan);
 		dw_edma_core_ch_maybe_doorbell(chan);
@@ -779,6 +834,18 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
 
+static void dw_edma_ll_interrupt(struct dw_edma_chan *chan)
+{
+	struct dw_edma_ll_snapshot snapshot;
+
+	guard(spinlock_irqsave)(&chan->vc.lock);
+
+	if (!dw_edma_ll_snapshot_take(chan, &snapshot))
+		return;
+
+	dw_edma_done_interrupt_locked(chan);
+}
+
 static void dw_edma_abort_interrupt(struct dw_edma_chan *chan)
 {
 	struct virt_dma_desc *vd;
@@ -811,6 +878,8 @@ static void dw_edma_irq_work(struct work_struct *work)
 
 		if (events & DW_EDMA_DEFERRED_DONE)
 			dw_edma_done_interrupt(chan);
+		if (events & DW_EDMA_DEFERRED_LL)
+			dw_edma_ll_interrupt(chan);
 		if (events & DW_EDMA_DEFERRED_ABORT)
 			dw_edma_abort_interrupt(chan);
 	} while (atomic_read(&chan->irq_pending));
@@ -825,14 +894,29 @@ static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
 
 static void dw_edma_record_irq(struct dw_edma_chan *chan, unsigned int events)
 {
+	struct dw_edma_ll_snapshot snapshot = {
+		.event = events & DW_EDMA_IRQ_STOP ?
+			 DW_EDMA_LL_EVENT_STOP : DW_EDMA_LL_EVENT_PROGRESS,
+	};
 	unsigned int pending = 0;
 
-	if (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_PROGRESS |
-		      DW_EDMA_IRQ_STOP))
-		pending |= DW_EDMA_DEFERRED_DONE;
+	lockdep_assert_held(dw_edma_event_lock(chan));
+
 	if (events & DW_EDMA_IRQ_ABORT)
 		pending |= DW_EDMA_DEFERRED_ABORT;
 
+	if (chan->non_ll) {
+		if (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_STOP))
+			pending |= DW_EDMA_DEFERRED_DONE;
+	} else if (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_PROGRESS |
+			     DW_EDMA_IRQ_STOP)) {
+		/* STOP is final for this run; do not replace it with progress. */
+		if (chan->ll_irq.event != DW_EDMA_LL_EVENT_STOP ||
+		    snapshot.event == DW_EDMA_LL_EVENT_STOP)
+			chan->ll_irq = snapshot;
+		pending |= DW_EDMA_DEFERRED_LL;
+	}
+
 	if (pending)
 		dw_edma_queue_irq_work(chan, pending);
 }
@@ -1021,6 +1105,7 @@ static void dw_edma_device_synchronize(struct dma_chan *dchan)
 	dw_edma_wait_termination(dchan);
 	cancel_work_sync(&chan->irq_work);
 	atomic_set(&chan->irq_pending, 0);
+	dw_edma_ll_snapshot_discard(chan);
 	vchan_synchronize(&chan->vc);
 }
 
@@ -1072,6 +1157,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 		chan->irq_mode = dw_edma_get_default_irq_mode(chan);
 		INIT_WORK(&chan->irq_work, dw_edma_irq_work);
 		atomic_set(&chan->irq_pending, 0);
+		chan->ll_irq.event = DW_EDMA_LL_EVENT_NONE;
 
 		if (chan->dir == EDMA_DIR_WRITE)
 			chan->ll_region = chip->ll_region_wr[chan->id];
@@ -1265,6 +1351,7 @@ int dw_edma_probe(struct dw_edma_chip *chip)
 {
 	struct device *dev;
 	struct dw_edma *dw;
+	struct dw_edma_chan *chan;
 	u16 hw_wr_ch_cnt;
 	u16 hw_rd_ch_cnt;
 	u32 wr_alloc = 0;
@@ -1308,6 +1395,8 @@ int dw_edma_probe(struct dw_edma_chip *chip)
 	}
 
 	raw_spin_lock_init(&dw->lock);
+	for (i = 0; i < ARRAY_SIZE(dw->event_lock_per_dir); i++)
+		spin_lock_init(&dw->event_lock_per_dir[i]);
 
 	/*
 	 * chip->ll_*_cnt describes the channels exposed by this instance. Keep
@@ -1337,6 +1426,19 @@ int dw_edma_probe(struct dw_edma_chip *chip)
 	if (!dw->chan)
 		return -ENOMEM;
 
+	/* Event locks must be ready before request_irq(). */
+	for (i = 0; i < dw->wr_ch_cnt + dw->rd_ch_cnt; i++) {
+		enum dw_edma_dir dir = i < dw->wr_ch_cnt ?
+				      EDMA_DIR_WRITE : EDMA_DIR_READ;
+
+		chan = &dw->chan[i];
+		spin_lock_init(&chan->event_lock_per_chan);
+		if (chip->mf == EDMA_MF_HDMA_NATIVE)
+			chan->event_lock = &chan->event_lock_per_chan;
+		else
+			chan->event_lock = &dw->event_lock_per_dir[dir];
+	}
+
 	snprintf(dw->name, sizeof(dw->name), "dw-edma-core:%s",
 		 dev_name(chip->dev));
 
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index 76fd5a41a707..a3df59976a2b 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -48,6 +48,12 @@ enum dw_edma_irq_event {
 	DW_EDMA_IRQ_ABORT	= BIT(3),
 };
 
+enum dw_edma_ll_event {
+	DW_EDMA_LL_EVENT_NONE,
+	DW_EDMA_LL_EVENT_PROGRESS,
+	DW_EDMA_LL_EVENT_STOP,
+};
+
 struct dw_edma_chan;
 struct dw_edma_chunk;
 
@@ -71,6 +77,10 @@ struct dw_edma_desc {
 	struct dw_edma_burst            burst[] __counted_by(nburst);
 };
 
+struct dw_edma_ll_snapshot {
+	enum dw_edma_ll_event		event;
+};
+
 struct dw_edma_chan {
 	struct virt_dma_chan		vc;
 	struct dw_edma			*dw;
@@ -99,6 +109,16 @@ struct dw_edma_chan {
 	u32				ll_head;
 	u32				ll_done;
 
+	/*
+	 * LL event recorded by the hard IRQ handler. The event lock
+	 * serializes its capture with a new hardware run; vc.lock serializes
+	 * its consumption with LL state.
+	 */
+	struct dw_edma_ll_snapshot	ll_irq;
+	/* Native HDMA lock storage. */
+	spinlock_t			event_lock_per_chan;
+	spinlock_t			*event_lock;	/* Selected event lock */
+
 	u32				ll_max;		/* Data entries */
 	struct dw_edma_region		ll_region;	/* Linked list */
 	bool				ll_valid;	/* LL context programmed */
@@ -148,6 +168,8 @@ struct dw_edma {
 	struct workqueue_struct		*wq;
 
 	raw_spinlock_t			lock;		/* Protect v0 shared registers */
+	/* Per-direction lock storage for the eDMA interrupt registers. */
+	spinlock_t			event_lock_per_dir[2];
 
 	struct dw_edma_chip             *chip;
 
@@ -171,7 +193,9 @@ struct dw_edma_core_ops {
 	void (*ll_link)(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr);
 	void (*ll_clear)(struct dw_edma_chan *chan, u32 idx);
 	int (*ll_cur_idx)(struct dw_edma_chan *chan);
+	/* Called with dw_edma_event_lock(chan) held. */
 	void (*ll_irq_clear)(struct dw_edma_chan *chan);
+	/* Called with dw_edma_event_lock(chan) held for an LL channel. */
 	void (*ch_doorbell)(struct dw_edma_chan *chan);
 	void (*ch_enable)(struct dw_edma_chan *chan);
 	void (*ch_config)(struct dw_edma_chan *chan);
@@ -215,6 +239,19 @@ struct dw_edma_chan *dchan2dw_edma_chan(struct dma_chan *dchan)
 	return vc2dw_edma_chan(to_virt_chan(dchan));
 }
 
+/*
+ * Lock ordering:
+ *
+ *   chan->vc.lock -> dw_edma_event_lock(chan)
+ *
+ * Interrupt providers invoke the dw_edma_handler_t callback with the event
+ * lock held. The callback must not take vc.lock.
+ */
+static inline spinlock_t *dw_edma_event_lock(struct dw_edma_chan *chan)
+{
+	return chan->event_lock;
+}
+
 /*
  * Return the current LL entry index. A negative value means that the channel
  * context is not initialized or was lost after a link reset.
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index c053cb4c2844..3b300c746601 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -339,8 +339,8 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 			   dw_edma_handler_t handler)
 {
 	struct dw_edma *dw = dw_irq->dw;
-	unsigned long total, pos, val;
-	irqreturn_t ret = IRQ_NONE;
+	u8 events[EDMA_V0_MAX_NR_CH] = {};
+	unsigned long total, pos, val, active = 0;
 	struct dw_edma_chan *chan;
 	unsigned long off;
 	unsigned long *mask;
@@ -356,45 +356,48 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 		mask = dw_irq->rd_mask;
 	}
 
-	/*
-	 * DONE and ABORT status share one register, and on remote setups
-	 * every read is a non-posted round trip across the PCIe link. Take
-	 * one snapshot and derive both views from it. An abort raised
-	 * after the snapshot is deferred, not lost: only bits observed in
-	 * the snapshot are ever cleared below, so its status remains set and
-	 * triggers another handler pass.
-	 */
-	sts = GET_RW_32(dw, dir, int_status);
+	if (!total)
+		return IRQ_NONE;
 
-	val = FIELD_GET(EDMA_V0_DONE_INT_MASK, sts);
-	val &= *mask;
-	for_each_set_bit(pos, &val, total) {
-		chan = &dw->chan[pos + off];
+	scoped_guard(spinlock_irqsave, dw_edma_event_lock(&dw->chan[off])) {
+		/*
+		 * DONE and ABORT status share one register, and on remote setups
+		 * every read is a non-posted round trip across the PCIe link. Take
+		 * one snapshot and derive both views from it.
+		 */
+		sts = GET_RW_32(dw, dir, int_status);
 
-		if (unlikely(dw_edma_core_ch_ignore_irq(chan)))
-			continue;
+		val = FIELD_GET(EDMA_V0_DONE_INT_MASK, sts);
+		val &= *mask;
+		for_each_set_bit(pos, &val, total) {
+			chan = &dw->chan[pos + off];
 
-		dw_edma_v0_core_clear_done_int(chan);
-		handler(chan, DW_EDMA_IRQ_DONE);
+			if (unlikely(dw_edma_core_ch_ignore_irq(chan)))
+				continue;
 
-		ret = IRQ_HANDLED;
-	}
+			events[pos] |= DW_EDMA_IRQ_DONE;
+			active |= BIT(pos);
+			dw_edma_v0_core_clear_done_int(chan);
+		}
 
-	val = FIELD_GET(EDMA_V0_ABORT_INT_MASK, sts);
-	val &= *mask;
-	for_each_set_bit(pos, &val, total) {
-		chan = &dw->chan[pos + off];
+		val = FIELD_GET(EDMA_V0_ABORT_INT_MASK, sts);
+		val &= *mask;
+		for_each_set_bit(pos, &val, total) {
+			chan = &dw->chan[pos + off];
 
-		if (unlikely(dw_edma_core_ch_ignore_irq(chan)))
-			continue;
+			if (unlikely(dw_edma_core_ch_ignore_irq(chan)))
+				continue;
 
-		dw_edma_v0_core_clear_abort_int(chan);
-		handler(chan, DW_EDMA_IRQ_ABORT);
+			events[pos] |= DW_EDMA_IRQ_ABORT;
+			active |= BIT(pos);
+			dw_edma_v0_core_clear_abort_int(chan);
+		}
 
-		ret = IRQ_HANDLED;
+		for_each_set_bit(pos, &active, total)
+			handler(&dw->chan[pos + off], events[pos]);
 	}
 
-	return ret;
+	return active ? IRQ_HANDLED : IRQ_NONE;
 }
 
 static void dw_edma_v0_write_ll_data(struct dw_edma_chan *chan, int i,
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index 0b3c8496b0ad..d14dfcc174fb 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -177,10 +177,12 @@ dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 			   dw_edma_handler_t handler)
 {
 	struct dw_edma *dw = dw_irq->dw;
-	unsigned long total, pos, val;
+	unsigned int events;
+	unsigned long total, pos;
 	irqreturn_t ret = IRQ_NONE;
 	struct dw_edma_chan *chan;
 	unsigned long off, *mask;
+	u32 val;
 
 	if (dir == EDMA_DIR_WRITE) {
 		total = dw->wr_ch_cnt;
@@ -197,20 +199,28 @@ dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 		if (unlikely(dw_edma_core_ch_ignore_irq(chan)))
 			continue;
 
-		val = dw_hdma_v0_core_status_int(chan);
-		if (FIELD_GET(HDMA_V0_STOP_INT_MASK, val)) {
-			dw_hdma_v0_core_clear_done_int(chan);
-			handler(chan, DW_EDMA_IRQ_STOP);
+		events = 0;
+		scoped_guard(spinlock_irqsave, dw_edma_event_lock(chan)) {
+			val = dw_hdma_v0_core_status_int(chan);
 
-			ret = IRQ_HANDLED;
-		}
+			if (FIELD_GET(HDMA_V0_STOP_INT_MASK, val)) {
+				events |= DW_EDMA_IRQ_STOP;
+				dw_hdma_v0_core_clear_done_int(chan);
+			}
 
-		if (FIELD_GET(HDMA_V0_ABORT_INT_MASK, val)) {
-			dw_hdma_v0_core_clear_abort_int(chan);
-			handler(chan, DW_EDMA_IRQ_ABORT);
+			if (FIELD_GET(HDMA_V0_ABORT_INT_MASK, val)) {
+				events |= DW_EDMA_IRQ_ABORT;
+				dw_hdma_v0_core_clear_abort_int(chan);
+			}
 
-			ret = IRQ_HANDLED;
+			if (events)
+				handler(chan, events);
 		}
+
+		if (!events)
+			continue;
+
+		ret = IRQ_HANDLED;
 	}
 
 	return ret;
-- 
2.51.0

