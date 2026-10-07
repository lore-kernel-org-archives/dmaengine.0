Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7B04825CB;
	Wed,  7 Oct 2026 10:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369067; cv=fail; b=UloB9KB2s9FTr2uSSsYx4jphCSHStTqMiVMmamIciN7m7S5f69oTy/aBj4+4G7yWP7REuX9bK69wGaynR+aJIyGCSsPMQXCbgEKlwY6nzV7VTmBlnPLa7OKCk3hO9EJsFfSCPCQd6LW1z30M0srfRY2nH0NrzYxOnf55zZsrk3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369067; c=relaxed/simple;
	bh=X3gOOe/aL1YjH6WfUUw5Kx973jzeHSZlCnjxkl7YCHc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eu0/1qhDOK49bxja7txhhOF3dt8PWMOYXzvZrv+pLpGDxryh+p47zwBEw0rLhBz0MoB7zX9oiS69E+Z1lplDirBMCg7OAfF1nWhL5dtwXyDD6X6dVsEPOzWRqd163I89uuki5f4G7ALrnkgXElZGy/NNRlmZE0ZPk+w8r1StMv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=a1oEJ49d; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=pqdcEECE; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="a1oEJ49d";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="pqdcEECE"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977k0RF753188;
	Wed, 7 Oct 2026 05:30:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=TDFWMedbgzwsHAQyRE802POqj9Cq5T56IWRXD4qAL
	h0=; b=a1oEJ49du1UcM2VjvNL5xfKGS487ltsAIMbnJDtkLgxEelrUuOkVpqKyj
	Rz6zWoS7pncmJkSxXJiKHUVZl2p1XNHxhhAY9/qqjN8E2dxIstZy69fqOnsCONRE
	amOTEjpFHgmtI5FJt2oJpIy5zCJ2i4BBUM+zZ6DKWQ/+k5LrfLCGpdpXVlehnth0
	rZSNosJ0AJPvToISJouQuDE50d9vaeORxMti8LxReigqGKcQeJHIooW03JVj5pwn
	Q6k8dYaHN2pag3pormUONU1ToCGuxVBpTJCSgI0TropRuCq7AhTHhpYHIpjbFKPw
	R5vpq0IPBKxrB9ss9RunK3lfQzIgA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011016.outbound.protection.outlook.com [40.107.208.16])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h5hw78ps9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 05:30:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MRczNgiCffasME9ST3rdkjvHXyafQn23dqOsbuGfLny1/OkYR4U9s4OKkNzgfxbIKkxzccBVywLkATowmSM4p+UViuVXu/qTQ0cMfxS5bh5HORXamMaim6/UxXdXVWDfFePAp0IOTtBLCg6c7UKt7oHgkYFaUahWuvFI21pNIRH3r7Pio6q56gjClryXcz7utxhGCWizIe00EKcLm/rWGRU+DXNWkbNlXYOaebAqcI09CbrUYK09xSTJQ6yD6dfK/94RUAs1xRCodw7DYo+BdwIokiak4XKPEgfqeTHjbKU8xrIqcgCp0fcu24dK7CP6bETGU8CQKDIXJDliuUrnPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDFWMedbgzwsHAQyRE802POqj9Cq5T56IWRXD4qALh0=;
 b=TJmce6+Wf4riin61rSRUWE8G7R5WlMeGYp6koCVFveQ9DekbvkYx+5xZ6ujOnKkfTAHQ+unfwKcISQospnZPt03/yw7aq7AvF7wuGQOyx0/EjkwX1XgVgorNA2HmQ5SvRGnG87otJHwvJcWe264lb/F4VBVWiW+tMun7W1Z+YjFVe0UqES08tkcg30vcJjMf9SEE+i1sCPHZgEBf9XOoY77GBmCyZ15IUDNm9FmYUJQwaTNdqmk4rtwA7Sn1dyX6EoX5tmMFeJ/9lCqHRfR0dh61xf5Appxnz2KwaIKrOi5JAI3vAnjXfqpQR8fzEKx6OHOvzNakUjM0ZZD6wi6+kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDFWMedbgzwsHAQyRE802POqj9Cq5T56IWRXD4qALh0=;
 b=pqdcEECEL3iZjluISB6FShfZjnc9TlzqHrP/dAa8BMwXbZfjrcyy6wi5FKHSmGDosOE3Vamk36LWqsjSooMgzpH0X8SwLH4X6WyG+P/sdTXElg4G8OvBPlvVVuf0LIfR2MlDQL/3Dx1jDnnH3ONUri0/Iw2yPve5nirOwLPPPYE=
