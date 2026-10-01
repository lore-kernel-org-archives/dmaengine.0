Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F364D7D45;
	Thu,  1 Oct 2026 08:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844216; cv=fail; b=keEes2r5e40BkWCEYK0orWUdGGj+7knFFQPKjS9Jr/TY51O45hlvuCLoZPyyXsPDHzy4yEnLIXNt8vmYYLyfrR6+DHYyI02zRQqU3LWEDie8iBB6ZCkYQ4bzKuPFwfaofTpqTFLv5NCRkY1Jan1WBNGoeF/YoUapvtoWUDMcXBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844216; c=relaxed/simple;
	bh=dbnSsIPPrHeWwUmh24oIHttBiI8395tAbQEKig9j24c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uh4v6bZQfRYnNdKf5MhcwfNZzH3g2mtNCOkQchECZBaw4DzN1TsbMbxmP1TmjA64V3YCtnNVApTQP5CGX2ppxnOoJmJSJKzPdvpu7BAf019qfSTMSBw/68BFDnCLJpcbLLw3/gwat3jds/jbuXeluzlpPcNgSel9HTrMqLAo14k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=EoxKJtIy; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=BeB8jsSb; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="EoxKJtIy";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="BeB8jsSb"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69187T2b1207711;
	Thu, 1 Oct 2026 03:43:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=4Cz+lZ9uQpGmXbDfgjUpqmoEIhVYTVYw/1Qn4y84G
	30=; b=EoxKJtIyY+/Jw5+Dh9hXwK/zTICXvGTmdg2PXWyi3SLXD6hm0IZzEce9r
	EWkl3wffVWagA6WjQOBIqHehG/yv1DGxcpF8buMehYwErVExKWDW9TFgYI2tu4zX
	4R2XV04kp3FEN8wK/vrZqFaMGBVGzeYPL2KvN0po58mnb52Jao9ts1mZYLFvU6rc
	m01k/C/7cnnTW1zJ/6j+wa3DwejCLKHRmj7fSHxQUZXxZS5Z7uI2PvFGiTIycOtL
	ta48Hsq0avSdD0KNjUCd16XamCM/ShJUs00jIiSU/PjxDDg695Zd5qRUVjy3QyCB
	avP7NOcQUmAp5EouT4wrM5rJmhVqg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011019.outbound.protection.outlook.com [52.101.57.19])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h1kqyg5wp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 03:43:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GkGAABy4C8ZJVALuC7fDWIgN7bs91A3KysidYQJ86s4hMfDBPEQVx0RZRquHHWIbnkk8R0FxDe4Sqm6C7MjAF8/1ZnSg+XEpia0SlJ2hEwF0KeTulBFGIQ2wLgizMJBU/3EWfoORR7wFr4bSFfQGTnbW1CjvtEUKHx4Pq+mDBMDWY12UDy/MXwK4onoygMJTJxz320fXqjnni1RT3uDJmNLHjWDCOrFlw4N7CDH3Ies5mfLERlRQPqjz/spiq8vJfkF43VrheWa8kHTswbsDx2Bg2Bn8zLF1lVOXm4cLj4V9nIUFBV+04uU3RssGC6CSkgWIBqyLmUvThJ3f08S8cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Cz+lZ9uQpGmXbDfgjUpqmoEIhVYTVYw/1Qn4y84G30=;
 b=JHktyLGtKN1wFC1M48AtBSiPpSLHay6iJzrtAc1Q6pAYTrDcVuH1OKmgjXxUDfs2WCnvy/SDoXNyokcOusilDr3ki/TNJfRq3kDd8Sjlhcj+7XqOcVPa1ML/bVdhDuWjibaa2MARUrF0T7ug5vqTthvkyo7hSY9eVngBQKSXqTPeEMI7GhuYOY5P9hYdIZbsvxGJwG/1sGYUSnfRRp4gTkvzbG+oyh2bcgaPmYy8lWjN8y59G7G9qAYMJ8V/hk12Y92bxbiFBTa5Xzd6jo3VM25U4WbI33bm7Inerg7vWLbsExAPSFMtk8LdrzyhXakmttIc2aq2U4cIweKZNjqQ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Cz+lZ9uQpGmXbDfgjUpqmoEIhVYTVYw/1Qn4y84G30=;
 b=BeB8jsSbY9f4IJ2JPXjLvZSZnjGemevxz3A37L905I/BpwrubJiMi0LsjgTDVZE9KSmvb/9UZKA9igt5MR+QqgLAV4BJH6MP9be4uj2O+tS2jkUDqMOKLLc3lsW7NHBEDuLQCTjh/dG4kv/N3VgBqzbH7wCbtqvdHSmat6Zp2tM=
