Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BA8433033;
	Fri, 24 Jul 2026 10:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888577; cv=fail; b=AeCS2uxJByZQS8KzRn3yVbL8jw7NEFA00il4Iv0C+/sOOhJV2BwQ2NXoslP3o0MvjV8fgWJPirg0HKt3VnnTPn9Dqg2QykA5OLOzcbbPzNUbEr3FnT9nbeIglwyRZtgo439L8qqzOdkwYKnDZkZgxRxVKH9kdnvbGgk5MdnTxt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888577; c=relaxed/simple;
	bh=Wpg5b1X6+6C8Xs431x3az2z7BpJosCaJNxp0J+cLmFc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g6E7tBxb2teqtkZ8/wqxaWsAFNM0RBmAfZh5MBWbkz+ZBS/IEbPVYodsPVAGkdRdlDhbe6bOvE9o+AwAl3hy29SALCj+GAN2+TdtFyf8dZJhz/2dyyDuedEDVo4ZOTOwX3mGtm+FWpqHFEMYsfIfnKdc8mqPLN80PSHQc7eCxCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=jEX5jJrx; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=i112Jl8r; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="jEX5jJrx";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="i112Jl8r"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66OAF9OP2796761;
	Fri, 24 Jul 2026 05:22:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=GDgvrlI2YqRkvzqhjxzdPC6mOKbamuxBF2VmUYeEP
	WI=; b=jEX5jJrxoIuvbVTgXu+oyTET+WS01AbtdOEeeh2h1vy/mT9Z2j/ASufV8
	f9Xo1ShoQ5+epCwLe1cfj2j5+0wM4JlZSQy9R0MXPaQc4azSsqmcxIAN44KmFACH
	U5bdGszQmn7kDdVZL1tZvj3cDzTvlOS7lY8s1HLbdjEmV384cG+3QWMffkBWQHRJ
	K36rBTrKYhjXesJEHa/5vlDHJU4VoAFYeCePn8KNlJG1ewcEeNAkzOFbzb/TCt5j
	qyWPcbX1mcQ42kRgXCIgJpNbBBBWdL3QiieDYvdRKyZmaCKhQIpDXGjwAfO9eyXt
	o745szY83i4kcOfAJAlj/C/WlZ4Xg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010062.outbound.protection.outlook.com [52.101.201.62])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fm3v38pw1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 05:22:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOsHQRSomU9YuwL1zk+ySIyZN41nSugc8pwx0r5VODUDKR2jxEiu7myyrj7W6WLB8c+LQKyUvfzsDr0wlWaaJ1/XqxTaU5DdUYjeBR7CgIoh0RCxKeHNQMW/vBhpUqtZyQBw6RLKbHDq/REdbxDFELkv2GLHwKzM1+ZZN1MbyPn3+5zx0AVMzlYYanr/CgIdBvhkje+mBUBp0yKOVCutVMHHYYKOHpuuWcLHEv5mmhdlcjiWYzF0ksua6AI90BopFVBpOrVTmNHEnSgzrHJrt+6WWxfZYSBYX5YFNaiGrgXyZKORywEmamY4Lvsoy6vMj1nBT+doMowKjwO4KGcpyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDgvrlI2YqRkvzqhjxzdPC6mOKbamuxBF2VmUYeEPWI=;
 b=R3s8SkEe+Wx1Y8EyLylATVOz/xutuG/JfBPbQyLe0NdR0aj3KN+wba3ySrZxLs0Folb9DhUDPP0cvXwg3FUG0yZyvKCcTphnjw0+Qk7MMFGIelhsjjFeWaIcwpzOVw6Y/z7DyUBLCw7NY1jbTM/9/6kvby30eYqZTJ2Is2mPxm80W7mWncIjx2wx53OivaS65sbgjgh+cc4AJ4LZkw5gd9FxK17jbUulk2HPA6COlRTZWBEH0hpBmLFy1Yh8iB8zB17P2afStb/S4OMEI4/U7MJ0hc+9f4MGHwplRFl8x0WJzoXkCZK+7WMd8R4lhtTFU2ZOPuv9Z57dUsM9X28AzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDgvrlI2YqRkvzqhjxzdPC6mOKbamuxBF2VmUYeEPWI=;
 b=i112Jl8rRS9cA0LU0ZBy3Qnf+QXrjtiRILuTpCSL5j+kOL/nIFNvRRneT2hqa6ja4fhNnMgVw0I5ADKOGajosqpwxYEfgDK7OSaBItTZ5B+mlp+GyN6E6CCPjFiF8QEdaYGeDYPfD9oadXow4oLLPlh6AY5WIA6Q7jQLev2PR0I=
