Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.133
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792747831;
	b=2wUMvhtGWi7Gu4QAzSStriUBRNg2bhLzXsHqyCXDM5764LjBLfvj9QG9+i2BW5ISogcn
	 yrA+WRtSNQcIJrBM935oCAWRb0vXKUqRfg+1yPJWZkZdd4coVD4XH/JrjMvIMtBZVQMoG
	 ovZo5l/ilgFf+hNZUSOSBh4JA00jW7Ykx8APxqWd5BQZLquq7cBdJz731iSyD57L+DUoC
	 y4dTW5TdvpopBr0tXsKczi/jCaZCq7NwBSEPAFY1hBn88XYMJs/PhGF1ZBqhWx356IiAZ
	 yNdLy0nZysnX1FRXp3D+H2+gSLurllBCJuUPFO2Eo9z+AYUIFZ52WQkzNIsrMoXpLhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747831;
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
	bh=To3fWOoRLJzqLf3X3/o69QrbEd4fgxNMFgsdUeyxWp4=;
	b=3bGo+q4TMJ7ZVH1YVVKLEOPIui37McAfp4PT6jbeBK3oVGUUv733469TiErFMTjEd90t
	 n6rQY1/GEyYiXLHcl4IxBKi5d+KUdBdiZ92O0E4ZZ91Yc6dxQ+Rh/3pfOCej1EDY2Nuit
	 UxNEwtojIJqWNIumSjy4UjMJswMBRgCKheLHbQRHKhwAKMXHYnbT7/OjN8f12DSiLMVLo
	 4RiJqd4YCkO1VYwOxqqD626G0aYlBCKgOoKf8SYWvylSp/w1HJQ/U2WVntI8dWrMdsyWO
	 d8uYNpU2c6U0m/grtXKMERzJ6Lr1F9AEMX1xeTgdxjHO9EvpzG/KLPiwcsJ94z3FAuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.133
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022133.outbound.protection.outlook.com [52.101.126.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A85606A336;
	Fri, 23 Oct 2026 09:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1A85606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ev6zg+O+UPlMR5tXkWeC8JPCdG7ppVfD4SoYBVl6dInmbFUe8ThJ1K15Q7izu7vYcxATw4XVsReNVd+O4CDQU84iY04p17CceDa24fOXarz4pUEaLHkd7iiOcCELMHzti0atL2jjFmDuOXNukzsePfTLIvfnKf25qGUVfbGfus4tLO4xL9Akq1j3wGI/Oyq/bsl1hA0ieVMy47esEuOdd5Xvy3CcMGNLFxiCYaP8sBItbCS7XNqI0go1b27sTV2lXqmMkG2FytBFdXZsSF+2Y0G++ODW/s0J5zCs/Qsm1FacfijfJ4AtdnaLQQaMVUA+4d0jqKmNoDYRdM73k8x4sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=To3fWOoRLJzqLf3X3/o69QrbEd4fgxNMFgsdUeyxWp4=;
 b=Gzx5N5wFjC9M+Ugv8uk/FA6gI6PCNEzjQ3cOPnxoTv+abdixaDgj5Dkawadb59dsdWGz5FgQDkfNfg9JID6R5zEtyHHFoYOxiVdJabEV0w8vL+YNRcYoQ9sv2lf/znWAH7EjsC7mmTlTfGonbM0NizZ7IjcQgzgmDISKhEnOcuY4VyyIi8aYuzNNXp6ElgA9Vmwpcv9OUPpz9bGvnSnP0xkvMHHQyXB4vxEWE2yq/7hh3+kO1lVfWQx92lr99GhvjufyijgTUiFLHzvgwOp41U13wZW3ld8Cn5m/AIn5qR1toyGN0gQxTQ43B1mvZlzUSOK5r+6PeAbbcAaj0AEfwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0035.apcprd02.prod.outlook.com (2603:1096:4:195::22)
 by OSNPR06MB8369.apcprd06.prod.outlook.com (2603:1096:604:485::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.2; Fri, 23 Oct
 2026 09:30:21 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:195:cafe::30) by SI2PR02CA0035.outlook.office365.com
 (2603:1096:4:195::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.18 via Frontend Transport; Fri,
 23 Oct 2026 09:30:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 09:30:20 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 6D5C540920F3;
	Fri, 23 Oct 2026 17:30:19 +0800 (CST)
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
Subject: [PATCH v4 5/5] arm64: dts: cix: Describe the Sky1 FCH DMA-350 integration
Date: Fri, 23 Oct 2026 17:30:17 +0800
Message-ID: <20261023093017.3248454-6-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023093017.3248454-1-Jelly.Jia@cixtech.com>
References: <20261023093017.3248454-1-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|OSNPR06MB8369:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dbb1a260-3881-458d-66c2-08df30e8420d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|7416014|376014|18002099003|22082099003|261022105027099003|261009223027099003|261021123027099003|10067099003|261021121427099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	3WH7cD7/Ni01yJ5PHGqbSXkQ8DKGTAtXBQLE1JOGFyw01vvBN1gUGX2/13f1bWQQLbMaLSVQuvRNZeV5NsOyWMfLgytW//TUyb+TIRlCJY9cQhoXQ/gL0IVSqg3g79SyMKOxMK/7VCpZ1xMO2mKPq5FstNaJF4DG6rP7ELVPB20H7j8x9LQpnRwmgeeyDY5BbZ6P3Wy+wpoG/UvnIPRweQGNxFtEk87Eh+BnyFORp63LxS2ueBnRripIAimQX/HLY7y9Rwb5qCjpcos5OcspXVW8bpF2QMiTumNiGs3z+rF5wkQBFRvTEvrSkbS6/731aL+exetsAkWc937pBlQ4h5BpCOwAdPZ2lLWgWwZkOVjQx+cRJIj+LiNjIj1iSbimuu6aZWlpPnu3Wov2uCcpSZCqVmbjYcqtEdJTak1QMrBwWP8U9StKP6bpfmZ/1ejFCyc843EEqlxdtzGNdoFTpynb1wV7MWxNzw5wQIuEFck0HCCkGFyL3gxAN2LxAGfaol8vYy3RUCdktOdXUhrZn7+KgBoT8oDGrZXnKwoLkiEeTCoWR1hKRSyN4ZHOOSVqFadJU63oPJApSNd0lKWSx0AaZvokP4++7KETM26MJqcwGpsxtDR2sQ4XDM787oqyoW49p9FEkOJg176wqnKLsjknhsUJaHX/nd7bnfM78vGTll6IPEMJpoRWUeoAMcs+Kzh/0J7nneAQk5hw1SRTEw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(7416014)(376014)(18002099003)(22082099003)(261022105027099003)(261009223027099003)(261021123027099003)(10067099003)(261021121427099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Z6DQZMpkGQ604IY6DSB3ZGYK8iqP9mwqY/yfPF6qWv2dMh0kKBYguX+PWGnXb/oEYySZ9WBwA3tOAT3I8F5mjBsdNTe3YDdt+IxuR+7aVp9A1NXOcm3A3gaYXiBp2uzrM2dfapuXlucP1t2l+vDbtlhbFhvCI3WAmsjD3+A6hIyl6O6fnR4Z4RE9nxACPyK+MQKfKTDTGButJPawT9/xrCnvmP2VTgL2xpn1OxItMoiv3VYbC7wSFQs/G3EuhTLjAwpTQ8jow1KsKTVMKfWD6Kd0FYz429dautVZcsn7LOhOQVbf38IzsLDWkHZDuQ7Dw+RR8kubPMrUCYodACGBDl35nke+zHbcIv5c0GygpZ4ODpkj+O95RYS3Ab4fM8/9vUYvO9zRVJKarNjSzOIie2nA7J/JRvBgUYo08quDPLlFbID3sYTEte8q8x6sG636
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 09:30:20.6722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb1a260-3881-458d-66c2-08df30e8420d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR06MB8369

The FCH DMA-350 master accesses the CPU physical peripheral window at
0x040b0000 through DMA address 0x040a0000. Describe this fixed translation
and the reachable DRAM windows with dma-ranges on the parent simple-bus.
The CPU register address view remains unchanged.

Keep the existing controller register region and eight interrupt
specifiers, and add its SCMI bus clock.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 36 ++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 0a820f45feb9..cd498ee7e9a7 100644
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
+				compatible = "arm,dma-350";
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

