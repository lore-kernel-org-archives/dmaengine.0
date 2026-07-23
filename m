Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021140.outbound.protection.outlook.com [52.101.125.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05BD40DB31;
	Thu, 23 Jul 2026 08:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784796133; cv=fail; b=m1v4DJCHx0sSe8IWSiuPrhVa+sKqAwN9/W9ifSzZmIgJ96QKEwrNmqeU3MGYoudxcl+qrX2vHAu3eGKiHm8UpkLEqVTJoySzMY7U6KBWb3rrZ7TNyPQq/0boccy8od/D4XGgaZPrWBjlxtN3NJRy/7GUCHC2izt1oxVF2cM0cUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784796133; c=relaxed/simple;
	bh=GGfaa5Z5gTVy6ysu+60O2SLM8qajK1V9SygbgVdJ+Qg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J4UftVVmbKEFBiT32ctFdDtmzE076KwpMoxw07KCZN80BZqt3Ay0GWws6t9HxBpahutZPP3fcYaiOIS3EGIBZPfQ2qFujNB9WRn7iUNWtv5y26XU4+g2uptTcrXzmbrWEUMwBcMdcQNSf4ZmJe8l8kXP7gmpWW6eXYc8P1PSmlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=uzxzrjJd; arc=fail smtp.client-ip=52.101.125.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="uzxzrjJd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XqVym5MboVHx746Bkg4MKMimnjGE3kmhhoPHNEWEtNamWGtCP78frj1C3wqz+uMjCL0DJhcwTZa2Okj3HO88aj8gnwNfgSP5qIEUrrFrwEwk5wKbs7pUYhH6B6oaYXgnQg8C/OexMHzlQZ6fmyTSzLkpjlNEpEXyZITmC5MAeIXjwjvBV+O9bvg+d9nbEsoWvme/KSzKO36P5YklowC3tx/AFplKdInNHerFZap5HzIJK7U6sdZGzChVuTcH7CLJxoBoPWgwu7IaAgfZIyyI4Ujll1nYY928Rla8aalaoyCyTL5iii5PHdhessmlqx7CpH9Xe47H64pHeD5IBZPSPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nID3MKBzHTUbn98f/laXL/zKNULmmp51mER3zq1i6eY=;
 b=aIPDFUPLfVBtWxdjIEeKPr17nOQn5xXOaI1E342FGWhKpM/08DYsJJOY1XJ2aPm8JMX/fIdnb5Zc2pYztsnIzOh0G/nkEGTTibcftX8vIAp0nZSP+46dmg6D6g2/b+TJWNNRpd82eH3Br+6bIAdMRn9UgXkjCRL2TyI2j9sOvd4iG+djtchY+5SOX4HxnvfWmkcjucARwXdfjw2NvEv/zcR2+3DD7gVLv+uh3sbbDYDuexOHd/JKnt2h8YdtRdMAV3k2lBfyzXP4UoB06fIiCHS6dRQk3H+EZUhX7By3nhM6y5TAOzyMZERxuXSC9F2RATQmffyxdGPS7joMjMu8ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nID3MKBzHTUbn98f/laXL/zKNULmmp51mER3zq1i6eY=;
 b=uzxzrjJdPUVr9wAvb4j66PHDqpqKqGNfl0WFajam+9i2mabaCCJotchK5vekZ60NnKGdLeOiHLL9THundnc30nmMq3fmC9NljIhOuQCfavIZSQRnp15+eVVIbzjXobQphzwEObyYiBCygvy3dgZ8MtbYMVD3I0Hs7UxXFFiFgl4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB1883.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:111::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 08:42:02 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 08:42:02 +0000
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
Subject: [PATCH v2 08/19] dmaengine: dw-edma: Centralize LL doorbell decisions
Date: Thu, 23 Jul 2026 17:41:39 +0900
Message-ID: <20260723084150.521366-9-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260723084150.521366-1-den@valinux.co.jp>
References: <20260723084150.521366-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0114.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::12) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB1883:EE_
X-MS-Office365-Filtering-Correlation-Id: b6c43158-9595-4138-d9c4-08dee89644a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|10070799003|366016|1800799024|921020|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jRKuWkXVT7Y6IYJyrxbg6+KdPguXnD8st+5wOrO3S0rfkVBODiiPMoL0DYf/rWkdWo+CWUSXbuLZMMNhqOMVlGSUPui5pJROADqvVwGiLaUbB2WLH0GT0NXRule9BRzY/f32hr83gKFh7x+2zyNlgIW92c6ghzuiit82nSUEtWRXhz5fmpNudaqmatjBZAO04Qd2aRPQnoVUk80qDNl88p8R1xhWQIHBnGM5xPaao1u/G7k5JczuiBs4gNXZnvTiZC1ZK1zXSca3txMYScM2W3tzojkBJjkoUFf7PBzekQF5+ruHZRcB9actTHLdyFaM+MIgKwe8zeTpfGnJErPTvHIMCIRHbmKt1aKMBibWmtRAurs7Q3cWEySQ0/fzPp+1GBAoJlSCdlszudKfk3/v88MbumwAw3lUrDn9sloN9h8mtdEgKu7Xlus7KD5jEp4qT93hbO69QOBfclPIorytM16XxGYFWSfx2cRyyPnRPBz02BS/tfWeOb/JJVZeaVk6OSBecblHiuJBZhaVn2ZJsO/kJERid9vAvcuTKr3PzBMfllE0uQgn2WolBPnA3sFRvQUptXY1m0P99Yd/Al9zzybIiGd91gPtSBOvNbWKkKZ80Ftl2sV8kzporDPjsch0D3i0+aaSCj1Fpr1yMsx+X3DRHv1nVjOhTtEea+YoLFNHNeb+8wyQ2t9IrLZ1ZtrujYpAXORlExitZ/pW5zh1cg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(10070799003)(366016)(1800799024)(921020)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?90G3yiclGRme3tD1ZUyf1jeQlIwxbjAOkaOEbN/NzzXYscqMZKxk7OkxrgHB?=
 =?us-ascii?Q?72DAUJbVoW5l8NUq7xMaF5ngloIXMNviSuvYYDGjfRhnZLBWo5uRpMsF/eVJ?=
 =?us-ascii?Q?n271yVt9x4WXE2GC0NTz307C5dXL/V1m3sZ4jTQjOBkLZ9Wu5S726kFlJWCR?=
 =?us-ascii?Q?d1UM/qTlQXZoNfAj8L/2I7o+r47cauQ0Buh/6z5STDmxrmEvzNx/qGVyE812?=
 =?us-ascii?Q?XD/mA2Hf3NXlYaVYRGv1gOc01RXf/liaccbokwoxk2SgFuWN+ICIWC80+/ka?=
 =?us-ascii?Q?S8sRaKgSSbX4JIyT9luFUYwywfnraupI2sNUpfNjSvUPtCT2In3dUVfgnPEh?=
 =?us-ascii?Q?M/cE3jFpTcC/9sL2LBKSnJupJatWkdSHlf3Upo6ByqURnrxa4xyB+1Og8je0?=
 =?us-ascii?Q?5w5JtEVKZQzjE2nU4kxTFNI/sq2g1QH4UBLMXLpuGX9Rd1GypP2vXjgT7Nd2?=
 =?us-ascii?Q?Mc4bBIG+Pg+ecIuBQ0hCEyPvg+N27uHvrLLSpFn1JKIXKKVo2jZxjIxflU18?=
 =?us-ascii?Q?bk2UEAdRCK2aR6PS8Y4jxvGCtZV+0OWwvZOnT1qViMEPBnHilAmMPkKwahZz?=
 =?us-ascii?Q?uVL9ckMELY32Wwxkk2rPYR/plh9MIEoGW2t1Ydjr0MR9Jxjb9ac3teXhO95A?=
 =?us-ascii?Q?NmFQIKIjUxgEulmQUGOyki90yWbx6lBufxELoQPKLYRzQSO0f0NAHEENYhoJ?=
 =?us-ascii?Q?RAg87XT51R53oVAK9TZ330FpqCQjy/4X7Xvw2UEikcl/Q2lsnvl1IlsPw1VQ?=
 =?us-ascii?Q?poHQ+EOw3uCyr1d4bk3ijNmei6znRJNJMX1Ox6cEE5Fu0Yve9XmgYGDvgqZ5?=
 =?us-ascii?Q?ZZOKyUUeKA5pfk30bCfEzf8Aqbl17JmAIfgcID3Uizox6MDw9L5jsH3SS287?=
 =?us-ascii?Q?2QqlP8THcqBXZ3ZW3RZ/WHAeGVeeFHLFNWwxucTuEiV5286jo9C7KToqbRfy?=
 =?us-ascii?Q?Mgx+ZyLLJUpgPj8ImVuFxV2gATyeSCm634ynuk1Io3pvfIJOO2tkhYSQiHfe?=
 =?us-ascii?Q?zFkouV57c8a8QTHMj9cOJ66A7igHEW3qztz/BFffjz6TUIxDleHocYFwnYfY?=
 =?us-ascii?Q?1M8BfFD/K9XaYIKz1Vl/VQv1effJD0bit6s/AUv5RjnHRLTfoDCpD5SsXM9T?=
 =?us-ascii?Q?iYo6DC6fZckYeX5QnzWH4Y66IGqz0W+LI2CsjUadpSEI9dh7tV4IxrVqj0sU?=
 =?us-ascii?Q?kFheDNc/LePViBSA9xaa+aZy9gFMd4hru0IXCcty4+fXGji/6BPtGwAJ36AJ?=
 =?us-ascii?Q?BsNfQQNQgLO0KmBLnwt9bsr7ih8YGphrQc1qTrOLBHJ8Se5ne4eyoZ52deS+?=
 =?us-ascii?Q?tfUIC6S3nv0Qgg3Ypiz+zTM90ZTMlHePP27E/YpYZ5Mlr3IsfOxhfITugEEE?=
 =?us-ascii?Q?uq4WL6aR3FHGepECbD/L8ya9d4xw42nOpfDu7tnz9dm9LucmvbDIdADZyywG?=
 =?us-ascii?Q?3Rg+yTehgcL35baY0tWMp0ishteJKJB9bJDBm1CGE8yJuIe6MsxvrmscO0JD?=
 =?us-ascii?Q?j+O9nTNcpY0KZWJwPI9/4RnhmSoXmeXeTfaRLE/O62YUw+qwJq1ViW3v1lBJ?=
 =?us-ascii?Q?kHnrLTgJnnDXa7zmedJUW4tceITZHEF0QqfuPJUOYX8xvlOrMCrM10Oh7Ru1?=
 =?us-ascii?Q?dM2b++HSUaz8qyVx/V39z8tqcQRsdnBsZJ06VB6d3R5TUlzV7NiE/HOwDe38?=
 =?us-ascii?Q?d1YrF5VRCSWQqBUqDDe3d0Apd7Qjb7jNn0wORUx+UCGaF19w8ONOc4ULXpae?=
 =?us-ascii?Q?fO9x5iIs0syZQA42Uwn9ulu/Q9ty0d8o+t6SI/ci0qYls8Yzoa3j?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: b6c43158-9595-4138-d9c4-08dee89644a4
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 08:42:02.8320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7VDCow94QlCjp1x9PXGq4lu/Hmkmq0QObETEhPFYHMnlrK4Nahr5zponKIbREg1qg1Z3kZkGOrutq+5ETefAZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1883

