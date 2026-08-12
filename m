Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020112.outbound.protection.outlook.com [52.101.229.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9224756DF;
	Wed, 12 Aug 2026 15:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550284; cv=fail; b=kWQt9bMJw48d+sJ6HkKvy/10ZXmNtOmZESdOGF32JTMHlly3TD5mxjHvnTtc2UIiBLEQ3/ylGIDnfrktG1ODW9NBAYcd1gccn6++U1r3O5XdFNp2FFISdm+lZPgdaj8JKJQyhddb8kNIqGXPEWkao2rZq5qXXu+BR/PP9A4gfCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550284; c=relaxed/simple;
	bh=aL0BnrD5qr+7MSXwkpQP8pnFutLCnL+tmjrkrlwEN04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QJf4p+lq+GVwAd1ZQqOMUmVwmjLwHhooCvzP+mAQrQo5Xh+BPrrBAKfeI4EGx5o0h/YAEGLNuMg+fSmz+C0Ews/w0r7suQg3nSftC8m9tqMPsZ8nmy3jQuLUxREIgQ86Y2fxKr6Up177bMLaGeum4hQ43kKYtFIo9wn9+AguO/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=GCtkbuno; arc=fail smtp.client-ip=52.101.229.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="GCtkbuno"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Io/VEMipaE4BkWb65B6EzimH3uzkOUZoztVC0awDc4YBD8v+Q35D8KwAFax8xbGPPQ0aYOb7jHmAhtxGM96rKE7YRJkOxtBxHGXnnKKB9JFCdK/DXO3EViv97PHX/Rm8OhfJPAHSwGkBPCaortg7ebQWhsbrMiZuUi8l5T71nF6mFxGj7wkxJkrOIil2Njbjx4tM+ESx/4rb/rZ04KH7aFP6IW/iL44H7XGXywskQskFjqCI3aY1vHfW1iQWMCIceAl/Q/x9N8cZd8U6EGAcWVsVWt/Q7MLr2mQPa+LYm85hLz3N6/84zqCzq2HOjjcN2QIUurYhQu594JuhmbN1aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=juXRn/68rZBO3D6WyenoPw2o2THQi6HyRTKCDrtz8io=;
 b=Nwk1UL5nMTXGGLCucLABTRpVziOvLCjlyM3hUfwBxemcPzhFX4TihwYtyhJqRK3cNiz9nQzziMwyXqFP22v2+Cj6moxRXUvzIexL90nyBdgHQKcPLS7pVScFPOuaI9YP7fpcpl/p7ub1XiMjplT41uYX7rMW2dcQToY3AbLUpCmSGqYIxRs0j2jTOklQFn7qfSz6nyv4WMAVzyPUywz6YUhJ60lqroU5O5yUlfCPBE5Q34UFoKx7D6F45bnODxGVvGpMpkExEpzFqC28jbzYrPT3991kE1eCZ+LX77S24tV11fAJgn5gFAe/fq70JZ+eNoR60tUKots/J8z4bEa6NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=juXRn/68rZBO3D6WyenoPw2o2THQi6HyRTKCDrtz8io=;
 b=GCtkbunoG8IXtesOlm0xCbo+m7RBOPbOWj4q6E4PP998SnoU619LxDSDVuE8WSCN8ZylaphKzPFiG4+kn6W7f/Y5Tx8jjtZZ2gUnI3ADU+sFwk3xPZ3+9Xj7xbEh1TyvsI7gVW/yKkRygVJpER4NJ+n6MQSkjS2U7uz5HA5zdAA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB7115.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:42f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 12 Aug
 2026 15:57:39 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 15:57:39 +0000
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
Subject: [PATCH v5 17/24] dmaengine: dw-edma: Recover stopped channels from tx_status()
Date: Thu, 13 Aug 2026 00:57:14 +0900
Message-ID: <20260812155721.2807506-18-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260812155721.2807506-1-den@valinux.co.jp>
References: <20260812155721.2807506-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0209.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::12) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: 234d9c29-195f-47eb-41eb-08def88a6f98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|7416014|376014|1800799024|366016|921020|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cMoFviUb1U9iogwEVbmAn4ZVmO4/BzkRw5cwdJKzxU3SJJUrbjSABZb2jLRU1piuQmh7VlT/ZhyB5BvSA9twSM46yUQO2emszmFAlMP30dwj1pYvcxgkAC4QSRCk8a5FzAIIXKNIvfTt00BACN8WrqhB5G3ZTp2Rz7qXwgUXh357hH/q+zYtFUcSYYCBf73gzZ9gtWrzjS0nnKXEGtJfEw/VGLSRzb9y6Lzh+JR36S3KfVRx1ETA4556qlqzHBRyD6IueKL+ausdPRB7+2sWLraugPIY4yD9VqtnOhld65G0WqUYbNbJAUBNFgEoV8yTJAJiU1zbSEvy0f2uBntQft4rMcSo2dwnr6qVD2GJjaJKd0e1pNiiY+X3jyMvt6x6CeD1cG0hJl1GQuBo6+uaz8abKhxdvlrlip2ESLzYXJxfEWbpDdbw/CMJNT57IEqMT9JBz9kY7vAqv3LUx478TnT5vAa4tsk6jHv2cDwavfoJ7SEKPZWbevplTqTghu4K1qnzh3zfgymqb/z0HnHxqn3BaSlESztL+gw7Vx6erzvOhXokzvp/6v/CJdJAhe7yYcVNy7pBCFUzkXln7SN9kZJx3PV8bPDJZ62OGF4f8sxcfLrVXMVyJx2qUXLGOv2JIjB0cTf3LZ+F1jSEPN1KhM1ZX0GfXzJEBXxEBOAQmWwqg07r8tum0+1tj9fqrqeV2VqPXo67iAP6n447g9x2oQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(7416014)(376014)(1800799024)(366016)(921020)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nqaHY1jX0igoPWvQCZsTN1IG+c7CtxI/prx/qgqhRiPyl6sTBwAwIu/z/xY1?=
 =?us-ascii?Q?Is3LDclCcxqwCrkAP7V+bvGhS28TfmcPjOEQBRPeSyvTXcH1SNuMAjSvtkIZ?=
 =?us-ascii?Q?27JOUfKrM8PHFOiNy2KM8zx929q7l6l+Ll58b++u5iTd1LCux5x3MZHjgBzM?=
 =?us-ascii?Q?/F9oQLFGlTF+4tbOt+bVg489ESIfIZ+C1rREakzK5UVVw/NZSxzY7/WWAqsC?=
 =?us-ascii?Q?qO/jA97nIHk5IYRVAmvrYclJtomoM1y9hdSPUXv/tLDvVqk3ISHr6eSxRkRL?=
 =?us-ascii?Q?je2gpa8uw/bXzegsShpEoyDgSB3SesDSAtFaIzfpHcEGoaSmOF4hNDo/A0S0?=
 =?us-ascii?Q?g+cy41kelyTaAYz4hHMUj6B2mXBg75hgcM5/ke2uZhxCw67dlCJizvgi5Wab?=
 =?us-ascii?Q?HafYW1j/DiNO0v2K4HPINpla2xBsV6pQ1flTTVOI2ZfhExqAYDCdjZj+oKxu?=
 =?us-ascii?Q?noPWSyFbo5/7cLnG1ZtJOWlaa8Nf4uXgoN7aXpDGQE7ASfiOGNvKVTO5uNR5?=
 =?us-ascii?Q?ctB9D4pdOLNumdnbVyrS15Va6RiZ5Ty0N5djcYEgMCJ2HoyUVEdOFNlcD1BN?=
 =?us-ascii?Q?Nq3731g2p+FUs8NBKRwChb3YArIcg1T16je/+o6Y5h7IvFsKNH4B0wXSzR9G?=
 =?us-ascii?Q?REn+pd/SQZRiswAWjx2V+i2M32m29/D+L8uRAstNxrBdsf1cxU+xxKp9UVYJ?=
 =?us-ascii?Q?dnFq7Tm+ATJLZACb9XHrmnGDR0tcEX66ijHpXl5BT2EKLWXjDpiVc8jVkLwA?=
 =?us-ascii?Q?ePBbuy4CvF55UTd2EM2ZLBnC/4SfhWnqDMUFb4qwm3Wtd7VNoRsLPGyoff1g?=
 =?us-ascii?Q?EDKHIKO8UYNdV4bwYpMx2Oh/uQX1V7IW4a26ncq7tGYVR9HSIRv3FApviSxT?=
 =?us-ascii?Q?bRMO+RebqUbHyrZ6OfZreDuv9YJAhZVltI6MztYOkHEXqlB183/JCRwupZ4v?=
 =?us-ascii?Q?Mm3yJaauYHwJooZ0Ar4o0HCAFr06BI7pFVKoIScnPbwNIw28QNX0ftiMlj5b?=
 =?us-ascii?Q?KcCdT07poePcpuN0OaoCF1X9T4dyoGLNHoaQTfOqSyjUXrVIJiXsS/ACFXW2?=
 =?us-ascii?Q?VzFRTIKV0fbxqg3LwL9CtBkgR0Tmtj/FnSTHOCXSe7W8IElemF6PpumPTqNl?=
 =?us-ascii?Q?xn1/e2W1uxBtRhnQsuwS87r4cS/K8BofLDM00BZCxgFSlFiXr7gPqOiq3oZO?=
 =?us-ascii?Q?x1OclvkWMDpUZaV3bWLSyH+ARW90ZVxq9pHnAwNwG0NEAkxFm9a4oDINOJmj?=
 =?us-ascii?Q?OMk6qr4dOEDIcuHH+gXY3wUFM+9f16Vfb/y0BmhNJ1dG9R/PKwUbkLlc/kt3?=
 =?us-ascii?Q?HKGBM46RDNrgZqEai9NVjWtOpBYnpM0P7Z0XhpyKTMd66ohoq5SEgu75sAF7?=
 =?us-ascii?Q?H8vj1UahFhMFs7AJpHIDJNdX8VFrEkYsUaNeb6nuSjPPpbso83lCurJfTPxg?=
 =?us-ascii?Q?0Azp4KPf62hgyhpIR4vnhWAK+Y8zgAWvssjeTMWKFwyN1TK+yS1ATvoChigS?=
 =?us-ascii?Q?AVhCTYJ1u3FnfvWt9RISTtdpp7GxX37NHQ9kQZGX9L8sd7MOfiTCDxp5LanR?=
 =?us-ascii?Q?J09w7O9XMnEvlQDvhuShfzLo+BN8itnouWs0RRyLsal3PsGbO5YaiVZUetRr?=
 =?us-ascii?Q?f8zLxMK0fNvSId2hSZvEsNrAg4MaW1qWyB9+TRdrjDfF5OppGrrIwmDz2Fz+?=
 =?us-ascii?Q?31dMu9q9vSUaIAR+5c/ocPknGBgLS4/NhEDfcewOChkOZuWanMt0/WcG8PsF?=
 =?us-ascii?Q?IsqI08rXvxyY6fSmxlTI1s8dVRZce+MzWMjZsmmTm8yI63A7LWHH?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 234d9c29-195f-47eb-41eb-08def88a6f98
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:57:39.5197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cu7AF3bz9UyKEWSXdw0BE32yVKYs5eEqpAUkdqgtIQdJqNOXH8x3mH2hRVrEtW8DzPZA2pPDZnD1LnadnuOqlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7115

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
Changes in v5:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.c | 40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 8325e296cb2a..dffe3f8b8c20 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -301,6 +301,14 @@ static bool dw_edma_core_enable_ll_irq(struct dw_edma_desc *desc, u32 i,
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
@@ -923,6 +931,38 @@ dw_edma_device_tx_status(struct dma_chan *dchan, dma_cookie_t cookie,
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
+		/* dw_edma_ll_consume_progress() may have completed this cookie. */
+		ret = dma_cookie_status(dchan, cookie, txstate);
+		if (ret == DMA_COMPLETE)
+			return ret;
+	}
 	if (ret == DMA_IN_PROGRESS && chan->status == EDMA_ST_PAUSE)
 		ret = DMA_PAUSED;
 
-- 
2.51.0

