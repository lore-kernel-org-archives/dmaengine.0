Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020109.outbound.protection.outlook.com [52.101.228.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F9C4156FA;
	Thu, 23 Jul 2026 08:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784796146; cv=fail; b=iUGk6cmkBJdysIvlCCRx0aJH3A0VrJ/xRhWdB9wo3Rgj4rTipiSuMnKf0TY5zoGrj5NQB+jdu+eHXwc7Z+Qah9qePjULIz9lGINL01UMrw0kaPCPr9Yf4D1IM12kfEY1+fqglGMQKMYwM0B/U4RufN4Vs6/hAO1DMWEtY0EXq98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784796146; c=relaxed/simple;
	bh=VcTslGcFAJnAqJtUJ/r4Qu9w7jT4yhvMhMs4UmrV3XQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tJHwTO68cmMYbsJtg8r/fLuKh0s0fnmR2jOexOIdQo064mi5137WJF3wMQNxvLj2mO7KkF0h/7HZqqymORNoh/P3NZkrLY6tFGipHmxlssnLREn+JsCdh6ZwnpaT8AttdBEMRKT8TJnSMIU3DNgJXNHuWkkA4mp3LZxyUGff2OM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=FGfeCydC; arc=fail smtp.client-ip=52.101.228.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="FGfeCydC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EjCbsC6C77r1PDFtKoEpcC0oqZamqWum5QUPRxLrGN/FTBSTFPEAy+yyTe1geGkzcoY5w09UIK24Wq4d4MeMuxfNsPIa9QF1QqxT6NAY+ISY67xwT3HJu0iOnP9orsvEc0zB2C9Wz77G2rhapnHk7IgwQsjn0gwmgr7hzDre1AV9EJX0ZfroG0rsSUZ335al2Eagr2VW2o1aeoZdK0hU/Xc0wfO9ufsgWHOyI8N4FRTYnn5is6VOuQogunMKRl5sSqVU3bAGk+OqS36qQYCBZTPV3EZ7Szd7+CFWzdNLsfv3M3tzJGdGC+tYdZwq0k3jtj219CcBDq4bGgUEUBOLTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZzmpEFV0VM0d49GiZJQsZsoKzQ0JkecgQZ/w3tlV50=;
 b=qwh7jNeuj/8E8rvVJA8yNx6lRAybZOwCRLUksVR0Q+ktvWLIr2d+pJU3MYkNa7xeIr8kxW/Bdq4DdLOsLVpWirFDcOCjLYdr9ZW+kqlk6ucyva9tWAGUjw+uT8YChX9VuwV1bYVsYvV1ftVIkrKcRVG5dJueW2YQE7iSiYPKekOSwawbpVrGSMMzEbiSG4Lv0saK2THrZGOcCmGHP7dOAO2O1BPN1M9mbZoEXPxXcdQPT3NOcJ1wB5MXFgxtey0zqQpmna/sZcYGnKdqAVZgUR97+2g8L1jfhZ+0OR8TcNxeILw/jk4McGtq/fHjv9yhBHGSTErPjwxDymLy/4XrDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZzmpEFV0VM0d49GiZJQsZsoKzQ0JkecgQZ/w3tlV50=;
 b=FGfeCydChe10Z77FBGQ/Du5cmdQGYQxb4VqCHKE3tCwJ14dgmWxFrYgqz6AjnovP41HJz7WDtbe/jpXtgrDDnncNW9hObg2yfkKgf1gowgCiKnQuG3qvLU+42CPpInAzAdXPvYzIcDW+ECUF30eo6toFGdt8c+5c0WyjTC9eYNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB1883.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:111::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 08:42:11 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 08:42:11 +0000
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
Subject: [PATCH v2 17/19] dmaengine: dw-edma: Detect and recover a stalled eDMA engine
Date: Thu, 23 Jul 2026 17:41:48 +0900
Message-ID: <20260723084150.521366-18-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260723084150.521366-1-den@valinux.co.jp>
References: <20260723084150.521366-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0116.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::6) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB1883:EE_
X-MS-Office365-Filtering-Correlation-Id: cbb677fd-5774-4403-de5a-08dee8964944
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|10070799003|366016|1800799024|921020|6133799003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ww/dq8EOx6RuL3mneuAgC9DmYZq5DO+mBF6qAsL5tUjAFJGooN/4knvQrGSdbGEB7FjUkJqkrsZWLkP5S1GZacqpRoFm/7RrRnfwEl9A9a7MZzmgze+njyr9pOWa2CQnElPU9ZKPLvTnwny1ZHWj80LwFFDVQ2fNtVkgW9sB+JJydfC2AIKrovKayqV96/PW2DiXD2QfygQykXLO7d0LV3ctW+RAThto/D3MtLSCpTHM/mmvTRUyZc1mjq7h0aX5RqOyGYjy+V8I0gVFqKPfpm7wOE3LZZ/G8DGfYhLuHNgDblVlV2Byu5cDZ++3k8ch1OV0o7QoCkSBEJ+vvjxEmm7ppRoZi7BkPJlzll9wccye+AlSkl2t/uF5jHUgTpxoLm8c2UWooPBhxneHKm9v2p+bbgFf+dhNTXQilPeQNDq/3Z5A96oGfeD5npFTtfrAYLuvKasvaL+xSwDFUI7GwRaXO0ajx8Nfe2EhEKrDeHmg8cA6yVZnXQXDgF8T7ou88zPTloqZ72ZoTX/qzjN83/WjnHlTCpZpdn1eGeMQIrv8aoAM4dVAZS8fnSaCZqlycqz2O5WDI2GkgyoK1uYCLAEkDWU3bV2ifOBIVQv4Qp9lHiClS3RidKN/ldex8Q/ZFTDoBDJtwDpqNAri1p3th60l1vRoUvJbwXe7HNvbYKnEtYbNNTjrhsbRsTtR7QfwPggTDU9esr//VDavbF8KJQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(10070799003)(366016)(1800799024)(921020)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2Sx5v9yDMO++BmlwgHHkzxC55eYHRVtsAaaqPHnPWMhMZWRN2pHH7hA9gXv7?=
 =?us-ascii?Q?XWVDhLQiLSvlkFJSJDK4HKZ83u2L9EtrfBhZ5cxts3yFqlfBHdBOMJKma7ib?=
 =?us-ascii?Q?HYJYUzcObajHrdmsv4/AJqB9K8kQvr+4qNnazi4ONWNDGdblbrwwD5DZB35N?=
 =?us-ascii?Q?R52GxFB5LO0NiIzJYYfhXnlDfLX+H6PEzzjlSJhnpqAoHGTwDDS8QnvPeuK6?=
 =?us-ascii?Q?YVlF9kHIIEkj8nzR5sU0BD/mE6Ko4DXoD7Hg1/9fS/GAfu8Jyj7Uof1iRaK/?=
 =?us-ascii?Q?Git0b/F3ccb84LBQn5HiqyBEcW4Ryqv1lG4OlimCxnASj2TXC3tX6PKpzFBM?=
 =?us-ascii?Q?vlEqkPiiyRn+CJK21k4Z8eWVJOM275uGprL/uy/PwMf4NGLAc5VfL9IPIfCt?=
 =?us-ascii?Q?TkXKqlLzlFgS3fkHnxbXFWaPqOoOuPo2HhdexsTZzHliUcW95Af/I7eGXkju?=
 =?us-ascii?Q?24kyKt/NjmUpzKo89gtRLezx93uPSPsfyH2x0gIylLUP7iM8+kz3BP8WPJ8Z?=
 =?us-ascii?Q?0FefsIh36G7RW28dk1vRqqOZVlf08cxVH0knEZlHwM5CgbKdlNctM4Z8/8Xz?=
 =?us-ascii?Q?4A3lnhMzE3e8lkOWtXwMQ06cgd8yY9FbcEpwXThzgbLfMi0zqjUGFdNJ808h?=
 =?us-ascii?Q?mYCKST9BGXFfZ83lrBt5sZVPBi3bHcB1QFy846VlRFFw2G4NIKrLt61IlFPy?=
 =?us-ascii?Q?wQwhFo/BQ6Uig7i90ZUeJ7Xz4cQGXSoClkSc5REo4lmwpLX6/3TRdRuvTlBW?=
 =?us-ascii?Q?TlOhP39uvGP6Rrua7ECk4kYNfyRLZ1vLVqIsOXJ0k7aBq1rpDe3Jqed7sw+z?=
 =?us-ascii?Q?ePed0zn6AY9KqQPUYOJtcMuPzpzoRkZW9yDddzfrONhX/LN8/lUUnDaoU91l?=
 =?us-ascii?Q?CF3OceGlcvPpEcg/EOAUHDqIBpEH8gKcEuOledUZzz+2A6Q3XYf0z/OXKLDj?=
 =?us-ascii?Q?+7KANeYpXCFXGa0xe8TakAeveC43zZAmerLPnHIYWuylzWRCJKJEF3jJE2oV?=
 =?us-ascii?Q?MF3LI6tmwuK+pkryiUpCqlexVw4ZoooCQMigMzqReSQAi+DTYpSaHIpvebDA?=
 =?us-ascii?Q?Z6eyjt+TQS+lSDy+AAYXEkyf0RArqaeE/6+GxFI3U7vLAzHpSMaSEucyZ3i5?=
 =?us-ascii?Q?0h1tDJw5OtTqflX/yJYlPxw7SbH5C59rSGdgMKtSoTHNOv/cAMy+29qpml1h?=
 =?us-ascii?Q?yEmd8JNEZjvKQD8J+3KEbWNNcFCEcWFcuqhH9wSDyLV8vmGc8jihNjnIZCTw?=
 =?us-ascii?Q?bV+Xm3C4oG9y+cy+jR3OxpNwpe5TkbVXeu89Ec4wTi34oMRdnnzVQcGWT4ZR?=
 =?us-ascii?Q?TDcQYKd2wkoc+PeIe+zkddNfbKWm26Z/rfsp3tCQ2ZCPN7CrX7F8amyegFvB?=
 =?us-ascii?Q?YrgSm+EaLBOj/sG//z2/GUfl0Dj+kI++ZfgAdZKcnjWReCMrS9ZOEB/3b7r1?=
 =?us-ascii?Q?k8X2E8LfseLfECnLL8EPJBGiQ8cw+zBwfgflJx6lCvNrrJ6pe6YJ0Nm6tdLK?=
 =?us-ascii?Q?7PpJLpE+EhNLORAYiZGGM7v28Q660QWDM/w40otBoiF2gYCo/2NaYDg3f6XW?=
 =?us-ascii?Q?hdEIaC/PNoRCPe9AAQkiXwLoBx74DmY+7suTBmQps8AwvyfTjUjQkhvpvH1G?=
 =?us-ascii?Q?la31MMtv2jHacOLZ5e1RVN39IqDMC0HY8nI7elOY7WRSu2NnKBKcnRVH+Q0V?=
 =?us-ascii?Q?lDWLQC4TVo0xEd9cl6FsqxZGukWz/HJbyoNr2Ih6WOekEex+3nE3YUmKeNw8?=
 =?us-ascii?Q?EhV9ocemDymFBMc8HXxkfI3gs38CGqP0DUvN10wKRSLxB6hoEVMw?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: cbb677fd-5774-4403-de5a-08dee8964944
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 08:42:10.5883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2iXTIYkxerLgAXS/99O4ckSY849y9kWn92eyMWavHQoyv7o1sEzefdL5feVXuM8imiMDiyEtjUC2JloQ9x62gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1883