Received: from BN0PR04CA0030.namprd04.prod.outlook.com (2603:10b6:408:ee::35)
 by SA1PR10MB7829.namprd10.prod.outlook.com (2603:10b6:806:3ab::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 1 Oct
 2026 08:43:11 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:408:ee:cafe::4d) by BN0PR04CA0030.outlook.office365.com
 (2603:10b6:408:ee::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Thu, 1
 Oct 2026 08:43:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.3 via Frontend Transport; Thu, 1 Oct 2026 08:43:09 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:42:37 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:42:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 1 Oct 2026 03:42:37 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6918f9s9630551;
	Thu, 1 Oct 2026 03:42:33 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v11 18/19] dmaengine: ti: k3-udma-v2: Update glue layer to support PKTDMA V2
Date: Thu, 1 Oct 2026 14:10:34 +0530
Message-ID: <20261001084105.1692228-19-s-adivi@ti.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001084105.1692228-1-s-adivi@ti.com>
References: <20261001084105.1692228-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|SA1PR10MB7829:EE_
X-MS-Office365-Filtering-Correlation-Id: 19aa88e3-ea92-4de9-596b-08df1f98056d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|23010399003|7416014|13003099007|921020|3023799007|6133799003|22082099003|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AH5iY6Ch7L8tTFTlyt/ynONMbavSR7Rts+SLtyf3c3fJ+wIuXwypIPWCl0+YlmpJUtVNLb7WeJxqiUs++KF5OSO/zyxMXSfJPCUw0t3dDzzXnKNSdkI/D5Bob1GOSsbVPwbyG5Vjepz7dIWFnJbpH2bjKH1dFNBLZYdTls4JHGVi5oJZqYUnQ6Xfz8p5ByYPMZ6c40P4/BLuQqnV3AxRqhNfmVLQ/pVJMkfv3/nxNKTdAiZiQe/1uYMc5PYkXry2DpZxt7A8F7uVa2kPykk3HIfw03nNFqc5jF1Fij7hC0cBVqEQtig+Zta44ma5EdvyhUJfHLU58OmxGDXXO4727bQ23Jhh/OYIPbTjIeO8KJkJ0InWgkCqoVfvBdj3rJ4jzYF7PH6OAvo+lo6jlMCULXKeRm+mTwmeXMd3qfd2RPzwLjf1rcFiO0yinqi+o4wwk3quQMv2PyRWDf3Mh9yxE09WuxkC4Sq9KPMMUa6VNxZLPuFGtRuuR8y7hv0Y5HAeaTOYj+AMxKPWYezhz/CgZD503UVlzgZVLi2kTfAQnk6XOxfHNTiMdqZWm/zlQJ+14D9lodXFvjhb/toyYy1i6c1WMnffFxNNwLuqZcteRZ+EzUzC+IqAOGLR3NT0sJZsLf8Y+OtYPm4ZO34CyjkTIXQ93Fl9yaNVus0s9cWMI1dysVce1MTEb6Iz0R6xEKsqNKiXAjveb3wHpttey6BLHg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(7416014)(13003099007)(921020)(3023799007)(6133799003)(22082099003)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Q//F7JT8o6THTzrH581evvhWI5sRtmTlBIuDBJQ3aPrYKCi8+PcSI03Ap2OirSjfww7HAvTyZNiOr9lbviqYFp2Q6qn1MkLkaHi91j69pOfYkc9FVtnucMYuUfTBtYKtL2UBJ+Zcs/Hbu7c84N3JhIo9q/RzoU7tz+QirR4GkkaHjETbahMIwP2U8dnHJX0nrGctmjjDb0cZrctRG6amx7ICQFLtCzKsHDuxpy9ASg1jxkv/kxv6q1DNrOlrULSHJuOOQvPb2lvInZdYA50ZuLeu/xmtS5tt80KbDFpeeo8uNC1V6HkAtDFdJm3CqI286xtDs1WE4e6OV/P/kypIa97TxaQDI+DZdCQsqbrckJ4eq7Y2MfvTcp/9G5hLl01qNfyo97YfGod1qsAswHe4JqOWOqTG2gVMOu2dbCmiwIMEzdyHL0SQ8sn2eI3JTWx8
X-Exchange-RoutingPolicyChecked:
	W4FU8V8i93fcUC1NLoas45Eeez2ePBsPCM0NB+JfFFMVKt6Ko5v9QopreTqpsox+1/WGpovctTvqBc8L4xjXm0jDRu+oVTy7fKDx/A4Qi6hX+4QBQ76ydoDbw7S/c2Ny6auJx1RNCHLYgnALli4hzp+8ut2HmbE0EQ003ZJTABotWootVwnWELel+buii6o7N7SqggkVUtWj7LlLi/qDAQZ6hj0OD0+YH8rAV6ixJnzs935M+2iN8cK34CcmKBTdlU3vQIyY2rohVduF1PAt+PzAnjorkmhhbKzUN95R8F2bZYkvNMrO00suqpII78/or0OP+7LDSBcKrZWssPYWuQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 08:43:09.5258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19aa88e3-ea92-4de9-596b-08df1f98056d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7829
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX3b+GkqgfLoWQ
 Q1iunGsmnr5PpSN1k5EdRiTds5vlKa0rIOA6nPcgHXNos11s+5ozwmPYNk09VnHVsvrfT4qiMM2
 K2LpjjsnDsPwgQf7oCdmF1YtaFEVX/4=
