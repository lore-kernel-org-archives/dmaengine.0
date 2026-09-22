Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0940C4EFFCA;
	Tue, 22 Sep 2026 06:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059913; cv=fail; b=f6CrX80frBJFNxVvtk3WoG4GI9AYQK6XpqApM9hcrb4rOmiA974JkMKeHFUay4mfd+Y8MG/bbrZSZVvtWlY76VO7oWZwDW6d+GROA5m46kIuxKhzAashCiP3vkN/f7qpxEw+F7votsltz1gC3xRpIyLX5pWPvqywZQ7GINTYjR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059913; c=relaxed/simple;
	bh=Z5yqiGYQb+zbhB5jd+Fn5cjG2p1x73Xbil4wKmJeRnY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HAMJe8G7Ulfsgl+YwE4HxGlt83VJQGoRRPJkVqTUeW9d3dnHH/NEUqpYk9EmwUcdyh7Of/1P7qUacPXB5fGG/iRH8jCBPqhCOMMYpLFfRSdAoUvqOJZzuj/1zIBN2pwCujTL6gZ5ChtBTw4hg9FKcv8y/+jkY+w3YaZ8ctd2B0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=ifgdmEBT; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=SApBNrcv; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="ifgdmEBT";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="SApBNrcv"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M2UZfC1035403;
	Tue, 22 Sep 2026 01:51:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=H7SuJRbIzkpZSygmg8FrIDrs0PBd7WpV3zdPr7z8b
	TQ=; b=ifgdmEBTIeYK1whS8BTyu9cxV8yojlbiH9YgGFs/CQ7SXHhOMiFu4NyPp
	Cu1bdY1k3HCEdl2kmKGtSLNlKUIpnDsBGIZp+DtH0n6BVxh0Nc6jG6Fb+/NJpXhj
	Q39ajNLw6Vo+/JZfOl61ARD3LkIaxaXAVFx5U8NoRMPRTiFtG51McRhSka4Le4Uj
	qnx8VWpXTpMt94/133qr+TWmd6MMKD6P2SOivfpnTD1uZvOCVuxnGH9boXiWsPwp
	l99w+PeotnH11XKiHI2ZLDX/yRyy0gO9lsLuc3+TyOJAa8OyvWWQ8/HUSor6newH
	2yoB34NL1DO8Tx+qMpm7xSTGhQKPg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010033.outbound.protection.outlook.com [52.101.85.33])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gugxm16r5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 01:51:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y/mJfZ9K5o1qXfzCBUhEyWHCrHKDywJpof74ImoqvI3UyaOpBHvYygVbST0fU5Dimn9GS6aXogzeapYdZ6GHgra6QHQCFwjhOT/P9QCWFGrz0Zj41/ndAE1EuoJKBbZxY6qDDXwW2k+OOlSssVK/RysvU175S445lRl6AATC7GLX2M4EcDC4VaqAHPwzSTGP7XS6gmef65lcHU6f4g2zSJlx3ohZiIOektVo1AA+KVD8QBXyfcyvFTdqZEGU02+RtKA2TdkqBc+mfVkxUcrqLV0TaoLhHcqV/yqUOQzegHgVyOWSiAGgGhLUu0t8U+25irJxeGHTlP6ktscT0KwZMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7SuJRbIzkpZSygmg8FrIDrs0PBd7WpV3zdPr7z8bTQ=;
 b=SgH/gxdYd+9KdkTV2c4Ck4NpK0s9XYJ1ZZGzu1tKR8XxE/AEh6ZBKEAgRWFsK92oQtjkHAGnkktQcLYGrrL3o0KUzYMixznJuiqjOEV+AKW/BKDkpeJ1Ild+iDd1aUL3bIyh886B3jiN/PsDqlPyse3rVKLtR5EEceNLzuOzZQrrsDRL97GcM6u3jCbVaKpJ8LxwdIjQF/V72B1Gm3V3Qem/uIyY6rolyC+t95abzydR+wy9qdbSqfzQp+c46FEIIDJ6gTYWwAvssNYUwFpFy2JrSxD2kkN8Rnb7CZL8jOQDz40XWsUQYoO0rz+qq1wkjpA4fDxBc5X9KMqh+ZEvfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7SuJRbIzkpZSygmg8FrIDrs0PBd7WpV3zdPr7z8bTQ=;
 b=SApBNrcvXTGTBWbXvadP1pK6xAsD87vkD3U7lijl7U7jcfFGynFmJEkBufhEvGMuA/zVDkp60sHVY4iqtvuQU6u5JhiUgyM/4CE1CIoNcKPqDVxy35JnUZ01esKeGP+ZZ2jFlWbEqfnbqZN+b5bnvIpsa1l0fDjcz+kWYwpODQI=
