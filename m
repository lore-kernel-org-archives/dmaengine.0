Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020112.outbound.protection.outlook.com [52.101.229.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE46476689;
	Wed, 12 Aug 2026 15:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550267; cv=fail; b=CShIcvR9vAre9eReJvoqLmGmHXRhkY2eF2yGzyZiqf89Q3z66K8+1csjE2whfrZ9InrlCaQUDT5siEwbg9x0lPJySgc/5Qu7iVzScjytLZbae1vhJQfCTELfQSmOc3seiQNuKpusmBV+Pz+QaHmfxaokA5hAde7N5hZIpe2ZooM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550267; c=relaxed/simple;
	bh=cxLxcpp+oWxzVCWLTxIP5dAViK0QwHY0ItRy+fHSF6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LTbo837C9XZfkB5D3+7sAuWwiu/qkVUOAlZuUFr+WNFyu5sibWnuSq1FMDumnH6ioVLjAWbFdPzjx1muj7MkL+E6Mt/DP+aoLC+ly5TfcNU2j81V3yIiOTsgK7qRGHTmkOIwmsY12In+E3hqsV1nkrTKqtjfmIuB8m/M+vYLNx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=ZJvZoiP4; arc=fail smtp.client-ip=52.101.229.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="ZJvZoiP4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWrPw4/I+CvsAqRrBah+H9l6O2n5AzNdxC91l6RnaeAD/dhTxNsPD80dijgOg59+wm8SJ5wkiQQHUTEWN5HJH21TMTOl+wY3vg4g0JeCe7bWuIyFfj8OyC2xBRBeGyV9oqfSAXFDMng7Xc1e1FkJF8qHIslGJC7+33wsj7RKrlxIF59mIpezzPP8TTfqiO89YNHy4w/0y6kgTvo+pPVYYWXv76Aga2mBbM+g7Ess4cpYFcHeVCmO0ovVdxyoeb0TNsVGazLpXqo3WZdVMAly/JSwxAxihTxLZAyCVdmWamOj+PRNz217xHKlgaGYDDR0nG/06MDM0rQfhHttdYWPMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZKeOlJRBrTtFydbGaizfuEBVRhbMOqeIru2GMFveWI=;
 b=vmg3J5lDrbcRe4IiQETAoY8n38+/ap3cuZHBxW8LU5dbp+YY+V60yYv7FIHlu2MbWu/RSnSUTvbkew2utUlHXGhX5uNIJjdxtI1WpwXRqrxtvTlUl/o/XgafQDRIVbu4YQSLdFQL7Pv9hZFKy3Qn0UK19GNFqLDgqg6doT4PbaZp74lYdj0Xexp7ZNsHy3a1LVhi5sw9oORJEeMxCLxmnBYS9geiNLDl3ETGeI+tvRN1jNYrfOMpPhYy9neXuux6BG4ovU9ZzDj6WaCJpNL51Dl9tv1uytAcRjfl6BirnIMwn+99TXCwzUt92GQn0AGCc3ROjs6BBNJtVlzujRYwNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZKeOlJRBrTtFydbGaizfuEBVRhbMOqeIru2GMFveWI=;
 b=ZJvZoiP42Nik9vGNijki0nUqcTNka4BDkA1B0yC0TwPk6x2dU6hGj8JEFfJ/LG0tDldduFbNKi1IPPv3dXneSAoUIN2vvd+tojYpEmnN5u2aFFHZHD84EYeyPezDQuc7EF77M/VoWG2QUZSNIBqm5lCVA+PuVfLaRekGmQ0Ra1w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB7115.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:42f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 12 Aug
 2026 15:57:33 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 15:57:33 +0000
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
Subject: [PATCH v5 09/24] dmaengine: dw-edma: Prepare deferred IRQ reporting for LL events
Date: Thu, 13 Aug 2026 00:57:06 +0900
Message-ID: <20260812155721.2807506-10-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260812155721.2807506-1-den@valinux.co.jp>
References: <20260812155721.2807506-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0238.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::11) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d377e71-dabc-44eb-4071-08def88a6c02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|10070799003|18002099003|22082099003|56012099006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	qKTnuHMe1uV1U4Hvn6kQ11k7bmitmYX02Cp5HbnIJFiNOvv+Og8dfpJmo3rYNI6qza48aJ8by4/mUJbDSDrfuZVhFkjcig4PHSJnTG7aHhaveZAHfqRUwMClH3ON4DWCHd5eHGJcWaDEZeKERw92mLls6R9GjHYL1BOaMta//RpZ9jH7Gn/X8YFYHA7tFZO4eYzN3No493b2aUs5j0Yx7ObhFXkVnFYIV4GNOAIxXoT+9CovtFnEtoEZMmeLjmEe3LgHTs2AgCptLqaeqyG33JODDPWKNNxblRoNbAqw1a9kxaiVqAamOQK+yjR60k3vxgPJQbxlptci0JqJWZFOSivx/9v2O4751iOEpfamL49O7t7ff5eCA9gxqou39Sr4Ob6VP/xTJkhjFdipre4XBwQ0lftfNVe8WU1i4x7eqr4k14RhkAxUVrZhu8NCMz6c/hb7uSe9nSrSDhEPVHfL0F6u6VA/QTxujFCRx5KUvd3ihVt31Ajbof0Kq1Pddzi4xwpv4xVGiqZqS47kFZlebZ2oE1/nig4JeJEgIAYG026k4oK9XvL87nBsWgZ7fyxr/XEGaoopXRSZGzK7Pdy1Kh9b045UInZgsVyYUM7GgNvVjZGcY+3Q3qM5h6XRyEcuCHBVXL6Cw4Gaz+VOH6VsblevtZ4ozEzEvj7a+8SjuedNn62tC/Tum2oLv/ZUd1TiJhKlH0r1lp9Qb6m5tNPn3A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(10070799003)(18002099003)(22082099003)(56012099006)(10067099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CXVQmodM6WYpcB9m43T0cMEms/WznYtNUS7iSsnu6DSRM05nZ8RL55SF3jxU?=
 =?us-ascii?Q?HPxcH0P335DjmqRRElL2ep5isGxeFOLrte2eoljC55RxzhPhG/VHW2ZJAHlD?=
 =?us-ascii?Q?PUZI/macFdX7bBhVKZaW5LgplSwFc0GDGxl7cYQFimXuTuqPAHdfE4W6xKbN?=
 =?us-ascii?Q?SmcFhYk1gD+ZZRE/fRkTPIXaBW03/Um0/NhxXghACfZas/I6q7hnSDnL2XG/?=
 =?us-ascii?Q?3qGIaPFWZT3HhwMz/Kwd/8isco3hZqqr4TrNY2QoFr5RnDCDgSQAzk4p4g3O?=
 =?us-ascii?Q?UZ8N6+WPQ0D/Gl6C7KdvKo0Dbz1o4+kxGDfXMuMs3icodZ7OvJCt21oFC8Sg?=
 =?us-ascii?Q?Bx6eUuQ+sfPuKmYPTLlNphmpz0mqdbl7gi0aqxkMaYW5naEXCw5RIqZ3Ad2E?=
 =?us-ascii?Q?cesPLrr5oEedPaDFWcrrVLFMhqHkiGYwjQSYolkEtgqWw4J8E+a2HJ7PF6K2?=
 =?us-ascii?Q?PT49ST4nNCjuxQuqOsgw4eyboVFLdKfpEbKHusumNBvq/kBOr7tvmkUkGtBs?=
 =?us-ascii?Q?pVKYbvCTqmoM6rrgKYdmi/TDQDGygvCOOfE6tKpdALZl3/9SbNYlSuch2Jdc?=
 =?us-ascii?Q?ioFmYn4mvrUCEguqWqOXK2KiW26HzI9d9yVy0pwHp77bmoq+PaJvShwySRhN?=
 =?us-ascii?Q?QE37qmJVUZ9+VO9GOaVlLlwN9wPLsIkbdV5XSEfGd/vjd4jCdzEiIrFnBGkN?=
 =?us-ascii?Q?CKyt2J443+V3s1lEdicJjYDqpOrngclg7s7Yi+IRMqbi6DSPiKwj/tM7lrZf?=
 =?us-ascii?Q?Rs4Y3/B6qDLd3EzkfLLGstrSgNQmErM775Ait18ZLxS8RmamLRT7k8MpjLAj?=
 =?us-ascii?Q?hXRxauNR6cJFDO7g8Fbgv47hDBNPU5RbWrZcgthFODXE/CwxCyu0q8aQzF+Z?=
 =?us-ascii?Q?vGgOFgs+gWpMkId1P9EK3kz4g9ZadPa0e7WKaL00FJALy0TUIAnyyviSNIrf?=
 =?us-ascii?Q?eb5D0dpcquT2X37GCW3lx60Lzyday0j0GWTll+vKdEYKmz2roJVZyTziDIK6?=
 =?us-ascii?Q?Mf/24j1jLrHcnYoDzSrbEEk/mvgBrjgLe9XFiPma2YHzUvBG/RK40Chpehyk?=
 =?us-ascii?Q?m2gmwb6obKxLCisi//N4dV5yyQpsLNrAMh/wbJ2WQ055z6QydKBIZc2LL1IC?=
 =?us-ascii?Q?D27XSqIxhKlIINuiVBVZpJ1emJpkjmEPE74fTx93s/pmz3bFGmTjn9jDrCSE?=
 =?us-ascii?Q?ctJlPXEyS6DpRsWUWhixmvrtysJETGpeVvV+OF5MakIjAGvIY4SRKbKAdnqr?=
 =?us-ascii?Q?DP49LeCadEUhSvNILNv3C3HhWYJxTTzBH8efJu8XSlH0paSF0VyMwBABHnD1?=
 =?us-ascii?Q?2Id2ah5SExw1UKdVVhqQqVs3EOMyrf0TH5ObVprX1LHbK3tKfLexAjoq56m8?=
 =?us-ascii?Q?UM95t5QUICk/k7Zsshr8/qHydQQokGPnQkzMx+qgR3jIUwTSM/pmrOu8+Zrk?=
 =?us-ascii?Q?2dl5cmW/DX0XeyVA5uAB//behJdek0PPJXE9I2RaL+4gPeUXkua66fDrzHBV?=
 =?us-ascii?Q?nhuYxNngbIIul0E7p2ZwWCQanpn9EufvtpUdNd15VP63Z5kOLwn/hFwtnw2f?=
 =?us-ascii?Q?FsmZdptyJ+F6wMgqLHgPcQE4pBnf/vjEEwop/a0oed2xK1H513HCd2iXICC2?=
 =?us-ascii?Q?jT4Alcs6x5ZfjmbKdjBCP2BnhBpWyAvT75Ox3H726/MaDXjR52ki5LtWLbG9?=
 =?us-ascii?Q?wtolXh4vds/HTJhIrqb0csNpAVmjlnKh+uCqJR0+qiwCQlJ6WF13OQAXHBfS?=
 =?us-ascii?Q?d3ODRiGkZj3U6DjC0Dgu9XKHmKmPgeJVWiGJPPl2FgFyxNPs9MMA?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d377e71-dabc-44eb-4071-08def88a6c02
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:57:33.4959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 77SjfmUAZm/f7l7VJ/Gn3OSJLUZqkrdcDdVXY7HeYn0jRykW4EHnk5qdmCJWGA15oVlRsY8HQBMQMKqMwUuqgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7115

