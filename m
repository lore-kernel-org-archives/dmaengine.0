Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A92422E36;
	Fri, 24 Jul 2026 10:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888547; cv=fail; b=hLRG48edhW8UmpptZsvnG381+MDioLzNDpfkYkr/cGFkGxHHBZ7ZY8UfGcdlmsHTHGJTqRXG6m71jrHDXcRpC4FVcOaeclZuo9XOVQ2oLcY5Abpd+DJsMdwoCrpWubZgy80H6a4H6NGY4YL4cl5cAFPEipwBWgZvnfN/5amMVWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888547; c=relaxed/simple;
	bh=GVpatDnPYVYydKc+KSbBokFHube3THZrvNmZ6PZXWaA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rBLheOwogOSB7bNIWFxyy8yOyfAenUQRAsGoEL5ntwdzuw22ti8eIxdRF5/bbV7z3HYwM5RLmqQ5tT55jsLMU577LDEMUQeyj9M0j+EKmvwTjcwUn+OOfnNn78l1lz9EZTMaF27MvBFEZlSCOnmotQLAY9qmfidu0Gv/LQ3s97U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=PjL1jVha; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mz+X2yGU; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="PjL1jVha";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mz+X2yGU"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OAFhit785710;
	Fri, 24 Jul 2026 05:22:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=JpsvSYeqwobyQ6en6O0BGPE1FNoXibP3ieou4zJeT
	Vc=; b=PjL1jVhatTB8N/H3A/nIab5XOASjuJESSupjXAOc5wzDoL/7Kmc3LNVdC
	ZiY/MKbZ8HnQeebEikMc1MlamZkuN1BS08y3+ONMdFVUbRYu6sCe6Y/rEk3An2VR
	Hyun07AAfE7Cb1qFIrZsMOwCkoFY0YM0/hx62UCxAcG1MqkTcZT2VeRcQTT9GU+w
	6l/8nJVT3tBntiKqPZbdk8LuVy6qdr41wZdYyDAiU9UTgy158Ql9qi53UZwSegzN
	ETL1QZrJUvL+WtzmieKwMdvDrOAvn8VCUep/xu8plVAwTXUK/j7X/qXo8QqWxgvf
	7FLyVBk3z5kPqSmsRqjE0IETX95kA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011026.outbound.protection.outlook.com [40.93.194.26])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fm5p304jx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 05:22:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hOPjx+/isx/hCpNdiu7eqg/kSqsOmnHUdpepyUHPjtoUfkSF5P5Rx6HE2YpMTvGzNktMRpsFUllZ6id9ejBCwOdFidccWQYKjSGPRf1tngbphfbBfWcaH8kX0tkkvI48dJmhIiB+4hlzO5a/w+UuxHjabvpff2Q+Y4KmOQFZ6Mk3Y9LgorzpWH2UNJqhJD5TAc8CAxnrx6YgtpuFBJbFlu1pIiD55GvUPenB5k7ZWoQprBcNhxGwJq0mdn+o0ZCo533qy31gLJG8NOFYM/mSsdewbCTTJIAZ8Wx7QPox0gy4foOpoosYNuwVP/o76+907v3zqZ2pCnIqKw+DhtHTPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JpsvSYeqwobyQ6en6O0BGPE1FNoXibP3ieou4zJeTVc=;
 b=kC05RfTRJLzAUieR3uQmvKwwtjRBDrwCNRyuZgiIKKe/g3IdpNjgrlsxArZLY9/ewMjgb3HAbDGvH5u7epPa1QlAmlqhk2tVAJMAdwkesNy6nk6B0hJpIVBxQuG1HdooCJir5xNCr90P7Iiaw0IOchCyLvBH9INvFndDSF5+AMMxO5Fl9xRuc6lqkaAZQq+kNlZIlPTdAHllYzBkkHMRf/6qVlTYfDxTzUIAfd9tGJVfOnwTM1gop1EQTRanGLZxpZktvBwSZ9wESWIpcCEXtU/jF3TNhM23LgoMbn7NKhTaWLW8k+xGVTmaAH7KWY7R0IO7JHmYpWZ+hGkc0XINgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JpsvSYeqwobyQ6en6O0BGPE1FNoXibP3ieou4zJeTVc=;
 b=mz+X2yGUS6z9slKKjZsWppgvioRIIOx4lN4lSm1EPEkLzwtBrf+Lc/8LRlj6qNAmFbj584siFspmrtSNa7XraETgw+/pUWftdzvibruYoyDyJv8OahuRSVjKlqlsxm6OTOqpvTtMnQvC+lBOKaCuErsGQEn8XuipESZZlBDmQSo=
