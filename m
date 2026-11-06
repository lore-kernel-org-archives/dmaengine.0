Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793959863;
	b=DGpADYYJlmRGPUqxXsUElevwko7z4pRMB5GndZkAKZmww9g+1icyGADIRkAk4KIaNpYg
	 OSqH756TDkFZfBZ+rDUlkNSjKSRLFMR0eP7zN9qs0e4yOiRb8u6+B46ywOixniU406rpO
	 ld4P5Qjtsh5978oivONlDNcaQ67pGQu7GyVnwityVx6L0YNhIJc4J3UYYPpLw9aH5MFpy
	 sXpUUxRvdC4UD3tS1kydZJB6n7B1yrgCA48T2MWLiwbhWcr+v/74N8nB3W28ZFsGQpwFY
	 PQ+o20Q6zIrVDbl7ZLuljME9YIlHNtq5B9gAA5NBUYD0CXzzI4kD9e397WPihjVCE1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959863;
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
	bh=3G3Ms3FrlpWe/f5dkabpy9ia3gRBqsrXffwm0UQRSpA=;
	b=aDb7A0zzJVH0wl7MhJ/Xb4gasKJNdJHoyCY8R4JqlmQUsKGZu90m3aXMeP3CSfrQmRoB
	 sIeLf8IopbOtNeodBGyGltDWAMsmV/XP1L0+Sg+ugQk1Kk/REbJrPZnm/yr6hGwCskLyc
	 dPKmNkaOeRGIDbOmgeYHL8N8yG0DzFUbuoFoy6C5BpPLUPcIW4KjRNPhOpOcmi8akTGE0
	 2CfHbYHRl0jZblTFgr0JjZIa6rWhkbQfGkPcg1i0rG1zcULMSKfV0q2UZaDcAyDBb/ji+
	 ucuiUyKR0kRvZ2ejiHhipjTKOrXRGwUpKgnEWt3S/J1+MwfSgU5m3BcnJI1EgIgEqTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xIWUijSc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.33
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011033.outbound.protection.outlook.com [52.101.57.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0DE606A330;
	Fri,  6 Nov 2026 10:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA0DE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xIWUijSc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vb6/NHizMyhBbkp0bOBlb/NNzYRvGEPc+yqzbqNBhinRF0uNoXM0ZgbvW8jqRUfUlSYCdaw2G1EFABOk04brPCPicz1INC2tyHdmSwFKbJ8qNJinTmGQXJfdDqjSkQlzx8+l60TEFyDVvWDQ65Infh0nsJDZNbjhHfBhazZRCTy3nkig977d5IJrdXL2T2yPAyLx2zNE2zZxo8P4GFztbmyGGBnUx2xdvykjEnjoPhrMxPAEfp2BDtRnr4Sb16R8gjgJpaooHEqQV9goYT2A99EvhoJUHyKMhPczXwSrwIL4m2hpn3Tp3JWokJ2XGjGPZxZZMHTbjwjEdMA8AfQlYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3G3Ms3FrlpWe/f5dkabpy9ia3gRBqsrXffwm0UQRSpA=;
 b=DYatfm6CNgg+7f7FkHogplqKXcYNDm1C+VtGAHi2+X8HhHnBz4f2KTJU8O2Oa1VndwcrGh+2m/SnbC2uOq9rpyV9Zrro/74/38Zo00CYBO2s9m/BaByTuwa+HMR57lwt2fmRbJOU+86WzdA//yPgGDdaGx7IMHxWPxO/hlECsyjevARzLAKS9XYNKFHTnvJU5Mq8NG0MujFX8OIjBO+wJhr0Q+QXv0am3kPkmwmgfatDpzLQ4GpRJBHY1K3kpJHURgTYHlS/nHWTQSP9Y2xfgEg7ta68Mn12wJYX4h7o+h2g8F7hm2E0kuLboyf0ZZ5B6kIRrQ7Rl1+uMUmv9uRU6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3G3Ms3FrlpWe/f5dkabpy9ia3gRBqsrXffwm0UQRSpA=;
 b=xIWUijScLmIFIyyk5jNh+jIRFekLybfUQR1YUOx+50U/tyjlV9NC0yyLTuFeTuYRMDHruG4/viPpQCWwJ5137dCqxXNVuUyI9qMMNUlxKcsANFa2djwbROla5hMFoTZ+p7Rkv0XuGOvRzDAEiO8SfvBvqEKPD86K2kTYUD3h2kE=
Received: from MN2PR05CA0038.namprd05.prod.outlook.com (2603:10b6:208:236::7)
 by SAWPR12MB999116.namprd12.prod.outlook.com (2603:10b6:806:4e4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 10:10:59 +0000
Received: from BL2PEPF000352D3.namprd02.prod.outlook.com
 (2603:10b6:208:236:cafe::43) by MN2PR05CA0038.outlook.office365.com
 (2603:10b6:208:236::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4 via Frontend Transport; Fri, 6
 Nov 2026 10:10:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL2PEPF000352D3.mail.protection.outlook.com (10.167.254.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 10:10:58 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 04:10:56 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 04:10:55 -0600
Received: from xhdnaggolla50x.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 6 Nov 2026 04:10:51 -0600
From: Golla Nagendra <nagendra.golla@amd.com>
Date: Fri, 6 Nov 2026 15:40:24 +0530
Subject: [PATCH v5 2/4] dt-bindings: dma: xlnx,zynqmp-dma: Add Versal Net
 compatible
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
Message-ID: <20261106-adma_per_channel_reset_v5-v5-2-f9990669362f@amd.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793959842; l=1939;
 i=nagendra.golla@amd.com; s=20261008; h=from:subject:message-id;
 bh=1dM6bYZyFD7c4YgM5KKlXplGTgnCCgTlT1C3K0HM1tY=;
 b=PmyQDEG2X5GbWgPGjeevsPyaxU5nfgkf6UUU9o8MXdemrsjbMZxck0Ed70Nuc+pq1iAkuxAFW
 ivwGx5aYZfnDIUUlXZ5CqKewKRAXitbiCwar9LZ5UGt4wJHi26dk6r1
X-Developer-Key: i=nagendra.golla@amd.com; a=ed25519;
 pk=pCRGj/0mb0C3aDMpVVZeyBqOIQZUKGJjCKL4QZTu7nQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL2PEPF000352D3:EE_|SAWPR12MB999116:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f8cfd46-c405-4f37-2124-08df3bee4117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|7416014|82310400026|1800799024|23010399003|10067099003|22082099003|18002099003|921020|261022105027099003|56012099006|11063799006|261026140227099003|261102123227099003|261028144727099003|261026121527099003|261022075727099003|261021123027099003|261009223027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	aLDHJfzHd5WMSzUrsh1XBfbnkm2re7H5a39zkEy0Ft2pDuCF6TR2xj5FRs2zodHsUrhitMR3wIJTvxOGKHlWE5mCqbFQdWXfN6MWMcqkv1o/9zKOqyzjXMRiM119Yl+pE0yeKpDTcS5Kkr39WWYlBeDH02SSRIPWeSQ+N3GEHUsdcU8yF0EyEE/f3MKeiSF3np8zgyUAJPLPchOxHczl1rs4atRM/MwBQhjxaVykxFZ/FpdCEHO+3uI5b3t/RGwLMciKk3S8ce5ypLE0++xlmnFoISDupnb7eE0qOHgbbMSPQjbOearA6r3Xaq3xu2Y2KBds/ETRGmFivFKI1W6hsPO7lQYTY8saFTg+gptbXuTqGk0yIDKVZpu4f27HLA8R9aP0eksj02SR7hIn8KRu5fnWDYj6qb4eDcALkcyYW6PaaonfeSGQpYI64yxqlupRtLgY0UXGXmOoP6VzdwAFtogfnUPXKIq9BfXQvh3mXvlWkPruQ4m10cBBqXLXrzx8rRBuLI9cVbdoMhrqeXMkVCftKo3TZkts6Iut0JMH+GlmQ7HWwfju9u49vXcLf5IGTv8o0fDLvRti3ofm6jboE5SixYhX370ZCvy3taiJE5cLAPQBtQtzNt0vyv4EytMYwjjnDEKvdcf8aQMA2ZuSNgYjR5Z0QdoysJJsgAspN64R7VbzmJylgOSe4fImqDhlF0hJobGEqu2vGLzu7ZoEZoxO/7zO5mXuAgw2Y9rCDOHOGXy7CSBCUNOUVLjUuhQM
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(7416014)(82310400026)(1800799024)(23010399003)(10067099003)(22082099003)(18002099003)(921020)(261022105027099003)(56012099006)(11063799006)(261026140227099003)(261102123227099003)(261028144727099003)(261026121527099003)(261022075727099003)(261021123027099003)(261009223027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fo9mZ1N5/HLztdV4onetZjHrvhgDqZNZjQGgT/HN8rOmVLU6h/ByX4W/sHjOt5KBOX89+g0IT9v9jzwLnYZO9oagXxcH2P53grOI+EIVKjxrqZYx7CM7khKO1UZ9K4HX7YV712y5dTh35HKijOaoD+f4VORpiSfG2lnUTV2bRROc+9uAeRdy06kDymoQG1aequedB0r2unOkOHdsd7Sxy/Vx4wFEf8VfYv38GR06YRARUGVWM8e8Xtb2pTqwuZcZOpi4uCYBC/61arRVuaEt3rF5aUv3ghWq20HWyqPLH98Mn1hy7w0Pwu7zZD4lUFv5qGkYIM0bcKBxgCOWwcZ/fDXvZ2yWh2JDYLjhz3vv8JYJxzpAafYqzkVdZSwiFkt0sFpUS0JG47gkEcOU63ej8aBs1puaT5X2NEJm3XKHXJji8YaN1KuloYwG9oBbJgKm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 10:10:58.9766
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f8cfd46-c405-4f37-2124-08df3bee4117
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL2PEPF000352D3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR12MB999116

Add support for the amd,versal-net-dma-1.0 compatible with
xlnx,zynqmp-dma-1.0 as its fallback compatible.

Include the Versal Net compatible in the reset requirements,
making the per-channel resets property mandatory for Versal Net
devices.

Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
 .../bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml           | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
index 59dec441307e..7efbcf282a14 100644
--- a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
+++ b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
@@ -21,9 +21,13 @@ properties:
     const: 1
 
   compatible:
-    enum:
-      - amd,versal2-dma-1.0
-      - xlnx,zynqmp-dma-1.0
+    oneOf:
+      - enum:
+          - amd,versal2-dma-1.0
+          - xlnx,zynqmp-dma-1.0
+      - items:
+          - const: amd,versal-net-dma-1.0
+          - const: xlnx,zynqmp-dma-1.0
 
   reg:
     description: memory map for gdma/adma module access
@@ -78,6 +82,7 @@ allOf:
           contains:
             enum:
               - amd,versal2-dma-1.0
+              - amd,versal-net-dma-1.0
     then:
       required:
         - resets
@@ -91,7 +96,7 @@ examples:
   - |
 
     fpd_dma_chan1: dma-controller@fd500000 {
-      compatible = "xlnx,zynqmp-dma-1.0";
+      compatible = "amd,versal-net-dma-1.0", "xlnx,zynqmp-dma-1.0";
       reg = <0xfd500000 0x1000>;
       interrupt-parent = <&gic>;
       interrupts = <0 117 0x4>;
@@ -99,5 +104,6 @@ examples:
       clock-names = "clk_main", "clk_apb";
       clocks = <&zynqmp_clk 19>, <&zynqmp_clk 31>;
       xlnx,bus-width = <128>;
+      resets = <&reset 0>;
       dma-coherent;
     };

-- 
2.43.7