X-Authority-Analysis: v=2.4 cv=a6alZkSF c=1 sm=1 tr=0 ts=6abe1d27 cx=c_pps
 a=C4vld1iEI+sMWzcozXu8ug==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=4Ig8warNfptl5lTuD7MA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfXzUjPbEXBeW3Q
 InkRgcdi6Vi9RTm+hp+OuBokhG6uLdfdvuUnKBbbpdSyhtIL5+8bmVnFGwn1cG4g5dOrBSSbvO4
 JawTfrD4BScBuNPh5mOvCgw3D+DEtFOGgjz+66MBrBgoNiTJMrGfU5A62vqXj8FZpAr+3R32Zgj
 M19LzneQWEYEbBt8hY+ZmZWcK02ecdmBQsI/ySc08gcNXbmjFCKLAKH00rf4smqe18muRM7j6Qe
 C2DUHJaPKLcRrBVzV9BUFGsRr1RkjLB8UgDT5aqhawKxyGP8PeR9xDkZWMroiIkE3SuihNcqKlU
 P42/SOVUJT25H/YtQFTUfChn7MEBNU740VaGyEJIGBd8T2gpgYN8mObyfzlShiQIAEYGZ7oEYNS
 PtEohcezOXcpAVDJ1TNQlvJbfSouqxq+Au2YCOs7Pwv0AmCsPYc2GFDhy57boebtC7XIgxsZcoK
 vWeZjDm9Q4PAxYxMoKw==
X-Proofpoint-ORIG-GUID: _DT5O6x7bG7x9aHsxRhrJd7bpHsn-SYi
X-Proofpoint-GUID: _DT5O6x7bG7x9aHsxRhrJd7bpHsn-SYi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010034

Update glue layer to support PKTDMA V2 for non DMAengine users.

The updates include
- Handling absence of TISCI
- Direct IRQs
- Autopair: Lack of PSIL pair.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/Kconfig           |   2 +-
 drivers/dma/ti/k3-udma-glue.c    | 190 ++++++++++++++++++++++++-------
 drivers/dma/ti/k3-udma-private.c |   5 +
 drivers/dma/ti/k3-udma.h         |  13 +++
 4 files changed, 169 insertions(+), 41 deletions(-)

