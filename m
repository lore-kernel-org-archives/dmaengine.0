Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020093.outbound.protection.outlook.com [52.101.229.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFB643785D;
	Mon, 27 Jul 2026 17:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171835; cv=fail; b=OQSTRdDh8bRqfVD7gXhrCpYPK7h2E8FzQET78oA77FbLDUV84rBX9gY+f/dCq7Jd3TlT3FMo/n4Iisvi9Bo5xirS47/CkWD7/+Pwue9NXtswWHuTfOCQBWqjjnSCbylrRnebgHF52Fws+a0tx2ZMsrMwqM73j1MVtyJRC0esaGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171835; c=relaxed/simple;
	bh=gTZWF2U5wqly8PIDXV9J2AoQI81w2jlN26qSQykvGCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nK0VpKXio1uNvy9YrmrIrRNCL5lPDMYi9XOynNzjtg6YbpraZH7xxlEWubE/h6EoZTrGF4jb6w7XkZgEvBx5YKQRbtfG25kdJbqeEHPt4/emT1Bk17+xdBdDpbr/WUVhqdlr+c5kBudiyeo2TnS3P8+69Po47nQuqIFrMxBmIfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=uvfSTRcx; arc=fail smtp.client-ip=52.101.229.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="uvfSTRcx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EetrZZ7SxntmNoflWP6h2YGryRA0vIqdyX2Y/pidQ/UiYjRODyVtthmXjtD9T6HIZTYmImrRMV6IvYnMwsOlOrvv9p79IqZrmz2DPryV+WamlDU0RZznftUh88lvLDo2kItkqg/O1BVUjO6lW8/VFnUXPo8wpQ5bg3yeAH7q17I097q00sOI63Nm3oiXNPDJBUQctYXy8iz6Zxz135APZGGsl/habkLoLRwnQg7NtibrOTbLMA704QXEUtsfk+Wj0vDYq7gCP+wvAe+5+pjNqNUYW9qYtyv9Dku2LvadL3BQ9E3DR3ueCBbjDj0IyviVHcAO3mFocCzbbItgPZRHnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3ttWMO5gagP/BCrwUvtYGOgVqG5XxyAE6EFnneKdhc=;
 b=iopFbTi9VqKkt+J/BhSSD9N/manTYvylE62KHcy/j0djTEgsN9ZO4aaXIms6K70zmV4rie+oDHaPIjlWUzIBblOC9iF8/A19lvHjcqxmTHEb9IeU41F0gnUOJAYKQAGIg6a50YlcnenCZCljk92j4AMNsVyzlVTLfdINDBBaFwTptrCtT1WK5q3TDRfC4dFEn5gWWC/5zt9I1hrEYreg3T2EYArFDMsV2FUOq6fkeldoSL65/8eQRai7R/B+iMI0x97qM5Ywv84h6pIcLu35DXW5tdRVrcBHnevsJbbwiOzaQKVblKdkKGTbE6/0Qw7OlDpLg2NPmWiyKqUCQMA+NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3ttWMO5gagP/BCrwUvtYGOgVqG5XxyAE6EFnneKdhc=;
 b=uvfSTRcxn6OYEIEKFO/CoRSQrVsGs4xVz/BYQM1uRCV53RtH9TP2Z9/3DvwgZdWA325a4IOU2c0BZ2TB1FHDdJ4ME/XOk4jRbJWGUXZJ+jN6NfLdw8eoFCxhBZsyghnc1JkWZpHdSuODuuzekuUA7OhEQ1bwx5IQFVCG7Sd3co4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB4609.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:1a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Mon, 27 Jul
 2026 17:03:43 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:03:43 +0000
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
Subject: [PATCH v3 15/24] dmaengine: dw-edma: Recheck stopped LL channels before restart
Date: Tue, 28 Jul 2026 02:03:14 +0900
Message-ID: <20260727170323.2321369-16-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260727170323.2321369-1-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P286CA0037.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b7::11) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: 08205c67-eea4-47ce-dda5-08deec0103c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|23010399003|10070799003|18002099003|22082099003|10067099003|56012099006|921020|6133799003;
X-Microsoft-Antispam-Message-Info:
	BE3YiWrst8v9xXeEuyTmLQL8aTUZzqzlBPyO9mao6SbONwvmV/UCBnhItydaPecet58iSfFw6XGmFTIrBHi3e+ts/hqFfB6NiLqEi0Qe+mVXStHl5f6Q/hz04DPYz+HYTwOtsswV0rBJMB0UojtEUWZ+oOEN5AhJnaWrW5xY70XxNy9x4cqocnCFk2/AjBFyukATPLaHfFXET6g2dHQr1RNYAkP1pNtq9vBosC9u/Rhgsmo/yS8gwZZ9DX0I8Xxqd0IrZ5KQQdWRmB55dXXSrTG2/qalgk5TI9f/SGSbT7hDt5mxgEqQpr8AT43REafYkVP+CTJDlm2+29I+Dnv3CrA5q6KzvtLVTNhytcgI9J6frrzGcon5UFnwXjuVm2X4pJl34ymYBfBi9QuCmY7iwLrd5A5YCUbuDVLd1wGezFjmgFuTT/KUvFkKYts+eXX4JEMCwsIAv3AetQD4lVlAqi7AQmzJPaWkZ9Q1XAJ8C4qknBw1Y4/osRjwoH3ljP6XzGu1ckF3EbTZJo81JWNZcYbOO63HtYRrZ+qHfut/FfTQucW6niLsvynVKBdmnm1RRPK51xUi2erTEgIb4B0Jkbmt5dp/S43u0s7E7ByXnD73v1JRTr39iteCzUfnp5XiRkduFhse/dRTuHYMUZAqd60uBJeAmvR7RfJaGppDOlBc1cjnKfPIJ8S+yghHTOPtlOlTcPN9Yb0zqllwwvdcSQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(23010399003)(10070799003)(18002099003)(22082099003)(10067099003)(56012099006)(921020)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mi2FUo/bmJhRUrYcPoQe+PMJHwqBtRFCpcH9aKFmbuHgeOBDgVeKLWo5RP7U?=
 =?us-ascii?Q?AZWrp8F69PAs0dOoMVgMDcaZDSGO6NeG/L0VapS9yAxU+2H9pzvGU/ayDc3F?=
 =?us-ascii?Q?GG/oUfjECQwhy9+dMFf1AbUxVXZbgoj4oJxz2y4YGCpyYW0MAUdVIZNN9a1b?=
 =?us-ascii?Q?PmjNZDjhPQ6BbzJOzl+x9JBmtWvON1o0uTVGB7hYioVW9maWd5SyccXso+Cx?=
 =?us-ascii?Q?QJ56dHEWhLC56ivUgz8da13NtUaJ/Di262Ujt1/X7UJaaW6vUBjghxWs1dw5?=
 =?us-ascii?Q?Ef9MdB3LRUCfEHMBmwIw4pE8RSZXyxMpEqsYXyum7FEBbzNEZ4/jg/+9sgbx?=
 =?us-ascii?Q?ha0B3+MANXXczyLl3iLl/33TIm3ygh5R8jk477RpY4imuCDahkdM0//utABQ?=
 =?us-ascii?Q?3A4cztpGule07Rt8/kSROTyXDrThD00sn5XlqNjcsR7uN0j7/cEUr8O36//o?=
 =?us-ascii?Q?wGoJCj6XR2iz1lfIp4MSwNPi1lbEtX7HtLMIDRKoAwPQbaCTmIHLG6vIGbUQ?=
 =?us-ascii?Q?SdZoPAfMII0DBTigEJjj2Det44PQa6Od1h5OYrMvc4ZpZ6qH6sZZKWuEAp1T?=
 =?us-ascii?Q?ZfMPppmstvtJpEjEP3KLGx5+AYwLlJPSebfjtFeO2YZWJ8JHIjhCQk6nbhr1?=
 =?us-ascii?Q?rt5wtD8BoPF9boky/1LG6jGd6w1Mer10gEQoreqMv/dffGAuJICPKzK1eRoO?=
 =?us-ascii?Q?3fNZb/af7cw1KibGuw0B6PsUDFLPICd5cdfueLI9CuG5fU8p3iovUw3Ksvst?=
 =?us-ascii?Q?ECZrxgV/tpaGIJC/BMBqbJI9aSbDrkogQ6GQPK/sYUUKPD96SETf891HNR8A?=
 =?us-ascii?Q?U0Zrr0DOiZDEqlQi5x/gjphHgfhfup1WiUKBKlARJcBGVD0T0gm3whCsTsnd?=
 =?us-ascii?Q?X6FFyYVDlCGwl556C0gqH1PI5RHXNA0+62k01iz4mYkG3AfkfZD+XMWJfn4B?=
 =?us-ascii?Q?8AqXMR6SROu/vMmab/SVsDXFF4ZkyCWW4Yjxje29GB/z75ZSjmtF69zHxKlF?=
 =?us-ascii?Q?c8RlVSKt71FqDPkXW24UWGMgV4UDtMOlGahwSE2YjvMi83TYdP1eQgo8y3qz?=
 =?us-ascii?Q?8Ur+4/GCr5XiyKY1cbWBJCMV8Nbo+Iemhn/yhKikTykM+Mj+FoBgDpgJDD3G?=
 =?us-ascii?Q?DiwbdK0GTNddKLThQ15pk76dMUSoezyBN/clNlQxWMNBgRXlXR+m01t4F23n?=
 =?us-ascii?Q?lSTRdDfSmeF1CfBJGGeHFSYI6tTkQoGUp3FRQkRhs89CCfiE4z3iBTHdpcMv?=
 =?us-ascii?Q?tuch2dB1yxrRmGQ8A+HkrylIVbNRBPMT9PssrYraDzJv1BNo0UEWh7hkVT2S?=
 =?us-ascii?Q?2uojU/Sdg4go+3mFIFJCWJIDONaDmYBGS6r36tLit/YRxFDCZf+27o1nvyd/?=
 =?us-ascii?Q?9ZKEvARuZmatQLwUG455NoYAvuxCnpP7ws7hCSnHr5umL1zZ9sMW1RWo0L7o?=
 =?us-ascii?Q?EOwgb58ruNZw3o5chOOPeLGmvce/FpnGueRtT9qFQMH5tGma7qgF6r6F6390?=
 =?us-ascii?Q?jo7HMv3wCStAq0TwabcaXtxB+P/JqTFLwnjnIgvX6nTZ4uDpsmF7QDPTdnlO?=
 =?us-ascii?Q?Vorvck1mgrH7U13bLH1d0LIDjh502geGDyoqhNeOM+skDwQT/r3qYM5Wyg1O?=
 =?us-ascii?Q?qHGLu5qCR75CdSuGcCwsIXdwlVob4kGuP076vfSt+Oczsou5eMM9czpNbssh?=
 =?us-ascii?Q?My7ufPrBqINuEa6+C0f53ZD6+5xotCZf13RlPMbJ0qcoXrPVLZ8/QISuWhz2?=
 =?us-ascii?Q?lFDBsmyxzdEDulix1OtqdlXhiGO1QsClfnRJX94BYFWdP2ohRLbs?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 08205c67-eea4-47ce-dda5-08deec0103c9
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:03:43.6561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 49RdWTfgJ8T+mLz12cDDLoPZmNX1667e/TpowvQiXwARYDfoNqv5Ners76IA7hXWlC1GOLp7PR+mo1zWN5/5VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB4609

