Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C623370D5C;
	Mon, 28 Sep 2026 02:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790564341; cv=fail; b=qez3S2YljaZwTMRrJieaKvDyeRmI7Hm8Dv9fJtUi6uHQDIaaUzHbKaiibx4TGA4/8j706+gu0lC2RzAmXsMIgjwz4aNJpNUdJwknVgGLCxBJ7rpG+Ey24MZz90YqSdL/Vh59S5ajV4dPYIcQDMCPmm2P0n/bBjGcGH3hoIqG+zM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790564341; c=relaxed/simple;
	bh=ShSg+QoaLIO4hbZSZgkMejppZjWjSKbs1QKIYiTDSh8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=paAbT6ahnHtUNqfF1g7eXMPqOyFoWELs+PPWnIAMIC6jEa1sOCaA9yvR0IFyNi/ApGFMqOQ9rBuq7hYAD2voSLUdelxh5N6ChrATNkqIQpJR9/n1vAPVTaiX31eSWXZ9viRwH9M5/FNDG4B7YsQX19tPcdMAW6ulo6B7zadpWLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=gvFjLf+T; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vZ0MSFY7; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="gvFjLf+T";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vZ0MSFY7"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RK4U2j2807666;
	Sun, 27 Sep 2026 21:58:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=rCQNGoXps1QncXA4n5E9I2k+f6PXY4YgK3IBMNZjt
	Ug=; b=gvFjLf+TU8Dh2Tx/VLLbX5Cxn3+LXaFxlgegv0O8e1KLoGw9tbg9GscGw
	SEeiSxHylMfYUANbuakKCmv2TemXmvP0L0OpIQgc1Xs19kiUcm9RmM9iHAm/0V9Q
	2EIBCYJDl4MtH8wxNTZ9TCwxKO+Wcz93PaZuNAUByhAMxDUWo1qeT6MMOCTDs9UA
	ipllmV2BMVfPQ59a78WUB04cF/uQxSUAmJI0uSfJoxZSojEUMS1uXFXY1o0w2GeU
	fi1UNzXII0VJWmgkLUfYzIvzqavJzdRXLEruZZf1dOXIO8gMIrn9tNBTD1oBjhkY
	4pin+Lj1s8cGZLTkNutHHxceTqgKQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010002.outbound.protection.outlook.com [52.101.201.2])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gxwe5kfpk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 21:58:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PlFZjRP4j2vlyIE00r8Bn9UwEHrC98oey3yAjjJCYvOh17zy0RR9wUZtVOhhdsIX3I+6pktDp4gZNAB07OxcIzxkyO3cWdVt3AXGhnjna8pZ4wtGMvz5KofuCahclgp3vuSeM7B7WNtTWfX2EesA90tnIyCWXvo7GhxwmkVDHFqKnu3ZCoxXdLhs8mM6hO3gt6CTggICf3OJImtEMPdV1yrOj10RPi4Znjo3vLdqAAnOnWij50BrACYPINqmq4Sk3da4ai3+pJ/99tOC1fpNEz39UG2NYkii2X+aoKRYIZEwsii3MKiEcq7ctNwr97eDRMvAZit5cNiSeS83tfiWxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rCQNGoXps1QncXA4n5E9I2k+f6PXY4YgK3IBMNZjtUg=;
 b=K6kKk32bbP40shhFq9RjqT8I15qsC90HX8rS4HWhnEc2/mYjC02tU+0HJ2LebAENY9pIuLO+kZ5iHh6eX+tlCPCRYIanx5e3Rg7UYFWrDzrbqElm7WFp4XSPd4+Ext/qXFw+FfsOixCKAR8EkgPPNXuC2a6muKm3p7NWj59mGuFaQQZuoWle9dwBlCU2SiFjFLA9w/nYQRd/KqB8FvooIQH3P1p6Q9kpClspBdIQ/kGQ7ZbOxhEZXFOgIk/jZAqkSp0wYaQfIZFJapYm/pLVOBnEzh/5eYaO5LR/nc31Wlp3g3NNTsi1GWCsZWGohL27xg/qRrw+zJ5bFG+T4dR7pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rCQNGoXps1QncXA4n5E9I2k+f6PXY4YgK3IBMNZjtUg=;
 b=vZ0MSFY7fGP7JVWMVryRP5SIBEwhQUQB5pNRUe3eEoUPVpSm3M900g0j0OPTFvRmP/7g5g6kyHAam00dnz7sA53uuJJ/32HeY/ANGhYTN+XTtBdP5AuqHcHkj06QONVviANlBY03gvuBPbXtHzKG11T3mEoQAMe5q/jCG87tJ4Y=
