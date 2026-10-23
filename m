Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.139
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792747827;
	b=Qizi9uGbFd8ivnpbKbTU1NMsdtUnfbje50mX9d2VHAMtcQkVtoX+rG+6AV2rObeBJWz4
	 3W+6v1/epecZb9LhZw7/pc6qsESv5FEWZDrM9q/tFmU0AyE/Yx4xBWQgs4VcvJkitN8vf
	 orVCUrUb+ueqrSPICSFvrfoREtuI6dfejG1ntX6l9tiX4TK/9TME3hubNZnLVjMowbYw5
	 70L7H7AkIHEe7qxz5pGIzkAXk4QDjGzgWglL2hlqIcgahgIk9SfK3k6aiCVyJPQ0R03+f
	 5TOSqw1Ph8e3yVIWqNuBbGJpuGLymtYP4xV8KoE4ssvuMOLG0YA9oN+R3q19ofyYscA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747827;
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
	bh=pYCkqby7ZYFlZsTaRBTg/gKKYgtsIri+QbxQt94r4ig=;
	b=FAXiz/kbD1aTagwbYy2TByh4vRrHEoWb6Py2JcD9qH94Su3JgSd7tnfEsRpITe80yegE
	 zaqlNYaUgjSVctH0+40rgVsNbZeg+c0xBRCzS6uHmF1qnxFxOOahQSWD6dwuoCWdmtphM
	 dR5t2NQ9khzDgOkPTtWKu7YnpvMYV30YrFU++Gq9Y3rYRVi5JYt7UUmjjzm9jkLTKLEEU
	 9veZTc9jGODthnvmHYeo6p1d1PzG01ssqmLaPVx7QjdmHlJNvX/iD2S4M9uVob76gS/2j
	 COyc6dUpppDpFFL2jCl83DaKzu9/RAblFauGui9+5sWfv1WVkmGKJewIbKlV9RgO2Cw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.139
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023139.outbound.protection.outlook.com [40.107.44.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A28E606A32E;
	Fri, 23 Oct 2026 09:30:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A28E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nplaYi5oPT3IQxAPX8Sknm9eGwFo37EyvA6sdmbTxoZsiDtgiUdK7Sakb7oXuLWe4VoVU1mA+hAnRTS8h8jzD0QcfwAA6mDQd9JVGH6J0D1n+KCCEdnd5An0Bxxs6xFLfAqjJwtnuKh07i2+ZX8UfFwqTE/9Llh+aVtR8AOikvXY9Az0AFxswEQMz+1bX0zpOumTCBjVjkYgp7KarJnvcv4567RGix4zEYOvZXraU35zt3PDUDPSv+8J5KwBo7bsKav8Fpidtx1ft3j0uDOaBDF5xHXEQBCnIAFcRMGqPri0fN+ebr3X9jT4BSRoSESWSp88YbkSpkwM5MYISx3S6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYCkqby7ZYFlZsTaRBTg/gKKYgtsIri+QbxQt94r4ig=;
 b=cqejeOgnz/j8ZH5FOkebrJEI9jqdmmz0nih5khWw6/DeLPmd/nXihpvSRxdr1dn/wVLW9MBvCo0HuBEw9dySgRI2TQcM81eyauLqggBpvzYIdI+ekiRcenbS1u5dqFRzQLKQXzzFuK6yC7M4WtRZDM57DhuJXuNbC/jv4QaC8Zuv/jVSA2AWLdvLRgNInsVPpoCBs7vKCfmh3Gl1bf0LgrFEof8Dc2+VbhB7rShDj4jP4xoRUkazIrYaIG9xO91rB+hXCB9U3LqxZm2/g7Q4BfQdftq4UM17uO48dt55//cBcw3jsB/H9y1G+xfW95M4CoWkWHLVpK97TTcKaApB6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OS3PR01CA0080.jpnprd01.prod.outlook.com (2603:1096:604:da::13)
 by TYUPR06MB6078.apcprd06.prod.outlook.com (2603:1096:400:355::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 09:30:20 +0000
Received: from SG1PEPF000082E1.apcprd02.prod.outlook.com
 (2603:1096:604:da:cafe::82) by OS3PR01CA0080.outlook.office365.com
 (2603:1096:604:da::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Fri,
 23 Oct 2026 09:30:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E1.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 09:30:19 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id CD5D440920E2;
	Fri, 23 Oct 2026 17:30:18 +0800 (CST)
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
Subject: [PATCH v4 3/5] dt-bindings: dma: arm,dma-350: Document optional clocks and resets
Date: Fri, 23 Oct 2026 17:30:15 +0800
Message-ID: <20261023093017.3248454-4-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E1:EE_|TYUPR06MB6078:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dddd38c7-a459-47a5-1c23-08df30e84169
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|23010399003|376014|1800799024|6133799003|22082099003|10067099003|261021123027099003|261022105027099003|18002099003|56012099006|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	NCFCSX4X90kbO2S/C9vbB5YQaGUJvPMf/eZLyaQJvq9mhouWj92T2auGaXx5qK81m0MI/BmPluw9Xpfq/2hk9ev7SRXxunb4ilS+HvAkNn0KS+5SHY9tgDW66a2Mjkmv8oh4bFE9+aYRItOTK6YsN+RrnlAJM36a+g3F18h5x1L9j32fDAGqKHGisPIZf45MwT5IZsMORH6QioD0y9qjdE5dXLiYkb3MLDfP0uMMZGvBL2+hs/u8eYIh6kVxAJKwFjx6ARmlZxPDajhWHIHHwpGEpd2z0BOb7zfelvZurJ25Qin+/5oVtq85vlezlyqFgESIk0zA0lrs6ctSd9eHZoX4C5ESBxoNJ3Jbc7gbtoRXo3VsuKEsuucnZn7k77+58q/s1FId4A3YtKO39e4zLVMUwf1QNt83KZRFTxCyvzJFhwhzFrATqAxoIBu1TMXPYGsJByTtJYu4p1MM86oHjHPXT49lfA9rqLCSyXPsAdQmY7p4OEjxDDpXULMhJRBIyxbrCooHXrqWT53k02073uB1IdnVU82ZnlIi9F7VCeLNorbtiWY1VivKbDX80SbghygRIlFG2maUsmvwGLT9f+13lRRWcuDUlsKvo1ayq4VY58p0OsLbf5K9OZJJ3mF6vbAMFX3mg6FeN+iEu+5tXO293B2rOxv2jBuvt1I2jF+yisNv7yG4MVocA+dy5okH5fk6BH41w18Q1Aqn7HVCuQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(23010399003)(376014)(1800799024)(6133799003)(22082099003)(10067099003)(261021123027099003)(261022105027099003)(18002099003)(56012099006)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+JKhoMr6FzWAgLRjfWlJUx1kcWlIyNehVgisebA5YbXMNC3zkAahGPGLjthovROqnaFzcETiQ9ZYRaEie5HHp6QB/WQY2cff2whqcRCdmPlIKxFATaFRnAUmE1Iq2YuQ1rmFzjY3bC8ZWB9MXeltJRhd2BKeovOXJ7KSAl97BMFha8g6nxNFZ+DnG21j4Ho6KuQCD4caFtj2eBCfmPJalkk1u8r8PTLfHtm5/MhcqGij5RsNYlgif+JqItXmNjyNOYrnDzogopXpekY38UMei0T30f74WZ3RgpkbeiDKrVKUZaH9AXte8TDLXcLpvSDfNLrjUK/6LDCf82T5KeoZcJtwpnHnv2zs9ghb+sD75tyY1CeAg5I7kZC+2rR24+nxSVPA5axY6+qy0YtFHK453w15noa4/l70OEwccmGB/dirEtB0NLvWOKASfnBLzgKY
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 09:30:19.6134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dddd38c7-a459-47a5-1c23-08df30e84169
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E1.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6078

Some integrations gate the DMA-350 controller with a bus clock or hold it
in reset. Sky1 provides a clock for both its FCH and AUDSS instances, and
a reset for the AUDSS instance. Document these standard resources on the
DMA controller node.

Neither property is required, so existing device trees are unchanged.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 .../devicetree/bindings/dma/arm,dma-350.yaml     | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
index 429f682f15d8..43279878207c 100644
--- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
+++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
@@ -9,9 +9,6 @@ title: Arm CoreLink DMA-350 Controller
 maintainers:
   - Robin Murphy <robin.murphy@arm.com>
 
-allOf:
-  - $ref: dma-controller.yaml#
-
 properties:
   compatible:
     const: arm,dma-350
@@ -36,9 +33,22 @@ properties:
     const: 1
     description: The cell is the trigger input number
 
+  clocks:
+    maxItems: 1
+    description:
+      Optional bus clock, where the integration gates the controller clock.
+
+  resets:
+    maxItems: 1
+    description:
+      Optional reset line, where the integration exposes one.
+
 required:
   - compatible
   - reg
   - interrupts
 
+allOf:
+  - $ref: dma-controller.yaml#
+
 unevaluatedProperties: false
-- 
2.54.0

