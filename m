Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793959878;
	b=V/zojI9FKFm/yi5oAjFQONvGKU1RaJ21z1Tzga+FiRQ4eTohvZdm/nu1IHjY+4fviUJ4
	 CFtLKurzhefy23MPa1VSlLcAk+ZB6CHF/0TIKj8B4r8tAsYHu698xMBZndOVA2nE3ijM/
	 w8Pgrb4neIpWQiBZcHWX5tRyWI5tUS/wQS/lTiusQqz5cvSlqWxiZIS0JG34bP7AxKPaj
	 AyjHkeCXXrQU3OvqsW9cbFJ+L0hihbNiSgLGppZh0i+DEF5qq6uVI8gWQzqdCL9mS7PKI
	 GNvWQLSXuMX8lKcU07GmOSJWV77O3cWOneZYk/VhrgiB/I5Oz122A6asTxPeOzFiNnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959878;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=Y27CLJy8mlbVue8Ak/bFc/MAdjSmLcsn1bAU3cIH0MA=;
	b=Fg4nbi8sGWvDvSsS0nJJIJf9UsCgvil/0Gdk9LgWGBN92M80ZBBD7tMKbvFe/EK0K2wA
	 Ao808vY0cPzzaB/i3x6KVXDCeJaFisw3re6w4uQx8LGMRj6sS99dLBtGR6hh54JkXx7ul
	 oe5nhtfNkLeheZauN/y+adybQLhlCEGdVmR4eLjhgUHn8/pDMOckPn8pxerD7e5jUeslI
	 PTCApYtvhIBtCezISqS86MOW7zCNRayRseq+cytOwccm80nhIdF5SbOC4oJG+bUzgmwNA
	 koLG/+LuzIOVUlFTUFrnii2UWHdqpfKTDrMMrGjLb9cwAffOerJOLpbGeYkzXWuLgfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="xED/wYIf";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.57
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012057.outbound.protection.outlook.com [40.93.195.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70378606A330;
	Fri,  6 Nov 2026 10:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70378606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xED/wYIf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QgfThg1r1lIIYWG3a4eY1yS4YyWVKZ9P+YyGfxD8RhmgosDo8lUHJ9SVMGxMArn1YFuRrQ+WAGaztUuRI7FT97x5OHgX+5hQJOi4LfebESLlJMxCDqqfxyKxBNEGuj6l/210Lcgw1/FwOCj6hjnKeKmlxFH34W8GcvRP9LBxDVzdQ/sL0kqyPvzAcwJlcX81qw9MOmnzpwWnZ9yINbmetrYQxriQMTR3e3s4BTDx1VpJyct40TrLUSwCYS15EuaQDToLYFpT5wl10NOv9NxjD5ZTrxjXa/gJfTSVBPRqh1WzHg3ZS037IHZr2v8tmZyswbAgjgbehQwF6fzq0D2WuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y27CLJy8mlbVue8Ak/bFc/MAdjSmLcsn1bAU3cIH0MA=;
 b=jBbYm2pCvj3ipXjN3GQGR+TR9fvklQwwh0NYqNkQ+q3y95loCfV5KNZtrm81qPbXybUdnzU9fYE6quAOvrQ3Z2GA2rAbiQQLapjIOzm0gGg85UNc2rZ06g2qz1O0k/iEnXJVEbfOZzKi0gS+BZ27PHQo6Q21W+svs5tPun6kX9G8aHK6asuFkABg2+UUg61hQbd77SGfqOmwxEkPCIyLaRgwpKAtjGfG4oxbGe2vZ5cUEZVeqC+RhGCHLSU++hp2FWmASILFfiHwzv6Iw7NFXVVX3TWKyW36lOgELtzh3zJgaXOkveVA/6wDSHMvEy7q1TXnLNNg2EoGhHzGiDtZgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y27CLJy8mlbVue8Ak/bFc/MAdjSmLcsn1bAU3cIH0MA=;
 b=xED/wYIfr+AcDG9v5zVfVPTdTWZ6ikbW/53SzVixgmZd7+tCtZ1im2EYuCD7udv+LqWeoP+dsWpQpsmHkg5qxycvOuWkjYLP3oiLJcDo/bY7p33Yv0ru/U3ZYr3JrWfbOfd1JkRLdmpIaOsHlBmkvVcpvYeDilOMaaO7CwBdSTA=
Received: from BN9PR03CA0056.namprd03.prod.outlook.com (2603:10b6:408:fb::31)
 by DS2PR12MB9687.namprd12.prod.outlook.com (2603:10b6:8:27b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 10:11:10 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:fb:cafe::46) by BN9PR03CA0056.outlook.office365.com
 (2603:10b6:408:fb::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 10:11:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 10:11:10 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 04:11:05 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 04:11:04 -0600
Received: from xhdnaggolla50x.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 6 Nov 2026 04:11:00 -0600
From: Golla Nagendra <nagendra.golla@amd.com>
Date: Fri, 6 Nov 2026 15:40:26 +0530
Subject: [PATCH v5 4/4] dmaengine: zynqmp_dma: Add per-channel reset
 support
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261106-adma_per_channel_reset_v5-v5-4-f9990669362f@amd.com>
References: <20261106-adma_per_channel_reset_v5-v5-0-f9990669362f@amd.com>
In-Reply-To: <20261106-adma_per_channel_reset_v5-v5-0-f9990669362f@amd.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, Michael Tretter
	<m.tretter@pengutronix.de>, Harini Katakam <harini.katakam@amd.com>, "Shyam
 Pandey" <radhey.shyam.pandey@amd.com>, Abin Joseph <abin.joseph@amd.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, <dmaengine@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Golla Nagendra
	<nagendra.golla@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793959842; l=1646;
 i=nagendra.golla@amd.com; s=20261008; h=from:subject:message-id;
 bh=dbBrtfbpYTHoDBPRs6Ie+SvQcOiwlKJ1+WBT1I//7O8=;
 b=/g5UudEdLAOJJNiOEKAoV6bEc0IbQRqtfueLK7BT4G87+8u120vvsTJTu289GRQUwCCoW3fg/
 A+boHQEDGTRCdehKMlbsOIEZ2tsKvnP5rHFGpXG9n/mVg+vsxx6MTxS
X-Developer-Key: i=nagendra.golla@amd.com; a=ed25519;
 pk=pCRGj/0mb0C3aDMpVVZeyBqOIQZUKGJjCKL4QZTu7nQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|DS2PR12MB9687:EE_
X-MS-Office365-Filtering-Correlation-Id: 927f8f32-427f-49a3-7374-08df3bee47c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|7416014|376014|18002099003|22082099003|6133799003|10067099003|921020|11063799006|261028144727099003|261102123227099003|261026140227099003|261021121427099003|261022075727099003|261021123027099003|261022105027099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	0XQuQOsrbeXhe+prLwuqCrX2u4ZnFecBtZbSNa/iyTERef4QiYiz7VRAuCKa99qVfyCNvf5w39jJDr7Hbpj1hc5gOeoXmeGzoh6gIrFv6SQdVHPgZbZpBIuojAbZLKgURBFsI++HTVTiO5RlSVfqZ4lQdy0rCkYPNMjfLNmJFMll6E6aipdaCVocYS1LNRLl8WwuGc2xxqxKHagXKWr6vpuVt41PrMGGZVqvEmUw8umvkPBzCnjdDOxHX+Q1R1I9JgapJtdqm/5qULujoOyqsb6dnklwrth3XACgdN2SOChoeXDjBkKXpOodhPZimHcumd1Es8YpRNpxSdH1O40aK6MbhS6ddfZ/YvIjKKS4NScEKg8n7nAbFuYu7YKrHPCoksXcdurOF+wuHLltP2uRiKcAzetZo0DrNiCyCpLuXd/RpX2Je1fD50/QadpRUEuu5xXzwr3twboePqCOxPjV/p7azUr1bwQw687Aq35LNb++XOe8J0ELhjF454+LHV6EnazYhH2Gsf3Wc3cqaAPAg0qkCmHOClkeKm995u34rdbxvaFe/IjS32UYRN7FnxEMtsET+MQoM7RvW6gT6fw4p86brhj2jnLGkw0CBRORNMSoCpkXvJn9SLKnuwwkDdWQp8uI3CPFV5v72aJ1OSXx9K1fDMvGvOqM2g5jCeAIlwZrCedSh+RA7grBFFJ+ZAAPrwoTpZyXxiNXRb9Gr71xn6+GifBTNOtwD/qkuKyUmUmux0Ze/szH8ptUr858OCn1
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(7416014)(376014)(18002099003)(22082099003)(6133799003)(10067099003)(921020)(11063799006)(261028144727099003)(261102123227099003)(261026140227099003)(261021121427099003)(261022075727099003)(261021123027099003)(261022105027099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HmYSj16I6Dzx5LXaIuQlcN0l1u8eEKxWLjrL5h/7QqCR0F/3CD6uLLiKswgTtybxqNrxUC6haWqShV9FhW0prXrpL9nHXGF6qqMdLLbrnmqUBCvdV5W8wFXQKKXAX55fQq57yISnD7HcOt41bK4PNteecQXSx8nTzeN1MArg+yn6dvCQlOWgIFDKoiJ0sHPtQhBV6UvJKBqRJnk1DAVNGNjq1/8JfpOio+5Rkf8X/V67J8sbyAW4qVyX2XV5GwzP1+OJeb7KXrokyQ1TRvo246L1pSJabPPAV1tZ3ifB5u8nCu/M4dGqscIPWFJKV8wHb5xDcgiaNaaL61AqSz7BzaPrDF/wkwZ5bKh1HUmeLZd4C88M+o1QgBsrp9pOtpAFPQR7n5m111VPwa/4PfToXxmf7vsv01f30YYbk3AnwM0qPTCwxFgZxDBW2N5t+2Lm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 10:11:10.1732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 927f8f32-427f-49a3-7374-08df3bee47c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9687

Versal Gen2 and Versal Net expose a dedicated reset line per ZDMA
channel. Trigger a reset pulse during probe using device_reset().

For Versal Net and Versal Gen2, reset is a required DT property, so
probe returns an error if the reset property is missing. For legacy
SoCs, the reset path is skipped.

Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
 drivers/dma/xilinx/zynqmp_dma.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index cb0eb13f9b05..12696fa44c66 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -19,6 +19,7 @@
 #include <linux/clk.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 
 #include "../dmaengine.h"
 
@@ -937,6 +938,14 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
 	if (IS_ERR(chan->regs))
 		return PTR_ERR(chan->regs);
 
+	match_data = of_device_get_match_data(&pdev->dev);
+	if (match_data && match_data->has_reset) {
+		err = device_reset(&pdev->dev);
+		if (err)
+			return dev_err_probe(&pdev->dev, err,
+					     "failed to reset channel\n");
+	}
+
 	chan->bus_width = ZYNQMP_DMA_BUS_WIDTH_64;
 	chan->dst_burst_len = ZYNQMP_DMA_MAX_DST_BURST_LEN;
 	chan->src_burst_len = ZYNQMP_DMA_MAX_SRC_BURST_LEN;
@@ -952,7 +961,6 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
 		return -EINVAL;
 	}
 
-	match_data = of_device_get_match_data(&pdev->dev);
 	if (match_data)
 		chan->irq_offset = match_data->offset;
 

-- 
2.43.7

