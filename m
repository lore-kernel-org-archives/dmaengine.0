Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01AC5C4332F
	for <dmaengine@archiver.kernel.org>; Wed, 19 Oct 2022 13:36:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbiJSNgl (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 19 Oct 2022 09:36:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbiJSNgG (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Wed, 19 Oct 2022 09:36:06 -0400
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E708D11E47E;
        Wed, 19 Oct 2022 06:24:53 -0700 (PDT)
From:   =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
        t=1666185808; bh=00XpFFUQMJvRxGis99g6ozE8OJO2nXC2MC4LveWM/4k=;
        h=From:To:Cc:Subject:Date;
        b=qgn+em+fUXd9c0OqunKrr0HB3TkgnoqpJfVxHZFO6AbzjzhRilDuwHSOmsTGrMKB8
         ogODkpAq9wKcMnmPLRGOEqhmsf4aQVj72qARmqJ25hsLxLDdBgJ2QpQ8x36gbgRa1c
         x1beH56jVvPOmCxtHvIwJh9YqCbaXOSc7c4TIHis=
To:     Vinod Koul <vkoul@kernel.org>
Cc:     =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
        asahi@lists.linux.dev, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dmaengine: apple-admac: Fix grabbing of channels in of_xlate
Date:   Wed, 19 Oct 2022 15:23:23 +0200
Message-Id: <20221019132324.8585-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

The of_xlate callback is supposed to return the channel after already
having 'grabbed' it for private use, so fill that in.

Fixes: b127315d9a78 ("dmaengine: apple-admac: Add Apple ADMAC driver")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 drivers/dma/apple-admac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index 317ca76ccafd..a2cc520225d3 100644
--- a/drivers/dma/apple-admac.c
+++ b/drivers/dma/apple-admac.c
@@ -493,7 +493,7 @@ static struct dma_chan *admac_dma_of_xlate(struct of_phandle_args *dma_spec,
 		return NULL;
 	}
 
-	return &ad->channels[index].chan;
+	return dma_get_slave_channel(&ad->channels[index].chan);
 }
 
 static int admac_drain_reports(struct admac_data *ad, int channo)
-- 
2.33.0