A later change serializes status capture, interrupt clear, and event
recording against channel restart. It must also publish all causes
observed for a channel in that critical section through one callback.
Otherwise, the deferred worker can consume one cause before another from
the same status pass is recorded.

Replace the DONE and ABORT callback pair with one callback carrying an
event bitmap. For now, map the bitmap back to the existing deferred DONE
and ABORT work, so behavior remains unchanged.

Also split DONE handling into a lock-taking wrapper and a vc.lock-held
body. The later LL event path needs to validate its recorded event under
vc.lock before running the existing DONE state machine.

No functional change.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.c    | 44 ++++++++++++++++-----------
 drivers/dma/dw-edma/dw-edma-core.h    | 16 +++++++---
 drivers/dma/dw-edma/dw-edma-v0-core.c |  6 ++--
 drivers/dma/dw-edma/dw-hdma-v0-core.c |  6 ++--
 4 files changed, 44 insertions(+), 28 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index bbfd82b12ab5..97de0ad4489a 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -702,17 +702,16 @@ dw_edma_device_prep_interleaved_dma(struct dma_chan *dchan,
 	return dw_edma_device_transfer(&xfer, dw_edma_device_get_config(dchan, NULL));
 }
 
-static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
+/* Must be called with vc.lock held. */
+static void dw_edma_done_interrupt_locked(struct dw_edma_chan *chan)
 {
 	struct dw_edma_desc *desc;
 	struct virt_dma_desc *vd;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chan->vc.lock, flags);
