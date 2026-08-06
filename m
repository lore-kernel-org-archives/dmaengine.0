Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011000.outbound.protection.outlook.com [52.101.57.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968651A5B9E;
	Thu,  6 Aug 2026 12:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786019436; cv=fail; b=dTd5GfRYXHthCY8WPjJpD9OKBpDAIFq5ns3aukm8+nC4A0PqPur8Y+nEtJGk+8XLyxGIHwDjOY5Uo+TN+rCIIy1EmsgAzm0uSv3Wd4apDHu44iPfSl/k2o7zBnRlp+0oPvv7I4MGGeQ8JjibF/H+eoZvzeDIWQ/PzSMNwyEtsAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786019436; c=relaxed/simple;
	bh=V01T2JCUmHJWV8smZozAuZ7XZ+ivYKtR8YwI4l3HPWE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b8hMI/GWiWeB19EKepqfdF7JVuBSgLPoOMJXFFTRhWhA2aSmiypIJxXm6KUS3frAXFXl/PljP3cM0nSz/b5bd1Um297dDZILj5ym0C24zGxTYgezpyv9y4PZpUUzQ7yJqov+rgry2CYhXRC/n+Madg8j0u61nEHisI4Oh9pQsss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YQL36G1D; arc=fail smtp.client-ip=52.101.57.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YQL36G1D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVsdIk97ep9E2OCyymqAgq/zSLT4JaEyzlueHhO8h6ATXk8/todS+bPnpr2yd9jU/fzStxdEqkUfYVafDBCyekmudCVzZyEJF6F4CPO8F0g8HygRn6SIy/0HjYZZ7T/Z9zfZMU5MQhJZUvqPlvrBI523NuWgs6VIPOB/9Zpu9Sxe//O7f4jSADVmmfHSsHjK/M5rw7fXrcOWn/xfl34egAbHLdwuMumRQoq64e2+eE0tBrM8XyPBYl96Y97DQJJxfIXFa5pU5JQDyMs8KoHgd9PCpkzBnX48e3wi9Njx0H1ymelX3Ha+Umu/5jTfG0NEH9sJAHaH3wPNFMD2TGqrkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMr2PzXjVKx+mlfzQpG6ywcXQJeEdC5pYHaynlBCWCg=;
 b=DM3JmeAuCcfLKzmSC7GLHfJ/57AQW6gfbFkyuiT1m6pbuvn6HyXJMczWAlv0EfnWL71P/vJUr+FJPX1W1Q2ihBZA4z0Q/pse2bi1rr6STiYV59CfBAZroa85wBw2tQaIF2u4KjaPFrwnp8NYs+qnQ5yyPYX5BAY4zR84x0nzi2Q8dqQNchwkJl9ukjwwcPbk989Mf2FKo/Ew1IA5i8HHNACtf9poZnGvL0RqWS7x3Sm2ngDHHlD4QoiXesJUGBBYSCUfIovrLb8tXy06+1d3mgTXTrqtdWbkI4JwdGe10upjFpu40hvKqk0fpWfVyiXleVlQPyYKXxa4AowN7Z8YWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMr2PzXjVKx+mlfzQpG6ywcXQJeEdC5pYHaynlBCWCg=;
 b=YQL36G1D75GzhGgeUqaE//yASHyoCSlzdvai4ZX7juRT9I4/zZw2RaKin+BljpWcoG3KHkD5o6aqEso0ziU/0k3uNFqJlEZ0ylFq9fXgHXMjvVhjLl2a24Pkt94Xb9qDucPIlw4J2wd753h3bmk/eCl3etT038+JvApMc9n+LEQ=
Received: from CH0PR08CA0004.namprd08.prod.outlook.com (2603:10b6:610:33::9)
 by PH8PR12MB6697.namprd12.prod.outlook.com (2603:10b6:510:1cc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 12:30:24 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:33:cafe::64) by CH0PR08CA0004.outlook.office365.com
 (2603:10b6:610:33::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.21 via Frontend Transport; Thu, 6
 Aug 2026 12:30:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 12:30:24 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 6 Aug
 2026 07:30:23 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 6 Aug
 2026 07:30:22 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 6 Aug 2026 07:30:19 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <radhey.shyam.pandey@amd.com>,
	<kees@kernel.org>, <sakari.ailus@linux.intel.com>, <yukuai3@huawei.com>
CC: <git@amd.com>, <dmaengine@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nagendra.golla@amd.com>
Subject: [PATCH 1/6] dmaengine: zynqmp_dma: Fix alloc_chan_resources error cleanup
Date: Thu, 6 Aug 2026 18:00:09 +0530
Message-ID: <20260806123014.2120447-2-nagendra.golla@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009E:EE_|PH8PR12MB6697:EE_
X-MS-Office365-Filtering-Correlation-Id: 3749d5f1-fbfa-4506-a7fb-08def3b67d0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|1800799024|23010399003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PIMYzeWXFeQnQPsQ5gOt2dUhIKDoSWlea7wWx9uFYxJgVzVGzKimaoYB0d+BKkywngcdWojG49q8hULWjHC+Vt/EK6N4x8wNHNjBoBaYzkVomDdErjTJTkwJOpLprjbObwOCTmwxPAjvuhAg3pOFGFA9i4dI4rqHJG1m2GOFTPoROcgAa7ozN0ZbRg7L4amNqQYOFrQK/OJZ1ZLjDQ63r50DlH09TfR1Sc8YZHjiP1JxYJZdf0SEYZylZ6rX7B/6Y8O3yFF42LGlEkRPjGSiTjgZPuVKRGVQFuircV2B79qODVJuLHkXLk0Hs4mK4xcgayy9f/LUMus8L2/pHLNQ9aX4ILMLG2S88jCypyPd8VzDvfa4JrWXNldfdRl/3WCaZXkJ42BYLyP8B8mjnOxw8/dgmdkTqngUzDCrcdX4ydTZ3kbQQCAftb8jCakwFCcDs1b8l+5RCUuktVzhqxGX4msyHP3xD0KCWZRSkAArenT/McWOFmcucMbgVhVqeS5RMBnXRwgOg+gpw5h0ISjxwqdw4MkvHb0RJJyw0FiIo78WWC4Urur4IpwmZ4Pj/8HggwFwnVAwI+qRSnC7djP+hKYctcwUIt2IrwSbmIpaAYIVtV+27zM9Ii8OROB7zKrzXjlpkOnQDAiO+xKlo5cIFu2x5oFdvtpVuxtt0+cVFa9r9nl73WLBWDFk5453rD2FvO+9641Grw69AMFRgZKnYg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DXkPpmNCD5fNWV9ZxCPR5Lx5Da4ITANtYJganl17CqkH5EZ4CFXhydGINHY4K/McFTMrmbIFtfkOZndTGKRsJXbOJv7bNVdLk47LGjLF/CNvBPhBK8DnenHLxl9xI5DG0PauxcQ7jwt6tqbY20ou/ctQNptghNAs6CwrSD6pULl3SwQFUF2vd8/XT5jKpCeS6lDCV++QdYD0HtD5PuFrRAVX85VRA+LlRu/9Sqm+ztXS0Aqoc0gtJAshUZ/rqLJ5YtzZcWHRScyyQQHeZu7fu6XSbgdhtD0LqwFDSml9TihnlZKjQELhg0MUG8eZucDJDUTzf7uVy5KnwwCyXVgmY2JSUeG+wNsPDryfouo45sXWVYo/K+7WRa39mtd8PrjuX6UW8qsi5jMxVdOq/aKBGSz49STEFjJEXhdqpJ6UOdAPqRhtTkoXsf8rtToHWTXo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 12:30:24.0317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3749d5f1-fbfa-4506-a7fb-08def3b67d0f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6697

Channel resource allocation can fail after runtime PM has been acquired
and after part of the descriptor state has been initialized. Without
proper rollback, the error path leaks a runtime PM reference and, on
coherent allocation failure, also leaks the software descriptor pool.

Fix this by balancing runtime PM usage before returning an error and
releasing any partially allocated software descriptor pool.

Fixes: 8982d48af36d ("dmaengine: zynqmp_dma: Fix PM reference leak in zynqmp_dma_alloc_chan_resourc()")
Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
 drivers/dma/xilinx/zynqmp_dma.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index f6a812e49ddc..b7c561280694 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -483,8 +483,10 @@ static int zynqmp_dma_alloc_chan_resources(struct dma_chan *dchan)
 		return ret;
 
 	chan->sw_desc_pool = kzalloc_objs(*desc, ZYNQMP_DMA_NUM_DESCS);
-	if (!chan->sw_desc_pool)
-		return -ENOMEM;
+	if (!chan->sw_desc_pool) {
+		ret = -ENOMEM;
+		goto err_pm;
+	}
 
 	chan->idle = true;
 	chan->desc_free_cnt = ZYNQMP_DMA_NUM_DESCS;
@@ -502,8 +504,10 @@ static int zynqmp_dma_alloc_chan_resources(struct dma_chan *dchan)
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
@@ -516,6 +520,13 @@ static int zynqmp_dma_alloc_chan_resources(struct dma_chan *dchan)
 	}
 
 	return ZYNQMP_DMA_NUM_DESCS;
+
+err_free_sw_desc_pool:
+	kfree(chan->sw_desc_pool);
+	chan->sw_desc_pool = NULL;
+err_pm:
+	pm_runtime_put_autosuspend(chan->dev);
+	return ret;
 }
 
 /**
-- 
2.43.7

