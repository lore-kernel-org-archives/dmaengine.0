Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021092.outbound.protection.outlook.com [40.107.74.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFDB47F2EE;
	Wed, 12 Aug 2026 15:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550281; cv=fail; b=GgLlYrZLM2SpRSrpdRg8K+7g8M9z1bx2tk4ggnPzBNtuUgZKTwF1h7PrMHtS7g2SHf+96uvYJLikZbv+EPyT9LWLQRwlOuqz7nagU3H7wzZ8KZC1FQV+EGUaye9HNm1+xCbmmSgM2Vc/NhtULsjWokpsy2nSe8EIxThws6Y4oRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550281; c=relaxed/simple;
	bh=ud4Jzl0KJa84LGI3caI1hPSiMlfS2krmuR0rtWS4M0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i04ZR3Ru/48HtxKP1hTz7DQzDFhEb998Z2QU1u/Kxa3gPi65/9FRXNNfjyRiVxWyEluICEMATpdp1PTmDoAwPKHM+DBRrORIyK22jF1AO0NIqJVY3k/h8dP3slmatwpV5jN9BxT55OqVq9SyOJifqtFlb3idt0K3FEf8cCkZS+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=Bkv/fnVw; arc=fail smtp.client-ip=40.107.74.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="Bkv/fnVw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJfyHU5eK/8/j4ZEA6bW83nYYvtMUcJKCj4gu1U+USTabgcwdBTAnVAFtU7wBEYtt9+Wb9qTVXbreYsVb+lGL4UnTE4sT8g26dXgz76Nvi/lt4j2vxQ1yYfkXwqmBy6wbW46OQx18xDxVY6VeR9SZfCTDa4A3rTSzkx5FCivuuokAA2eiZDyvXN0tZzXzdj58zwFH7NUsFpvaKzT8JUZ/AeHDJf6UoCKBM77S/Oy2mViylXBeTUfbEIIFRwyLDAWBZYtl5SGSB/DXtqt3OZyRa66VdLKz/AemauflOK1nz6JwEEv8qEgFSRe6Xs+JegPhmgiZySTFLybtc9Cg2Np6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0C3o3VKNDrkEt7ThfP2wZuQan6sxjpQgTcuTyIin88=;
 b=drLLBXCKDsSVpiRp+3xWKWQd0zC+yweUGQZ72p7nI6Eag9Y6x4oczcyQv/feZMKzcouGpLb0C93Umhn2KA6vXRhO8TSwiX22qj6QYfdpi5nDeHl5bxhVeYnRiGkdaKzjVRHZpsGNOA0IHdG5oTmUw69fcwtT0v1iOKsfHaV4jb1W0wXGgo6rCVLnPG++Esv8idWsD2yLPWWKPY0X6h4ibM/0DHI1Sb9GiTaqpz//vwzyoVhBMsS+IR7g8xk1MqlY8m52clzZS4gDhhC1mnbqpE87j2tb7aTeyjHgURMwiYlQv4wjBRfmuaUDwEz/dI/ozDOeOfsP6j36jcGZGLMTOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0C3o3VKNDrkEt7ThfP2wZuQan6sxjpQgTcuTyIin88=;
 b=Bkv/fnVwDmlFn5+5H+0516T4w/6rzOOJrwHtU2bDEjlGqORjY33hqE40h3SK7PJUq5WWvHmleFyAfCPO6dlrmHUJ1RcjLOQHc/QduCUCwxfV+ooHXw6qTJs7pyxi5epZWrl+a117UsjEs6df8MtHPinR2VqxvRSa59MME4TiVss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB7069.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:343::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 15:57:43 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 15:57:43 +0000
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
Subject: [PATCH v5 22/24] dmaengine: dw-edma: Add engine recovery infrastructure
Date: Thu, 13 Aug 2026 00:57:19 +0900
Message-ID: <20260812155721.2807506-23-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260812155721.2807506-1-den@valinux.co.jp>
References: <20260812155721.2807506-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0088.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::9) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: 0798e43d-b68f-4ae5-f3be-08def88a7207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|23010399003|7416014|18002099003|22082099003|56012099006|6133799003|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	AHjaJvlwQm3HFrnItdGT1oqtEf5EiYeycVtHiP8CJawCg3NhrqoLZquxY6oBZVHN2hMEkHMA+EYrf8zpwMu4EUwur43vmkOKmq7lmkEaGo7NHGBGaSAdaztwJ/fRxxnt0nwMDTdX8WiQwm0N1yKK5YXLZW7eUFCptq7QikSO7SuAcIAD8rsiz8Kqcos1uCdKoOwzpPRYZw5WiVIjqcgGPKXNYrL7lUkXA4mXC12PExw4jLzkO4HKLjgpQwS9yEVkInLurxtqCXkDbme/c8WX1z1MJoayNbSfKCnC5cmcZ8Bi1mI7BG9UR87BvtMKuIAckntSD7ayLaaa4L4XxoDTAKtL4hdfGrBN6kSX4v5Shzq8rfpFWJys7CL4KOsUtcP1gpr+qOGS3Ke8bSxTa02nCFwIGik8IOp6RXL0IhQLwqPYUxvL7k23wv3MD99cx/h2XKlJ9irN3/6jwsgb3Euizu+OKN08TzjUN1O/rMtFO7Gu6nlQkpg75w9g320A3mQbg+cSQJ1csvtKV3j77Bk8OoetZyphmzsUqDj55HcVVyb764Rqof6phKoIT1cPbxJXX8/NM5ZGMJIkRvp+1/DAa3rQufUNJDGhQKGVrHXR76EITjd5XYzAtQqJLManp4+dtDU/z5MoN3BtBy+38pPx8WDkzMO4cBWCx5b/f0R1Cil+UxTaUdfMPSvIbTiAsADtPFz5g+2VxRjGbRSCCdlVzQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(23010399003)(7416014)(18002099003)(22082099003)(56012099006)(6133799003)(10067099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oTKAw3QWYUTAGsM8DogeH8IyMz/SROIlWeLyrbflUywMGTB2++ywq635iYJn?=
 =?us-ascii?Q?c84ri2lkR+wl43zRtJN03H6JRI/9EtJ56qDHvj++YqnE9QlcAtWH2vX07XAt?=
 =?us-ascii?Q?NzxlLiY82SF50x5Ls91RT6bNO2A9QSIlAXHDmvxvxhf+zz21s4FtE2bMvR9Z?=
 =?us-ascii?Q?6Vid6lTLGmZAmFf7UWauXtq0MWRf79UETg5Q8YZ9nXQlgwiz5wglqonoFdf9?=
 =?us-ascii?Q?RrOkZg11kPVdYgA5eRb8i+zVdN1/DFv+F7vHRZfLyraS1zuewy4YzsxSqwFQ?=
 =?us-ascii?Q?+1+IlAPOmID8otA9GOVpYWzRKYwbiSx3kreYjLMiOlL6JqwfvXjGVXJlsrNP?=
 =?us-ascii?Q?Lkjphr51d0rfiHsLA4/ymTymMENsxbB9O/HeH+Cht/YlPyWs6kgv/OEtuS4u?=
 =?us-ascii?Q?I/5yzDIwurekirUZofs/0RjG6zX5JgZwHhK9ZRM0rCjy6DoRwpq5SpDBQvVj?=
 =?us-ascii?Q?vMW5wR3dhtFShJeav+HeaM5Z7Hy0qad/Ly+bgoXdRjAtnfoTErYCH+646Jsa?=
 =?us-ascii?Q?yG9EStJblYAPLYZ6JRwJbQaFRpcESwQhKJV/6QSTyOw6Tcklp9Vqp9GeJiF1?=
 =?us-ascii?Q?Q41bArjOxXr4v7frmvX9zsruZrTjR+E/DX1d1gJF1YK8RNSh63ru5Pe9Jq3O?=
 =?us-ascii?Q?edPrNMD/hOmSg1kgyQ2oW4c+Gius6UR6IejgozV4dD3EsI3/I64DO91vXTva?=
 =?us-ascii?Q?03+a7EEt8ZO7jpBnWWejfMgC9yfh8flR1R8oc1cIY8f2imzvjL8X9I9xfNf1?=
 =?us-ascii?Q?AME7SEeDdrQz1BeWANzTXm8ptJGN1Z/r4KZTBQZsjwocc0nxktUd6BX9uBcQ?=
 =?us-ascii?Q?qaniKZ3edW5ow7Es9LgRG0+98ccU7wmwUmCJkXHZM8pVHKXv1XGufgeFAxRZ?=
 =?us-ascii?Q?Z9fAi8V9LDNWYMaJjsdYOJ2lyPSxcIpoSCIL2f8Pl4s3rwf0HRLxP+z7VOki?=
 =?us-ascii?Q?eCPYE47507005C9Wb08lhiJoH2Nav7BQfkrWH+s7hTFRC4VSwy4OjMLLwhWo?=
 =?us-ascii?Q?7lAONaC8j0qYMTe7j/RPOAmZ+lwrcWfrGmxS9/EQxnKaDJr8SFuc5Xy0qssa?=
 =?us-ascii?Q?Cns21VRDQDfqUD67UhTOqHEfhbWxLROTtssTgdu5OCgQ+1fNMsO9syJTSzeV?=
 =?us-ascii?Q?p6+TjvJfXTRbcJANgt1vZp1V9ciFaKazgc51PZoWxIpKtLG0IOw9+Xnpb0iO?=
 =?us-ascii?Q?BSkQATRdkceHyd/O3cmv4z3OTI2vSyOGMq08SwqNvVOTvy8PPWYG7z5HqWfr?=
 =?us-ascii?Q?LjfoUdNENjyTyKX+2WMEDWdeSfrl4YAdzYoKgaJSaGd+L2MD7cjstwCLSHzf?=
 =?us-ascii?Q?vzxOyc5mBXIbDlYVb4865UkTQexHfwtKYpVz4QcLQb3MBPRHYVHAzLzu86AX?=
 =?us-ascii?Q?ssJp9ink19tQDxSoFkTfqzQ2FME0audxSILMMvXBlLs+uZIg+04etWOOJVu7?=
 =?us-ascii?Q?DsZ0Whomjsif5+pMama7xy6DQUrVO6KDsMRiIz9cn+9c6KvGC0t70icQnl3b?=
 =?us-ascii?Q?lF7pKk4lG1P1nVa11XkFI84n8pW92o1VaVn8ipzm/tm3hpyK443Vq/7ZaPcx?=
 =?us-ascii?Q?9wnkogTvmLvfehtuStaROzjVy85HzhQwbS7xlEJb/BPgWAKb9hmCZjMI4Bm+?=
 =?us-ascii?Q?0xjYOtBtHonfkIow7oL7hIw56+68PTr5i9F5UfGSHjXXqnurPwS7ozG45AyK?=
 =?us-ascii?Q?OirWehcDguBjQMotSmNt9ZS7OdLM7VEGd9seRBx7Az4hT7DbSvYr+YnA7kCm?=
 =?us-ascii?Q?jf/TX/zxy90K6PhlSUokrg/z+NO4hmQV5/+DZfkvJ908CXuiqq4h?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 0798e43d-b68f-4ae5-f3be-08def88a7207
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:57:43.6098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MtffEXH8+RXZKsxo/QGxyNrXrbweCV+I7ZWcSfWQWPbSv2NCqcKfmpIYY9QRQyLLJdrK2uDkWqgJTwIRQT/J7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB7069

For eDMA, resetting one direction affects every channel in it. Add a
worker to coordinate that recovery.

Gate publication and doorbells, and prevent channel setup from
re-enabling the direction during recovery. Wait for active LL channels
to stop. If a transfer is still active, compare two transfer-size
samples. Retry when it is moving; treat an unchanged value as frozen.

For a frozen direction, drain IRQ handling so pending ABORT cleanup can
finish. If recovery is still needed, reset the direction, rebuild every
exposed LL context while it remains disabled, publish remote LL writes,
and enable it again. Honor EDMA_REQ_STOP and EDMA_REQ_PAUSE during the
rebuild; keep channels gated and retry if reset keeps failing.

Providers opt in with engine_reset(), engine_enable(), and
ch_transfer_size(). No caller requests recovery until the next patch.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - Keep recovery active after engine_reset() times out because the direction
    may still become disabled, even if pending work completes. (Sashiko)

 drivers/dma/dw-edma/dw-edma-core.c | 325 ++++++++++++++++++++++++++++-
 drivers/dma/dw-edma/dw-edma-core.h |  22 +-
 2 files changed, 342 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index ed5654c63933..daf1fa89ef94 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -28,6 +28,10 @@
 /* Empirically chosen progress interval. */
 #define DW_EDMA_LL_PROGRESS_INTERVAL	4
 #define DW_EDMA_LL_RECHECK_DELAY_MS		30
+#define DW_EDMA_ENGINE_QUIESCE_TIMEOUT_MS	250
+#define DW_EDMA_ENGINE_RESET_FAST_ATTEMPTS	5
+#define DW_EDMA_ENGINE_RESET_RETRY_DELAY_MS	5000
+#define DW_EDMA_MAX_DIR_CH			MAX(HDMA_MAX_WR_CH, HDMA_MAX_RD_CH)
 
 static inline
 struct dw_edma_desc *vd2dw_edma_desc(struct virt_dma_desc *vd)
@@ -185,6 +189,22 @@ dw_edma_set_request(struct dw_edma_chan *chan, enum dw_edma_request request)
 	chan->request = request;
 }
 
