Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7CD4314BA;
	Fri, 24 Jul 2026 10:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888554; cv=fail; b=Ys+2azBW/NEdLPVoaOZDFMApRjzd4NAhT02V8kDtCq9MBEzJfqd33RMIwd1WoYYMmn/5G2yCWn7Swmgs4B+FBimB22ez/PdoKAunK0uriVfe3EyqQ9HtOh2C96SN5azPVj2AEcoARowk4E+SM0W/N4MZ3eYNSsupc+iS+2uiL5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888554; c=relaxed/simple;
	bh=w6xyZI8go91jWeBC5t5GFMFd1VRtnxQRjvIYLx3mlgI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L9srmf7uD+PKm8xzmsqwJMI8s0tKXt4r5s4gv7N3U0t6KhH621tQPR5hJy6z+LlzAi7qpCCLhwr58OMFNY0ImMcr7miFjfulNEkc+L/V7nZVp0Ar9IDdenWZPdG9+/rKkq3daqRjMegufvlUQ5LR3KQfZ8FOj//p3/PZq+FT2CY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=dRrnfQoG; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=k8GAoK+U; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="dRrnfQoG";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="k8GAoK+U"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OAFjFM785785;
	Fri, 24 Jul 2026 05:22:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=3ldUeE4iBKzmF8Tbb0OhdK0QI7tIiWjIm4qgipt7M
	/8=; b=dRrnfQoGgwDk/IVhjRLrHCMrGSdPQ0RgSviXxNncQq8D29Ypqul4xKncn
	3wGfGohBlJ1+2GUzRk8nxBRnuNCZhGD6fzM7EmaFQlNSi596vFUb3q/THs61Acp0
	khHFWkBkYfzAs6yzbnVmgeH5pCiZTUCMPundU9IorF28+LgPXUdxsYdX81cB6Fgm
	9b2IF3QcKoiBujfUgu+Fy7qoStVbs1py6ioW1ytbnRuVpV73RAgVqmAqDNKhyw4o
	NK97vDslVI5VLtnj2jdD1m2PiVsCDPnN7FDs33aY3PKRosHCS82+I1K+NaZe5Pv7
	2q+t19E61j2lNRPz8dzzyGXC+0s/w==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010027.outbound.protection.outlook.com [52.101.46.27])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fm5p304m2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 05:22:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+Qysa0a3xt/SPTGw4WTjnNpM2OJTLaZfdK4eCRqR6T6ZMsBs1Ow7V3489OjPrmOdB0YltBN5KxkVa7vttSGE3S8yyHEHEDR+eAY87dD40ylusxYV7xH3bdrzFaBPc83VG1D2btO72Mq4E1J2v/U9SMRR7r4a/KXkQKuGIOPP4i5e3JkA6xzCkSSQu3K4elTGCpvZyoAgOs3BnMWfAZziy6pICmwWVfNXggxzx7cRpHu7mGIMNgXDW94FWHpMeuDXUTFB7fMJH8w2+U0aj+EJ++PABdSjFksdu0MhYEXOW5wyhoZPmJ2sQotACPzLfDs3HRyfraI+C5NIBiEfFYmfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ldUeE4iBKzmF8Tbb0OhdK0QI7tIiWjIm4qgipt7M/8=;
 b=JE7wbY6yZN6Hyq/M3amSAIKzbdDIEgoYVgnYMTE4s9gq+grVut1j15KYy5czocTQUHIbjdJg64DBIIpBnfa8rCKfsxGqED6BBiTzNKBw3rgPPoxDiviYDKoFlCLavaeQwtv5Y+1qpWS8pf4KfYyHWF6NjdceDgYzffAKDP4wEJLf/GvCHik1Z+Ys294z84hCnsf3SLseoeeWIudLdPgrQkHzXDQ4P3Uu+AMS4w/S2DxrWEB/wbBWvaKZWcHoNPCRrcHQVy7zRnSDK4MT9s0S/XwepM+rPHKnROo56HyrZwgX52VjFOB0mjCv6NQKlSsYZzkjV+CM/OGa1PubI76S3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ldUeE4iBKzmF8Tbb0OhdK0QI7tIiWjIm4qgipt7M/8=;
 b=k8GAoK+Ule4c2LA+fjnxhGpo4EjcUDQX4Zf1hL/6Z+UmNtHEPLKq8uN6SYzW1FYNWxrWBMzI6w8xDZKEBpBGpQZeuff3y+S+pqTT1YGwdNvkAilHDuP8+GI/OPLQ/xbmRCDiyP9US+pysQl10Tk27WLq/FmL7t59/2VQ8Vsn4C4=
Received: from CH0PR03CA0111.namprd03.prod.outlook.com (2603:10b6:610:cd::26)
 by LV0PR10MB997590.namprd10.prod.outlook.com (2603:10b6:408:344::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Fri, 24 Jul
 2026 10:22:16 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:cd:cafe::6d) by CH0PR03CA0111.outlook.office365.com
 (2603:10b6:610:cd::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.12 via Frontend Transport; Fri,
 24 Jul 2026 10:22:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 10:22:16 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:22:14 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:22:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 24 Jul 2026 05:22:14 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66OALMFO3017088;
	Fri, 24 Jul 2026 05:22:09 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v7 09/19] dmaengine: ti: k3-udma: move resource management functions to k3-udma-common.c
