Return-Path: <SRS0=0QqC=C5=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A7D7C43466
	for <dmaengine@archiver.kernel.org>; Sun, 20 Sep 2020 12:16:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F2CF21531
	for <dmaengine@archiver.kernel.org>; Sun, 20 Sep 2020 12:16:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbgITMQd (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Sun, 20 Sep 2020 08:16:33 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:33987 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726273AbgITMQa (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Sun, 20 Sep 2020 08:16:30 -0400
X-Greylist: delayed 431 seconds by postgrey-1.27 at vger.kernel.org; Sun, 20 Sep 2020 08:16:20 EDT
X-IronPort-AV: E=Sophos;i="5.77,282,1596492000"; 
   d="scan'208";a="468612195"
Received: from palace.lip6.fr ([132.227.105.202])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/AES256-SHA256; 20 Sep 2020 14:08:58 +0200
From:   Julia Lawall <Julia.Lawall@inria.fr>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     kernel-janitors@vger.kernel.org,
        Dan Williams <dan.j.williams@intel.com>,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 09/14] dmaengine: rcar-dmac: drop double zeroing
Date:   Sun, 20 Sep 2020 13:26:21 +0200
Message-Id: <1600601186-7420-10-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
References: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

sg_init_table zeroes its first argument, so the allocation of that argument
doesn't have to.

the semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x,n,flags;
@@

x = 
- kcalloc
+ kmalloc_array
  (n,sizeof(*x),flags)
...
sg_init_table(x,n)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/dma/sh/rcar-dmac.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -1227,7 +1227,7 @@ rcar_dmac_prep_dma_cyclic(struct dma_cha
 	 * Allocate the sg list dynamically as it would consume too much stack
 	 * space.
 	 */
-	sgl = kcalloc(sg_len, sizeof(*sgl), GFP_NOWAIT);
+	sgl = kmalloc_array(sg_len, sizeof(*sgl), GFP_NOWAIT);
 	if (!sgl)
 		return NULL;
 

