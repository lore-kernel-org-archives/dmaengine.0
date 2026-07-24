Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AA7427FB3;
	Fri, 24 Jul 2026 10:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888529; cv=fail; b=hY3UU6NkcQ3De33Yqe29ytxtfiLTTcL7tAbGzA0trqW/e+PAv8c6ghW/1yn9hRzpelfu8qXfL5ye9y6j4sPNwuNjsBRbA1PDstYuCzw8/4IZvAWUSplYkfuzWK7wAnuPnUr2+MCA0G8oexOMkqo2L+A7dHQGABks4TQ0w1EQyCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888529; c=relaxed/simple;
	bh=CrhmwH9eBvGjcoh4biS6CACk15jQpXN9y4ObDGlFFck=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GGG6kl5WmAvomMj2d798vxLegvXPg4maB+LftoalN/PybhfhoV6Q9YNYIAM5heh7aVsLf+Ies2HEIDXGlOErbhRDI8M/Ue2cxGebZlTR4S8gJZqIYbvTgQred0vzYH2f5m+Zaj3kCllx42uFGMMxS15Mh0Er910P/XTkI59LIuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=GnxJefKX; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hYN0iZqa; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="GnxJefKX";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hYN0iZqa"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66OAFHI4821421;
	Fri, 24 Jul 2026 05:21:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=uPMyrI1kGg32mzpEJpABjRZNA56YwScsWpTg+w/+i
	nM=; b=GnxJefKX0gX1rk8nuL+QGGFBnzUvN/F969n2fqPdjy9j7Ipnb8xxLOOpo
	n1jus+TV12ZSyzS2ykRguH2w40NDvQ8GZbC9VoIBT5Lz4l1YRYIQuam4ylFlDVYd
	WubyY7y/mmfXDSsvYSdfpQ1YjuPbjDWJgnnNmpML206ZpA0arHYeW/ILXFAzBe8T
	d8fmQAgoX9BfchO6EmP9+q3Xu/2pHA/szAhMQzrw6SLtLD7pm+XdZGobCGNURK6d
	3iTpEnoPmtZ1cgznQomzP83K/eo0aK2T9x2kP0dv0RsKOtzCxrEZIG6LgOvULkk2
	Nqe84DebKCZG9lsiA6mGfRPF2VSMQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010062.outbound.protection.outlook.com [52.101.61.62])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fm4vw0d40-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 05:21:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETv1BN1iBxkU12pwtpvzvljyizSYgQyo4BgKnVQTYgDRabB7sySe79BOPE0hjD756HSRbYOtcOWMi18AcfNQa+oSXjlsjMIKLa7zygBwZpa7eXjHUahANlGyHYnmjWHhpoKE0Tn09jH8GMElDj2f6Xj5uX2qPd1EbJgYykF5eC3oDj/Qf09ABIbvagMmRnWXAHH4/S7D8mFYvW4zvWCvEbuLZVEpOcmdRvO4rWQLnReN2I15phAp4tt/ivyfV3kIvwu/EgIu5GJxqM73jYA+8HCI5t2y4jngp7XJgc+mH93D41k5m9PTzwEIjnLiYVss4fU1+Uf7zQhrczaj4vZipA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPMyrI1kGg32mzpEJpABjRZNA56YwScsWpTg+w/+inM=;
 b=ZJRh7Dt0abEgRIE/4bF8oWfc7HDTOi4ga1UHFCfALiJhAdVFt8FxyXmtv3OPKi5GoOGPSOCIpO87Cy5RVquiM71yGX+PgqUR3VksP3uO0bN/B6J40yvc4uj2nNVCasmIoddPobf4gFhbvVbg5tF8G/taxQwI++4hDfY2rFWe3sllrPnN6HO7bWERMKqPt/UurxIt3Sdrk5kOK/1vPe5OsTDr7sL74HO6x4a/kV/CSohB+d/TLNq81zZa0ZVh9YiAHSyRqURSVr0xje5RFPkU0OupwuuJzE0n4Xg4GqQgSVjtytOmdmgJoj5OVpIjOhe9vdGa8CWYYQ9iaCXvCmh5WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPMyrI1kGg32mzpEJpABjRZNA56YwScsWpTg+w/+inM=;
 b=hYN0iZqaFwT24DCloqvs2gwHUoSH9IsQP3XvhEPcSM0UlKbVbGvYKpOpGP1r25t0Y5U/4Kh+rvgnkStpo5siCjYOK/jFex3mQ06NPLqn81tez7CrkQNsH10rH2TUAVs3zZYAPg/Mo4BLlxk4hqiRnGndd/pVSM5DJ5xeQUDNLQA=
