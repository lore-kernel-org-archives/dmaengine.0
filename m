Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020119.outbound.protection.outlook.com [52.101.229.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3BB480976;
	Wed, 12 Aug 2026 15:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550284; cv=fail; b=tNzFkwp6IUU2zVRy2z3SxcBuDsBCdWj/t2mPr7vNRNkpm0bbrknxMOb2zsSDboykP6Y/xPyUQ5gLkgWB5FnUUtyr2g2vak/PMAl0Aa1Q825veECd2lQXQt3A4HmXEoBM/rPzyhYxXn5sqsxi3SelB1daJ0WoP1fpZHuySsSwVoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550284; c=relaxed/simple;
	bh=3/8nBuTskyn1uFh7CbZbYf8rDiWJ+TKA+9DnZzsIlUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kaTSSVEpZdWyhha1Qs483GITs9/0vAy73f7Btix4L57XeVrUFAmTB08aXgV5lB1WtAQIw0h7TIC1FqM/lINPcCq2ArW29FV4TYkrYFw2p1RsUscbdOiEVBgUNsWb1k7Q4B336Pbv3RbAuPUpiZkvkTZF769b216BmCydds0H6Vw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=EiIOqs0e; arc=fail smtp.client-ip=52.101.229.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="EiIOqs0e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQuMGNe1xIPbPYBph/vw8w57t4lT7AL9/GxlsHSd5H6xwgtBK5Km/5Qg1aL/FCp7VMMTWtWo1lLaFUJelNrD9ZeAQqUf9Wx6oDsPUj1iPGONYoBSJrJykpjG1Xxi7KozLUnGAV434e/xaKbt4evbvkUGvx/ZH2MmfrNOzdDKHVntZVUPtGZzCLqgKh7bSOqgItzxd3XG35CUgBJLMTDx1OdmRA3Ro6azRRvJQt42tHxLGNAxols30pisZfNg44kYOjR0qTk3oX5Trw/hBlVxOBW28EddOB7AbEShpx3cpFziIg72Y9DZ/ijEEZAyOmpnpHXQljtHNCn794B5bAAvIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3a+b6dMN97tY03hzxFgfzyK4jxgwlD2QJDDcKom7a7c=;
 b=m02ygwjMnT1VO9Lv8J4if/FGgjbEgyl4bU2j69banvVk320GE5Af8RMI16RFDY6NYxKWtyB5EJvGSJ2rs5/H35cQ8Cru4ft97W9heRdEvP1nIi2P9kAEIlghMd1Sszj9RjCMecis/PNEPXQnmYRZK9934ybcO2qKt3lsaJlWsm1cdtIlSV3i5vBabFpteEnDME5rOBC+ik1pNfaOeDtDVaKwSegG4JF+js9OOEIN+itJDjec8ElxM9QZDv7EGHut5JojeaC73c40MiT7bfK4unxfrGfNec/PhD2iaTkF0JojIS+jwEAj/+BGj2Gz1LdEfLfSuhGGSuEzHTtzKsmozA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3a+b6dMN97tY03hzxFgfzyK4jxgwlD2QJDDcKom7a7c=;
 b=EiIOqs0eXBDiKhDR7ygebTdDW+Rk8idqSHe6B27Mh9lnM25kvminA6y5dhzq1j6exAsAau4mepg0HMyRRXdv+uy+oVLHHFaSEZCQMVeiIUwe6CXZWJNSEQxOLdk89Me2ah7KRTbme5yVS0FXbvfrjpIeH2k+5ysXJlJKMNDGTEA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB7115.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:42f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 12 Aug
 2026 15:57:38 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 15:57:38 +0000
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
Subject: [PATCH v5 16/24] dmaengine: dw-edma: Use HDMA watermarks as progress events
Date: Thu, 13 Aug 2026 00:57:13 +0900
Message-ID: <20260812155721.2807506-17-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260812155721.2807506-1-den@valinux.co.jp>
References: <20260812155721.2807506-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0019.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::6) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c9fb254-87a9-4d59-aca7-08def88a6f25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|7416014|376014|1800799024|366016|921020|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	c1GaXt+eunww7npqQq5qZRHpa8TkIrwFMMnoIp0dkkQUBftYr/DduY7PjEAAABOoSjqTeNK5baX2rORR/GLOmX9zKryv+767NA57Lb9nY5jvkZlXLPnXtf2HdVu4mIt3JEhc89jfa5dB5uKXQUz350IEFHz6/ofznNllPTrsrPBGZqt9oCv6gsw/RNCZ7SI+0SFrIH1zMEkkWOQP4W9ePcGxahRFziea5wxBrOp4R9vlEpStd36RsVrXmYKQNOW7PTWo2S+iRBaNYFlFZnoZDUNg12zXFKF7H16CJKaflc3mhY1bT0II4nGk5cJAw9emi7WSFS8gLg3Mx2OZEQGcu6aIgVA6LudA+nmRdgjxBNVWdSLcDNYHkoUPQBQ4utD/Cv2Ub1ugPF/IrLxj93vDaTK6QfHHW6aM1u+221J2HJ293xclBP3Zn+hR2KLK/KXu+7r1eoxzWZJVBDjg7uLvVWhNFORwpaI+doNFA3Y2gGybQWhFLqxP8FgxuhhaoNjAsbOgUCO5z/Ngo7Mji8/+n7XzBkVCd0LP1b6zNLIKqCcsEi85rt62O3tNfKSazAXiw0JzmBT9CMtAex/yCeDAc1dd/n54wKzuPuv6pE2FjJkZBobtFgOWnz+Iz3K5OaXKXOQpo7z1tv5EtyPPpsOJd7uJA1BnFjJGIGD+9Q3T0VyaovFTb7yIlX7AicUrAo4+EibMgD6Gr/PoVWPY+IlHCQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(7416014)(376014)(1800799024)(366016)(921020)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BUx7u2GUTZJl06MyWt7GpwJYObfDIP/WGmYKD4CZCYLh+N/wwl7gsfM+r/1d?=
 =?us-ascii?Q?zJ3o257kCO9cIkWILMyUeXx3FuES/XfCIA5hMwq99bIoUhkz7KlytpyyC+Yo?=
 =?us-ascii?Q?wU2qAT5U198mYoH4GXXg1ONDQ0zKDzdhGiYsNEMTorF1QQ7VtPuTO+CHz6oy?=
 =?us-ascii?Q?iVRD+qb8zTO9ZNdlueKp6frOh9pCp/CzC+AwR/kNj4EBKkRd707UU5/A9qxv?=
 =?us-ascii?Q?raPMsbleQo9ftErwHS6NtzxG3QCf2kkqzoT7XjstnHMGb0pdidtFje1z/Rwd?=
 =?us-ascii?Q?GqtBvYsqy/DeUi+j/D1szjOxGHWrrjD4vXiJEnS4K88m+ODeqrCvVn7A88G4?=
 =?us-ascii?Q?wDuPXNq9IJJpOmr3cAaLbHxMVtfbCBtaiaZHXnVGBIuW+qXk10qHnWX1bsF8?=
 =?us-ascii?Q?21eYXTlTLMZiLkKf+NHPUN2iQpPU4gGonvWGW1rbpdcEdfNelgrXe5uUXdbl?=
 =?us-ascii?Q?oWpcO6Sbsqg8ewQV50ZLxM+n23u171VaS6OC/f4GCsszTRRSKgy149XubXrO?=
 =?us-ascii?Q?NjnSe+HSYEJa1znyIGcUzBO6vdNljNgFzn+VOe5Ctm2i7QZhkyOoJE24QKoP?=
 =?us-ascii?Q?bSjsPNkFlGakUC9c6c1vSjM/b+u1XXScWQMIuVafaG6YaHOs/TzrsxwRaAPS?=
 =?us-ascii?Q?vAVXZl7D/z8OcVAJZylXQEEzp5f87tD5y8ey6SWa7120uUwvAGauve7kRYng?=
 =?us-ascii?Q?VBa8BgQk1Q8GcDjBcc1rj1v9hAVapbB5xhY6LGkozcM3BWcJ1eutUz2oLWnY?=
 =?us-ascii?Q?nAbyujrfoY8peAWJIsFwYXd1YKoBOOgOS0cymd8ANyDRi+xFpJUvluXC5LhP?=
 =?us-ascii?Q?ltR1Oa8dBkPp+NAfIK/bHrmIFRofZT1tzyqiKBqY+Sfk0WFPNteet/VinuHX?=
 =?us-ascii?Q?zTCqr6165IjEZ8h8huonGy/LHWV3wVi+yqtCNGrHecFqYWXCVsZwUZ0NiKgb?=
 =?us-ascii?Q?gRTGugyVOUvphKSJC90w9x560NDM0Y4AQXwAbw+tM7aB4Rr/k3mINNjhQplv?=
 =?us-ascii?Q?fBk9YjMA4skADPaeowzSS8PJb7Cy5N34BRhkV+X5pmeQmAVNw6axSxj74gQW?=
 =?us-ascii?Q?Opcfd4NzxCFV/ORmHqE2W4KnM/RDPJ0nZLoOshC8FmBBHWoHhEanmvt1M/ao?=
 =?us-ascii?Q?oF9v9x8zhcEe1CNyFUsjOE2YgQobeX1c/Ud2qlKxGizUfN8L0H/4v2+WXPdT?=
 =?us-ascii?Q?/IDyWx7CLw6+VEoR+GRXx9HDWc/921R8gRmP6b/k0xU8dNcZd+e1E43EGqY4?=
 =?us-ascii?Q?zoGZ0lguRUbHFPTANp385H50f71a3b+OfUps4xlVV0LO/CTVK7i4RHitvx3D?=
 =?us-ascii?Q?8uSmZ+jAk/Oskjqxyrx35o7OF2kCLYsvlz8LWqbTUY64tvR5tUu50oPV5H2c?=
 =?us-ascii?Q?uBFmDxx+hWCuQ7ztZvjKBXeblnIYzkTE8qCIWGq4sqBcbdDPXtEOjVk/Syit?=
 =?us-ascii?Q?77dQxNGljemiNJGyiMtyQsNyscSPUVreepILESBjPGSVeS8LMOTw08K7/4nq?=
 =?us-ascii?Q?qgsVryGmgLjtAsrSiTVSZBkqgVk21bQLaD1GPORC2iHXMCYAc7dp3UbzId/N?=
 =?us-ascii?Q?aQ9cAsCx323iwjo2h9AV1dRZkkimvMpYmt0NwlcxCSBvJZeSzWkiGjtFjAP6?=
 =?us-ascii?Q?nCny3T6fDERKPCoxykl9Yj++uZopRxBeGkG+5/8vYaNNAsrrrxRzdQ/tDLn+?=
 =?us-ascii?Q?+EfW0rWX8Pnf23jGWKMcLoXrfMMOnFzmMJ46/8agQzR5CVWhkaO8w2Ml5wjW?=
 =?us-ascii?Q?8OILkHp3igHoRUlV6zVenwlmZr37B5WKCkKMcxjAaphEJU2eL7QJ?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c9fb254-87a9-4d59-aca7-08def88a6f25
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:57:38.7591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: adqfnbboC+RkgITv6Wq7jkf3XIw+Huh/Dp/y6z5aeIptlVLZ6vExFxwWnWu3V8ay/Zl/XalPbt6dHPxLg6O90A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7115

