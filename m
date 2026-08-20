Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021129.outbound.protection.outlook.com [40.107.74.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F667481FDD;
	Thu, 20 Aug 2026 17:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787247295; cv=fail; b=uPzhzeW4R2aHVUc8WiMK3Qtc3s77rAfZzsXOEXAmxS2La+j1igVDz6I6aIyzz1/Sf7oSjVYrFT8zUzW4tXSpqVlHPvQytNm7apJAMhirTHlRBSJNqClCDU5U+ovHViFOAHzqpfNCzyf6gjq6jpnoEehNBzVI/NEewKE30riyb4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787247295; c=relaxed/simple;
	bh=o9Yt8qsu89dWfLZlbJwIeUfP4sGfrWCwEcoXNBwHpnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dPAcCNro173LuG0fbQv4rtIV1I4adDfcIHJVht3ATbeETFEjEpaU+JP5+rJIVWRj1z3oE/5lJDSS/Y8fu+h7FOmZ6hejED1XGF21Fxdxj3sj87yDaLCfUmXo7w1CqVzPQlo0w6rkA+AMIDiFwf0d7nqJpuoMyt/uecUO4I/Eo1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=BV+MkHzV; arc=fail smtp.client-ip=40.107.74.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="BV+MkHzV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zTg0tq9kHt8lfG+FQif7ogZdLltuZLKFp6QXZf5ZU2XTnzPKnLpWjs6o2Nqe9JIKtRvCUjAIrRnK7uE1ANHteF7oHDMnNHUMzfz38p20gArEHmBUSguVE95jwmuSKWMTVhDoT30//OXc6111oHSqQa11RNuooGPUNa/lJ4n3RtEId5O0tmk1i4Vig4N1GsaWT33lvzxx+p+ifzTm/sc7RAxrcb+7kgO4SFq/uv8SktRGS9IyJ+2odyzhOq61JY8MIgNzu41VYUjzCAXL+sSLpbvTOgS5EGSQouw8mq3ESI8mp911nIpZ7ZVRrQy96vvL3KvqyPkSqSi3Ejg2a34r9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Np1JmTw6M13u6kvU0n0fdZytyd55WOyMh669qc1th88=;
 b=ctSwvMd1Ckq7lXsXa4vvAsg4owX8vNciAWIWEJV0ZO0MtQ924CEiUGSyQUXC7WxhpzlT4T2aieDmPxD5YA/XkUigGPD1Gn4fRaQlC78L5LikIIa61oxZPebXDmMbIaRHaFHm7reySC0xSSYTdmljC68dWwZOn0K8wapP5yo3d6fwXcwpLGIhjVz6u01lePvwy5nrOtctmBuNYI/Rkj9W8ZEE3u51ut+FK5llDS1x4bYVMvbhETbAdiwQ2bS0kSOFUD0ERGjAPcbUOPiAzj5pDO0jH9yOIuUsiznNdskhTXkrak2Y6YzDPnqiVN615QzVjgFJ6WS0k9QDf/vRaIQxTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Np1JmTw6M13u6kvU0n0fdZytyd55WOyMh669qc1th88=;
 b=BV+MkHzV+4lzpd5aXIndPZIt7jgEmfn5xxvqzzOScDOdVWWtWWBd4o31eyocMth1DjhSKkYRVXU2YlSQz9Q0q4+Aqhjd47ySq0CoZGu6xUIR/rkhiqpXRha7Ug9vB2wGUPIyDBPLmPN9vcBFCZcff1GOtCioRFGbL5vsMElZ0/U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB7644.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:461::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 17:34:47 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 17:34:47 +0000
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
Subject: [PATCH v6 05/10] dmaengine: dw-edma: Move callback result helper before LL helpers
Date: Fri, 21 Aug 2026 02:34:34 +0900
Message-ID: <20260820173439.2004068-6-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260820173439.2004068-1-den@valinux.co.jp>
References: <20260820173439.2004068-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0006.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::15) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: 59350fad-3385-454a-b201-08defee154c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|23010399003|1800799024|366016|921020|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lSuRXkN3kvqeo/m4Hm9IVC/Qr0zOnN+1OA4yOJD9fvqZCXltxzFB7XnmYO5wvI9c7DdWsKdP9InALaLLbsq6EI1W8Ut63aEaayNC+JYI3CmXZdFym2oW8Pq3BV4zB0A3QWrpVplD+xxr+iCCB8aSe2yXtcRiggyw0pVmyrKOHYizes1o5bveFidzHGUfMUB4riCf6khN6va3CGec9JwQ1zp66R6Benx6ei6NXTsdrBYwXZ1Bvyaunz4wVtzszp2b+NM7TMV+RWedG5KYlahDVAJVTGdn8rfAH750qGcSzLqGcJFbwj1+A195OtC6CkVF0fx/nIimxTH9svsdPc2dYd2t0sXQuR0bKjNdauExS8FbuEoW5NckQQJohx7x3V29g9kt4bnJWAmGRaaqQAW97V4fu8tzH6PF916rtlymo88P/YAIfi9ktGVh7bKNtsZnB5TflajxJSqR7qCVhSd18EjgXaOBPbR4IaqSCGzZznGZ5tG46HaWFvwbW7M5sP6GfPCIvN7tydvYkvK6S4wSG6AqtNmN+COAfNZ02kWPS25XK3+mG9L+vi6yX9nMNe54Er/+Y8R/OdRnBxb59y7Q6Y2wo2cTlyxMc6CUiaoV/jO0RIoikppMQHeE+h8aZaYFxL72++B7fLw3IMjSQLPJ0lSAWAEN/Mfz5a3/ZeiNWjwmvaBIemGOXT1pL5BFM4vya/poHdWSNMVl3MfEx4ltqg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(23010399003)(1800799024)(366016)(921020)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oA2NvJwJQ+SMQ/0DfHQ8Xtvi1e3EQsr1Z7jd99nqsLR118h94AnDAcLI4nY7?=
 =?us-ascii?Q?EUaKqGA4vQV3dQwIMYhr9yrgCDGcnEVwUtiBsKqvPh3J/WEheaW30sdabjMS?=
 =?us-ascii?Q?UQQS8nXN6lBtWgr0M6HXZVkrD+P4EbYuP6rf5JQhJJltAwdkAAUBC7a0iRjp?=
 =?us-ascii?Q?wl2NrINbe+wR7GOeqkFbXpzIf9P2ohFU955FxWx7mIE5HLumDW7JD68amGcn?=
 =?us-ascii?Q?g8/uqNstIk/j7fH84fIspSh4fEBtkVrJcggZ7aDrFc49EIcD/Eqo22A6FI4P?=
 =?us-ascii?Q?zhMwUrkd7D7UKn93mtw+D+RPBC1ARTCrFPaAjeMjYS1W0RT9reO7kz7A/30Y?=
 =?us-ascii?Q?usVFME9KeGz6+45J1S7OrAZ/qukiCpbuMDuOW+bwy7N4+6S8I9sH8vmsVZ4R?=
 =?us-ascii?Q?gsPYN0/16kbpjgO3q4UMlmRVQlddvK8mOi/QtMCK33W3f7xhbL6pQy56mCAs?=
 =?us-ascii?Q?Fa7VtCKw4e3q1dkT/5AQTD4FdzGlCPo2CvwgbEDwcTEWZHYeSxP+1cYj2G/g?=
 =?us-ascii?Q?3GKfsOMx6VaYxjCiN1WMkBrDaCYtfSEQySFL5YgHJgjQqZY89OrbZwaGi5o+?=
 =?us-ascii?Q?juwjPWj4PmWhAvlh/YaDluDJvZ6WlrX5r/tkMVU0oX+IRAftUom1MtJEy3BX?=
 =?us-ascii?Q?UOO0ZxcMmp+sCZTmKEbM3Y5FmcS0kizkL+lba1v7pY+yqoDkCLje5sXRo+7z?=
 =?us-ascii?Q?fcpaHgvi3pIJHdaXutcV6cUmtJbOBe2azM2X+CSMTB1icEhyu5AHYk5P6HPz?=
 =?us-ascii?Q?h3ZK8xarU/BkNCdpraKhLh3Y/90YLq5zvE3784CbzRhDLPw7XHT7jfO9s20r?=
 =?us-ascii?Q?kf0xV80M+gac4CF6R5mv+ysYaJNSn3zCknlAnoIlUmZp0lYbQvCZpREGZNmX?=
 =?us-ascii?Q?jUGof44KwMGopxrW36+txeRWkBjZx1UGRTC9K4GvI0qu+x94nmihwNtH2YyR?=
 =?us-ascii?Q?WkACAM43gk0nwiZp+oH/DXwZNZpaM3R+xUMsbVfFJgd0YZZXxRFZJ3e3JSIs?=
 =?us-ascii?Q?mDQRZx5p8mdmWk4NtuGVCVzOWbcKI7wClNkDw2iJMpmGOlxHuGdVETZrxuPC?=
 =?us-ascii?Q?/SV1umz6Kiq5W9r5FUYclN+pVQVVYzv0Zvr1PhEQwzMQJ+wQ3oeZT3gpZcKL?=
 =?us-ascii?Q?h+iPzNnMMBfBT0gNZrv26ZcsHzymnjWe928QT6EUQJkFetTRLdIEj0w5eSM3?=
 =?us-ascii?Q?wX/EtkLYuaISwvbFXFADZSD91mQdK2P0LHltnyX36SJGkOUEP3kiAqXsptg+?=
 =?us-ascii?Q?1R8cVSp2NYd9uiknK0giLvENOUazep5l9ZdVYo3QYEcuoDdJFR7iRzO6nhE/?=
 =?us-ascii?Q?TAahEjM/Unkcptq/LGXSZ+RG3PUvksgoQBnKkbxeOFNUbxDYIgmyIILJ+jDQ?=
 =?us-ascii?Q?xY91VcDLM3marztCMfekVRkA0tLjr9hh3/DpJjYhs+ikj8O2IcKVWck6jupl?=
 =?us-ascii?Q?RLNaoP9YzGLOVNYBGjjC6AXR4m4X8kGR64JV1UmwLosAkge+YwE76faVIIyN?=
 =?us-ascii?Q?IAQZhhI+Oa6UaRPOKFpytc4tJL0tsHD88IcNqHcC2P673zlDYvAmZc7Re1Kk?=
 =?us-ascii?Q?+tBrKr88zlVsXb+Tq+D2tXzJW2/+AAKQEkFnx5g4c+hJW7yv5YD/QhuzCceN?=
 =?us-ascii?Q?QZDcHFzgWy1U+poUvrnSTYdedzl/IDaJrHA/SZOF1O4OGvgQgQKmmo4gZdNd?=
 =?us-ascii?Q?XyGlD4cVhkPv48l+/YdHC5w6wVyRHmpDlngDcRgJM3tYyqqd+kjyxXDdsvYh?=
 =?us-ascii?Q?I2h316w2AJSCg4cZ5BxsNzIO34QOH+F4Nw2YVXB/bfz+K+3FLtf+?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 59350fad-3385-454a-b201-08defee154c2
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 17:34:47.7045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JDx4bFyX+o8ziiUTxL4dTwCUiFTQDuaGhwYrYaYbz8YxkuIFWq3x4g28Him6K9hLHABQGxg3MeXaUTR6jVOB9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7644

