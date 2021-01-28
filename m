Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A33C433E6
	for <dmaengine@archiver.kernel.org>; Thu, 28 Jan 2021 08:56:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 451E064DD1
	for <dmaengine@archiver.kernel.org>; Thu, 28 Jan 2021 08:56:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231664AbhA1Iy4 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 28 Jan 2021 03:54:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232220AbhA1Ip3 (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Thu, 28 Jan 2021 03:45:29 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EDDCC061574
        for <dmaengine@vger.kernel.org>; Thu, 28 Jan 2021 00:45:01 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id N8kx2400T4C55Sk018kxDA; Thu, 28 Jan 2021 09:44:59 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l52vB-001JYO-AL; Thu, 28 Jan 2021 09:44:57 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l52vA-009O1c-Tn; Thu, 28 Jan 2021 09:44:56 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 0/4] dmaengine: rcar-dmac: Add support for R-Car V3U
Date:   Thu, 28 Jan 2021 09:44:51 +0100
Message-Id: <20210128084455.2237256-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

	Hi Vinod,

This patch series adds support for the Direct Memory Access Controller
variant in the Renesas R-Car V3U (R8A779A0) SoC, to both DT bindings and
driver.

Changes compared to v2:
  - Add Reviewed-by, Tested-by,
  - Place iterator after container being iterated,
  - Stop passing index to rcar_dmac_chan_probe().

Changes compared to v1:
  - Add Reviewed-by,
  - Put the full loop control of for_each_rcar_dmac_chan() on a single
    line, to improve readability,
  - Use two separate named regions instead of array,
  - Drop rcar_dmac_of_data.chan_reg_block, check for
    !rcar_dmac_of_data.chan_offset_base instead,
  - Precalculate chan_base in rcar_dmac_probe().

This has been tested on the Renesas Falcon board, using external SPI
loopback (spi-loopback-test) on MSIOF1 and MSIOF2.

Thanks!

Geert Uytterhoeven (4):
  dt-bindings: renesas,rcar-dmac: Add r8a779a0 support
  dmaengine: rcar-dmac: Add for_each_rcar_dmac_chan() helper
  dmaengine: rcar-dmac: Add helpers for clearing DMA channel status
  dmaengine: rcar-dmac: Add support for R-Car V3U

 .../bindings/dma/renesas,rcar-dmac.yaml       |  76 +++++++-----
 drivers/dma/sh/rcar-dmac.c                    | 112 ++++++++++++------
 2 files changed, 126 insertions(+), 62 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
