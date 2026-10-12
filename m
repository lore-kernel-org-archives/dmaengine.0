Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023097.outbound.protection.outlook.com [40.107.44.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46EA45C6ED;
	Mon, 12 Oct 2026 08:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794526; cv=fail; b=BJ5QTHAurlYlDZTzTKCm7Vbl0p/IABGoHjd6w4P+VMLZ+iIpvnFx+jpzx+VgQZqeZT8qUf/7vheWhInj2H3oi1QqRSVZEWlTjGlI96HEvT9axAdUCoxei7d/h6qGvyut1t4YNusaO37SqIaGYapgGdKMwFg5fozDjUM/iLvtHR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794526; c=relaxed/simple;
	bh=j4Xz/Pu4qH5pjgD0h4hbx7FVVo6iVGM5Kv1Gg4hru74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=st+WyzAA9CkALwZwkThHULvIUTIY4Hq+Gjrqj2TUswJgdNfzKcrQ4XbJBT3xs08cXthcR/IdX4LNX/NReBQ3j9k5aF4AwmxddUn+Ck7lapcPLFbsorvOxofpsviW8OWWcf+H5wr93R6TDQcEHh2YsExLm1G0Nh87iD3heAi4h3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ay9+cZW5tqkX235EaxcADeZNA5q41PEqLws6/6cSvxf7lPW5aPo9o4ETRBib+E1+5cgxwJ7zW6GGoDSw1xgVOUn1fUxbFvprUVQfw2j4fbiUrVyUNdD1r4DmTt36yFe4Nxrxx7BGHs8/9VGjgMhZKXStkdTNpWaUdeOLUzitb4zZSJYVzIZcFAv1cUXw6dl4GYHZaXRuKqOEm0bvb6DqPFk/b9X/PTHvzyPL+GUQXgzTZeTMsCaqyr2GiDz6h7lkgBuvWWLgSs/YhVXC90xiG1IYR/9cUotkL0pxK2Svy6pgp20KcNg7urMPvsbe0n1lrKic9qMcKd4F6HVDYFXByA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIlMjABXgiilk3WWOEXcrB2Go1BqjTrVY9FMELs0DsI=;
 b=oWAPCjQAGd9DgRKUtTyUjkmVBSlv0zKRDcrvksLJYaUyN0EsBNGJR14qMg3mwsxXrE9UBYT1mjH0A8cDq2HBf5dt212gHFYGfey/uDDtYxm1l56PKGtFlEz9bp0GFIm5aMJ1putAZ2nR5+DQuoM9k93UqEPzNZ/JDQ/QEGi3ocwAuDmgmrv+9GwEVDf4CuS3DlsSi1bg0I2uFiZqPULZK1YduX0W8U1jDCzRg4Eriz7OEUrrH4hAjoialKVG/iEi9JVhnU7p8uTo/HXalaIesUxA55JR8t6KvDG/XRYP1CpEOmREX09xYTRld4kmvQJvl5YnexFUGg6BXLuPQahqZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0146.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:31b::11)
 by JH0PR06MB7149.apcprd06.prod.outlook.com (2603:1096:990:8f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 08:42:00 +0000
Received: from TY2PEPF0000AB86.apcprd03.prod.outlook.com
 (2603:1096:400:31b:cafe::90) by TYCP286CA0146.outlook.office365.com
 (2603:1096:400:31b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon,
 12 Oct 2026 08:41:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB86.mail.protection.outlook.com (10.167.253.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 08:41:58 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C841C427E3B0;
	Mon, 12 Oct 2026 16:41:57 +0800 (CST)
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
Subject: [PATCH v3 4/6] dt-bindings: dma: arm,dma-350: Document the CIX Sky1 integration
Date: Mon, 12 Oct 2026 16:41:53 +0800
Message-ID: <20261012084155.2547480-5-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012084155.2547480-1-Jelly.Jia@cixtech.com>
References: <20261012084155.2547480-1-Jelly.Jia@cixtech.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB86:EE_|JH0PR06MB7149:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ef6750a1-f012-4c42-ceca-08df283cae04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|82310400026|36860700016|56012099006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	kSOtRhjqT4h8Ofoh2HdyJetbxUF/V4K5O34JeHHrf3TktMZtuhRV8pVd+e4U40HSmycSI1KRk14eJkIFvZ3u8RKjXNUG9CmwkXcDvEdOBJmKtp//h705H9ElSAtm0i9SKV3jQPRSPinwRoaLmVXrHFjhHEfGiZicrUrkivomdQJBPqRe9THb3U8v7VvfvEMjg4YMS5FtHHMGvAiRy/EFMKlKEw0XVqni11fPCiOXb4WWn1OsDer+DzVZnxCtME/dW/dP0HQVXqycds8uRzrhqcTM8Xf/gMxCD8D/fEMUlglYp6ZqAwERBxgUykvcFW5VGafS4HuMtd0axfXm3IHDJ0MC1SwkoV5aWQm8mZKwJ7pI5mWjeF3ObiFXDy5LqvvjaI4iQ+qcnwslQuRYk3Z2k9akKK4hsbIKmTfT27PodT894qkR3ix9wC2cZsoQ3WiLq/bXUz9logh6dwnNc2rF2uq+U8f/hgyRns3nw6LIh9hoiucn15zpV8gn2EzY31bEce4VXH2FRS+Hmk4MRkkrEiaXmB+eRXLgc5gWOoZPBKfTpaM9IxcpXZnkmLLfmtwl1tUrjkvEF3+W2k28YyxyAJ+5ZEVf7f1eyeXASgtPlAjWlI/etctjfDefKgHy0J628KvFpocJzpMbx5MxlZ8qgIVEULV4sPwy3CvYKdH9NZmAYn5zTz6OcfkT5Xu0viw/Pp1mo84K8WzM3gTpLTRPEw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(82310400026)(36860700016)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NaWz9WPe+wCLfN9fPEWUfa4oHwmI4a9GjWdirrgmbR1BxY7KFEbqEBDCq0unu7C+dszBZREyG7FuwWFwPVn8q9lLWLP2cnntvD0rncvoWLByU5HFJjEGqmF1IH1jEg642jzLkWib/UdrRFTZYPSZE4gwYqdaTKun9COg92s4mNTkSR/A+gliSPBuJQ3h20oZt/QazAmb5e0BBDd5kQ6kT0W9ALXQ+uebwh2G3bavyb8ZRUrmZHk2+IiHn1wlSujqYLbsqvVBCe665njiK/I98s/eJW7SVz3a5yOSY6SdD5s/GiCW+lMtaBfeHVHwt4Zrtpt0OKkKlYoYmfW+svQRiQAH+ahWu+RRa8k/3fgxBO2peXVwtcDcFNlnvrTO95KwcEu9LvWWaTuorf2fIq8PWW8Zm5PvlTQ9fbQi3g93D1MucYqgEOcz9009bwuaAS01
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 08:41:58.9970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef6750a1-f012-4c42-ceca-08df283cae04
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB86.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7149

The CIX Sky1 DMA-350 integration is the same device with SoC glue around
it, so it is described by the arm,dma-350 node itself with an additional
"cix,sky1-dma350" compatible rather than by a separate wrapper node.

Extend the binding with the CIX compatible and the resources the
integration needs: a clock, which the CIX variant requires, an optional
reset, and an optional reserved memory region used when the controller
cannot reach all of system memory.

v2 -> v3:
- Drop the cix,irq-router property and its conditional: the Sky1
  interrupt gate it described is set up by the boot firmware and is not
  configured by Linux, so no property describes it.
- The CIX compatible now requires a clock.

Assisted-by: LLM checkpatch sparse dt_binding_check dtbs_check
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 .../devicetree/bindings/dma/arm,dma-350.yaml  | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
index 429f682f15d8..4e0f9ffb0039 100644
--- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
+++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
@@ -11,10 +11,22 @@ maintainers:
 
 allOf:
   - $ref: dma-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: cix,sky1-dma350
+    then:
+      required:
+        - clocks
 
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
@@ -36,6 +48,18 @@ properties:
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
 required:
   - compatible
   - reg
-- 
2.54.0

