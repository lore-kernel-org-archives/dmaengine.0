Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.119
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794908623;
	b=NP63YOk6Llvb1F+8EEX8NW8tGMC5J18kq0bCxKC9A9Uo88GeMd9TAbtAKnVSjMxPe51S
	 0FFEUF03dAT2wIqX/ZKMKHeaP/Jv+lSCmuQIsklM7rUAUcfVRIlJ3lUdXNZTvkwA2qHF4
	 bXgNKa/BOlORqHCRY+tU3HRCx4n6TcLYokiJMM5QPH3cDID089NZRP7sEwELtnXyVpB5A
	 pblB27xoJQqwQOgVFxrysIrVsZJa9TWlOu26pVwwApvyd2gvX3fX/L+ztoz1n8xtFP5ug
	 /8DB7aEmT9GgNeFz/gaA2QIduLF18sUk5u4/ynd+rJ3s89ePb3TYV1dNZP0FG3+Qa0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908623;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
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
	bh=B0aXqPBObMZ31AANkTYn/5/i94udRew4u5mp2Tjk+m0=;
	b=t/MmYZa34PkYKaMAARKUV/nXDXVKHEVXebuS5DjB/WWO8UTaqsH4InBIZO0x1RoNLncx
	 Qc20fUF9V5DRSGNHcV6FqPBAJAr4NugPWJvisixjRXSYPUGU4ml1QXox9CssNNE8QumNk
	 x1YOHYm6n+CXBVLcWMhCMyuJFp1kjapoohERUj5z6UkSd2TFJozBQKGxjhgLMzHqUI9D9
	 GFblOsnD+3lwDczGKdN9N8lxyT8ehRyNq8UBL3UiIRxAl2YBcTIPmtDeV1dG1BFTg4YrZ
	 f6RP2HD0r0HFNPs6lqN+AqderKPKU9diJYnBlC24Jh8ewxTlw4tWsJu/Mlt5j7JZFWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.119
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022119.outbound.protection.outlook.com [40.107.75.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48799606A31C;
	Tue, 17 Nov 2026 09:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48799606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ap/oibB12Qe4KOGp5yFWEytNMfruI/Tb/XCiKcZDZYO7/SO5De2QlWIsKZWng3USdLiOsJcu5X7XwSjEfSdjRCNt8rgucVQXbco/94+gm0alD4nm1iF+GBjs/t8zNG7LkygwD5ke/GPpOwkRfiwudtygvZJtwdgmeqS7XPKfx39WyIL3WVCrEIParepj/XxVfrBo2DfWK6idpaZPE6NofuYya2gC1ujaZEaMRcQH9IIcapisM0V16Vq4PxLJfEixQHqAPmktfpyRj4EKCI9iCEjQwyOr0uYRNJGyXADWIiqHVzS3xTBmkGeGTejSQZg/qTQMLinWddtZoPvUhTs1HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B0aXqPBObMZ31AANkTYn/5/i94udRew4u5mp2Tjk+m0=;
 b=OVTE4lc1TLRhnUSk2sKOfutoKE/CSkidRPEULEB9Ns9vpPm3afsgf38Vdyj/sauwhYbMvR4O87tpSRySZ+hZZmoIRE9dWcsx+wDhVSK135LxppeoX4h8T9VNf6zlQ2oWRhSXqafElS/lCK3t4Dhc6+468xCoydy4IWdB+xfZoDgy9o3is2M+PZmMip5zEsq8mfTFduo8LQPncm+RO0EZH1gBSmDEX98jgyVBGyZViwAjAYqA/kYXFn7grberoQmrQUKNeibfIM3k19wm8HoAEE72kQqq/t37yEPjXVREUxxxydhCnLO6RIqbpXxC476bhs0MLZQhUobudi0wIYJyyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OS3PR01CA0029.jpnprd01.prod.outlook.com (2603:1096:604:db::16)
 by SEYPR06MB7993.apcprd06.prod.outlook.com (2603:1096:101:2ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Tue, 17 Nov
 2026 09:43:37 +0000
Received: from OSA0EPF000000C6.apcprd02.prod.outlook.com
 (2603:1096:604:db:cafe::17) by OS3PR01CA0029.outlook.office365.com
 (2603:1096:604:db::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 09:43:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C6.mail.protection.outlook.com (10.167.240.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 09:43:37 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 0FF44427EFC5;
	Tue, 17 Nov 2026 17:43:36 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com
Cc: devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com
Subject: [PATCH v7 00/10] dmaengine: arm-dma350: Add slave support and Sky1 integration
Date: Tue, 17 Nov 2026 17:43:25 +0800
Message-ID: <20261117094335.1393735-1-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C6:EE_|SEYPR06MB7993:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 979df2a9-99bb-4674-5518-08df448f4110
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|23010399003|82310400026|1800799024|261021123027099003|56012099006|261022113327099003|261022105027099003|261022075727099003|261026130827099003|261026121527099003|261028144727099003|261026140227099003|261022115727099003|261021121427099003|261021135927099003|261021133027099003|261021130227099003|261026135527099003|10067099003|261102123227099003|261009223027099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	IxP6aYRt525XAbg/rr3OqjA6ERpc4O9YfAELxLz5OnGhRefEcsOrmxG1PSoBqr3HppsVcPLg8o5I3vb7wbZe/b34Mg+a0OboBnx8p686KtaJ6m/vkB8NaYAmjhSLip8BoSdwYzG4XZjoktDXdVqPU7KVw1MwTBcaKWtCBGNYGjk1D6QOZeJVaW0A4w6ANv0X6akH4gwH0uDOGPoFi5VdamnsHkhtW1iPBEjKxuKFLgUIzn4OFoFjhxX4eaah+/g30rMdH2Mz6lb60QU0eo3xbx6CSFH+ngQTtsn0JmmAbIYGth8MyrDgEA3W8xNBfDWdxIuxPFSiM9dkFIwQR5Rq6pgPo5IbPn81rLAXsccxXCxWySNPZdQlFYGNshajJqAGhq3qfx57Ajqxr+egKZCWmR23GRhH/c9XZVs/SAtmiqEOMCnfY8PhTN/YjXnXgWWspaWhQofzVTTllVGHSvkgv+s2TzpyIEKu8vb56kmr/dEaXlDjdD7XSo7GviC1iId865vi8LE5sg6sf/DTbR03mQfW4KNob84C/gpDi30NbAopfUemMTQCa3DMD+XwWazGxYE/l0MKZFFCH31fL3YebQGlzI5v4PnpLJE/F4u2DIvhX9lB8ef4bVqk1JPPS4PBjlPFARoVA3G0noGzTxGXWA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(23010399003)(82310400026)(1800799024)(261021123027099003)(56012099006)(261022113327099003)(261022105027099003)(261022075727099003)(261026130827099003)(261026121527099003)(261028144727099003)(261026140227099003)(261022115727099003)(261021121427099003)(261021135927099003)(261021133027099003)(261021130227099003)(261026135527099003)(10067099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ukVFTLCohfycBmlO2bV266R7Xc/cH1zj7y2Wpxxj8M5V+9Tq+C3EjNlk/067GRvuJ4wrrkFZJ9DMeMUcfCLiK5rMFm1cYWivzPo4nsO0XwbVMS6g5uly8Bu7iVGTawbobQSPoVVn8nYGTvSfydFw8V+RyDrbw9ONI/bx9D4r+eFYrP0CZnkNp7rGpDmyaAMyrItaOx4Tv1czcxT1TA6QTpC0e/axZq5UkKLynJfliXlIbtSjXdrwZFIcItUWJRdugU+jbyxTbXvCg1wwd3KSwqNwX5QAVJ9+8eIDrzmfmznVRpCmxLmjSht83MEro9Qm2zSu2W2XJ10/e0b19PUnRabS/tXmitrk8gDL+Q6m+4byjxKmOULKgpDOprUF4LAHK5Fl+RwCh/pyaStd3sZSYr+tK5EpqBC2PnZkGTeIsljQvQx9XRt1DniqcfTWNdBZ
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 09:43:37.0458
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 979df2a9-99bb-4674-5518-08df448f4110
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB7993

Hello,

This series adds scatter-gather and cyclic peripheral transfers to the
Arm DMA-350 driver and describes the CIX Sky1 clock/reset integration.
The companion AUDSS interrupt-path series builds on these changes.

The first five patches fix existing trigger, DMA mask, coherency,
IRQ/termination and queued-status handling. Patches 6 and 7 prepare
managed registration and command bookkeeping before patch 8 adds slave
and cyclic transfers. The final two patches describe and handle the
integration clock and optional reset. DTS enablement is kept separate.

Linked commands use a coherent DMA pool and descriptor-owned peripheral
resource mappings. Sky1 has no IOMMU on this path, but its RCSU windows
still require CPU-to-DMA address translation through the DMA API.

Changes since v6:
- Split existing fixes and memcpy/memset preparation out of the new
  slave/cyclic support. (Frank.)
- Use named little-endian hardware command fields and fill the coherent
  pool directly. Keep CPU-endian memcpy/memset command storage and MMIO
  handling; decode peripheral fields only when loading their registers.
  Derive SG lengths from saved command sizes without cmd_len[]. (Frank.)
- Remove the prep-time DMA write barrier; retain the final non-relaxed
  channel-enable writel and normal descriptor publication locking.
  Keep descriptor-owned peripheral address mappings and the distinction
  between read-only interrupt flags and W1C status bits. (Frank.)
- Use scoped guards consistently without extending critical sections,
  consistent device_config/device_caps names and managed DMA/OF
  registration. (Frank.)
- Put the submitter's Signed-off-by after the retained Reviewed-by tags.
  (Frank.)

Previous version:
https://lore.kernel.org/r/20261106013453.1134239-1-Jelly.Jia@cixtech.com

Jelly Jia (10):
  dmaengine: arm-dma350: Fix source trigger bit
  dmaengine: arm-dma350: Check DMA mask setup errors
  dmaengine: arm-dma350: Initialize channel coherency
  dmaengine: arm-dma350: Serialize IRQ and termination state
  dmaengine: arm-dma350: Report submitted descriptor status
  dmaengine: arm-dma350: Use managed device registration
  dmaengine: arm-dma350: Track descriptor byte lengths explicitly
  dmaengine: arm-dma350: Add slave and cyclic transfer support
  dt-bindings: dma: arm,dma-350: Describe the CIX Sky1 integration
  dmaengine: arm-dma350: Support integration clocks and resets

 .../devicetree/bindings/dma/arm,dma-350.yaml  |  30 +-
 drivers/dma/arm-dma350.c                      | 946 ++++++++++++++++--
 2 files changed, 886 insertions(+), 90 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.54.0