LL fill currently rings the doorbell every time. A running eDMA or HDMA
channel follows entries whose CB matches CCS without another kick. A
channel stopped at a CB mismatch needs one.

Move that decision to dw_edma_core_ch_maybe_doorbell(). It rings only for
a BUSY LL channel with pending entries, no EDMA_REQ_STOP or
EDMA_REQ_PAUSE, and hardware that is not running. The BUSY check prevents
EDMA_REQ_STOP completion from restarting terminated work.

issue_pending() still publishes LL entries only from IDLE. A later patch
allows live appends. Non-LL channels are unchanged.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v2:
  - New patch.

 drivers/dma/dw-edma/dw-edma-core.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index fa104af4146e..e88bfb417ad4 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -129,6 +129,11 @@ static bool dw_edma_core_enable_ll_irq(struct dw_edma_desc *desc, u32 i,
 	return desc->chan->dw->core->ll_irq(desc, i, free);
 }
 
+static bool dw_edma_ll_pending(struct dw_edma_chan *chan)
+{
+	return chan->ll_head != chan->ll_end;
+}
+
 static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 {
 	struct dw_edma_chan *chan = desc->chan;
@@ -163,8 +168,6 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 
 	desc->done_burst = desc->start_burst;
 	desc->start_burst = i;
-
-	dw_edma_core_ch_doorbell(chan);
 }
 
 static void dw_edma_core_start(struct dw_edma_desc *desc)
