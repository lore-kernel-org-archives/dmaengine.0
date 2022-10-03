Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F4BC433F5
	for <dmaengine@archiver.kernel.org>; Mon,  3 Oct 2022 08:39:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbiJCIi7 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 3 Oct 2022 04:38:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbiJCIi3 (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Mon, 3 Oct 2022 04:38:29 -0400
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD43D5817E;
        Mon,  3 Oct 2022 01:12:06 -0700 (PDT)
From:   =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
        t=1664784710; bh=lOUdKjM63vhO0T+j6pqlxE6SWF9QKCLU2WE1cQBJyRw=;
        h=From:To:Cc:Subject:Date;
        b=ctaTHnJQldRcCXLIX3r9q0j72Cn3manep7GcIAh19t36JjO3NQDMExm86acu7uVEo
         qWjlJ/n3u2kegGNwFWia9TgCMlu3xkYfUmPgjXW9RwpusOv+vfjCpAT+NyAurrkBb7
         +5qiyUyma8iXCPVAsaMzxbWfHs4tD3rJe0jgaaYY=
To:     Vinod Koul <vkoul@kernel.org>
Cc:     =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
        asahi@lists.linux.dev, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 1/2] dmaengine: apple-admac: Fix grabbing of channels in of_xlate
Date:   Mon,  3 Oct 2022 10:10:52 +0200
Message-Id: <20221003081053.1826-1-povik+lin@cutebit.org>
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

