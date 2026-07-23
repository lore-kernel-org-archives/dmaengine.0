Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020108.outbound.protection.outlook.com [52.101.229.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4F6411F9F;
	Thu, 23 Jul 2026 08:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784796142; cv=fail; b=LDdvSqZaB0dw2RqYmgU5+ZPLLMDrGoRimGCVV5M1kd6ZeWSDewvXZehba8RLz7k6kDXOLecmPZCurSGCYbc4MN9DLxR4Ts4ox5w9YLFkWW6OIln3CA2c7+uwO6nZ2jkAspIdhnfw2sL9fVCHA0pLyA1+9N2AuWhFPg6ZTpkCg2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784796142; c=relaxed/simple;
	bh=8rNJlLGY9GfdLtDdcfRrOVCuyrloNNqiDmc//Faccps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=elbXCBhS7hBosyguGUV9INGD66j0B6vOdYh4ku+kXMmNflVVOu2BfldsDNpO/+MSXX/s4oj9x0anUt5TLqkednAK67MBEv3/n1Ws0jVCTB80uLHOdoTOaBK5igfzXmz9BzvXJn0zOJqGQztwqqrZgCOVvRVvbzne/Iy8MBlDYnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=QVCkVKxF; arc=fail smtp.client-ip=52.101.229.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="QVCkVKxF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hDR2TdSjhoB6FIRyqeMulfg7Z+8mi44ICkS2oqOsMtOOOLcIHheUxs17/5QIXVwQpHoZXmiRy8y/H0HkpgSDWB0XNZwG9aPpBCvdMU3lkLBsi4QQpBDOljZ+LJFkcUbgRevjRFgfdIWaRZUIcRcUBN4NbHYdjR/akqds97Hn0lnlvxdsWqHuc4uvZVlte4F5H4Kelno8r+2kK1W4tkMDLHMTcAVa6RtCaCX9+KSc/uK8gu3KN+xdeX2NocuH0iBtt2Gtsk602Wm1tcsc4ikND5D7UE4U4oob7R0/5NYX0ujTcpkuBUkhCjeWBshX1YcGa18jL+YTkU/tTDvhHkJXhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YDcbzBqeknBidPsD2JMVF0cX138O6+4LWvDb/O7zvOA=;
 b=UulkHqfSzqSL8eUj8C5/i4KkvaBdTkts6HydDokkxZ6p2cgZNh3nTfPEcTJmgf1CBguto8dkIrG6CTSpPsycvteP171uJevJyMjqOvBistY9OyLOFNjITmr3QzNucJylq4Bgo+Ll3PjpiA5M3nENg3AlY3so4Ydl58cMeILvhV66oPwz8t6FhaEnpoLnn9qRh5Ibgxl4ImNPXKFZwEtxmaVlz7dYDOK9ZuGRyTRIURSZgce5GzYtj31/v9nl0VsEQXZdA2GWt10KGCMuF+c3EnuIe7GJeHtYhZMQL+qTMaMfv0ynljQ+kPiWzof+KpPovrw1hSdOGfcSN340IMlodA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YDcbzBqeknBidPsD2JMVF0cX138O6+4LWvDb/O7zvOA=;
 b=QVCkVKxFoxSXMNDjQeJT1PYy3qXKHbHQCFSYkCoo1p5QV3IOHundKIwDIlVH5bBhYpr+ct0H4v/Kni9KsaXDw2IzlozlOMTgzdisd2LqU7n+Lu6Pl2ax+1dpDsPztb2z+Ce1KtZM4SGw5tnEHPtwJuaDYGh5z5eNAFmWd9AESzs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS9P286MB6486.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:416::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 08:42:12 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 08:42:12 +0000
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
Subject: [PATCH v2 19/19] dmaengine: dw-edma: Add trace support
Date: Thu, 23 Jul 2026 17:41:50 +0900
Message-ID: <20260723084150.521366-20-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260723084150.521366-1-den@valinux.co.jp>
References: <20260723084150.521366-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0087.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::15) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS9P286MB6486:EE_
X-MS-Office365-Filtering-Correlation-Id: ffa35a3c-1291-417b-b57f-08dee8964a5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|23010399003|921020|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dozQKpcxco0v+uyZwm2UMyil1SADeBXNG4DlRm+8qIvv2/aVo/HzZk/knHHsmzNuD03KRXTfOZSwmI51kijx74QuFAvc8dPSecIJGcuPZ4pZX9gPhuXD3pXBUlegPuvZ1yxxUiDlpEMjNThAYiOn72DPsblnOVdAMtMdWkXVr+q2BWmw6O9qiEWWuHlm2qJBwoUvidQdBtvW0uNUeR+qoeh8qORA67iehoa5jQ9c+QRem22V6Ah0fZUTnA6NCMG+EiFYtASo7LOU+niBaRDhnb5gtCaC6+Xzbfe+OF7roarQAsNmGtf+f5wevG6iHQV1HFzJOSP0FVklCT0OHw3PiT8iunvCLwrN9FtLwPCyOGDF+GqCsG8Y3cOl7RuKwNoFux6sO11fwLinRv9lVaLykTAAm6bRMEBZOxafzFpt3vT5dgMpMeGmnmQk9l6OFdHl+l9Xw9nCjRSiqIl2N9ndEuhaHocgyxdZfELCe+Fq8SRCLRrxVMRg2XTgmjgaLtIlhzUIHhjssTZtqkpVFy3yprat919fq2nOKi7jr8WuKOd4gj1cebohHt6I7gDK10SHPq8xbHsBtf1Swm/qcGOpts8U02nKHL/XD6u4r5Amp5itbkM1XR0D33zAcWmLYol50kBc9STkHxU8ddIo3WCNEGzGUXQGL0DbXlQI+WebxEWuaA3kUKVGQK4mWuBdNc5ZVaal4OXpXx7NV1KLbVMfgA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(23010399003)(921020)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aIgLOG4q+0VHkQsWinaHbopNHMhIQieBjbsx/AaipOA+HcVqf62E4x8eIb/k?=
 =?us-ascii?Q?j8FBbdWh2LQlWzuCcZowg70HQLHePihCM1CGeklqoZ98EpeZMswpZdd3VPgW?=
 =?us-ascii?Q?ygGK2taL7rfVPQ0B0npXt6renVa/aSof8Rw+rTpcpc9lHOoDnkTsHmQZ82Ve?=
 =?us-ascii?Q?zIyFJIwrRb9U1IMsba6xqpW5Mdf09X3UGAEEcfcfj+76/yN21yxbtHRR3tla?=
 =?us-ascii?Q?USJ5pm4zTCKrKXtmuSdCxBO8ljOoSr1Q7A0QmybJFpNVza5+LoPvnlY97elr?=
 =?us-ascii?Q?WlaJ3L6sEPohXGV9NavTQxoCxpKMIKBXm+Bnkjmuq4p+2Xv9E1NcPhNrqgqG?=
 =?us-ascii?Q?wW4Ypm6F3g2M63/D/f3EWY3GuprCK91ka7loqPcbJx1sCaGm3z/xaiGt0yJR?=
 =?us-ascii?Q?Ltw+lEoKwqfVHNzmM7lC2QcfBYi4UpPr26LxUVUDAHRgtxBW+jiFxygz+j6X?=
 =?us-ascii?Q?VgkvnDWsd++XnnpvNkWTF1mGyoUjOqqEVvmu+l0HfTLAYY34EmcgU/M9zASV?=
 =?us-ascii?Q?3qulYT0xNpMFiiyjdbYIVJuq/aB7grWQOrh1WuLzlJ3IS4zkQqVnn/0frprb?=
 =?us-ascii?Q?9figqaFvnpZc5VOkU0XC/dK6+q2T+CYUMCRUkB3PgwyBE4hq5X/JZXYpKzyU?=
 =?us-ascii?Q?hJP1SSlX5v93y0Az7VX3Ib54mO7DZVRiYHs0HU8LD6Us8oI2gp/b5D/6zhE4?=
 =?us-ascii?Q?UkfPyYTC0xpyyFWvqxWgMOdj+LCtZq3GxlDMsIi7smzWWo+goaZN0g9KRGHe?=
 =?us-ascii?Q?Rb9pe/Xx0BJoOITOU3qOKdRWCRsFQSEfEvPUpaT8yq+DPOrAkiZQPQpcGQ/U?=
 =?us-ascii?Q?ExDWJKUPrCSp0XeVtel26FzbGYG9b9+SwRQWqNIf3+8pCGW6figjEZNZulK7?=
 =?us-ascii?Q?JgSjaveigm6EmqrJ7v7WqmOT8eU159fVl+6J7NNwSHzYagozGooEFlrIBzIE?=
 =?us-ascii?Q?/Z7IuAVODCUAry4kMUaTbXMgBJY7dczY5b3dDuS/bGtDl4fYfeg3+PxblQK8?=
 =?us-ascii?Q?ZBEgfTtVWBU3dIlToTPgW0bjo4ppLMZF+9sgxvx3noGnzkhDnwDUEZYXdwsJ?=
 =?us-ascii?Q?d54wIZVQPb0/1BpVFy0FnyGaKVtzJalvJtsOd7p4fGY3fwrwdHJXrEgMecPb?=
 =?us-ascii?Q?U467jRAlHLmUgRDaE3WFcHlWh78pYQAsv9p9ca2ZLQWGwMqrQoKG3gD4OuGU?=
 =?us-ascii?Q?AYpIgIqfoNuuPlDd+htIe04CHEmjnUfhnaO2G0i+wrItAWveV4G3PmSoaL/K?=
 =?us-ascii?Q?/Oo06Jqvo6RSbgV7hrqQun4G7xwno9Sl2YGel4WO7+HhqDMAOH3tv1/EMKTC?=
 =?us-ascii?Q?ObuSRLDSnf9bOpbPhtMF5jCRODX8DjnV3Z6S7RURINsujzU+cVnyAQxO3n0H?=
 =?us-ascii?Q?/lFvPdlBWzJGsClqa9bzkWxLq5z8V3qus7IVvDpeF1RYLwNoCzV1VYX7eo6s?=
 =?us-ascii?Q?9RMkP+j2MJQfCSLIXbnnUqNlkiFes4nq1GpplUvqIG9shhe986vUx2E4pWfL?=
 =?us-ascii?Q?UrM9itePN7/tGcsPljn4uJbNf3rV/o4sBEIELw7Cz8UaOjM90yzquJaeCZkH?=
 =?us-ascii?Q?kWUFBfBnrRbDOux40g6nYcnI7GiAtW07y4qqxpCJNUhheEn2NC4kH4OAi/lL?=
 =?us-ascii?Q?FtVxKeYUvG1Y7uTqQATbn1xdapeheXZpKTEf89W0xnMtBdzhyX31Xm6xLP6+?=
 =?us-ascii?Q?en26hCU/zDFVn8yfBaqszvNRGHuyMB+QVjnac4lrKLbXKm1nccilD8v21+Go?=
 =?us-ascii?Q?6x79whu6onPuy+KNgEwEexvzH9PqWHPyz+MQTKclesT2vv72wgqB?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa35a3c-1291-417b-b57f-08dee8964a5d
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 08:42:12.4302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z0MQRBMz/C1ngUHSQaiSnGj0lxN4WMUALdQk/KVQcO25AGJ9jv0iUD3oFRcQXCLNAiQ4uri5A8IdN1tvKvwLWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB6486

