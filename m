Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020143.outbound.protection.outlook.com [52.101.229.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353EC463B60;
	Wed, 12 Aug 2026 15:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550280; cv=fail; b=M4Lo5ArNu5nlQuRJ9mLotoMsMtWMTMOJN5grLFQt2a5YgQ8Qne//k13jk/dXIyJOuT4zTn7/hg62lmXk2YdP2jyb5cdjb4BZQfB5dI5E9QlrUIVahDhix5dTL95nBf61qDcCyjCwHXwSR9vW8YlqaB4UgN4tfK38CzIAqlDGz2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550280; c=relaxed/simple;
	bh=2bt+YgtW9DhKrVsuqfUi5zHXTN/ZKpDDXbUIHbX9Gws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F7MhEBzSMC5+u9p0UnY979HXrzymTJfiqgNBtLC14BruQmQWdB8Bzh5ORndq3eKHP2dwOR+RC707UPTtsAQ5n+Sj8kAnMF44civNeMM4SQzhttIenJEt2fqyALS0yO751UwnlMjze01F9UIg7YZhqEHFje6yh5NGk27AbDsvAfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=TafRkkTq; arc=fail smtp.client-ip=52.101.229.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="TafRkkTq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvq5RaUOcCY10yBrkImqdgKPt+e/SykNj9Z3oZ/LJqM+AWV60jFGiIBWaut/eld8Oftha858IFCds5B28H8CjJ/Y8Nu3QydOlnVcEJDNtTtQI2sp3g7AL/qSV89DsbEZsbEpuZWu0SDtgVGFHoMTZLj9Y2KuUZC34UQ8SqH8Gf3XOYttGEUnhIYWUfmHdyY0PLgJjOSuqArafPJdVkrdYyc3V8XidpgBzOR9SqKCJFh6ls8LQFpMocD4Obq25QH39v9F923TT12kmjDbg3wVuq3gNhZoil8ujaZHZy+sRqRJkMA5kjlGzVt/Vexf4as0kfiNVb8VbEO5ZZb25rHGuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iFt/b6EzekDQbSyojiDQMsWT9O6DGa1v3Z+DrilfavA=;
 b=KItIvUPeHHi1Bl18SxLcFqWcRMmHDlEnmWECx+04cJVq5YVQdTOZAqNb7N0stY4beee/FwGYbFtV+SnXUOcy8lgJw6uXdhr5go8m1NoBsOd/4JbgqXxcS8yuT6BVnKkbdOdJxi2/W3AJ+nM1jAE0dVVqKVK6wznHpxAVIfQMWukpXSVLVd2tsQeTkDqvQYhOOcTbd6rrZeuo/vMY6+IVQNlKxpG+nSY6SzCxL87KUZTJTSY5Wfn2pPQXQkON+tvOyTFqoeb5lhWdWN+qucwoNGTjWzGyCmilpizNRXAxCJPAk7jzN4PhZqoFe8w5ADGS37M/5C6dJfxDMbAOZuaBZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFt/b6EzekDQbSyojiDQMsWT9O6DGa1v3Z+DrilfavA=;
 b=TafRkkTqIgB5+XT1hzW1zhDOgwvLcI/WjxYXjFu2am78UNZYZbSJ6ZM3IAaTqXV9Pp2Uy7au/WE0roTcf/vc3XDt5nN4/K6P9NI6DTFtHi9Sewj680heZDHAf6TY+i4dekvMI5g3W+SDa+IusTLeeFY0HKs9UALiORdyb8NyqeE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB7069.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:343::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 15:57:44 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 15:57:44 +0000
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
Subject: [PATCH v5 23/24] dmaengine: dw-edma: Detect and recover a stalled eDMA engine
Date: Thu, 13 Aug 2026 00:57:20 +0900
Message-ID: <20260812155721.2807506-24-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260812155721.2807506-1-den@valinux.co.jp>
References: <20260812155721.2807506-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0105.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::9) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: e713c59b-6082-463d-28e7-08def88a7298
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|23010399003|7416014|18002099003|22082099003|56012099006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	BdVKw24kQ7GXBExAFJ+Cwi5gWXp3Ei4XMbU6CHWVMLt/MXcfkcie+ho8ZqwsB6baNvX0hK0VAJs+b8mtInrEDYQxi+ze019LtKWKx+xLJPwBXSnFWt8qfFuLYrJ8I6+LeRqHqDOhscFAjrkpqQweaQA/kYOObcAsYq56OTJjRKRuGR4tEw0IzqoIWqHkJJUOFHT9N4vEdRu5wkkSl3aq9QHRWKVzMe9xIArAuupKCKMo+ggGzbeE2wDdK6W7pdi5pk9b45t9GB6qMTDYOQd2jGIgTyY8AJaw7s92yn49H7luZLTVlMGn8SlZrGU/s3lrsBOachqsr1m9OOvHFKhPkdwAulssLFJctnARyoehKb9IIuLe5PhHCCrEqTInyg7Z9fySqozhwGR1Iemk5McrUOr+TF6CRtyWOHBzcF7gH/wnudhHbMoy2k+1FGxgbZetMx04wH6phl302c5bNjE8XCOd65+FJ/FGm4r5oTiIPWuBBzoNIP4bwX48X3D4W+eingbFMwcV4dEGTZyh78PAe+EceIq1gIW8knAbOrVYF9MWAKm5X1EEZ+bJt20AScvR2XvoWKgR+V47PtLnXzQAYdBNInuxX6gUATH7cbRI8ObeIn9Md/bwnib3tYDDOz99mpo5lfRP+Fe86W8Et94XzwpQcIxdePI+u7lgtXdrBTl6sbwkOtFu/7UpBewmJKqpmNnzXp+0ZTlxNNpx2o17QA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(23010399003)(7416014)(18002099003)(22082099003)(56012099006)(10067099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JGORlM/uFsgQVEuUlF4Lv5PAN7stmkA1WT41dnvum2jsuELbdvFiLOgX40Y+?=
 =?us-ascii?Q?2Q3DozeEdbX1Jf73lgp7Ra2VHm0Co3SyeJ9p+0LFaAl9aQl8+Ax68Z5KEwPM?=
 =?us-ascii?Q?fgkry+y7/2rKLYHFXj/OBatmPTOCGrS3XxhAkIAMXXlrc8HIkus4o0+5sUDp?=
 =?us-ascii?Q?2PTyx9h3Vi5TM2PbAd0szgKbCRD6m5us/rYzc/NQpuPY7qg03Yfc1e9M4A7A?=
 =?us-ascii?Q?9Ul9cs+RGDMSNclwlR0c0F3kS+1hI37GiWqPG26a7YpLExWV4644aCALiHPL?=
 =?us-ascii?Q?1DdGeWPSBA1PVHvkrjeON9jp208RQgjFVF+FknrFdTyHaQr2IK87lDMy+XCm?=
 =?us-ascii?Q?f+U7NX1Og0WPE6I0jY+3MLstTE3DV+fybeGJ9g9R3uf8eVpLf7yHt1jVWeL9?=
 =?us-ascii?Q?iQD2WMAdUVXiqIZTUyobujmekHId9WbHkcgMxLZ1g5PxfxQjbajHJ73Ny6Hj?=
 =?us-ascii?Q?XZlCU3bKokNszvD4/D+ArMuJjbcDuJTzxXaDRifCJRR/Wq6I1nMIjF9VNg1f?=
 =?us-ascii?Q?usIP4p2/B7DcD+Sh1Q2ogsEJs8sAbx8JX/v03EpDOmi/gIuzp0HmlcWvCUEg?=
 =?us-ascii?Q?1GZ71wnYlCSUhLJdBGKPB9+a44a8r1aS1KBre3gFjCGg+HZn2cvtLy42pcLi?=
 =?us-ascii?Q?q0peipHaQdjHwkY8VV6MRXzwZ5PTn33FfSLe9B4zaINf0eoDmORgzHOlRsWg?=
 =?us-ascii?Q?kOTFMRqxCvxRY3pJDJ81j91YAIA7fbezCP9YVPYwIHHw9l/oKGLIaasorBEl?=
 =?us-ascii?Q?YkaGu5coOSrTDKKUMylBomiix73h99/jca6T+drMRhKwBbImmh/agGHIsgO7?=
 =?us-ascii?Q?2FIe0s0M/WGBGzu7W9wm2wA0gz8fLMOaGsfmKfLYR8qQ3Qqpzabiys6Xuvcm?=
 =?us-ascii?Q?5Z2+7NJinM+Eai07AHuz+BuTkLPLR4IPuvWr/wQiJDV479PQRG8ImtVm32fK?=
 =?us-ascii?Q?wPpJPdeBQIOu2ENIuLan96kxLBj6dnVZC9+1WHn7yHVb53UYSxC2ukkGsvj5?=
 =?us-ascii?Q?F+mQjhrddlcXtSSI25gxG7GiTf0a/PFfECcZQ7gxkXJiffBPOQPxGjpfrnbk?=
 =?us-ascii?Q?3BHFJgSrXh5bEhvwrU4GjxGI0LABP4eJXy4ZcDQ6scPfKY4PcutRd65gPqm0?=
 =?us-ascii?Q?DexyLZDZFk6gWNS/Gldlz4USnzqh8gQ9r3kY2oIv3vNxy6dLK5cub+JfydvO?=
 =?us-ascii?Q?njhw6QHlZK9MSNMTbTC/MUR/T0E/iA1a5QyiGvNBsK4tUF/Ok5CETZ2Ke3Rl?=
 =?us-ascii?Q?eQzSizwAaPf+S5UrklE4TW8XffgxVqjTSivrRSRkIIm/aXrmie2+LBXfXHK1?=
 =?us-ascii?Q?URGQUQm2g8pzbnHx/Uw5qN1dkLBrcURVpIINrFUmTD0JVEC4m8/tDEess7sJ?=
 =?us-ascii?Q?GabqKJPgCRRJWzJMk6W2Arx6Ba99waJKvHOMRVXb8S20je8DvKj5GwfDn20C?=
 =?us-ascii?Q?le3ibrLzJs+JLNTNHYgPu8ttIbsV0CyQsajRqpM+l+w9HW+4FNUJLEzO9jnO?=
 =?us-ascii?Q?eema0LpptdgBaFG8qvfI7XyelU52L0o5cONySl3GgTq5fcw8QLviCw/q+Z0o?=
 =?us-ascii?Q?UgD68Bsk1EV7JoTLTQa5wpMDddtGfc7AMnJFjQpqP1wUqE4kdOExOoVqNlEE?=
 =?us-ascii?Q?OuRm9dwFjLko9Ux1be5gTWyKGYqZE2oRr56L6n7rVzIUBAkZ0CArjtM11Shl?=
 =?us-ascii?Q?zOZ3PdRcc9GyIPQ0lvy+xqRbayZ7XSh6/kMD4Dl4dy8u10xYt84z1afBaNQR?=
 =?us-ascii?Q?xT4qkN8RQQxVjIFRvZKvnUgwtyMX/JfvPdo6IlRFJU+1QcCaOKMc?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: e713c59b-6082-463d-28e7-08def88a7298
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:57:44.5512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Y/LJ7JZQhgX641gkOpkcefK9UbtAyYfYEHQMw6OkqGIBNwKwXUG5mAuth/TS3D8aE56Ns175Di7qjO4SAHeDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB7069

Under sustained multi-channel traffic on one eDMA integration, a write
channel occasionally stopped with pending work, no progress, and no
error. Repeated doorbells did not restart it; clearing ENGINE_EN did.

LL progress accounting already schedules a bounded recheck when a DONE
or STOP/PAUSE drain leaves published work running. Reuse it for passive
stall detection. When a check finds the channel stopped, run the normal
restart or drain path, kick it, and arm one more check. If it is still
stopped with no progress 30 ms later, queue direction recovery.

Queue every recovery request and let the workqueue coalesce duplicates,
so a request raised while the worker releases channels is not lost.

The condition uses only generic eDMA state: published work, STOPPED
status, and lack of progress. Providers opt in by supplying the recovery
operations; HDMA compatibility mode is excluded because it has no
ENGINE_EN. Normal progress cancels the check before recovery runs. The
30 ms threshold is empirical and should be validated on more hardware.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.c | 52 +++++++++++++++++++++++++++++-
 drivers/dma/dw-edma/dw-edma-core.h |  4 ++-
 2 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index daf1fa89ef94..8dba7e02c944 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -257,6 +257,7 @@ static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
 
 	chan->ll_head = 0;
 	chan->ll_done = 0;
+	chan->ll_stall_valid = false;
 	chan->ll_recovery_pending = false;
 	/* Drop stale CB bits before reusing the circular LL ring. */
 	for (i = 0; i < chan->ll_max; i++)
@@ -302,6 +303,52 @@ static bool dw_edma_ll_pending(struct dw_edma_chan *chan)
 	return chan->ll_head != chan->ll_done;
 }
 
