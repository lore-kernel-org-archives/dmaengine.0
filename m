Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011059.outbound.protection.outlook.com [52.101.52.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCE439282B;
	Tue, 30 Jun 2026 06:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782802145; cv=fail; b=gAw8ZN73FwWQaWp7tN3KVCu5tgpnXMES7ZndlHvJ1J3tJXY5txkg/+jDkEfE5B6AMw4N2+ZQovdRY7AtekTuMvJM/vq8mN8qWst4ElZXSzHsCAuJ/nZVME/QJ+cgcCBbnBbHNZdyzcdq7/Y/il+GkQ7Pc8R0KFowgEgY7c3t9Mw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782802145; c=relaxed/simple;
	bh=9m/R/3lBsMcrG5yRG1WuhGk+ezdfdQi4PKW5Wn6ScEM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tepR76bCdqRQ+QbW2HNzWoFCcgeUmU96IOTk7ocJzvtJaIlxLdW3ES7h/nFqJ8p6nY/HF4N9CJfH0TXN1iO1d4Zk++nElECbjN/vpT+YbjnsztR7v8QqeWqoSUgwNORrjLtxh+V2Kn/gLZJCX3MNzkCi+DMX5PKXiMa4Hkdvka0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ojgUtW/s; arc=fail smtp.client-ip=52.101.52.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ojgUtW/s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y64xcGEYLF+hBTXOM2BI4jnH/hP2cNjxLW+8uuyGsM+ely5QC/nJsPRZXJpe8knB0LNePYHv7UuymWtQOpAbi+lXfGwQTh79vecM22P/CWVvlHGgy9BRPQ4hUgTLwyk5MPpYD3INW0UPteHjiDpS4MFnnkdbL2rGs85qz7YcN+tDc1432GwoS/SeOZSwkqwU2e0E94JmWxYonm/YVvDFXf8fnzhj7Qk9vcROe4L6nRuu+pK1bcLCVey6lhwrwZi23YW0DnkPm/DCtzs6DMt97oPMmvJ8GF8mWLKm8KvR9geqzCQJMVXMuyea38rmOOw+KLA4ze0kLyFiTXmgm5zDpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThcF5tK5skTZi0OYul1roUUnw3jlZL9ZfmWaHqbBmZ4=;
 b=GqHMk9kadGV9ara7fgwHrxIJdK5kPcM/SFZUx3FbbX/MjsoGLQ4B4OlsT1udPuXSOMzy7ABYT5Qc+nhQta3QdJFIxQxVwImE9lK7Jf0dX47unw/MIc/hyiY9HzYYa5CsDOIIGyTI7GJ+lEaUe3BdBT4dqpugBCb6oyvBHZb9J4ekMNwOZ/zqJavBu64aYcL39jSFdXsNU3QSYnhGHipTDmxYRrACL+9yAddkOkOmeRpkDVKWmNWXg6XxX5wtZy2dtj30hZDAOKdImW7uS12v+D5cqr9Mdy0TVC5bLzJ39eWZLP0vqndLrvdfuN/M3dh87CtBIp7Y7JJpEPSOz0WCcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThcF5tK5skTZi0OYul1roUUnw3jlZL9ZfmWaHqbBmZ4=;
 b=ojgUtW/sI66gOmplGwd5sHNFjeM1gKMtIVvAAxUPal3MVan15o8kydw4QyQPk0X/T+t4yHC4oOFTMVTFz1aDr7TN3Lf/N4JD2z/BNX+hHK1nzIR/0xCwz/eLIHhh4KLzT3ZxmL3dheINmI7EXTTqWlqrgVwlkCMGXJ9TxLgjpuQ=
Received: from PH7P220CA0109.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32d::11)
 by DM4PR12MB5987.namprd12.prod.outlook.com (2603:10b6:8:6a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 06:49:00 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:510:32d:cafe::5d) by PH7P220CA0109.outlook.office365.com
 (2603:10b6:510:32d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 06:48:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 06:48:59 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 30 Jun
 2026 01:48:56 -0500
Received: from xhdlc220353.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 30 Jun 2026 01:48:53 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
	<nagendra.golla@amd.com>, <abin.joseph@amd.com>, <kees@kernel.org>,
	<ptsm@linux.microsoft.com>, <sakari.ailus@linux.intel.com>,
	<radhey.shyam.pandey@amd.com>, <u.kleine-koenig@pengutronix.de>
CC: <git@amd.com>, <dmaengine@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] dmaengine: zynqmp_dma: fix race between runtime PM and device removal
Date: Tue, 30 Jun 2026 12:18:43 +0530
Message-ID: <20260630064844.705173-2-nagendra.golla@amd.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20260630064844.705173-1-nagendra.golla@amd.com>
References: <20260630064844.705173-1-nagendra.golla@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|DM4PR12MB5987:EE_
X-MS-Office365-Filtering-Correlation-Id: 36b0e6a2-8597-44b6-1786-08ded673aa45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|23010399003|56012099006|11063799006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	QfypDy6UcCGmr1tBdMrUubqtN3F4DJqNDsaTHDoHEf6AcOhokPWUME/eSFT1QqxWBKSS82xRZO6JEb0p+ICbmhH1c2GOBogJRyolGfpy1Qm0aiy2Ziy3yZUJ+icKuqxAFE7rwXv7Yak+yTX/qaZQw/n5mO+Otc/ghMNI1KEeLLt2fwbv6a34tiaAceaY4xtfdGSEX2E5vKs9DJEDYaLy2TjipCmAdEjR4SEb4SXyuP7NvFM/uISr3OOevUWICbjDep75YMXDdMNHbNwlFo40CIbTiLnynWaT9AYi21vEjY3Jekh/Xn3xUhUm0Zz94Iig6zPeilTND5e5c4sSxWNdDAhIyJMifw7IxqhqFnywFkkvE2REGVUXEgx641XEGDSUerdo3Yj9OZrRqHO+kf3+b/rCo9SglBlxOZFDN5kMILRxbqI1aG+7PQ1IVeUQvXSWmuHWvsXtwh+RQ4AxrBKcH7mA4Z9ss7IH1yKD/6XMpsUPggKkKISXYZRtMWuTk1L/4Lqf3oGheLpoxe0weFnYV9OWfB368CNV8anAUK+dAzTwMblrxKHibociNX7DTlj3JtHbWIF6UlRjNnVMJ6Y6WxoXyS3EQaQ3IpC8Jn2UF6gTQLE7sMnZy0Rh+6UVQt9+dUHogeiAb2vRkSS3ajPO9FjIxx/BkG6FusWIab5eJah7j1lqbD6YXsYz26xfJjUxN2CKwIIDskftABqD5+lY8rhmb4IFMQo20IQhOt9Wl/29veImPXMDPcvl+K2JLyxC
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(56012099006)(11063799006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zyoMtmXB7O0RUPzPetlpGLlewkKP6/0kiGVmH7un5diJ2UmkYVBvSfL8NqCSvLKzRq1uaXW/lesgbD/3nYh7DMqoG3sFyH0zZZ8zBFlWd4MzVWou2Rc8R5zomdp27EXbuXYl71FpVyFYdky8LsacuFwWv/MRae6qbOxe34UAGwCzrZsGT2MET0NGoR7fBwbFEdS+3mWQEuQ2zONLET8O+7EodThjnA8VWP2pj1AJmiTHRRX8LnTXEPdMSEYVceiuNZwEODJMYzdMUgXLCQLwKdXZaDqvLsMOK2awR6+G4mIsPCI2SK5s25lzt9dgeTcuGSAEhAEmWCaWxR0/yjykaf5DBrs8CjIEV0Dgg87tYj/nqTEc5l9izqBcipySjcDFPC68q+iAP58Qswdm17htJHRzXrPJHVHWzPbT5M3WUCVCRcjkT0x18YVfe3J9rISd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 06:48:59.8789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b0e6a2-8597-44b6-1786-08ded673aa45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5987

In zynqmp_dma_remove(), runtime PM was disabled only after checking
state and doing a manual suspend. This can race with runtime PM in the
remove/unbind (rmmod) path.

Disable runtime PM first, then suspend only if the device is not already
suspended. To prevent any further runtime PM transitions.

Fixes: 72dd8b2914b5 ("dmaengine: zynqmp_dma: Add shutdown operation support")
Co-developed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
 drivers/dma/xilinx/zynqmp_dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index 1402331f7ef5..26f097db593d 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -1188,9 +1188,9 @@ static void zynqmp_dma_remove(struct platform_device *pdev)
 	dma_async_device_unregister(&zdev->common);
 
 	zynqmp_dma_chan_remove(zdev->chan);
-	if (pm_runtime_active(zdev->dev))
-		zynqmp_dma_runtime_suspend(zdev->dev);
 	pm_runtime_disable(zdev->dev);
+	if (!pm_runtime_status_suspended(zdev->dev))
+		zynqmp_dma_runtime_suspend(zdev->dev);
 }
 
 static const struct of_device_id zynqmp_dma_of_match[] = {
-- 
2.49.1