From: Frank Li <Frank.Li@nxp.com>

The circular LL ring has separate producer and consumer positions. Add
tracepoints for LL publication, descriptor append and completion,
IRQ-paired progress, and engine recovery. The common events cover eDMA
and HDMA.

The recovery event records configured LL channels before a direction
reset. When disabled, static keys leave only a branch at each trace site.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
Co-developed-by: Koichiro Den <den@valinux.co.jp>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v2:
  - Drop the obsolete tx_status event and ll_end fields.
  - Rename the start event for append/refill and add stopped/request state
    to the IRQ event.
  - Add the engine recovery event.
  - Match fields to their source types and simplify the Kbuild wiring.

 drivers/dma/dw-edma/Makefile        |   2 +
 drivers/dma/dw-edma/dw-edma-core.c  |  54 ++++++++
 drivers/dma/dw-edma/dw-edma-core.h  |   2 +
 drivers/dma/dw-edma/dw-edma-trace.c |   4 +
 drivers/dma/dw-edma/dw-edma-trace.h | 187 ++++++++++++++++++++++++++++
 5 files changed, 249 insertions(+)
 create mode 100644 drivers/dma/dw-edma/dw-edma-trace.c
 create mode 100644 drivers/dma/dw-edma/dw-edma-trace.h

diff --git a/drivers/dma/dw-edma/Makefile b/drivers/dma/dw-edma/Makefile
index 83ab58f87760..5f395fa1ede4 100644
--- a/drivers/dma/dw-edma/Makefile
+++ b/drivers/dma/dw-edma/Makefile
@@ -1,8 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 
+CFLAGS_dw-edma-trace.o		:= -I$(src)
 obj-$(CONFIG_DW_EDMA)		+= dw-edma.o
 dw-edma-$(CONFIG_DEBUG_FS)	:= dw-edma-v0-debugfs.o	\
 				   dw-hdma-v0-debugfs.o
