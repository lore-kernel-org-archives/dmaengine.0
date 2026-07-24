Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D773421230;
	Fri, 24 Jul 2026 10:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888587; cv=fail; b=Gw7jdUX4qp+xsUQYxAoDJZA13/ngJZPK+DcM1nyx6MBLW1Pt3Hppfd6+j/dERLlVbUhTltAruiYf4bUm2DHp5TuMxTcmDAqrF2kaennAon64jLFisZaXQ6q/MFYO2pDhWs1ucSQ9TXjJ2yopzdh6tWRU3kEZ6tUdcGdW7/4S2pI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888587; c=relaxed/simple;
	bh=Vai8vedctXv59NdXoI1kAZRUddHT3EvmOTlnmUUgfJo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OsN1zAGXgRjZn4EuvMFUdQx4m1ZOZc7ZdR1KKB346nle3x5QvcOUmMjNi5QlZTcntytLuXK0RWB8HwYDDSU7iqRMUz4zwsTfbaictZVmaAjnwvLGaDAW7UR8B76gbPbljAOQb7nU6WQZY4NmOJMJ/mp3SZw+IVRPKyZwxU+LJjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=aF6hRsac; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=J6cGm+9T; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="aF6hRsac";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="J6cGm+9T"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OAFTU01093779;
	Fri, 24 Jul 2026 05:22:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=rn2ToUShEZ3AkNds0FY/x49iRDmxuNyHoDDmmbF+S
	Zw=; b=aF6hRsac88GMDmWC0HbkgTaoIg1F5sosfBgDMA9qEAgzHPUHOiX3dTA/M
	BXoH/xmvhin0hkWMWmH8vNadkn7FDmFqrvvA9Mt1WHQUnC2qNF1AD7F+fm1rBsmI
	se4HnPWVj44g5xtERMVPkizKVo2umIIW1wcn9HclcC79SYzbLLEp+Eaj+S26ePO0
	b6u03aOpY4k43qT5CZtru7WTZPnwdcPW1Ik7llL/7eDD9I8zR84LcZ4skh2jFYUt
	FGpwYlKqvRaY4dVAT/1KFERpiWA+GxH0x54sCg48qXuad5WTF0IGONL2aS1vBPXr
	u9nPnLwfgLvQNNClzUeCIaASAxdMw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011045.outbound.protection.outlook.com [40.107.208.45])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fkyp7j40c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 05:22:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MMMH6vO8kB8LSsnG9fxM9fLEdDCRqSurPPMf184LXJSChQHbXpuL14NZLaU8om2LROsQlL9eKRhAZzyFSZcaeOzIyAjp61R4E71/QR/LWWlZRW5sg8DiZlxt1OGtFz4fLtDwLiq+/XVTdLl7z0MddUqTjKNP9MDgonUVYtG+9C9yIImUF2LxL1R7GX9n7+4n3n/XupnLecG51erSERL9wH8U1r+JOZHqLW7xCKNCaFgqtAfuhxBL1cSayY8w7BgGRCYkiP88RIGzxrcBsGJt4RSDX49HG+APGYxFjHZEUPrcA8dioFzra/BONU320XFP8K1PVgD8DwPeAubXxrhhRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rn2ToUShEZ3AkNds0FY/x49iRDmxuNyHoDDmmbF+SZw=;
 b=NrquO+MWTEdloL6kFfM/Rm91DJ2vCx5Kn0T2NU+EdpjExtAj9BeDN6QS52DU8bD3mGGhJeJwGuUNc180gdWB53ZMr0kLsO/nNQ+207j/dSmT+JmKvpYjQMWSF7g7BKOPNbeRLuzLRyX7GYGZe3NtjFomneplPE/p0XE9AxJj9l9/50gch5XasuFvhqXwKbHbTpSDQS1IFrOYz8MNHNc1vbceytrHKCrCWybZu01IdODzjM7Gljj+dDtBOP/8ZXd/Lf+3IA/OnXikGwEcgBpRr+AKAxhvEhGUKzFZEsbuA72NBQq4qewCdq1AVV9nGeq6WJ4y7cPu6t2vrq3P9fDbyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rn2ToUShEZ3AkNds0FY/x49iRDmxuNyHoDDmmbF+SZw=;
 b=J6cGm+9T47QC4jylTJ3jznPr0vgYiq2gIy56h+VYGHwO4uxSWyYmAXo5i2Jpud7q/KGqc3T8ElpCOZo82yG75IXY3DZrPjcfN2oasZ4v0fQq4M+tDp9UNKYpNIQzgr2JljH+/hy30PlhVPrGIGNlE71qTMRNoVNXaniA1ULcMJA=