HDMA reports running LL progress through WATERMARK and channel stop
through STOP. Wire watermark setup, clearing, MSI programming, and
LWIE/RWIE into the core interrupt path. Record WATERMARK as progress;
STOP remains a stopped event.

DWC PCIe Controller Databook 6.10a, Section 7.2.1, permits recycling
LLEs through the watermark LLP. Testing on a 6.30a integration found
that boundary unsafe for DMAengine completion: clients released mappings
while hardware still accessed them. Keep completion one entry behind the
raw LLP. Once the channel has stopped, LLP points to the next entry and
needs no such margin.

Leave EDMA_REQ_STOP and EDMA_REQ_PAUSE to the STOP path instead of
handling their watermark as normal running progress. The eDMA path is
unchanged.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - No changes.

 drivers/dma/dw-edma/dw-hdma-v0-core.c | 69 +++++++++++++++++++++++----
 drivers/dma/dw-edma/dw-hdma-v0-regs.h |  1 +
 2 files changed, 60 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index 41e51eee71cc..a0f36cbe0e6b 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -53,7 +53,8 @@ static u32 dw_hdma_v0_core_int_setup(struct dw_edma_chan *chan, u32 val)
 {
 	val &= ~(HDMA_V0_LOCAL_ABORT_INT_EN | HDMA_V0_REMOTE_ABORT_INT_EN |
 		 HDMA_V0_LOCAL_STOP_INT_EN | HDMA_V0_REMOTE_STOP_INT_EN |
-		 HDMA_V0_ABORT_INT_MASK | HDMA_V0_STOP_INT_MASK);
+		 HDMA_V0_ABORT_INT_MASK | HDMA_V0_WATERMARK_INT_MASK |
+		 HDMA_V0_STOP_INT_MASK);
 
 	/*
 	 * HDMA_INT_STATUS.STOP and .ABORT are latched only when LSIE and
@@ -63,10 +64,14 @@ static u32 dw_hdma_v0_core_int_setup(struct dw_edma_chan *chan, u32 val)
 	 */
 	val |= HDMA_V0_LOCAL_ABORT_INT_EN | HDMA_V0_LOCAL_STOP_INT_EN;
 
