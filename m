Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020108.outbound.protection.outlook.com [52.101.229.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6E3397951;
	Wed, 29 Jul 2026 14:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785335470; cv=fail; b=giAKTYtgwBgC0xK9uc8pud61HnTjCqwz8RTSFyLWY/SlOu2ZHIadQfZxyYe8ZYdFPxFCM2EKyTb5xkhBApT55Gsi2UZVh0AXnbGi/k0BNmvGYiGS/LEeN/HrBFIevAgnr2jMPWiO4qKr6dEgu8kFVYe0Sub9PRpMNM+2L90Bn7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785335470; c=relaxed/simple;
	bh=flFt4YyjK+Q5pw/WC3BaxbKumwi5zIW5HxTlqPtf9dg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kfafvSgNAwWPEVmm2F8Wwl0QaG7OD+fY9pUVNvZ9XB7utnGJqyR0Wu2QfaxoQM/hOMY4EyREYxuBKI25uHz0TIjz3U3HZC072fTgRrLHO8RKeB08OxGpOOyziMK+WlsJDwx69zkRh+j7UCeghsb+UDWZgYKqOLI8U3xC04GB+38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=YCqjJ3EA; arc=fail smtp.client-ip=52.101.229.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="YCqjJ3EA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fYJmjjSJQ3vq/heB8aW/NBGB4HMeSsHOzJavHmdD8d2U6rRRcyv3eOk1xEzHhOjFNkG69asP3NbJdkCQycGuywXLp3p3vaJYrNwz07jbnpKsIEsaQS+TKPsc1rHe0CxMhYyFl8x7q9xlQqp+/K/cJ86bFMCClxzFDX6xp3GRdns3hD6mrihTIgUiDQaCbyzllAoGnk7M+lVhN4py3LA4ykHuaBFULYoPBJJH6UXDH27oG8I5d6H2sg4fytML7VPiJWdE7TBwDd0Ey+Wv3b0LJzjWQNxRxgS2pn20//J5LWbI4JWbBKflOx6T8aPnM1/PQ/5a6jMOpPiGEYYwGe0arw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxX5t5ygK1Y7ek309jmhdHoxMdGIxsLQ5azdueWSEXI=;
 b=jBvdLKdz97bq5kS/stmNrxEUDmKOAk4k/mBy2FKSmYJO6Wis3xuZk64j8ksEGCPlodDR3WIJzu+BdQMCuc012s5sP+nNnzwaTXGzn6VbG4notUB3+A3+KHZwh/adKwgA5544S7A7KxKHHTbEnzXGuNqhiigX3JvBl/vu0ci75XnpR5nnmqkxQbSzhQIqzE7M3+2vUfrbutnwB2cy0u3RbWApLuq3mCPg8K8+4aP8WX9li6OESSWav6Wjz8RRCDWwBed1vk6rGgdbNpgoXqaI/N76/JvNDE9So3CeL0Au3HFroIMdiDUpb2TMKOxEIKRpwpoQ0LVuYYxiQcI3wc4orA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxX5t5ygK1Y7ek309jmhdHoxMdGIxsLQ5azdueWSEXI=;
 b=YCqjJ3EAO0yHvsvB8p6wGfzBwR+gTpCgdAJRN2VYChbNbbHqr1qu/w+ra9Px7f4crBudVsxtwW5KkEaVUTwpZBW8PNEMYrCRdJO8gVnBeft/tTYqxPJQTKs+tdB6jnzCn4xcnkv1onoWFAKKOjYAs553JZbY9jnmSSUj8ydBCXw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB3130.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:291::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 14:30:59 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 14:30:59 +0000
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
Subject: [PATCH v4 22/24] dmaengine: dw-edma: Add engine recovery infrastructure
Date: Wed, 29 Jul 2026 23:30:34 +0900
Message-ID: <20260729143036.3087722-23-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729143036.3087722-1-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0042.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::13) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3130:EE_
X-MS-Office365-Filtering-Correlation-Id: bab2415e-977e-4391-58b1-08deed7e023d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|23010399003|1800799024|921020|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8mxLWsjeD8WY9npIn2Ga8GmLL8k0VCbpVVGd/YfqnQWw/44++f0awco/uypnGWpil91pbBLESoYogTBvKpWnDj9KW41xxcNKdC7LfuDpvhhmJotF8pG7GoPaumbfo4aNNQH30YqSETZFZHSsCze1BlNYLGMrTUgNpldKjTWjPAsdSSZm0AbgBCAoYLBMUjKEt8QjGhkJXmrQxgCMxaKNU0B6SW5r6vQaTqSt6kWI3+DTp/IQKShJcz0SfVXyPmHT4TQ37kGmBGLNL8pCSExX5LXpmQOl0o6eXe2MTE0yNdsNw+AaoOQTMDoM3q+tdIZs+0qnZEH3D2cJ2wR7rDEdBF4rUx9jpgb7iUwVMQZFUNkdPTZD8iKQMEsqoS1xXt41rXB/fo7C7OoexOaOYMX4ACavtu6I3gBzlQXGACuLFVDi0+0BhssMKYfp0WKLS0r6FMqB/k48zYRWM9vUr9YWhkDglptZDrPav2QSZjVuxFb+dcDP8KKvksl/UXl76c6/tbPWCXUQgM/ZwteD0EipI0OQ1sh2L9P8q5wZyX8TCtmfIzSTvNO9X6j9JlHMwT6Nd3uFuxKcSxpL/0HyFvIuWTKZkWZMlg0h6XY14PqO29pH3a1teJgmcxZJmHIAnfnMmgqgk+ImBQph1hvgSx4N/phWznerb9d3vLYH3ufmZr8h4R9rQboSvf2r7PbOdybt5e6hFkyj693wmQUllzRfvw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(23010399003)(1800799024)(921020)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4XMU/LWyhtC3a+Dnxomc3fYa6ekUqfRt54RwN2J9IzBc6MbaOoL7Nc+rHK9R?=
 =?us-ascii?Q?vBvTv9AcyH2B7Hm/sSAs5BfrGHWs1G3QyhOXp31loL8i0JqfiEhsdFyQCzk7?=
 =?us-ascii?Q?YDoVe76FVCP3d8ETg35qJVHXAS6y8EEjDdA19BFhGGuI9IpHCZ5uYGI+oNni?=
 =?us-ascii?Q?DexwsflWO9yDffqWM/VLnbNU7nRmmPObUVEj5JPiJHGoRVOKie/fjPMWgt4w?=
 =?us-ascii?Q?o8FVBtzx+vaUbjcArMZngqxiocU0mEr17zsLZrjzHJzquifd52MqJ0VWCEXL?=
 =?us-ascii?Q?K5Wb3CaxqHHxsWpAg8UYKd2byXVGbKIXHXyXiDqYCe7mpPEWweMna3D8Ku1j?=
 =?us-ascii?Q?mnDdOsKlDh7pbVry2t2Br7cai+bbNfe0+Bw36oI5FK1xUr0BbNivA310P+xb?=
 =?us-ascii?Q?XXhEoIc1BloTNK+0lsg8HyPIxofIlNKOWW6eQGdTyI7Fa2rwvP6dgdSYgz5F?=
 =?us-ascii?Q?F7knfFpn6i+50mK53QXDcSqngCFXulZrNjhKuHaeW06XfdDXRgdwDPmDwxru?=
 =?us-ascii?Q?DHnpCgheKQU54ysd8oXlIJ/vhYDI2DvSx+gv9OljeapnoAlmcK03p6ELrMy/?=
 =?us-ascii?Q?J0vEpFcwW46bn0lgPGrrx/jxQbFwOyuZeWujJ+CsUmQc+wa+qpLEYPX2rm0M?=
 =?us-ascii?Q?BPwc6bmoPrsH9pdfDNMQ3GSJmIxv1K5vLSO8jpZYzExHDUyYjEtp8X1gBH6P?=
 =?us-ascii?Q?h7Mp14ctohPA16YAUXrqlrMLtUuPPBSDkjWdzqtytDK19q3qrb2hC3uECrVv?=
 =?us-ascii?Q?LmVK+r3uODVO8t3ClnIS4OZ0MmOVA4CnUodPl0xOPsQFnD8n4ucuw+NYdZze?=
 =?us-ascii?Q?kYM4aGmfIqYKjrf4bCFBrr3Hvz7C3X3vKEXQkJzIt1Il/Bgt4k0BiPPfNBDr?=
 =?us-ascii?Q?X/qWmAZ8tDqvOT58ay4kxA8he3ZCF7cGbEO67T5tT9shCD7U+K4b9JpkVM8E?=
 =?us-ascii?Q?SvPrvxzOsjfuLsnQPVxwabyY19cYuU3OS7CBnPSxSNvntFeJ6y5/YTrA+Lb1?=
 =?us-ascii?Q?8fVJZs6IAeRN8NS2Ot6m1Lxa5j2NvmL0rvtXv9xsKQzwFfoYaPjXAekwqBB3?=
 =?us-ascii?Q?Rf2Za0YQaT+dTerJ+4gFh9iFJJb8cr6sWeDE3fJz/E5rvzHfa/z/j1ZkN1dl?=
 =?us-ascii?Q?w7FIVcO53Oo3wH08pQvxKLXSnvV6IMKpWqHiT5zcxwW7+ETDsFhPMXLxQcpl?=
 =?us-ascii?Q?q2AjnsuqPapVUqnQy68CjCNzNs0rrWkKy9DC9Gs/8xnhNvTAYZortn3eAsV5?=
 =?us-ascii?Q?DciW0CMMthEjY1E1n8hvXnM+8/Z/z9+ZYRYqrN4YEUaRmUsplYOebGVeSVb5?=
 =?us-ascii?Q?B42I+6hGC5UJ2jlFECWB56CarIBpvNdOCSXM1c9l1MpEdOTSi9Lft3U6oM74?=
 =?us-ascii?Q?Ek/fBi8YBotBNm/kqkeXDret1oah+xOD2gX0U1hCVgLYcN4EZ947my5U/8e9?=
 =?us-ascii?Q?wnWn+synHcErOYGMY1umUwEPy08PIP1wjYYrpRlJo5+Ubf2/LeCktyUGyZ10?=
 =?us-ascii?Q?anv5+QV4b3SKF5EzQV+wHXCC1kSDG0J2T0fKp8BZjjirVFbJr5qGEGiuQnDi?=
 =?us-ascii?Q?ckAsO0FMIGbXWIScxnp7buRhITCp8h+ZMV9kpCSFCrqV80vOg+gPzalD1k1L?=
 =?us-ascii?Q?R5P1s24RUqSqwFBPVmCG6loY9e79aOXLwfWL9b35aL9mvpm23hUHDppubvrL?=
 =?us-ascii?Q?PUbEm4hMrBHvIjoQIU8Qtyx516N8lUkQOKLvyBTjPKxKC6tSIskDPPf3kYNe?=
 =?us-ascii?Q?8uBt3mkayBmyIL5Abc/i9viz48mL99T4noqoUXuno6fSBmO1/ZJM?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: bab2415e-977e-4391-58b1-08deed7e023d
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 14:30:59.3082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zgMT1WP2kTEv7juV3x8WPdak9GqEAD0xo/a3kaeiYaLYNcxGSyq/GUGVqEI3Fuq5c6ed8wE6Wo+SKug1VWpryQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3130

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
Changes in v4:
  - Use cancelable delayed work to keep retrying failed engine resets instead
    of abandoning recovery after five attempts. (Sashiko)

 drivers/dma/dw-edma/dw-edma-core.c | 316 ++++++++++++++++++++++++++++-
 drivers/dma/dw-edma/dw-edma-core.h |  22 +-
 2 files changed, 333 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index cbe60bcd4c9a..616b0658b1ef 100644
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
@@ -187,6 +191,22 @@ dw_edma_set_request(struct dw_edma_chan *chan, enum dw_edma_request request)
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
@@ -239,6 +259,7 @@ static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
 
 	chan->ll_head = 0;
 	chan->ll_done = 0;
