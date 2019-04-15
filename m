Return-Path: <SRS0=BZfm=SR=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D0CAC10F0E
	for <dmaengine@archiver.kernel.org>; Mon, 15 Apr 2019 12:15:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CFF3B20645
	for <dmaengine@archiver.kernel.org>; Mon, 15 Apr 2019 12:15:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ucpboVWl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727244AbfDOMP5 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 15 Apr 2019 08:15:57 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34852 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727177AbfDOMPT (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Mon, 15 Apr 2019 08:15:19 -0400
Received: by mail-pf1-f193.google.com with SMTP id t21so8512482pfh.2
        for <dmaengine@vger.kernel.org>; Mon, 15 Apr 2019 05:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=CAUNijlh9/PyuN9Nu9xMccDkwi74nLVT9vlXbtkz1ds=;
        b=ucpboVWlQ5/w5Wu9P8+gVZtpfga1IRqvUoAo5DPUJU0Pxdb6xA3tpyd1e57aAy0pgb
         ieOVfBtAJXpRZlmX+n4tMGCGGW29Ce6U+Q6HYFKnLDDgGfjQRvXQU+sW3fvbiDsXBT5q
         xoHIE5eZorhruD6XJdKUujPzV+O+DgFbHynEfd/Zn795a42mbE+slNNCFEcGW3VOb7Hg
         WSm2R4TRtGlQQY0mBjPS4YHtzOABnCp0hiYddfZLU/keK/qtdoA74w0aJDpksXTM5gNY
         mE8OQW8PaFIsb4FMsKRjHLw1c1kymt/Cs2IWeMgDqIoJlEDmlNXpkEGl0QBxGHpw2OdI
         IHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=CAUNijlh9/PyuN9Nu9xMccDkwi74nLVT9vlXbtkz1ds=;
        b=YTTkS8tIj4yWr1SexUUBEpa6MpDZrZkymo+mhdIJrW53ymV1SF5/b4caF5KJuJZ3OE
         iQ5Kpdaqgh7KkJxlkgTyvnLyhxm8bfzX/dy4mtoS3kmXkYkE3zv/mq3uvNN7WRKhe9BM
         9ciF9pCkcuU7TjrQz5w7o978NwnYMiOP9bErzKQ4ihyitBfYbDF/37vR7RSH9qccBLE0
         RMkYoLjWVgmQ2uDyKeNnuSawUGTqlo0K85bbrISYW7GBtVaGNeWVClIC6t7hdzgh3sk2
         jPtW2ocDomL8HA8I8nm549FyHqeZwNb8YGGtNXuAnzWvmQ1GQdxFE9HGSuBba+rEWvw4
         y7Pg==
X-Gm-Message-State: APjAAAW62Q3S8B1reDQ193OSanvpuh8wTA9M9nXRDgwWp7cM7RL2iC7s
        QgmYVH/WXGpYRMvxLyKTxqTjvQ==
X-Google-Smtp-Source: APXvYqzFwA1PM9j5ZwIwdADWuSPlcmW3p3seKOvWmE7l0Qs8TQWml2IfQNh29iOponW4uMd7MtMLlg==
X-Received: by 2002:a63:b64:: with SMTP id a36mr70563796pgl.58.1555330518223;
        Mon, 15 Apr 2019 05:15:18 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.102])
        by smtp.gmail.com with ESMTPSA id 6sm64157155pfj.95.2019.04.15.05.15.12
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 15 Apr 2019 05:15:16 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     dan.j.williams@intel.com, vkoul@kernel.org
Cc:     eric.long@unisoc.com, orsonzhai@gmail.com, zhang.lyra@gmail.com,
        broonie@kernel.org, baolin.wang@linaro.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] dmaengine: sprd: Fix the possible crash when getting engine status
Date:   Mon, 15 Apr 2019 20:14:55 +0800
Message-Id:
 <2eecd528e85377f03e6fbc5e7d6544b9c9f59cb1.1555330115.git.baolin.wang@linaro.org>
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
Message-ID: <20190415121455.d5q1fbKxG8VwWRGbLXR_qjYpjxCvMdqndWobSeyeSSo@z>

We will get a NULL virtual descriptor by vchan_find_desc() when the descriptor
has been submitted, that will crash the kernel when getting the engine status.

In this case, since the descriptor has been submitted, which means the pointer
'schan->cur_desc' will point to the current descriptor, then we can use
'schan->cur_desc' to get the engine status to avoid this issue.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/dma/sprd-dma.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
index 48431e2..e29342a 100644
--- a/drivers/dma/sprd-dma.c
+++ b/drivers/dma/sprd-dma.c
@@ -625,7 +625,7 @@ static enum dma_status sprd_dma_tx_status(struct dma_chan *chan,
 		else
 			pos = 0;
 	} else if (schan->cur_desc && schan->cur_desc->vd.tx.cookie == cookie) {
-		struct sprd_dma_desc *sdesc = to_sprd_dma_desc(vd);
+		struct sprd_dma_desc *sdesc = schan->cur_desc;
 
 		if (sdesc->dir == DMA_DEV_TO_MEM)
 			pos = sprd_dma_get_dst_addr(schan);
-- 
1.7.9.5