diff --git a/drivers/dma/ti/Kconfig b/drivers/dma/ti/Kconfig
index e6a2cf37062e7..e7a579f42b584 100644
--- a/drivers/dma/ti/Kconfig
+++ b/drivers/dma/ti/Kconfig
@@ -68,7 +68,7 @@ config TI_K3_UDMA_COMMON
 config TI_K3_UDMA_GLUE_LAYER
 	tristate "Texas Instruments UDMA Glue layer for non DMAengine users"
 	depends on ARCH_K3 || COMPILE_TEST
-	depends on TI_K3_UDMA
+	depends on TI_K3_UDMA || TI_K3_UDMA_V2
 	help
 	  Say y here to support the K3 NAVSS DMA glue interface
 	  If unsure, say N.
diff --git a/drivers/dma/ti/k3-udma-glue.c b/drivers/dma/ti/k3-udma-glue.c
index 78722a7f8ebd2..d3d2c232d898c 100644
--- a/drivers/dma/ti/k3-udma-glue.c
+++ b/drivers/dma/ti/k3-udma-glue.c
@@ -12,6 +12,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
 #include <linux/init.h>
+#include <linux/iopoll.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/soc/ti/k3-ringacc.h>
@@ -267,6 +268,23 @@ static int k3_udma_glue_cfg_tx_chn(struct k3_udma_glue_tx_channel *tx_chn)
 	const struct udma_tisci_rm *tisci_rm = tx_chn->common.tisci_rm;
 	struct ti_sci_msg_rm_udmap_tx_ch_cfg req;
 
+	if (!tisci_rm->tisci) {
+		u32 val = 0;
+
+		if (tx_chn->tx_pause_on_err)
+			val |= UDMA_CHAN_CFG_PAUSE_ON_ERR;
+		if (tx_chn->tx_filt_einfo)
+			val |= UDMA_CHAN_CFG_FILT_EINFO;
+		if (tx_chn->tx_filt_pswords)
+			val |= UDMA_CHAN_CFG_FILT_PSWORDS;
+		if (tx_chn->tx_supr_tdpkt)
+			val |= UDMA_CHAN_CFG_TX_SUPR_TDPKT;
+
+		xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_CFG_REG, val);
+
+		return 0;
+	}
+
 	memset(&req, 0, sizeof(req));
 
 	req.valid_params = TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |
@@ -528,21 +546,39 @@ int k3_udma_glue_enable_tx_chn(struct k3_udma_glue_tx_channel *tx_chn)
 {
 	int ret;
 
-	ret = xudma_navss_psil_pair(tx_chn->common.udmax,
-				    tx_chn->common.src_thread,
-				    tx_chn->common.dst_thread);
-	if (ret) {
-		dev_err(tx_chn->common.dev, "PSI-L request err %d\n", ret);
-		return ret;
-	}
+	if (tx_chn->common.udmax->match_data->version == K3_UDMA_V1) {
+		ret = xudma_navss_psil_pair(tx_chn->common.udmax,
+					    tx_chn->common.src_thread,
+					    tx_chn->common.dst_thread);
+		if (ret) {
+			dev_err(tx_chn->common.dev, "PSI-L request err %d\n", ret);
+			return ret;
+		}
 
-	tx_chn->psil_paired = true;
+		tx_chn->psil_paired = true;
 
-	xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_PEER_RT_EN_REG,
-			    UDMA_PEER_RT_EN_ENABLE);
+		xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_PEER_RT_EN_REG,
+				    UDMA_PEER_RT_EN_ENABLE);
 
