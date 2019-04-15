Return-Path: <SRS0=BZfm=SR=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AEB7C10F12
	for <dmaengine@archiver.kernel.org>; Mon, 15 Apr 2019 12:15:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1995720645
	for <dmaengine@archiver.kernel.org>; Mon, 15 Apr 2019 12:15:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qLRP/D/h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727471AbfDOMPY (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 15 Apr 2019 08:15:24 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42471 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727452AbfDOMPX (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Mon, 15 Apr 2019 08:15:23 -0400
Received: by mail-pg1-f194.google.com with SMTP id p6so8484243pgh.9
        for <dmaengine@vger.kernel.org>; Mon, 15 Apr 2019 05:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=XiE8oaht+rMtBmlWqUkyAiRGtKqurxER2iPBNv/AZyQ=;
        b=qLRP/D/hBzlVyCM9RDEp0f+vh3r0DuWzHyoLapUEEZa49Vw6obIm07znxPAArbNXDx
         y6lOAS00ZKnidgR6SGOXa/t9lPXGvLz2q1ti+8fdgPMQz+fteVALwWaLWAie/7RPNYgl
         g6ubl5Vdy9CbG1gzDzKSgBj6TNhnWikVKlpJld4b4VDeqtqp32k3aX7QErvNQEfWWE6e
         iuq1j14ALAK4WEAVMOv7851BZgFKS2KkKlZ0dujn8lAzV3Twm+7blCirxwnLpnlfdlA+
         FBtgU/fzY7iGtpk5ap8KVOqTRhlwfUHIGmPAcKDwT927EK3tNeHmrW5+kIdlQ4osChFs
         FAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=XiE8oaht+rMtBmlWqUkyAiRGtKqurxER2iPBNv/AZyQ=;
        b=T8jjnrXi/SRAVUZZgKaltt9M8oAv5HO3XQrrXVEQu/HMUQ6IAvOaZqpZq0kyXSrW1P
         RZGchhisSSK6EzoqWbwpc6Es+A7Yep2exnnQgBltqeGe51MeHoFzmrqaTxJzUh1QiVtS
         WNj2lDPPofX9TGzGfCDsn5SMoRFKK4PRcAju3jV1Gmsw/cjwQmqFRsypwCyHnXbNmS9/
         o5SpHErNYaHIFAMD6q7A9P6JtBdyWgDQqFu5RbLQ/4fupRqKh8GJU8LcQ81khy7q5m/i
         Z6dn9mRU6Az4gtIgAwFlbJNLNeIcm8WUU+jGq3zANJynVB2CfYYqeBYLdccDNHK/hry2
         FCuw==
X-Gm-Message-State: APjAAAWLoxUUTnpbcfATly6uOk3MdpQsk96VnwjQEYi/2ysG7kT+w7Qm
        W25IkZBCejWmfOwxexO/y3n60Q==
X-Google-Smtp-Source: APXvYqxjlmrCVN54lGUd6cUjcklkpR8/UtXRZeB3Cgyt1f6wd//reg/A3MEZcNsaUsGIwwC8zLMF9Q==
X-Received: by 2002:a63:185a:: with SMTP id 26mr43154699pgy.337.1555330522160;
        Mon, 15 Apr 2019 05:15:22 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.102])
        by smtp.gmail.com with ESMTPSA id 6sm64157155pfj.95.2019.04.15.05.15.18
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 15 Apr 2019 05:15:21 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     dan.j.williams@intel.com, vkoul@kernel.org
Cc:     eric.long@unisoc.com, orsonzhai@gmail.com, zhang.lyra@gmail.com,
        broonie@kernel.org, baolin.wang@linaro.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] dmaengine: sprd: Add validation of current descriptor in irq handler
Date:   Mon, 15 Apr 2019 20:14:56 +0800
Message-Id:
 <e2f3b8f2f5391565d0662d98524acf239ae8da6e.1555330115.git.baolin.wang@linaro.org>
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
Message-ID: <20190415121456.jf8064QzGCwihNdmb4tAvg_L9GiGypoeut5JYp7KuUM@z>

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

