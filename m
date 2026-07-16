Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020090.outbound.protection.outlook.com [52.101.229.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022CF42DFE1;
	Thu, 16 Jul 2026 15:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784215531; cv=fail; b=g9z62R96sZQ1CEgw6IF3aY3ajpe6XptljWF+TxiJN1EUIuYn9xqMmDrU2+WbY7F1JYdWAJGGV/2D6/R/WdHIR6ON4VmQTiP4pDWO0iTR2QJAYviTLA8bYrBY/P62ObrVJneVq1CodHeJIw+1QHIAfbkrrtZktXODvib0qlF9bA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784215531; c=relaxed/simple;
	bh=Gb0ecbJF+L7lm14rb7neYlNqXgaf9McMWPWikbfTytw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OA85X3IlV1YeKsUDQMfwVoQpW5ll9HKRu/bSyVYDbRWT8hub94Rrs8sKFkWTi4A9xii8EdtBjpg0O9N1YRGxsaYb5xQQb9KjBclXExptFe3ufNM67ZK+2pQXBsPz/AcX6+5PotcaaW811+UNBwrWh6qjx4G9UYV7aQvWJxZfH6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=B0Crae81; arc=fail smtp.client-ip=52.101.229.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="B0Crae81"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tj7NTw9RBeAIi8yuS/UNw2G6O5YBZHhfn/EyNcOqqQeIJ9L5fhCYXbQ1C5oY0WHgZxy4k6csfbkuuisDz6GtlwPpLsv9EKKToY4lcPRsLiPdaXLJWHQHIkueBRTeD6ShUNxWU4xR3Lq6Z+W1EeUGcuYuTmIP64kme/+p0/Ui/lFDJ9QareVR3jpo8ZOU3LyCf+CM75Pm0NTiEzjiEGpIaDLnZ5S1FX1UX3K9NAADDrM6cITZYKZS12wALLKB7E/W/1BsiOBjBpJIkpBK1CWoVEJfmwvbbyjsHcYpYali9XA8Ry2NS/fN9SgyY5aWBD+WGDxMhKVadQiv6ZC/gnOJ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iG3EibS+XeVJQDPdHN3r4FAPeOzS7lxfwjI/UB2r4Is=;
 b=nbsrJ3APODOT/EVBNUJVgDjGkEzbgrSlhlCaM9493Y5e2t8kDmog/h7aBzgGHb0GCthStG26mi6t0yiBRb48ZAF1RAfBcbhmlWkczgPOByhsgMjGU/gVcHgogMWbeOwWHbTK1lidyIIx7+aCiMnkchq8nqbooLdHw6CfWIbFGM8BvylVFxWl6ht1mB7mwL3c/7/1flnsEKmyePsFs8T0pAYzqphAvMW4A2USA0N4lrhYDpGklAg2p84koDAeOiv6Tf+kvZXNWPsKvTzFUPyvRtlg1puNMF249/LRQ8ek+UEg3tB2yvP5C1BegyrfJyx00g3LyrTOKVVhtTDR1M9saw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iG3EibS+XeVJQDPdHN3r4FAPeOzS7lxfwjI/UB2r4Is=;
 b=B0Crae81vKbkbiZfT7nbLBXy3PQyNaiT21tAWAlFbCaohjH8dB3AmpEtk7Doj+q+ZpBqvo6VP1fSd2PATkJ3E6o+RmBK6JEGreoO6O5dD/g81LCnk8KIHFixeUrwDVe3DriqdCB0A1+zJMGW9CsF7pyf4seDdpy9tNSvWqoKOJQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB3635.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 15:25:21 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 15:25:21 +0000
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
Subject: [PATCH v4 9/9] dmaengine: dw-edma: Defer channel IRQ handling to workqueue
Date: Fri, 17 Jul 2026 00:25:03 +0900
Message-ID: <20260716152503.1747922-10-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260716152503.1747922-1-den@valinux.co.jp>
References: <20260716152503.1747922-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6PR01CA0019.jpnprd01.prod.outlook.com
 (2603:1096:405:3bb::15) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3635:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f9cb4c2-c3a5-445d-2a7c-08dee34e7371
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|376014|366016|1800799024|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Myk1gqjQpVo2Lg8z9wInETOaFieIZQ0v4RPLoltmQNPwv+WnieJqit8EXwJZIl8Ilz93f8OFPuMPizH8j4jr061AOzimcSGKikBoHsgk9FI/pFu1IbXUiyj+hV7zRrbdM9zCC9T8pp2TCe8K2jVnUroL760LoNYcBuQtzNXvZxBKZsfogEsnzvRjPTaMPslzqKSsOgb+DtI9L25AX4UwlXUAI87s2QDMJGcyt3EbJ33Uh5arRHvDAyUbQKqtLV9VkyOiDkJNCbmAZ1CKeLwl9iFEzKYc/zhKDtzd+C7RxbxPgKOdCPQYo7FnkFn+sBfYaGAsJbYhpxma4mI/CRIqpS4khIjduFf3xr4tlZXhtv2LhnuXYCyYocmFhOoAUibs1IC07dna2eosFumGDjDNDE9vE+Wy2P06rzLWwB5huIZ4d+7E5RLa5Xh6onrIKuTV2yypKhPLASwLJJbDjOZAlF7cKRLkEsyMWFpOrJKKoqMt1tHWQR8kjj/a6vVzaybXiFhDlphicBQUHiCK0mZyeZgFZsmaafiMkWPEwbLgykxQVIdBvSj6RQGuSdR/OPL2PSBUMyWmfyfKVGz4qXCyI7obm/HzGByQYWUdz4IboQoGaNli2xA9mkaPaw6siRM0C8PEuWuz0Zm+nRcgxD3E0G9v8M4Dtag/MCnuSbB+OXc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YnXVlEunCbDUpRQ0o15IhzYWzIekGPO8Yg2TsEc0ecyxwC1f7fNtizoHTo4B?=
 =?us-ascii?Q?EmpQ4R6AU9SAtaEw0n5novibA3fqHkHL9Lny1WzgrTULBjGHmywt6X09BLme?=
 =?us-ascii?Q?bWmZRzyF/Z2gmBdtsga/6XPQ4JdLtsjXwI6hocGqKMTDn6a7VcvIq7jfzXS9?=
 =?us-ascii?Q?s7HxAUu0ZvqDOBjWa1SNeTS+ZCOYqtwtj1Zfkfat1yZ232GX/Ab9ywgi/JHq?=
 =?us-ascii?Q?DdwyBDNkJFuaLbj5iFjvhYaZrM19Oi/oYH2JUwVX1od0nRedl0naJ4YbSetu?=
 =?us-ascii?Q?aNpyxMZBLEKCIrLo2uP/KnfLPpUw3IVhqPnbOzpzu5U+Tg72FmYqmlltCC3k?=
 =?us-ascii?Q?qCXam4T7Udg1jJ6aQgZ9Ye2fNiDOyR79ZrV2W9d9huQcj2RLwj9fF36O3Bzc?=
 =?us-ascii?Q?uWHIbHS000rt48jlFWci84eDOlqW8imzPlirQxAuC857/Sd72IjMfk0WhDiA?=
 =?us-ascii?Q?p+4RQg8BJK7gxi9/agKCZPSCIhSy471wjzEwTfuYuYZEeIvF3PgQBXlgxYTv?=
 =?us-ascii?Q?msivhLrK8Ds/dC0iABctmsYb44L6KiqOMowuVdvBgX5SCmPPOc3BIYkTm2E5?=
 =?us-ascii?Q?hap+8p9zvdl98vfJ2PZJ0v2iX5EU31Qmv4nXlZn5AGnxFoP6FPK4gnsSoR4X?=
 =?us-ascii?Q?/K36jsz85FxUqg6WZrr5cU25uC3MTZJx/xBGbP5Kt84XS0jrFCKD0lom6kMP?=
 =?us-ascii?Q?K+LqAm1UrH9bRoKyC61ys1+g3gDiHL+U92TXjrKl/x6wpBciAEbfl3INGo8s?=
 =?us-ascii?Q?awP3MbKG+PuGo3pcP9vJZUrsELvzCHnaRQf8XZu4QTDotcTap0LtiXgCG5/p?=
 =?us-ascii?Q?nDFFlSoYwj7DjpPxfg8sHD5LVrXs9E4O/ejlUA9T3+hclA3LVzv/FYjf91rc?=
 =?us-ascii?Q?5A08O7NxEv9SDeGgOHbX8VtDpcTYrJubJeOpMhTy5DDr//N0ZVu/78QcgmBa?=
 =?us-ascii?Q?vOtWO1+hNnshbnK1rceDUS8ycDW018ssvqBb9qoXoPJ9nunn0L6yYB4vKIVv?=
 =?us-ascii?Q?2PMoGtLEmXnT0K8fb/ROFXpBTTswRjxpaIxeMO/ooWe1U6l4CYogAz/2G92d?=
 =?us-ascii?Q?CifJVT8zNzLqagMLls8ocsBqW57Gd6S9ONQBXoTEXc4PvqTV8owjWDX9eJZ2?=
 =?us-ascii?Q?/7v8Icmoeg+nqINqP67mnZd9ysN4s3MKj21U5rQ4o/ePgVcO/mocyEwSn29K?=
 =?us-ascii?Q?OjwyyBx+MKuiPrYeNuCfBU/LEncP9UcvTcYdEzB6VZmeKeNarWJm2ZTknXzU?=
 =?us-ascii?Q?mDBxw4IG7Jcc08GbgQafhB61Tg4HDqAogEGIKL2NF3roWXcRRXGgj/5xnCg+?=
 =?us-ascii?Q?ohjsBx1nffh+BoNYRqRdvYvM34wvCJOBy3XIAiizZiT/zUzlQE9NbTu/cK7M?=
 =?us-ascii?Q?3NVHwuQUYqO5w8E6h+y3c9O47h33YC+Qp+eDSZg0H6GlCf+BtL3HRvAH47go?=
 =?us-ascii?Q?geG8GEElkE4zA3LBHIHXDLT3it79El7XJSiDJEo0I4Oio3gGdkMLw6rzsgGD?=
 =?us-ascii?Q?3la0TwQMpfR1JOzIIr+LsW+WY7X0OcRG/UuSV34+0Qb6gT2YZ8NtXTBWClGk?=
 =?us-ascii?Q?py8Ri0rpOtgNYu7J8dTz3NutV55EuREEPc19M29F1DFvj6w4+FM3ASnqNc6F?=
 =?us-ascii?Q?ScPaxrNc1M5FPfHvtgoPCDPx0dXhIi+gIJh/naki6wJsCNPVo4QFBpxUaqnQ?=
 =?us-ascii?Q?sLLgmdyyp/wzV7dx13ihUhf8iNpevyQKlmNsApFZv66XsanrTyLs5Ew5wOLT?=
 =?us-ascii?Q?AzxAnynAd9HzQ+HEqYcPupnRYwhFVKWeTOFkrrHXr8JJeN+YzX2Y?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f9cb4c2-c3a5-445d-2a7c-08dee34e7371
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 15:25:21.7565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TErOMCjIRMypi+BSWmIvg1XCOLeCZ548096DHcluLh1dtXWF5B55bruLPG7ufqCY7ODNADMoT4bRteHbukcY/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3635

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
Changes in v4:
  - Collect Frank's Reviewed-by tag; no code changes.

 drivers/dma/dw-edma/dw-edma-core.c | 69 +++++++++++++++++++++++++++---
 drivers/dma/dw-edma/dw-edma-core.h | 11 +++++
 2 files changed, 75 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index b76f0aeb647d..49fddad131c7 100644
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
@@ -753,6 +758,39 @@ static void dw_edma_abort_interrupt(struct dw_edma_chan *chan)
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
@@ -847,8 +885,8 @@ static inline irqreturn_t dw_edma_interrupt_write_inner(int irq, void *data)
 	struct dw_edma_irq *dw_irq = data;
 
 	return dw_edma_core_handle_int(dw_irq, EDMA_DIR_WRITE,
-				       dw_edma_done_interrupt,
-				       dw_edma_abort_interrupt);
+				       dw_edma_done_interrupt_deferred,
+				       dw_edma_abort_interrupt_deferred);
 }
 
 static inline irqreturn_t dw_edma_interrupt_read_inner(int irq, void *data)