A DMA_LLP sample taken for a DONE interrupt through the eDMA-compatible
interface can race with the final DMA_LLP update and leave the recorded
consumer boundary one entry short. If the channel stops there, no later
interrupt reports the missing progress.

Before restarting a stopped LL channel, sample DMA_LLP again and reclaim
any newly visible progress. If the channel still reports running, do not
ring another doorbell. It may stop at a CB mismatch just after the
status read, so schedule one delayed recheck. Native HDMA reports STOP
separately and does not need this recheck.

Serialize the stopped-state check, LLP sample and interrupt-status clear
against IRQ capture. Do not reconcile a stopped boundary while ABORT is
pending. Keep stopped-boundary reconciliation separate from refilling so
STOP and PAUSE drain paths can consume it without publishing more entries.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - Rework and rename v2's "Reconcile lost completions from a stopped
    LLP re-sample"; retain the stopped LLP re-sample and add one delayed
    recheck for interfaces without a dedicated STOP event. (Sashiko)
  - Serialize the stopped-state check, LLP sample and interrupt-status
    clear against IRQ capture, block reconciliation while ABORT is
    pending, and separate stopped reconciliation from refill. (Sashiko)
  - Route normal kick paths through the helper that arms the delayed
    recheck after observing a running channel. (Sashiko)
  - Gate asynchronous work, unregister the DMA device before quiesce,
    and quiesce the hardware before freeing IRQs. (Sashiko)

 drivers/dma/dw-edma/dw-edma-core.c | 201 +++++++++++++++++++++++++++--
 drivers/dma/dw-edma/dw-edma-core.h |   5 +
 2 files changed, 194 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index d28e3633a866..dbccd11aa92f 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -27,6 +27,7 @@
 
 /* Empirically chosen progress interval. */
 #define DW_EDMA_LL_PROGRESS_INTERVAL	4