-	xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_CTL_REG,
-			    UDMA_CHAN_RT_CTL_EN);
+		xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_CTL_REG,
+				    UDMA_CHAN_RT_CTL_EN);
+	} else {
+		u32 val;
+
+		xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_CTL_REG,
+				    UDMA_CHAN_RT_CTL_AUTOPAIR | UDMA_CHAN_RT_CTL_EN);
+
+		ret = read_poll_timeout(xudma_tchanrt_read, val,
+					val & (UDMA_CHAN_RT_CTL_PAIR_COMPLETE |
+					       UDMA_CHAN_RT_CTL_PAIR_TIMEOUT),
+					100, 500, false,
+					tx_chn->udma_tchanx, UDMA_CHAN_RT_CTL_REG);
+		if (ret || (val & UDMA_CHAN_RT_CTL_PAIR_TIMEOUT)) {
+			dev_err(tx_chn->common.dev, "TX channel autopair timeout\n");
+			xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_CTL_REG, 0);
+			return -ETIMEDOUT;
+		}
+	}
 
 	k3_udma_glue_dump_tx_rt_chn(tx_chn, "txchn en");
 	return 0;
@@ -576,8 +612,16 @@ void k3_udma_glue_tdown_tx_chn(struct k3_udma_glue_tx_channel *tx_chn,
 
 	k3_udma_glue_dump_tx_rt_chn(tx_chn, "txchn tdown1");
 
-	xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_CTL_REG,
-			    UDMA_CHAN_RT_CTL_EN | UDMA_CHAN_RT_CTL_TDOWN);
+	if (tx_chn->common.udmax->match_data->version == K3_UDMA_V1) {
+		xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_CTL_REG,
+				    UDMA_CHAN_RT_CTL_EN | UDMA_CHAN_RT_CTL_TDOWN);
+	} else {
+		xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_PEER_REG(8),
+				    UDMA_CHAN_RT_PEER_REG8_FLUSH);
+		val = xudma_tchanrt_read(tx_chn->udma_tchanx, UDMA_CHAN_RT_CTL_REG);
+		xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_CTL_REG,
+				    val | UDMA_CHAN_RT_CTL_TDOWN);
+	}
 
 	val = xudma_tchanrt_read(tx_chn->udma_tchanx, UDMA_CHAN_RT_CTL_REG);
 
@@ -592,10 +636,12 @@ void k3_udma_glue_tdown_tx_chn(struct k3_udma_glue_tx_channel *tx_chn,
 		i++;
 	}
 
-	val = xudma_tchanrt_read(tx_chn->udma_tchanx,
-				 UDMA_CHAN_RT_PEER_RT_EN_REG);
-	if (sync && (val & UDMA_PEER_RT_EN_ENABLE))
-		dev_err(tx_chn->common.dev, "TX tdown peer not stopped\n");
+	if (tx_chn->common.udmax->match_data->version == K3_UDMA_V1) {
+		val = xudma_tchanrt_read(tx_chn->udma_tchanx,
+					 UDMA_CHAN_RT_PEER_RT_EN_REG);
+		if (sync && (val & UDMA_PEER_RT_EN_ENABLE))
+			dev_err(tx_chn->common.dev, "TX tdown peer not stopped\n");
+	}
 	k3_udma_glue_dump_tx_rt_chn(tx_chn, "txchn tdown2");
 }
 EXPORT_SYMBOL_GPL(k3_udma_glue_tdown_tx_chn);
@@ -708,7 +754,6 @@ static int k3_udma_glue_cfg_rx_chn(struct k3_udma_glue_rx_channel *rx_chn)
 			   TI_SCI_MSG_VALUE_RM_UDMAP_CH_CHAN_TYPE_VALID |
 			   TI_SCI_MSG_VALUE_RM_UDMAP_CH_ATYPE_VALID;
 
