Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020143.outbound.protection.outlook.com [52.101.229.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658ED47CA7D;
	Wed, 12 Aug 2026 15:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550277; cv=fail; b=tjnRSd8v/Mo763hFqaHvbs7M3zLR+7B0MMMRHZJdIUn/uMDUt/NvB1cpufLSnQsWev/5IcGaPaV5/0jfF6GPp8f7xedamnhaKoRM1+jrXqHlrglrVxY7bIspNk8yCaWuTxr0ViCLgasLlUyL9FTTAiWXKlOUCWeVbSa/O0l4j8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550277; c=relaxed/simple;
	bh=qoWc3n5QjxbzHYbDsInNykbYUrRlqhUDifmEf5TPds4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M3bfkYdaEbgrLbMAm8weocsun2CDJG2iOm26ePO8OiV+VNudSvNfS/Is06DSU6NsBXMoEgG0k8kBlJegOJkRgnamRN1urdhDygD/tEjaLtrk97Zq00tcBqYtQs6r2jT7WLQ/1LXix/HILCWnf81aC01dDKx6AgwlfjQ0qFvKfG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=dlavqJoi; arc=fail smtp.client-ip=52.101.229.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="dlavqJoi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tFleaEEL8fCc65uV3uoUclP79lv/gZ9zQgKUPrZgMqn6jLJo2H35K1EqhfP7Rw9zxAxHagI+hp8jUwdsQsnrZAfs4vEBx96cb1giyqwkYVCwc7QIEY15P/piHRGgGWQ6WPAofwleYfr4/e5kcM5vHOewNaKZcGE5aXCcvrw/ovXLHnGEqtLsgnMtmbd1eMXY4MzCClCXTDD1dcuKJswC37MAPwhTGh7XJwow5VMu3ojTHwAavtzrfDS3KbJUS3Ha4FxoCGn8227fY64H3j9/0p7NdDJp75W9xtZgYg635HesvT0qFR1a3nb/nlq/VKXkrABYrBDAytCuRMcorNs4rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gT8vU9Av733Cgu2bm2j4FKJhiGqyHejYWMdYTPHrSQ4=;
 b=PI44LknW5KwPfbg0b9QjZvGqxN2rzqnyTfZi/ALffnm5JVwZYyV1qPFXGanzI/C7yD2cHXQ9CewsUq6Cl3piGMWyJVxZWGoG0ruogAt8CsBTZRT0Cj+HyO35EfyJWnQVsKw5bZfLanQ6dUORBr09iWlNRbmBl+5bu/3IMYDftuS7rgZ41cZwE0CZ8RNo5ZvznYi+YacXRbf3X4VYSTM5lM+kHkjBj4nMIyteq3DIipvDqwqUP+odPDEhR4YAQMF6MxbxEZXZ3LccANJY/qTPUUEMEXiAvS0CHv7V2qYbx0w2C+QtKHNyGN2DYvDOGZ6+kDZj/HNcu+Fq6uUTikDf8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gT8vU9Av733Cgu2bm2j4FKJhiGqyHejYWMdYTPHrSQ4=;
 b=dlavqJoiBTdk7kvK4MYPSVV1jOTBj0/Fi9pVSVTRBtuvFbxQDbjKnSzTApYTIREbff7dPuOasKYizz43FpZk0Eb33zn8o3dmdJhuvMFQtyt0PQGyYrXiqpSUFV2ggPbsmU04OFZJadrYy1/G86wD/SEDKE+HtNU8YiMxUY1xFnw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB7069.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:343::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 15:57:42 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 15:57:42 +0000
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
Subject: [PATCH v5 21/24] dmaengine: dw-edma: Add engine reset and enable operations
Date: Thu, 13 Aug 2026 00:57:18 +0900
Message-ID: <20260812155721.2807506-22-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260812155721.2807506-1-den@valinux.co.jp>
References: <20260812155721.2807506-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0016.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: df25a785-75c0-48be-173f-08def88a717b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|23010399003|7416014|18002099003|22082099003|56012099006|6133799003|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	UJGvNl8VF7qxbu5nnFpUmLZAw99s9LbsJVCoRMjOfZIyUBLC9HWCvFCqd3rufZy4i8//3SVqJgdCmoX7Cu75kMtPimEjRL2hksM8AjPy8bHBy8e8a8tpJ1pYM+Fz7wrR8nXBg63DXerXm0Bv4MspxLsutZRDqp0fPOr4BtjINfqZ1A3fuIyjviVBYiOqAglOiWMEsE8lnsYWekjHq4GcOK0Yxp1CqgzhDfoBBcQ1GcCuQCXWs0oW6R5WipOLjos+Fc0VMFObKk2t7jba9ClXBfLPrhn2VaeGyvCCLk3uRAE71pxDyOEztW9ArxFNWtAVqvYNF66YmQah+Y/FGb54oa9qiuBJRvld+8x4q40nA4N9eu5dL8oWNCGAzSPUbBLx4ANvYqx4kiEgHfWRMvB7uQeSgT6ULpCwV1f3iGTLS2kes2L9duED3ctiCEy4amCEhJCsGC/lLSGkPjmnTXUMe5xAguWG+RV57sC8APpybj+BzzNBV06dsFsr8G4plVQEUuWFRABO6h+ZRybZ9j+8doU6McPSnUlePCTl5O4UxOd8LmZoBIJvYOCG9I1QeT6uZzOLx6wUmEOMiBAQGHVbp8Y1y050AalE5spA2ZzDTPDrvc1GhZq8t2l/M4ByZqXPnE/tsM8aQm4CMrhDF0kduU7dBp+R6tde0SJ3zKGqXN2+RO1UzJgKKb76dA0WikXDZV0L6TqEOJkr34GCascQWQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(23010399003)(7416014)(18002099003)(22082099003)(56012099006)(6133799003)(10067099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mFJo0m/GV5m8vCObd8Q/DWHyi/61SqaA/KLslRYAQ+EU6HY2GVm36TeTIE3q?=
 =?us-ascii?Q?rI+dNOZqNiYCdgInBYOwl2T5yMtMaRDu06fAhNeyGzCXRNsnbC6ZiMoSeQ2W?=
 =?us-ascii?Q?Fa4pSeGpB5B+cZ3afV9G8/nFW9GeWAb+bF88ZhdxP+tZg7BVRrCAuNnGTrcO?=
 =?us-ascii?Q?j2rtld/QlGuLhG/2E4+nLEASOceLHuFs9FfAqUfdv0+72e+tEULJ6vT13mBW?=
 =?us-ascii?Q?qbVK0awuBQNPL9PrGCDWa4ciGpSIXyGmVDuDNhhaFtGQ8NMLSYMOdoDq+tR9?=
 =?us-ascii?Q?MdHUy18RAwLkosy7fAP9xNUyX8VheBDx5c3HtBgAJHkNQqDE9HwTreMtjEXo?=
 =?us-ascii?Q?sk9+/JV0JpxJoLJpTAJuLVZPphljcldYRTgD24onlng22NiMhGh/5frJUGkk?=
 =?us-ascii?Q?DGF3znUJEA+9yn50os+j7oiYa2sNcxyur4aXqFTSaip9DMKSE0jrQ9+pj99T?=
 =?us-ascii?Q?5hoDlSZNzwmueztLXIpGHrhXzYhtpfvtQ/Yl8dkP2mmizKULsOfyDwf/WbWS?=
 =?us-ascii?Q?RXW24cvKRrISiuhdjgwrrzipicGFpaR1giegiNZ/KDTjPj7FQygIyzrX1Ft8?=
 =?us-ascii?Q?/rUSuSeo2RVTgkbz5dIqNCZ6FKm72nJrmpL62vNrpH7VQIPhvrZ+4YagHcd4?=
 =?us-ascii?Q?wSYoiit9ZZ0SrUQGjS3skaaK1UIQil9MpyN6RI6Tw9uBZ0/H/AaEEmBXxEKs?=
 =?us-ascii?Q?mtbqbO/7axfn7wyRRl+0AlBL8qzGcvDYbzcY8HGGXQ5etFx2LCVG0uNoo1r/?=
 =?us-ascii?Q?U9yrBwcubWMLT+CAJneKVDvO7w0YH34TBjllMXyLYM142sslXKJ2ch0et/kq?=
 =?us-ascii?Q?ntQVsKqc85FESPazHKU8jxWPjEQF4Un3Wn2H7Fl8nVfV28ajFHumXH39wimJ?=
 =?us-ascii?Q?hxZGjr9/L8Dc33e7CmhN+nkWOHO0HCByIECKyIBY8NkOGum7vhszj4Pj8R2r?=
 =?us-ascii?Q?Iy4QqYLER9P2Ovw0DgVaDM3SoOYjH4NEpSLgmP6XtTGiNxtLhtQOqTRW5zao?=
 =?us-ascii?Q?8I+NfHVA41x3rXu3qxmMesBzXjp61qJtn6xNw3vwvvo+YhXcAupr96Mc8gqK?=
 =?us-ascii?Q?haKUItBB5oJVH+4UlW3S6ni9KMMMj5duVV4281jm0K5dUMPPjBadZlas3sZ8?=
 =?us-ascii?Q?PR2IimQxY+h9YrnsQ6FpVvmQSE1tw0QzobB/0RlXEiYB1PQBF40IM4NbiKiN?=
 =?us-ascii?Q?dfuKcq3FWFiYUWvR6RX5CmC/3AVLCj5367GoU8Lj64HnzloFeoGtUcp7ZvlN?=
 =?us-ascii?Q?H1m15lfNPNwl/2nNUnjoQmBKRMUP30p8VW8zhBPEBvUj8c5XKKpsLTLk6bin?=
 =?us-ascii?Q?kGtm4vKg+uRKBzRffYSVP3oA/i5BIDq5K5SAx9h/aiIG2CjAV8Dy0UyLaQbk?=
 =?us-ascii?Q?zMGyVDyYhj/k8itJxkHVFYwaIwUHc7G5SLjnarbGvRBmQ5LCygL13hFgFGTX?=
 =?us-ascii?Q?O8xkNlrAYhUO4Dqohh6lGtGnehYKTEDtNtq3fAkwYZBU3ifdbKYHDz7PjBXN?=
 =?us-ascii?Q?pt4aPpRD7ysGYNjU7Qc+BV0vXzbh2L98du9oZ0TWnWb51H/lh1lasnctQNLE?=
 =?us-ascii?Q?znFGUIpe11V+Yn3mbHvKzCGVxqtfckKzFkPSZPPS8XvxE7GHeGx4QLJa0tNl?=
 =?us-ascii?Q?/4ERlI8EDsH9sty1SIYGjX06O1sy6e+lstOVuSEcX2AYKbLCrrKYgKkua2Hv?=
 =?us-ascii?Q?Y1ljCE95I183YHI6iGk83fuuPc/S4FQSik1jglFV7M6sFZN2yXxRKV1tgy5M?=
 =?us-ascii?Q?f63wr/BHWisMkS4zzgEWuu+VM1yAGbrAYcEZMY51PE/KYQ5h/AC1?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: df25a785-75c0-48be-173f-08def88a717b
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:57:42.6778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+vHYWMVcCJig9vXVFEtJaRXkOZCDh8opnPCV2hp+o8nIUg/XBaYfuG5PI1EBP4X2sCnV4ouHeyHBJ6vyhhgoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB7069

Direction recovery must keep the engine disabled while all exposed LL
channel contexts are rebuilt.

Add separate engine_reset and engine_enable operations. For eDMA, reset
clears ENGINE_EN, waits for it to read back zero, then clears latched
DONE and ABORT status. If ENGINE_EN does not clear, dump the state and
do not try to enable it again. A separate enable operation lets the
caller rebuild channel contexts first.

Enable the direction after channel context programming. Reject reset and
keep enable a no-op in HDMA compatibility mode, which does not expose
ENGINE_EN.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.h    |  5 ++
 drivers/dma/dw-edma/dw-edma-v0-core.c | 67 ++++++++++++++++++++++++++-
 2 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index aaaee312e973..329f02c58995 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -210,6 +210,9 @@ struct dw_edma_core_ops {
 	int (*ll_cur_idx)(struct dw_edma_chan *chan);
 	/* Called with dw_edma_event_lock(chan) held. */
 	void (*ll_irq_clear)(struct dw_edma_chan *chan);
+	/* Reset one direction, clear its IRQ status, and leave it disabled. */
+	bool (*engine_reset)(struct dw_edma *dw, enum dw_edma_dir dir);
+	void (*engine_enable)(struct dw_edma *dw, enum dw_edma_dir dir);
 	/* Called with dw_edma_event_lock(chan) held for an LL channel. */
 	void (*ch_doorbell)(struct dw_edma_chan *chan);
 	void (*ch_enable)(struct dw_edma_chan *chan);
@@ -371,6 +374,8 @@ static inline void dw_edma_core_do_ch_doorbell(struct dw_edma_chan *chan)
 static inline void dw_edma_core_ch_enable(struct dw_edma_chan *chan)
 {
 	chan->dw->core->ch_enable(chan);
+	if (chan->dw->core->engine_enable)
+		chan->dw->core->engine_enable(chan->dw, chan->dir);
 }
 
 static inline
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index b9d6205157b3..455fab945014 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -220,6 +220,69 @@ static int dw_edma_v0_core_engine_disable(struct dw_edma *dw,
 	return ret;
 }
 
+static void dw_edma_v0_core_engine_dump(struct dw_edma *dw,
+					enum dw_edma_dir dir)
+{
+	u16 cnt = dir == EDMA_DIR_WRITE ? dw->wr_ch_cnt : dw->rd_ch_cnt;
+	u16 i;
+
+	dev_warn(dw->chip->dev, "%s engine: int_status 0x%08x err_status 0x%08x\n",
+		 dir == EDMA_DIR_WRITE ? "wr" : "rd",
+		 GET_RW_32(dw, dir, int_status),
+		 dir == EDMA_DIR_WRITE ? GET_32(dw, wr_err_status) :
+					 GET_32(dw, rd_err_status.lsb));
+	for (i = 0; i < cnt; i++)
+		dev_warn(dw->chip->dev,
+			 "  ch%u: ch_control1 0x%08x transfer_size 0x%08x llp.lsb 0x%08x\n",
+			 i, GET_CH_32(dw, dir, i, ch_control1),
+			 GET_CH_32(dw, dir, i, transfer_size),
+			 GET_CH_32(dw, dir, i, llp.lsb));
+}
+
+static bool dw_edma_v0_core_engine_reset(struct dw_edma *dw,
+					 enum dw_edma_dir dir)
+{
+	/* HDMA compatibility mode does not implement ENGINE_EN. */
+	if (dw->chip->mf == EDMA_MF_HDMA_COMPAT)
+		return false;
+
+	/*
+	 * The databook says clearing ENGINE_EN resets the DMA logic while
+	 * preserving configuration registers, but does not document drain
+	 * semantics. On the tested integration, ENGINE_EN read back as zero
+	 * only after outstanding transactions appeared to drain; the stalled
+	 * channel then resumed after reset.
+	 *
+	 * If ENGINE_EN does not clear, do not re-enable the engine. On the
+	 * tested integration, re-enabling after such a timeout wedged the
+	 * controller and also blocked inbound BAR accesses. Return failure so
+	 * the caller can keep channels gated and retry.
+	 */
+	if (dw_edma_v0_core_engine_disable(dw, dir)) {
+		dw_edma_v0_core_engine_dump(dw, dir);
+		return false;
+	}
+
+	/* Discard interrupt status belonging to the contexts being reset. */
+	SET_RW_32(dw, dir, int_clear,
+		  EDMA_V0_DONE_INT_MASK | EDMA_V0_ABORT_INT_MASK);
+	GET_RW_32(dw, dir, int_status);
+
+	return true;
+}
+
+/*
+ * Re-enabling can resume a previously running channel from preserved
+ * internal state without a doorbell, so the caller must rebuild every
+ * channel context first.
+ */
+static void dw_edma_v0_core_engine_enable(struct dw_edma *dw,
+					  enum dw_edma_dir dir)
+{
+	if (dw->chip->mf != EDMA_MF_HDMA_COMPAT)
+		SET_RW_32(dw, dir, engine_en, BIT(0));
+}
+
 static int dw_edma_v0_core_dir_off(struct dw_edma *dw, enum dw_edma_dir dir)
 {
 	u16 count, id;
@@ -461,8 +524,6 @@ static void dw_edma_v0_core_ch_enable(struct dw_edma_chan *chan)
 	unsigned long flags;
 	u32 tmp;
 
-	 /* Enable engine */
-	SET_RW_32(dw, chan->dir, engine_en, BIT(0));
 	if (dw->chip->mf == EDMA_MF_HDMA_COMPAT)
 		dw_edma_v0_core_ch_power(dw, chan->dir, chan->id, true);
 	/* Interrupt mask/unmask - done, abort */
@@ -689,6 +750,8 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
 	.ll_clear = dw_edma_v0_core_ll_clear,
 	.ll_cur_idx = dw_edma_v0_core_ll_cur_idx,
 	.ll_irq_clear = dw_edma_v0_core_clear_done_int,
+	.engine_reset = dw_edma_v0_core_engine_reset,
+	.engine_enable = dw_edma_v0_core_engine_enable,
 	.ch_doorbell = dw_edma_v0_core_ch_doorbell,
 	.ch_enable = dw_edma_v0_core_ch_enable,
 	.ch_config = dw_edma_v0_core_ch_config,
-- 
2.51.0

