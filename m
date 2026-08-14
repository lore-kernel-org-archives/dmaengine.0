Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012070.outbound.protection.outlook.com [40.93.195.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B465366806;
	Fri, 14 Aug 2026 04:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786683405; cv=fail; b=fU06KFLz9HiL+K76M55aG7c5irCVmwhYiewuua0E7lmJGTTBH26ZK20QlSPllQI0rtBde7R/VxIjHwqPtl1O2zWLbn4q4px9jmQsjnqyBcltMQsClJTYiSN/qbhFVYYQKupkMhI0sdRBEun/KShqh4f1EdpTpT0l5ptPFxr0VV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786683405; c=relaxed/simple;
	bh=Zrnt2jFZJE/P5IGcEfn4GjHDFcgJ5PIOp6wrHPOlwc0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l2B1NJaj9IFntjRDVp+j7iaccxzN6cjMZQry7EH4g9bd6TmIKaPeK6iF/hdL5wEOmuMDxwRvkrgIFEYoTC5tOcD73QDcu8Gxu8sUDsTmY2nf9234b5u0c2jdA93GM+vlDQqvxem36ZyuQO4PXj0w2rKkmYohmV149pYR/uQlpAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nH1Hhf/m; arc=fail smtp.client-ip=40.93.195.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nH1Hhf/m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGWOcmo+r/DMU27loXTvqaz/gkyjGfixWLwd8Yf0kfRsEoekc9e4UxPVk5ZVKjv6zsw2G5B3+tNHDGCFFtjs7/BsDpBpxar8fhqavG4Wc9TvpMjF2FuwyYxoqKf9LPmR8Q2rL7+foJmMmQbh/QYVxLI/ZttVlJqzZvVSe2GOHiiHVurMGLIDRK5daPHRUbzFMsTJVLbaddn4aZcNsLy1VIF76Ro5DKwnMDZbD/zE40YJiS7BuSNGRiCvbmkf/UU3SUF71TBdm+x4mo/zerr88jbUWnipYXegv7jtGb8ECsxLFGh2PxUMDR5ScT8SpaPspYT9Rh8Lfkl2v1EZRJWzXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUdaDLXm87ra3aESe+PWAgGk2dCFEey7V9ArA9gPYos=;
 b=IOwaikaDkG1xeV0fsrCRGmqcyarerzbjFG2SWj1A9XqorZ/677jbToaspGWqSDegvhfrxCmla5Hn+xJmJxINFZwQebY2ZIWWSZbYM4Rn/RxRT+NUXYEk4fJUjEaANEEVZl1ew5G6ab/uTsc14GagIiPlckNOx+WF6i8tUT0t7GgsQYCAE6wXVTGzELdGp1zJI8HrpG3WJUByRHoi2lrt7A52+SdO1Qjn1Nap2cHC0f78C9WVj7x9Q/iUaHPd9MUIJZryivC/d1YWVWKOJLIMFmmYjYs3A62kx285xS9agYkanPyAxORbo7SbQz5AXEeB7BORCf1nEOX0CVRePpdOmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUdaDLXm87ra3aESe+PWAgGk2dCFEey7V9ArA9gPYos=;
 b=nH1Hhf/m2+KkpKRqmo7z/nPIX47ztG/fn1SFRc4C0yI1gw9NNSTDLH2IoHuVah+6eNs2Tu+qQQrH/jqZxgNMazpkF2S7Uv/Piv76M/poEpuNCNmVn3D9afyLxpH1s2i0qE8HIRn+F77KkuooODyuGEI+3ISoeqKGPPfHUZbXOz4=
Received: from DS1P222CA0011.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:454::11) by
 SJ1PR12MB6316.namprd12.prod.outlook.com (2603:10b6:a03:455::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 04:56:39 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:8:454:cafe::77) by DS1P222CA0011.outlook.office365.com
 (2603:10b6:8:454::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Fri,
 14 Aug 2026 04:56:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.0 via Frontend Transport; Fri, 14 Aug 2026 04:56:38 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 23:56:37 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 13 Aug 2026 23:56:35 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <nagendra.golla@amd.com>
Subject: [PATCH V2 5/8] dmaengine: zynqmp_dma: Fix minor whitespace
Date: Fri, 14 Aug 2026 10:26:13 +0530
Message-ID: <20260814045616.1661199-6-nagendra.golla@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|SJ1PR12MB6316:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fb098c1-d9e1-47ab-5b00-08def9c06ce9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|6133799003|10067099003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	XGfeBjqxfeRODmIex8oNXIQHc/sRBj4tNR+EGQsUfZsVroIuqZwmnL1qtimIuuW1rsrepM3p5uvPkjJaC2LwTOcvL2fsiYd9ZbgTD1Vu7UOwLLCSdX0bthCSD57Ua7pLPWFGFTJcNRiIrDvtJfIVdyMOy3jSTz37/FNzh6ElyazwZmxfI/vqpB/xcR53bf65oIPn/u2rZVF8BI3AgJbz0fs4Z9Qhf1tqUvNC9MWqlguMSx0dhKNfILtqP5/nzW6CUI7tOeUINpFD3xaRYNQ4XgPsVMCgVxnJQHnyzmQKDeezUdwer0ZAwx3zqsUlEkSAysZkyW9DxnGbv6wO7NDucO1HqK3ef5F2ybhwYQimO75FJSACIb2sKUxgiCjtSGVc+pZ+2wP7RcpSbm81N32Ea4v0MyZl+XFdxRzdXo3v6hlWD5k5BAgSz3Ht2D3t3PV63fNuwPUwCa48xNI82rWtVRTEoTDh4jFkKxqydjkv1BfOtBz8KbIcDLY2GtCylwF/QkHAXZtKzUmL5ouadLCYLfMl6ks1xyCU5668/up+/iIpMcijcf95ZmAmGLT4euTQtVkPsxR2HYoDu009ccLEwrsbnSXN1xGeshWw3bZmeTAaXqr8fQ5ZPFnP0eWz8P2NZWqPexxQkboECOmcyy6xymLBzcLsogM6PNfNwmyt+URiY7IDIR4bzgDvOA+63A5ZK47lH1MKP7EjvMh8DbLWkw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(6133799003)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0uphHFDXkH4eFjQmj6PLXiQu9Rwrs153V9cq2uSzf2pi7JUpc1ITjlxyMByVM5iS1PF76Drr13kjSk89B41t556CqvZYfQjZGHBrpYmhR5gX00ix3kBPrFjRXI32op4pAZ8Jr+WJGnv4zTVIgmZMG/2lw/t5nwjWLuZr7kFZCZ6DjLtTQvd7sx3h25UnGPp1WNRSZuAd/iYslwRmr8kCIlfqU/pP1FzPUEmoEfo26r7AGWmQ5JCR3Htb9xtTGkoI2V5J4Hhj4TKwbYStJ7chAv7d61nl8g/rUVz8Gc6r2S6yXIFCu9uc35B4FXugraznPB44ax36+ms0nRHGocW/ZYPv8L0VfUb6Cz9rd7dOAhh5vHouZUdYCyKfG7zXAa78J4PeZx+q93xyor6/V/Mr+V1mw4xUG+sXmsVH3BvvT6ujzShiD8lrwNXa6rbkLUHd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 04:56:38.8906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb098c1-d9e1-47ab-5b00-08def9c06ce9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6316

Add a blank line in zynqmp_dma_chan_probe() to separate channel
initialization from hardware setup.

Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
changes in v2:
- Split whitespace-only cleanup from the kerneldoc patch into this dedicated patch
---
 drivers/dma/xilinx/zynqmp_dma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index a2fbefbb43b6..5e81e0d950e8 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -959,6 +959,7 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
 
 	dma_cookie_init(&chan->common);
 	chan->common.device = &zdev->common;
+
 	zynqmp_dma_init(chan);
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-- 
2.44.4

