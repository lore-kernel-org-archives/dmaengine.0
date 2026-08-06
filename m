Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010005.outbound.protection.outlook.com [52.101.201.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C6F1FCFFC;
	Thu,  6 Aug 2026 12:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786019451; cv=fail; b=PqDXNsHC9DQSXEe2oM6fcY4G8mscPQSEGATshyldildUlbm0tK38VCHORmmJmD0sseA1v5Z9AnOSv9R/POB6V7hF6ftHZfM73dYdxc0rE6EI7UcHJfV8qQh5LPMMcHZ8wJVl/02p54uRKOv4/134fGcp2t16CxkH62V7ORx54Eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786019451; c=relaxed/simple;
	bh=OISmsJuFC794aH5kGl5TPtE4h12m8S6j31gmY5cal98=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r60zY/1kwCK/M6DMSlPWMm2gPEm9WWPu9spyGlOcmiOs8SZ2j7fWkixEKRhyT7McgsJbsJmO09ptF5XI38G/Vbz0kSgM5umBWc1esXdcEskyxCKrOplN65qEbA3FUj6vbtEZWNzk5dMAiGKX3SUNRFkLEhsa2gwBYnKKaq3fqpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=n7bkV6Zw; arc=fail smtp.client-ip=52.101.201.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="n7bkV6Zw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ixMHr2euEPJDj4BLNtKr4JJJNRIknhLs8B4HNrjg1f8pkc6eZx/DVBcXwLz2toBzKJbADhx89DiyReOJQNbEzbDmRyMOAGKkgb6hkqdt8KG7BlMb8/gL0AsKP7YfWCERylVVpqxfrTEdWAgCheq6AbxnEhEtK3IAzSxZw9+x+md1vAiKchqlcaUWQFWJjKdmg3RxQAuLQZ8tpo5mn+j9O8On16vqOYsDMxouqjDQ0IndQjiyyspRHi2VxeFCrPqBrou1m/7umuHqbr7ilwG2JmB7qcNX6vumkgd9GwEyuz+duWZa5SMTP+Px25XrBbp+Hh6f+BVlUJEmKaGKQDB+6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtDrko0b9u2qZYKEW+zp+qQUu01jh71H+e8wcxP9L40=;
 b=nZ0nQNKAADATSN9b/9iqPvqNqh+lPK84QFb5N3Pg+sXWd16cel4UJCUKVbVOHw9O5Kd9EWx4bpK2XVKCkv9xSz9xBeeAl1zIaP+8mYQUkhDckhEG2pIrjSBY7R8m/HSbmfShPEBEpIiXzDZdWTkRvXXoliXI0sWh27B6voez8VzH523uqMZGWa4Q7aL6XwxkeHR9EjrjCphNzxiRQLdAXzfK+4Idn6StR5UhHXKD9F9GFX6gZrh5PMuVA+M1qUCQEpz0SdAqxmkBe55pb0JFwLezRtDjJQClefcfqEFpyVNwBW5fsjd9ZaRUqwjimBnh83DD4Js3mUPO3ylUGNTXJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtDrko0b9u2qZYKEW+zp+qQUu01jh71H+e8wcxP9L40=;
 b=n7bkV6ZwJLDVdlxGDNPWn6P5nhP/dSDAGOJ0+RA7aPY7tDFC2HaVhaSWekhktk97FbnN3xBCPVgCmy1Bw+RV36jJjvFpovl3vwjW37O4fWaEfUMabWZIjuX/SQZMUgtyBhxxJHbDeYlh9s7BwoAoWHE9qaD3nCACkDeZXzT/y8g=
Received: from CH0PR03CA0076.namprd03.prod.outlook.com (2603:10b6:610:cc::21)
 by LVUPR12MB999137.namprd12.prod.outlook.com (2603:10b6:408:39e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 12:30:44 +0000
Received: from CH2PEPF0000009C.namprd02.prod.outlook.com
 (2603:10b6:610:cc:cafe::14) by CH0PR03CA0076.outlook.office365.com
 (2603:10b6:610:cc::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.21 via Frontend Transport; Thu, 6
 Aug 2026 12:30:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000009C.mail.protection.outlook.com (10.167.244.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 12:30:44 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 6 Aug
 2026 07:30:43 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 6 Aug 2026 07:30:40 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <radhey.shyam.pandey@amd.com>,
	<kees@kernel.org>, <sakari.ailus@linux.intel.com>, <yukuai3@huawei.com>
CC: <git@amd.com>, <dmaengine@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nagendra.golla@amd.com>
Subject: [PATCH 6/6] dmaengine: zynqmp_dma: Remove unused define and duplicate IRQ bit
Date: Thu, 6 Aug 2026 18:00:14 +0530
Message-ID: <20260806123014.2120447-7-nagendra.golla@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009C:EE_|LVUPR12MB999137:EE_
X-MS-Office365-Filtering-Correlation-Id: 37791acd-1f14-440b-34ab-08def3b6896c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700016|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NqEf2vrn0sSqdHWQOd1Nseft/xB+BLA0CXqcLUgwcyjIATN/Q3FVheSQl++VtzC0p10ngHW7Tg2eVFNy6VYp358/C5wRw3Jw3z8Fk2/wlcvw7fhzbb+HRbFYpipWl9AFWRqqvmQ/JsCyeESe0Jk7n1mRPyNvpX///aPGsi/1nVcYh+XRGkfU2J/e4jt6HrmiwVG3R6VPs3poQTEUWfqad9nRy/x3xCOHc5GLGYxts2mck8IJXVkWc4XzCtdGJlADKbrvHDV6+kzy6dvCeaaX7rGhgwfx/QSoiK8RkguTGJk2myQwwjgRA9fC+/1y9yzjiUFu+FyzJdN3nJZ0vYijkQMQuImBb38fQ3WbErXF34nT3PP3fpi55IHVZ9a3pTyssYtuX285qxhrQgALC5yW9R10fjZb0VqChKBAYLvv67DF5zBj19V9fJZLgKqJpasCsppMdMbdm2N9v7rXBFPvARGMUjNbVqwYOsisP71YWCcX2GHkzNRFuRzmukRVgA4voVdVs1RSjTu4BAbz8mWwykWKe1xs8faBtyhJ0AxctnrArasZmSU03VIfFw9TuUOIL2KKaDWpgig9FuCsZAKAIU2+JpH0QX/s/XS8kNCTTc/XYYkSXXR0lBvS8KD2hLjRMaorK4kddaUG5jqC/RRsPg3KvUl/5/0YJUXmyq3YyS0veajB4YNQg7XFpJ5GiyMHBsmZgtB3gAd3y8J9//C5IQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700016)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qzchuBRrEEVpeACRAm7LMe/FYGQQMJUhLpl5i32hSEtMVJLranndWN4YvUDtUn823L9EZvxyCxge6i1M9pxp1jk6cgtlsQn0R3TEwpHHImXFu9Gn60WULlB1sAqzvYpw13cqirZivfDLZU4bHMmtT6W2PY7e/eYgDe6FV4VWW/emH9TBLNlzZhIlh+9MjqvtZGPxuxuwRyfn5Nce7rx3iBQNIxX2Y/bGASqk7PnSj+UFEdIG7dibLohA3Rvg6xdkXWIzkqLgZ9OajbrLO9XKng00vokKhakPMG0jYpIMIfryL4GgbQ0yvIU6Qo7RfwBw/ATrSqHemx6SIsIlPI8dPVHmtiKzF33L2wE01OAPk7G/b3hEuyDwjLyQkZ0s27EZtu3OV6vhJE+d3p/bY96o/zoMS9wFFXYXkEbE0NtQvWRvX4opVUrhf09t/vjFE4wX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 12:30:44.7712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37791acd-1f14-440b-34ab-08def3b6896c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR12MB999137

Remove the unused ZYNQMP_DMA_SRC_ISSUE_RST_VAL define.
ZYNQMP_DMA_DST_DSCR_DONE was also set twice in the default interrupt enable
mask; remove the duplicate bit.

Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
 drivers/dma/xilinx/zynqmp_dma.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index e70874d65123..fd2dee4ea17f 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -112,8 +112,7 @@
 #define ZYNQMP_DMA_INT_DONE	(ZYNQMP_DMA_DONE | ZYNQMP_DMA_DST_DSCR_DONE)
 #define ZYNQMP_DMA_INT_EN_DEFAULT_MASK	(ZYNQMP_DMA_INT_DONE | \
 					ZYNQMP_DMA_INT_ERR | \
-					ZYNQMP_DMA_INT_OVRFL | \
-					ZYNQMP_DMA_DST_DSCR_DONE)
+					ZYNQMP_DMA_INT_OVRFL)
 
 /* Max number of descriptors per channel */
 #define ZYNQMP_DMA_NUM_DESCS	32
@@ -128,8 +127,6 @@
 /* Reset values for data attributes */
 #define ZYNQMP_DMA_AXCACHE_VAL		0xF
 
-#define ZYNQMP_DMA_SRC_ISSUE_RST_VAL	0x1F
-
 #define ZYNQMP_DMA_IDS_DEFAULT_MASK	0xFFF
 
 /* Bus width in bits */
-- 
2.43.7