Received: from MN2PR06CA0027.namprd06.prod.outlook.com (2603:10b6:208:23d::32)
 by SN7PR10MB6547.namprd10.prod.outlook.com (2603:10b6:806:2aa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 10:22:05 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::61) by MN2PR06CA0027.outlook.office365.com
 (2603:10b6:208:23d::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 10:22:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 10:22:04 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:22:03 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:22:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 24 Jul 2026 05:22:03 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66OALMFM3017088;
	Fri, 24 Jul 2026 05:21:58 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v7 07/19] dmaengine: ti: k3-udma: Add variant-specific function pointers to udma_dev
Date: Fri, 24 Jul 2026 15:50:40 +0530
Message-ID: <20260724102115.2854-8-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260724102115.2854-1-s-adivi@ti.com>
References: <20260724102115.2854-1-s-adivi@ti.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|SN7PR10MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: 48f348f0-1c36-45c1-eb32-08dee96d683a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|7416014|376014|22082099003|18002099003|10067099003|56012099006|921020|6133799003;
X-Microsoft-Antispam-Message-Info:
	PH+F4gODSz/K05Mi53F3p6RCIPgEM5p+gBo2EaqMGviz7Mw+4MeLSVD1jr1B+NG5+gBzBMCluZ/pEFywivGV37zS6KrVsQG7nq0VTTNxcADGImyfkcAenELlPikNkP5n692FL+OSToapHORQ0z8s4LHidqt23u+7BHEZ0zonC7lBp4O/750uMQS6HpDH1QcqXqJUHgoNzpQkHxSS7xqli8ksODZ5dpPlXx0BWTKX8sBf5kUXZm2WM+FiBS7pIZ0xDhthuFfcngIH6AaBWpnC0THq0hAP6BOKqKbGnZvT8U262WkJIXA2jnpx+OEC4Vsw6EYCJk9GQnogd9JqhUZ8Og187RO1q3E4YB/FMqNqkbqve6Z7ui5I7K0btuRRt+ELKvS/X7ZthTnsvzSVgUBb/CSVGVg9cvsJ+e6bZ5uMnHeGJyRdd1ndlSYpftBe2p+QQdo25+zdEOr7GEjXB+O6BhmLNhaht8prB/VZ1et1gCzHbcpOIMzLg9JypX1HwgTDMg5TR0SiycDYvUdh3PnNMjQ7bYYCQlHSoYhLCKGf9xLJFFCOpIBM3ZKBbOJ2suyLDR359XLkUh1mMhS+zDXLbwiZ4hnadwHTcY9xvIsHm/8Ej0/Tl+SNBsMhZ154A6XDMeVUyxF9KaCF0GDvquzNOIxjrziXxTgTbgeyR4Re2pdigjKLBnYHx/fYyOfKg26+QthCtRSDwv0TPdF9oWB4ec6seMaRgNMGqILd0o9mjds=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(7416014)(376014)(22082099003)(18002099003)(10067099003)(56012099006)(921020)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KT2GSby9nHTL/Uu7WJHvnJK0iwnl6h9USyMgMa5p2veQvECgsb2BTYT4E+sFyCe27Y1YkYkf2s0aXskbB3hUHiScCOzL14paFzl27BufWpJvaGEkTU6ghhMKopW1XbFSqW6Vxl1+AmrIjnPwlNnSr9oYy+03sSHqhWL69RpTCPrf/MvOsGZGmEfdDozEqmtr8uJBOicmKgamN0CaGhdM008BogO1P78PoPSU+W2EqfphMi5QPC3NF/94kGrfLZUprWIHqL8q9fVf7qPx7FwHpL5YIwQDwVX4fqX2B8X/ROHjkb5G72LVWEEjjnuNS0LPefF0uRowGq8mjGWwEhX/CiQZWAo7wJCbx/cWxMO7RubaOV5vxinRC2iPErcAW8YTWPL5qPon8YVneNFQQD7jOLRU9K5O3SgKkdk5681OYMOLdsRWnvk1GS6t9zz4czlV
