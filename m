Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020138.outbound.protection.outlook.com [52.101.229.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82A837CD53;
	Fri, 17 Jul 2026 18:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784311621; cv=fail; b=qpKp7at9KeKrwAXuP4Y/A4TIEJfQAL5MS+w9pOs1a8X0HFZ2fz92zWRWfyokrsjMPkGsHMCusa2Z63oMmixKXsZxb25uAh7RXsiqNNmUfrEKO6qBtls+1BzQs0s6PjBc+f63d/HS29tCxroCNpjdw4ZgHWTcmJNp8vUD2s9ii84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784311621; c=relaxed/simple;
	bh=YFHj6O7lVREAH+kqwWFiKo+IxPBl7QnMk2eNVHGDV/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t4DkxljgNpNonj68peAukdJX/7wZfcgpIO9Gcjv2uWyS+yslCrHpm2CRA3P2RlirlTovsgjBcE84XSksZ/HehLowvRfjeJ8OwfGc8pg3vnojF7UwapWwlmYtwXUNoQZm3bAr0bDzOZhyaM5CxK3Z6Y0t5PSS7tCnb0PImanhllY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=jzjtaeb2; arc=fail smtp.client-ip=52.101.229.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="jzjtaeb2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GeUPCCmEI0SLgZutp9CwJlGdEGIiaUKIMh1PvKHTHGDYqWk5AFG1YJmlGXt5P2aBk9HUNUyL5FnvO6Yrqiv389KxKK9HUtzyPF50zB3E8DjFW3pOzpGQvMXalAcjxCtSuXeA6CGA0QLAvelYxgpOAFT/HNRIcaYqVu7lfWw1o3ojMReFSWAml9j3I9jwU47rF0Xk40xuZlLWJzhyobjVCa9fhGyKqurZ2/0pBVkuuJOnCiw9H6V+tHKM7Hkl17U/Vj1UrnxEQ0WcrWm8+RUV+Dl3H532teJQyo3CKF/YhBEmlINE+USu6zrNKBP9nl6RbLD1NmS/3JlnU99PsinqZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cv+/a5FWdAiM8hmOa0z61jIoGwvniZakGP/KJmFxijc=;
 b=ligxtAP71Z5AnUmwjbO7mcccneBpLYNgWuI/1GTMZ9d9R5eCdD/p6yflEeskCVrBbOjSNJru79m+CyVV/vvlBvE+CNdmSKkdlTn6wlMGg4ln0beC5IwSCdzX6W/IzCuHAxZDQMT5vYv9t8RZQfOBoivGAWiW1A34KCWeh71UnJf9X0BLs1USyJMgxRwTbvtdCMJ2H6+pHUNJ6N9eKXcNpJ749iYKEm3RJvClXOTAKJjkUfq09T4ik88onBXICeICbqBgBgRXG39RXgrNkZoIzM80wdAyLFEOezX7fmytPyKFKNwaRNLaTn+Eu2kopQpxuQ8DnLRk5wO63mA0mkJvzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cv+/a5FWdAiM8hmOa0z61jIoGwvniZakGP/KJmFxijc=;
 b=jzjtaeb2djqcZRHywoIFALl68jBI4UgJSbAaNNCANzs51+ko2KYPzU1jlNk0Q2x4eR8i7dwQJkwyb4f/M0rNT/qjRK//KGK+89B9z3aZHuCnddS+3GsCe6GkdukfWqzcT/+H+Dyl41S1hvkRy91BKUdhpvTDBYsngb5OWcjjQ2c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from OSOP286MB7730.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:468::22)
 by TY7P286MB6785.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:31f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 18:06:56 +0000
Received: from OSOP286MB7730.JPNP286.PROD.OUTLOOK.COM
 ([fe80::b7ab:6af2:d18e:4a71]) by OSOP286MB7730.JPNP286.PROD.OUTLOOK.COM
 ([fe80::b7ab:6af2:d18e:4a71%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 18:06:56 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Serge Semin <fancer.lancer@gmail.com>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Cc: Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 9/9] dmaengine: dw-edma: Defer channel IRQ handling to workqueue
Date: Sat, 18 Jul 2026 03:06:39 +0900
Message-ID: <20260717180639.2643243-10-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717180639.2643243-1-den@valinux.co.jp>
References: <20260717180639.2643243-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0059.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::6) To OSOP286MB7730.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:468::22)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSOP286MB7730:EE_|TY7P286MB6785:EE_
X-MS-Office365-Filtering-Correlation-Id: 4278d1d0-5815-4757-13cb-08dee42e3070
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10070799003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DOfFABkFcXm6RE91RKxLL000apxl9siHQuU6l286GtJ8NJ5rI/PU66DJCTSHx8zKI42lMekRyGLsQM1pZ1k+3DB0cHQcDJPOkKg8vlJ/bvtWW5dMPv5dFYjdemSb2bCwNJtwaT7gEf85SNooPixX+T7taIxY9bGd78jfZCuot81HqL9NG4AYPS21B/3YuQVfjXrKUY87x6novfHtrSGIRrim0M8tVRIIlkcDgYaUWp2I27UUg02NPwA5nTPANNEBbOLDDQEOhKXbVdWZLRYzSjiz6AdwL//YwJjN/LqwAdDtPlc7dcBFIeX1XECBEQ5Ne3cM+u1lYh4j9lW8bjczcVe0ScuMvBrKZBIgFZ43Gyla9o66B8bQAQdTfI/Sk8MpRI4fpQGP302JnRvQ9nCcNLOVPcXLaQkG5B4yKDKa2bWE7IHMJnv5AbSuQjgw30j2/Tp+8ysK5rnwTp8IryzHVR4aB1tFvtVy0yT6miQ4UhZBZQxuRV1/0DN9RX+qIbNwDF09in/Ff2mHU4een1LHRQn0sETGPnXwzW01CkoCBW+6hN1gUEfFieZDlxCVALuPyN+IdJa6M5g84y+LJVt4+WUwlPwqF0FsChAwdgKDY9uY0ON82ojt/jt52IvovGOHOy2PQ2mzV2Q6bL4TccTNjIs3UuVmrq9/e0VSEpY7Q6o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOP286MB7730.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10070799003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JJeIBaKSfQe4iKvYywXhaKtbMzPNP46s8grl1pntb0EPwFzuKn7HeFIb5N9L?=
 =?us-ascii?Q?+rjrG931MyK3YuobkbqvQducP6ldGZ0yvIcOzYqkSeB9wN/RPMUkzsvX154Z?=
 =?us-ascii?Q?xesX8jQqwEfEzqGgjNLnitzL1M3ljFGrEeATn23JTNHw/srfFaxcS6uCy/PK?=
 =?us-ascii?Q?+P9JfsMGFlnImlJ4vNokCY4PcvtTKd5/GesowyOA5FvA61TUfsDxrTLZPAra?=
 =?us-ascii?Q?Y5KFxbnmTBZkST5JzAyev4E4I5r42fJOPx9uvmP3bkiMLRBMgswO3qjDUm9Q?=
 =?us-ascii?Q?/U5yFzE/sU1QEUZXMhVEEZd6CIxAanRasn9WMqjlEQblA3H6+cBdpbqJR7X9?=
 =?us-ascii?Q?G8WZz+qmJr3a9K7fnyDj6gKUHDBfo8yt0R9m6P4dZjMddwGyljQU3alOicFg?=
 =?us-ascii?Q?Q9+FgNtDZA/r63GUq8aPCfGMITMzGtcU9re33wBTfEonU3yl0XfeJcF7cXWB?=
 =?us-ascii?Q?CW/650PGLJYLT4Swr4Dthrw7EFHbu8wKUqp/QawI/HD7+kqLyKXmnCiOU7re?=
 =?us-ascii?Q?aqs9buLOuWK8uMOc0M+HmY6EyAV5gMZm8DEn5GcO62+wcQrjXlosFipR1vkT?=
 =?us-ascii?Q?OUziPb01g1WQkrI0EGqhA8ud3Yha+M/j6iCGhrGVhS0+DSzLTt5tGlyuRHsg?=
 =?us-ascii?Q?zp0ceEkUnaSef7Ct9EmnhEPY//VxBTL0pPT6cz299iEO6rHLhzfCy+fdM+2j?=
 =?us-ascii?Q?36QmSDJ/fp55K7cJJUU3ecUREfP/7itWDIWuiPQ5SO03LcSkdHuf1b3RP78l?=
 =?us-ascii?Q?nQlyDCwjpCmzD7svD8QBnRrRNargrdlB9vsE3xcsxX1UCGfSsSayRuAlUeu1?=
 =?us-ascii?Q?3BK7jlyDHzwYXgPc5lMgSsONM+TXn7Ty9f/Z/W7r7Q4Du1LrVKwuHRN2zwVz?=
 =?us-ascii?Q?iw63C0ky3WVrpk9Y+wOaSqfS1x1r3e5qfi4izJBSCwIJwC56dWszLaibD4z/?=
 =?us-ascii?Q?f/SZiCHx4FKU7EyKX2Uv/7vPAB4Y3nUf687apwKMXQClPOksbv6+ag72XsXP?=
 =?us-ascii?Q?/8qFsXPhguPh+sNee4pBz+0DkK4FItAKn2wfUfuxs1Z+tvU1Bpj2D55Ulvsn?=
 =?us-ascii?Q?8mtlt1DbNmrmmQehhBMDpRAg9N+Ml8QU/LmfyP60kEjZX4X4ac07FHTXuLnz?=
 =?us-ascii?Q?bX0b73cK9M8w1xtMOEpjt+VAuchzkIB/EmE10MytEVQSM+JLIhowSaixIY2v?=
 =?us-ascii?Q?drjguFf3TpIOCZNllaQILE73tRDNG8W2HMMyh90i8f+/im36d4Ufl6Oa7s4N?=
 =?us-ascii?Q?tYLBl+Ljutg35rM87U2/ZwR57/KdSq9Cw2dZ4oGKXN3eEZS+tjXxF+GC11fy?=
 =?us-ascii?Q?emF1JqQ72j2zb4GM9Wii0dlWjyYuNnz9Lxt4XtMfHLBGlHzbMdQ1lQenF+Uu?=
 =?us-ascii?Q?ZIPYowhDqMgXZMAj1h6IXcq4KsWfNgqjEI5fd4P8Oo4o40napBA7jpfNVtsh?=
 =?us-ascii?Q?dENDNtCYqYTtJ2OmrJYLrOb2H5Sm8PMau+D2FDRZbPvPpjiNUagf8/YqCB8F?=
 =?us-ascii?Q?xmpc0/SIizXYc4QwJbR4Pkh3XVfFllc4L+n0k6zAxNIisn8d/zzg5l8MBE1W?=
 =?us-ascii?Q?w82zgrFdM86j3vIosg+el0bWec1s54eu6ogFXIFswkI3LN1hR525aw/SHXD3?=
 =?us-ascii?Q?edt1T7bhHym1qWtT0korynNIbosTyGmoZ4f6SSDin01o/mwvwoZ9dMWXejwh?=
 =?us-ascii?Q?5zX7uJZfyaDHtjZeF422jqITQN85g3G8mUC01GJolRZo+451Bkacyti0JJWw?=
 =?us-ascii?Q?vUZpIh9y34W+pX1RPUTswoMvj3FAr3vsqUfoGoWDrOfT3sJ+6NS/?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4278d1d0-5815-4757-13cb-08dee42e3070
