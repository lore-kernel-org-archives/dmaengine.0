Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020108.outbound.protection.outlook.com [52.101.229.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C354D2ED5;
	Wed, 29 Jul 2026 14:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785335458; cv=fail; b=hFlc68OW8xn+96EfgUW0M1X8RcaCVk6+f7Qv4Y+i3FVphXOhR0T6Lc67dGoA/YAl9MFn/NVEwLYYFGypjx6YJUgC8H5QxfjUoMB13/LuGtK0tSh/GxmgihwWetxpHFYm1zvEkFMeem5htCNhH6rAc/5nDX9SvmpTLLUcU9A8OE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785335458; c=relaxed/simple;
	bh=ZnJ1sjHEpKWz3Lf3GvFPcaYenFc7DrjhlLAlaSW9GMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RZSws8OaoxGriyzcKr+gEx78wPXkPI5oVfeEzaCBuTKK+S+P6eAkM0z9gLy7FVQZxONA2cIHR0n5Q++nEEqdYEynrKufWyo4lBsmy69yOpK0Qo9dHfBp3OnzsneI4p7RjVsamd1CS1n0je987Bt/0CNKF8MuGOTLOlK6c19+AJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=huePCPTQ; arc=fail smtp.client-ip=52.101.229.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="huePCPTQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QnojoHhAWCmOUaS+ihEw71n053ez72MBz+NuBpff3qJv7lU4cXejgT4WU5dzrNY186zVYJYlE+AWEWXr2PPILEunD6h1LzcXAOBfkGjBL56TL0m2v5QSSKIqhSU2pYdT9/FL64diupISmD5UhKThLocA1mvPRAYytEsKfSNWXfJrzwWhdM4i+cvh4fPYJmxe+Ffz/etso8ZKaerG5Mela3DYy3xCDk0D3U8JtYwAlMuDgAlPrs4YWXnluNjXpfeX9Z71ega09w7j5VXP1k+Ut4lpdPo0OOcP9qkRGOpgJorb+pPjiCEkZqPHvC0uE4jtuP2+jAf90D+TfZVc4in7eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFim/82Wxs7c0mXlAzIxX1DmIRGEPJ5NEyWvchY/9O0=;
 b=m92MjULzxYwQyw3PxnSxrEmFSfNOLw216HUuAjPxMdhAgstxsHcARo02tjbZq0IsNOwJffnJvEHDvw7Cp7ohe7F/0JbTVKs+qGGcCyVLoCYxDrWvQlDbBwvr8N4KugVboOrNRhJY6YoFWhD63WV8RJ0HOHHuewcMwPmzm5J0yIRbpM4HHKkUNkjwzqPwU7KViLp2bo1p1ME+ZJIfrDeXGRP32bBV70Gs1nXVpHN4adm+ZOWkgQXhz4TzCHSDOquZIWBo8F8qq5lNDaefAxygNLrG14H9o1KSRXiL1ZFWLQhMWahQT6m37JDeEb93/9ixFrUEOaq56ZHduNH6ixTPOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFim/82Wxs7c0mXlAzIxX1DmIRGEPJ5NEyWvchY/9O0=;
 b=huePCPTQAwuANU0vXGjs8xU23jnO/LblK306Pa8tWhxSignskQLnFP7HcnGCfB6bU+IuYeiKbi9akdzQzOWlyidILFLiX6Y30uYDGyxvFuT8X3K0g/kSn51b4qTTZ7e0E/DyBCFCRt6OefswV/MO0k+3uCwo74EKpX9bWZt2S4w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB3130.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:291::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 14:30:53 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 14:30:53 +0000
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
Subject: [PATCH v4 15/24] dmaengine: dw-edma: Recheck stopped LL channels before restart
Date: Wed, 29 Jul 2026 23:30:27 +0900
Message-ID: <20260729143036.3087722-16-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729143036.3087722-1-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0011.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::11) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3130:EE_
X-MS-Office365-Filtering-Correlation-Id: ab36ed29-6f53-430b-dfcc-08deed7dfeb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|23010399003|1800799024|921020|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/z3FTSiQ69LticVoBWKZNaRPe56T/v5OsgAeYD0idWIo7ZhCQb9iThUCADdfyLLbU81+sa8n8kFHnYhkKIDdKWSMAsa+3Iey0YCapaJHfT/0t9z+PzMQchE5Z3dgkIZnJKgBfM+ElAju8neT/A84Ape5X1ZHQzb2BFWAu7j3hWcjIWdn+jWQW+wu91LgYtBAhQearYCDn/B0M5dXIIzyK+DwODGGQUB5BAuTRNJpT04y8MABPZL0hJypPVggHdTl/yg/Haq6tqH1LM5nInmMmjfLri0RglDZwAsAOSacgZdYi9IxIWKLrXcqoyztEA4mPF3O9NOK+G7AOUd1t1tfMyLA6Y5ZrCMPC33BDkeXOrGkI7AROOFShutAiVQeB1cbwa3NNRd2TgYkGwzb/ncH8M7FECrQwQ+T+Dl++Xg2QdWADj30/juzPk1f+uKqvX3u5ScuBuKW6dMxYtHM4aiTwTo5OlxEnxcJogk0g91dwTOTjOcYS6QZpyaWmr24PjNdqrFTGsIe6vCLGoIK1dAiO6Y3B0GE2vXxPFQR3w5FzHyt6JDp0iTpWL/7iuK9EXJXBOhoD+Yd5KPT1ux94NGTmsR2g/rxd+8MGYEAvBy7aYSjllAWGoIPJZF2PWm3r0sAz5aKopHwtcFdOnCU+adhKlvjnxGaeUDqxuvfjOKkBeNBAVidQH+Nb/YawWmcmdv4MMgd+XxIbdBqqhcIiveRug==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(23010399003)(1800799024)(921020)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qB1Z70EBT0hdhIhgfNrfuZakSpXZ5CYRt09Kr5sWPR3Qu1W2CE5YaCmK/dn6?=
 =?us-ascii?Q?ZAKHAAkclO3dAoQRj7Zxrf/Etv8CYiZ+fmWxSukAUdCx48yZu9StNRV3YI1G?=
 =?us-ascii?Q?LNxr8iixbHRHz+hipJdo9KMVO/uanwo8JJX3IL9P7DeYPL6LvvVjILmeNzTX?=
 =?us-ascii?Q?yiBPQLcql6KH5Jezy9k0qSU0neo7ZwGIo1IJ3com9lQWzmSxyBulo7yZQLd7?=
 =?us-ascii?Q?Imkvv07YKZecKxPyIn3FhbeJEUGeiJs0vKQqna0FNMMK6IIE1qUdgba60Bzl?=
 =?us-ascii?Q?YKqx5vQBCCSMspmY3kNZBbkNoSFUzO2jJA/KvJ9oVOEk9g6c7zCLAq+GCv4X?=
 =?us-ascii?Q?4YkXdWgcAsKcxauh35tQSPvaVmoxwNzKiY631tHQFGhrD3r/Z2woMR4uCIzm?=
 =?us-ascii?Q?/bAqKpRVbK8Etwfx93wPlcFw3tZ0ApfInZA6/fyqMCDSYPNmhESl+Is+++sm?=
 =?us-ascii?Q?pWDZJD3N4T5gSqzSwhM48YM6TvMYFuKw2slTHoAZ9hCooLMzl/e3u2uFNoEg?=
 =?us-ascii?Q?QMSTJQ1bcbSEu1Elg5cKPIfbPXuvdtVCJMGiosrHwFXanSiJsMmoQPORaVbt?=
 =?us-ascii?Q?frBAidHHgYq9LP1zIubYcps0sQzmf57rsaGZoA93yWNLNRpmHlofGySZvLV+?=
 =?us-ascii?Q?WHJpK4ivqqcA9zZQFHBO962BUisKLytp7+nruDJbU0N9nsGxdqpk+FVCISla?=
 =?us-ascii?Q?EdZrh+NMdA3/2NSaJXtoPzN0ukOTy2Kv1Z5A+fhRG356a7BKXxWCsoKQ/DuB?=
 =?us-ascii?Q?Y5YfCFxF+RiyzuM/x8CCSR6fDjo7fQTir+OLu3ov8NqpYEu6CFAltk0c9+WV?=
 =?us-ascii?Q?o5q7jFraFLuaPCHGZQD1UgwVQOVkU51Gsn06goUaD5sikpwKEEc8NapNlian?=
 =?us-ascii?Q?7PGKjqKxcJJ8TS7gp5Gp4u5rupEX5038aKXFZipaZ4/7NSRGo3HNc9IjbA6B?=
 =?us-ascii?Q?DZGu4DtQcthVpvvohYVbZltpnDxJLOXtBF3Zdd7N7PIV3zlPHMERBW7+c3lU?=
 =?us-ascii?Q?rdXUiV09mrG0gXjRNX+tmdksXQnfbDHeVi0EBWJsx9EZppRHt7X4TXRnKdvO?=
 =?us-ascii?Q?RTXs9IMuIITQMZG9xsX35KLaxqyCsOL8WHmyIamPHYlxYQujzxh64ku28iWW?=
 =?us-ascii?Q?mmlUh/0tUWfvMx4iJFMbqJkdpxtOuXLzLGMB/WqE9KzVDwunbgMHWC3SBLI+?=
 =?us-ascii?Q?E1zIQPgqDH91Fu9ykKctwJFwf0irGcCda+6KYYCcq8DAqUIpAUX6spwp1ekG?=
 =?us-ascii?Q?SbIr7I3ALvdtcYldt93Y2rxhVCHdlXSbcqQIUUg5qUPTy986nQ8WMP/Rtg6m?=
 =?us-ascii?Q?4H0xan14cywbQDBKvcLvYncDK4CeWArnHuYH5zIGyrRmtgzmeM5nUueJsmZr?=
 =?us-ascii?Q?HpDMsl62vlXekzqgmyQfvmXQ1sSQWG9tngtG/NAkfYAHvIpCKH3yEEzkRzke?=
 =?us-ascii?Q?jCgCUq9e4I+wITkhSEVkDg1Too94fRWQO+uKYfKngzt2AUwM6lQJcAaXkb/v?=
 =?us-ascii?Q?6JYvxv4VLg5kSYSm7O6bUUckIYbyj2tVLbYKV8LU5Fzuh0EK6wkJ5TkirVDm?=
 =?us-ascii?Q?9qjh0YtLwJn4NU9gUJJ3CI03akHvwV8YThbwJjmJ8jdo+GjS/Hf2wb0CzOCV?=
 =?us-ascii?Q?S18jEXPSKi8ni2YjWgjkciULrBeLXfo+PhvjY4QoVbV1Xlook56iRsfWSt+h?=
 =?us-ascii?Q?QmgkqP2xX8gqxxR5MWjQJsTyGYEK95YuXo2yuIk8JGXOMRFLSr35WnuRTYe0?=
 =?us-ascii?Q?noka+DjQ4yVGLnSH4c3L60PXB4lOrQVUdZjVMzI7xDn5G0o8dFuL?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: ab36ed29-6f53-430b-dfcc-08deed7dfeb4
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 14:30:53.3877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T4LasOGixDwxhTaHq8s0IJGHw/v9OkRZDRwhJxRNuGroOmyZMHrdpF1o86b9xtBVtXBQIZtIFePegmeKLWRTVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3130

