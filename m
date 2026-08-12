Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020112.outbound.protection.outlook.com [52.101.229.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992E847ECDD;
	Wed, 12 Aug 2026 15:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550281; cv=fail; b=FepQBMRqw0H+SclKqDoUyd0n1mUbm4zWX9kKg0gGc46YBexZSansQd49LL1wq1QlNCBaH4g7nd9qBy0xJJc8Ty3ksOMYDcjJF4JTv7H5e9P2ZpIXhyGy/NzmxSL7NvHZlDFIyPQg4y+msnyh0JAiGlH1Q9G6zpOJQCNdl3X1kXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550281; c=relaxed/simple;
	bh=NnU/QNoePwLFCO0RgBepZHSmX4pv2BtpCSRpuk8bVGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QLQLet3PqTws8/Ei8Zzxhg06PdAiJfcnd0mr+tXL0kdecajn81ZRC6lzWstZTkyucaKMcl6Qa4wER2ab2Xumdl/oYf0fdJVL2y6TjX6Fe9amh4uoT0j80Xui9H3vwBxcqS8gd2HUZmifSijkuSdaddH63KMPvdq4qAR6MHXXxto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=FAm7mRKC; arc=fail smtp.client-ip=52.101.229.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="FAm7mRKC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbOL8fmOmKUsE8ZuguQ0EHzU1xqsz5R0o/R2sWRpmKnwc8mwoxnS+LdpqNOXkT1wsLko+Y0tWZhnZIh+kzQVsz5KyU6cQh6uKQLBR4dASMuETROZFbU4yEiBse91tzpVp8lMVLQiPlaVhbJ454Rotb8njyOzx3w+x1XEebIl5i1/hQdky6yrym8e2/ZN2Nb03mKyY4pIfXkyUKRC8xMeRxAerSU9p41ewY/B+2NxIesNjcGVhVIt+MHdqfjBMvrVmoPKMg/jZGvrBeNrqRQC5HVUeYh7KSrn29l3lcfrtZzuoy04K23wxpQi1B4gzEaHJeUfVRhq/TC0eRFpth8kYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQVhUE2+ZqUIfwnPWSj5mN+CliCWAEEqMzFvRjcEO3I=;
 b=mzDf1ymwQr14LqJexdSOgOeJWYhHxfA5zHD2QLFxGUwUuK1cPZhBn6oDgF7OvLK/z4ulS62CKSTIc4mZXxCyu53W7duZeV0XhlbThzpQD/pLiu108abXyFb4nVyTXSbdcHB1N1n+e2IYzDNFhUfVT/SF79cqPGx7Sq9ovCqI3NizUbKGg1uA1tfY3JVBvfTziejFvOFvQgAjpgP/OBt0y3Q45TZo0Sh1/D5eOkwLbS0u5EazHT53szCk8vjpkYkvz34iLMnTm4ERg2yZP2Ubly223QyCx5hY55cC1JDc1MyOkz5dqQdqIuhOtBXDKQFjdaXCV+7Z/Ztxw7fve0iy8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQVhUE2+ZqUIfwnPWSj5mN+CliCWAEEqMzFvRjcEO3I=;
 b=FAm7mRKC8YMh8B6XZ+JULj2ROcIQ++g/0MxS98AdtHh1ovcFtj6yIhW6c/r7i7e7njrfFS9qBT8ncxxyGVzm1wp37jrq46Dj6Mq188kPnUxBh2pMfs+wytwGwj+KTlyTqQpZ82ifQu2Ey9d7RcnvDtCLJT6sJBLv5ufABpzz2ME=
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
Subject: [PATCH v5 12/24] dmaengine: dw-edma: Keep channels stopped while ABORT is pending
Date: Thu, 13 Aug 2026 00:57:09 +0900
Message-ID: <20260812155721.2807506-13-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260812155721.2807506-1-den@valinux.co.jp>
References: <20260812155721.2807506-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0148.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::16) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: fe6bf8e0-3e24-458a-0f1b-08def88a6d50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|7416014|376014|1800799024|366016|921020|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zOYr7uI4SmlorzHEYual10/v6NvIYUjCmuE8jNeCINwtRfROhQBD57OuSwoyNcevHM3/WS4dzqVs7VpwPyAJRSvzeUYzTtM9eql8egsf3ccFIV+pABDM82DVOjuEcYxhOWl21V47vAH3I/6aMMGYc/TVopg0bgHn6fUAPrh0bAapcDAuZ6RFAQwViVlAdd382u5h61iknOQr/cgA7iESW+auJeM7jnbdY79UaNJMfeUYQMqL+lIvID/6i+apcALISlVOm09eV984cGvdW4h3cVZdGPeB5oo1VEGsp6XaM3+biUzsLSXP0LMJwobmt9+9Zy8JCdmwOWsfBB1Z/sO68hr77fkrGhN9Vfebw4nfnMNUYg7aLU4MPv2gdwK0orVOOong85zHg303uggUQgzVlKORIqHmnh3+vADffg+68VB1I39a4zhVyFTqLmiPqP5DFGRk5z9/bE7vB3dOOUCq2S6RP9O/PLH9zV8aRYycaX+Ks05/7UH+MZUDS7YCcrXbSyrOS2kos28hzgZaOKV/pNkSQl0qQFgNaKXMtVHqvmH3ern9lxImZAtbnaVMAJwytoNw3l3YLgo24ebz4vTbfoG0QOCPybjkc7ZMPvao8nMSgIF5siyyZHQzgT3X12ewA2S+Fy60/krx8rs50E18WSpYj0I2OYPh0sRLX1iJUnF8J9x3DUlkInCuUaxn9IJ8Y929bWKG30eQISexEJoB9A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(7416014)(376014)(1800799024)(366016)(921020)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NDqA2oM5hY3r0UUsOXXRqS6HTnuPWmLPWbjbICq5q91DHZXerxPdutap8mpf?=
 =?us-ascii?Q?UzvO6/Ace0Lxr/NZO3k7z7MhjXrQ3aF/MSOXBmbLOKh267aRh5B8sTZ2e59i?=
 =?us-ascii?Q?SyEqydrqvHDQCtCF+MG98ryBy4pvr/C/QwRpZE27WTz3GdqxKuO1kO/UV/+R?=
 =?us-ascii?Q?6onbTMBl2rM7s0uoNpFv0qrSVnLfFyaemU85VPUZ1NDlr9BI4ODfyk+aeHMf?=
 =?us-ascii?Q?+FzTqgea4MRaPOTl89/sdyweBqdo++eUg+xv6/+6Carp/UfW4zJnUgQziJDQ?=
 =?us-ascii?Q?joN3xPQApfLodsgJtec0uzxYvdumsiQuWqATJu6mqan+gyfh2cwo+kTMhEEB?=
 =?us-ascii?Q?A7fp4xctNcND3nWH+JhRlxdy47I5okSN1/cQ3gMP1VLpz9rxMtkl22BFgyqo?=
 =?us-ascii?Q?/UFPAblzH0AhC20Z6IXglAWQq0EyON8cBbMLfz8rN+dGgye0K4kOCUF8pypS?=
 =?us-ascii?Q?rGQKOkdXb+LBG+Jfh7orBi0FjDc7PNpmO6SaQJUU4Ml+Pjx1Mwrft/QMyKxk?=
 =?us-ascii?Q?LGhj35bCef50pRfl0G9pCC9Vvih67EbUkUq4az+vuiM/YrE2ADL0OfMehEPS?=
 =?us-ascii?Q?7Mc3l6mzgusSlvFBqTxMeT5K8j5q2GMYyecWBRYIvq9qLkSWk3uwrxzWCrFL?=
 =?us-ascii?Q?5VNZkqNcscEHpX2TUXLvm/Deqb7FRWnFVn6lfea+gPm9wJ0bLrVn+HT5dh4Z?=
 =?us-ascii?Q?EtDtlH20afZjYZ4ad4IJjwtzqJ9KlUEyj81FOZijAi0Zv9oea4Qj8+zYE173?=
 =?us-ascii?Q?m0v3M4oOM8ilIM/HznrWfn56HKrx/0cBCLZUrj4Kxct077x0OWHYQNjphixv?=
 =?us-ascii?Q?tGrBuvLMEHvyEd7bzw+hzF5ve7ugDZArhy8vHhMut/203fvLkD8jin1Ah6XB?=
 =?us-ascii?Q?mNeF8EFs9XjFizOKpX4Z3S2pJXgm/B9gt+o+XqHoGl5yDQ309y4PtDiIqep/?=
 =?us-ascii?Q?QWMAkuSLrHn1L6N/w64N/gB4RH32z5VbQd404Vs4sKUyOhwscKzCnvfwlmQX?=
 =?us-ascii?Q?4bA3sgIvVzMitYrTQRyAo/AyMnzXgPqzzKtsVI/Hi4zYbfcD14Kvs8DZkuBz?=
 =?us-ascii?Q?fdDtMDySAzbKKkPDadtYSzsORUzc0+c9TqU04zqn0vY4QAYmA9H9fqHRvZjI?=
 =?us-ascii?Q?8k3XSmKJJTeCFKKsuqykJNV9hTkZUNMtDYFTvrARgm5DtOHY49dPjRGLU2e3?=
 =?us-ascii?Q?KOfvksskuZawuL5Rmwf/Skifgu5Rc85ygU9ym27hXHVRv/z0SSfRnb+LiS7d?=
 =?us-ascii?Q?7B+TvxJPFtJXNYiVmRD+ZtsIfhI+idqCc+S3Si55/J9Q4PJ8eIp8ijijpfHF?=
 =?us-ascii?Q?iAjp/7cdrBg00atYUI9R1c8PV9bexBidT+/eoyTXyY19RMJtHG2lnd4GWqML?=
 =?us-ascii?Q?BDSC0MGbt0c8pohKfAo3iFGZxAabFvJm/bKQiLlqmLuwbFDdHQuf+ON6urEd?=
 =?us-ascii?Q?WiE+wU3vjlzEweAh5jleMHK+wWc114Bjx7WqrDK3ZyyIdwiej0yPrFZWpN3m?=
 =?us-ascii?Q?RysF0mapjccRr9QGBwT7OOn6zYP6BPy6lXwflHxRHULZ7OD6GX2hrC7Vzruo?=
 =?us-ascii?Q?hdr4WYqeowtUEsoDr4F3BcIKfxflChbyBSTcVuJiJ8p95WaJsUCUUgQn5Lux?=
 =?us-ascii?Q?XHQIWhFU0jX06Wl4x0jmVYhzzhAyh04D4seAAHiC125Sdqvi2Ii6kcxcqn5G?=
 =?us-ascii?Q?CRGguJ7RSVZ5VzMfkK/wq2fkghjQI+agCzFN/415UyoS26xoQWYym72qcrch?=
 =?us-ascii?Q?8BKdLfKSMh6gwUPjY4mTACKLWsqYii7UIWlD+l2xglyh/YLd8hKL?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: fe6bf8e0-3e24-458a-0f1b-08def88a6d50
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:57:35.6754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TQREnwyn45DoWusU6M7y0HdqGOe86X18G73DrbzK9m0XU8aN9JA2IW3Uln24BH/VgN6NlsyJTZDABhxYsUYyMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7115

