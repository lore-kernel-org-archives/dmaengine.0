Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.26
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794505704;
	b=mqwv9/IPW6jbE5IVQkyWC0YaFMl5eqRQzyFL354m7n/TYR/zrB2kgZEgEO9Omy/zcc7k
	 J/JrrBu92Ba9DRbicaY4ISi35iHbYbWjd1iF4yvnjQYfuXoTl4Hdx335+XQXdJuCUI0g0
	 4b2afvHiMT/Plkfh38V7Go53Utd8EK5Gt+O3MXvZebD3TKxZTKkRf6wuWDVciqivqxXY6
	 B8br5ELf7vaI8cElo311ZFLowzBPkAPrCPSbrYLkDhW5DPXg7M03ft8mPU8LbY2/dTgnz
	 MCvRHRTPBbmbeapVdKi97+GHQF/slsZ2ZBblA+B34Qxo3e09hMWsmOqw7LrnvuhXf0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794505704;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=t81DjBTedE75MIMiVf4od5W2d7EJxdasTFzSumBugyE=;
	b=yx+jQblxLO+BXnaxYiag14ro1IKpTuKpM+h9WmneO+9Rq/w7v05ZPbIvNkhRMV/QjJh5
	 1GdZQsJbdzxP0Byah+CbT8T+cJ32zjCtdOIKeFL3FKPgSk2f9lEOG6EA+NmD2JqmrtduN
	 +0CToLUP75TNePVoJJyu+x/l1LKVu6AhVG5bc5epCz3b5flrXYGM/CB+hcva+9F0eSQnh
	 XMeBw2OyF5php93Lq78R+XyLG+XiuJEdgRYCAYEQG4CCpg4sTQZGV73XNro4kpN5A/mwz
	 gFTkEOrIc4tj57HquoLkqEUBNfUULCOf/9rE0LmZAx5ZkgTKQsjqiI2f+7SJgEPulsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=A2W+jtT2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.26
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011026.outbound.protection.outlook.com [52.101.62.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8199C606A882;
	Thu, 12 Nov 2026 17:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8199C606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=A2W+jtT2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xrss0AG/N6r46pXFx4HgjHiF9oRJcFKsX54YVhfPxBFaMW8VritVX9tsi0WZVtLprNT+CkxyPWjTvuV6GSk+yzN30+oz2OK3wt4nqmCKLQR5eE+iw+dBzKTod2Tgzc/nowHjrSX0u8zSFA3StzFH1QuPLReB1Wx6hKuvhbCMLnus+z+sVd+YsQ6n2FegTbeBYOdZrgu8tz8jQ4Bmy+dwRwZS+D/XejlXjpA42Bd0xYmVHfZpoWpWkl89gEdhoAWu6LqXyIbYrXGRVJjtDBjboOWYorS5fRwxbucr2sI7R4SV7eJmlxNCy9t8DcFMLr+5DgZ0kwMK3h4c/XotcD2SQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t81DjBTedE75MIMiVf4od5W2d7EJxdasTFzSumBugyE=;
 b=UQDMsWuM79yOLFr8mkL4v4ZU4UlBJBQ37bqcu9fCAW1rxCq0nMYoO3iLE5pDha/ReNqLtGWfbXpPYwScNkucNW09F1i0bxadMCmUkzrK3wpFE0CvV8GUzmVEXbapxlQMCWV2hYh4Nnq0YKbwr5OlHTS07k+AvfQoOBr+/Ttaap3vv4mah5pjpkX1Nw3W4hGZqJwNiQ7qF9wmbsGt2jGYg2nBPtrjcB0L44cIiMDn3WbnQK0KmfoBm55p0EgHI2S0M7mtZEgW0WuS+qXtiGMEb6kJ1tYcwNfQYtziOPliBwcNlRS5vyAZ17NYegtknjqf6EwdX9HXvwx3/K2YZds4hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t81DjBTedE75MIMiVf4od5W2d7EJxdasTFzSumBugyE=;
 b=A2W+jtT2onA87vLb/YJi/VNTbVoauHU0s64Vk0gmLtLmpkT+73IxMVulfA4KJHnpS+ZBXbNdJNik+0YJ52S4pkFgOxk5EqXlO33vZPplbyvT5DegAFB71eYyZL4JYtkTknn7Sj03lqSD+Al9mgiuZy/2rgEPj9EMOdUhcznHjuQ=
Received: from CYZPR20CA0017.namprd20.prod.outlook.com (2603:10b6:930:a2::24)
 by PH8PR12MB6985.namprd12.prod.outlook.com (2603:10b6:510:1bc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 17:47:44 +0000
Received: from CH2PEPF000166BB.namprd04.prod.outlook.com
 (2603:10b6:930:a2:cafe::36) by CYZPR20CA0017.outlook.office365.com
 (2603:10b6:930:a2::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 12
 Nov 2026 17:47:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF000166BB.mail.protection.outlook.com (10.167.252.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 17:47:43 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 12 Nov
 2026 11:47:08 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 12 Nov
 2026 11:47:07 -0600
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 12 Nov 2026 11:47:05 -0600
From: Suraj Gupta <suraj.gupta2@amd.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>, <dmaengine@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Suraj
 Gupta <suraj.gupta2@amd.com>
Subject: [PATCH] MAINTAINERS: Add entry for Xilinx AXI DMA driver
Date: Thu, 12 Nov 2026 23:16:13 +0530
Message-ID: <20261112174613.2101876-1-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000166BB:EE_|PH8PR12MB6985:EE_
X-MS-Office365-Filtering-Correlation-Id: e4dac66c-8fae-466e-93a8-08df40e50e32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261022105027099003|261021121427099003|261028144727099003|261102123227099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vI3pcPc9FRk0EnqOCFTPnR7BvlWXB5sQD70nzZHzIcJV7Uaecfim4t25wQLbKhsugXWwCAqbuOL+OH5vZL02eYHfH1mry7kFJ9VqxkhWtb+Lb7vkyTNYYG9Pn2QPB//PBImXr8uDCTSZTLXBc44qL6RzOVJUE2OSqcCoqlGvYdIidjnifaXwbB1ld8r0nPuS3XRKYdcplyMJ1EqGj5rCq/yVNVoveOccaS1PASTsCM25lU6FaK48Xjn17FxT/1og8uZbhVpE7Bpov9hNnerNciBsYCxS6rtGtcrD0oIWWCYI6ozpJkMZYgoVd9KuXtWAdGLesk4BNLkAwGj+1M0cOaKoj/Jd7fc7I0qsTZkpspjVaJX9q8uge/+cvW8vz7yHpyeCarPjvvAJPYLi22nnDgjVoVEAeD0hSEQKDgN+iGn2LOX7cQTu9TLYq+fqvcyJXxGN/wS1EelavX+kiSKdCM+G5a/g1/TYThMt9+AEUgQep0+aZb57QS1t9KsA8agGAmMOqzsaogTllXoh6FqlQkwSsKJCmNhE+GLjjeknR7Kha9RZaT6Jah8smvZj+KkHvq/Q/DqNGfTbkAfAu6VyBoNm/N5a8NiU81uhER4H5lEddnocrvbEhuztpTLoLbnvrEdNhEdz8z8x1P1xCK/xzJv97FckeQQZFTT7GjBKlYeNRsZ2Nc7Vw7kO0ysuePV06uAw/W87wHFe3aKhFbqrYQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EN5cQWaPh+1ySBVAMFBEnkR5Jd8777khF2Qv3PXqfgGvGtrQwQwDgndeTh4b26r6dhuIw36S8hYSwdTvcWSW8bhoAfnWQ0lKVGG7jqbfKZ14cqtp8VppovHuGY4X4RR0I9t5C166kt+uyD2JTdP7n6ATtTIUAoD4JfIxjoQAmzEJnffe5Oxg5AMqfymaMV2X8b1rZaw+8t1wYDFCkSY83OpOLDaerC53Fp9y/PENgFj/UPPIsXNNp6XWzrtksO2Qs9QNEZSmuycAtIfQnK3rYstUsBkcgFVoGwziFTGIqTHjtsXVyP5G1jLZucJNVmfApwfrAtsq8l6QnQ1iwxKBwloubDb4SmZ5cxly4iyrADmlGoHE6bCpKE5cLgSd2Jp3f42selOCnN63s6b2Eiu5dw4l2+tk2wIR3us6nKMD93FBrHrIfG+JvBj8tnkMgydy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 17:47:43.9474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4dac66c-8fae-466e-93a8-08df40e50e32
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000166BB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6985

The Xilinx AXI DMA driver, which supports the AXI DMA, AXI CDMA, AXI
VDMA and AXI MCDMA IPs, has no MAINTAINERS entry, so patches touching it
are only picked up by the dmaengine subsystem catch-all.

Add an entry covering the driver, its binding and its header, with
Srinivas Neeli and myself as maintainers.

Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..8f75c8cb6acf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30611,6 +30611,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml
 F:	drivers/iio/adc/xilinx-ams.c
 
+XILINX AXI DMA DRIVER
+M:	Suraj Gupta <suraj.gupta2@amd.com>
+M:	Srinivas Neeli <srinivas.neeli@amd.com>
+L:	dmaengine@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/dma/xilinx/xlnx,axi-dma.yaml
+F:	drivers/dma/xilinx/xilinx_dma.c
+F:	include/linux/dma/xilinx_dma.h
+
 XILINX AXI ETHERNET DRIVER
 M:	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
 S:	Maintained
-- 
2.25.1

