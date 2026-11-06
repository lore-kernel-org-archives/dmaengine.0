Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.72
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793928918;
	b=tZa7artA4X37n40pJQ1W0us/RLuNzI3GSeUXxTtd2dx4v5nDB/vsMEO22+XYQh61nTIu
	 ulY1bbfraa3v/227BPZcow7VRdX1ZKFzULa5ojfi3Lj2YdS7YgLHC969mXXYxjsB0YP1F
	 LECAs4S8qmpVxq15bAo+DScy7Ns/r/xI7Xuo1Ydo8QLzeH2GziDEls/2cuQUvfqBg5J3d
	 Zg3BkwfG42/+fBCWsor+eEAv39cyGCjQ5WUa7yM9DM8Z9ZpGQan1w42rJ3yeGXqniJcxZ
	 kmyaupC5GFZwftP9oTeHF7u16lsYRwdPyLndmj0JgeAj/kKyG/xL6CKMVyT2nFmClkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793928918;
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
	bh=UgzVkYzTWA3kKq56HqZItGG0iROeRuCHM1YsZ82FgWo=;
	b=ifzW5mVCv/JYXxTqJKSUTRpBDPgdhXqJBctG7tKHbYV8DpiFooQPWURsbib3RWwmvunl
	 ZaEn04SffxvXUZ2qnWPV36YHqS0iddpt4LLVqAKKJrgvQRW7T4m03Zn4jqxRcgnrDqVYO
	 eN6r83OrKlHR/n+i55jq+bnA+bvKWvz5aF96y0dwtmjGABshvZddFaeTdDy1BMEUSG5Op
	 G2tJH7e7AwpnXXv09nHayZJfJAhRLCIZRiFAYi/FijVftN7Acg9m5QgH+QCPn5DV3kOw3
	 X1EvhTpdV9UB9ne14UEZ2uXiUEuxgp9wFOfRQhoVW9T2Jhc7kDWUW4f+elebjTB37gg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.72
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022072.outbound.protection.outlook.com [52.101.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D47606D802;
	Fri,  6 Nov 2026 01:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8D47606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZYpSn77xhsn+LsBHDifyJPhTNWj+1JP68vI8yphNXBvUyLWXB8o+n2cN3Kt0B53j7D8BUkVDf2nXQHASYEb1FTqnTXhnROEQ28W3Rh313N3DRHUUYDBIMXAuFmUKDMZsnvrwf7f1FBS2B5YKgGjHIulEr3smYkhwE0v1Fm79EVA82DFYRPlKZmwKXjgyEO2FlzmhOoQi19LsOrtu2c/Bz2VzMwBqJJaYYKytUrCVGsJzXqNbP6Lp3xOd5P0iRjr6Ra19gatyoKTUCD5zgvSb9Ota2AMICMPONWoIInK9KGedXIhDFDpEroZRn/WNjD1wMzh3jpUB+cvxoeTFpf8Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgzVkYzTWA3kKq56HqZItGG0iROeRuCHM1YsZ82FgWo=;
 b=fLMJkobqsg2bp0fLjow6FbChMncTUI1HMtnaqqdjiFQM/KM3MNVagtjHlfyoP8+UAM3+GE9oGXWZY9KnuDoeL060giwx6PZGioLZ6Sfd2VRk2SrXTo9dI5NBGhfW3Fcea2E5bYSn5gT5UdlYhMrNk19LGoJHbgsYuIuTCUe09hhr19ToRaCGjjF8m3hJ5E/rtrs1M/9F8KrMXWYkZ5etJ5ERY431JjZ/FSppEGNd4RTO204Ohb5BQthFmtlTsRGZmmrEiZzwANXqsD043iX8jSz4wlshB5KraqmU7uZsAOVyHkX71IGEnFhbSPDNT9IPWtaoKB4O64R9YuTMCHc7RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR02CA0015.apcprd02.prod.outlook.com (2603:1096:990:5::14)
 by TY0PR06MB5152.apcprd06.prod.outlook.com (2603:1096:400:1b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Fri, 6 Nov 2026
 01:34:57 +0000
Received: from SG1PEPF000082E2.apcprd02.prod.outlook.com
 (2603:1096:990:5:cafe::a4) by JH0PR02CA0015.outlook.office365.com
 (2603:1096:990:5::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 01:34:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E2.mail.protection.outlook.com (10.167.240.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 01:34:56 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 0DA2240920E7;
	Fri,  6 Nov 2026 09:34:55 +0800 (CST)
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
Subject: [PATCH v6 5/5] arm64: dts: cix: Describe the Sky1 FCH DMA-350 integration
Date: Fri,  6 Nov 2026 09:34:53 +0800
Message-ID: <20261106013453.1134239-6-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106013453.1134239-1-Jelly.Jia@cixtech.com>
References: <20261106013453.1134239-1-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E2:EE_|TY0PR06MB5152:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 91fbbf26-70e7-4232-04bc-08df3ba62a58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|1800799024|36860700016|376014|82310400026|261026121527099003|56012099006|261021121427099003|261026140227099003|261021123027099003|261009223027099003|261102123227099003|261022105027099003|261028144727099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	v3OhauOZRgS0FVvehSpX5llvK47g20XiCTbaca6pYLu7WczAi9PMmtocmC3V5QMe7uOSVHv48BoifFK1/tKWPiBDFwrGafhVIkEe7XYgYfrW+Ig1COPwezYzoUNqz2MsI1gr7ot6jaosGLJeO+geJZxAd8AzOc30NY8w5jMO7NgFDpDSaWEzjF05LIoSLPLfUYmT8+MqGRshGb7Mv/QdHCdDabfdhHzwuhz/WwfnLG2EWW3r9rvP9sDnvQmWs6FMW1jAx9p6OPhlZmPUKEeMkuHOdimomIYEsGquL+FLo59UHa4jpKNnAj8XnfHwnhJF+DQuSW0yaKdPBJUKYhfZejAtQrcLw2z+D+kKj/lDc+plc5oGHm1pU5T2UvZs8vD3kEfpQKNpa5E98CBxi8LomuSAwWTaXBAqbzHSwI1Jg9rNr+csF8UHutsIUFcza1Z/hp2KH2Sb9yMCcO0iRZNJpeYBys7jjMaT3c9HIokWBzfbiUt0LHSuTVIb2lP+K7vkJSkJREoyJwwxyaM9yPu+4yVjisHyH8OqEZO9ZGymdv/pubgCy2+ilVjylAO786Djpl1h2LpNgsuBWDB7dCxt+7r/xBm74KF4702RzyA5fj/CiFvMkSM7wCmm6dhxCHxPWcFHJgw7fxcqQ31CaNZz8b5RrXbwWQVXEAiyUvvdyoz+OyenuQOUEkfsazC9tfvHltwDYJLDtdKxXGuL4oFb3A==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(1800799024)(36860700016)(376014)(82310400026)(261026121527099003)(56012099006)(261021121427099003)(261026140227099003)(261021123027099003)(261009223027099003)(261102123227099003)(261022105027099003)(261028144727099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yD2yDy351NonADH9EsAlwWAQER3eJJzAk9tgCc+a58B1SGsVt9lnolN5Lfw//jI/GSctXm+v1ZDF96cbnUEH/9HBL4OFEnTf9Dx1WPBqY7rsN5IxxlAeYI/Ovd9AK4l/PmrT+e/uhlE0k2ccBOcx618pR4raNng4CbAmNrX3L3DhmRl45VaCubFV92J1j+exQL7UbTQxh9voOfItHZlL2QX/P8RlopGFUONQFCP3daFPtnPtwq+80ZowoBvBBMhS7WWFIMXVhVGK7gGTttawDqv3cx9HZ3cEBMHE+xuxyF2WRRW0P2QA/D+NtgIB2+qt7EWk8dlERXU/woGU+zcRJ8LXFugM8fNs13WtpY0UYkFXgEt7yrwI7HKQAGTu9XxyHWUuNYgTSt/ARpZUUqUR2eT/0a2k/YnUPcwq9WV9WiJiTN1wc6TAEbw307y5gxjs
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 01:34:56.9290
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91fbbf26-70e7-4232-04bc-08df3ba62a58
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E2.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5152

The FCH DMA-350 master accesses the CPU physical peripheral window at
0x040b0000 through DMA address 0x040a0000. Describe this fixed translation
and the reachable DRAM windows with dma-ranges on the parent simple-bus.
The CPU register address view remains unchanged.

Keep the existing controller register region and eight interrupt
specifiers, and add its SCMI bus clock. Identify the Sky1 integration
with its compatible followed by the generic arm,dma-350 fallback.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 36 ++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 0a820f45feb9..5399eebe8eee 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -518,18 +518,30 @@ iomuxc: pinctrl@4170000 {
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
+		fch-dma-bus {
+			compatible = "simple-bus";
+			ranges;
+			#address-cells = <2>;
+			dma-ranges = <0x0 0x040a0000 0x0 0x040b0000 0x0 0x00040000>,
+				     <0x0 0x80000000 0x0 0x80000000 0x8 0x00000000>,
+				     <0x80 0x00000000 0x80 0x00000000 0x80 0x00000000>;
+			#size-cells = <2>;
+
+			fch_dmac: dma-controller@4190000 {
+				compatible = "cix,sky1-dma350", "arm,dma-350";
+				reg = <0x0 0x04190000 0x0 0x10000>;
+				clocks = <&scmi_clk CLK_TREE_FCH_DMA_ACLK>;
+				#dma-cells = <1>;
+				interrupts =
+					<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
+			};
 		};
 
 		mbox_ap2se: mailbox@5060000 {
-- 
2.54.0

