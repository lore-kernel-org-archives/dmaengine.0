Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.89
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793928900;
	b=2wa9b3FmCaJ53YF605VtwYeuYQVML3nQZ1Ntb8ehP3+rQPgS4H/tAWCBQtn9T6DYLWs6
	 1hnKDUGb1CSY3XaFrJiBob3UHZg1J25FxjSoM3V2TUUem/D9yX6P6/UAmr5xnEpKtPZLL
	 y6M1Ym8GNPb4UrdVLPC/B0aSbt8aVMKQ1xtRg/kIczAdmpzkHegmTXalW35C5syS7MbSB
	 uVvoByy0sWY826ldt+KbiwJNU0903RfpYf92vgJRCsw6srdemjK9V9w7ReXNykUEpfF3N
	 ROTzp7ArXjzWy/aqEkiI1ykeduQN3HUI5ltMeid3CyqKueLfQjP0G5duyfqvDtWAi1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793928900;
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
	bh=3Jrnrl9F8GfcRY2WZ1GlMnuGeq/GILPH8C6ywvebk6U=;
	b=SnjfwodRzI7XmT6aJ24LxtLlJAejx1iM2lgJn6CXvrYNb0bfcrP04ncpYIywT+O4x+5U
	 +JdLqhA3Y3q/fV4pq9Z+Z0Fp2AsVDPTlZy5NCZCWCkNJmW69V+Hr9SuUnbvHtC1WSbopW
	 N9eFH1nPt9Zv9UL+IhtAID55Q1C0aoVN/8XsSKEwtVp6MS2CbYHsS4mmoNypx02FNTVAn
	 Rif/78RaKLYM0/3E0I1Fae55t/Bb0BdmHobFljs6a1613psiB9uFYgAy6W84kmOGXK6w9
	 8zrs10OwFv61/chW1nNF8GNe/kzbZPLkoFf4kMaBEd6wJC8zdBLfZqiABc6pHpTWE+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.89
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023089.outbound.protection.outlook.com [40.107.44.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD101606A328;
	Fri,  6 Nov 2026 01:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD101606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hh6NWlMyMffpPo5NhvSeYZwFjw0pdBU+SOpJvdDEqeE7LKm3kLsN1gXkv7C612HcT6b3fWxze6CR+GV294qFXQktuQrz8Z7uOlhEk3fg+TcvCwPCtXZdogyDeBdN5D0FFjFuz7Lr4SGbJmPG9H4W5xWsheDLZQnB/1nZgof+nw1x7t3QNrTILHapo34dSpBlmvnvcpvXZtMN/2uKC3KQzLmslWBIim0s6ZTQcs3ZbyB4Yga/19VAf/G1NLLGtBzI9wKOKMbw5Sh3UZt5Wj67fQ+nMtLL8yU6WRQGDD0Hm4FDDQ0ORAVBQw/K4iQThfAGyoZJBK2zgC7oGd31e3Hxyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Jrnrl9F8GfcRY2WZ1GlMnuGeq/GILPH8C6ywvebk6U=;
 b=uzSF+TeDIRyyjNnVpD5WtxGP6znE7UkYikTeLmpAffSXomrJ7uxLFIsZ7tZdQWL7irFzXe22xb4NQQQgn/kWlILMeUGiL8rYEZ2jkgibIx4OVKPxoPBfEQiq+unyT5lRDomv4GioqSm2whaWwKGp9lkLQk/ERqLuMvx1tnnFbEa5atCzpVXjVwJcnLcmp1ioC/TUPWr4ebyA75X/tQF/zWayioq0+Dddmrghpo0Jiq+nt2zaQmxGra2v4qkaES4iIWuhbCUkA0RrL+U6fAtknZvqDDn1KXk4Ij4fVkX3T6rbjR6wIlDnQ9j2Spoucl2nhQvtCqc+SH6PgDiFBaYCaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR04CA0001.apcprd04.prod.outlook.com (2603:1096:990:4::19)
 by KL1PR06MB7317.apcprd06.prod.outlook.com (2603:1096:820:145::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 6 Nov 2026
 01:34:55 +0000
Received: from SG1PEPF000082E8.apcprd02.prod.outlook.com
 (2603:1096:990:4:cafe::31) by JH0PR04CA0001.outlook.office365.com
 (2603:1096:990:4::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 01:34:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E8.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 01:34:55 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 6874D40920E2;
	Fri,  6 Nov 2026 09:34:54 +0800 (CST)
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
Subject: [PATCH v6 3/5] dt-bindings: dma: arm,dma-350: Describe the CIX Sky1 integration
Date: Fri,  6 Nov 2026 09:34:51 +0800
Message-ID: <20261106013453.1134239-4-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E8:EE_|KL1PR06MB7317:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6d45ec9a-ac1b-4718-12f1-08df3ba62960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|82310400026|36860700016|18002099003|22082099003|261021121427099003|56012099006|261028144727099003|261009223027099003|261026121527099003|261026140227099003|261102123227099003|261022105027099003|261021123027099003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	O5LrXBOoOIEHjkjOVEtFRMmyP0/I4ESRw1oHrXNy2WYT8TwfhOrDPcbmLMLxjVj1bnUhWw+w/ATztfS4kcXLSrwUwtlwgH2+dwI/ySaAaxT//gAWuwvmyujd0Yx2/pleKrcot5jpVNYAd2AUBHeoyU0snreVzjd58DYHvTPlkdC9rkIavjNpB6UpqlcMVryUBPCv2zvF9D1XGpCXYAOdTnVzdCK87KX/oz/VoHtw6pQWETw3EzUYQRgh8Qntr79zMx5eySKr6/SCvMwa6PQdFCFAeBkDEQ5PuBDtpn4+DjMaBtUu/Q+jqC8aOCVbQnSc4pgwZu0iUNkmrm5doZTq0Nd+s8mw3dTCgWTkh+qTu6Yv1YurAFyBeZXzW/h9TCglzDqHz+qb+/+aUcnLSSV104GBlOkyA487LVLZCBVN/7wcSv9EnpsskEZ5V3cJExLeZfL0rb/34XCe/CYcue5FpfgGeNxGcvwSYhkTRj3AEizxIEShHHaWmytDKORGEeZJCt+CntGnlSrwWxkQS85SYDwKjMuv3125/vDc5xsqSOmUAT/3Oza9BLcxRt9IdwPkjuo1crFWvYrAxAFc7pLXOObVF4/Nv7sVPpDkMI9fVDo6p8F6hn7k0YqaTxkcaxPQIq9cr1Wn63qg+i3AFdbDjV5dw9aHYrE5/wC4fyX3qc1ykMGfY244yu12epcRgJASMwh8AB+PPbq7oqPW5LCrAg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(82310400026)(36860700016)(18002099003)(22082099003)(261021121427099003)(56012099006)(261028144727099003)(261009223027099003)(261026121527099003)(261026140227099003)(261102123227099003)(261022105027099003)(261021123027099003)(10067099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zbhL4JH/RCpbDRI+1aRn6gsMFfB+CVLBU/hs7Qsow2f7qKRn4rJ6lt1ngyI39j9vAscfG+KSCVp2ofS9gQKVLDOhdlUy/7mkgx7jM8+CHMnoIkT/wyE7N9b08JHOSaeJspCJ3qwmSXbh2ismwKEScBIIhRcDBAYn4AarKb9V1RVg4XXNcDYxCEGtXi+5nf7aID7ZlDzSdD+/osHhXrztRewcZyCsFOuIhcPabJ+DD233uvdgy/TQimL4FVV1By5WJvaEF8t73NUh51Su9YSg+YwFeFhYArOLzGaENb2CpP8XyYze1RWEpabE9KMUqV7ADRperIGvCrOOqKH7ta8dlpFQPGXlN3nKBtJJOOhmH/R/Ic4Kh3+q5yXcTd6Z5jIC01y2Q1fS63ttvcSlABlRb4amTLsN+TyU/z1OEYMukMWYGz7VlOod9mXPgcABtgWz
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 01:34:55.2962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d45ec9a-ac1b-4718-12f1-08df3ba62960
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB7317

DMA-350 integrations may gate the controller with a bus clock or hold it
in reset. Describe these standard resources on the DMA controller node.

Add the CIX Sky1 compatible with an arm,dma-350 fallback. Sky1 requires
a bus clock for both its FCH and AUDSS instances, while only the AUDSS
instance provides a reset. Require clocks for the Sky1 compatible and
keep resets optional.

Both resources remain optional for the generic compatible alone, so
existing device trees remain valid.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 .../devicetree/bindings/dma/arm,dma-350.yaml  | 30 ++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
index 429f682f15d8..eab3b31aeba7 100644
--- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
+++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
@@ -9,12 +9,13 @@ title: Arm CoreLink DMA-350 Controller
 maintainers:
   - Robin Murphy <robin.murphy@arm.com>
 
-allOf:
-  - $ref: dma-controller.yaml#
-
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
@@ -36,9 +37,30 @@ properties:
     const: 1
     description: The cell is the trigger input number
 
+  clocks:
+    maxItems: 1
+    description:
+      Bus clock, where the integration gates the controller clock.
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
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: cix,sky1-dma350
+    then:
+      required:
+        - clocks
+
 unevaluatedProperties: false
-- 
2.54.0