+static void
+dw_edma_engine_recovery_schedule(struct dw_edma_engine_recovery *rec,
+				 unsigned long delay)
+{
+	if (unlikely(READ_ONCE(rec->dw->teardown)))
+		return;
+
+	queue_delayed_work(rec->dw->wq, &rec->work, delay);
+}
+
+static void
+dw_edma_engine_recovery_queue(struct dw_edma_engine_recovery *rec)
+{
+	dw_edma_engine_recovery_schedule(rec, 0);
+}
+
 static void dw_hdma_set_callback_result(struct virt_dma_desc *vd,
 					enum dmaengine_tx_result result)
 {
@@ -237,6 +257,7 @@ static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
 
 	chan->ll_head = 0;
 	chan->ll_done = 0;
+	chan->ll_recovery_pending = false;
 	/* Drop stale CB bits before reusing the circular LL ring. */
 	for (i = 0; i < chan->ll_max; i++)
 		dw_edma_core_ll_clear(chan, i);
@@ -401,7 +422,7 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
 		return 1;
 	}
 
-	if (dw_edma_abort_is_pending(chan))
+	if (chan->ll_recovering || dw_edma_abort_is_pending(chan))
 		return 0;
 
 	if (!chan->ll_valid)
@@ -556,8 +577,10 @@ static bool dw_edma_ll_consume_progress(struct dw_edma_chan *chan, int idx)
 	WARN_ON_ONCE(done);
 
 out:
