Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D758C42AFA3;
	Fri, 24 Jul 2026 10:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888539; cv=fail; b=XRUSCi43Hvn7RSwEze371EqUAiHmn+A4WTidPvWy8tbhAN3wvKFg/jIOvmORg2AzarzO34s51KIRPviDxCjJBzUDhSnVGoXoeZmwkFHdE19UmcEfhulDrJuBJxurkBfJ7Yycb6J1GZXrHn/uMA6vHLUBtEAV/cGup0eabIiCxzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888539; c=relaxed/simple;
	bh=1+jVKqFnkFa7Oz4h9xcp/NBdfUc42n0Khp0YbWOJNFo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qNjhWCMqott6OU7azJIiaWY5VGbd8gDCOpX42ObFF9yV64WmvVT9tC0czROuLtnjqWLFc2rCRz/M5U2FLukRb0AieskdQyIUQXpiudKvaavG9ZS9CC1o+58xlknSDat1bKSw9MeMj+iFSlevYuJ+GsCssVTpoZgp3IL03WBUP50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=WV6udbUJ; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HDCLwCOD; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="WV6udbUJ";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HDCLwCOD"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66OAF2KF2796675;
	Fri, 24 Jul 2026 05:22:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=4pTtY5yw7qWEB9frocphqK4WU1uhBZUdb/xq6mJWT
	Q4=; b=WV6udbUJ0IBn7glT7AvkEUQ4IjW3aPsvkCvY1GDZi0uQMzyFLhAh6kD0C
	WT7ZDW8EQJuy0RanRsmp8qfTe+b77d1k/CbfvHmwEVdPGb8mS1Jz4KY5pZlyjyyx
	X+mXBByB2xnwg2op/4i1UgZuxLLG9irV2CVONILI13tYzYBbWXosQ3OeGMo+GbRW
	vCkhoWi78b1f8+euwSRdevJ3K20bxYs1X3WzyFmCRnPZZMAHhCFJ2AnUkRDGFVLx
	VrBSdOB7BT82/KaYsXH5BjReT3oh4oDRkRAMUSaFG5Y6izCna7KZmUr8WBSTQH/3
	SZS7AWlM3gwf7r0K56SVxnXnNF0tw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010070.outbound.protection.outlook.com [52.101.201.70])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fm3v38pu7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 05:22:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqSpBltRmu0+7HVSQepXRNK9MfqnnIvYDHAnQ0zcFXiBOqKusokn66c4ByWAU1QrLoBM3LGZdheE+bB12qRuhZmYVc/q1c7LGxwTz9Axsj3kmhhRg6irwnA5ZRDUjT3fs69NOB4wh0SVgcJRGo20xpkNadFutXvmxnIcaeGsaPqlQGwHBGWJj+QOc/mYOJgqWwQHV+NGJKJEa6O+/xo5xBMHwYunismCj/CnqgcnAfcehEWjiRas9iwTZZcPHV9iAam3J6zxNrOqF8LqeRV5TCr5OkXzwVEkwlhYFN5GQ+J6oCopko0gqj2N+x74UxPtPb+fqKn70j2fwvROxoXlEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4pTtY5yw7qWEB9frocphqK4WU1uhBZUdb/xq6mJWTQ4=;
 b=ZiNpg+3TX3CDXPoyBrcThwqH4m8oxeB4az9lFL6aAp80fZlH8Ze9Ndom3xE5e0h63ISwo2VA8lSnIQQkdkRkZzfaSht0iMZIUrH2sX3hK+INELHt5L8I7/6XWxYIChLlS6e6OuBpHtLualNX4RpTSo9yn/oS/RWxa8Ik1uHBcx1FIezi+LBYmvsc6SK6QKodE6T2waIOEIZvQIZAlcZjOegvAwf0ey43aDCAIqyEOX4Mo6/NYeFPKQKIZiljgENNiMS6p8BUv9veAh5IzdRPjii6oSDNQNlSiDDrlC0KlmT69P8SIuA1VYXMNoFNd/0MknHFGxSHg2OK4xyDKcIrjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4pTtY5yw7qWEB9frocphqK4WU1uhBZUdb/xq6mJWTQ4=;
 b=HDCLwCODIdG0eQ07H9uicA11NLhJP0+HZziwkiy0Q3Hiacz/uhlw/DhmtXcpDrKdqgjqyBkwj8TzGMtXw+1OCeWt8uRX9vfGPkxVUasYw7Q4CdPeekiH4U6VYUX6HdHKV4vH3Ew/KV6UuGLtua0GctZiViNTww7u6bc8qovIRLM=
