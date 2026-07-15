Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021099.outbound.protection.outlook.com [40.107.74.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D9B281525;
	Wed, 15 Jul 2026 17:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784138272; cv=fail; b=WBDk/punHs/cMAFayCFXwhETICRQv4Abc1N89aYY94SPYwinXnxY2CFeNImmP+QJ7om22yYzsdXFuXhuxwUjCNDBtRE/lmIgpg1V/R3O5lqSV8WBq/f2NlkattBsL2DO7QALwVO4fbc44t4pfdI6uN5MponVOFckZxf3A7l/prM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784138272; c=relaxed/simple;
	bh=shdSGqf60C57fCP+09N7s8tuRh52tbVHH5pJnV/iXu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aDDQ2Bw/TkcCBTheotKYSEm9a5Dg/LkOlEtvFwmG+/OxoE8i3Yzt561c059UCdrWj+IUTdCYid2pEufa13+kWK5KFXV5XC0ip10QrSQh+McCAii1vdPxVwvCgp1YQuWXcjs6mkASSlAL7B9MueBHKHelKC59tr3CyRpbVR/E4fk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=a5+zhP7v; arc=fail smtp.client-ip=40.107.74.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="a5+zhP7v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LCLyZm9DZWMDCZqomk2TVboqyMEd62fAL343eONiVjqN2Z6dFDex2YzMugazneHr4pGWyR/3MiGmM8S6Ba1XqzDXX9kQenqgalzCL6i09rjM2JrbHjB3XzyboepAxWSJCFVCT3pc7xbFVr7ogbcK5AQbEeHTglfpONKKqLN7Vkr/A2jI8QOMXftnOI84aBlIztqIqQ5tC+v23mshMeWbtF8JEd+jqbA5uUkPio8QupdsgE2+DrM4nfTsJdI8j9mUcFoBZP3tfnijm4tneTbxmSpdBb2C1gcXyjwUaUeJGKmgy2NCc0/0dpQl7Y2cy1fLeChzOQv/Cjg0eC8zO60UXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXKtvh9b8PaU6FDXrqOPqlzeB4ztsLUpiBIUCN5TyYo=;
 b=kxp2pEkSfrUYk5mBJ+IHrEnUiDnqoi2pqwxsMHuya+ZAEj42VrHSqR9dGNGunx2iOqrDgqErKbNylET7mwH9hJXQmWGn4Dy9fLnpnxtU/12O3gBxE1F16xnuJw8yzy1s+0FPtpUP/VTI+WBYEgfiu8G3jMEXXKo8YvSoYYjc4Ze5NnCcb+D5NH9+JYZ9Iirm5eYMwK0fmEMugI5hAV8DU2EY0+HHZdU4shn4Q9LCQYr9E5z7QCD5sEezaV1rL4CNaVd/lbbYyU33BTAexbhULjPpiwRqtoCybH12vRkvXFTitE1MSvU5p/wEPegH+hcsZdmMsHFCzioMZWyrWNfcMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXKtvh9b8PaU6FDXrqOPqlzeB4ztsLUpiBIUCN5TyYo=;
 b=a5+zhP7vv2YSjpufq0UqDNiRYu6n8uwmOx0c7pudJFa694d/j6NnEHM5io1M4TkyYjFF3d5QocaB7AapAYPvG4ZvBnq6SSt/swlkrsyI+4q/tjCaLxKxo95kD1QM0ZkJJbXrCe73ifUa5XHRAe1PddwdUOaQMVEo5HIhG99i6qU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB4406.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:110::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 17:57:44 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 17:57:44 +0000
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
Subject: [PATCH v3 2/9] dmaengine: dw-edma: Terminate all descriptors without callbacks
Date: Thu, 16 Jul 2026 02:57:33 +0900
Message-ID: <20260715175740.1110404-3-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260715175740.1110404-1-den@valinux.co.jp>
References: <20260715175740.1110404-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::8) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB4406:EE_
X-MS-Office365-Filtering-Correlation-Id: 95071a98-c2e7-449b-7092-08dee29a92ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|23010399003|6133799003|5023799004|56012099006|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HqYPYrSsIL9YfYbC1coPfDFKU27JOeKEDsAb1n8VadQs0fGhgIcWhoPgXCmXSjSamWoDB/5aN6HhD3u7ADABolu8Oykh3XRB3lIzugDOxEmFZiG3w1AT9B3H9aFgSzSxyzcqllPt4VxluJX4M/7r+xnVSANcrIFF6qiCR9u4gvLwck0u3+8rSHDV5W1v3HHuU3pAYZAESFdAvLsfgZ2Q8anFS5pjPI0cHAjVrFbiNT29+ETrP3pfRGHyrbo3+RArKZtQMDaVp3SzD9mrFUSJtX1JiArUXa0n9NNmG10C/GXkYASsIgcw01AS7yb8vy7kvg+lyJLETmHtgAR2Ujcfa/+YWQuZ0ACsFCwCAZnQmj0rbwwN/2m9u6t1+UgdSMNU9PtK9+Iz8rQPjewlkDxronwSNS/gzUgiZ22Pgq5ecK15A82cbslyi2fkgqntdlYdErrzP8BupelgmKn7nGVB7AU7DOFvdPPSVs9dGPqhIfkPtEpq8hjzPlsOfVVvEyULzZiKhnjQhFJdeiDxrTqwTX9c+Sr+bd2c5qObAQdU4sNBno+dQak/KhxfT21ccxYouAKrQfiT7ahUXvvsTppES0QRXsouS/WXvbXKOXe1LvmaMaqvSb8PmLiRQttEy1C/VqIfJsNbACTWDeu2luMcQoz5Ue/4CfadJQ1bVcJ8QXI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(23010399003)(6133799003)(5023799004)(56012099006)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1Q8mySqFjlOGpMy2INTc3dUMChxf2ffy7EgCkKBMbIPxfaVlGdLTsNVH7uHS?=
 =?us-ascii?Q?U6SYkLi8c5rSyc79fzMcX/IcmfSHMs+GjO1LN4EvNA/yWRfcegN/fnRqe0oP?=
 =?us-ascii?Q?Cvd4Gvst5jyaC4EYsrUfbAwGjn7gUFweTHPNc+O5U+84FZ3FcDppLXMuAy4d?=
 =?us-ascii?Q?P/36Ef1Z1i7e5JTp5e9b9Te2PvFNAZdHqnWpHm4crlk7h1DEJjjZqHXUYax+?=
 =?us-ascii?Q?7HYo9ujpau9AwyR8Uu5QmkEsFabKHbXW0PrdL4hETzUgOdRFdDXbwNzy2e06?=
 =?us-ascii?Q?grCpZuUlsWJdcY7bTaeIRF8gtrG47zsLziPh45ykRgci4oIdlT45K+7QRO9h?=
 =?us-ascii?Q?xfH8POUAlYmdfnfX/1pCKywQN8q84SfA4H25fGZ1n+B4qXN/xw97W8uRCN6u?=
 =?us-ascii?Q?H45/fBVtthgTud/aBsCcKydPRPj0h9IT0DAbC0nFRf2llvQTItKdMEXoSuUE?=
 =?us-ascii?Q?dixGr3gCEpnZrFdCLeLunY3gXg3FNFFW8qy6Oqsko2fWUNuFnX9haVaBE2yh?=
 =?us-ascii?Q?CWfVnZDDqxsJK25HQSAWEFQicpZ8dU7z09fRX+nAbKAwfbMC1t99q7DnqtbM?=
 =?us-ascii?Q?J6iwSG4BzardBj9R4HfNIeHOlOMbFeJ2mRC9t0ayrS3C/8tYFzncp4peFUTK?=
 =?us-ascii?Q?uFG5xdTZdNt0ivJk0N4dSM9Bof4kikn2WiF3OCo1vX1C8wALI+qcVxUgbSUa?=
 =?us-ascii?Q?qQ5/imobWmcUaIuUQ5jCq4W8dbtnG3LVI67R0ntQHyP8MlCZy0O2gmaIC0YO?=
 =?us-ascii?Q?Qo4STjQDZbpNh4EvYQK1xlaJ+SXH0i6n2hsWDWqHR0+/QjaMg/yyMdCGUedH?=
 =?us-ascii?Q?7m+MTAohy/7PTAk7S783F3xm9r1fHsl8zY1dICA/HLr08cl4Wttxw1HW7NyT?=
 =?us-ascii?Q?GKsrC5aMcFk7niazp3eJX7Te/2xzOVA8h8jYOjNv1f1tQHmzgl8poFo6tKxI?=
 =?us-ascii?Q?OP36PGd3Q0uRsyf1W2W8tKka4Q1qyYlFshhwbkTQMgCRzHA+fZrwIvw7Oofd?=
 =?us-ascii?Q?33X5+HDm1Haa6uYU8amki/cBIRsRvx5tTH95D1miCzzz9mKJ6hXronLF8HCE?=
 =?us-ascii?Q?25tWCO1/x4Cezhxr55cUeJw8eFzHBkl+CI9vSmn9MyeGLrcIFEeF+NjspiMq?=
 =?us-ascii?Q?SowcdCOUhhSgZIER66dkLMq0d5lmUPzQvY8jZUxdoAAAkFaymleZMBW4MfaU?=
 =?us-ascii?Q?zPxJh6avYufdN9S4ZLVJoOHcJXW+wvtPtJsblZR2xBTPyNE2zdILJ1TTPmka?=
 =?us-ascii?Q?7Vz1piG77pKWaC0fgj1lvylx0jaDb+KA+OKU53eJDdd/gwu16QK+yBi3JkCm?=
 =?us-ascii?Q?8pa9y5ltttSkMa9oWzfnxSWNLvMuZ6OIp52ElpVODQQcnLZhsBeHxDA8A5SJ?=
 =?us-ascii?Q?bxryfy3NrBjv2dGpa+5jLrCV0gy0/2qlmCzCj0l37MV7gBci0pU5DkcbS6hc?=
 =?us-ascii?Q?sSw7eHyI0UgSnwwBrE9Hl8HyFxYzUPxv2KRMgXz8P9cmECVXA5RbD1l3LCW7?=
 =?us-ascii?Q?OG4ionsMQZclDDQ+sWSSjMMlgaOhc/fpd0nEEk0BTtoP9wlqTT1N2oO7XktA?=
 =?us-ascii?Q?m+fBeCVI2qGDWEvTZC28jFFzqgjwq0rAlDuZSsppMc82usojOKZ/XW7qPgQb?=
 =?us-ascii?Q?uU/IdLxjY5pEcPwvCIRQO/HqT+ZE/p6Aj8sJ2mv+vy0DcSdg6o5qdHq7Cioj?=
 =?us-ascii?Q?ZpAOjSzu1mKR/Hiy3E8wCqhUQFseNNZ71VZB5o8K/oWRrVFSqKP1+z0mHtRS?=
 =?us-ascii?Q?rNP7d3WIJZ9fHLkG2yAokKQxI+qlBToBax5WhRj5+eONlOMRxfWt?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 95071a98-c2e7-449b-7092-08dee29a92ad
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 17:57:44.7369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S8N9vYv2jOt/7dOpEamGQb1RKL7i520UB2pq1jVxLMbf4mHd9cbXc0AmsaEywGDQHd9Yons6EjNa+Q0FkVYOJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4406

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