Received: from BYAPR21CA0027.namprd21.prod.outlook.com (2603:10b6:a03:114::37)
 by CH3PR10MB6761.namprd10.prod.outlook.com (2603:10b6:610:146::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 06:51:01 +0000
Received: from CO1PEPF00012E60.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::61) by BYAPR21CA0027.outlook.office365.com
 (2603:10b6:a03:114::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Tue,
 22 Sep 2026 06:51:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E60.mail.protection.outlook.com (10.167.249.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 06:50:59 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:50:17 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:50:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 01:50:17 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68M6nI433626771;
	Tue, 22 Sep 2026 01:50:13 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v9 11/19] dmaengine: ti: k3-udma: move inclusion of k3-udma-private.c to k3-udma-common.c
Date: Tue, 22 Sep 2026 12:17:35 +0530
Message-ID: <20260922064902.2719979-12-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E60:EE_|CH3PR10MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f8d7eff-4ef2-449f-be53-08df1875dc8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|7416014|376014|10067099003|3023799007|22082099003|18002099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	F3Ma1jncvjVcvSCnXaKmn1T0hWbFaEm7YU84zIJ3ObvbQtU+gYIKXztjOxzf9JYuzZN48LgUoCQkhC5h7C8SdV3XWbf0wAPdL57B5JoASjVn2ZffsMQs2cO31kTK3jwzx8jq7vH1EDufncyMWuF5YaLBhEPKMVNnPe9XGnmKbEehE8o2IJPV/0lPklAA/FCuoTl9L5h/QI685i+4SM79CNO5r3QPT+wr1NgRKokQVFXItpESqQSodQVMkHFfdzSgAaHEezCJJAeLSucs62fHNkqFJo+8Jgi235t/xfD3PHbd3zkHYcwBKLnMy700SUKc/VzpTBPfG6fQMv7thfn85tV7pGJWOFDAb3KvQq0djKYsoHisT/dqgjfox383Iv7lBx7rUM32F+R/Ul117gRWp6YU6kYBoj0NCpZvK/I3eRY/jNKQRyQjbNzwOudEKnxPh5dEKNZnueQTopjWBN0YxaekcJyWXubehR7szbLeHpiHlEQ5i2+t38kdkzaHWZGnYxh9nGeDZ+jc8K2+5O1P6TnEjCAQ0csVEcLM+QEiXg495rDBNCDPkfdhiySwHAVFpFM3+58uGV6dkP07WzgpVX4IxpQhTkGVT6YEp13SW7hw+O4585jIYnMAgJ6iSBDgkuJxzwQuc+DiTOgUgqsnVsJP/iWNQeRF65T3wR+oosF5cygUIejPCz14Mui4+yHTxAvAwg9hWEqGjCmJRIxSaeKe05V6Vsrngq4bHGx+qCIkPSAlyEqGgc4KOEBJwdOM
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(7416014)(376014)(10067099003)(3023799007)(22082099003)(18002099003)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7x0ESJ2OVyVBuUl4CVgg4qANENCPl7yWwp82AoQZQA2kBJK0We0T9idsZlRTLckw6OF8rgI/B56TmxTcVwx78bvzKrikaWNl9ZZREAXN/aUY7CqWV+vPhHO7WwZSfCHedgiBtNinWLQ5s1UFf4sUYBsf/7b5W2OJ3cfzqmH5a9gVK7eIBTGu7feScSx78Pc76CNirIgxqTN192RqIJaqqMfzoKt0vboM0S5UnBaokH6XLqKTHow2rQ1L1LK9pOjEVgOEBb26ADijN0pUXNljweUOY/zxZIEEcIEvuQIE28jVWaWSeAl8eAC6mvwoQfGrFx7MqA5nimLE1uxmfrppo8YeP7P/N5wzUCYrvu3e5hCPVOGawbB2dC8mJ6y5SpoA1MfbgjcrosPSui7X7+L4cqxdyAzbJ8Uf4IdF6WZ74TO8VGsIPH3kw7scrpFHrhSo
X-Exchange-RoutingPolicyChecked:
	lVWUCcmit+nXmhTWBYyzzbbCekbrR+QqzxeMnE3z+i9F2uHsKzxchtXH12s4gfWQoi7FAS3SLY2tT5nsoUM9hGPudnfFnPxTQwkJ0Xz4OJIHF+Ov2op2zemyCQWwkCo+jd19nwdZOA7VmypbXAClKiXVDwV/3Tk2PNq3T5tWoieIYUL3oStc4SkuHuPoBr0NmEuZndP0RuDTFuZnx/ATL8+7xBtVnlNaaK0AVHo9tXdzjddxnSXFtZy3TCGMghJ+hUgb3XIWFVUI6WQRkEcQO+6q+U8wRod1DBj6JRaaBkbUW8S15eW1WRzVW+TXgno47W1y0LBr6W9MMIoFR/HztQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 06:50:59.9109
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f8d7eff-4ef2-449f-be53-08df1875dc8e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E60.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6761
X-Proofpoint-ORIG-GUID: KZjSYv3KUJVs1ktH-bhmqozDo7s7uAWM
X-Proofpoint-GUID: KZjSYv3KUJVs1ktH-bhmqozDo7s7uAWM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA5NyBTYWx0ZWRfX9BDXgAxNU+VL
 c7AAI/CkAS1AHhp+HowAMDpmAhPOCeQJGe62tKMj/d+8LLOAmuqVzinOdTBfOBxEllvDPleHQwu
 V8FuXlBS75klTfOwhwZgJLLn8lFqYazrmS06x2nCewBYz3uRS5fcnjgCote8QNZsAOpSo7DGfqN
 xyA8FLrvy9+jWTlC7FQdwYV/D2Cgl9tNLYy+6Gg34JiknqoNl0+V7tdS8m3whU0WjUq4sNPL6gR
 WKU3J2cgLlv6Y7kfc5kAC+Z+H7X/uGoGVjtmAN2pqYLHTXh8hMi0FSyvVReErpQJ9L4fzpvz9ij
 F71UV6UujqooRBqK9RgUCbwFXHFCyJiFOEMlhTakFsvAf1WF7ppEgiKBIDIah8FEUPyVePEWbEA
 7ITtyQNM2VrtTs7sQAz3Lhp/Ol/cXtCE2B7BplLlXPJLSPVJlpQZmIhKFcl4OO5dpL+SwjnKKQG
 +XyT+J5Ftyl6X5LtrfQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA5NyBTYWx0ZWRfX98A8L/VCnOhR
 2lR/SvKePjHPFRGY58AJx1uiPOXkHxbY+CzQig1xnM4rw7DREF+bs0cyk2FUxo9kzS4mpNYjv7H
 H/BrZ42vHOryfpD4UtKRwxRfdSpu3tU=
X-Authority-Analysis: v=2.4 cv=INeXmQvG c=1 sm=1 tr=0 ts=6ab2255a cx=c_pps
 a=+v7uXpzEFv5PX1YPhMLqHw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=tBjUjbL6H5YkyfA7LM4A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220097

Relocate the #include directive for k3-udma-private.c to
k3-udma-common.c so that the code can be shared between other UDMA
variants (like k3-udma-v2). This change improves modularity and prepares
for variant-specific implementations.

No functional changes intended.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 3 +++
 drivers/dma/ti/k3-udma.c        | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index d0afbab01786f..eb555cc08347d 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -2536,3 +2536,6 @@ EXPORT_SYMBOL_GPL(k3_udma_setup_resources);
 
 MODULE_DESCRIPTION("Texas Instruments K3 UDMA Common Library");
 MODULE_LICENSE("GPL v2");
+
+/* Private interfaces to UDMA */
+#include "k3-udma-private.c"
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 9a261747c8709..ddedd51ab26d9 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -2857,5 +2857,3 @@ module_platform_driver(udma_driver);
 MODULE_DESCRIPTION("Texas Instruments UDMA support");
 MODULE_LICENSE("GPL v2");
 
-/* Private interfaces to UDMA */
-#include "k3-udma-private.c"
-- 
2.54.0

