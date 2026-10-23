Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.127.125
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792747825;
	b=pevIm27pTuGftfUGeZQEQNqoSC8M0Lm90cieAH0ZxcBP5zKqTxT+/t0ZNGDBUXdUKo+y
	 z8WD8hPR0Q8WofCj6NuOcsxMhc1Ju6Ep2HxkD2gtnitGxYozX7bX9ctiAGtgHPbdIGdg0
	 eYYFaXZzfb8BD0vyz7MIbnT7lzlJJo/i4dAjH8pBx+hv6fEmDh0/vG1WIkF69E34tf7la
	 kVtTLBlBk4nx4vZ9DP4CUdlUvdfNj807XW+lDafDhOAIYUjV2CcpLsGe2ZhcybtEPcAZG
	 6qXiHddaciL0wgc+CgSyspd/5R1EmmKYp7Ow73djqG835jEjBfgQx5lQqsw7XpVysAw==
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
	bh=gMnUJ3HSB6w4gtaWT2o5XgljD5jvGPNR/PyYuPCO2Ws=;
	b=4DtD+01QCm0fArbOdIxtcCpk17BDrDyoyNt2TpYansrBIDhizJ09PvJ1dEuWAGPEvbu3
	 JxLL06SpZ9sd3cSbv8C+7CjnBvV7RgylvzSgkTEGW30AU8z/rntX/dI/7zIP+4F+dA4q3
	 WFbcBMTe+/c0AxBJXshqOdlQ0r7UF/LvJhAJefdgwctquFXB3W9Q4GdDJpBXOY8dfGoVW
	 Tk4+OdFXHd2NNN8OmRxma+xHnpWdW9N1mbuHUMFgd9r8b6H6Vz0XkeQGgLiQABlX79aZ8
	 AQ8JblPoiCX9/1zYCkSMC636t1835Ma58UjV6m8cesGbMxVfzgYn6jaMclTSkQd3Q7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=fail smtp.remote-ip=52.101.127.125
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023125.outbound.protection.outlook.com [52.101.127.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFF8606A33E;
	Fri, 23 Oct 2026 09:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FFF8606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KvsUuTrWeFjDZ/8kNdmt7SV6aS3Q3pMnFtYlY1JBuaf/4gQ9vPUHwDFxm6bTxutn2zemPLvRCGc+Qr80raqvDsaJfrSrEomFBMZJQvPX1lOEvGLIR956j1IFIPQ3dNs0UXsZqvusI05DXBUik184E6Q7QobNGXAAN7y8GH7b4nz4FCRFkmn/NzmjtaLfsaf8HCJVpczagBqR53kIQLd4RlBkbhdp1VRXgUuDTNtrPvKVoVccKzuUfEuSVupAEBHbNt8clYyu0qdKSfV3B1gillk6QQHS9EIOIkiDTNss8z2T4YrmQTUt1oydiwFhhUNO8CmQZCRCuf4qQZo1KPmwtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMnUJ3HSB6w4gtaWT2o5XgljD5jvGPNR/PyYuPCO2Ws=;
 b=Xv/SIkPGkYqcw6ed1sQaIeuQOw+RSE0Z04OOhqJYbhFTp0Dmkhl0/XsXyfbWu6nZzFOF+lj4MOwxohwnXCiEbyqsg7kvvbbKhuq2fNEtyYFFalkRFU0NF7Iylida9SBqwbxjQ6/jlR8M6rymxQsoeU21eZs3bjZDDSFYual/zcxWeZEODdKXXtEuzv3b1vBEFASv8Hpb+yAphZsFKG3n89ehdHIBCgPXU9DTFow5mm5NatBWzfJ9TXSahNYqAvVHQfAbATd9pLUtM34B2q1lhj6jnpmDobIIHhROL95icTLaGN+Tw7hGUa6a6yQcaaKtNqK/K4RfjO66H5OsTF694w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0049.apcprd02.prod.outlook.com (2603:1096:4:196::7) by
 SE3PR06MB9217.apcprd06.prod.outlook.com (2603:1096:101:333::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.2; Fri, 23 Oct 2026 09:30:21 +0000
Received: from OSA0EPF000000CA.apcprd02.prod.outlook.com
 (2603:1096:4:196:cafe::77) by SI2PR02CA0049.outlook.office365.com
 (2603:1096:4:196::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 09:30:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CA.mail.protection.outlook.com (10.167.240.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 09:30:20 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 238FB40920F2;
	Fri, 23 Oct 2026 17:30:19 +0800 (CST)
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
Subject: [PATCH v4 4/5] dmaengine: arm-dma350: Support integration clocks and resets
Date: Fri, 23 Oct 2026 17:30:16 +0800
Message-ID: <20261023093017.3248454-5-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CA:EE_|SE3PR06MB9217:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 81533a57-f34d-4117-04b0-08df30e841bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|36860700016|82310400026|261022105027099003|261009223027099003|261022075727099003|56012099006|10067099003|18002099003|22082099003|6133799003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	H9YcaW7yQXFRMmx+LeECV5UVbotqL90R1If/Z4UC3mQm0YQNNnKo76wJEYf2AwnUpgcmX1U6HEsmf7SCe8Pfcp+WiAWJXOjZzL0uX/f0arwcw80woZ3jD1nlvRiCvx7OumhxhvzB1zMcF6/Yl+n6Tgp3aIxYwUHeEHMGA/i0ykwFzKFyDmJ22hbRRxnPFGno7oUDZSRCEDvik4AFKc9Qfa2nokr0EbyaM5PROnyj3qJwnQXy4l9iiBGyC9D76X+RtQujxEm0ao4o8FjknjSNDBG492ppL4PNQR90QzAZWB/d8q4Blb+1E4C9R3PBPH1ar52LiUMyAJFTupPCK7M3cUhnjez+wYGH2cxuAl3L2dxI9xQkcoguH+hVQKcvLF82HkxbukMMKHg0BtfT8Zd1AtFNJCWKcFzQ+90MOkQ/6traFQy3pHt77lJ2JpWAxNkelJCyyWa6a8XDaA6jQ0TzRQbO8/QPFZxvapPA+5T0M8RIo4sQ4zSluyUCC79CG0BZGUYLQY2QLQ7T90RXdZwNnM8PDsOz7ssyWdx+EDgEM4x2tJPT01kjLpnKop8Ougl/KkYUrjaktOXxUjGUQDIZ3R3N+4cU1+twS8lZNkuV8Bq7+BggIS+bYFdCksVekKaYFLIqKrtLPfNaH/ElT5ADz3sgXIQZnfS5EqDAeAmZrkADoHEsKb2Jg1vZhDPo+lPw61CL+l+m1fTlf2tSJ5kUYw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(36860700016)(82310400026)(261022105027099003)(261009223027099003)(261022075727099003)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	D2hxLwNs0S6N3Pl3r5+RgmKxpFtSZSnkkSy4ndu1sRdxlFwfjM2RSUh6nEq1LvD/dKd2Hh5nKNipWhC3CqrRphjIex4Qo2AodLjdx1ooXBC/KxAHUUKeqP9PmrHyaXIVV4bGMstu0/I98p7TbCUUw9Qijx6vrcHJxV+x7BQFRSkhHE4WCjD3KdaVbIyjBg0qzZeizM17wR54txEyhEu6h6yYIgPVbQ7fCph2KHOvCScKaYkGmoWGo7Ea6QZiTYHZdWZzH4MXjXkBZqqy5Jw6opPqYahGZiNJXoIWlDm5/RhAZXdaHuWeTSRDUBe0Z+u+tiMOkGj+ShCl0GmJWN0GNigoU/LEGb2GUtzXWptL7JPjjepcEltjSdUMfjfJfiKPOz2z5SNcIgUGRtxI4+1OnjDWsbHii0mIfG0Xng2ygcrnXx4fBGFd/yiDjD9towp7
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 09:30:20.1273
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81533a57-f34d-4117-04b0-08df30e841bf
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CA.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB9217

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
index f62ff6a9f490..9cb5b2f03113 100644
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
 
@@ -1199,12 +1201,24 @@ static void d350_free_chan_resources(struct dma_chan *chan)
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

