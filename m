Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D3A48551F;
	Wed,  7 Oct 2026 10:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369097; cv=fail; b=uiE+0SWxG9Hbs7lp0heURMyEEChMBH1NnWZ8KiPQCsTLA4Bn+u260WswX7pxN7l3G0df3mArdClEwCrAp35FCzjrVJnHPv7XzZm7I7qXyFMB+Ynal+Y0nTYyVnRzW8gWrUoIcY25M7kELTwFw+zr7j3YLgCPlag1CQ+o0lJZhOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369097; c=relaxed/simple;
	bh=+KyjsaJTlWCdtxoyqTmq/0kc3gWB2bygrzzE7vig7RA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZRhHoK4PxrYPN7wMCjzGk5mQMcsU1lGDMIx7K97JSAnluu9cwbbONxe4cpHIUHtdOGULEaKvMy+5umdxW077m6EbanjzoaX05tXtWrfhqZvekmebhyWviRebGjSS+0sLLKuvU5bYJ62H2hNzwSYQ2Kwxxp59BCPZpMaSxNIeUpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=BRunkcqa; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=RNWJ0l8V; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="BRunkcqa";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="RNWJ0l8V"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6977k00E494679;
	Wed, 7 Oct 2026 05:31:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=798wQStnHjOcjm/3vCzAALIX1n8rgGQTr3jQCVlxg
	lo=; b=BRunkcqaZ6xZUr+2j4cDeRnWCfcI1F+xx1PQK4gwkEGoYJa62b6jJp+pn
	vaMBm7TdixM6PT/9N+oDYjfg3/KYl9DyVV+8AwIpZfH8L3TtLay/IOPCnSQ0dGRG
	/wkLWg4xnxnVekA6QLzNwJnDajSQeCkWq+Y/SmiJZlHjKR5zkhrQ5UyXqBWYUcZR
	06oMi7ssOqIrqOjaIW4Pgz94wUIJE4aK8eFB24St1Hpjvxw/K1nMtdhKnklj9d3d
	NOhrtjJKR1MR4BXk2q5Fl+wivs2wsa30KJcoWPyKfsoj6gKD2CksA29mD70ZG5MK
	02xPepEu8uStrHhGNGrsAwxR8sM6A==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010004.outbound.protection.outlook.com [52.101.201.4])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h5dk4sx0s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 05:31:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVfQGtE45S1tiIh1ZPOZpeyqnDpGhowyWmL8+tGrzJzOVH7pCpl8QM0rAmrsEeBol5icu2kNpHVFURxE1s+y5/J9QH7OK2cOEKy1m1sNKw6ngn5BoMk/gupOLxu3nSOa7cOTVxvMWawAPS4xm7RKB8A6Gwgs5NxuNn8W43aZ+8+QkUHfFTg1UawD/bjNIqkhrqfJtlxcalvWKM1qZq+OaqQz8Go2sPLuTp2vDPd6o9n56Q528SM7oxyh1gttAg8yH1qrfzPHW9aWEbDIrJya80ChsORamo9kZDNQPgM4Ku0PSYgNNeawTC9V5xW/Taj75dk/73xXY31mEf0TCKL94A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=798wQStnHjOcjm/3vCzAALIX1n8rgGQTr3jQCVlxglo=;
 b=iNxnDkMx9ajyMPKsmfGKeH/soSF+EC5SsjF5hhU4lP22Yz4jqKnrZbqPXpAGBwhMRywOWciXt7HZpKWyhNlaZXuWsVA2jUZXJWQ17W8yQPI8mBsyQhTd/TtessVOyuDAy9ghVOUv2UHSqATDsmdvCwYg7nNi97b/OftK+D+Jc0fKlunYeCc+3ZlNLK4wW2r6zbnrUWpRheWynbJUxoILAASV2hhoJGxnQ0YoK57xt0YTeK456G1MY8Jr8Rkt9/0+vCwHRRYsICHBmYVCPYWL9VUDTTzsLoVz53dxhvaiRSlLDkb8DdtEySejkTPeQo3XC/HMTC3iHJmdXEhCzDUi1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=798wQStnHjOcjm/3vCzAALIX1n8rgGQTr3jQCVlxglo=;
 b=RNWJ0l8VOdmmXYDolFFm+hXOyYZzkfYHU/cE+BLsibVzR0KQKiWxKz6ZFty22sTGkJTIQCh9A1XOu1HtcEhdV6DWJYd1MSQU6NSEdfZmOQkk2jOatQEGffjvFfEw0iQGR/egl8kVLD3ONZrdy9CNyG7rfi0CUe5qO/ayf9dZi8U=
