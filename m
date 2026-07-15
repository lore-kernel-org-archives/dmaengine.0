Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021099.outbound.protection.outlook.com [40.107.74.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CCD4ADD9D;
	Wed, 15 Jul 2026 17:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784138283; cv=fail; b=uK9y5WsARnstsu1I9mqmJRbit+lgodHfBIsFtyy1nC26N7k9gwmuOpm4IUBjDFlPyQykUvolVTqhlX3oYKtuAC3X4aoXj3Xzh8td5BFQiLPY3forgEpBGfuutPSyvMJnPm97giYFsXsdObqRKkZ5EtTAQ/C3PoqgCXTH3nQSeFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784138283; c=relaxed/simple;
	bh=vt+/XqgVwJ5NrV8Y/Gwa/INgUN8V0nLdlmJroMkxeco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BxTJ9uMxl/GE8/kre9NMoqRsFyf2pKy0mOdVnr4rswwlfWYkKDQ2hDWcwlVIEJILFF+6KBi7SM3KUZAEhMGstJJbaX2/LRV5Xy1dh4lwiXC24t9kEhUUbwh7XbKhc18sOzIVBfkwY/+0Ah1e4WeBPVKGjdyr6bBDbXrk2P+Xdn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=U+NRKd/e; arc=fail smtp.client-ip=40.107.74.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="U+NRKd/e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhrpGo1YCqUX6P3ua1XyHG1njDe/iNaZoLd6StyyEGZ/1kki+R65PeiMoyjajI8tAbuJHGSrkUSwA4zeIxOANCiTy9M2dN15vIZJFzoOmj6Ut8TaZ24A5npftOe/mF3zTITAJspLjXsc52zSrEdqvJS+NbpkDT5mDQ63uEa4MfUNdNUHADJDLdtfOfSIy4uYQHTp2Y6qgKP7Gzabn8fCgxQdS/H6N+73S4o8ZdMqhCIl9dLgC6IsX68ZE0NBXOB/VGRjyqEPXNqOHLljLsfTGrYT48hJot+dt2trmV+IpSe7KOe1wdduPmKCmytHVfR6RpLtw+cYiDbU/daWdf2J7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUmNPE0EcVRFy86LJEAcpsQYdfuWhkzBTxxDt3faNnc=;
 b=J2uN+/uZOy/c9GDZfyOMnkx/2YOfsmxqqEjiLREfWtjaU8Y3n+T3U6BW9NGsNn5+xnFxCoMlf7hXpvDmQI7AJsz+89+045Dw/93a9E4fmYsCM9+UVTjr61oeTebUrQil773HfsnAUXiFfbX0cnoO99znmrbIfLppXR97zbILl9wJYhFrax3Yx48gnR+QBLSEuuG0IvLWFRgfzt6H86w4YScW94xjiXJdXLmoBj0rPfNJfNPgF8mUCD7Awd59EBKhV/ov1qzEJOSwECjEqkBKpcpv4zfASSpSl51xQW8neeV7S74FA0D2AhcwZ87ghKBZvqLPQjEDdELyFGwimhZKrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUmNPE0EcVRFy86LJEAcpsQYdfuWhkzBTxxDt3faNnc=;
 b=U+NRKd/ekud6EZ3xePbqHZ2DvaGRwFZUb+bc2VANrsnkF4W+C5lMy1POaIIaCfLgiFoPNs88H1dvhlP5lz2TWn/nQ6gn70mnO07/4+wIb8wS7wK3/jXxtuJEwJlvPO10mtOjZfHemugEMD2d57T7yxaVdoMeR/iiyfD0NAzEAT4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB4406.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:110::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 17:57:50 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 17:57:50 +0000
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
Subject: [PATCH v3 9/9] dmaengine: dw-edma: Defer channel IRQ handling to workqueue
Date: Thu, 16 Jul 2026 02:57:40 +0900
Message-ID: <20260715175740.1110404-10-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260715175740.1110404-1-den@valinux.co.jp>
References: <20260715175740.1110404-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0149.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::9) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB4406:EE_
X-MS-Office365-Filtering-Correlation-Id: e1425ae1-621f-49ba-eda6-08dee29a9647
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|23010399003|56012099006|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7E+ft9TvFhY7AUlFWOYnbwr5d/W53taZKAeTNDncFh/L8JLasZfSrpITdA2WiDb9KBeyH+vN+kspTd8N1bSd5WHJqEOmJDjcocJppULYi+EQ+TAZIJ4JrJxNJUofeVz7B1Wk3hjq7r/ZYQY9C9PzVYczHE2TMJu5xlsBQ4iEFesQeTBgjcwF+vi4zEFkARy1XpSiZQnEzLSqJ/H9G7i15pkyZ4wnZ10Bgd7jg1kA0Kt8m2IgrZ/mmpvYUeZneCYX4l76v69XnsGF3ltXC3xwDbn8s2V5GAd4ybV2j7i4hQa2HyvKCcJvmLCSeX+5RggRI07lH1o806ndcst4jLDuztupC9EGuaJru/2OqMAvGTqEx+hCMjyReiOedPS4+cNvkFC7Hu8btbT9vzRPbR76nztGl87O49NbVzSKCdG1phTBa1B9Wn/O2jSNRDM6ku7EO8Cawmki8uDFYEfDQTqPH168FoqUwagD1ba7Np5CjtGU0VHRezjJ+7SuZVENqqmx6j5und+D7HZ8wHRlZgPC/mbARKflMZQtIyR7E1phELI5MG8TSIN5VSXyuCU/Re/kMNWtEd6P0R3h1A9lqrSbjP/LcFwSN/d/fnqsGDmTWkfI6F1QqIFSgcIQ4OnCRSy8wf0iHXfi/E+ZYSqHSYX1Rqs0Sfjq9PHXcFumppjxJ4c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(23010399003)(56012099006)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MKAsUCr9gU8iBVYpbXOgVQzBxPrucISo4AT2c9p9mDpYdjwlfFVCsOQMo5Q2?=
 =?us-ascii?Q?un+1s3Iy24SuXtq8NdOYGWnWb0RM6jeWaNGltwaMe005HVvm2GhUgzzi/bkL?=
 =?us-ascii?Q?pTaZs+IxDaiQa1XyAhV/AvGpuj8jKeKfxJbkh9iCCO9cJLtFvWPPsoxB7cCu?=
 =?us-ascii?Q?GH8+ZRwVP5INbD7FlbFlfve3Ce5YlIWqWYdFHWC7PdSE6htnHsKxnQ7uawjq?=
 =?us-ascii?Q?CGYSJcl+qA8FHsP0h/abBhPxaoVwd10vSOJgaBrC2rHOpGri8EjaAoX0f3BM?=
 =?us-ascii?Q?lCsjOAK8asixsmRh7TgQFU66YdXV9dz/HfL38bSIKgkX1UnzFvPCo3ngpcNC?=
 =?us-ascii?Q?TxanJyAe3m7pyvFQofXagT0KQ7nVgH9BhCrwMoAr3FlwUsyY5MGirZjZTMhr?=
 =?us-ascii?Q?duHXRGjTuL/5nO/LGkM1mNuJLyuduwgf2cX1EoPFj1TndX03b9OIXdyYTLh9?=
 =?us-ascii?Q?HFO+jXC/qTrSvwph2cvZRJCEAr2LQ/OMJfSM5jevw/uiXBySHoKoktOMZaSX?=
 =?us-ascii?Q?nW8HtzQgK5uKY/Iwn8gSlObwQVgRRkAeQsNKBMj3YmX1QGvB0/PTL6fynZS6?=
 =?us-ascii?Q?bvf/e/qjkkLjjlYXmqsRX41A/J7cFt2mRrz1DDuzrS5ist4Z+Y2bZtpJqgiK?=
 =?us-ascii?Q?AC2ge2gIUihAW9ax4JwnwvfFjYAnCcQLErXJTjykCK5aQq+bLT1EGSYQ7tUZ?=
 =?us-ascii?Q?JjgK4jBIr2Cw2BN8tqAE6HGjOrIiKKgAOZHkd036EWe0FDqluGk8aqUn6TXm?=
 =?us-ascii?Q?9apFxxP7rKQnTaQ4WWYzg/jAA7NeQ9asrQKC237sYjz98XBzU8Cr1Kg3cC99?=
 =?us-ascii?Q?FLzlsZdkMT4YBD5vvJ3DmisnSw8NHZSmV39YZvLLvNaMH6X3QB+mpXcSDUlt?=
 =?us-ascii?Q?Ns+YEAce8aVLqbZ8OUCWf3C227cQzsr6JlrofGp88dX9/RkuULvvY/OAsReQ?=
 =?us-ascii?Q?D+YE0OiqiyNFTw1kH+A28OKQK4WnZaVN5xp1X0uwZxCmJ6Bax+4mcrCAJehL?=
 =?us-ascii?Q?8I+HN53RIzByEKVWdqH2/4BwH34tGQdTHv/2r6ZzMmltrx9srr72ucngOwoX?=
 =?us-ascii?Q?hCN++/KgqKdWGL+axmQ/pKXxhawDfnrPYxpP8J4Nvl2rAbwa8j1c6J3uVbsl?=
 =?us-ascii?Q?oIuoK1aghnDvF7K6FgHOudU1zx86c9h2e4WEpmW8gbKIPtHRfp0o8Ka4F6Oh?=
 =?us-ascii?Q?HUUfjcqSmQnuuvPwRtaBJQLRDBla3A2s8IxLojf6ymUREJuSbijpye3H4EBL?=
 =?us-ascii?Q?HsgjyGTErQRuEMFej0wQg4bou1K+RmL8ifVplfKjWBe52/MBkWLf2pCXUOCq?=
 =?us-ascii?Q?73qR8sEWpAJbnXPnU4mUCMs4gzddOAFZqkj77MtfE6dl9pHSIb/VIPxGTC9t?=
 =?us-ascii?Q?AaCyuhRjx3nlSEfW0fc5hrsf9PoJWy7/HBAnUjyzzYnUX+zTn6+6/MH4zpr6?=
 =?us-ascii?Q?lKA5896+a0dJ7kn+y49bqckTZ7Z4nfX8QNX6i35B1rZWAfhFMHPRUwUeS9rI?=
 =?us-ascii?Q?3fEWbGHihW23R6RChHD+EoXK/jOZdMvNwkiBjTea1HKiayK4kecpYJuEEVb9?=
 =?us-ascii?Q?hzV2uIfCJI4KpPOkImeeTdqaNbM8yyWwoDOhDQSKPq/4XInVXUSYIkqW09kN?=
 =?us-ascii?Q?fWUYSGFvqPa/EmXhIeHspGQZnfmEo5ChvENg0vvTO96aQiRZBnpoLd7QVdus?=
 =?us-ascii?Q?iCVr9MX/DkVhli5SBbfSzCAZUwtDQzkkyR2y9YVUvVDKFfhuIf1llxswUXhE?=
 =?us-ascii?Q?2BWoHsrO9yDFBc9c3YhjayNdX1DKZdNvHhd2+I6VUGcsuEfRuIgP?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: e1425ae1-621f-49ba-eda6-08dee29a9647
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 17:57:50.7802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nSN16ycOQlfZW0CceTT93RAzqxcTjsEx+MNrT+7/qCmJmW5HZNO7JPO8afuLXBzv0hTtFwCFQLKEPcQ9wqMK8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4406

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

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - Clear irq_pending in dw_edma_device_synchronize(). (Sashiko)
  - Drop Frank's Reviewed-by tag due to this change.
  - Refine the commit message and source comments.

 drivers/dma/dw-edma/dw-edma-core.c | 69 +++++++++++++++++++++++++++---
 drivers/dma/dw-edma/dw-edma-core.h | 11 +++++
 2 files changed, 75 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 2369b4c4630b..4ee7f14c3a82 100644
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
@@ -759,6 +764,39 @@ static void dw_edma_abort_interrupt(struct dw_edma_chan *chan)
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
@@ -853,8 +891,8 @@ static inline irqreturn_t dw_edma_interrupt_write_inner(int irq, void *data)
 	struct dw_edma_irq *dw_irq = data;
 
 	return dw_edma_core_handle_int(dw_irq, EDMA_DIR_WRITE,
-				       dw_edma_done_interrupt,
-				       dw_edma_abort_interrupt);
+				       dw_edma_done_interrupt_deferred,
+				       dw_edma_abort_interrupt_deferred);
 }
 
 static inline irqreturn_t dw_edma_interrupt_read_inner(int irq, void *data)
