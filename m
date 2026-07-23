Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020109.outbound.protection.outlook.com [52.101.228.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF82940DFA3;
	Thu, 23 Jul 2026 08:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784796136; cv=fail; b=MB9hmIecAG6oQTS4mgRC379vNupEqwJ5yozi5zZAIhVeQ5dSWYUy/Z31lrn3shWlZNbDf5ypwv2NWgKWz/sy7CB9ti/98NYzeiRyjNEbJW0W67d5BXovkXDbYNm01+YAaoS06Q7e1h2VkcisDlz+gtUGlIHt3fTeAx/WSpexiQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784796136; c=relaxed/simple;
	bh=jXwFKjPuDn0g9Y/EnR3U56cWRDTyELSjWKn+dWqKRrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AmyGM5EL0zirYZHAzcHRs+hL4L8oJWv/JIhdRQOCnZA1OQRlqXmnHg03QvnOr9+g2O+65+e44WDL5JcvNH805byw4LgPrBAQF11QSJqW9D9pVjwy0THNhn5kHBL4RKX9X6SkFo8y8xE9rVRXAhjIEcPQIZnf8EJwptE7bcaxdEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=pMGSHcjK; arc=fail smtp.client-ip=52.101.228.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="pMGSHcjK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TgvNzIgIWj4Vr808ivBqoUmZ3VWV/04KKFSBlHZx55IjUVAY4x5wShYNU1xsn6sH0jvqO2sFDyFNphxQS1htx4O0pQDcvCPHNX10MKfKwaZkzuCQdtj/6jZPbWSdfSbG430QB/tk0SyP0bhaLzj6v9vG5Z91hEf0LjTHaWv73tSOpyVG3oeCjI1sDKRGOiwQPcKwvRTvLqXLCOeG7P8awL5+BBHWKpo9d23Ym4w2rzRp48/n+nv7f3l6v5pTxrDxPE0vCFCF3Agaq9OiIHyFIl7dM/XxbukTSdkS5ikehoBkdc/A8nkC6tJBzyNhvuXY6skzYuX795dgzTb/OmWWXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9M7QrSOotEwI57KmBWDf6n8KlnCzlj+dSV4BBCnA7g=;
 b=kVsJYmuW6M8F05mN+Z13fPlJUoRk6ARddlwp0HwCCw4wmCuP2XR/HUz3arhcLeT+YgkmMx37XBfCUwx+5r2gT4L8F2tC58yCt43LUtZm7Y3BNHXewatk7KcT+FAYkicAcwLCBimQ+A0nZz+Kh9N7rXgpG5Ao+CwRuy8tWgncR/XJHjSGo8ja+dXJwBW+ry9PkisZe2daKvuHho3WVr63rVVxZDpRZK1Wc3KPvloCA3IwKN5BhYBFYvziOzRdWXrQmlFOiX7GTVTvFPYuVc3Jz3wCLvxIalYO66rgLrVtX2oDj6G3Ach2/CJrEcdtUOHWx5LnpbXzME2oGzfisq5qxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9M7QrSOotEwI57KmBWDf6n8KlnCzlj+dSV4BBCnA7g=;
 b=pMGSHcjKRyNeiaas3EHhTzbiGASd05y/Mp3R2bmIbowQqY/xYSfaQnlLXmLE/brCyWG0quJX0UhYytjuD5BNwQkZlWiU+z40zrUSiVNWjlsm11coefEbfHG8cCai/K34pBE68NdMYzI6u+yKpOIE1YQmQWH/yZ92s2Q+E5ZYHq0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB1883.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:111::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 08:42:04 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 08:42:04 +0000
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
Subject: [PATCH v2 10/19] dmaengine: dw-edma: Use HDMA watermarks as progress events
Date: Thu, 23 Jul 2026 17:41:41 +0900
Message-ID: <20260723084150.521366-11-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260723084150.521366-1-den@valinux.co.jp>
References: <20260723084150.521366-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0118.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::14) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB1883:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c98497b-9c40-452d-23e4-08dee896459a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|10070799003|366016|1800799024|921020|6133799003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NKTvEGH5D4b66O6OAfmZooYyqAflgJsyxLbFdj8zVjtS2cyfXdZ3EB4v4SU/vHarYwV+E7NAB+4Je05nbM782e2RTLcLqfTVj84a+kfg6HAWGrdl9Hrfaz+amN3/PRy7jv3HWQRGf6OFXCQjaK0naSvCWNcHRHxqNYo8ttkQ+IzIoz7jn3a4v5B2qPpDi0h6iwZGlSclur0czr1Qme7Bd9bGlFi5XyIIevsDSNLUO4jPl2GD8pwNAbQajvxKmlxl53nFGgdTYr/BdGZ9LSaAVU0GRoOq0sJmGkly58OhxQ3dMRjJCko0/A6GEwy8nRlN4TH5kNT2T82fdXQro/zSrWt4MFzK3F8uEC3t1ao2cIkrSjCwE5ybZHUAKiBgdJLhH4+AJpzbKErfSGCDvwtu9vYFgBJLHkPfTUnep2z3ApwLji1oKq2OWJ6tl3R3uRCzx/Y9U7KuEueWfjaNy2T+L32m1wfV42TfwixaW4gNRxz9BbT80+onM+jPBP5oXLBnfIwSp0zJZSiYr7DT+yxA7J7QFS0FjTTKC2VWGI9VtVYFOO/rnYDLPROly2/47237sfLwROkHT3CeBcRU5kcwIdk3E2z2cq6BZstR43iXvcq8+5gPMDI0LIh4LlZeiK9HVVE2DShHfoE/rcpl5/3xj4Zq9yXMmAUjeGEQstxDu6iBjuHRXDBf9+4+odWrx/T9fWtx7MyglMEAErID0fjV9w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(10070799003)(366016)(1800799024)(921020)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s4m+/yKGjfQN7Pi16+dY3e1xS/ZJJoI9df1bYsL/R+LeRcuya06V1STQGyTf?=
 =?us-ascii?Q?G7nRfqleEwvCTkYBx1GAbqedQqUnpNlUCsCKqmTYFGoeqj9WjFqsJ9nT9vF/?=
 =?us-ascii?Q?4T6E/nVSBtB2mhSV56/vL5TZqKil9XNsD3Hgs3/yt/wGjwwpPtNLWXbIOrH+?=
 =?us-ascii?Q?DlNyZcwWYBnd8i7yt70iAdwAhpNlDJRDt2N8SM/YSXF/ap1zk6BhD6yik43/?=
 =?us-ascii?Q?DGuboMW2NKeBqr2zPi5umw6gkHW4LdABftGzRtYXgWn6yS9dj88xbbk0V3AS?=
 =?us-ascii?Q?lw85F5wxDl0RIDnJHGpp5LSMC11bZng07y7AO/4RrUmpOBrY8G/UWItNlugT?=
 =?us-ascii?Q?Q9oMov8UDWEYpEjLBZ1G/dYj4Qe2z+PtTrZEUpLVTgYLt21Ttyvb1SKZ9ibi?=
 =?us-ascii?Q?5Dsp1JpiT9iv6LUbEwGkvosa02alW/J8424RMet+Pb1jwQuGdnhl0E8+ZGvl?=
 =?us-ascii?Q?LDS03oxSaZap8V9jjPCwgDssQGaXhauDScrvuS1TaionrsxsDS2O0iEGjurg?=
 =?us-ascii?Q?4/5jMoEyQV/MoQC2vkOeX5vyyc9YB01HcvkL0KHC+8gdllWz4IUMq72AJCrA?=
 =?us-ascii?Q?lVU6Jzb5LSDvjPOecOUPzee1kERQBjOMOREM0fX68MXNltdbEgcCSErzLf0D?=
 =?us-ascii?Q?hsVHaR8VD5p94pOtYjydobmXNLEEzLixRdwe/o430DvG7UHEFXYoQn0nYXim?=
 =?us-ascii?Q?33WMe1bCIgp0vwM3UcgVUbHr5tSZzBTNN221CAhS6MQxwcPngZvUjKdeS1j/?=
 =?us-ascii?Q?GwS29boSlQwwcsMYi8Xcfod3DkY0A4Ccl5agW92lap4tg9dvd8zxUlAJmVJF?=
 =?us-ascii?Q?RvnsUh70hc/HyeiEgkZIcvnfPlgHIbVMzo4WQiAsHQwzRuRO9j72bXK+LLn5?=
 =?us-ascii?Q?aPCiC+YRwBIXj0PIwtc+JzmsCBRCfDdeQ7IovpEeViOjr6BratcCJatdEiIi?=
 =?us-ascii?Q?LNuv0sBLYK2QCM9r8H5fbYTOwVFkpAeTHwfqsjIhrITGbB5SJW8j6+EzmPCw?=
 =?us-ascii?Q?UvAvLetLYwwvOIqCVGf81+lOgj7Qa4iAl0oku5kp6eEB7VvZj31wJz+V+i7H?=
 =?us-ascii?Q?yoONedrgiJ8CRf72AMz8Nu14YSYttrNg9knfOVsM8t4sNi42lJYAEWAQf6hw?=
 =?us-ascii?Q?FY6mUNoFeUe2v2+K+r8BPf+cLEDAfO42mInXCwYRtTRhpLvjmA4TV+FSZKnQ?=
 =?us-ascii?Q?0mYxnSKu0zZKvr3viFszhurmp4GE+dJeAVrVlxLQ+hxoOxRXXv0VUpclNn45?=
 =?us-ascii?Q?SRfkCyTTEfMa4NlIfIjfsmc6dGb6xEwMstZkcZJA45nxirwZnE+jCDKMMB7g?=
 =?us-ascii?Q?yKBwo26DdWcOW5Ivf18iT3BCVwkjXiRA3E5LQhEgwlyQpQ5SinXrO0OtxPNt?=
 =?us-ascii?Q?saNIsYnUhZ3ysFtT6POAIFl40sXAIGiUmvdRN6G4tY+znGEJ73rUHGDhRp0L?=
 =?us-ascii?Q?beb/un4QgTzoMVDLC/ckgKjZTEoJBm/AQWHY8yBEytCVb+cBoPgQorjVLQs4?=
 =?us-ascii?Q?Mn9BawRbwRLmkXf8jTTAbE5rWj5ltxiWsTNTPwErk5RqUIPt5zrVLcZloxJd?=
 =?us-ascii?Q?4FNE2iMp9S9ufM7PVXx9zMjlr76uLawKZy6ZP0agFdEowTM3lLpf9mX5wZjS?=
 =?us-ascii?Q?ibadqSp2f5bwWxnLq8NppqycJdwvO1VQuyJU1mpRWMGpwaZdF/bZbbOK1aF+?=
 =?us-ascii?Q?SXeaGyRPXlc1IDI4uFHC35zJnU522ZwO7WsK79YQ2EMVVgVpoukoIb3x32c5?=
 =?us-ascii?Q?iXtSn2z0ubGH2oeBOoH4eXbx0XGVABgf5K7iqur+P1ILU00jTeSg?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c98497b-9c40-452d-23e4-08dee896459a
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 08:42:04.4708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cFak8D+TZiUaJX+s0h8Z8DWciV6H0GsWZSVjCeUhMo4XIMlUWLdSxEP6y5kVaUJn99cQXArM1ly5ZgSI//soCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1883

