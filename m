Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012038.outbound.protection.outlook.com [52.101.48.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF383655C9;
	Fri, 14 Aug 2026 04:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786683416; cv=fail; b=T4rCSAeU1WOgSJRTix/VYBvVUCOGiOX/nddn4QodiTje3+1AkrUHAePvYtJbeeXdQ/z1FZFlTxyml/3o7fJX/SBEx0mMDMRc1e0Kavlrw8vYVSsj0YFnnjUliZrMBqeSCFVBhkFNawwIcBS4qkj+pfodrNlZIVzFIegTNBCY6Bc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786683416; c=relaxed/simple;
	bh=d455VKLTVwZZSnxDFxjHTU5tjoQ2qqCRSdXRolttdnY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p7nQVrNctz2Yb1BaNKwkK7qxJgXCJBGYFrqL3dG0z9HK1zJoYwinBgfNz6QG++ETTfXRtM08g6YtZ+gkR7tAFadpZMN7AfhLY/EYlaE0P5zWs4xw2xU5YKU03HEp8bzM/xNrNfYyc3jtCg4TUeC8LZK9JKVb764QxeFj9El3GlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AZZPP7YD; arc=fail smtp.client-ip=52.101.48.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AZZPP7YD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+++EnExHYS3l6saQqoqav+Hvachw9ESZEU2fr8vhHiXbhs9ZknH9XGA+gaaq3WugaZe3w7UCwkkrIPjgWxJapekSwfOGJIMow8FcEFIwuyevrfdTDFaLcmynoOjI/U5yktjMj3ioGAb/YczGPK8MUrMAKR4RJPtE9/tlNAGmoocdFJfFt7EKZn47Ivbm1gnbXZvL9Xyfrh9WP9HYBEusPH5ZsJ1fuMCLPOMIt/c9XNwV0ibYhIHHsmf3t5GdPIOh/vs7Xl4XwKv18vxkilLkWJj4mW6UeCyUagFGScI2RZNLxNMCGiFnq5XTbto4uJRxPJJrNjO1WzTCyvYco2I4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2w83qc5TmicNhbJwH3LL3cy3JhQtxVsFPjPDQ5bffRY=;
 b=XZeqg0BWAvCVTc0RjHoPf8kw4WPwA8MC5d5SxA5mfe4iT3nMD4FAaG9k4kBwmbvet9WUA2d7rbVLOkD8cx4C7X96dOT8RoTIqyvlLHYeAFwwQ9Q5ECw32YmgzzAMntaumeylQE4Hfp0hKoM+JTCXerJqYP8uHuhEUyHtz1ZPgsoAshrzzwNFzNJC3n2DT1y9A994akiG3nLbwvDhEp+orIdkCfYBo3xeElPyl6GKQ1YooRf6rgmGe/H30KDaNzKROmnXRPLYyncjhw0mDvq8j2nTUdmGuvvLsFRJSoY1AyBtpiKZ3ZXgaeoNxywaD2b+1JieWy3ajQhCJmAbtUP1NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2w83qc5TmicNhbJwH3LL3cy3JhQtxVsFPjPDQ5bffRY=;
 b=AZZPP7YDSedK00d+RNO+S7D9HRN1kKkecmJk4lSZ/nLXanFo7+W6m9xJUrO6dtL1amy55PcPyUoM1s0SMN7SX7+ytCL13ncxt+Ih1bfrQPjAAjDWWfFYP/E1MTLDIrWlTqWfAMfmbdGDaX0Sh+Sjm6jbxxkFJtUxRfi6w1/IEv4=
Received: from BN9PR03CA0399.namprd03.prod.outlook.com (2603:10b6:408:111::14)
 by PH7PR12MB6933.namprd12.prod.outlook.com (2603:10b6:510:1b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Fri, 14 Aug
 2026 04:56:44 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:111:cafe::68) by BN9PR03CA0399.outlook.office365.com
 (2603:10b6:408:111::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Fri,
 14 Aug 2026 04:56:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Fri, 14 Aug 2026 04:56:44 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 23:56:43 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 23:56:43 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 13 Aug 2026 23:56:41 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <nagendra.golla@amd.com>
Subject: [PATCH V2 7/8] dmaengine: zynqmp_dma: Reject zero-length memcpy transfers
Date: Fri, 14 Aug 2026 10:26:15 +0530
Message-ID: <20260814045616.1661199-8-nagendra.golla@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|PH7PR12MB6933:EE_
X-MS-Office365-Filtering-Correlation-Id: aa71fa25-09ea-4b9a-12f5-08def9c0700e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|22082099003|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	Xsrc17x6uLIEdMSQqbNPNY57bS9g4MYy53wa9wcfZVOtzQjyCUxQTZUNbNvQboMH5eRZytnarFim1tu8DOVLQ6l5JloLC1SBFr4v/bnncNeRbgV9y4HmG7igeZjDZ2DZSqHOYAXdnUT6aWa5hIyjdzyN4mhSgZZ5rTZlQ6H7ipK0kr4l5iQnnblDWdn76gq3evwnRmJZBom0QSNkEm1LxeJqGsg8DfiSAKwbmNJFnapBSijIDpA8EciD+Lco0ANApoxbzkdQqhKQi9pPBWliUEDkmFws+bMDDBhwlsZhey04Hd2itbCfK9erk/u0YgJdxw84HnbXdJA/ivfvl1opIyFI3VZaE+exRsADzaospLfoIJv6EXjX6Cp4cVvkp8A9SX/LNAGOw4uvwq3Cs03BBRmPKO6GyUG+URYb8eQrpw7iLockA2S4AMpDTf6Zk38TYrO+cGDnmr1btLUAmrCTzH0JyVQ90xDRwLATRfh7FDEMQbmEyLkZxabwcIHYnPSGqoRFEoWrJEBTUFTf5LWp3tllbfyeAddzC3wzHsyrw+qn/5tDVdg5y/GTajPPSMgA3+oG2CceYGQsGT4KsSLaLstEEjURzFlV7w739kHGp5e1Zxu1K+bBAP1Iy7OTWkeE29/h+a+7zDShxrvSTvy+Ts6AzGl6docbUjLpwmMdFQx6pULmgVx0GIv3TdZXHw4JrbNzFQkIGZCJbJwPrGWSag==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NF9vQuWIvLQwRQXD5XbLaDXjYYSiINk/Oy3A11aFWl5ZqpKai464VjXDypUCJFHUIXBZtfo4uOSco8aQw1sbc6DqvXOizh/LE4P6mFPb4PneLHERB8V5NOKzpfe8ht8Q3nWtyCYjENRqEsm7Hodz1o8g1Y0yLe+BdnB0drmxaj+T/s0cS9asgdvvBOyexcEpCPusfYldw4UvswcSETp08OBtaCRhN5+Hni28+E0g9SFyT1CDfFh8FIM37bPcdc795FuK1l8Y+QVUs9wmTd7dG14yBHy/i2RKADeRt6L8gaxioeCwvWea4KhQ9HnQdtWQndXl9gd0Gy6e+jW7ZTHhEhEdfbAWRFeV3CZubbQSiI+QEBQh91DEXg7Zf/5tWX4qMtqP3OU9A8oQAieiY1ZZqxa9BGUI8e2zwLFM9Trogz7Gbuyiyo8Ifb/xxjTfFJat
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 04:56:44.1756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa71fa25-09ea-4b9a-12f5-08def9c0700e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6933

Zero-length prep_memcpy() needlessly consumed a descriptor slot. Reject
zero-length memcpy at prep time and document the behaviour.

Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
Changes in V2:
- No change
---
 drivers/dma/xilinx/zynqmp_dma.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index 194abfd6cb25..921d3d9f6ed6 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -837,7 +837,8 @@ static void zynqmp_dma_synchronize(struct dma_chan *dchan)
  * @len: Transfer length
  * @flags: transfer ack flags
  *
- * Return: Async transaction descriptor on success and NULL on failure
+ * Return: Async transaction descriptor on success and NULL on failure or
+ *	   zero length transfer
  */
 static struct dma_async_tx_descriptor *zynqmp_dma_prep_memcpy(
 				struct dma_chan *dchan, dma_addr_t dma_dst,
@@ -852,6 +853,9 @@ static struct dma_async_tx_descriptor *zynqmp_dma_prep_memcpy(
 
 	chan = to_chan(dchan);
 
+	if (!len)
+		return NULL;
+
 	desc_cnt = DIV_ROUND_UP(len, ZYNQMP_DMA_MAX_TRANS_LEN);
 
 	spin_lock_irqsave(&chan->lock, irqflags);
-- 
2.44.4