+#define DW_EDMA_LL_RECHECK_DELAY_MS		30
 
 static inline
 struct dw_edma_desc *vd2dw_edma_desc(struct virt_dma_desc *vd)
@@ -148,6 +149,26 @@ static void dw_edma_ll_event_discard_locked(struct dw_edma_chan *chan)
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
+	chan->ll_recheck_at = jiffies + delay;
+	mod_delayed_work(chan->dw->wq, &chan->ll_recheck_work, delay);
+}
+
 /* Must be called with vc.lock held for an LL channel. */
 static void dw_edma_ll_event_discard(struct dw_edma_chan *chan)
 {
@@ -160,6 +181,8 @@ static void dw_edma_ll_event_discard(struct dw_edma_chan *chan)
 static void
 dw_edma_set_request(struct dw_edma_chan *chan, enum dw_edma_request request)
 {
+	if (!chan->non_ll && chan->request != request)
+		dw_edma_ll_recheck_cancel(chan);
 	chan->request = request;
 }
 
@@ -192,6 +215,8 @@ static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
 {
 	u32 i;
 
+	dw_edma_ll_recheck_cancel(chan);
+
 	chan->ll_head = 0;
 	chan->ll_done = 0;
 	/* Drop stale CB bits before reusing the circular LL ring. */
@@ -430,7 +455,7 @@ static bool dw_edma_ll_clean_pending(struct dw_edma_chan *chan, int idx)
 
 		if (WARN_ON_ONCE(desc->done_burst > desc->start_burst ||
 				 desc->start_burst > desc->nburst))
-			return advanced;
+			goto out;
 
 		/*
 		 * start_burst is the next burst to append. done_burst counts
@@ -449,7 +474,7 @@ static bool dw_edma_ll_clean_pending(struct dw_edma_chan *chan, int idx)
 			gap = dw_edma_core_get_ll_dist(chan, chan->ll_done,
 						       desc->ll_start);
 			if (gap > done)
-				return advanced;
+				goto out;
 
 			chan->ll_done = desc->ll_start;
 			done -= gap;
@@ -480,6 +505,10 @@ static bool dw_edma_ll_clean_pending(struct dw_edma_chan *chan, int idx)
 
 	WARN_ON_ONCE(done);
 
+out:
+	if (advanced)
+		dw_edma_ll_recheck_cancel(chan);
+
 	return advanced;
 }
 
@@ -535,6 +564,59 @@ dw_edma_ll_consume_progress(struct dw_edma_chan *chan, int idx)
 	return dw_edma_ll_clean_pending(chan, idx);
 }
 
+static bool dw_edma_ll_has_hdma_stop_event(struct dw_edma_chan *chan)
+{
+	return chan->dw->chip->mf == EDMA_MF_HDMA_NATIVE;
+}
+
+/*
+ * Must be called with vc.lock held. A DONE-time DMA_LLP sample may miss
+ * the final burst element. For the legacy interrupt interface, accept a
+ * fresh LLP sample only when status is STOPPED and transfer size is zero.
+ * Native HDMA reports STOP directly.
+ */
+static bool dw_edma_ll_reconcile_stopped(struct dw_edma_chan *chan)
+{
+	int idx;
+
+	scoped_guard(raw_spinlock_irqsave, dw_edma_event_lock(chan)) {
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
@@ -548,6 +630,15 @@ static void dw_edma_core_ll_sync(struct dw_edma_chan *chan)
 /* Must be called with vc.lock held for an LL channel. */
 static void dw_edma_core_ch_kick(struct dw_edma_chan *chan)
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
 
 	guard(raw_spinlock_irqsave)(dw_edma_event_lock(chan));
@@ -566,14 +657,71 @@ static void dw_edma_core_ch_kick(struct dw_edma_chan *chan)
 	dw_edma_core_ch_doorbell(chan);
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
 
 	dw_edma_core_ch_kick(chan);
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
@@ -701,7 +849,7 @@ static int dw_edma_device_resume(struct dma_chan *dchan)
 		chan->status = EDMA_ST_BUSY;
 		if (!dw_edma_start_transfer(chan))
 			chan->status = EDMA_ST_IDLE;
-		dw_edma_core_ch_maybe_doorbell(chan);
+		dw_edma_core_ch_maybe_doorbell_or_recheck(chan);
 	}
 
 	return err;
@@ -751,7 +899,7 @@ static void dw_edma_device_issue_pending(struct dma_chan *dchan)
 			dw_edma_ll_snapshot_discard(chan);
 		chan->status = EDMA_ST_BUSY;
 		dw_edma_start_transfer(chan);
-		dw_edma_core_ch_maybe_doorbell(chan);
+		dw_edma_core_ch_maybe_doorbell_or_recheck(chan);
 	}
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
@@ -1101,7 +1249,7 @@ static void dw_edma_ll_interrupt(struct dw_edma_chan *chan)
 	}
 
 out:
-	dw_edma_core_ch_maybe_doorbell(chan);
+	dw_edma_core_ch_maybe_doorbell_or_recheck(chan);
 }
 
 static bool dw_edma_abort_interrupt(struct dw_edma_chan *chan)
