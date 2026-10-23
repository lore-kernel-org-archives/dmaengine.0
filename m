Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.87
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792747825;
	b=EGFpNl0Arm9lSmnRChV7xRIjbhIQWSvFkXFqE9uhzZLqUtg5l7JKM63LVfzYT3xY5Bxp
	 l9sHbYlh8vQY2sr8cn/CM16hbRxA1kLWxaEQw+Htk1J3pGCaXHBMyva57jlkFMKZfPrRv
	 hy7ZydTfWsx8Phh/14slUuZTQSz/73xq8Oy/nZqjw9mDxfKfd3IpFjFKs5Mteg2qvrJDj
	 Qcuu0l5+qMwjAqpTlt6RyulhIwfvTV6CJmhnaxN+O5zHC5ROYMpQceIh0F04uZjLGQTOD
	 xaW+SPy+RFgWkr/7NLSrtuYybH1q2dd/1vgjE8Tcj09EZkFrh2PNqMawjlWYzx5TZig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747825;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ExE8VHlcy5atEQBKRME3h9gGQ3lOlGxZcjmk5Gv0WAs=;
	b=OwnvRmzzZLEme/PASTSEKtjmyOHMA0aguD/qYoZEBARImf4t84meq8luIQmXliWKOxml
	 9Vr8zH9AJ0viqSWqWpL3QRw+UFVoivLPd++1i5FHJuCCaFfDjf9RQwijLiIvsUzEWTSkv
	 Fb4vN0BNsw1Etq2EO93Dp5nm+8JwtmBe6wYPugi7JV+G36LQfpDgTpbxViZxLLGIEc/ne
	 gimNVAsfI3XIQFnbR2p046Kt1RRbNn8sBjZgafkAwyZpxDYC/gO3aqjgiJ3NMTDeRXgY2
	 CbUeMPKwgslL2cmizq46DXEu++JCPtq6kQCy8ooAXPqES0oCazLcBsWAPdGPUemPXFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.87
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023087.outbound.protection.outlook.com [40.107.44.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F43606A321;
	Fri, 23 Oct 2026 09:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0F43606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMPAbWcZC8Og/WW+RSzljN4EjRKyo72jVwz9HlPoTeyjsTVmWXF+ulsYD3RTz1k/7UYC188BBtM9l+zSCif4ByJ9IdWZZxMIRIaIhe71hlghHvNXXwwq3/QRsXrNC8Zib7ZDDJOHEx8l1+ocbPDqcVH/OrzQUfvbM+9KsrKogdM7FVmbNpXJh253qmqMSmZc0zYBQ9aQ42TfnQOjIVXGxFyS/ntfbTqnLjfzKPFrnDNOyhIBtagu7Y8cgEgEDLNvucmKk7y4QEtODnmuSdBn5ns/R1ve2X0jf2+YxoT8P5ZQdX5Oo/Imh58YehJU/HyElaK2kSeo8/VbQTbguT1XNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExE8VHlcy5atEQBKRME3h9gGQ3lOlGxZcjmk5Gv0WAs=;
 b=UIOqSCnYhqUH9yQ+/QPpTCwTVmah4b9BorI8nlAh2x4wVUCAgHZS5iEcjqrS82GFv8vnbO2Gui+y4Y4o4cV4VRLgmkGVOuZ8tcrcfAPHypygsEJvsjW4oKITgn3VCkxv/ADR+ppf+p+N0AIaK/Hy60duijRBQgtDY0jwVE+kOc96xEDIp1CGgDTKd0DUA9L3s40ywuv/nooKetcMWCuWS5z7OclQR+7b2fXvNFaRXARDRMok9863A4gu+ssaMGX+uxD6BYi6Mzz7IzHx7ZTMMGC9CscSRV4iwx/4A/ava70K1igKxI0+4yHxWVgtZ67jezQE61BN2q36J4pILSiU4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0024.apcprd02.prod.outlook.com (2603:1096:4:195::18)
 by SEZPR06MB6038.apcprd06.prod.outlook.com (2603:1096:101:e7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.4; Fri, 23 Oct
 2026 09:30:20 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:195:cafe::a2) by SI2PR02CA0024.outlook.office365.com
 (2603:1096:4:195::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.18 via Frontend Transport; Fri,
 23 Oct 2026 09:30:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 09:30:19 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 2C3484102B47;
	Fri, 23 Oct 2026 17:30:18 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com
Cc: devicetree@vger.kernel.org,
	Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v4 1/5] dmaengine: arm-dma350: Fix source trigger bit
Date: Fri, 23 Oct 2026 17:30:13 +0800
Message-ID: <20261023093017.3248454-2-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023093017.3248454-1-Jelly.Jia@cixtech.com>
References: <20261023093017.3248454-1-Jelly.Jia@cixtech.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|SEZPR06MB6038:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2808309e-4376-4109-4e20-08df30e8411f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|82310400026|36860700016|261022105027099003|261021123027099003|261021121427099003|261009223027099003|10067099003|56012099006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ZUxa/g82gKhyLuJmNhq5owBZ4FsGZBRwtc/3LuraagvcCY77ZZML3lXy0LXGv5IsVndFiqm6pwBZMEwEr5BeZn43VmYLvEDveez/49SmwZTYC5ne9YnW1Vkw/Jmz/iWHijE9II8bwdYy7AnyTr3+xtI2XUcv+M8S8YctSKX0Yj+TVbxbZb98dyiVakjHjSO3Hj8BFA/Vmh5MNNnhFIYUpXyFkIqOr1SJnOOiItv6xrwLeCaXHsy//tZENG8kV2Odx9xxuknAR91j55MptZHFG6RI492CUWTSCD3b233YSTuivDoNgSZLc/MZTudjs5cUpTYqzWxiBEc5RZYJqYvUAXdqdyHn4DR4pdCNAflzT7WUHBYGH/p2dt+DYvf/VPImROvwlIDDu7dYm7aatbK1DcVXTZAfm6djVzWiSP3XQ7QUcLRzuWFeftO5i/oK/X/lrWv/53KNrsLMXmELLC8W9b3Hn/uceLckslaIgLjPzL26UEZpHeJBwkuWdTNLulu2+MoGOA8gjHCd0B7bUBRxmImUa99rAg+KYK0UOJ05N7yJ8cDVUyle8CHmVMVrSajHp4qHrF/GNS+l89Wj+93ootVIdOyokuKLD0pxvrStAb/FBFDE0FwElLAT4GjVqB+exqjx86CIg61MCQMzIlv7fqt8m8tK43sltuk+29io2uNUy+P8i3BWm/cECR4cVP1tWv00Rqo/qDfQUy7WiZv3vw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(82310400026)(36860700016)(261022105027099003)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003)(56012099006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lY/oeFefdH863qLReB0grDi8aDVvV+1vHshPiQ8dFXmf7t2sxh0X/hIOfMoPBvU7KpV074vZWkI9BBRwKkjCCy7XdfY/GKLLG252mdl8I3VUnn3su8V2SjkVDnLqJMBhpocgUXAjV/sGWh7Nhu/q7Jzl/DhvZZOOeGtLatxYIbBl40THu81p0f/CecNOMdDNDx/1tKPRgGdgi9jFu5QmGX3uOR8GsHSk77vDfxDtpSj2TokNLtsznAp0UmB6D9HWMUnoyxptkRiihGIPlAhyy9ipFRE+66N9F/Xzp8lhXtgWrv5kuVrYUQUG+4di3CdbtE9wI2gjotITsd5qDlrMUmCLWsaurYBhCylosHgBlpeIuwxTKBqiZb/wA5QZOBnnBxlWARnlUXT7WNOIQX2G2Ukr35R4dohFJW3TAEo5qE3ZNoTL1PI3GD2izzTbAwsD
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 09:30:19.1100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2808309e-4376-4109-4e20-08df30e8411f
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6038

CH_CTRL_USESRCTRIGIN is the source trigger enable bit in CH_CTRL and must
use bit 25, not bit 26 which is the destination trigger enable bit
(CH_CTRL_USEDESTRIGIN).

The constant has no users yet, but enabling the source trigger input
would silently enable the destination trigger input instead, breaking
any transfer that waits for a peripheral request. Fix it before the
first user arrives.

Fixes: 5d099706449d ("dmaengine: Add Arm DMA-350 driver")
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/arm-dma350.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index 09403aca8bb0..4e17130de6c8 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -63,7 +63,7 @@
 
 #define CH_CTRL			0x0c
 #define CH_CTRL_USEDESTRIGIN	BIT(26)
-#define CH_CTRL_USESRCTRIGIN	BIT(26)
+#define CH_CTRL_USESRCTRIGIN	BIT(25)
 #define CH_CTRL_DONETYPE	GENMASK(23, 21)
 #define CH_CTRL_REGRELOADTYPE	GENMASK(20, 18)
 #define CH_CTRL_XTYPE		GENMASK(11, 9)
-- 
2.54.0

