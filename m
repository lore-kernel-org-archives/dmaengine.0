Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010066.outbound.protection.outlook.com [52.101.56.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367112264AB;
	Thu,  6 Aug 2026 12:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786019443; cv=fail; b=WfoUgv/sUQ5hPM0PwobxJxiCapmTT/DUsFWS6l6As426LQPYaTvZS10Fj10mt1AsvYpEhJpUp7tEgLczmi8ScNZvRu7qvUdCLXj8D550nTjkOT8kj5HXGzyx2ilU1LFHHdcZrvD6rcdFJ9a/obQnsiSjI2+URlgwjgQXlqXCwRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786019443; c=relaxed/simple;
	bh=Mxcc5DXF805kIeEDkHpjg/gRh3gBDfeGNGSFWkMvfTI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sMa7rPz9QNBABIIWOfvdP3j1ab5Q+qR7tou6LI/CBWJikcnxRb9bPX3iPa0h8kPyUVMrFfkVi9WIas3h6KJ1z+Pwqz4bgW47nxo/ggJs3CbxMcGabCm2iznEgRjvQM0h3yAAjWVKryIhWs6mP86UAKwB5IXFJuIA600uNZTqSIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HgDqBOZn; arc=fail smtp.client-ip=52.101.56.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HgDqBOZn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kF5ibd7EJv64wPQCuclNsnrAoRlkjFGfQN+RGdszetnFA8tY66EFeiBOUptK6nUKWNHrHiMPbszecD0wlPvCWNIsEVtaMAEhaHh2MBPWdvuaHpxiJPAFJSPGk6yyDiCblK+O0B6FvYJ+Xfo4du7Hf49XLGTxkcgDGYR99h+zM1YVqHVcYbbMeJsIp2Gc10+iVc8FnvmMg69YAekUpmFPBE2z+TWAMq0kqtXjmTrcV9PtNw3uYpY7giyB9X5z9wdJ+KT95m8djVoKf6t+yXc04y+TWn+bxwOyJPwtTy7gfCwe27T/0ylok6ss4jjyJ92pT1xCKDJZqUj2QEKMEpNcng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSVqQF2GWaRBIO/enpIoViDq1n1ewAvl33Xc2Eafg24=;
 b=Fo9RIGpfalJeMwZG/OimQJtguXPSpNkGVWcdip7NAsxeDfu4v/dQUPqmmqbwkAzO3ChY64Xc82Oz0T301X7LZoAhKPnemMiThZZ4+NUj37t9CTTMkW8/FEZGM0Q2iAecwbKqpdz4g3z0Dlz/abi7N/eXRKJJfbaJ5QFF1nCnmNqcjPmbEl465lnytIZRSiokzK1an3swx5BwSgVGLHt1oUAgYXp+0zhsLq9aKt2faMeDU5Xy1GUnLfBdx11TrZvEPvKaBoVBc2HymaFrXizgdglW/w7qREdb6+YvP/vx/8l3EtT1/r/3ObCPSHKv61i0LnQqVsrg+aOkVGzacXmRYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSVqQF2GWaRBIO/enpIoViDq1n1ewAvl33Xc2Eafg24=;
 b=HgDqBOZnEwGf+nxC2TC0DexnRpkCnWnP09uHTK7ryBAH5XBiHW1IiC4aodzLBaO1GNlBjT87JtEpJK0AsV/81eIdug14VKQMDQOYepGh4mjgM4OkFgibIOPszNu0bwVimmniz8pmuTtRC2Vb3PAIyHTiGz4NAGnHGWbDNtr3GFc=
Received: from SA1P222CA0029.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::24)
 by IA1PR12MB8359.namprd12.prod.outlook.com (2603:10b6:208:3fc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 12:30:37 +0000
Received: from SA2PEPF00003F66.namprd04.prod.outlook.com
 (2603:10b6:806:22c:cafe::6e) by SA1P222CA0029.outlook.office365.com
 (2603:10b6:806:22c::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.21 via Frontend Transport; Thu, 6
 Aug 2026 12:30:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003F66.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 12:30:37 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 6 Aug
 2026 07:30:35 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 6 Aug 2026 07:30:31 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <radhey.shyam.pandey@amd.com>,
	<kees@kernel.org>, <sakari.ailus@linux.intel.com>, <yukuai3@huawei.com>
CC: <git@amd.com>, <dmaengine@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nagendra.golla@amd.com>
Subject: [PATCH 4/6] dmaengine: zynqmp_dma: Fix minor whitespace
Date: Thu, 6 Aug 2026 18:00:12 +0530
Message-ID: <20260806123014.2120447-5-nagendra.golla@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806123014.2120447-1-nagendra.golla@amd.com>
References: <20260806123014.2120447-1-nagendra.golla@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F66:EE_|IA1PR12MB8359:EE_
X-MS-Office365-Filtering-Correlation-Id: 951af6ad-8b34-4e4c-fed3-08def3b68504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|36860700016|82310400026|1800799024|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cXldNTJMpLo5n+8qvUF1LOdFJidsoTSg5gKT3iimozoQeK/rf6GTrYyrDuIPD0Z4vieofvLJ6Vu8J+ZB6X94zv2QA+u5pYH6kMR16CBcoqqQj6VZOEtPCYu0DZF96XEijN3Cnlk22qlP6CGsU7PxSf3vEwb5d/lq4LDl8flsQXxqTVC6a3xbe02zISnu6Khd0wGsBOmN7LdWcRpEY33VHlbOMbG8VKHlgqOwvvZaqWrGng07UfF0hJ2Sfo1fcyr8bjiSbF2K6nl3bzaqOxwWZz9FD3jVPcLJiuOSEJW28xdyQhf5tVNMTwqN8ZxeMgCAE9qMHv3diTzu6BSGoUCJbHru064/SFGXx+31gJGlgzOub/R9z+ljhYgUEob5QRjoImYWMvDAILb2s0hp0VZJEB1owBRNJEzCjIs4F5gR8rt6TfydGl9/PataFk4DAceS2Rac/BbhHrI8y+8H5Fda/qgmF+pailC4A6wM3coxS2aU7w7L5chIvgssxKEkUV6SaniUq97dhXYo1L4Pd0KbZmciQKwyGwZdTx7FIJVWE8Wl9YjjgfZNEfhTmheCYtJQNVvAwMneM8pIpZE6wNP5rktf6+1lL0Hw434naK9kiHpE51TuNE+B6tiDFpz6uD2xcZXdlNbJ7RK12zPwhxYCXLNJag9mv5qmk3XXm3iOrAMPyVexznk5R7mNUW5a6Nb14F1hUoPkFO//a7onyQ0Nlw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LKIQbKdszX9xHkthWgz3QsnOAHamvdgtMo82i4bc9Mur9CrA10lP3h4zSaEXiy0IBG543spKkPZUnBUgaV0tA+lBfoO+XVXWbAoaePL1iT/VYxRjiR+5yynGzQZus0ZfiOx5mixTls41p/6REVSvstGqW8NVOXmNccYYvImUYbluSz22T96V/wwsNfLECmbVyadHG4KFYiVseplop8OoOPmExH8SBDxswGcV70CeI7esDXw3P1BvvZoOYH8T8y207ctD0PsfdhNur38MBwlkQ7D+m/sOeNY9AMBVMszrImNkeCKyzdNtyLzUo29ghWwr4C1fWOga9Pl8P1MWaF6MS9XrNCuWWi6KSck//9LtapUyYOgn51Tybvc59NSao5OypD74q0HdiJn9pU0DPRJ/2972u46BFNQkV69dyW3bxiCmW/r+cGxwHJoWgzWHI1CP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 12:30:37.3670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 951af6ad-8b34-4e4c-fed3-08def3b68504
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8359

Fix minor whitespace formatting in zynqmp_dma_chan_probe().

Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
 drivers/dma/xilinx/zynqmp_dma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index c5b05fd52e9d..2d56ea08ce45 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -947,7 +947,7 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
 	if (match_data)
 		chan->irq_offset = match_data->offset;
 
-	chan->is_dmacoherent =  of_property_read_bool(node, "dma-coherent");
+	chan->is_dmacoherent = of_property_read_bool(node, "dma-coherent");
 	zdev->chan = chan;
 	tasklet_setup(&chan->tasklet, zynqmp_dma_do_tasklet);
 	spin_lock_init(&chan->lock);
@@ -959,6 +959,7 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
 
 	dma_cookie_init(&chan->common);
 	chan->common.device = &zdev->common;
+
 	zynqmp_dma_init(chan);
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-- 
2.43.7

