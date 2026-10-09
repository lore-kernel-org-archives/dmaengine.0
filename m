Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023120.outbound.protection.outlook.com [40.107.44.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CF43DB337;
	Fri,  9 Oct 2026 05:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791523170; cv=fail; b=HZCF3flrSMYWcV2cyflDv6ZAmpghMVRsc9egdGJ2WRMxn3liuHgXdTCsVQoqDTXry+yZmsiq6cnat5JYzjje/velgIFvusTUPYPzTO14Ckaoc1CirDM4ZqJVbOdBhsGybRN5GMe3sb23FUvxhJMiCIY+AFRNi/VSw6135uWJnFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791523170; c=relaxed/simple;
	bh=AHwzJ2Eg8Ylu6KoEdmmqeQ8kPM/HOawcywt0hMLUanE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MPG44dFK0Dx5U7m4kvn4tAjfB+XPJw2nTmbExQGjP30H/DU+GXrhhxtg+BUPITZgGH8JavUs5iSyjE82kBvLbvFyuJIN9Io1ITsGEuZzjTiEDNISveDurecNXPzcwq2NiPtTG7YotLx9bLUzupPlpdaCxdm3AO7JFgBll4HJ4Ac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zy/i7VWpSMLHUVIICSeOz4vcfWM5nX8WnBS+WDVs9w/dJ+f1i8RjG1sgVZoTkFurHrmCMTx2efQnT3ATDRb2tsLQ3XiiPHMxfiJ5+1axTFxWD3yV3bmaQIdAJ9yvv8gkkkay/YYRHw5KYtO961zS4TT1ZdmErMp2+odouvYqT7krT/rR3lNWga0bKyir6LvdaYuWzfav0OK5fRJCCrJyuQPE5qRwz4K8QCX6YJLEF2vsL/W+v+xYsxE1k/XiC4md6YLfzlo83s98wzsJRUD+QxArlGe92QGrElAsDMIHE4sBYTh74rAMtFdg+os/x14O77CtEQIUoNKafp57vNcZ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtcZ92L/asIiAKL5EeTuF9ec3jZ1/cmpAq628JkoHqY=;
 b=cLRwDVH5o5eDgsdMNYSKG7BKBAquLOJYdvZFFLUFNDJG+2n7EECaUgiB5lQEK8pW6I6XeG17aBx/OC5gXQAaZyEnj9VjIJWvVLrZ63bMY1xLp0QAwIAW3UGTpa2oQqFo3Ft5+x7Ty8nXCD0pgAhtlqsH4kXttqKT/Sgd9QgojEI0MSshx8dXbnRaYZ58KlPcX8bf8RHNqehJ7WLXgjrcxD1iR/L0rnW2v8n2WwE8Efvubcj1pjFWoJRWmA+/bJyTvE2dnVr7V6hGnGFqaup20QIvSPjsXeZenteVL0c5dUEfZ5HC8WLf6eVng7EJAM1G3KVnz6VEpiVABvaegO26AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR01CA0113.apcprd01.prod.exchangelabs.com
 (2603:1096:990:59::10) by TYPPR06MB8017.apcprd06.prod.outlook.com
 (2603:1096:405:317::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Fri, 9 Oct
 2026 05:19:24 +0000
Received: from SG1PEPF000082E1.apcprd02.prod.outlook.com
 (2603:1096:990:59:cafe::9b) by JH0PR01CA0113.outlook.office365.com
 (2603:1096:990:59::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Fri, 9
 Oct 2026 05:19:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E1.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 9 Oct 2026 05:19:22 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 21A1140920F2;
	Fri,  9 Oct 2026 13:18:48 +0800 (CST)
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
Subject: [PATCH v2 3/6] dmaengine: arm-dma350: Sync the slave command list before starting
Date: Fri,  9 Oct 2026 13:18:43 +0800
Message-ID: <20261009051846.1115962-4-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009051846.1115962-1-Jelly.Jia@cixtech.com>
References: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-1-Jelly.Jia@cixtech.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E1:EE_|TYPPR06MB8017:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ad3c18e2-0d42-450f-dde0-08df25c4e0e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|7416014|1800799024|10067099003|56012099006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gymecyL7c7FaHxDAR1PbAlCY0phsyp+QO0McHLo+lVzaPjyOVlBZdrzijODhVqmz8+cCl4fWBIxOEjRDzY8kdX+6GWm6NlCMtkQ7HMRzJGj4DY1LhZ3l3WWi1ETky7iPxfKsxHF8kZtQSkCOCSFNDnvRXvSS03E7fq+u0ymP0x0OhG1BBIrJN+3JpteaDKrWQSJw/2MZqMc8R3FCc2s4H+b5z2AoETFe78fA+TkcLT59B38KrZFkcHB9KnIyw/F02C4+aBWjNdtJSvXjaQ9rOSGDD0i/VX60hVxvYXk6jlL1vai+wmH2QJwY3vtMRda9p+YzBlXM77viImWU3Hnus/oN0f0A8te4uSB3CpNlFqTJ0wzvPGwm/BBtqD4GzCWHx6wOGMNd8vsfEJcg0vLkGUvOacuKW7yckGkIc2pkh4PvRR0JN8CwVPq0UspT3dc1RkHbR/Ulu6lYHPuijP52miW1iMaPnvQM8jPUY23L9Ytv98VZZV0fITyZ5HuZFJ2nBowIip1BiWx/PEJ9av+9loOLX5ieJkQnx+MY4GHt/csy/Ap92NxFyED3cM3ZkqtN5Odr87RR38awrjf5vjCZnQPn1aL3DAsF4BImbEj5CoXs/tdUhKovEuxlFOG6VdxQdziiqljAa3Ry1lxRjpi/9bOWaWqhbwm4LQ3Tzy59UshDR8D5CUcx4F+EsUwcYLhN3mLoazQNLbFhkVBcpf7oGg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(7416014)(1800799024)(10067099003)(56012099006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3jptNLZlcFq2OuRxLVLUrY6XFxy+iFOwtDgcko96i510BVzG8BMM/J+yDPcJFmaOOiglVcCFO9P0k46fqnKGPNySTRBmXv+sFUHSy0qQbvKnsvCwy1XNeZj8OF2HkJk5xe9/wS18hOHw1xPgVfLDK7+gPoJjsiQk0AytpvejK7ryMZBV51xuzEa7YTsfGpu5rc/FhHadDoILreExuWYO2xr3Y53RyOK7iWkI4U1N2iNs32SY79pOOMaLaozIvKXUmuIEAvsRbAX2G53RnwaQncmtGjMiWNHYJuE/GmKUSTQu04dCj9ykUsnevFWEq5x0Xh3sYFg0iy0JzcgHEBbO0UCqe8VK9Jp58i6le7dfjt+Cu25tnt9Xru3de7Pnug6TSXDnXpTPApUHehy8XgRG0MGSTt6a6s5SA61RlkMjg/jVEm/TNEDbgZe2v8C7IZ6F
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 05:19:22.4779
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad3c18e2-0d42-450f-dde0-08df25c4e0e1
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E1.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR06MB8017

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

Assisted-by: LLM checkpatch sparse dt_binding_check dtbs_check
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
v1 -> v2:
- New patch: the command list is streaming-mapped, so it must be synced
  before the channel is started. Without it a non-coherent DMA-350
  reads stale command words and the transfer stalls after the first
  command.
 drivers/dma/arm-dma350.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index bbcf4071c3e7..e3fbfcce66e8 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -306,6 +306,21 @@ static int d350_alloc_cmds(struct dma_chan *dchan, struct d350_desc *desc,
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
+	dma_sync_single_for_device(dev, desc->cmds_bus, desc->cmds_size,
+				   DMA_TO_DEVICE);
+}
+
 static void d350_unmap_resource(struct d350_chan *dch)
 {
 	struct device *dev = dch->vc.chan.device->dev;
@@ -599,6 +614,8 @@ d350_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
 	if (sg_len > 1)
 		memcpy(desc->command, desc->cmds, cmd_size);
 
+	d350_sync_cmds(dchan->device->dev, desc);
+
 	return vchan_tx_prep(&dch->vc, &desc->vd, flags);
 
 err_free_cmds:
@@ -668,6 +685,8 @@ d350_prep_dma_cyclic(struct dma_chan *dchan, dma_addr_t buf_addr,
 	}
 	memcpy(desc->command, desc->cmds, cmd_size);
 
+	d350_sync_cmds(dchan->device->dev, desc);
+
 	return vchan_tx_prep(&dch->vc, &desc->vd, flags);
 }
 
-- 
2.54.0