HDMA reports running LL progress through WATERMARK and channel stop
through STOP. Wire watermark setup, clearing, MSI programming, and
LWIE/RWIE into the core interrupt path. Route WATERMARK to the common
progress handler; STOP remains the done event.

DWC PCIe Controller Databook 6.10a-lca06, Section 7.2.1, permits recycling
LLEs through the watermark LLP. Testing on a 6.30a integration found that
boundary unsafe for DMAengine completion: clients released mappings while
hardware still accessed them. Keep completion one entry behind the raw
LLP. Once the channel has stopped, LLP points to the next entry and needs
no such margin.

Leave EDMA_REQ_STOP and EDMA_REQ_PAUSE to the STOP path instead of
handling their watermark as normal running progress. The eDMA path is
unchanged.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v2:
  - Keep completion one entry behind the raw LLP; v1 used the reported
    boundary.
  - Fold watermark masks into dw_hdma_v0_core_int_setup() while keeping
    v1's local and remote routing.
  - Use the deferred per-channel IRQ work from the groundwork series.
  - Mask local watermark interrupts only for remote LL channels, and
    document the STOP/ABORT and WATERMARK distinction.

 drivers/dma/dw-edma/dw-edma-core.c    | 32 ++++++++++-
 drivers/dma/dw-edma/dw-edma-core.h    |  9 ++--
 drivers/dma/dw-edma/dw-edma-v0-core.c |  4 +-
 drivers/dma/dw-edma/dw-hdma-v0-core.c | 76 ++++++++++++++++++++++-----
 drivers/dma/dw-edma/dw-hdma-v0-regs.h |  1 +
 5 files changed, 104 insertions(+), 18 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 44a0ff906f2f..c6c2655c6c43 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -32,7 +32,8 @@ struct dw_edma_desc *vd2dw_edma_desc(struct virt_dma_desc *vd)
 
 enum dw_edma_irq_event {
 	DW_EDMA_IRQ_DONE	= BIT(0),
-	DW_EDMA_IRQ_ABORT	= BIT(1),
+	DW_EDMA_IRQ_PROGRESS	= BIT(1),
+	DW_EDMA_IRQ_ABORT	= BIT(2),
 };
 
 static inline
