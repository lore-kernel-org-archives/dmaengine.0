Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012043.outbound.protection.outlook.com [40.107.209.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025BB1A5B9E;
	Thu,  6 Aug 2026 12:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786019441; cv=fail; b=F/DJEhFhiavpz1gX33qWmQHkUBmKvPKD6q2XUY0Y+mD2T4MZ6WVeFdybdCy1vk3fMD+WY131D1Hu6f/qG6dx50VLRVnb65Xmbh/XkYWfsHYp3MNbz54qpU5uPI9SHOsONUMhwurnpSnCJ+BN8xpYIqGcjxIYbiO1FLh7nEFmL6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786019441; c=relaxed/simple;
	bh=nsYAJR5NfHc7wOmytKL5IOeTdlI0/UMrRAsw1tbjpzs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nJ/523+c26UDHGAatmz7m5R8puEnfZUdfYWIVgkcu6bnlUrPPzuEAf2JFUJ60vzcrgIuvWm6d25X+wmeUAuOMGF6gQKw+8MINlilnayCo6t/2GwkelHDyol6I73Kbjz3vH7Kww+kAqt1UsMlNJi0/WNyQlM44MnCvD0DKlAd+tM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rlCluOU2; arc=fail smtp.client-ip=40.107.209.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rlCluOU2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=toCxXlA0qtE9lsYg3BAPqm01lTmfEmtZMttu/y1X5pvz2seCWGFiCcjMlnGs2+njWYsB5SQVyANUIUK3Zh0PIcEbsY4dJa6ZAzrIUR8VQWnWDOZdflymeeY3SHqMmBPzZOxIS2ACc4zn8rQ7B9alMl8/MRNErrIbZJSs8GcYL6gmQ8Cpdz6Y3q8xOnaIzSib++BLHQWAR72cEoT3sS7AXq654VVtpYYNjwGutlykjviLaJjxix1DtQHA8taDMqFz0KX9aCmFdKRSKBhzAJjz53aK3aGE+wlVdOp20g7LJJbd8CXTpFoPECuGqVIx1WaSrPxgLCtsxXc9Z+PYa7/x4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZjFZPmHThjK7DlIeLngIq+c6rm361d0lIEUlIr/zyk=;
 b=azDPXbiNqn0RuPZ9ramDoT4/ujUFCyyN3GHpJYRIU+0u13H61R0JiL0hM8H9IS61Iir5XELsqPozJSGTUTIXszqtJDdrSZ4thq1WsyOTaJjp5GU+r5GpHkfMW18gyxfJq3WdkI5iz5yx21EgZyDSZFbCHp5LywqflBwPbCRp7YCC2iBLqwLYJOhu5Po9JZXVVUtNvppfCceceyfax+4N26N5ULf2xcWbSimpwF5PspzqdvE0IWQUvLq9M5ZTZaBxyaFchoq268SGGQYvoFvPoxtFfcIKqmeExdhzchd6zPwtJiuuL/8x26FsL3bg1MA8PXvD/SjmEVYNFL/HBcX83A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZjFZPmHThjK7DlIeLngIq+c6rm361d0lIEUlIr/zyk=;
 b=rlCluOU2C2kxJXArIXEXzfY+/mHvZc5kh5NxjmqR7S0bED6ZQNmWs+AlNAPqxcvD5+y/cUP9NS2oiWGzm3ZD/CzI3Rf8siDYQS56Ctp1IhsYoFqfXyqxtJhnsJ4LYpZcf9oOpGG2hmIuokbl9t4v9gXXY9zzIqVG0z6uGI9Ni4s=
Received: from SA1P222CA0007.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::22)
 by DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 12:30:35 +0000
