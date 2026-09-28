Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4036030594F;
	Mon, 28 Sep 2026 03:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790564403; cv=fail; b=N4e+FprmDvRg8wjtbb96DVOu39PbZzTEfOYZtRiA5+On4cIzNrhQxYzR+A4CE13Q+upOqzUorFpHKvkPMOpOogEd9U7UrZi8pH6YoXEADzHgjfyL2oWS5OCZoE85iUp2N3Q1VM9KNL2Ki71qbM5vwomJXUmDrjViB681vWo61Ig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790564403; c=relaxed/simple;
	bh=OwjYwFqSFCd9saDH1/jYqBu3oZUbBDlB0ryNvJXz1Xw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WVt3zYWSrXAFL4Wpgh5CO0vpK77/CZOWClK7YNzJRzeJ57O58/wj4ofgIvoG2Q7VkpbXPfQ/nj9fIhaEWug5dqlj9Tn++bbTY4o26YcQ/VwV6VqeyK7c6tUeyx3hiFWgsPBSxsu++K/MsaGCmKzwOFPWzcCzDUYjI+Wj1xATIME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=DBm0hXjT; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=M0DK/tWi; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="DBm0hXjT";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="M0DK/tWi"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68RNi5sG3706846;
	Sun, 27 Sep 2026 21:59:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=CBC3W2Sz8Ol7rD66X3Ume4mUVMmNDlyyyBOXPTW0k
	e4=; b=DBm0hXjTN6+m//nfIdEVqUZGEWdor1BtSTxUgV4an+tKf1SZuT5G1J3bx
	XPYj+AWme7zhkddWolIZFfmXgO/bxBQmgfJkiIS7DJ4qr0jlb6ZNKDTnKgDe82mr
	hK1T3jADCzoBa/NUSqQ2pk96C0fXnuTpDmqMWDCIHRMBVDWcH77rqrobHtJYyd7o
	ugRL81XtC50cCjoED6qhPxuhlDHBugi78GIY7CJNu20ca2ZMX0F2mKTizvKXwa4k
	EEqqJ30Zfr7V09h1Pf/VOo6vkf6GFpO59QhhsqVZ5hQOBOB4Ra96pQ+IqfwVMuD4
	Jrhv1jqldquux9ds+/5417CjP3oEQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010064.outbound.protection.outlook.com [52.101.56.64])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gy00nb1u2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 21:59:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RMjzGZ69O2GV+viwt8PYySRq+mmSO9iTHFNNGAuVGHe/9gbqa++k+GpyAKOKxWkwn3XkQMpO5koc5uKmFh7pnaPP7/g7JNIEZb9Xkm3+aXZbC0magRIja66zHMajGWWvWl0bu6bBmLylD3wHJgpejeWDOPxkTOYsVOCPAHWyOKpcQkHryo6MS0l32DIkuycLJ73NooogADfLw0OyDFsTj+kMhgtFF3sJUqyfs89Pxi0Myvb5bM6FBhF9aKA+q6UtXsPi/wwcA/nP/+h8jT7OYhW2cKBLumiz9vN2x/88ru1Yp3Mto4ByUA1lRr4dj7j2nrJcFXCV9ZL9CcQhQKYolw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBC3W2Sz8Ol7rD66X3Ume4mUVMmNDlyyyBOXPTW0ke4=;
 b=XtXTcxxwytK7NST0uNQDHd3EShZu89CpFv9rnfjJsInVP/qJP7K5WLp1lg6g8Y5YJDoHQbio+ML+uvbcgNKmj7bdhRDPsNsMzD6yYYraK+OTytL3+v64rLGoPrQgLTeekyhBnZUmtoA/paggRzf5+jStlQAUJM0T0KlWnzOUjZc6UljSNFcwCZAojdGlAfdHfhxd7rG3j/ce6WEdzdAFu+op+0WyaXL7G3DuHeZwk+xmO1nEYRRg+IFS19CvvRlf5UgPe0BTF6JLhn2HOkqbGioKHaOyZ0R4uqck0+eAidcmMEOuKfXByhWyJKTVJCD5NzAoP5l35y4DYHpVnmTzRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBC3W2Sz8Ol7rD66X3Ume4mUVMmNDlyyyBOXPTW0ke4=;
 b=M0DK/tWitAaBFAB2EQz3vk2a1G/TR1/1tryYGkbPVtNTtFCxTvOieSHiFs83EIHbqeO3SehMcgS57fSgptjxZC6/r1K/vdWIMWDpLbntzaGv1bu5OVZBXWBol6Skwo6Ft0euwncFq+y24EDpYz0ME25atW++F6QiNgvUvP9M760=