-	if (chan->status == EDMA_ST_PAUSE) {
-		spin_unlock_irqrestore(&chan->vc.lock, flags);
+	lockdep_assert_held(&chan->vc.lock);
+
+	if (chan->status == EDMA_ST_PAUSE)
 		return;
-	}
 
 	switch (chan->request) {
 	case EDMA_REQ_NONE:
@@ -751,7 +750,14 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 		break;
 	}
 	dw_edma_core_ch_maybe_doorbell(chan);
+}
 
+static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&chan->vc.lock, flags);
+	dw_edma_done_interrupt_locked(chan);
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
 
@@ -793,20 +799,24 @@ static void dw_edma_irq_work(struct work_struct *work)
 }
 
 static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
-				   enum dw_edma_deferred_event event)
+				   unsigned int events)
 {
-	atomic_or(event, &chan->irq_pending);
+	atomic_or(events, &chan->irq_pending);
 	queue_work(chan->dw->wq, &chan->irq_work);
 }
 
-static void dw_edma_done_interrupt_deferred(struct dw_edma_chan *chan)
+static void dw_edma_record_irq(struct dw_edma_chan *chan, unsigned int events)
 {
-	dw_edma_queue_irq_work(chan, DW_EDMA_DEFERRED_DONE);
-}
+	unsigned int pending = 0;
 
