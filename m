Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A4FBC433EF
	for <dmaengine@archiver.kernel.org>; Mon, 11 Apr 2022 22:09:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344427AbiDKWL6 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 11 Apr 2022 18:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344094AbiDKWL5 (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Mon, 11 Apr 2022 18:11:57 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCAAF2459A
        for <dmaengine@vger.kernel.org>; Mon, 11 Apr 2022 15:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649714981; x=1681250981;
  h=subject:from:to:cc:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tCyR746JdJl6/lqMl7kNpqHpIGKZFMDvk5Fe9UXw7kc=;
  b=MLSP/leXvfrRGs0tNOBLBLq9VCuXNFV3IkR4g6rsoTJhQlt4shVb8E/5
   /qfb3ncrm2pQgA2UzwUc+pDcRxXHcA+Tw85TLxReoYtpO7foty3hRJbua
   vxa0vFEOlTCUyqggdnyRrdNpNGycvUk2GqrvzdKCJu8HdHGWNHcfrNoOM
   lnfe6Rzx8gLqXHfStp97Nm8LRMaR9Og13wkvFi5LYdktZwAots5NHZVtC
   1ZUIq8+Ao91sQAfiufacAB9dLtXQYJd88zuIAS+Kg0n+8IUk0hZKAyGz4
   aUfih1pRJ8gFuVEf3gHYHtadvOcxKi9alDUnnSwOdY5h1x2becCthHARO
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="322670644"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="322670644"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2022 15:09:39 -0700
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="801968540"
Received: from djiang5-desk3.ch.intel.com ([143.182.136.137])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2022 15:09:39 -0700
Subject: [PATCH] dmaengine: idxd: set DMA_INTERRUPT cap bit
From:   Dave Jiang <dave.jiang@intel.com>
To:     vkoul@kernel.org
Cc:     Ben Walker <benjamin.walker@intel.com>, dmaengine@vger.kernel.org
Date:   Mon, 11 Apr 2022 15:09:38 -0700
Message-ID: <164971497859.2201379.17925303210723708961.stgit@djiang5-desk3.ch.intel.com>
User-Agent: StGit/1.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Even though idxd driver has always supported interrupt, it never actually
set the DMA_INTERRUPT cap bit. Rectify this mistake so the interrupt
capability is advertised.

Reported-by: Ben Walker <benjamin.walker@intel.com>
Signed-off-by: Dave Jiang <dave.jiang@intel.com>
---
 drivers/dma/idxd/dma.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/idxd/dma.c b/drivers/dma/idxd/dma.c
index bfff59617d04..13e061944db9 100644
--- a/drivers/dma/idxd/dma.c
+++ b/drivers/dma/idxd/dma.c
@@ -193,6 +193,7 @@ int idxd_register_dma_device(struct idxd_device *idxd)
 	INIT_LIST_HEAD(&dma->channels);
 	dma->dev = dev;
 
+	dma_cap_set(DMA_INTERRUPT, dma->cap_mask);
 	dma_cap_set(DMA_PRIVATE, dma->cap_mask);
 	dma_cap_set(DMA_COMPLETION_NO_ORDER, dma->cap_mask);
 	dma->device_release = idxd_dma_release;


