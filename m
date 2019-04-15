Return-Path: <SRS0=BZfm=SR=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA42C10F12
	for <dmaengine@archiver.kernel.org>; Mon, 15 Apr 2019 12:15:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8F45D20825
	for <dmaengine@archiver.kernel.org>; Mon, 15 Apr 2019 12:15:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k0T6x4sW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727496AbfDOMPg (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 15 Apr 2019 08:15:36 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45571 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727505AbfDOMPe (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Mon, 15 Apr 2019 08:15:34 -0400
Received: by mail-pl1-f196.google.com with SMTP id bf11so8459242plb.12
        for <dmaengine@vger.kernel.org>; Mon, 15 Apr 2019 05:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=EPBexP/YCMERN6VOL5fv1yV7pop7BN15G/3B+N0nQ3U=;
        b=k0T6x4sWoWO1mBc+OId0DMBw+LrVnMU9zm0p6EsTYO/gUBNMYZKo11zY+DswnZgNt9
         hvgxI0ywLRGa/hlJyBh506+Le5G4rFLeuxya780+q9eWikKxy5O8aa0W/8gUdOOgE+np
         +FMg36Tr6d8dmrUl4QkCHHOgqLjaCvk6UvWbVIXZXio120GB05/WUAhYgaSyCabsZZei
         sax3hHlC/z6qHbXVkOmlIz+6SZw+rp4CMc2+cxPc5twLByBb1aPExtKsDBTydLG5yAcB
         xFDHS8C7Uzmn04mEefA0Xs6oJBmLCpJyJok+fN94irPRBuLhOmGMbLtslyRZj9czrBwD
         27Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=EPBexP/YCMERN6VOL5fv1yV7pop7BN15G/3B+N0nQ3U=;
        b=pVZ21fzG94XV/hZLTLZ+lbHHTqxuGNmBjQr1RcbaXH+M3LNf2jkl9sAC3XCMnkcPye
         BeytUFm3pS36++EILVPuRVHdQQZyesCTK3HOjVVlXYyZBxX40bULp8VWNrzzOQYXuGvT
         O32/L6HSyd9TIrn2/RCFUDedu9NA+bCXhDmcA5NsUotbBcUMIMVVBVBv7/xs5BVqRU+6
         QrUAyF0ZRGhlJ6In5bVnDGsViq94TgdJdZjFUYLkYaaIK1zthRCq0JJSvUnyGU+cCJ/e
         72VsEpSAHQjnp3/azioBGB6YE1aRAVm0pN6CUWQJwiw8EJ0lQdOTpXIQ1D/IH9VkbRR0
         1CbQ==
X-Gm-Message-State: APjAAAUMOCe4o25kUrZDDfkRroopS+/3ZfSMUT8RJyauelKPFLeImCxW
        0H7erQf2GTf+Q2Y/xLoRrLfanw==
X-Google-Smtp-Source: APXvYqz6YojtFUUCP32JI2uCJ0plSoSuhQ4QnxncHO0rwmGARrnpkNtjTTtNr1F1bEYZuEEJYILPYg==
X-Received: by 2002:a17:902:d701:: with SMTP id w1mr76553552ply.124.1555330533557;
        Mon, 15 Apr 2019 05:15:33 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.102])
        by smtp.gmail.com with ESMTPSA id 6sm64157155pfj.95.2019.04.15.05.15.30
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 15 Apr 2019 05:15:32 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     dan.j.williams@intel.com, vkoul@kernel.org
Cc:     eric.long@unisoc.com, orsonzhai@gmail.com, zhang.lyra@gmail.com,
        broonie@kernel.org, baolin.wang@linaro.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] dmaengine: sprd: Fix block length overflow
Date:   Mon, 15 Apr 2019 20:14:59 +0800
Message-Id:
 <93626039ad49c1c9d5726218b060c2267c1779cf.1555330115.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1555330115.git.baolin.wang@linaro.org>
References: <cover.1555330115.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1555330115.git.baolin.wang@linaro.org>
References: <cover.1555330115.git.baolin.wang@linaro.org>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190415121459.feQ6znxAG6fglS46RJO_TwQsS_Y-af5viHTQDLM1UYo@z>

From: Eric Long <eric.long@unisoc.com>

The maximum value of block length is 0xffff, so if the configured transfer length
is more than 0xffff, that will cause block length overflow to lead a configuration
error.

Thus we can set block length as the maximum burst length to avoid this issue, since
the maximum burst length will not be a big value which is more than 0xffff.

Signed-off-by: Eric Long <eric.long@unisoc.com>
Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/dma/sprd-dma.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
index 9f99d4b..a64271e 100644
--- a/drivers/dma/sprd-dma.c
+++ b/drivers/dma/sprd-dma.c
@@ -778,7 +778,7 @@ static int sprd_dma_fill_desc(struct dma_chan *chan,
 	temp |= slave_cfg->src_maxburst & SPRD_DMA_FRG_LEN_MASK;
 	hw->frg_len = temp;
 
-	hw->blk_len = len & SPRD_DMA_BLK_LEN_MASK;
+	hw->blk_len = slave_cfg->src_maxburst & SPRD_DMA_BLK_LEN_MASK;
 	hw->trsc_len = len & SPRD_DMA_TRSC_LEN_MASK;
 
 	temp = (dst_step & SPRD_DMA_TRSF_STEP_MASK) << SPRD_DMA_DEST_TRSF_STEP_OFFSET;
-- 
1.7.9.5