@@ -232,6 +235,23 @@ static void dw_edma_terminate_all_descs(struct dw_edma_chan *chan)
 	dw_edma_terminate_vdesc_list(&chan->vc.desc_submitted);
 }
 
+/* Must be called with vc.lock held. */
+static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
+{
+	if (chan->non_ll || chan->request != EDMA_REQ_NONE ||
+	    chan->status != EDMA_ST_BUSY || !dw_edma_ll_pending(chan))
+		return;
+
+	/*
+	 * While running, both legacy eDMA and HDMA consume newly published
+	 * elements without another doorbell.
+	 */
+	if (dw_edma_core_ch_status(chan) == DMA_IN_PROGRESS)
+		return;
+
+	dw_edma_core_ch_doorbell(chan);
+}
+
 static void dw_edma_device_caps(struct dma_chan *dchan,
 				struct dma_slave_caps *caps)
 {
@@ -357,6 +377,7 @@ static int dw_edma_device_resume(struct dma_chan *dchan)
 		chan->status = EDMA_ST_BUSY;
 		if (!dw_edma_start_transfer(chan))
 			chan->status = EDMA_ST_IDLE;
+		dw_edma_core_ch_maybe_doorbell(chan);
 	}
 
 	return err;
@@ -405,6 +426,7 @@ static void dw_edma_device_issue_pending(struct dma_chan *dchan)
 	    chan->status == EDMA_ST_IDLE) {
 		chan->status = EDMA_ST_BUSY;
 		dw_edma_start_transfer(chan);
+		dw_edma_core_ch_maybe_doorbell(chan);
 	}
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
@@ -720,6 +742,8 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 	default:
 		break;
 	}
+	dw_edma_core_ch_maybe_doorbell(chan);
+
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
 
-- 
2.51.0

