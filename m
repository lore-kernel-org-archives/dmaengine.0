Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794908623;
	b=MK2YjZnT5SoGyD3BbKPVDzv8gZZkcnMZVnSb3gMA3kBDocnycilKqlLDfSDZCKu92tqZ
	 b7nLMviUTuQvIgF7EJuKZrLDP7viZqSsJ41Mpq9Dm9tzNoAECE10NOVJ1yNauG38O8091
	 U9/eDq0yM9qpqLdotZZT9vItz2C9Q4cN26wemN7Cbes0jQK6nmtk35Zfaf+k8uVkJmcC+
	 MaAcAGnsjPu1dcImGQ8nT3tbMGiY1vHsS6skg+5JRWCeemr8i4fxBmYpULSYr1lXuREDm
	 wix9iwL05ZGW4aQjgwQv6KqcElhZpTErpMxPjEd2P/EE6iHgsXCCqK5tco72lmrg42Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908623;
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
	bh=mqt+sTE+Ac8kEfgR9z/P2bfmCk+NXoe84nbYNhSZO8c=;
	b=HboDNUI6+Q3ou1YNRglI2woWUNou3aJsCNXzIaBo+qdZcJsxu2k4bnydG7k3jgAfB2Zs
	 cFxAqcDr6y9pGPZVEvw/R2LKJ9ByPKCKzJuBOPQxZ4TNJAJTpIuyQEWigRQ3k2Pr+OYm6
	 r8+RX1R9lfM6O23MXqu7aDGMjLGHoIChoaav46of2AJJFhC1vU2y/FGeQy/ngM6SSlQiy
	 okC0SrZc0OXfYyILcMA+RV/FhgnWZLQ9Xq7hZq0NCwzTSfAVL9u72Yj/tpUA28kW6Xf1L
	 EcZE2uvrF5qBtxUJDbXlNHf8614CTkuSVvlpdt/U6+9FnvPzX3h9qwoZSLvFx3Az/OQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.124
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023124.outbound.protection.outlook.com [40.107.44.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CD7606A323;
	Tue, 17 Nov 2026 09:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23CD7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rfhm8++qQrTlPEsgHZeDrl4IPh7+NDX27frrQaarXWlNsO+AHE7M9P3U9f2WJy34ZRT+GkKhaQE2qRYyCxVpqHL4YqVsfu/4wjstOGGleb9zfPzbdkhoK1Vh170rTXEVLrfAsAoA8TgudeaNxg2SwQXZdvRARrQxFqSRCPESQELYRftSRVuLaoKRo8lVwfzJv65OJCcNXcZsFYsUZvWtUSZAPU0rYHF09HMIMkorL4btMLrxIe+b5trUQ6sRs3tMqnHZPTFgnABrFcKmYe4uGBjXgvGdDUve6V2ST6hjgCnkuP6FhdlM+Kyt1F3KPXPU6mUJskFc5DNHSDbYzK650w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqt+sTE+Ac8kEfgR9z/P2bfmCk+NXoe84nbYNhSZO8c=;
 b=bkUaVZxSCniXTdpAEVmi+k1aXub+xGwwG/X1QElgSzta45YZKPLnWw2IL5ssVkTpC6hT9ZYuE17T+5s4Bm4yHDkm4jPoJxD/bHQd0eY2VeQPfONWQA3Jzj17nszHW6z3ze2F6fv0YuFNK5VBSoJJ7hHT9il6csv2YMmVv6YNBwcz4oO6CmAKnpIH8EJKMmNm65W4tToXVpL9fcrdp2OAoiv2Qy0daYqg2StgQIoUXrr2WloqTJoEVl9s9BFLoEINOojy9isZHfEwCY86K30THhhC3+QSwQBgNHjeHQBPEpCK4jy1QEQxTYgQZzHQKWvPUryzvqAH3R4reQk8L2uSdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OSTP286CA0020.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:216::17)
 by SEZPR06MB6350.apcprd06.prod.outlook.com (2603:1096:101:133::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Tue, 17 Nov
 2026 09:43:39 +0000
Received: from OSA0EPF000000CA.apcprd02.prod.outlook.com
 (2603:1096:604:216:cafe::a3) by OSTP286CA0020.outlook.office365.com
 (2603:1096:604:216::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 09:43:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CA.mail.protection.outlook.com (10.167.240.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 09:43:38 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id BC71640920E1;
	Tue, 17 Nov 2026 17:43:36 +0800 (CST)
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
Subject: [PATCH v7 02/10] dmaengine: arm-dma350: Check DMA mask setup errors
Date: Tue, 17 Nov 2026 17:43:27 +0800
Message-ID: <20261117094335.1393735-3-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CA:EE_|SEZPR06MB6350:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b298bb7f-9982-496f-f806-08df448f4213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|23010399003|82310400026|1800799024|261021123027099003|56012099006|261022105027099003|261022075727099003|261028144727099003|261026140227099003|261021121427099003|10067099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	gwiOuh2C/YgHF1RVJrICMIZn7aQvGKYruHKfWonYDxFAJQh9S93g7GbhyXVYO0xQp6J7AR/ratCdpANpfN8Tpcu3Ilcy/nMowwXlQXLjlG7pg6p6RHewPF0k4iEZbrrvlO5rt7ez4fxEsYs/9cUuhlRpPD1SHf/3MhYE3bys1yJ4jHYj9u1FBh9ZCSd7VOZPvbfkFsMbKV/RdTJ2AzGEfXpqoUY1vExKyJvHy2g/a+japra7EUrWZzoXTtc94im2QcG1gfMOGdAqD6sWJc1/hyU0gtGVMaTXS1Mqvok9KBpa8h1TqNe+IZ4jALEpOeHaC/i/kfKZVe7Nmmph0/JkZ2WAYtexO3gfHsfat+HPup9TuqsDIeBSuswx4PdncrayUuW/cLU0adjcitHnYcpkf5LxVIGT1sxWm/CQInbfCvl13GokbmAzsjgJpN+ajlOINHyJlt1dbzHl4v5PTF2xbOQOVIGKjsq6pg0q1K7CISkb9LTIh60rAcQL3KbTVQWsIdhvwAfU6PuV7s3BnogsDRtfuQ/f1cPbyZ9/s32KQgSaFX6Q1CX++ZoAZg0VYNOXZOUdhUHre1FdM0UqttIFIvN+2MMav35wpu97ajtVQ/2coccUAE8eWucCIm1vaCR9IEqXVXJ48wQWYzSpJ7lk1WrhcDDYz4sxcJUQW5MeomYins6XZNdrTguJTXwUuksjkbXmtGUDYztEXNrLEZdcwA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(23010399003)(82310400026)(1800799024)(261021123027099003)(56012099006)(261022105027099003)(261022075727099003)(261028144727099003)(261026140227099003)(261021121427099003)(10067099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CBHFvv8LxJYe8AeYkBSJdTd3YE8NF38TWTgoN89o1DqLJQDoN+oIjmaE8XDnZa+MZMptgk4CCEPmcb5OyhNg54dGa9TtKg9GQ9IlvNuyD9JBVjTXVRRLyn34pYSFwzlWlHlxzU/erf4poeiansj/WxMyaniWaNrf4KZOK53VrQzIkdsvcd4OWUzz/9PcqODJIMY9xrxdge3YMfNmQPZMyCb7YETsP2EDMwEvyl1aR60djsmvFIU/XoQBA9Bqp9/GHjZloK9fqZNi8BJ5uJxLXH24cqU0sqxT5SLZlK3RpBgwWI4T7G2q39Y0+oTxMvwG6rI1ssQViaV2hZyFuh0xc2QpBeOEV1D+iw9AAz7yAZrXUNk5D6SyXCZu9qsmBLDDBaOqaHOxDaKTLQ9BvMv6QTiC48w/o315xGHYPsUieAgDpsaz+jweD0l61BpCzqPI
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 09:43:38.7111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b298bb7f-9982-496f-f806-08df448f4213
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CA.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6350

The controller's address width is used to configure its DMA mask. If
dma_set_mask_and_coherent() fails, continuing probe leaves the device
registered with an unsupported DMA address configuration.

Check the return value and fail probe before allocating DMA resources.

Fixes: 5d099706449d ("dmaengine: Add Arm DMA-350 driver")
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/dma/arm-dma350.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index fdc4cd224579..d9f1d2976034 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -553,7 +553,9 @@ static int d350_probe(struct platform_device *pdev)
 	dw = 1 << FIELD_GET(DMA_CFG_DATA_WIDTH, reg);
 	aw = FIELD_GET(DMA_CFG_ADDR_WIDTH, reg) + 1;
 
-	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(aw));
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(aw));
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to set DMA mask\n");
 	coherent = device_get_dma_attr(dev) == DEV_DMA_COHERENT;
 
 	dmac = devm_kzalloc(dev, struct_size(dmac, channels, nchan), GFP_KERNEL);
-- 
2.54.0

