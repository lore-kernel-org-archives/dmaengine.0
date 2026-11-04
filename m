Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.80
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793796624;
	b=gpfgsZz+xZmAsNczwet/fe46cy5m8Jho2gCIhNvJWyoRdCaJXNtrs/zIo02I44fhcB4i
	 ErTT6ax1/8ktrWTTZm93RzoKInUR7EU40cq7RQI4sX41tuGiPERbNfRoIv7FjuI7DBMw4
	 hNNnU9EQEg6Iy1b1yKj91qxGv1s/1QhuXaf8OPjLzEeodPfqMhOV7L/USxQDAG/hye6/7
	 S4l25ztpXJCA14mKsmrix5Bdcw+YipkuV2dGCO81h+enRJVTa4WshHldkb7wKk9fZqyb9
	 sLRZ9NJT/7JJ5hrVdHw1zBLYT2OjYLOVRwYjIJxvBDMEwqhVaY3q2FK085FvrFcC5mw==
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
	bh=To3fWOoRLJzqLf3X3/o69QrbEd4fgxNMFgsdUeyxWp4=;
	b=P9vKHhF32etdG1Cx+j9Foo8feZCKkFKTMaslFnX/Yn3Wm5+0fWNYzvrk2eGqbzA+Jk/0
	 yLGu/KQOyCE0jjPyX8/wn6pU+nkiu4L4DGpyGLdmjfWm01WagqMdXhV91gazPH9gy9VPT
	 0MeMVWwnHukhRvPrAF4prN7fmk8uzklpth7mZxQ3elWy8TLOzTPjCQ8nujqy49JiBqNIs
	 Xll10pra8HOqRA6Vxl0rXTAhxmj4KJ/aUaFwo2dry0avTSrSwCEboJ5zZfmXJjNJj7dT9
	 FfiYGt2Lnzvkd8RmUInYw9td8n0scQMBvfzJIazBMr7MKYOwwhWCoFccmHRfWEPdxrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.80
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023080.outbound.protection.outlook.com [40.107.44.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1815606D80B;
	Wed,  4 Nov 2026 12:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1815606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPl7VgToQbhw12zmZVQ/JEY2vtbB8PjUcYkDdtJMrMdE6We0CQ6izHzVaYT2MR9exCw2fMv/V1kHrV6m9caQFRtESaN6h/+DV6TbnLJtgu2rWyikiq7RcXnAkjIgGNkMjxi1HhRZM5YKKHJvj0A/5CeeOmM/H+2BaQv0f27auu/V6G7k12DznwH+lt6XUPZ2aYZwXb6M2j6rW+aaDPDYEElj4H7uhloDlHOk/UDkDYOdZJhSHqAgCskf2hvmh+Daws4JyNXJL35BhwH/3ZqjBg+q/Ct+u1v2Ofk7+Mvt2HuiHHLGoPt2nzDrtxURhEvyJiwB+WGl79jJaRCbVh31gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=To3fWOoRLJzqLf3X3/o69QrbEd4fgxNMFgsdUeyxWp4=;
 b=yQfinc3qR4Hhg8Z3JIhoque6D659IQSx9tugGjBsxmJy0ib01dlOdhnhOBjBeihllsiycL+7vekjplIiu3rqb6WtW76wzfMOWngXGhZAlIAhOQvdftqofol2RjF9Fa0RenRytEzQpvouK65G86CR4TBZ5gkmRm6ZabDcr4ztsIy9Nt7qrzDySiEvCvEWYoU/VN7Sv5+tiHwsmSIzcX8cMhX1mA/7CuH/ruWnsdNktYrmAHafvCGl3h5IL92aZoWhypC5jt7AxdSuWV3z/5Qxj6ZuobS1qnTeOdmrbhqtUcMvLFgq3SZrh1W/p1NJaulmxrmsy9iMihpRAxX/hV8eTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0042.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::23) by TY0PR06MB5596.apcprd06.prod.outlook.com
 (2603:1096:400:31f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 12:50:20 +0000
Received: from SG1PEPF000082E2.apcprd02.prod.outlook.com
 (2603:1096:4:193:cafe::29) by SI2PR01CA0042.outlook.office365.com
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
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 12:50:19 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id A86CA40E6384;
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
Subject: [PATCH v5 5/5] arm64: dts: cix: Describe the Sky1 FCH DMA-350 integration
Date: Wed,  4 Nov 2026 20:44:11 +0800
Message-ID: <20261104124411.296640-6-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E2:EE_|TY0PR06MB5596:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8ee13f9b-fbcf-4609-de9e-08df3a722eb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700016|23010399003|1800799024|10067099003|18002099003|22082099003|56012099006|261022105027099003|261102123227099003|261026121527099003|261028144727099003|261026140227099003|261021123027099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	VGujIibmvNHR8sGWWtOrMXDOIgjmoz0TazF8oUI6MwV9/0X0vtkV16HlNjCtZoPQa99C684dE2coS+oe9VMPnbX4286sa/8P0XGyzCmyO2QwZh2qK5aPhSqxbUqSY04B9rWyCkEqowrfFHP/RyyRSdiAuUOFnCmKuvNUJv0POdEheLo5pDhzo+Bey797qAFW0Ada0ICknnek4rqBW+DF970hId4qWBCmDt/UamhgWd3vYA8cVyQ0HcTMdfJBr0Z16+xO0S74+33j4nnTDMOGmjg32LgKwoisbSdM9dqWe4ifdZdX5+V6L8smKe4QBEFyemvF1vaIMi5sRvURCavYqk5h2IUSecOXlsGxId/2A2ZnAg5tt3b+2BNVb7C988vb/qOyFgpuVugVqCQXVL7SiA7rrWUKBEIdtxpQs+dDE2ejoX+vtUGOOWUHhVa0oDbD/spOPWN1sCNUYGtPugfPBXKKotrNzAh5wY5W121Y1oq6Ny4jMZKyTkdXgo68Lc2jYHFB5f1P5lrzpPYwXJmmjd6AOC0D12gUQdiWrB0eozXJdRsjWbXCoiXPENEFQl/kcrgkoMtbHzpu+sz+uGrEv0pQal6bRM1C4fdicPTAxcTewjwdQobnXc1U8TM0lxsWGDSmpu/fOIW0UzhA029yIYvISkPp4HTlxyTyPIcg4D8E62FvN1YNbcMJ8vTj1uDHqrlL72nXin0d1RTq23NTHA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700016)(23010399003)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(261022105027099003)(261102123227099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021123027099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kgVIGpNTpf/smb0psrCsgiMDQLVKcaxUDrVL+9yBSumKxHkyyKBKIeLCpbHDyESSpfQYKVt3pvroSjAe0jJOUviLIu+ilrRWLq7fNeOYHMMw59q8jUG75VorTG0DaYBDlQKTHBRY+zBgIb1kVJcUiefFvEQUugCwhBXGGEBRfbU1ScXWXXNJxmVK2452VxZO1JhvgRQfv5s2IMS+eK0O+mTidCYG9yYuJMYcLa3oeN6LJCGtwBqWCSDjVkOqQjl8d2Q9AOXEl4U4UNDlZvgnLLBNOq98bYygt0oy3MyR6iQl3jwqmujqX7iWNi49Ui0oHR++Vk0qfXwuRaTLXlpTRnlsumZlycEMZ0eUoUAh+N4Qv5c1K+BCOVEj0huQmkPkO/CDqGTDi7Zi9xsUScB5JUub+D91fJg9coK4Mui/NWhuorgzWBjWpitCeiNvDxMr
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 12:50:19.2502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee13f9b-fbcf-4609-de9e-08df3a722eb6
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E2.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5596

The FCH DMA-350 master accesses the CPU physical peripheral window at
0x040b0000 through DMA address 0x040a0000. Describe this fixed translation
and the reachable DRAM windows with dma-ranges on the parent simple-bus.
The CPU register address view remains unchanged.

Keep the existing controller register region and eight interrupt
specifiers, and add its SCMI bus clock.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 36 ++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 0a820f45feb9..cd498ee7e9a7 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -518,18 +518,30 @@ iomuxc: pinctrl@4170000 {
 			reg = <0x0 0x04170000 0x0 0x1000>;
 		};
 
-		fch_dmac: dma-controller@4190000 {
-			compatible = "arm,dma-350";
-			reg = <0x0 0x4190000 0x0 0x10000>;
-			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
-				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
-				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
-				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
-				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
-				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
-				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
-				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
-			#dma-cells = <1>;
+		fch-dma-bus {
+			compatible = "simple-bus";
+			ranges;
+			#address-cells = <2>;
+			dma-ranges = <0x0 0x040a0000 0x0 0x040b0000 0x0 0x00040000>,
+				     <0x0 0x80000000 0x0 0x80000000 0x8 0x00000000>,
+				     <0x80 0x00000000 0x80 0x00000000 0x80 0x00000000>;
+			#size-cells = <2>;
+
+			fch_dmac: dma-controller@4190000 {
+				compatible = "arm,dma-350";
+				reg = <0x0 0x04190000 0x0 0x10000>;
+				clocks = <&scmi_clk CLK_TREE_FCH_DMA_ACLK>;
+				#dma-cells = <1>;
+				interrupts =
+					<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
+			};
 		};
 
 		mbox_ap2se: mailbox@5060000 {
-- 
2.54.0