@@ -912,6 +913,24 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
 
+static void dw_edma_progress_interrupt(struct dw_edma_chan *chan)
+{
+	if (chan->non_ll)
+		return;
+
+	guard(spinlock_irqsave)(&chan->vc.lock);
+
+	if (chan->request == EDMA_REQ_NONE && chan->status != EDMA_ST_PAUSE) {
+		if (dw_edma_ll_consume_progress(chan))
+			dw_edma_start_transfer(chan);
+		chan->status = dw_edma_ll_pending(chan) ?
+			       EDMA_ST_BUSY : EDMA_ST_IDLE;
+	}
+
+	/* The channel may have stopped after the progress point was sampled. */
+	dw_edma_core_ch_maybe_doorbell(chan);
+}
+
 static void dw_edma_abort_interrupt(struct dw_edma_chan *chan)
 {
 	struct virt_dma_desc *vd;
@@ -942,6 +961,8 @@ static void dw_edma_irq_work(struct work_struct *work)
 
 		if (events & DW_EDMA_IRQ_DONE)
 			dw_edma_done_interrupt(chan);
+		if (events & DW_EDMA_IRQ_PROGRESS)
+			dw_edma_progress_interrupt(chan);
 		if (events & DW_EDMA_IRQ_ABORT)
 			dw_edma_abort_interrupt(chan);
 	} while (atomic_read(&chan->irq_pending));
