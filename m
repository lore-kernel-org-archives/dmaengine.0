Return-Path: <SRS0=AlLT=77=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2465C433DF
	for <dmaengine@archiver.kernel.org>; Thu, 18 Jun 2020 12:07:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFAAB207D8
	for <dmaengine@archiver.kernel.org>; Thu, 18 Jun 2020 12:07:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728519AbgFRMHr (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 18 Jun 2020 08:07:47 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:14448 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727922AbgFRMHq (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Thu, 18 Jun 2020 08:07:46 -0400
X-IronPort-AV: E=Sophos;i="5.73,526,1583161200"; 
   d="scan'208";a="50015174"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 18 Jun 2020 21:07:44 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B8CA0400C75C;
        Thu, 18 Jun 2020 21:07:44 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     vkoul@kernel.org
Cc:     dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2] dmaengine: sh: usb-dmac: set tx_result parameters
Date:   Thu, 18 Jun 2020 21:07:33 +0900
Message-Id: <1592482053-19433-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

A client driver (renesas_usbhs) assumed that
dmaengine_tx_status() could return the residue even if
the transfer was completed. However, this was not correct
usage [1] and this caused to break getting the residue after
the commit 24461d9792c2 ("dmaengine: virt-dma: Fix access after
free in vchan_complete()") actually. So, this is possible to get
wrong received size if the usb controller gets a short packet.
For example, g_zero driver causes "bad OUT byte" errors.

To use the tx_result from the renesas_usbhs driver when
the transfer is completed, set the tx_result parameters.

Notes that the renesas_usbhs driver needs to update for it.

[1]
https://lore.kernel.org/dmaengine/20200616165550.GP2324254@vkoul-mobl/

Reported-by: Hien Dang <hien.dang.eb@renesas.com>
Fixes: 24461d9792c2 ("dmaengine: virt-dma: Fix access after free in vchan_complete()")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Changes from v1:
 - Set tx_result parameters, not change the dmaengine_tx_status behavior.
 https://patchwork.kernel.org/patch/11562783/

 drivers/dma/sh/usb-dmac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/sh/usb-dmac.c b/drivers/dma/sh/usb-dmac.c
index b218a01..8f7ceb6 100644
--- a/drivers/dma/sh/usb-dmac.c
+++ b/drivers/dma/sh/usb-dmac.c
@@ -586,6 +586,8 @@ static void usb_dmac_isr_transfer_end(struct usb_dmac_chan *chan)
 		desc->residue = usb_dmac_get_current_residue(chan, desc,
 							desc->sg_index - 1);
 		desc->done_cookie = desc->vd.tx.cookie;
+		desc->vd.tx_result.result = DMA_TRANS_NOERROR;
+		desc->vd.tx_result.residue = desc->residue;
 		vchan_cookie_complete(&desc->vd);
 
 		/* Restart the next transfer if this driver has a next desc */
-- 
2.7.4