@@ -856,8 +894,8 @@ static inline irqreturn_t dw_edma_interrupt_read_inner(int irq, void *data)
 	struct dw_edma_irq *dw_irq = data;
 
 	return dw_edma_core_handle_int(dw_irq, EDMA_DIR_READ,
-				       dw_edma_done_interrupt,
-				       dw_edma_abort_interrupt);
+				       dw_edma_done_interrupt_deferred,
+				       dw_edma_abort_interrupt_deferred);
 }
 
 static inline irqreturn_t dw_edma_interrupt_write(int irq, void *data)
@@ -930,6 +968,8 @@ static void dw_edma_device_synchronize(struct dma_chan *dchan)
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
 
 	dw_edma_wait_termination(dchan);
+	cancel_work_sync(&chan->irq_work);
+	atomic_set(&chan->irq_pending, 0);
 	vchan_synchronize(&chan->vc);
 }
 
@@ -977,6 +1017,8 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 		chan->configured = false;
 		chan->request = EDMA_REQ_NONE;
 		chan->status = EDMA_ST_IDLE;
+		INIT_WORK(&chan->irq_work, dw_edma_irq_work);
+		atomic_set(&chan->irq_pending, 0);
 
 		if (chan->dir == EDMA_DIR_WRITE)
 			chan->ll_max = (chip->ll_region_wr[chan->id].sz / EDMA_LL_SZ);
@@ -1190,10 +1232,21 @@ int dw_edma_probe(struct dw_edma_chip *chip)
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
@@ -1216,6 +1269,7 @@ int dw_edma_probe(struct dw_edma_chip *chip)
 	for (i = (dw->nr_irqs - 1); i >= 0; i--)
 		free_irq(chip->ops->irq_vector(dev, i), &dw->irq[i]);
 	dw_edma_emul_irq_free(dw);
+	destroy_workqueue(dw->wq);
 
 	return err;
 }
@@ -1240,6 +1294,11 @@ int dw_edma_remove(struct dw_edma_chip *chip)
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
index 6474cacf7195..7f6301572fa4 100644
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
 
@@ -87,6 +89,9 @@ struct dw_edma_chan {
 
 	struct dma_slave_config		config;
 	bool				non_ll;
+
+	struct work_struct		irq_work;
+	atomic_t			irq_pending;
 };
 
 struct dw_edma_irq {
@@ -109,6 +114,12 @@ struct dw_edma {
 
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