@@ -980,6 +1001,13 @@ static void dw_edma_done_interrupt_deferred(struct dw_edma_chan *chan,
 	dw_edma_queue_irq_work(chan, DW_EDMA_IRQ_DONE);
 }
 
+static void dw_edma_progress_interrupt_deferred(struct dw_edma_chan *chan,
+						bool stopped)
+{
+	dw_edma_record_irq_idx(chan, stopped);
+	dw_edma_queue_irq_work(chan, DW_EDMA_IRQ_PROGRESS);
+}
+
 static void dw_edma_abort_interrupt_deferred(struct dw_edma_chan *chan,
 					     bool stopped)
 {
@@ -1084,6 +1112,7 @@ static inline irqreturn_t dw_edma_interrupt_write_inner(int irq, void *data)
 
 	return dw_edma_core_handle_int(dw_irq, EDMA_DIR_WRITE,
 				       dw_edma_done_interrupt_deferred,
+				       dw_edma_progress_interrupt_deferred,
 				       dw_edma_abort_interrupt_deferred);
 }
 
@@ -1093,6 +1122,7 @@ static inline irqreturn_t dw_edma_interrupt_read_inner(int irq, void *data)
 
 	return dw_edma_core_handle_int(dw_irq, EDMA_DIR_READ,
 				       dw_edma_done_interrupt_deferred,
+				       dw_edma_progress_interrupt_deferred,
 				       dw_edma_abort_interrupt_deferred);
 }
 
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index 90dcbe415f57..d074506f63ed 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -167,7 +167,9 @@ struct dw_edma_core_ops {
 	enum dma_status (*ch_status)(struct dw_edma_chan *chan);
 	u32 (*ch_transfer_size)(struct dw_edma_chan *chan);
 	irqreturn_t (*handle_int)(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
-				  dw_edma_handler_t done, dw_edma_handler_t abort);
+				  dw_edma_handler_t done,
+				  dw_edma_handler_t progress,
+				  dw_edma_handler_t abort);
 	void (*non_ll_start)(struct dw_edma_chan *chan, struct dw_edma_burst *child);
 	void (*ll_data)(struct dw_edma_chan *chan, struct dw_edma_burst *burst,
 			u32 idx, bool cb, bool irq);
