Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF724A64F4;
	Thu,  1 Oct 2026 08:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844161; cv=fail; b=Bs21BTguOh7/M/HNoBys+GTjq27ffSNk29jYFa/Y7xmiF2SUFRz60mcpsvU+32frMVaczBrzjlpAGJCvh6FoStktV1prr69xKwUsDWueIx+yzVhxeUuHySiVFcJTXtPSTZIjm/WKYSBIOuUzWnnT7uLf5ZcR1/8NvEzYZSOObQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844161; c=relaxed/simple;
	bh=/aiAUN2AZLQdcUQP4xDUgYrQtUCcJ5CI+6rZuEpQepE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ELRGHUsCpU2dxFFq4Ybo62iuk4r+TDUncxy4aZAoTD6E22/tkX9hvJ0k72ZDvmGYpaxfJiPrxphSWyDkVxsbRWvO4Re5vCCY5BzSOSf7Ze/yn2iED069+Af9V+fieWhQWoF9HOD1ELtKcesYDOHkamyAy4ok5ESl2F3XKjHz5Ao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=bU+afGIA; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=pdsgexfP; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="bU+afGIA";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="pdsgexfP"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6918F0hB1712654;
	Thu, 1 Oct 2026 03:42:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=JDi4FyA3Y+TWDA2m/JX+PEDsnRLRFhmw/teJzYU+O
	hk=; b=bU+afGIAxVRkLLOVkuTxnxmPufCUknIYkcJguKLLNuPZ6/7nKVphJW6Io
	gCzgZjY6lXybUb929yrAZ6Ye+rLy4+ix2x0sK7IsZgYW4eWpLzxijQGwnqTjWPmT
	2Ckgxmg+JNbF9BC1T30rjz0QWfSbyy3y5DuquGMKitXHhSsxAqEjSiY7MN56BTr1
	s+jFxF5+4XGVj9GHgFsWubUY9CpxgBDeyyuh5z8UKLqsANwuvBMypHfTV92P/PuH
	1yhTiuRgyv8Oxgua4sRZ1TM8zqR8Wze5k7ZB8BURMftU4aEzKgk1b2cbGUoItkHV
	TmwkH9TPz1XLCmtK9Hk6VLfM+oZLg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011059.outbound.protection.outlook.com [52.101.57.59])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h1kufr429-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 03:42:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QezXumYORN0jNzbzk2mYTNC/vVESPEgQ4gDpYRMnHYD22e8FmtRbCQiKOWAG1kuNcg4F6Fwm9c2E7GMgpHROhl+dtmTU3PvcxqKLZdKy5cgUUBNiSwNpmJH8Aee/pqXrXHEOZYWDjSXfiAzZxDOItQbTPmRfLacaq0ovGhnT4KjTwhQxUf1OxhKX1ME8CGKKHd43cxCDLa6WnWXY+sT0cfY4Kb8jpon3XUanX6bwULzOijbB1EhfhQooL5zLxUqKy93pKJwUtdusfUjq6FE9UIYQvmRIN3RNyKcn3awBT/pcui4WDOzr9EVNGuocDv/72bCGz82ZkOzp9Qa+m2gZww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDi4FyA3Y+TWDA2m/JX+PEDsnRLRFhmw/teJzYU+Ohk=;
 b=tMLKr+7X7wxa4G0Q2nUqbKdy2+Wvjq7vnpqIxaZQPs6lD0Y30LmX4Hu4eKg/VtZ7z7wbPj/RfjzjQrnHr0YB1cyGIdo7Hzuj3AdCWZmUWmV7v2rY5xUAcgz8SEuBIpXwKkHWe1l6oA3/L2VL4o3WSNd8lKnOFAvkLSKyiTxaDLPVu5XQ/oWQ9AKPE8NTSNndfmFgXOABOO9JTbx6sE96QayiZLCSn8N0SJ10cAEmodIHmYckqSQ7ziXpB2eIe5uG3eYm2XEeXLW9DVpulV85atHiI/DyPDqphf4xrDPKDV9sqhBj/p7VUGXHExZxg9GTqfOVb9YBDJV1V5TWU6vTCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDi4FyA3Y+TWDA2m/JX+PEDsnRLRFhmw/teJzYU+Ohk=;
 b=pdsgexfPXxHRgUYJ88o+O5lrpUP5uwUOVVISD++4G7fqkCcdiBjVT0LlKYgFrRkynbcsKC7ZAp9NGZCdkrhmN1CxNTQpl/LPzkIdp4fyb57nCQVW9CgSbUP7+TlHiGPSCE4BZMSxFzIdTtRgQW3lzxyl5f3l88j2P7YSK2Ofw44=
