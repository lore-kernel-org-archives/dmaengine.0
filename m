Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2114F30EC;
	Tue, 22 Sep 2026 06:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059899; cv=fail; b=YZlpbfLmGRTbRLM/K1N+BC1Fbo2IwxzPQaf+yeL78Ns+ovQRIPhFsAnmXolG5Tf7DP/5Km/JNe5D2rwmNnYRgvFKekhkfVbc2HiciUs6NEE1CJ8m330qf4itX6o+kat1nwNDtK3DuDMakOH0vi8DXDT0psQls4HuZT1vJPMNJq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059899; c=relaxed/simple;
	bh=ohB6AyPL1yGPs/XQrk1PoSqa8tTfeiAf7nsFDQnY7WU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mvVFidlUTtlTUvVNnLc9grW8Ky0NEStqXCSZ7V+UxGb2Na2KKMBAZqKveMUYOliT8fGW1uy+1ytmAMa42ShXuVrKJ7r82R/rQH/MrVFj/7tWfp/ur9LLWfd21FkF00enmg9uli9DxI6pj3LbVh/4d94SpW8Wgi5iPh7BkrQ0vKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=jeFg629t; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ffuzFvFg; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="jeFg629t";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ffuzFvFg"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68M5BSfO2149820;
	Tue, 22 Sep 2026 01:51:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=sOa2U5ZSaBR2ea/MCYm95KDZuvR6EJKU/8kMxBPtU
	yI=; b=jeFg629tkLoJ8cpYf9lgGue40twa+oKWaYkwQNjs2FVHcFPxnmLzEzfJ6
	8K8PhX0Z7D62l53Aq/N3G7KgK/59mAt/RLaovvVxDlxSx4ROalxChvGOJBuhlKGA
	A12XKgQcighghZa54uiyJQ9A5la+A8jCKeGC4R1corS3KizAdXcy6ye5yjhvVz2v
	V8nI3mkSOTUggj1qfvE437CRTPiAyvKm+VnF6RL9KG4ti9PJIlsEJenklelfhVio
	iRzMu+Y8ES7owZpIFc8JmKdBS2dg49VxNLu0Vt0TLiDFSme21m8kEZenbBSlvNs6
	xxUIpiW8OCGbHtTVT7G40+9g+6FSA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010070.outbound.protection.outlook.com [52.101.201.70])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gu9cq429j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 01:51:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oanfMRWZr5m9ew4nuFfU2JsYK85ko88J2S7uDqxk+LckQm7RCoKjcmuvn+xXzrtUx35gONkMp11VoJCciWPxJgoDYXnuVGQvkfrIEXSsfuDcYDz86Ag9B3wH/+Bx1mMmdX3V4p9LJyYE9gSllaOybkV/3ZonNvKeJtErTMjwhJiXHE1Gh/sr6h6qjPKdL1Yuad7bgVelXZNc6qx4FmJ7y1aZZOB1EFtCyFFZ+wSFoaQYuqVTntXJ8pr7dxh5NScjCOs6JFJ13FDGMo46Nk/9qGiybPr3L+cM8OwLq5Y0llz0r48j0I7adl5qBQL4wbzrkvZInY7CnIpV4HQp8psDyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOa2U5ZSaBR2ea/MCYm95KDZuvR6EJKU/8kMxBPtUyI=;
 b=Ea+pHyzZIbc2OACRpraaVfjJpk/fkwGXYkF3Gohlax1QGz+Tk0KhgdLF/G3jgFfBgrlVMSCv+uuErhyIRXCPYvokgPVMNZIZs5PaogRzRQvVia/sOzb0FY4PEioQaj90ouSvYLNFYnpZfM7aWB9sDchNIkqUZWbLkZHtv4TEfTAdMWH+0ruIG1MzAwKPyImGpymFo/GflMVorCP+UzvAs5Z8DVNyWEQEdMGjaHJm3n9pTwcv/+QNujefILvzDfZSebbuA31Y+Qm+02AblNVjbhXTAT3ddnEhdRerRjTqwGrLJozuUpXPghIjfTeEAPMdLssgZXcCpo79Jzh1R4Mf4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOa2U5ZSaBR2ea/MCYm95KDZuvR6EJKU/8kMxBPtUyI=;
 b=ffuzFvFg9jQ9mmsuPz3AESTMfe8GSjA7rR9NAT2Q7LqgOWT0g3IqV4m1SFhIAgKwq4SQySKs+3ozYbgFdLfw8f4qZYD7BuQ1XSXDMXY5YV/xBZUGKoveYgtLg89VxSIUya1MJbHBt4RwMAAN8UMT3epbb/ZviOS+ZgC2YVFoPMc=