X-MS-Exchange-CrossTenant-AuthSource: OSOP286MB7730.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 18:06:56.6271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b41fA8mQglo0IvZuF8vsNCb2/k+Q4P1aJbbjfMaR6qCBSt2LST0XjXau9uNBNC37Flx7mGakFrFUgHyZXNPgKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6785

On some SoCs (e.g. R-Car S4) the endpoint-side eDMA raises a single
fixed SPI that is hardwired to CPU0 and covers every read and write
channel. Handling channel events directly in that hard IRQ context
serializes the completion processing of all channels on one CPU:
descriptor recycling and refill, client callbacks (the vchan tasklet
runs on the scheduling CPU) and the doorbell writes all funnel through
CPU0, while the handler additionally spins on each channel's vc.lock.
Especially under heavy multichannel load, this contention becomes a
performance bottleneck.

Keep the hard IRQ handler minimal: clear the status, dispatch channel
events, and defer per-channel processing to work items. A work item per
channel preserves ordering while allowing different channels to run in
parallel on any CPU.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.c | 69 +++++++++++++++++++++++++++---
 drivers/dma/dw-edma/dw-edma-core.h | 11 +++++
 2 files changed, 75 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index ab63d7bddaab..e4dde3518b83 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -30,6 +30,11 @@ struct dw_edma_desc *vd2dw_edma_desc(struct virt_dma_desc *vd)
 	return container_of(vd, struct dw_edma_desc, vd);
 }
 