Received: from PH8PR05CA0021.namprd05.prod.outlook.com (2603:10b6:510:2cc::9)
 by SA1PR10MB6296.namprd10.prod.outlook.com (2603:10b6:806:253::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Fri, 24 Jul
 2026 10:22:01 +0000
Received: from SJ1PEPF00002315.namprd03.prod.outlook.com
 (2603:10b6:510:2cc:cafe::2f) by PH8PR05CA0021.outlook.office365.com
 (2603:10b6:510:2cc::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.7 via Frontend Transport; Fri, 24
 Jul 2026 10:22:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002315.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 10:22:01 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:21:58 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:21:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 24 Jul 2026 05:21:58 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66OALMFL3017088;
	Fri, 24 Jul 2026 05:21:53 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v7 06/19] dmaengine: ti: k3-udma: move ring management functions to k3-udma-common.c
Date: Fri, 24 Jul 2026 15:50:39 +0530
Message-ID: <20260724102115.2854-7-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002315:EE_|SA1PR10MB6296:EE_
X-MS-Office365-Filtering-Correlation-Id: 2896bf63-ab12-4f0f-9a0c-08dee96d666f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|7416014|376014|23010399003|56012099006|10067099003|6133799003|18002099003|22082099003|3023799007|921020;
X-Microsoft-Antispam-Message-Info:
	ejq2kYbXeMtgxcWaGhuSS9cu3Snwa53suFpymGbLXOSZy6RlK2pBe/kTBkxjM4tL9OovNU3c/8JdY7onYNfNZAr8amF911QF6HSMrD8VPkrfkQZiZqPvtZe6TnYZrUYWWeeD6GHxZa+tslwMmOUQDUnWsMbbamzNcjennBM8cOrpnlM+1Bp+RqiCEsPoFQPv/pthY8I6JanOIfOKE2eg3pPix4lAw/CFnz9im4hYiEhhtuJP1QFeMGm3sl6V0qfiihWg+XwlHHfEX3FmqOOhrRhtmhktOyEUuAdAmuVSaqikd45pPdfD+64KMAWvVfVa0G9+U9Mtb4wflhpBM4CeR/hJ9huKAz1KDeS/KfPeGfJEgFhjeumqJ+0EBgaubFR6F27j3Uz7QrEtbzj9RrnJ89/ctazsiMfaJzm/U2dI4q0PaGbCe+VSEHrPbhXKKh6o92ptyF2wftB0jJM6Fs5zIULcFnFIc3PX7ZQR7vEvqx06SibOPkKa6efdzIaXfq32F25Z+YWbJxWXQaY6MkQJpudags0/i7ZUy3uXmLlgIdoWfqj6d8zrFQ9CKICd/sORK1eiMuxuQoJreANgVwnpOo21CZoXNDxzT76al5mDMEAW1eneog2UMEXQKL2ZEo6rMS8AxRvaDoRP0hb1u0imXFhnL5anmUZ3iwntWb71JrQe2lwxVe65xwXvHuOeuI+rFvvQkOxuxyIB6JeoAm0NJHnzRVSgykL1esJ7CkhOAsAauegEWk58YALoMJS2Xo6d
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(7416014)(376014)(23010399003)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(3023799007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lGYYJs4AcCaKXk7J/yy4fY/S5mu/vdk18OyHniIYktsX2vO+qF4To2w0pPbrnAWYVH9Y8qA7C615dfi2UPNj1vOuYIanly/pqhEKJV6tiv3NsdA2VYEKW9vEzOQ/aN1+6cGEouY5J4w6KUg6tArwVyJrBduqXg/McVejotBqDv8D5vVoRKXM7Yas3y9ZTuWhKcPMoqTEZchLalEFV3sfh6AISeg6cmkPQj7Oao4g1u39EUR3n+ixop/NDNC2g3T97D9U1aLozy5HmIyRMhHIlGzMaAIvtJb/MzdCJoMijNZrden4PzUKl048Y82Mw9lOH7nd9Ip8OU8JDvnyQ4HAAYmJVNvudOlkk1eTxlAmRlt6jbCZD5e9gIkFhmAWeEwLYJRUSV2yqJEKJyIcIBhY2XEN+kDvgpQhVV0YrcDZDcyXDHrKliVaSXgd2Yz98TZM
X-Exchange-RoutingPolicyChecked:
	NOpxZvuyrjYdONLb4lt194PkJxTTcu/ujWyNgYsHVwjhXO6RYELjgSrmjzmP7YBTzhJUPxtSVGvpPNmc0voyZ+IrrXYAot8IiR31pSDw0eNPXRhd+6kHqTVrJ5mFwefwht2TL+r4MQfaZ7esx1uJimw1JvgY2VMoaUVKj/Jm00hoU0Ui42Nor9Jv/lnBqnw7hvoBLDVTbCJtJPky5gRtFhiy2qvAMx2iTT9R14NAlUPNhKC7Fam2ecFf+tXlWjzA+4rJtFYdhF9tS5w1IJD9+DpZue4Hu5nZFbFLXOeuM4kIxJOJ/YF2rfwZiWvP1tLgdLnLZMnX95sBFHbjtJ5huA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 10:22:01.1214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2896bf63-ab12-4f0f-9a0c-08dee96d666f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002315.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6296
X-Proofpoint-GUID: AW9xo2TsqYgu0zHJ5OUeZPnUvNhLT9Yc
X-Proofpoint-ORIG-GUID: AW9xo2TsqYgu0zHJ5OUeZPnUvNhLT9Yc
X-Authority-Analysis: v=2.4 cv=dLWWXuZb c=1 sm=1 tr=0 ts=6a633cce cx=c_pps
 a=RGUNHxVObgwraRyadLFC+w==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=8AirrxEcAAAA:8 a=sozttTNsAAAA:8
 a=g6TaX78G5PB857Cctd4A:9 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfX5We+W8uiD/Q2
 JNcsqsy5y7du9Dze4F6c5R+G+nziyoy1dgdTBfT5g56ai6w/xhclP7uPzz/U9j5m+XB8e/Tnht3
 ROPt0QLPosI6KhkxEKOsL9f/7r5jJjKvkTfay2jgfXOauMckA4mnoLGBQ9ZWs7sMQKsqt0JlVS6
 PFnhfiBcS2b1eseToBsUa+vnCKmKNf6QDCDMUzV9pq0VXiJLsgqx9w6R1B18eRH8WGjiMNCl2gD
 86fp6qY/gBenxOhX88k/JrH579Hpd0UcZcQOaplzn18/2om47hcQlC9bveuBB+NbHLQMHaRp/Kn
 qzDXh92JF+ENYJjXPzO0ijskKycbzrwzbRd2riW9u2tmXURR5l2unr4xhAjlwznzJxPVuztfuGn
 XdU7yv0InWK8AQRThFnXNgkIM1OwMeCl2/ldUqg5USKeqNHY/Mz/schVLT56u8/JM8+uiEFfdd2
 t4t1XeCDgLiluMW8D8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfX3+CHfZfKQdvU
 tXHjEjOV2hRV2lvTmHw3yEV8VPuwWp82FNcDHZnImwbyiASlql3CTc+gA0vjKb9OHHjmbSFxV0P
 UJVDV99emfTybm8rwiUat8egsNBWohE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240094

Relocate the ring management functions such as push, pop, and reset
from k3-udma.c to k3-udma-common.c file. These operations are
common across multiple K3 UDMA variants and will be reused by
future implementations like K3 UDMA v2.

No functional changes intended.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 103 ++++++++++++++++++++++++++++++++
 drivers/dma/ti/k3-udma.c        | 100 -------------------------------
 drivers/dma/ti/k3-udma.h        |   4 ++
 3 files changed, 107 insertions(+), 100 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index daf5f19dfb3ab..fc5e2c99ee28a 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -1239,5 +1239,108 @@ void udma_desc_pre_callback(struct virt_dma_chan *vc,
 }
 EXPORT_SYMBOL_GPL(udma_desc_pre_callback);
 
+int udma_push_to_ring(struct udma_chan *uc, int idx)
+{
+	struct udma_desc *d = uc->desc;
+	struct k3_ring *ring = NULL;
+	dma_addr_t paddr;
+
+	switch (uc->config.dir) {
+	case DMA_DEV_TO_MEM:
+		ring = uc->rflow->fd_ring;
+		break;
+	case DMA_MEM_TO_DEV:
+	case DMA_MEM_TO_MEM:
+		ring = uc->tchan->t_ring;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* RX flush packet: idx == -1 is only passed in case of DEV_TO_MEM */
+	if (idx == -1) {
+		paddr = udma_get_rx_flush_hwdesc_paddr(uc);
+	} else {
+		paddr = udma_curr_cppi5_desc_paddr(d, idx);
+
+		wmb(); /* Ensure that writes are not moved over this point */
+	}
+
+	return k3_ringacc_ring_push(ring, &paddr);
+}
+EXPORT_SYMBOL_GPL(udma_push_to_ring);
+
+int udma_pop_from_ring(struct udma_chan *uc, dma_addr_t *addr)
+{
+	struct k3_ring *ring = NULL;
+	int ret;
+
+	switch (uc->config.dir) {
+	case DMA_DEV_TO_MEM:
+		ring = uc->rflow->r_ring;
+		break;
+	case DMA_MEM_TO_DEV:
+	case DMA_MEM_TO_MEM:
+		ring = uc->tchan->tc_ring;
+		break;
+	default:
+		return -ENOENT;
+	}
+
+	ret = k3_ringacc_ring_pop(ring, addr);
+	if (ret)
+		return ret;
+
+	rmb(); /* Ensure that reads are not moved before this point */
+
+	/* Teardown completion */
+	if (cppi5_desc_is_tdcm(*addr))
+		return 0;
+
+	/* Check for flush descriptor */
+	if (udma_desc_is_rx_flush(uc, *addr))
+		return -ENOENT;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(udma_pop_from_ring);
+
+void udma_reset_rings(struct udma_chan *uc)
+{
+	struct k3_ring *ring1 = NULL;
+	struct k3_ring *ring2 = NULL;
+
+	switch (uc->config.dir) {
+	case DMA_DEV_TO_MEM:
+		if (uc->rchan) {
+			ring1 = uc->rflow->fd_ring;
+			ring2 = uc->rflow->r_ring;
+		}
+		break;
+	case DMA_MEM_TO_DEV:
+	case DMA_MEM_TO_MEM:
+		if (uc->tchan) {
+			ring1 = uc->tchan->t_ring;
+			ring2 = uc->tchan->tc_ring;
+		}
+		break;
+	default:
+		break;
+	}
+
+	if (ring1)
+		k3_ringacc_ring_reset_dma(ring1,
+					  k3_ringacc_ring_get_occ(ring1));
+	if (ring2)
+		k3_ringacc_ring_reset(ring2);
+
+	/* make sure we are not leaking memory by stalled descriptor */
+	if (uc->terminated_desc) {
+		udma_desc_free(&uc->terminated_desc->vd);
+		uc->terminated_desc = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(udma_reset_rings);
+
 MODULE_DESCRIPTION("Texas Instruments K3 UDMA Common Library");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index ae8b8ebd5dddd..40ba114ac81dd 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -174,106 +174,6 @@ static bool udma_is_chan_paused(struct udma_chan *uc)
 	return false;
 }
 
-static int udma_push_to_ring(struct udma_chan *uc, int idx)
-{
-	struct udma_desc *d = uc->desc;
-	struct k3_ring *ring = NULL;
-	dma_addr_t paddr;
-
-	switch (uc->config.dir) {
-	case DMA_DEV_TO_MEM:
-		ring = uc->rflow->fd_ring;
-		break;
-	case DMA_MEM_TO_DEV:
-	case DMA_MEM_TO_MEM:
-		ring = uc->tchan->t_ring;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	/* RX flush packet: idx == -1 is only passed in case of DEV_TO_MEM */
-	if (idx == -1) {
-		paddr = udma_get_rx_flush_hwdesc_paddr(uc);
-	} else {
-		paddr = udma_curr_cppi5_desc_paddr(d, idx);
-
-		wmb(); /* Ensure that writes are not moved over this point */
-	}
-
-	return k3_ringacc_ring_push(ring, &paddr);
-}
-
-static int udma_pop_from_ring(struct udma_chan *uc, dma_addr_t *addr)
-{
-	struct k3_ring *ring = NULL;
-	int ret;
-
-	switch (uc->config.dir) {
-	case DMA_DEV_TO_MEM:
-		ring = uc->rflow->r_ring;
-		break;
-	case DMA_MEM_TO_DEV:
-	case DMA_MEM_TO_MEM:
-		ring = uc->tchan->tc_ring;
-		break;
-	default:
-		return -ENOENT;
-	}
-
-	ret = k3_ringacc_ring_pop(ring, addr);
-	if (ret)
-		return ret;
-
-	rmb(); /* Ensure that reads are not moved before this point */
-
-	/* Teardown completion */
-	if (cppi5_desc_is_tdcm(*addr))
-		return 0;
-
-	/* Check for flush descriptor */
-	if (udma_desc_is_rx_flush(uc, *addr))
-		return -ENOENT;
-
-	return 0;
-}
-
-static void udma_reset_rings(struct udma_chan *uc)
-{
-	struct k3_ring *ring1 = NULL;
-	struct k3_ring *ring2 = NULL;
-
-	switch (uc->config.dir) {
-	case DMA_DEV_TO_MEM:
-		if (uc->rchan) {
-			ring1 = uc->rflow->fd_ring;
-			ring2 = uc->rflow->r_ring;
-		}
-		break;
-	case DMA_MEM_TO_DEV:
-	case DMA_MEM_TO_MEM:
-		if (uc->tchan) {
-			ring1 = uc->tchan->t_ring;
-			ring2 = uc->tchan->tc_ring;
-		}
-		break;
-	default:
-		break;
-	}
-
-	if (ring1)
-		k3_ringacc_ring_reset_dma(ring1,
-					  k3_ringacc_ring_get_occ(ring1));
-	if (ring2)
-		k3_ringacc_ring_reset(ring2);
-
-	/* make sure we are not leaking memory by stalled descriptor */
-	if (uc->terminated_desc) {
-		udma_desc_free(&uc->terminated_desc->vd);
-		uc->terminated_desc = NULL;
-	}
-}
-
 static void udma_decrement_byte_counters(struct udma_chan *uc, u32 val)
 {
 	if (uc->desc->dir == DMA_DEV_TO_MEM) {
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 62c15b0cc9ae7..767b73021390d 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -614,6 +614,10 @@ void udma_desc_pre_callback(struct virt_dma_chan *vc,
 			    struct virt_dma_desc *vd,
 			    struct dmaengine_result *result);
 
+int udma_push_to_ring(struct udma_chan *uc, int idx);
+int udma_pop_from_ring(struct udma_chan *uc, dma_addr_t *addr);
+void udma_reset_rings(struct udma_chan *uc);
+
 /* Direct access to UDMA low lever resources for the glue layer */
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-- 
2.54.0

