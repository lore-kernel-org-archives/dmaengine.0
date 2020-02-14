Return-Path: <SRS0=3f10=4C=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B20C35242
	for <dmaengine@archiver.kernel.org>; Fri, 14 Feb 2020 04:46:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 76E332187F
	for <dmaengine@archiver.kernel.org>; Fri, 14 Feb 2020 04:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581655592;
	bh=hb4e3d20v5ii20FeWxkdniNUoTA1xuuJ4L04LeeYoAs=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=fhF6CWsSK/UTslRXQZw50OlhADLuoygDSXxbD8bWqWyyTyBhsireXgFouR152IFx5
	 v+W8v3pHRqrsjhwqG8DpGM4Uw1/qKll3gIWvc9am6zpCZl+srnlXYZ2wo/59o82zNe
	 BFnLegwAHf/BZ99Afb5aj/MBH8sfxEX0AUiLrAj4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728540AbgBNEqc (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 13 Feb 2020 23:46:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:39008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728416AbgBNEqc (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Thu, 13 Feb 2020 23:46:32 -0500
Received: from localhost.localdomain (unknown [106.201.58.38])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C706B20848;
        Fri, 14 Feb 2020 04:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581655591;
        bh=hb4e3d20v5ii20FeWxkdniNUoTA1xuuJ4L04LeeYoAs=;
        h=From:To:Cc:Subject:Date:From;
        b=OLSVmC+z1pfrLhX7nupt35AvUbgB1dp7F3yOuclzLSfZ9YT+rByG78ztfgd+jimSa
         R7wgnEfaehrGvgSlvlyo15MJh3TZwx/1YlY7MQ+aVPRM+lRy3aGFK7DJOlC+MRHzBN
         ytDTDlb1+3Hak+Ppw2VSlfzPiusCmDLCluvRQjdE=
From:   Vinod Koul <vkoul@kernel.org>
To:     dmaengine@vger.kernel.org
Cc:     Vinod Koul <vkoul@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] dmaengine: sun4i: set the linear_mode properly
Date:   Fri, 14 Feb 2020 10:16:09 +0530
Message-Id: <20200214044609.2215861-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Commit 6ebb827f7aad ("dmaengine: sun4i: use 'linear_mode' in
sun4i_dma_prep_dma_cyclic") updated the condition but introduced a semi
colon this making this statement have no effect, so add the bitwise OR
to fix it"

Fixes: 6ebb827f7aad ("dmaengine: sun4i: use 'linear_mode' in sun4i_dma_prep_dma_cyclic")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/dma/sun4i-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
index e87fc7c460dd..e7ff09a5031d 100644
--- a/drivers/dma/sun4i-dma.c
+++ b/drivers/dma/sun4i-dma.c
@@ -697,7 +697,7 @@ sun4i_dma_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t buf, size_t len,
 		dest = sconfig->dst_addr;
 		endpoints = SUN4I_DMA_CFG_DST_DRQ_TYPE(vchan->endpoint) |
 			    SUN4I_DMA_CFG_DST_ADDR_MODE(io_mode) |
-			    SUN4I_DMA_CFG_SRC_DRQ_TYPE(ram_type);
+			    SUN4I_DMA_CFG_SRC_DRQ_TYPE(ram_type) |
 			    SUN4I_DMA_CFG_SRC_ADDR_MODE(linear_mode);
 	} else {
 		src = sconfig->src_addr;
-- 
2.24.1