Received: from CH0PR03CA0187.namprd03.prod.outlook.com (2603:10b6:610:e4::12)
 by CY8PR10MB6609.namprd10.prod.outlook.com (2603:10b6:930:57::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.6; Mon, 28 Sep
 2026 02:58:48 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:610:e4:cafe::22) by CH0PR03CA0187.outlook.office365.com
 (2603:10b6:610:e4::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 02:58:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.3 via Frontend Transport; Mon, 28 Sep 2026 02:58:46 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 21:58:07 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 21:58:07 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 21:58:07 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S2vqq92256662;
	Sun, 27 Sep 2026 21:58:02 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v10 02/19] dmaengine: ti: k3-udma: move macros to header file
Date: Mon, 28 Sep 2026 08:26:08 +0530
Message-ID: <20260928025749.1055383-3-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|CY8PR10MB6609:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ca298c0-2f55-4b50-fd25-08df1d0c6a55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|82310400026|376014|1800799024|36860700016|921020|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qDMCiUSA4uxhUU8FHsebj8FlOZVTPb2bdhnUNNYPpRRaHOdeLd4YipIWABQkeDf259WX3Zi1lcFEj7OxjssLlfnXjeWUmafyvRUbI8VhJRcRgYJOj3vL9FQhDhhxeVIJLw4Of36hdQBP8nZbVUgEtsFRMA1b6fwheDIDSqsWFRcbYHO4R3ipZh/95c0gS5dOSSnIRO2yMhNXt1K+AwdSLF4/R22fcxMOEoZ1dWo4Efgmnx3riqAx8WVQrw/8b/7roIGalD9U10xsfbIPs/lk7mOsjCi3qCgeku39WtUDhSGhsgYKgU9DVDuVI4EmZ72i3UM4iGFzKm3mlGaGamyBxAF0mL8MsFvKGG5nhMvyuH6g2J66N5bJ9V7DcLHWLYNW0h9uhChb4ccdW0XCmhp7iwHaSFAot+7pfj+8/8gvnQiFRI8njbGzd0Xd/puhSTuRxCCph7lcmLCDs30LazudCBgeg1CsuKBr6I//G0cMNUDyboMRx/7Xen3fK4QTtNm79lsd/lEvMtmxzEraLxhr7+lkF0cQLrTCn3NFVhqBr7zT1E8e4yJeBe/+cbdxHKLisHwHszYsWgHr6GGwmNS1C0Se8+QY1AigGryT8Fp1tOCYMc28JIzFiw0D7E/Mhe3xL05RcbsjQTt1IBbpGg4FmeWV3+F4DLUyzqrCWGADj5uab5eHg4GhbCDujyi17hRwmVDQuBp0K9ILxySaGxkGp6lJDD/ps7KoTOXD6XBh8shDiDZc7PZ9F7xlddMTDiNu
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(82310400026)(376014)(1800799024)(36860700016)(921020)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tL2GnH3CmHg7uWdjYo5RGApmOSWkOyELGeMh0b7XPqr3+kNPcKLcE5hGgI40Ymig8qn1Tn6l0wEVZAHrS+PL1JVdSPxDEoxEUxapvycTpP94oq2glMDZ/VsFQCPtqEqCgomLovO08HusjoSGna7QctO+6GZVzZJm9b5VJmN5tHzJPyDWOePZbe0drLWE0yf3zS/tEYZNky+ToPm2Iyz4KcFq4AE4PpNAD8RYJFnwDOIHnQllhnjGeOTneupAef263L3qShKtrrxL9J1NR5y5jh1/crk58NAxv9/tHFHLypyb01Y3BsO/3dFKLJQmCRh6R8u6j0HSzGSI2sBYC+PGSIm8jUGhVjeYsoRYzcjPBG4rJl3kNwzXf0OMc5xLSZbViEsMYSDRzQMIUn/Ftv0/Ur/smKuFU5z133DZLBsFJMzOiDVBGLMZMX5uQBPtksDX
X-Exchange-RoutingPolicyChecked:
	xLHoZK+njNOenMDcMPpGgnjnj05ctr4emKMH9fgJyq2/+vVu0qah6ZY5yqM7BDTOUhj5qrfwimHi3bH+qqnwQlhqa1nP0aKxEMOoJoE+UQdfjhgbsfL6p1Jx17BjCBFtQbB2r6DU+3ROTEvssz6WuQMTNXgAAETu35QrgDqiWJHt+ajUPbvE0guycYKw8jKzvMIk8eUy1J+HUk/5/KiJZSEzJGHadYxlbeogVgWEBh38flZa0MGD0qec7X9v/bmlzG3PUxgpSnYZYcyftb3FQm4/LJQSkXl55UHISdE962AwytdEfvU5nI768wWE94arPN7KwCU1pTUUEwfTM7E57w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 02:58:46.9797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca298c0-2f55-4b50-fd25-08df1d0c6a55
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6609
X-Authority-Analysis: v=2.4 cv=aeP0Dhot c=1 sm=1 tr=0 ts=6ab9d7eb cx=c_pps
 a=N6h9FcIU3O7PIE8+NyeJww==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=8AirrxEcAAAA:8 a=sozttTNsAAAA:8 a=u0Ry9gnqgf_Ls9jc7UwA:9
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMSBTYWx0ZWRfX1Iqz53IGzAmB
 k/8gnmmQVkL125pHyqWmLtKZGd5bwd2CgJbSxHqRwUpcy05K5l4mOm/9YQZQ4FSl+1EQOdQh2KX
 Sz4MpKBaTsl6AkhwFXXqebKFAeqigupKqOxPNBpw3jz3FxvTvyE+CwZTY1Uy6y2YMZ64Bx8dMbb
 i+5lpoQ2pRsZml40HxmUgs5oayCv7j+3drqgopAxceB8+GCVd9RrBdFF4ihnjl2NFZWlXuztK1L
 hd38unY/Wv5zbvVPYBudVKhne89xwne+/1TThXU1IKI0OPUsWbaAl/q0DMKT23/PyvHuIdY2u8X
 SEF0jg/mZQTochinivHSxEvMZ/3K/FvzSvX7qnJyxiv1TaubM7MXRq4oMkHesOHnbW2IuPw/GXu
 l0hu0+M7QMGOa+l2nxHmHSewTg2B3wyFnxEl8/g/shhXe2sgg8eaDK6NAyDU6ZYUN3q8DK5peiZ
 GRcy+XxIa0dFvvsSInw==
