Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023082.outbound.protection.outlook.com [52.101.127.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6902B44CF52;
	Mon, 12 Oct 2026 08:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794525; cv=fail; b=dDGI7Lv0keyZI61ib34oXaO3X4ejrSACfiTX8RXc2WvRbQucQUK2hglMH1cJa1gGj0F51qVeXhNg0vVGzl0TEB9bM2lX2PH+RcyZ5dwFyHObXgEvAP+/Gmtn00m0+tji+W0aG3PhuC8WwXh3w6pccuf6CecsHS2bBa7UH7zP168=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794525; c=relaxed/simple;
	bh=wdynSX+yMKRw8nHjpfZSnJxkBaFqR9G0RpoSquZr8OM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aSYMrDFCus3tpUPtCAP3ykhHXJKmYS6P0WB1XHlG2Ey4e8iiKGoIJSQjclwYG2g1JJwPNjydfOKe4ftqD8AKgPb7g9ofPrHRMwzJ0cHmSqyri5xk6vEFn+mOR/HeR87LRt82Oe+039A4jOlueyvFKKuZC/DnN/3OCPzHuJ8GHHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eXgeLfOuDTb+VL/RKGYOG+7Umqt3B+OIcc9/ku9yF4+4dhbl7ZYibmI1MQDfIk376LZbyt0yCr+5tUbosJQsgA7vA7Rqk2WuBY/jBr4jCI2TPk+ygemsZegH8dmZLyNxY55V2nRxkvXqp+yjDl1Q4/mkj0mnK7qqvn0mAQE2Hqv6eHHVcFaRQDskLIkX1CLuSAlqR18lS89LBPbV4KrxnK8qDxcwi+0MFKv4LQKC0l1kA0rNcSlKCGY4RKfiVPnsQQ+viZCq3Yjly6wWzSEZJEQm8MtiwfYFoeVfsQg3nvWpzQCWHvOD8LTBTM7T6zhbA4JlAOTWAF5q26fIwwsnEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ANhxD/w5byaxGp8Vf3zh4wTJPH3agOVVge983aOWn/Y=;
 b=Od1WXsLhScrUvhXH/ZptZtureZdn1t/EMV9pmcv1h1OPZ+BdzKox29t0jNMdx3fFHSDkTSioDnIm03H/JHWjh5/RA2VefuVcCEpgvDEx+UMopFcHBjNJcYBt7fBQCXj4JlKVVTsn1AN6nZPOTU+xGQZjnP6C5vFSLtlk0OlYsZXOgSkK9H8OnT56xmhad7yhgluG7dd/6vKGdaVg/dguyFdzUDE2wgwPhOFCwj0A3K9m+BsfLxgXM29bt8Mf+ZxpIu4fLaMFGGR+fSvOd1Nh8SPjp8cAR6bYkRTAuOsjurez/Pf1QDysgNdRBiPM2wQkd9hB6tBDVD7o8PY6ZAQloQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0056.apcprd02.prod.outlook.com (2603:1096:4:1f5::7) by
 SEYPR06MB6522.apcprd06.prod.outlook.com (2603:1096:101:169::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 08:41:59 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:4:1f5:cafe::4a) by SI1PR02CA0056.outlook.office365.com
 (2603:1096:4:1f5::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 12
 Oct 2026 08:41:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 08:41:58 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 7E13D427E3A2;
	Mon, 12 Oct 2026 16:41:57 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com
Cc: devicetree@vger.kernel.org,
	Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com
Subject: [PATCH v3 3/6] dmaengine: arm-dma350: Sync the slave command list before starting
Date: Mon, 12 Oct 2026 16:41:52 +0800
Message-ID: <20261012084155.2547480-4-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012084155.2547480-1-Jelly.Jia@cixtech.com>
References: <20261012084155.2547480-1-Jelly.Jia@cixtech.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|SEYPR06MB6522:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 722b4ee5-d86f-43bd-b8d6-08df283cadba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|1800799024|7416014|6133799003|10067099003|18002099003|22082099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	uzTEKS9SApv3YTeIiZ7SkNpFTzXDF6m6bB5x9G/x1Beheo4pgFCbh5LWhn8Ykia32lvuXBFvQrrvr2ZgpNNZm4Cr9BN5JwFm9N4w6cVGFHrJVYqwxtFiP4OsS6AGbG9ZWrxY9UhNPaq0DYBiBDCYdfBlBzwtAs+/CyBRAcojZq9cAGfBvS7UGszW0vBSxTQKB7tgOit56v8HAoJ3bJx2/m51Dnl1GTCSbyuswOXRKMh7T/NbM7NTmzo3kwmeT3RhJeUSSDIghDKFuH3kFTtOLfN9yM9bNL5RYVHQ18qAd+OLs1jGHNUjm1OfsJvD2/3JofM1UvdeMK/Cqeo5DjS/2yMXSZe0Y7V7SfzpzXAwiyOa9nTxpy0AgWIDD3M3Kf7Dq5MulcM0IH2TvpMe+BZJzH2Qh/Nyq6VZVo9kFpAKKvczF6ubhb2oBl9zRYxTZnQbDHaWq11R9p8k9KK/Fam/NqIUH2QnmGww5YZ8DWeesOdPgs0QfKyyL0T+XR8nNP8LBTq6F6umhJzqjCA7S6HfS6K8TtpVm/nejIfDSRy1GmjfvwP5VC0KcZpH5a+o39TsDwFT1gQiDmdMROnny03/4WaahH94dCF3U6YX02GKeti5F4eNXwO4JjZp/XmU4aIr51y000TffD47cRKuyL+akUQqnseki9KGV2jZkorE7JgsVcbE7syqrH+Ngf/IoZ1NTzzWViAzG7RJhPWrHXxmTQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(1800799024)(7416014)(6133799003)(10067099003)(18002099003)(22082099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TGDrLgmohrfDwcKbkUJEy9bdd4nLfjhgm5wgNdZWSCpTislrcBhBOiNUqeMFwfk6Tftlvnpj4OcIiivFU1At+LDuLGvF+L1XGMLtWT81ImXp3A7F6ryqJzEKOQPX/nq3Hx+eBJX5KdJ01orc/PkemGgrz4seL9ixWlQTtyOU/GGo0KRFjBOZL5JRlectxxouW0SO//2OisVea5J8xYghD4GR0oySWA0PEXgaf79oGQpMQ0rKceMRlBhIx7aGtu9bk5j7zOj95hiIHUz06Dj27sXErEHQkY50VSoP5w/t2f5DnvnBwrwqliKnj0bhavwl0JC5ZxjV0fH2QEKUeo3x6gKyw6PrKdGa1Dpp0a4WzyNwODjYQT2gh6oKbBBEFYCDQ+2RSkVz/P4Sw+QuamNKAEN46+kPUU4R0mINd9CFohZWEfjtWSIOVIJNxE/Uy0vv
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 08:41:58.5961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 722b4ee5-d86f-43bd-b8d6-08df283cadba
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6522

The slave command list is mapped with dma_map_single(DMA_TO_DEVICE)
before the command words are written into it. For a non-coherent device
this leaves the channel reading stale memory: the direct mapping path
only performs cache maintenance at map time, and a mapping bounced
through the SWIOTLB keeps the copy taken at map time, so writes after
the map never reach the device.

The channel then executes only the first (register-programmed) command
and stops when it follows CH_LINKADDR into the stale list. On Sky1 the
audio playback died after exactly one period (0.34 s at 48 kHz S16
stereo) with "tx data underrun"; the same path is used for multi-entry
slave sg lists.

Sync the command list for the device after filling it in, which also
refreshes the bounce buffer. This is a no-op for a DMA coherent device.

v2 -> v3:
- The descriptor keeps a single DMA API address for the command list, so
  the sync uses it directly.

Assisted-by: LLM checkpatch sparse dt_binding_check dtbs_check
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/dma/arm-dma350.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index 7a198d35bef6..79bd6a04ea0c 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -304,6 +304,21 @@ static int d350_alloc_cmds(struct dma_chan *dchan, struct d350_desc *desc,
 	return 0;
 }
 
+/*
+ * The command words are written after the command list has been mapped, so
+ * make them visible to the device before the descriptor is submitted. This
+ * also refreshes the bounce buffer when the mapping is bounced through the
+ * SWIOTLB. It is a no-op for a DMA coherent device.
+ */
+static void d350_sync_cmds(struct device *dev, struct d350_desc *desc)
+{
+	if (!desc->cmds)
+		return;
+
+	dma_sync_single_for_device(dev, desc->cmds_dma, desc->cmds_size,
+				   DMA_TO_DEVICE);
+}
+
 static void d350_unmap_resource(struct d350_chan *dch)
 {
 	struct device *dev = dch->vc.chan.device->dev;
@@ -597,6 +612,8 @@ d350_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
 	if (sg_len > 1)
 		memcpy(desc->command, desc->cmds, cmd_size);
 
+	d350_sync_cmds(dchan->device->dev, desc);
+
 	return vchan_tx_prep(&dch->vc, &desc->vd, flags);
 
 err_free_cmds:
@@ -666,6 +683,8 @@ d350_prep_dma_cyclic(struct dma_chan *dchan, dma_addr_t buf_addr,
 	}
 	memcpy(desc->command, desc->cmds, cmd_size);
 
+	d350_sync_cmds(dchan->device->dev, desc);
+
 	return vchan_tx_prep(&dch->vc, &desc->vd, flags);
 }
 
-- 
2.54.0

