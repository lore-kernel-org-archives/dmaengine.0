Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023125.outbound.protection.outlook.com [52.101.127.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21F93EDE6E;
	Mon,  7 Sep 2026 03:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788752057; cv=fail; b=dtXxgnd2PQIorIxY04ZuoINHQmZ4Du/pXQCLGkGdKkziCUn4eDA/4LAlJKrwb3VTtYbnDdfHE0pFKx7zGL6l+JjKPPmwLWetiaRAU8bf3ynMn/P+0HSSZY40yilfINJMGxstsMChKomuBZ2Cnl2y+i+28Nd2hv42YCRNeAUBa9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788752057; c=relaxed/simple;
	bh=zuenrUgOjcfD2WA2sI3m3UlPc9+xIw77bZLTFVK7tq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dOdfo5/ReKaiyWj03bMhLMnPoqQR9jLJlYNrUze8p0UDH2kpHjyEx/Kisbvm5i7RvpMClY87mG2J1SAvwu+SZWZLHFZdNXfD43mIJYKQGNT6qXTV0agGB+tlW1tz/OjZ7XyKF7mk6xEwCEN9VFQg4lfEfkq+Z9AxpwObmu6bKeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vR48aca315ciWBVU3HxjTFwcUPx0fKr3ctb5w457z7cvIHqwQPrfjuqQZEeVn0ybzepDcyg7d6ozhXqk2UFXFH4RM1OVrE6qfvWuUrBbtq0LFuCAfWTJTw1TpgsNFlylwH4GW/2keXACsYRBecAb9MV1dqOJifQA+gQdHA9NFE2kizt/TwYwxzFCQqZL3z6Tj0oDs/ny4iO6xL9HxvS1GWTxLQtq1jLm5qlzxGHVZhf913Km9CklQOK9wcbSooyYhAKoInNjVPlNsc6SXDBTt4t6Xk+75PJ/CtF4D6gYOUx3lCe8SCVTj+3j7kIuLfTmXi0Wo1n/kDOxObAT/OxiQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8oTQwwTpFbW1uwTZsTSfqryEOP6QTh8vf020r4Zakc=;
 b=T4N54VsHAsCvCGlsGWXLc0vbFzCIovYLnOXnyjOmeX9xHBfO4HFh4qI66Ci/gsP8fi1FTXSumWhZqjvNsohF+ZLLivPPpZEg/cllehetOqELmWHWKnbzNfUgb1/DoL1rVJalAtK2q2zlRIqzE7PYAjarU9AHsNAInzdX0KolqxlIa/ujbPwJoFNuN7jRs/yKkAUZCw1HveEKlC2YeD6lav0i8l6sXR4bODYACer0LBbJK3bkW2+of1Bjmn8NgOck177W68+mzCLkN2M1k9SkCrVz1Z/7Ok1F1JC55YqIN8ZC0JhhcfRiIBRUnuVg/FUusSomivUJez9f+FxbQm/vkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::15) by OSNPR06MB8255.apcprd06.prod.outlook.com
 (2603:1096:604:45d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 03:34:12 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:192:cafe::9e) by SI2PR01CA0030.outlook.office365.com
 (2603:1096:4:192::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 03:34:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 03:34:10 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 80F6F409211C;
	Mon,  7 Sep 2026 11:34:07 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	Frank.Li@kernel.org,
	robin.murphy@arm.com,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly Jia <Jelly.Jia@cixtech.com>
Subject: [PATCH v1 5/5] arm64: dts: cix: Add Sky1 DMA-350 nodes
Date: Mon,  7 Sep 2026 11:34:04 +0800
Message-ID: <20260907033404.596839-6-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
References: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|OSNPR06MB8255:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8aa4e4b7-9605-459a-60c6-08df0c90e1a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|36860700016|376014|82310400026|23010399003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1kObxeO5862oGvbBV7OUXupTUJ9qOqUI5X7Bu+tDTMv4oEsDYuehDxqyPCN4g4s8QtnZNWld+PznIfRpAi+/3Jir9dEH9XkWnx6vIi31vGzCbw7xtDCvJOXdJNZEDaUv5DCHvVpnfk1WOac9lzwubdwAIVnZzDOHUwlmrOJpWco/dRBelmqNOGipc2ff4Y3ViRcaEqGIypiPrueVpj7Z1kLKzc8yhAOsvyVgCXNIijIRC6RAKIikc3HFDVSioE0CEQew9TYjBpv9lrTTf4vv7VBCRNl1dZ/iRMxYLWBldk0Eo5NMCyjmwv7t+rnZBqgsuqO267ymQB9WzR3socccpyXoLnf3t65ziQEZldTpCfd9ePrPjgNQfA1BXM99CP8V0zeKpq2HeYHcn32oupEo97wGjm/i26oFCSavFl18+7iwHlj+f2aEIwzhz7D/2GWGZH7Vzb9gAba3rGxOeFLH8GUYfXjQxd9S/lgOmJMw2MgJ1xlWg6aorNfO1ViFmkUrHFcRgazs/e2pzYYhV9MR/kSPrQLXUADaL14j+IEEiRtnvexNNBO7Q3qkMvSszO3nPgx9N8Rs3WmHrzrTWpzs+vw3xUeHrTSaIRkqvq6xfYrp7p50WoqhmvHqBIb1KrxE8vBkjf4IpRHFfRPRh506ZosdHJ1JyVPubKvGDwTM3kxol39cg5HdLXAv97RRETVErrTuZKHsAsVPLyZMGmilxQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(36860700016)(376014)(82310400026)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bIX8GoYWfPs/8JvcbOj+eiwyym/j0PXgFE/rekEjPMbtI2koZ/MAsnNcyVNimNeuZLYiliZWxpmJWJfuN0WN7UosF2HcYIHoZ5qy1LYyDr+gOVJSfb8Nysgjrer7uzeBZWkU/tI+Pze7Ufsp3g507AJ/Lc/F0dvW1a2vhubv0+8BgS1nJUOm9DQ1JHPKcEjptWvCaOk4ab7C8VmkDSqmXi/Fm4YhUq1pSLyeCLKI1ByU0TpYn8d/snjl98Qmv/HTIn4iupDu1J1UP9IcsFSThpnoHqxQTcFJt1NICaCj7TkuD9h+8MUvB1xu/e1EX4I/RjgaxxqFuob08ETcS8Ny/84/Awp8Oto4KxiYPEq2I7/UjO+Pb2eEfI5mL1iWXcBfhmzN4P9wzSoe5J/s1v5UIzOVl2kCQg4a6ucnM+rdjn53lxmwzNPKheuP3GrplWUP
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 03:34:10.5822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa4e4b7-9605-459a-60c6-08df0c90e1a7
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR06MB8255

Add CIX Sky1 DMA-350 integration nodes with child Arm DMA-350 controllers.

The nodes describe the FCH and AUDSS DMA instances.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 61 +++++++++++++++++++++++++------
 1 file changed, 49 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 0a820f45feb9..7a5e463dc7c5 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -518,18 +518,29 @@ iomuxc: pinctrl@4170000 {
 			reg = <0x0 0x04170000 0x0 0x1000>;
 		};
 
-		fch_dmac: dma-controller@4190000 {
-			compatible = "arm,dma-350";
-			reg = <0x0 0x4190000 0x0 0x10000>;
-			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
-				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
-				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
-				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
-				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
-				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
-				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
-				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
-			#dma-cells = <1>;
+		cix_fch_dmac: dma@4190000 {
+			compatible = "cix,sky1-dma350";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x0 0x0 0x0 0x4190000 0x0 0x10000>;
+			dma-ranges = <0x0 0x040a0000 0x0 0x040b0000 0x0 0x00040000>,
+				     <0x0 0x80000000 0x0 0x80000000 0x8 0x00000000>,
+				     <0x80 0x00000000 0x80 0x00000000 0x80 0x00000000>;
+			clocks = <&scmi_clk CLK_TREE_FCH_DMA_ACLK>;
+
+			fch_dmac: dma-controller@0 {
+				compatible = "arm,dma-350";
+				reg = <0x0 0x0 0x0 0x10000>;
+				interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+						<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+						<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+						<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+						<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+						<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+						<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+						<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
+				#dma-cells = <1>;
+			};
 		};
 
 		mbox_ap2se: mailbox@5060000 {
@@ -576,6 +587,32 @@ mbox_pm2ap: mailbox@65a0080 {
 			cix,mbox-dir = "rx";
 		};
 
+		cix_audss_dmac: dma@7010000 {
+			compatible = "cix,sky1-dma350";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x0 0x0 0x0 0x07010000 0x0 0x10000>;
+			dma-ranges = <0x0 0x20000000 0x0 0x07010000 0x0 0x00100000>,
+				     <0x0 0x30000000 0x0 0xc0000000 0x0 0x20000000>;
+			clocks = <&audss_cru CLK_DMAC_AXI>;
+			resets = <&audss_cru AUDSS_DMAC_SW_RST>;
+			cix,irq-router = <&audss_cru>;
+
+			audss_dmac: dma-controller@0 {
+				compatible = "arm,dma-350";
+				reg = <0x0 0x0 0x0 0x10000>;
+				interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>;
+				#dma-cells = <1>;
+			};
+		};
+
 		audss_cru: clock-controller@7110000 {
 			compatible = "cix,sky1-audss-cru";
 			reg = <0x0 0x07110000 0x0 0x10000>;
-- 
2.54.0

