Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D054AA1E5;
	Thu,  1 Oct 2026 08:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844143; cv=fail; b=MK+dZlrZbW3JjgjQV8v6aI1nO5W9Kifi55hsoKqzawbSOkPmwIeYsSW62qEaq64kJ2MCLtddlO6SLP/PaaX8Wp851h+r1xDg1AG69HRAEOaHnVfjYTd6IEU/MaJxSq2zMU5FRDUYGSO9PkHlyurBPvMX8aEjIB8sxoeKeCz+CT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844143; c=relaxed/simple;
	bh=184XBk46sUH8I1pwKQnQWvCPpOdlQOGR/Ko6EKOF1c8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PpGVUHqE9LDejITmUrqaa/seU01AmY/ebN7LPJTkfkjN9aedNJPnfUbDratDROylO/Ar+IJjdsJs9o8j/NaCAVqX//xE83BMlGwuIR+8qfmkFOv6Jg2QUL6smDmUO4bLrnKaTpzzU9d4jo98bE/W6FFx4h0ufnhZTiC/2wZZsxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=YDtKXvuj; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=T8iKCURZ; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="YDtKXvuj";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="T8iKCURZ"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6918EweR1712604;
	Thu, 1 Oct 2026 03:42:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=4ruMivt2/Z+T5vkEvU9zpaCWU+Wqd4HECDEtUJX22
	bo=; b=YDtKXvujkhBiLPVvYsOyrv1uDEgeyVRUG/XLQ5KBPPulnPLEgjhEAv9dU
	v37kp2/E6XV0FxBAUcyxwweoelW45bCwaEFsBebgPdR/Cli5sl0sWMfvBjJW7DuC
	xjPrkXPScrs9OcqmQ9ozUUzLrzBg5mm1HmD7apnZOwne6vZCMXaYlE9qhFcC7leK
	GVV+yBTV+NLHTwsQJ7bnpauMJSS3wtBKl5BEbF31eCds5uER093kduknOE9UL5IP
	dWF3VNjK8hlhLIVt/1SrVklMN/sPuMSTi/oXcE1A2h+pUgz75u9y7eNuHZxholyg
	p4rbQ1Zc0Oorphbhtuil5bO7/LPvg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012041.outbound.protection.outlook.com [52.101.53.41])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h1kufr41p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 03:42:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEIMjlWR0hy6Ieyuul9/UdgQq6kazKuasP4o80IACAnVtCpipi2t8inGBIEdZjsgWPqlzLjZ6tnld1EbKOmLVcXWJYm1qyVSQEkINZPpKY3ZWfZd60lDGvPnMZAIW5gwcpef1zqip0EWhLqNH0D2pvFOCznXhQm5s81dQBg0zJpe1Wf1NsTH8GUMMDhK3W3mwvl3YJAr+cLY5ztKkOLNFqztWEoQKGC/29WFlk5226H87whlmSs1NLkXPL2u2jQoLHfhkzBY2v0gIAJUxjWCP9Lkae5pCFVd2MsQUvIN2owZeR/DoYck1EBAc+mhR69+WnvYUlYNODmr1nJBOHqMkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ruMivt2/Z+T5vkEvU9zpaCWU+Wqd4HECDEtUJX22bo=;
 b=AVrPMkHe/q0m7SFF3QuZA54T7MVKlfDP8iviciQzqs56UgqteWinx3tdIagFXqlg2QX0jD2dx3NG8dSBY4KOUuBiR3s35spXZ78ahOll2CiWLysFMwfdYloShrt+5U5VCyLOuTfAsaxjZw+adHq9k+tBONyKmKXGxjHZvA2rur/kTKIiCspxNPbucTZo2WJMpGX+qqbM5p67ySIhQD4iUfxxKBBB6ZC8V1pLKamHNLVsvC1rknY34f3v7mYtegiU8WzEsvE6NTAS5JdxbAJ4JUPu9i0yP/9pbRlz4b754lvJfMwyNXIeLSP6BPmn6AKJBWVuYtgkmwbPl5fjhRMSHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ruMivt2/Z+T5vkEvU9zpaCWU+Wqd4HECDEtUJX22bo=;
 b=T8iKCURZ/0vJih3nCMiz1zQbHAJ++Jfx8M5U2AEVCdccn/eqd5v/XsgUsddEpwNMxQHiOrs8K+lXUGz5JR6NtuhA4nVEdZCSrFuv5uguenRpMLUor5ZhYWfmIXzMOYOgi29S8kKqaNRqHBVoA9s7PQbJnYNjL/tUYtklHIBL1Ls=