+dw-edma-$(CONFIG_TRACING)	+= dw-edma-trace.o
 dw-edma-objs			:= dw-edma-core.o	\
 				   dw-edma-v0-core.o	\
 				   dw-hdma-v0-core.o $(dw-edma-y)
diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 1ccd3783181e..4b30fa5383d0 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -293,6 +293,12 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 				     chan->ll_head, chan->cb,
 				     dw_edma_core_enable_ll_irq(desc, i, free));
 
+		trace_edma_fill_ll(chan, chan->ll_head,
+				   desc->vd.tx.cookie,
+				   desc->burst[i].sar,
+				   desc->burst[i].dar, desc->burst[i].sz,
+				   chan->cb);
+
 		chan->ll_head++;
 
 		if (chan->ll_head == chan->ll_max) {
@@ -350,6 +356,7 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
 		if (desc->start_burst == desc->nburst)
 			continue;
 
+		trace_edma_append_desc(desc);
 		dw_edma_core_start(desc);
 		ret = 1;
 	}
@@ -421,6 +428,7 @@ static void dw_edma_ll_clean_pending(struct dw_edma_chan *chan, u32 old_done)
 		/* Hardware has consumed this descriptor's LL entries. */
 		dw_hdma_set_callback_result(vd, DMA_TRANS_NOERROR);
 		list_del(&vd->node);