Received: from CH0PR03CA0302.namprd03.prod.outlook.com (2603:10b6:610:118::24)
 by CH2PR10MB4133.namprd10.prod.outlook.com (2603:10b6:610:a6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.9; Thu, 1 Oct 2026
 08:42:15 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::3d) by CH0PR03CA0302.outlook.office365.com
 (2603:10b6:610:118::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Thu, 1
 Oct 2026 08:42:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 08:42:14 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:41:42 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:41:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 1 Oct 2026 03:41:42 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6918f9rv630551;
	Thu, 1 Oct 2026 03:41:37 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v11 06/19] dmaengine: ti: k3-udma: move ring management functions to k3-udma-common.c
Date: Thu, 1 Oct 2026 14:10:22 +0530
Message-ID: <20261001084105.1692228-7-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|CH2PR10MB4133:EE_
X-MS-Office365-Filtering-Correlation-Id: bd438a92-48d3-44ee-1db6-08df1f97e4b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|36860700016|82310400026|10067099003|3023799007|6133799003|56012099006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	WkAu1bEyGkdrjffUdF+ctXR/iysIC7n7HqPBqxHHuvz/bqX0LwBVZRDzBJgSZC7f2FEvl/C4Cag42+FLiWz605BUhOGViea8HGL0HgBr7kTQDcZ4xLXA0gXMoHJ9PWjrznMTpZFn8G8uiQAAaNuLg/OVf5kaakcPCeUprw/JXzgBsIfmgiOzhWVKT+VjHye+TKT3su32wjPueUv+cgs00dCp6EHfE04mbVmW2XvcTUjY5hLDO1THbRCnAG/yflkEogjCaKlwzlO454CdXcA+w1TRrYyj4IsLRExF4cMs1a2P47U6hM0G4mCDje8Es+OalyJ8abLzLaNKfd5qPENH38m0B4GG4RA2rrBLeZ8TjpZ5Uvs3xyHUhN7/hWePd/NB7bmXGl2fbn8jxB25KDrZQep9W7Wk50D1eo68AQGPHtqz/F6miSvHgUWfcIsEL/dcjJo/VqHju41CnbYqGAzIV2HUbAQ+LvMn74uwQ3kCBd8nm4zVFLsnGpLHvrbqiWDSp9p2luiCQ0HLUJkNVwdEw0MfKrcNhH+L9GKUeTVbq7UORxQWmSettBhQB5PUczAPVf5jUkg+/v1k5m95hUXXLhPzxy4K5KkpdbD/8LuB1fuwtbhNgewcjYSiunHg7q0spE963l+RU74M/Il5Bhd35m1KLT+nmGoyV2PLWgQdog46Hj1LXGu58rjwWBlI6z5bgvOnvIwhYdqzzed87ESc5q/yTQTxNmTeegZ+NYHyGuYJ0c95ZriRYwzMse7Bs2UI
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(36860700016)(82310400026)(10067099003)(3023799007)(6133799003)(56012099006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wdz4NuLvp47qvzWODRa8eZPX9YJqMsE+iJdbQ+eKkK1qT/wPzG+y/TG+P2a3FwP3c7knFj2R47C2sBSzkiiV317vzNvt2nQjKETAWzz45nk3bV1eGZzneavY+YcKqzslV3UQV5HDtlg0bCF2wSz+0QopH7jcxOewCzo8+cGg3edlY17e71CVbe5OIl4MQp4nwuY9YVMlzhuk9KcNIliO6JhLWu08VJzT3xeSLB2Xi+gt4e3dh1LdlZeqKDq8GVM/Kt6o9X+o/zAiLiMgtfLBRrHeV1uu32kxM/jPa0IuhGh+CJMuy/ycOU4bBbKU5u3lTfAyBosbsQJTOP6ayL5vvtZ3f12IjR8e3fRqIE8FvDPe90Um9kSYq3ONKR0rREu/yJDklI7j8G1DHAMYtx9aEtUJuWmJOgGkXMyILMI2pKiWojb0ljKVuGdvmPwfb+dC
X-Exchange-RoutingPolicyChecked:
	ndzYe2/lcBz9kFpsad4f4EfHXLggNP7dXvfejX8WmjUSiwK+7p+QLmlpqd9JpN2nKWej2ytCAadhNBlMRqR3i+5QGGhHoNc2VHv9yAVWB8jWdasyj1Fuw0XH8GUXuEq5RvQpKAA4lcQrPLViaUII+dbp/BZu/fu7Kkdm5CQdLprTsEz2xRauktz5dutXUf9p6vXPUWVXHjWLoLSj6ZbXqOyJJ0Db2GQC+Ng706WhO10hNQUIeuCZdlQFFIoifLqw9itc0jBx+XSL82SGiQrNQFQT2g8wcMj79sv/pcpYMmMnYuyG0zv29ZK+3B/pV4tbcmPZMoHyY9w61O2TqKZomA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 08:42:14.6557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd438a92-48d3-44ee-1db6-08df1f97e4b4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4133
X-Proofpoint-ORIG-GUID: OihvjhDUKSF8ngJ90WDzzpKynsqLPhe5
X-Authority-Analysis: v=2.4 cv=I+Lw19gg c=1 sm=1 tr=0 ts=6abe1ceb cx=c_pps
 a=J5CYyyHZZtesdUd/yj239g==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=8AirrxEcAAAA:8 a=sozttTNsAAAA:8 a=bS-Ji3T8UFNk2xfqAFIA:9
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: OihvjhDUKSF8ngJ90WDzzpKynsqLPhe5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX4OOrN76IV5gd
 7VuWztSDC8tJe1DIqBGdatDlSYfEHYmEV7daqenOXXnURBosJ017WttX/fxgtbzzpVVmit1mqdU
 p6QFXXP/C80MHSCCxg12mLR8XRAmim+S5SFlsey7olRXL4AgxsaWW+HIFKgbfqdhE3fRYzklNo1
 uBEYDzXaObtBNMGUXg5VgTGPMsXKpEzBNO2p00fvSppBBp2pGA8CH7eERETUZO9R0reDMIaDAJP
 Ws5TVwiwk/PzwbtmygIxWW3Ddo5FlY+g65rTyKe1kil2Ypj3QctknqNflNdYpYBMJ1e7t6GEYmn
 jo+psxEQM7lWg72/PS4PXImnS4mccnFJszk3gAqTLyi/h9zEbwL3lH6YeQ7GmBopmqYiM0k20Eg
 Vmmd13TOXznJIq3E5Na/iAfKoTKUnpRtM8JMA5cMGhFE+RnD2KN7wX8vjOw419TUmvzRv5EaxQG
 UIF6kDNXMw+cszZfSgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX/fMS4Lpm8xW5
 T9dmFJ0rozWH7pcW0T7mfPrtL846R7d2r211iFIsqSJCuJBWMNlIL1YQm4dFaRIPVkrI648ftNL
 7UsSmy836c5QU/mpQr4H26apq/f9eK0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010034

Relocate the ring management functions such as push, pop, and reset
from k3-udma.c to k3-udma-common.c file. These operations are
common across multiple K3 UDMA variants and will be reused by
future implementations like K3 UDMA v2.

No functional changes intended.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 119 ++++++++++++++++++++++++++++++--
 drivers/dma/ti/k3-udma.c        | 100 ---------------------------
 drivers/dma/ti/k3-udma.h        |  11 ++-
 3 files changed, 118 insertions(+), 112 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index 9b7ae758bdc90..4961f4d3d1496 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -12,6 +12,13 @@
 
 #include "k3-udma.h"
 
+static int udma_attach_metadata(struct dma_async_tx_descriptor *desc,
+				 void *data, size_t len);
+static void *udma_get_metadata_ptr(struct dma_async_tx_descriptor *desc,
+				    size_t *payload_len, size_t *max_len);
+static int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
+				  size_t payload_len);
+
 static const struct dma_descriptor_metadata_ops metadata_ops = {
 	.attach = udma_attach_metadata,
 	.get_ptr = udma_get_metadata_ptr,
@@ -120,7 +127,7 @@ void udma_desc_free(struct virt_dma_desc *vd)
 }
 EXPORT_SYMBOL_GPL(udma_desc_free);
 
