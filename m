Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022136.outbound.protection.outlook.com [52.101.126.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1D02E736A;
	Mon,  7 Sep 2026 03:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788752055; cv=fail; b=uFh+ojv7rekvDD2eF45fImkdy6ZmNRWRiZcr9KKFoDzwsQi2X+vs+ZpMny9E4HP/bcaWbXXUjH2ujJ10GgPaLAYMFnpJUet2KguYlvd8FD049wJIplbJobC0gPhhE+QQ6SqZVD6QGuD3MJJlON9l3ypiC43pdCYKfFqRHEBQVZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788752055; c=relaxed/simple;
	bh=3QjZuWxQssVwUDT4GCnB/EuZvObYaHg5MVRbchs9Nrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t6aMVyEYeWnGqc5sO7Cn7aP4RoablWvUZ5pW4Y4KIRV3z+hbrd03GlLpQSI31UFSHwmD5MMWNSc+HowbWZNnawrARd/5uOC/3yXbyPI9LJx6+FUUaYRKAsvIOSrMSfgVd7PznaVGlXy+x7UbFV6gHUBaIMT3G8KhrrOjZkqRtho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgZ+6EojPejomuIgcndcGW8p6ROe8E98cldzc6Puo9kVuTevDDUg2Dw22efd90eav+YWFpkxJbNOU6cPDydhmXTAk7z5FZ3xWQg71c4Zb2c831gHErcHQJ8llpmxMsW3sAx1TKBUUdu4fwUB4YeBoTolQ9QG3qJVzyY3Bo/sc9gOEgMkuS72gr7yaDCXJUHYMB7zu8dTa/4S1EiuHBGNdWqpwXlKsEGw/2//tGIvrrrgQhJokfTrx3lb3MRZbEcSA3mBgmAgdb8DtUNgG33axIaqhnYXK0sV6yRAHOQBqePvClpt4+Eu3uzRpc9DjTYtDk+vYKvpCRvzovJzhVfTDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dtdaA6MCGQ/zR37qYxh9rhEsesea4HZqp7ohj/46mVE=;
 b=LF4nJYdhON1IEJ++h+FXoS0Xq38oJO1LFh9mvM451u/FFKWxWN0VXNIl5R1Lr/FwW61UYMNy6+vwQ5C6EWx8QzSzMZFETzP9pyjdW3zb3AMP+qm8ODvrB8DUquI5HvX5MEOPawF64818Wdc8dqjpLjDcmHJXJu2YeUSkUhZvjJnrqai3KzwQ9QC0TQkII5oY9TBuPYnZEZUS7mU0+WZHBtZSotXQ7e8Ki/kLk6OQ/L7C2APnLG/t2bUK82YHl2A5O8l18BVYL1vvm++v2fN34f5cXQjIXDYHJHZc5wOLWRWxRkk5iqCWjmF0MVFOspcJB9DTjgKPCGx0+wyLC5FmAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OS3P286CA0049.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:200::6)
 by TY0PR06MB6802.apcprd06.prod.outlook.com (2603:1096:405:11::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 03:34:09 +0000
Received: from OSA0EPF000000CB.apcprd02.prod.outlook.com
 (2603:1096:604:200:cafe::70) by OS3P286CA0049.outlook.office365.com
 (2603:1096:604:200::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 03:34:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CB.mail.protection.outlook.com (10.167.240.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 03:34:06 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C69FD4092116;
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
Subject: [PATCH v1 1/5] dmaengine: arm-dma350: Fix source trigger bit
Date: Mon,  7 Sep 2026 11:34:00 +0800
Message-ID: <20260907033404.596839-2-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CB:EE_|TY0PR06MB6802:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8fa26750-35e7-4488-151c-08df0c90df53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|7416014|376014|36860700016|10067099003|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bjkOWV6X5xhnxETaxk5NdHZiOzDbZHJiUvG77sE8iZAN/cxXw7LMZ0BlU4Z9A0YDndI52NkumN2IMZ9wHiDGrujafx7uLSDx0pNQ1IpB3UccWVKBvsmw4esNJz+hR6Gbr0i6elyT9pYvm46l89bXGEuqDUEH/UMDeECeTm76dF7dZknUAxCkyzNNubpKdGr/C2Gndmi0KV9CqEduuE81JipNS3PXk5Suc6L/OKq05YS8A4h9UQfqGA3Jj0gyIXC+pkyrYerRUrkC1He/TMPvW28jwBngh2XEkNEGsCMFMpWYld8HJhzJ1Jfssabnl2KwO/9pa6g4FvccHG6uAfDeW/ZWti8otZE2ZX9WRTsRxXFG1TNkG1sNXuxJAYYBcFGrHtsfa3RBpuUzApIg/EewK87JeXir7F5IDxuqVkC3My0XSKOzdlEL7sF4CyrESxVZJRTKNLDX7+J9OQZaECcKUKoVLQxNrpKHsJq9ebXRGrCv+1krDhmYBvgLmnCcrEPg264/rGGZt9NljyvlCSUG92VpF0nUGpGd8GOFSeO+UrZyqPmpWU5zEBpdwedsBxDd8nkZgFFKiKcvlPUXZyPpGxAl7uRbN5bUOTxlwOkC44HLfn71O6kujs3E3sbyAfFmus+Zrn5H4CR4XWYZRVRGUxX0RilR7RVxzVf7hSrgmZeWKmRF5VHr7rMbyvoIOQZR9MoRywoCGXB6I6jZao/jog==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(7416014)(376014)(36860700016)(10067099003)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VUSkFVPHhozdcdzHLEjd3kES2D/ABQMiF8vda2v0zB6dgsCUSPYVrqyHOc7s+F8bjE3GEOuxi2FqHeqbKjiDVGrlkOPctGvBvGX/631t8APgbAIH7aUMPClLjkKKKHD97AiIc6eW5Fca/LTksoYwoZnDKHA9oCA0GkjzHtgEPFpTPU0VoXDQ1x/jGTooiCgz4rQre3Hxt2uvF5X7W/NkAMZZYtf8zyUmSvsrA9SmAoS+pf7FzxbHGonbIxzq5u8NY1/EQO6EyfUxYwM68GvmEKWOWTBCi0N3bUWfUDJwsZ0y1ycrI+UbY5vYplOS2Tmu4KYyeZ5ycNYkKMdu8sc/5glRK+4IrYdxmo01Ev1rVoDzt/9d56gaCLavMMIlv80akPA3UWbJoKDrCiFbT911bwKiTX4xjNXu403/eHULkJsMnN/bKF+yz1XUHc12oAOe
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 03:34:06.9279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fa26750-35e7-4488-151c-08df0c90df53
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CB.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB6802

CH_CTRL_USESRCTRIGIN is the source trigger enable bit in CH_CTRL and
must use bit 25, not bit 26 which is the destination trigger enable bit
(CH_CTRL_USEDESTRIGIN).

The constant has no users yet, but enabling the source trigger input
would silently enable the destination trigger input instead, breaking
any transfer that waits for a peripheral request. Fix it before the
first user arrives.

Fixes: 5d099706449d ("dmaengine: Add Arm DMA-350 driver")
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/dma/arm-dma350.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index 09403aca8bb0..4e17130de6c8 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -63,7 +63,7 @@
 
 #define CH_CTRL			0x0c
 #define CH_CTRL_USEDESTRIGIN	BIT(26)
-#define CH_CTRL_USESRCTRIGIN	BIT(26)
+#define CH_CTRL_USESRCTRIGIN	BIT(25)
 #define CH_CTRL_DONETYPE	GENMASK(23, 21)
 #define CH_CTRL_REGRELOADTYPE	GENMASK(20, 18)
 #define CH_CTRL_XTYPE		GENMASK(11, 9)
-- 
2.54.0

