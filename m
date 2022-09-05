Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA5AC6FA86
	for <dmaengine@archiver.kernel.org>; Mon,  5 Sep 2022 07:29:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235891AbiIEH3g (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 5 Sep 2022 03:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237450AbiIEH2C (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Mon, 5 Sep 2022 03:28:02 -0400
X-Greylist: delayed 310 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 05 Sep 2022 00:27:12 PDT
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3345AB69;
        Mon,  5 Sep 2022 00:27:12 -0700 (PDT)
From:   =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
        t=1662362517; bh=lOUdKjM63vhO0T+j6pqlxE6SWF9QKCLU2WE1cQBJyRw=;
        h=From:To:Cc:Subject:Date;
        b=pS74r3S2HWyehRNTdLfOqcK9jEH4nYjyagt9/59ATpMJfmOxHDnKLDKx5xmqPMrwE
         sxRwijnBARH8L9WTFdwZ0+tPtGFnjmgQiWEIW46B9zBEo+93tR1RcHzurDHF3PzTAL
         UbJapWahgPeJQUisyAsTyyTPNtlZ78lMF2AvUKeo=
To:     Vinod Koul <vkoul@kernel.org>
Cc:     =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
        asahi@lists.linux.dev, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dmaengine: apple-admac: Fix grabbing of channels in of_xlate
Date:   Mon,  5 Sep 2022 09:21:09 +0200
Message-Id: <20220905072110.72094-1-povik+lin@cutebit.org>
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
index d1f74a3aa999..6780761a1640 100644
--- a/drivers/dma/apple-admac.c
+++ b/drivers/dma/apple-admac.c
@@ -490,7 +490,7 @@ static struct dma_chan *admac_dma_of_xlate(struct of_phandle_args *dma_spec,
 		return NULL;
 	}
 
-	return &ad->channels[index].chan;
+	return dma_get_slave_channel(&ad->channels[index].chan);
 }
 
 static int admac_drain_reports(struct admac_data *ad, int channo)
-- 
2.33.0

