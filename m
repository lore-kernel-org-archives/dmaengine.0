Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010022.outbound.protection.outlook.com [52.101.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73010238166;
	Tue, 30 Jun 2026 06:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782802140; cv=fail; b=l2E7LznDO7NcrndoBcRCpUQirqvEroayy83r3zQSRet1ddD/I9aRPwwOmAP5EQ50Jw1UUtmIehiAbBLzlV0Jk+h9cO7mA9/Ua5i7++mgxe4rKFVoxrPwkL6auCx6uUarcLvzuk4LmbZJ6JnSxbiKMu//9SDZmXkyCF37rt2QjgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782802140; c=relaxed/simple;
	bh=ugu/ft9cyThAyKBQqoPX0dHULLrK1gSQkTLoer6R994=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RM9W+w7T4WKOZEmvs9SB/CZReKBJ7BdpJRcgnkyE2ZQHu9FWNnOAe3Wfy9/DCpr4xXd9NNV6Xk4XKg75CHAvkgYLq+8otp6Iszb6lfjfjuPDYOg+ury6aY+BM92YSj6C2Z0jPpS/vX4JuKGLCtj2Otf8j2xk6ZYrgsjQb7YPMB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=B2V/koj6; arc=fail smtp.client-ip=52.101.201.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="B2V/koj6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QY/xXemQO1LJCJxHtMmBUA2IqTaGOMxo5bd4ObKvg7Fa0Myzjc5nk7bbcwurfAZigFoVV5wDtZWjEvn73L9632rqcDwtE/yQgsL3iWI7iEFYM0Ac+qSKb3G96dGcJNKNRpi6hT80CXo1plhGXij6hkxtwLGkEyOeM6eHrXRVEB+LrPPL/qYfSlx20Qe8lHZG+PnTZpAtFOGrA1a6fIf2WgwU/yZ1omQjZNVQZLH7Bw6Q1B8CAlypsDAxesgGhRR+7RwCVs/w9yjsrjFr3DybSgY1n1B0Uhd8ajrrkMr3wpGHNAFk8jezNVc8oquirDQfksW/QdCxbhj8HLpIfpdTKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56cHm0MCr6/D6vU1O+UAlPt7PTHvhWzW4st2G7dYe8Q=;
 b=pQacfm+tTxAL8SliJfzahfeJYR6CrzsNwSbPsGYdq9Bm1+KFcrUPdDyTtP5ld/UndPiWJqA5ZvyNQL2bQJVtP0A1lGLI5T9LGQ8I5qn0WXCdfsAFpFwJ/2oWoS2BsHI6vCjuSIR45bNsdFzlZGA89MwEEcb6IF5CEbXT5dpCoqcqPG0IKPobm4/RvPHkmZzPP++uz5oF5KjHUQdXCNx/Peo/s0UmJv0iH5fwXImF4MYYgbJZZVUcM/eQvMdCqh+38DhCVxqn6yfOwi9eXkvgQ67E6R2by9pOz7/nkPziAw2F3P86qS6jFlfC3LkzJlvL+jhPMTCZ39or63iPKT2NBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56cHm0MCr6/D6vU1O+UAlPt7PTHvhWzW4st2G7dYe8Q=;
 b=B2V/koj667VmgxDhTjt77+0F0EWHYxZ8Kk5RJrJgVPdVhA0XFIpxPyc4zkt2n2JqoeIo5A+IqxdRLeXIgPgCBzU+wwNoLMBBV5PpmjQiR/Ss4iSuzN3BAymB9msBbneeGeksO3eXrZGanTwqqXnHrX9lToOy6XR1NJrVSiMp7lQ=
Received: from PH7P220CA0099.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32d::23)
 by IA1PR12MB6331.namprd12.prod.outlook.com (2603:10b6:208:3e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 06:48:55 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:510:32d:cafe::a0) by PH7P220CA0099.outlook.office365.com
 (2603:10b6:510:32d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 06:48:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 06:48:54 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 30 Jun
 2026 01:48:54 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 30 Jun
 2026 01:48:53 -0500
Received: from xhdlc220353.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 30 Jun 2026 01:48:49 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
	<nagendra.golla@amd.com>, <abin.joseph@amd.com>, <kees@kernel.org>,
	<ptsm@linux.microsoft.com>, <sakari.ailus@linux.intel.com>,
	<radhey.shyam.pandey@amd.com>, <u.kleine-koenig@pengutronix.de>
CC: <git@amd.com>, <dmaengine@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] dmaengine: zynqmp_dma: fix race between runtime PM and device removal
Date: Tue, 30 Jun 2026 12:18:42 +0530
Message-ID: <20260630064844.705173-1-nagendra.golla@amd.com>
X-Mailer: git-send-email 2.49.1
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|IA1PR12MB6331:EE_
X-MS-Office365-Filtering-Correlation-Id: 439ffcab-6f8c-4341-d621-08ded673a70a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|921020|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	129Tcf07USHzotsK2yg8P03CMcxSVRuiKk10QOxYwyAEi8cQWBRxlqTYXnHgJIYTX2pgmb4SfsJD22YhFzNbGE46Goaf//ulB8cml804EP2pOZzw36EIcXq5qMk1WRcNZhE4S7ULgLf7It5ArLmKMK1IHADkKNzMItYLjx+6SBy7+lqDerIOKDGHxdA8toEOTsbppWUSCKKVb5rV8r7+HgXe9xFBjyoKtgFwke+m+dPQ95w0hxmGlIAp8p/kqxxsRXFO2w/SZlv4et1Sh7bJ5o7vdmEFy+Zbp+SKuupQglC+7Ea+da4tQOBBDYcVTbm+o59Tb+zVdo5xDdkGN9wo6nd9gIL2nikrGBZwEg7nfQ8h+LYfk5lpCw6vNjqjfQSp9esq9Vun/qj9Ij7KMSIqdrnwLS5SAM+v9d9UPm4WqapVNv61y2KEXPKPtJe7QPL8R+WK6o5ytfwRm9XKJYZzjqP52FgThgSpDVjjA6SSvj93ce/zcI7eA2iKKFA2kkuAWiP3fFGObwIUJ2yEVt7Nr8XBWuTMTEM2WCGnYmXCwS0+4ySOJ2VTwjV+XpaiB2Da3JKhzMUFi3SILPoz/KOf+YQeSjR+IZqEulitU48oU+gqE3HqYzZhJvvbZndGXAeymNZMsVmy/DXRoAPdx8AUgpcKcWanpFstSPHWsV0SeWkNAdp9iLiHn9xR5Fj4iljmZZXO6Xhjuy7FKfOFjAAU5uK4paeTU8RIUkqL3SsdvOslegKvTKDEcit3wwAyrQTw
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(921020)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	V0q7muEkvgKrIY9wejTw9rbVuGCFZt64lNdTPyT/Pd5xPYO1WLxxYTwQlWnfHI5AVL9yb07OQVPJ5EAoAcrwcKNHrg3ivTqNcwWpwvEhrmPYhddWLlheYDOf9JdUz4GKFHRArVMg+IOpsoeoEVJFZcWvextSy4G3JBd+DkCkJXxq85u0a8RmUfJMZLa+i//ZD5ipx1PFszfR/JxwJWYHIT9nnplm6z28c4vsbbmLjcyBPirVsOi20J0zmc09jMptRcm9EKQU1ut/maLVGFxPd5/P0sfyAkHUcLJ1GPpoXfARCk5z4rlqR8wFge/SKEe0lEA73wrHiGR895rxQ2KzKZNyFc2ugtGoc8GoY2NyuOVKZL1rbCxqmWKUvX4/T5okEk7LuA4+ED5Ea2lA1SU64APfwAOC5Kb90diyv5pVY91L8uGyaYRLCX7YamhgLlSe
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 06:48:54.4647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 439ffcab-6f8c-4341-d621-08ded673a70a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6331

This patch series addresses two issues in the zynqmp_dma_remove() function:
 
1. Fix the race condition between runtime PM and device removal where
   pm_runtime_disable() was called after the power state check, leaving
   a window for the runtime PM framework to change state unexpectedly.
 
2. Update the stale kernel doc comment that still references a return
   value after the function was converted to return void.



Golla Nagendra (2):
  dmaengine: zynqmp_dma: fix race between runtime PM and device removal
  dmaengine: zynqmp_dma: fix kernel doc for zynqmp_dma_remove()

 drivers/dma/xilinx/zynqmp_dma.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

-- 
2.49.1

