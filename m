Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021097.outbound.protection.outlook.com [52.101.125.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5AF43A7FD;
	Mon, 27 Jul 2026 17:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171840; cv=fail; b=fCsEzSdtejHJkHicrW6bC+1aRQWCJe0wxhlH5ST1iRRk2mS/DY5mfSEspL6vSkJuDHaVCivCupZ39EuLbQ92eW8zzWAvPp9dSNCxZphW6wI3Hfli3bVNTsFJJxdE2/VZcpTx9V8NTs0jX5dMfOaDkSLLEe0YEXOfMlwP5sCl8ZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171840; c=relaxed/simple;
	bh=7g1BgBM7c5HT2Hrm0Sx3wNSkF+x+9R/axGbmMk9PK5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QCR1FLwy6aVoh8IbugSN7SGZsTvGT/lY5YBDaWKcaWJiS+heMpV5EX9F3hPpZw5dTDT8CrJjYUnUPoZnilKiXFsXL0BPKYPiBhqx1ASCknK4F8oKLKbU2y2uIvgu87ht+P9SYNrQVyUKF1ufpetdShSnS3wp2JFTE3AHCu9Sfw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=Tq8cLGNr; arc=fail smtp.client-ip=52.101.125.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="Tq8cLGNr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iDuDKwUz7L+ey+Nfx+ugYfT0Gh5MmqQkLXR3fNpi6gqgf93w32v290JVp+zI9dq9LItSjlJg9zwmmitDQAqbT6CP9cuJ5c2aIonUQa/ushauqgZgmzaYZ0vgS+qc7ROETEr3hCkEQ4iyOHLsQQCoPHyi61G4G43gfh/bCarNYTwOc9yPeCVZekoMC8bSptv4qUM0rubaVi6cKbAgiI8GLgF7bOJTYOvt3CGwu6YHGcKxCFXZ33vR6C2p89pIc5+1NIfzZJg6nE3wxyN99TA27UN29X2Yw5D/03R0Z2HKC895bakz+i+uW8cnISOgTVy3LnMTHn593bv6moGbQKy8xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VE52KkB9yYCNzVjRHZhp38JLHjiQLfd+gv3wyDLv144=;
 b=NPlHxlulMo/ZoC+kV4PBgDchEtj7HvCO5+njBG7wCHDy59u2/HTFpgK2lPK9RBtRO1mOsqwP31qnPZl4L3KaoxPn+9TiQhcEppCO+ORbcweqAxRhDzmVqCqAuYDci+K7lX5yEIxCBXFcL+C1xCgpSsE3C4zUoh3Nr1ZwqGPYjsGA9lq9xt0iQlADtixyS6OyTx85d4IRkaW7nuS4DRGDNYN3ZUfiNtGhMdiTPadAHwUkXa/1DkQgkdfxGFlI6bKzAjcIHBEx9khIVRhnqt3cW+Du006ROzELOxqxt6qNDQ4Fd3MHH57Uhlv/cQVrlTu/ujNd3aqXU74kTB4HRt3R1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VE52KkB9yYCNzVjRHZhp38JLHjiQLfd+gv3wyDLv144=;
 b=Tq8cLGNr5MRW1unTFoWPDUtcR1ilRVmPjkw5L2FeaWOaRlP3fPMRZNCt9qjHBz8kCgfFkLrqFjceRg0ebXpvZoW9396/9ek+q4T3sIBGemHq0sXhXrZRpsKS5html+rDmdUdjOUo2G6jSMCXqEEJeUOzCqyagnMZEsmeqboBcu0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY7P286MB6515.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:31d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:03:49 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:03:49 +0000
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
Subject: [PATCH v3 22/24] dmaengine: dw-edma: Add engine recovery infrastructure
Date: Tue, 28 Jul 2026 02:03:21 +0900
Message-ID: <20260727170323.2321369-23-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260727170323.2321369-1-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P286CA0039.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b7::7) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY7P286MB6515:EE_
X-MS-Office365-Filtering-Correlation-Id: 31e298d4-594d-446a-3a1a-08deec01074d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|10070799003|7416014|376014|921020|6133799003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AwVS+y9AZqnfkt83/rZYHqW0iGliOA2+cz8DlOwKDa3clsiuDcVEYcI38y3BFJvheX1RN0nD0GLjXe2zPRyN4wz7AqGUMeiWS7/DiM6XSowuJcu6cb1ktq5CGsNSXps6ODnhrRkWPepgIq0U+KmUeynS+S4J79Vc1l2qHwG5KyA9w+XVTaWoUR6L6zS1613CS9TMGGD+gg/UC1PhNLrASzjGof9eJgRczGlzejZoBf8+YqbPCDML78/JGyccL2tWHUeiNj0YXCZzS4DhZIlhlzXeq1n7H64R1F4VZ/goQQfGA1AUKKL4i3oAxbgMh2jyqM25mPpZJiIjrtAD3aq3KW4ofp5Da4k+MT9OJucjyeeKSOa2jjHQagebSO+h0EzCxA4i7BTTcxM+DouENaUefsq0WJSaSXMqBguyUWYxr54lvcqlYo/6V08/s39RP1wlx2t4FmZZLnny1jLevBaQxb8WYooiryVQOC/RZAGbhh6BMxwaIMjZXChs+EBgPysUSSBjUwY0IkvVKPF8+llIPFG4UxGsomoc1nPzaaR3IZJ+/xCw/q4OMyXMwWg8Ybo3gvoz1HwNIrp5i1/F+RDsFNRHfAY9yWuxZrbi98vanA9PzipuXR6y4+9C5kJm6neXzWknk7C01zq7jZI1CRvq9byCzdiy8v5FJSu3e6QP1/EeW74z16LOZSMxfyUV1gMOGnagVQkKpkknnF9UT///oQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(10070799003)(7416014)(376014)(921020)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EPG6DGN1gfH4udMkl9+4Il94SpTqfFqkMWcoV2C3YQukJlWsqct9M0DTkhVR?=
 =?us-ascii?Q?mMD8VTTsUmZJBNLIca0sI+z1Jzg5b1urnz0ezngOUS+u8fKg5t4tpsqDpaUi?=
 =?us-ascii?Q?kQhpjnrstK0Jbwb6Zvrxw/P5UrI3taVNmu0vYrNrQWk4m9PrFxw9tFa8EXe0?=
 =?us-ascii?Q?cQbilWPQHvpY05GcCJSqzxXPEix5XYn5LFDDXib4P3mhDLhAISGKyqrIaoo1?=
 =?us-ascii?Q?Hs4QIJX7DEUH7ceDMHV6JLT5hgf3pFk15oYjCFyKxmwSsclrm58KAXN8Msv3?=
 =?us-ascii?Q?VmdPT59zSl8yIL4C9VLkyl64pNXPyklxNboHM3YaaHQy0pkBtT735roglh1Y?=
 =?us-ascii?Q?oB/+IyNau3XjCmTXsfGYvyJ65Q7pMjnqGDHbN/6+DrD88zbxjMJEZpmHArBK?=
 =?us-ascii?Q?6cNBsjvj3FAsZsqHoM7lzoJ86VPGyPtpincW3G0GkgleRET2/SvaErcaYgG1?=
 =?us-ascii?Q?T2KIwwxN8JAM3SyWGTeGzSB9bf88pnMUQctJp2B3O/8jeSwxU39wwAuGUltq?=
 =?us-ascii?Q?Hz0iNoBRos2Cez8WU+pL5LoF7cDkcC29esq47jm1KQuat2JYJ96940283pdV?=
 =?us-ascii?Q?CWXZenj/Io8+UndL8XVPjWwLtNXuvAEoCSvO7lD7azxKLPsSdU6Hvn68aeH+?=
 =?us-ascii?Q?Q8vISlPPViw7zaIo8EDVDVND8jCmU7T3+H/thpf02YvmOzAjz6fZlJjbGE87?=
 =?us-ascii?Q?QMtwz2NXSSNFA04Mvvto/IjSQdv/0+aW5xN4j+3MXsw7AUV5RhKBuSVnYcUG?=
 =?us-ascii?Q?30TqYqaCbytnvT7xlGFxafdzrs+FOkNLgVVTau4wOVrWnWfCwrDKouRvnl3Z?=
 =?us-ascii?Q?TyipiUkxLE0g1zJ9oy0Vsmi3M6yKQYQJfwEQbPtwpxYzL89K4s2bwbJ7uXri?=
 =?us-ascii?Q?0WY8XDKurHfUmqpGsun46112XcZHNV+PkmZaOI0Z9rsxkGWmxQcZzBATLVzo?=
 =?us-ascii?Q?K+ZNc2LRF6XKTT0nQeo0CL/2uG7Zelq+nUQSPDe3h+piFczKpJl4tYqCVnbA?=
 =?us-ascii?Q?kb8kgZO0hOwJrZcL31mMcTPiaTQ9XZFkT5fvahcvcCdPLbIpxz8ZZuROF8FW?=
 =?us-ascii?Q?bZhQM4CDqxDmIHl78cFoTRcxfzdKphuH6EOsn9HNbRuaey8DaAUe365OZKzQ?=
 =?us-ascii?Q?nhACzGrxI/Ie7uLsgm6thPKP6H3h6JKIjOk54iNGVYwAW+pBbVZh5Cbcz6lK?=
 =?us-ascii?Q?vRfsRxqPvzzDpLOVWu1FoFBwoiCI1ZdlDC8TXCzAHuWGKP9rJz3g/nkMjCyG?=
 =?us-ascii?Q?+l9U+MphOsCnZmdHjNDj853sf9MFJZ1O1xixhvZrGs5OR2KIYOXcVYW//y/7?=
 =?us-ascii?Q?l82TOlxjgZehwrdIt+X7SYC+fioOg8pURp9OtpNGueCKQrR5T8jOUyghTCyI?=
 =?us-ascii?Q?QA5zoo0cIW4PyJ8zu0BMDdlr4vlJ7Bp7ei5cu03dHNNj8zigBz6amjuuA0lC?=
 =?us-ascii?Q?euipHYartXgsizeDu4p02A9uXqefWmfDXL5kHXzCl0/7aN7gRYw5mYPpnshy?=
 =?us-ascii?Q?ucYpJcxaBA0nVfhKtbXjdM/Xiq2eaEyy5jIjKH9JVrlISBporCKX763CXCc9?=
 =?us-ascii?Q?zONdxuU7//CF7RjxpncYgjEMnD3xBHpzsKJ+CoPWmycFSHjX1TqJ2WDBo4hM?=
 =?us-ascii?Q?nyF7oTO59XS8SStbCWECClYEy54Pjbrk2Y4skxLhe+cegCTViS6WvIvGhml9?=
 =?us-ascii?Q?klwqEqTMs+6K6A3vwcw8OyquUWhcM17FD0YgxDTSLN1mmNuGKM1bvs1n+tzm?=
 =?us-ascii?Q?FFABW4ida8SxkwGxX76nYeUhHXJ0AD+cWvRGzYBvX36cQpXtlU2p?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 31e298d4-594d-446a-3a1a-08deec01074d
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:03:49.5374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fbmOpblwjunVzuY9q2Y/ME03krYMiJf8jbmd4QrgOZi1puiSw9FHqRyDFFnwSW7eTlh8VlDt34H6V8VdcyQv3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6515

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
rebuild; leave channels gated if reset keeps failing.

