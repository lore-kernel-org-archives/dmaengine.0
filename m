Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.136
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794908625;
	b=1kBGJRmHnQsrgPyui3nMJgl+Ws42yDp7XtWd9OyMbZWhWclqMimeYQVC9YtKLDNzbpUs
	 sb/ZFfjlQLIU1koX1MiJpNTkXj+t3DVzE8RmOKcVZfnrKFW8bQTYB15c4ljrFh1bkGC2U
	 CQW10BoYVWhJSAor5hP4hPgo0AkK841x3pZbCl5VtbYIShEhGcadOJe+R8Lqs7GYp8zaM
	 QZL9DlSM2Hfn5Tjue+1EXwRk25Z3WqdP/9rQRjWsBSRHeU8IGt11pb32rGPtTz7fynRx3
	 fBpLzxwJcAVme7EITzyZchHhdA39ww+z/AV9G8JOmWbXFxgzGQBhwNZAZVvmwgGVqyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908625;
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
	bh=DIyH95MIfkq090Bd4q8r4oTLA+GyVUktGIBdtD1Q+Bc=;
	b=XpddmgFc6RStlRFLi3gGpsI8TH4j1Pie8XfHaX7ak1APjSHgxqNdTN+IRtZFmXH2+qtv
	 ZngtFpnEd20sgHwuAu6QpJFN+O79Q3iZhFLwh4CTt1CRzaUU5+FINw8VPpK6QTzw1gKJj
	 UczAv/ezueuWM1Mfn0m/QmkPQY4at8FAQaDK1dldGdnzpkUl9SUMCwDDxzmmadUkCfRyR
	 7pZOP+qKD+T6hTe1g0LfFkzS2lmcLtFc4csuqiIJWofNbopBxU9kRDKgecM0CdtcmoIRu
	 Bjq0+3f11oKVUH0pqvJtBWYZdMlH8UIK5a0Pe3HpffAlZsw1OilrDIJrfhbuIiIx5dA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.136
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023136.outbound.protection.outlook.com [52.101.127.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1398F606A885;
	Tue, 17 Nov 2026 09:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1398F606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GMSwyU4/tWU0nh/FbVj/hghxXFFZcHWRBgnvQ6Gy0mkkafBSlDVojpE1/vxnmU/QMwyieFnZr5snxy4vakfxlractB9mGItBXDwes2r1aXHRBOEvVbtkCFqislTS4kYTP2Nr2CVa5ndINB8LXYcnrTg3QVaNtvWH6Yehd9uChatbrrFV/WDiUAF2nzAXKJLgKwGovdyLT8GPNvVa8fKtphis2qQ4y8l1jwrisCp3591k5ceyiU3mmpJbyZMjhRL763GALc1d+M7Yzw9/XGXnDOjVm58g6YuzV0FNv0xFgBGN8WtfZmEhJIqb+8wrm6qZHxubZ+xrRGWKbnSeC6dl5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIyH95MIfkq090Bd4q8r4oTLA+GyVUktGIBdtD1Q+Bc=;
 b=bKBQVqLrqFs1l5UBY3QCjafByAdBUewScVsXvkTDMXu/4uI0D59L8A8NFV9sn6YltocoKKR1SSIqe71Cr34UI1WZsxNgDk4tMOZhai//cmPmaTE+qdqo2YXIRnoHpkhICrUykR6lp70naJs17PsachGZ4hgW2C3R+W8n8LdAwoPFUzFfe9Dj+lv8WnNI5EDIS+psgFwlfelwiy/9ILJnkbSVkRz4opC488mvXU1jXWy1QxJTPk+xJbe7V7qAk9WkKLFT8oSlDNG62/EPfqm1vAVRSA57esJQlYEdUDGT78xuX5idUs20K7+QOyr5d9r7xVMor+wyAnsM1dUesrxCIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY4P286CA0033.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:2b2::14)
 by KL1PR06MB6886.apcprd06.prod.outlook.com (2603:1096:820:108::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Tue, 17 Nov
 2026 09:43:41 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:405:2b2:cafe::51) by TY4P286CA0033.outlook.office365.com
 (2603:1096:405:2b2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 09:43:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 09:43:39 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 21B0D40920EA;
	Tue, 17 Nov 2026 17:43:38 +0800 (CST)
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
Subject: [PATCH v7 06/10] dmaengine: arm-dma350: Use managed device registration
Date: Tue, 17 Nov 2026 17:43:31 +0800
Message-ID: <20261117094335.1393735-7-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|KL1PR06MB6886:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 80455db8-dbee-40c1-1eeb-08df448f42c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|23010399003|36860700016|261102123227099003|10067099003|56012099006|261028144727099003|261026140227099003|261021123027099003|261022105027099003|261022075727099003|261021121427099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	pt4XzD7RzFUoUX0y4W7AEhvAwv1QDAOQaQrEgMMyvL5B01+e1k4iEi/ZfLHLLsqS5PUQy2xc0iH7fD4lwD0TQVx6lU/KMtGlngofEphRyuWSBj1x8AbMKsbTwqFHG+fd4tldQMUOUMSycElUeIN4KT3ZbM44yw3kGzb2Kku72e0nLA+tYO5r/Se8JjyeCJ4sjeh6kLgxv+Hq1i+/4IDVw9G0TpFr4VLEOIokv0NFKhyU0pONtIJvK5Gh0WeoL15hCzX3oe4m/CtD6Tg8dm5/d1gR4uHzzTdEK/MgdZkG4YEnppvfk3ZT2ZX2STmdw2vYReDSf5ZBmLH3kGruPyG3j5nTipq+i47IOYnIEgxp1d5WN7IGyUv9A24F3gCg8r1rfl5C6tOvKVfC3T+sK6g7IsGPsnQEXPDED8A5KVASHOsDZl/97yjSIjTuOSBH3Ie7OE9yBdFu22RXi40tf+r6VYbow3US8s3iirAK3Vu++nQbHPSCSXY1ypUjkYO0k2kPgtq+dqVVsWPWQwz/EAekhC4s3D4aeILsRL4SjW0Alqy2oL8wAFTDMm99BtKrvEhg+TDoP5EdKC4qN0VwP5KHxVMG5dKZDCDfr3EY85rLPdX/Z99a8LckVRb3M0Z+Ql0LovVzGen3PMBY57qWFNaI67DHEkZyss7Pt/JrP2lhKDy4jVTmR55lWbZiRoGeolX3J5nxCjJj0QLTjzn/8xJwJA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(23010399003)(36860700016)(261102123227099003)(10067099003)(56012099006)(261028144727099003)(261026140227099003)(261021123027099003)(261022105027099003)(261022075727099003)(261021121427099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	He0isCDV5nZP+8GzTzXOvNDVxGmxWyWgu+WqV2Bh/ZXrPJIOXRTm8cjy8nZcPrUtWl1Z3Ejk27O79uG5kDtPFD9wFPcDZQMGDt2yqqMl8o4xgmPKgaY+gaEtlAYruFm8eqVppFptR16wzNP2GzajlL8rDQhWHu8b32Nch2Mda0rn5dJ8KUWYFeZbDVQyTRWDTWBE3xaZTHEi/T4HG/EeGKqA82jnIcZ+6fftMyYMYwlIxVTD0YSj/Z3CDnOi421TeD4TcvfMvyIP39+DKv+Hg0Ck/74p4gAuINQ29xahWf9DB0puLfpYrR70XDHc1/EP+CTY6qkP+hLs9T4a2qnVZjvCA9ww/ohtFP/wpqGlRHxW9M8ucKtTiOwx1D8FbyPylJRT7r2yfYup1M2C0+Tje2fZAkVpWw+olAB3BK37WDHmUL/xlk1cWf9YVpYF+T6k
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 09:43:39.8752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80455db8-dbee-40c1-1eeb-08df448f42c6
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6886

Use managed DMA device registration so probe unwind and device removal
unregister the DMA device before its managed resources are released. Drop
the explicit remove callback.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/dma/arm-dma350.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index f785251935f4..bf87460c1c20 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -690,20 +690,13 @@ static int d350_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dmac);
 
-	ret = dma_async_device_register(&dmac->dma);
+	ret = dmaenginem_async_device_register(&dmac->dma);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to register DMA device\n");
 
 	return 0;
 }
 
-static void d350_remove(struct platform_device *pdev)
-{
-	struct d350 *dmac = platform_get_drvdata(pdev);
-
-	dma_async_device_unregister(&dmac->dma);
-}
-
 static const struct of_device_id d350_of_match[] __maybe_unused = {
 	{ .compatible = "arm,dma-350" },
 	{}
@@ -716,7 +709,6 @@ static struct platform_driver d350_driver = {
 		.of_match_table = of_match_ptr(d350_of_match),
 	},
 	.probe = d350_probe,
-	.remove = d350_remove,
 };
 module_platform_driver(d350_driver);
 
-- 
2.54.0