Received: from DS1PR07CA0024.namprd07.prod.outlook.com (2603:10b6:8:44d::6) by
 BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.6; Wed, 7 Oct 2026
 10:30:55 +0000
Received: from CY8PEPF0000004F.namprd05.prod.outlook.com
 (2603:10b6:8:44d:cafe::64) by DS1PR07CA0024.outlook.office365.com
 (2603:10b6:8:44d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 7
 Oct 2026 10:30:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY8PEPF0000004F.mail.protection.outlook.com (10.167.247.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 10:30:54 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:30:50 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:30:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 7 Oct 2026 05:30:50 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 697ATiSv013473;
	Wed, 7 Oct 2026 05:30:45 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v12 13/20] drivers: soc: ti: k3-ringacc: handle absence of tisci
Date: Wed, 7 Oct 2026 15:58:54 +0530
Message-ID: <20261007102936.2402427-14-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CY8PEPF0000004F:EE_|BLAPR10MB4835:EE_
X-MS-Office365-Filtering-Correlation-Id: 52d23733-da5b-41f1-1d40-08df245e1193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|1800799024|23010399003|6133799003|22082099003|18002099003|10067099003|921020|56012099006;
X-Microsoft-Antispam-Message-Info:
	45kP87va9TiKenDH8jhqasxdUq29oZElUdW8CmcZddWc0niDtalihb6kGK3gDvBH5SmpTWRRvZ0JGJqXEdOJZXseRxMOQP+ajxJLCBHlxb7CQFq9gb4v2qpF958PdnsRfDrNONGt/OPVtAADFIXigcbNJUvKIh2RpIKdpur90pmxsSbwO/e1hPugQ3fmg5cBiOcxdnVgBjiKipsez7uvgkGbKHXBbo/H4ptnwrjFzFncwEj8HHNpyL44//H6xByblmLc/Pfj9G20Ke7LxNlfK6nitqF5nhseTjAIPRaH0WSXm4guaUm5c3/i8f5ddFEf32Y2IEFgJFWnqecA6lA7nDvRrOPzYBXiF54NDQW4MLuQR+7mZqa3eqY2BX32LDqbvQ2IuzDRCu55W7kVcXjVARRHTcThO1izkmc73jw8JBJZiPur324a6VDblFW6v7yVnH7DnFaHCwdGIONT0jXkbeL5YKm/4dnE94gKqN8Z41DeZF6PwoR3Z1Vvrk2lqFEQdqntVS6CfSvhv4Bcvn3sVlYkm5T+Xee3FfMEtbgY4OsDjHqd0Zn/fVDhCJbYry7hVcZGhpMpdvg5SAvx2j+YHr/cMtGYv5VhKgF4uQ4rN2SvyenzZW2xhh2+ZedL3zzutTjYi0YrptgZSaZn+RvrP9Iw3rbiThKpSMbobuwQsPPZjOOXHxNhZa5+FvIfDNI//TNowVeaaViV+4UGf3vKQLQkGuEtOMyBrx+3jitYHCinPUeoXnB/60su68GLb73C
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(10067099003)(921020)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YzCwn/5Yyo6SYVOSSZytHiZtu55YHYXx/KpHdC3S/2DytYdBLt2quIo3ySsG0enVrzqOE6D+nUY8mWsGLGYWDpJjXGOVU/yfV4alRjfgu9ezwN5EFoWAA6Wy88GmHaKL2x1OuMyo+AYVwk4EZ2n7zs3xFxVQcnUbsGrW+kBWW4ot2ngL40SW+HWkK323tBtvpTVMUTeyeSd5SH/EED6FDECRJuhzjKXG2uOReDpUC9xG9yd5j/B4Dx9en5+aWpwL0rqniV2QFfhcNCaCNM8kc/lCe/3jrzoBAvfRIUz5NVSjQVAFl2eSnmd4yeiz9FTDvIBpxdII3wB6XvhtgSaUQoqruJTqKy+wPBkEjwSOniAxYDmYpLaHlr2edxQad0O0KIKnBOOWnMCyW72V9o3sm2d9evxZ+v23VKcv/uJtJ5Ht1BcGJFCmvvLot9/QQ8MY
X-Exchange-RoutingPolicyChecked:
	GJno6e3xf3aSiwfNMUG112cL8qPRA28c6gb+b2wDYrg3bNMAoOues4yJG3hJicpzGvvkWJFyHO0+IJl9cOq3z/UDCWjUlZzsQLfKPlt+LA3f9gL4hVIxFQvWFBSsVrM52Ss2c/vI0pzd/fzr2pfEvS5dcrNfLJca7zyEjqGMpzhZt9TMRQgw5Bq6mASRibgj5G64jyqAmsvJ2XMwTHKQRfOlpMBoZrvvuWbIYEnukVS8B+HX/tD9Oi3UaEltDQkCAcvj/83LKqjXdcFOqhTuWzir5EjfzhMhB60Be4PjdZuSe3O1x3Hz6GlD0Qnh6k682j/qPquqrrW4JnRHM+L1rw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:30:54.9468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52d23733-da5b-41f1-1d40-08df245e1193
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY8PEPF0000004F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4835
X-Authority-Analysis: v=2.4 cv=TaYDJhQh c=1 sm=1 tr=0 ts=6ac61f64 cx=c_pps
 a=d9xwnOGIUB/89jyRF8/ldQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=6fHTETW1lTHpXEOldC0A:9
X-Proofpoint-GUID: TbYpQihKP5294F3bwykdVnjQQ2_ezKVR
X-Proofpoint-ORIG-GUID: TbYpQihKP5294F3bwykdVnjQQ2_ezKVR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX7CnbSwkuvcDl
 JpA5zS12r27s6/3FE5vjH/rRT4lLSuYOv2bPJqQeBcgiDTWXHwvTeyivE/bxv3CBNL9Vf3JYKvv
 6LV2K5u8KD91UCGpaG6fIPkG9krcCKM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX6ntVflrZS1HD
 vakVh5RWH7/G3Qm1gtA7gdGPZa/U1FEH+SyuHuZQBQhgv7C6No7bQHLH16Xu/mmlMuILZ9vVspq
 xU8Hah2nM+4Fseg961GZmCMZTaR0ISqlEWM/rdD6EL8kQoCJBtCZdT4fOj2dPit1H2ypl02Br03
 /8xpRFzhpUKabfUt4iz9ixkSNJt8LCqnN94SDk9poiYW9a/bkp8pJWWDSijhnrzB0gs7JqBRjzK
 zJcg4zUdYDnTm9iJB/zf7tdLYgmx8kwrSbJcX29IlTBtAzz6S2ZcZkQcnYCUkiEYW4hk2BwLhRL
 IGognPSCvLnKFhvs47yfnMRqyUzfQjBhDfgF/2MNo5I84nNu8jv9sszk3ejHmRXVMFPpg33+/gf
 Lmd0/aJNjxxFM0jGiv09aduaFhH9O+aSrGDPEQtD7vRTNkpjfqcaj210GxQ6vjpxY5+M9EhvnfS
 uKYfMNlwWYbrnYCDoKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070041

Handle absence of tisci with direct register writes. This will support
platforms that do not have tisci firmware like AM62L.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/soc/ti/k3-ringacc.c       | 209 +++++++++++++++++++++++++++---
 include/linux/soc/ti/k3-ringacc.h |  18 +++
 2 files changed, 208 insertions(+), 19 deletions(-)

diff --git a/drivers/soc/ti/k3-ringacc.c b/drivers/soc/ti/k3-ringacc.c
index 5966db4327b13..9195d91fae732 100644
--- a/drivers/soc/ti/k3-ringacc.c
+++ b/drivers/soc/ti/k3-ringacc.c
@@ -7,6 +7,7 @@
 
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -46,6 +47,53 @@ struct k3_ring_rt_regs {
 	u32	hwindx;
 };
 
+#define K3_RINGACC_RT_CFG_REGS_OFS	0x40
+#define K3_DMARING_CFG_ADDR_HI_MASK	GENMASK(3, 0)
+#define K3_DMARING_CFG_ASEL_SHIFT	16
+#define K3_DMARING_CFG_SIZE_MASK	GENMASK(15, 0)
+
+/**
+ * struct k3_ring_cfg_regs - The RA Configuration Registers region
+ *
+ * @ba_lo: Ring Base Address Low Register
+ * @ba_hi: Ring Base Address High Register
+ * @size: Ring Size Register
+ */
+struct k3_ring_cfg_regs {
+	u32	ba_lo;
+	u32	ba_hi;
+	u32	size;
+};
+
+#define K3_RINGACC_RT_INT_REGS_OFS		0x140
+#define K3_RINGACC_RT_INT_ENABLE_SET_COMPLETE	BIT(0)
+#define K3_RINGACC_RT_INT_ENABLE_SET_TR			BIT(2)
+
+/**
+ * struct k3_ring_intr_regs {
+ *
+ * @enable_set: Ring Interrupt Enable Register
+ * @resv_1: Reserved
+ * @clr: Ring Interrupt Clear Register
+ * @resv_2: Reserved
+ * @status_set: Ring Interrupt Status Set Register
+ * @resv_3: Reserved
+ * @status: Ring Interrupt Status Register
+ * @resv_4: Reserved
+ * @status_masked: Ring Interrupt Status Masked Register
+ */
+struct k3_ring_intr_regs {
+	u32	enable_set;
+	u32	resv_1;
+	u32	clr;
+	u32	resv_2;
+	u32	status_set;
+	u32	resv_3;
+	u32	status;
+	u32	resv_4;
+	u32	status_masked;
+};
+
 #define K3_RINGACC_RT_REGS_STEP			0x1000
 #define K3_DMARING_RT_REGS_STEP			0x2000
 #define K3_DMARING_RT_REGS_REVERSE_OFS		0x1000
@@ -139,6 +187,8 @@ struct k3_ring_state {
  * struct k3_ring - RA Ring descriptor
  *
  * @rt: Ring control/status registers
+ * @cfg: Ring config registers
+ * @intr: Ring interrupt registers
  * @fifos: Ring queues registers
  * @proxy: Ring Proxy Datapath registers
  * @ring_mem_dma: Ring buffer dma address
@@ -158,6 +208,8 @@ struct k3_ring_state {
  */
 struct k3_ring {
 	struct k3_ring_rt_regs __iomem *rt;
+	struct k3_ring_cfg_regs __iomem *cfg;
+	struct k3_ring_intr_regs __iomem *intr;
 	struct k3_ring_fifo_regs __iomem *fifos;
 	struct k3_ringacc_proxy_target_regs  __iomem *proxy;
 	dma_addr_t	ring_mem_dma;
@@ -467,15 +519,49 @@ static void k3_ringacc_ring_reset_sci(struct k3_ring *ring)
 	struct k3_ringacc *ringacc = ring->parent;
 	int ret;
 
-	ring_cfg.nav_id = ringacc->tisci_dev_id;
-	ring_cfg.index = ring->ring_id;
-	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_COUNT_VALID;
-	ring_cfg.count = ring->size;
+	/*
+	 * The register-poll path below uses the atomic poll variant because
+	 * this function can be called from atomic context (e.g. K3 UDMA V2's
+	 * autopair-timeout cleanup, which runs under uc->vc.lock, including
+	 * from hardirq context). This is only safe because K3 UDMA V2 never
+	 * sets ringacc->tisci, so this function always takes this branch for
+	 * V2 callers. If V2 ever gains TI SCI firmware-managed ring support,
+	 * the branch below will need an atomic-safe path as well, since a
+	 * TI SCI mailbox RPC cannot be made non-sleeping.
+	 */
+	if (!ringacc->tisci) {
+		u32 reg;
+
+		if (!ring->cfg)
+			return;
+
+		reg = readl(&ring->cfg->size);
+		reg &= ~K3_DMARING_CFG_SIZE_MASK;
+		writel(reg, &ring->cfg->size);
+
+		ret = readl_poll_timeout_atomic(&ring->cfg->size, reg,
+						 !(reg & K3_DMARING_CFG_SIZE_MASK),
+						 1, 100);
+		if (ret) {
+			dev_err(ringacc->dev, "ring %d size clear timeout\n",
+				ring->ring_id);
+			return;
+		}
 
-	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
-	if (ret)
-		dev_err(ringacc->dev, "TISCI reset ring fail (%d) ring_idx %d\n",
-			ret, ring->ring_id);
+		reg = readl(&ring->cfg->size);
+		reg |= ring->size;
+		writel(reg, &ring->cfg->size);
+	} else {
+		ring_cfg.nav_id = ringacc->tisci_dev_id;
+		ring_cfg.index = ring->ring_id;
+		ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_COUNT_VALID;
+		ring_cfg.count = ring->size;
+
+		ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
+		if (ret)
+			dev_err(ringacc->dev, "TISCI reset ring fail (%d) ring_idx %d\n",
+				ret, ring->ring_id);
+	}
 }
 
 void k3_ringacc_ring_reset(struct k3_ring *ring)
@@ -501,6 +587,9 @@ static void k3_ringacc_ring_reconfig_qmode_sci(struct k3_ring *ring,
 	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_MODE_VALID;
 	ring_cfg.mode = mode;
 
+	if (!ringacc->tisci)
+		return;
+
 	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
 	if (ret)
 		dev_err(ringacc->dev, "TISCI reconf qmode fail (%d) ring_idx %d\n",
@@ -576,10 +665,40 @@ static void k3_ringacc_ring_free_sci(struct k3_ring *ring)
 	ring_cfg.index = ring->ring_id;
 	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_ALL_NO_ORDER;
 
-	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
-	if (ret)
-		dev_err(ringacc->dev, "TISCI ring free fail (%d) ring_idx %d\n",
-			ret, ring->ring_id);
+	if (!ringacc->tisci) {
+		u32 reg;
+
+		writel(K3_RINGACC_RT_INT_ENABLE_SET_COMPLETE | K3_RINGACC_RT_INT_ENABLE_SET_TR,
+		       &ring->intr->clr);
+
+		reg = readl(&ring->cfg->size);
+		reg &= ~K3_DMARING_CFG_SIZE_MASK;
+		writel(reg, &ring->cfg->size);
+
+		ret = readl_poll_timeout(&ring->cfg->size, reg,
+					  !(reg & K3_DMARING_CFG_SIZE_MASK),
+					  1, 100);
+		if (ret) {
+			dev_err(ringacc->dev, "ring %d size clear timeout\n",
+				ring->ring_id);
+			return;
+		}
+
+		reg = readl(&ring->cfg->size);
+		reg |= ring_cfg.count & K3_DMARING_CFG_SIZE_MASK;
+
+		writel(reg, &ring->cfg->size);
+
+		writel(ring_cfg.addr_lo, &ring->cfg->ba_lo);
+		writel((ring_cfg.addr_hi & K3_DMARING_CFG_ADDR_HI_MASK) +
+				(ring_cfg.asel << K3_DMARING_CFG_ASEL_SHIFT),
+				&ring->cfg->ba_hi);
+	} else {
+		ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
+		if (ret)
+			dev_err(ringacc->dev, "TISCI ring free fail (%d) ring_idx %d\n",
+				ret, ring->ring_id);
+	}
 }
 
 int k3_ringacc_ring_free(struct k3_ring *ring)
@@ -670,15 +789,36 @@ int k3_ringacc_get_ring_irq_num(struct k3_ring *ring)
 }
 EXPORT_SYMBOL_GPL(k3_ringacc_get_ring_irq_num);
 
+u32 k3_ringacc_ring_get_irq_status(struct k3_ring *ring)
+{
+	struct k3_ringacc *ringacc = ring->parent;
+	struct k3_ring *fwd_ring = &ringacc->rings[ring->ring_id];
+
+	if (!fwd_ring->intr)
+		return 0;
+
+	return readl(&fwd_ring->intr->status);
+}
+EXPORT_SYMBOL_GPL(k3_ringacc_ring_get_irq_status);
+
+void k3_ringacc_ring_clear_irq(struct k3_ring *ring, u32 status)
+{
+	struct k3_ringacc *ringacc = ring->parent;
+	struct k3_ring *fwd_ring = &ringacc->rings[ring->ring_id];
+
+	if (!fwd_ring->intr)
+		return;
+
+	writel(status, &fwd_ring->intr->status);
+}
+EXPORT_SYMBOL_GPL(k3_ringacc_ring_clear_irq);
+
 static int k3_ringacc_ring_cfg_sci(struct k3_ring *ring)
 {
 	struct ti_sci_msg_rm_ring_cfg ring_cfg = { 0 };
 	struct k3_ringacc *ringacc = ring->parent;
 	int ret;
 
-	if (!ringacc->tisci)
-		return -EINVAL;
-
 	ring_cfg.nav_id = ringacc->tisci_dev_id;
 	ring_cfg.index = ring->ring_id;
 	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_ALL_NO_ORDER;
@@ -689,6 +829,24 @@ static int k3_ringacc_ring_cfg_sci(struct k3_ring *ring)
 	ring_cfg.size = ring->elm_size;
 	ring_cfg.asel = ring->asel;
 
+	if (!ringacc->tisci) {
+		u32 reg;
+
+		writel(ring_cfg.addr_lo, &ring->cfg->ba_lo);
+		writel((ring_cfg.addr_hi & K3_DMARING_CFG_ADDR_HI_MASK) +
+				(ring_cfg.asel << K3_DMARING_CFG_ASEL_SHIFT),
+				&ring->cfg->ba_hi);
+
+		reg = readl(&ring->cfg->size);
+		reg &= ~K3_DMARING_CFG_SIZE_MASK;
+		reg |= ring_cfg.count & K3_DMARING_CFG_SIZE_MASK;
+
+		writel(reg, &ring->cfg->size);
+		writel(K3_RINGACC_RT_INT_ENABLE_SET_COMPLETE | K3_RINGACC_RT_INT_ENABLE_SET_TR,
+		       &ring->intr->enable_set);
+		return 0;
+	}
+
 	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
 	if (ret)
 		dev_err(ringacc->dev, "TISCI config ring fail (%d) ring_idx %d\n",
@@ -1347,6 +1505,11 @@ static int k3_ringacc_probe_dt(struct k3_ringacc *ringacc)
 		return PTR_ERR(ringacc->rm_gp_range);
 	}
 
+	if (!IS_ENABLED(CONFIG_TI_SCI_INTA_MSI_DOMAIN)) {
+		dev_err(dev, "TI_SCI_INTA_MSI_DOMAIN is required for a DT-probed ringacc with ti,sci\n");
+		return -ENODEV;
+	}
+
 	return ti_sci_inta_msi_domain_alloc_irqs(ringacc->dev,
 						 ringacc->rm_gp_range);
 }
@@ -1481,9 +1644,12 @@ struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
 
 	mutex_init(&ringacc->req_lock);
 
-	base_rt = devm_platform_ioremap_resource_byname(pdev, "ringrt");
-	if (IS_ERR(base_rt))
-		return ERR_CAST(base_rt);
+	base_rt = data->base_rt;
+	if (!base_rt) {
+		base_rt = devm_platform_ioremap_resource_byname(pdev, "ringrt");
+		if (IS_ERR(base_rt))
+			return ERR_CAST(base_rt);
+	}
 
 	ringacc->rings = devm_kzalloc(dev,
 				      sizeof(*ringacc->rings) *
@@ -1499,6 +1665,10 @@ struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
 		struct k3_ring *ring = &ringacc->rings[i];
 
 		ring->rt = base_rt + K3_DMARING_RT_REGS_STEP * i;
+		ring->cfg = base_rt + K3_RINGACC_RT_CFG_REGS_OFS +
+			    K3_DMARING_RT_REGS_STEP * i;
+		ring->intr = base_rt + K3_RINGACC_RT_INT_REGS_OFS +
+			     K3_DMARING_RT_REGS_STEP * i;
 		ring->parent = ringacc;
 		ring->ring_id = i;
 		ring->proxy_id = K3_RINGACC_PROXY_NOT_USED;
@@ -1512,7 +1682,8 @@ struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
 		ring->flags = K3_RING_FLAG_REVERSE;
 	}
 
-	ringacc->tisci_ring_ops = &ringacc->tisci->ops.rm_ring_ops;
+	if (ringacc->tisci)
+		ringacc->tisci_ring_ops = &ringacc->tisci->ops.rm_ring_ops;
 
 	dev_info(dev, "Number of rings: %u\n", ringacc->num_rings);
 
diff --git a/include/linux/soc/ti/k3-ringacc.h b/include/linux/soc/ti/k3-ringacc.h
index 7b7fc237c08f5..2a9b7834bc430 100644
--- a/include/linux/soc/ti/k3-ringacc.h
+++ b/include/linux/soc/ti/k3-ringacc.h
@@ -156,6 +156,23 @@ u32 k3_ringacc_get_ring_id(struct k3_ring *ring);
  */
 int k3_ringacc_get_ring_irq_num(struct k3_ring *ring);
 
+/**
+ * k3_ringacc_ring_get_irq_status - Get the irq status for the ring
+ * @ring: pointer on ring
+ *
+ * Returns the interrupt status
+ */
+u32 k3_ringacc_ring_get_irq_status(struct k3_ring *ring);
+
+/**
+ * k3_ringacc_ring_clear_irq - Clear the given interrupts
+ * @ring: pointer on ring
+ * @status: mask of interrupt status bits to clear
+ *
+ * Clears only the interrupt status bits set in @status on the ring
+ */
+void k3_ringacc_ring_clear_irq(struct k3_ring *ring, u32 status);
+
 /**
  * k3_ringacc_ring_cfg - ring configure
  * @ring: pointer on ring
@@ -263,6 +280,7 @@ struct k3_ringacc_init_data {
 	const struct ti_sci_handle *tisci;
 	u32 tisci_dev_id;
 	u32 num_rings;
+	void __iomem *base_rt;
 };
 
 struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
-- 
2.55.0

