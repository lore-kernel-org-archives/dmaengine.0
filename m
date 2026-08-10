Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B720841F7D7;
	Mon, 10 Aug 2026 15:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786374996; cv=fail; b=d61U5JED75r5jjwpiNqYxgSgKEADmpeWlsEPIv0dL6gYTuRXPGa91XkztlqROMul4dSeH2ai6NeeJCQPbExFIfXVXkekx1HL+VuOAtXcGCW7euQtWvpWXEwRFrbSVNTByXzdrGNGRIsD+QseZlpse6WQgOeT3Ugk4KOLdu6Rjjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786374996; c=relaxed/simple;
	bh=HFfJa/RoU7/FZuDXm1dC9GB+UtjADTFDFi/J8b2eUCA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k+OmStlaKl0uBo0MHFeOKpkEUKz+AqROjyeM1LKOtlXLga4BQjLq+Xu1wWaBN5GM9o0q1QGt9ZY1k4Hv76MOn9xglwXSI5jaW9edhGYNde7Klv0S8pE/B8OZ+lRTw4DGGO6uisI8CAeTQXF6ZNEtt1HB7/iymtWEEUbozbk6Kjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=bwr3eLD6; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FynlZLlj; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="bwr3eLD6";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FynlZLlj"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67AEUdj13075889;
	Mon, 10 Aug 2026 10:16:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=dgVJwXvcJv0mCJ+zUydvXpycUSH5AziVU+3Po3uKb
	gg=; b=bwr3eLD6NgcKYYkeSAkxV6Yd1YqzH1b7KT2RHGpvJj3e5RYjNPQbcVj3H
	RjTzBE6etS7cJkBMpfW6R3apfM7dYU5hsiWVez/KPQq1sr4SKFHnIU5BKi8GmXyF
	A4Pep7MY+YKMp7VVSsdXF4YcHoa+klotPt6hUItIA4GGNuO0L0AvcVCUj5WE8MEs
	moIdNkjJmGjOGpbUZjYme9pTl+czIXZLn4hfn2BmHdzh1vty+3V9XcttFr2BZ3op
	EY42b4QPcz3yGbnPED9g4HIF1fgRgebcFNphNTFGaCNrpywB8v5x7d9Azq/JE5pO
	JtDAxWK7KwvLDCaaUHw8hD7lrH9Cg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012038.outbound.protection.outlook.com [52.101.43.38])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fydkwsj9u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 10:16:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZkJs09DO/jojkJe9i+DTtc9/fFkeENNheXjLZ9AGhP5CnA4BWXUnP8Ucwb4aZfaUuoDrVWeU38/EA9mvXBEtkOIvphyerU15+xwyAN0GnmuPpiN9CRxKO/zzPusoHyJOlxdlaG6bSpdYy3LHkwncTsFLt2VwS0u2Xc75o7QyH4hkXhzaea8VLknRwGKTuLkj94PHZzqDSHJ2MjdvtDq8qihfweVRqx87DWMpK9FAIrVT5Cj2L7GhXyZQqjJSoyr44p7eAiFs032pxYfdJm95/DLs1WVdChpYmw75CVJat2kmIUR2owzREPGS2dMnWETsQvKEXTviskt7AUS5IhuYeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgVJwXvcJv0mCJ+zUydvXpycUSH5AziVU+3Po3uKbgg=;
 b=jl62PY4Pwl4P9yKcZxDOmenVxKPWuRC+K4TD99J6VXXg3rbYIzE9Ge1DVUdMf2i8gZWdBZBPe/+lt78dBAxLCAMqevg7hTR2320PNnQx5nE8N8o1GmfNtL/lTbP30+eSenhIaCoLE4EdJ8EO3o9+TFRQhnAvFwhfQCuYFSh0pishLFjonnQwKUHNqmtWSPQIB9PFEFTTA0TbuzkiyE43k5q7CYBo8P6CtsHELllMqzeeJ9/FeGzciTXxkAs5odXEhqQ+NyiEOPVphLxzR9rha7ayTNZLy/1U6q9S2yHjjrs8ICyuib3f8qHWgVjXARRg3FywW9IfyLdiqOO4TGOBUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgVJwXvcJv0mCJ+zUydvXpycUSH5AziVU+3Po3uKbgg=;
 b=FynlZLljEeXATxc5EiJWkOofjSUNdNnz2n5uWf/8gI6S9jml4c1P3n131B76wa52Xts0kbQoldGwVus+QQ/uwnvQgUVA/kzWCwScTEkFd8xy6mgFhTiATl44yuj/N8UjMSwEOeNsPLDZlR9CylnFoFVoci8OyUIQH9/GEpv5flA=
