Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.94
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794908624;
	b=BjbMpyhCCj4UQ2eS4YrcT+MkHilKcndn0Itq0SUcVEjk4te2G/hoplEwylKcyz7GAM47
	 xKUkC5m4jEJj0ralzsvMzxf7vSkI3bjrquUywWnzdJR4eUm3fDgpME45QfAGyuN1X/Jzt
	 arXA3DRie29qj57wNPE/XmiohYwr6+39c5QM17w75QxGeeXcFAo9koLp+hHfJEZKLUxQD
	 UhD9m1pW+ECVLnnP1u+f4AZdwkO0UrC3qRM9XJKoOY+m0SeGxpeHo89//DkeEeEr7QXlK
	 Bc9riL8A3ukkiAgMJscM5EWn/NHwyZgzPPLnBw5PHBVuPQ97GVwSu6nW0NZDH/BJcOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908624;
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
	bh=IdfG0Ah+gx+e2ccjhOjvqMdzKHZxTvlHcyZOxbp9V/Y=;
	b=hV/bDMx9E0XWfnKm+irgHgWbW9DZq+1AsWP/j+2hJrzax69t9OVRdELyQjAYivUpLaRX
	 21YDZ08jNuGZMYPZnauu4dbyo3iJjmfBoS0Zk93fnzDKZFIbHzC+7YTopzIkcSctlIQMO
	 nirfZdm0QU1yACmIVLnp8mX0Slmzf4vySwqPK6Tybz+AYBa2IyzSGTgmf283fhK6U9EsP
	 wUQxyb0ETeXqGUM0hsV9t5EFdpKAVF1V9QI0rv8/tUcNayAPh227crDX2zwAAJh17ZYcP
	 uWTZgu+6XdkORotfRoCj+BP2v61CAQCeXVMtUoHCUNfNIJiZJI3Ylh6Lo534kUec9+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.94
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023094.outbound.protection.outlook.com [40.107.44.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ACB606A33F;
	Tue, 17 Nov 2026 09:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90ACB606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHjnf9pezQEtpNfT6jxicG13VFlMo87GG4BOkJyC24cVey/FNvmy+tg9yplMU4EN38u9StjLdFczf33hUUXOog8QK7aLPf1ZRN2alZfWiY7I5HHOn0OStzrimlumfhvvFD0f6tPUrCsqV6JOJCj14I/n6pilq8rizgcXGBSJ5r+gDtVJ3YYf7m8qj7C+ZDZDXxbpzTKv7yoPZgwr0SVE9ncWCjcN/TCTGcyWe70rQbCd4k6QNfo8GQrg3EqMwHtGuCrN8hsNtwuKT48lo3lbjOVcqbKn6szN9fd+8pIdjzZdpuc5OXfEPlECu57109aqAIdKYptpUn0vGEmzjyhXMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdfG0Ah+gx+e2ccjhOjvqMdzKHZxTvlHcyZOxbp9V/Y=;
 b=vzQ4oYLFXmnAZDU+Mm4qwkYCGdrmAx4633lhp6vMhp4RHj4sJ3Wj5wDkPdL/Y1a0UWcA+WnHxCALDdc8gCAV28m3wB4vPhoO1l3RXC4beW/ql6m1BMWQUwyGt3RC6CdIdMDjn9jJ8IWLWCIDma4bYDryrHnntjirz6XUjAajimhH6VpwXPisvZkuX10CGTe52562SuM7z8b92geNjtz3Y1CUqmlKMtGJvCYkqrP2Tdj9QKgIkJwYSet4gXz0tbW8W4mDKxX8V//aIfVfebomrW/PT5+z1+lFcefoQMB5mJzieuePpkWY3UCf4qdiYTwxMyxvqwmuFQZvO/vH6t92Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR01CA0128.apcprd01.prod.exchangelabs.com
 (2603:1096:990:54::19) by SE1PPF12339C7D1.apcprd06.prod.outlook.com
 (2603:1096:108:1::409) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Tue, 17 Nov
 2026 09:43:40 +0000
Received: from OSA0EPF000000CC.apcprd02.prod.outlook.com
 (2603:1096:990:54:cafe::a2) by JH0PR01CA0128.outlook.office365.com
 (2603:1096:990:54::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Tue, 17
 Nov 2026 09:43:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CC.mail.protection.outlook.com (10.167.240.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 09:43:38 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 1BEF340920E2;
	Tue, 17 Nov 2026 17:43:37 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com
Cc: devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com
Subject: [PATCH v7 03/10] dmaengine: arm-dma350: Initialize channel coherency
Date: Tue, 17 Nov 2026 17:43:28 +0800
Message-ID: <20261117094335.1393735-4-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117094335.1393735-1-Jelly.Jia@cixtech.com>
References: <20261117094335.1393735-1-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CC:EE_|SE1PPF12339C7D1:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 06283ca5-a046-425e-e546-08df448f422f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|82310400026|1800799024|36860700016|376014|261021121427099003|261102123227099003|56012099006|10067099003|22082099003|18002099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	6ShIsGHXWLz1ygk38UDmTpuSEUo0hhD1fRIuBncf+LcMuC28U3lyF+k6Tpi8FK/BFuq67C69KDb/UG/EsGLImmRpl+BGjZvZOF4ehdmidt9CMEMuedeOVoSCJHGngZYWHMrZEHI5n/myu1n0yEL6Kfp9wK2l7bklcXi7rBNfZnTN3YQLr1Qtc1IBF9HVr9GJdF2buuuPwFhLsoP8lYl5B766SPmxxPRrUiBrhE2pmPRKGovmgc/ECXsqQTzpYc279WJCO865Mors+VcGvebEGzWWNX2bNm2/THD8rPj445yQDtCRYVF93XM85A0M7xbp5Ifv3fo0R0v3XP6gX+KXEml1VufuyY050seI+yiIp9biDmqYUc7VqH3mfgcaRJzCQcTOD+W1TF9Avsf0VnlBw54jxGMBDwOE7zZFXKCpwCi35b181qp1kio1BjVTGhvlGU7fDHTqDlvwd6aSFlfet9y9rDWlN4hLADqAdPKws9ORTqrLbeqHIwkGPgh6fhxvtGMT+oC4drtWwRK77d9q6OP81HJPlTzo2fg0Tw9b/e1IHXzT4H2ZFrs50CJoLD9BrViEg8lhrA97AZ8+4RE9IR8zNUksI1+r7eZeBviQV/39KPxFJHV383l5MsUuHvnk6aiNuMq+Jeqt+hQTpfreppb3c2HJ9xqP4QsuAc7PniZkTI9UpRp19FRHs8JnUlnr
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(82310400026)(1800799024)(36860700016)(376014)(261021121427099003)(261102123227099003)(56012099006)(10067099003)(22082099003)(18002099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	L6g2qZ/4eu3GvyNDLvplMNcO4H/Rx7PNNx+XS3hzG6BMX2U4u9GhIM3t6+QLmxClhr95EedyLV1Abfx+n2x8vvI5mizffZdeijExMyyc1+6RaTtjPBWpOm8AaZR/wid6pr3jMqjNVO7NW05PERXubrdvjcQnIw9Za5pfYoRksXu5nbh5hARt9NhuO41/nhUAfl5mDoHazJ7/N/qFxLQf1zJCBNiU5q1yz1qEQ8CsjP+bKDAKRl5Y6qhsgYFgt+wKq11oj4SB4Gsl9fCwo9xmCjsGAJKLIc3ljztw1ngV72bNNztzWoEJm2WX4lhRZiHo+FRYWIXzmyZLe3l2hAysjjrYIsBx03/y1wR0KjpGl43KYl3btXvWJjLNEwVO/2dQbQpoI71LUDZpLkUZl2gsiXy88FbaYrGrpWLNxekBbPX7kRjaBtSaQn/Q1So8et5o
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 09:43:38.8743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06283ca5-a046-425e-e546-08df448f422f
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CC.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPF12339C7D1

Command preparation chooses memory attributes from dch->coherent, but probe
only uses the device's coherency for the command-link attributes. The zero-
initialized channel field therefore selects noncoherent memory attributes
even for a coherent controller.

Initialize each usable channel's coherency from the DMA device attribute.

Fixes: 5d099706449d ("dmaengine: Add Arm DMA-350 driver")
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/dma/arm-dma350.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index d9f1d2976034..266df7923d7f 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -625,6 +625,7 @@ static int d350_probe(struct platform_device *pdev)
 		reg |= FIELD_PREP(CH_LINK_MEMATTR, coherent ? MEMATTR_WB : MEMATTR_NC);
 		writel_relaxed(reg, dch->base + CH_LINKATTR);
 
+		dch->coherent = coherent;
 		dch->vc.desc_free = d350_desc_free;
 		vchan_init(&dch->vc, &dmac->dma);
 	}
-- 
2.54.0