X-Exchange-RoutingPolicyChecked:
	l8E4nlRuWzhgUCx0QXEJXxluWLWJTIW0pBFgc/8fZUXD9Sx6ZgzWTJaUVUgBpXI8pVZl4kniWiynzdKSoHfV9vgCGKRhIj3s16ScHO3+LlZilCAt/kd6Av55Iyn70UgA0NyaTlsV8GMpzjon0L1Pw0AZL0jT9WYs7ncAIhjV4AEMgAYBs8MqvFVBlIx9YWJ/h+YTR3OVCLVLZvC0oS7+w9mJXS9l4XbkCVwh8timTAk+c0N+dVeZ3Y5a+p+iAynVq93MqBIq5O/qfphIfdT0jc0QBfR0HdORW55vgLZ3JoRrZbom9yfMx64bxemWU80FYzaPiSUHRLCmjRVTk9FdBg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 10:22:04.1434
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f348f0-1c36-45c1-eb32-08dee96d683a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6547
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfX6kkzc/pHyonE
 psboPjX2B6lt62KwbPyaG3MPOoSRq8nKActkzjl/N9vS5ewzxYfrus5rjnAs63sW0pQp9PnijLQ
 avLYXmB9bEsYuBqiymBlDcxOOP/83nr3yavMM5KEcParK4BCcYe2SJonQgLiaGJ5dIFDBvhOFyd
 0/EEC0VoY5etywEGSmucnIWFzQ7XKfe+MSkOHZyV5olJaZLd4BNL95Ej3F55GC3uDpzvpcXoKoa
 bgY/FTmMDzdcQKxO+3qBdeAx3mGcYIaxoEuRRW8JYNHbGq4enW23JIoy9tF7mHHAGJk1PmhhyMF
 DjS+H/oyvU9jEilM22pNFfjhQ3z2toOz+ZFWI4cTQlmqB7xi3IHdx+p5oVeRk5lIeD/J9ebt0Od
 F4cFoGHbJkxmLwkdm1XDNAhz0FVvhNU9xtd4ZCO/kk4K0xpAhcqp1gflj6koQvjIR9ztU8vewCy
 ExFFuRLmMBIMLjNb35Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfX0EjSRLq6TeIg
 P/5PM15rWfeJIoUWPW2h6dPHaPMIZ35DPHFGITQmAISHAFJ8iTVGV/ux6FxBPZ+p78XLNoeb237
 Wg0irGE9fTMmOu3WIcVF77DXeT64ZcY=
X-Proofpoint-GUID: KnFCCXyflENfXHw5iBRAELQrO1aMdqXR
X-Proofpoint-ORIG-GUID: KnFCCXyflENfXHw5iBRAELQrO1aMdqXR
X-Authority-Analysis: v=2.4 cv=C8PZDwP+ c=1 sm=1 tr=0 ts=6a633cd1 cx=c_pps
 a=HGE+/hAEzspoXCOliImplg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=8AirrxEcAAAA:8 a=sozttTNsAAAA:8 a=t8SHgtbNc-4yMX3RsRgA:9
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240094

Introduce function pointers in the udma_dev structure to allow
variant-specific implementations for certain operations.
This prepares the driver for supporting multiple K3 UDMA variants,
such as UDMA v2, with minimal code duplication.

No functional changes intended in this commit.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-private.c | 10 +++++--
 drivers/dma/ti/k3-udma.c         | 46 +++++++++++++++++++-------------
 drivers/dma/ti/k3-udma.h         | 12 +++++++++
 3 files changed, 47 insertions(+), 21 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-private.c b/drivers/dma/ti/k3-udma-private.c