From: Frank Li <Frank.Li@nxp.com>

Move dw_hdma_set_callback_result() next to the descriptor helpers so
linked-list completion and reset code can use it without a forward
declaration.

No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 drivers/dma/dw-edma/dw-edma-core.c | 50 +++++++++++++++---------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 1af262b6e881..ab8e343f0196 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -73,6 +73,31 @@ static void vchan_free_desc(struct virt_dma_desc *vdesc)
 	kfree(vd2dw_edma_desc(vdesc));
 }
 
+static void dw_hdma_set_callback_result(struct virt_dma_desc *vd,
+					enum dmaengine_tx_result result)
+{
+	u32 residue = 0;
+	struct dw_edma_desc *desc;
+	struct dmaengine_result *res;
+
+	if (!vd->tx.callback_result)
+		return;
+
+	desc = vd2dw_edma_desc(vd);
+	if (desc) {
+		residue = desc->alloc_sz;
+
+		if (result == DMA_TRANS_NOERROR)
+			residue -= desc->burst[desc->start_burst - 1].xfer_sz;
+		else if (desc->done_burst)
+			residue -= desc->burst[desc->done_burst - 1].xfer_sz;
+	}
+
+	res = &vd->tx_result;
+	res->result = result;
+	res->residue = residue;
+}
+
 static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
 {
 	u32 i;
@@ -660,31 +685,6 @@ dw_edma_device_prep_interleaved_dma(struct dma_chan *dchan,
 	return dw_edma_device_transfer(&xfer, dw_edma_device_get_config(dchan, NULL));
 }
 
-static void dw_hdma_set_callback_result(struct virt_dma_desc *vd,
-					enum dmaengine_tx_result result)
-{
-	u32 residue = 0;
-	struct dw_edma_desc *desc;
-	struct dmaengine_result *res;
-
-	if (!vd->tx.callback_result)
-		return;
-
-	desc = vd2dw_edma_desc(vd);
-	if (desc) {
-		residue = desc->alloc_sz;
-
-		if (result == DMA_TRANS_NOERROR)
-			residue -= desc->burst[desc->start_burst - 1].xfer_sz;
-		else if (desc->done_burst)
-			residue -= desc->burst[desc->done_burst - 1].xfer_sz;
-	}
-
-	res = &vd->tx_result;
-	res->result = result;
-	res->residue = residue;
-}
-
 static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 {
 	struct dw_edma_desc *desc;
-- 
2.51.0

