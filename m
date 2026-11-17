Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.117
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794908628;
	b=2m0WwgQtXNlglD/TjXV6ECutTxfhqoi6xX3lqBsRh7drjCRRSdJiKPllDVY9Sls6iJBo
	 Aq9q/Deh2eqeiLsJYj96Sh3PX4tTSivSmZpjkW7K7t5p6ChqkJPviDCWQ+O6DvwDpzMjJ
	 ZKYEo8LQLT3HpVdtiFEzoQ477r3LRiy8GMJkEs2iMFvM4Ouf1Jgq38pPqikE1CyQ+p6C4
	 ckIdA54ra81ECiQC4zfkFDLDBH8Sj/6hUQvoOU3luAnjPuFvJALionxpkGxMi1Cgj1u6W
	 lvHnRcXuiO50fKpHcCKV6eZWX+Rw1g6YZED4wry8aEglrxnTyUWz6POPSABI2nP8a3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908628;
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
	bh=d4H+OH7K54UFf4VBdUBinKL5nXIA3ULBobd5mHhrMKM=;
	b=tj/Hgs+0sF7lCcSAVv/ZfCKg0ZyBrrhTGWiRt1uPvIsCxtsOZXlvK09ni+ejMLlVukn1
	 0jZr3JVI9eW1jhmFpqSG/PKq0rF2qcsjNZf9dsLNdl2etiisdRT5PmCjXuEP/Z+nRPr/8
	 w8/LAoLo3fziQLlYBlaQqmdJENQoFSDBY8wsjQJ2mJRscf2BM/AKNwWK+FE5jN8DauCrC
	 YQTzE7PX6VD+7G9WsA7XcYqnXSa6XvRGK9tsWoM50bOpGKt2EsyZt7LT9SBmW4/P2gErL
	 T2wt9Nl13cEWOaEfOFCA1HoCBBceLY4t4htiZUuiSYB/sKgOS5yE/5bhIV5/DGbjtMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.117
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022117.outbound.protection.outlook.com [40.107.75.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC36606A8A7;
	Tue, 17 Nov 2026 09:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DC36606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L/H2x3Jthy4kMZ/0oVmRuSDV17XBSxJDFx+dax1o1k/URJLyhKiN+vjQCxLJnlCHzr4vloTJWW1Ifij/qRrawh0zYAMz3wwb+Gnlln3ymRLqty+D7j4Tg20FEZJC1Zx8XfNRP1I+fEGfIYgKMKW+2Ua2cm6/PogN8hXq21eUgwkgirHPQ9qmdZ2Ps4CPsSsFuBC9ctI3qWMLf4yymc8Rgzwf9PgmFOIm1aoD7mv6XUeimoHE3pCtHtDl+qO6rgb+B8Rsf/55lGT//6W6o+ZylrmWFgoOiTEzvZ7YCll9ysr2oUnI95BUnkeYEqypyC+avOsA+Hf/Ms7FJZwaKfcYJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4H+OH7K54UFf4VBdUBinKL5nXIA3ULBobd5mHhrMKM=;
 b=PQwuVY80qH3Sx1p8zRIQ2a+xrD3CX5st5V2qbQloksPi1fjY9FeodJURXXHVMO3waNfvChHIq+y25uheXDMQjYpMFxQtIdutvxoZZKDeOqDeGGAlrmTiKVqiO8ngQui87B8cPgI4/EBwzGNfKzht+MqZBRb2cGcCpVqxQd0Lxvx/r94v1MUm3UTf/RPHWh3O4PTj0M07wwYfDrQoNQ91A0zlShRcx3usoDlk7dalR8fAhOgZ1t11DMKCpBYQiBmhbZT3/HY7RFJnqRYBQLLCBH3V2XTSKLrqb7JHGQsJe6A+7VC56CC5i49uHpFREslBuKLzKgIlTci4ra64RyK20g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::6) by
 TYPPR06MB8280.apcprd06.prod.outlook.com (2603:1096:405:396::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Tue, 17 Nov
 2026 09:43:44 +0000
Received: from OSA0EPF000000C8.apcprd02.prod.outlook.com
 (2603:1096:4:190:cafe::a8) by SI2P153CA0023.outlook.office365.com
 (2603:1096:4:190::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.1 via Frontend Transport; Tue, 17
 Nov 2026 09:43:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C8.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Tue, 17 Nov 2026 09:43:42 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 959E740920E1;
	Tue, 17 Nov 2026 17:43:39 +0800 (CST)
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
	Jelly.Jia@cixtech.com,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v7 10/10] dmaengine: arm-dma350: Support integration clocks and resets
Date: Tue, 17 Nov 2026 17:43:35 +0800
Message-ID: <20261117094335.1393735-11-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C8:EE_|TYPPR06MB8280:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e9b48bf4-0b63-4446-99e1-08df448f4491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|7416014|376014|36860700016|1800799024|56012099006|261026140227099003|10067099003|261028144727099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	LakMUA2C8yhd1XmFS0SFZS1KmpuE3hu3dYXWs6qJ/yI8wTuX4+nriC0wEal1ClJky2IXtf0Cwfi6qsYjxe4+fc/iN6wdyZGf0d/lU+9BYvKvNafVJLRmlCJ6c9PcKdR48kxVQLO/etVw3IybkEjcTNbJ7I5ynk6rifF3ZcPjhh/8eIiKsnzODcqQLv/BqJwna8hnfdCbxpJDQwtmksMRyjCRi7PkOVEzrUPgIRbfRD/I84MA+HnY9SJZJJcuruBSPbamTAVR4EnHCQQIJYKefRRDfbU6m8SksvrjVDdpDfR6uY/FGy3+3h2uml23VHLtPZrpXQMnzbc35JmA7dy0/FqIUmvu2xHm4Zwn411RZB0Y0lvzGJFGzcI8i9oBZnwA57ohvRqgbRtx5m2GOPpAQ/MFbTK7M0lh3hFTPB7g8fAHyD2KIzHbZy5qQI6NhhUcZtyL1/fhiVjcNgKDRvPMzhkwB5WA4/CoVegHox/YayiqomDSghXC/IGmmgNpLHOSKeYUJZtA/351o6UHgHA3im3DhFDiQmdKkAYZPsFJE0U57EE0pjDXx4m1gYzytbyfsWYqwXLQCJOKFBe09HSYj2XIAnncitz7QDrCfr35rCUE7Bydh8a0+3PRDXVWgWqZCyaiMpgW7jvpl/9Q6lb5wJDqoxCjTKkCsFjqOpXryk71U7yBJS190yTQ+72V/yk953ugS0z+e/ZUFqrdmjjOMA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(7416014)(376014)(36860700016)(1800799024)(56012099006)(261026140227099003)(10067099003)(261028144727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AyCkG6YiKSUSf83+pCYinhMYtAcYnA7sjf8Q8mK+M0apMVuYJP+zxfIlniHD7/cxDveeoGIM2DULFbZI4U0U5fGEgDR2Av2VCQ4byLxPd0t3LW0YNMiarSAFqcw1m2NEEayArAdQG9FEUcmY9+MED76D6znFw74pyHzn5i3blJCg2onwQgre3GrPskhDRZ0otAWUPaK8v4zVXHviA9F5AsDy0vYyQor6Ltiy+KGb8pR6isMyS89zT1VJm+2cfyindGCfxozgqjreKNxexFwCPJbHGFkuKdPs8qsrTcpYMTGHD7ftaZqaQJ13mu7VIhjNK2xmWcmd9RkzCNWSeZv/ub/zmbDbEu93Dgyp65Ddh/zNYX8A3rS3kSx0NK6uaxCFQonDHw+oqvV9mXbKnyr9zsZ/KKm7YZzerBM7lMAmFQPD2Vovgl/Pg2ZI1Mh9u5r/
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 09:43:42.8820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9b48bf4-0b63-4446-99e1-08df448f4491
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR06MB8280

DMA-350 integrations may gate the controller with a clock or hold it in
reset. Enable an optional clock and deassert an optional reset before
accessing the controller registers.

Use the deasserted reset helper rather than requesting a reset pulse.
This also supports reset controllers that only implement assert and
deassert operations.

Both resources remain optional, so existing integrations without them
are unchanged.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/dma/arm-dma350.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index 7b46b4fdcf9c..ab68213d0bbb 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -6,6 +6,7 @@
 #include <linux/bitops.h>
 #include <linux/byteorder/generic.h>
 #include <linux/cleanup.h>
+#include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <linux/dmapool.h>
@@ -17,6 +18,7 @@
 #include <linux/of_dma.h>
 #include <linux/overflow.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/string.h>
@@ -1270,12 +1272,24 @@ static void d350_free_chan_resources(struct dma_chan *chan)
 static int d350_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct reset_control *reset;
+	struct clk *clk;
 	struct d350 *dmac;
 	void __iomem *base;
 	u32 reg;
 	int ret, nchan, dw, aw, r, p;
 	bool coherent, memset;
 
+	clk = devm_clk_get_optional_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to enable clock\n");
+
+	reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(reset))
+		return dev_err_probe(dev, PTR_ERR(reset),
+				     "failed to deassert reset\n");
+
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
-- 
2.54.0

