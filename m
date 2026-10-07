Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14AB495AEC;
	Wed,  7 Oct 2026 10:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369177; cv=fail; b=cGN53OFrlV8MiCAE4fCjpKaEtqCQc2nwzQr2AMWZqICCf+NedaM8nUY/QpSfrCIa/75jP9VD2Dw9zl59IkVrC/5rtpVBk9PRbkwCwpU4mv6gkFXyoOgkGOGLWT1M7Q+e+vwtleYczvUlZdmJe6zaMCYxoPThzXyOYoiwUZsvnrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369177; c=relaxed/simple;
	bh=itE9L0a/hyvay52Ps7wNys7MBFKCoOtMXDFKS6sPsNQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hJOHyo62rxR4xVAUB1M3DAheqOqn1v9MNu24kDfREec/PfGTuUUZb4gWARGpkrDhXYeCv6H5Z33Mh2asmbvNFyd+5YtdN1A1KZCiBjwZINW13ZY8vrZVxJTogG6TpV+8mvZghcQYiykziX80ft+5ub5S84CtjWZTNUuf0ih8s0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Td/nCwBL; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=JYovpDl1; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Td/nCwBL";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="JYovpDl1"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977k0bS753187;
	Wed, 7 Oct 2026 05:32:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=hlteJzJE05VQzFqelXrjk3/3FIzs7oN/XaJHnLjML
	Ok=; b=Td/nCwBLHAV+6kJj0S7j1/bveJzdpVhk7+T034dBs1ihqba77WCCO5COS
	8Y89C2vExgH2wmA+tv+cuOYnxLy4JQLd9niFipXCGxT1JeqF283Qxl8VRVK5TZVz
	9obPY7lDk3RtK6i3ZfSvbJXRM4GW2EtOzMeh1oxjfKX/ik0GMQ4jkkNA9hT6tNZg
	kuLP/RdddIziDom2tdLK5yViUWrloebw49tl8yIe+IQG1VOauc3WkW23E0FD+0gj
	OAOABgkUlLncgmIF8TRtWJhn4BhsDhMUD0jGfgP0N1F6CZAL0GFhX+PtAcN658g2
	Lnr9G0pGLbFt+vcM/VOk6H3Iw9dKw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010008.outbound.protection.outlook.com [52.101.201.8])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h5hw78q05-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 05:32:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHfrXHrEiJ+skzdPQl7lEWdEuoA8rjNf7C+ApRCp4UdJZu1Q5vnY7kXcNxpWeEQgH/MI6yEVh1XGOu4trLMjHVczZHerJ7E5ek1EWskwPzAjQzIfJuAWnM2XZ2UNh/rZw2FeByNcheo2LUMDK+6pqU87S8UUS/2iMDfz6E5JtErT9MJI+HRtkPRzRr/aOkOQlaLIPGSVEn4N/BUhvMv4eCEwDb+fKLSavettYOrLBpca9pWEdfJEYzG/80ij93EMYcSp194PlCe4LZi0OSYSMcIm2F/N8gQfX1SznFN2B6+PlDw36X10jY9yyZXrgekN49Wlhktuij9L28bvfx5sYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlteJzJE05VQzFqelXrjk3/3FIzs7oN/XaJHnLjMLOk=;
 b=SuY63QHTVxf4HIVVYPlWd4CQSPryGLMN+UKQoSdcyiay+D6iISvEOesRQegU0K4DO+5xUtMdMFhIFizRcvnkHYofD9QnUIBvkLRocodVPfX2Gwp9QqgJUP9eYiZqSnSO8JrrInQqjljnClZ/VNgJHsiD8hePA+/nD5ujxDnH0xZOWgT1T/X90XLvb+mubEh9p5gP/P6CeBtZeJ4Uc73h1QNapOTbxsAC+ulOvkgymfuoLnJ35dMOHsujkHX5sIi8ukIyxQaTtXP3DlgCayzd7+cy9YbMb3moToMd9y5LC3MAiK5NqV+Ntv2O26MKnblh75xxmI6Simn9QsYBxGTsbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlteJzJE05VQzFqelXrjk3/3FIzs7oN/XaJHnLjMLOk=;
 b=JYovpDl1qDVYhO326w1m8wQnF7VD1psZR2BTp6aEZIYiP6oB5hNnYR+G243Cto42H/X5MLmxPk9jxyWnOZ0TsReDdYHp7nMm54/LKTdFUyRDqg2vGSe6bnTu1xe0dFvMGQIhu12uX4sdKPZWf7XR6roP5hYc1xeOlNBjZh13zUM=
