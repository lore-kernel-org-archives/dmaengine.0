Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9005C48BE5
	for <dmaengine@archiver.kernel.org>; Fri, 11 Jun 2021 11:36:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2946613CC
	for <dmaengine@archiver.kernel.org>; Fri, 11 Jun 2021 11:36:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231366AbhFKLiq (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 11 Jun 2021 07:38:46 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:25640 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230514AbhFKLiq (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Fri, 11 Jun 2021 07:38:46 -0400
X-IronPort-AV: E=Sophos;i="5.83,265,1616425200"; 
   d="scan'208";a="84098785"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Jun 2021 20:36:47 +0900
Received: from localhost.localdomain (unknown [10.226.92.121])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8B16F401BBFD;
        Fri, 11 Jun 2021 20:36:45 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/5] Add RZ/G2L DMAC support
Date:   Fri, 11 Jun 2021 12:36:37 +0100
Message-Id: <20210611113642.18457-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

This patch series add basic support for RZ/G2L DMAC driver.

It is based on the work done by Chris Brandt for RZ/A DMA driver.

This patch set is based on master branch [1]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/

Biju Das (5):
  dt-bindings: dma: Document RZ/G2L bindings
  drivers: clk: renesas: r9a07g044-cpg: Add DMAC clocks
  drivers: dma: sh: Add DMAC driver for RZ/G2L SoC
  arm64: dts: renesas: r9a07g044: Add DMAC support
  arm64: defconfig: Enable DMA controller for RZ/G2L SoC's

 .../bindings/dma/renesas,rz-dmac.yaml         |  132 +++
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    |   38 +
 arch/arm64/configs/defconfig                  |    1 +
 drivers/clk/renesas/r9a07g044-cpg.c           |    3 +
 drivers/dma/sh/Kconfig                        |    8 +
 drivers/dma/sh/Makefile                       |    1 +
 drivers/dma/sh/rz-dmac.c                      | 1050 +++++++++++++++++
 7 files changed, 1233 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
 create mode 100644 drivers/dma/sh/rz-dmac.c

-- 
2.17.1

