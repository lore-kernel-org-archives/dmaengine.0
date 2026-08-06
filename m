Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010016.outbound.protection.outlook.com [52.101.193.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F99223DCE;
	Thu,  6 Aug 2026 12:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786019429; cv=fail; b=GI6g6vbP1BZa75yocYMYun4/Sc7ZT1LpjFCU3HuG7q320uGlmPNg8UpTbokiK/HsKEFDhEWNkAMecn61//oijoflqZdbxj5rTWiCUta66WnbOKSV860grsbboYCO7nKN5wZEhHpNittFN4+LJ4Ca5ile3wkP3S7HtmQpsiPffK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786019429; c=relaxed/simple;
	bh=ImNyzVKiEJxmArpWgnkhx3PSB/uwErd5/R8r/GhKV+I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dBrXOz6Wb/RjbFnRlOqctvEJmTO9ciqxJEuM50mQ5Ajz55J4v+ZVsr6nLhmiH+vsfzylqfs2oI6EflexNE/+Gex7J4ups1yjs4qbK5YDrHXseUD9b71vqWFev9wy0DsDykXeH0VYzi5lEkRo2wLYsPICCqp8tFpmAYTrXJvX1do=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3GIVCBy+; arc=fail smtp.client-ip=52.101.193.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3GIVCBy+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=grMAXtH901Y3lPiPAvQaQmmFs2aHY84/aWiZ0l7gLsd98ttDrBIMF+MGfRAG4vsTADIHf+FwB7gQcmDoIr+JG2eD34YcUBXGwpfM6Cd4MWVI0+Gg5IECvRdKfapKBMK6gjXjeQhqa0fLAJBNPDv9gk64/VsCHeBJVpNj9gMUa70jmQf2vNOcLe9occptw/BTSsVeYXrMLBqkjIOiT9CKVr2rbGmui7BHw1W70EDiVAP6c2zKF/zHvxL2PakV71PQF8FCV0hdrTJX8RJnqFH5auDLG9U1UoTCcpN6oWhe+hATcBSWnKaaO55rTfTlcL6qzoYE1qiOofnkh75LhFRahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VrNXkLQQCvOfTNDZANt6wWv/bIGEL6BjPIOu5cvH204=;
 b=mqOGCXZqMaw6Uo6Awj1nTW/5nvOeniuhisQQ9DiGxvqnVKgSTRfszokwz21OPAEcHhaUvIRKHf5a/t1O4ludkQe3zYI6evSRs5JVtvoNvreoj5b1sIf5iy1awJ6ppLpPHvHUIxZ+jsWCwVDFl2bm8LpZrR2zG9yEkLj6QKkfU92qycc9JrP1qes5dqO5kmN2c7QSokHe4VecSGZ5xwa1r165aDGlA12ODgURtcPZeV5BCBS+vRDmZ+VQ2SUpLRqaLdh9sONN0Njg0uOmGqb4DymWLLYYQW8S9CfOvOic8FQIGfLUzNQKSzgTkwlMQCqwv0S5z3cNXS+rfbdaKj9k+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VrNXkLQQCvOfTNDZANt6wWv/bIGEL6BjPIOu5cvH204=;
 b=3GIVCBy+bRe9l7Gd0jaEbkGSCV7qqoFFHyV/SvZy8vAMMAF8u8QlNTiiqGIrnC2RFsP0+Fs/vXNlN4dDGUDyiCJI5gGhc/vEKSGfmb94ylJFffGHT871zHqVZeN59JZIkv+BY6tgx/kCesejAqcvSvquMmCReSO5fFYrGWEwyhc=
Received: from CH2PR08CA0010.namprd08.prod.outlook.com (2603:10b6:610:5a::20)
 by DS0PR12MB9273.namprd12.prod.outlook.com (2603:10b6:8:193::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 12:30:20 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:5a:cafe::af) by CH2PR08CA0010.outlook.office365.com
 (2603:10b6:610:5a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.19 via Frontend Transport; Thu, 6
 Aug 2026 12:30:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 12:30:19 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 6 Aug
 2026 07:30:19 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 6 Aug
 2026 05:30:18 -0700
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 6 Aug 2026 07:30:14 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <radhey.shyam.pandey@amd.com>,
	<kees@kernel.org>, <sakari.ailus@linux.intel.com>, <yukuai3@huawei.com>
CC: <git@amd.com>, <dmaengine@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nagendra.golla@amd.com>
Subject: [PATCH 0/6] dmaengine: zynqmp_dma: Fix error paths and follow-up cleanups
Date: Thu, 6 Aug 2026 18:00:08 +0530
Message-ID: <20260806123014.2120447-1-nagendra.golla@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|DS0PR12MB9273:EE_
X-MS-Office365-Filtering-Correlation-Id: 193a2b7d-52b1-4e5f-288e-08def3b67a87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|7416014|376014|11063799006|56012099006|10067099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	C3QIQyf4C6YAgIMjvqta+snckGZkRnp2G8rnVarHzCnFoSOgOxbbtsXz8JuY+/F3sOWPHIWp8znhlGpGrtb3aGTiTqmz+twDlMJEIzXVQE38pBjA6aF8Inlz11hKpWuWioaycnF633dQNItnvbpLO46XFBoh4/JEl49/s906KEnan5ItMTFEB5Ga0LSMKrihuOdvCwW8Qt2DS6qHBAgH3sjuJyx23dfCSaQMPm7ciIn8+jJSrFgewfsXb+oaEgDurX9CynkuvoMRfAsSyAN8a5OcGTZ+WB1Anc8JJcSTPV5cE401Mh6VtTWl+lnsLFj//KRo1LOuXnYUkTQFzZctanEvkyDlkp0gy5E9mApl7oiXSP00fbj7mlJajaKS9z2DxaGL9Yw7gDNwU2eXP7sBkYnwyioyjKuOSKrr5RAj8yrvH7V+SblAd8PuYuBM+niCIffxZ0KxCGb47nwoIkcaP9WAcMTpIQGdZPmicfE2lRnp3dzWF98YIZE/+UkE/BsWOELZh7HebwHhUIdpeQEQlA4H94oXRejDc+SwKxeUIYcD9rc34WPd/Bc7uXaU8dV9SnRHbf2a9Y2polqmDPj7ymaIgRPETEldNJTSzx4AWl+MgFiPfYqG3HFMHNQadcwpRUZ7IlgCCT1DbZKxw/mnsSTVuqvDxkFd9p0+9qmSQ15h/s8ZWTMGEx9dmsEpne2yzf0BOEL5fu2lSEEdx+VIsQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(7416014)(376014)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1yOEcmCxLiPmAKIXr4I1f+5aLu0LJimqX5fpA+ZEpgEAVxgYy8NQx41uSd8wPdLskQXD2+FyRWNIqwVBpp/Di2F2dS3QNEBgRiFNfkp5Sv0QM/5E8AzLy3ykUTDYb+mLH7l/0E74pg+Pgh4zsFo08oQ0KOI0gik2NUs88BiD7at8N5nBZ/+oasXcJrFzML6GRY+JHiJhj1G0qiXm4SeYGYWwp12/3m0BVhv5oF37YMqy/MU5Mprk2G47VmaXqSJmsnQv1Mo0aHxCpZm6pwFE3itf+a6KCrI3yxNAERL/Sj2xsyGJuLDBUeMNM3gnolKOYbrAxuuWvgOnf+hzlYKwr5eIpq9b34ip9f2Buh4SjlgrtOqOVfmfx867EbPft1vsjk90oyPk6zKPcJNHvXrByNOZP6VKLkpFUAZgtl39GUQ8rAR03l9up36RloPIDuhL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 12:30:19.8017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 193a2b7d-52b1-4e5f-288e-08def3b67a87
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9273

This series fixes error-path cleanup issues in alloc/probe flows and
applies follow-up cleanups in the Xilinx ZynqMP DMA driver.

Patch 1 fixes alloc_chan_resources() rollback after runtime PM has been
acquired, including software descriptor pool cleanup on coherent
allocation failure.

Patch 2 fixes channel probe/remove error handling by preserving
platform_get_irq() errors, initializing/staging chan->irq safely, and
registering the channel node only after IRQ setup succeeds.

Patch 3 updates stale kerneldoc comments to match current behavior.

Patch 4 applies minor whitespace formatting cleanup in
zynqmp_dma_chan_probe().

Patch 5 rejects zero-length memcpy preparations and documents the return
behavior.

Patch 6 removes an unused define and drops a duplicate interrupt enable
bit from the default IRQ mask.


Golla Nagendra (6):
  dmaengine: zynqmp_dma: Fix alloc_chan_resources error cleanup
  dmaengine: zynqmp_dma: Fix chan probe error handling
  dmaengine: zynqmp_dma: Fix stale kerneldoc comments
  dmaengine: zynqmp_dma: Fix minor whitespace
  dmaengine: zynqmp_dma: Reject zero-length memcpy transfers
  dmaengine: zynqmp_dma: Remove unused define and duplicate IRQ bit

 drivers/dma/xilinx/zynqmp_dma.c | 72 +++++++++++++++++++++------------
 1 file changed, 46 insertions(+), 26 deletions(-)

-- 
2.43.7