Received: from SJ0PR05CA0168.namprd05.prod.outlook.com (2603:10b6:a03:339::23)
 by DSVPR10MB997870.namprd10.prod.outlook.com (2603:10b6:8:45d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 10:22:35 +0000
Received: from MWH0EPF000C6195.namprd02.prod.outlook.com
 (2603:10b6:a03:339:cafe::99) by SJ0PR05CA0168.outlook.office365.com
 (2603:10b6:a03:339::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.4 via Frontend Transport; Fri, 24
 Jul 2026 10:22:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000C6195.mail.protection.outlook.com (10.167.249.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 10:22:33 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:22:29 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:22:29 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 24 Jul 2026 05:22:29 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66OALMFR3017088;
	Fri, 24 Jul 2026 05:22:24 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v7 12/19] drivers: soc: ti: k3-ringacc: handle absence of tisci
Date: Fri, 24 Jul 2026 15:50:45 +0530
Message-ID: <20260724102115.2854-13-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6195:EE_|DSVPR10MB997870:EE_
X-MS-Office365-Filtering-Correlation-Id: cbbcc40e-98d2-4742-b3ab-08dee96d79c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|1800799024|23010399003|56012099006|10067099003|6133799003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	LKRxDmIxRrrH4nOQ4K5cDWNITxSkyczDYjUY4S3Ab4ppbnFkpQYZufwjT8yDRWg2cgDq+/UZo1kCwkxQLH1wrK6L/NzR228D0TP8txDrtKgGFwpigTXqWKq1F57hCiP+iy9VTejMyrFnNLr0ibkoe/DitWaqWzXMXbIuPWi4Vpwl6F3obinUZetVyJNs6296CT3v4eXFxXZE91j7d1A2CzEADYFaaec7VRxzoaISVABrJa6N2WPrTBNfRKpBrhHrNOB9PslNALnk1CPLFUrgzeJG3v++caadYif+6nqptqCN5R02OrSoheszgXMpEhJb8cQHtu8NX1/sHId7Y4WZchCIcEnVm/GJBGgSWyvwKcyFjAOg2YNNv1ByEyPYtvfXIMy6KnHR9Ia1wVvjGQUFPqAkfO1XQCToBxmYFberKRfPVSnNHlqHMcuRgBVwKuy+Ww1P+kD0wKXs0kg5jhRXiCFgo/gKyWK7f4fLYXcLYcG9JhgLpCoC3oYy8+5qLsHdAXnuH57I4ytDJV0+S3HxxwLXeMkIZ+yIrRrq8lS7cTIuv3cK5KoJX8SF1Z8F/Mxrt1bAoMvDlGq+79iB6rXwh8CsVNayTEwY0ojTQ4BdiyhW5qVr2UKYobTceU/5DSX2nvVKntB/RyobMi9SEOpAwaxKkKU3YlM/0agYB2FTERVODisIDWN+bo4faDuZkVxNDw1sK9HrR+15Ol8esLzxmODhujXhB8U6EERIMG75mVrItARSp0jZGyiYn2nN3fec
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(1800799024)(23010399003)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NudVjVTM1gov8r3kkOr0wL4ZFw9ghSwcDfpvSlWYVjvzenlorCtvS/67ydzX/9Lz8GChNlCLsF1ImW+yCtby6EuP6Y8WkkPODERII0RowS63aaQnvWKp2HDEXsKtORJw78/ZKuT18iPrpSrDbY29y2RsRoRVUYcEaktyo5jIRzv2s0FCf0nEjTtpTMbGGexMTVoGByFUQ1Lh6/YCL6gXuYculTDu/lSJQsiUoT35+TeoRoBBnDvmVbFLZHSd19y1O/fzgzUeD0aU98n0Ie9Q2BlQooqF2lt959zMa6Sr/6gJASCFfPXABN+INWGZl0VKJT73Wc4pgwxm8v0KxTZzftZLbP6qSKpjiZvajanb8w4Sk7ZmAYwA9oKggB91QhKm1cU6wHLptHMPCz8noqT/4qkNEkgAAnGSz2ShNVASubAIHRje2XsHkaNkc+20WGGH
X-Exchange-RoutingPolicyChecked:
	cWw+SE3Te3wmj5tPna0Uj+YIpe8bCROmEqwjaBwAazPin5CrPz2Ga/5SvmQA1ZH/uxuE+xCxhzeWT/5dhkxKHSfMivSHKPrnNcIrtluwkU8vOuq1r1hJQaMepovuwmPkPb7KFyuHIgQcygQffAuffnbJGjbDrJSLfTjv7IOm8mmvMKwCHeOQesMDclr8udA7q9fz8rEl5qXk8Owb13EU5nRoT6dYd2OqyVdDOEKdaX+iotHiVG63xEUCAdwEnod+no69kCwmpNiiF1ZQlWymS08i6Or6/BpCZhvnbjP8ynEsoHpmlg/JKc6Nzg7IRBbf/rbVolXBZSiWpEnjDiDcbQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 10:22:33.5480
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbbcc40e-98d2-4742-b3ab-08dee96d79c3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6195.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR10MB997870
X-Proofpoint-GUID: s4k2U-yivzx1LkVx4N8BX8HMGRx-zLSw
X-Proofpoint-ORIG-GUID: s4k2U-yivzx1LkVx4N8BX8HMGRx-zLSw
X-Authority-Analysis: v=2.4 cv=dLWWXuZb c=1 sm=1 tr=0 ts=6a633cef cx=c_pps
 a=V+mzYH1ZSfwt9Wwm8MCB5w==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=JJJAxwKGgbaLG8uOhDEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfX83aulAvGWdzV
 /gspAsZkT9HTwAGo0cVUxSy6jMf7IVme+5FenpBhlEHIyclE8HErr4cUTiDKz3x0lmPuEsWHHpK
 F03DcSabkkMgKydtACM/u4A7Jz10XmxkzRc7DHlz8Xx9ecxALCc0VtLz2rDgBz8/ju+PPJF4cMB
 CPZwL/cXEFSFPEFwoy37VOcYfzhq/mAhB6876ORp1aRyDWFAHDw+T84APxZ/w5Gk8ng1HlNZ5zb
 GF08pAx0Nkn4WFJdocgTnSsauafnVYtxe3fw6fPWUHDYLN5ilMeYzYreTfuj/DTbLNuPH1EjY0v
 B0sU5BFHa2zxZxZBrR6FOHG3Drc8WA+SYuU7tmGBbkteLGUGTYnVa4BLLtNk+2dRw1TAjh+CIcW
 n41zBQEs1DmWLFNuGnEOwr1Ze3IswhLVgfKQxL39TFTTfILMp40Q3ZJe8Gg/xXMGi1VVCJDsEIx
 igWDUgtIz4jdkssSqCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfX513n2ziGQiV/
 7VXDvBpJxSuWb+C553BX7RP51uB9ZWVHFXIMQXAHNzocpysKz8yzMGYdzJOMaVwye9mAg1rAEQ8
 eqM7dvr/arT17fKjU6iTSCDAEG9gv+M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240094

Handle absence of tisci with direct register writes. This will support
platforms that do not have tisci firmware like AM62L.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/soc/ti/k3-ringacc.c       | 188 ++++++++++++++++++++++++++----
 include/linux/soc/ti/k3-ringacc.h |  17 +++
 2 files changed, 181 insertions(+), 24 deletions(-)

diff --git a/drivers/soc/ti/k3-ringacc.c b/drivers/soc/ti/k3-ringacc.c
index 5966db4327b13..e81d19a9ed324 100644
--- a/drivers/soc/ti/k3-ringacc.c
+++ b/drivers/soc/ti/k3-ringacc.c
@@ -46,6 +46,53 @@ struct k3_ring_rt_regs {
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
@@ -139,6 +186,8 @@ struct k3_ring_state {
  * struct k3_ring - RA Ring descriptor
  *
  * @rt: Ring control/status registers
+ * @cfg: Ring config registers
+ * @intr: Ring interrupt registers
  * @fifos: Ring queues registers
  * @proxy: Ring Proxy Datapath registers
  * @ring_mem_dma: Ring buffer dma address
@@ -158,6 +207,8 @@ struct k3_ring_state {
  */
 struct k3_ring {
 	struct k3_ring_rt_regs __iomem *rt;
+	struct k3_ring_cfg_regs __iomem *cfg;
+	struct k3_ring_intr_regs __iomem *intr;
 	struct k3_ring_fifo_regs __iomem *fifos;
 	struct k3_ringacc_proxy_target_regs  __iomem *proxy;
 	dma_addr_t	ring_mem_dma;
@@ -467,15 +518,31 @@ static void k3_ringacc_ring_reset_sci(struct k3_ring *ring)
 	struct k3_ringacc *ringacc = ring->parent;
 	int ret;
 
-	ring_cfg.nav_id = ringacc->tisci_dev_id;
-	ring_cfg.index = ring->ring_id;
-	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_COUNT_VALID;
-	ring_cfg.count = ring->size;
+	if (!ringacc->tisci) {
+		u32 reg;
 
-	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
-	if (ret)
-		dev_err(ringacc->dev, "TISCI reset ring fail (%d) ring_idx %d\n",
-			ret, ring->ring_id);
+		if (!ring->cfg)
+			return;
+
+		reg = readl(&ring->cfg->size);
+		reg &= ~K3_DMARING_CFG_SIZE_MASK;
+		writel(reg, &ring->cfg->size);
+
+		/* Ensure the register clear operation completes before writing new value */
+		wmb();
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
@@ -501,10 +568,25 @@ static void k3_ringacc_ring_reconfig_qmode_sci(struct k3_ring *ring,
 	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_MODE_VALID;
 	ring_cfg.mode = mode;
 
-	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
-	if (ret)
-		dev_err(ringacc->dev, "TISCI reconf qmode fail (%d) ring_idx %d\n",
-			ret, ring->ring_id);
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
+	} else {
+		ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
+		if (ret)
+			dev_err(ringacc->dev, "TISCI reconf qmode fail (%d) ring_idx %d\n",
+				ret, ring->ring_id);
+	}
 }
 
 void k3_ringacc_ring_reset_dma(struct k3_ring *ring, u32 occ)
@@ -576,10 +658,25 @@ static void k3_ringacc_ring_free_sci(struct k3_ring *ring)
 	ring_cfg.index = ring->ring_id;
 	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_ALL_NO_ORDER;
 
-	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
-	if (ret)
-		dev_err(ringacc->dev, "TISCI ring free fail (%d) ring_idx %d\n",
-			ret, ring->ring_id);
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
+	} else {
+		ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
+		if (ret)
+			dev_err(ringacc->dev, "TISCI ring free fail (%d) ring_idx %d\n",
+				ret, ring->ring_id);
+	}
 }
 
 int k3_ringacc_ring_free(struct k3_ring *ring)
@@ -670,15 +767,30 @@ int k3_ringacc_get_ring_irq_num(struct k3_ring *ring)
 }
 EXPORT_SYMBOL_GPL(k3_ringacc_get_ring_irq_num);
 
+u32 k3_ringacc_ring_get_irq_status(struct k3_ring *ring)
+{
+	struct k3_ringacc *ringacc = ring->parent;
+	struct k3_ring *ring2 = &ringacc->rings[ring->ring_id];
+
+	return readl(&ring2->intr->status);
+}
+EXPORT_SYMBOL_GPL(k3_ringacc_ring_get_irq_status);
+
+void k3_ringacc_ring_clear_irq(struct k3_ring *ring)
+{
+	struct k3_ringacc *ringacc = ring->parent;
+	struct k3_ring *ring2 = &ringacc->rings[ring->ring_id];
+
+	writel(0xFF, &ring2->intr->status);
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
@@ -689,6 +801,24 @@ static int k3_ringacc_ring_cfg_sci(struct k3_ring *ring)
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
@@ -1347,8 +1477,11 @@ static int k3_ringacc_probe_dt(struct k3_ringacc *ringacc)
 		return PTR_ERR(ringacc->rm_gp_range);
 	}
 
-	return ti_sci_inta_msi_domain_alloc_irqs(ringacc->dev,
-						 ringacc->rm_gp_range);
+	if (IS_ENABLED(CONFIG_TI_K3_UDMA))
+		return ti_sci_inta_msi_domain_alloc_irqs(ringacc->dev,
+			ringacc->rm_gp_range);
+	else
+		return 0;
 }
 
 static const struct k3_ringacc_soc_data k3_ringacc_soc_data_sr1 = {
@@ -1481,9 +1614,12 @@ struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
 
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
@@ -1499,6 +1635,10 @@ struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
 		struct k3_ring *ring = &ringacc->rings[i];
 
 		ring->rt = base_rt + K3_DMARING_RT_REGS_STEP * i;
+		ring->cfg = base_rt + K3_RINGACC_RT_CFG_REGS_OFS +
+			    K3_DMARING_RT_REGS_STEP * i;
+		ring->intr = base_rt + K3_RINGACC_RT_INT_REGS_OFS +
+			     K3_DMARING_RT_REGS_STEP * i;
 		ring->parent = ringacc;
 		ring->ring_id = i;
 		ring->proxy_id = K3_RINGACC_PROXY_NOT_USED;
diff --git a/include/linux/soc/ti/k3-ringacc.h b/include/linux/soc/ti/k3-ringacc.h
index 39b022b925986..9f2d141c988bd 100644
--- a/include/linux/soc/ti/k3-ringacc.h
+++ b/include/linux/soc/ti/k3-ringacc.h
@@ -158,6 +158,22 @@ u32 k3_ringacc_get_ring_id(struct k3_ring *ring);
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
+ * k3_ringacc_ring_clear_irq - Clear all interrupts
+ * @ring: pointer on ring
+ *
+ * Clears all the interrupts on the ring
+ */
+void k3_ringacc_ring_clear_irq(struct k3_ring *ring);
+
 /**
  * k3_ringacc_ring_cfg - ring configure
  * @ring: pointer on ring
@@ -262,6 +278,7 @@ struct k3_ringacc_init_data {
 	const struct ti_sci_handle *tisci;
 	u32 tisci_dev_id;
 	u32 num_rings;
+	void __iomem *base_rt;
 };
 
 struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
-- 
2.54.0