Received: from CH0PR03CA0192.namprd03.prod.outlook.com (2603:10b6:610:e4::17)
 by CH0PR10MB4986.namprd10.prod.outlook.com (2603:10b6:610:c7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Fri, 24 Jul
 2026 10:22:41 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:e4:cafe::30) by CH0PR03CA0192.outlook.office365.com
 (2603:10b6:610:e4::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 10:22:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 10:22:40 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:22:40 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:22:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 24 Jul 2026 05:22:40 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66OALMFT3017088;
	Fri, 24 Jul 2026 05:22:35 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v7 14/19] dt-bindings: dma: ti: Add K3 PKTDMA V2
Date: Fri, 24 Jul 2026 15:50:47 +0530
Message-ID: <20260724102115.2854-15-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|CH0PR10MB4986:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f2ebabe-f303-4454-2ee2-08dee96d7e16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|82310400026|36860700016|1800799024|13003099007|921020|6133799003|56012099006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	XJLmFZ9Xn3IFYG4iRhodt4xVpLJLebEh5w4YcDmQexHjImL7+izX8tpX6eu4UO2869DLp9ehqIO/sowARf3rTDmvqfh5+lnfW7q0vaHIW5WsSN6CYD8mQo7ivn0ijLwJXkzuGr+xHxstGRgDIRPMW7vNdaAdnfSChP4A2NueAGG2WNmukYMDNQjdtfPL5gR7P7a/SvZXA9bDb92XDkSdIcjizzsJWK+L9yaYWxRqT2XlUeUzUK/CXQ1jIDqh0kB+x2p9J9ngL9xJ5LeauhGdzBhpZDDefnsj4HgnFAdphPpx68DsBD+UszqkKLt+Z/DVFMKh/9zSoIYiZ9GY6UTxEdnMmCmM6y0dbHcwb1qLsOFDENJ6MBhOQUZA7+8hcG/tPssrCEKykJJ8Nc5T7gc1S4mMYBUzVW4ZK0/HsO9IVC8QiT2/c7I79Mi4Y7QSyXgsD+VdEJvT54at1yFIekJhmvtpOr/686U4MoXy0dGyqh24yQxgbCfd3xr5tNZuG7yWjLYntMlzCmzhR0h2KnkZrtl40bW56jYGWx6IYRJOZKjeq0hNj1gXVrlTIMKCvROnrMnoAVZwP9lQ1tim8TucSAFMDi5O0glM79YezD+MX4O6d0J14JxYbCinghF8DssVwV7J8BKm+ijuVJYDtwyd6/9mt4H1YFsjlNvAchXzFnA5hEEfP0GwSuMTpAWlG0aXHJMtcqh036VC5AgvROYMDg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(13003099007)(921020)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wfVt5N/xWJHFTSdxbxgDjUfWmVVRqtFR+y07dlvtrpk05+adPXQqyf0EhORxEiwThoqoYMPjC9MaH31UzQMGkhOzO9aK5/6Rdgm29LhsLUkQF5wiMy+G8DlYGJskkbErr689X2Cpg0uWzoazkPIIVFnJBFe4usrRChW3ngGE8aKZUvdz4TC7yKpjQAsWdSqTmXffPgD2mrHC04ThA91QUSr0VpXNa/5XtSSpOIZjXPGzxVnbxARJNWRkUEn+qpcpZ8AwLNv3RhihDt+83mZbMpeH9xcwAlBmNeKH/+0ry5DIDeX+JYz1cm4duQhnt0nSkQSNFjau98kaB7HC1qLlBIf0xQgViEIA6Ou3pj5m299JpgQhsWfhzQJ1rBGCE9hFYPxEd+MxjrDqWFs//G73Qwljdx1NviIidZ7DSIfD+VvnGtOvpScC4QIGkbACpSD1
X-Exchange-RoutingPolicyChecked:
	ncSSNZMtgZzMz3JSZRJQiIEed6A4kXHH/i6Dk4+x/0a2AT4HwMGcmFhXUTaH1KW4ckGxm3eG+ZzOXz1FkZg6Do3rgCFOOQ2SBt5/6pLS40MxnzicSKOki4QRezqxvXchanAwyJbnQDqXBIC8l5v2KPs0DNZxFEFGgA5kIWlqFkw19ix7waaARZqCRWrwY/fmD52NYUGutfhkF5B3htHbL/eYlBiyqSQgpNtZQwRyvM+vY8doRf6Cq8L8jrSv+XwsoCSHZmtZQKG+CpLpublyxOw5lbkVofRo+sjMVGce81VfSZtwkYHUxxzW+zFEroyx3Qcp1hc7gYTRCQGRLO8qmQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 10:22:40.8270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f2ebabe-f303-4454-2ee2-08dee96d7e16
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4986
X-Authority-Analysis: v=2.4 cv=M4p97Sws c=1 sm=1 tr=0 ts=6a633cf5 cx=c_pps
 a=s6FLI2cSFE2dV00WXjZlDQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=gEfo2CItAAAA:8 a=sozttTNsAAAA:8
 a=tgGeiVbHXLEZap8J-VEA:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfX+7JzOVUhg/Jv
 x/O7mTOd/QwwcSNSM0WFwtw4TKBZ8qtxdd0d+Bp5M/8MSviAb5xT12DfsyspgtiyGGjyPwfaHGY
 giSy+ma9xQnbNwe+KZWhs4Rqm4Xb5nI=