+		trace_edma_complete_desc(desc);
 		vchan_cookie_complete(vd);
 	}
 }
@@ -647,6 +655,45 @@ dw_edma_engine_recovery_sync_irqs(struct dw_edma_engine_recovery *rec)
 	}
 }
 
+static void
+dw_edma_trace_engine_recovery(struct dw_edma_engine_recovery *rec)
+{
+	struct dw_edma *dw = rec->dw;
+	u16 off = rec->dir == EDMA_DIR_WRITE ? 0 : dw->wr_ch_cnt;
+	u16 cnt = rec->dir == EDMA_DIR_WRITE ? dw->wr_ch_cnt : dw->rd_ch_cnt;
+	struct dw_edma_chan *chan;
+	u16 i;
+
+	if (!trace_edma_engine_recovery_enabled())
+		return;
+
+	for (i = 0; i < cnt; i++) {
+		enum dw_edma_request request;
+		enum dw_edma_status status;
+		bool configured_ll;
+		unsigned int pending;
+		u32 ll_head, ll_done;
+
+		chan = &dw->chan[off + i];
+		scoped_guard(spinlock_irqsave, &chan->vc.lock) {
+			configured_ll = chan->configured && !chan->non_ll;
+			if (configured_ll) {
+				request = chan->request;
+				status = chan->status;
+				ll_head = chan->ll_head;
+				ll_done = chan->ll_done;
+				pending = dw_edma_ll_pending(chan);
+			}
+		}
+		if (!configured_ll)
+			continue;
+
+		trace_edma_engine_recovery(chan, dw_edma_core_ch_status(chan),
+					   request, status, ll_head, ll_done,
+					   pending);
+	}
+}
+
 static void dw_edma_engine_recovery_work(struct work_struct *work)
 {
 	struct dw_edma_engine_recovery *rec =
@@ -747,6 +794,8 @@ static void dw_edma_engine_recovery_work(struct work_struct *work)
 	if (!dw_edma_engine_recovery_needed(rec))
 		goto out_release;
 
+	dw_edma_trace_engine_recovery(rec);
+
 	if (!dw->core->engine_reset(dw, rec->dir)) {
 		/*
 		 * Keep channels gated and do not re-enable the engine unless
@@ -1322,6 +1371,9 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 	bool active;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
+	if (!chan->non_ll)
+		trace_edma_irq(chan, chan->ll_irq_idx, false,
+			       chan->ll_irq_stopped);
 	if (chan->status == EDMA_ST_PAUSE)
 		goto out;
 
@@ -1394,6 +1446,8 @@ static void dw_edma_progress_interrupt(struct dw_edma_chan *chan)
 
 	guard(spinlock_irqsave)(&chan->vc.lock);
 
+	trace_edma_irq(chan, chan->ll_irq_idx, true,
+		       chan->ll_irq_stopped);
 	if (chan->request == EDMA_REQ_NONE && chan->status != EDMA_ST_PAUSE) {
 		if (dw_edma_ll_consume_progress(chan))
 			dw_edma_start_transfer(chan);
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index f67232110f3c..c174fa0d8447 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -179,6 +179,8 @@ struct dw_edma {
 	const struct dw_edma_core_ops	*core;
 };
 
+#include "dw-edma-trace.h"
+
 typedef void (*dw_edma_handler_t)(struct dw_edma_chan *, bool);
 
 struct dw_edma_core_ops {
diff --git a/drivers/dma/dw-edma/dw-edma-trace.c b/drivers/dma/dw-edma/dw-edma-trace.c
new file mode 100644
index 000000000000..2620ad61a943
--- /dev/null
+++ b/drivers/dma/dw-edma/dw-edma-trace.c
@@ -0,0 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#define CREATE_TRACE_POINTS
+#include "dw-edma-core.h"
diff --git a/drivers/dma/dw-edma/dw-edma-trace.h b/drivers/dma/dw-edma/dw-edma-trace.h
new file mode 100644
index 000000000000..9d6e8fce6032
--- /dev/null
+++ b/drivers/dma/dw-edma/dw-edma-trace.h
@@ -0,0 +1,187 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright 2023 NXP.
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM dw_edma
+
+#if !defined(__LINUX_DW_EDMA_TRACE) || defined(TRACE_HEADER_MULTI_READ)
+#define __LINUX_DW_EDMA_TRACE
+
+#include <linux/types.h>
+#include <linux/tracepoint.h>
+
+DECLARE_EVENT_CLASS(edma_desc_info,
+	TP_PROTO(struct dw_edma_desc *desc),
+	TP_ARGS(desc),
+	TP_STRUCT__entry(
+		__field(size_t, nburst)
+		__field(size_t, start_burst)
+		__field(dma_cookie_t, cookie)
+		__field(u32, id)
+		__field(u8, dir)
+	),
+	TP_fast_assign(
+		__entry->nburst = desc->nburst;
+		__entry->start_burst = desc->start_burst;
+		__entry->id = desc->chan->id;
+		__entry->dir = desc->chan->dir;
+		__entry->cookie = desc->vd.tx.cookie;
+	),
+	TP_printk("chan %u%c desc %d nburst %zu start_burst %zu",
+		__entry->id,
+		__entry->dir ? 'R' : 'W',
+		__entry->cookie,
+		__entry->nburst,
+		__entry->start_burst)
+);
+
+DEFINE_EVENT(edma_desc_info, edma_append_desc,
+	TP_PROTO(struct dw_edma_desc *desc),
+	TP_ARGS(desc)
+);
+
+DEFINE_EVENT(edma_desc_info, edma_complete_desc,
+	TP_PROTO(struct dw_edma_desc *desc),
+	TP_ARGS(desc)
+);
+
+DECLARE_EVENT_CLASS(edma_ll_info,
+	TP_PROTO(struct dw_edma_chan *chan, int idx, bool progress,
+		 bool stopped),
+	TP_ARGS(chan, idx, progress, stopped),
+	TP_STRUCT__entry(
+		__field(u32, head)
+		__field(u32, done)
+		__field(u32, total)
+		__field(int, index)
+		__field(dma_cookie_t, completed_cookie)
+		__field(dma_cookie_t, cookie)
+		__field(u32, id)
+		__field(u8, dir)
+		__field(bool, progress)
+		__field(bool, stopped)
+		__field(bool, requested)
+	),
+	TP_fast_assign(
+		__entry->head = chan->ll_head;
+		__entry->done = chan->ll_done;
+		__entry->total = chan->ll_max;
+		__entry->index = idx;
+		__entry->completed_cookie = chan->vc.chan.completed_cookie;
+		__entry->cookie = chan->vc.chan.cookie;
+		__entry->id = chan->id;
+		__entry->dir = chan->dir;
+		__entry->progress = progress;
+		__entry->stopped = stopped;
+		__entry->requested = chan->ll_irq_requested;
+	),
+	TP_printk("chan %u%c event %s stopped %u requested %u head %u done %u total %u index %d complete cookie %d cookie %d",
+		__entry->id,
+		__entry->dir ? 'R' : 'W',
+		__entry->progress ? "progress" : "done",
+		__entry->stopped,
+		__entry->requested,
+		__entry->head,
+		__entry->done,
+		__entry->total,
+		__entry->index,
+		__entry->completed_cookie,
+		__entry->cookie)
+);
+
+DEFINE_EVENT(edma_ll_info, edma_irq,
+	TP_PROTO(struct dw_edma_chan *chan, int idx, bool progress,
+		 bool stopped),
+	TP_ARGS(chan, idx, progress, stopped)
+);
+
+TRACE_EVENT(edma_engine_recovery,
+	TP_PROTO(struct dw_edma_chan *chan, enum dma_status hw_status,
+		 enum dw_edma_request request, enum dw_edma_status status,
+		 u32 ll_head, u32 ll_done, u32 pending),
+	TP_ARGS(chan, hw_status, request, status, ll_head, ll_done, pending),
+	TP_STRUCT__entry(
+		__field(u32, id)
+		__field(u32, head)
+		__field(u32, done)
+		__field(u32, pending)
+		__field(int, hw_status)
+		__field(int, request)
+		__field(int, status)
+		__field(u8, dir)
+	),
+	TP_fast_assign(
+		__entry->id = chan->id;
+		__entry->dir = chan->dir;
+		__entry->hw_status = hw_status;
+		__entry->request = request;
+		__entry->status = status;
+		__entry->head = ll_head;
+		__entry->done = ll_done;
+		__entry->pending = pending;
+	),
+	TP_printk("chan %u%c hw %d request %d status %d head %u done %u pending %u",
+		__entry->id,
+		__entry->dir ? 'R' : 'W',
+		__entry->hw_status,
+		__entry->request,
+		__entry->status,
+		__entry->head,
+		__entry->done,
+		__entry->pending)
+);
+
+DECLARE_EVENT_CLASS(edma_log_ll,
+	TP_PROTO(struct dw_edma_chan *chan, u32 idx, dma_cookie_t cookie, u64 src,
+		 u64 dest, u32 sz, bool flag),
+	TP_ARGS(chan, idx, cookie, src, dest, sz, flag),
+	TP_STRUCT__entry(
+		__field(u32, idx)
+		__field(u64, src)
+		__field(u64, dest)
+		__field(u32, sz)
+		__field(u32, id)
+		__field(dma_cookie_t, cookie)
+		__field(bool, flag)
+		__field(u8, dir)
+	),
+	TP_fast_assign(
+		__entry->idx = idx;
+		__entry->src = src;
+		__entry->dest = dest;
+		__entry->sz = sz;
+		__entry->id = chan->id;
+		__entry->dir = chan->dir;
+		__entry->cookie = cookie;
+		__entry->flag = flag;
+	),
+	TP_printk("chan %u%c %d [%u] %c src: %08llx dest: %08llx sz: %04x",
+		__entry->id,
+		__entry->dir ? 'R' : 'W',
+		__entry->cookie,
+		__entry->idx,
+		__entry->flag ? 'C' : 'c',
+		__entry->src,
+		__entry->dest,
+		__entry->sz)
+);
+
+DEFINE_EVENT(edma_log_ll, edma_fill_ll,
+	TP_PROTO(struct dw_edma_chan *chan, u32 idx, dma_cookie_t cookie, u64 src,
+		 u64 dest, u32 sz, bool flag),
+	TP_ARGS(chan, idx, cookie, src, dest, sz, flag)
+);
+
+#endif
+
+/* This part must be outside the header guard. */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE dw-edma-trace
+
+#include <trace/define_trace.h>
-- 
2.51.0

