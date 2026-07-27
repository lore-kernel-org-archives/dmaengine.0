Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020093.outbound.protection.outlook.com [52.101.229.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21833433030;
	Mon, 27 Jul 2026 17:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171829; cv=fail; b=tWBJqCw38FzOfHtodAHnf54dYLPrrn5Lxjo1gZDVp90ZbYubdbOS4vbC4xceQsxfI9YsiUYq+y7EK3kE+8KKUHESw+uHqmpI2ZeV4u5Lu69qReAM85co7h52wCVyGLkyo/CeFouhUqSOgocX11AzK2Mn0ijPVPcMWwBo0sK7F5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171829; c=relaxed/simple;
	bh=tKvd7LP+Vmnhy4yhb1WQK6V311yEt3Knl4MorO1JYgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NEw+F+OQjPrrMUZMnknmwITggH++/wiJe0STjeb6gXGgSesDvVfLO+1HOiD/olcXObBrNDHeiwT3B53TBsmq0N0JS0nZsd9am4VMlKuvRV+MHElFwaMSFL7nwfxYdxt5B8l7DOL9VkObY1ybBZeQoEI7O8bZAhTaF4SLTr4VFjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=ABDkV820; arc=fail smtp.client-ip=52.101.229.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="ABDkV820"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RW8GlSdF41KGY2vnk8KA5FBq39HKm6r4bPpmUwvsUKCXuLlEu0r6B4Q3LGOVj8PTXvPjifGvkHnEqZYdopNBVs5iCs2l9tDANPNlg4zZtoTiNda1/TpaXNksQoKiHlrTf7VblZPTnXrEGuXQCWo0uujx0CvLlf7LsTAbPGNjO7On5gpYRnmZWqtuvCOj8B7Io8p4SUURvr9k1NXXnPzbOvt9ogrkfE9e4/TmeUoXpQ/XlxQur9ySKFDmiAdtQbya8Vuhq4xFjdMRBMmf8XFQzEUjDqq9VdFzxFMCh6pBhXKnXZGW4liVFx3f78W5Rwi6gQIEPcTi0KPAHFcVlsur0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCOoaiXwB3cnQc8YWJbU6oUWfR+zSKbySEpAGaDNARI=;
 b=ajmLVo1LY+eizcySaI+qNBlg/XBcCa+Gr34fj2ey+u6fL1gxYE6btRsH/CfFUS2TfDHmbG0F2HC+TAIP73KNZKpHdZQsoL4aXV/4CSJ1EHyg46/d1cS6TEqD4k2il3v1ZPBg0gO2JjG0EC3LtabOPt7fU3P2p7yMkXGMRDS21h6RnhBjtqnjdEvdAFnZL39q4cqXy3pOazg8BwCs+/V6KSqyXDhkSfrL/2MGoX/zPHBIyN9SlljmD1Obed/50d7kQ3uQCa3S3TgpBiTEFWETD42bIVMINYkYiw8rPjysKG1x67tF8cI8QVJqecFlzLOIxf1/TEKuEKfr07dCPhFedQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCOoaiXwB3cnQc8YWJbU6oUWfR+zSKbySEpAGaDNARI=;
 b=ABDkV820hQ6MpoxC7Vb5xRfzJLr+Uk7WxM6Hoxz/lmwQ9UEK5qsxaDXrSpQT9KcQ8lTxyNLqofmnptkWM6bGTr35NLwMHN6NlWxTegS3VDM9Z6YBuoN7DqZFCuCZbNhYrs6uU6MMbMmGwdyWgHtgT8pCWvGLh2M/2hVgNuujymw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB4609.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:1a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Mon, 27 Jul
 2026 17:03:40 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:03:40 +0000
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
Subject: [PATCH v3 11/24] dmaengine: dw-edma: Serialize LL event capture with channel kicks
Date: Tue, 28 Jul 2026 02:03:10 +0900
Message-ID: <20260727170323.2321369-12-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260727170323.2321369-1-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0073.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::9) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: c9b28b98-f9e6-4b38-77c9-08deec0101ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|23010399003|10070799003|18002099003|22082099003|10067099003|56012099006|5023799004|921020|6133799003;
X-Microsoft-Antispam-Message-Info:
	BUENmFxc1lG2kb0qRKZOgSpN8ldY00OcBp5BKZ7xSk0HoSfwQerT9FzYy2kwriTCuNR1bcDnjbIixkxgYLRue9f5rE0Nw7NX2wQ2XCxYqeWpeLHcYinJVaDmHLn6JFHHgs5AN0F9OauyMcwYjbsforJy1BdNB8K8Qe1pZAToFJvDP00o+taf48jPO5SgxLQiXEhfzVEnOCdVFkSdtMUlKDyARRszN0o4um4Ug3INWGH+P6z8/SwcLlCncOktWn2ajuncAGjHsr20NvZiZvV8FIWrN/2uuFj2sYbc9aZnp+ZjMBq1WF43pIPRWQ78mCyGF910MbEBuKvOpVn8YUIlrg2AxRT2Yn9l5TwYJvreGI4AbtagsmLp+KhKA+yhlvonPtxyqIGwTIw94QEsNCGPAX/Bps3Z09BZrYfrG9MalIgvH/agBhKYf07WjJA8s+91j3Q9Nhj9QLbFacK5Fst0tI/PYwEcfSBSna0MfU6TJcq+uSlmISaN9B3lJ5Xf3h5y//iMKrKEj9L9e1oUVTgW8/lePkBefdGZqFGQrKUcpgrmk0AA0k4zRSaoeUXzH7pobYRg8AiyfRaCHHkYthnvfh9rjGonKE1fBmZzMyRXc/UcKzLcEdwvrhroqw5SVhJbT5Qgb8QCdykdBxqsjBk5FxcZl4YBKSD9G95HXZZHNrTf5McE4AI55Cq0E3h2MwtRcrSfcIB6qO1k/AUQ3XYfUA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(23010399003)(10070799003)(18002099003)(22082099003)(10067099003)(56012099006)(5023799004)(921020)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YffoiYzVHKkjDCOtfLpD43SUXRDznp+O8ZRQ1tlupVyLCnAp59hZAozBg31o?=
 =?us-ascii?Q?lNNkfV/EwoRpn8OWo+nyf9OfWLbirtAkfcbkZ9xQuVq3Sxkf7D7KEKmEgK4E?=
 =?us-ascii?Q?XdpPA2EcwT65/QqK/fVYUVNpa2ZRUCuCePRJxv5Rv81pGGaRP6MbNchuFszh?=
 =?us-ascii?Q?OHxZQnxlzmVxhAmhS2dbdk5tlNHwUcG4kmCO9Vkhk/51Tx6v2GdM3dAOMZDz?=
 =?us-ascii?Q?12ouqp2+athcnRQC0/nC4do4W52mmp3izntmobdtM5c4eif0IHAurA1JsmgT?=
 =?us-ascii?Q?0rVfP+rT24B5INfvFLXBBSusQ6KXlUUbcuuDqjPV8J6VwWneB0w1t/gE6MFV?=
 =?us-ascii?Q?/hKjF15mVCFxtRuO20PUFff3u2cKMkGLth2CRqTgU7T9Qg9NWNLAl+knz1V9?=
 =?us-ascii?Q?Mw0pXkuVSa/uTt3H2uV4/C2u3tBz2ghlsdbMoFH3hg5dycv08WZAPA2ln+5F?=
 =?us-ascii?Q?mijeTSxjfXd/nOQljM3heL+0kJMLb807AqcM5yIRQCT0DbEk0/S4jnp6goIS?=
 =?us-ascii?Q?UG3lxhdEukmCWM0Iwz5PHoF/8A7dBJxV8MO+rQP6bh5CuEPr4Zm2tI+9/jK1?=
 =?us-ascii?Q?ORIIHVtajXJL/FHbX1y3Ayl0ItO2KrdQfMc1m+tn8XC0R9HnWU+3ZfY67AUk?=
 =?us-ascii?Q?5SddiyzN8QX8oovOs8KrR5Ii8qTezGEaGWCjrwaATDDbVVn9dEg7DFl4v4Uq?=
 =?us-ascii?Q?CmOwBooA4jYunMMHC799fKd1pJ1eYpnx6xipuPbHjSQgaYd5sa6eI84mtzhu?=
 =?us-ascii?Q?vO00bQ68AetjfOTkW+9oMs+H5EYHrahlp41vXMWLGBrqEd5A/nrmvkTKfqPk?=
 =?us-ascii?Q?TU8s88Dmwq8X8Q8VklLvzQRqBRlyZ9NzgswNGqdSaISV4NP6VMJABCDOdtUm?=
 =?us-ascii?Q?dFLkG9o2C2SMfpAt9gJVPIOWG2PCiJ1kEdf+oxyqphkZzovFOLaC1t1+bNyN?=
 =?us-ascii?Q?uDuvd9hUBZDlgnf29RDMFhRJ/itOQukbE54VK+JbN4VTr/30/AeGjqIg3Gfw?=
 =?us-ascii?Q?uaAVUJmV4T/KCuoR26WWF11bqm1DX+nMGTh+c8O3nhToShIRH/2bEquTguda?=
 =?us-ascii?Q?XhLcUOZjurrzDm57xuv5Zx02EmNaXt5fFBE3Vph7yhDqpATYydEV8ZvyFouA?=
 =?us-ascii?Q?bbqvxpgvU0f+OfIKfiU3+R6ai3MTpZWMYk0rMmCfvkDGoesqbnGQI7i0dOsK?=
 =?us-ascii?Q?hyG0eijoQIFxXtDCOUxNAb7A2gSTZ70N+Xtpx2dGmO7AQO3HFv2O3xpwEaRU?=
 =?us-ascii?Q?v0vF4/O/RuA+Yv00O5cMIvYsHUErAK/0bLF9pHNV4nLJB0+ULkNEf+Cep2ZU?=
 =?us-ascii?Q?fLTFe67JTtNyzwJsdWB/YMm5gevJrtgJr3FPJieXWaIa23J0lgW7aqHI/lY7?=
 =?us-ascii?Q?IJTFLGMM6gJR+FUsoz+Aq19kN/B+e6LEBSMyl59i/A/bdIc0L5ByD1kPsUVw?=
 =?us-ascii?Q?eFDr2LGzD+mptOGtqLABAjCkZ/HBkQgPb08gLH0mKujnV//HJkqYwIecJx2U?=
 =?us-ascii?Q?BheBHE2a9G43eHJRi7v/Vecg4B7qQIfQ2gtZaZzCpb5TCfjoERodO9s34ZVy?=
 =?us-ascii?Q?QzPJH3P7lvI601NjTxOscJMQ1v64DQhGnB9AMDuAiPxy/6ZFI4KwAGVwPThG?=
 =?us-ascii?Q?PKzWOYoFTP4l2WPA4BAf8IL7C7t7g+XVHWDYb4nVE9b5RqCoBIuSS72wb9uX?=
 =?us-ascii?Q?7zHd+Goyfqwm36jid7OE/mvmX2J3800km3ospTLfvzSfKllJGJWUlyNZtllj?=
 =?us-ascii?Q?AqPiwONjUu4LqMkG3/kCWec8Nx0DTCnIH0SHvrfU9hJUjqFpzCrQ?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b28b98-f9e6-4b38-77c9-08deec0101ca
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:03:40.2928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S7w3MbDVBECne0SV4FlRblxILreUWIvT3gJkGLyNwmC/7TZNPvivLCDW2rNEfJNs1P1GEKCyW0XvmAtC3BKbeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB4609

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

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - New patch to serialize IRQ event capture with LL doorbell writes and
    defer doorbells while an LL event is pending. (Sashiko)
  - Add explicit PROGRESS and STOP types for deferred LL snapshots.
    (Frank)

 drivers/dma/dw-edma/dw-edma-core.c    | 101 +++++++++++++++++++++++++-
 drivers/dma/dw-edma/dw-edma-core.h    |  37 ++++++++++
 drivers/dma/dw-edma/dw-edma-v0-core.c |  64 ++++++++--------
 drivers/dma/dw-edma/dw-hdma-v0-core.c |  32 +++++---
 4 files changed, 187 insertions(+), 47 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index e3d0559206d8..3970b066dca2 100644
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
@@ -74,6 +75,52 @@ static void vchan_free_desc(struct virt_dma_desc *vdesc)
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
+	guard(raw_spinlock_irqsave)(dw_edma_event_lock(chan));
+
+	dw_edma_ll_snapshot_discard_locked(chan);
+}
+
+/* Must be called with vc.lock held. */
+static bool
+dw_edma_ll_snapshot_take(struct dw_edma_chan *chan,
+			 struct dw_edma_ll_snapshot *snapshot)
+{
+	guard(raw_spinlock_irqsave)(dw_edma_event_lock(chan));
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
+/* Must be called with vc.lock held for an LL channel. */
+static void dw_edma_ll_event_discard(struct dw_edma_chan *chan)
+{
+	guard(raw_spinlock_irqsave)(dw_edma_event_lock(chan));
+
+	dw_edma_ll_event_discard_locked(chan);
+}
+
 /* Must be called with vc.lock held. */
 static void
 dw_edma_set_request(struct dw_edma_chan *chan, enum dw_edma_request request)
@@ -120,6 +167,7 @@ static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
 	dw_edma_core_ll_link(chan, chan->ll_max, chan->cb,
 			     chan->ll_region.paddr);
 
+	dw_edma_ll_event_discard(chan);
 	dw_edma_core_ch_enable(chan);
 	chan->ll_valid = true;
 }