@@ -268,9 +270,10 @@ enum dma_status dw_edma_core_ch_status(struct dw_edma_chan *chan)
 
 static inline irqreturn_t
 dw_edma_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
-			dw_edma_handler_t done, dw_edma_handler_t abort)
+			dw_edma_handler_t done, dw_edma_handler_t progress,
+			dw_edma_handler_t abort)
 {
-	return dw_irq->dw->core->handle_int(dw_irq, dir, done, abort);
+	return dw_irq->dw->core->handle_int(dw_irq, dir, done, progress, abort);
 }
 
 static inline
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index 3b69fa26bf1c..42036239ba79 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -341,7 +341,9 @@ static void dw_edma_v0_core_clear_abort_int(struct dw_edma_chan *chan)
 
 static irqreturn_t
 dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
-			   dw_edma_handler_t done, dw_edma_handler_t abort)
+			   dw_edma_handler_t done,
+			   dw_edma_handler_t progress,
+			   dw_edma_handler_t abort)
 {
 	struct dw_edma *dw = dw_irq->dw;
 	unsigned long total, pos, val;
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index 4440e3ebaeac..535832e1ed0d 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -56,7 +56,8 @@ static u32 dw_hdma_v0_core_int_setup(struct dw_edma_chan *chan, u32 val)
 {
 	val &= ~(HDMA_V0_LOCAL_ABORT_INT_EN | HDMA_V0_REMOTE_ABORT_INT_EN |
 		 HDMA_V0_LOCAL_STOP_INT_EN | HDMA_V0_REMOTE_STOP_INT_EN |
-		 HDMA_V0_ABORT_INT_MASK | HDMA_V0_STOP_INT_MASK);
+		 HDMA_V0_ABORT_INT_MASK | HDMA_V0_WATERMARK_INT_MASK |
+		 HDMA_V0_STOP_INT_MASK);
 
 	/*
 	 * HDMA_INT_STATUS.STOP and .ABORT are latched only when LSIE and
@@ -66,10 +67,14 @@ static u32 dw_hdma_v0_core_int_setup(struct dw_edma_chan *chan, u32 val)
 	 */
 	val |= HDMA_V0_LOCAL_ABORT_INT_EN | HDMA_V0_LOCAL_STOP_INT_EN;
 
-	if (chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE)
+	if (chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE) {
+		if (!chan->non_ll)
+			val |= HDMA_V0_WATERMARK_INT_MASK;
+
 		val |= HDMA_V0_REMOTE_ABORT_INT_EN |
 		       HDMA_V0_REMOTE_STOP_INT_EN |
 		       HDMA_V0_ABORT_INT_MASK | HDMA_V0_STOP_INT_MASK;
+	}
 
 	return val;
 }
