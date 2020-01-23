Return-Path: <SRS0=bLat=3M=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1987C33CAF
	for <dmaengine@archiver.kernel.org>; Thu, 23 Jan 2020 02:30:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7904E24676
	for <dmaengine@archiver.kernel.org>; Thu, 23 Jan 2020 02:30:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hxYPfM+y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726103AbgAWCaH (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 22 Jan 2020 21:30:07 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:59068 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbgAWCaH (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Wed, 22 Jan 2020 21:30:07 -0500
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B60232E5;
        Thu, 23 Jan 2020 03:30:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1579746603;
        bh=hb/grqckLaMiu1sHF1i9vSBO9XwWDk/n6vYFP0Nl2Jc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hxYPfM+yMlVwi0GAASftCgWmLEFbO4SlwAXGhcww8QxNsR5AT3EdbtldNOSptKmRc
         Mj2xa6BxFFvP7f9sKSQ5dvsJvIzgqA0e8iOEf1kn3a92fkRSAiTDnuxFpuQEcLPyTN
         W0w/aw4Q4iPm2PBgJvBxIUqCqvdDOgqs+bXGl26A=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     dmaengine@vger.kernel.org
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Tejas Upadhyay <tejasu@xilinx.com>,
        Satish Kumar Nagireddy <SATISHNA@xilinx.com>
Subject: [PATCH v3 6/6] arm64: dts: zynqmp: Add DPDMA node
Date:   Thu, 23 Jan 2020 04:29:39 +0200
Message-Id: <20200123022939.9739-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123022939.9739-1-laurent.pinchart@ideasonboard.com>
References: <20200123022939.9739-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Add a DT node for the DisplayPort DMA engine (DPDMA).

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm64/boot/dts/xilinx/zynqmp-clk.dtsi |  4 ++++
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi     | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-clk.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp-clk.dtsi
index 306ad2157c98..2936e5f97f84 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-clk.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-clk.dtsi
@@ -80,6 +80,10 @@ &can1 {
 	clocks = <&clk100 &clk100>;
 };
 
+&dpdma {
+	clocks = <&dpdma_clk>;
+};
+
 &fpd_dma_chan1 {
 	clocks = <&clk600>, <&clk100>;
 };
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 3c731e73903a..7e986461fd57 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -219,6 +219,16 @@ pmu@9000 {
 			};
 		};
 
+		dpdma: dma-controller@fd4c0000 {
+			compatible = "xlnx,zynqmp-dpdma";
+			status = "disabled";
+			reg = <0x0 0xfd4c0000 0x0 0x1000>;
+			interrupts = <0 122 4>;
+			interrupt-parent = <&gic>;
+			clock-names = "axi_clk";
+			#dma-cells = <1>;
+		};
+
 		/* GDMA */
 		fpd_dma_chan1: dma@fd500000 {
 			status = "disabled";
-- 
Regards,

Laurent Pinchart