A DMA_LLP sample taken for a DONE interrupt through the eDMA-compatible
interface can race with the final DMA_LLP update and leave the recorded
consumer boundary one entry short. If the channel stops there, no later
interrupt reports the missing progress.

Before restarting a stopped LL channel, sample DMA_LLP again and reclaim
any newly visible progress. If the channel still reports running, do not
ring another doorbell. It may stop at a CB mismatch just after the
status read, so schedule one delayed recheck. Also recheck after actually
kicking a stopped channel, in case no event reports the result of the kick.
Native HDMA reports STOP separately and does not need this recheck.

Serialize the stopped-state check, LLP sample and interrupt-status clear
against IRQ capture. Do not reconcile a stopped boundary while ABORT is
pending. Keep stopped-boundary reconciliation separate from refilling so
STOP and PAUSE drain paths can consume it without publishing more entries.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v4:
  - Arm a recheck after kicking a stopped channel, not only after observing
    it running. (Sashiko)
  - Keep zero reserved as the cancelled recheck sentinel across jiffies
    wrap. (Sashiko)
  - Rephrase misleading "legacy eDMA" wording; it refers to the
    eDMA-compatible interface, not a specific map format.

 drivers/dma/dw-edma/dw-edma-core.c | 204 +++++++++++++++++++++++++++--
 drivers/dma/dw-edma/dw-edma-core.h |   5 +
 2 files changed, 197 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 16d3d2a8d1c2..0d1e6f48cac1 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -27,6 +27,7 @@
 
 /* Empirically chosen progress interval. */
 #define DW_EDMA_LL_PROGRESS_INTERVAL	4
