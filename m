Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023121.outbound.protection.outlook.com [52.101.127.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2920F1A3A80;
	Mon,  7 Sep 2026 03:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788752057; cv=fail; b=Zc1j2bamIguBwQGD8dGZPWh0pyPNVYdAZP95a3HhFhD6umtQf9gEKowlSrn8LQ3lvcFxPEK25x24FcnC5Eg8Y+3+x9omx1FSJef3dg7Wi355iZHZPMTxsXdbNLNPeMuKRLnD8441CNgyFKtzkyWHq6YMQlyyobbIFtn5fBpNhTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788752057; c=relaxed/simple;
	bh=H8vNZQzznUXBkXqFAtMXKNdYPAAnmZ6thzM4YdGCIV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lg4t0xSZL3x9Rs+r79mkDh0Xa8Qragu8F9zckZNCpaItTwkVsQwc5v6QuANGhX/cWdenTjRgnUEj7tJjChjnyAYwoaAyr55SdxfpqyHkskR0MdC4N8ih8ZSAZMK/LxZpOR//59jeQreLg3I7gFQg/Ky58JtuE8LRLJgpeQuE/os=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1LcTKc6Qanina6hxk/2ratEeljwZ/Cv6w2reNfbgq5ekn3eIhsdL4lHGk5v0Va2JYoH+ngT67G6CDPG/HPya1VXDG0B/NyKkk7Sf2UiLH/9DEXOgSp0yIaHiL+BFwhBf1SsbQEJlgAL4Efb8pfBI4wBM6tDeQAlRlXEDof3AZPzg1TSAd1ihTVxxBkADZNSjcnsIx2J6YErLnRThedDmt1cr+R3nBanheupN2h8mffMDkl6rez4Gn+GRcOyyXipUgQFJ2g6+q06icPvQAIFbX6lt9Y4VMiQgVUgofLqV2fKUoHmVcOo1HdDydFfqqBUWrz0mBeDpAJoZqJr9PysCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYy9nWJoUmlzDZgMzs/GJYVBPkSBqNCJGCFigafXdj8=;
 b=eTpsP08duOPPEc/U8BF/IWNE2KIPyrQ4aCqeugxNZmZnd4dgadfv5XsfUQ/dh0s2nQrcqCuWUJEBlepHttaubFs9XUeJqtpCMdOjS6q1sZa1fGwO4/dTH4faaZcLLHAi8W3tL21f1er3pGKh60KAQBR57JIFqQQQEaCgLFjyc6LAH/6SFh8Vz7p565idc2gm3A9GXTuw/dKSKAKr6zEojX8a6yS0AoMW8XrjztIBVMDG8ay5vESu+atVlwIXvIT5SD6m0+p7aiRE33Jhsb01vgaV9dsJ+DPIimCdrVJ7ZAsxQoh/kTFI2YCXaVSsnsYTZBqUiwJAJ7oyBCPtTRhkjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY6P286CA0026.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:3b9::18)
 by TY0PR06MB5609.apcprd06.prod.outlook.com (2603:1096:400:31e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 03:34:10 +0000
Received: from TY2PEPF0000AB87.apcprd03.prod.outlook.com
 (2603:1096:405:3b9:cafe::61) by TY6P286CA0026.outlook.office365.com
 (2603:1096:405:3b9::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 03:34:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB87.mail.protection.outlook.com (10.167.253.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 03:34:09 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id AA6494092119;
	Mon,  7 Sep 2026 11:34:06 +0800 (CST)
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
Subject: [PATCH v1 3/5] dt-bindings: dma: Add CIX Sky1 DMA-350 integration
Date: Mon,  7 Sep 2026 11:34:02 +0800
Message-ID: <20260907033404.596839-4-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB87:EE_|TY0PR06MB5609:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d3e38639-2cc6-4659-42c4-08df0c90e0af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|7416014|376014|23010399003|3023799007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	b2AS0/yhDoRWfVAKomkQzMC+ERgGCu/MclkamfG8g+4ZZylDztdENGV9AayqbwQTywVRqONJhAhCFUk/3MIIv+sd/ZG5o5GXy2jbMCLE0aQW2fBeMwKyaIjoiM04mlfTqnF7cJW0HBmOUELyHdjtV2U83laQss6DzsPW3wc0EIDI3PIbf++3ydiLOI5JywP8q4oyjmRSukI3YnillXIc+qlv+NifHEjW4npXGEg3xh3S5pFGuh/pKkuHTIFnn3pQS7u1C37ev7bgg6gBNT1NQWqMh195EBl5hTS1T8sUDx4l+YbAKzA+7lyjxHIAyON9TCht9bvjbCE6S4Fh5D6QwQj26/hdmZD7aAdcGK0UuiPlNtCgfjG+5hHONzMTgy5BcQis0H5i0AOmNS07CzwbkFVgEI1sVCAYfivds1dVGAVj6wRD9FmA82Z4uQs509VUG/cuHfvu7QO4/hzqBwXD4ahTpJQTft2ZEolfzseD5DrLtNirZXlGpp6gdTq9IUqOFtdwl0Vgyl+JH8vcS5QfxsaAT9UcQ9ZaUYqGiG0UvLdzZ8xN1Z8b7o6JYtSNKMBZQyrJoFrTFlWWBTGRyZsUh3QaeVY/gQYLyy0XghX2W0lVR9vV3oQJiMd1/jZXjcg2X3oAlxKlwXLe3qm3vpGrfA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(7416014)(376014)(23010399003)(3023799007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qbFg+2DeFYTXJO7oVeq0EhG7Bp/mkMrsLDzTl7sgboC4toHFYo5T52bFalxgTUjMV2ki/F2UU3S77vHBlu5btf9F5zKmlxI6ekgAuVuVxdbl4xnMrH8JYBt5VTGUCQfgYz3huQYq9Zr7XELXghWeonK21aYii4pZrIep+4AjLo49guWa3eoibjk2QBjs9EkI0W8ylD6Vr77xiAcCRM6qK+Xe7Y4CZYvu4PlGQoWV0bqrM+EMpNS7Aw4j7Bs61zsxI3qOG1/bvrmpSl/1/5/L/9mTlpNghl/5ZXsVo1Edr8xKQT+ZVqxT4y+nGtW1Z3Mrb/T15t4/x3PvolpFqKei4KgbOYLynwx0iJhw+BpPXOCbvsMNuCGcqNqHb9POftBIHvMXDCzh3/YMY9JuL6aqSByq+gMooLfGSVTZgFrksJjNkNqRFCNzOkT9vgJkh+R1
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 03:34:09.2067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e38639-2cc6-4659-42c4-08df0c90e0af
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB87.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5609

Document the CIX Sky1 integration wrapper around an Arm DMA-350 controller.

The wrapper owns SoC integration resources. The child node describes the
generic Arm DMA-350 IP.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 .../bindings/dma/cix,sky1-dma350.yaml         | 102 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/cix,sky1-dma350.yaml

diff --git a/Documentation/devicetree/bindings/dma/cix,sky1-dma350.yaml b/Documentation/devicetree/bindings/dma/cix,sky1-dma350.yaml
new file mode 100644
index 000000000000..e533f355d135
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/cix,sky1-dma350.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/cix,sky1-dma350.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CIX Sky1 DMA-350 Integration
+
+maintainers:
+  - CIX Kernel Team <cix-kernel-upstream@cixtech.com>
+
+description:
+  The CIX Sky1 DMA-350 integration driver owns SoC resources around an
+  Arm DMA-350 controller, such as clocks, resets, interrupt routing, and
+  optional reserved memory. Reserved memory is described on this parent node
+  and assigned by the integration driver to the child DMA-350 device. The child
+  node describes the generic DMA-350 IP.
+
+properties:
+  $nodename:
+    pattern: "^dma@[0-9a-f]+$"
+
+  compatible:
+    const: cix,sky1-dma350
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
+  dma-ranges: true
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  cix,irq-router:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Syscon phandle for the Sky1 subsystem register block that routes
+      DMA-350 channel interrupts to the AP interrupt controller.
+
+  memory-region:
+    maxItems: 1
+    description:
+      Reserved memory pool assigned by the CIX Sky1 DMA-350 integration driver
+      to the child Arm DMA-350 device.
+
+patternProperties:
+  '^dma-controller@[0-9a-f]+$':
+    $ref: arm,dma-350.yaml#
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+  - dma-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    / {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        interrupt-parent = <&gic>;
+
+        gic: interrupt-controller {
+            #address-cells = <0>;
+            interrupt-controller;
+            #interrupt-cells = <4>;
+        };
+
+        dma@7010000 {
+            compatible = "cix,sky1-dma350";
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges = <0x0 0x0 0x0 0x07010000 0x0 0x10000>;
+            dma-ranges = <0x0 0x20000000 0x0 0x07010000 0x0 0x00100000>;
+            clocks = <&clk 9>;
+            resets = <&rst 15>;
+            cix,irq-router = <&audss_cru>;
+
+            dma-controller@0 {
+                compatible = "arm,dma-350";
+                reg = <0x0 0x0 0x0 0x10000>;
+                interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>;
+                #dma-cells = <1>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..feff8f9ecb2b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2825,6 +2825,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 T:	git https://github.com/cixtech/linux-mainline.git
 F:	Documentation/devicetree/bindings/arm/cix.yaml
+F:	Documentation/devicetree/bindings/dma/cix,sky1-dma350.yaml
 F:	Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
 F:	arch/arm64/boot/dts/cix/
 F:	drivers/mailbox/cix-mailbox.c
-- 
2.54.0