Providers opt in with engine_reset(), engine_enable(), and
ch_transfer_size(). No caller requests recovery until the next patch.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - Drain pending IRQ and ABORT handling before and after reset.
  - Complete remote LL publication before re-enabling the direction.
  - Keep the direction disabled while rebuilding every exposed LL
    context, including those of unconfigured channels.
  - Queue every recovery request and stop recovery before hardware
    teardown. (Sashiko)
  - Avoid mixing scope-based lock guards with goto cleanup. (Sashiko)
  - Trim recovery and teardown details from the commit message.

 drivers/dma/dw-edma/dw-edma-core.c | 304 ++++++++++++++++++++++++++++-
 drivers/dma/dw-edma/dw-edma-core.h |  22 ++-
 2 files changed, 321 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 98b8732a6cb0..56032137a4bb 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -28,6 +28,9 @@
 /* Empirically chosen progress interval. */
 #define DW_EDMA_LL_PROGRESS_INTERVAL	4
 #define DW_EDMA_LL_RECHECK_DELAY_MS		30
+#define DW_EDMA_ENGINE_QUIESCE_TIMEOUT_MS	250
+#define DW_EDMA_ENGINE_RESET_MAX_FAILS		5
+#define DW_EDMA_MAX_DIR_CH			MAX(HDMA_MAX_WR_CH, HDMA_MAX_RD_CH)
 
 static inline
 struct dw_edma_desc *vd2dw_edma_desc(struct virt_dma_desc *vd)