Received: from SA2PEPF00003F66.namprd04.prod.outlook.com
 (2603:10b6:806:22c:cafe::3a) by SA1P222CA0007.outlook.office365.com
 (2603:10b6:806:22c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.21 via Frontend Transport; Thu, 6
 Aug 2026 12:30:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003F66.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 12:30:34 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 6 Aug
 2026 07:30:32 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 6 Aug
 2026 05:30:31 -0700
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 6 Aug 2026 07:30:27 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <radhey.shyam.pandey@amd.com>,
	<kees@kernel.org>, <sakari.ailus@linux.intel.com>, <yukuai3@huawei.com>
CC: <git@amd.com>, <dmaengine@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nagendra.golla@amd.com>
Subject: [PATCH 3/6] dmaengine: zynqmp_dma: Fix stale kerneldoc comments
Date: Thu, 6 Aug 2026 18:00:11 +0530
Message-ID: <20260806123014.2120447-4-nagendra.golla@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F66:EE_|DS7PR12MB9473:EE_
X-MS-Office365-Filtering-Correlation-Id: e08c42a4-ed09-4a87-9dc9-08def3b68380
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|82310400026|7416014|376014|5023799004|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kl6lj8S4wphHHctW2HBqcpC0rQcE2EH/inCUSRb4SgvOuzb+Ahq3jUbNfsmk0eBlSEkR/Y5Zr28/oTXYJD3NI7EKoOmqRcxs99HmeJPCkAhorG49Z1szZs1gXc7nZgV83+rKQrNOXO4t2a+D2EIN42ntADHs41fpMl+88LpH7BdqCkEZL6BqS2TM5RYPyG9IJXVbcPTrNadytdv9yjdKDOkzt+QNe/dJDp9mcAtTaUgU6lVlfIH5Ko+HkNYGMNcCGgclp2R/t+2CtGNCURlxSAzUOPCAHLMlDtQbcghwaLSb6Knrh9aZYw2V9zgXiSErlQ+mj/qySFvl5dH3al2qoG+tem2sgO/ltFTZWDmvdHVoCGX/pkP5eL6vvkBCwL9+RNP4yMCQ6AjKOIVRS5d+oNrjxYCrNnuo75Pc4UxUIeWpe1EGYzYYlQ2I5L0akHr+SM96wplG//12mzfw0xbp45sudmanyg0p0Tygi1H0pyOAhgOJv3QnU+1wqBmsr1yIhfea6D8nZYQg3crqA1mD2J845eYK+sIJnTUBtHfJ8U+xNuKj0pBhK/MYuycYHKOW/krs6wvgCY98HJrwOVejwPHOcaoPeCqRt0p8mFF9J2TtkAYUJy0MOnzI+Wl5BxBUfvwCWljNVsiDjOjfqwH+sqAYMVvu0i0AMrUYhAY6IMYCi2xGCEwZyit0onzcQTuaG985gcmm9ec4hmECLz/cAg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(7416014)(376014)(5023799004)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LndDt5E6ktYWbpA0YWINaldwl3WqzYeRqKmD9e9L4Zo0J87+7qpMbmBKeW3JSzDKcA8dUuhcqT+Irt7ciWUu9QGUHolqwZmHlCH+JOZHKLTOlSyR2cPnr/7JAQqbkXmzRmAhNESZ14DPCWRCLXC9NobluviIHkIp/ox5Fw6Epbl8Us49L8R+BHlIXz0NqNTH6HQErpTS0DYigsoAg/CxYbo75J+wRbwmEoRYEM4qfOchcWqbv25+vr7Iy6QyF6G9FdDU6MYmzE3t1O7l2R4PyOf0fm9XwEYLrzIat9juVnUbcmnfsOtJJp+Z4xd/i5rGJSx026ZdgszZs3ZGLZF17xZzUVQzT1KMpVCdj1iHUiT1NM2kKQoK2hCZluf6eIs+SGhPqsqf724xEKhlXSLju1KsJL18wVic3b+cGabm50d9J1RAoOBRV1sZgQxyrVSK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 12:30:34.8215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e08c42a4-ed09-4a87-9dc9-08def3b68380
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9473

Correct kerneldoc comments that no longer matched the code.

Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
 drivers/dma/xilinx/zynqmp_dma.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index f7e4a177bd17..c5b05fd52e9d 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -208,7 +208,7 @@ struct zynqmp_dma_desc_sw {
  * @irq: Linux IRQ number, or -1 when not registered
  * @is_dmacoherent: Tells whether dma operations are coherent or not
  * @tasklet: Cleanup work after irq
- * @idle : Channel status;
+ * @idle: Channel status
  * @desc_size: Size of the low level descriptor
  * @err: Channel has errors
  * @bus_width: Bus width
@@ -435,7 +435,7 @@ zynqmp_dma_get_descriptor(struct zynqmp_dma_chan *chan)
 }
 
 /**
- * zynqmp_dma_free_descriptor - Issue pending transactions
+ * zynqmp_dma_free_descriptor - Return a descriptor to the free pool
  * @chan: ZynqMP DMA channel pointer
  * @sdesc: Transaction descriptor pointer
  */
@@ -617,7 +617,6 @@ static void zynqmp_dma_start_transfer(struct zynqmp_dma_chan *chan)
 	zynqmp_dma_start(chan);
 }
 
-
 /**
  * zynqmp_dma_chan_desc_cleanup - Cleanup the completed descriptors
  * @chan: ZynqMP DMA channel
@@ -908,7 +907,7 @@ static void zynqmp_dma_chan_remove(struct zynqmp_dma_chan *chan)
  * @zdev: Driver specific device structure
  * @pdev: Pointer to the platform_device structure
  *
- * Return: '0' on success and failure value on error
+ * Return: 0 on success and negative error code on failure
  */
 static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
 			   struct platform_device *pdev)
@@ -1042,11 +1041,11 @@ static int __maybe_unused zynqmp_dma_runtime_suspend(struct device *dev)
 }
 
 /**
- * zynqmp_dma_runtime_resume - Runtime suspend method for the driver
+ * zynqmp_dma_runtime_resume - Runtime resume method for the driver
  * @dev:	Address of the device structure
  *
- * Put the driver into low power mode.
- * Return: 0 always
+ * Enable device clocks.
+ * Return: 0 on success and failure value on error
  */
 static int __maybe_unused zynqmp_dma_runtime_resume(struct device *dev)
 {
-- 
2.43.7

