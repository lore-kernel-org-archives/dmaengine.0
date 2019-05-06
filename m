Return-Path: <SRS0=ODwx=TG=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA5FC46476
	for <dmaengine@archiver.kernel.org>; Mon,  6 May 2019 07:29:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 820EB2082F
	for <dmaengine@archiver.kernel.org>; Mon,  6 May 2019 07:29:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QM6C/+Cx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbfEFH26 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 6 May 2019 03:28:58 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:40269 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726337AbfEFH25 (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Mon, 6 May 2019 03:28:57 -0400
Received: by mail-pl1-f193.google.com with SMTP id b3so5917229plr.7
        for <dmaengine@vger.kernel.org>; Mon, 06 May 2019 00:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=XiE8oaht+rMtBmlWqUkyAiRGtKqurxER2iPBNv/AZyQ=;
        b=QM6C/+CxMNKnMh006FzIBzR75xV6ddm6r2gjuSGSnBTOuDfQ0qvMZAiep9jBsBelyX
         teqGh33rlt74rnloK7VIXqKkie8/XG90UQlY9PEUqS5i6oYPFe1u9h3hNCHny+nnwi01
         sqd4g8X8ILX5QLXgsR+H16BiiIRX3xekPo/+zeuPEtWO8CBbs1UhDfu7RtPcFiwhRs+s
         xl5tF5Punv/vtUbqy/LiKvRqzGspIdKQN8b6+bHCzCbWHN+D+1W4fnyPKnGz1w98WLXf
         AXbuaK9LrIvC7nQKLYh/0PJxEvCq+BkYvRi/lRTtC5YWoagquPmnnPC/pTgi4/ky7SnV
         p3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=XiE8oaht+rMtBmlWqUkyAiRGtKqurxER2iPBNv/AZyQ=;
        b=TRMcHm8EQIixku5unr+rJUSgGohiXZ3PPve3HRzjkDQK1/cMhbgEK5u4JdrkrXsauP
         YRkliQMJxg5QRQc2erntRo4P7RMNU6LJK/mrho4pthfg/Z0hFoqsQyO+tLT4ve6u56OE
         pmQ8kj3a8QWp5sAZuxNDeK3PfSdFcsbMmvBmdS0y+YX/AS7ZI53SOxZwBfJIUqigRujk
         pJKrIo4Yrr23fCHPJduN0Xj7Dh+Aa1DuE/icxZ3GPO4AxGmbVidATF+V9ibNyN3s3fbd
         zo8t8NwDJZXzpY2J8v1Z6epJqoBJpD9/iOvO7OdSkcs/5/LKO32nctqTvY2pYkrv3R4w
         Sonw==
X-Gm-Message-State: APjAAAUAQum5vLrwj12OStEMDTCHGDSyy/TchYBLEIV7/OBRREuz/VEs
        zFppPmEE4CRR8VYj0RRD/YlwJdKKw5no3w==
X-Google-Smtp-Source: APXvYqyBQXCG2IHBXGY3XWmAbAAHiq6tcvTP9kRhpMo9V9eQzxxH1EXyIhGDtVHdER/iEPX7+cT3qQ==
X-Received: by 2002:a17:902:7883:: with SMTP id q3mr30341452pll.60.1557127736687;
        Mon, 06 May 2019 00:28:56 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.102])
        by smtp.gmail.com with ESMTPSA id w38sm21700894pgk.90.2019.05.06.00.28.53
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 06 May 2019 00:28:56 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     dan.j.williams@intel.com, vkoul@kernel.org
Cc:     eric.long@unisoc.com, orsonzhai@gmail.com, zhang.lyra@gmail.com,
        vincent.guittot@linaro.org, baolin.wang@linaro.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] dmaengine: sprd: Add validation of current descriptor in irq handler
Date:   Mon,  6 May 2019 15:28:29 +0800
Message-Id: <6eee7d5ad68d60ebedf443e24678e5b467fcf0e6.1557127239.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1557127239.git.baolin.wang@linaro.org>
References: <cover.1557127239.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1557127239.git.baolin.wang@linaro.org>
References: <cover.1557127239.git.baolin.wang@linaro.org>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

When user terminates one DMA channel to free all its descriptors, but
at the same time one transaction interrupt was triggered possibly, now
we should not handle this interrupt by validating if the 'schan->cur_desc'
was set as NULL to avoid crashing the kernel.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/dma/sprd-dma.c |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
index e29342a..431e289 100644
--- a/drivers/dma/sprd-dma.c
+++ b/drivers/dma/sprd-dma.c
@@ -552,12 +552,17 @@ static irqreturn_t dma_irq_handle(int irq, void *dev_id)
 		schan = &sdev->channels[i];
 
 		spin_lock(&schan->vc.lock);
+
+		sdesc = schan->cur_desc;
+		if (!sdesc) {
+			spin_unlock(&schan->vc.lock);
+			return IRQ_HANDLED;
+		}
+
 		int_type = sprd_dma_get_int_type(schan);
 		req_type = sprd_dma_get_req_type(schan);
 		sprd_dma_clear_int(schan);
 
-		sdesc = schan->cur_desc;
-
 		/* cyclic mode schedule callback */
 		cyclic = schan->linklist.phy_addr ? true : false;
 		if (cyclic == true) {
-- 
1.7.9.5

