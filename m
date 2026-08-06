Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010060.outbound.protection.outlook.com [52.101.85.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7191FCFFC;
	Thu,  6 Aug 2026 12:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786019458; cv=fail; b=RonT/kvpw3RLI/cZrtU2S7gzccrX39iX+sVWkPOaqCkidzLjVS0IbAEfe1BTSaufJBotED1A68Ss5pUTP8HMpaueenuP0P2FqBcv0FPcoXjfObZP8TzkMOAJ45/VplYNUS8xKMo2uHc7a5ab3hdNWJ+rT3I1T259YG3+6mZ8oRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786019458; c=relaxed/simple;
	bh=5wE9TuE6IkcAgd9H+eP4RVpxpz684IEosoG61s9qAeA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PqolIGxey2xFpsRbsVIItw4rHz0n3e339ZJ1BEbXCFYT9sMQwceXflMZSouGsGJfLF0l2j3VUyUi4jQu/4Ud/4TAxy4XmBGh/nErsE/3aO8+SrRYB8aCh/O+2JXEn9EIp5suvwBbDEekvZYZgR+IwOfvajzzh2skbk+2UB+I96U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hNprmBP0; arc=fail smtp.client-ip=52.101.85.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hNprmBP0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+RIEjXm0774zPR70yrs+WKuOY63/+JLu+6wMPp3xTKyJ85BP2Ayu9OZKDe9N1NaqYXQh7Zqwhy2jDSvN1gdNFYqeTN/saJqGZD4o8dFekdwqrTy7tvFn3iZnB3EpE2ysVJI5qLynYsV0JJgHjG8ArMzBANuc33bmwgTJrH43vAX8JIxJ0H0xJU4pQaTORy6sTPFwIsGtJkiT/vHhTFa4qddWCXyDvLcT4qzWfVESXGBz3GmoX+epyOa4oMsx6iCZzPn6jS7rF3ROxh223vjLaBMQv5+TniXcP9Y1T2Os86+gPeKFDRnJnPll2AcjildL7fzPwyxFSp8z+HLNXyImA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uz/0QLtoO6Ht4cHpgxRB3mMpt5uDyBa2kwI4zN90unI=;
 b=LUTBcV0DS0JaiTbuxmMnTGt18Hs76zafwydm0Piu3o8rdpLm9EqUCxPrCKuShI20Y/DI5prLRyfRevb7F2J/h5xRLP4P/tVx76U400CgEv2GTpSCMfmiCg+nksm0iZv/o8a8g30H2eZ78Q2ueLO9X5UbkoQwrfP7jVFZ1ytnhrQarTfgZzFBQ+a4iDMS4rMfVOM2OGrKXpG+LTIjObCoeeM7Cp3rcbGYuZIPtWh3sCk6vtPJW+jqxMQUq1DAEqIeEb28yoxDBOLiTVBVk2YFl59qeO9mt+6G/upy1q7CQSE5h0DsJJA1o8mVhd3DpSdVJrpPFWG6swnSRxPjKAAvUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uz/0QLtoO6Ht4cHpgxRB3mMpt5uDyBa2kwI4zN90unI=;
 b=hNprmBP044Dvkh3RANh3UwMPlT0xvPHTmZHJTUVtEWmjd2P8tu7ISfI0JSqi3BSLJOp604SXl0UCuDmjpSDTuDGgweTU44LnlIIXitseRVdyS+rOmBNdZB8JRBcXngIeCTgMEc+U/ccWExrWdzSfOMbTFl0ISSqjDX2ruYho1jo=
Received: from SA1PR05CA0005.namprd05.prod.outlook.com (2603:10b6:806:2d2::7)
 by PH7PR12MB7870.namprd12.prod.outlook.com (2603:10b6:510:27b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 12:30:40 +0000
Received: from SA2PEPF00003F61.namprd04.prod.outlook.com
 (2603:10b6:806:2d2:cafe::2) by SA1PR05CA0005.outlook.office365.com
 (2603:10b6:806:2d2::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.8 via Frontend Transport; Thu, 6
 Aug 2026 12:30:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003F61.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 12:30:40 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 6 Aug
 2026 07:30:39 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 6 Aug 2026 07:30:35 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <radhey.shyam.pandey@amd.com>,
	<kees@kernel.org>, <sakari.ailus@linux.intel.com>, <yukuai3@huawei.com>
CC: <git@amd.com>, <dmaengine@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nagendra.golla@amd.com>
Subject: [PATCH 5/6] dmaengine: zynqmp_dma: Reject zero-length memcpy transfers
Date: Thu, 6 Aug 2026 18:00:13 +0530
Message-ID: <20260806123014.2120447-6-nagendra.golla@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F61:EE_|PH7PR12MB7870:EE_
X-MS-Office365-Filtering-Correlation-Id: cb3c61bf-0d95-4312-6d3c-08def3b68701
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|36860700016|82310400026|1800799024|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9CVdp9EuNP4h4+f0at3+XaAFwzT8YKFs2zQymnVt/QvNj5bcWti2YjkJfqut6/ulAELr4+L/MRIFSmlkt/WSXyx3bKh+HWDH14b9Ns6yBb5BqZB1QC00DtPn8dtbolQMSQis5ZdzSk1AaXR3wrAG7h/Ca76p5ErmKNPDB+8v5cJzjYH4ebfyaqd2S4qx1go92VnORiYPt1bLqKEeKoTSDL0ww3FofBi3GEttSOBUuQsb6MFFAp92Dsk9ZQWvqGn4SyNCl/kLCTBZjFDtlcujmoKbzk1pLWPmUxK3E7MjEHmJtIUzIejNv9Ej0HeECd5cUTaZUBN44XboKHKyuej7P6pWbWiqUJGeVbtRzVs7VBoN0tpOGE4U/0IyrYCOxQn3HI8oeLgYe+saQlRC7zub2wnTjcxcEGjyPz7paRrtzzCfxVjnRMlCzhjKf53nwQZFJkBoQQSzt3LWe7SGG43H04352+Z7HRnsZUJya3WJB7R4U1fVJF/bqUhso2gNNrHD/NEI+NjGoIL49Uwz2ckVezyxZptWuYFRSwGJE2NOPL2YNTtcd5TJiWeEc1IouTfbD+w96ed/13ltEi+zVA4C/dx0J31fANZVo+2wzvaCgI7KG8Fx6qyFSOUW8C/PSAGxtpC4CQ4y+a1uxr6JOj1eKfYOGdrGUyX0XmjYreQij0ahWAiZ2J5eM/UaGclx02iFDp0+ukyQ7OSVOdtVz8ZZvA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(36860700016)(82310400026)(1800799024)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G0tUkKUt283pKSljuHCku6LQeD7gr0+ZdBQ+xfJFxlNlv0ZGbJXmu+GQAvzAvkb6jMPcrqvmSwtX+uNCECSPVbpNvaed45E+2S9h54qNmbbucOdufTZgzmDXrYdaXhvn0k/iEADxRR01Hb6nmgxKCjAXzhPA0Egry9YmxCkQIWGQQ2koJ06PfVYbY55wDOXllwrKkC5UzRq9k9kjovIpyBlkndZIQrz1jRLOFUaD2cTugseXrlh/VBr6iAdfZKoD8zivaKVMoGkHQyJ/UZ2mZ+alRQ77xElWHOy/Zcfe72nmdyf1R8k7CTsRIPDzr/YqgetWY/1uqocda5TpxfCjfsC0V9HA9GliFdRFwM9Ax/t/HPuUYy5PCkl/T6gh5HiNufUN5srRYiPSCgqZfyavZuQ+UANjMonr6rCNI/Yc+5Tb/DZ8IECiKwtHvlirlJE/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 12:30:40.7055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb3c61bf-0d95-4312-6d3c-08def3b68701
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7870

Zero-length prep_memcpy() needlessly consumed a descriptor slot. Reject
zero-length memcpy at prep time and document the behaviour.

Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
 drivers/dma/xilinx/zynqmp_dma.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index 2d56ea08ce45..e70874d65123 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -836,7 +836,8 @@ static void zynqmp_dma_synchronize(struct dma_chan *dchan)
  * @len: Transfer length
  * @flags: transfer ack flags
  *
- * Return: Async transaction descriptor on success and NULL on failure
+ * Return: Async transaction descriptor on success and NULL on failure or
+ *	   zero length transfer
  */
 static struct dma_async_tx_descriptor *zynqmp_dma_prep_memcpy(
 				struct dma_chan *dchan, dma_addr_t dma_dst,
@@ -851,6 +852,9 @@ static struct dma_async_tx_descriptor *zynqmp_dma_prep_memcpy(
 
 	chan = to_chan(dchan);
 
+	if (!len)
+		return NULL;
+
 	desc_cnt = DIV_ROUND_UP(len, ZYNQMP_DMA_MAX_TRANS_LEN);
 
 	spin_lock_irqsave(&chan->lock, irqflags);
-- 
2.43.7

