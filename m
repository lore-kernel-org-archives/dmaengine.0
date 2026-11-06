Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793959858;
	b=x9RzHGiTN1P1KXLyUOceqXaC93nVr0V1lvBwOFuPcwu3gnsdJCZJzbK7D0s2NrvKbOVd
	 G6jHbsAF/TJiCEFe3YXVVH1FR/QD0PObTjnY23TxIgPimwIH/ICsPwuzvrO/BERHSGuLD
	 iWUBmlKYTi5Q/b4J++cYnNMT9QCjjW2mdqrPjah8N9bmOgWGOZkL+Z4U0D+QL1hZoYwwb
	 aOr1ZJFCbJFgzBy1XilRIeUWJzTixifrwIJH/d73Dnuw8IdaDGgE9m9e6Vm1NKI07mt02
	 aRRyaRTip7RYeYjbZn16WmBDejPeug9EJl9/khrDmbCz1+urpNejCKxhPi8tBj3w/zQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959858;
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
	bh=4d70bNNR4Jz8sgbqlb8BzXOOkwfqq2kulycm5xSycoI=;
	b=4vuREmekgFCLHfAy9smfU49Z+A39jKS42Xb3jP1BtGxPdfY4ssM7bdx8G9BjETT+xFCO
	 lY8LW9Nee1850Rc0wE4R+ViTHYAONEmCzUfQxJwTp53O21GpNP+la2IKBNBtwa1SIqIo4
	 kocDmdm4fJVnk0a8dRushBbTuSVidsYMHyeZit09AVtcjhBe2JcaRQ6cDqR8tWkrWSFoR
	 u8iL3BxC6BrKDv5WkZhmjrdaJsvZSO5ip3HhSQ3hDzrUets37iMaSsUyoVVWT++99ojIO
	 HxTsT1aiVTU54nLQq8UTKRC/Zy6Y8oAJonLtOE2f7RAcmOCtJ9uSIZxdMv3flf9Bciw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="p/tmmqjt";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.60
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013060.outbound.protection.outlook.com [40.93.201.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7E5606A339;
	Fri,  6 Nov 2026 10:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF7E5606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=p/tmmqjt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VYJ91wnf1vE1qj3DJUImUtX2srIa4ekuQve7dn8E90pXs7BE+6mvBH20xtxWF/Z7HX+/pW4dvS6WtT9S3j3lC0D5MDY5c9MqMFTbgElJY4EUzxQ1NadlaDNbu/QzVti3Fh7yBLAcni6GHUG4IX0WPHjpidqKMyWFS23T2bgjL9ClfsmTQLys6ABmeFJgEsbIFwxIg4BlV5n5H+yRxqHduvMo9VcrywaoTugqou60Uzp1nofd8NMDM+koD9mFjzqBXgorYzCeHtJku1x2WWc7Ci7QYDR7IKbQfxdFh0Yrpsm7kpySBGyQZTtHhwX85UjofrNcjmK6qUlxa+O7u0XxwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4d70bNNR4Jz8sgbqlb8BzXOOkwfqq2kulycm5xSycoI=;
 b=IAKYxN8nUryf0wI6/hGGuQVY2kSjLA6ofwpk9+E5yPkvwqFPf3rjI4kul6YIjIUJpfJZpHc+RL95PpcL9hBWQ+ivb692qGFjX0ao64Qus8IX5D++nMFMsQr5ovZ0+v9cdtXhkTdTCR4kklmUeNp+5Q7TFCfHcicf5P7g6Su4oEBhIpzd4VGU7mIOJVrFXsjMpid2OwoUvzellgY+Z1AEbd9aP1NGqT8fG4AkLhXnDtYYOzV/U5qTMS8DrYpEQVHHR1cxOlpI6tqstAYGDUy/LoNgFKpEEUhPZo1jWG5W35BqR76J0+37KIcJflY94Z4COEb7hyt5+t50L749QacYLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4d70bNNR4Jz8sgbqlb8BzXOOkwfqq2kulycm5xSycoI=;
 b=p/tmmqjtFLp1Mp7HCIH/PnLQNXDY0SlUQuM6ci36XkTF7RWkHtuSLvsYXj/+QUMsQlnUXv4lXib3Cf3S8FWDyMKrxYHG2TnLyUQwG8TberXbAFThXiSPEphm2ydkTUjrwPdaXi2LxYMqaKoLJCPY9GDmILG2aw/QRUbBrf7uQQ8=
Received: from MN2PR05CA0037.namprd05.prod.outlook.com (2603:10b6:208:236::6)
 by CY0PR12MB708545.namprd12.prod.outlook.com (2603:10b6:930:130::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 10:10:55 +0000
Received: from BL2PEPF000352D3.namprd02.prod.outlook.com
 (2603:10b6:208:236:cafe::47) by MN2PR05CA0037.outlook.office365.com
 (2603:10b6:208:236::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4 via Frontend Transport; Fri, 6
 Nov 2026 10:10:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL2PEPF000352D3.mail.protection.outlook.com (10.167.254.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 10:10:54 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 04:10:51 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 04:10:51 -0600
Received: from xhdnaggolla50x.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 6 Nov 2026 04:10:46 -0600
From: Golla Nagendra <nagendra.golla@amd.com>
Date: Fri, 6 Nov 2026 15:40:23 +0530
Subject: [PATCH v5 1/4] dt-bindings: dma: xlnx,zynqmp-dma: Require resets
 for Versal Gen2
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
Message-ID: <20261106-adma_per_channel_reset_v5-v5-1-f9990669362f@amd.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793959842; l=2314;
 i=nagendra.golla@amd.com; s=20261008; h=from:subject:message-id;
 bh=oTEBH/+aa8SjBUtuXit8aLe7uVouMqYhxmYIwYQLEg8=;
 b=K5EIa8fgxCT/yx9TD6KmkzIYt54OxfO/j/s8QKXTex6ss+AJ5cCjUbXB+Ie6E22RF/PRPLtzb
 cNbmESJVsfZAm9qWbpPnecKMgfH1BnmIjedOOwsrXRWvNFuHG8Ih2B7
X-Developer-Key: i=nagendra.golla@amd.com; a=ed25519;
 pk=pCRGj/0mb0C3aDMpVVZeyBqOIQZUKGJjCKL4QZTu7nQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL2PEPF000352D3:EE_|CY0PR12MB708545:EE_
X-MS-Office365-Filtering-Correlation-Id: fc960d81-b498-4838-ca35-08df3bee3e44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|7416014|18002099003|22082099003|6133799003|10067099003|921020|56012099006|11063799006|261026121527099003|261026140227099003|261102123227099003|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261009223027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	9OgTxboTSEinLExIy1I9ayIDd3s0PFucCUWHknC+yp2mUNEHCU8OPyZEqL7R/jTun6lT8Qv0xQyR4gTK+PE8amssJORvrPAFjR70FJqhj1yoXI5BCZ1LzulANaelE94SqdpUU6iOmzU715RXnDOXyeyBbgKVFcnER5XADPYaQMDwXpMBMioFtGe/BJzFsQvc1r4nwRlmNp3pGSJkZBx7S2+Yzs8vwUvvhSRMXz8N5kF+d2w3MlgBZcufM09ez69O9QZapdLM2Kpece/1WFgr2Ghie/1+CRX6TCg2W58aEGiZJGquj4WEJbmcvd1CfhO6tYqZ+hai11lrY+Z/3thA6f25BkYAhCcPtvfTf2W8QSvFQKBf+Qx06yaIbo0ADg1Mfh4MuElukAUNpA+zZXz51XWOV1utso86z0uD+/ToTeTA6bPrb0AgKeMa/Sr4e/ETzWGaw+m7meVVG/IqKhUePO/r4r+KoAvpNuNIdGj0je4A4EPZzCWFNVrc3Ch3ednxzp0gFDp+Dnod8yalVeea3YGPyQDPRrrPaFbTe9KPivQtsDtC2XGuUECz8ToM+5Q0PU/SCMkeYR66tYp6kD1aLH8ceqe32QimVRK/c6oAHTPVTcVz/1KrAMlPGuus+y54XVHOLZlhyYiasVfJ/QplWrU2Fb9uTz6Wj2JvuUaTWwm1z/m8cQ17OxmZmzZBeLU8XypNXjq8Lfml4RLy5Dq5RQeNAzkX5u1/4SgB9uCcVKZuwI52SR0syFakN/T2A9cD
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(7416014)(18002099003)(22082099003)(6133799003)(10067099003)(921020)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261102123227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261009223027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sNq0nacgg9zS5r0n2crW+WaSqYzA0pxzsAp+grJLGVuXAl5RMcCUADWzbONfZI4nWhoxVSXbrtuSbI6yH0vEzR98vW3vJgKx6KGLRBdisgiqGxWOgt/DQ7GoMTjJ6Fm6WtVly+wn1aUgUcJ14HzlEYkayOXbxwtUYk3OvlSV51KDC83NDrL1cWL22d70owprIzydtaK05qln7NptNf1i1czmzMxYUuoN9xRUKMEzcUo4JgEebbjLsD83i7zLdUAf8XuZJ0TxJcIC+T8SSgjGe2Fr/ECY3RRrmoprkBE14l+ExCSUMjcH5IbSqUa0ZtwF8lzFAEqKj9GVE0qIbLPpdlHPg3ejuhEtOjQt1CZaIPXB0a0zkU6GpbAoCGQ+0TtljpnvhIOVoFJGUAYKe+oplFCoUaGnl1pwoLNErOVZgLrLnaedtIHzC6GQEo/SyJ/v
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 10:10:54.2423
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc960d81-b498-4838-ca35-08df3bee3e44
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL2PEPF000352D3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY0PR12MB708545

Require the per-channel resets property for Versal Gen2
DMA devices, which expose dedicated reset lines.

Making resets required for Versal Gen2 results in an ABI break, but this
is unavoidable. While the driver works in many scenarios when no other
firmware has used the DMA prior to Linux boot, there is no guarantee the
channel is left in a clean state. In observed error scenarios, a reset is
necessary before Linux can reconfigure the IP after previous use by other
firmware components. Due to configuration differences or the DMA being
left in a bad state, DMA functionality fails when sequential software
components use the channel (e.g., firmware before Linux boot). The channel
can only be cleanly re-configured after a per-channel reset, making it
essential. This ABI break is only applied to Versal Gen2 and where the
per-channel reset capability is available.

Fixes: 36545c6a68b8 ("dt-bindings: dmaengine: zynqmp_dma: Add a new compatible string")
Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
 .../bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml    | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
index 2da86037ad79..59dec441307e 100644
--- a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
+++ b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
@@ -16,9 +16,6 @@ maintainers:
   - Harini Katakam <harini.katakam@amd.com>
   - Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
 
-allOf:
-  - $ref: ../dma-controller.yaml#
-
 properties:
   "#dma-cells":
     const: 1
@@ -59,6 +56,9 @@ properties:
   power-domains:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
   dma-coherent: true
 
 required:
@@ -70,6 +70,21 @@ required:
   - clock-names
   - xlnx,bus-width
 
+allOf:
+  - $ref: ../dma-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amd,versal2-dma-1.0
+    then:
+      required:
+        - resets
+    else:
+      properties:
+        resets: false
+
 additionalProperties: false
 
 examples:

-- 
2.43.7