@@ -269,6 +317,17 @@ static void dw_edma_core_ll_sync(struct dw_edma_chan *chan)
 static void dw_edma_core_ch_kick(struct dw_edma_chan *chan)
 {
 	dw_edma_core_ll_sync(chan);
+
+	guard(raw_spinlock_irqsave)(dw_edma_event_lock(chan));
+
+	/*
+	 * A recorded event belongs to the current ring and must be consumed
+	 * before starting another hardware run.
+	 */
+	if (chan->ll_irq.event != DW_EDMA_LL_EVENT_NONE)
+		return;
+
+	dw_edma_ll_event_discard_locked(chan);
 	dw_edma_core_ch_doorbell(chan);
 }
 
@@ -779,6 +838,18 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
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
@@ -811,6 +882,8 @@ static void dw_edma_irq_work(struct work_struct *work)
 
 		if (events & DW_EDMA_DEFERRED_DONE)
 			dw_edma_done_interrupt(chan);
+		if (events & DW_EDMA_DEFERRED_LL)
+			dw_edma_ll_interrupt(chan);
 		if (events & DW_EDMA_DEFERRED_ABORT)
 			dw_edma_abort_interrupt(chan);
 	} while (atomic_read(&chan->irq_pending));
@@ -825,14 +898,29 @@ static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
 
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
@@ -1020,6 +1108,7 @@ static void dw_edma_device_synchronize(struct dma_chan *dchan)
 	dw_edma_wait_termination(dchan);
 	cancel_work_sync(&chan->irq_work);
 	atomic_set(&chan->irq_pending, 0);
