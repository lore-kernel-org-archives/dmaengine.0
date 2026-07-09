Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012064.outbound.protection.outlook.com [40.107.75.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1797743D4F4;
	Thu,  9 Jul 2026 13:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783605599; cv=fail; b=AqimfIOat18HOrFpyaHZZLdUBo+5XcuPP4s/SY4bxKbfl2XDX+pKH+6YZlgcmruTQMkb1FyGNvxpLNO3lh/gnhR6DbMPE+FQrXW5WwvjnsDVA6wTDJzx5coTZYNwHfPVEi1HlL6Ml0WWCjSSgp6oLXG+3PLtkCumF2aJpnoisVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783605599; c=relaxed/simple;
	bh=nslHEg20kNHwqLXtK+ZGywajcK1/mqK3+JS9ykjPegE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FBqjY+d5/DENJNoWjlLK4T3IENAYynN3A9zuDGh4HMfoEFEe5RENIVcGiRlvNv0dbKLBLnK1iysvq07IMJY1OtIQj95YYkipbYTWsWr0V8DZDtKFoMshvST7hD4adcmbf9sEuSIq7luvrrFcuenCXmKJVENUvKLmdSE3NWoyTZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=aeDvwi+L; arc=fail smtp.client-ip=40.107.75.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="aeDvwi+L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wqMcCsvOaJv+BUv5OrGuHTwXTXRzMEYdTys/iQfgEswjsVGNlLzM9nP+AODSJOdydmtJsdnK2CkDGJbQXDQTv/II8SWyDqd9F/LS4FY/9bcXBWed+EHQiQS5kkMEbL9HJGTHbtmdjN8CvXYmNxFUq8Y00gpp7jiEFmIzvAAuZwlD/7t8mY9oL1jr63knx9XFcY52+Diu/CZzuC7BGRphDshd8bZda+DAU2TJofMPEKssmjHnwGuPKdxSL6Wr0B/AcoIhv20p/SYKzD2AqdpKJm+s2+4UwzyT1LrwXdlgFZNjr55aIG9Py8V7qEInasTuQUWwknv2MF/Ebc/LP3T8vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5W0lpRqgHxKmaFuM+fNdUsrPyf1z93QBqO3Xx+VNtg=;
 b=ZFqgoNZRi+gVcoRCMeagY0pU4+BNbVFSeGVfLbgeG7aNN1w4BOYzs0tV7w3VPQfolfc3T15ymY19sTHEOzY1Sn+aNxU4L79EnRrryixfaSHUti1xVAJ2KGvxySLMQ/9bnbSi6EA0j2U8tI8q1Uf+YMJiufABq/mvBUNlJLvYrQODQMXCRJcX9dspsse5CvpaWHm807bo6OJI51F39Gtum7Zm8uRRw2/s17VY4gncru8QFbCCBjNz2XsNWiKMoMwVWM4oCW0qyB2XI8U5icy9mUn1NjtSqEtcqHwaudGizyaITgcCyWMnUbfIJUmN8Zq5SPNb5FidyU/xh7d27O8kcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5W0lpRqgHxKmaFuM+fNdUsrPyf1z93QBqO3Xx+VNtg=;
 b=aeDvwi+LUWCWbW8LWwHM5JAYqoU5OdTMzk1FdDi+/vmwdhRwt5urQDuPEyV/CXdLPE7FsoNu9jIWqdtd9lFIBtG1sBWI4DxQEWXj0LlPP6l8eJbPCPwj2MU2oQ634G2i+N3oZltXG4/HVkXTN7pF+GYKtre9PLqjTOkYrL9PosFAntlUPCY1YEXCLVozKY5up/gKD+5vpFzvQEEEMwe48mr7fZEyVdT+zYkB2xTe37LPHWRSWbZGwcZhs+gIOIE807vE/3HhBDPDt3z76PNBKGKE3IUbEQFEa6Xuer38wsNrwf+Ch55om2oak5qfKv+vjbCbLCJ3OJc7SNMqUmFtfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SE2PPF271E4F3E3.apcprd06.prod.outlook.com (2603:1096:108:1::7c8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 9 Jul 2026
 13:59:51 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 13:59:51 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org (open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 26/26] dmaengine: xgene-dma: Remove redundant dev_err()/dev_err_probe()
Date: Thu,  9 Jul 2026 21:58:30 +0800
Message-Id: <20260709135846.97972-27-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260709135846.97972-1-panchuang@vivo.com>
References: <20260709135846.97972-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0073.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::11) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SE2PPF271E4F3E3:EE_
X-MS-Office365-Filtering-Correlation-Id: 358ac8a4-778b-4188-929c-08deddc2589b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|52116014|38350700014|18002099003|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	9F/f/aLsmKoUSVGu/kBD8Ax2oMjhIfzEskSaeYmxJQ7/FKxywnBVcb5zIoI+gZaIrPo9po+8yjy8xGLf4spz9TwDpgcxwBKRY3C8tZxuE8NCe3V6eqGWZO4QpSVUX+a8EQ/k3FhofpfCxoPY4ajx2qngZ+HtJF131HKr4L2gJ6uEILGoNFK4ns3QbFIvrQCJ3fEG8lBVzYHjnbNBC/MPz363+9x5mUI8npuxKRcvYaNdZk6kCDiqHbv1Lr/4388NcplUUFVWofGVHb06PFqVJO6d+572p2xMgWqpiNm8uNVnBzMqLt7irVS/pEewjCr6tnlfXa7fyp+oyri3edhJzA5GIN5Gg0sv/3KBUrEEB5SeAUSZ38+kGzbV7yvlMqkpy94j102t+sLuEGewjA5sqe10LVKC/j7tkB/jDkDLZ7SOEUlemzZBvRE6Mon4ockBD+TRXkDXGAsOlNi4z0dNwldy5127v1FFaj75G2n03i0VUwPO2Yf79xAlwD7xQYd+r49uzLCQVkVPQzqC9IlFS1HWQxMnb9WzrZUCmCJBNalJTWHNZQy4ZjGa2aBslhoOUs+zCNDDKxMhBHA0oyQxbqY3AhyMkBNB3Vk8Ox3tlc646C/7PgbNX7fgUqmbxEBIkbaBNBZOp/VehcAut1+ZbKP0v+6GxbbiBim6kbZaS/wEKf+4n17rBdFyJpjFf+7gQhiKYwFACY0MCvhioOBR2lngXPxvqboLGXV3lW51E6A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(52116014)(38350700014)(18002099003)(11063799006)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ClcZQ90/mmZ8C7U5IcRr51K5Q+LsrFTt3FVv9BgpmAfS/bxMn7/r6D21fyX7?=
 =?us-ascii?Q?NP1rOOidfPyGXADKAJ7mEKrFi4I5aTSz7YfEixw5A4d6T1HBUEK25/+ImiCu?=
 =?us-ascii?Q?1dlZ2UWJs/SgW2iooYw/AiCyB/sAhUQoBLTEt/bso5gNurjNGX4VmWVGpLzt?=
 =?us-ascii?Q?Ljxv/muxFpPvADEKC+xnmvde55JwEC8HyB9wj+bRG+T5nXE6i514LumpQbbP?=
 =?us-ascii?Q?P9MlwrHl4Z57WarqtUR9KllqQ8oeMYWVq0l6lif6+JRtoGrJ6tmcJZl0F7Yp?=
 =?us-ascii?Q?XVJ+nx29Q3DPZqHtEzkCGmtkGaDdWZ6/nkPcVJSov1lh8sWG/gbiIk9skFIU?=
 =?us-ascii?Q?HSQWRoZfsG6ppzvvxm3XxcAHGXWPxAaNWAUbaCh6NWaW4hfslLvcjf5vFLMn?=
 =?us-ascii?Q?AyFeoCoAWPX2ac5Z3NhhzK/EGrS/MJSAnRkKB836NrRkIDoSaDVvqtdpV3/D?=
 =?us-ascii?Q?h+iJ8J9arXu0JZviLEKLQnhELZvha/ZDiMWU0gwmIx7Z0DAiK4VO4SLM3zzU?=
 =?us-ascii?Q?FG5gpqj1kF/JtxUBx2M7KemWrUQSumBHKzMoCNjBnyQfYMEKwLxCE9mIGcnJ?=
 =?us-ascii?Q?eVLPs+FwN9va4cFbcI8QLvbHAQ1KlpQdQt26TFks8mu3i1HH8rAkZS+F+W1A?=
 =?us-ascii?Q?tIwO4DmDLmjjWBSlEWuUhVAo9epuIQSA5AL9tEqvJchVQ24ou8LC/pVR/r7O?=
 =?us-ascii?Q?EohXzuScyoSWApDwig+bGrGfhU0aTelgbIYukuZBBAe0OxCYhv6dYAAKKleS?=
 =?us-ascii?Q?hMMw5nJH4G5O99SFIMEuz7qwGWeGfl1Z7cOEGAs1+5oTD0Q6cLDU3GYevw+t?=
 =?us-ascii?Q?RLUjBr/4NDbRPtmuQXMZY8Od2Fog5ta6z5GpCsLdKVqrR0vx6uUnp72aTPH1?=
 =?us-ascii?Q?Pa7GdKoh0ONoBOidsdxndlRiGrcfEEMwaqYR9pp5TBA3Cd1apk7yqqgLzoEo?=
 =?us-ascii?Q?TCcbA7CM8lq4/OmFjJByLcEW4Ko5dpbbrbvBPdRZqqfrLZMNAP1JyVn0B6ZY?=
 =?us-ascii?Q?Qe7cBnYTG8omv36XaHMfyQ2GwiP3oanJijV6Zj5Wic3RZ1MkyKxiC/c3Gnz+?=
 =?us-ascii?Q?igc0HtcP3oyDrkfJb4TMVCiJkeajLsPD/YTVoyTGLM8pHpuiJHP3LNdxooPa?=
 =?us-ascii?Q?JWuIqqx5jy76fwHcv1H6sc/jKDe6iHJCEWi53omuUYovrztxODlZY+QZ0FfX?=
 =?us-ascii?Q?pFg5B971Q++L8qZy3mUHpIADyqMrwO4g1p+3MrBHKX+pU5/UnPYaKZt7ELCI?=
 =?us-ascii?Q?3tKIFYOEW01VITJvw7zJqviJkM9QZ/Sl32cHWsdXWi/xMpBZsmcxsYAErqRR?=
 =?us-ascii?Q?WC+SZCRj87EnMsnlRUldlaz5h0AFpYTK795bZxFEgVgi0EuFD/NH0vpZDcW2?=
 =?us-ascii?Q?COwdQX9AV8KlHqSjjr7oPiYVZtfFiT76h11iOoFvfPhsrtXjyLt0o8Z20JIC?=
 =?us-ascii?Q?j0qMhz19xUjUDPyyw0z8nAs7c0F/sxgKRxU67r0CwsMQ57cQNnZUIL3CDO8A?=
 =?us-ascii?Q?Kg/EmtDYsINnlXMiPnWQ2L+xhH0xVr0Tm+4Ye+BudVGtrMtlVDWZZ+6t4s1D?=
 =?us-ascii?Q?9+7fB6uqfM8nchF/zL0lvREr9qEH6gon5/ALo5X1zvl+lvLtJcUYNNw1+b7Y?=
 =?us-ascii?Q?cJZAl2jZ4l9+bIYbhQSSD1n+4D0dicmhe7MHMbtPoBgizWIMjL9GzTVv61I3?=
 =?us-ascii?Q?uZQYHxpWsOYlbcBIFwFqGuTbq7I0E8XjK6u9Q4+245RGh125yzKv/LPXKzBA?=
 =?us-ascii?Q?/ul88kQUWQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 358ac8a4-778b-4188-929c-08deddc2589b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 13:59:51.4741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZDeNKP1rA+rb8NG62gEW/v15kDzwk8Yey3XWnXibfx3YrKtgnyWnhr+32Ayl+4hFe79AONhAVkLDUQ/k6pqEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPF271E4F3E3

The devm_request_irq() now automatically logs detailed error messages on
failure. This eliminates the need for driver-specific dev_err() and
dev_err_probe() calls that previously printed generic messages.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/dma/xgene-dma.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/dma/xgene-dma.c b/drivers/dma/xgene-dma.c
index fa1173e49900..6797a3b84f1b 100644
--- a/drivers/dma/xgene-dma.c
+++ b/drivers/dma/xgene-dma.c
@@ -1435,11 +1435,8 @@ static int xgene_dma_request_irqs(struct xgene_dma *pdma)
 	/* Register DMA error irq */
 	ret = devm_request_irq(pdma->dev, pdma->err_irq, xgene_dma_err_isr,
 			       0, "dma_error", pdma);
-	if (ret) {
-		dev_err(pdma->dev,
-			"Failed to register error IRQ %d\n", pdma->err_irq);
+	if (ret)
 		return ret;
-	}
 
 	/* Register DMA channel rx irq */
 	for (i = 0; i < XGENE_DMA_MAX_CHANNEL; i++) {
-- 
2.34.1