-	if (chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE)
+	if (chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE) {
+		if (!chan->non_ll)
+			val |= HDMA_V0_WATERMARK_INT_MASK;
+
 		val |= HDMA_V0_REMOTE_ABORT_INT_EN |
 		       HDMA_V0_REMOTE_STOP_INT_EN |
 		       HDMA_V0_ABORT_INT_MASK | HDMA_V0_STOP_INT_MASK;
+	}
 
 	return val;
 }
@@ -76,10 +81,12 @@ static void dw_hdma_v0_core_ch_off(struct dw_edma *dw, enum dw_edma_dir dir,
 				   u16 id)
 {
 	SET_CH_32(dw, dir, id, int_setup,
-		  HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
+		  HDMA_V0_STOP_INT_MASK | HDMA_V0_WATERMARK_INT_MASK |
+		  HDMA_V0_ABORT_INT_MASK);
 	SET_CH_32(dw, dir, id, ch_en, 0);
 	SET_CH_32(dw, dir, id, int_clear,
-		  HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
+		  HDMA_V0_STOP_INT_MASK | HDMA_V0_WATERMARK_INT_MASK |
+		  HDMA_V0_ABORT_INT_MASK);
 }
 
 static void dw_hdma_v0_core_off(struct dw_edma *dw)
