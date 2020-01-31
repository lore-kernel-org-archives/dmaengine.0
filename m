Return-Path: <SRS0=RWnA=3U=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B357C2D0DB
	for <dmaengine@archiver.kernel.org>; Fri, 31 Jan 2020 17:58:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4C5F0215A4
	for <dmaengine@archiver.kernel.org>; Fri, 31 Jan 2020 17:58:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbgAaR6k (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 31 Jan 2020 12:58:40 -0500
Received: from mga03.intel.com ([134.134.136.65]:45247 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726712AbgAaR6k (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Fri, 31 Jan 2020 12:58:40 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 Jan 2020 09:58:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,386,1574150400"; 
   d="scan'208";a="430440662"
Received: from djiang5-desk3.ch.intel.com ([143.182.136.137])
  by fmsmga006.fm.intel.com with ESMTP; 31 Jan 2020 09:58:39 -0800
Subject: [PATCH] dmaengine: fix null ptr check for
 __dma_async_device_channel_register()
From:   Dave Jiang <dave.jiang@intel.com>
To:     vkoul@kernel.org
Cc:     dmaengine@vger.kernel.org, dan.carpenter@oracle.com
Date:   Fri, 31 Jan 2020 10:58:39 -0700
Message-ID: <158049351973.45445.3291586905226032744.stgit@djiang5-desk3.ch.intel.com>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Add check to pointer after assignment before accessing members.

Fixes: d2fb0a043838: ("dmaengine: break out channel registration")

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Dave Jiang <dave.jiang@intel.com>
---
 drivers/dma/dmaengine.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index f3ef4edd4de1..3a62c7839861 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -962,6 +962,9 @@ static int __dma_async_device_channel_register(struct dma_device *device,
 
 	tchan = list_first_entry_or_null(&device->channels,
 					 struct dma_chan, device_node);
+	if (!tchan)
+		return -ENODEV;
+
 	if (tchan->dev) {
 		idr_ref = tchan->dev->idr_ref;
 	} else {

