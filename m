Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023114.outbound.protection.outlook.com [52.101.127.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF0429AAEA;
	Fri,  9 Oct 2026 05:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791523169; cv=fail; b=YA4hEF7/cstBc8rx1m6aDbXImz4tzlQlB77k+hFar3fFZGEpP9vbX0QVlR4YDbO1kSgQ2vkYRQfhD6BqdZkcoTVG2JgcbS2MPE6Xn17vlMAOWFNvj5jt/uXsJa+LZXI/h4+HeEBS+JhzfKPPzga9HuCj9wB0gX10OsiMhzK6P4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791523169; c=relaxed/simple;
	bh=Go+Q1LiiYherfUY/nNGKMnwb+aWhXcUHpx5tcG7c8Rk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lIqWcAR6WnOTYt6kSG08Bc8f66LwT6p5T5/0iNphW8dcsHKi7YfPInkm1NA2VAkYIlZnvchu00DZJaHSEFqfyH/Z/wUhqCr0NETZW/c//dkig2hSlpmoo6I6fJqd/lsSyI8JU1JVQCi7ZTmXOZ+kudh0byZW4+FAjKP0Zcv4A/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjTnpOWYvjPdkWAE5vYAjmVWtNUXwKEh5dx8YXn/9NUv12dmpZ6XTuzwtNOMXyUwms0wAwF/EGxsFT2YpzCOrl+BX8Bn5+uWTqAuz+SiVcGqk0htIHc+rDd3LnzaLBkPfwHmfMdLkZFGdMACKOZGZZWHfoKQVL2YfcqgWktRZxwu7CL/NO+/kyzMWVo5CuqyKh5gHQOLWQA69tOfYo95B9jHT9Z6O0xfHuCJD/nhX+/ChF8RKsT8jWRrdFcyJHrbn3XyLJTRjQpmRX7GTN8cs4YvWLPD07UVH9O7/e8UbZAMvbIC6DdzkHFt564mO/GLCoon4eIXEu33pi/Olu1ruw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRorMg/vFN9ljRJuDn4ONEhsWjR1UHc2bgHoMYS49tQ=;
 b=FEr8opv1d7CovxNTHlQrwwpMw3mKfQbL1qabptHtCAZhs4HD2h917u8RoYEiMfOOoVUdiKihDLVOmOV3d/hOeDDDxJdQW5XeyyBdvJtmcnPAiKtiIsdCKqfYLggqhXLArnqjF7YpBdu3pCWwqDLoY2UZfPNfI1vkrieNQqAU084xtEsLcfzjARMxXIJ0EHEtI6uhaJnSyS5JO8Zqj4vYtei7DPQd+hRbjZMUMcaDe140fEDjM5CPE3lXxzxg107XO+qbuKJHfEHbIfi06YJGQyoXMr+YDw9Y5/Ai8xeH8RYSA1BKQ93qsTqU8Fv7lF2uuuVVJk0BIV7JvKs74nJz4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR01CA0180.apcprd01.prod.exchangelabs.com
 (2603:1096:990:75::12) by TY1PPF4CBD9505D.apcprd06.prod.outlook.com
 (2603:1096:408::911) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Fri, 9 Oct
 2026 05:19:22 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:990:75:cafe::74) by JH0PR01CA0180.outlook.office365.com
 (2603:1096:990:75::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 9
 Oct 2026 05:19:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 9 Oct 2026 05:19:21 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C6D0643B1083;
	Fri,  9 Oct 2026 13:18:46 +0800 (CST)
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
Subject: [PATCH v2 0/6] dmaengine: arm-dma350: Add slave support and CIX Sky1 integration
Date: Fri,  9 Oct 2026 13:18:40 +0800
Message-ID: <20261009051846.1115962-1-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|TY1PPF4CBD9505D:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d436d6b6-1e4f-470c-8396-08df25c4e01d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|376014|7416014|6133799003|22082099003|18002099003|10067099003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	9gZiyoFDtwFZLmuMNDlUA/KiTGbm9hsyNdKuLl3ZdCf8jyY/kPZFmj1W4EW94U6WxfUISSnBxJvj3iFaC/nbihEuWbyYVcDFyCMobbwgzDA+dlAM11KY7RrV2aAFXrEYYYrU5vEZDreUtvMLz1mRNI9l7/o3NyKwPoRfDSFvUwIZ2gY5bKymXHk8CjPFLGg4RLw4v7bzaqaCYHMoorf7lwLn+XhHW/xpay7kN9CNM/lpsmCkLyI0UFQ0diBWikNilAaBTgkXAPUChXf+DrPXeZYAB8oM1e+IF/jATNbxBJFkq6Q8TPV5ww63ZDSpKmr3hUzvTmweDPU33dBpf9TXcBuF2VX2uf7qAmrHLy3/FuhSeWReq5i8YDn7PiBAThjpSIaFHcU/4MXwF+cnMdcbHuesm38wN9n/IJAG2M011sgDESHXYHfd6B5dgX3HBYyXjuMe5K7E8st1XLQSIcwfgW9pboZpsXo2cg5YEfIN8VDKfaPAvEJBGFosVOoalBKrTRyUvhWyRcZ42FJ+lDNQcD0zGgmpGVzEiq8tXgbZ7MZOT0ehNRD+LElqdcJ/e65mC1JHHjcqq7N+Q6RYOI8Vh/qxIMXUytrLxiMa9yukG2/uBNo+/R4JOc7rbl9823A7lsW/ywSa1pTaVtoyMjy08Re9OpZS3SrOrxnpSp5FPql/6LxChot3J1oIEWyK87AA
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(376014)(7416014)(6133799003)(22082099003)(18002099003)(10067099003)(5023799004)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	X9/Zr3ex8/OwTEAnzbBJB3zlFHo0wFI9BsQmmAKd5y2p7qSqvbsoUD7NyyM3q7ehugWr9iGEf0Y+Og06d676K7nP1BMQaCmDbz03W0TRmvqC13Se4IqadQ5QsbF1VgEFOI06Oyw8Ypp6MgObebUav2GNljix1P+G9BnK8KtnmF8sCTGRQ1TM3q1fk0CXKwQfbrhWFiOKnke7uOw1bFLCoVhflrk20I7bj8JAPwpco43Nvtf/7060v05NoT8g+2kH1QpAehlSB1wmmG+30Iy1gv5KLmjeo3wefhsRSdnMRB20LvoeEHojG8615ReeNLtQjceHPScBSIWgyNzK5n1UyrzLChHbFA2pAzllxg2FtVQaEWFYJ9pXbNsHCqfIRiiL+OFCkcjMQboZRoIbfl0g1Wa0mQxILIbL6dRyYYpoplhpo0HLYYmDwtynDrpMn5ui
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 05:19:21.0009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d436d6b6-1e4f-470c-8396-08df25c4e01d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF4CBD9505D

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

Patch 3 is new in v2: it syncs the slave command list before starting a
transfer. The command list is mapped with dma_map_single(), so without
the sync a non-coherent DMA-350 may read stale command words and the
transfer stalls after the first command.

Patch 4 documents the CIX Sky1 DMA-350 integration in the arm,dma-350
binding: the Sky1 controller keeps the generic compatible and adds a
"cix,sky1-dma350" device compatible, with clocks, resets, interrupt
routing through a syscon phandle and an optional reserved memory pool
described on the controller node.

Patch 5 adds the matching driver support, which manages those resources;
slave resources are mapped with dma_map_resource() and translated by the
DMA API through the parent bus dma-ranges.

Patch 6 adds the two Sky1 instances (FCH and AUDSS) to the SoC
devicetree, each under a simple-bus node describing the bus integration.

Changes since v1:
- The wrapper node is gone. The Sky1 DMA-350 is described by a single
  device node with "cix,sky1-dma350", "arm,dma-350" and its real MMIO
  region, carrying the clock, reset and interrupt routing that v1 kept
  on the wrapper; the separate cix,sky1-dma350 binding and the wrapper
  driver are dropped. The integration and the block are one device, and
  the MMIO is unchanged. Thanks to Krzysztof Kozlowski and Conor Dooley
  for the review.
- The FCH and AUDSS DMA-350 masters sit behind SoC interconnect windows
  in a static DMA address domain, so their DMA view differs from the CPU
  physical view; the windows are fixed before Linux boots, so Linux
  cannot manage them as an interconnect. They are described with a
  generic "simple-bus" address-domain parent carrying the window
  "dma-ranges", not with a CIX DMA wrapper device: the parent has no
  device-specific or vendor wrapper compatible, only the generic
  "simple-bus" compatible, and no reg, clocks, resets or driver of its
  own. The OF DMA core builds dev->dma_range_map from that parent
  property and the DMA API applies it; the driver has no private
  translation. Same shape as the mainline Agilex5 and Marvell AC5 buses;
  patch 6 explains the hardware in detail.
- Patch 2 now allocates the command list with kmalloc()/dma_map_single()
  instead of dma_alloc_coherent(), because it is freed from the virt-dma
  tasklet where dma_free_coherent() may not be called; it picks a free
  trigger-capable channel in .of_xlate(); and it reads the link address
  registers in a retry loop, since the channel can step the link pointer
  between the two reads.
- Patch 3 is new, see above.
- Patch 5 merged the Sky1 integration into arm-dma350.c; slave resources
  are mapped with dma_map_resource() and translated by the DMA API
  through the parent bus dma-ranges.

The series is based on v7.3-rc1.

Testing:
- Built for arm64 with GCC 12.3, no new warnings; sparse clean;
  checkpatch --strict clean.
- dt_binding_check and dtbs_check pass for the new binding and nodes.
- Runtime-tested on a CIX Sky1 (Radxa Orion O6) board: both the FCH and
  the AUDSS DMA-350 instances probe and transfer data, and audio
  playback through the AUDSS DMA-350 runs without underruns.

Assisted-by: LLM checkpatch sparse dt_binding_check dtbs_check
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>

Jelly Jia (6):
  dmaengine: arm-dma350: Fix source trigger bit
  dmaengine: arm-dma350: Add slave and cyclic transfer support
  dmaengine: arm-dma350: Sync the slave command list before starting
  dt-bindings: dma: arm,dma-350: Document the CIX Sky1 integration
  dmaengine: arm-dma350: Add CIX Sky1 integration support
  arm64: dts: cix: Describe the Sky1 DMA-350 bus integration

 .../devicetree/bindings/dma/arm,dma-350.yaml  |  33 +-
 arch/arm64/boot/dts/cix/sky1.dtsi             |  66 +-
 drivers/dma/Kconfig                           |   4 +
 drivers/dma/arm-dma350.c                      | 717 +++++++++++++++++-
 4 files changed, 783 insertions(+), 37 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.54.0

