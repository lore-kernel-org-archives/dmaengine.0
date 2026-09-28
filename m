Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A9D36DA1A;
	Mon, 28 Sep 2026 02:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790564344; cv=fail; b=eayLPqDS7ip5maUbf24kq3mY6539tI4uajUVFVPUD6NtJbzRMC5updckSbFKbgYvVIaYdvkXUfbOO4rorpsTfqAy2NwKGdFdhy6U0vK3WmiGBbe6V95u1cRiRD7ikWvRFJ3bqUUjp0PaOJn3pzVAmt/kUBwoqHbXniTSjruQyx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790564344; c=relaxed/simple;
	bh=RW+PqzSQ5WvJoIsZ7JEixWn8SAb1EUozaq6kISlvTK4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HToLPiZGGrVKDaAW+JSqTPerDSwnefv7clxi85eV8ic34ludWfKUZ8TBhT+aXEHClxetvsy0NcFaO8eqBI2nqsErupG84+j8IRZedptGIBazbry4sKpdjpJ0muq9mnvaU9b6sHR/lvQE9ujLoW+E644Q/AwJ6BQlOEBJMFLNBbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=T9l3ZZMC; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=u7lE9WQR; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="T9l3ZZMC";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="u7lE9WQR"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RKXZrw2806195;
	Sun, 27 Sep 2026 21:58:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=KrULaVwgCCElip4aRKBYaZURAqN1+fYOie+cnf4tK
	eI=; b=T9l3ZZMCOrgArwkC26BmRS+MK54uqm6PcOxqntzI1rNHHbas7V5TNJwvO
	yBWSgdH4730865lqqGWQQiZXWd9Q8YOHpIUe4cj6wfEkb3mPFVclm0ER0ePYlvSH
	Cg+Lrh1+pFO7yO8+RQupRAl7dmkT6VRtI5Ix69kTuyEPVCG1+14kyeTvsfpizbP/
	K3r/Llxlc+rzF574GQvoqHdVUrca/Dw5OHz1mhjJuVYyXpaRVTx3GPGMTEEjWZlV
	9wCEWx6OsrzVfwISev7mRUO0lrWzWFmHTLd4qsIib4yiC3JVNlq3XrWjZ2SXd0ii
	cOHBkzz/gDLiDJsn7tSitnjkKV4CQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013006.outbound.protection.outlook.com [40.93.196.6])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gxwe5kfps-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 21:58:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G1AFUtYgBxKmYEhLZUGvRwA/qKTczKJTg0u4CgdAvILXkVY2GQFqfPaajY+RwVWHcUuya4euSg+TrhDiM31UPdhgdQWGZg/0Ggh/VYV2kQMMAir3se4Hba/0dH9vnzhs0enaO7iNIPpTXNugwInatJMikyPJX8tdmd1Ym5spV4ovntO8/5/MM9KGXAyDZRqYFBqavU4Bmbrg+0//OGn8CBQdoLEA44UIoYq0BHF+JWJuWcMYXHZc71hMymlqb/e9iW7a9pDCaELueJx3kXdFikRoV3ND3IQwKm2HD1CJ79/efOLABXxPRhrshn7gij4I0YBsu4jexBDwqYF/wdTrzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrULaVwgCCElip4aRKBYaZURAqN1+fYOie+cnf4tKeI=;
 b=TDqKcKB0FmNTQOS2ILjR6Xv0Pp7Qya6cYunW5M0Syo//sgUrEQ4llGWoVX7E9tg7iY5+qubX8/hsMhcvuf1j88uFSieCSQS86q4Ua9La1uPjVgiC0ZNzGSx9McmLKKbQ97k4iloGkcsLL6LS98l3myxDgRelqwy0x4hUE3/jevUz7XkGmLmEp977DMm7HIpjsGkISGnLZic8T8lsr5wCpWDWMdbF+FzT21k/3Oe3w2Xze8a8rQSpTleEuPvCqgz6hgiNuM9GTRAJzS63sgog7ZG64yK9QKY51BxEgMxMCPZF2MV7aPjNffkilTqnAy+9ka1iroqFnuavWoweLTjffA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrULaVwgCCElip4aRKBYaZURAqN1+fYOie+cnf4tKeI=;
 b=u7lE9WQRQeC8QWIYR3SnZkNHJSkT7Vl7yO77svjE76DLQVIqbw+e0b/EtAqcTKxBOMN3QuKhJgMmjJR79dRiS4uYQA6pcp/WBl4QHfeF01mChp7f8mrmwCMSmQM/p3XYkxf2pa1yHiE54BuGUletHWqmxecszjybsNVwXnh/rkY=