@@ -186,6 +189,15 @@ dw_edma_set_request(struct dw_edma_chan *chan, enum dw_edma_request request)
 	chan->request = request;
 }
 
+static void
+dw_edma_engine_recovery_queue(struct dw_edma_engine_recovery *rec)
+{
+	if (unlikely(READ_ONCE(rec->dw->teardown)))
+		return;
+
+	queue_work(rec->dw->wq, &rec->work);
+}
+
 static void dw_hdma_set_callback_result(struct virt_dma_desc *vd,
 					enum dmaengine_tx_result result)
 {
@@ -238,6 +250,7 @@ static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
 
 	chan->ll_head = 0;
 	chan->ll_done = 0;
+	chan->ll_recovery_pending = false;
 	/* Drop stale CB bits before reusing the circular LL ring. */
 	for (i = 0; i < chan->ll_max; i++)
 		dw_edma_core_ll_clear(chan, i);
@@ -398,7 +411,7 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
 		return 1;
 	}
 
-	if (dw_edma_abort_is_pending(chan))
+	if (chan->ll_recovering || dw_edma_abort_is_pending(chan))
 		return 0;
 
 	if (!chan->ll_valid)
@@ -548,8 +561,10 @@ static bool dw_edma_ll_clean_pending(struct dw_edma_chan *chan, int idx)
 	WARN_ON_ONCE(done);
 
 out:
-	if (advanced)
+	if (advanced) {
 		dw_edma_ll_recheck_cancel(chan);
+		chan->ll_recovery_pending = false;
+	}
 
 	return advanced;
 }
@@ -706,6 +721,7 @@ static void dw_edma_core_ch_kick(struct dw_edma_chan *chan)
 static bool dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
 {
 	if (chan->non_ll ||
+	    chan->ll_recovering ||
 	    chan->status != EDMA_ST_BUSY ||
 	    !dw_edma_ll_pending(chan) ||
 	    dw_edma_abort_is_pending(chan))
@@ -782,6 +798,279 @@ static void dw_edma_ll_recheck_work(struct work_struct *work)
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
+		container_of(work, struct dw_edma_engine_recovery, work);
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
+		/*
+		 * Keep channels gated and do not re-enable the engine unless
+		 * ENGINE_EN clears.
+		 */
+		if (++rec->fails >= DW_EDMA_ENGINE_RESET_MAX_FAILS) {
+			dev_err(dw->chip->dev,
+				"%s engine did not drain after %u attempts; leaving channels gated\n",
+				dir_name, rec->fails);
+			return;
+		}
+		dw_edma_engine_recovery_queue(rec);
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
@@ -1974,6 +2263,13 @@ int dw_edma_probe(struct dw_edma_chip *chip)
 	for (i = 0; i < ARRAY_SIZE(dw->event_lock); i++)
 		raw_spin_lock_init(&dw->event_lock[i]);
 
+	for (i = 0; i < ARRAY_SIZE(dw->eng_recovery); i++) {
+		dw->eng_recovery[i].dw = dw;
+		dw->eng_recovery[i].dir = i;
+		INIT_WORK(&dw->eng_recovery[i].work,
+			  dw_edma_engine_recovery_work);
+	}
+
 	/*
 	 * chip->ll_*_cnt describes the channels exposed by this instance. Keep
 	 * the usable hardware counts separate for partial ownership checks.
@@ -2079,6 +2375,10 @@ int dw_edma_remove(struct dw_edma_chip *chip)
 	WRITE_ONCE(dw->teardown, true);
 	dma_async_device_unregister(&dw->dma);
 
+	/* A recovery worker can re-enable the engine. */
+	disable_work_sync(&dw->eng_recovery[0].work);
+	disable_work_sync(&dw->eng_recovery[1].work);
+
 	/*
 	 * Drain channel work that may have passed the teardown gate before
 	 * stopping the hardware. IRQ handlers remain installed while it is
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index 46962a9bb4a6..a2699a663260 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -129,6 +129,9 @@ struct dw_edma_chan {
 
 	struct delayed_work		ll_recheck_work;
 	unsigned long			ll_recheck_at;
+	/* Per-channel recovery state. */
+	bool				ll_recovery_pending;
+	bool				ll_recovering;
 
 	u32				ll_max;		/* Data entries */
 	struct dw_edma_region		ll_region;	/* Linked list */
@@ -159,6 +162,18 @@ struct dw_edma_irq {
 	DECLARE_BITMAP(rd_mask, HDMA_MAX_RD_CH);
 };
 
+/*
+ * Direction-wide recovery state. active records that recovery has gated the
+ * channels; workqueue state coalesces duplicate requests.
+ */
+struct dw_edma_engine_recovery {
+	bool				active;
+	unsigned int			fails;
+	struct work_struct		work;
+	struct dw_edma			*dw;
+	enum dw_edma_dir		dir;
+};
+
 struct dw_edma {
 	char				name[32];
 
@@ -173,12 +188,13 @@ struct dw_edma {
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
 	raw_spinlock_t			event_lock[2];	/* Per-direction event scopes */
@@ -378,7 +394,7 @@ static inline void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
 static inline void dw_edma_core_ch_enable(struct dw_edma_chan *chan)
 {
 	chan->dw->core->ch_enable(chan);
-	if (chan->dw->core->engine_enable)
+	if (!chan->ll_recovering && chan->dw->core->engine_enable)
 		chan->dw->core->engine_enable(chan->dw, chan->dir);
 }
 
-- 
2.51.0