Under sustained multi-channel traffic on one legacy eDMA integration, a
write channel occasionally stopped with pending work, no progress, and
no error. Repeated doorbells did not restart it; clearing ENGINE_EN did.

Start a stall window when the common doorbell path sees a stopped channel
with pending entries. If a later check still finds no progress after 30
ms, reconcile the stopped LLP boundary and queue direction recovery.
Clear the stall state whenever progress advances. Another doorbell-path
check, not a timer, confirms the stall.

Only providers with the recovery operations opt in. Exclude HDMA
compatibility mode because it has no ENGINE_EN. The trigger and timeout
remain empirical and need coverage on other integrations.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v2:
  - New patch.

 drivers/dma/dw-edma/dw-edma-core.c | 46 ++++++++++++++++++++++++++++++
 drivers/dma/dw-edma/dw-edma-core.h |  4 ++-
 2 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 14cd0038dbd2..1b9ba34b25c8 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -24,6 +24,7 @@
 #include "../dmaengine.h"
 #include "../virt-dma.h"
 
+#define DW_EDMA_LL_STALL_TIMEOUT_MS		30
 #define DW_EDMA_ENGINE_QUIESCE_TIMEOUT_MS	250
 #define DW_EDMA_ENGINE_RESET_MAX_FAILS		5
 #define DW_EDMA_MAX_DIR_CH			MAX(HDMA_MAX_WR_CH, HDMA_MAX_RD_CH)
