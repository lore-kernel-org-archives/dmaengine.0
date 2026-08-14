Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012029.outbound.protection.outlook.com [40.107.209.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB0435CB6F;
	Fri, 14 Aug 2026 04:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786683409; cv=fail; b=tcCaE/Pt1xFKJfdQXpJB/RdboFudkfAWuJ13JCdB0QH0m32IvwXyd+1R7HypuBb/XFPXLah9ru085PKp8nSINtyuOfZ2YVY/beOQVGMn9IkiEd3LcBfQs9MKGGXllw3FoePjrxurCbntgMaIZr2PvoA3p6gy4OwlzXZfsI3g48E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786683409; c=relaxed/simple;
	bh=1KiH1LO+H5txy8jfqeuI5svWs0OVzDzCDsEIJ1dKCJE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DyEPpWRGGreD3iQDPpbXWxlas6zUz2jeovEk6R/SuygAqAbhtyLuO9WwkrT+iXrt1FpsLSG+7I397jlwYLnx/nIDD7Yu3ehelYJuRrFIgSn12o+yRkTdOthSWufwC/5E6ERazauKE0QOVFD4ZeY4QTQt/BFuBmi5vRq0IEuR/Hk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AMFTL2aB; arc=fail smtp.client-ip=40.107.209.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AMFTL2aB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edAokBGtySjYmALgeGbzpL/I3euI+PAeJbCTdX4sLqgdqdbFzK4EDOUxPaxnEMhK7B6N5hGBwF8RFJJnVIpAQj3XBAIUrrYqQ9+GM9Vh5P1FNs0vs1J2vCYWV7U5aInuUbLDhj03vNSFGNylvKICmhwcIfgwt7XoDbg2t88xV7JWL2oJG+1STQ8Krxl72d6DGQ1z4H89Vmn3NOMKPCfE7ke0ereraf589j8eJ+8KJWUru/vcownlrkA1M4Yexk05XKdgKwI/mTs2sm6UxqSzX6IT/YI6U3MKqPcsUjQ3u5F8aewLfCfSZosIeS0lnrnvtzaCRNMmXPvMzNJy5zwUrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKEQlEwZMjKmYBgoCBXyrvg9G6ParjLNFQ61kbn3HyI=;
 b=DTLDrpYbXCgn1TV4DAlty0VHe64Czk51rQAstQNqTVNPI/Pn/0CNfynAV5ql8iTdfPkr9s9oTuAEvOVwLHs663ovXmd4FpUQNf7jn61ZABcwz/Ip+BxMVHARzUiiYaBoFwsRfFHQ10Oo9cYIWiVKiiXJ+sAivqsBc41gxe8conFBh6H8iXIFqe/rAce/O+e0c0F5nj9ZBwSeZR26r3qXAnHwgD1KDC5vSNwywc633RDLFw724+BJQUdpnz0rFLXX56zyLKF5kJ2cJjsqYKfq0OiLM0VrEzmxX0Q/ic0ccnhfvqfDJie+WetAttdNjALk+CKAR7CgqIbT51M1PysgZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKEQlEwZMjKmYBgoCBXyrvg9G6ParjLNFQ61kbn3HyI=;
 b=AMFTL2aB5f6332v/psJKTYxTPiRhCg5tyB3QiPikSci+vV15uL9TOcbvTpFvkhbsC6YvHrFKCGQe3ITuGmqjejyy0etY7j5lYWELKYi7GcMJcky+yK2aFv3TaMBuMYwhVRtQK6B/su7mnqGyMBGrhUKbyKJFFkeCRS912xI7WbQ=
Received: from DS1P222CA0004.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:454::6) by
 CH2PR12MB4118.namprd12.prod.outlook.com (2603:10b6:610:a4::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.15; Fri, 14 Aug 2026 04:56:42 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:8:454:cafe::83) by DS1P222CA0004.outlook.office365.com
 (2603:10b6:8:454::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Fri,
 14 Aug 2026 04:56:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.0 via Frontend Transport; Fri, 14 Aug 2026 04:56:42 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 23:56:40 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 13 Aug 2026 23:56:38 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <nagendra.golla@amd.com>
Subject: [PATCH V2 6/8] dmaengine: zynqmp_dma: Use of_dma_is_coherent for dma-coherent
Date: Fri, 14 Aug 2026 10:26:14 +0530
Message-ID: <20260814045616.1661199-7-nagendra.golla@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|CH2PR12MB4118:EE_
X-MS-Office365-Filtering-Correlation-Id: cc12e42b-2160-44b8-0b0b-08def9c06efb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|1800799024|82310400026|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	pkT6inmWZy2cvHeAileYEubkGLoCXM99lYtOwB5ak+CXMFWjuTUihYvS+Wn5z2LOBkoo0IWUqAQwMmMAWc6Au5Pv0MSL2pbUvMi+4l/hljGkK7Nj6pE/Lru+yd0KZkxtc8ECClfKcPoJ9sUdCbOAWarxe7o06T6Haoqh3IV/3L7RTE3K2yaUuc3KbdblXaEVRUpLaDf2P8B+To6eMZlNJWGFwEpU25JVNjUSP5Mu6tSDRWKS15a+S9vuw7F0CHu4p/48BYvS/HqK/Vo+ykIcLcZBeJ5r90KbY04ckrrHEyxGr/QHCDTwbJK+URuvyVeN/6AxJ+jgs9yUNx7U7RyA02W/f9GrWEknbJUxaWACH+MKTSdhx1MWH4fTHNUAsVOJ1IY0i6jojaqfWvyW9lTdEsl71q4xXZ+iWn19IOmKdqRrSZe0uhnJOqJasJOwXW0kGltKPNVBNlROJ2jJil9YR6/5issBnl7t6UcaDyGpapmwp01U/Vpp22UEm/nzZeatk0K7bQp33QnNgtJi8ivdU1dQ4j0tpAsmSpS8Io3bEwdK1UsA2osFcO8J3KIuJphl+dXfgtoGT/4E7NwUS5eOqENiQfQnoPzzjX4S+Pxpri6KaoGLhf1N4/63kfDfX54LOuCsE6T3VJLt8Wm1MIAg+NEtc3crJKedQwz1iz/2l1uvwMtrEnkpvgU85OYBdAs73edsELPdJnQvvrlOlt1wSg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mBJqZF7hi5cL9jRAua7SA64d6poKpcwuo48hPbLLcQRZjwtnx3cfiqyIABWQY1O8j0y5GEBMiGqLTcaNPB9Ym2wKQtPI3n4TuiX4aVxyQ403IXivAs2eAJ/9AqpDZjtfWAPyytiIKBXBjkZVORuxc/6kxDpr5GddwNd2kuvQyAyw+usS+Q5eKcdGmLw0eI0rus7gmXgX4XGj7Q2oojSeZVYscJVRZhrhBw6CKJTwtoPUCaJSKg7gi5Pgp7J/wVikz4PPPcMSj5SzXibZXJ3c6sQClzDbYthp1W6dR4x2Jf2bHhQH0TLPg7UgGHw0IpWhVy5GHFTXVUT3OPqqzw6gTpmVblBK8R/+Kiz8jnmslCrv4kLXBrQrdzo/Ejq+HahvaZpYyJb++x7YnNEbnQm/QpU8bDJ/SqTDhhP7FQMJnDWFMH9JnuY01vw9pAYc2nrQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 04:56:42.3621
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc12e42b-2160-44b8-0b0b-08def9c06efb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4118

Use of_dma_is_coherent() instead of parsing the common dma-coherent
device-tree property directly.

Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
changes in v2:
- Added as a dedicated patch based on review feedback to use of_dma_is_coherent() 
  for the common dma-coherent property
---
 drivers/dma/xilinx/zynqmp_dma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index 5e81e0d950e8..194abfd6cb25 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_dma.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -947,7 +948,7 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
 	if (match_data)
 		chan->irq_offset = match_data->offset;
 
-	chan->is_dmacoherent =  of_property_read_bool(node, "dma-coherent");
+	chan->is_dmacoherent = of_dma_is_coherent(node);
 	zdev->chan = chan;
 	tasklet_setup(&chan->tasklet, zynqmp_dma_do_tasklet);
 	spin_lock_init(&chan->lock);
-- 
2.44.4

