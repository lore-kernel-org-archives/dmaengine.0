Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=40.107.44.140
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793796624;
	b=cnzWzLufThIyy+8h64FwfSC/dtxeRUdbH7F3if6zT7j+mba/RYbMxaJ3RQoQWM0Te2DN
	 yKY1pxP1t1VuKkeoglPIdK24tmTwJtab2LougVExB2QdKa3Ap7DjCLUz7St3R2YUZTrUH
	 ShtFGcZEP4TX2urms3E+arz7m6Jd/KMov/GHzQoLaJFptfprDKrGjC4peGyvY1PVtr93D
	 nSYr7qjyTNTR2FB0GraTWfGww/g67+xlctsDLN1raN6B2D0LqH+meDGpmBRFb+VK4BPFw
	 iRzLF0NN/yP44zV9NT9VBESWYLiQIRyRlVSHVyrj3rnfSKr6pQ5DivfV7xC0ifcpIkQ==
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
	bh=KrVBe5x9E7InxP1BW2HQNZrtx0xeZJdcUQeaxJDjM6I=;
	b=BAZYBQ8yojd/AIKFG3NTrBIJJDfQa1tZagP1bB0d/09djqBISE+gtmycSy6tUDadARk5
	 IabXJaNQ7Yy9BMjjOfiLQbHUfr8IiQ3la9Ba82GqsuT2rGRxz7wW/BYRZKhGRNusDXVRD
	 VMTM33FmZqsFA6CuQzgbaywqGpZdMhCoxY3UtUYclWq80GFSMHcFZH7qZ9mF5K2nXp3Ye
	 OqR95E1iS/j22aTgqk5xJnaOKKrhjWomEVp9yUvkkhcLLg5SH25LomCt0g9idWEOKH75W
	 M3b01HrIp4ysxRivU0Q13bFV5EYB0F6No/phn3rJKTERq4vyQ0kSaK69C4SJ4D1J7qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=fail smtp.remote-ip=40.107.44.140
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023140.outbound.protection.outlook.com [40.107.44.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1480E606D80D;
	Wed,  4 Nov 2026 12:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1480E606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCFTIqKvsLDaALWLBUAoCfU470zrC1i656kRuHcO3hE7szCos21K54+xttksNAoEEP9ZM077JFKcOePFsvUIRUab/amye9cmXYrGFbta05o0AdsDg5rDjsYic/DAo5PpHylQcmLUd5hUlNC/qH8AHk5MoHROd/x+kvwc8f+2z9o+NHgiekleMZ/RGgLEh986K0yljCoWJrjfPsG+UApUUBhOQZQVkk5havyRimW98AeQBKMWyLDXfN2tDKtbXXnskU0dG0GQWBlCtSfqSDe79cBqDnDHpGwE1MWvOT8G1T0+8/1S04DomL4DG2WxJxjHHuXAaDbVGP2Ik783Wr6c6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrVBe5x9E7InxP1BW2HQNZrtx0xeZJdcUQeaxJDjM6I=;
 b=HDi/4TcOxq83w6n0XetnUA0ZEmYbneNBirgbbtFxSuoj+T4uHJjNAE4xP3pVPDvwNy2EI+DcY0pLqclufPj2UtvKLVlszoaUYTSrF02aS+qad+yBb+XqqV8RZkCLzmCT6LcwQ+aCfh2VBVv4U6FOuMysZtflxEcSQOtHVljLotq1fhAaOjFyWE6hokFFfSKdijOCOh5I6fuc3ltzOFqAgfAHjhP+Uj9Xi2A7lp5Ti0NzMbBZkfLn/70in0E7W6qC8a6HrRHxtHU6iWPOIs7ZvEGdRhuAQL4bf6tQfnn4JWWvHrzkVHxnF52+N0pM+R0O6cX336fun9Cy7iWBiaLUkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7) by
 SEYPR06MB6661.apcprd06.prod.outlook.com (2603:1096:101:168::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.9; Wed, 4 Nov 2026 12:50:16 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:4:140:cafe::9e) by SI2P153CA0001.outlook.office365.com
 (2603:1096:4:140::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4 via Frontend Transport; Wed, 4
 Nov 2026 12:50:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 12:50:14 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id DBA594091E3F;
	Wed,  4 Nov 2026 20:44:12 +0800 (CST)
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
Subject: [PATCH v5 1/5] dmaengine: arm-dma350: Fix source trigger bit
Date: Wed,  4 Nov 2026 20:44:07 +0800
Message-ID: <20261104124411.296640-2-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|SEYPR06MB6661:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a97affcf-a908-4fb5-0957-08df3a722c6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|82310400026|36860700016|261009223027099003|261022105027099003|261021121427099003|56012099006|261026140227099003|261021123027099003|261102123227099003|261028144727099003|261026121527099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	l6vrMVnfjjBnktiRnemYbBUBMFNk/myABm0KOMIYlsBAwlPmbm2jPG4skOaySeJRDwQzL6fUw+DFcAPZdMJi8g2cbj49FtW0mrvFUbZXrPpDikDabBwy0pqAQo6U9mgM10QyQU4Hjyb2vlfmXTEYgFoseyUjNjWkYqHRwmkMiBWZ2IxYDVo2Jg5BK4tbcsPfSgZC7BvCGBN3dzorZOKhSzvAFHeRWwqrREufuUXU5sKo2puMcUIvGsG7zXMMg2GzYQEyseHmw4ROF2+845dTLU833uk9J8iTC+ANYn4OLk5rymDC19ruNS9/mZKmus6BNwcPbyWTCtvfw49VM+fV4H4tLz79GMSdGk7X6YT/12Dj2hqD3pDKQ7zHy3oYTI/k+MKvqq7c3GfEATc1QzsEkWUlDancb4caSPA8t9R/EOzpZBtPZO5H7pDmWPC3Ks+fLR4Dr4F2s+JolMhgDyKSnLFqhGwthnie7RvB0qT+mX4MCmctutoc+uO7D1gyIhRQzuH0pcFuPyNUlmkedZzHs0OLXNyIbbwPPVhChE0gWMKbPiA8FC3lmfAytBIYTU7JCydKWCJlmDZC2BoBlboM6rk3H9xkcUTTP2imaJ3VDhTXxSawt67g+3tkowzqFW1uArt5hJEvKxKLWKcdbolDHIm9KH9rpOvfNrYkYA/XHTDLzqd53OBA6jnX4mHxt4a3JPQQi7t+yFRJ2uo1BJn/mQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(82310400026)(36860700016)(261009223027099003)(261022105027099003)(261021121427099003)(56012099006)(261026140227099003)(261021123027099003)(261102123227099003)(261028144727099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PSPUbCpg4Jr2/Ri8hmCG6O3qPGrFpID1qpkxTbfZ2+b5wy37Wr6uJwb2wLM+X9Y4WVqCqcOB9K/CqwXc5em4ZWbEbVTzzAGrhf949QHUnHMNyHfyl72aSFsrSA2qWGsziwAKGj5t5jDrE2ca5wF5zjF0qV3acZkOEo49AtZFZ17j4yyrnP/kfTV0Y3hjX7fKMdsVss2B9e4UEk3NqwqlSrmdANP8ec6KqekfSIAsMQX8v9fU6M53/RR7Wig/4cMqbjrGLCOGDmbd12DzBzWqou2t3ZNc2FUpGKZ1JTmEcUqKC2thjFlJKx2HoR4kU7rfxlkhXq4mU1mnWlZgeMPb1ub6CMboVTGiMU5PSBUJn/z7nshfTGp4HUH9aaBNraxYY0moGZUFtEiKDlfJZmMck/n9fKK9zq7J8p6lCtNZTK8WEEKC9/urZ0qIm+rnqLcX
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 12:50:14.8959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a97affcf-a908-4fb5-0957-08df3a722c6f
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6661

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