Received: from PH7PR02CA0024.namprd02.prod.outlook.com (2603:10b6:510:33d::10)
 by CH3PR10MB7435.namprd10.prod.outlook.com (2603:10b6:610:15c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.14; Wed, 7 Oct
 2026 10:32:01 +0000
Received: from CY7PEPF000000EF.namprd04.prod.outlook.com
 (2603:10b6:510:33d:cafe::37) by PH7PR02CA0024.outlook.office365.com
 (2603:10b6:510:33d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 10:32:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY7PEPF000000EF.mail.protection.outlook.com (10.167.247.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 10:31:59 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:31:17 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:31:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 7 Oct 2026 05:31:17 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 697ATiT3013473;
	Wed, 7 Oct 2026 05:31:13 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v12 19/20] dmaengine: ti: k3-udma-v2: Update glue layer to support PKTDMA V2
Date: Wed, 7 Oct 2026 15:59:00 +0530
Message-ID: <20261007102936.2402427-20-s-adivi@ti.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007102936.2402427-1-s-adivi@ti.com>
References: <20261007102936.2402427-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CY7PEPF000000EF:EE_|CH3PR10MB7435:EE_
X-MS-Office365-Filtering-Correlation-Id: bfdc2392-32fa-4a0f-d7ca-08df245e37d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|23010399003|36860700016|10067099003|56012099006|6133799003|3023799007|921020|13003099007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	weLQ5ZAF5YGdW7CLyJjfhbTWDR86TUcAOxGXoZ5+wbfSkP47a7ugeCpLCqObgX+vB9fI6IVq9RU4CLoiliEjMgeVabPZGI6xj0w3aGqPlQB/cpVoMR1KzIZ+6zfX7xF97KuGVdlfVvuBDGhoPfnDteAU1OKEae1qaJvF/Yerwft3mlOrdqgn75EswjXLXDQ6hTiL6pVGihiLrZ6nty5Ic8Ed5UJRleb1huFbkOK9/iQ8cO8753oKNS4N7JBiWqvd2uaYUyC/ph0HO1GcJYzCI4qlFlKMZ/6CLHV242X3qOim5qfB7883xQmSfr0dVL0S/yUkV1xWEVyqs3I3yN2wPiNxK0VVEm+9oqjaJPGnUvy4NFfphkymZpTdJ9A737WYHo7rX+c1CvYrtQQXYiAUGE+KZ9bISwxMbu+pyDXUiAHRTwntYIGOgTvz7DdvtsXeijdjQWlLt+yyzZ1tZoJQs/tZbtmXOqa9vgB7yGPavD3dGMalU/7j8jiCFJBikH7TlZpyuvK8Bgp5EfZQxv4BfwjV9yNX1QXn+QKiw74qdXDSwhyKpek+0UO32KArWiuQGPzj2Vz8py9VDJbikfdD1pt/jusnm6PMV+8N31Ab21+fXkPpGVHV07L7rd+rLpQbXmDPfAM5yl1kYxZBVVYkoYzLwbWJT+CjAQ7d/MLFtiA82dOWIocWKPf36wpToKBC
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(10067099003)(56012099006)(6133799003)(3023799007)(921020)(13003099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0ZzvVNNcBnimpeXxuT3BMnN/qJbjhaP5ExtfbMc/fgfXhkn6JzeTeWX3Nx7rm1IF02rkl9lyATtnnG75YrmMVa57wrC8xMrvFMjQBs1vDhEzUfgJCH/oAGjwLEIL5GiCGY9s7kx0RBZ08ZeNmrQDTLSPcnQaEmJkMLM2O/l0DgH/UqfIHfkP6qKZRt/qgmRw571ttZ6dVzgFm8z4AVwKoziFxxu/yBzCnU+zethkwhnX2ENGMuv4T4o2euIYUv12ZKG5RWAMKgz55ZRndtKSExPNM6kqL4w+SfDUtgherWxXsZVtqsECuzynYy2sUddCMXGNENZetLvz8a5BCet8hQscAEUEBBbI+HUd1QFvb3zIcSHzVX3Ei1vGYptsZ8qOjAEHR7boHDhxbgdT7Dl0CvC0cnZI0o6c2YO8eTvJy5H7v3HT1LKjiWiTRprj7FXD
X-Exchange-RoutingPolicyChecked:
	KFZ/YtPPSWp6cO1vhzNGxWIhDw1Ag/2HsCO2Xf489zkT21IozSeZerLiIADj43TsD3r9mJNEHNYqOudCRD5FyGKQtq+05Ep/y66oOgr4RxxacYK7GMbwmgzYYVqReX/47qa2PJZ0rTkizuTZAZINJvkYyQcOqqm6/ojLUf9yfjR1t1hmzklvihIbv6t5a5h2er28I4qTzJlDTP2tvsd5irjRgIXN+TTx2vbwjDJ4SOL5BoAnwkOps6CDZjkpYQFTRnVXRfYRxFtFORzfBne0MjaFiUGud8+SDbH1xoO6ENdb6SPOzKRBsdSqW8nc6jRn62ela7Gch2qd8UlnOlccGA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:31:59.1308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfdc2392-32fa-4a0f-d7ca-08df245e37d5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY7PEPF000000EF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7435
X-Authority-Analysis: v=2.4 cv=as8nmiZV c=1 sm=1 tr=0 ts=6ac61fa6 cx=c_pps
 a=5av3elwsUCsOTZAZyay1PA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=4Ig8warNfptl5lTuD7MA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX9UomnO2JCRON
 ewyVN7WPlk7cFdSRQ3GmSpmh6HgIJYEWsjWC1EvRyW8HkhPZcReGm+xN22nYyX1sqolIdUFVO6y
 0ABHJcbmh+JqR6rcJWYV3FySsjddUiM=
X-Proofpoint-ORIG-GUID: gctnOxIMJELeG6eEp9JCEwv3sYIr_WiF
X-Proofpoint-GUID: gctnOxIMJELeG6eEp9JCEwv3sYIr_WiF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfXwZTFD0aUNpLY
 IACX7f0Ztqxw15zIspyFgF7PPGhRp0V/dyFWUombMpsQAYOaiY6+htf8v2QPam4ckNFUYp651A9
 GnBsZoAMfy7egzA5nwrX4p6xtZiTtnpJTSI6rmHj1RsDk59AejTQ83BMA10Q0Tqtgs9AnXlpeza
 /1Vub3ggp0fz3f1vFzAgfyHYYfTQV6NnRM4BZHxsp0HwUc++BUK3MHjZ18KKhbR3Ej4qUnmugMP
 ehnyBAnEkRa9vaOtFf3Qg1EDF8uaoJV3HH6/YkfVZbynK2Y/yk7xNQJb9YtZj67Ylb7J2n67u7B
 sX26wzqlSZGXBi/QYm705DeMV4mve6pVWpbakkXpwb0EeGmNEWMXfmXOgH0mMnwZOhCuJ6i/dh0
 Sz+lAWnyfVmv26KByDd39eboq4OSPV/zlnep0+JqmxVYnxfglFzAozrDGlZWIUYOg1MoI4kTmla
 Hrv6KUDMNvwjauvFY7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070041

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
index cd705fcc94f08..b71e8129459c4 100644
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
@@ -714,6 +725,8 @@ u32 xudma_rchanrt_read(struct udma_rchan *rchan, int reg);
 void xudma_rchanrt_write(struct udma_rchan *rchan, int reg, u32 val);
 bool xudma_rflow_is_gp(struct udma_dev *ud, int id);
 int xudma_get_rflow_ring_offset(struct udma_dev *ud);
+u32 xudma_rflowrt_read(struct udma_rflow *rflow, int reg);
+void xudma_rflowrt_write(struct udma_rflow *rflow, int reg, u32 val);
 
 int xudma_is_pktdma(struct udma_dev *ud);
 
-- 
2.55.0