-bool udma_desc_is_rx_flush(struct udma_chan *uc, dma_addr_t addr)
+static bool udma_desc_is_rx_flush(struct udma_chan *uc, dma_addr_t addr)
 {
 	if (uc->config.dir != DMA_DEV_TO_MEM)
 		return false;
@@ -130,7 +137,6 @@ bool udma_desc_is_rx_flush(struct udma_chan *uc, dma_addr_t addr)
 
 	return false;
 }
-EXPORT_SYMBOL_GPL(udma_desc_is_rx_flush);
 
 bool udma_is_desc_really_done(struct udma_chan *uc, struct udma_desc *d)
 {
@@ -722,7 +728,7 @@ udma_prep_slave_sg_pkt(struct udma_chan *uc, struct scatterlist *sgl,
 	return d;
 }
 
-int udma_attach_metadata(struct dma_async_tx_descriptor *desc,
+static int udma_attach_metadata(struct dma_async_tx_descriptor *desc,
 			 void *data, size_t len)
 {
 	struct udma_desc *d = to_udma_desc(desc);
@@ -758,7 +764,7 @@ int udma_attach_metadata(struct dma_async_tx_descriptor *desc,
 	return 0;
 }
 
-void *udma_get_metadata_ptr(struct dma_async_tx_descriptor *desc,
+static void *udma_get_metadata_ptr(struct dma_async_tx_descriptor *desc,
 			    size_t *payload_len, size_t *max_len)
 {
 	struct udma_desc *d = to_udma_desc(desc);
@@ -779,7 +785,7 @@ void *udma_get_metadata_ptr(struct dma_async_tx_descriptor *desc,
 	return h_desc->epib;
 }
 
-int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
+static int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
 			  size_t payload_len)
 {
 	struct udma_desc *d = to_udma_desc(desc);
@@ -1239,5 +1245,108 @@ void udma_desc_pre_callback(struct virt_dma_chan *vc,
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
index a8fe919f307f6..6a731fcfc0697 100644
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
index 38a54226836a5..1777f0e1f085e 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -566,14 +566,7 @@ struct udma_desc *udma_udma_desc_from_paddr(struct udma_chan *uc,
 					    dma_addr_t paddr);
 void udma_purge_desc_work(struct work_struct *work);
 void udma_desc_free(struct virt_dma_desc *vd);
-bool udma_desc_is_rx_flush(struct udma_chan *uc, dma_addr_t addr);
 bool udma_is_desc_really_done(struct udma_chan *uc, struct udma_desc *d);
-int udma_attach_metadata(struct dma_async_tx_descriptor *desc,
-			 void *data, size_t len);
-void *udma_get_metadata_ptr(struct dma_async_tx_descriptor *desc,
-			    size_t *payload_len, size_t *max_len);
-int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
-			  size_t payload_len);
 struct dma_async_tx_descriptor *udma_prep_slave_sg(struct dma_chan *chan,
 						   struct scatterlist *sgl, unsigned int sglen,
 						   enum dma_transfer_direction dir,
@@ -589,6 +582,10 @@ void udma_desc_pre_callback(struct virt_dma_chan *vc,
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
2.55.0