Received: from BN9PR03CA0864.namprd03.prod.outlook.com (2603:10b6:408:13d::29)
 by CY8PR10MB6660.namprd10.prod.outlook.com (2603:10b6:930:52::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 06:51:18 +0000
Received: from BY1PEPF0002695D.namprd05.prod.outlook.com
 (2603:10b6:408:13d:cafe::23) by BN9PR03CA0864.outlook.office365.com
 (2603:10b6:408:13d::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Tue,
 22 Sep 2026 06:51:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF0002695D.mail.protection.outlook.com (10.167.244.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 06:51:15 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:50:27 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:50:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 01:50:27 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68M6nI453626771;
	Tue, 22 Sep 2026 01:50:23 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v9 13/19] dt-bindings: dma: ti: Add K3 BCDMA V2
Date: Tue, 22 Sep 2026 12:17:37 +0530
Message-ID: <20260922064902.2719979-14-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260922064902.2719979-1-s-adivi@ti.com>
References: <20260922064902.2719979-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0002695D:EE_|CY8PR10MB6660:EE_
X-MS-Office365-Filtering-Correlation-Id: e3caaab3-f108-4fc8-1627-08df1875e5e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|376014|82310400026|7416014|13003099007|921020|6133799003|3023799007|56012099006|22082099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	W/f2fQHBuUOyzoxPqyWtOoptOQ+UYJw1S2B1XC0MFyA5qsrAt23rM3PYm32PX9scj1adlHl0hqvQNTkOirIpm+YtnwEPpQEcEfmB88/IAJlY1KgE0U8CpqUWhK0N8xvxD9izcek/MJA6pFORG3FcJD1vVYWpHadVvI+z+syHQzlREksvXCVk2lfKP4xmA9FdO89aneY3zLzZ78CuD+iWucSUGoKqSDYsCn+V08pzVsZCLlIQT5eN56fwld4Aqd5Mke9BWUHR2kHQ0sMRbPS6FCxaADQ50KoTMjCLYCRdTaJpqGpe1/y65lwCcGQZWA5KBz8ooCDvuu38Y4jn5B/Xq3C/Qxlud+hW6oiAEmczZ9y1Wvwqxs1rK2hw5zR8mQs6T6J57i0vITrPDnz8Tb5v067NmK0g0YPtsjh2n4a1diLrD0wd9489CT4YrxH3X+agU3IDxG2FWJmojRpAP70Hn5rSkv6oLhBmVj/KmimMlojN4vkENcUyhyQn9lQSUJ+TyiHBjZSSmaQYRszTwofu0cToBegjB0kYY9nemYqcJKFZaUyKVs+Vce5z+r8z554HASuBZlH0LBtH5BcgKH9MKi7h+hcLpS/s4+WwgM/u4iOO/Zx3nx9mqw1iCvWNkNK6MUUro2Wr4LmTdxy5TN5qmDO0jVTxUmkc7xdcQb4WiRGDhBBd6W7lntHBIAoDmu+wRN11Zyq7EyrQ74z0YHnlMw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(376014)(82310400026)(7416014)(13003099007)(921020)(6133799003)(3023799007)(56012099006)(22082099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3aweATV1LDbO9fE3pvHG+zqoOlDKJ59U5JOb5N00EmTEyyLQzLzSM8y3RqcBieKBaPAYp82vDCK4QB99uTzIJj/WUzHF6ju55lveW3dH8OHUxdVGIH4Z/p+GA4zw7y7X2Jx6bxtKK1mQMonabt+GY046nOUFhH96zUJaO3V+oszoIZsYHKB09DuoYvxPLYyyFzFAuTsgtT6orrGRc+1z17Bl81iNe3zYNAIMkD604cGybsH3pr4xaAQacGqEv4F/7KqBdb8H9pg9fefsaBB13SVQQPjq8WcPZOmPA+zsttL2H2MigI2rZ5l9w2bXsgt/Y9Gz+lmTLm0gd/J0roxt3R0RsqybOMiOlwW3MfwJoVv+ZIqg2nyFlWksdADFe261YxMHAO5B0cZs/Xti1eMc33yCyP+vsVUhilk9zF5rvIpDZJs/V6dQXM1/QPdhYcmG
X-Exchange-RoutingPolicyChecked:
	PGRhVU5NlxVRtwy0MlDkdJPM3QEQ4YfwAMxppvG7p6wsHPgcX2nh+2/BvXDWcuSNxRclvSuLwzHJC+rvoOyVxzwyewfiV9ANG+Z+oiZCttPP6izvNJpEHF5RTETwbIyXD+G1NYc4tqf/uz1LbRk3yWt+MaaYc9G2TAdw6tofVvOPOjSoMQ5HxK0JpShibD8mtPkWHd08SpiOJXfWBmNCdNr4STmwb8Lr0wXRW/cmFOeICaMDcy8OPpJ/ulbI9I0zJy/SovV/pEY6uW6ZdPXF5W+Yu69sVWjUQmjVUHGw7EzIBpQLt4DYjda78pWK0lcD1YKnZgOelAVNfS0UR6+pfA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 06:51:15.6098
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3caaab3-f108-4fc8-1627-08df1875e5e9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0002695D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6660
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA5NyBTYWx0ZWRfX1axtZFqrPd4j
 XQwPqH5P8fZ5+sWvC0OB6U2W+x8VWLa07NEZsGmlBNKcs5CTLGRMrGKTeV7Fkge+a4o04ox1Qts
 yGIj0UW70lEpXv/+X6HfuKh3OhdTmdk=
X-Proofpoint-GUID: 7MolDwmRulPsxtnmBVGKjiHUHyucUi0C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA5NyBTYWx0ZWRfX2eJRB8Q5N6bZ
 N9R9dTS1I1l3MjlWbRpst4UdWQVXIE8IW+gtazRHhNxJZFM1ytdk0fg6xJgrK20XxeDh1jjKFpr
 T78l9Wjzu59j7oUW5BiRJY2aywfhCz/kPA5eo1ZbaqkQtXtiYrzHcVHLScPVeSLAZCksqGu2rE3
 AA9US/F2DqTriQnPxzTpmj7WJnzzLbIPrxuNm7dnBZAv9e5XNe5arthKckUUeV3DyO/jDI2RT7t
 3D25JxMi2GiPr6iQ3VHA9jNYiInVYNqmt/f4cznYjk7wThjzu2qsjJp0od37UVmxHOdBj6YzJTU
 e7xeSESQmX1I71ZC8Iaxa+aoq7m8CFmYE/C5uwi0yXK4xvY0ELAq1VQrYS8Iqasg0N1WGbBGi6p
 Cphvs9CLpiXiiTHb26rKaCfBGiDZ429d0lTN6k+Snpmf7hVmwLkR5IAqUrhI7rf4jZ6vgVc1leE
 2S0RM9yAxlgHUYewRpw==
X-Proofpoint-ORIG-GUID: 7MolDwmRulPsxtnmBVGKjiHUHyucUi0C
X-Authority-Analysis: v=2.4 cv=X+PHu2Te c=1 sm=1 tr=0 ts=6ab2256a cx=c_pps
 a=RGUNHxVObgwraRyadLFC+w==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=gEfo2CItAAAA:8 a=sozttTNsAAAA:8 a=EUspDBNiAAAA:8 a=6W6IBMoaatw3SABbmX8A:9
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220097

New binding document for Texas Instruments K3 Block Copy DMA (BCDMA) V2.

BCDMA V2 is introduced as part of AM62L.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/dma/ti/ti,am62l-dmss-bcdma.yaml  | 211 ++++++++++++++++++
 1 file changed, 211 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml

diff --git a/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
new file mode 100644
index 0000000000000..76184485ebcba
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
@@ -0,0 +1,211 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2026 Texas Instruments Incorporated
+# Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/ti/ti,am62l-dmss-bcdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments K3 DMSS BCDMA V2
+
+maintainers:
+  - Sai Sree Kartheek Adivi <s-adivi@ti.com>
+
+description:
+  The BCDMA V2 is intended to perform similar functions as the TR
+  mode channels of K3 UDMA-P.
+  BCDMA V2 includes block copy channels and Split channels.
+
+  Block copy channels mainly used for memory to memory transfers, but with
+  optional triggers a block copy channel can service peripherals by accessing
+  directly to memory mapped registers or area.
+
+  Split channels can be used to service PSI-L based peripherals.
+  The peripherals can be PSI-L native or legacy, non PSI-L native peripherals
+  with PDMAs. PDMA is tasked to act as a bridge between the PSI-L fabric and the
+  legacy peripheral.
+
+allOf:
+  - $ref: /schemas/dma/dma-controller.yaml#
+
+properties:
+  compatible:
+    const: ti,am62l-dmss-bcdma
+
+  reg:
+    items:
+      - description: BCDMA Control & Status Registers region
+      - description: Block Copy Channel Realtime Registers region
+      - description: Channel Realtime Registers region
+      - description: Ring Realtime Registers region
+
+  reg-names:
+    items:
+      - const: gcfg
+      - const: bchanrt
+      - const: chanrt
+      - const: ringrt
+
+  "#dma-cells":
+    const: 4
+    description: |
+      cell 1: Trigger type for the channel
+        0 - disable / no trigger
+        1 - internal channel event
+        2 - external signal
+        3 - timer manager event
+
+      cell 2: parameter for the trigger:
+        if cell 1 is 0 (disable / no trigger):
+          Unused, ignored
+        if cell 1 is 1 (internal channel event):
+          channel number whose TR event should trigger the current channel.
+        if cell 1 is 2 or 3 (external signal or timer manager event):
+          index of global interfaces that come into the DMA.
+
+          Please refer to the device documentation for global interface indexes.
+
+      cell 3: Channel ID for the peripheral
+        This is the mapped_channel_id assigned to the peripheral in the PSI-L
+        endpoint map. For XYMF peripherals (SPI, CRC32) each chip-select/FIFO
+        has a distinct channel ID; use the channel ID for the specific
+        direction and chip-select being requested. Use 0 for triggered
+        block-copy channels (cell 1 != 0).
+
+        Please refer to the device documentation for the channel map.
+
+      cell 4: ASEL value for the channel
+
+  interrupts:
+    maxItems: 75
+    description:
+      Interrupts for DMA channels.
+
+  interrupt-names:
+    minItems: 75
+    maxItems: 75
+    items:
+      pattern: "^chan([0-9]|1[0-3]|1[6-9]|2[0-9]|3[0-9]|4[0-7]|4[89]|5[0-3]|6[4-8]|8[01]|12[89]|13[0-9]|14[0-3])$"
+    description:
+      The name of the interrupt corresponding to the DMA channel.
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
+    dma-controller@485c4000 {
+        compatible = "ti,am62l-dmss-bcdma";
+        reg = <0x485c4000 0x4000>,
+              <0x48880000 0x10000>,
+              <0x48800000 0x80000>,
+              <0x47000000 0x200000>;
+        reg-names = "gcfg", "bchanrt", "chanrt", "ringrt";
+
+        #dma-cells = <4>;
+
+        interrupts = <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 482 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 482 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 548 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 548 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 516 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 519 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 522 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 523 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 524 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 525 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 526 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 527 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 528 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "chan0", "chan1", "chan2", "chan3", "chan4",
+                          "chan5", "chan6", "chan7", "chan8", "chan9",
+                          "chan10", "chan11", "chan12", "chan13",
+                          "chan16", "chan17", "chan18", "chan19",
+                          "chan20", "chan21", "chan22", "chan23",
+                          "chan24", "chan25", "chan26", "chan27",
+                          "chan28", "chan29", "chan30", "chan31",
+                          "chan32", "chan33", "chan34", "chan35",
+                          "chan36", "chan37", "chan38", "chan39",
+                          "chan40", "chan41", "chan42", "chan43",
+                          "chan44", "chan45", "chan46", "chan47",
+                          "chan48", "chan49", "chan50", "chan51",
+                          "chan52", "chan53", "chan64", "chan65",
+                          "chan66", "chan80", "chan81", "chan67",
+                          "chan68", "chan128", "chan129", "chan130",
+                          "chan131", "chan132", "chan133", "chan134",
+                          "chan135", "chan136", "chan137", "chan138",
+                          "chan139", "chan140", "chan141", "chan142",
+                          "chan143";
+    };
-- 
2.54.0

