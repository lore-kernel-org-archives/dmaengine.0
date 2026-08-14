Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012052.outbound.protection.outlook.com [40.107.209.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452C03502A5;
	Fri, 14 Aug 2026 04:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786683401; cv=fail; b=ckDpVmPF4xPeboHm2Us/uzEw/PLJ+E7siljVsnkpxLDlQUiCNsajL9pSeqeVgSwyDGk0/L0BuB2rQ8qAOxttWeUYdb/7ojvDim+vH/HQ3mi8qZ7q3ppwfbEch1tf4zjcGsjxOjqUa42x0pOG/zSXzCuPm4cDSSdzfaWOF/YcW04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786683401; c=relaxed/simple;
	bh=C1aoY7hD4GFPVMTLV0k4ugXgNKsb8MMAf9+O103L6YM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uTVdNXp4C9TuaxbivqQCmm/8KHI72vCFdjfdlMe+lnZRXJvIE1fO5/ka3ld2Eoqcitb8gLB42Xu27iL/OcBUiHvJD3XVk7u98nUcRrVGrgAymBPTyEfKddmXHpVIcdew9619PLN0AR28ZLpEQNIvt0icQczLBeAN1pz4HwGF2gI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NtZEitYi; arc=fail smtp.client-ip=40.107.209.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NtZEitYi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1+3FlU/83jB69+dpO49NhwNva9oqrjmoAd4TzBefe3s9HkdmpWmPacZH0mRdsh0Kf09aQhJ5YSK7lMfOjnSszFLQqgh9z2cdJK2UvqaRsY09cKi+Nns8IuGt/EHm1MYo6WZC+XT4s/DRNPvjaanOguzn9OmEbkwFub7pfWYTTIm/WgEPLzU8dH4KwdXDTNgZyJGLXIwCqCNSCGDMzYNype/QEl4yNyO2004LkFEPaO30+HyR0n0Cy5PbTXqjmSTtOwsLMz+e0C4aCNBwlkOx4NGwCi7qz95/mFaZkva0PWzKF7On4dvygi0MlJuwA5ajZk5NZO6uzjn7ZWCOerkLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=us//KYrtTaCNhoRgyl9hUTq7eDbaoS/cbFSWzNjP4oU=;
 b=xjY1V+PQms8NxzXcwDANuNNx3HTPMPCAIX8Q5xxllkr1F32rOpLUWCDozWM8UtzcOavfYd8lKTeT9H/zSN4fs4TMvowfvsnYHzqzL0/RmQJ5dZPj0kcAW3Y3aENyclU7B82zbCBmFLygs+un00b2DXfqKwFz6ok2SvB8MmKATKRuXxn8cQpzhDHvo+LJtHSorZtBnJJ14i7DZQ1AoCh4FtXGYsSwU1Ye9oQgouAQXYBzT3V7d7ePoVqzd1nmsILcISVIMr7aoZ1ECzMrxFiuhHh1/+OFrS9LfANn2pYNrrtWPCPGraepOiU4HMmQXtc2ivCC6a+U/fPVgawIR+q2ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=us//KYrtTaCNhoRgyl9hUTq7eDbaoS/cbFSWzNjP4oU=;
 b=NtZEitYilv5A6b2k+tmdl5NxPsaUiwZ2vcg84okRw6K7Yn95Mp18TufkT0qnQ1v9awq/HDVzv0jBLQABkIrg5Zi4VKcWE/akHnSYhGuMddr29uO3BMsEHW75GZlRt97BG+RyF6sqhmpZPEh4DFEYFtibNTH9O8r37uTRU3ZvD6A=
Received: from BN9PR03CA0302.namprd03.prod.outlook.com (2603:10b6:408:112::7)
 by PH7PR12MB7355.namprd12.prod.outlook.com (2603:10b6:510:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 04:56:31 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:112:cafe::ab) by BN9PR03CA0302.outlook.office365.com
 (2603:10b6:408:112::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Fri,
 14 Aug 2026 04:56:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Fri, 14 Aug 2026 04:56:31 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 23:56:29 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 13 Aug 2026 23:56:27 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <nagendra.golla@amd.com>
Subject: [PATCH V2 2/8] dmaengine: zynqmp_dma: Free sw_desc_pool on desc_pool_v alloc failure
Date: Fri, 14 Aug 2026 10:26:10 +0530
Message-ID: <20260814045616.1661199-3-nagendra.golla@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260814045616.1661199-1-nagendra.golla@amd.com>
References: <20260814045616.1661199-1-nagendra.golla@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|PH7PR12MB7355:EE_
X-MS-Office365-Filtering-Correlation-Id: d65c2fed-8bb5-4c4c-dfa0-08def9c0685a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|376014|36860700016|22082099003|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	lBDn8vN3TwsFwlsrPiFY1JxEjZ4CP2dg8odv3WeR3sjSISVUsE0yJQXjKz8KQL/xjGA/1hS1IQxhq3KEz0nKBXu8qlLgGmsuSJ2hG/yiCyelUXB0d1M+DgSbIpI9Swc0/ViTXvUx3aMO456A18Fz8cIPaYXMn9q6ltfVe2oG5UDJKoCHai9BM+PXTkKGLucVz19Dnd8fa8IyseswzNSZtMGGm4v2G4esOo69JZVxs89S5DjiRpH83Gi4KiP3t1dT3ySWEs/MgUVY0xNspq5Z9MhB3A7vaOeXPA4YoVWyXDmAiZRoxdOr/pypcyU1fn5M7VYGptGmUnTQMDO94xrrly2l+9OgORiejWBY9UWf32HVcfGZP5iYwTw56wVxN4YRqHSPIc5kgful2Gcf4Iaadi3TZOUnNYz8KPH+FI1Y734LYzMFLUEyyjkjcnQ/t4YzY2/0cQlvbF0cvK/OyjSdyakwu6z+7RS1w57ZJYhE4ThZ4z0BD1VqnntrjiDGWs6lckpVVCIB78OA+nSt0IRWOsBHgrTkkZQ9MNxTIhgAS3+yXcWG1MtMV9BgiQxdBql2xb1siyoxx9adNJRPWk+NTKOO4ysUkTKnWS75VhUnQNjzYmpFJXV4eNkZ2h64kIABao6LNcAw9gdho+FuDQtoea4wO/e/GVjispbEnWat7yOgak12Z9To84le3x4auG2I3Vkfolsh6mmHd1hldqOcSg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(376014)(36860700016)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/EYY5xvG0yVWw1K75TL4DzVWy3VsVK5RwdI3w/OPGzDC5VopTIq9vMs/un9va6YVvcDkOMsrJM1y0rAPHQJpiPXXYN09HwAzIZtudhG7M/fJO3NxnRNWHXQqRj9x5hPF7jAcws/KzD4rj/+ugpAn7rjbOjxg7pf8QwbZ+fBtGsr17ILKz2I4Gpfheq9cayWa0x2F0NVSJUX+8fGX8DZD9zgnltO4rXArtqiqNVgFKUFKu94/GZXd19DRovUe+oC194CvIP4zsvhiEkxu8pua7uKSYbCquCjnKfeyPEVj6j4bD32Nlb6edYfsgaCCno6YclYESOpCFNvAE1laZSs5s/Wl1M4+oQ7dPWf+fXLXUwUnrJs5Z+S8+qQJn2JCarxz5aYu5ppmSRcC+tAPnD2zjGz/j58C6JunxRuw6LOCLrU3arxvjinVpOxdBsw5PcKc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 04:56:31.2583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d65c2fed-8bb5-4c4c-dfa0-08def9c0685a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7355

In zynqmp_dma_alloc_chan_resources(), sw_desc_pool is allocated before
desc_pool_v. If dma_alloc_coherent() for desc_pool_v fails, the function
currently exits through the runtime PM rollback path but leaves the
already allocated sw_desc_pool behind.

Add a dedicated err_free_sw_desc_pool label for the desc_pool_v failure
path, free sw_desc_pool there, then fall through to err_pm for
pm_runtime_put_autosuspend().

This keeps the error unwind symmetric and avoids leaking the software
descriptor pool on coherent descriptor allocation failure.

Fixes: b0cc417c1637 ("dmaengine: Add Xilinx zynqmp dma engine driver support")
Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
changes in v2:
- Split this cleanup from the previous combined alloc_chan_resources patch
- Added err_free_sw_desc_pool label for desc_pool_v allocation failure,
  freeing sw_desc_pool before falling through to err_pm
- Updated commit description to match the exact cleanup path
---
 drivers/dma/xilinx/zynqmp_dma.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index 9f1e69700dd0..b7c561280694 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -504,8 +504,10 @@ static int zynqmp_dma_alloc_chan_resources(struct dma_chan *dchan)
 					       (2 * ZYNQMP_DMA_DESC_SIZE(chan) *
 					       ZYNQMP_DMA_NUM_DESCS),
 					       &chan->desc_pool_p, GFP_KERNEL);
-	if (!chan->desc_pool_v)
-		return -ENOMEM;
+	if (!chan->desc_pool_v) {
+		ret = -ENOMEM;
+		goto err_free_sw_desc_pool;
+	}
 
 	for (i = 0; i < ZYNQMP_DMA_NUM_DESCS; i++) {
 		desc = chan->sw_desc_pool + i;
@@ -519,6 +521,9 @@ static int zynqmp_dma_alloc_chan_resources(struct dma_chan *dchan)
 
 	return ZYNQMP_DMA_NUM_DESCS;
 
+err_free_sw_desc_pool:
+	kfree(chan->sw_desc_pool);
+	chan->sw_desc_pool = NULL;
 err_pm:
 	pm_runtime_put_autosuspend(chan->dev);
 	return ret;
-- 
2.44.4