-static void dw_edma_abort_interrupt_deferred(struct dw_edma_chan *chan)
-{
-	dw_edma_queue_irq_work(chan, DW_EDMA_DEFERRED_ABORT);
+	if (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_PROGRESS |
+		      DW_EDMA_IRQ_STOP))
+		pending |= DW_EDMA_DEFERRED_DONE;
+	if (events & DW_EDMA_IRQ_ABORT)
+		pending |= DW_EDMA_DEFERRED_ABORT;
+
+	if (pending)
+		dw_edma_queue_irq_work(chan, pending);
 }
 
 static void dw_edma_emul_irq_ack(struct irq_data *d)
@@ -907,8 +917,7 @@ static inline irqreturn_t dw_edma_interrupt_write_inner(int irq, void *data)
 	struct dw_edma_irq *dw_irq = data;
 
 	return dw_edma_core_handle_int(dw_irq, EDMA_DIR_WRITE,
-				       dw_edma_done_interrupt_deferred,
-				       dw_edma_abort_interrupt_deferred);
+				       dw_edma_record_irq);
 }
 
 static inline irqreturn_t dw_edma_interrupt_read_inner(int irq, void *data)
@@ -916,8 +925,7 @@ static inline irqreturn_t dw_edma_interrupt_read_inner(int irq, void *data)
 	struct dw_edma_irq *dw_irq = data;
 
 	return dw_edma_core_handle_int(dw_irq, EDMA_DIR_READ,
-				       dw_edma_done_interrupt_deferred,
-				       dw_edma_abort_interrupt_deferred);
+				       dw_edma_record_irq);
 }
 
 static inline irqreturn_t dw_edma_interrupt_write(int irq, void *data)
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index 8d993e8cccbb..30b508eb3e3d 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -41,6 +41,13 @@ enum dw_edma_xfer_type {
 	EDMA_XFER_INTERLEAVED
 };
 