+	dw_edma_ll_snapshot_discard(chan);
 	vchan_synchronize(&chan->vc);
 }
 
@@ -1071,6 +1160,8 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 		chan->irq_mode = dw_edma_get_default_irq_mode(chan);
 		INIT_WORK(&chan->irq_work, dw_edma_irq_work);
 		atomic_set(&chan->irq_pending, 0);
+		chan->ll_irq.event = DW_EDMA_LL_EVENT_NONE;
+		raw_spin_lock_init(&chan->event_lock);
 
 		if (chan->dir == EDMA_DIR_WRITE)
 			chan->ll_region = chip->ll_region_wr[chan->id];
@@ -1307,6 +1398,8 @@ int dw_edma_probe(struct dw_edma_chip *chip)
 	}
 
 	raw_spin_lock_init(&dw->lock);
+	for (i = 0; i < ARRAY_SIZE(dw->event_lock); i++)
+		raw_spin_lock_init(&dw->event_lock[i]);
 
 	/*
 	 * chip->ll_*_cnt describes the channels exposed by this instance. Keep
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index 6b0d475bb8b5..9f528f160cea 100644
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
 enum dw_edma_event_scope {
 	DW_EDMA_EVENT_PER_CHAN,
 	DW_EDMA_EVENT_PER_DIR,
@@ -76,6 +82,10 @@ struct dw_edma_desc {
 	struct dw_edma_burst            burst[] __counted_by(nburst);
 };
 
+struct dw_edma_ll_snapshot {
+	enum dw_edma_ll_event		event;
+};
+
 struct dw_edma_chan {
 	struct virt_dma_chan		vc;
 	struct dw_edma			*dw;
@@ -104,6 +114,14 @@ struct dw_edma_chan {
 	u32				ll_head;
 	u32				ll_done;
 
+	/*
+	 * LL event recorded by the hard IRQ handler. The event scope lock
+	 * serializes its capture with a new hardware run; vc.lock serializes
+	 * its consumption with LL state.
+	 */
+	struct dw_edma_ll_snapshot	ll_irq;
+	raw_spinlock_t			event_lock;
+
 	u32				ll_max;		/* Data entries */
 	struct dw_edma_region		ll_region;	/* Linked list */
 	bool				ll_valid;	/* LL context programmed */