@@ -1140,6 +1288,11 @@ static void dw_edma_irq_work(struct work_struct *work)
 						 irq_work);
 	unsigned int events;
 
+	if (unlikely(READ_ONCE(chan->dw->teardown))) {
+		atomic_set(&chan->irq_pending, 0);
+		return;
+	}
+
 	do {
 		events = atomic_xchg(&chan->irq_pending, 0);
 
@@ -1157,6 +1310,9 @@ static void dw_edma_irq_work(struct work_struct *work)
 static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
 				   unsigned int events)
 {
+	if (unlikely(READ_ONCE(chan->dw->teardown)))
+		return;
+
 	atomic_or(events, &chan->irq_pending);
 	queue_work(chan->dw->wq, &chan->irq_work);
 }
@@ -1394,6 +1550,9 @@ static void dw_edma_device_synchronize(struct dma_chan *dchan)
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
 
 	dw_edma_wait_termination(dchan);
+	scoped_guard(spinlock_irqsave, &chan->vc.lock)
+		dw_edma_ll_recheck_cancel(chan);
+	cancel_delayed_work_sync(&chan->ll_recheck_work);
 	cancel_work_sync(&chan->irq_work);
 	atomic_set(&chan->irq_pending, 0);
 	dw_edma_irq_events_discard(chan);