The hard IRQ path clears the ABORT interrupt status before deferred
handling. Keep the event pending until the worker has handled it;
otherwise a new start can race ahead after the status has been cleared.

Set abort_pending before clearing the status. Before a non-LL start or
LL doorbell, check both the pending flag and hardware status while
holding the event lock. This covers the case where the start path gets
the lock before the IRQ handler has latched the event.

Handle ABORT before coalesced DONE or LL work. Also block LL progress
consumers while ABORT is pending; tx_status() can otherwise complete a
descriptor before the ABORT worker runs. ABORT cleanup makes that
progress stale by completing or terminating descriptors and, for an LL
channel, resetting the ring. Clear abort_pending only after cleanup.

If termination sees a pending ABORT, leave EDMA_REQ_STOP set until the
ABORT worker finishes. This prevents dw_edma_device_synchronize() from
discarding the event before cleanup.

Note also that only one issued descriptor can have LL entries published
at this point. Before multi-descriptor publication is enabled, the ring
reset is extended to abort every descriptor with outstanding published
entries. Therefore, discarding coalesced DONE or LL work cannot strand
another published descriptor.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - Adjust context after moving the issue_pending() snapshot discard to
    patch 11. dw_edma_ll_snapshot_discard() is no longer removed here.

 drivers/dma/dw-edma/dw-edma-core.c    | 87 ++++++++++++++++++++++++---
 drivers/dma/dw-edma/dw-edma-core.h    | 17 ++++++
 drivers/dma/dw-edma/dw-edma-v0-core.c |  9 +++
 drivers/dma/dw-edma/dw-hdma-v0-core.c |  8 +++
 4 files changed, 113 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index fc83f12560a5..1deaf2d0da91 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -89,6 +89,32 @@ static void dw_edma_ll_snapshot_discard(struct dw_edma_chan *chan)
 	dw_edma_ll_snapshot_discard_locked(chan);
 }
 