Received: from BN9PR03CA0914.namprd03.prod.outlook.com (2603:10b6:408:107::19)
 by CH4PR10MB8049.namprd10.prod.outlook.com (2603:10b6:610:240::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 08:42:05 +0000
Received: from BN3PEPF0000B06A.namprd21.prod.outlook.com
 (2603:10b6:408:107:cafe::75) by BN9PR03CA0914.outlook.office365.com
 (2603:10b6:408:107::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 08:42:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B06A.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.3 via Frontend Transport; Thu, 1 Oct 2026 08:42:05 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:41:46 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:41:46 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 1 Oct 2026 03:41:46 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6918f9rw630551;
	Thu, 1 Oct 2026 03:41:42 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v11 07/19] dmaengine: ti: k3-udma: Add variant-specific function pointers to udma_dev
Date: Thu, 1 Oct 2026 14:10:23 +0530
Message-ID: <20261001084105.1692228-8-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06A:EE_|CH4PR10MB8049:EE_
X-MS-Office365-Filtering-Correlation-Id: bf68a7f5-7de7-4ecf-791b-08df1f97df1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|7416014|10067099003|56012099006|6133799003|921020|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RG/dbcc7DMWyDjZ7kJGN6rvGCRRtjBlX7DwNnOSN0B3P/ZUMsurKQxgXYfbiR3/3aZqaoz6hxqFPUfV8gfblP2Qoa5NZKsEm5kCjOVPBfjvOiZZb16EYthqFaOnW6cycS621wGuc6ihLGyyXwE9QcSlhC08k6448vYSjOiYKFDCEz7aBTpWeL1l4XXG7B7+UUVToRTTsA3kcr/rkP/0g8FeqI2YG9qTcxrfJkw3BqTL4TGy3H3N5VKfZqjNft/E8XZaKQyvolJdtGDca1w4mmKFm4fbG5oZaj5xsMICfbYPsq1ApmX1uiL0g5ELMCIwK9bJ8Xh65OA4ckMOjlU60ZGv6loicZwGCzvGw9zDcFZIWg+jeFXF0jKCKBBp2Bon87DrMRokyqvxuvnhdKr4jh0ZO8qtr3JkkQMp0/drIdYF95MINXh3CsNRgiABjD6o5+DYdnNKOW3xhxz88Ee+acQz46BcTI1RIrcO2llosUjNKs5t/tUDigUBXabOB+W+hEj8mPgniOuBfj1SBTeQqBoqL2OMGJPsxwFBcQofCUe8WHpdfTAibrK2XEde/O5BCa2KbBi5jlXR+ifYiz1SZ6bUPaJjqnFjkSCJPy9EthWHpxZUoy83P03f5bKhA12Vr5SVFzJjH0qjPJGMu5rr7tP9XYgYVVEF38aexAsLc0DCZ1e64KIWqxjKasxmdkCItgYHf5EgBPhayrT03LXl41PMU4xHPhlx5I/IzbhW/HAZp0Y+lqany9eoVaavyfPlu
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(7416014)(10067099003)(56012099006)(6133799003)(921020)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xdwyXXFrrg2d7mGWdBk5Sa2/DB00fXL4mtEyXfhw2E+sk+ZJDkGtaWzTo2Mk/2Vm4aXvg2XZMXGzcuNHhcP8x0Nw9fMWHEjLLvgLLTFgP/Vs+qCkMmWfRcRZQgv0q0sdpw+J5TyMLd9knxPzDf3JgDwqU/2I1uqBxlb+0epzjzLT4XkdKj4c0XbdwE5vKrO1AeoNjchtbBMhSAkXvS3SAvSccNiQs6jz01pm00cs0nSXXdUJLSUaNVAiMvw7ouszSzGCw4z468rxjcc3pNp2pXtD1z/JYzbRwHf4RLCGAW0L3NaRd/ruD18wj3lAEH3wDjp6FRXKm+1yi2rljzXCi/my1DO37bliJaY2q1GkfrYi0Nu5DTnXyewxWVSEGqEn1QvBR5vBNOozV9gnI2p4vPSXeZUFHdX9+IzuKqbZ1WqYqczwvK629oFFEkXMrJr7
X-Exchange-RoutingPolicyChecked:
	SHYmtV9Hgv591ZM2KA8d51KXAAzTpp0VKN4GKQEG6rbdS8t9Igno41TszUoq+XdVSvHzlh8opE2/QFPXFhTM/Jxp5Onotc1FUix3gNK7bOSJ1zv4HdHdKD2OppzPecPzfQzyPqydh0syhMCKIe/H6ffVIIfcj3MjZr6YBZiEIaX5lg0CRpD37cW/FXzUDPtHZOS/I4VAci7PfemIq9jwbEFt2bCMPQ7p8ZaVN7WZyRbRZKqG/Wz1DnptS+CMhBj8mTgxVuCsmBBbG2rwb8Q0kPCyW8Modxmd55areikwrJJiuMmKz3YTIzbUAFl1+0XrbzMYGxF7VDI48BeuuRkL3A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 08:42:05.2486
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf68a7f5-7de7-4ecf-791b-08df1f97df1c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8049
X-Proofpoint-ORIG-GUID: EhwoplXAxEKB3zLhWdo9LTZQKXqmMWFo
X-Authority-Analysis: v=2.4 cv=I+Lw19gg c=1 sm=1 tr=0 ts=6abe1ce3 cx=c_pps
 a=yZuzC5SkKTYVmguxKPWuow==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=8AirrxEcAAAA:8 a=sozttTNsAAAA:8
 a=G_UKfOQgHLmTBcQ1_a4A:9 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: EhwoplXAxEKB3zLhWdo9LTZQKXqmMWFo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfXyJw2XgtdC7cW
 152RG5UzM2lZE1/pbAmz6LBxhREgokxGXJXjtBXzOtbpP5NUx9uFxqAXL/m9kgCxxDGhKXLx5dt
 4rDv1QdnpqNQKQ3TGksoyueqhgwJxrzLg/NQjL6Mxb0BnsoImp7FzYZKItu/DlIATSQCO1fyrPG
 aA9naYR4KS0oc5d7U0d28uTBsoYLAa/ByB8sKw9eOyuc8nDyOhIxs5wVmsRDn4A12vzYPS/E9hn
 zC6X16O7cQPA3c36mZwLTqUq8iHAXwX6xn0hi42sjsUWAoTODHZWh3t7ew5fAxbg4x8CHvEKc5+
 FCjmUgYzUbxQyfpJWaicy88iqtPJ4gEL88a9tc2Xu9EC2TgmBH8DppK9t1He9hDIwfIW+RtfZOs
 JqnAge/AIftO3y/ItWINpy+BvbNdOU6bG1ae6XxbllGOT7bA+JoWrD8zATZQdwyy/gt3saU4jzT
 nJ1grjtM8m90aCXSASQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX4eHg9ZPBGZ3a
 L/NsgrMzcglC+x8REWVf7FMo89OE+xk/J+hda+bgKK9a8EZ/ylua2WYk3OCe6PstrONaRXBVl47
 y/a5J0qy1/crwSJn4CgQlN68BB1+M80=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010034

Introduce function pointers in the udma_dev structure to allow
variant-specific implementations for certain operations.
This prepares the driver for supporting multiple K3 UDMA variants,
such as UDMA v2, with minimal code duplication.

No functional changes intended in this commit.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-private.c | 10 ++++-
 drivers/dma/ti/k3-udma.c         | 66 ++++++++++++++++++--------------
 drivers/dma/ti/k3-udma.h         | 12 ++++++
 3 files changed, 57 insertions(+), 31 deletions(-)

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
index 6a731fcfc0697..36dcc888815ea 100644
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
@@ -1663,7 +1663,7 @@ static int udma_alloc_chan_resources(struct dma_chan *chan)
 	}
 
 	/* PSI-L pairing */
