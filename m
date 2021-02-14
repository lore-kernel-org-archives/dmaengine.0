Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED20C43381
	for <dmaengine@archiver.kernel.org>; Sun, 14 Feb 2021 13:22:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC4A764DD6
	for <dmaengine@archiver.kernel.org>; Sun, 14 Feb 2021 13:22:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbhBNNW4 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Sun, 14 Feb 2021 08:22:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbhBNNWo (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Sun, 14 Feb 2021 08:22:44 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73D1CC0613D6;
        Sun, 14 Feb 2021 05:22:03 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id ba1so2264846plb.1;
        Sun, 14 Feb 2021 05:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oxHKYNM0zj6yA3uWKZadp/9dUeeYDxIwsEZdGz6QAa4=;
        b=ntpKeFkD+4/O4y2sIqg1HIxb15sooiGVTIGNBxQpozkwb0XwZCjlsj/JWtEWnqX7nJ
         t4yqfkXqJuw7fEofSpBEK3ILKL7ZupEKSjuvmeUVi5gjpyAwbNfNFUTL9IAF2exK9YI6
         IqjLc3SyBWKmfVVQ3iYlwyAMNbJo+uAFIEWoIKxKBzg526CIYZIMWbHSEDDE5yIP2h3X
         gLy4GXDeLkufGNh+S64G2fSeVu80PEwsRL/MoKXov08mqXQwr+QKSAICSF1CLL5lK9eX
         alsCd9sjMqVWZBRdBH/HFU/WXxCdXUDloQryF8RjsUDHYYpKJ7QNX+VZpREvVX7C9nQh
         7HsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oxHKYNM0zj6yA3uWKZadp/9dUeeYDxIwsEZdGz6QAa4=;
        b=L5cibxjpkeopnWUCU3Mcjcd3LPQgJWapdSRqvsrmyv/gypo9oph+bgrLxMOVEDUD+u
         juBFTGtjok2BUHCC4UkRKl+EX6gak5vC3B7wIDTD+pI+8820S7UcGY3vRD7c+q4SWwuL
         fDvWe2cUVPy/Hdx1Kf+9ivDyqV74Z7/x02dPnEcw88kRt6RY8kV+DotwPBy9lp1m4Gm8
         E3vWDXY+8P1QSThfFMe/T4Opr1x/UwmLmGVaWuBH/83VsUcEDZadtwRVSPhis0fMus4k
         xuXWCs6ConC8fJKpyPF6ULxCo4urixQZEgv3QlpbJP7FnH7xIyUlhoznWNhvUAwM+FDX
         492w==
X-Gm-Message-State: AOAM532weDj3shhLt1vmU0OUiSTsEn+T4XkxMVgrEUal8eKIg+NPfBO9
        te4HcIwIPRauWlGpVRsR3RM=
X-Google-Smtp-Source: ABdhPJw2SC4gPWDSp3CTIDHOK2VHC8QLh2kYomX4pzJWBVYzDyHkN3dJPJZ2i8GhnsEQ4y2DQVFA7w==
X-Received: by 2002:a17:902:b68a:b029:e3:29cf:3f22 with SMTP id c10-20020a170902b68ab02900e329cf3f22mr8884147pls.78.1613308923127;
        Sun, 14 Feb 2021 05:22:03 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
        by smtp.gmail.com with ESMTPSA id d12sm14908942pgm.83.2021.02.14.05.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 05:22:02 -0800 (PST)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     gustavo.pimentel@synopsys.com, vkoul@kernel.org,
        wangzhou1@hisilicon.com, ftoth@exalondelft.nl,
        andy.shevchenko@gmail.com, qiuzhenfa@hisilicon.com,
        dmaengine@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH 2/3] dmaengine: dw-edma: Add missing call to 'pci_free_irq_vectors()' in probe function
Date:   Sun, 14 Feb 2021 21:21:52 +0800
Message-Id: <20210214132153.575350-3-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210214132153.575350-1-zhengdejin5@gmail.com>
References: <20210214132153.575350-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Call to 'pci_free_irq_vectors()' is missing in the error handling path
of the probe function, So add it.

Fixes: 41aaff2a2ac01c5 ("dmaengine: Add Synopsys eDMA IP PCIe glue-logic")
Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
 drivers/dma/dw-edma/dw-edma-pcie.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-edma-pcie.c
index 1eafc602e17e..c1e796bd3ee9 100644
--- a/drivers/dma/dw-edma/dw-edma-pcie.c
+++ b/drivers/dma/dw-edma/dw-edma-pcie.c
@@ -185,24 +185,31 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 	/* Validating if PCI interrupts were enabled */
 	if (!pci_dev_msi_enabled(pdev)) {
 		pci_err(pdev, "enable interrupt failed\n");
-		return -EPERM;
+		err = -EPERM;
+		goto err_free_irq;
 	}
 
 	dw->irq = devm_kcalloc(dev, nr_irqs, sizeof(*dw->irq), GFP_KERNEL);
-	if (!dw->irq)
-		return -ENOMEM;
+	if (!dw->irq) {
+		err = -ENOMEM;
+		goto err_free_irq;
+	}
 
 	/* Starting eDMA driver */
 	err = dw_edma_probe(chip);
 	if (err) {
 		pci_err(pdev, "eDMA probe failed\n");
-		return err;
+		goto err_free_irq;
 	}
 
 	/* Saving data structure reference */
 	pci_set_drvdata(pdev, chip);
 
 	return 0;
+
+err_free_irq:
+	pci_free_irq_vectors(pdev);
+	return err;
 }
 
 static void dw_edma_pcie_remove(struct pci_dev *pdev)
-- 
2.25.0