-	if (advanced)
+	if (advanced) {
 		dw_edma_ll_recheck_cancel(chan);
+		chan->ll_recovery_pending = false;
+	}
 
 	return advanced;
 }
@@ -711,6 +734,7 @@ static void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
 static bool dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
 {
 	if (chan->non_ll ||
+	    chan->ll_recovering ||
 	    chan->status != EDMA_ST_BUSY ||
 	    !dw_edma_ll_pending(chan) ||
 	    dw_edma_abort_is_pending(chan))
@@ -790,6 +814,292 @@ static void dw_edma_ll_recheck_work(struct work_struct *work)
 	dw_edma_core_ch_maybe_doorbell(chan);
 }
 
+static bool
+dw_edma_engine_recovery_needed(struct dw_edma_engine_recovery *rec)
+{
+	struct dw_edma *dw = rec->dw;
+	u16 off = rec->dir == EDMA_DIR_WRITE ? 0 : dw->wr_ch_cnt;
+	u16 cnt = rec->dir == EDMA_DIR_WRITE ? dw->wr_ch_cnt : dw->rd_ch_cnt;
+	struct dw_edma_chan *chan;
+	bool found = false;
+	bool needed;
+	u16 i;
+
+	for (i = 0; i < cnt; i++) {
+		chan = &dw->chan[off + i];
+		scoped_guard(spinlock_irqsave, &chan->vc.lock) {
+			needed = chan->ll_recovery_pending && chan->configured &&
+				 !chan->non_ll &&
+				 chan->status != EDMA_ST_PAUSE;
+			if (needed && chan->request == EDMA_REQ_NONE &&
+			    dw_edma_ll_reconcile_and_refill(chan))
+				dw_edma_core_ch_maybe_doorbell(chan);
+			needed = needed && chan->ll_recovery_pending &&
+				 dw_edma_ll_pending(chan);
+			if (!needed)
+				chan->ll_recovery_pending = false;
+		}
+		found |= needed;
+	}
+
+	return found;
+}
+
+static bool
+dw_edma_engine_recovery_incomplete(struct dw_edma_engine_recovery *rec)
+{
+	bool needed = dw_edma_engine_recovery_needed(rec);
+
+	/* A timed-out reset may still disable the engine before the retry. */
+	return needed || rec->fails;
+}
+
+static void
+dw_edma_engine_recovery_release(struct dw_edma_engine_recovery *rec)
+{
+	struct dw_edma *dw = rec->dw;
+	u16 off = rec->dir == EDMA_DIR_WRITE ? 0 : dw->wr_ch_cnt;
+	u16 cnt = rec->dir == EDMA_DIR_WRITE ? dw->wr_ch_cnt : dw->rd_ch_cnt;
+	struct dw_edma_chan *chan;
+	u16 i;
+
+	rec->fails = 0;
+
+	for (i = 0; i < cnt; i++) {
+		chan = &dw->chan[off + i];
+		guard(spinlock_irqsave)(&chan->vc.lock);
+		chan->ll_recovering = false;
+
+		if (!READ_ONCE(dw->teardown) &&
+		    chan->configured && !chan->non_ll &&
+		    chan->request == EDMA_REQ_NONE &&
+		    chan->status != EDMA_ST_PAUSE) {
+			dw_edma_start_transfer(chan);
+			chan->status = dw_edma_ll_pending(chan) ?
+				       EDMA_ST_BUSY : EDMA_ST_IDLE;
+			dw_edma_core_ch_maybe_doorbell(chan);
+		}
+	}
+
+	WRITE_ONCE(rec->active, false);
+}
+
+static void
+dw_edma_engine_recovery_drain_irqs(struct dw_edma_engine_recovery *rec)
+{
+	struct dw_edma *dw = rec->dw;
+	struct device *dev = dw->chip->dev;
+	u16 off = rec->dir == EDMA_DIR_WRITE ? 0 : dw->wr_ch_cnt;
+	u16 cnt = rec->dir == EDMA_DIR_WRITE ? dw->wr_ch_cnt : dw->rd_ch_cnt;
+	struct dw_edma_chan *chan;
+	u16 i;
+
+	/* Drain events observed before the engine context changes. */
+	for (i = 0; i < dw->nr_irqs; i++) {
+		if (bitmap_empty(rec->dir == EDMA_DIR_WRITE ?
+				 dw->irq[i].wr_mask : dw->irq[i].rd_mask, cnt))
+			continue;
+
+		synchronize_irq(dw->chip->ops->irq_vector(dev, i));
+	}
+
+	for (i = 0; i < cnt; i++) {
+		chan = &dw->chan[off + i];
+		flush_work(&chan->irq_work);
+	}
+}
+
+static void dw_edma_engine_recovery_work(struct work_struct *work)
+{
+	struct dw_edma_engine_recovery *rec =
+		container_of(to_delayed_work(work),
+			     struct dw_edma_engine_recovery, work);
+	struct dw_edma *dw = rec->dw;
+	const char *dir_name = str_write_read(rec->dir == EDMA_DIR_WRITE);
+	u16 off = rec->dir == EDMA_DIR_WRITE ? 0 : dw->wr_ch_cnt;
+	u16 cnt = rec->dir == EDMA_DIR_WRITE ? dw->wr_ch_cnt : dw->rd_ch_cnt;
+	unsigned long timeout =
+		jiffies + msecs_to_jiffies(DW_EDMA_ENGINE_QUIESCE_TIMEOUT_MS);
+	struct dw_edma_chan *chan;
+	bool configured_ll;
+	bool busy;
+	u16 i;
+
+	/*
+	 * Recovery resets a whole direction. The legacy eDMA register map does
+	 * not support partial ownership, while unrolled eDMA partial ownership
+	 * and delegation are direction-granular. Native HDMA permits per-channel
+	 * ownership, but does not provide direction recovery operations.
+	 */
+	if (unlikely(READ_ONCE(dw->teardown)))
+		return;
+
+	if (!dw_edma_engine_recovery_incomplete(rec)) {
+		if (READ_ONCE(rec->active))
+			dw_edma_engine_recovery_release(rec);
+		return;
+	}
+
+	WRITE_ONCE(rec->active, true);
+
+	/* Gate each channel before inspecting or resetting the direction. */
+	for (i = 0; i < cnt; i++) {
+		chan = &dw->chan[off + i];
+		guard(spinlock_irqsave)(&chan->vc.lock);
+		chan->ll_recovering = true;
+	}
+
+	/*
+	 * Gated channels stop at their first unpublished element. Wait for that
+	 * point before resetting; otherwise a restart could skip the remainder
+	 * of an in-flight element.
+	 */
+	do {
+		busy = false;
+		for (i = 0; i < cnt; i++) {
+			chan = &dw->chan[off + i];
+			scoped_guard(spinlock_irqsave, &chan->vc.lock)
+				configured_ll = chan->configured && !chan->non_ll;
+			if (configured_ll &&
+			    dw_edma_core_ch_status(chan) == DMA_IN_PROGRESS)
+				busy = true;
+		}
+		if (!busy)
+			break;
+		fsleep(1000);
+	} while (time_before(jiffies, timeout));
+
+	/* Progress after queueing makes this recovery request obsolete. */
+	if (!dw_edma_engine_recovery_incomplete(rec)) {
+		dw_edma_engine_recovery_release(rec);
+		return;
+	}
+
+	if (busy) {
+		DECLARE_BITMAP(busy_mask, DW_EDMA_MAX_DIR_CH) = { 0 };
+		u32 tsz[DW_EDMA_MAX_DIR_CH];
+		bool moving = false;
+
+		/*
+		 * A transfer_size change or a transition out of DMA_IN_PROGRESS
+		 * shows movement after the first sample. Retry while producers
+		 * remain gated. If neither occurs, treat the channel as frozen
+		 * within one element.
+		 */
+		for (i = 0; i < cnt; i++) {
+			chan = &dw->chan[off + i];
+			scoped_guard(spinlock_irqsave, &chan->vc.lock)
+				configured_ll = chan->configured && !chan->non_ll;
+			if (configured_ll &&
+			    dw_edma_core_ch_status(chan) == DMA_IN_PROGRESS) {
+				__set_bit(i, busy_mask);
+				tsz[i] = dw_edma_core_ch_transfer_size(chan);
+			}
+		}
+		fsleep(1000);
+		for_each_set_bit(i, busy_mask, cnt) {
+			chan = &dw->chan[off + i];
+			if (dw_edma_core_ch_status(chan) != DMA_IN_PROGRESS ||
+			    tsz[i] != dw_edma_core_ch_transfer_size(chan))
+				moving = true;
+		}
+		if (!dw_edma_engine_recovery_incomplete(rec)) {
+			dw_edma_engine_recovery_release(rec);
+			return;
+		}
+		if (moving) {
+			dev_warn_ratelimited(dw->chip->dev,
+					     "%s engine quiesce timed out with transfers still progressing, retrying\n",
+					     dir_name);
+			dw_edma_engine_recovery_queue(rec);
+			return;
+		}
+
+		dev_warn(dw->chip->dev,
+			 "%s engine reset with a channel frozen mid-element\n",
+			 dir_name);
+	}
+
+	if (!dw_edma_engine_recovery_incomplete(rec)) {
+		dw_edma_engine_recovery_release(rec);
+		return;
+	}
+
+	/*
+	 * Let a terminal ABORT finish its normal channel cleanup before a
+	 * direction-wide reset. It may also make recovery unnecessary.
+	 */
+	dw_edma_engine_recovery_drain_irqs(rec);
+	if (!dw_edma_engine_recovery_incomplete(rec)) {
+		dw_edma_engine_recovery_release(rec);
+		return;
+	}
+
+	if (!dw->core->engine_reset(dw, rec->dir)) {
+		unsigned long delay = 0;
+
+		/*
+		 * Keep channels gated and do not re-enable the engine unless
+		 * ENGINE_EN clears.
+		 */
+		if (++rec->fails >= DW_EDMA_ENGINE_RESET_FAST_ATTEMPTS)
+			delay = msecs_to_jiffies(DW_EDMA_ENGINE_RESET_RETRY_DELAY_MS);
+		if (rec->fails == DW_EDMA_ENGINE_RESET_FAST_ATTEMPTS)
+			dev_err(dw->chip->dev,
+				"%s engine did not drain after %u attempts; retrying every %u ms\n",
+				dir_name, rec->fails,
+				DW_EDMA_ENGINE_RESET_RETRY_DELAY_MS);
+		dw_edma_engine_recovery_schedule(rec, delay);
+		return;
+	}
+
+	if (rec->fails)
+		dev_warn(dw->chip->dev, "%s engine drained after %u retries\n",
+			 dir_name, rec->fails);
+
+	/* Drain an event that raced with the engine reset. */
+	dw_edma_engine_recovery_drain_irqs(rec);
+
+	/*
+	 * Keep the engine disabled until every LL channel context is rebuilt.
+	 * On the tested integration, re-enabling a preserved context resumed an
+	 * old element without a doorbell, causing an IOMMU fault and stalling the
+	 * engine again. Reset each ring so it starts from a fresh context, and
+	 * complete remote LL publication before re-enabling the direction.
+	 */
+	for (i = 0; i < cnt; i++) {
+		bool stop;
+
+		chan = &dw->chan[off + i];
+		guard(spinlock_irqsave)(&chan->vc.lock);
+
+		if (chan->non_ll)
+			continue;
+
+		/* Honor EDMA_REQ_STOP and EDMA_REQ_PAUSE instead of republishing. */
+		stop = chan->request == EDMA_REQ_STOP;
+		if (stop)
+			dw_edma_terminate_all_descs(chan);
+
+		dw_edma_core_reset_ll(chan);
+		dw_edma_core_ll_sync(chan);
+
+		if (stop) {
+			dw_edma_set_request(chan, EDMA_REQ_NONE);
+			chan->status = EDMA_ST_IDLE;
+		} else if (chan->request == EDMA_REQ_PAUSE) {
+			dw_edma_set_request(chan, EDMA_REQ_NONE);
+			chan->status = EDMA_ST_PAUSE;
+		}
+	}
+
+	dw->core->engine_enable(dw, rec->dir);
+	dw_edma_engine_recovery_release(rec);
+
+	dev_warn(dw->chip->dev, "%s engine was reset to recover a stalled channel\n",
+		 dir_name);
+}
+
 static void dw_edma_device_caps(struct dma_chan *dchan,
 				struct dma_slave_caps *caps)
 {
@@ -1991,6 +2301,13 @@ int dw_edma_probe(struct dw_edma_chip *chip)
 	for (i = 0; i < ARRAY_SIZE(dw->event_lock_per_dir); i++)
 		spin_lock_init(&dw->event_lock_per_dir[i]);
 
+	for (i = 0; i < ARRAY_SIZE(dw->eng_recovery); i++) {
+		dw->eng_recovery[i].dw = dw;
+		dw->eng_recovery[i].dir = i;
+		INIT_DELAYED_WORK(&dw->eng_recovery[i].work,
+				  dw_edma_engine_recovery_work);
+	}
+
 	/*
 	 * chip->ll_*_cnt describes the channels exposed by this instance. Keep
 	 * the usable hardware counts separate for partial ownership checks.
@@ -2109,6 +2426,10 @@ int dw_edma_remove(struct dw_edma_chip *chip)
 	WRITE_ONCE(dw->teardown, true);
 	dma_async_device_unregister(&dw->dma);
 
+	/* A recovery worker can re-enable the engine. */
+	disable_delayed_work_sync(&dw->eng_recovery[0].work);
+	disable_delayed_work_sync(&dw->eng_recovery[1].work);
+
 	/*
 	 * Drain channel work that may have passed the teardown gate before
 	 * stopping the hardware. IRQ handlers remain installed while it is
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index 329f02c58995..855ffbd2c06e 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -128,6 +128,9 @@ struct dw_edma_chan {
 
 	struct delayed_work		ll_recheck_work;
 	unsigned long			ll_recheck_at;
+	/* Per-channel recovery state. */
+	bool				ll_recovery_pending;
+	bool				ll_recovering;
 
 	u32				ll_max;		/* Data entries */
 	struct dw_edma_region		ll_region;	/* Linked list */
@@ -158,6 +161,18 @@ struct dw_edma_irq {
 	DECLARE_BITMAP(rd_mask, HDMA_MAX_RD_CH);
 };
 
+/*
+ * Direction-wide recovery state. active records that recovery has gated the
+ * channels; workqueue state coalesces duplicate requests.
+ */
+struct dw_edma_engine_recovery {
+	bool				active;
+	unsigned int			fails;
+	struct delayed_work		work;
+	struct dw_edma			*dw;
+	enum dw_edma_dir		dir;
+};
+
 struct dw_edma {
 	char				name[32];
 
@@ -172,12 +187,13 @@ struct dw_edma {
 	struct dw_edma_chan		*chan;
 
 	/*
-	 * WQ_HIGHPRI keeps completion processing responsive under heavy load;
-	 * WQ_UNBOUND lets different channels run on different CPUs.
+	 * WQ_HIGHPRI keeps completion and recovery work responsive under heavy
+	 * load; WQ_UNBOUND lets independent work run on different CPUs.
 	 */
 	struct workqueue_struct		*wq;
 
 	bool				teardown;	/* Gate asynchronous hardware access */
+	struct dw_edma_engine_recovery	eng_recovery[2];
 
 	raw_spinlock_t			lock;		/* Protect v0 shared registers */
 	/* Per-direction lock storage for the eDMA interrupt registers. */
@@ -374,7 +390,7 @@ static inline void dw_edma_core_do_ch_doorbell(struct dw_edma_chan *chan)
 static inline void dw_edma_core_ch_enable(struct dw_edma_chan *chan)
 {
 	chan->dw->core->ch_enable(chan);
-	if (chan->dw->core->engine_enable)
+	if (!chan->ll_recovering && chan->dw->core->engine_enable)
 		chan->dw->core->engine_enable(chan->dw, chan->dir);
 }
 
-- 
2.51.0

