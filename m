Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020090.outbound.protection.outlook.com [52.101.229.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF04439FCB5;
	Thu, 16 Jul 2026 15:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784215523; cv=fail; b=GY8qmJsRQNVaTTmWmM6aaIZdCAXp5pACzbJc0j5aLdE6VaKSZJCOnH/nsvRWgAAqFf2jvtfJtsRDmgbkP2o7NbBW3MufGr80GpFDUyFySfE+7pXI+5v93xGmlEw9afq/kvEB85mwrm05FsIbjuwS0UVxng/j4WaRrJ4qlVz6S4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784215523; c=relaxed/simple;
	bh=PV2Mb5RePABOdkWKfM/yz8Bd8dCI7FIBkzD9/5eRmUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uWyfkbx70iwhOboN62nLCQZtZSWLGdG9108qZcUy03eMhGiskiceszoNKn1yP9aAZh875kZi/halgWGFwPzQ2VmVtlkUSnD48IRM0/Ga636EOk+h0aLu27ui8I2NvJQA9QngGpGPe9XVVRSKu4UlSsYetf8qpJH6jh9MsObk+LA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=WUCRbb90; arc=fail smtp.client-ip=52.101.229.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="WUCRbb90"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDGctG8DsG/DXINBzlWtRVoElXLX5llgi9FS+st77hHYvECxgPuNjeE/SKChXJrT+OywUv2OQria8h7fJtEM7nZF6PrauXwsPqNXMfwjWzUSiDTelKucxZ0/xsxUsR1gqYlv0LK1XTVq2PkFhX4HfrXvf0NNRs8/ChtFW7C4znnvfG5RgbDbMPR8lKlfeUMo2xM3CStE4sy/DhTANI2j6kaT1bxPVkic2+gS5YEmSOQyu5hjTTb7Hn5MuUmdc6qpcp9Zs3gM4Z1deiNWW7w6VGjWaNeTadtTShEvWTnrbmg4ap890Q/aI+ULbxWpKkQelhJaV1S9AhCT9YimLf3G4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXXAD5lPOdT8qxEuzggRCw0L0zogRXF8916IwI941Oc=;
 b=uLkSkcUw+3SU6nQRNwhVvFqv59iMwMYCXGUCQkAGSjP2wdsYhlJD5a1IhiS/b8PvsE89INbXLsGXgJaQZEpzmbANUTQXC1CAKGRHMU4MT8QVoYU3HOc8KyKS1ogISpJOa+FPJN2cPPkylZ6rhxB7slpZvSFfhzHQRuK5UqIzoGNFSwrhtQ8YmjzAqsyI1ZodNfRjpA0ABi+he5id73+zpIVOpRmQ0wQmQ3o9Kzb2fAL7vKH0z+iCIzU8TAPcoC/VnHIatb6LgcFogLme0DguiXYT3CidGtgTEYdux7qd0fk3PGMKvLX1tOlie4c+38dJJSEfHtfJWEJP4ScGANO6Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXXAD5lPOdT8qxEuzggRCw0L0zogRXF8916IwI941Oc=;
 b=WUCRbb90y6MmEqhOVpsejuKk3CJ0ROb4yUPzGBrxPOFxO84+IUgeY2jeR/10442pfeqs1vffbIzR1X89OTzS7hM919K05TqtHOYPFuRCzazvpzKHQwwQtVPokJVn5JRAg97mPPqudFcdYmoyDaMY40QiaZUTJquOQcLS4roEAAs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB3635.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 15:25:15 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 15:25:15 +0000
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
Subject: [PATCH v4 2/9] dmaengine: dw-edma: Terminate all descriptors without callbacks
Date: Fri, 17 Jul 2026 00:24:56 +0900
Message-ID: <20260716152503.1747922-3-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260716152503.1747922-1-den@valinux.co.jp>
References: <20260716152503.1747922-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0166.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3635:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fba8236-2375-4724-fe13-08dee34e6fa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|376014|366016|1800799024|6133799003|5023799004|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ggAYiSk7wgG+XIQPtP1I7xcwGYpNg2VPW7pjMgaY3glb78nebf1TrNtR0GgZ9fr1l+sd/+0wS/6Kj68/rODFdOVPCG4b2aK7SytnHqNyAdbqsfGV8btrCG4nQYtn/lyyPmnQGIluDDP+2ZsdpMDxgIvxFgiCCPae0DzoLCRCy+LIdsTw4HJ7hEVy4vQqxJsBtdZ6bXEB1MJXWsZSuygeXSErgiCI4NSSw+ufc7YSVV/9jOCryn5QESztqcV303C0XwolgiHnrNifHpCE9K2KBfWnZKFlh0Cyrrl/o8yN1lMZUUjjc3ZYShHHPRNFracS+JNlsjXz8B0kdchoZeoHl87jtj9A6BJ5kpTaNzdWjFsUVkLVhh+QKvFye6vT2InLcfaHid08aNODeNf8utHxZcDdrCR7xEIUbO1aXdbuwncdyLyG7hpNJQKGqqLFAFdeS6KDEBuhg1TZFdq8wVQKUDja/vG/CP9OuKNsHM851upFNCC2WP962jrbb8naukouwbGKuXjUZy2S2dpmdGAsF/3XBl2uv0l7VnJeYgJSr1zBIAQc7BcBe2TZuyRbG70w75vdljAdqhoOmLpz9a+cC119h+iy3Qe9nKvyp9zAndtJGYUzHkL499japp71BX8rNc0SGvMCe7cQOnTTl6/L3lnbRFMOVupdMf3tdy2EDZU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(6133799003)(5023799004)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OBIszhS+ufLfD3iU/HwfCSErVFCVWAGYkdisFdwGEjif5RbyfK1IfjvmECwR?=
 =?us-ascii?Q?Tp2WWiy2KeNIg++fZVVAl3SSXTWHZNkKFFE7jZ17D1U8mqLHtS9XHH6KamWH?=
 =?us-ascii?Q?RVI0SviPO4F9CA6n+iKweK98sDp12MxSHLM7RIBada95hZA6iedsxQreV4y+?=
 =?us-ascii?Q?pm9Ovz/r2gkWIeJY6na+Jsl6rxr23qEIGij4N5lANknNHE9aKGxFLOffFtU1?=
 =?us-ascii?Q?YOVhRd116iNA47VDiWIpUW0vxlevIK+yeH11+51hqYPXolWwaEGcOF9iJ0+V?=
 =?us-ascii?Q?K4lIxqgpyqcS4pBXK5L9z44fBE6qcBVbDD918ZFgcm6/Iud4uvAVJU19eojf?=
 =?us-ascii?Q?rsv/80E/4DJf0iIAa/dX2eX+lL2JRDuTKrqBNDeWIYnx6r2HksU9pQn4g5np?=
 =?us-ascii?Q?SdZRx8HUWnyQYFpT6ztiihJ6AEodN7KNya/f+s5ZmNUU6GR2z3aJHtSR6sTX?=
 =?us-ascii?Q?oyoXXaZzFtfbH7kbQMFSVsO64T2HvLe9O8hzI4f6Gfgg9LEOvEw5XUER/M4F?=
 =?us-ascii?Q?hovr550uY/fdugJYexrDu1uTAIATHFwysWcVlWYT0+yp9mU9gw0fQYvl1jTL?=
 =?us-ascii?Q?zqgDq83SMO0zdy05afjGXbCvWbpE0dIu1YApo98hpTp2TetfF5WJYTLrgYxH?=
 =?us-ascii?Q?BpqYDpFRrwJjvX9pUYkVzhxhhsZVR5I5X0bwcmVLM6eYALmUzxCCOfUvsAoL?=
 =?us-ascii?Q?9qvNzOY1fD9cCvEIZ26iC7YKbov8mfmr3Qm4et92DJuZuVDu1pPbRq0viVtX?=
 =?us-ascii?Q?QjvN09Idqif/jznZKfbbjnSz3DkFwIMxzVVm+3By2ZJG8nKNFimfrckwbZM5?=
 =?us-ascii?Q?CS+OjJab29nrY9tklgVY3PyQ2PmAzE2SY9amUJx6FZWjUtAAbHYSg6cqggVo?=
 =?us-ascii?Q?VFbEmDHm3d6Rvuui08KpgYCHO0+Km7VC1EfCZVZeAPeD5L3kx5zhJEKjsSCT?=
 =?us-ascii?Q?cJ7DOxI2pZI5WelDrSlbO+Qr5XOWcbDSlTx7dntOHQiyHmPQ2p+GOsVinBn0?=
 =?us-ascii?Q?5rgIP2vasq3I63THhowgns1qDbHuah3udy6FT1kvwZKSnD2rhdMmIdXnpNwV?=
 =?us-ascii?Q?NCSIGNKTgE/w8wptCvzFS7U9/WCvr4o//A4LyPs950iGUlNmUtRPQeEF7Vm4?=
 =?us-ascii?Q?F78k+JBIicHufPKBEAL7BmbZ4mi2tCzQev+fXmnYH6EwebH7BsOkzop4IMHC?=
 =?us-ascii?Q?1rcY867c3MmWboJ8rUq4OF3H/u8ih3PLumwGVgv4nZbruWypYnmA4QHHqNGd?=
 =?us-ascii?Q?0ZDu/LoizRddcc5x0KpOu8uxxzCNILiQ84bCi69D2degh3K7YHsZA6VVVuCh?=
 =?us-ascii?Q?EiRA6SdpraE643tSiHndZTLIqN76a0Fl+v3gIts+5hnAUHE4q4GzE0ceCGIj?=
 =?us-ascii?Q?I2hfh6iI6V0+oX4PQ8s8WU5KteWrC9KVFOGUkbD0Nr16EzparyvpZf1h1I4v?=
 =?us-ascii?Q?cTbZDFcZqLPFo4/ZRvV5MiHvDe5GcAGX9F52da2I3NZIXPw3qgAlEhZ2uKNh?=
 =?us-ascii?Q?oYtFSUD0Mr8SZFNOaQfle9lEFqHOTR1fQtM3GaK+Kr2hpJTQNP6l1mxY40SH?=
 =?us-ascii?Q?aspvQRd9UzsaXcaBaysSRGR2sl+w3xYBwXT+Nv+A+ehnCiP4uo8aBOUr3+Ny?=
 =?us-ascii?Q?xlmdFPbDQ8At8FPLSxH95SpceCarfFyh6qxpiN6dihjTKQvTlE9Cf6KgawdI?=
 =?us-ascii?Q?BHz+lAGYBnRe9YuopZApgF64ys2WrwmvsUWVDwhMnMjeEzuIgZzIKOdxmpR9?=
 =?us-ascii?Q?LuXsyqkhrPHeEGsEQi1GuInmurVcF4aLYOXmWAflHJjdQdE+oNCD?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fba8236-2375-4724-fe13-08dee34e6fa6
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 15:25:15.3897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GD506glWhNIxQX7RjR/FybbyeNT66i9QpO+e6Gw/tqD+haOSufRMMpmc2+0dzoSO6T157u7W1JL7niRywuKdUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3635

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
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v4:
  - Use fsleep(). (Frank)
  - Use guard()/scoped_guard() for the new locking. (Frank)
  - Keep chan->configured across device_synchronize() and clear it in
    free_chan_resources() instead. (Sashiko)
  - Wait only while a deferred STOP remains pending.

 drivers/dma/dw-edma/dw-edma-core.c | 90 +++++++++++++++++++++++++-----
 1 file changed, 76 insertions(+), 14 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 89a4c498a17b..972c7ea18d46 100644
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
@@ -308,20 +338,22 @@ static int dw_edma_device_terminate_all(struct dma_chan *dchan)
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
@@ -673,8 +705,7 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 			break;
 
 		case EDMA_REQ_STOP:
-			list_del(&vd->node);
-			vchan_cookie_complete(vd);
+			dw_edma_terminate_all_descs(chan);
 			chan->request = EDMA_REQ_NONE;
 			chan->status = EDMA_ST_IDLE;
 			break;
@@ -698,7 +729,9 @@ static void dw_edma_abort_interrupt(struct dw_edma_chan *chan)
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
 	vd = vchan_next_desc(&chan->vc);
-	if (vd) {
+	if (vd && chan->request == EDMA_REQ_STOP) {
+		dw_edma_terminate_all_descs(chan);
+	} else if (vd) {
 		dw_hdma_set_callback_result(vd, DMA_TRANS_ABORTED);
 		list_del(&vd->node);
 		vchan_cookie_complete(vd);
@@ -856,21 +889,49 @@ static int dw_edma_alloc_chan_resources(struct dma_chan *dchan)
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
@@ -968,6 +1029,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 	dma->device_pause = dw_edma_device_pause;
 	dma->device_resume = dw_edma_device_resume;
 	dma->device_terminate_all = dw_edma_device_terminate_all;
+	dma->device_synchronize = dw_edma_device_synchronize;
 	dma->device_issue_pending = dw_edma_device_issue_pending;
 	dma->device_tx_status = dw_edma_device_tx_status;
 	dma->device_prep_slave_sg = dw_edma_device_prep_slave_sg;
-- 
2.51.0