Received: from BY5PR04CA0013.namprd04.prod.outlook.com (2603:10b6:a03:1d0::23)
 by CY8PR10MB6635.namprd10.prod.outlook.com (2603:10b6:930:55::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 15:16:08 +0000
Received: from CO1PEPF00012E7D.namprd03.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::5a) by BY5PR04CA0013.outlook.office365.com
 (2603:10b6:a03:1d0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 15:16:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E7D.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 15:16:06 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:15:53 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:15:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 10 Aug 2026 10:15:52 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67AFERWD2648613;
	Mon, 10 Aug 2026 10:15:48 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <Frank.Li@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <ssantosh@kernel.org>,
        <s-adivi@ti.com>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <r-sharma3@ti.com>,
        <gehariprasath@ti.com>
Subject: [PATCH v8 18/19] dmaengine: ti: k3-udma-v2: Update glue layer to support PKTDMA V2
Date: Mon, 10 Aug 2026 20:44:12 +0530
Message-ID: <20260810151423.1948224-19-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810151423.1948224-1-s-adivi@ti.com>
References: <20260810151423.1948224-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7D:EE_|CY8PR10MB6635:EE_
X-MS-Office365-Filtering-Correlation-Id: 616cf7a4-5e0a-4de2-746e-08def6f24d0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|23010399003|22082099003|18002099003|921020|10067099003|56012099006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	h91b/O2vreYUNqwp+15kPXuqbU68rs6qaEUtzc3Mk4pWer1qopXHAAnZ8kuvMu9Kc299+wqGchZOcYZ7yaL8ojlr9/Ljy3TfkLl7eL6lKm/t/1FaQlNIDCafSlRyfWU3Whuc1/PpOIEg9vk2dJHurjl02VflRCOpMLbqywXTnephzyCbUZ/Jf7TCQtDV/CiPD5+RF6Q9UpPYXgSjmzQOqK5RMXdWWjeS19/MwfJF5a+CoWOrQo4Ti6VmTvdyyqchXJcYoYykBADW4KWTSm/a32RgufkcoUbTkl5SW4UKqE1jqwqVgbgGXOYuHgxq/Lf3/r8PLBncXyRSfIMHoMaETHGYGR8g9g5nTJd/BitZgfh20MrkdgQIv/evwtIKXQLAcbPM7ZLSbhX+moqWmkx12jByzeqk7dFf0g4rxqfA+Mw/UA+tYYipEmsCkQRvO3a0QENDeOFMdeM2H/fMzSEpe33u7B98BSsIBNEwBG324csFL3a8MUTQ5iAvqKh21rtWodqAkGfxVU9XknQ2jaNbejdZnTGuVEQLcncF5AfSW/FEeIx9HddRJHcxmdiHLl8Lce/N1pa4VC5hJZVlRhgFA+r6/VozzwqN2pQ1tjt9OfKchbrl2CPJwRSoPdW0GJ1jKeM3y80GpO0T0+zhHoBX/BiY0OlpwAv67wVIb6ZJpeGd+rEnBh1nmeIQIuW6RCmh
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(23010399003)(22082099003)(18002099003)(921020)(10067099003)(56012099006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5LacvCgHGBEiLEIFMEb45A4f7mBNwsGv8czYh+QY3Dnx5uR2kPA2mOxL18npbU1WvTu0awKEjH2hfsoYEPYjbyd9mhUX8EMhD2JQYKKv4fOsTcKOpfEU2wAqj63TTwYqFhKAvv98oGt8HiJftL2/YwI8MabHqWts45pYZeTmiRHS0hI8AernrGFGzMgGB1cl8j1tRbnviX0ZR20NinDmJWwXqzto+n5WByfZcNUfDx1gG0QOPQvWIS/uYj+T7wfmSHagQUkE2gze3yKNNicJ4aBPTRx9P6+Qca5ILLr/bqgB5X/2WVgQmJ3YfWQXigDeLpPC5FEcciVYUoMOSmbz6Z+TUvCfi0cPts8ovbag9OzViDsdkb9t7uixQ+NtaJU3M5v87aVcyuf9shy1iFgXD3TYsHObwfLaN9NsC+6R10XyGMfBcIlTPr6KCfmCoout
X-Exchange-RoutingPolicyChecked:
	cQIoCxsraEiV2CVcrTjeLbPwFQ1aoyCZ1pRxaFvO+Dr/aS4jLdqTFWVk09D7QC4HNDm+hV4b2zPxafypP+y3LVXQ17jh8cXvvGhhEKkfT/8sS9X+py96SysPNRNUSyITJ6a/Rz5E9jDYSqPCwR06JW+EB1DD6DcJ1oAb7EI1Xks+fmvb8hwuTEA7NbQQuNYf3BN39pj2FK1B6J5gTt/0z0ZaCDniy1UAkXsG/dUbLFErHae+C1BQ7XfqWxchMbde5rpEtAiLgS9MSXbe3/v2Pcn/anCXKKt/9u3KpCRcVIU1HoHnJkrfEDVXCz37zbKVa93gyUpdPKa5T93uiRQXrg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 15:16:06.7158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 616cf7a4-5e0a-4de2-746e-08def6f24d0e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E7D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6635
X-Proofpoint-GUID: AQ8yg691oYkcLu-FnxiKkxaS1_Tpw0Qr
X-Proofpoint-ORIG-GUID: AQ8yg691oYkcLu-FnxiKkxaS1_Tpw0Qr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfX6jDNqMPUDqI9
 eCKMi85MF6m2+YXYHr0zGiJ0j8DDSgRPMaunzMHcLQEYJuUb+6S2xdpOk1OAFevX6BFxHoVy6ZR
 CKLkZWnIQg1CqufKsL/pO7KMINf65pSnHHdUsaNsFWTc92ZBa0lddKs4aNomuv8/f8X+EbcSZ17
 WMk8DkIs2daD/W0sV3rx/K8Bf7ZY0WQmvs0oloLUzl4I1KDbenHfLXkuRNYzWO9Gb/WtDjU0Ifs
 KfA+RhpiDWCGwaWVfLzOVrJ0cAd0tIuBC2gMR1mtFcmT7CtdcDbSgEp1uczqAS2XKakiGvZqyFq
 fPw81bm5Cq7RDpJ5s6FEE406mBUC+ZBhF7gzrQyQn6lpHPV0Cp1ye4PIjEuK0Mop+JV+iMD+wlB
 VXwiufNpHsPrytR7rDdl0w3GL2v+4YTs8O+4IaivSAzidiJDQAhAhJjG9f9OdtxyGbf1wlv42q3
 BSMYm3tbhYkHCF1MLYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfX3ZeNKLrm1l2s
 F9Qg6Oz+ytFV9bI8YUpY0sTw3y8/uoBplf9/jEGEyprb+FpUGPApC5lTCyJShfZywpk5ptX0ZoQ
 DIy+zJdvD4+XyCr9VPALyrDoAPrcePM=
X-Authority-Analysis: v=2.4 cv=F8FnsKhN c=1 sm=1 tr=0 ts=6a79eb43 cx=c_pps
 a=MTA8SzjkfSP6DqtUeP+PaQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=4Ig8warNfptl5lTuD7MA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100131

Update glue layer to support PKTDMA V2 for non DMAengine users.

The updates include
- Handling absence of TISCI
- Direct IRQs
- Autopair: Lack of PSIL pair.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/Kconfig           |   2 +-
 drivers/dma/ti/k3-udma-glue.c    | 182 ++++++++++++++++++++++++-------
 drivers/dma/ti/k3-udma-private.c |  15 +++
 drivers/dma/ti/k3-udma.h         |  10 ++
 4 files changed, 168 insertions(+), 41 deletions(-)

diff --git a/drivers/dma/ti/Kconfig b/drivers/dma/ti/Kconfig
index 40713bd1e8e9b..ada2ea8aca4b0 100644
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
index bec4deb480e60..9b9921e904bc2 100644
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
@@ -267,6 +268,19 @@ static int k3_udma_glue_cfg_tx_chn(struct k3_udma_glue_tx_channel *tx_chn)
 	const struct udma_tisci_rm *tisci_rm = tx_chn->common.tisci_rm;
 	struct ti_sci_msg_rm_udmap_tx_ch_cfg req;
 
+	if (!tisci_rm->tisci) {
+		u32 val = 0;
+
+		if (tx_chn->tx_filt_einfo)
+			val |= UDMA_CHAN_CFG_FILT_EINFO;
+		if (tx_chn->tx_filt_pswords)
+			val |= UDMA_CHAN_CFG_FILT_PSWORDS;
+
+		xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_CFG_REG, val);
+
+		return 0;
+	}
+
 	memset(&req, 0, sizeof(req));
 
 	req.valid_params = TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |
@@ -525,21 +539,38 @@ int k3_udma_glue_enable_tx_chn(struct k3_udma_glue_tx_channel *tx_chn)
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
+			return -ETIMEDOUT;
+		}
+	}
 
 	k3_udma_glue_dump_tx_rt_chn(tx_chn, "txchn en");
 	return 0;
