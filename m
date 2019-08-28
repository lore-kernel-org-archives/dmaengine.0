Return-Path: <SRS0=2FgE=WY=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 548D0C41514
	for <dmaengine@archiver.kernel.org>; Wed, 28 Aug 2019 11:15:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 363F422CF5
	for <dmaengine@archiver.kernel.org>; Wed, 28 Aug 2019 11:15:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbfH1LPj (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 28 Aug 2019 07:15:39 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:61955 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726293AbfH1LPj (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Wed, 28 Aug 2019 07:15:39 -0400
X-IronPort-AV: E=Sophos;i="5.64,440,1559487600"; 
   d="scan'208";a="25148804"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 28 Aug 2019 20:15:37 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5E54642296E6;
        Wed, 28 Aug 2019 20:15:37 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     vkoul@kernel.org
Cc:     dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] dmaengine: rcar-dmac: Add dma-channel-mask property support
Date:   Wed, 28 Aug 2019 20:13:53 +0900
Message-Id: <1566990835-27028-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

This patch series is based on
 - renesas-drivers.git / renesas-drivers-2019-08-13-v5.3-rc4 tag
 - and the following patch series:
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=165881

The commit e2d896c08ca3 ("Documentation: bindings: dma: Add binding for
dma-channel-mask") adds the generic property and R-Car also has such
use cases so that I made this patch series. Before adding the property
support, I made a clean-up patch as the patch 1/2.

Yoshihiro Shimoda (2):
  dmaengine: rcar-dmac: Don't set DMACHCLR bit 0 to 1 if iommu is mapped
  dmaengine: rcar-dmac: Add dma-channel-mask property support

 drivers/dma/sh/rcar-dmac.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

-- 
2.7.4

