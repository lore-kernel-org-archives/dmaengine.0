Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021126.outbound.protection.outlook.com [52.101.125.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C1C397946;
	Wed, 29 Jul 2026 14:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785335469; cv=fail; b=d2hE2cn9oENwoi5NpoTmhH2UX2F0Fp9sV6eUsKhk/UkvZjQqbW7ZTvxwMTiD2rS0N2yvPQZbFGfa5NHSFgxW1cKjThvdcCsMPaZkBl62hHvzsZ0VA2WS/HkKS0i4FWkXe/NTJkl8ZJ7JVwRmUjElHSR59i+FPtJdPm2uorThuj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785335469; c=relaxed/simple;
	bh=1Jd13ZOmGi5nQenMqa6R6vYXJKWzTLY7yZGvRdlQOyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UGM/Fwryx6tInl9iLElO5QxVRbcj97Wot4CMkDpS5iza8srGpgIGgfwhqfwPN971V6NJ8Y/oLbRzw5NBTW4aYh3m8dUeBht79EPtclw9g/Mhvn7Ak6P8lIBUYCKB8oemmFfqbw4cUyxZmv8E9PNvDNBGwAFEHIuKTi1FozYpz1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=Xp1RkoTd; arc=fail smtp.client-ip=52.101.125.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="Xp1RkoTd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eyUPaOzNte2Mf3SOuxaxJBQgJDG3TNLn8j1DQf6kkyFU0/KF6lja6WcceOCxS4/k1hJuT1R7SFJfkp//bzkiCD5hgXi6KIMo3nTGWN+/uIKCTdJ/zRPnaQasG951PQ7TcBGXnu9nIjkOd0+aeG3qkwyZuRYeHpra5qolev2Q72ACAOERC5dnfmi29jwEWSdpiOA3vFDAAtwThxCjgGZ0BmIsMSioNws0Wo9EKgNzRnuVU1X185PYG8VhWiTiKaHnx/SFz/nfL5k3/VbnYc3QQ2p8/DRzbJ+3/eO2g2fjQ8kzNu9yd0OiWiKYg9osH4dUrrg/T6SJyCNngZZikHP8gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7jYrDuklc6W3cwnM40tRklmEiGRWj8JC+viuky0Eb0=;
 b=XJEHeBd2u4utDNH8VFoNHz+FX8Px7ZMfjeNYWYpxnJ655JT/3iRpiEcwPGFsrFc2udP4EKaNv624hiTOQR12sWL8opY9N1dpQFPvbW8Bvg6yO4hSilMlTv9Ldhh7YgllRUAWP/CRvSWuun4zJcjzp/Fohptg5yTkQJj8dOX0fNWzwbu85HuDFVexcAPYE/E+Wjpy+jyhcIaQKDs71cgM2gtRvX8SqJqGEgNCjwDGdyfd3EHyJAicKO6jk051ezOTMem5ssKZu/u5j50YQOSkC8XRdO5mGzP6vWe2HPETNvtQ526Qy5iPL3NXtxL3AXN5KVApmlcCX4+g6MRZeTjBYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7jYrDuklc6W3cwnM40tRklmEiGRWj8JC+viuky0Eb0=;
 b=Xp1RkoTd3G1w/qAmZlckNfirMD+l+8HXvzNejnd6LiwSgM4k/AZWv70DPeiWPXsB2b6IlzOmNGfsFK92nomQHYSOCTASHVzKafZlX58PmoUtv6LwFUyRjibU8IMY8QWkj54q0lmHG8CDgCaYVqMfHJqO4A4EE3u3JqYXC7pEK8c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB3130.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:291::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 14:30:58 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 14:30:58 +0000
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
Subject: [PATCH v4 21/24] dmaengine: dw-edma: Add engine reset and enable operations
Date: Wed, 29 Jul 2026 23:30:33 +0900
Message-ID: <20260729143036.3087722-22-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729143036.3087722-1-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0005.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::9) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3130:EE_
X-MS-Office365-Filtering-Correlation-Id: 661d5fe3-7487-4b0e-5b35-08deed7e01ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|23010399003|1800799024|921020|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	VL91h5pQ+QTQRTP3DkAfHRTdgIEd1CYQ44SlfOnRtwHZdAe6k8HV5t8+0oT5RAICXYobSKcj0QU1bUwJPn0ktVuSdok96CfBrQQ5CQa4oq/HOKymzqCkr0a7XZJzgpT4RjKveK3KcmZZi15395eqKMYU/c7/sGg/Q7H0nTyHT8MuaYCCHPG5K/7R5AgCYjTPIfbY8pcblA+aP+kQJyUMy6GQOuqf/bSC+77MqczhHJsTaIGeGlMDOwPFGnJDMKuZglBc09wWbZHR7BA6CZVIcPIqEIUbETeliykbkYPJv90+rSvGgjyhXdVAdhnOnb2OtOYP6vPk3ylw6PKM1g+f4djNGnEk1VGHBMVIH51KNL4FfeW+TrVZ/BbjemoeKEpvS8LWGqGIDcirdmf/cF4uyLN096sX22icb3/Kk/R7FaPtKCDaVzrT05K18bTXuvYQ8VUSCf8g8AC+Hq4o6eEk3JnjX84m3jo4N2wMJwbvYnrN/dnjpHGmtoGv4b+obSkj6BBgeiJg4uLbaWI/4GIbqjjmVl+HcIxFLOkvrKGWxgDvM7tCBsuur8iQ8h2uv8PUWm/x7jB33BVjIYIxdw22AYbvRj/sd2IWAOYAY1sg+D8AiFETmj5HWRC+IWOBiOBUuuuR9EGX4HevQ38UZPjyZFDGF8zcQRluIyBfktqWjn0YoKC23A3yVkAncW5L36c9lb3PG2W1wdFsC54sW6/YDw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(23010399003)(1800799024)(921020)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3MAExtlShqelaOHmG6eZWohZiotbcangkGZfFqJ/yoR+oOQbGgpCdBHH7swH?=
 =?us-ascii?Q?4z6QyD57/TGnjj+DHJWG63knAQw6rQp+mVfuP6SusdwO/g77PY9ZsJ4SGeMv?=
 =?us-ascii?Q?ioZibWCjLjz/NzrjFeLmSTTgHgr/c7AKThESqYCzGr4Td4YFicyi+GJfBSud?=
 =?us-ascii?Q?kUGzlQuMouTnrytH31QpBZx+d49rqCuqK9SC5eU1LpEFdteec/qPFNQ9vAqN?=
 =?us-ascii?Q?4jK3zNo3KE3eV7RNgu+y3Jtz3u2ewmRia5fhQRufv8bcsLv+EZSclVWOwUqh?=
 =?us-ascii?Q?FczxCDSTxgjOU5rO7a/ypMByef0pyvmsRMdQG4Xm0nMnLuj25oZTs/VrjjyX?=
 =?us-ascii?Q?JWUUWPW+uyjv5q6C4Gagw2smPPd6YxPnFKnJqMmo5vAEstGUgBY0ItHRjmXl?=
 =?us-ascii?Q?0EHAtE7/BWTrtW5lyjpz7WsIItHlc50DrhCt1IYtW5sEfxHoxTCNwotjq6jC?=
 =?us-ascii?Q?uMXnlkAi0Fc7vD6ui0g5tgDZ6708G5miEeW1l67DJ4YcCro8Leh+OgCeDFgi?=
 =?us-ascii?Q?Jw7XmOuxbX0XF6YWXftwSV+0HtJspeZZn2Qv4Khw2Y+y/SsfVmJuu4eb07l0?=
 =?us-ascii?Q?OJG4QddiAOw3KLVNq0pTBS84XYo7MgeLFTxqup0jNDwmS9ao2O27gZgscRv1?=
 =?us-ascii?Q?W8HLZ1kAtzISN6Yz2ElVBeWN2Tecf7k6YT6MDOZXCEvug1moYf3tJlPv8/9c?=
 =?us-ascii?Q?IGPJogMbIc+qYsl944TRPXXaRR9gUbKxGdXXMEFnAWsQnhUXRxLhKkMW1EBz?=
 =?us-ascii?Q?2qNq/yEOdyqdqK9mewOFCZRx1/HHr207nlWmNU8G8hzjkd7UaIYISLPUzwVP?=
 =?us-ascii?Q?PIx8WvfH4COkpJlGEFG3WunNJcckJq+Ao/VgkiVSI8tQD+OhxfvJgviCKygv?=
 =?us-ascii?Q?+eYqr43qu9k+cTeiaat3BQqoHuBEQeufirodwcabXgwzS6qi25LJbRcBvKIt?=
 =?us-ascii?Q?PmzGza5Npuk4xdQNGixRyBi9C1+swnd+x8jd8YftTvDA4SKbj7+VkWfPkXsT?=
 =?us-ascii?Q?q13G8STljueEiiFjofHtUCp3xissFi9e59MA0h3dZnUgsP6O+z3XaMUB6wz4?=
 =?us-ascii?Q?UKe7B49+uTEfpt7L8d5+1nI8GvyiPU11bMZn+KPDmJtYpZpAJiHta1M619kJ?=
 =?us-ascii?Q?0OF0Xciqec0OJqoWIhnCRTOHaFJjhLv/Sdt0w0nxrI5audmX44rUNtmCkRqQ?=
 =?us-ascii?Q?+mOcqSttzdvau++RzB3idfRLLctEEUJ9fNKX+kHFgRGxAVLeqeYOZTd1qy3R?=
 =?us-ascii?Q?lmaqJOn4nAovQZ+1l29igKcXOI9f7Jjze1MFIKnLgmr812T+8M1E8F4hc+Pb?=
 =?us-ascii?Q?btX8RJ+3ZTmn4oV7YNfzjYQpnb3CqAshCIwjk5kOWf996rwax51G0bj7zrUt?=
 =?us-ascii?Q?OVAwftXEzHfTvQ0IsLVt6CEfQagUSR9MZW6k4ZPd1x4xsSmdcNtWxUzu5wyJ?=
 =?us-ascii?Q?Uf64kCORXslvDg9/0GuoyxqWOXGzZ3NVOwqMs0tf6FAGlI2PBvxoJvxhuW/K?=
 =?us-ascii?Q?Jo2cIc5E0F9AW6gUwVL0+GEE7tjn5Hb9ULVbXEflEMfd64pHrvBnEuff4Bwk?=
 =?us-ascii?Q?QLjP9eUbzNqhP0e9Jh715OtuAYcww1kNYgSP1m+dv6CXISOCc3uG7kBzSdMJ?=
 =?us-ascii?Q?Zu52NWnRZIE0re0kir00SmN184/TSh/Zyr4lSIwz/ihxZQfoDE3UcajdZWYN?=
 =?us-ascii?Q?Uf4tJ9vKfrRKSltRdNzr3nkircZz/mFwNfFjfOodwfkqJ4HUHi1KuLXQVyvU?=
 =?us-ascii?Q?ElkMXr6iAHScKgGRY8NaxgOCrapmYnchm6VPBtv1cGNQrCzzdYOx?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 661d5fe3-7487-4b0e-5b35-08deed7e01ca
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 14:30:58.5585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xF7VjNqat5hy7HwEf5Xrs3NO2H+XEHkNFdJreGWylp0vW/BGjXIDxCA5cghXUw1yo//aOKWA9Q5x3rEDGVOLfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3130