@@ -573,8 +604,16 @@ void k3_udma_glue_tdown_tx_chn(struct k3_udma_glue_tx_channel *tx_chn,
 
 	k3_udma_glue_dump_tx_rt_chn(tx_chn, "txchn tdown1");
 
-	xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_CTL_REG,
-			    UDMA_CHAN_RT_CTL_EN | UDMA_CHAN_RT_CTL_TDOWN);
+	if (tx_chn->common.udmax->match_data->version == K3_UDMA_V1) {
+		xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_CTL_REG,
+				    UDMA_CHAN_RT_CTL_EN | UDMA_CHAN_RT_CTL_TDOWN);
+	} else {
+		val = xudma_tchanrt_read(tx_chn->udma_tchanx, UDMA_CHAN_RT_CTL_REG);
+		xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_CTL_REG,
+				    val | UDMA_CHAN_RT_CTL_TDOWN);
+		xudma_tchanrt_write(tx_chn->udma_tchanx, UDMA_CHAN_RT_PEER_REG(8),
+				    UDMA_CHAN_RT_PEER_REG8_FLUSH);
+	}
 
 	val = xudma_tchanrt_read(tx_chn->udma_tchanx, UDMA_CHAN_RT_CTL_REG);
 
@@ -589,10 +628,12 @@ void k3_udma_glue_tdown_tx_chn(struct k3_udma_glue_tx_channel *tx_chn,
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
@@ -705,7 +746,6 @@ static int k3_udma_glue_cfg_rx_chn(struct k3_udma_glue_rx_channel *rx_chn)
 			   TI_SCI_MSG_VALUE_RM_UDMAP_CH_CHAN_TYPE_VALID |
 			   TI_SCI_MSG_VALUE_RM_UDMAP_CH_ATYPE_VALID;
 
-	req.nav_id = tisci_rm->tisci_dev_id;
 	req.index = rx_chn->udma_rchan_id;
 	req.rx_fetch_size = rx_chn->common.hdesc_size >> 2;
 	/*
@@ -725,11 +765,24 @@ static int k3_udma_glue_cfg_rx_chn(struct k3_udma_glue_rx_channel *rx_chn)
 	req.rx_chan_type = TI_SCI_RM_UDMAP_CHAN_TYPE_PKT_PBRR;
 	req.rx_atype = rx_chn->common.atype_asel;
 
+	if (!tisci_rm->tisci) {
+		u32 val = 0;
+
+		if (rx_chn->common.epib)
+			val |= UDMA_CHAN_CFG_FILT_EINFO;
+		if (rx_chn->common.psdata_size)
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
 
@@ -778,8 +831,11 @@ static int k3_udma_glue_cfg_rx_flow(struct k3_udma_glue_rx_channel *rx_chn,
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
@@ -826,6 +882,19 @@ static int k3_udma_glue_cfg_rx_flow(struct k3_udma_glue_rx_channel *rx_chn,
 		rx_ringfdq_id = k3_ringacc_get_ring_id(flow->ringrxfdq);
 	}
 
+	if (!tisci_rm->tisci) {
+		u32 val = 0;
+
+		if (rx_chn->common.epib)
+			val |= UDMA_FLOWRT_RFA_RX_EINFO_PRESENT;
+		if (rx_chn->common.psdata_size)
+			val |= UDMA_FLOWRT_RFA_RX_PSINFO_PRESENT;
+
+		xudma_rflowrt_write(flow->udma_rflow, UDMA_RX_FLOWRT_RFA, val);
+		rx_chn->flows_ready++;
+		return 0;
+	}
+
 	memset(&req, 0, sizeof(req));
 
 	req.valid_params =
@@ -1330,6 +1399,9 @@ int k3_udma_glue_rx_flow_enable(struct k3_udma_glue_rx_channel *rx_chn,
 	if (!rx_chn->remote)
 		return -EINVAL;
 
+	if (!tisci_rm->tisci)
+		return 0;
+
 	rx_ring_id = k3_ringacc_get_ring_id(flow->ringrx);
 	rx_ringfdq_id = k3_ringacc_get_ring_id(flow->ringrxfdq);
 
@@ -1371,6 +1443,9 @@ int k3_udma_glue_rx_flow_disable(struct k3_udma_glue_rx_channel *rx_chn,
 	if (!rx_chn->remote)
 		return -EINVAL;
 
+	if (!tisci_rm->tisci)
+		return 0;
+
 	memset(&req, 0, sizeof(req));
 	req.valid_params =
 			TI_SCI_MSG_VALUE_RM_UDMAP_FLOW_DEST_QNUM_VALID |
@@ -1406,21 +1481,38 @@ int k3_udma_glue_enable_rx_chn(struct k3_udma_glue_rx_channel *rx_chn)
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
+			return -ETIMEDOUT;
+		}
+	}
 
 	k3_udma_glue_dump_rx_rt_chn(rx_chn, "rxrt en");
 	return 0;
@@ -1457,8 +1549,16 @@ void k3_udma_glue_tdown_rx_chn(struct k3_udma_glue_rx_channel *rx_chn,
 
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
 
@@ -1473,10 +1573,12 @@ void k3_udma_glue_tdown_rx_chn(struct k3_udma_glue_rx_channel *rx_chn,
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
index 92d44ef9593d1..d6d99f60519a1 100644
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
 
@@ -165,6 +169,7 @@ void xudma_##res##rt_write(struct udma_##res *p, int reg, u32 val)	\
 EXPORT_SYMBOL(xudma_##res##rt_write)
 XUDMA_RT_IO_FUNCTIONS(tchan);
 XUDMA_RT_IO_FUNCTIONS(rchan);
+XUDMA_RT_IO_FUNCTIONS(rflow);
 
 int xudma_is_pktdma(struct udma_dev *ud)
 {
@@ -174,6 +179,11 @@ EXPORT_SYMBOL(xudma_is_pktdma);
 
 int xudma_pktdma_tflow_get_irq(struct udma_dev *ud, int udma_tflow_id)
 {
+	if (ud->match_data->version == K3_UDMA_V1) {
+		const struct udma_oes_offsets *oes = &ud->soc_data->oes;
+
+		return msi_get_virq(ud->dev, udma_tflow_id + oes->pktdma_tchan_flow);
+	}
 	struct platform_device *pdev = to_platform_device(ud->dev);
 	char irq_name[10];
 
@@ -184,6 +194,11 @@ EXPORT_SYMBOL(xudma_pktdma_tflow_get_irq);
 
 int xudma_pktdma_rflow_get_irq(struct udma_dev *ud, int udma_rflow_id)
 {
+	if (ud->match_data->version == K3_UDMA_V1) {
+		const struct udma_oes_offsets *oes = &ud->soc_data->oes;
+
+		return msi_get_virq(ud->dev, udma_rflow_id + oes->pktdma_rchan_flow);
+	}
 	struct platform_device *pdev = to_platform_device(ud->dev);
 	char irq_name[10];
 
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 2a9686f7a09bc..aa7425380dbef 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -85,6 +85,14 @@
 #define UDMA_CHAN_RT_CTL_PAIR_COMPLETE BIT(16)
 #define UDMA_CHAN_RT_CTL_ERROR		BIT(0)
 
+/* UDMA_CHAN_CFG_REG */
+#define UDMA_CHAN_CFG_FILT_EINFO	BIT(30)
+#define UDMA_CHAN_CFG_FILT_PSWORDS	BIT(29)
+
+/* UDMA_RX_FLOWRT_RFA */
+#define UDMA_FLOWRT_RFA_RX_EINFO_PRESENT	BIT(30)
+#define UDMA_FLOWRT_RFA_RX_PSINFO_PRESENT	BIT(29)
+
 /* UDMA_CHAN_RT_PDMA_STATE_REG */
 #define UDMA_CHAN_RT_PDMA_STATE_IN_EVT		BIT(31)
 #define UDMA_CHAN_RT_PDMA_STATE_TDOWN		BIT(30)
@@ -747,6 +755,8 @@ u32 xudma_rchanrt_read(struct udma_rchan *rchan, int reg);
 void xudma_rchanrt_write(struct udma_rchan *rchan, int reg, u32 val);
 bool xudma_rflow_is_gp(struct udma_dev *ud, int id);
 int xudma_get_rflow_ring_offset(struct udma_dev *ud);
+u32 xudma_rflowrt_read(struct udma_rflow *rflow, int reg);
+void xudma_rflowrt_write(struct udma_rflow *rflow, int reg, u32 val);
 
 int xudma_is_pktdma(struct udma_dev *ud);
 
-- 
2.54.0

