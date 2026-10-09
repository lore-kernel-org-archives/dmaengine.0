Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022138.outbound.protection.outlook.com [40.107.75.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96263A48CA;
	Fri,  9 Oct 2026 05:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791523169; cv=fail; b=WHjGr02Ftj4dRHOobIHwIepuYkkQKXn0OihhGGVhopJKfwFNy5RIRrnjLTD6vwtuMNXSFaHiroQ7/6pd24moHf3CoAj7CecTN8qmvur2crrRJUyra2riTH03HDenVYMMas+7dwCGD1mUSBgxjj99UwyEA1qVnjwCIcpUCsf7AZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791523169; c=relaxed/simple;
	bh=yVP1+oNTxDYgBdaw+8E9grZwaUp0AlmDWZpuUfoyNjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a4+wuguMWZ3RT2EF7aRk8qRhyAyjPiCbv0Hs4SD761A3qQ7xnfXGU1Er1UEQrqShDpTwjbthfTWe+71nhH50QBOXPFJnBqtgkmy8NTgclHXhmstgVZWRB8ILqxAoYcMpzJT2RGCt9Jrab8NLqkMgop3yV6sF57R8HFUngm/X8aY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oEGi/4nySYKsFK7mcV6Wc+eMEuxBVWVHIHJD3taSxK7QcQ3x+i2vb1Uycozlervr6IWsWwUCEKNvHrnP8HWJsFrcZtVEw9jIxNKRbbpeUYB+viQ/wGUZ//CgmWys/LOm4Ya3TPuqoPCNiyncrZrOz7jD2XKSliEKU9Uf0LnAyY6hkz9m3U+TpSuUSVgzaBmpXlYEVzV6LVCqEXOaamjQTZezt+ivH7wUkTIJg5g3IeRCJ1jO3DisPdPiYoOzRERsuIJQ6GyoyKRsbBlQggHw29ewK6ZFoWJRS0m29t4E8fYvXoxL/bJAv2iVzbg5z65oQoWQ8+wjBP0R8MKPpi9b6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQZKDo1VR0Y+I51bklRWM7bTl9NfAyQ4XLeBIh4+WBk=;
 b=VI4N9Aj/wgY/MTV6+R/9W26IZCB3n6dHCnoXWwofb8gUiNk3KuWyXJ91i/137TKHMi6Ah+dnNcVEHfA1wfRXgOmez+fXipwEGTkTLOZeB153R+B5+a5UvS+JFSEhGL+9RB+KqSngpfYOg5tAphWaJELIJxf6QO+8uo0YtW/bTOLoIQgpbUDuOlmUG07HxXLXW9fB5AJJ8Yl5BWeVYyo9nl7CTBkP+8FCg0TNayqhwGkad/tRyU7UX2f9b1iGfrBJ6FItXYDrNVdzQCbJB72Ewn+1gBUohOoGlQU6vYWrkCW1vSvd1QkxtOLdjYd2c59tUUdWrt3W2I+XoTg/npqmwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR06CA0010.apcprd06.prod.outlook.com (2603:1096:4:186::6) by
 TYZPR06MB7191.apcprd06.prod.outlook.com (2603:1096:405:b1::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.16; Fri, 9 Oct 2026 05:19:23 +0000
Received: from SG1PEPF000082E4.apcprd02.prod.outlook.com
 (2603:1096:4:186:cafe::47) by SI2PR06CA0010.outlook.office365.com
 (2603:1096:4:186::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 9
 Oct 2026 05:19:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E4.mail.protection.outlook.com (10.167.240.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 9 Oct 2026 05:19:22 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 878A840920F6;
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
Subject: [PATCH v2 4/6] dt-bindings: dma: arm,dma-350: Document the CIX Sky1 integration
Date: Fri,  9 Oct 2026 13:18:44 +0800
Message-ID: <20261009051846.1115962-5-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E4:EE_|TYZPR06MB7191:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b55b2b69-8bae-460e-2743-08df25c4e0d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|7416014|18002099003|22082099003|4143699003|56012099006|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	pJzJtdfCgIpuDYm/yRPAHyhFDl4piGt0TP+E7TKpDjiov7tGrawKI0qt4WCbPAwxIQTlPMcidzyTxArSi5K78mR4b86V4OwxW2of0iisQwIwNufLrgAqEBdn5YVIMlfd588t5WVV+DYRC83MjpLiQFQgwx5qCObcHXdSx84jc97eM0KeKeJl6eWABCp69j4WzszAhvAqj42DL9FV988RX3DeHcSEzKYIKYY6fizhWAjj+ucpr7KVvfaTHfIyTgGTr2o/1Y3u/GGh7CQ0J+sZN9Kr5QnAp+GjtfYkUgtoNgDE4uqalJDz/njTn+TWhxwIb8NY9vGi0OS8756TlI+a+KOVEmE39M/D9IHFhOE+u9x/kcTmXna22XlhXmaI2pKlALL6fF4KG1ii9pWiaBuZcz5ffmuOQnHfKRD92BG8PA0JC6lq56tC730mhbGE9pwWeQNQr1C5ABMHrbbMy4zQJdNbwcvYW/pXE3lNND3MxLT8zOx1TPf5YWGnFFh1CAfebMTdUYDU9izL6Xzh7CuiPeoUKuMhfDUo7OfivLUMah4tZ2bQKVQ+JhjcTLGOCFlpYIapfWVprz9jBlWG5EpSg91NTAHS7dH03wiYIQYzblWfNATV17Oz0lJRtn713Z4N55tTf/8F3v9Q5fOSNeALBmExtSOaU6AxWT3EgRbHfSXldyRxNiXGuhg13GQ04NzHDafuqhdptENiqjjN5/KPGw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(7416014)(18002099003)(22082099003)(4143699003)(56012099006)(3023799007)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5FvnDm0ET1KL0O4x3vMMG+AGkaPMSAPtpe+fnTCPohBGPr6itZGS/+b0uu0bltSraOPaQPT/RmvJq5SS1g0JZyzN0sjhKB43XRLTFlJMq+Jd5Kb+ZAD+MtabsIP5sziWyU/XeuphPNgquAL5i6qTiITKSbHooNnEEugTT/zQxqwIzStSbu0JIMK2FE0Cmz1EN0bv3qSwCN3wR2vkRUkzhv5oBq3qMhbFYq0WSlp7mRquh3VaBY4as9ZdU7a3++/DTVTuH6ssZYQBHOIPdOiCA+nO3cNW+/VLPysHo/GJdOMWR02ruFeNdmOYUlHCuWUbeH1y4YqnisR+3N8TdegIkdm0qFhzIr821W7i91n+mPTmpLXfWePG3sKSGZBFAbaQc5fDb6ylSt56BGRgTNExJKNxnc2rD30M+h2vEEpjKrVHG9KA+ZCDLWJ65bf5QOv2
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 05:19:22.4010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b55b2b69-8bae-460e-2743-08df25c4e0d6
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7191

The CIX Sky1 DMA-350 integration is the same device with SoC glue around
it, so it is described by the arm,dma-350 node itself with an additional
"cix,sky1-dma350" compatible rather than by a separate wrapper node.

Extend the binding with the CIX compatible and the resources the
integration needs: a clock, a reset, an optional reserved memory region
used when the controller cannot reach all of system memory, and the
syscon that routes the channel interrupts to the AP interrupt
controller on Sky1. The cix,irq-router property is only valid together
with the CIX compatible.

Assisted-by: LLM checkpatch sparse dt_binding_check dtbs_check
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
v1 -> v2:
- Folded the integration into arm,dma-350.yaml: the Sky1 DMA-350 is the
  same device, so it keeps the generic compatible plus a device
  specific "cix,sky1-dma350" compatible, and the integration resources
  are described on the controller node.
- Dropped the separate cix,sky1-dma350.yaml wrapper binding.
 .../devicetree/bindings/dma/arm,dma-350.yaml  | 33 ++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
index 429f682f15d8..3b991985c416 100644
--- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
+++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
@@ -11,10 +11,23 @@ maintainers:
 
 allOf:
   - $ref: dma-controller.yaml#
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: cix,sky1-dma350
+    then:
+      properties:
+        cix,irq-router: false
 
 properties:
   compatible:
-    const: arm,dma-350
+    oneOf:
+      - const: arm,dma-350
+      - items:
+          - const: cix,sky1-dma350
+          - const: arm,dma-350
 
   reg:
     items:
@@ -36,6 +49,24 @@ properties:
     const: 1
     description: The cell is the trigger input number
 
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  memory-region:
+    maxItems: 1
+    description:
+      Reserved memory region used for DMA allocations when the controller
+      cannot reach all of system memory.
+
+  cix,irq-router:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Syscon phandle for the CIX Sky1 subsystem register block that routes
+      DMA-350 channel interrupts to the AP interrupt controller.
+
 required:
   - compatible
   - reg
-- 
2.54.0

