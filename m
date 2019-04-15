Return-Path: <SRS0=BZfm=SR=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E216C10F0E
	for <dmaengine@archiver.kernel.org>; Mon, 15 Apr 2019 12:15:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6088520645
	for <dmaengine@archiver.kernel.org>; Mon, 15 Apr 2019 12:15:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SYRkR298"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727527AbfDOMPm (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 15 Apr 2019 08:15:42 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39857 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727518AbfDOMPh (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Mon, 15 Apr 2019 08:15:37 -0400
Received: by mail-pg1-f195.google.com with SMTP id k3so8492462pga.6
        for <dmaengine@vger.kernel.org>; Mon, 15 Apr 2019 05:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=OLZzLqUboevMo/zGKOZIE23Q23oS2GeJKEJKfaBooIQ=;
        b=SYRkR298A05uhWDzh3IUYZxWHo6jbGm4Y12GyENCpC0LW3h39lL+yHnRPlVBfvq0nv
         luuqBV0yEWf3bYy8ktE9+x3k+80S3LAYhP3slKw1pXNeX+vqzSbtjqk+QXhBX9CFyi57
         m9LxZzhQJUgifPk+56jRx0Tyuyi+vlAcB/W1hVdasAOAdzxFj2CoipBJ1UGJ72wgBKXX
         NLC0zIlPNIWrEDIQB73d7HImzT5QSdZrBU3Itnco6IwleZlnrkvWRUaZ5r/ux7WMuto2
         gom2m98f2ucsoSixQcKZsWM8IY+1q97kd+OgW2t+0FIMtg4XPzZoBL/cyl5WQovKAQHx
         JTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=OLZzLqUboevMo/zGKOZIE23Q23oS2GeJKEJKfaBooIQ=;
        b=peelsymfT7Z6LPtCPpye1HkleQ1m4E9poeT3hYy4iPBHA2N+TUiCXz003H3ZoppiUO
         bhCquhFRbv8Y9RBLF0/1oPal1/92i/54yIPdg49khG96WA0Mq8a9FkKRAk6UTq1TEfoY
         PkhitEwXsRIxIXtW2hl6Yv6CjrqFAf038gOtI0Uw+WDNCSbba4Ync1DwM34n58ldkh5n
         9lodZok5ACrtPHHEb8jAV5U4gGcClXiYUFFG6l9o7obWNaH+/PlD6ykDfczWKKNHbUCT
         IESaIq67dFl/fGVUsSf5cfaEm4fyGdHhvMaiqsr3I18n2WHp0ZEtnW9I/nLakb8sPWqK
         DFnA==
X-Gm-Message-State: APjAAAWHGOTd6lxJFz9Jgb4wKNH81vKCRKNcZTmhsV+94KseD3jLdJ4s
        vQ7sfCAdeJhaqxGpET4DBnqetg==
X-Google-Smtp-Source: APXvYqwYNHweGeNHukStorwJm0SMxCCUmZwndTeN2AzIvl47d2aqEeODnwcCaK3ITyy/7S2pFAX1pw==
X-Received: by 2002:aa7:8251:: with SMTP id e17mr57741476pfn.147.1555330537319;
        Mon, 15 Apr 2019 05:15:37 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.102])
        by smtp.gmail.com with ESMTPSA id 6sm64157155pfj.95.2019.04.15.05.15.33
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 15 Apr 2019 05:15:36 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     dan.j.williams@intel.com, vkoul@kernel.org
Cc:     eric.long@unisoc.com, orsonzhai@gmail.com, zhang.lyra@gmail.com,
        broonie@kernel.org, baolin.wang@linaro.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] dmaengine: sprd: Fix the right place to configure 2-stage transfer
Date:   Mon, 15 Apr 2019 20:15:00 +0800
Message-Id:
 <8fe45a4139ba57eb014d921b6988e43f7fe07b11.1555330115.git.baolin.wang@linaro.org>
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
Message-ID: <20190415121500.G-7c_vOiVXcl1v0L-SBhHHblWagdprvSYkx4vlximRg@z>

From: Eric Long <eric.long@unisoc.com>

Move the 2-stage configuration before configuring the link-list mode,
since we will use some 2-stage configuration to fill the link-list
configuration.

Signed-off-by: Eric Long <eric.long@unisoc.com>
Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/dma/sprd-dma.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
index a64271e..cc9c24d 100644
--- a/drivers/dma/sprd-dma.c
+++ b/drivers/dma/sprd-dma.c
@@ -911,6 +911,12 @@ static int sprd_dma_fill_linklist_desc(struct dma_chan *chan,
 		schan->linklist.virt_addr = 0;
 	}
 
+	/* Set channel mode and trigger mode for 2-stage transfer */
+	schan->chn_mode =
+		(flags >> SPRD_DMA_CHN_MODE_SHIFT) & SPRD_DMA_CHN_MODE_MASK;
+	schan->trg_mode =
+		(flags >> SPRD_DMA_TRG_MODE_SHIFT) & SPRD_DMA_TRG_MODE_MASK;
+
 	sdesc = kzalloc(sizeof(*sdesc), GFP_NOWAIT);
 	if (!sdesc)
 		return NULL;
@@ -944,12 +950,6 @@ static int sprd_dma_fill_linklist_desc(struct dma_chan *chan,
 		}
 	}
 
-	/* Set channel mode and trigger mode for 2-stage transfer */
-	schan->chn_mode =
-		(flags >> SPRD_DMA_CHN_MODE_SHIFT) & SPRD_DMA_CHN_MODE_MASK;
-	schan->trg_mode =
-		(flags >> SPRD_DMA_TRG_MODE_SHIFT) & SPRD_DMA_TRG_MODE_MASK;
-
 	ret = sprd_dma_fill_desc(chan, &sdesc->chn_hw, 0, 0, src, dst, len,
 				 dir, flags, slave_cfg);
 	if (ret) {
-- 
1.7.9.5