X-Proofpoint-ORIG-GUID: pnbyBLeq6YCL-_oednsLMPVLVtQGr9Oj
X-Proofpoint-GUID: pnbyBLeq6YCL-_oednsLMPVLVtQGr9Oj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMSBTYWx0ZWRfX14HGvE2HtYUG
 ROzohr3w2mOUJ22yV5hBdmQc5H14CdQg3khNcFNGkt0R+s49A+xCljgnFwYuX//2hc5PnfcoglM
 PktzQOOVZUWywqvzxPwbuFZTaPoLZlM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280011

Move macros defined in k3-udma.c to k3-udma.h for better separation and
reuse.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma.c | 62 ---------------------------------------
 drivers/dma/ti/k3-udma.h | 63 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+), 62 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 8457644cb9132..a1b99097a94ad 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -39,21 +39,6 @@ struct udma_static_tr {
 	u16 bstcnt; /* RPSTR1 */
 };
 
-#define K3_UDMA_MAX_RFLOWS		1024
-#define K3_UDMA_DEFAULT_RING_SIZE	16
-
-/* How SRC/DST tag should be updated by UDMA in the descriptor's Word 3 */
-#define UDMA_RFLOW_SRCTAG_NONE		0
-#define UDMA_RFLOW_SRCTAG_CFG_TAG	1
-#define UDMA_RFLOW_SRCTAG_FLOW_ID	2
-#define UDMA_RFLOW_SRCTAG_SRC_TAG	4
-
-#define UDMA_RFLOW_DSTTAG_NONE		0
-#define UDMA_RFLOW_DSTTAG_CFG_TAG	1
-#define UDMA_RFLOW_DSTTAG_FLOW_ID	2
-#define UDMA_RFLOW_DSTTAG_DST_TAG_LO	4
-#define UDMA_RFLOW_DSTTAG_DST_TAG_HI	5
-
 struct udma_chan;
 
 enum k3_dma_type {
@@ -118,15 +103,6 @@ struct udma_oes_offsets {
 	u32 pktdma_rchan_flow;
 };
 
-#define UDMA_FLAG_PDMA_ACC32		BIT(0)
-#define UDMA_FLAG_PDMA_BURST		BIT(1)
-#define UDMA_FLAG_TDTYPE		BIT(2)
-#define UDMA_FLAG_BURST_SIZE		BIT(3)
-#define UDMA_FLAGS_J7_CLASS		(UDMA_FLAG_PDMA_ACC32 | \
-					 UDMA_FLAG_PDMA_BURST | \
-					 UDMA_FLAG_TDTYPE | \
-					 UDMA_FLAG_BURST_SIZE)
-
 struct udma_match_data {
 	enum k3_dma_type type;
 	u32 psil_base;
@@ -1837,38 +1813,6 @@ static int udma_alloc_rx_resources(struct udma_chan *uc)
 	return ret;
 }
 