@@ -79,10 +84,12 @@ static void dw_hdma_v0_core_ch_off(struct dw_edma *dw, enum dw_edma_dir dir,
 				   u16 id)
 {
 	SET_CH_32(dw, dir, id, int_setup,
-		  HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
+		  HDMA_V0_STOP_INT_MASK | HDMA_V0_WATERMARK_INT_MASK |
+		  HDMA_V0_ABORT_INT_MASK);
 	SET_CH_32(dw, dir, id, ch_en, 0);
 	SET_CH_32(dw, dir, id, int_clear,
-		  HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
+		  HDMA_V0_STOP_INT_MASK | HDMA_V0_WATERMARK_INT_MASK |
+		  HDMA_V0_ABORT_INT_MASK);
 }
 
 static void dw_hdma_v0_core_off(struct dw_edma *dw)
@@ -93,18 +100,26 @@ static void dw_hdma_v0_core_off(struct dw_edma *dw)
 	dir = EDMA_DIR_WRITE;
 	for (id = 0; id < dw->wr_ch_cnt; id++) {
 		SET_CH_32(dw, dir, id, int_setup,
-			  HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
+			  HDMA_V0_STOP_INT_MASK |
+			  HDMA_V0_WATERMARK_INT_MASK |
+			  HDMA_V0_ABORT_INT_MASK);
 		SET_CH_32(dw, dir, id, int_clear,
-			  HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
+			  HDMA_V0_STOP_INT_MASK |
+			  HDMA_V0_WATERMARK_INT_MASK |
+			  HDMA_V0_ABORT_INT_MASK);
 		SET_CH_32(dw, dir, id, ch_en, 0);
 	}
 
 	dir = EDMA_DIR_READ;
 	for (id = 0; id < dw->rd_ch_cnt; id++) {
 		SET_CH_32(dw, dir, id, int_setup,
-			  HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
+			  HDMA_V0_STOP_INT_MASK |
+			  HDMA_V0_WATERMARK_INT_MASK |
+			  HDMA_V0_ABORT_INT_MASK);
 		SET_CH_32(dw, dir, id, int_clear,
-			  HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
+			  HDMA_V0_STOP_INT_MASK |
+			  HDMA_V0_WATERMARK_INT_MASK |
+			  HDMA_V0_ABORT_INT_MASK);
 		SET_CH_32(dw, dir, id, ch_en, 0);
 	}
 }
@@ -161,6 +176,14 @@ static void dw_hdma_v0_core_clear_done_int(struct dw_edma_chan *chan)
 	SET_CH_32(dw, chan->dir, chan->id, int_clear, HDMA_V0_STOP_INT_MASK);
 }
 