+#define DW_EDMA_LL_RECHECK_DELAY_MS		30
 
 static inline
 struct dw_edma_desc *vd2dw_edma_desc(struct virt_dma_desc *vd)
@@ -148,6 +149,27 @@ static void dw_edma_ll_event_discard_locked(struct dw_edma_chan *chan)
 	dw_edma_ll_snapshot_discard_locked(chan);
 }
 
+/* Must be called with vc.lock held. */
+static void dw_edma_ll_recheck_cancel(struct dw_edma_chan *chan)
+{
+	chan->ll_recheck_at = 0;
+	cancel_delayed_work(&chan->ll_recheck_work);
+}
+
+/* Must be called with vc.lock held. */
+static void dw_edma_ll_recheck_schedule(struct dw_edma_chan *chan)
+{
+	unsigned long delay =
+		msecs_to_jiffies(DW_EDMA_LL_RECHECK_DELAY_MS);
+
+	if (unlikely(READ_ONCE(chan->dw->teardown)))
+		return;
+
+	/* Keep zero reserved for a cancelled recheck across jiffies wrap. */
+	chan->ll_recheck_at = jiffies + delay ?: 1;
+	mod_delayed_work(chan->dw->wq, &chan->ll_recheck_work, delay);
+}
+
 /* Must be called with vc.lock held for an LL channel. */
 static void dw_edma_ll_event_discard(struct dw_edma_chan *chan)
 {
@@ -160,6 +182,8 @@ static void dw_edma_ll_event_discard(struct dw_edma_chan *chan)
 static void
 dw_edma_set_request(struct dw_edma_chan *chan, enum dw_edma_request request)
 {
+	if (!chan->non_ll && chan->request != request)
+		dw_edma_ll_recheck_cancel(chan);
 	chan->request = request;
 }
 
@@ -192,6 +216,8 @@ static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
 {
 	u32 i;
 
+	dw_edma_ll_recheck_cancel(chan);
+
 	chan->ll_head = 0;
 	chan->ll_done = 0;
 	/* Drop stale CB bits before reusing the circular LL ring. */
@@ -426,7 +452,7 @@ static bool dw_edma_ll_clean_pending(struct dw_edma_chan *chan, int idx)
 
 		if (WARN_ON_ONCE(desc->done_burst > desc->start_burst ||
 				 desc->start_burst > desc->nburst))
-			return advanced;
+			goto out;
 
 		/*
 		 * start_burst is the next burst to append. done_burst counts
@@ -445,7 +471,7 @@ static bool dw_edma_ll_clean_pending(struct dw_edma_chan *chan, int idx)
 			gap = dw_edma_core_get_ll_dist(chan, chan->ll_done,
 						       desc->ll_start);
 			if (gap > done)
-				return advanced;
+				goto out;
 
 			chan->ll_done = desc->ll_start;
 			done -= gap;
@@ -476,6 +502,10 @@ static bool dw_edma_ll_clean_pending(struct dw_edma_chan *chan, int idx)
 
 	WARN_ON_ONCE(done);
 
+out:
+	if (advanced)
+		dw_edma_ll_recheck_cancel(chan);
+
 	return advanced;
 }
 
@@ -531,6 +561,59 @@ dw_edma_ll_consume_progress(struct dw_edma_chan *chan, int idx)
 	return dw_edma_ll_clean_pending(chan, idx);
 }
 
+static bool dw_edma_ll_has_hdma_stop_event(struct dw_edma_chan *chan)
+{
+	return chan->dw->chip->mf == EDMA_MF_HDMA_NATIVE;
+}
+
+/*
+ * Must be called with vc.lock held. A DONE-time DMA_LLP sample may miss
+ * the final burst element. For the eDMA-compatible interrupt interface,
+ * accept a fresh LLP sample only when status is STOPPED and transfer size
+ * is zero. Native HDMA reports STOP directly.
+ */
+static bool dw_edma_ll_reconcile_stopped(struct dw_edma_chan *chan)
+{
+	int idx;
+
+	scoped_guard(spinlock_irqsave, dw_edma_event_lock(chan)) {
+		if (dw_edma_abort_latch_locked(chan))
+			return false;
+
+		/*
+		 * Leave an IRQ-captured event to its worker. Otherwise pair the
+		 * stopped boundary with the status clear before another kick.
+		 */
+		if (chan->ll_irq.event != DW_EDMA_LL_EVENT_NONE ||
+		    dw_edma_core_ch_status(chan) != DMA_COMPLETE)
+			return false;
+
+		/* Native HDMA reports STOP without a transfer-size check. */
+		if (!dw_edma_ll_has_hdma_stop_event(chan) &&
+		    dw_edma_core_ch_transfer_size(chan) != 0)
+			return false;
+
+		idx = dw_edma_ll_recycle_idx(chan,
+					     dw_edma_core_ll_cur_idx(chan),
+					     DW_EDMA_LL_EVENT_STOP);
+		dw_edma_core_ll_irq_clear(chan);
+	}
+
+	return dw_edma_ll_clean_pending(chan, idx);
+}
+
+static bool dw_edma_ll_reconcile_and_refill(struct dw_edma_chan *chan)
+{
+	if (!dw_edma_ll_reconcile_stopped(chan))
+		return false;
+
+	dw_edma_start_transfer(chan);
+	chan->status = dw_edma_ll_pending(chan) ?
+		       EDMA_ST_BUSY : EDMA_ST_IDLE;
+
+	return true;
+}
+
 static void dw_edma_core_ll_sync(struct dw_edma_chan *chan)
 {
 	/*
@@ -544,6 +627,15 @@ static void dw_edma_core_ll_sync(struct dw_edma_chan *chan)
 /* Must be called with vc.lock held for an LL channel. */
 static void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
 {
+	if (unlikely(READ_ONCE(chan->dw->teardown)))
+		return;
+
+	dw_edma_ll_recheck_cancel(chan);
+
+	/*
+	 * Complete the remote LL publication before serializing the new
+	 * hardware run with IRQ capture.
+	 */
 	dw_edma_core_ll_sync(chan);
 
 	guard(spinlock_irqsave)(dw_edma_event_lock(chan));
@@ -562,14 +654,73 @@ static void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
 	dw_edma_core_do_ch_doorbell(chan);
 }
 
-/* Must be called with vc.lock held. */
-static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
+/*
+ * Must be called with vc.lock held. Return true when published work is still
+ * running and may need one later stop recheck.
+ */
+static bool dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
 {
 	if (chan->non_ll || chan->request != EDMA_REQ_NONE ||
-	    chan->status != EDMA_ST_BUSY || !dw_edma_ll_pending(chan))
-		return;
+	    chan->status != EDMA_ST_BUSY || !dw_edma_ll_pending(chan) ||
+	    dw_edma_abort_is_pending(chan))
+		return false;
+
+	/*
+	 * While running, both eDMA and HDMA consume newly published
+	 * elements without another doorbell.
+	 */
+	if (dw_edma_core_ch_status(chan) == DMA_IN_PROGRESS)
+		return true;
+
+	dw_edma_ll_reconcile_and_refill(chan);
+	if (!dw_edma_ll_pending(chan))
+		return false;
 
 	dw_edma_core_ch_doorbell(chan);
+	if (!dw_edma_ll_has_hdma_stop_event(chan))
+		dw_edma_ll_recheck_schedule(chan);
+
+	return false;
+}
+
+/*
+ * eDMA may stop at a CB mismatch just after reporting RUNNING.
+ * Recheck once so the stopped tail is not left pending.
+ */
+static void
+dw_edma_core_ch_maybe_doorbell_or_recheck(struct dw_edma_chan *chan)
+{
+	if (dw_edma_core_ch_maybe_doorbell(chan) &&
+	    !dw_edma_ll_has_hdma_stop_event(chan))
+		dw_edma_ll_recheck_schedule(chan);
+}
+
+static void dw_edma_ll_recheck_work(struct work_struct *work)
+{
+	struct dw_edma_chan *chan =
+		container_of(to_delayed_work(work), struct dw_edma_chan,
+			     ll_recheck_work);
+	unsigned long delay;
+
+	guard(spinlock_irqsave)(&chan->vc.lock);
+
+	if (unlikely(READ_ONCE(chan->dw->teardown))) {
+		chan->ll_recheck_at = 0;
+		return;
+	}
+
+	if (!chan->ll_recheck_at)
+		return;
+
+	if (time_before(jiffies, chan->ll_recheck_at)) {
+		delay = chan->ll_recheck_at - jiffies;
+		mod_delayed_work(chan->dw->wq, &chan->ll_recheck_work, delay);
+		return;
+	}
+
+	chan->ll_recheck_at = 0;
+	if (chan->request == EDMA_REQ_NONE)
+		dw_edma_core_ch_maybe_doorbell(chan);
 }
 
 static void dw_edma_device_caps(struct dma_chan *dchan,
@@ -697,7 +848,7 @@ static int dw_edma_device_resume(struct dma_chan *dchan)
 		chan->status = EDMA_ST_BUSY;
 		if (!dw_edma_start_transfer(chan))
 			chan->status = EDMA_ST_IDLE;
-		dw_edma_core_ch_maybe_doorbell(chan);
+		dw_edma_core_ch_maybe_doorbell_or_recheck(chan);
 	}
 
 	return err;
@@ -747,7 +898,7 @@ static void dw_edma_device_issue_pending(struct dma_chan *dchan)
 			dw_edma_ll_snapshot_discard(chan);
 		chan->status = EDMA_ST_BUSY;
 		dw_edma_start_transfer(chan);
-		dw_edma_core_ch_maybe_doorbell(chan);
+		dw_edma_core_ch_maybe_doorbell_or_recheck(chan);
 	}
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
@@ -1097,7 +1248,7 @@ static void dw_edma_ll_interrupt(struct dw_edma_chan *chan)
 	}
 
 out:
-	dw_edma_core_ch_maybe_doorbell(chan);
+	dw_edma_core_ch_maybe_doorbell_or_recheck(chan);
 }
 
 static bool dw_edma_abort_interrupt(struct dw_edma_chan *chan)
@@ -1136,6 +1287,11 @@ static void dw_edma_irq_work(struct work_struct *work)
 						 irq_work);
 	unsigned int events;
 
+	if (unlikely(READ_ONCE(chan->dw->teardown))) {
+		atomic_set(&chan->irq_pending, 0);
+		return;
+	}
+
 	do {
 		events = atomic_xchg(&chan->irq_pending, 0);
 
@@ -1153,6 +1309,9 @@ static void dw_edma_irq_work(struct work_struct *work)
 static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
 				   unsigned int events)
 {
+	if (unlikely(READ_ONCE(chan->dw->teardown)))
+		return;
+
 	atomic_or(events, &chan->irq_pending);
 	queue_work(chan->dw->wq, &chan->irq_work);
 }
@@ -1390,6 +1549,9 @@ static void dw_edma_device_synchronize(struct dma_chan *dchan)
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
 
 	dw_edma_wait_termination(dchan);
+	scoped_guard(spinlock_irqsave, &chan->vc.lock)
+		dw_edma_ll_recheck_cancel(chan);
+	cancel_delayed_work_sync(&chan->ll_recheck_work);
 	cancel_work_sync(&chan->irq_work);
 	atomic_set(&chan->irq_pending, 0);
 	dw_edma_irq_events_discard(chan);
