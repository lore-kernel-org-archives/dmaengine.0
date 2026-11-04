Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.126.94
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793796624;
	b=vh0ZPs3MRwV275PttpFcAtmSmVACPT7wJk8dkugGsm3OSdDnJ/RMgYk+AtLKbhmD9zWz
	 6bbHMAzJDFZDFkAhlvLz1NVbghYx8U+A/Sn6SpOyDRQZsgBt8bSkBqfXAf88EGZbSGuUH
	 5rv1M01KhtzaQANTf6FMEB14wUb0aFlA2le5/IVrnACdGOJ73+FmrNJaswRK2q3uo+8xU
	 F0VVVk29Au1zeXApnYx/VUbBiBMPeJ9vjeMl67vJzjfEGXAGrmlIo9cVwwUosdCPFEA2e
	 kgnIkKQ12FFcZ7XdW41Q+N/jRp70XiarJJ8HO5qoZ1WugrgYtIjkZMdR1SrsWHE8djA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796624;
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
	bh=M5O38IyefLS0AYgXYSj0xczdGJPrqgEsGDgdyw4myDo=;
	b=1vQiubMI3zLs10y73XDo/+VdBHCpJpUxIFOvbfiMx4QQjGkDfs35MLtZ1rcV3Gm6GCiz
	 +zskKJHaQOzs4vAkMn91kLt1QepH96swJPkqkdz+lZ8ZO0gVwDZHOUb/aZyEf5ERoBtp9
	 BfxN6NYxHYCgo4uysmnNxf0LNWGHWcEn508jqykSOs9k0Cey/0cg8UowW6QnyDyliASVh
	 drFzWy9gmZl1rV6lCzuO7GIulpOatRf0YGxMvRgEzLosF1bIfqYGOFpSPsGD0OOPle890
	 AQdE8x8H429ELDGFCcseO4qdC6hptnwPusk4zS9ySMVhLcqSTXX8Y8KQdgBUTn4Bcug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=fail smtp.remote-ip=52.101.126.94
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022094.outbound.protection.outlook.com [52.101.126.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942E8606D806;
	Wed,  4 Nov 2026 12:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 942E8606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c9SKjFMVftYesWPs8DPOYUIWEE2CR1tBaWpJBntF+jr4162sGah0S2/u1VH01r7aN/aeOTx+rZpJ1hrxd5Z4o9W4t9RKaHq78lhTMpVrfjVZUHBnJs6xXtSN4/472+JD5wBnApQz+KhWVqUjUdnQmEuB7GvC9xbBbNdzpwfi3oP0F2kwi63FSoWH7yGFkbufq/Zsg/E2Bhs760FtHdNKc1VuS/rR9hoGYysxA5B8YaIIAS5pPwY55lLI56z2GkI/t8R/kbOxw7s6ICCtj4YGhGUwsr8TtFIb/MRPdtMRZipqc/e1oLHImFnCqE7FBYavWGy8DaKxGxLcc/oeS5b0Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5O38IyefLS0AYgXYSj0xczdGJPrqgEsGDgdyw4myDo=;
 b=AUkVObqPL0ho98rnxszJQcrrp4zQATiCqNj4+W7ZzYfUeUqfcbno3KtXEJ38ZNAwSRsscLmijjk8eoCqzL0FuE3RS3p9b/qU6YTc3ewV/FD7nLMTzefDaUJUQTzQ5Fz8tCLtaVG1b08WKazdhyf96HFqklyJKBYi0DqL9hxqiABzV+RWWO8y2ENL1zDjmXb5qhFPrG0zfHCN8FHDK27YuDuwfIo2gbI5f1JFqfTVMMvD1+0B0MeW4wUcc55hteXE0yfr4ltJK6TIKgkk63Bt4dxE7829rGxsdhOlZ5NpQFp/1KduKLnnF81GxYc4y62AmQPYF/mbWjW/JwmGEeStdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0042.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::23) by TYUPR06MB6080.apcprd06.prod.outlook.com
 (2603:1096:400:344::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 12:50:19 +0000
Received: from SG1PEPF000082E2.apcprd02.prod.outlook.com
 (2603:1096:4:193:cafe::79) by SI2PR01CA0042.outlook.office365.com
 (2603:1096:4:193::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Wed, 4
 Nov 2026 12:50:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E2.mail.protection.outlook.com (10.167.240.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 12:50:18 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 40F2640A5BF2;
	Wed,  4 Nov 2026 20:44:14 +0800 (CST)
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
	Jelly.Jia@cixtech.com
Subject: [PATCH v5 4/5] dmaengine: arm-dma350: Support integration clocks and resets
Date: Wed,  4 Nov 2026 20:44:10 +0800
Message-ID: <20261104124411.296640-5-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104124411.296640-1-Jelly.Jia@cixtech.com>
References: <20261104124411.296640-1-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E2:EE_|TYUPR06MB6080:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 28d2d5c8-e76a-4d66-c66f-08df3a722e5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|7416014|36860700016|56012099006|261021121427099003|261028144727099003|261022105027099003|261026140227099003|261009223027099003|261022075727099003|10067099003|22082099003|261102123227099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ymyP5GWkhaFCd9kG8IS3v9HCcGA5I+sRaxmK/sSYFqxvDLiIjx6XCYZuYmpBsEQ8uNekJmcPSIRUUIiP087U2RSGAvw7buMkwYc+eJouBGWfnegqRY/E1HHEzKxKFlXSoEeHiKay9WZGyJZXzg6grlBrqdbSnBrCNYtI+XKsna946GJsbljC+kh5982KEq8/mh1cgF+ti0Tef96+Jgrg1IsA13ePdUkkyvDxFNDNqZbGjY8nX4j2lhm2Aaunrj1HcMifdv7dd5sPEZ8GwFmDWPiiMEDglgk2pd6h36T0tbnVQ+Kr6E9geS0iz2j3+OJEY3IjziKQs3NMuvDcxQCIBGHwtmaRNVy7/b0SGL0OcHzYK2clK5t4L6Oj+qPKXLQ3JwRqcueHqxE1zrVSijgJA8/IymXLLuBtLksBBqjruoKR4oD825pa2IY8WBaO8Xayb5X7cbSpPmF8xRORaE+/auw/L4e4R7S0SyavvWLFnmGSUtYf0FZYGCMM52wZXJLBcFPXoWwVQNYF2HIw30ap49FBeoLMqkAwDq2vWpIFg82ZmqSU7kC2//o+7rXxFZPyDJn42SSwbfRF3ft3Rk22yogsZEY1hzph0SIxq+sv9o/Y2JEnk1McSq52Ek3YJJIVLBy+qGjLSI/+7EbA+ZhfS7/N9iaIiB6l2p21HOW0afSIorML2+PWgLmkd8XYOhR9yU98+Q99faORuhFUXP3n0w==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(7416014)(36860700016)(56012099006)(261021121427099003)(261028144727099003)(261022105027099003)(261026140227099003)(261009223027099003)(261022075727099003)(10067099003)(22082099003)(261102123227099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o4CaU52OKedh/Sc79tXSqL6Ia3tQVTx+KvXsbWqoNIJjbq2zbSvAqUQFZVSI6UsOwQpUbzsXNHhZabRX3Ja+h37rXDfbz2URQ8sE4hY0mWd8dOu7xQascjRxClXC4D50380GOYDetd1d3RLT5LApRy6dwwY1d4p6NeYMrImwDd6OdSMcsbplZGq+ap9OQXPTV3phUSJLoRaiuU0XrB+XiUpPH1kiMj0UxLb01JoGwH4AtBHjwKfXOAO1PucGB9fOUeoMm2Fi541WgmcR/tbgJWyQYrdf2fJfW/Cu3gnlfGyjAp8QM2jdxOOAOL1zq6Rm1qCox0oKSArsSkai9aVI8iyiX0YypF4jqALvpUxmjhDSuMaFDPFpcnF5HLDg0+y6CNdh56Ulav8/gub4aXBiGM5Pz98t8BPpbHvgNS0cQrjiz444F6qSh19thoYQoYug
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 12:50:18.6670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28d2d5c8-e76a-4d66-c66f-08df3a722e5c
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E2.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6080

DMA-350 integrations may gate the controller with a clock or hold it in
reset. Enable an optional clock and deassert an optional reset before
accessing the controller registers.

Use the deasserted reset helper rather than requesting a reset pulse.
This also supports reset controllers that only implement assert and
deassert operations.

Both resources remain optional, so existing integrations without them
are unchanged.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/dma/arm-dma350.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index cfe3bacfab68..2f22f8a0ab47 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -4,6 +4,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
+#include <linux/clk.h>
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmapool.h>
@@ -14,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/overflow.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 
@@ -1247,12 +1249,24 @@ static void d350_free_chan_resources(struct dma_chan *chan)
 static int d350_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct reset_control *reset;
+	struct clk *clk;
 	struct d350 *dmac;
 	void __iomem *base;
 	u32 reg;
 	int ret, nchan, dw, aw, r, p;
 	bool coherent, memset;
 
+	clk = devm_clk_get_optional_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to enable clock\n");
+
+	reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(reset))
+		return dev_err_probe(dev, PTR_ERR(reset),
+				     "failed to deassert reset\n");
+
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
-- 
2.54.0