+static void dw_hdma_v0_core_clear_watermark_int(struct dw_edma_chan *chan)
+{
+	struct dw_edma *dw = chan->dw;
+
+	SET_CH_32(dw, chan->dir, chan->id, int_clear,
+		  HDMA_V0_WATERMARK_INT_MASK);
+}
+
 static void dw_hdma_v0_core_clear_abort_int(struct dw_edma_chan *chan)
 {
 	struct dw_edma *dw = chan->dw;
@@ -177,7 +200,9 @@ static u32 dw_hdma_v0_core_status_int(struct dw_edma_chan *chan)
 
 static irqreturn_t
 dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
-			   dw_edma_handler_t done, dw_edma_handler_t abort)
+			   dw_edma_handler_t done,
+			   dw_edma_handler_t progress,
+			   dw_edma_handler_t abort)
 {
 	struct dw_edma *dw = dw_irq->dw;
 	unsigned long total, pos, val;
@@ -196,18 +221,31 @@ dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 	}
 
 	for_each_set_bit(pos, mask, total) {
+		bool has_stop, has_watermark;
+
 		chan = &dw->chan[pos + off];
 		if (unlikely(dw_edma_core_ch_ignore_irq(chan)))
 			continue;
 
 		val = dw_hdma_v0_core_status_int(chan);
-		if (FIELD_GET(HDMA_V0_STOP_INT_MASK, val)) {
-			dw_hdma_v0_core_clear_done_int(chan);
-			done(chan, true);
+		has_stop = FIELD_GET(HDMA_V0_STOP_INT_MASK, val);
+		has_watermark = FIELD_GET(HDMA_V0_WATERMARK_INT_MASK, val);
 
+		if (has_watermark) {
+			dw_hdma_v0_core_clear_watermark_int(chan);
 			ret = IRQ_HANDLED;
 		}
 
+		if (has_stop) {
+			dw_hdma_v0_core_clear_done_int(chan);
+			ret = IRQ_HANDLED;
+		}
+
+		if (has_stop)
+			done(chan, true);
+		else if (has_watermark)
+			progress(chan, false);
+
 		if (FIELD_GET(HDMA_V0_ABORT_INT_MASK, val)) {
 			dw_hdma_v0_core_clear_abort_int(chan);
 			abort(chan, false);
@@ -268,7 +306,7 @@ static void dw_hdma_v0_core_ch_enable(struct dw_edma_chan *chan)
 
 	/* Enable engine */
 	SET_CH_32(dw, chan->dir, chan->id, ch_en, BIT(0));
-	/* Interrupt unmask - stop, abort */
+	/* Interrupt unmask - stop, watermark, abort */
 	tmp = GET_CH_32(dw, chan->dir, chan->id, int_setup);
 	tmp = dw_hdma_v0_core_int_setup(chan, tmp);
 	SET_CH_32(dw, chan->dir, chan->id, int_setup, tmp);
@@ -343,6 +381,11 @@ static void dw_hdma_v0_core_ch_config(struct dw_edma_chan *chan)
 	/* MSI done addr - low, high */
 	SET_CH_32(dw, chan->dir, chan->id, msi_stop.lsb, chan->msi.address_lo);
 	SET_CH_32(dw, chan->dir, chan->id, msi_stop.msb, chan->msi.address_hi);
+	/* MSI watermark addr - low, high */
+	SET_CH_32(dw, chan->dir, chan->id, msi_watermark.lsb,
+		  chan->msi.address_lo);
+	SET_CH_32(dw, chan->dir, chan->id, msi_watermark.msb,
+		  chan->msi.address_hi);
 	/* MSI abort addr - low, high */
 	SET_CH_32(dw, chan->dir, chan->id, msi_abort.lsb, chan->msi.address_lo);
 	SET_CH_32(dw, chan->dir, chan->id, msi_abort.msb, chan->msi.address_hi);
@@ -362,6 +405,13 @@ dw_hdma_v0_core_ll_data(struct dw_edma_chan *chan, struct dw_edma_burst *burst,
 	if (cb)
 		control |= DW_HDMA_V0_CB;
 
+	if (irq) {
+		control |= DW_HDMA_V0_LWIE;
+
+		if (chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE)
+			control |= DW_HDMA_V0_RWIE;
+	}
+
 	dw_hdma_v0_write_ll_data(chan, idx, control, burst->sz, burst->sar,
 				 burst->dar);
 }
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-regs.h b/drivers/dma/dw-edma/dw-hdma-v0-regs.h
index 2124c162a62f..60dc054adafa 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-regs.h
+++ b/drivers/dma/dw-edma/dw-hdma-v0-regs.h
@@ -18,6 +18,7 @@
 #define HDMA_V0_LOCAL_STOP_INT_EN		BIT(4)
 #define HDMA_V0_REMOTE_STOP_INT_EN		BIT(3)
 #define HDMA_V0_ABORT_INT_MASK			BIT(2)
+#define HDMA_V0_WATERMARK_INT_MASK		BIT(1)
 #define HDMA_V0_STOP_INT_MASK			BIT(0)
 #define HDMA_V0_LINKLIST_EN			BIT(0)
 #define HDMA_V0_CONSUMER_CYCLE_STAT		BIT(1)
-- 
2.51.0