+static bool dw_edma_engine_recovery_supported(struct dw_edma *dw)
+{
+	/*
+	 * DWC PCIe Controller Databook 6.10a-lca06, "Legacy DMA and HDMA
+	 * Software Compatibility":
+	 *
+	 * "HDMA does not implement engine enable, that is
+	 * DMA_[WRITE|READ]_ENGINE_EN_OFF.DMA_[WRITE|READ]_ENGINE field."
+	 */
+	if (dw->chip->mf == EDMA_MF_HDMA_COMPAT)
+		return false;
+
+	return dw->core->engine_reset && dw->core->engine_enable &&
+	       dw->core->ch_transfer_size;
+}
+
+/*
+ * Called with vc.lock held for a stopped channel with LL work pending. Queue
+ * direction recovery if repeated doorbells show no progress for one recheck
+ * interval.
+ */
+static void dw_edma_ll_stall_check(struct dw_edma_chan *chan)
+{
+	struct dw_edma_engine_recovery *rec;
+
+	if (unlikely(READ_ONCE(chan->dw->teardown)))
+		return;
+
+	if (!dw_edma_engine_recovery_supported(chan->dw))
+		return;
+
+	if (!chan->ll_stall_valid) {
+		chan->ll_stall_valid = true;
+		chan->ll_stall_since = jiffies;
+		return;
+	}
+
+	if (time_before(jiffies, chan->ll_stall_since +
+			msecs_to_jiffies(DW_EDMA_LL_RECHECK_DELAY_MS)))
+		return;
+
+	rec = &chan->dw->eng_recovery[chan->dir];
+	chan->ll_recovery_pending = true;
+	dw_edma_engine_recovery_queue(rec);
+}
+
 static u32 dw_edma_core_ch_transfer_size(struct dw_edma_chan *chan)
 {
 	if (!chan->dw->core->ch_transfer_size)
@@ -579,6 +626,7 @@ static bool dw_edma_ll_consume_progress(struct dw_edma_chan *chan, int idx)
 out:
 	if (advanced) {
 		dw_edma_ll_recheck_cancel(chan);
+		chan->ll_stall_valid = false;
 		chan->ll_recovery_pending = false;
 	}
 
@@ -767,8 +815,10 @@ static bool dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
 		}
 	}
 
+	dw_edma_ll_stall_check(chan);
 	dw_edma_core_ch_doorbell(chan);
-	if (!dw_edma_ll_has_hdma_stop_event(chan))
+	if (!dw_edma_ll_has_hdma_stop_event(chan) &&
+	    !chan->ll_recovery_pending)
 		dw_edma_ll_recheck_schedule(chan);
 
 	return false;
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index 855ffbd2c06e..b721d0926de5 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -126,9 +126,11 @@ struct dw_edma_chan {
 	spinlock_t			event_lock_per_chan;
 	spinlock_t			*event_lock;	/* Selected event lock */
 
+	/* Per-channel stall and recovery state. */
 	struct delayed_work		ll_recheck_work;
 	unsigned long			ll_recheck_at;
-	/* Per-channel recovery state. */
+	unsigned long			ll_stall_since;
+	bool				ll_stall_valid;
 	bool				ll_recovery_pending;
 	bool				ll_recovering;
 
-- 
2.51.0