@@ -1447,6 +1606,8 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 		chan->status = EDMA_ST_IDLE;
 		chan->irq_mode = dw_edma_get_default_irq_mode(chan);
 		INIT_WORK(&chan->irq_work, dw_edma_irq_work);
+		INIT_DELAYED_WORK(&chan->ll_recheck_work,
+				  dw_edma_ll_recheck_work);
 		atomic_set(&chan->irq_pending, 0);
 		chan->ll_irq.idx = -1;
 		chan->ll_irq.event = DW_EDMA_LL_EVENT_NONE;
@@ -1789,23 +1950,39 @@ int dw_edma_remove(struct dw_edma_chip *chip)
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
index 3d4844b5c6e3..f56885747e57 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -127,6 +127,9 @@ struct dw_edma_chan {
 	bool				abort_pending;
 	raw_spinlock_t			event_lock;
 
+	struct delayed_work		ll_recheck_work;
+	unsigned long			ll_recheck_at;
+
 	u32				ll_max;		/* Data entries */
 	struct dw_edma_region		ll_region;	/* Linked list */
 	bool				ll_valid;	/* LL context programmed */
@@ -175,6 +178,8 @@ struct dw_edma {
 	 */
 	struct workqueue_struct		*wq;
 
+	bool				teardown;	/* Gate asynchronous hardware access */
+
 	raw_spinlock_t			lock;		/* Protect v0 shared registers */
 	raw_spinlock_t			event_lock[2];	/* Per-direction event scopes */
 
-- 
2.51.0

