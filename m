Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021086.outbound.protection.outlook.com [40.107.74.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C690537EFFD;
	Fri, 17 Jul 2026 18:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784311612; cv=fail; b=CpzjvotaLB/ooQWpz7WKM28IkpMCSfKU59TM3Q7/cWwvLCjmQThCyO/KWWEznYu2CVD5lp7OfwyogHfnVCdeArgleAsMAWJe4Xo8p1d9lPn0iBSOHP2eUvEUw5OAIOLTbbI7Vu0bjGkDDqaRyVLyJiEAulKK/8QQvlTiN+2G3js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784311612; c=relaxed/simple;
	bh=pEAoeRJSAMC5mBijVLQW+wcoxnkVB1cEELrlhCOXxXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=shAHJXQi6D6wpa9WRYUkUoXKQ+ZwXBEHbF6+gmBogLAsqTQxS7ys0oALh4qlh4+Vjtd+GWfVX5Qiayr8d1h87AyeE1zNyB12mNbIM/me4PuFOsPK+z4k/HcotLe0xIDL5gRl9PStsqxokV7OGEjgeiHJu7OAWimWSmeQaQilg4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=eJ+NiSuJ; arc=fail smtp.client-ip=40.107.74.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="eJ+NiSuJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NMNPfUnMPjn5IQKAVC53xk4qq4X5OirkFjvGr2HtUMdFc+8eToA94NzA88BA6Eb+NlmMM5BUjFPaHjsgF89ijq28jYmgIiKhVg8zVpyy8SM23qiSCfNarS8Lft1mPFQOZrEkw1RHTrOKAJi2Z/1/MACiqQc4ICyAtrKqVS2yI+XzPDEFjpIZ867GAu+S5r65RaICbtUGbGm9TCnQld0Y9tCLl7z83r+1KhqHWnjntDSwDKS8jc0d3cgL35n70TpaXf6dpO6cMzNuVUBABtsA6hK64o2XPTGh5gcYlvpm+kzFzQvQUb1YEe//7zmyHEjpYwJ9fTme9Gjl0s4k9kc+Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+KJMUv7RAXO1HDk7pnbQzfGeGpkzGgFTSpiJ12xPtc=;
 b=wPJEU8/eu4LJOIR5M+9LvpWdQUV7irzRlArIkRR3OMuDriD3i9aT5v/QOCDY9Uq5UYHxt7Z+em81J3rTyWPE3aBkmqD1up2NsVJPWAb+fJiQaTdd7pqMPQkLUfFkqbdhJ8o+UwzyXepQ55wDDaNsKASiqT79Oltd4zhDRSOrtz1Zs1t3xvNRqj44OyO5X/mJ6D4j1Cn7840GQ1TY+Rc7hoaAvj2pwL8qrVODZMTViaCphSCvXBFPnWvijUYrPhaB+1fxwzggYPbBE06q4trhjq/FDCNnxnmkQKnDQLfMCtzEnFXgY3GtS4qIWhmCmNXlOyOVaDsNtj1DD45ZpnSPJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+KJMUv7RAXO1HDk7pnbQzfGeGpkzGgFTSpiJ12xPtc=;
 b=eJ+NiSuJgPAdl2eeV+VgsuUD7yjfSL6zUE9J74SSlwXEq3aiby7FIuuHHsA1QzbPFpesIBalVp+27mFbpnSzWi9VVwxJA9iMwIA9fXaqVbpvQhYwPJ4zXa10qwcQMbgbid6vztf9TIGHoIWwv61RViuyZcJpbrutPGUlgc4a1cU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY7P286MB6260.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:327::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Fri, 17 Jul
 2026 18:06:44 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Fri, 17 Jul 2026
 18:06:44 +0000
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
Subject: [PATCH v5 2/9] dmaengine: dw-edma: Terminate all descriptors without callbacks
Date: Sat, 18 Jul 2026 03:06:32 +0900
Message-ID: <20260717180639.2643243-3-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717180639.2643243-1-den@valinux.co.jp>
References: <20260717180639.2643243-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0123.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::11) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY7P286MB6260:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b4f6a99-008b-451a-12c5-08dee42e2921
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|10070799003|366016|376014|10067099003|18002099003|22082099003|56012099006|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info:
	/TzRupiKDNTJpqZgKlMOulFLzbGl32PYHajjn2cMF5EhcI0vqdUznu3IG5nfnQ/2lVWhkrPvdoY0j0kq8nHNkZszHQx0/UrRCjCmPan5Kr/QWBJMjLit3QTQ+h3CKSaD2DvCZssHXzkZxjhKPWf32v3ShafmDWY3s+0OE0qz1Gl8c13w1hy2lxo8I5GLwJp+iuoS6L9neGzzXGvYr+W1I3osg2PMoW03w6LtNPPNSZwUiiFT6NqxEU+q79gOSNYZibhw1KVkFI1sA8rM73pojGtU604O7LEToqx0sIZnjo4We3VDVFT0BjkQHP5WGtjS3WVv8uCrkag6lqAjKl8JIYld/mFT1eEaFA697DrYFcVZwPZFtSJbYHZC6eCuVTllTgfhhT8xsBVPIj4vpQ7CqwY6IOHFGNNx+kGuIJ9ouR1zledUmd4DPT6sz6nrVfYcxMJxbHrBtq9FQVyCyFfwNBAfJ6XWNVOpwieLUnTNmj8Kx30WHB2IFXXA8si6KKv5eXm+TGFUNDLD/19axgknjjy5BbkIV7sLdQFrmMEzmmEjzQtfbgBnONlJvgr3bu3yPF0Y3+SkPRmukz5N58lks6eZ7MAGJVrM030eonqD4fgnLuB1KY3nxi8rbvpvbfzrf6ZiO4tVgqvsnn+B2UC6PIMgbM4a0YRF5DyrMpMPgl8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(366016)(376014)(10067099003)(18002099003)(22082099003)(56012099006)(5023799004)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PHOZLlFsma7hsFKvE/JE8bH5+evApWo5rARWtd8Mq22WCgRqNkWPYzvFAPb4?=
 =?us-ascii?Q?Xkbyx9F3TT3HRbqTLR5N2BRKH1AC5tCiPVzZMuHMoxlqLhqkY/lNai1dMR4K?=
 =?us-ascii?Q?6DVP1/b+kFR79oiB0lOO99mwxgDADZyDIqJzFdJvE2bWDz8QGS07jE41aMaX?=
 =?us-ascii?Q?HZYso+Q/oGyWjFBzflxrtrtK/JA+d5l8Nc7wZg4wVOPPToS49f54P+rii+87?=
 =?us-ascii?Q?b9MRA/r4w2ui62wufX1tXWJlPMPxBZdisvXNVgJFF2x5rA6OtBhtqPub99PM?=
 =?us-ascii?Q?BuhP/yrE9KTyvGZxODW5W3HzDpRoJrYMsZC0HK45h53w8qB6mN0/AfJEaNCq?=
 =?us-ascii?Q?9qHPNQOhMi2tjvISOhtDBRuMvxgiO28Frgvsm9/hCQou10giOEN1ile+V3oN?=
 =?us-ascii?Q?Sl+ekOQUTFhagXRRW6279smGK1tIWVNnF0MH+0YICWYg7ir2j5S7VGPtquWj?=
 =?us-ascii?Q?gYEroAwI8MIMvFzJzipHsoXKiF/9o1l9zYqRGOUVCE3rhvQ+eZfgqHJ8X3nC?=
 =?us-ascii?Q?N0ncTIc2IokHypFGIaOwNoL0ZRYyVAm4kl0IzdtFiYf3bYyuVeMpKkmqsZlA?=
 =?us-ascii?Q?dAjVvnzwLpe8Z3IH3Qd6xIRBz23HovcWVRlbLSMyDZnTykmTleCKVxT/byuH?=
 =?us-ascii?Q?GmvGgM8Xl69hq6/LDzqK4ZBCCFLPxlAoa4FFNZAAf/oGRFBgRf41hmiefRll?=
 =?us-ascii?Q?CmEmre+xhCOfsyRjsdOE+6MQBb9mFHgcxMY2G6a6untp6RPa6SBA3Akt+t/J?=
 =?us-ascii?Q?fxG0UcQ/wQbov7eqV8z9o3W5gPB+TLF9Mai6Q0vZShIPkSmcribQfeuSuefF?=
 =?us-ascii?Q?w8Cbaj5SUTOWDOCWjiMRHWlw507hW47BhFORLm2gcV3zQPRTTJsmfSVQi8pv?=
 =?us-ascii?Q?k8cqOd79nwQhBgx2VaRQM3Q5hNCBYArGOr7r+/JMuYCjU9Wvl/9IO/e/bwbp?=
 =?us-ascii?Q?QO/kWIPawWSTM/mZ2It2t1Rt12C+6Xamb73tWNIWg26Ahvt70CA1uLOeyhAh?=
 =?us-ascii?Q?VyNJhlfSGmne/wBqrTTddxSoxyOd73QZ4xUaE2wkkhgGLfpCH/5rlDDM9JF7?=
 =?us-ascii?Q?EHPO31843BKpvJQ9apnBgwBuwX5TrL3Du6Zf7gS80wMzhEncmpSqkP3erKxA?=
 =?us-ascii?Q?Obpv0GSY9MAYKSqG6S3+LkSI8UYMMty4uJTj3NzLvcvziw+p9sYUvyTFuJ4D?=
 =?us-ascii?Q?3bBYafmVCTk5pGJnY76FMAYabNfy/VJFFbwXtHcu9yZnEorcWO+UCdZzYwPs?=
 =?us-ascii?Q?7mAnpEwDpbDqgPiSE4UyMd+/WYG6WKnRAiA1a444gb/dSbEGArWlv0l2KQDa?=
 =?us-ascii?Q?hbmeqTLAYxntRG8SSrt9t3CZxfagM60riv86ZrOxOA0LoTo/o2xLqjpgJW+4?=
 =?us-ascii?Q?KgSeSkNi6b7je0gnJp9YMgwA18EKkiaRfq1evm8uSOctBwHdD8zqHD2OwB3r?=
 =?us-ascii?Q?vFdZwcWksU89dWTPE9fNxAcXxeHPO1y4IU4VY5R/KiPXzLMmPlh4T9pMIv+f?=
 =?us-ascii?Q?tz0oEC1qjVGK6fEW+grdEw8wSsmcVHmNlIqKbbo5QiBSrbcDloVLdQImAAir?=
 =?us-ascii?Q?rkURTurKbrUbk57KJMm/um946wOaP+MAYA3BIy+qVa6fCyVdyBmdAGuuO5bN?=
 =?us-ascii?Q?2LSCKerbO+zdpsHO6Wkm+oIhxs0CDDvTWkxxeL/5bTjmEjmp3sOheNzF0d+t?=
 =?us-ascii?Q?hgA88cleMcsrC313NK+ozBBgdWDZ2alk4mbjVwMNxErh3FmYO7eQTt3H0cGU?=
 =?us-ascii?Q?3PuuMOChwc5swdv9sZjS9/Nt0BNx/SspWw2PdP/6afcX5g+QCEsM?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b4f6a99-008b-451a-12c5-08dee42e2921
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 18:06:44.3366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFaBk9tdr3mnMO8yukxBEwDGctW0KgkHZ13jn5s2p4zrXV0Z2C/q65AP8D2Dvc6wdlktnwGGF6XwZbaTf7rdlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6260