Received: from SJ0PR03CA0372.namprd03.prod.outlook.com (2603:10b6:a03:3a1::17)
 by DM3PPF3D2127785.namprd10.prod.outlook.com (2603:10b6:f:fc00::c20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Fri, 24 Jul
 2026 10:21:52 +0000
Received: from MWH0EPF000C6193.namprd02.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::f) by SJ0PR03CA0372.outlook.office365.com
 (2603:10b6:a03:3a1::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 10:21:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000C6193.mail.protection.outlook.com (10.167.249.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 10:21:50 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:21:48 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:21:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 24 Jul 2026 05:21:48 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66OALMFJ3017088;
	Fri, 24 Jul 2026 05:21:43 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v7 04/19] dmaengine: ti: k3-udma: move static inline helper functions to header file
Date: Fri, 24 Jul 2026 15:50:37 +0530
Message-ID: <20260724102115.2854-5-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6193:EE_|DM3PPF3D2127785:EE_
X-MS-Office365-Filtering-Correlation-Id: 87b0454a-e4f5-4607-7dce-08dee96d6037
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|7416014|23010399003|10067099003|56012099006|6133799003|921020|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HaVwGU4UpWJa86PBFs5bQ3Gt0diDfXnpnVHUrTO5z9W0qgib5TFPQh34pyJD+3Qv9wukLOhmJ4HCJ1XGx1aYN3GEJOyc4r4e4TtRmoov2IA/lOsEmiBYLplpNdvcnIw96fjh48QYs6He2VkA51875ZpjMrwN/adBIkMBDqc8Lwx8/F1RVNQKbP6BuvO677ZFW1yxzNItCL3BS+Bd3VqBAN4KK7c7pmpvAKJNe6Xq0R0kEcVuiks9R9Wx/x5oORZT6nX2SfnjqaNIfgr3zLy2Pi4Khd2vN/OwljHiqqCXuoT6BsS3tX9VDaPIbjw5ylXECsk1yebA8Da8ry8gV9r0tEvZOuYOu3IAeiT4bs0Q9Wj0Jtzn+3FGMy8Y6+rEsFKCnV+I8R16BUlJi140NojsrGbIhFCwKv3z+MNgp2TzEdZNdqshi8Z78JLd+aReUPzw0pyyqoWzXeDLSd9ynGeTuFm8S1opyYCz7o6A45M9NKKIVq+z7gUr7LSyRhU31Lb+ozrDjPnvZmXF3/QzBp3IYKhggwJiNUbumZKYHoR8L0OVTbsLsOQghZef+NLw/ATEeWm0OCxfQW26mGvkbbbMfDSvJ0WogJV7YwrMn7IpSBjQKsbowXG0KQTdmZvOVIpJsbdoC5QCWhvHhG5NbLi78kl6UT009uQ8BBOUEQXaoyc5gE6fqQlHl4P1EicTPvrXCNVKFVoh5iiYEkR59UWxO5r8F6wpWCBwLH1c5ZQipibvu4uPKc8uosCnsqB0cyoR
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(7416014)(23010399003)(10067099003)(56012099006)(6133799003)(921020)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aEa50KymMqOgEClULVJB0ncBYrV8/u2HMmT91JiUS30ReX9dXtGiMYf79iR/EucPz/kqoxf2Iay2gKwi8twA14SBvc/hpW4JgIW47TIoNhTZuHgUVMHTFBwMXlubliODRd8QF5oRgThHjh5D8kImTInRj8rlmMmZRoPOiaAdhIBnDeOoDFGDU/ku9OOgbfZWI9pXWogckWVUedbgABzgjx02n8jhXRkAdhaeYcdB6lpDuQKy9nUqyGnn6ECK8V2oZ24P1qSKLB/EQ3jNJwvNFEY38mvvplOnBdUV5wNfkMUNBAGL9uT6FCBjG19bt2GTqedKV1XtNUVSljVXeTG8Dm2lXNz4AmPZY1BLrfV2UsyoahPiXpdG+kJ5LuUzqubmxpu9MebJjiMPXmKA6K4E0/WxwFqfwJBMfbnG1T+VdU2OINub+XUQQqxx+JkAeh6r
X-Exchange-RoutingPolicyChecked:
	hSYb7b9UmGNUWSAvbHXtk/qeqafUNv/ae802n5/DyUVsWh26fB0fEn6v/pUyoSCCnfrhj+1gdJeubQRYzrr4XqqplYNj8If8KZu6U9H9u9SoKKe672mXetNepdsr9a7+lowmuaeLMBKbbnvqlqx6m6Hux0Aez6qv4XBv9PnAPq68m3zy1Tb+ZNWs6waK1gZdx/+IwHYV443W95GIujZwyrnK1jwGeKiK+cq4kHgprz8uVrPnHNCBMHKAGGONulYITLkTHjs4aiNuXuIotPz1+nnv2RWvrW8yVb1VBc6eKl4naB1y5tEzUQYfFTwnhG0rcGpF2dlu7Gv7WjDRNqOZdA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 10:21:50.6874
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b0454a-e4f5-4607-7dce-08dee96d6037
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6193.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF3D2127785
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfX5YKCIcFnVNNq
 6mnwex28nxB0c1iKnfohFmVhwprrue1AIhhK8EaBigA+L5uWDHbsLmzZnWoRh3ldVxPZPcAGkWa
 nml0mYrlhBY9B+eR0IZYbPNLkpE883hNPQZYlkpQq3wBLbws4FqSALAMgtmKjPtS65TMr9VLjqB
 kpLRdlgS/jqB2d6gDBXQp6aTowFpsKHsoP4+46a3jgzeOJC40bLSeg8vZjBrfxguKeWRHMcyo6j
 N5DOJgFcJnJnSUt3mkARerAFKxWMFqxBVhwb38M1uoFpimW34V2TArF2yUGsaC6ck7c4CRLK7MZ
 vgQx5WUu64RLV1C2afPRaTx9DWj+U11LkjBdOkubTv949GnqVScozv2YBU+hCfZAS4iSsIEPbjy
 AUOxxEbvb7CfP0/DiluVJH2jxoAVsgWwbVvI5B5U0ehjoM9sXg78MdBLCEkzAv9QPXQC5lO931F
 /wdsDYCrQdM7fcPXM4A==
X-Proofpoint-GUID: GjHLFzIUV8mq_jqO74MGNuUorQnCeYp0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfX0WeHnehQ+Ntm
 vp/dkPAKn1twqzOOSQtQwNnTs9xODY0Ii3lzGnSq1dgzZ+3u2DIF2cqy4J97QV/nOemUn0Elq6c
 Vj8yBwDWFcE3E8GNG29ORoz+9xrsqWg=
X-Proofpoint-ORIG-GUID: GjHLFzIUV8mq_jqO74MGNuUorQnCeYp0
X-Authority-Analysis: v=2.4 cv=feadDUQF c=1 sm=1 tr=0 ts=6a633cc6 cx=c_pps
 a=rA8xTxhMCG4Q6PG1LLvkJA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=8AirrxEcAAAA:8 a=sozttTNsAAAA:8 a=grpEhN_aSmkWsCgVS3MA:9
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240094

Move static inline helper functions in k3-udma.c to k3-udma.h header
file for better separation and reuse.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma.c | 108 --------------------------------------
 drivers/dma/ti/k3-udma.h | 109 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 109 insertions(+), 108 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index ce706033143ad..0eaa06b7ae988 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -40,91 +40,6 @@ static const char * const mmr_names[] = {
 	[MMR_TCHANRT] = "tchanrt",
 };
 
-static inline struct udma_dev *to_udma_dev(struct dma_device *d)
-{
-	return container_of(d, struct udma_dev, ddev);
-}
-
-static inline struct udma_chan *to_udma_chan(struct dma_chan *c)
-{
-	return container_of(c, struct udma_chan, vc.chan);
-}
-
-static inline struct udma_desc *to_udma_desc(struct dma_async_tx_descriptor *t)
-{
-	return container_of(t, struct udma_desc, vd.tx);
-}
-
-/* Generic register access functions */
-static inline u32 udma_read(void __iomem *base, int reg)
-{
-	return readl(base + reg);
-}
-
-static inline void udma_write(void __iomem *base, int reg, u32 val)
-{
-	writel(val, base + reg);
-}
-
-static inline void udma_update_bits(void __iomem *base, int reg,
-				    u32 mask, u32 val)
-{
-	u32 tmp, orig;
-
-	orig = readl(base + reg);
-	tmp = orig & ~mask;
-	tmp |= (val & mask);
-
-	if (tmp != orig)
-		writel(tmp, base + reg);
-}
-
-/* TCHANRT */
-static inline u32 udma_tchanrt_read(struct udma_chan *uc, int reg)
-{
-	if (!uc->tchan)
-		return 0;
-	return udma_read(uc->tchan->reg_rt, reg);
-}
-
-static inline void udma_tchanrt_write(struct udma_chan *uc, int reg, u32 val)
-{
-	if (!uc->tchan)
-		return;
-	udma_write(uc->tchan->reg_rt, reg, val);
-}
-
-static inline void udma_tchanrt_update_bits(struct udma_chan *uc, int reg,
-					    u32 mask, u32 val)
-{
-	if (!uc->tchan)
-		return;
-	udma_update_bits(uc->tchan->reg_rt, reg, mask, val);
-}
-
-/* RCHANRT */
-static inline u32 udma_rchanrt_read(struct udma_chan *uc, int reg)
-{
-	if (!uc->rchan)
-		return 0;
-	return udma_read(uc->rchan->reg_rt, reg);
-}
-
-static inline void udma_rchanrt_write(struct udma_chan *uc, int reg, u32 val)
-{
-	if (!uc->rchan)
-		return;
-	udma_write(uc->rchan->reg_rt, reg, val);
-}
-
-static inline void udma_rchanrt_update_bits(struct udma_chan *uc, int reg,
-					    u32 mask, u32 val)
-{
-	if (!uc->rchan)
-		return;
-	udma_update_bits(uc->rchan->reg_rt, reg, mask, val);
-}
-
 static int navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread)
 {
 	struct udma_tisci_rm *tisci_rm = &ud->tisci_rm;
@@ -216,17 +131,6 @@ static void udma_dump_chan_stdata(struct udma_chan *uc)
 	}
 }
 