A STOP can remain pending until the running transfer raises an interrupt.
Make device_synchronize() wait until the channel has stopped and
terminate_all() deconfigures it before releasing terminated descriptors.
Reuse it from free_chan_resources(), then release the remaining virt-dma
resources. Sleep instead of busy-polling while waiting, and warn if the
existing timeout expires.

Fixes: e63d79d1ffcd ("dmaengine: Add Synopsys eDMA IP core driver")
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - Merge the descriptor cleanup patch so device_synchronize() is safe
    when introduced. (Sashiko)
  - Handle pending STOP requests from the ABORT path as well.
  - Drop a redundant cond_resched() after usleep_range().
  - Drop Frank's Reviewed-by tag due to these changes.
  - Polish a source comment.

 drivers/dma/dw-edma/dw-edma-core.c | 87 ++++++++++++++++++++++++++----
 1 file changed, 76 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 89a4c498a17b..44ef5fbe3fd4 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/kernel.h>
 #include <linux/dmaengine.h>
@@ -201,6 +202,35 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
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
@@ -306,20 +336,25 @@ static int dw_edma_device_resume(struct dma_chan *dchan)
 static int dw_edma_device_terminate_all(struct dma_chan *dchan)
 {
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
+	unsigned long flags;
 	int err = 0;
 
+	spin_lock_irqsave(&chan->vc.lock, flags);
 	if (!chan->configured) {
-		/* Do nothing */
+		dw_edma_terminate_all_descs(chan);
 	} else if (chan->status == EDMA_ST_PAUSE) {
+		dw_edma_terminate_all_descs(chan);
 		chan->status = EDMA_ST_IDLE;
 		chan->configured = false;
 	} else if (chan->status == EDMA_ST_IDLE) {
+		dw_edma_terminate_all_descs(chan);
 		chan->configured = false;
 	} else if (dw_edma_core_ch_status(chan) == DMA_COMPLETE) {
 		/*
 		 * The channel is in a false BUSY state, probably didn't
 		 * receive or lost an interrupt
 		 */
+		dw_edma_terminate_all_descs(chan);
 		chan->status = EDMA_ST_IDLE;
 		chan->configured = false;
 	} else if (chan->request > EDMA_REQ_PAUSE) {
@@ -327,6 +362,7 @@ static int dw_edma_device_terminate_all(struct dma_chan *dchan)
 	} else {
 		chan->request = EDMA_REQ_STOP;
 	}
+	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
 	return err;
 }