Received: from CY8PR11CA0011.namprd11.prod.outlook.com (2603:10b6:930:48::16)
 by IA4PR10MB8447.namprd10.prod.outlook.com (2603:10b6:208:562::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.6; Wed, 7 Oct 2026
 10:30:32 +0000
Received: from CY8PEPF00000050.namprd05.prod.outlook.com
 (2603:10b6:930:48:cafe::5) by CY8PR11CA0011.outlook.office365.com
 (2603:10b6:930:48::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 10:30:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY8PEPF00000050.mail.protection.outlook.com (10.167.247.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 10:30:32 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:30:17 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:30:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 7 Oct 2026 05:30:17 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 697ATiSo013473;
	Wed, 7 Oct 2026 05:30:13 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v12 06/20] dmaengine: ti: k3-udma: move ring management functions to k3-udma-common.c
Date: Wed, 7 Oct 2026 15:58:47 +0530
Message-ID: <20261007102936.2402427-7-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CY8PEPF00000050:EE_|IA4PR10MB8447:EE_
X-MS-Office365-Filtering-Correlation-Id: cebec6c5-5710-48cf-e5f9-08df245e03f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|7416014|376014|1800799024|921020|56012099006|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	BzQBLBmhtQNcjkYEsPGFlyI6sQwta/FQkxe4+avY2Dj7H05p2vIH6Ja9o2WNi9LOWBCXmpxe1BAcbZShCPhLY4Fddpa5vJ4zKCWsc93wkTDjsqfwS+QfiKSdl+JY8Law+k+O4vkdKp0m0rhvYQ2sSlNqdFPkRH8W7lWQTIvrBFY9HorqUSFGIYJrreS5g6YKPu8nYNBTvIKzWF+TueE0iXGVIOciKOKHJMKE5Ciujx6c0RxaYPhlNHfalznRjiUb7eey/5FkeiRUR0lYEi9WfrIn32ntY6z1pA+EDlSGBZQf1aSGCsIyDkNPFYkRrQiBTtwgBalS65nPAP0IkKZiBgw6oMNipcV1i4AXSseV+OA9Fqz5XeRw7/aBJ5Mbb2hpzCVsf9Hw9kFE7mvj2JIUsZAqhHUo8s/nQp9t2YOp81Y0SLIkLM+hS7ggfB/g6pZhX3CMGsWdEE1qhO3CJ20nbXRuXlLftevNAwoKOAujJCXGpgiDXAZ29vF5PVDYRHqVSBVqNE4/F8q1t0TNLue++bMuQKkQMVyerrOpz7okERWwb2BMYCmUJS/p4QaxIyrO7x8MSjpKrmkix8sEId0vnQwjDoXm9IzG9oZ/4oLl+nRSCSi5QBZzwF5gehCFZHiDK5MP6M2PWoNu3H/ghNjwNYW/Qpg9UiaY1IxUvb5zqkXju+4qGRrO+EwST2l0sGqEYoR2VJpMipCx6Z5F+TUvU27eWQpS++WUX7wLL1dP2yaska31BLCfK2vztJwl+x4o
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(7416014)(376014)(1800799024)(921020)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ULBHKuAhtxD9/luCQVgtbT3O25z7L777Tc2fLoiXDyihmtKWesoJQP41U61XdxpHCaeS0icF98vT50tZwgCFMdaXYWRGLMoFVTaclFYy6hn8xWf/zIwlHUxT4Oh7ooHpqyMCXtY9NB243mhHE22iYHR57Ajqhek6jDToDjB+iqAjysaHzQI+28zGk5paZ0iZl6QGs/uUTr4tUT0x9BeFLWus/ePkvUQdzEpC2xDe6Cpd5B5B2eN9rSf0I3gdCabSq/v8rwAScwPt5Mdx/pU2i/KU/j99T6XocBvqYz00j9l5nZIpzkS6WGovHSAVxFt8tyYdZ/xVzL4MpFnXjIDZp2lx46OpLHOegAEOqFwHgT22x5Uf1A1q64Utyg4O9HRXOu8ZrSgp9tM3udoGOqCgLkGSxuzNcujHa+Q23GonDdl0ishmwtMTjSQ1as4HTxm6
X-Exchange-RoutingPolicyChecked:
	Id1pwAewdYdezcmAD02atwCA8PxEuLGJD8dl1s7mwzfeVzohXShU50D4yrXXunevhE5I6/B+WQ0lr5MSo0vfTLD81Qt8qvN5pB/zb1/lHdzZI+zfUA1Bl4sGGQiiL8PvL8id19ib9TVZLprRMcpLWHc9OXXCssMjGACS1K/qi07XJZJtyHD/Kd7JlwTxNd9dA++S3CoPIeRXu+OGl+u2U813ZNku2zsenwYxYMqbHsty7qrfbVPikyTPWx4hbPdP49oOddunSxipgVcLBuU19zDs+i8qnpg0uGkkpKFgo0yg29qsMsP6UgoZ+4V+qM1maPt39qEQM6o4PXAloXg8Jw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:30:32.1188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cebec6c5-5710-48cf-e5f9-08df245e03f8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY8PEPF00000050.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8447
X-Authority-Analysis: v=2.4 cv=as8nmiZV c=1 sm=1 tr=0 ts=6ac61f4f cx=c_pps
 a=CJt2AWVwLbfAHulDA2arTw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=8AirrxEcAAAA:8 a=sozttTNsAAAA:8
 a=bS-Ji3T8UFNk2xfqAFIA:9 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfXyAMEJrrquAj2
 55MMub/e8KNeruIeq8R42zf6BtBLo47LPNcvIfSQ10/XEI9f8/KgencCXtzAW37gFdG9gZiiAbR
 f4Jmvw2DpvpLkQrMfGN/cTJ9qtE+wnI=
X-Proofpoint-ORIG-GUID: F2drgH91v5RBvhEkImMPyUUj5mBtySfU
X-Proofpoint-GUID: F2drgH91v5RBvhEkImMPyUUj5mBtySfU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX2ZXJYT0maVfw
 nWSYMWInln5cVNmU+m3mobkT82MjNmryzZ36SOyolCzmgq3wp2WyAs6WsoTrkwlD3lXeqfWlxwt
 PSj956Vwis7CCs77azaYbfYQqOwUuXchy0gNY/ax2mXmQftxM+Adh0ng33QbJu5owGqtR23joFB
 XqZ4GRcUR9AQkfDfWoHQt4394eNHJY4SJfWo/89VAU1BSD1B/X3O4VTVgvdKQ0GDC79qjDpowdf
 39a9VMbe/65jAHWb0OLyeEV/YFriQKab1krdnczAoPifqUww6Oao4BbBa2HpCwpMJg6jymf9u7L
 cwmSfy3I7yXVwHNo/NWp10KBSL2PjJy+7rm0Jt8qJOSdwGgsdSbB6V38Bh5UB3Jgak8mWYdLVNK
 HQ4nHA4VX8sncMFetOItPj9yXwThzybtlYgDRB5/+in2NMzp1ClGo6VUpP98jKjAa6292FlupY0
 ioTtc75pcASyAJVnHew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070041

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
index f9060bcab8a5a..c9cbe93f2391d 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -13,6 +13,13 @@
 
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
@@ -121,7 +128,7 @@ void udma_desc_free(struct virt_dma_desc *vd)
 }
 EXPORT_SYMBOL_GPL(udma_desc_free);
 
-bool udma_desc_is_rx_flush(struct udma_chan *uc, dma_addr_t addr)
+static bool udma_desc_is_rx_flush(struct udma_chan *uc, dma_addr_t addr)
 {
 	if (uc->config.dir != DMA_DEV_TO_MEM)
 		return false;
@@ -131,7 +138,6 @@ bool udma_desc_is_rx_flush(struct udma_chan *uc, dma_addr_t addr)
 
 	return false;
 }
-EXPORT_SYMBOL_GPL(udma_desc_is_rx_flush);
 
 bool udma_is_desc_really_done(struct udma_chan *uc, struct udma_desc *d)
 {
@@ -723,7 +729,7 @@ udma_prep_slave_sg_pkt(struct udma_chan *uc, struct scatterlist *sgl,
 	return d;
 }
 
-int udma_attach_metadata(struct dma_async_tx_descriptor *desc,
+static int udma_attach_metadata(struct dma_async_tx_descriptor *desc,
 			 void *data, size_t len)
 {
 	struct udma_desc *d = to_udma_desc(desc);
@@ -759,7 +765,7 @@ int udma_attach_metadata(struct dma_async_tx_descriptor *desc,
 	return 0;
 }
 
-void *udma_get_metadata_ptr(struct dma_async_tx_descriptor *desc,
+static void *udma_get_metadata_ptr(struct dma_async_tx_descriptor *desc,
 			    size_t *payload_len, size_t *max_len)
 {
 	struct udma_desc *d = to_udma_desc(desc);
@@ -780,7 +786,7 @@ void *udma_get_metadata_ptr(struct dma_async_tx_descriptor *desc,
 	return h_desc->epib;
 }
 
-int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
+static int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
 			  size_t payload_len)
 {
 	struct udma_desc *d = to_udma_desc(desc);
@@ -1240,5 +1246,108 @@ void udma_desc_pre_callback(struct virt_dma_chan *vc,
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

