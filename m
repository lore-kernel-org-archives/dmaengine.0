Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020108.outbound.protection.outlook.com [52.101.229.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03334D2EDC;
	Wed, 29 Jul 2026 14:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785335460; cv=fail; b=qFIGZWBVYdzs5WeEMsT75qzBdkqZrMoSi0ljGhQ7XsPon9GweaYx92Bym5wUpw4ZfEBUQm7Na4ilwQlgAkqt768QRHcPNQV0xyzvVKVbtBMx86Uj6so6OiCKzmDcxNRmaafOqmNEwwgY6QUz4V0NYLqp79diSVWh5ryZ+0IngoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785335460; c=relaxed/simple;
	bh=AqCXY6wOrD5N9FdRhFyKoLjkCpMaPOMvX6OFG8uJRqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rQ7ugskSeY9kR344vE+BG+1h05I54P0y5+sVCGJ2AGiN22tiIXZW+WX81+Mb8M+WTCoZ7PDA5PgkazYowXZJQLQlaZdJ7cxEIO/VWbYZzHbklDPrnCYM6p6tsfzlQKVSMnTWJq8hwKTzbU9lQ1yPQrAI7tXjOMlW7jfH5cfb8LA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=q8+7Wyan; arc=fail smtp.client-ip=52.101.229.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="q8+7Wyan"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gWzS/Q3vJ3IqQ/781C/Wq+ggDgdaD2XoMYDhmOZkNQPyXEGeYoNts/OPyc5oxQpB1r4FV8qT6WZ5bPyWP7B67Bb8lETjBlhIztOkEUaWISX8hA4tBtRwJpgSvpfa/gpOl1Dx9XuRaSBA/d11DElXT4ny7TyL3jbvsWUfvSFAqfJEX5OAg0Bn9PyhSUyGzg2S1Ezbl4KVrsnokm6HzbvtJMsy7FnOxgWU3034bd7Tl/itsu+D1xQogEEXTJpriKzI8/KFTu8xxRHiA6aVlsGaDZI/pJwV3fn+WxMllz96S0lGYRl8x7D2sOk45yGnaDwy4eSQEWBR7CeC+/b14qZ07A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Z1F8ZAzJbz0k/G8IE3dFV3gAsuGtYu887f7qM/s06k=;
 b=fdtqM6y8iKL6+RqV3i0zoPxWkgJeGp6yFZJ9v73Bxp5uqahRuYndSFhlrTnhOYbnQ0bIiK89PcLrPqB3yWXtGIUAL2d2EtQ+gE3/z91CGSRJ4TD7W1jPjptCxvHUftDuDgfz44ic5xlfmY6GEG37MgpgY8RtPDOXv+GXS10C0CM59Ga+UTORztW0fsxtlywSBB11wUdq6JItlUtlPpjpJcRlU3VeZjVbbolQtOTPvA9N92GmjZ+G3XJ5E0/U5eD6uzAuqimlA91oaTXbiFin9WBgJx4973p1sjFl6Jz9IFT94N8maHfsQ80jLPiXmLQlTpPKk8D0cqEad+a5n9Tc4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Z1F8ZAzJbz0k/G8IE3dFV3gAsuGtYu887f7qM/s06k=;
 b=q8+7WyanrsKTM6XB+MN6nUNhopO83CgNUa9Vn+7qJ4PQXySv4ghm3/XjJFOpZIRpN/IvBknTrL3N1oGmsNjC/0/WQ/OEc8It7HRelMGEPfCdEefq0wP4e1jpAGT3Ji9G1VtKURtrhur5UUpgSfRCm0pVhqJd1FY4rKykctmhzVA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB3130.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:291::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 14:30:54 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 14:30:54 +0000
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
Subject: [PATCH v4 17/24] dmaengine: dw-edma: Recover stopped channels from tx_status()
Date: Wed, 29 Jul 2026 23:30:29 +0900
Message-ID: <20260729143036.3087722-18-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729143036.3087722-1-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0285.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::20) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3130:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f0df076-4c65-4dee-4ae9-08deed7dff99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|23010399003|1800799024|921020|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YRMHXnsUbedHmrQRZCj2zWMW9bN3wFR38ye55GAJGhkXbwnkMK5jWy10fOo7a+Fc2ngcfMl0RCWVxHI9s5DBHj8FtS9Vn5QVZzsZ6nfRIT2SyBh+Q3sQF4z+c4iJ8kskrLaYwLgqaHAu//XWmasM0h5UngIFwZcTasvPVvO6lvmnjakn94ELOUaI+F8XR7FU0lQHnsJRfUqalFmmQLA9N8/W9aVzMlMHmrRBu/Oe63qQpSMlq6kC0mREC//I+61/Jh4eMikaedt3S9Wxn9FPO+QyDQc074V1Ok8MGiIdCODaYpbsQkTb1+BLEftGEsTuTucwD7XzaBKD7bY1YoqY8HjSk6zIXFL0UcUZztXNknXYKVdrY27CjGPLvCW3Du0QiWU099ho9UJlSpSc6HlGevb6bIktxniryyUv+Ph2rN2OXh1/wx+4YaPSXewU2UVV40PPBHbsyFU0dxjTN7eo6YsMfCMESUgOU89/lR/sSH8rlx1C78QkpWG3ye2YN8wJpL/izlUbQgmO88kGCda2BqKMLowWFFpjh1Cv58YRVfqHnTElZ4esUhbOGL7IA//wr6N1CpLkRFej66OM6OgWwT/sChPlh+VYeT0LU9QGm4aeoFkH8UJSwYuY+pjfYLfsuqSi3apo8eTvc/A87WeCQJ0l1dBasQDdQWqNdH6FJRfsOYM4Izz7+9MmCtYQqC88hdkn9tpkCpI+JbPoUtd6Kg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(23010399003)(1800799024)(921020)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NcmMuj6Zjfxu35I2bqrXrNqCtcnMXue1Zsr/yZ9RVWZtYpLslOhZRyw2UqoU?=
 =?us-ascii?Q?/1KHbPju3eNJ9eYnF7q+VApJUhMS7lwUARAj2DR+4pbNvC7UWkH62+hf0WLl?=
 =?us-ascii?Q?ZXAY+NjhVWajo0xMT6LVDb+nUM1joh5+uKxBOVlzwzomjGrQN5ytynMqBF/n?=
 =?us-ascii?Q?8J282HQyQjOjyphmuPo9eeLrTblh3wFwG+3hfdAsMmERMmOZiO935ycW2Bop?=
 =?us-ascii?Q?CEZuSxIqVSq+acs0WxoP+EodRX9vS8NtajgZyXer/CZtFv0lAkwgB/yNc+eU?=
 =?us-ascii?Q?QGFWSNktvXfJho34XcJ5R4GEPP4aTR8EGb+wTIO4l1tYKgSYifjcB6BquYlK?=
 =?us-ascii?Q?w6fnFwxWBwN6NO0UmlCwuHof/v6wuJau5A0SCQCdk/Tcwc87lFumiTDQR5Ne?=
 =?us-ascii?Q?OZqIawb8Pq5s7gCWIpwjjXq457REjF/MBj9kJi8Wu2THqfuFd73qGznWXFr6?=
 =?us-ascii?Q?pky/qxXwVMKzjnonYPwD2WZwq9wgfp8+F4I1yeLMCE+zh0u0IZyp514ysPeQ?=
 =?us-ascii?Q?FCjjHfLVRTK/QpTNhqkUuDD6sZnyJP7u7PoJ+ScsUN11sx50gv87GFZAp6Ir?=
 =?us-ascii?Q?kXgy3CsC3kDbD2HmpS9xwWZHwXRCg0XwDhpE5yetDG/yl5XLHuVUSSEKm1HY?=
 =?us-ascii?Q?JDXwFbWpIW2Mcc//ccBcr/Ehu4Pzi8AfevqFmybpK1stC3pifdgeC3HNJubc?=
 =?us-ascii?Q?R4T8uWYIzVtfSqx08LPPlqJ+6ycXDA34m6HeVQXBk95A2sKj90I2xF5cLTu/?=
 =?us-ascii?Q?QomFnCwWtm2aONB70wtMUNjDDuFO8TvHTTj9Xt0ghhq+GWKWyRJTxOiY4yOr?=
 =?us-ascii?Q?prIJjGdOJluHiQjN29kIfaeDaWrdKQy5PcUS0D92cGhMoZXAdAp4oVG4MxXL?=
 =?us-ascii?Q?gOfIxkXxTJ2lwiaTe6UAg6yCiXcDo7KnqqL8iFfHrbLE4MJSV1+xZibXWXO2?=
 =?us-ascii?Q?zD6qL2OVLyAHzRwuL7K3YwhF9LwXmjdMqB5K0+M/Ak+cVSYjRlG5eMSK4AJ8?=
 =?us-ascii?Q?pN70IXjO6oRbRC3Ap2bVcAeWmHA8zDvoaAYI7pv/7bkzfFr+6TB6lwrA18E1?=
 =?us-ascii?Q?J25mVz2Dl2HWUi8suzhm1SROq/zj93Z2wuvLhgD2TcjDsCqJCjkYtNfvtW7c?=
 =?us-ascii?Q?mR9Gy7hw1de+EgJDFLfj8r1Y3Xu614WS6mCyhHAwzOpxnJ7kchBGP1oCB3/y?=
 =?us-ascii?Q?b9hkvqUSXz36U/DDalvCAj1/Q4CeagpFyGD4HNzb+WOD5UehA8TTiC1hd777?=
 =?us-ascii?Q?KbW/g2lK+eJBdcGz9Dp81xTajzoROmvr8LzT1glm9X/l+/FnUc/NCJe7CnrI?=
 =?us-ascii?Q?zZ/iLW7r4lEfk66Ey/Id9GBw3JBqjHVRv3OwIYXHr0IJHb5SZWXtLwXvK9Qz?=
 =?us-ascii?Q?7dTzl+5/WR6oPN5x9EigaMNFol7dJQmPmS4KAfzpbIOhKfqRpgOqfe9gw0mp?=
 =?us-ascii?Q?Jg7DfK4LkuY9UCK4+hy7/EaLtRbLYPWuXRR0Oa03RGB6PNVijziIQpMvqO1B?=
 =?us-ascii?Q?Sy0bXdLmmRS96hcIW698IN4EDbIWc1KKzungWX/xPXNMFvsPig3Azv+HaPz+?=
 =?us-ascii?Q?Tnz8uVf6OqWPjmvj8lzTEWL9dptkDOv34p8FrXJ1ROrlUExlmPYDINGCs/sH?=
 =?us-ascii?Q?ZuqdPT+CGog+941wKsM3Af6wXdLuaMxwFoajrqUnc7ucPEd3cQsMn3oyraYf?=
 =?us-ascii?Q?5c7AW70WsKQKqt4eSYL6p/Gn22OM0PIIMc1owS1Jzc6JoGxz1/W2ifcxH3tN?=
 =?us-ascii?Q?/EvDuQQ9KD1LYiFHP6dLyXdhVNNu2sBP1xpVxWgVZ69ynNYBdg32?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f0df076-4c65-4dee-4ae9-08deed7dff99
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 14:30:54.8839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pjSukeRJv00rrRBktL/GUu/52uGqeGDQX71a/AbXDqVdRLEffel1RV5G1EgtfVeD9tF5ePbieoj9bYq9ixFPUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3130