+	chan->ll_recovery_pending = false;
 	/* Drop stale CB bits before reusing the circular LL ring. */
 	for (i = 0; i < chan->ll_max; i++)
 		dw_edma_core_ll_clear(chan, i);
@@ -399,7 +420,7 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
 		return 1;
 	}
 
-	if (dw_edma_abort_is_pending(chan))
+	if (chan->ll_recovering || dw_edma_abort_is_pending(chan))
 		return 0;
 
 	if (!chan->ll_valid)
@@ -549,8 +570,10 @@ static bool dw_edma_ll_clean_pending(struct dw_edma_chan *chan, int idx)
 	WARN_ON_ONCE(done);
 
 out:
-	if (advanced)
+	if (advanced) {
 		dw_edma_ll_recheck_cancel(chan);
+		chan->ll_recovery_pending = false;
+	}
 
 	return advanced;
 }
@@ -707,6 +730,7 @@ static void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
 static bool dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
 {
 	if (chan->non_ll ||
+	    chan->ll_recovering ||
 	    chan->status != EDMA_ST_BUSY ||
 	    !dw_edma_ll_pending(chan) ||
 	    dw_edma_abort_is_pending(chan))
@@ -785,6 +809,283 @@ static void dw_edma_ll_recheck_work(struct work_struct *work)
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
+	if (!dw_edma_engine_recovery_needed(rec)) {
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
+	if (!dw_edma_engine_recovery_needed(rec)) {
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
+		if (!dw_edma_engine_recovery_needed(rec)) {
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
+	if (!dw_edma_engine_recovery_needed(rec)) {
+		dw_edma_engine_recovery_release(rec);
+		return;
+	}
+
+	/*
+	 * Let a terminal ABORT finish its normal channel cleanup before a
+	 * direction-wide reset. It may also make recovery unnecessary.
+	 */
+	dw_edma_engine_recovery_drain_irqs(rec);
+	if (!dw_edma_engine_recovery_needed(rec)) {
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
@@ -1977,6 +2278,13 @@ int dw_edma_probe(struct dw_edma_chip *chip)
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
@@ -2095,6 +2403,10 @@ int dw_edma_remove(struct dw_edma_chip *chip)
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
index 36f3def1a55e..a902a24d20ba 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -126,6 +126,9 @@ struct dw_edma_chan {
 
 	struct delayed_work		ll_recheck_work;
 	unsigned long			ll_recheck_at;
+	/* Per-channel recovery state. */
+	bool				ll_recovery_pending;
+	bool				ll_recovering;
 
 	u32				ll_max;		/* Data entries */
 	struct dw_edma_region		ll_region;	/* Linked list */
@@ -156,6 +159,18 @@ struct dw_edma_irq {
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
 
@@ -170,12 +185,13 @@ struct dw_edma {
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
@@ -372,7 +388,7 @@ static inline void dw_edma_core_do_ch_doorbell(struct dw_edma_chan *chan)
 static inline void dw_edma_core_ch_enable(struct dw_edma_chan *chan)
 {
 	chan->dw->core->ch_enable(chan);
-	if (chan->dw->core->engine_enable)
+	if (!chan->ll_recovering && chan->dw->core->engine_enable)
 		chan->dw->core->engine_enable(chan->dw, chan->dir);
 }
 
-- 
2.51.0