index 624360423ef17..44c097fff5ee6 100644
--- a/drivers/dma/ti/k3-udma-private.c
+++ b/drivers/dma/ti/k3-udma-private.c
@@ -8,13 +8,19 @@
 
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread)
 {
-	return navss_psil_pair(ud, src_thread, dst_thread);
+	if (ud->psil_pair)
+		return ud->psil_pair(ud, src_thread, dst_thread);
+
+	return 0;
 }
 EXPORT_SYMBOL(xudma_navss_psil_pair);
 
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread, u32 dst_thread)
 {
-	return navss_psil_unpair(ud, src_thread, dst_thread);
+	if (ud->psil_unpair)
+		return ud->psil_unpair(ud, src_thread, dst_thread);
+
+	return 0;
 }
 EXPORT_SYMBOL(xudma_navss_psil_unpair);
 
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 40ba114ac81dd..195ff948548c3 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -40,7 +40,7 @@ static const char * const mmr_names[] = {
 	[MMR_TCHANRT] = "tchanrt",
 };
 
-static int navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread)
+int navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread)
 {
 	struct udma_tisci_rm *tisci_rm = &ud->tisci_rm;
 
@@ -50,8 +50,8 @@ static int navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread)
 					      src_thread, dst_thread);
 }
 
-static int navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-			     u32 dst_thread)
+int navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
+		      u32 dst_thread)
 {
 	struct udma_tisci_rm *tisci_rm = &ud->tisci_rm;
 
@@ -329,7 +329,7 @@ static int udma_start(struct udma_chan *uc)
 	}
 
 	/* Make sure that we clear the teardown bit, if it is set */
-	udma_reset_chan(uc, false);
+	uc->ud->reset_chan(uc, false);
 
 	/* Push descriptors before we start the channel */
 	udma_start_desc(uc);
@@ -521,8 +521,8 @@ static void udma_check_tx_completion(struct work_struct *work)
 		if (uc->desc) {
 			struct udma_desc *d = uc->desc;
 
-			udma_decrement_byte_counters(uc, d->residue);
-			udma_start(uc);
+			uc->ud->decrement_byte_counters(uc, d->residue);
+			uc->ud->start(uc);
 			vchan_cookie_complete(&d->vd);
 			break;
 		}
@@ -554,7 +554,7 @@ static irqreturn_t udma_ring_irq_handler(int irq, void *data)
 		}
 
 		if (!uc->desc)
-			udma_start(uc);
+			uc->ud->start(uc);
 
 		goto out;
 	}
