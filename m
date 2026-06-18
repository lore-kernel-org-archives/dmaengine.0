Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013035.outbound.protection.outlook.com [40.93.196.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCC02877C3;
	Thu, 18 Jun 2026 07:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781766680; cv=fail; b=A33tornZl8FLPE60nZxJ8thonjWa28aqM7voK6rCWjAg7m5h1+MTGS9NxF/pUYCUqGYvLTZeDIh0O4J6HWcbHq2oagxCQal4enkNI0yuS4rxjWTebf0IH0Gl68alR0OEpCchjzFWlsLD5sRZrGt7s7SAINkMMAjNxFG0ZHjHG48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781766680; c=relaxed/simple;
	bh=/nGPdmJiVbue4UwfLPjdh6S73hg4OaZBHnEYfAZfn+Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PcAbxHQmmhPKwaWs9WDcRayFDUJmWlM9YWEXaAG7/Sa+RRVKeU6taSQrIwhunyLJR9UN8Hf9f5EKyGCXkwgGjEWepuXxYdOqRB6TKe7qPyJe0AiI1Mpq89K01Z26OiPSt+d4kAB6TVfXYyiDmWch5uT/takYiQWPjK2Am7ZSNg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=j4Edejdw; arc=fail smtp.client-ip=40.93.196.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="j4Edejdw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q2MA56YHXxANU91ji7iuQdqLjNQW2oiwhPYg5lSfjHuUf+AxaEY8pc4VWp0u9bIcC5SbXHKuPTmrBbcnpNOKLZ4GMkZCHmpPrnk9Qk4u8f5XZBFgyZMxjaetB792dy/kiKZ5nVMS2QvEjW3HiaRLCdAvtW3EdeL9cUws0gLPianrgPvwBkBCOq5HKBKh/ultfk+9/mvY2RUeHZFdtSgqC5S8YG3+sBbikZ/K/snQFuWhFNTwjHJsWOzTiWTQ/tRFYiOVPPWh8JyQ6q8pA/V0eLA2jxVoH6Inj43hh6hoVFyIM24UKLmLzNInlskdjg9lCL+RqGLC1DbbtPLMmYCdwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82L5qXJR6i2R0YjFP3N8fMdDbwdSdE1HNNI/Sf1zPeg=;
 b=BIV+kSUkHqd1bFE8gdrJLYIqLrbiyCO2d7FNhAxYWQG00gjU4jujqpM7B7iWnf0dIcvpXlKzD8MtqM5xNxbEzu4dqz0WIUIaMtpUMkLVVxSgNxey7X1IPHN31mz+CBTLZqrFtSlvcE9hXJMEWO0tof9Jr1kwiBxPZiMXBIYu7HhQD/8zaW+3FGIrc3jr19rydnytg040dDnXBzEt2Jpvu6ga6OzIkmyw5GiOYtmJGVel1jusIKkoMyEy3vdU26NVjF+PR/m3SEbhenLSGQ7X6WJVX4cDyFLCaAuuAxPOdylz/YQLeLmVSCTiFtpC6sPMzQeqJxEbWnjN/q8CvHpx4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82L5qXJR6i2R0YjFP3N8fMdDbwdSdE1HNNI/Sf1zPeg=;
 b=j4Edejdw/cYkxD1EnlkYTYaInQh4ZlxsNg6cZWbsRCxZ4HubghJnV7f9F6osr1pamKcC64iQagQcyqZsndhYFXznEv1DT1F58ia73G6eb1sXk8Fs+HGuC0V+FwYcasLHyjUAHUwJ5nWglVidQ7IbTr/KAsv2VfnpIgE/btWZMxc=
Received: from BLAPR03CA0098.namprd03.prod.outlook.com (2603:10b6:208:32a::13)
 by PH7PR12MB5654.namprd12.prod.outlook.com (2603:10b6:510:137::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 07:11:12 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:32a:cafe::4b) by BLAPR03CA0098.outlook.office365.com
 (2603:10b6:208:32a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Thu,
 18 Jun 2026 07:11:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Thu, 18 Jun 2026 07:11:12 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 18 Jun
 2026 02:11:06 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 18 Jun 2026 02:11:01 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nagendra.golla@amd.com>, <jay.buddhabhatti@amd.com>,
	<harini.katakam@amd.com>, <m.tretter@pengutronix.de>,
	<radhey.shyam.pandey@amd.com>, <abin.joseph@amd.com>, <kees@kernel.org>,
	<sakari.ailus@linux.intel.com>
CC: <git@amd.com>, <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 1/3] dt-bindings: dma: xilinx: Add optional resets property for ZDMA
Date: Thu, 18 Jun 2026 12:40:54 +0530
Message-ID: <20260618071056.2024286-2-nagendra.golla@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618071056.2024286-1-nagendra.golla@amd.com>
References: <20260618071056.2024286-1-nagendra.golla@amd.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|PH7PR12MB5654:EE_
X-MS-Office365-Filtering-Correlation-Id: 18eba746-7a24-4de3-d8d9-08decd08c759
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|7416014|36860700016|23010399003|921020|18002099003|22082099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	b+NmBR4i85ycyhW6e0Hv/rf6IHp/+g92uU/rk2Tu3/hWxTKXqIpt13kJezvTjRFGuKDS4mrf78npvUb70qyssXsf/1/Y2oEQlXtvfKItkJI2LvLiDHdJ6YHNyYB8TLu57kdWYWrvdNTuIsMzQkQzpjiXMfx/r+RAaxTiRv4TQnaY/8rYSGveqLjvmqAzRha74Tu+odpjiLpOh+9FVyoaXO93QAafTUlJzqbKFf8BQ0yEZbGzGNgp54DUote+8bPrz1ZOzbJvhovC153myFwo9SA4jQygUTH0SEHnNWPsn/MiUZwgB/E7k4zkpwUzlNMkakHT5MXf1VJDejS/JbneRBjbnb+sd31ddrrBW6EnQ/YNGlQKqx+e/vzMas3Pxu3qFwBUr6z/b0uT6or6PS+rR4bnZJyTromeREdtYijOLMcVbFIb8nwb+XpE48eO/dj+zpVWT4d5VG7HyQPyAG6ZvyEa4jvrPYr09TuzZ+1GcGFVD2x291wss1jVOSRekG++dWpSngqQ4b/7z3Ial03DAeYH2A2VY0ndoasa3EaoFlNCFs+5mgkLfx8oQTY6TppZBxOlP+joDgJpDC2Kwllafoe0EqYM3aRoZTbxj/9bvoNBNJ64+ONMg0dLw6dvy+GaBO1Z6UH5TGgi6hJbuV3IHsNIPn2K6/p/IO437J3DJ7ovYcU6qK0FnUdxLUTH4wUSfptS0mVAE7hPQZKBMq9/FLDUwzXoDjL/YNxoWm6qFfuQb7+Ohi9SEMWrBiPAB3oDJWthv8VoDkwzWqawW7wnLQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(7416014)(36860700016)(23010399003)(921020)(18002099003)(22082099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qEm9IlDhUigO+7Q5ZngjQJlmJ/WN46SHrlr8GdoWYVxlVxD3O9zmplWXxJfmt9YwnUuljIKwNSRZhP5Q6Wd5wporwkEKLaiI8WNRSmTU6vRGar3iff5tqbgLpEYJfBGFhlEh5WFLdDGlJN64XiyRDL3NrMV3eEkkulpowjU4ok68OlOKtRkYq+3iSlssSSmVU7wg1O5/n9RD1IPgNNQmVTEZ2ZAQdBXm1+/bgpG9GW3g6AlP3PtWubsBynRiXyNPX6QkJUcz1ki0exdiQi63+bA7SKA2wiHuH7GjV0nROKZkymO1p6qFDOCdzKHw/0ACIPMGSGPmBYRvEWkRsVtSA4uAQyz5lIq/j/IKeQ1hOZcDEoU/7b47wI03R4nV2MkZvLsBe5JkSvktwi0BlEIyoDXy5Nle07bIlPPE8R0IxhdAnrMJhIBZjAOUeRE2QIwx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 07:11:12.0727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18eba746-7a24-4de3-d8d9-08decd08c759
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5654

From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>

Newer SoCs such as Versal Gen2 and Versal‑Net expose a reset line
for ZDMA. Older SoCs do not have this provision. Add an optional
resets property to describe this reset.

Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Co-developed-by: Golla Nagendra <nagendra.golla@amd.com>
Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
 .../devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml    | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
index 2da86037ad79..dff16763e11b 100644
--- a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
+++ b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
@@ -56,6 +56,9 @@ properties:
   iommus:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
   power-domains:
     maxItems: 1
 
-- 
2.34.1

