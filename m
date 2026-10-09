Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023100.outbound.protection.outlook.com [52.101.127.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24A8382385;
	Fri,  9 Oct 2026 05:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791523169; cv=fail; b=CxS/rHvbdwlUVWVZxiXI6GkoO761/zGwNAm6n5TGZRmv/WA0xyyKPGGR+ONPcA03El2Qk+vuK8hjFyluzG0t64/KMh3CleEfxAsHG4sMRKCQoVIh03eC3m2TpQfMDsrU2DeT7URMT2S5vOKsKIsLrW4FohIXAMD37p9igmrc9hY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791523169; c=relaxed/simple;
	bh=IzacW9WK+BgvzHi1msyNUQtBl1n7wgWz5lgaZDTdve4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GF6QEElDrQz5OAxK3KQNv3wyXN3vzkNRl9/uoOUTtxj4k80RyhSADdYjVgsxM8qrLQck4tr9Bb2oUYh9EEgW5xH/76HYP03qG7tPOjRbrJyILJW6+G5aRUChixc/0M+CCouDuUoT2zTmADmDxKAeCFNZX1A34P4IIUREWBNgAQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cfDO2ZM8T/jKbBeqNXGN9KgDHZirDOOEYTOjIRUFR9rp41LFJUdrlxHrdA4eEXAKxN8gwcba3GHhJRKLYjegtQdHe/NPuZxA519tBxj8fH1HpT3/FdG+kTL6m2EJVulAtJM2TpzbBddD5bWFLMmQg6y2ukA6QXiS4y0NyFs2tFLvxgLXpsa2oUsoAicI7oeQrIDuYnTzckaY5h0Q0R9XzfL8uBez9XpoXNbAaRM6KEf2bOtdh1wgTCg5JFfYdjNnH6mIioAkeVd5XKcfXmm+rboGfNcT2sZD21JFV/c4FI+BwSQLjfKBpEXAWAS9g0jW34sHkD4bWs8PLUBxS7DFKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9NNpnuu2ELta9UUYl0QvyzEszi7dG8hPSD9D5n9ZAo=;
 b=FnsT7mqD/fNB3arReHmWo0Eq/VJ1q8mkP15HlCJTjNNbXU3dmt1CuZjByz7GMTR4ncsrKWkRQVlYWdqM++d0ujByXwVcMc3qno81kbuDm0Hkst9hkzpNuAOYLlQlNB/LT/IeElemcSAg1MBlChhJog/PAi+WMacU0E6J5oxmAUbi5AdI/c1M53NmbIYVI0yO8vMEEW/o88mM/4nGXTS4/XxZgUyfEL+9J7TQcAn1oUaobOHOlvMFLmsGNonxO6Kyh5twynO14GyqB2Mc8+ye4LxM4QvYcEQc3MeCC0KTY1QGCkZrWpGrIKnuBe0x07LtURDwZMUW4Wpy7gqLYMPzdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0003.apcprd02.prod.outlook.com (2603:1096:4:1f7::20)
 by TY0PR06MB5753.apcprd06.prod.outlook.com (2603:1096:400:271::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Fri, 9 Oct
 2026 05:19:23 +0000
Received: from SG1PEPF000082E3.apcprd02.prod.outlook.com
 (2603:1096:4:1f7:cafe::a9) by SI1PR02CA0003.outlook.office365.com
 (2603:1096:4:1f7::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 9
 Oct 2026 05:19:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E3.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 9 Oct 2026 05:19:22 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 611A843B1089;
	Fri,  9 Oct 2026 13:18:49 +0800 (CST)
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
Subject: [PATCH v2 6/6] arm64: dts: cix: Describe the Sky1 DMA-350 bus integration
Date: Fri,  9 Oct 2026 13:18:46 +0800
Message-ID: <20261009051846.1115962-7-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009051846.1115962-1-Jelly.Jia@cixtech.com>
References: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-1-Jelly.Jia@cixtech.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E3:EE_|TY0PR06MB5753:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0b255bc8-6ced-4330-6de5-08df25c4e124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|36860700016|82310400026|1800799024|376014|6133799003|22082099003|56012099006|5023799004|18002099003|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	EKilmmd9I8Q3RX1S6MR/bFaV/y5nIOKvKHb/OL9GwGeKgfMKqoEn2pJ6ntB57OPBkBTyoS8urOeJ+U6jxXclul6mXbAwhc7Di9O0hp3S2yglq8oq2H4Tp830iPOeLlYmWxqkuBFVEGarMzjT1AGwrkp1cZfDSDjwkjLih3tf0xdMJMYQISjlYLQy1u4LKeUP+5mFSu9j1rpGxvy8TvGVZVUAAH6jfFZichBdVSQmsPR/ln4bNPwILQTnPzsnxhph+n74+Oze7S+Iw5UuBRDliBHln+0RG1HRZaYCHxyQTtQh6NA4KIiDCV0HpEMBP3CrgB9DMOwnZ145zt2mYQhknO/XO6blZJZGFNPylfeoMrt7ZO7YHuUoVQxPmkCsI16EO/qVYKK2e8GQNZ9ZbHnX/2TGQNzuxo/3wgS57mfZoFlIUriFtun1Qe09RJOiM13D105VXy7ldOgYNVprvO/km6UlW8lTCZMW2BqAEDiMg1obklnfWg3MoHlNSep03B71RGTJZTcEfTTPuxjc7Cxtz97wIcgBuUfWwaarRpxqPPaMQp6jTBWUaSB+x4y/6l9CT2ouMcOvHzcspFpfK/TpVfTmSJh5TuPIWuF8WMpRT1L4c75wKPdDyBz0fCDwFRL8zSh+lkeO4K66IY1pD9s+tfI+VLxnshFigaB5iHsymE8JAGfVMGSJYClZO39v0GSCriUEjX6IEiJl1FI8iFq4GA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(6133799003)(22082099003)(56012099006)(5023799004)(18002099003)(10067099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1La8+Pj7KjybT9YelGcxbRfOZfmbRhgqqjlVIo9giSECg3+RTBW42P1kP5+krv74jPvN7wrSBAzhJ6B5ab17O6xy1Xs+fs8dBJQntwndz3/vn+nrZxOcYArbWnbcibau9Xb5xDwqped1O/+FRYoKRqfH8FYLz0QPB4KfTMZhI5RgyJtvygcEBJ0eX2FA1hZGiwroGl88CdukEjgkmM8PK3T6iw4eRitx7jt8F3soeQgdfUxqr0o1CejpzobV/BnEKcSao0MrMNxPN8d3pYx40mk2TaXVUZhhdmv2fkxg2tsz2ZfGs9l0lpbb2Sr77ci3wVxo4do64q3Dt6XrD6ZrjMkXhCor/aOqc5sHUNx9H/2oi8uyKBUXga4eCqqgAV8pu132Ta8s1d32DVsg/IuDBj0J7NYNdjM3B6yUo7yftQOzC/QYZxBpZTeLmILOYMRI
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 05:19:22.6060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b255bc8-6ced-4330-6de5-08df25c4e124
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E3.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5753

The FCH DMA-350 controller sits behind an interconnect window, so the
addresses its DMA master uses differ from the CPU physical addresses.
Describe the integration as a bus node carrying the dma-ranges of that
window, with the controller itself as a child, and give the controller
the SoC compatible and the clock feeding it.

The AUDSS DMA-350 controller is described the same way, with its clock,
reset and the AUDSS CRU syscon that gates the channel interrupts before
they reach the AP interrupt controller. It has no consumer in the SoC
dtsi yet: the audio controllers that use it are not described upstream.

Assisted-by: LLM checkpatch sparse dt_binding_check dtbs_check
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
v1 -> v2:
- The DMA-350 nodes are no longer wrappers with the generic controller
  as a child: each Sky1 DMA-350 is a single device node with the
  "cix,sky1-dma350", "arm,dma-350" compatible, its real MMIO region and
  the integration resources (clock, reset, interrupt router) that v1 kept
  on the wrapper. The integration and the block are one device, and the
  MMIO is the same as the generic node it replaces.
- The FCH and AUDSS DMA-350 masters sit behind SoC interconnect windows
  in a static DMA address domain: the AUDSS masters see the audio
  register and FIFO block at 0x20000000 and the DRAM window at
  0x30000000, which the CPU sees at 0x07010000 and 0xc0000000, and the
  FCH masters see the 0x040b0000 window at 0x040a0000. Their DMA view of
  the address space is not the CPU physical view.
- The windows are static hardware configuration, set up before Linux
  starts by the boot firmware / secure world: they are not programmable
  from Linux and must not be reconfigured by it. There is nothing for a
  Linux interconnect provider to manage here, so the translation cannot
  be modeled as one; it is a fixed property of the bus.
- It is described the standard devicetree way instead: a generic
  "simple-bus" parent with an identity "ranges;" and the "dma-ranges" of
  the window. This is not the rejected v1 wrapper and not a separate DMA
  wrapper/integration device: the parent has no device-specific or
  vendor wrapper compatible, only the generic "simple-bus" compatible,
  no reg, no clocks, no resets, no driver and no private address
  translation. Its only job is to carry the static translation, so it is
  only a generic bus/address-domain node.
- The "dma-ranges" have to sit on that parent for the OF core to build
  dev->dma_range_map: of_dma_configure_id() starts the lookup at the
  device's parent (bus_np = __of_get_dma_parent(np) in
  drivers/of/device.c), so a "dma-ranges" on the controller node itself
  would be ignored. The translation is applied by the DMA API, not by
  driver code: the driver maps slave resources with dma_map_resource()
  and contains no address parser.
- The same shape is used in mainline: the Agilex5 DMA bus
  (dma-bus@10db0000, a simple-bus with dma-ranges whose controller
  carries "altr,agilex5-axi-dma", "snps,axi-dma-1.01a") and the Marvell
  AC5 buses (bus@80500000 with "ranges;" and "dma-ranges", and
  behind-32bit-controller@7f000000, whose only purpose is the DMA
  mapping of the devices below it).
 arch/arm64/boot/dts/cix/sky1.dtsi | 66 +++++++++++++++++++++++++------
 1 file changed, 54 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 0a820f45feb9..e3bd6c0e383f 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -518,18 +518,29 @@ iomuxc: pinctrl@4170000 {
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
+		bus@4190000 {
+			compatible = "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			dma-ranges = <0x0 0x040a0000 0x0 0x040b0000 0x0 0x00040000>,
+				     <0x0 0x80000000 0x0 0x80000000 0x8 0x00000000>,
+				     <0x80 0x00000000 0x80 0x00000000 0x80 0x00000000>;
+
+			fch_dmac: dma-controller@4190000 {
+				compatible = "cix,sky1-dma350", "arm,dma-350";
+				reg = <0x0 0x04190000 0x0 0x10000>;
+				clocks = <&scmi_clk CLK_TREE_FCH_DMA_ACLK>;
+				interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
+				#dma-cells = <1>;
+			};
 		};
 
 		mbox_ap2se: mailbox@5060000 {
@@ -576,6 +587,37 @@ mbox_pm2ap: mailbox@65a0080 {
 			cix,mbox-dir = "rx";
 		};
 
+		bus@7010000 {
+			compatible = "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			dma-ranges = <0x0 0x20000000 0x0 0x07010000 0x0 0x00100000>,
+				     <0x0 0x30000000 0x0 0xc0000000 0x0 0x20000000>;
+
+			audss_dmac: dma-controller@7010000 {
+				compatible = "cix,sky1-dma350", "arm,dma-350";
+				reg = <0x0 0x07010000 0x0 0x10000>;
+				clocks = <&audss_cru CLK_DMAC_AXI>;
+				resets = <&audss_cru AUDSS_DMAC_SW_RST>;
+				/*
+				 * The AUDSS CRU gates each DMAC channel interrupt
+				 * before it reaches the GIC. AUDSS_DMAC_INFO_AP_IRQ
+				 * is at CRU offset 0x54.
+				 */
+				cix,irq-router = <&audss_cru>;
+				interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>;
+				#dma-cells = <1>;
+			};
+		};
+
 		audss_cru: clock-controller@7110000 {
 			compatible = "cix,sky1-audss-cru";
 			reg = <0x0 0x07110000 0x0 0x10000>;
-- 
2.54.0