@@ -1443,6 +1605,8 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 		chan->status = EDMA_ST_IDLE;
 		chan->irq_mode = dw_edma_get_default_irq_mode(chan);
 		INIT_WORK(&chan->irq_work, dw_edma_irq_work);
+		INIT_DELAYED_WORK(&chan->ll_recheck_work,
+				  dw_edma_ll_recheck_work);
 		atomic_set(&chan->irq_pending, 0);
 		chan->ll_irq.idx = -1;
 		chan->ll_irq.event = DW_EDMA_LL_EVENT_NONE;
@@ -1798,23 +1962,39 @@ int dw_edma_remove(struct dw_edma_chip *chip)
 	if (!dw)
 		return -ENODEV;
 
+	/*
+	 * Stop new clients and asynchronous hardware access before dismantling
+	 * their execution context.
+	 */
+	WRITE_ONCE(dw->teardown, true);
+	dma_async_device_unregister(&dw->dma);
+
+	/*
+	 * Drain channel work that may have passed the teardown gate before
+	 * stopping the hardware. IRQ handlers remain installed while it is
+	 * active.
+	 */
+	for (i = 0; i < dw->wr_ch_cnt + dw->rd_ch_cnt; i++) {
+		disable_delayed_work_sync(&dw->chan[i].ll_recheck_work);
+		cancel_work_sync(&dw->chan[i].irq_work);
+	}
+
 	if (chip->flags & DW_EDMA_CHIP_PARTIAL)
 		err = dw_edma_core_quiesce(dw);
 	else
 		dw_edma_core_off(dw);
 