Direction recovery must keep the engine disabled while all exposed LL
channel contexts are rebuilt.

Add separate engine_reset and engine_enable operations. For eDMA, reset
clears ENGINE_EN, waits for it to read back zero, then clears latched
DONE and ABORT status. If ENGINE_EN does not clear, dump the state and
do not try to enable it again. A separate enable operation lets the
caller rebuild channel contexts first.

Enable the direction after channel context programming. Reject reset and
keep enable a no-op in HDMA compatibility mode, which does not expose
ENGINE_EN.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v4:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.h    |  5 ++
 drivers/dma/dw-edma/dw-edma-v0-core.c | 67 ++++++++++++++++++++++++++-
 2 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index b9e928b8d8fb..36f3def1a55e 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -208,6 +208,9 @@ struct dw_edma_core_ops {
 	int (*ll_cur_idx)(struct dw_edma_chan *chan);
 	/* Called with the event scope locked. */
 	void (*ll_irq_clear)(struct dw_edma_chan *chan);
+	/* Reset one direction, clear its IRQ status, and leave it disabled. */
+	bool (*engine_reset)(struct dw_edma *dw, enum dw_edma_dir dir);
+	void (*engine_enable)(struct dw_edma *dw, enum dw_edma_dir dir);
 	/* Called with the event scope locked for an LL channel. */
 	void (*ch_doorbell)(struct dw_edma_chan *chan);
 	void (*ch_enable)(struct dw_edma_chan *chan);
@@ -369,6 +372,8 @@ static inline void dw_edma_core_do_ch_doorbell(struct dw_edma_chan *chan)
 static inline void dw_edma_core_ch_enable(struct dw_edma_chan *chan)
 {
 	chan->dw->core->ch_enable(chan);
+	if (chan->dw->core->engine_enable)
+		chan->dw->core->engine_enable(chan->dw, chan->dir);
 }
 
 static inline
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index a29a2683512e..68e7589b5877 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -220,6 +220,69 @@ static int dw_edma_v0_core_engine_disable(struct dw_edma *dw,
 	return ret;
 }
 
+static void dw_edma_v0_core_engine_dump(struct dw_edma *dw,
+					enum dw_edma_dir dir)
+{
+	u16 cnt = dir == EDMA_DIR_WRITE ? dw->wr_ch_cnt : dw->rd_ch_cnt;
+	u16 i;
+
+	dev_warn(dw->chip->dev, "%s engine: int_status 0x%08x err_status 0x%08x\n",
+		 dir == EDMA_DIR_WRITE ? "wr" : "rd",
+		 GET_RW_32(dw, dir, int_status),
+		 dir == EDMA_DIR_WRITE ? GET_32(dw, wr_err_status) :
+					 GET_32(dw, rd_err_status.lsb));
+	for (i = 0; i < cnt; i++)
+		dev_warn(dw->chip->dev,
+			 "  ch%u: ch_control1 0x%08x transfer_size 0x%08x llp.lsb 0x%08x\n",
+			 i, GET_CH_32(dw, dir, i, ch_control1),
+			 GET_CH_32(dw, dir, i, transfer_size),
+			 GET_CH_32(dw, dir, i, llp.lsb));
+}
+
+static bool dw_edma_v0_core_engine_reset(struct dw_edma *dw,
+					 enum dw_edma_dir dir)
+{
+	/* HDMA compatibility mode does not implement ENGINE_EN. */
+	if (dw->chip->mf == EDMA_MF_HDMA_COMPAT)
+		return false;
+
+	/*
+	 * The databook says clearing ENGINE_EN resets the DMA logic while
+	 * preserving configuration registers, but does not document drain
+	 * semantics. On the tested integration, ENGINE_EN read back as zero
+	 * only after outstanding transactions appeared to drain; the stalled
+	 * channel then resumed after reset.
+	 *
+	 * If ENGINE_EN does not clear, do not re-enable the engine. On the
+	 * tested integration, re-enabling after such a timeout wedged the
+	 * controller and also blocked inbound BAR accesses. Return failure so
+	 * the caller can keep channels gated and retry.
+	 */
+	if (dw_edma_v0_core_engine_disable(dw, dir)) {
+		dw_edma_v0_core_engine_dump(dw, dir);
+		return false;
+	}
+
+	/* Discard interrupt status belonging to the contexts being reset. */
+	SET_RW_32(dw, dir, int_clear,
+		  EDMA_V0_DONE_INT_MASK | EDMA_V0_ABORT_INT_MASK);
+	GET_RW_32(dw, dir, int_status);
+
+	return true;
+}
+
+/*
+ * Re-enabling can resume a previously running channel from preserved
+ * internal state without a doorbell, so the caller must rebuild every
+ * channel context first.
+ */
+static void dw_edma_v0_core_engine_enable(struct dw_edma *dw,
+					  enum dw_edma_dir dir)
+{
+	if (dw->chip->mf != EDMA_MF_HDMA_COMPAT)
+		SET_RW_32(dw, dir, engine_en, BIT(0));
+}
+
 static int dw_edma_v0_core_dir_off(struct dw_edma *dw, enum dw_edma_dir dir)
 {
 	u16 count, id;
@@ -461,8 +524,6 @@ static void dw_edma_v0_core_ch_enable(struct dw_edma_chan *chan)
 	unsigned long flags;
 	u32 tmp;
 
-	 /* Enable engine */
-	SET_RW_32(dw, chan->dir, engine_en, BIT(0));
 	if (dw->chip->mf == EDMA_MF_HDMA_COMPAT)
 		dw_edma_v0_core_ch_power(dw, chan->dir, chan->id, true);
 	/* Interrupt mask/unmask - done, abort */
@@ -688,6 +749,8 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
 	.ll_clear = dw_edma_v0_core_ll_clear,
 	.ll_cur_idx = dw_edma_v0_core_ll_cur_idx,
 	.ll_irq_clear = dw_edma_v0_core_clear_done_int,
+	.engine_reset = dw_edma_v0_core_engine_reset,
+	.engine_enable = dw_edma_v0_core_engine_enable,
 	.ch_doorbell = dw_edma_v0_core_ch_doorbell,
 	.ch_enable = dw_edma_v0_core_ch_enable,
 	.ch_config = dw_edma_v0_core_ch_config,
-- 
2.51.0