X-Proofpoint-ORIG-GUID: o-_hOmQhH8jUmXJsmXurtLTe6JNE6ShC
X-Proofpoint-GUID: o-_hOmQhH8jUmXJsmXurtLTe6JNE6ShC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfX6b/WWXwOlLXt
 QU4z9Ol1TpmdhTURxtHTo754CPR+N6KbrvE8PkvuQBqAZP4HxR/5pmvDvi1jaf7wYYNPI0x9ymJ
 8rAMkSeQcm+NHPlfWsdUTiY67Zgrfm1cHgmQLIqxrHqG8/z7y53LxE18NJZwi49223qK2FaHl0L
 XV1QsUaVyHlZsE/wRFMtcONbIDkrmRQJswumnI6xG7a/XX0wrGndMUNdtIboJOlO9ujjkwLkcSR
 gKpJbkq3/ENGwLhagkJNNzR9QCg71R8hP152O+OPO1IEhcLQ5o4mFc70em700OJ9KZ+jMD+ZZAq
 6WjGLdQbQlNyVPdQ2VKH0+67HLBQqtavWyeFy7kPnZnYtlW+3DsDweEoAqip/+Y/SgYlJXFk9zc
 nwFd+T4mmSa9p28Q9EPMBKqWtYLqQHw2c+mJAyDxkO61YjFqgF4IGWCN1F5nYzFWWZ/3wsjnVOz
 0/HuGPOyjtp5Afk+Cgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240094

New binding document for Texas Instruments K3 Packet DMA (PKTDMA) V2.

PKTDMA V2 is introduced as part of AM62L.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 .../bindings/dma/ti/ti,am62l-dmss-pktdma.yaml | 191 ++++++++++++++++++
 1 file changed, 191 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml

diff --git a/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml
new file mode 100644
index 0000000000000..7173041708369
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml
@@ -0,0 +1,191 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2026 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/ti/ti,am62l-dmss-pktdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments K3 DMSS PKTDMA V2
+
+maintainers:
+  - Sai Sree Kartheek Adivi <s-adivi@ti.com>
+
+description:
+  The PKTDMA V2 is intended to perform similar functions as the packet mode
+  channels of K3 UDMA-P. PKTDMA V2 only includes Split channels to service
+  PSI-L based peripherals.
+
+  The peripherals can be PSI-L native or legacy, non PSI-L native peripherals
+  with PDMAs. PDMA is tasked to act as a bridge between the PSI-L fabric and the
+  legacy peripheral.
+
+allOf:
+  - $ref: /schemas/dma/dma-controller.yaml#
+
+properties:
+  compatible:
+    const: ti,am62l-dmss-pktdma
+
+  reg:
+    items:
+      - description: Packet DMA Control & Status
+      - description: Channel Realtime
+      - description: Ring Realtime
+
+  reg-names:
+    items:
+      - const: gcfg
+      - const: chanrt
+      - const: ringrt
+
+  "#dma-cells":
+    const: 2
+    description: |
+      cell 1: Flow ID for the peripheral
+        This is the hardware flow index assigned to the peripheral. TX flows
+        use even indices and RX flows use odd indices in an interleaved
+        manner. For XYMF peripherals (SPI, CRC32) each chip-select/FIFO has
+        a distinct flow ID; use the flow ID for the specific direction and
+        chip-select being requested.
+
+        Please refer to the device documentation for the flow map.
+
+      cell 2: ASEL value for the channel
+
+  interrupts:
+    minItems: 78
+    maxItems: 78
+    description:
+      Interrupts for DMA channels.
+
+  interrupt-names:
+    minItems: 78
+    maxItems: 78
+    items:
+      pattern: "^(t|r)flow([0-9]|1[0-3]|1[6-9]|2[0-9]|3[0-9]|4[0-7]|6[4-9]|7[0-9]|9[6-9]|10[0-9]|11[01])$"
+    description:
+      The name of the interrupt corresponding to the DMA flow.
+      TX flows use the "tflow" prefix, RX flows use the "rflow" prefix.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#dma-cells"
+  - interrupts
+  - interrupt-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    dma-controller@485c0000 {
+        compatible = "ti,am62l-dmss-pktdma";
+        reg = <0x485c0000 0x4000>,
+              <0x48900000 0x80000>,
+              <0x47200000 0x100000>;
+        reg-names = "gcfg", "chanrt", "ringrt";
+
+        #dma-cells = <2>;
+
+        interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 501 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 502 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 504 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 505 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 510 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 511 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 512 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 484 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 485 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 487 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 490 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 492 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 493 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 497 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 499 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "rflow0", "tflow1", "rflow2", "tflow3", "rflow4",
+                          "tflow5", "rflow6", "tflow7", "rflow8", "tflow9",
+                          "rflow10", "tflow11", "rflow12", "tflow13",
+                          "rflow16", "tflow17", "rflow18", "tflow19",
+                          "rflow20", "tflow21", "rflow22", "tflow23",
+                          "rflow24", "tflow25", "rflow26", "tflow27",
+                          "rflow28", "tflow29", "rflow30", "tflow31",
+                          "rflow32", "tflow33", "rflow34", "tflow35",
+                          "rflow36", "tflow37", "rflow38", "tflow39",
+                          "rflow40", "tflow41", "rflow42", "tflow43",
+                          "rflow44", "tflow45", "rflow46", "tflow47",
+                          "tflow64", "tflow65", "tflow66", "tflow67",
+                          "tflow68", "tflow69", "tflow70", "tflow71",
+                          "tflow72", "tflow73", "tflow74", "tflow75",
+                          "tflow76", "tflow77", "tflow78", "tflow79",
+                          "rflow96", "rflow97", "rflow98", "rflow99",
+                          "rflow100", "rflow101", "rflow102", "rflow103",
+                          "rflow104", "rflow105", "rflow106", "rflow107",
+                          "rflow108", "rflow109", "rflow110", "rflow111";
+    };
-- 
2.54.0