Date: Fri, 24 Jul 2026 15:50:42 +0530
Message-ID: <20260724102115.2854-10-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|LV0PR10MB997590:EE_
X-MS-Office365-Filtering-Correlation-Id: c1e40bd1-9b2d-4f21-5e73-08dee96d6f78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|23010399003|36860700016|921020|6133799003|18002099003|22082099003|56012099006|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info:
	bG67+D6nkX56ACgbQPCo1b0sIAbfWy0TIdqW5ZYYpnPLx23hxm5dcMopu7AawtqPzmX7OjoKlKzlvHQNhzwDC/P0Gzw/ebus7G+hKu3Tnw5BVSktrkujdF/0KUPZ0eDLdih46rHlg9ZxNsoFOTJH2jwuRsZlfSEnv7XcA29Z3Vtzx5pYnA55BRjKw6r7uZ5ZM6CcEenLFGpChkQWbP0bJQT2ErDC0goPZ2HR8RcY6M51GUaqkqOn7s53Z+hfjZ/uGUj2ssvSVmhLLpvgj1E8eVornYHP1J5X2zLEba6Y7/M7CKkuHOYoSWoD4OcvioIDQoE6G24E2Et8OeffBJunysXYvbYUDtdcaNpiRgsLwIVZRiuLfbtxHjqfNQzDt+mQBPlllPow+9MzqsmEdW7y4eirQqPEDycK4iJhHYJFYaNoSL6ZqWFXYxEr1s7V/lBq11zc78Sj+7z5C2LN2beQQwZhXm6WWko68p0hiGBRpS0lOo96SIqD/0Eetr61817yAhnYhNMKUQfQX3Cv6Z2WZaM30O23F1Y+5IQoXfDFCA7pVeI9TToMHLb8ka0E8dWQEujuAiLgD8W3TPOjL4FWuj5fUOyzyTwKUGfc8CaTkhw5tetbFVjx4rU98d2gvH/Bl/dnujWW1ZSlUqqbWEpv4n1ruP9EQB/gs++PcbWQ/OpHyrDiMZcaRL+jxa/Xtaekq60FtbuSjQDn4i8xt8qbubOhSZixI8PdAy3qZ2Qtsj58xhozJ1jNCX79Fuy9r7SQ
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(921020)(6133799003)(18002099003)(22082099003)(56012099006)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uWbEauqna+ubz6yIVpLqJRPbJTZWtJjHlYL1/NtagvrNWgl3dDT6XdusxxDJYeRkKwKA3vlH5LPO5xUQ08Y8B5kevS0OtdFq228r7WpI5+ONFDl5XHQF4rTFAtnQyz6lO3u8qTIlwSDdShDudmVfwY0TQDdycS88tjMaBv6Rg3Y0CRtzY+tmlStGVzhgbLKgIkwrHOWcnZLqxD/6I0PbQKrNWjZhSUyH6a4kE/jrqbd+6dPQHjBq7HYNhARZ9yYQTdqQxQe/vj4lBro20qp4hDRr3mbN+f791+SdfVEHCy94ZEzpP4JoVUBnqgjm3pfsiJ2TehR2cd8F0bqFOySod/lLgHbsi0h3mhv9o0g8y/k4fbV3p+pWs9Ht/QSKE/JMBj333E6Os1Fd5SCLXYUN1mj9Bmysf4vAU8H/ZlL1Fd77GKMhVY0L/ZUFBp/ceWl6
X-Exchange-RoutingPolicyChecked:
	miEV9sHbfiGDXeLzpowPDdZVBY7IMubIzn2GFxDi1OnQqfmePq8ayuy6Udi4BunhJnlmZKQRcovqrgTKLBXVEoCALeM4duxSYwergeBwEreNLZ/5V0PWaSkZBLoK1sAuRNpX0bzWdrSXh1sPQtm5GnPELy7itVZwlRYmZpRTTjLAw43mDrBAhpMLKA1+EhSYtK80zmnKr5WvoBvVUCNZKMPzG27iO+af6+x7tgrEG5HJjDwN53DYFERHkGu5WrFckStr0JflxGY1O61XZdyzi4rO/uO9pti+bW1KceYHjjNiSSmdKWrP4I5YUnTtjqaZbp2ZZp46yGm3rsxfgcubeA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 10:22:16.3112
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e40bd1-9b2d-4f21-5e73-08dee96d6f78
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997590
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfX5J+NXj0hE8JY
 hMV67ut/AIkIaFKJuQwf1dD9o+kKElCLKmCnTHr/QG1+UugEm+HHGuH7hmiJ5DWLszNStBJl7BV
 pFeXw5PfgjRocBgMbjMGMr/sV8+SsBCZeIdutOckEy1etlyIRSVUbXlfxyWIX81j/EEJtu74t5l
 lvdNHk7Kwl/90FCBRo1ezVm6fq9aITEoAH2kOM0wURMsubib7YXrx/nYD3wwixY8TKpDj4KTneC
 OSlVl3S5O9ZABXp7YTKpCih4yeX3fFv60VqY034+m8pLkgaLtbvGeqrCZDQYJRThs/rKSWS6WZb
 Yu1/aFgArOzzdHP3owt/wFJpvCtvWX9JoFuAAJku6CVxDM8V5SjUBAtyIIZ5RJeoBTy/WDr2j02
 uxLXkzI7Dg1k7eA6JpwdGrGHvtsvZyxI0eZnQwWLvO06DaF8O+diFiX5aVduyE28TEwSZNNWhdK
 i3VqX2igGHs6phx69SA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfX5wEKhS7aDp/U
 qAjLJRtB+KxGlhnVPyaIEKehJ7zV3HDAHMDlieGLG+42cW03x9dhzmg/w477nMRm9Gd6KQJhtLG
 MMlYpoALwV3e/RyHs2hx/gVPV1AZgmA=
X-Proofpoint-GUID: GbJ3KRobmzxnoyU-HsA9tVdpbknvGDQO
X-Proofpoint-ORIG-GUID: GbJ3KRobmzxnoyU-HsA9tVdpbknvGDQO
X-Authority-Analysis: v=2.4 cv=C8PZDwP+ c=1 sm=1 tr=0 ts=6a633cdd cx=c_pps
 a=g+XQapjYtrKCWQI10hurPg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=AMbNDxq4J1R_ZtRBPm4A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240094