@@ -129,6 +130,7 @@ static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
 	chan->ll_head = 0;
 	chan->ll_done = 0;
 	dw_edma_ll_irq_idx_discard(chan);
+	chan->ll_stall_valid = false;
 	chan->ll_recovery_pending = false;
 	/* Drop stale CB bits before reusing the circular LL ring. */
 	for (i = 0; i < chan->ll_max; i++)
@@ -183,11 +185,52 @@ static bool dw_edma_ll_advance(struct dw_edma_chan *chan, int idx, u32 *old_done
 
 	*old_done = chan->ll_done;
 	chan->ll_done = idx;
+	chan->ll_stall_valid = false;
 	chan->ll_recovery_pending = false;
 
 	return true;
 }
 
+/*
+ * Called with vc.lock held for a stopped channel with LL work pending. Queue
+ * direction recovery if repeated doorbells show no progress for the stall
+ * timeout.
+ */
+static void dw_edma_ll_stall_check(struct dw_edma_chan *chan)
+{
+	struct dw_edma_engine_recovery *rec;
+
+	/*
+	 * DWC PCIe Controller Databook 6.10a-lca06, "Legacy DMA and HDMA
+	 * Software Compatibility":
+	 *
+	 * "HDMA does not implement engine enable, that is
+	 * DMA_[WRITE|READ]_ENGINE_EN_OFF.DMA_[WRITE|READ]_ENGINE field."
+	 */
+	if (chan->dw->chip->mf == EDMA_MF_HDMA_COMPAT)
+		return;
+
+	if (!chan->dw->core->engine_reset ||
+	    !chan->dw->core->engine_enable ||
+	    !chan->dw->core->ch_transfer_size)
+		return;
+
+	if (!chan->ll_stall_valid) {
+		chan->ll_stall_valid = true;
+		chan->ll_stall_since = jiffies;
+		return;
+	}
+
+	if (!time_after(jiffies, chan->ll_stall_since +
+			msecs_to_jiffies(DW_EDMA_LL_STALL_TIMEOUT_MS)))
+		return;
+
+	rec = &chan->dw->eng_recovery[chan->dir];
+	chan->ll_recovery_pending = true;
+	if (!READ_ONCE(rec->active))
+		queue_work(chan->dw->wq, &rec->work);
+}
+
 static bool dw_edma_ll_pending(struct dw_edma_chan *chan)
 {
 	return dw_edma_core_get_used_num(chan);
@@ -492,10 +535,13 @@ static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
 	if (dw_edma_core_ch_status(chan) == DMA_IN_PROGRESS)
 		return;
 
+	/* Reconcile a lost tail completion before declaring a stall. */
 	dw_edma_ll_reconcile_and_refill(chan);
 	if (!dw_edma_ll_pending(chan))
 		return;
 
+	dw_edma_ll_stall_check(chan);
+
 	dw_edma_core_ch_doorbell(chan);
 }
 
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index 5520f49a76f1..f67232110f3c 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -104,7 +104,9 @@ struct dw_edma_chan {
 	bool				ll_irq_stopped;
 	bool				ll_irq_requested;
 
-	/* Per-channel recovery state. */
+	/* Per-channel stall and recovery state. */
+	unsigned long			ll_stall_since;
+	bool				ll_stall_valid;
 	bool				ll_recovery_pending;
 	bool				ll_recovering;
 
-- 
2.51.0

