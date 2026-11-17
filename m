Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794908623;
	b=vEw0Xm6UGvYztVXaRRdW5LbMAi1fmePbAgiw7pEZfsocmLMSYg52odrzEZBiHWJ62r04
	 AF2DB4+EpkXHsSVsLeLSk/9N89WDW1miJyl3qOaR6TdQXnicj58xgPiEhXI64cyenvmE4
	 +NBMoW81DDHLMJqXWEsz6oa6R19PJtgu01k8kfvL9DIbWiPmbpSnO/Jnvksqc64RRo1FN
	 UuLFb3RKWqialdifKbr9LS5rBKEtfDEIEW2mIDJaGqSOynuk0tZn+AzABRDNfQ5W/kdyE
	 7asatconix2V5YQmYDgsuc8Uoou3AXKpUAOsG8sb+eX2oJyNl9CliHssakSDEDLex8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908623;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=AXM9QCj7BvoQKZWY2VlZopOp9BsPhfGwinZl2G9cc8I=;
	b=g/4YwoCBOd2r8BG6e/V2v4gAgMk1JmQiWBqyQdnz9Jxy7SwnnlTTSTPYmOvX/ZHMDWp6
	 HRX0Fjzm3ns+Hi4GR+YqnKGlpWanYc0i3yiZgi94rtIqs/85rCchIfk9d4/w/Dadfg9SO
	 miGuMbbR3Hg9QVUM56/C5DiOCLkl1JNQU51OY7YOAqy90Del1InE8mUahP+5BM5l91mLR
	 +8igLQXNBAdrjZzBHF70j7d8qhMW2w8hNI8aLyiR470vKM3m304LPvhtzWrsK3uv2XoUQ
	 WWKcByXQRr/2rydhPSwNtiaUVlA/7TckQYGTNIr0TbRQddPbvydxJ+O/Bt3/6R8A1Pw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.124
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023124.outbound.protection.outlook.com [52.101.127.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281B3606A32C;
	Tue, 17 Nov 2026 09:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 281B3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XSQrYuYoEwXwNH5QVC/wUALzyE318aHlEjWPmffGemUA29r/DiWaUr0NQuTd6EdGC4ptZCNTc01cEiMKffAwPvTSUEnIsgn5YpIWCP9pmBZZLLQuLpNKwWMvZiylUMwm1Hk7sIcptJ2Eyj9wOR3tcjqO29hIAFcZMbpfJkmgvJ0V8VUhfkFIuZiQZsAO6CutyB2CcFW4kh/GcfOPw++glNtcKhsQjMut85iLUnqiQo6ut9yAohduNLAR+MSOf+YRJoy7thROXlHVv95FkxVsBRBs8gsm6/YIyLkKRaWIsAbgMpgu3ACLcyEfMymkwTLjlMBSGLnEAHDNetxI6v1UZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXM9QCj7BvoQKZWY2VlZopOp9BsPhfGwinZl2G9cc8I=;
 b=oJQRBNYVG+rtmyHbLBRW3s1JDQE8vI6GPVYH+HiMivK4N822w55R4v5YStQJJh+wx9xl6pCnLEJFsBm4kf4rEaQWwzx8p67Cyjh4hqkB2iY55j4YEirtIxVdcIuLxuxWfvrdeb2bjhBy4QgjvL85NKrdEMAiteNLMXQJX08+ac8V+SGax1ykHkHAACt56oEVYaSrL7RvhUiVLaTJC56MX62NTOlPy5RBNV0s4VCTEhUoz8xIkh2/vdN1jNP1D6GioyboGz48CIAsxkh7NeUYv05HY+CursMykTZ0C6KI8WKixrI7hlCUiCUAj4wmtcRsuZPsjiLHCpfP2Ik4Q9H+ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OSTP286CA0017.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:216::16)
 by TYNPR06MB8574.apcprd06.prod.outlook.com (2603:1096:405:3d2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Tue, 17 Nov
 2026 09:43:39 +0000
Received: from OSA0EPF000000CA.apcprd02.prod.outlook.com
 (2603:1096:604:216:cafe::4b) by OSTP286CA0017.outlook.office365.com
 (2603:1096:604:216::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 09:43:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CA.mail.protection.outlook.com (10.167.240.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 09:43:38 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 6EA07427EFD1;
	Tue, 17 Nov 2026 17:43:37 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com
Cc: devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com
Subject: [PATCH v7 04/10] dmaengine: arm-dma350: Serialize IRQ and termination state
Date: Tue, 17 Nov 2026 17:43:29 +0800
Message-ID: <20261117094335.1393735-5-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117094335.1393735-1-Jelly.Jia@cixtech.com>
References: <20261117094335.1393735-1-Jelly.Jia@cixtech.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CA:EE_|TYNPR06MB8574:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 56a2d52b-cba3-4e31-32a7-08df448f423d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|23010399003|82310400026|1800799024|261021123027099003|56012099006|261022105027099003|261022075727099003|261026121527099003|261028144727099003|261026140227099003|261021121427099003|10067099003|261102123227099003|261009223027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	jPCapAgFdEE791P1/ROWyYbnhOV4o5zOlaiii5tiMzDLqzpS4Chfv80O8OG7THpjrxTug6uJ1C3uQkwYlVPyR8JQ6ebF+IITXc5dBTlLMKU0nDF+QSjAewynPXmMewRbxMJ3wi3MoHgb6qqDD3X/EBaeNBPDTCwushReCBfhtTDwlI5rbVVVbz/L/4Xoh6qO1evoUpKwVNWH+BCwhj/9jeBbXqV4htBWsNb0TusVKXmC2jhBYxvk4XGi4BcEBrhkKU2ZiJtyytos3cATaaSzDDeYIoSZGZVX9OP9aYKARcBmSre/WTvmLB9TNz0j43KnhuyjPneRrpasRu5ftJpZXtC28Cl0sPFgg02xQiNY0s7gIn8G83kZVf10ECgsEixAG8WAfcsATI0vAL9FvMGGm/FGUzsGApatJWtT1/fvSDCyqWh9Y6+QhaSx1chK8K+45QGrLzx++Qwuufy/n0Ug/8AmwNMN4+NHagc+zW8l10hOGm58MZB1SAosFPq0hcElKBLc/e8lQd/wXZuUXVjqeKKtoM9aXzigWHvVxIY31cXSJ9uJefXBwoqbfRyzJfHDwEDL+B1AY5PkqhUbAksyPAhDbOxttmKlt/PMi9n1rK5uPTI+sujJTwXsUYHy5DAQQjFWL4xFOrnEbaGTuIpZwXRLy2Yc3vvw6I/+HCLONKvNoD9RUhoNDAVmol6+niAYawoySe3TffhwYYig+zKBwg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(23010399003)(82310400026)(1800799024)(261021123027099003)(56012099006)(261022105027099003)(261022075727099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021121427099003)(10067099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	milGYTXkagA+KmKpLxvxApUyTlQqb91mpmE8mH26qtfvSgvE3oHHr494i3CCvCavpsV2OGC2I7p1YvDvrHMJYCHqVqvp5dhXW2Wv7BhYLuGjueB29DfMBVTKGe7cQlYkCOEq2Vi8c6lTmxdBwLg3K7s6j6MIujewX37YXyBeID6DSYz+IuDP6K4my5x2c1HgB9w5C/FXNXlZZTaA5efQfJ1P37Zsm3c/11jCvCcWo043CID5JBF72oaX5vr5G7Lz0JpeNpeLOjKF7JokH+Njjjyo0cy+aMAHO7VoRQ31J+9cw9XLZlphhVhjUEAa0fGwpRgzpJFOM7vFig8B7hnOo6OxtQdjC5p355sfIoNAFAsB1lzTX/a6Gx9Gc0RgxgajxhUHftbe1rHq13VpUsgDJxwYvmzZTzw8N+dR8bF8yxk8KQsiSwJflBWnXYL/45CL
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 09:43:38.8777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a2d52b-cba3-4e31-32a7-08df448f423d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CA.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR06MB8574

The interrupt handler samples status before locking and assumes an active
descriptor, while termination can detach that descriptor concurrently.
Completion can also leave a stale active pointer or overwrite the status of
a failed cookie with another transfer.

Pair status sampling and descriptor handling under the channel lock,
acknowledge only the W1C completion/error status, and detach completed
descriptors. Preserve errors until termination resets the channel state.
Wait for STOPCMD and synchronize the IRQ before releasing terminated
descriptors, including when channel resources are freed.

The existing DMAengine terminate/synchronize contract remains unchanged.
STOP timeout handling remains bounded and best-effort, as previously
agreed; no hardware-stop guarantee or new recovery policy is claimed.

Use scoped guards consistently for channel state locking, retaining the
original critical-section boundaries and keeping stop waits and resource
cleanup outside the channel lock.

Fixes: 5d099706449d ("dmaengine: Add Arm DMA-350 driver")
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/dma/arm-dma350.c | 133 +++++++++++++++++++++++++--------------
 1 file changed, 87 insertions(+), 46 deletions(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index 266df7923d7f..af1b030b955f 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -3,9 +3,11 @@
 // Arm DMA-350 driver
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/of.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -47,6 +49,8 @@
 #define CH_CMD_CLEAR		BIT(1)
 #define CH_CMD_ENABLE		BIT(0)
 
+#define D350_STOP_TIMEOUT_US	10000
+
 #define CH_STATUS		0x04
 #define CH_STAT_RESUMEWAIT	BIT(21)
 #define CH_STAT_PAUSED		BIT(20)
@@ -127,7 +131,6 @@
 #define CH_CFG_HAS_TRIGIN	BIT(5)
 #define CH_CFG_HAS_WRAP		BIT(1)
 
-
 #define LINK_REGCLEAR		BIT(0)
 #define LINK_INTREN		BIT(2)
 #define LINK_CTRL		BIT(3)
@@ -147,7 +150,6 @@
 #define LINK_LINKADDR		BIT(30)
 #define LINK_LINKADDRHI		BIT(31)
 
-
 enum ch_ctrl_donetype {
 	CH_CTRL_DONETYPE_NONE = 0,
 	CH_CTRL_DONETYPE_CMD = 1,
@@ -294,14 +296,13 @@ static struct dma_async_tx_descriptor *d350_prep_memset(struct dma_chan *chan,
 static int d350_pause(struct dma_chan *chan)
 {
 	struct d350_chan *dch = to_d350_chan(chan);
-	unsigned long flags;
 
-	spin_lock_irqsave(&dch->vc.lock, flags);
+	guard(spinlock_irqsave)(&dch->vc.lock);
+
 	if (dch->status == DMA_IN_PROGRESS) {
 		writel_relaxed(CH_CMD_PAUSE, dch->base + CH_CMD);
 		dch->status = DMA_PAUSED;
 	}
-	spin_unlock_irqrestore(&dch->vc.lock, flags);
 
 	return 0;
 }
@@ -309,14 +310,13 @@ static int d350_pause(struct dma_chan *chan)
 static int d350_resume(struct dma_chan *chan)
 {
 	struct d350_chan *dch = to_d350_chan(chan);
-	unsigned long flags;
 
-	spin_lock_irqsave(&dch->vc.lock, flags);
+	guard(spinlock_irqsave)(&dch->vc.lock);
+
 	if (dch->status == DMA_PAUSED) {
 		writel_relaxed(CH_CMD_RESUME, dch->base + CH_CMD);
 		dch->status = DMA_IN_PROGRESS;
 	}
-	spin_unlock_irqrestore(&dch->vc.lock, flags);
 
 	return 0;
 }
@@ -342,28 +342,46 @@ static u32 d350_get_residue(struct d350_chan *dch)
 static int d350_terminate_all(struct dma_chan *chan)
 {
 	struct d350_chan *dch = to_d350_chan(chan);
-	unsigned long flags;
 	LIST_HEAD(list);
 
-	spin_lock_irqsave(&dch->vc.lock, flags);
+	guard(spinlock_irqsave)(&dch->vc.lock);
+
 	writel_relaxed(CH_CMD_STOP, dch->base + CH_CMD);
 	if (dch->desc) {
 		if (dch->status != DMA_ERROR)
 			vchan_terminate_vdesc(&dch->desc->vd);
 		dch->desc = NULL;
-		dch->status = DMA_COMPLETE;
 	}
+	dch->status = DMA_COMPLETE;
 	vchan_get_all_descriptors(&dch->vc, &list);
 	list_splice_tail(&list, &dch->vc.desc_terminated);
-	spin_unlock_irqrestore(&dch->vc.lock, flags);
 
 	return 0;
 }
 
+static int d350_wait_for_stop(struct d350_chan *dch)
+{
+	u32 cmd;
+	int ret;
+
+	/* STOPCMD clears only after the channel has stopped using commands. */
+	ret = readl_poll_timeout(dch->base + CH_CMD, cmd,
+				 !(cmd & CH_CMD_STOP), 10,
+				 D350_STOP_TIMEOUT_US);
+	if (ret)
+		dev_warn(dch->vc.chan.device->dev,
+			 "channel %d failed to stop\n", dch->vc.chan.chan_id);
+
+	return ret;
+}
+
 static void d350_synchronize(struct dma_chan *chan)
 {
 	struct d350_chan *dch = to_d350_chan(chan);
 
+	/* A stop timeout must not skip IRQ or callback synchronization. */
+	d350_wait_for_stop(dch);
+	synchronize_irq(dch->irq);
 	vchan_synchronize(&dch->vc);
 }
 
@@ -378,24 +396,26 @@ static enum dma_status d350_tx_status(struct dma_chan *chan, dma_cookie_t cookie
 	struct d350_chan *dch = to_d350_chan(chan);
 	struct virt_dma_desc *vd;
 	enum dma_status status;
-	unsigned long flags;
 	u32 residue = 0;
 
 	status = dma_cookie_status(chan, cookie, state);
 
-	spin_lock_irqsave(&dch->vc.lock, flags);
-	if (cookie == dch->cookie) {
-		status = dch->status;
-		if (status == DMA_IN_PROGRESS || status == DMA_PAUSED)
-			dch->residue = d350_get_residue(dch);
-		residue = dch->residue;
-	} else if ((vd = vchan_find_desc(&dch->vc, cookie))) {
-		residue = d350_desc_bytes(to_d350_desc(vd));
-	} else if (status == DMA_IN_PROGRESS) {
-		/* Somebody else terminated it? */
-		status = DMA_ERROR;
+	scoped_guard(spinlock_irqsave, &dch->vc.lock) {
+		if (cookie == dch->cookie) {
+			status = dch->status;
+			if (status == DMA_IN_PROGRESS || status == DMA_PAUSED)
+				dch->residue = d350_get_residue(dch);
+			residue = dch->residue;
+		} else {
+			vd = vchan_find_desc(&dch->vc, cookie);
+			if (vd) {
+				residue = d350_desc_bytes(to_d350_desc(vd));
+			} else if (status == DMA_IN_PROGRESS) {
+				/* Somebody else terminated it? */
+				status = DMA_ERROR;
+			}
+		}
 	}
-	spin_unlock_irqrestore(&dch->vc.lock, flags);
 
 	dma_set_residue(state, residue);
 	return status;
@@ -405,6 +425,10 @@ static void d350_start_next(struct d350_chan *dch)
 {
 	u32 hdr, *reg;
 
+	/* Preserve the failed cookie's status until the channel is terminated. */
+	if (dch->status == DMA_ERROR)
+		return;
+
 	dch->desc = to_d350_desc(vchan_next_desc(&dch->vc));
 	if (!dch->desc)
 		return;
@@ -458,28 +482,44 @@ static void d350_start_next(struct d350_chan *dch)
 static void d350_issue_pending(struct dma_chan *chan)
 {
 	struct d350_chan *dch = to_d350_chan(chan);
-	unsigned long flags;
 
-	spin_lock_irqsave(&dch->vc.lock, flags);
+	guard(spinlock_irqsave)(&dch->vc.lock);
+
 	if (vchan_issue_pending(&dch->vc) && !dch->desc)
 		d350_start_next(dch);
-	spin_unlock_irqrestore(&dch->vc.lock, flags);
 }
 
 static irqreturn_t d350_irq(int irq, void *data)
 {
 	struct d350_chan *dch = data;
-	struct device *dev = dch->vc.chan.device->dev;
-	struct virt_dma_desc *vd = &dch->desc->vd;
+	struct virt_dma_desc *vd;
+	struct d350_desc *desc;
+	u32 residue;
 	u32 ch_status;
+	u32 irq_status;
+	u32 errinfo = 0;
+
+	/* Keep the sampled status paired with the active descriptor. */
+	guard(spinlock)(&dch->vc.lock);
 
 	ch_status = readl(dch->base + CH_STATUS);
-	if (!ch_status)
+	irq_status = ch_status & (CH_STAT_INTR_DONE | CH_STAT_INTR_ERR);
+	if (!irq_status)
 		return IRQ_NONE;
 
-	if (ch_status & CH_STAT_INTR_ERR) {
-		u32 errinfo = readl_relaxed(dch->base + CH_ERRINFO);
+	/* INTR bits are read-only; clearing W1C STAT_ERR also clears ERRINFO. */
+	if (irq_status & CH_STAT_INTR_ERR)
+		errinfo = readl_relaxed(dch->base + CH_ERRINFO);
+
+	writel_relaxed(ch_status & (CH_STAT_DONE | CH_STAT_ERR),
+		       dch->base + CH_STATUS);
 
+	desc = dch->desc;
+	if (!desc)
+		return IRQ_HANDLED;
+
+	vd = &desc->vd;
+	if (irq_status & CH_STAT_INTR_ERR) {
 		if (errinfo & (CH_ERRINFO_AXIRDPOISERR | CH_ERRINFO_AXIRDRESPERR))
 			vd->tx_result.result = DMA_TRANS_READ_FAILED;
 		else if (errinfo & CH_ERRINFO_AXIWRRESPERR)
@@ -487,23 +527,19 @@ static irqreturn_t d350_irq(int irq, void *data)
 		else
 			vd->tx_result.result = DMA_TRANS_ABORTED;
 
-		vd->tx_result.residue = d350_get_residue(dch);
-	} else if (!(ch_status & CH_STAT_INTR_DONE)) {
-		dev_warn(dev, "Unexpected IRQ source? 0x%08x\n", ch_status);
-	}
-	writel_relaxed(ch_status, dch->base + CH_STATUS);
-
-	spin_lock(&dch->vc.lock);
-	vchan_cookie_complete(vd);
-	if (ch_status & CH_STAT_INTR_DONE) {
+		residue = d350_get_residue(dch);
+		vd->tx_result.residue = residue;
+		dch->status = DMA_ERROR;
+		dch->residue = residue;
+		dch->desc = NULL;
+		vchan_cookie_complete(vd);
+	} else {
 		dch->status = DMA_COMPLETE;
 		dch->residue = 0;
+		dch->desc = NULL;
+		vchan_cookie_complete(vd);
 		d350_start_next(dch);
-	} else {
-		dch->status = DMA_ERROR;
-		dch->residue = vd->tx_result.residue;
 	}
-	spin_unlock(&dch->vc.lock);
 
 	return IRQ_HANDLED;
 }
@@ -513,6 +549,7 @@ static int d350_alloc_chan_resources(struct dma_chan *chan)
 	struct d350_chan *dch = to_d350_chan(chan);
 	int ret = request_irq(dch->irq, d350_irq, IRQF_SHARED,
 			      vchan_chan_name(&dch->vc), dch);
+
 	if (!ret)
 		writel_relaxed(CH_INTREN_DONE | CH_INTREN_ERR, dch->base + CH_INTREN);
 
@@ -524,7 +561,11 @@ static void d350_free_chan_resources(struct dma_chan *chan)
 	struct d350_chan *dch = to_d350_chan(chan);
 
 	writel_relaxed(0, dch->base + CH_INTREN);
+	d350_terminate_all(chan);
+	d350_wait_for_stop(dch);
+
 	free_irq(dch->irq, dch);
+	vchan_synchronize(&dch->vc);
 	vchan_free_chan_resources(&dch->vc);
 }
 
-- 
2.54.0