+enum dw_edma_irq_event {
+	DW_EDMA_IRQ_DONE	= BIT(0),
+	DW_EDMA_IRQ_ABORT	= BIT(1),
+};
+
 static inline
 u64 dw_edma_get_pci_address(struct dw_edma_chan *chan, phys_addr_t cpu_addr)
 {
@@ -667,6 +672,39 @@ static void dw_edma_abort_interrupt(struct dw_edma_chan *chan)
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
 
+static void dw_edma_irq_work(struct work_struct *work)
+{
+	struct dw_edma_chan *chan = container_of(work, struct dw_edma_chan,
+						 irq_work);
+	unsigned int events;
+
+	do {
+		events = atomic_xchg(&chan->irq_pending, 0);
+
+		if (events & DW_EDMA_IRQ_DONE)
+			dw_edma_done_interrupt(chan);
+		if (events & DW_EDMA_IRQ_ABORT)
+			dw_edma_abort_interrupt(chan);
+	} while (atomic_read(&chan->irq_pending));
+}
+
+static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
+				   enum dw_edma_irq_event event)
+{
+	atomic_or(event, &chan->irq_pending);
+	queue_work(chan->dw->wq, &chan->irq_work);
+}
+
+static void dw_edma_done_interrupt_deferred(struct dw_edma_chan *chan)
+{
+	dw_edma_queue_irq_work(chan, DW_EDMA_IRQ_DONE);
+}
+
+static void dw_edma_abort_interrupt_deferred(struct dw_edma_chan *chan)
+{
+	dw_edma_queue_irq_work(chan, DW_EDMA_IRQ_ABORT);
+}
+
 static void dw_edma_emul_irq_ack(struct irq_data *d)
 {
 	struct dw_edma *dw = irq_data_get_irq_chip_data(d);
@@ -761,8 +799,8 @@ static inline irqreturn_t dw_edma_interrupt_write_inner(int irq, void *data)
 	struct dw_edma_irq *dw_irq = data;
 
 	return dw_edma_core_handle_int(dw_irq, EDMA_DIR_WRITE,
-				       dw_edma_done_interrupt,
-				       dw_edma_abort_interrupt);
+				       dw_edma_done_interrupt_deferred,
+				       dw_edma_abort_interrupt_deferred);
 }
 
 static inline irqreturn_t dw_edma_interrupt_read_inner(int irq, void *data)