@@ -576,8 +576,8 @@ static irqreturn_t udma_ring_irq_handler(int irq, void *data)
 				vchan_cyclic_callback(&d->vd);
 			} else {
 				if (udma_is_desc_really_done(uc, d)) {
-					udma_decrement_byte_counters(uc, d->residue);
-					udma_start(uc);
+					uc->ud->decrement_byte_counters(uc, d->residue);
+					uc->ud->start(uc);
 					vchan_cookie_complete(&d->vd);
 				} else {
 					schedule_delayed_work(&uc->tx_drain.work,
@@ -612,8 +612,8 @@ static irqreturn_t udma_udma_irq_handler(int irq, void *data)
 			vchan_cyclic_callback(&d->vd);
 		} else {
 			/* TODO: figure out the real amount of data */
-			udma_decrement_byte_counters(uc, d->residue);
-			udma_start(uc);
+			uc->ud->decrement_byte_counters(uc, d->residue);
+			uc->ud->start(uc);
 			vchan_cookie_complete(&d->vd);
 		}
 	}
@@ -1654,7 +1654,7 @@ static int udma_alloc_chan_resources(struct dma_chan *chan)
 
 	if (udma_is_chan_running(uc)) {
 		dev_warn(ud->dev, "chan%d: is running!\n", uc->id);
-		udma_reset_chan(uc, false);
+		ud->reset_chan(uc, false);
 		if (udma_is_chan_running(uc)) {
 			dev_err(ud->dev, "chan%d: won't stop!\n", uc->id);
 			ret = -EBUSY;
@@ -1821,7 +1821,7 @@ static int bcdma_alloc_chan_resources(struct dma_chan *chan)
 
 	if (udma_is_chan_running(uc)) {
 		dev_warn(ud->dev, "chan%d: is running!\n", uc->id);
-		udma_reset_chan(uc, false);
+		ud->reset_chan(uc, false);
 		if (udma_is_chan_running(uc)) {
 			dev_err(ud->dev, "chan%d: won't stop!\n", uc->id);
 			ret = -EBUSY;
@@ -2014,7 +2014,7 @@ static int pktdma_alloc_chan_resources(struct dma_chan *chan)
 
 	if (udma_is_chan_running(uc)) {
 		dev_warn(ud->dev, "chan%d: is running!\n", uc->id);
-		udma_reset_chan(uc, false);
+		ud->reset_chan(uc, false);
 		if (udma_is_chan_running(uc)) {
 			dev_err(ud->dev, "chan%d: won't stop!\n", uc->id);
 			ret = -EBUSY;
@@ -2123,7 +2123,7 @@ static void udma_issue_pending(struct dma_chan *chan)
 		 */
 		if (!(uc->state == UDMA_CHAN_IS_TERMINATING &&
 		      udma_is_chan_running(uc)))
-			udma_start(uc);
+			uc->ud->start(uc);
 	}
 
 	spin_unlock_irqrestore(&uc->vc.lock, flags);
@@ -2265,7 +2265,7 @@ static int udma_terminate_all(struct dma_chan *chan)
 	spin_lock_irqsave(&uc->vc.lock, flags);
 
 	if (udma_is_chan_running(uc))
-		udma_stop(uc);
+		uc->ud->stop(uc);
 
 	if (uc->desc) {
 		uc->terminated_desc = uc->desc;
@@ -2297,11 +2297,11 @@ static void udma_synchronize(struct dma_chan *chan)
 			dev_warn(uc->ud->dev, "chan%d teardown timeout!\n",
 				 uc->id);
 			udma_dump_chan_stdata(uc);
-			udma_reset_chan(uc, true);
+			uc->ud->reset_chan(uc, true);
 		}
 	}
 
-	udma_reset_chan(uc, false);
+	uc->ud->reset_chan(uc, false);
 	if (udma_is_chan_running(uc))
 		dev_warn(uc->ud->dev, "chan%d refused to stop!\n", uc->id);
 
@@ -2355,7 +2355,7 @@ static void udma_free_chan_resources(struct dma_chan *chan)
 
 	udma_terminate_all(chan);
 	if (uc->terminated_desc) {
-		udma_reset_chan(uc, false);
+		ud->reset_chan(uc, false);
 		udma_reset_rings(uc);
 	}
 
@@ -3694,6 +3694,14 @@ static int udma_probe(struct platform_device *pdev)
 		ud->soc_data = soc->data;
 	}
 
+	// Setup function pointers
+	ud->start = udma_start;
+	ud->stop = udma_stop;
+	ud->reset_chan = udma_reset_chan;
+	ud->decrement_byte_counters = udma_decrement_byte_counters;
+	ud->psil_pair = navss_psil_pair;
+	ud->psil_unpair = navss_psil_unpair;
+
 	ret = udma_get_mmrs(pdev, ud);
 	if (ret)
 		return ret;
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 767b73021390d..16de0b218d8ad 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -348,6 +348,15 @@ struct udma_dev {
 	u32 psil_base;
 	u32 atype;
 	u32 asel;
+
+	int (*start)(struct udma_chan *uc);
+	int (*stop)(struct udma_chan *uc);
+	int (*reset_chan)(struct udma_chan *uc, bool hard);
+	void (*decrement_byte_counters)(struct udma_chan *uc, u32 val);
+	int (*psil_pair)(struct udma_dev *ud, u32 src_thread,
+			 u32 dst_thread);
+	int (*psil_unpair)(struct udma_dev *ud, u32 src_thread,
+			   u32 dst_thread);
 };
 
 struct udma_desc {
@@ -618,6 +627,9 @@ int udma_push_to_ring(struct udma_chan *uc, int idx);
 int udma_pop_from_ring(struct udma_chan *uc, dma_addr_t *addr);
 void udma_reset_rings(struct udma_chan *uc);
 
+int navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
+int navss_psil_unpair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
+
 /* Direct access to UDMA low lever resources for the glue layer */
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-- 
2.54.0