@@ -90,18 +97,26 @@ static void dw_hdma_v0_core_off(struct dw_edma *dw)
 	dir = EDMA_DIR_WRITE;
 	for (id = 0; id < dw->wr_ch_cnt; id++) {
 		SET_CH_32(dw, dir, id, int_setup,
-			  HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
+			  HDMA_V0_STOP_INT_MASK |
+			  HDMA_V0_WATERMARK_INT_MASK |
+			  HDMA_V0_ABORT_INT_MASK);
 		SET_CH_32(dw, dir, id, int_clear,
-			  HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
+			  HDMA_V0_STOP_INT_MASK |
+			  HDMA_V0_WATERMARK_INT_MASK |
+			  HDMA_V0_ABORT_INT_MASK);
 		SET_CH_32(dw, dir, id, ch_en, 0);
 	}
 
 	dir = EDMA_DIR_READ;
 	for (id = 0; id < dw->rd_ch_cnt; id++) {
 		SET_CH_32(dw, dir, id, int_setup,
-			  HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
+			  HDMA_V0_STOP_INT_MASK |
+			  HDMA_V0_WATERMARK_INT_MASK |
+			  HDMA_V0_ABORT_INT_MASK);
 		SET_CH_32(dw, dir, id, int_clear,
-			  HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
+			  HDMA_V0_STOP_INT_MASK |
+			  HDMA_V0_WATERMARK_INT_MASK |
+			  HDMA_V0_ABORT_INT_MASK);
 		SET_CH_32(dw, dir, id, ch_en, 0);
 	}
 }
@@ -158,6 +173,22 @@ static void dw_hdma_v0_core_clear_done_int(struct dw_edma_chan *chan)
 	SET_CH_32(dw, chan->dir, chan->id, int_clear, HDMA_V0_STOP_INT_MASK);
 }
 
+static void dw_hdma_v0_core_clear_watermark_int(struct dw_edma_chan *chan)
+{
+	struct dw_edma *dw = chan->dw;
+
+	SET_CH_32(dw, chan->dir, chan->id, int_clear,
+		  HDMA_V0_WATERMARK_INT_MASK);
+}
+
+static void dw_hdma_v0_core_clear_ll_int(struct dw_edma_chan *chan)
+{
+	struct dw_edma *dw = chan->dw;
+
+	SET_CH_32(dw, chan->dir, chan->id, int_clear,
+		  HDMA_V0_STOP_INT_MASK | HDMA_V0_WATERMARK_INT_MASK);
+}
+
 static void dw_hdma_v0_core_clear_abort_int(struct dw_edma_chan *chan)
 {
 	struct dw_edma *dw = chan->dw;
@@ -214,6 +245,12 @@ dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 				dw_hdma_v0_core_clear_done_int(chan);
 			}
 
