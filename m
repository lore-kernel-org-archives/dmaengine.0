Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023143.outbound.protection.outlook.com [40.107.44.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A4546C4CD;
	Mon, 12 Oct 2026 08:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794528; cv=fail; b=EJWUwa6yyRKiDyp7xQCmpQwlfOZiUulLMvykSd/hADMwI31hHC319GC63AHg1g6Z8GVWdfRMx1rJfSbptUuC7+z/Cm9hP7GyAAjTauKj1A05AphrDYbHZKzw/r91s5xcgD5V0OsT/ziwwurWtXJc3CeSz5SNsXLHr6SVVD2++70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794528; c=relaxed/simple;
	bh=5WO6j08BVBv5qg+Q1on+Io55mz8tyb6ukJpAI573dLc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GFqqfpLH1FPzTvjwKhPJigitYR7QuBLPJ+uslCDJh64nmlZZZw0zwMaudO4uMMMvTeW81LlYCg8tUttQ0aEGvcpKF3chGuYy/+yeWc5ryYe7ZE4OYXuiy8mrb0iYK5tvcbIZ3/50uytJp0PO3YeDb6PFJ0uDXl4skOvM1NQGMRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+Lr3mX93nE/3ctRRgL+FgCq3elsFPA7klJ9wceipLp6uVytMmD2loaBGs7WeACcxS9A8k//V++jo60mTua3MCQBZwk9yKU0xFO8ADtbYMS7YKLdhiPPQwcRtPITWIeMYpDUiJvXlVKH3j7dDXIZ8Aor9gL8RtvCpvKJq2VTE26ojBZ9ICHrBcaWhi+LsP2jjwGU9ESCSSJYB/9u7ReQqwu1q+pxp2+A+O+PWWzcBlU4IKQnRzmsj8OgKIPxYllzjJgWirWUFMSTLIX5IrhkepVQcq2YN6b+zinCUBP0ACbgoE9tDDZxWBwODI0E2FZ3BVfS9uv9UDrlPUA3ACuA6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLyLWDkyurpbgbsAhThaUy6vgapPmNGRHK9E6SiSD9M=;
 b=ezP+t1GUkaGxX20vZm7cHQK6zt0TbMbuHHa6636ZhYXaoTzbE8mLT6BpVhUP9iPb1axeKnGEOdqwR2IXvme75tMVf6NLqu/h88Mz8BnTyPEQZ8EBzyYfn323u5mD8/61a5859c18lzj2mteZUxuQJXn5uwj4WzkWLl4OXF1GmhlV34j6fqyy/pBfZ3ONEkezvXtSQKC9uBbu7Wz+iodRMcHujt+QKGSZIRTTwWWUFqlAE8hfHj99AKTfVncOuHzXUlUfV0hEBTu7VZlqHFVVfqiuMDaAxF/1OGkX/H7WvWjzfavxzdB95GWiDhUzNefybUNgKOwoIaynFIqMkWJ6OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0059.apcprd02.prod.outlook.com (2603:1096:4:1f5::19)
 by KL1PR06MB6518.apcprd06.prod.outlook.com (2603:1096:820:fa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 08:41:59 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:4:1f5:cafe::97) by SI1PR02CA0059.outlook.office365.com
 (2603:1096:4:1f5::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 12
 Oct 2026 08:41:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 08:41:59 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 895A2427E3AD;
	Mon, 12 Oct 2026 16:41:56 +0800 (CST)
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
Subject: [PATCH v3 0/6] dmaengine: arm-dma350: Add slave support and CIX Sky1 integration
Date: Mon, 12 Oct 2026 16:41:49 +0800
Message-ID: <20261012084155.2547480-1-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|KL1PR06MB6518:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3f9e4ab9-3859-4c55-01e8-08df283cadfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|82310400026|36860700016|56012099006|261009223027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	mpVPgbCLu5wxpcj+0W9imiwYQmW77l73u7O7kQTZry88dJUL4X7uYlrbALh58SQDLmwVuFwC7ThhEPo03y12cHj7bMCbrStJbIJhXFA27uqVGv1Ky1Dcty/pkss7SgqgxnRRjqZi/aSa8oD6OBESiXOVZX4P6cuvpWh6ulv0bMhWljDoriPXI4+PHzkCGD83fOw/mzRyKhAwGoe8R0XAKuGwVFt9GiN0xrcVf/mTaHPX4tIu9/kmBQM8lHWRyNUskHNJ+OwUCkoUMsO3aqEgQX0tBZhjtgpnzKhDTWgLQgIBDDBPvT7q3j+wokUmOJ2ZphgIpblwq8yn8MubEnzoHiy8aK41UF8K4jFhaoPlWpQ+wSyX02irqGZvk4EQhxq8NVxSXZwosFvKH3L/DBhFqFy+B+EjVE/SwOjwAi0IOYDvB2QwIi3ZC3Yu6e1uTBRjoNnr1E4IWZG1+7nIH0f5LeKomxE9lIkdGUFs5fAndY0HsC4IpMUqf8ZvPIYY1eVlx6pdanjIc2FbyzRr9S6yh9wAeYPgpYHv4PXDBWbX4qldpa9+Ki8PIx5lVSZiJh9GLnlsgQDY/mTh53P3E4feCd+upxA/AE3UlL4AY4ybrgmMtT4BBjQOPuJLpnYlpzkYnEXGAHUjXdJu0eMUMbunjEdMJXM6yrZ4mHV9xV303U2uXUfYgxIFBUL+YEEX5OKZx4Yff8ggCCLDLKfBH95/QA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(82310400026)(36860700016)(56012099006)(261009223027099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Rr6EGLfRHdedYYyDm1jEDY8T3yaGh/A1NzAu+V9FZ0uqbQiPyXE8wITPzBP0ioJhiZ8CmYbbe17WjFRrpIVjekVfXVOnfHgylpMRGRuJ65+N1nzC3AcKzsL+37lzAffyJ+xQxO7NuI8B19kbhwwsSHhZ8WINbgI9h/wtV/BMLqNEsfmA+KsIjKLwPJZp7ErN2f7KjyYRSDaCISueN9jo4tFTYhITX6tTtqTB3kclYBlgEukDwlnthXCQICNK8cHepB4VdmL/WqhaqIN1yoIeIrlU2Ts10hhDFb63cLAsixkXtT+qMv9D072ZDyZaDoMyH3GZGH/0RLt6dALvoQapk30gJ+fHbOg9kCHw7ZBnUAh4oeph4eybtnt0KoQFvTUwQEIulzPo1u01eELHRPq5fDlBCLSzKkTIoPDml/UQoSYIkOmvRBXyC9pF4bUMg9Ol
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 08:41:59.0032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9e4ab9-3859-4c55-01e8-08df283cadfc
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6518

Hello,

This series adds slave transfer support to the Arm DMA-350 driver and
the CIX Sky1 SoC integration around it.

Patch 1 fixes the CH_CTRL_USESRCTRIGIN definition: the source trigger
enable bit is bit 25, not bit 26 (which is the destination trigger
enable bit). Unchanged since v1.

Patch 2 adds slave transfer support to the Arm DMA-350 driver:
scatter-gather and cyclic preparation, command-list allocation,
per-channel resource mapping and residue reporting. Slave transfers are
needed to serve peripheral requests, for example the audio FIFOs of the
CIX Sky1 audio subsystem.

Patch 3 syncs the slave command list before starting a transfer. The
command list is mapped with dma_map_single(), so without the sync a
non-coherent DMA-350 may read stale command words and the transfer
stalls after the first command.

Patch 4 documents the CIX Sky1 DMA-350 integration in the arm,dma-350
binding: the Sky1 controller keeps the generic compatible and adds a
"cix,sky1-dma350" device compatible, with a required clock, an optional
reset and an optional reserved memory region described on the controller
node.

Patch 5 adds the matching driver support, which manages those resources;
slave resources are mapped with dma_map_resource() and translated by the
DMA API through the parent bus dma-ranges.

Patch 6 adds the two Sky1 instances (FCH and AUDSS) to the SoC
devicetree, each under a simple-bus node describing the bus integration.

Changes since v2:
- Patches 4 and 5 no longer configure the Sky1 channel interrupt gate.
  Thanks to Conor Dooley for pointing out that the gate is upstream of
  the device and must not be routed through the driver: the driver has
  no CIX match data, no syscon register access and no system resume
  hook for it, the binding does not describe a cix,irq-router property,
  and the driver no longer selects MFD_SYSCON.
- Patch 4 now requires a clock for the CIX compatible instead of
  constraining a property of the generic compatible.
- Patch 5 releases the reserved memory region on both registration
  failure paths.
- Patch 2 fixes two residue-reporting races: the scatter-gather residue
  re-reads the channel link pointer around the CH_XSIZE read so that a
  channel stepping to the next command cannot make the residue jump,
  and cyclic transfers report the progress inside the running period
  instead of only at period boundaries. The CH_TRIGINCFG block size
  description was corrected as well.
- Patch 3 syncs the command list with its DMA API address instead of a
  second, identical address kept in the descriptor.
- Patch 6 drops the interrupt gate property together with patch 4, and
  the two bus nodes carry no unit-address in their names: they have no
  reg, which made dtc warn.

The series is based on v7.3-rc1.

Testing:
- Built for arm64 with GCC 12.3, no new warnings; sparse clean;
  checkpatch --strict clean.
- dt_binding_check and dtbs_check pass for the new binding and nodes.
- Runtime-tested on a CIX Sky1 (Radxa Orion O6) board (v3 revision):
  both the FCH and the AUDSS DMA-350 instances probe and transfer data;
  dmatest passes on 12 channels x 1000 iterations, UART DMA transfers
  (1 MiB and 5000 B) are byte-exact, and audio playback through the
  AUDSS DMA-350 runs at nominal rate without underruns or xruns.

Link: https://lore.kernel.org/r/20261009051846.1115962-1-Jelly.Jia@cixtech.com

Assisted-by: LLM checkpatch sparse dt_binding_check dtbs_check
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>

Jelly Jia (6):
  dmaengine: arm-dma350: Fix source trigger bit
  dmaengine: arm-dma350: Add slave and cyclic transfer support
  dmaengine: arm-dma350: Sync the slave command list before starting
  dt-bindings: dma: arm,dma-350: Document the CIX Sky1 integration
  dmaengine: arm-dma350: Support integration clocks, resets and reserved
    memory
  arm64: dts: cix: Describe the Sky1 DMA-350 bus integration

 .../devicetree/bindings/dma/arm,dma-350.yaml  |  26 +-
 arch/arm64/boot/dts/cix/sky1.dtsi             |  68 +-
 drivers/dma/arm-dma350.c                      | 710 +++++++++++++++++-
 3 files changed, 765 insertions(+), 39 deletions(-)

-- 
2.54.0