@@ -770,8 +808,8 @@ static inline irqreturn_t dw_edma_interrupt_read_inner(int irq, void *data)
 	struct dw_edma_irq *dw_irq = data;
 
 	return dw_edma_core_handle_int(dw_irq, EDMA_DIR_READ,
-				       dw_edma_done_interrupt,
-				       dw_edma_abort_interrupt);
+				       dw_edma_done_interrupt_deferred,
+				       dw_edma_abort_interrupt_deferred);
 }
 
 static inline irqreturn_t dw_edma_interrupt_write(int irq, void *data)
@@ -844,6 +882,8 @@ static void dw_edma_device_synchronize(struct dma_chan *dchan)
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
 
 	dw_edma_wait_termination(dchan);
+	cancel_work_sync(&chan->irq_work);
+	atomic_set(&chan->irq_pending, 0);
 	vchan_synchronize(&chan->vc);
 }
 
@@ -891,6 +931,8 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 		chan->configured = false;
 		chan->request = EDMA_REQ_NONE;
 		chan->status = EDMA_ST_IDLE;
+		INIT_WORK(&chan->irq_work, dw_edma_irq_work);
+		atomic_set(&chan->irq_pending, 0);
 
 		if (chan->dir == EDMA_DIR_WRITE)
 			chan->ll_region = chip->ll_region_wr[chan->id];
