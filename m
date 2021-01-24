Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9FCC433DB
	for <dmaengine@archiver.kernel.org>; Sun, 24 Jan 2021 07:11:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB4DD22C7E
	for <dmaengine@archiver.kernel.org>; Sun, 24 Jan 2021 07:11:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbhAXHLJ (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Sun, 24 Jan 2021 02:11:09 -0500
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:54745 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbhAXHLI (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Sun, 24 Jan 2021 02:11:08 -0500
Received: from localhost.localdomain ([92.131.99.25])
        by mwinf5d58 with ME
        id LX9Q2400D0Ys01Y03X9Ral; Sun, 24 Jan 2021 08:09:26 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 24 Jan 2021 08:09:26 +0100
X-ME-IP: 92.131.99.25
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     peter.ujfalusi@gmail.com, dan.j.williams@intel.com,
        vkoul@kernel.org
Cc:     dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] dmaengine: ti: k3-udma: Fix a resource leak in an error handling path
Date:   Sun, 24 Jan 2021 08:09:23 +0100
Message-Id: <20210124070923.724479-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

In 'dma_pool_create()', we return -ENOMEM, but don't release the resources
already allocated, as in all the other error handling paths.

Go to 'err_res_free' instead of returning directly.

Fixes: 017794739702 ("dmaengine: ti: k3-udma: Initial support for K3 BCDMA")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is not even compile tested.
I don't have the needed configuration.
---
 drivers/dma/ti/k3-udma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 8e3fd1119a77..96ad21869ba7 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -2447,7 +2447,8 @@ static int bcdma_alloc_chan_resources(struct dma_chan *chan)
 			dev_err(ud->ddev.dev,
 				"Descriptor pool allocation failed\n");
 			uc->use_dma_pool = false;
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto err_res_free;
 		}
 
 		uc->use_dma_pool = true;
-- 
2.27.0

