Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022118.outbound.protection.outlook.com [52.101.126.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375C834B669;
	Mon,  7 Sep 2026 03:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788752056; cv=fail; b=bBVs/y/AV9YOet9zHbVkeYI+4J16iDTx1jZKpBOkazCtAEACCRH/Y0j0BuqbK46NWygHtu4KtM14+isaPp7KHP2x1aeSObm9W8yXUwjY72AHbbOx0tUEiDlOVPsewYmiIbsUiy3/lIgNDpLpegbXLZohicgDFsAeBbslKnwhPp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788752056; c=relaxed/simple;
	bh=POmMsLdkBf287kN2TweyNu00ebLvltVFklEBBJtFjJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gGIT2/m3GgtT2vFQcXoEBWniMIeVDKCKOd4onZXhRLX+i5tz/PWyTn2oGgZD0ZjqLdVAG9KDihsPiwU3tTrMXSnNCL8Pf7Abz21vT6G/GFbYrTTJQemSw/4UPzTO5Fh6wNViy0+mRFEj7+fejeQ5DPD/Sj/otA9Wco/5VCHG6d8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLDBazTrmjlsWEPW2hCmk6YHH12BiBPnf+IdZD5Kb9bQsLjbR8vzWme0mzxUS3waZuKMVsN4liYEU4P3JYINjZ5t7GmdiWDWpGDvLmFIXe6HlOzBPyYkfbDp7CROc7Z0pLlfam9dp2/ycvwb+U3l1e08Hg97hmcCLYouFacxrfLSbl4HTRLvUCtTyStKiLHdgpQspjyNgNxtlQka7v1lXy+vY6u6qqYBl393bDLcsZZBHd3PtdNegPpYn9EofXImW/1bVsxU2M+IBPNZro4CcZjl6CiR7kdUlcgD8GZhk6ezl8iapYsVFKEqccsHc8NSarMsZAR/gAtZrvfIxxO8UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OWTpSKmEb5fQBhYvArkHMUt1L1KGDT/Bst5JI8Hwos=;
 b=TFqb32S3bIRkmt/bZOkrXOdM4ZGmKkP8g8kC00CAT1Q02fPElidEjk/1F5GyUgDvUk+RUnwtgQZMTtrosY/Y4QiDAEOFHaMDRZyf6GNak5TZxb4cKPTDPWBzzRNgWxrHp4UHkvvg0iWIicTpv3xvklvyJEb6WC2Psi7DBSf3Y8Ib/MhbXUncblkPWSNvAjoWsmFSpQPNWo/h2Lx/SXnqB5AKrrl/z7/d9LF1wURMQuDbKFR+iR5FKZsTW+tTPk0iSpE+F3notLXRaagBtegNQWge5weOINPuMCwzQnJ2X3ZswXgo/Z4kmozgYhXpF738tB/SR4qoXNf3Bims6JuUTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2P153CA0016.APCP153.PROD.OUTLOOK.COM (2603:1096::26) by
 TY0PR06MB5259.apcprd06.prod.outlook.com (2603:1096:400:206::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.15; Mon, 7 Sep 2026 03:34:10 +0000
Received: from OSA0EPF000000C7.apcprd02.prod.outlook.com
 (2603:1096::cafe:0:0:c8) by SG2P153CA0016.outlook.office365.com
 (2603:1096::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.3 via Frontend Transport; Mon, 7
 Sep 2026 03:34:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C7.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 03:34:09 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 600594092106;
	Mon,  7 Sep 2026 11:34:05 +0800 (CST)
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
Subject: [PATCH v1 0/5] dmaengine: arm-dma350: Add slave support and CIX Sky1 integration
Date: Mon,  7 Sep 2026 11:33:59 +0800
Message-ID: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C7:EE_|TY0PR06MB5259:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9ebe934c-da2e-4fcf-1b20-08df0c90e0bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|7416014|36860700016|1800799024|376014|10067099003|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	QbSGjNb48MelYxZDo+6LQ80kVj0uOLFUD10DOjBMamCBkHRlJYYf1Xk8PrPQz8p7wRvjkQ/D2VDaCa6yvYfitdSy0I56gAUrA3ycwdv7c4IAQiK+a+MZDzjKECE5tLrIgVm1XJHHlFIUg8wDZxgfpVHUMA15T4bJNIHivxBLUElalwUprROPdgX87AlrniwNVAdamFBSHyUHIlSJsBMHFfJEcAdG85k8LGIzqg2/OjhaqInsVUTDkGifUMrsZLX8NJcDyoXl0nbFyPaQXYDGhR29DebSONIZwEX0AgB8FU0XXCa8sFnSwJNZJGi6byUYW3buA0+sTXeZrtmwJRmdQxmAS/EwisC+vY0bQw8TFkXWuk+KYA3TX5q/AtQzdX2VczZy/bkg1IqJ7fMlHhiiTAhrdIWF6jp71/SZ+eLRqi9zxxrLN1f8pbXa6IYv/1Bm+Sc3BYTzUjHJGZQLSohWY8fFDvbi36mtKjVGzxYMRQNSLdB65UXpFaHuFqMMdKSQQucqVxzNTaUZy5d+rhRLT7QIRFNbEwjxjDraZAw6OdEKMkjvtmexuIIDw+4pfQ3HxO7qk/WK4676E5V4EujkPzXrxs60+euhIykLU8hPfFA7+brbdOSoMmBOxmu4pe7c8FEn0n7JmlVspxhPENqd3YqN/mWM2+/XOHeaKlvD7DS8cga2pmoKcax/5aIPyIfzk87KEqBJNwp6Qx/6DjbIfA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(7416014)(36860700016)(1800799024)(376014)(10067099003)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rC73M6bukp/mrZG3GI1mNpdq2ZQgffGFEBY6EoasYTlxfmhfrn0t0JmndioIkIAlj/gbaP3q7scvqDQ/1RwLzsdBjKv9j5C2e0dj4rJJ+A8MjvfQ98A1PFvbyjd+r/4Oy4QsfudATzKy/CxfgFUL+k7mfvSLT34EXjFaQf4FqMaepXHmIrzr+5GojoZaF4w5I3B8td/S4p2D4BmENZElg0vbzBkZdKJ8CupJnIn2AorpMnI711ap4EvSNl35l7PSksIfHkVrH++SuRNDn+V35VcEylcud2USjpHGwDRCMZZ9h4712GiAQonUa82qOcbmzfFbWPOn3ElGbj2qTczDxX/HgFeqXZ0C0aTDL2LkTX//ABX+UkDaIWOcbZO16vvm9RluAdSkDtHwPpwf00WIyOb1Ixl9eOTu5Uv9uoltYo+c8W8hzWMsc/5AV/+uV1v5
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 03:34:09.3194
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ebe934c-da2e-4fcf-1b20-08df0c90e0bf
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5259

Hello,

This series adds slave transfer support to the Arm DMA-350 driver and
the CIX Sky1 SoC integration around it.

Patch 1 fixes the CH_CTRL_USESRCTRIGIN definition: the source trigger
enable bit is bit 25, not bit 26 (which is the destination trigger
enable bit).

Patch 2 adds slave transfer support to the Arm DMA-350 driver:
scatter-gather and cyclic preparation, command-list allocation,
per-channel resource mapping including address translation through the
parent bus dma-ranges, and residue reporting. Slave transfers are
needed to serve peripheral requests, for example the audio FIFOs of
the CIX Sky1 audio subsystem.

Patch 3 documents the CIX Sky1 DMA-350 integration binding: a wrapper
node owning the SoC resources (clocks, resets, interrupt routing via
a syscon phandle, optional reserved memory) with the generic Arm
DMA-350 controller as its child.

Patch 4 adds the matching integration driver, which manages those
resources and populates the child controller.

Patch 5 adds the two Sky1 instances (FCH and AUDSS) to the SoC
devicetree.

The series is based on v7.3-rc1.

Testing:
- Built for arm64 with GCC 12.3 as both built-in and module, with no
  new warnings; sparse clean.
- checkpatch clean; dt_binding_check and dtbs_check pass for the new
  binding and nodes.
- Runtime-tested on CIX Sky1 boards with the FCH and AUDSS DMA-350
  instances.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>

Jelly Jia (5):
  dmaengine: arm-dma350: Fix source trigger bit
  dmaengine: arm-dma350: Add slave transfer support
  dt-bindings: dma: Add CIX Sky1 DMA-350 integration
  dmaengine: cix-sky1-dma350: Add Sky1 integration driver
  arm64: dts: cix: Add Sky1 DMA-350 nodes

 .../bindings/dma/cix,sky1-dma350.yaml         | 102 +++
 MAINTAINERS                                   |   2 +
 arch/arm64/boot/dts/cix/sky1.dtsi             |  61 +-
 drivers/dma/Kconfig                           |  15 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/arm-dma350.c                      | 642 +++++++++++++++++-
 drivers/dma/cix-sky1-dma350.c                 | 206 ++++++
 7 files changed, 993 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/cix,sky1-dma350.yaml
 create mode 100644 drivers/dma/cix-sky1-dma350.c


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.54.0