An LL channel can stop after an append without another interrupt. A
synchronous user may then time out with work still pending.

Let tx_status() consume IRQ-recorded progress under vc.lock. If the
channel is stopped with pending entries, reconcile a fresh LLP boundary
and re-kick it. If it still reports running, arm the bounded eDMA tail
recheck. Do not use a running LLP read as progress because it can
move ahead of payload completion.

Refill the ring after consuming progress and update BUSY or IDLE from
the remaining entries.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v4:
  - Rephrase misleading "legacy-eDMA" wording; the tail recheck applies
    to the eDMA-compatible interface, not a specific map format.

 drivers/dma/dw-edma/dw-edma-core.c | 40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 0d1e6f48cac1..b90b33460d22 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -299,6 +299,14 @@ static bool dw_edma_core_enable_ll_irq(struct dw_edma_desc *desc, u32 i,
 	return (chan->ll_head + 1) % DW_EDMA_LL_PROGRESS_INTERVAL == 0;
 }
 
+static bool dw_edma_ll_recoverable_pending(struct dw_edma_chan *chan,
+					   enum dma_status ch_status)
+{
+	return chan->request == EDMA_REQ_NONE &&
+	       chan->status != EDMA_ST_PAUSE &&
+	       dw_edma_ll_pending(chan) && ch_status == DMA_COMPLETE;
+}
+
 static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 {
 	struct dw_edma_chan *chan = desc->chan;
@@ -918,6 +926,38 @@ dw_edma_device_tx_status(struct dma_chan *dchan, dma_cookie_t cookie,
 	if (ret == DMA_COMPLETE)
 		return ret;
 
+	if (!chan->non_ll) {
+		scoped_guard(spinlock_irqsave, &chan->vc.lock) {
+			struct dw_edma_ll_snapshot snapshot;
+			enum dma_status ch_status;
+
+			ch_status = dw_edma_core_ch_status(chan);
+
+			/*
+			 * Do not treat raw DMA_LLP polling as normal progress here. Only
+			 * recycle progress recorded by the IRQ pass that consumed the
+			 * status event.
+			 */
+			if (chan->request == EDMA_REQ_NONE &&
+			    chan->status != EDMA_ST_PAUSE &&
+			    ch_status == DMA_COMPLETE &&
+			    dw_edma_ll_snapshot_take(chan, &snapshot) &&
+			    dw_edma_ll_consume_progress(chan, snapshot.idx)) {
+				dw_edma_start_transfer(chan);
+				chan->status = dw_edma_ll_pending(chan) ?
+					       EDMA_ST_BUSY : EDMA_ST_IDLE;
+			}
+
+			if (dw_edma_ll_recoverable_pending(chan, ch_status))
+				chan->status = EDMA_ST_BUSY;
+			dw_edma_core_ch_maybe_doorbell_or_recheck(chan);
+		}
+
+		/* dw_edma_ll_clean_pending() may have completed this cookie. */
+		ret = dma_cookie_status(dchan, cookie, txstate);
+		if (ret == DMA_COMPLETE)
+			return ret;
+	}
 	if (ret == DMA_IN_PROGRESS && chan->status == EDMA_ST_PAUSE)
 		ret = DMA_PAUSED;
 
-- 
2.51.0