+static void dw_edma_irq_events_discard(struct dw_edma_chan *chan)
+{
+	guard(spinlock_irqsave)(dw_edma_event_lock(chan));
+
+	dw_edma_ll_snapshot_discard_locked(chan);
+	chan->abort_pending = false;
+}
+
+static bool dw_edma_abort_latch_locked(struct dw_edma_chan *chan)
+{
+	lockdep_assert_held(dw_edma_event_lock(chan));
+
+	if (!chan->abort_pending &&
+	    dw_edma_core_ch_abort_int_pending(chan))
+		dw_edma_abort_event_mark(chan);
+
+	return chan->abort_pending;
+}
+
+static bool dw_edma_abort_is_pending(struct dw_edma_chan *chan)
+{
+	guard(spinlock_irqsave)(dw_edma_event_lock(chan));
+
+	return chan->abort_pending;
+}
+
 /* Must be called with vc.lock held. */
 static bool
 dw_edma_ll_snapshot_take(struct dw_edma_chan *chan,
@@ -99,12 +125,23 @@ dw_edma_ll_snapshot_take(struct dw_edma_chan *chan,
 	if (chan->ll_irq.event == DW_EDMA_LL_EVENT_NONE)
 		return false;
 
+	if (dw_edma_abort_latch_locked(chan))
+		return false;
+
 	*snapshot = chan->ll_irq;
 	dw_edma_ll_snapshot_discard_locked(chan);
 
 	return true;
 }
 
+/* Must be called with vc.lock held. */
+static void dw_edma_abort_event_clear(struct dw_edma_chan *chan)
+{
+	guard(spinlock_irqsave)(dw_edma_event_lock(chan));
+
+	chan->abort_pending = false;
+}
+
 static void dw_edma_ll_event_discard_locked(struct dw_edma_chan *chan)
 {
 	lockdep_assert_held(dw_edma_event_lock(chan));
@@ -247,7 +284,20 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
 	if (!desc)
 		return 0;
 
-	if (!chan->non_ll && !chan->ll_valid)
+	if (chan->non_ll) {
+		guard(spinlock_irqsave)(dw_edma_event_lock(chan));
+
+		if (dw_edma_abort_latch_locked(chan))
+			return 0;
+
+		dw_edma_core_start(desc);
+		return 1;
+	}
+
+	if (dw_edma_abort_is_pending(chan))
+		return 0;
+
+	if (!chan->ll_valid)
 		dw_edma_core_reset_ll(chan);
 
 	dw_edma_core_start(desc);
@@ -287,6 +337,11 @@ static void dw_edma_terminate_all_descs(struct dw_edma_chan *chan)
 /* Must be called with vc.lock held after the channel has stopped. */
 static void dw_edma_finish_termination(struct dw_edma_chan *chan)
 {
+	if (dw_edma_abort_is_pending(chan)) {
+		dw_edma_set_request(chan, EDMA_REQ_STOP);
+		return;
+	}
+
 	dw_edma_terminate_all_descs(chan);
 
 	/* Preserve a clean ring; resync only if entries remain published. */
@@ -314,6 +369,9 @@ static void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
 
 	guard(spinlock_irqsave)(dw_edma_event_lock(chan));
 
+	if (dw_edma_abort_latch_locked(chan))
+		return;
+
 	/*
 	 * A recorded event belongs to the current ring and must be consumed
 	 * before starting another hardware run.
@@ -490,7 +548,8 @@ static int dw_edma_device_terminate_all(struct dma_chan *dchan)
 	} else {
 		dw_edma_set_request(chan, EDMA_REQ_STOP);
 	}
-	if (chan->status == EDMA_ST_IDLE)
+	if (chan->status == EDMA_ST_IDLE &&
+	    !dw_edma_abort_is_pending(chan))
 		dw_edma_set_request(chan, EDMA_REQ_NONE);
 
 	return err;
@@ -846,14 +905,19 @@ static void dw_edma_ll_interrupt(struct dw_edma_chan *chan)
 	dw_edma_done_interrupt_locked(chan);
 }
 
-static void dw_edma_abort_interrupt(struct dw_edma_chan *chan)
+static bool dw_edma_abort_interrupt(struct dw_edma_chan *chan)
 {
 	struct virt_dma_desc *vd;
 	unsigned long flags;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
+	if (!dw_edma_abort_is_pending(chan)) {
+		spin_unlock_irqrestore(&chan->vc.lock, flags);
+		return false;
+	}
+
 	vd = vchan_next_desc(&chan->vc);
-	if (vd && chan->request == EDMA_REQ_STOP) {
+	if (chan->request == EDMA_REQ_STOP) {
 		dw_edma_terminate_all_descs(chan);
 	} else if (vd) {
 		dw_hdma_set_callback_result(vd, DMA_TRANS_ABORTED);
@@ -864,7 +928,11 @@ static void dw_edma_abort_interrupt(struct dw_edma_chan *chan)
 		dw_edma_core_reset_ll(chan);
 	dw_edma_set_request(chan, EDMA_REQ_NONE);
 	chan->status = EDMA_ST_IDLE;
+	dw_edma_abort_event_clear(chan);
+
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
+
+	return true;
 }
 
 static void dw_edma_irq_work(struct work_struct *work)
@@ -876,12 +944,14 @@ static void dw_edma_irq_work(struct work_struct *work)
 	do {
 		events = atomic_xchg(&chan->irq_pending, 0);
 
+		/* ABORT cleanup makes coalesced DONE and LL work stale. */
+		if ((events & DW_EDMA_DEFERRED_ABORT) &&
+		    dw_edma_abort_interrupt(chan))
+			continue;
 		if (events & DW_EDMA_DEFERRED_DONE)
 			dw_edma_done_interrupt(chan);
 		if (events & DW_EDMA_DEFERRED_LL)
 			dw_edma_ll_interrupt(chan);
-		if (events & DW_EDMA_DEFERRED_ABORT)
-			dw_edma_abort_interrupt(chan);
 	} while (atomic_read(&chan->irq_pending));
 }
 
@@ -902,7 +972,7 @@ static void dw_edma_record_irq(struct dw_edma_chan *chan, unsigned int events)
 
 	lockdep_assert_held(dw_edma_event_lock(chan));
 
-	if (events & DW_EDMA_IRQ_ABORT)
+	if ((events & DW_EDMA_IRQ_ABORT) && chan->abort_pending)
 		pending |= DW_EDMA_DEFERRED_ABORT;
 
 	if (chan->non_ll) {
@@ -1105,7 +1175,7 @@ static void dw_edma_device_synchronize(struct dma_chan *dchan)
 	dw_edma_wait_termination(dchan);
 	cancel_work_sync(&chan->irq_work);
 	atomic_set(&chan->irq_pending, 0);
-	dw_edma_ll_snapshot_discard(chan);
+	dw_edma_irq_events_discard(chan);
 	vchan_synchronize(&chan->vc);
 }
 
@@ -1158,6 +1228,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 		INIT_WORK(&chan->irq_work, dw_edma_irq_work);
 		atomic_set(&chan->irq_pending, 0);
 		chan->ll_irq.event = DW_EDMA_LL_EVENT_NONE;
+		chan->abort_pending = false;
 
 		if (chan->dir == EDMA_DIR_WRITE)
 			chan->ll_region = chip->ll_region_wr[chan->id];
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index a3df59976a2b..d709aa274300 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -115,6 +115,8 @@ struct dw_edma_chan {
 	 * its consumption with LL state.
 	 */
 	struct dw_edma_ll_snapshot	ll_irq;
+	/* ABORT is terminal and remains pending across LL state changes. */
+	bool				abort_pending;
 	/* Native HDMA lock storage. */
 	spinlock_t			event_lock_per_chan;
 	spinlock_t			*event_lock;	/* Selected event lock */
@@ -185,6 +187,8 @@ struct dw_edma_core_ops {
 	int (*ch_quiesce)(struct dw_edma_chan *chan);
 	u16 (*ch_count)(struct dw_edma *dw, enum dw_edma_dir dir);
 	enum dma_status (*ch_status)(struct dw_edma_chan *chan);
+	/* Called with dw_edma_event_lock(chan) held. */
+	bool (*ch_abort_int_pending)(struct dw_edma_chan *chan);
 	irqreturn_t (*handle_int)(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 				  dw_edma_handler_t handler);
 	void (*non_ll_start)(struct dw_edma_chan *chan, struct dw_edma_burst *child);
@@ -252,6 +256,13 @@ static inline spinlock_t *dw_edma_event_lock(struct dw_edma_chan *chan)
 	return chan->event_lock;
 }
 
+static inline void dw_edma_abort_event_mark(struct dw_edma_chan *chan)
+{
+	lockdep_assert_held(dw_edma_event_lock(chan));
+
+	chan->abort_pending = true;
+}
+
 /*
  * Return the current LL entry index. A negative value means that the channel
  * context is not initialized or was lost after a link reset.
@@ -299,6 +310,12 @@ enum dma_status dw_edma_core_ch_status(struct dw_edma_chan *chan)
 	return chan->dw->core->ch_status(chan);
 }
 
+static inline bool
+dw_edma_core_ch_abort_int_pending(struct dw_edma_chan *chan)
+{
+	return chan->dw->core->ch_abort_int_pending(chan);
+}
+
 static inline irqreturn_t
 dw_edma_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 			dw_edma_handler_t handler)
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index 3b300c746601..20dff21a0603 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -318,6 +318,13 @@ static enum dma_status dw_edma_v0_core_ch_status(struct dw_edma_chan *chan)
 		return DMA_ERROR;
 }
 
+static bool dw_edma_v0_core_ch_abort_int_pending(struct dw_edma_chan *chan)
+{
+	u32 sts = GET_RW_32(chan->dw, chan->dir, int_status);
+
+	return FIELD_GET(EDMA_V0_ABORT_INT_MASK, sts) & BIT(chan->id);
+}
+
 static void dw_edma_v0_core_clear_done_int(struct dw_edma_chan *chan)
 {
 	struct dw_edma *dw = chan->dw;
@@ -390,6 +397,7 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 
 			events[pos] |= DW_EDMA_IRQ_ABORT;
 			active |= BIT(pos);
+			dw_edma_abort_event_mark(chan);
 			dw_edma_v0_core_clear_abort_int(chan);
 		}
 
@@ -668,6 +676,7 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
 	.ch_quiesce = dw_edma_v0_core_ch_quiesce,
 	.ch_count = dw_edma_v0_core_ch_count,
 	.ch_status = dw_edma_v0_core_ch_status,
+	.ch_abort_int_pending = dw_edma_v0_core_ch_abort_int_pending,
 	.handle_int = dw_edma_v0_core_handle_int,
 	.ll_data = dw_edma_v0_core_ll_data,
 	.ll_link = dw_edma_v0_core_ll_link,
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index d14dfcc174fb..41e51eee71cc 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -172,6 +172,12 @@ static u32 dw_hdma_v0_core_status_int(struct dw_edma_chan *chan)
 	return GET_CH_32(dw, chan->dir, chan->id, int_stat);
 }
 
+static bool dw_hdma_v0_core_ch_abort_int_pending(struct dw_edma_chan *chan)
+{
+	return FIELD_GET(HDMA_V0_ABORT_INT_MASK,
+			 dw_hdma_v0_core_status_int(chan));
+}
+
 static irqreturn_t
 dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 			   dw_edma_handler_t handler)
@@ -210,6 +216,7 @@ dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 
 			if (FIELD_GET(HDMA_V0_ABORT_INT_MASK, val)) {
 				events |= DW_EDMA_IRQ_ABORT;
+				dw_edma_abort_event_mark(chan);
 				dw_hdma_v0_core_clear_abort_int(chan);
 			}
 
@@ -430,6 +437,7 @@ static const struct dw_edma_core_ops dw_hdma_v0_core = {
 	.ch_quiesce = dw_hdma_v0_core_ch_quiesce,
 	.ch_count = dw_hdma_v0_core_ch_count,
 	.ch_status = dw_hdma_v0_core_ch_status,
+	.ch_abort_int_pending = dw_hdma_v0_core_ch_abort_int_pending,
 	.handle_int = dw_hdma_v0_core_handle_int,
 	.non_ll_start = dw_hdma_v0_core_non_ll_start,
 	.ll_data = dw_hdma_v0_core_ll_data,
-- 
2.51.0