The DMA Engine client documentation says in the "Terminate APIs" section
of Documentation/driver-api/dmaengine/client.rst:

"No callback functions will be called for any incomplete transfers."

dw-edma instead calls vchan_cookie_complete() when a deferred STOP reaches
the interrupt handler. This schedules a callback for the active descriptor
and leaves other issued or submitted descriptors queued. A late callback
after dmaengine_terminate_sync() can dereference client state that has
already been freed, while leftover descriptors may later restart into
reused buffers or leak.

Move all issued and submitted descriptors to the terminated list whenever
termination completes. For a pending STOP, do this from both the DONE and
ABORT paths. Complete their cookies in order without scheduling callbacks.

A STOP can remain pending until the running transfer raises an
interrupt. Make device_synchronize() wait for such a pending STOP to
complete before releasing terminated descriptors. Reuse it from
free_chan_resources(), then release the remaining virt-dma resources.
Sleep instead of busy-polling while waiting, and warn if the existing
timeout expires.

Fixes: e63d79d1ffcd ("dmaengine: Add Synopsys eDMA IP core driver")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - Add Frank's Reviewed-by tag.

 drivers/dma/dw-edma/dw-edma-core.c | 90 +++++++++++++++++++++++++-----
 1 file changed, 76 insertions(+), 14 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 384c482058d1..8b094857f821 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/kernel.h>
 #include <linux/dmaengine.h>