@@ -153,6 +171,7 @@ struct dw_edma {
 	struct workqueue_struct		*wq;
 
 	raw_spinlock_t			lock;		/* Protect v0 shared registers */
+	raw_spinlock_t			event_lock[2];	/* Per-direction event scopes */
 
 	struct dw_edma_chip             *chip;
 
@@ -177,7 +196,9 @@ struct dw_edma_core_ops {
 	void (*ll_link)(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr);
 	void (*ll_clear)(struct dw_edma_chan *chan, u32 idx);
 	int (*ll_cur_idx)(struct dw_edma_chan *chan);
+	/* Called with the event scope locked. */
 	void (*ll_irq_clear)(struct dw_edma_chan *chan);
+	/* Called with the event scope locked for an LL channel. */
 	void (*ch_doorbell)(struct dw_edma_chan *chan);
 	void (*ch_enable)(struct dw_edma_chan *chan);
 	void (*ch_config)(struct dw_edma_chan *chan);
@@ -221,6 +242,22 @@ struct dw_edma_chan *dchan2dw_edma_chan(struct dma_chan *dchan)
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
+static inline raw_spinlock_t *dw_edma_event_lock(struct dw_edma_chan *chan)
+{
+	if (chan->dw->core->event_scope == DW_EDMA_EVENT_PER_DIR)
+		return &chan->dw->event_lock[chan->dir];
+
+	return &chan->event_lock;
+}
+
 /*
  * Return the current LL entry index. A negative value means that the channel
  * context is not initialized or was lost after a link reset.
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index b3098eb83442..43e33a400a3e 100644
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
@@ -356,45 +356,45 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
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
-
-	val = FIELD_GET(EDMA_V0_DONE_INT_MASK, sts);
-	val &= *mask;
-	for_each_set_bit(pos, &val, total) {
-		chan = &dw->chan[pos + off];
+	scoped_guard(raw_spinlock_irqsave, &dw->event_lock[dir]) {
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
index 64a07fbc5be3..bbf9ee0392f8 100644
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
+		scoped_guard(raw_spinlock_irqsave, dw_edma_event_lock(chan)) {
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