-static inline dma_addr_t udma_curr_cppi5_desc_paddr(struct udma_desc *d,
-						    int idx)
-{
-	return d->hwdesc[idx].cppi5_desc_paddr;
-}
-
-static inline void *udma_curr_cppi5_desc_vaddr(struct udma_desc *d, int idx)
-{
-	return d->hwdesc[idx].cppi5_desc_vaddr;
-}
-
 static struct udma_desc *udma_udma_desc_from_paddr(struct udma_chan *uc,
 						   dma_addr_t paddr)
 {
@@ -369,11 +273,6 @@ static bool udma_is_chan_paused(struct udma_chan *uc)
 	return false;
 }
 
-static inline dma_addr_t udma_get_rx_flush_hwdesc_paddr(struct udma_chan *uc)
-{
-	return uc->ud->rx_flush.hwdescs[uc->config.pkt_mode].cppi5_desc_paddr;
-}
-
 static int udma_push_to_ring(struct udma_chan *uc, int idx)
 {
 	struct udma_desc *d = uc->desc;
@@ -775,13 +674,6 @@ static void udma_cyclic_packet_elapsed(struct udma_chan *uc)
 	d->desc_idx = (d->desc_idx + 1) % d->sglen;
 }
 
-static inline void udma_fetch_epib(struct udma_chan *uc, struct udma_desc *d)
-{
-	struct cppi5_host_desc_t *h_desc = d->hwdesc[0].cppi5_desc_vaddr;
-
-	memcpy(d->metadata, h_desc->epib, d->metadata_size);
-}
-
 static bool udma_is_desc_really_done(struct udma_chan *uc, struct udma_desc *d)
 {
 	u32 peer_bcnt, bcnt;
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 11d08adb0d69f..54e1757c3de38 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -451,6 +451,115 @@ struct udma_chan {
 	u32 id;
 };
 
+/* K3 UDMA helper functions */
+static inline struct udma_dev *to_udma_dev(struct dma_device *d)
+{
+	return container_of(d, struct udma_dev, ddev);
+}
+
+static inline struct udma_chan *to_udma_chan(struct dma_chan *c)
+{
+	return container_of(c, struct udma_chan, vc.chan);
+}
+
+static inline struct udma_desc *to_udma_desc(struct dma_async_tx_descriptor *t)
+{
+	return container_of(t, struct udma_desc, vd.tx);
+}
+
+/* Generic register access functions */
+static inline u32 udma_read(void __iomem *base, int reg)
+{
+	return readl(base + reg);
+}
+
+static inline void udma_write(void __iomem *base, int reg, u32 val)
+{
+	writel(val, base + reg);
+}
+
+static inline void udma_update_bits(void __iomem *base, int reg,
+				    u32 mask, u32 val)
+{
+	u32 tmp, orig;
+
+	orig = readl(base + reg);
+	tmp = orig & ~mask;
+	tmp |= (val & mask);
+
+	if (tmp != orig)
+		writel(tmp, base + reg);
+}
+
+/* TCHANRT */
+static inline u32 udma_tchanrt_read(struct udma_chan *uc, int reg)
+{
+	if (!uc->tchan)
+		return 0;
+	return udma_read(uc->tchan->reg_rt, reg);
+}
+
+static inline void udma_tchanrt_write(struct udma_chan *uc, int reg, u32 val)
+{
+	if (!uc->tchan)
+		return;
+	udma_write(uc->tchan->reg_rt, reg, val);
+}
+
+static inline void udma_tchanrt_update_bits(struct udma_chan *uc, int reg,
+					    u32 mask, u32 val)
+{
+	if (!uc->tchan)
+		return;
+	udma_update_bits(uc->tchan->reg_rt, reg, mask, val);
+}
+
+/* RCHANRT */
+static inline u32 udma_rchanrt_read(struct udma_chan *uc, int reg)
+{
+	if (!uc->rchan)
+		return 0;
+	return udma_read(uc->rchan->reg_rt, reg);
+}
+
+static inline void udma_rchanrt_write(struct udma_chan *uc, int reg, u32 val)
+{
+	if (!uc->rchan)
+		return;
+	udma_write(uc->rchan->reg_rt, reg, val);
+}
+
+static inline void udma_rchanrt_update_bits(struct udma_chan *uc, int reg,
+					    u32 mask, u32 val)
+{
+	if (!uc->rchan)
+		return;
+	udma_update_bits(uc->rchan->reg_rt, reg, mask, val);
+}
+
+static inline dma_addr_t udma_curr_cppi5_desc_paddr(struct udma_desc *d,
+						    int idx)
+{
+	return d->hwdesc[idx].cppi5_desc_paddr;
+}
+
+static inline void *udma_curr_cppi5_desc_vaddr(struct udma_desc *d, int idx)
+{
+	return d->hwdesc[idx].cppi5_desc_vaddr;
+}
+
+static inline dma_addr_t udma_get_rx_flush_hwdesc_paddr(struct udma_chan *uc)
+{
+	return uc->ud->rx_flush.hwdescs[uc->config.pkt_mode].cppi5_desc_paddr;
+}
+
+static inline void udma_fetch_epib(struct udma_chan *uc, struct udma_desc *d)
+{
+	struct cppi5_host_desc_t *h_desc = d->hwdesc[0].cppi5_desc_vaddr;
+
+	memcpy(d->metadata, h_desc->epib, d->metadata_size);
+}
+
 /* Direct access to UDMA low lever resources for the glue layer */
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-- 
2.54.0

