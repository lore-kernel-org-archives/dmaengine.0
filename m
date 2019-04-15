Return-Path: <SRS0=BZfm=SR=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 945C2C10F12
	for <dmaengine@archiver.kernel.org>; Mon, 15 Apr 2019 12:15:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 64A9E217D6
	for <dmaengine@archiver.kernel.org>; Mon, 15 Apr 2019 12:15:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XZ3GWmt1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727335AbfDOMP0 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 15 Apr 2019 08:15:26 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44552 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727482AbfDOMP0 (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Mon, 15 Apr 2019 08:15:26 -0400
Received: by mail-pg1-f195.google.com with SMTP id i2so8481425pgj.11
        for <dmaengine@vger.kernel.org>; Mon, 15 Apr 2019 05:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=l9ir60nNJwBbII3Z7YfygeQjey9MNonvD8+mCs5l+c4=;
        b=XZ3GWmt1mWC7qqDk0CPUMjbeP75BO7JsbiGnDALS1fBKvH9BaB8hWahTFAEy+c4eNd
         bwLKGTd3LrMkmeBsQ4r81KbvlCg4JPSsx3nPRGh29o4erxiT+uTL4DJ0Yl+J1JG0pmWV
         UROk08EZ3klQ2fO6BBKeLCN+dladovWVISj58XT/H0kjpcXZPMJZ0Nv/4DEpUU5b6jd4
         ACocZm20dVGjbONsv8C7eLZZve99otr8o6wQDye6PjU8/eucZhH/oNQqVmCkr0Fc9YWA
         +mMpDMi4f6QzajlBm23N/sz1qZ39Lf2doqpQN5upgUdgSWlrEvbjM2VDL2I8dNC0aEd9
         QuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=l9ir60nNJwBbII3Z7YfygeQjey9MNonvD8+mCs5l+c4=;
        b=KOT5ZNdlD3jAU9Q25OztRzfGs+Yaub4pXNYSWtkyQSR8jBdBBUaI213mjxnsc8zVt9
         Lh/3Xki3aDQkZobjXKs4VH386oACOBuz0ICRixeMIlkzUCs+n7+2jh0T/6fDJdwcJm+T
         Mpod6ne/2gcnGZf2GuzFDLPWdrVzKJcXj8sXLKq2MH+5q3NGrw8IE+pC3cOm+LS6IKEo
         /EJyMVqr0xhppHEHLWAuBMdE8hnW907e/8pmDJxRlX/fVz7X127p/Z22fdg98yA4HQAh
         em+BN3/34qvUJzzqtbMpMq1DTiNPRAPzZHxCFgPtj64WVibbALvoDw8Pu0TjiZQxkFx9
         CnWA==
X-Gm-Message-State: APjAAAVwhERm8Rwnh3XAvLNyDcQXGWwXDS+vpCXhMWNJvkSNLyDUK6Af
        fls1iOK1LpjkilnAUK6ay1XpLg==
X-Google-Smtp-Source: APXvYqwvy3o1loKMe5y4T1evlTYCE1hZ0agu92GNiNDBU3S1WzJjPEqKOC428FOIh/6JILVAEfglmw==
X-Received: by 2002:a62:62c3:: with SMTP id w186mr42971295pfb.73.1555330525672;
        Mon, 15 Apr 2019 05:15:25 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.102])
        by smtp.gmail.com with ESMTPSA id 6sm64157155pfj.95.2019.04.15.05.15.22
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 15 Apr 2019 05:15:24 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     dan.j.williams@intel.com, vkoul@kernel.org
Cc:     eric.long@unisoc.com, orsonzhai@gmail.com, zhang.lyra@gmail.com,
        broonie@kernel.org, baolin.wang@linaro.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] dmaengine: sprd: Fix the incorrect start for 2-stage destination channels
Date:   Mon, 15 Apr 2019 20:14:57 +0800
Message-Id:
 <035654558b82bc26ee78a815cc9287e478baac92.1555330115.git.baolin.wang@linaro.org>
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
Message-ID: <20190415121457.xeYOqmCnEBPvdcaqzCDQmfag6B91lin0UyIafBRyLJY@z>

From: Eric Long <eric.long@unisoc.com>

The 2-stage destination channel will be triggered by source channel
automatically, which means we should not trigger it by software request.

Signed-off-by: Eric Long <eric.long@unisoc.com>
Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/dma/sprd-dma.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
index 431e289..0f92e60 100644
--- a/drivers/dma/sprd-dma.c
+++ b/drivers/dma/sprd-dma.c
@@ -510,7 +510,9 @@ static void sprd_dma_start(struct sprd_dma_chn *schan)
 	sprd_dma_set_uid(schan);
 	sprd_dma_enable_chn(schan);
 
-	if (schan->dev_id == SPRD_DMA_SOFTWARE_UID)
+	if (schan->dev_id == SPRD_DMA_SOFTWARE_UID &&
+	    schan->chn_mode != SPRD_DMA_DST_CHN0 &&
+	    schan->chn_mode != SPRD_DMA_DST_CHN1)
 		sprd_dma_soft_request(schan);
 }
 
-- 
1.7.9.5

