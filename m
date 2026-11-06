Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.113
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793928902;
	b=VZsLeR47+n0jmdIPdQId72HESCiJLkNHLYq/Cd1bQml8MYd1yaoGvlUHkoEmU0G+q6Zd
	 CM48cbymFrCShMjRQ71mieEm35Dc1vKvKp6LpAl1mmUfaS9GeKSJQHdM/wGJ0c1+SYNEs
	 liCE18gGbjT+j85mwPoJLzGjkaJ51BwE8cCQGBI6P3K+E322M+sAX/fPgQLIjMUxg2YS+
	 kngzGxGU5MOVq7tNQ+QwHOd4qUK0CAJ7HOHzLzJuaOfwZIQpc7zIzUjg4sh+mk6TAH9eG
	 3Cs+pdIWWdJNoDm8wllhbnIotyJBjqG0MQuXIzAgKPNWv0bTgVp2umasjL46PixGR5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793928902;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
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
	bh=KGGsVNym/uwBL3j9XTVXa6Kk99JVKl31KHDCr7bWsgw=;
	b=1TwRRclr/acsm+w8t8EPX7AnUJYyrIYXXPcXpHUsXlqQX96ND67Tvpb5il5z/c/UfIix
	 5jqj6gfAMPSnfyyGTx7c2WxBR5C+W/lVR8Txg3fJr+BStwzj9QfyrgI1stPJOKBQMj1Fa
	 piJLasz+9aK6UW97d/5t9OZ68wDERJp3O3h111RxiQ3tG495LIx3qhl2hvwIwgkzOMkUL
	 j5SRxj+YiYKFJ0+skLT9W0dAovlGEZRSjcl6fqZ1kzmR/Ycsrrs5MMv56UXNZlk/KQnRo
	 Gif5FDIAqUeG5XmGH5ogvWMqP5pYeUoqLVeRsdbI+SU/x0AQI9y+sJseioQKJXCm8Cg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.113
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022113.outbound.protection.outlook.com [52.101.126.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8E6606A32D;
	Fri,  6 Nov 2026 01:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC8E6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U4UKuxd4ap97/qcNAvuldyol1GoST9Y3nNMaG0KlRiCdvUOCheD0iuP3PyX5yO9vCkgABOOCozNtUuh6Nq7TEQwb8cB6cK0uu839RwTsrKmzzeSQ33J+5otrtZro80jmoitGyX5swJ3hdoXxFWI+l2ddgrdQ7gq5C3ReujZzNZr62z5bvMRFBzJKEPAZ5QDKTs9YJrQrUZQJ8EXNeQ4fBJ0wd2zyR32JcTRFq1EY8fqeyGLY/FEAc7aLFIZJ02Aqnk7RhwZg12aOuSxegpi394Pfqwq+Q1Jb/C6AB4MOl8MJ0KiQiDzYQL2pS4448EVBFeUf+c6k69JBA79BllA8ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGGsVNym/uwBL3j9XTVXa6Kk99JVKl31KHDCr7bWsgw=;
 b=FAEhKrWDUXBwLvGRcFJtwkdW28zwtI1F9QvI4AmWZ2OUhupw9SJsCUDcMB79FZ5MvLXsf5Uwf8YXJgfLUYHKpdt+J/8sJPkECOmeGQGGW3xetJSkCv4zkZThzLupyA7pTBgqgOhudR4twTWn6k9nDRAeTAwMIQZRyHhieIK3zUK8i5msFloIRlKnszn3bBYTRaXyhw1+I3XM1hfBbq9GOh5kLrR1/ZBX80hBREAc427AtKk5q8lVLYS3zFp6CeowIq95C9ItzA2aqEWWUlhAPuXzMWfc5fag7vAZ+kVn9DfCaKkEiTphYso4JBU96JAh8RRRIbbgwXImfmWwaSZVxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PN4P287CA0036.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:26f::6)
 by TYPPR06MB8328.apcprd06.prod.outlook.com (2603:1096:405:396::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Fri, 6 Nov 2026
 01:34:57 +0000
Received: from OSA0EPF000000C8.apcprd02.prod.outlook.com
 (2603:1096:c01:26f:cafe::4b) by PN4P287CA0036.outlook.office365.com
 (2603:1096:c01:26f::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 01:34:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C8.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 01:34:54 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 628084102E60;
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
	Jelly.Jia@cixtech.com
Subject: [PATCH v6 0/5] dmaengine: arm-dma350: Add slave support and Sky1 integration
Date: Fri,  6 Nov 2026 09:34:48 +0800
Message-ID: <20261106013453.1134239-1-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C8:EE_|TYPPR06MB8328:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c73f0f13-3278-4f9a-e5db-08df3ba628e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|7416014|261009223027099003|261028144727099003|261026121527099003|261102123227099003|261022105027099003|261022075727099003|56012099006|261021123027099003|261026140227099003|261021121427099003|3023799007|6133799003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4woOM72TaJSQEyGal4nFTFpxX/zINMMQ2LdarjtB3arSD6n3JTHHcrhTf+jX0NfUnQgCc09w0CwnoYs5ZrLvzbjbbCv+gU71jVQynYWqsb59K7eg4sykQd13084EudgfBxPMVvRoWe1n03/JgTLs31jbrANrTMGFYp0bd/lQBbuJdDwqDmEg/Fv0O5sWN36uEkZ8U95YfdXHv3SzZ5JwlV1CvwUj181eePgGDu3xagE6eYLl+vdEBAVp5hRZqFcJZwpw9ybYRytRiX00NyhAs0gD3zMY+iM/y+W0bk/zC3QOuzcfgyafijlnpgPCJYwzIEavt7FMHJxDaWngsrUjJtRFbvMu4Ff3psxP3haR56ofQfcIfJLOdVVXJwik/v2odKtz2/Yo/UDOKuHQaSNCIXMTjb2jvJEESXcR5SrvEzkunVsKCmNEioSC147ehQ5KaOl4xv4UkoOIoTISUnbJwZ8uVxdCGt3MqRSd/edZwZY7s9h2UZoX0/e4J70Tg/RsBQsEwM3itoVCh65iQQZ3Z9PiFQBFScemysEKlNSnvpcFPoNacSm1DKFh5HCd/C6xBqIbQ+0uVjVQePtZEeKI+Tc+8RtKXkk7VUQrAAeamboWcSuhyr0dN2WO13Z9yxgFrg7TvgmqlqfxhM07ZVpwYw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(7416014)(261009223027099003)(261028144727099003)(261026121527099003)(261102123227099003)(261022105027099003)(261022075727099003)(56012099006)(261021123027099003)(261026140227099003)(261021121427099003)(3023799007)(6133799003)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gMi3nlYCDWL6Pvg+zdCQ5msgZB9CGod5XBQ7arm73yrIOWbAXH7s8SBNW6zzLLFYx9E1wSUYKkn+y9Gb8xb387aK5PyjSDkF01/srBQGQ17r+xJ0NtqYSR1pjpFGXcoB3QgzI/eMV1KQTF1INlAW2eJR1sBQ4ckLUBU0/k8mwaE3LBhpB58nwMWmgAJRgq9mcxvgItxDb2y8D1cwMupylW7gXUUwxal3D+9L7+HQX+YYGup+SDRl8UrOq/eF2CzUiCbQAJsArb+cR+8IA1yUGK5bag/SJmiW9azlkUE53OLS2Jrgbh60l88t1r66ximHaYDThRbFTprKvcpFvegi9Xi7367lgWAI9EtfIiLSF83+VdvT8ojaau62Ed7HJGKldHvrbJ+zU2REmMzDx1FCHV3wBZ12hFn3LlvhZPUcoOXw+nIjMv0f/p/1kRpMV4sz
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 01:34:54.4572
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c73f0f13-3278-4f9a-e5db-08df3ba628e7
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR06MB8328

Hello,

This series adds scatter-gather and cyclic slave transfer support to the
Arm DMA-350 driver, then describes the clock, reset and DMA address view
of the CIX Sky1 FCH integration.

Patch 1 fixes the source-trigger bit. Patch 2 adds peripheral transfers
with descriptor-owned resource mappings, coherent linked commands and
hardware-based residue reporting. Patches 3 and 4 describe and handle
integration clocks and resets. Patch 5 describes the FCH DMA address
windows and adds its bus clock.

Sky1 controller nodes use cix,sky1-dma350 with an arm,dma-350 fallback.
The binding requires a bus clock for Sky1 and leaves its reset optional;
both resources remain optional for the generic compatible alone. The
driver uses standard optional resource helpers and introduces no
CIX-specific register programming. The companion AUDSS interrupt-path
series builds on this one and manages the AUDSS interrupt gates in the
CRU driver.

Changes since v5:
- Add the Sky1 compatible with a generic fallback and require clocks for
  Sky1 only. Keep resets optional and update the FCH node. (Frank.)
- Initialize the request to an invalid sentinel and clear request/config
  state when channel resources are freed, but retain it across terminate.
  (Sashiko, followed up by Frank.)
- Keep a failed channel in DMA_ERROR until termination, preventing queued
  work from overwriting the failed cookie's status and residue. Allow
  terminate to clear the error without an active descriptor.
  (Sashiko, followed up by Frank.)
- Add Frank's Reviewed-by to the unchanged clock/reset driver patch.

Previous version:
https://lore.kernel.org/r/20261104124411.296640-1-Jelly.Jia@cixtech.com

Jelly Jia (5):
  dmaengine: arm-dma350: Fix source trigger bit
  dmaengine: arm-dma350: Add slave and cyclic transfer support
  dt-bindings: dma: arm,dma-350: Describe the CIX Sky1 integration
  dmaengine: arm-dma350: Support integration clocks and resets
  arm64: dts: cix: Describe the Sky1 FCH DMA-350 integration

 .../devicetree/bindings/dma/arm,dma-350.yaml  |  30 +-
 arch/arm64/boot/dts/cix/sky1.dtsi             |  36 +-
 drivers/dma/arm-dma350.c                      | 837 +++++++++++++++++-
 3 files changed, 856 insertions(+), 47 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.54.0

