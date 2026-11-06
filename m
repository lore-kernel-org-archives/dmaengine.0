Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.133
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793928900;
	b=QbSCF1c9FmLgtUoC2XfwOzDYukucMpPOdaC1X/4oy6qZ/YOKr7s+3rsfij/pmA9DtbtH
	 N9eZo34kNG3gydcJkJB5Us67cwKx5NdlNR0t+N+da3eVeW7NX+l0NkTylR/iwi624Bj24
	 oHQJ0oDBw8i6k7k+PPKiVH/uMjM4NWFRBAIh65FHidSVdJWmVlzdMTvuEXBraNADurDXr
	 EDLEgHgfSAsVP14XGES9KMv9pWghthmDP8iuy9qeJTnYfKd9BIGUBl63sGDmAA/N2NDuo
	 mwFtjqPT/MXE/v+czwBa8RTwmpmJtydkmQjWiUUaVeNaKIjDh8/xoxfuWpBRIDnzZZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793928900;
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
	bh=KrVBe5x9E7InxP1BW2HQNZrtx0xeZJdcUQeaxJDjM6I=;
	b=O8oswZXdLTFLLVeOWQmP/Kv8TdGauScDoXb30XFC/6sIUTJz7rmVh3W8QMecY/ewGOHy
	 s13M7pZLPHk1sH+GMhk/sncd6aTWuNLg+8eyRGTAwtKBNRfjZsQ826MmpBZg8J7SF2pAu
	 DlfQEVNN0TTCauQ6igsKK6Ge+5U3To7sIcoqlCrXmcYiX7OFsfepZlQE5Tm/uC36HFyW1
	 H9b4micPU7Z5PUcgS4ldukqB5mueOT78q9ZhVjqNk6RdFlKpSMBdsEUZQ97Nl/W8AQUw3
	 ksfjhsyta8gpUU8G9/fetrnrWDNgddkJkiFRnE83wYeFjYnKOgF4sfmwvUEP2Bghmig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.133
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022133.outbound.protection.outlook.com [52.101.126.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12E4606A329;
	Fri,  6 Nov 2026 01:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A12E4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJivQN069WSTYYU8UvM7FinmN+NsDQLgENDXrMMK66qWONSRtq3j9Y0h9rY13Oj418IvniHGSYdKRtAv9CZtKwQ7zZnp/M3xAHYrw8NSn+P4Wd4VCuW0Gg96U8UkCzwxhZ1qiG7MAxWIaAlS1YlxcdpVrGwNGmDwOWUBaSjiR344bLxtGs27k5u5rrSwkEuc7FX7NKXBQenY42v5NBSKfY+Djlzeyzeh/fD1h0QNbXTzA0YF3+zX5haFmYFgqy/4GHT8abyx5OYhMebRcmnTATkwcXwBQ7GganJxOtwhE3U0eydLVCcvN7t/GTDxh0uZuRve32pbAefGUzJj+WbUrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrVBe5x9E7InxP1BW2HQNZrtx0xeZJdcUQeaxJDjM6I=;
 b=Iulo9YBCQQiTty4mhc2t7QntSrcmUQ6QApklKp8XueXO35jkTX7qPZx2yqD8So7JJjgZsr4pjwzBt+G2TUllIc1hjAjsDKsfGBCqCwpSt1V4XR8GZ7SbVk3MrMkAHRD8EaYFKR58Da9s5ff7yf077gtMASwbLHiPKNE2RDnPMHJ8GeN/bzsyANJ2TET6Fsw+OBFpw/mwaHLaZ+SficKvVZHDPQkEPe/ArXwBdRwfxBCyh4EQ2RHr65UVX2K7KYdbkidb3C3wOxO72FOgEu5nSEYgQH4lgHI7XXV1G2cmEIei0+LHtUTyaCMGYEYZqanheMyFxjbQb1EdareJJ401bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR04CA0034.apcprd04.prod.outlook.com (2603:1096:990:78::24)
 by KL1PR06MB6621.apcprd06.prod.outlook.com (2603:1096:820:f9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 6 Nov 2026
 01:34:55 +0000
Received: from SG1PEPF000082E5.apcprd02.prod.outlook.com
 (2603:1096:990:78:cafe::6) by JH0PR04CA0034.outlook.office365.com
 (2603:1096:990:78::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 01:34:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E5.mail.protection.outlook.com (10.167.240.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 01:34:54 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id AF39F4102E6B;
	Fri,  6 Nov 2026 09:34:53 +0800 (CST)
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
Subject: [PATCH v6 1/5] dmaengine: arm-dma350: Fix source trigger bit
Date: Fri,  6 Nov 2026 09:34:49 +0800
Message-ID: <20261106013453.1134239-2-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106013453.1134239-1-Jelly.Jia@cixtech.com>
References: <20261106013453.1134239-1-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E5:EE_|KL1PR06MB6621:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 59b10f3f-d27f-440f-41f9-08df3ba628f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|82310400026|376014|7416014|261102123227099003|261028144727099003|261021123027099003|261026140227099003|56012099006|261021121427099003|261009223027099003|261026121527099003|261022105027099003|22082099003|18002099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Xv9EV29A3DnxrMQKHHExXl+JeOX+kzqqmMCkQJqgph+95ePhXzDkruC7UW742CMZMnAgdwFvwk2atLUmYENitvdGftf6j133ZRbz3NTIoT73UAyB5bS5NiEf+9TrD/lp7Hz3AS/CJaRpU5wuPrMozfGcpR7WX6XG5ECFSkICdou8UtskkJ1IP9paa82UULoE7IKE3iAlvBvPweES28it8QSMHf7osnxpYxQTsZSCIqLXh3qP3nD734rYOfFtBJusVCASjTkfy6pk/QcCIbdP3JtrzZBtjDkzqBjrTjso9B6CDRn+VqX1/7CJrsmJx66QUjnbXZdzvZ2r7Yg1BFUKAIzXbXWXwC5QR/a6he5oke9lcizVjVm4zWErxyanVhEW0TA+GZ67pg/XZ2m3+XhNE6LkEAp1O7tbQmi3EwmqNsjr8GGOpqGm8ZvIb01BDdYxoTLmoDyPS2cceYClNgY8KpdEYrXN0UYoMUTA3YyrqFPVtybS+DojoOfF6PHTKecCZm3lffYJC41mI+HsKrfKZcwEAleLl9MmkGc3dRpnxqhHU5aADCjXKpCwgcQZ2PzTZ8GT9gCXOnt+0u0/DcT6Jx6IfFk39vDZQuP+IzcF7nVKlTcYhk3pMfDzPUgVJJx7LNv+kKyJ4lIIlJkZ58JyfKwTF1/aRPROkrSdqLvQd5P7uT/ZHXuQQuZ7uDZHSoDmvH3oiRVVkARMBgpBuwZzQw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(82310400026)(376014)(7416014)(261102123227099003)(261028144727099003)(261021123027099003)(261026140227099003)(56012099006)(261021121427099003)(261009223027099003)(261026121527099003)(261022105027099003)(22082099003)(18002099003)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mlMHyVVjFFGqASOXe+ogX2lNjGKkhb7h0OkSBucI75DuRnR5Seaaa0fH7kE+CnIInmuYpqiTt6F+bpfR2JVUqjn9YP36qDVQdDjNjcoi7/h9/twlkSZw0bk69a1B2xQEjL7NRagnXEcmMtbdj2hWgQCB7WwpjhcQxQUzVws8A/Crh7pUvFWgxMrk9J4m9JcYJolfaSX9XcVgSVx/kbNHUTreRWom57Ij9hFvKvFF+i67nGbqmq6Xsf4sx1f94sm0iY+Pcau7WAD79cgV5EgoTywxTqvt0Kgg5mic4p2PbmDlhz26MtjoKSeYCuXZY5GseJo/cZ97S17LwapIArbd41x/7NRbWtgT5vLt4KYcQ0KVbi2OaCxpJtVCLU9wOsHR/yhMxC5IGsxSFndlKUu1eGR3NWKhtMtc1V0p4wcde37qfTSYDXr1UuinONbeJXy8
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 01:34:54.5748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b10f3f-d27f-440f-41f9-08df3ba628f5
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E5.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6621

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
index 52f5242ea332..fdc4cd224579 100644
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