Received: from SJ0PR05CA0156.namprd05.prod.outlook.com (2603:10b6:a03:339::11)
 by CY8PR10MB7265.namprd10.prod.outlook.com (2603:10b6:930:79::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Mon, 28 Sep
 2026 02:59:45 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::4e) by SJ0PR05CA0156.outlook.office365.com
 (2603:10b6:a03:339::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Mon,
 28 Sep 2026 02:59:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 02:59:45 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 21:59:23 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 21:59:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 21:59:22 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S2vqqP2256662;
	Sun, 27 Sep 2026 21:59:18 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v10 18/19] dmaengine: ti: k3-udma-v2: Update glue layer to support PKTDMA V2
Date: Mon, 28 Sep 2026 08:26:24 +0530
Message-ID: <20260928025749.1055383-19-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928025749.1055383-1-s-adivi@ti.com>
References: <20260928025749.1055383-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|CY8PR10MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: fcdd2ade-5b77-4a7a-d7ec-08df1d0c8cfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|36860700016|376014|23010399003|1800799024|10067099003|6133799003|3023799007|22082099003|18002099003|56012099006|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	+oVWou9m6/euQ4+lnm7qK5sX3jCOqI4o7DuL+yET6ar+a4bf3ec9L8ocfwJJPxUDmDRqs4yo5YfA0RhdfnO52r00cVCOJgrIBxcYodbrFKs+w/0YPTQ8ESuWLjn1Ti/vJrm1+DMj9FP8WJaa3mUeGWBPjPuDUli/AuCazc38mB2NrT3Vn6UETE7/g0So44HVT7Fskrwe4r53us96JLIrbCty3M3c/m8GyzgjqJ6GEk7geq46Ru1Cr7CHcgripelHHhH1DGxZ/Sby0NKe069d9VfReuBMKxevSyLO53q8eCLh44E9TtQE49azhkQ6/qKEOP58VPTfap3Y2u/Igy5pAdy/xtYH1LCdlyHfRZ0v97GOFxmPfT24U3I/0S0YbGMnSyuMitLC4xPGUPHIyXqwqQrDvta/b6UYDnUWXDnWlpmWr8lY8EjCFcJIIAIKpFFXgHvNA6VUgUE1vYY/G0kA1SdRUR2Ewyp5z9gj3hR0CFp0/6t0+hO0X2n/Q0zc3LU+7yVBP3fbeJxX8g2Q5xxr8BUhq0UlL8pUYvJ9UGqkOXkDIusUQKzdj0a8rIx+8yTm+rWnZiAxrCrGnsbTAh3xRzIg98TRpRVKjUTf3UR82Bc/g9ZoTVne3/z+HCDb9H66J/r0pENDPHzGOT8e6BWTjIi3uDw+VByGETREzkI0iNJQpFYlqKTEByPYZoxU0+i+
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700016)(376014)(23010399003)(1800799024)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(56012099006)(13003099007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UfiXG+hfMNXlCRVytIXPgX84zSl5pzZy5bVfgF8ASQil5IXM2zGWaOgkd/fp3kDXwTx5DiCwHqd63vFX6EU3MIwTT3pUiGXNuQR0XGCGI7HhAiw0+BXxPPAQ+eI1DwT4mjo6FgmRqR6Q6wiMQD1n84J0h+0ggZB3K8lGm7JwPjIHu8GaPpVv2Sraapoy1am1VYRF4uGcfeN64CKy4XZdl2HYDYQAbroB07bgPOoor4BHd3Fmep3uRVLED9/Dwbe+pLfF7aXjavJsjmekplBC/ULj5cysX+4dwvLFqHR2k8ctb0N0t49VikbI5i6Yl1Q00417hEANKT2TTN1mSHG7+R/LeGf2qYopfWV+KZgJ6RTPvtbseXVpLFX16f9RnNxAlfL0Kxuosldj+4iVQaf2gCOwSwSJfuOSklfcG+MflL6mspeh61dcOUfVNJhLqVlf
X-Exchange-RoutingPolicyChecked:
	VxZ88l8RulRTlEHnWM1eEGRBbgzMhJRTy+/XbokMt9LNpLtyMeF3GjEHJ0wB4WZWE7SE0ZJSYKDVwYh7qnM9dHZTE2mEG2rMGiQ+WSnPKoNp38kLXdsUeg0DvIenV+rSNI75cW6DNShD82E76GgNO5bhddds5kfXtWyYP80kAgYk3IsHISHDEdZg1WuKLI67rQPeycddN++3jueIfg6kuT2tz4msCe8d4g6j5c0tNid9T/f0JXmWZ93t1cibe5o7YF9rrlgWkdMwIVyr5mnI3M1G8/L6aScyHJDpvusmuL5zBYs/Jt/9uOL0tSr/aMbP98TkDAZ3mXUc8dWmmSVFig==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 02:59:45.0745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcdd2ade-5b77-4a7a-d7ec-08df1d0c8cfc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7265
X-Proofpoint-GUID: 2Q7skfkwPijV7llpz5WifWU8Uff6QuZ1
X-Authority-Analysis: v=2.4 cv=fKysTpae c=1 sm=1 tr=0 ts=6ab9d826 cx=c_pps
 a=tGbvjRCxuxMasaU8K2d5rg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=4Ig8warNfptl5lTuD7MA:9
X-Proofpoint-ORIG-GUID: 2Q7skfkwPijV7llpz5WifWU8Uff6QuZ1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMSBTYWx0ZWRfX+tXWSHUlk1wb
 ZMCnkuM7I8regjhA76WCMA6vkA1N5xECGlxE2NdjqPM9o83Msm5Xm+6o70lnkAVT6hcivoudt6U
 HgG6xspMriPxvectfo8dQLJ5B4Ugoc4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMSBTYWx0ZWRfX4S7VEII3ve/R
 epnUTv2S9Jd0dhF7YS2HPoYQBpOq7V7Ow26Pz3kDyNCZOOj3elHGbO76T+qQmwgilT0N18g5oLL
 puKoZSkoqgvnxCdtNmKq3sG9xazZOkO7QWZU1NzsWRMW2coLHzeIxA2TAfLZdX21ctTa7BiHOem
 UdEC03YM91wRqu3sA1I5bG7QFJPvckD8EKJXU7e0Rnb0+2fwbvSijDVYa9EF1feRGGiDX0T96MD
 AjY4P9u8CdG1ltSbbiFNNOXcuiow8cRIZ+aEM4ms4GJzqGbYpovOCE6AXIJgDy0kXjg8tQ/JOpJ
 9Dv3eCt25ZamSpM2g9T8Q96Z3Kh+7kQxty1d8aC6EEoaoHvho4BAOwhwp7bswK7C3dzzCDG3Ro9
 NmJGd5zoaNmw7F8KS6bl3MMSJrdVpcr8CIEFHgR5aQj7/XRRkesDzpbj9wJgbq5olwq7i5Tyx/4
 voGElPotq2V8lrlDMbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280011

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
index 595fdf3ecbc9d..3d001f2e3f040 100644
--- a/drivers/dma/ti/Kconfig
+++ b/drivers/dma/ti/Kconfig
@@ -67,7 +67,7 @@ config TI_K3_UDMA_COMMON
 config TI_K3_UDMA_GLUE_LAYER
 	tristate "Texas Instruments UDMA Glue layer for non DMAengine users"
 	depends on ARCH_K3 || COMPILE_TEST
-	depends on TI_K3_UDMA
+	depends on TI_K3_UDMA || TI_K3_UDMA_V2
 	help
 	  Say y here to support the K3 NAVSS DMA glue interface
 	  If unsure, say N.
diff --git a/drivers/dma/ti/k3-udma-glue.c b/drivers/dma/ti/k3-udma-glue.c
index 996c130b10f4a..309a74a0b2a67 100644
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
@@ -525,21 +543,39 @@ int k3_udma_glue_enable_tx_chn(struct k3_udma_glue_tx_channel *tx_chn)
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
@@ -573,8 +609,16 @@ void k3_udma_glue_tdown_tx_chn(struct k3_udma_glue_tx_channel *tx_chn,
 
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
 
@@ -589,10 +633,12 @@ void k3_udma_glue_tdown_tx_chn(struct k3_udma_glue_tx_channel *tx_chn,
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
@@ -705,7 +751,6 @@ static int k3_udma_glue_cfg_rx_chn(struct k3_udma_glue_rx_channel *rx_chn)
 			   TI_SCI_MSG_VALUE_RM_UDMAP_CH_CHAN_TYPE_VALID |
 			   TI_SCI_MSG_VALUE_RM_UDMAP_CH_ATYPE_VALID;
 
-	req.nav_id = tisci_rm->tisci_dev_id;
 	req.index = rx_chn->udma_rchan_id;
 	req.rx_fetch_size = rx_chn->common.hdesc_size >> 2;
 	/*
@@ -725,11 +770,24 @@ static int k3_udma_glue_cfg_rx_chn(struct k3_udma_glue_rx_channel *rx_chn)
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
 
@@ -778,8 +836,11 @@ static int k3_udma_glue_cfg_rx_flow(struct k3_udma_glue_rx_channel *rx_chn,
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
@@ -826,6 +887,21 @@ static int k3_udma_glue_cfg_rx_flow(struct k3_udma_glue_rx_channel *rx_chn,
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
@@ -1331,6 +1407,9 @@ int k3_udma_glue_rx_flow_enable(struct k3_udma_glue_rx_channel *rx_chn,
 	if (!rx_chn->remote)
 		return -EINVAL;
 
+	if (!tisci_rm->tisci)
+		return 0;
+
 	rx_ring_id = k3_ringacc_get_ring_id(flow->ringrx);
 	rx_ringfdq_id = k3_ringacc_get_ring_id(flow->ringrxfdq);
 
@@ -1372,6 +1451,9 @@ int k3_udma_glue_rx_flow_disable(struct k3_udma_glue_rx_channel *rx_chn,
 	if (!rx_chn->remote)
 		return -EINVAL;
 
+	if (!tisci_rm->tisci)
+		return 0;
+
 	memset(&req, 0, sizeof(req));
 	req.valid_params =
 			TI_SCI_MSG_VALUE_RM_UDMAP_FLOW_DEST_QNUM_VALID |
@@ -1407,21 +1489,39 @@ int k3_udma_glue_enable_rx_chn(struct k3_udma_glue_rx_channel *rx_chn)
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
@@ -1458,8 +1558,16 @@ void k3_udma_glue_tdown_rx_chn(struct k3_udma_glue_rx_channel *rx_chn,
 
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
 
@@ -1474,10 +1582,12 @@ void k3_udma_glue_tdown_rx_chn(struct k3_udma_glue_rx_channel *rx_chn,
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
index 525155d3bb513..d6d99f60519a1 100644
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
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 2a9686f7a09bc..983cf2c32531c 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -85,6 +85,17 @@
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
@@ -747,6 +758,8 @@ u32 xudma_rchanrt_read(struct udma_rchan *rchan, int reg);
 void xudma_rchanrt_write(struct udma_rchan *rchan, int reg, u32 val);
 bool xudma_rflow_is_gp(struct udma_dev *ud, int id);
 int xudma_get_rflow_ring_offset(struct udma_dev *ud);
+u32 xudma_rflowrt_read(struct udma_rflow *rflow, int reg);
+void xudma_rflowrt_write(struct udma_rflow *rflow, int reg, u32 val);
 
 int xudma_is_pktdma(struct udma_dev *ud);
 
-- 
2.54.0

