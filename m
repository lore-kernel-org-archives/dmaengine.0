Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010043.outbound.protection.outlook.com [52.101.193.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F1234A773;
	Fri, 14 Aug 2026 04:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786683393; cv=fail; b=mXGMbpMf0btf/im46EvvX/GUJ3ab67CU1juOTzekzEXT3aJzYDCdBfcS9JQ4Wl2UG1C7VsT5mJsphvtfjspMPDP4dNrhedXPl/T0CmcaaDCbgM9KAbgkNQ6h4Qfg6y6rgmGgKOdpWClBnu8r5kIp97f81rByBUyeCXMp8jl56Z8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786683393; c=relaxed/simple;
	bh=Ut8z95Ox743MpwB00zExTdYMwiC6AnHAq2Fo93zY7Ro=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DkMQz6bXGFBaYf/DZWwWWgnKP0hiQLNHoT3bGcfMatdSE6pSNJFvuo4Pg9ttAh7xre96ULNx9wGCq9vN0npkGlZnsQNhawAUzIzzfPOzGitHP9wnCxQC3PRY19mCjk/hsDpJQHeYFDPqvxIollY52QiQxIZP4CXZV0F9XOJowdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VEnePk79; arc=fail smtp.client-ip=52.101.193.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VEnePk79"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZIqVFgd3Am5RDaZ3jp9jxl4n0hCl2EiF3buE3LL8ypgliNNBimXnbo9P15t3nYIlrWyUfYU//rKv181BqSPqmCod5659LvZKDfGm3WPxprg9L3alq8ai6nf4XG3/GkgJAU5J8cMLXsgQrTjN8dA6+lJ+ynVFSeclKGDFJ8oxIGZHhsTpQCH5tTbYh7d7s8jrw5t5jiRjwSVXeHDin8R4l8NfpOcy1BTx4nOM3udeA2RsVVvzQXLag+uOOawMvP9yCnAkMAQausQFjyJK/3zjalVP/BGdeA1YVtxrFgjNeKOWB2HnwdGaO7D/FhhbB7gqdni8NYuIyQuf6+kERGKaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUiY/TxexoB8QCeqahFlrpDUmazXn4r/4F6sg0if3Ok=;
 b=lrlYuA23xXHS1/J908FHIZgkRg1JbYZOs5MLv76jYpGccQpQFb2pC4xCeYesrT/ii1VwUzW8wAjdb+gUT4UAiySpsna4o+gV6jP4ZswkuzwWAaOBCIOyTNzx2kJl5WDUok+bTl0pdf6qddefY8rUTFsvD2OS0HML1+RSljxqk07QWG+AycJ2Qm3QRtu/8+Vnz0DE9ddUFVvJA1A/dbbZ8jL7ww/E+W+0F0I2+g4bEWvwdFt9ImWh1svHR3svVFFZ8cKw0/y9YNF7ezAA9LnByj3iwOPOtCH2E5SuvyK4mjmEULaK+Z0WVJ3Xayk3ZLRUgWB93fIwL9ag/WUPO0Y9yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUiY/TxexoB8QCeqahFlrpDUmazXn4r/4F6sg0if3Ok=;
 b=VEnePk79jguUnebwlrzCcWmzgOAMX3/Z9bwaatOz0I8bLiKh1HzeKByS26a37MmAMenWXz3CTEaAYjTGKABQcDsZng8Yi4lQeflL1ldv21R7+K1gNAAdmGx1IrokV2/6Ma0GS0htHfWJMhNT5dgvpPUbMtmjg+QVtp7bhN1z2tc=
Received: from DS1P222CA0003.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:454::10) by
 SJ0PR12MB6925.namprd12.prod.outlook.com (2603:10b6:a03:483::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Fri, 14 Aug
 2026 04:56:28 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:8:454:cafe::85) by DS1P222CA0003.outlook.office365.com
 (2603:10b6:8:454::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.16 via Frontend Transport; Fri,
 14 Aug 2026 04:56:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.0 via Frontend Transport; Fri, 14 Aug 2026 04:56:27 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 23:56:25 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 23:56:24 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 13 Aug 2026 23:56:22 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <nagendra.golla@amd.com>
Subject: [PATCH V2 0/8] dmaengine: zynqmp_dma: Fix error paths and follow-up cleanups
Date: Fri, 14 Aug 2026 10:26:08 +0530
Message-ID: <20260814045616.1661199-1-nagendra.golla@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|SJ0PR12MB6925:EE_
X-MS-Office365-Filtering-Correlation-Id: 75728702-93f7-456a-151e-08def9c0664c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|18002099003|56012099006|11063799006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	b+HUC8Smw39F1/doFqRMPDsUuVxHkuTW05sJHNuhwjDqpGt9UYRlR+GZH6ms22JSRT9prVE3pukVSU97KQVjouNziFxv+TjescXqExr6nVRJhlMS4pACFmOhQIwmZ91o+TPYZkqVyyesJWPJ3igVGS2hvU/8ngIEOftiMkEpVoldkOWpKQ2ftduUKfD7/DAFcHk5ci9kkkNaABFk+BOeIMdzwUe4EthJSd/3m/ZjOyc6ajI9ACK8H/FxXEtgZRQ5oJIvZuRWGSq9dUhc2UG2s7TvFBNxd1rHnQEV74OYY9tGIavVQzDLXCYJIOUTqfYN8PUHPfydSsnWPcUFZEF6ychjn36++WBEtyeOd0o5AMyqRRbTaeKNDVivJk7AJxaT4r1CzEO6+wYizzFRWzFUae+Gw2/OkfPslTAzKDf76uXBKE8blS96aYGgwjY5wUlLJYtPtBfAK2wj6uMTRDGCGbf8cDEw16GCsSgr2QhvzmYaHW47iRUJLJeyADFXPbTGfvrZ5A8QuhQ6skV3jd+ezBn70fuZh6WBF3tfGGFDERpWGwJNy/P8bVHddsm5jpFMNt4QgwLW0AR68iqGVRbY8A+porTS4GV5PA3cMx2iERTmGKn2VM8um1OnOo6ofjYkZDZP7nkpBoWY6oggu0LEWUhQHvuCMC34x3x3aP/7bDStEM5/L3UBJoKFzsGmNXIv8IosHUu9PXAvkRntYRpIMQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(18002099003)(56012099006)(11063799006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nfxPsgZedstadsAdPNqVfxOOxpTUUJ29Z1CKCkLgVHHMJ0V0+cBo+ulyLkQgd+7ccWB87POpfIiC6KY4fOwVc2rd4SVfux5Vt4JrB4HXs1EoWG4iWSaFZiHEBlCwT7n2Fed6TjArPG7ks3PWvqeukylBNbVLH5mTinM8Z0j+OHlJJTjBsuqOIfDnP8aW521lKiGhA8oCQpcMoABR14qiPlXD+YS1hzyu4dD9f+hFIj5pGW1C3YGjCPKatSUxrX9MGLeVXJRV9roVcYQL/5sO/Al9ywURQQPKs++UdIUr9Gyc/E2EGWSM6J5dMGPdSpQ0Jg0HRIYHK6EUczuo+zizNfCS1t5iGHansFKJ+6IjVpl622OBphFvwQmpe0mEvdXnfCnwgyBSfBwU9pIGXbUeQOj4vTcASCTGHwAqC+pI47MR5n5OW4XYUrYv3QLlyyfV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 04:56:27.7945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75728702-93f7-456a-151e-08def9c0664c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6925

This series fixes error-path cleanup issues in alloc/probe flows and
applies follow-up cleanups in the Xilinx ZynqMP DMA driver.

This series fixes error-path cleanup issues in alloc/probe flows and
applies follow-up cleanups in the Xilinx ZynqMP DMA driver.

Patch 1 fixes runtime PM rollback when sw_desc_pool allocation fails
after pm_runtime_resume_and_get().

Patch 2 frees sw_desc_pool when desc_pool_v allocation fails after
sw_desc_pool has already been allocated.

Patch 3 fixes channel probe/remove error handling by preserving
platform_get_irq() errors, initializing/staging chan->irq safely, and
registering the channel node only after IRQ setup succeeds.

Patch 4 updates stale kerneldoc comments to match current behavior.

Patch 5 applies minor whitespace formatting cleanup in
zynqmp_dma_chan_probe().

Patch 6 switches dma-coherent detection to of_dma_is_coherent() instead
of parsing the common device-tree property directly.

Patch 7 rejects zero-length memcpy preparations and documents the return
behavior.

Patch 8 removes an unused define and drops a duplicate interrupt enable
bit from the default IRQ mask.

Changes in v2:
- Split the previous alloc_chan_resources cleanup into two focused
  patches:
  - Patch 1 for runtime PM rollback on sw_desc_pool allocation failure.
  - Patch 2 for sw_desc_pool release on desc_pool_v allocation failure.
- Reworked channel probe failure teardown to use the existing
  free_chan_resources goto path instead of adding direct tasklet kill in
  the outer probe failure block.
- Kept the whitespace-only change as a standalone patch and moved
  dma-coherent handling to a dedicated patch using
  of_dma_is_coherent().
- Updated commit descriptions to match exact per-patch behavior.

Golla Nagendra (8):
  dmaengine: zynqmp_dma: Fix PM rollback on sw_desc_pool alloc failure
  dmaengine: zynqmp_dma: Free sw_desc_pool on desc_pool_v alloc failure
  dmaengine: zynqmp_dma: Fix chan probe/remove error handling
  dmaengine: zynqmp_dma: Fix stale kerneldoc comments
  dmaengine: zynqmp_dma: Fix minor whitespace
  dmaengine: zynqmp_dma: Use of_dma_is_coherent for dma-coherent
  dmaengine: zynqmp_dma: Reject zero-length memcpy transfers
  dmaengine: zynqmp_dma: Remove unused define and duplicate IRQ bit

 drivers/dma/xilinx/zynqmp_dma.c | 73 +++++++++++++++++++++------------
 1 file changed, 46 insertions(+), 27 deletions(-)

-- 
2.44.4

