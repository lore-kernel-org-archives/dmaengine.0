Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793959856;
	b=fHud+C5GUS3F3qj/wWUAVfcQKbqbnZFqGB0noxW+B/VBuF5pQLzjt+TDbHe4g86FIX4J
	 RmYebZSKGaXaF85UeP3Oy1Reu6GI4BXZW1owHVr2X9Aeaak7NbYY/uMC/VpdAm8KHDKTg
	 MVtCaoOBtBG7Ie7g2dWG30YTjzATOlx6LbLVckxrKhwv6O2k13BydMZ3DTim1yiZJU1mE
	 CSnHg9VEz0HvwcbLg0mJ3kFS4pDqmQTwzoUkkXvAibAHvCfpYoFQMWXybe633+2ZjVty6
	 tlTcKG9WJkUNDFjTRIU9XoMSLOuuJV7GKW1YN+I1jEi69rJTosHV4HvQTbrEqw5ejQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959856;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 CC:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=sg+99Z2CkKi55Jg1TGX7QbPE2lNT/635nEbGjGZZhz4=;
	b=r2+zyAkpU1mxtO2Mub90zYbnM51eSw9cjGkSrsd1k06w3bWDZq2i2NKY1YakMUpgRYjM
	 Pnv3Q2gMCPokZScnAX/FQ372V4NgC0HnZvYyl64vPqdlmeENHgKRRIictn6M4juwhZ48W
	 gqc8uTleIuTlnAeDDRqrsEGr5eEbRlkVG+tnHYl9hRJTr/V5z6t1+WTkuP2nk+CJFV0G6
	 yB3n6cI/yYN5pm3fBuyliSZjjzdDFIpxo1UwYePOCT06Poppsbj/jGZjeJxukwKSoG+HT
	 JpbXvfFB/0aztkzhy7Wa4R+LmRgjh5V/tloSL7mMJCeg7EfaM1aUgOsKHAXzioGN4Qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hutYDbkS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.38
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010038.outbound.protection.outlook.com [52.101.201.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2E6606A326;
	Fri,  6 Nov 2026 10:10:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A2E6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hutYDbkS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TI/QnW2mNQOb+rFdEjEhOrJqaaGto1DnNHK5Tie6yyjiz/jBpsawUJjeL9huW1OVXOIgAHHPRN5c56G7SY5SOnAw4XS3EBaqxXsY4bElhNh35OvpHduMZoFx/FSPMgzpm+ODgqCRQxUQTi+lb8HLfAqQysyBV5FeF1IGA00AlPg2qeWJIzWVx5Pzu+hJo7v9SIU/Vz6skOEu48tykbJFdhh2B34ZHniJeeYwGcHDQvj0XnXJ3k43fqFbu9c5ohmgh9PF9akGE034B2CEhuX8Yqc8j6iKV7l+8TC6XV50bnESOH0a2eiREhE6cAiBZgQpwXsnWmbc2pUJ+UogoEjCVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sg+99Z2CkKi55Jg1TGX7QbPE2lNT/635nEbGjGZZhz4=;
 b=XGgMEFfOd3sisPx0j5c64L2u8WI27QThdeo8uZPX1wW/By1WkogNYJrLwBpKMxjk1aMYvaJM13pZMmLKbg4Gr8fHBuEwXPOWuu0x3RbCB58aNM28o4fDWyVu049HXQeP/yU5Y0vd4r87Bj9nkL547xlCB74Tomy9+xOeW1MCIuDozanic1w/jwJ5Pd0k/lfE+wpNbItVV2ciYO02FvW/dlzOeUqWgyD01z6aSsfkFA3M5TiOfbLruack9x/PTjfbLnvHctJkkiqAAn47naUu71tHFjJnNgerHUV/BWQ9MBkJfEM1ze32NYslC/nO1sVscvT1DwFvKDOnbdqje12CJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sg+99Z2CkKi55Jg1TGX7QbPE2lNT/635nEbGjGZZhz4=;
 b=hutYDbkS3mGdMj05w1cToPriHCYlxDoA+RqlEAj5TIaKWD9SuvGYo6RrrpUWURbQRJ94j4OgTpMDylteept1NrQuLvbqhSZRcGH2ANg3JB8AitNUhi0GAT3D9ag096npFFPq2GAGu+VV5gAtwOIMVyHxhu0csUOX16hxo/vHnpA=
Received: from BN1PR10CA0009.namprd10.prod.outlook.com (2603:10b6:408:e0::14)
 by CH8PR12MB999206.namprd12.prod.outlook.com (2603:10b6:610:35a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 10:10:51 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:408:e0:cafe::2f) by BN1PR10CA0009.outlook.office365.com
 (2603:10b6:408:e0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 10:10:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 10:10:50 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 04:10:47 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 04:10:46 -0600
Received: from xhdnaggolla50x.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 6 Nov 2026 04:10:42 -0600
From: Golla Nagendra <nagendra.golla@amd.com>
Subject: [PATCH v5 0/4] dmaengine: zynqmp_dma: Add reset support for Versal
 Gen2 and Versal Net
Date: Fri, 6 Nov 2026 15:40:22 +0530
Message-ID: <20261106-adma_per_channel_reset_v5-v5-0-f9990669362f@amd.com>
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
X-B4-Tracking: v=1; b=H4sIAI6n7WoC/x2MUQqDMBAFryL73YCJGopXkRKieepCjbIpUhDvb
 vRzGGYOShBGorY4SLBz4jVmaF4FDbOPExSHzGRKY7UurfJh8W6DuFtHfJ0g4ef2Ro1vY33odaX
 rnnK/CUb+P+/uc54X5kTy42sAAAA=
X-Change-ID: 20261106-adma_per_channel_reset_v5-f826adb1314b
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793959842; l=3498;
 i=nagendra.golla@amd.com; s=20261008; h=from:subject:message-id;
 bh=o6sXOU5RrRJ4pLmvSav4sBYPGR+JI4YQpV6FeOPdcYY=;
 b=2mDvXYAmECat+3VwlOlKXXMCqGTkNg2+HZh9/Dd5u99K5cDHRmesWw1jrIrdD+9/Y54LU3W/A
 lN4GOt/hCNxDGmAcacV6NVH+iUk4JgPmjdpIYX2CmlHAAK8Sj/CMzNv
X-Developer-Key: i=nagendra.golla@amd.com; a=ed25519;
 pk=pCRGj/0mb0C3aDMpVVZeyBqOIQZUKGJjCKL4QZTu7nQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|CH8PR12MB999206:EE_
X-MS-Office365-Filtering-Correlation-Id: af5f85a6-2569-4262-81a6-08df3bee3bf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|36860700016|82310400026|921020|11063799006|56012099006|261022105027099003|261021123027099003|261021121427099003|261009223327099003|261009223027099003|261009221727099003|261022075727099003|261009221227099003|261009220027099003|261102123227099003|261026140227099003|261028144727099003|10067099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	6j6EALMzNiu2uSDkuQoQ4crZMDBfL0KkFoZPiqFQI6slZ/RO128b0QZQH1PgC5R0MmQDiLkz+zUy4vzkIMLUVB17EnDhYQmFX2NqQlu7TsJc+erpQXepMsfs6DMBf7mvoH0VxvkVvUDEjdp9eyPxeWYPxC/TI+bzGrp5zL5wC6NZ9x9uWyACwBTNjDB8g2KaxLRz22cYFwbvVb1uYhpll1tQAlVIej1/o6NclXrxx9nTJmUAgRTiFLJ+5394trZ8RL6Y50w0SlrkwJHYxJwd+7JxZQRTGDQsROK2w9qojuth6d5yHkiE1Zr9mxATGwRsMWVRRk4aCTrWvEgFTOv7vywlAixUE7VwyxlS/GRVl/RvnrXLPzSFeZ8RMm70wK8nw2gGklNpFFXpNmHEx5S8j/bwW7BqQ4o8/k+OILmuAYCGjutgZ88iQMORdOQbNJnR7VkspSb5gae96NB2i5XwgM+865pplU5OXmznYwnSDO6zI4y2skdNgYO3MDIW0GGc8uDI6H40Jj48KqBduLKCPfJzl3CTO0S//cvX2iWjqcDELGW6uXv1TP6ZGbTv7lBPEWuIzBHnWvi9lwvXIn3eV2eBzEAmt5Hb2UeSGip4evJ3Bx+JI7XuyFMtNC3EQlo4RaD0YMr230KkJaFh1j8izmBKlSG4Z8ebbKahgh5NEunjngMyX0f20duVPVO2IcN6YVmGLoRIdyUoNA41QFF5YA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(36860700016)(82310400026)(921020)(11063799006)(56012099006)(261022105027099003)(261021123027099003)(261021121427099003)(261009223327099003)(261009223027099003)(261009221727099003)(261022075727099003)(261009221227099003)(261009220027099003)(261102123227099003)(261026140227099003)(261028144727099003)(10067099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5q6FaDl8KiS4DZy3IQcUpcMSsjOp++jNys7oeDg2yTAIUxm0t0M/3cSOJQGhyJMHr+T2eb7LR/7r8DwfLdQ1r1t9KYQDEsTiRzZo4ErwfbMPDaYmjowt5N4pOrTWqCaEs5HR3umriKZV8DbeNsLUXDxZfvhEOkKxFqQqjD5VRjakwV3UZ0pkJiXsN23j3bdAQgnj1WuxpqyQhHfE9RcVYr0r+/SLOD1+BjMlT1MGelsOV0kBMnqxueJT8XPf0Nphv7ZJE2NC7ZOTG1mV1skbHI5WK6Q4CmeUfKoRcg/nuxLMI4yKbBK6BbDKG3SB21kmQvu1gKXLkSo5y3Wny1UNB0Kc+6V6sfCcU0S1dAC6244NV1r0QeQWHwBA9S3KwcqwdE43Rfy9QhRXLYaAg8dExE6LLvVy/Eq/WoiKX9TmjMw7o7jjcNo//vDHstkWL33R
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 10:10:50.3607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af5f85a6-2569-4262-81a6-08df3bee3bf4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB999206

This series adds per-channel reset support for Versal Gen2 and Versal Net
DMA channels.
 
Patch 1 requires the resets property for Versal Gen2 DMA devices.
 
Patch 2 adds the amd,versal-net-dma-1.0 compatible with
xlnx,zynqmp-dma-1.0 as its fallback and requires the resets property for
Versal Net devices.
 
Patch 3 adds the Versal Net compatible to the driver match table and
introduces match data to identify devices that support per-channel reset.
 
Patch 4 resets each Versal Gen2 and Versal Net DMA channel during probe.
Probe fails if the required reset property is missing or the reset fails.
Legacy SoCs skip the per-channel reset path.
 
Changes in V5:
- Drop the probe-time PM and unrelated IRQ-guard patches; retain only the
  patches required for reset support
- Split the Versal Gen2 reset requirement and Versal Net compatible into
  separate binding patches
 
Changes in V4:
- Patch 1: Use PM_RUNTIME_ACQUIRE_AUTOSUSPEND() instead of
  pm_runtime_resume_and_get(), and fail probe immediately if the guard
  acquire fails. Add zynqmp_dma_probe_pm_put()/_fail()
  helpers so every error path releases the reference and gates the
  clocks without goto-based cleanup, and pair every direct
  zynqmp_dma_runtime_suspend() call with pm_runtime_set_suspended() to
  keep the runtime PM status in sync with the clocks
- Patch 2: Bypass the guard when pm_runtime_get_if_active() returns
  -EINVAL, covering disabled runtime PM and CONFIG_PM=n, so interrupt
  handlers keep servicing interrupts instead of bailing out
- Patch 3: Remove the IS_ENABLED(CONFIG_PM) condition from the guard
  error check, since patch 2 already handles disabled runtime PM and
  CONFIG_PM=n inside the guard itself
- Patch 4: Move the allOf block under the required field
  Add the new compatible string and the resets property in the example
- Patch 5: No change
- Patch 6: No change
 
Changes in V3:
- Patch 1: New patch - split PM usage count fix into a separate patch as
- Patch 2: New patch - add PM_RUNTIME_ACQUIRE_IF_ACTIVE() guard and its
  backing infrastructure to pm_runtime.h
- Patch 3: Use PM_RUNTIME_ACQUIRE_IF_ACTIVE() guard instead of the manual
  pm_runtime_get_if_active()/pm_runtime_put() pair from V2
- Patch 4: Use allOf:if:then: to restrict the resets property per-
  compatible with resets: false for non-matching platforms
  also expand to include amd,versal-net-dma-1.0
- Patch 5: New patch - add amd,versal-net-dma-1.0 compatible to driver
- Patch 6: Introduce has_reset flag in zynqmp_dma_config to gate the
  reset path; PM usage count fix split into patch 1/6

Link to V4:
-----------
https://lore.kernel.org/all/20261009-adma-pm-fix-and-per-channel-reset-v4-0-55f5fe409c55@amd.com/

Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
Golla Nagendra (4):
      dt-bindings: dma: xlnx,zynqmp-dma: Require resets for Versal Gen2
      dt-bindings: dma: xlnx,zynqmp-dma: Add Versal Net compatible
      dmaengine: zynqmp_dma: Add new compatible string for Versal Net
      dmaengine: zynqmp_dma: Add per-channel reset support

 .../bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml   | 35 +++++++++++++++++-----
 drivers/dma/xilinx/zynqmp_dma.c                    | 18 ++++++++++-
 2 files changed, 45 insertions(+), 8 deletions(-)
---
base-commit: 2576c937f7b442df7de8e39332ff585f08b666b8
change-id: 20261106-adma_per_channel_reset_v5-f826adb1314b

Best regards,
-- 
Golla Nagendra <nagendra.golla@amd.com>