-	req.nav_id = tisci_rm->tisci_dev_id;
 	req.index = rx_chn->udma_rchan_id;
 	req.rx_fetch_size = rx_chn->common.hdesc_size >> 2;
 	/*
@@ -728,11 +773,24 @@ static int k3_udma_glue_cfg_rx_chn(struct k3_udma_glue_rx_channel *rx_chn)
 	req.rx_chan_type = TI_SCI_RM_UDMAP_CHAN_TYPE_PKT_PBRR;
 	req.rx_atype = rx_chn->common.atype_asel;
 
+	if (!tisci_rm->tisci) {
+		u32 val = 0;
+
+		if (!rx_chn->common.epib)
+			val |= UDMA_CHAN_CFG_FILT_EINFO;
+		if (!rx_chn->common.psdata_size)
+			val |= UDMA_CHAN_CFG_FILT_PSWORDS;
+
+		xudma_rchanrt_write(rx_chn->udma_rchanx, UDMA_CHAN_RT_CFG_REG, val);
+
+		return 0;
+	}
+
+	req.nav_id = tisci_rm->tisci_dev_id;
 	ret = tisci_rm->tisci_udmap_ops->rx_ch_cfg(tisci_rm->tisci, &req);
 	if (ret)
 		dev_err(rx_chn->common.dev, "rchan%d cfg failed %d\n",
-			rx_chn->udma_rchan_id, ret);
-
+				rx_chn->udma_rchan_id, ret);
 	return ret;
 }
 
@@ -781,8 +839,11 @@ static int k3_udma_glue_cfg_rx_flow(struct k3_udma_glue_rx_channel *rx_chn,
 	}
 
 	if (xudma_is_pktdma(rx_chn->common.udmax)) {
-		rx_ringfdq_id = flow->udma_rflow_id +
+		if (tisci_rm->tisci)
+			rx_ringfdq_id = flow->udma_rflow_id +
 				xudma_get_rflow_ring_offset(rx_chn->common.udmax);
+		else
+			rx_ringfdq_id = flow->udma_rflow_id;
 		rx_ring_id = 0;
 	} else {
 		rx_ring_id = flow_cfg->ring_rxq_id;
@@ -829,6 +890,21 @@ static int k3_udma_glue_cfg_rx_flow(struct k3_udma_glue_rx_channel *rx_chn,
 		rx_ringfdq_id = k3_ringacc_get_ring_id(flow->ringrxfdq);
 	}
 
+	if (!tisci_rm->tisci) {
+		u32 val = 0;
+
+		if (rx_chn->common.epib)
+			val |= UDMA_FLOWRT_RFA_RX_EINFO_PRESENT;
+		if (rx_chn->common.psdata_size)
+			val |= UDMA_FLOWRT_RFA_RX_PSINFO_PRESENT;
+		if (flow_cfg->rx_error_handling)
+			val |= UDMA_FLOWRT_RFA_RX_ERROR_HANDLING;
+
+		xudma_rflowrt_write(flow->udma_rflow, UDMA_RX_FLOWRT_RFA, val);
+		rx_chn->flows_ready++;
+		return 0;
+	}
+
 	memset(&req, 0, sizeof(req));
 
 	req.valid_params =
@@ -1336,6 +1412,9 @@ int k3_udma_glue_rx_flow_enable(struct k3_udma_glue_rx_channel *rx_chn,
 	if (!rx_chn->remote)
 		return -EINVAL;
 
+	if (!tisci_rm->tisci)
+		return 0;
+
 	rx_ring_id = k3_ringacc_get_ring_id(flow->ringrx);
 	rx_ringfdq_id = k3_ringacc_get_ring_id(flow->ringrxfdq);
 
@@ -1377,6 +1456,9 @@ int k3_udma_glue_rx_flow_disable(struct k3_udma_glue_rx_channel *rx_chn,
 	if (!rx_chn->remote)
 		return -EINVAL;
 
+	if (!tisci_rm->tisci)
+		return 0;
+
 	memset(&req, 0, sizeof(req));
 	req.valid_params =
 			TI_SCI_MSG_VALUE_RM_UDMAP_FLOW_DEST_QNUM_VALID |
@@ -1412,21 +1494,39 @@ int k3_udma_glue_enable_rx_chn(struct k3_udma_glue_rx_channel *rx_chn)
 	if (rx_chn->flows_ready < rx_chn->flow_num)
 		return -EINVAL;
 
-	ret = xudma_navss_psil_pair(rx_chn->common.udmax,
-				    rx_chn->common.src_thread,
-				    rx_chn->common.dst_thread);
-	if (ret) {
-		dev_err(rx_chn->common.dev, "PSI-L request err %d\n", ret);
-		return ret;
-	}
+	if (rx_chn->common.udmax->match_data->version == K3_UDMA_V1) {
+		ret = xudma_navss_psil_pair(rx_chn->common.udmax,
+					    rx_chn->common.src_thread,
+					    rx_chn->common.dst_thread);
+		if (ret) {
+			dev_err(rx_chn->common.dev, "PSI-L request err %d\n", ret);
+			return ret;
+		}
 
-	rx_chn->psil_paired = true;
+		rx_chn->psil_paired = true;
 
-	xudma_rchanrt_write(rx_chn->udma_rchanx, UDMA_CHAN_RT_CTL_REG,
-			    UDMA_CHAN_RT_CTL_EN);
+		xudma_rchanrt_write(rx_chn->udma_rchanx, UDMA_CHAN_RT_CTL_REG,
+				    UDMA_CHAN_RT_CTL_EN);
 
-	xudma_rchanrt_write(rx_chn->udma_rchanx, UDMA_CHAN_RT_PEER_RT_EN_REG,
-			    UDMA_PEER_RT_EN_ENABLE);
+		xudma_rchanrt_write(rx_chn->udma_rchanx, UDMA_CHAN_RT_PEER_RT_EN_REG,
+				    UDMA_PEER_RT_EN_ENABLE);
+	} else {
+		u32 val;
+
+		xudma_rchanrt_write(rx_chn->udma_rchanx, UDMA_CHAN_RT_CTL_REG,
+				    UDMA_CHAN_RT_CTL_AUTOPAIR | UDMA_CHAN_RT_CTL_EN);
+
+		ret = read_poll_timeout(xudma_rchanrt_read, val,
+					val & (UDMA_CHAN_RT_CTL_PAIR_COMPLETE |
+					       UDMA_CHAN_RT_CTL_PAIR_TIMEOUT),
+					100, 500, false,
+					rx_chn->udma_rchanx, UDMA_CHAN_RT_CTL_REG);
+		if (ret || (val & UDMA_CHAN_RT_CTL_PAIR_TIMEOUT)) {
+			dev_err(rx_chn->common.dev, "RX channel autopair timeout\n");
+			xudma_rchanrt_write(rx_chn->udma_rchanx, UDMA_CHAN_RT_CTL_REG, 0);
+			return -ETIMEDOUT;
+		}
+	}
 
 	k3_udma_glue_dump_rx_rt_chn(rx_chn, "rxrt en");
 	return 0;
@@ -1463,8 +1563,16 @@ void k3_udma_glue_tdown_rx_chn(struct k3_udma_glue_rx_channel *rx_chn,
 
 	k3_udma_glue_dump_rx_rt_chn(rx_chn, "rxrt tdown1");
 
-	xudma_rchanrt_write(rx_chn->udma_rchanx, UDMA_CHAN_RT_PEER_RT_EN_REG,
-			    UDMA_PEER_RT_EN_ENABLE | UDMA_PEER_RT_EN_TEARDOWN);
+	if (rx_chn->common.udmax->match_data->version == K3_UDMA_V1) {
+		xudma_rchanrt_write(rx_chn->udma_rchanx, UDMA_CHAN_RT_PEER_RT_EN_REG,
+				    UDMA_PEER_RT_EN_ENABLE | UDMA_PEER_RT_EN_TEARDOWN);
+	} else {
+		xudma_rchanrt_write(rx_chn->udma_rchanx, UDMA_CHAN_RT_PEER_REG(8),
+				    UDMA_CHAN_RT_PEER_REG8_FLUSH);
+		val = xudma_rchanrt_read(rx_chn->udma_rchanx, UDMA_CHAN_RT_CTL_REG);
+		xudma_rchanrt_write(rx_chn->udma_rchanx, UDMA_CHAN_RT_CTL_REG,
+				    val | UDMA_CHAN_RT_CTL_TDOWN);
+	}
 
 	val = xudma_rchanrt_read(rx_chn->udma_rchanx, UDMA_CHAN_RT_CTL_REG);
 
@@ -1479,10 +1587,12 @@ void k3_udma_glue_tdown_rx_chn(struct k3_udma_glue_rx_channel *rx_chn,
 		i++;
 	}
 
-	val = xudma_rchanrt_read(rx_chn->udma_rchanx,
-				 UDMA_CHAN_RT_PEER_RT_EN_REG);
-	if (sync && (val & UDMA_PEER_RT_EN_ENABLE))
-		dev_err(rx_chn->common.dev, "TX tdown peer not stopped\n");
+	if (rx_chn->common.udmax->match_data->version == K3_UDMA_V1) {
+		val = xudma_rchanrt_read(rx_chn->udma_rchanx,
+					 UDMA_CHAN_RT_PEER_RT_EN_REG);
+		if (sync && (val & UDMA_PEER_RT_EN_ENABLE))
+			dev_err(rx_chn->common.dev, "TX tdown peer not stopped\n");
+	}
 	k3_udma_glue_dump_rx_rt_chn(rx_chn, "rxrt tdown2");
 }
 EXPORT_SYMBOL_GPL(k3_udma_glue_tdown_rx_chn);
diff --git a/drivers/dma/ti/k3-udma-private.c b/drivers/dma/ti/k3-udma-private.c
index 3f6235cd4d72a..1acab00bbd5a9 100644
--- a/drivers/dma/ti/k3-udma-private.c
+++ b/drivers/dma/ti/k3-udma-private.c
@@ -3,6 +3,10 @@
  *  Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com
  *  Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
  */
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqdomain.h>
+#include <linux/interrupt.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 
@@ -181,6 +185,7 @@ void xudma_##res##rt_write(struct udma_##res *p, int reg, u32 val)	\
 EXPORT_SYMBOL(xudma_##res##rt_write)
 XUDMA_RT_IO_FUNCTIONS(tchan);
 XUDMA_RT_IO_FUNCTIONS(rchan);
+XUDMA_RT_IO_FUNCTIONS(rflow);
 
 int xudma_is_pktdma(struct udma_dev *ud)
 {
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 7210dd896add8..c87514c3fe574 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -86,6 +86,17 @@
 #define UDMA_CHAN_RT_CTL_PAIR_COMPLETE BIT(16)
 #define UDMA_CHAN_RT_CTL_ERROR		BIT(0)
 
+/* UDMA_CHAN_CFG_REG */
+#define UDMA_CHAN_CFG_PAUSE_ON_ERR	BIT(31)
+#define UDMA_CHAN_CFG_FILT_EINFO	BIT(30)
+#define UDMA_CHAN_CFG_FILT_PSWORDS	BIT(29)
+#define UDMA_CHAN_CFG_TX_SUPR_TDPKT	BIT(8)
+
+/* UDMA_RX_FLOWRT_RFA */
+#define UDMA_FLOWRT_RFA_RX_EINFO_PRESENT	BIT(30)
+#define UDMA_FLOWRT_RFA_RX_PSINFO_PRESENT	BIT(29)
+#define UDMA_FLOWRT_RFA_RX_ERROR_HANDLING	BIT(28)
+
 /* UDMA_CHAN_RT_PDMA_STATE_REG */
 #define UDMA_CHAN_RT_PDMA_STATE_IN_EVT		BIT(31)
 #define UDMA_CHAN_RT_PDMA_STATE_TDOWN		BIT(30)
@@ -713,6 +724,8 @@ u32 xudma_rchanrt_read(struct udma_rchan *rchan, int reg);
 void xudma_rchanrt_write(struct udma_rchan *rchan, int reg, u32 val);
 bool xudma_rflow_is_gp(struct udma_dev *ud, int id);
 int xudma_get_rflow_ring_offset(struct udma_dev *ud);
+u32 xudma_rflowrt_read(struct udma_rflow *rflow, int reg);
+void xudma_rflowrt_write(struct udma_rflow *rflow, int reg, u32 val);
 
 int xudma_is_pktdma(struct udma_dev *ud);
 
-- 
2.55.0