-#define TISCI_BCDMA_BCHAN_VALID_PARAMS (			\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_EXTENDED_CH_TYPE_VALID)
-
-#define TISCI_BCDMA_TCHAN_VALID_PARAMS (			\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_SUPR_TDPKT_VALID)
-
-#define TISCI_BCDMA_RCHAN_VALID_PARAMS (			\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID)
-
-#define TISCI_UDMA_TCHAN_VALID_PARAMS (				\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_FILT_EINFO_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_FILT_PSWORDS_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CHAN_TYPE_VALID |		\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_SUPR_TDPKT_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_FETCH_SIZE_VALID |		\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CQ_QNUM_VALID |		\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_ATYPE_VALID)
-
-#define TISCI_UDMA_RCHAN_VALID_PARAMS (				\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_FETCH_SIZE_VALID |		\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CQ_QNUM_VALID |		\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CHAN_TYPE_VALID |		\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_IGNORE_SHORT_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_IGNORE_LONG_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_FLOWID_START_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_FLOWID_CNT_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_ATYPE_VALID)
-
 static int udma_tisci_m2m_channel_config(struct udma_chan *uc)
 {
 	struct udma_dev *ud = uc->ud;
@@ -5398,12 +5342,6 @@ static enum dmaengine_alignment udma_get_copy_align(struct udma_dev *ud)
 	}
 }
 
-#define TI_UDMAC_BUSWIDTHS	(BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) | \
-				 BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) | \
-				 BIT(DMA_SLAVE_BUSWIDTH_3_BYTES) | \
-				 BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) | \
-				 BIT(DMA_SLAVE_BUSWIDTH_8_BYTES))
-
 static int udma_probe(struct platform_device *pdev)
 {
 	struct device_node *navss_node = pdev->dev.parent->of_node;
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 9062a237cd167..750720cd06911 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -97,6 +97,69 @@
 /* Address Space Select */
 #define K3_ADDRESS_ASEL_SHIFT		48
 
+#define K3_UDMA_MAX_RFLOWS		1024
+#define K3_UDMA_DEFAULT_RING_SIZE	16
+
+/* How SRC/DST tag should be updated by UDMA in the descriptor's Word 3 */
+#define UDMA_RFLOW_SRCTAG_NONE		0
+#define UDMA_RFLOW_SRCTAG_CFG_TAG	1
+#define UDMA_RFLOW_SRCTAG_FLOW_ID	2
+#define UDMA_RFLOW_SRCTAG_SRC_TAG	4
+
+#define UDMA_RFLOW_DSTTAG_NONE		0
+#define UDMA_RFLOW_DSTTAG_CFG_TAG	1
+#define UDMA_RFLOW_DSTTAG_FLOW_ID	2
+#define UDMA_RFLOW_DSTTAG_DST_TAG_LO	4
+#define UDMA_RFLOW_DSTTAG_DST_TAG_HI	5
+
+#define UDMA_FLAG_PDMA_ACC32		BIT(0)
+#define UDMA_FLAG_PDMA_BURST		BIT(1)
+#define UDMA_FLAG_TDTYPE		BIT(2)
+#define UDMA_FLAG_BURST_SIZE		BIT(3)
+#define UDMA_FLAGS_J7_CLASS		(UDMA_FLAG_PDMA_ACC32 | \
+					 UDMA_FLAG_PDMA_BURST | \
+					 UDMA_FLAG_TDTYPE | \
+					 UDMA_FLAG_BURST_SIZE)
+
+#define TI_UDMAC_BUSWIDTHS	(BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) | \
+				 BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) | \
+				 BIT(DMA_SLAVE_BUSWIDTH_3_BYTES) | \
+				 BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) | \
+				 BIT(DMA_SLAVE_BUSWIDTH_8_BYTES))
+
+/* TI_SCI Params */
+#define TISCI_BCDMA_BCHAN_VALID_PARAMS (			\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_EXTENDED_CH_TYPE_VALID)
+
+#define TISCI_BCDMA_TCHAN_VALID_PARAMS (			\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_SUPR_TDPKT_VALID)
+
+#define TISCI_BCDMA_RCHAN_VALID_PARAMS (			\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID)
+
+#define TISCI_UDMA_TCHAN_VALID_PARAMS (				\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_FILT_EINFO_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_FILT_PSWORDS_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CHAN_TYPE_VALID |		\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_SUPR_TDPKT_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_FETCH_SIZE_VALID |		\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CQ_QNUM_VALID |		\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_ATYPE_VALID)
+
+#define TISCI_UDMA_RCHAN_VALID_PARAMS (				\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_FETCH_SIZE_VALID |		\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CQ_QNUM_VALID |		\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CHAN_TYPE_VALID |		\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_IGNORE_SHORT_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_IGNORE_LONG_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_FLOWID_START_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_FLOWID_CNT_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_ATYPE_VALID)
+
 struct udma_dev;
 struct udma_tchan;
 struct udma_rchan;
-- 
2.54.0