@@ -1112,10 +1154,21 @@ int dw_edma_probe(struct dw_edma_chip *chip)
 	/* Disable eDMA, only to establish the ideal initial conditions */
 	dw_edma_core_off(dw);
 
+	/*
+	 * Deferred IRQ works are queued from the hard IRQ handlers, so the
+	 * workqueue must exist before any IRQ is requested.
+	 */
+	dw->wq = alloc_workqueue("dw-edma:%s", WQ_UNBOUND | WQ_HIGHPRI, 0,
+				 dev_name(chip->dev));
+	if (!dw->wq)
+		return -ENOMEM;
+
 	/* Request IRQs */
 	err = dw_edma_irq_request(dw, &wr_alloc, &rd_alloc);
-	if (err)
+	if (err) {
+		destroy_workqueue(dw->wq);
 		return err;
+	}
 
 	/* Allocate a dedicated virtual IRQ for interrupt-emulation doorbells */
 	err = dw_edma_emul_irq_alloc(dw);
@@ -1138,6 +1191,7 @@ int dw_edma_probe(struct dw_edma_chip *chip)
 	for (i = (dw->nr_irqs - 1); i >= 0; i--)
 		free_irq(chip->ops->irq_vector(dev, i), &dw->irq[i]);
 	dw_edma_emul_irq_free(dw);
+	destroy_workqueue(dw->wq);
 
 	return err;
 }
@@ -1162,6 +1216,11 @@ int dw_edma_remove(struct dw_edma_chip *chip)
 		free_irq(chip->ops->irq_vector(dev, i), &dw->irq[i]);
 	dw_edma_emul_irq_free(dw);
 
+	for (i = 0; i < dw->wr_ch_cnt + dw->rd_ch_cnt; i++)
+		cancel_work_sync(&dw->chan[i].irq_work);
+
+	destroy_workqueue(dw->wq);
+
 	/* Deregister eDMA device */
 	dma_async_device_unregister(&dw->dma);
 	list_for_each_entry_safe(chan, _chan, &dw->dma.channels,
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index e39c11bc91fb..90ba37737c3a 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -9,8 +9,10 @@
 #ifndef _DW_EDMA_CORE_H
 #define _DW_EDMA_CORE_H
 
+#include <linux/atomic.h>
 #include <linux/msi.h>
 #include <linux/dma/edma.h>
+#include <linux/workqueue.h>
 
 #include "../virt-dma.h"
 
@@ -80,6 +82,9 @@ struct dw_edma_chan {
 
 	struct dma_slave_config		config;
 	bool				non_ll;
+
+	struct work_struct		irq_work;
+	atomic_t			irq_pending;
 };
 
 struct dw_edma_irq {
@@ -103,6 +108,12 @@ struct dw_edma {
 
 	struct dw_edma_chan		*chan;
 
+	/*
+	 * WQ_HIGHPRI keeps completion processing responsive under heavy load;
+	 * WQ_UNBOUND lets different channels run on different CPUs.
+	 */
+	struct workqueue_struct		*wq;
+
 	raw_spinlock_t			lock;		/* Protect v0 shared registers */
 
 	struct dw_edma_chip             *chip;
-- 
2.51.0