+			if (FIELD_GET(HDMA_V0_WATERMARK_INT_MASK, val)) {
+				if (!(events & DW_EDMA_IRQ_STOP))
+					events |= DW_EDMA_IRQ_PROGRESS;
+				dw_hdma_v0_core_clear_watermark_int(chan);
+			}
+
 			if (FIELD_GET(HDMA_V0_ABORT_INT_MASK, val)) {
 				events |= DW_EDMA_IRQ_ABORT;
 				dw_edma_abort_event_mark(chan);
@@ -282,7 +319,7 @@ static void dw_hdma_v0_core_ch_enable(struct dw_edma_chan *chan)
 
 	/* Enable engine */
 	SET_CH_32(dw, chan->dir, chan->id, ch_en, BIT(0));
-	/* Interrupt unmask - stop, abort */
+	/* Interrupt unmask - stop, watermark, abort */
 	tmp = GET_CH_32(dw, chan->dir, chan->id, int_setup);
 	tmp = dw_hdma_v0_core_int_setup(chan, tmp);
 	SET_CH_32(dw, chan->dir, chan->id, int_setup, tmp);
@@ -343,6 +380,11 @@ static void dw_hdma_v0_core_ch_config(struct dw_edma_chan *chan)
 	/* MSI done addr - low, high */
 	SET_CH_32(dw, chan->dir, chan->id, msi_stop.lsb, chan->msi.address_lo);
 	SET_CH_32(dw, chan->dir, chan->id, msi_stop.msb, chan->msi.address_hi);
+	/* MSI watermark addr - low, high */
+	SET_CH_32(dw, chan->dir, chan->id, msi_watermark.lsb,
+		  chan->msi.address_lo);
+	SET_CH_32(dw, chan->dir, chan->id, msi_watermark.msb,
+		  chan->msi.address_hi);
 	/* MSI abort addr - low, high */
 	SET_CH_32(dw, chan->dir, chan->id, msi_abort.lsb, chan->msi.address_lo);
 	SET_CH_32(dw, chan->dir, chan->id, msi_abort.msb, chan->msi.address_hi);
@@ -362,6 +404,13 @@ dw_hdma_v0_core_ll_data(struct dw_edma_chan *chan, struct dw_edma_burst *burst,
 	if (cb)
 		control |= DW_HDMA_V0_CB;
 
+	if (irq) {
+		control |= DW_HDMA_V0_LWIE;
+
+		if (chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE)
+			control |= DW_HDMA_V0_RWIE;
+	}
+
 	dw_hdma_v0_write_ll_data(chan, idx, control, burst->sz, burst->sar,
 				 burst->dar);
 }
@@ -444,7 +493,7 @@ static const struct dw_edma_core_ops dw_hdma_v0_core = {
 	.ll_link = dw_hdma_v0_core_ll_link,
 	.ll_clear = dw_hdma_v0_core_ll_clear,
 	.ll_cur_idx = dw_hdma_v0_core_ll_cur_idx,
-	.ll_irq_clear = dw_hdma_v0_core_clear_done_int,
+	.ll_irq_clear = dw_hdma_v0_core_clear_ll_int,
 	.ch_doorbell = dw_hdma_v0_core_ch_doorbell,
 	.ch_enable = dw_hdma_v0_core_ch_enable,
 	.ch_config = dw_hdma_v0_core_ch_config,
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-regs.h b/drivers/dma/dw-edma/dw-hdma-v0-regs.h
index 2124c162a62f..60dc054adafa 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-regs.h
+++ b/drivers/dma/dw-edma/dw-hdma-v0-regs.h
@@ -18,6 +18,7 @@
 #define HDMA_V0_LOCAL_STOP_INT_EN		BIT(4)
 #define HDMA_V0_REMOTE_STOP_INT_EN		BIT(3)
 #define HDMA_V0_ABORT_INT_MASK			BIT(2)
+#define HDMA_V0_WATERMARK_INT_MASK		BIT(1)
 #define HDMA_V0_STOP_INT_MASK			BIT(0)
 #define HDMA_V0_LINKLIST_EN			BIT(0)
 #define HDMA_V0_CONSUMER_CYCLE_STAT		BIT(1)
-- 
2.51.0