Move functions responsible for allocation and release of udma
resources such as channels, rings and flows from k3-udma.c
to the common k3-udma-common.c file.

The implementation of these functions is largely shared between K3 UDMA
and K3 UDMA v2. This refactor improves code reuse and maintainability
across multiple variants.

No functional changes intended.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 442 ++++++++++++++++++++++++++++++++
 drivers/dma/ti/k3-udma.c        | 423 ------------------------------
 drivers/dma/ti/k3-udma.h        |  21 ++
 3 files changed, 463 insertions(+), 423 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index 01aea77c25715..472903e7d1a9f 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -1891,5 +1891,447 @@ enum dmaengine_alignment udma_get_copy_align(struct udma_dev *ud)
 }
 EXPORT_SYMBOL_GPL(udma_get_copy_align);
 
+/**
+ * __udma_alloc_gp_rflow_range - alloc range of GP RX flows
+ * @ud: UDMA device
+ * @from: Start the search from this flow id number
+ * @cnt: Number of consecutive flow ids to allocate
+ *
+ * Allocate range of RX flow ids for future use, those flows can be requested
+ * only using explicit flow id number. if @from is set to -1 it will try to find
+ * first free range. if @from is positive value it will force allocation only
+ * of the specified range of flows.
+ *
+ * Returns -ENOMEM if can't find free range.
+ * -EEXIST if requested range is busy.
+ * -EINVAL if wrong input values passed.
+ * Returns flow id on success.
+ */
+int __udma_alloc_gp_rflow_range(struct udma_dev *ud, int from, int cnt)
+{
+	int start, tmp_from;
+	DECLARE_BITMAP(tmp, K3_UDMA_MAX_RFLOWS);
+
+	tmp_from = from;
+	if (tmp_from < 0)
+		tmp_from = ud->rchan_cnt;
+	/* default flows can't be allocated and accessible only by id */
+	if (tmp_from < ud->rchan_cnt)
+		return -EINVAL;
+
+	if (tmp_from + cnt > ud->rflow_cnt)
+		return -EINVAL;
+
+	bitmap_or(tmp, ud->rflow_gp_map, ud->rflow_gp_map_allocated,
+		  ud->rflow_cnt);
+
+	start = bitmap_find_next_zero_area(tmp,
+					   ud->rflow_cnt,
+					   tmp_from, cnt, 0);
+	if (start >= ud->rflow_cnt)
+		return -ENOMEM;
+
+	if (from >= 0 && start != from)
+		return -EEXIST;
+
+	bitmap_set(ud->rflow_gp_map_allocated, start, cnt);
+	return start;
+}
+EXPORT_SYMBOL_GPL(__udma_alloc_gp_rflow_range);
+
+int __udma_free_gp_rflow_range(struct udma_dev *ud, int from, int cnt)
+{
+	if (from < ud->rchan_cnt)
+		return -EINVAL;
+	if (from + cnt > ud->rflow_cnt)
+		return -EINVAL;
+
+	bitmap_clear(ud->rflow_gp_map_allocated, from, cnt);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(__udma_free_gp_rflow_range);
+
+struct udma_rflow *__udma_get_rflow(struct udma_dev *ud, int id)
+{
+	/*
+	 * Attempt to request rflow by ID can be made for any rflow
+	 * if not in use with assumption that caller knows what's doing.
+	 * TI-SCI FW will perform additional permission check ant way, it's
+	 * safe
+	 */
+
+	if (id < 0 || id >= ud->rflow_cnt)
+		return ERR_PTR(-ENOENT);
+
+	if (test_bit(id, ud->rflow_in_use))
+		return ERR_PTR(-ENOENT);
+
+	if (ud->rflow_gp_map) {
+		/* GP rflow has to be allocated first */
+		if (!test_bit(id, ud->rflow_gp_map) &&
+		    !test_bit(id, ud->rflow_gp_map_allocated))
+			return ERR_PTR(-EINVAL);
+	}
+
+	dev_dbg(ud->dev, "get rflow%d\n", id);
+	set_bit(id, ud->rflow_in_use);
+	return &ud->rflows[id];
+}
+EXPORT_SYMBOL_GPL(__udma_get_rflow);
+
+void __udma_put_rflow(struct udma_dev *ud, struct udma_rflow *rflow)
+{
+	if (!test_bit(rflow->id, ud->rflow_in_use)) {
+		dev_err(ud->dev, "attempt to put unused rflow%d\n", rflow->id);
+		return;
+	}
+
+	dev_dbg(ud->dev, "put rflow%d\n", rflow->id);
+	clear_bit(rflow->id, ud->rflow_in_use);
+}
+EXPORT_SYMBOL_GPL(__udma_put_rflow);
+
+#define UDMA_RESERVE_RESOURCE(res)					\
+struct udma_##res *__udma_reserve_##res(struct udma_dev *ud,	\
+					       enum udma_tp_level tpl,	\
+					       int id)			\
+{									\
+	if (id >= 0) {							\
+		if (test_bit(id, ud->res##_map)) {			\
+			dev_err(ud->dev, "res##%d is in use\n", id);	\
+			return ERR_PTR(-ENOENT);			\
+		}							\
+	} else {							\
+		int start;						\
+									\
+		if (tpl >= ud->res##_tpl.levels)			\
+			tpl = ud->res##_tpl.levels - 1;			\
+									\
+		start = ud->res##_tpl.start_idx[tpl];			\
+									\
+		id = find_next_zero_bit(ud->res##_map, ud->res##_cnt,	\
+					start);				\
+		if (id == ud->res##_cnt) {				\
+			return ERR_PTR(-ENOENT);			\
+		}							\
+	}								\
+									\
+	set_bit(id, ud->res##_map);					\
+	return &ud->res##s[id];						\
+}
+
+UDMA_RESERVE_RESOURCE(bchan);
+EXPORT_SYMBOL_GPL(__udma_reserve_bchan);
+UDMA_RESERVE_RESOURCE(tchan);
+EXPORT_SYMBOL_GPL(__udma_reserve_tchan);
+UDMA_RESERVE_RESOURCE(rchan);
+EXPORT_SYMBOL_GPL(__udma_reserve_rchan);
+
+int udma_get_tchan(struct udma_chan *uc)
+{
+	struct udma_dev *ud = uc->ud;
+	int ret;
+
+	if (uc->tchan) {
+		dev_dbg(ud->dev, "chan%d: already have tchan%d allocated\n",
+			uc->id, uc->tchan->id);
+		return 0;
+	}
+
+	/*
+	 * mapped_channel_id is -1 for UDMA, BCDMA and PKTDMA unmapped channels.
+	 * For PKTDMA mapped channels it is configured to a channel which must
+	 * be used to service the peripheral.
+	 */
+	uc->tchan = __udma_reserve_tchan(ud, uc->config.channel_tpl,
+					 uc->config.mapped_channel_id);
+	if (IS_ERR(uc->tchan)) {
+		ret = PTR_ERR(uc->tchan);
+		uc->tchan = NULL;
+		return ret;
+	}
+
+	if (ud->tflow_cnt) {
+		int tflow_id;
+
+		/* Only PKTDMA have support for tx flows */
+		if (uc->config.default_flow_id >= 0)
+			tflow_id = uc->config.default_flow_id;
+		else
+			tflow_id = uc->tchan->id;
+
+		if (test_bit(tflow_id, ud->tflow_map)) {
+			dev_err(ud->dev, "tflow%d is in use\n", tflow_id);
+			clear_bit(uc->tchan->id, ud->tchan_map);
+			uc->tchan = NULL;
+			return -ENOENT;
+		}
+
+		uc->tchan->tflow_id = tflow_id;
+		set_bit(tflow_id, ud->tflow_map);
+	} else {
+		uc->tchan->tflow_id = -1;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(udma_get_tchan);
+
+int udma_get_rchan(struct udma_chan *uc)
+{
+	struct udma_dev *ud = uc->ud;
+	int ret;
+
+	if (uc->rchan) {
+		dev_dbg(ud->dev, "chan%d: already have rchan%d allocated\n",
+			uc->id, uc->rchan->id);
+		return 0;
+	}
+
+	/*
+	 * mapped_channel_id is -1 for UDMA, BCDMA and PKTDMA unmapped channels.
+	 * For PKTDMA mapped channels it is configured to a channel which must
+	 * be used to service the peripheral.
+	 */
+	uc->rchan = __udma_reserve_rchan(ud, uc->config.channel_tpl,
+					 uc->config.mapped_channel_id);
+	if (IS_ERR(uc->rchan)) {
+		ret = PTR_ERR(uc->rchan);
+		uc->rchan = NULL;
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(udma_get_rchan);
+
+int udma_get_chan_pair(struct udma_chan *uc)
+{
+	struct udma_dev *ud = uc->ud;
+	int chan_id, end;
+
+	if ((uc->tchan && uc->rchan) && uc->tchan->id == uc->rchan->id) {
+		dev_info(ud->dev, "chan%d: already have %d pair allocated\n",
+			 uc->id, uc->tchan->id);
+		return 0;
+	}
+
+	if (uc->tchan) {
+		dev_err(ud->dev, "chan%d: already have tchan%d allocated\n",
+			uc->id, uc->tchan->id);
+		return -EBUSY;
+	} else if (uc->rchan) {
+		dev_err(ud->dev, "chan%d: already have rchan%d allocated\n",
+			uc->id, uc->rchan->id);
+		return -EBUSY;
+	}
+
+	/* Can be optimized, but let's have it like this for now */
+	end = min(ud->tchan_cnt, ud->rchan_cnt);
+	/*
+	 * Try to use the highest TPL channel pair for MEM_TO_MEM channels
+	 * Note: in UDMAP the channel TPL is symmetric between tchan and rchan
+	 */
+	chan_id = ud->tchan_tpl.start_idx[ud->tchan_tpl.levels - 1];
+	for (; chan_id < end; chan_id++) {
+		if (!test_bit(chan_id, ud->tchan_map) &&
+		    !test_bit(chan_id, ud->rchan_map))
+			break;
+	}
+
+	if (chan_id == end)
+		return -ENOENT;
+
+	set_bit(chan_id, ud->tchan_map);
+	set_bit(chan_id, ud->rchan_map);
+	uc->tchan = &ud->tchans[chan_id];
+	uc->rchan = &ud->rchans[chan_id];
+
+	/* UDMA does not use tx flows */
+	uc->tchan->tflow_id = -1;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(udma_get_chan_pair);
+
+int udma_get_rflow(struct udma_chan *uc, int flow_id)
+{
+	struct udma_dev *ud = uc->ud;
+	int ret;
+
+	if (!uc->rchan) {
+		dev_err(ud->dev, "chan%d: does not have rchan??\n", uc->id);
+		return -EINVAL;
+	}
+
+	if (uc->rflow) {
+		dev_dbg(ud->dev, "chan%d: already have rflow%d allocated\n",
+			uc->id, uc->rflow->id);
+		return 0;
+	}
+
+	uc->rflow = __udma_get_rflow(ud, flow_id);
+	if (IS_ERR(uc->rflow)) {
+		ret = PTR_ERR(uc->rflow);
+		uc->rflow = NULL;
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(udma_get_rflow);
+
+void udma_put_rchan(struct udma_chan *uc)
+{
+	struct udma_dev *ud = uc->ud;
+
+	if (uc->rchan) {
+		dev_dbg(ud->dev, "chan%d: put rchan%d\n", uc->id,
+			uc->rchan->id);
+		clear_bit(uc->rchan->id, ud->rchan_map);
+		uc->rchan = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(udma_put_rchan);
+
+void udma_put_tchan(struct udma_chan *uc)
+{
+	struct udma_dev *ud = uc->ud;
+
+	if (uc->tchan) {
+		dev_dbg(ud->dev, "chan%d: put tchan%d\n", uc->id,
+			uc->tchan->id);
+		clear_bit(uc->tchan->id, ud->tchan_map);
+
+		if (uc->tchan->tflow_id >= 0)
+			clear_bit(uc->tchan->tflow_id, ud->tflow_map);
+
+		uc->tchan = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(udma_put_tchan);
+
+void udma_put_rflow(struct udma_chan *uc)
+{
+	struct udma_dev *ud = uc->ud;
+
+	if (uc->rflow) {
+		dev_dbg(ud->dev, "chan%d: put rflow%d\n", uc->id,
+			uc->rflow->id);
+		__udma_put_rflow(ud, uc->rflow);
+		uc->rflow = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(udma_put_rflow);
+
+void udma_free_tx_resources(struct udma_chan *uc)
+{
+	if (!uc->tchan)
+		return;
+
+	k3_ringacc_ring_free(uc->tchan->t_ring);
+	k3_ringacc_ring_free(uc->tchan->tc_ring);
+	uc->tchan->t_ring = NULL;
+	uc->tchan->tc_ring = NULL;
+
+	udma_put_tchan(uc);
+}
+EXPORT_SYMBOL_GPL(udma_free_tx_resources);
+
+void udma_free_rx_resources(struct udma_chan *uc)
+{
+	if (!uc->rchan)
+		return;
+
+	if (uc->rflow) {
+		struct udma_rflow *rflow = uc->rflow;
+
+		k3_ringacc_ring_free(rflow->fd_ring);
+		k3_ringacc_ring_free(rflow->r_ring);
+		rflow->fd_ring = NULL;
+		rflow->r_ring = NULL;
+
+		udma_put_rflow(uc);
+	}
+
+	udma_put_rchan(uc);
+}
+EXPORT_SYMBOL_GPL(udma_free_rx_resources);
+
+void udma_free_chan_resources(struct dma_chan *chan)
+{
+	struct udma_chan *uc = to_udma_chan(chan);
+	struct udma_dev *ud = to_udma_dev(chan->device);
+
+	udma_terminate_all(chan);
+	if (uc->terminated_desc) {
+		ud->reset_chan(uc, false);
+		udma_reset_rings(uc);
+	}
+
+	cancel_delayed_work_sync(&uc->tx_drain.work);
+
+	if (uc->irq_num_ring > 0) {
+		free_irq(uc->irq_num_ring, uc);
+
+		uc->irq_num_ring = 0;
+	}
+	if (uc->irq_num_udma > 0) {
+		free_irq(uc->irq_num_udma, uc);
+
+		uc->irq_num_udma = 0;
+	}
+
+	/* Release PSI-L pairing */
+	if (uc->psil_paired && ud->psil_unpair) {
+		ud->psil_unpair(ud, uc->config.src_thread,
+				  uc->config.dst_thread);
+		uc->psil_paired = false;
+	}
+
+	vchan_free_chan_resources(&uc->vc);
+	tasklet_kill(&uc->vc.task);
+
+	bcdma_free_bchan_resources(uc);
+	udma_free_tx_resources(uc);
+	udma_free_rx_resources(uc);
+	udma_reset_uchan(uc);
+
+	if (uc->use_dma_pool) {
+		dma_pool_destroy(uc->hdesc_pool);
+		uc->use_dma_pool = false;
+	}
+}
+EXPORT_SYMBOL_GPL(udma_free_chan_resources);
+
+void bcdma_put_bchan(struct udma_chan *uc)
+{
+	struct udma_dev *ud = uc->ud;
+
+	if (uc->bchan) {
+		dev_dbg(ud->dev, "chan%d: put bchan%d\n", uc->id,
+			uc->bchan->id);
+		clear_bit(uc->bchan->id, ud->bchan_map);
+		uc->bchan = NULL;
+		uc->tchan = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(bcdma_put_bchan);
+
+void bcdma_free_bchan_resources(struct udma_chan *uc)
+{
+	if (!uc->bchan)
+		return;
+
+	k3_ringacc_ring_free(uc->bchan->tc_ring);
+	k3_ringacc_ring_free(uc->bchan->t_ring);
+	uc->bchan->tc_ring = NULL;
+	uc->bchan->t_ring = NULL;
+	k3_configure_chan_coherency(&uc->vc.chan, 0);
+
+	bcdma_put_bchan(uc);
+}
+EXPORT_SYMBOL_GPL(bcdma_free_bchan_resources);
+
 MODULE_DESCRIPTION("Texas Instruments K3 UDMA Common Library");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 89c887bc86a34..753acf1e13fa2 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -423,135 +423,6 @@ static irqreturn_t udma_udma_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-/**
- * __udma_alloc_gp_rflow_range - alloc range of GP RX flows
- * @ud: UDMA device
- * @from: Start the search from this flow id number
- * @cnt: Number of consecutive flow ids to allocate
- *
- * Allocate range of RX flow ids for future use, those flows can be requested
- * only using explicit flow id number. if @from is set to -1 it will try to find
- * first free range. if @from is positive value it will force allocation only
- * of the specified range of flows.
- *
- * Returns -ENOMEM if can't find free range.
- * -EEXIST if requested range is busy.
- * -EINVAL if wrong input values passed.
- * Returns flow id on success.
- */
-static int __udma_alloc_gp_rflow_range(struct udma_dev *ud, int from, int cnt)
-{
-	int start, tmp_from;
-	DECLARE_BITMAP(tmp, K3_UDMA_MAX_RFLOWS);
-
-	tmp_from = from;
-	if (tmp_from < 0)
-		tmp_from = ud->rchan_cnt;
-	/* default flows can't be allocated and accessible only by id */
-	if (tmp_from < ud->rchan_cnt)
-		return -EINVAL;
-
-	if (tmp_from + cnt > ud->rflow_cnt)
-		return -EINVAL;
-
-	bitmap_or(tmp, ud->rflow_gp_map, ud->rflow_gp_map_allocated,
-		  ud->rflow_cnt);
-
-	start = bitmap_find_next_zero_area(tmp,
-					   ud->rflow_cnt,
-					   tmp_from, cnt, 0);
-	if (start >= ud->rflow_cnt)
-		return -ENOMEM;
-
-	if (from >= 0 && start != from)
-		return -EEXIST;
-
-	bitmap_set(ud->rflow_gp_map_allocated, start, cnt);
-	return start;
-}
-
-static int __udma_free_gp_rflow_range(struct udma_dev *ud, int from, int cnt)
-{
-	if (from < ud->rchan_cnt)
-		return -EINVAL;
-	if (from + cnt > ud->rflow_cnt)
-		return -EINVAL;
-
-	bitmap_clear(ud->rflow_gp_map_allocated, from, cnt);
-	return 0;
-}
-
-static struct udma_rflow *__udma_get_rflow(struct udma_dev *ud, int id)
-{
-	/*
-	 * Attempt to request rflow by ID can be made for any rflow
-	 * if not in use with assumption that caller knows what's doing.
-	 * TI-SCI FW will perform additional permission check ant way, it's
-	 * safe
-	 */
-
-	if (id < 0 || id >= ud->rflow_cnt)
-		return ERR_PTR(-ENOENT);
-
-	if (test_bit(id, ud->rflow_in_use))
-		return ERR_PTR(-ENOENT);
-
-	if (ud->rflow_gp_map) {
-		/* GP rflow has to be allocated first */
-		if (!test_bit(id, ud->rflow_gp_map) &&
-		    !test_bit(id, ud->rflow_gp_map_allocated))
-			return ERR_PTR(-EINVAL);
-	}
-
-	dev_dbg(ud->dev, "get rflow%d\n", id);
-	set_bit(id, ud->rflow_in_use);
-	return &ud->rflows[id];
-}
-
-static void __udma_put_rflow(struct udma_dev *ud, struct udma_rflow *rflow)
-{
-	if (!test_bit(rflow->id, ud->rflow_in_use)) {
-		dev_err(ud->dev, "attempt to put unused rflow%d\n", rflow->id);
-		return;
-	}
-
-	dev_dbg(ud->dev, "put rflow%d\n", rflow->id);
-	clear_bit(rflow->id, ud->rflow_in_use);
-}
-
-#define UDMA_RESERVE_RESOURCE(res)					\
-static struct udma_##res *__udma_reserve_##res(struct udma_dev *ud,	\
-					       enum udma_tp_level tpl,	\
-					       int id)			\
-{									\
-	if (id >= 0) {							\
-		if (test_bit(id, ud->res##_map)) {			\
-			dev_err(ud->dev, "res##%d is in use\n", id);	\
-			return ERR_PTR(-ENOENT);			\
-		}							\
-	} else {							\
-		int start;						\
-									\
-		if (tpl >= ud->res##_tpl.levels)			\
-			tpl = ud->res##_tpl.levels - 1;			\
-									\
-		start = ud->res##_tpl.start_idx[tpl];			\
-									\
-		id = find_next_zero_bit(ud->res##_map, ud->res##_cnt,	\
-					start);				\
-		if (id == ud->res##_cnt) {				\
-			return ERR_PTR(-ENOENT);			\
-		}							\
-	}								\
-									\
-	set_bit(id, ud->res##_map);					\
-	return &ud->res##s[id];						\
-}
-
-UDMA_RESERVE_RESOURCE(bchan);
-UDMA_RESERVE_RESOURCE(tchan);
-UDMA_RESERVE_RESOURCE(rchan);
-
 static int bcdma_get_bchan(struct udma_chan *uc)
 {
 	struct udma_dev *ud = uc->ud;
@@ -585,223 +456,6 @@ static int bcdma_get_bchan(struct udma_chan *uc)
 	return 0;
 }
 
-static int udma_get_tchan(struct udma_chan *uc)
-{
-	struct udma_dev *ud = uc->ud;
-	int ret;
-
-	if (uc->tchan) {
-		dev_dbg(ud->dev, "chan%d: already have tchan%d allocated\n",
-			uc->id, uc->tchan->id);
-		return 0;
-	}
-
-	/*
-	 * mapped_channel_id is -1 for UDMA, BCDMA and PKTDMA unmapped channels.
-	 * For PKTDMA mapped channels it is configured to a channel which must
-	 * be used to service the peripheral.
-	 */
-	uc->tchan = __udma_reserve_tchan(ud, uc->config.channel_tpl,
-					 uc->config.mapped_channel_id);
-	if (IS_ERR(uc->tchan)) {
-		ret = PTR_ERR(uc->tchan);
-		uc->tchan = NULL;
-		return ret;
-	}
-
-	if (ud->tflow_cnt) {
-		int tflow_id;
-
-		/* Only PKTDMA have support for tx flows */
-		if (uc->config.default_flow_id >= 0)
-			tflow_id = uc->config.default_flow_id;
-		else
-			tflow_id = uc->tchan->id;
-
-		if (test_bit(tflow_id, ud->tflow_map)) {
-			dev_err(ud->dev, "tflow%d is in use\n", tflow_id);
-			clear_bit(uc->tchan->id, ud->tchan_map);
-			uc->tchan = NULL;
-			return -ENOENT;
-		}
-
-		uc->tchan->tflow_id = tflow_id;
-		set_bit(tflow_id, ud->tflow_map);
-	} else {
-		uc->tchan->tflow_id = -1;
-	}
-
-	return 0;
-}
-
-static int udma_get_rchan(struct udma_chan *uc)
-{
-	struct udma_dev *ud = uc->ud;
-	int ret;
-
-	if (uc->rchan) {
-		dev_dbg(ud->dev, "chan%d: already have rchan%d allocated\n",
-			uc->id, uc->rchan->id);
-		return 0;
-	}
-
-	/*
-	 * mapped_channel_id is -1 for UDMA, BCDMA and PKTDMA unmapped channels.
-	 * For PKTDMA mapped channels it is configured to a channel which must
-	 * be used to service the peripheral.
-	 */
-	uc->rchan = __udma_reserve_rchan(ud, uc->config.channel_tpl,
-					 uc->config.mapped_channel_id);
-	if (IS_ERR(uc->rchan)) {
-		ret = PTR_ERR(uc->rchan);
-		uc->rchan = NULL;
-		return ret;
-	}
-
-	return 0;
-}
-
-static int udma_get_chan_pair(struct udma_chan *uc)
-{
-	struct udma_dev *ud = uc->ud;
-	int chan_id, end;
-
-	if ((uc->tchan && uc->rchan) && uc->tchan->id == uc->rchan->id) {
-		dev_info(ud->dev, "chan%d: already have %d pair allocated\n",
-			 uc->id, uc->tchan->id);
-		return 0;
-	}
-
-	if (uc->tchan) {
-		dev_err(ud->dev, "chan%d: already have tchan%d allocated\n",
-			uc->id, uc->tchan->id);
-		return -EBUSY;
-	} else if (uc->rchan) {
-		dev_err(ud->dev, "chan%d: already have rchan%d allocated\n",
-			uc->id, uc->rchan->id);
-		return -EBUSY;
-	}
-
-	/* Can be optimized, but let's have it like this for now */
-	end = min(ud->tchan_cnt, ud->rchan_cnt);
-	/*
-	 * Try to use the highest TPL channel pair for MEM_TO_MEM channels
-	 * Note: in UDMAP the channel TPL is symmetric between tchan and rchan
-	 */
-	chan_id = ud->tchan_tpl.start_idx[ud->tchan_tpl.levels - 1];
-	for (; chan_id < end; chan_id++) {
-		if (!test_bit(chan_id, ud->tchan_map) &&
-		    !test_bit(chan_id, ud->rchan_map))
-			break;
-	}
-
-	if (chan_id == end)
-		return -ENOENT;
-
-	set_bit(chan_id, ud->tchan_map);
-	set_bit(chan_id, ud->rchan_map);
-	uc->tchan = &ud->tchans[chan_id];
-	uc->rchan = &ud->rchans[chan_id];
-
-	/* UDMA does not use tx flows */
-	uc->tchan->tflow_id = -1;
-
-	return 0;
-}
-
-static int udma_get_rflow(struct udma_chan *uc, int flow_id)
-{
-	struct udma_dev *ud = uc->ud;
-	int ret;
-
-	if (!uc->rchan) {
-		dev_err(ud->dev, "chan%d: does not have rchan??\n", uc->id);
-		return -EINVAL;
-	}
-
-	if (uc->rflow) {
-		dev_dbg(ud->dev, "chan%d: already have rflow%d allocated\n",
-			uc->id, uc->rflow->id);
-		return 0;
-	}
-
-	uc->rflow = __udma_get_rflow(ud, flow_id);
-	if (IS_ERR(uc->rflow)) {
-		ret = PTR_ERR(uc->rflow);
-		uc->rflow = NULL;
-		return ret;
-	}
-
-	return 0;
-}
-
-static void bcdma_put_bchan(struct udma_chan *uc)
-{
-	struct udma_dev *ud = uc->ud;
-
-	if (uc->bchan) {
-		dev_dbg(ud->dev, "chan%d: put bchan%d\n", uc->id,
-			uc->bchan->id);
-		clear_bit(uc->bchan->id, ud->bchan_map);
-		uc->bchan = NULL;
-		uc->tchan = NULL;
-	}
-}
-
-static void udma_put_rchan(struct udma_chan *uc)
-{
-	struct udma_dev *ud = uc->ud;
-
-	if (uc->rchan) {
-		dev_dbg(ud->dev, "chan%d: put rchan%d\n", uc->id,
-			uc->rchan->id);
-		clear_bit(uc->rchan->id, ud->rchan_map);
-		uc->rchan = NULL;
-	}
-}
-
-static void udma_put_tchan(struct udma_chan *uc)
-{
-	struct udma_dev *ud = uc->ud;
-
-	if (uc->tchan) {
-		dev_dbg(ud->dev, "chan%d: put tchan%d\n", uc->id,
-			uc->tchan->id);
-		clear_bit(uc->tchan->id, ud->tchan_map);
-
-		if (uc->tchan->tflow_id >= 0)
-			clear_bit(uc->tchan->tflow_id, ud->tflow_map);
-
-		uc->tchan = NULL;
-	}
-}
-
-static void udma_put_rflow(struct udma_chan *uc)
-{
-	struct udma_dev *ud = uc->ud;
-
-	if (uc->rflow) {
-		dev_dbg(ud->dev, "chan%d: put rflow%d\n", uc->id,
-			uc->rflow->id);
-		__udma_put_rflow(ud, uc->rflow);
-		uc->rflow = NULL;
-	}
-}
-
-static void bcdma_free_bchan_resources(struct udma_chan *uc)
-{
-	if (!uc->bchan)
-		return;
-
-	k3_ringacc_ring_free(uc->bchan->tc_ring);
-	k3_ringacc_ring_free(uc->bchan->t_ring);
-	uc->bchan->tc_ring = NULL;
-	uc->bchan->t_ring = NULL;
-	k3_configure_chan_coherency(&uc->vc.chan, 0);
-
-	bcdma_put_bchan(uc);
-}
-
 static int bcdma_alloc_bchan_resources(struct udma_chan *uc)
 {
 	struct k3_ring_cfg ring_cfg;
@@ -847,19 +501,6 @@ static int bcdma_alloc_bchan_resources(struct udma_chan *uc)
 	return ret;
 }
 
-static void udma_free_tx_resources(struct udma_chan *uc)
-{
-	if (!uc->tchan)
-		return;
-
-	k3_ringacc_ring_free(uc->tchan->t_ring);
-	k3_ringacc_ring_free(uc->tchan->tc_ring);
-	uc->tchan->t_ring = NULL;
-	uc->tchan->tc_ring = NULL;
-
-	udma_put_tchan(uc);
-}
-
 static int udma_alloc_tx_resources(struct udma_chan *uc)
 {
 	struct k3_ring_cfg ring_cfg;
@@ -917,25 +558,6 @@ static int udma_alloc_tx_resources(struct udma_chan *uc)
 	return ret;
 }
 
-static void udma_free_rx_resources(struct udma_chan *uc)
-{
-	if (!uc->rchan)
-		return;
-
-	if (uc->rflow) {
-		struct udma_rflow *rflow = uc->rflow;
-
-		k3_ringacc_ring_free(rflow->fd_ring);
-		k3_ringacc_ring_free(rflow->r_ring);
-		rflow->fd_ring = NULL;
-		rflow->r_ring = NULL;
-
-		udma_put_rflow(uc);
-	}
-
-	udma_put_rchan(uc);
-}
-
 static int udma_alloc_rx_resources(struct udma_chan *uc)
 {
 	struct udma_dev *ud = uc->ud;
@@ -2024,51 +1646,6 @@ static int udma_resume(struct dma_chan *chan)
 	return 0;
 }
 
-static void udma_free_chan_resources(struct dma_chan *chan)
-{
-	struct udma_chan *uc = to_udma_chan(chan);
-	struct udma_dev *ud = to_udma_dev(chan->device);
-
-	udma_terminate_all(chan);
-	if (uc->terminated_desc) {
-		ud->reset_chan(uc, false);
-		udma_reset_rings(uc);
-	}
-
-	cancel_delayed_work_sync(&uc->tx_drain.work);
-
-	if (uc->irq_num_ring > 0) {
-		free_irq(uc->irq_num_ring, uc);
-
-		uc->irq_num_ring = 0;
-	}
-	if (uc->irq_num_udma > 0) {
-		free_irq(uc->irq_num_udma, uc);
-
-		uc->irq_num_udma = 0;
-	}
-
-	/* Release PSI-L pairing */
-	if (uc->psil_paired) {
-		navss_psil_unpair(ud, uc->config.src_thread,
-				  uc->config.dst_thread);
-		uc->psil_paired = false;
-	}
-
-	vchan_free_chan_resources(&uc->vc);
-	tasklet_kill(&uc->vc.task);
-
-	bcdma_free_bchan_resources(uc);
-	udma_free_tx_resources(uc);
-	udma_free_rx_resources(uc);
-	udma_reset_uchan(uc);
-
-	if (uc->use_dma_pool) {
-		dma_pool_destroy(uc->hdesc_pool);
-		uc->use_dma_pool = false;
-	}
-}
-
 static struct platform_driver udma_driver;
 static struct platform_driver bcdma_driver;
 static struct platform_driver pktdma_driver;
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 4878d13d84ed0..329df7eb156b2 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -658,6 +658,27 @@ void udma_dbg_summary_show(struct seq_file *s,
 			   struct dma_device *dma_dev);
 #endif /* CONFIG_DEBUG_FS */
 
+int __udma_alloc_gp_rflow_range(struct udma_dev *ud, int from, int cnt);
+int __udma_free_gp_rflow_range(struct udma_dev *ud, int from, int cnt);
+struct udma_rflow *__udma_get_rflow(struct udma_dev *ud, int id);
+void __udma_put_rflow(struct udma_dev *ud, struct udma_rflow *rflow);
+int udma_get_tchan(struct udma_chan *uc);
+int udma_get_rchan(struct udma_chan *uc);
+int udma_get_chan_pair(struct udma_chan *uc);
+int udma_get_rflow(struct udma_chan *uc, int flow_id);
+void udma_put_rchan(struct udma_chan *uc);
+void udma_put_tchan(struct udma_chan *uc);
+void udma_put_rflow(struct udma_chan *uc);
+void udma_free_tx_resources(struct udma_chan *uc);
+void udma_free_rx_resources(struct udma_chan *uc);
+void udma_free_chan_resources(struct dma_chan *chan);
+void bcdma_put_bchan(struct udma_chan *uc);
+void bcdma_free_bchan_resources(struct udma_chan *uc);
+
+struct udma_bchan *__udma_reserve_bchan(struct udma_dev *ud, enum udma_tp_level tpl, int id);
+struct udma_tchan *__udma_reserve_tchan(struct udma_dev *ud, enum udma_tp_level tpl, int id);
+struct udma_rchan *__udma_reserve_rchan(struct udma_dev *ud, enum udma_tp_level tpl, int id);
+
 /* Direct access to UDMA low lever resources for the glue layer */
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-- 
2.54.0