-	/* Free irqs */
+	/* No new hardware event can be raised after the quiesce. */
 	for (i = (dw->nr_irqs - 1); i >= 0; i--)
 		free_irq(chip->ops->irq_vector(dev, i), &dw->irq[i]);
 	dw_edma_emul_irq_free(dw);
 
+	/* Drain IRQ work queued by a handler that raced with the gate. */
 	for (i = 0; i < dw->wr_ch_cnt + dw->rd_ch_cnt; i++)
 		cancel_work_sync(&dw->chan[i].irq_work);
 
 	destroy_workqueue(dw->wq);
 
-	/* Deregister eDMA device */
-	dma_async_device_unregister(&dw->dma);
 	list_for_each_entry_safe(chan, _chan, &dw->dma.channels,
 				 vc.chan.device_node) {
 		tasklet_kill(&chan->vc.task);
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index 36fe8c69769d..b9e928b8d8fb 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -124,6 +124,9 @@ struct dw_edma_chan {
 	spinlock_t			event_lock_per_chan;
 	spinlock_t			*event_lock;	/* Selected event lock */
 
+	struct delayed_work		ll_recheck_work;
+	unsigned long			ll_recheck_at;
+
 	u32				ll_max;		/* Data entries */
 	struct dw_edma_region		ll_region;	/* Linked list */
 	bool				ll_valid;	/* LL context programmed */
@@ -172,6 +175,8 @@ struct dw_edma {
 	 */
 	struct workqueue_struct		*wq;
 
+	bool				teardown;	/* Gate asynchronous hardware access */
+
 	raw_spinlock_t			lock;		/* Protect v0 shared registers */
 	/* Per-direction lock storage for the eDMA interrupt registers. */
 	spinlock_t			event_lock_per_dir[2];
-- 
2.51.0