@@ -115,6 +116,35 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
 	return 1;
 }
 
+static void dw_edma_terminate_vdesc(struct virt_dma_desc *vd)
+{
+	list_del(&vd->node);
+	dma_cookie_complete(&vd->tx);
+	vchan_terminate_vdesc(vd);
+}
+
+static void dw_edma_terminate_vdesc_list(struct list_head *head)
+{
+	struct virt_dma_desc *vd, *_vd;
+
+	list_for_each_entry_safe(vd, _vd, head, node)
+		dw_edma_terminate_vdesc(vd);
+}
+
+/* Must be called with vc.lock held. */
+static void dw_edma_terminate_all_descs(struct dw_edma_chan *chan)
+{
+	/*
+	 * This order must not be reversed. Cookies are assigned when
+	 * descriptors are submitted, so desc_issued contains older cookies
+	 * than desc_submitted. Completing desc_submitted first could move
+	 * chan->vc.chan.completed_cookie backwards when desc_issued is
+	 * terminated afterwards.
+	 */
+	dw_edma_terminate_vdesc_list(&chan->vc.desc_issued);
+	dw_edma_terminate_vdesc_list(&chan->vc.desc_submitted);
+}
+
 static void dw_edma_device_caps(struct dma_chan *dchan,
 				struct dma_slave_caps *caps)
 {
@@ -236,20 +266,22 @@ static int dw_edma_device_terminate_all(struct dma_chan *dchan)
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
 	int err = 0;
 
+	guard(spinlock_irqsave)(&chan->vc.lock);
+
 	if (!chan->configured) {
-		/* Do nothing */
+		dw_edma_terminate_all_descs(chan);
 	} else if (chan->status == EDMA_ST_PAUSE) {
+		dw_edma_terminate_all_descs(chan);
 		chan->status = EDMA_ST_IDLE;
-		chan->configured = false;
 	} else if (chan->status == EDMA_ST_IDLE) {
-		chan->configured = false;
+		dw_edma_terminate_all_descs(chan);
 	} else if (dw_edma_core_ch_status(chan) == DMA_COMPLETE) {
 		/*
 		 * The channel is in a false BUSY state, probably didn't
 		 * receive or lost an interrupt
 		 */
+		dw_edma_terminate_all_descs(chan);
 		chan->status = EDMA_ST_IDLE;
-		chan->configured = false;
 	} else if (chan->request > EDMA_REQ_PAUSE) {
 		err = -EPERM;
 	} else {
@@ -587,8 +619,7 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 			break;
 
 		case EDMA_REQ_STOP:
-			list_del(&vd->node);
-			vchan_cookie_complete(vd);
+			dw_edma_terminate_all_descs(chan);
 			chan->request = EDMA_REQ_NONE;
 			chan->status = EDMA_ST_IDLE;
 			break;
@@ -612,7 +643,9 @@ static void dw_edma_abort_interrupt(struct dw_edma_chan *chan)
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
 	vd = vchan_next_desc(&chan->vc);
-	if (vd) {
+	if (vd && chan->request == EDMA_REQ_STOP) {
+		dw_edma_terminate_all_descs(chan);
+	} else if (vd) {
 		dw_hdma_set_callback_result(vd, DMA_TRANS_ABORTED);
 		list_del(&vd->node);
 		vchan_cookie_complete(vd);
@@ -770,21 +803,49 @@ static int dw_edma_alloc_chan_resources(struct dma_chan *dchan)
 	return 0;
 }
 
-static void dw_edma_free_chan_resources(struct dma_chan *dchan)
+static void dw_edma_wait_termination(struct dma_chan *dchan)
 {
+	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
 	unsigned long timeout = jiffies + msecs_to_jiffies(5000);
-	int ret;
+	bool stopping;
 
+	/*
+	 * A STOP may be deferred to a later interrupt while the channel is still
+	 * running. Wait until that handler completes the termination.
+	 */
 	while (time_before(jiffies, timeout)) {
-		ret = dw_edma_device_terminate_all(dchan);
-		if (!ret)
-			break;
+		scoped_guard(spinlock_irqsave, &chan->vc.lock)
+			stopping = chan->request == EDMA_REQ_STOP;
 
-		if (time_after_eq(jiffies, timeout))
+		if (!stopping)
 			return;
 
-		cpu_relax();
+		fsleep(1000);
 	}
+
+	dev_warn(chan->dw->chip->dev,
+		 "timeout waiting for channel termination\n");
+}
+
+static void dw_edma_device_synchronize(struct dma_chan *dchan)
+{
+	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
+
+	dw_edma_wait_termination(dchan);
+	vchan_synchronize(&chan->vc);
+}
+
+static void dw_edma_free_chan_resources(struct dma_chan *dchan)
+{
+	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
+
+	dw_edma_device_terminate_all(dchan);
+	dw_edma_device_synchronize(dchan);
+
+	scoped_guard(spinlock_irqsave, &chan->vc.lock)
+		chan->configured = false;
+
+	vchan_free_chan_resources(&chan->vc);
 }
 
 static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
@@ -883,6 +944,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 	dma->device_pause = dw_edma_device_pause;
 	dma->device_resume = dw_edma_device_resume;
 	dma->device_terminate_all = dw_edma_device_terminate_all;
+	dma->device_synchronize = dw_edma_device_synchronize;
 	dma->device_issue_pending = dw_edma_device_issue_pending;
 	dma->device_tx_status = dw_edma_device_tx_status;
 	dma->device_prep_config_sg = dw_edma_device_prep_config_sg;
-- 
2.51.0