@@ -673,8 +709,7 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 			break;
 
 		case EDMA_REQ_STOP:
-			list_del(&vd->node);
-			vchan_cookie_complete(vd);
+			dw_edma_terminate_all_descs(chan);
 			chan->request = EDMA_REQ_NONE;
 			chan->status = EDMA_ST_IDLE;
 			break;
@@ -698,7 +733,9 @@ static void dw_edma_abort_interrupt(struct dw_edma_chan *chan)
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
 	vd = vchan_next_desc(&chan->vc);
-	if (vd) {
+	if (vd && chan->request == EDMA_REQ_STOP) {
+		dw_edma_terminate_all_descs(chan);
+	} else if (vd) {
 		dw_hdma_set_callback_result(vd, DMA_TRANS_ABORTED);
 		list_del(&vd->node);
 		vchan_cookie_complete(vd);
@@ -856,21 +893,48 @@ static int dw_edma_alloc_chan_resources(struct dma_chan *dchan)
 	return 0;
 }
 
-static void dw_edma_free_chan_resources(struct dma_chan *dchan)
+static void dw_edma_wait_termination(struct dma_chan *dchan)
 {
+	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
 	unsigned long timeout = jiffies + msecs_to_jiffies(5000);
-	int ret;
+	unsigned long flags;
+	bool configured = true;
 
+	/*
+	 * dw_edma_device_terminate_all() may defer cleanup to a later interrupt
+	 * while the channel is still running. Retry until the channel is
+	 * deconfigured, which means termination is complete.
+	 */
 	while (time_before(jiffies, timeout)) {
-		ret = dw_edma_device_terminate_all(dchan);
-		if (!ret)
-			break;
+		dw_edma_device_terminate_all(dchan);
 
-		if (time_after_eq(jiffies, timeout))
+		spin_lock_irqsave(&chan->vc.lock, flags);
+		configured = chan->configured;
+		spin_unlock_irqrestore(&chan->vc.lock, flags);
+		if (!configured)
 			return;
 
-		cpu_relax();
+		usleep_range(1000, 2000);
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
+	dw_edma_device_synchronize(dchan);
+	vchan_free_chan_resources(&chan->vc);
 }
 
 static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
@@ -968,6 +1032,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 	dma->device_pause = dw_edma_device_pause;
 	dma->device_resume = dw_edma_device_resume;
 	dma->device_terminate_all = dw_edma_device_terminate_all;
+	dma->device_synchronize = dw_edma_device_synchronize;
 	dma->device_issue_pending = dw_edma_device_issue_pending;
 	dma->device_tx_status = dw_edma_device_tx_status;
 	dma->device_prep_slave_sg = dw_edma_device_prep_slave_sg;
-- 
2.51.0