Received: from CH0PR03CA0303.namprd03.prod.outlook.com (2603:10b6:610:118::16)
 by DM3PPFEDD6F73B8.namprd10.prod.outlook.com (2603:10b6:f:fc00::c56) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Mon, 28 Sep
 2026 02:58:49 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:118:cafe::1a) by CH0PR03CA0303.outlook.office365.com
 (2603:10b6:610:118::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 02:58:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 02:58:48 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 21:58:31 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 21:58:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 21:58:30 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S2vqqE2256662;
	Sun, 27 Sep 2026 21:58:26 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v10 07/19] dmaengine: ti: k3-udma: Add variant-specific function pointers to udma_dev
Date: Mon, 28 Sep 2026 08:26:13 +0530
Message-ID: <20260928025749.1055383-8-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|DM3PPFEDD6F73B8:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b2f2c86-ae28-4372-3e9d-08df1d0c6b7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|82310400026|1800799024|921020|10067099003|56012099006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	+fUpNQ/20DSVIJ/NLC/olWKRWDZenYm3YZmnMTGEoY77zf8XL6OWkkmxC32/cu8Hl4+1zMfBPav/2ZZmL7nqIhBwjEOf53rTCzUiyv9+TyMLecp7BvniuV+RpASyDWpYzoHDWS6OaQfiwCHW+klUH+6j3XovQmmgo6g9DNVJ2wFtUbHeIN9cMANr3DSSQ2N/4Pduz58OHSTqKxYjdkH1YnituNbdd8ZUtuYfL5zXQpGCY4P64Ig35Kufz39Z33JTk6ay1MnlluTmD4ykeJ6ix0H3by/HQ1fXbcjVD/8bDN2w4hBKMj/hk1q5lNc1y5ZUKppQH66W3pdns2RVfQHgswmQRyJ9vF9uqwcKzmUwgr9LlkZ5ufHztsoCz7/uV20saIKImyF0TlL9piS4Z5wJhO8sy/L+kZlaCx7g+EHpEoZC4btCYIuCa9d6nMPmnr/FrshAr99mi5NVHIzqNSegcvkZ6h9jUV88WEGgy6vcF+Ue0WHz5gA7Z1cj0xgF8O2QMxV48+K0bugqL7UQ/GMWPrAZGrlYMhIpS+zOGAcLvlzQoXz/ewo9kXG/ZgCjO3WdJK+k+rVnKTpxpVBNgw3eoxmeSsMe1P2cRioqGj2tE+JYXDWUmBw9CmuQPcLF3PuLSCJXCL6kWn6HDWw1wX12HYP0dZDRjPFyuxKGumGPzjnYqcd/uoYHqrXL2Vp8QCB/4vurnM5/3qobwb0L/N6J5Ote4j3JnBrTb3xrQr836q+J3idGzJkAGvCEoTWbhGxJ
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(82310400026)(1800799024)(921020)(10067099003)(56012099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lfVOFXORyjvj+kdLvB7GOkspi313lVKryCO7oPjhT5821sQFn3BBMjEH6fqXDD+ay36UmRoNd4XyGTaQODTL+4KgjZElhlLFJNuBPVnrNtfGxzNpQitcH8eqk01EMbFnxX744cDbV9EXdsGp54THoVcdddooi4NggECJwjGczEmTkVzGN/3agM7EpcFSwmTZlBvOxUo9SGnumJOktcwtF/fm91IJILrROU/enCAVMhq5zrItMEh1Yasthtc5KdUDZThISQlEN8TPnZbmWkEEQj/PDybwLtrE9kZzEE7IbdUUy3SJQM8qtAi9+bavq3MrCKwcw9DwifeuZNinfHKJh3+HFO/gEi/IZqsvgrRAiZN+z91S4IQeXj1BF9E7PFu50HVaTPwuQ33ez3KrY4y2pdsNpOB6xg5lsPQTV0ofBiuIV405OABjk8I83ouezCm9
X-Exchange-RoutingPolicyChecked:
	gfbdch/qre2n+ccjte8avSHQzBImzM7myJ3DXhNqpK1b1MsrLyVxFoD4c6r1NaBK0LjiFzI0CDjfR1SS9Vbh3w5DZOe03V0jbg/sjbTVJAHRLddZs76oMpwB1Flhg/+dO+WwOcncjoSS3Fz7C6sUyMEWKz+swTeuGsMq/1xqknr+Yx+Go/j+rZ196nsa2jt6iQ/atbJWNpqHrB6Dlu+oFgRZZWtkUIRz6OpMX9NIc51DLBZSwR/yoN1T0k4Tp6VvXHDBG1YIjWHMzMWTMKCqXtZ7tF5B5BCKWW221VbqK5uHQzraRndIsB6QlYeyexR3ROU7osAoW4rBlD0vsWfjBw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 02:58:48.8929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b2f2c86-ae28-4372-3e9d-08df1d0c6b7b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFEDD6F73B8
X-Authority-Analysis: v=2.4 cv=aeP0Dhot c=1 sm=1 tr=0 ts=6ab9d7ee cx=c_pps
 a=oxxrQmGkUFFO/gDwv9AvRA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=8AirrxEcAAAA:8 a=sozttTNsAAAA:8
 a=G_UKfOQgHLmTBcQ1_a4A:9 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMSBTYWx0ZWRfX3hxtd9z1CUDX
 Y/b+ioljFxEruwChBbEmBsgbFf/5clHxs09P3OneAEgEmLK/VjDXoRiUZ7O61+wG1tB7kb/J0X7
 d090EgPAf6zBPSzXpaDRew9m4t0LZY5U1doC3F3J6gwnLdG/TataxfEKLYi89L3RboGV50G7xuk
 VpP3SOODPLyVLYXRwFZvVbojaeo88jJOjhHtOl5PgJ5+asCEVKi+n37xQOlRdFZnDfjb1P+/YLv
 pNuGToqUXAXxQvo2rQqJ6pTbgixFZoZkr2ZipkhQ7KTTa876bbok0Abo30PBOU4F/u/6mFo5Muv
 3Qm9xYbp4uE/npgPryN6ayTJbgYwy6i4qpGC0PoIg5zg4fIy/nTaS6Kje9/J27u5WwXabr625w6
 jyM14g5tHNITtsBEJuqpTJSkGaf4+Q+2iqXRmMn4uvGMMo/zs7jlXaKiXeVYDCvHFUiaPFl2PPj
 LlXQMTNgO8RSpo8m7Iw==
X-Proofpoint-ORIG-GUID: xXs1rtU4G3FAatjmSiwNPOODRLKF0yKt
X-Proofpoint-GUID: xXs1rtU4G3FAatjmSiwNPOODRLKF0yKt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMSBTYWx0ZWRfX+vQB2wW3s3YZ
 Xw7DQJaPjfpekv07gmhSTndxeuMmiEMmVsqEHqZNF4kSNnzJpidUGdDqzFBhuX8xsMu4q5T00qg
 bNhKm7NW3trQij2MxpoW0HVQ8Jq4Cjo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280011

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