-	ret = navss_psil_pair(ud, uc->config.src_thread, uc->config.dst_thread);
+	ret = ud->psil_pair(ud, uc->config.src_thread, uc->config.dst_thread);
 	if (ret) {
 		dev_err(ud->dev, "PSI-L pairing failed: 0x%04x -> 0x%04x\n",
 			uc->config.src_thread, uc->config.dst_thread);
@@ -1718,7 +1718,7 @@ static int udma_alloc_chan_resources(struct dma_chan *chan)
 	uc->irq_num_ring = 0;
 	uc->irq_num_udma = 0;
 err_psi_free:
-	navss_psil_unpair(ud, uc->config.src_thread, uc->config.dst_thread);
+	ud->psil_unpair(ud, uc->config.src_thread, uc->config.dst_thread);
 	uc->psil_paired = false;
 err_res_free:
 	udma_free_tx_resources(uc);
@@ -1821,7 +1821,7 @@ static int bcdma_alloc_chan_resources(struct dma_chan *chan)
 
 	if (udma_is_chan_running(uc)) {
 		dev_warn(ud->dev, "chan%d: is running!\n", uc->id);
-		udma_reset_chan(uc, false);
+		ud->reset_chan(uc, false);
 		if (udma_is_chan_running(uc)) {
 			dev_err(ud->dev, "chan%d: won't stop!\n", uc->id);
 			ret = -EBUSY;
@@ -1849,8 +1849,8 @@ static int bcdma_alloc_chan_resources(struct dma_chan *chan)
 		uc->use_dma_pool = true;
 	} else if (uc->config.dir != DMA_MEM_TO_MEM) {
 		/* PSI-L pairing */
-		ret = navss_psil_pair(ud, uc->config.src_thread,
-				      uc->config.dst_thread);
+		ret = ud->psil_pair(ud, uc->config.src_thread,
+				    uc->config.dst_thread);
 		if (ret) {
 			dev_err(ud->dev,
 				"PSI-L pairing failed: 0x%04x -> 0x%04x\n",
@@ -1910,8 +1910,8 @@ static int bcdma_alloc_chan_resources(struct dma_chan *chan)
 	uc->irq_num_udma = 0;
 err_psi_free:
 	if (uc->psil_paired)
-		navss_psil_unpair(ud, uc->config.src_thread,
-				  uc->config.dst_thread);
+		ud->psil_unpair(ud, uc->config.src_thread,
+				uc->config.dst_thread);
 	uc->psil_paired = false;
 err_res_free:
 	bcdma_free_bchan_resources(uc);
@@ -2014,7 +2014,7 @@ static int pktdma_alloc_chan_resources(struct dma_chan *chan)
 
 	if (udma_is_chan_running(uc)) {
 		dev_warn(ud->dev, "chan%d: is running!\n", uc->id);
-		udma_reset_chan(uc, false);
+		ud->reset_chan(uc, false);
 		if (udma_is_chan_running(uc)) {
 			dev_err(ud->dev, "chan%d: won't stop!\n", uc->id);
 			ret = -EBUSY;
@@ -2037,7 +2037,7 @@ static int pktdma_alloc_chan_resources(struct dma_chan *chan)
 	uc->use_dma_pool = true;
 
 	/* PSI-L pairing */
-	ret = navss_psil_pair(ud, uc->config.src_thread, uc->config.dst_thread);
+	ret = ud->psil_pair(ud, uc->config.src_thread, uc->config.dst_thread);
 	if (ret) {
 		dev_err(ud->dev, "PSI-L pairing failed: 0x%04x -> 0x%04x\n",
 			uc->config.src_thread, uc->config.dst_thread);
@@ -2083,7 +2083,7 @@ static int pktdma_alloc_chan_resources(struct dma_chan *chan)
 err_irq_free:
 	uc->irq_num_ring = 0;
 err_psi_free:
-	navss_psil_unpair(ud, uc->config.src_thread, uc->config.dst_thread);
+	ud->psil_unpair(ud, uc->config.src_thread, uc->config.dst_thread);
 	uc->psil_paired = false;
 err_res_free:
 	udma_free_tx_resources(uc);
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
 
@@ -2374,8 +2374,8 @@ static void udma_free_chan_resources(struct dma_chan *chan)
 
 	/* Release PSI-L pairing */
 	if (uc->psil_paired) {
-		navss_psil_unpair(ud, uc->config.src_thread,
-				  uc->config.dst_thread);
+		ud->psil_unpair(ud, uc->config.src_thread,
+				uc->config.dst_thread);
 		uc->psil_paired = false;
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
index 1777f0e1f085e..59170714f53cc 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -349,6 +349,15 @@ struct udma_dev {
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
@@ -586,6 +595,9 @@ int udma_push_to_ring(struct udma_chan *uc, int idx);
 int udma_pop_from_ring(struct udma_chan *uc, dma_addr_t *addr);
 void udma_reset_rings(struct udma_chan *uc);
 
+int navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
+int navss_psil_unpair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
+
 /* Direct access to UDMA low lever resources for the glue layer */
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-- 
2.55.0