@@ -862,8 +900,8 @@ static inline irqreturn_t dw_edma_interrupt_read_inner(int irq, void *data)
 	struct dw_edma_irq *dw_irq = data;
 
 	return dw_edma_core_handle_int(dw_irq, EDMA_DIR_READ,
-				       dw_edma_done_interrupt,
-				       dw_edma_abort_interrupt);
+				       dw_edma_done_interrupt_deferred,
+				       dw_edma_abort_interrupt_deferred);
 }
 
 static inline irqreturn_t dw_edma_interrupt_write(int irq, void *data)
@@ -940,6 +978,8 @@ static void dw_edma_device_synchronize(struct dma_chan *dchan)
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
 
 	dw_edma_wait_termination(dchan);
+	cancel_work_sync(&chan->irq_work);
+	atomic_set(&chan->irq_pending, 0);
 	vchan_synchronize(&chan->vc);
 }
 
@@ -982,6 +1022,8 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 		chan->configured = false;
 		chan->request = EDMA_REQ_NONE;
 		chan->status = EDMA_ST_IDLE;
+		INIT_WORK(&chan->irq_work, dw_edma_irq_work);
+		atomic_set(&chan->irq_pending, 0);
 
 		if (chan->dir == EDMA_DIR_WRITE)
 			chan->ll_max = (chip->ll_region_wr[chan->id].sz / EDMA_LL_SZ);
@@ -1195,10 +1237,21 @@ int dw_edma_probe(struct dw_edma_chip *chip)
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
@@ -1221,6 +1274,7 @@ int dw_edma_probe(struct dw_edma_chip *chip)
 	for (i = (dw->nr_irqs - 1); i >= 0; i--)
 		free_irq(chip->ops->irq_vector(dev, i), &dw->irq[i]);
 	dw_edma_emul_irq_free(dw);
+	destroy_workqueue(dw->wq);
 
 	return err;
 }
@@ -1245,6 +1299,11 @@ int dw_edma_remove(struct dw_edma_chip *chip)
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

