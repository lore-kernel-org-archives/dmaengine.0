Return-Path: <SRS0=nrMa=WX=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B51EBC3A5A6
	for <dmaengine@archiver.kernel.org>; Tue, 27 Aug 2019 11:12:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 90F77217F5
	for <dmaengine@archiver.kernel.org>; Tue, 27 Aug 2019 11:12:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727048AbfH0LMN (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 27 Aug 2019 07:12:13 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:44344 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725793AbfH0LMN (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Tue, 27 Aug 2019 07:12:13 -0400
X-IronPort-AV: E=Sophos;i="5.64,436,1559487600"; 
   d="scan'208";a="25050326"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 27 Aug 2019 20:12:11 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 786384007F56;
        Tue, 27 Aug 2019 20:12:11 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     vkoul@kernel.org
Cc:     dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] dmaengine: rcar-dmac: minor modifications
Date:   Tue, 27 Aug 2019 20:10:29 +0900
Message-Id: <1566904231-25486-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

This patch series is based on renesas-drivers.git /
renesas-drivers-2019-08-13-v5.3-rc4 tag. This is minor modifications
to add support for changed registers memory mapping hardware support
easily in the future.

Yoshihiro Shimoda (2):
  dmaengine: rcar-dmac: Use of_data values instead of a macro
  dmaengine: rcar-dmac: Use devm_platform_ioremap_resource()

 drivers/dma/sh/rcar-dmac.c | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

-- 
2.7.4