+enum dw_edma_irq_event {
+	DW_EDMA_IRQ_DONE	= BIT(0),
+	DW_EDMA_IRQ_PROGRESS	= BIT(1),
+	DW_EDMA_IRQ_STOP	= BIT(2),
+	DW_EDMA_IRQ_ABORT	= BIT(3),
+};
+
 struct dw_edma_chan;
 struct dw_edma_chunk;
 
@@ -147,7 +154,8 @@ struct dw_edma {
 	const struct dw_edma_core_ops	*core;
 };
 
-typedef void (*dw_edma_handler_t)(struct dw_edma_chan *);
+typedef void (*dw_edma_handler_t)(struct dw_edma_chan *chan,
+				  unsigned int events);
 
 struct dw_edma_core_ops {
 	void (*off)(struct dw_edma *dw);
@@ -156,7 +164,7 @@ struct dw_edma_core_ops {
 	u16 (*ch_count)(struct dw_edma *dw, enum dw_edma_dir dir);
 	enum dma_status (*ch_status)(struct dw_edma_chan *chan);
 	irqreturn_t (*handle_int)(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
-				  dw_edma_handler_t done, dw_edma_handler_t abort);
+				  dw_edma_handler_t handler);
 	void (*non_ll_start)(struct dw_edma_chan *chan, struct dw_edma_burst *child);
 	void (*ll_data)(struct dw_edma_chan *chan, struct dw_edma_burst *burst,
 			u32 idx, bool cb, bool irq);
@@ -256,9 +264,9 @@ enum dma_status dw_edma_core_ch_status(struct dw_edma_chan *chan)
 
 static inline irqreturn_t
 dw_edma_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
-			dw_edma_handler_t done, dw_edma_handler_t abort)
+			dw_edma_handler_t handler)
 {
-	return dw_irq->dw->core->handle_int(dw_irq, dir, done, abort);
+	return dw_irq->dw->core->handle_int(dw_irq, dir, handler);
 }
 
 static inline
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index 9053354eda67..4a1bb128fa00 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -336,7 +336,7 @@ static void dw_edma_v0_core_clear_abort_int(struct dw_edma_chan *chan)
 
 static irqreturn_t
 dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
-			   dw_edma_handler_t done, dw_edma_handler_t abort)
+			   dw_edma_handler_t handler)
 {
 	struct dw_edma *dw = dw_irq->dw;
 	unsigned long total, pos, val;
@@ -375,7 +375,7 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 			continue;
 
 		dw_edma_v0_core_clear_done_int(chan);
-		done(chan);
+		handler(chan, DW_EDMA_IRQ_DONE);
 
 		ret = IRQ_HANDLED;
 	}
@@ -389,7 +389,7 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 			continue;
 
 		dw_edma_v0_core_clear_abort_int(chan);
-		abort(chan);
+		handler(chan, DW_EDMA_IRQ_ABORT);
 
 		ret = IRQ_HANDLED;
 	}
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index 4acbace43519..c6d7f9885aa8 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -174,7 +174,7 @@ static u32 dw_hdma_v0_core_status_int(struct dw_edma_chan *chan)
 
 static irqreturn_t
 dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
-			   dw_edma_handler_t done, dw_edma_handler_t abort)
+			   dw_edma_handler_t handler)
 {
 	struct dw_edma *dw = dw_irq->dw;
 	unsigned long total, pos, val;
@@ -200,14 +200,14 @@ dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 		val = dw_hdma_v0_core_status_int(chan);
 		if (FIELD_GET(HDMA_V0_STOP_INT_MASK, val)) {
 			dw_hdma_v0_core_clear_done_int(chan);
-			done(chan);
+			handler(chan, DW_EDMA_IRQ_STOP);
 
 			ret = IRQ_HANDLED;
 		}
 
 		if (FIELD_GET(HDMA_V0_ABORT_INT_MASK, val)) {
 			dw_hdma_v0_core_clear_abort_int(chan);
-			abort(chan);
+			handler(chan, DW_EDMA_IRQ_ABORT);
 
 			ret = IRQ_HANDLED;
 		}
-- 
2.51.0

