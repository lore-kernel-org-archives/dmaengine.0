Return-Path: <SRS0=3niW=43=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EEFBC10F27
	for <dmaengine@archiver.kernel.org>; Tue, 10 Mar 2020 17:51:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7F06C2146E
	for <dmaengine@archiver.kernel.org>; Tue, 10 Mar 2020 17:51:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgCJRvK (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 10 Mar 2020 13:51:10 -0400
Received: from mga04.intel.com ([192.55.52.120]:5741 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726283AbgCJRvK (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 10 Mar 2020 13:51:10 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Mar 2020 10:51:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,537,1574150400"; 
   d="scan'208";a="245772005"
Received: from djiang5-desk3.ch.intel.com ([143.182.136.137])
  by orsmga006.jf.intel.com with ESMTP; 10 Mar 2020 10:51:09 -0700
Subject: [PATCH] dmaengine: idxd: remove global token limit check
From:   Dave Jiang <dave.jiang@intel.com>
To:     vkoul@kernel.org
Cc:     dmaengine@vger.kernel.org
Date:   Tue, 10 Mar 2020 10:51:09 -0700
Message-ID: <158386266911.11066.7545764533072221536.stgit@djiang5-desk3.ch.intel.com>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

The global token_limit is not tied to group tokens_reserved and
tokens_allowed parameters. Remove the check in order to allow independent
configuration.

Fixes: c52ca478233c ("dmaengine: idxd: add configuration component of driver")
Reported-by: Yixin Zhang <yixin.zhang@intel.com>
Signed-off-by: Dave Jiang <dave.jiang@intel.com>
---
 drivers/dma/idxd/sysfs.c |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/dma/idxd/sysfs.c b/drivers/dma/idxd/sysfs.c
index 8a8d86f29e56..3999827970ab 100644
--- a/drivers/dma/idxd/sysfs.c
+++ b/drivers/dma/idxd/sysfs.c
@@ -512,9 +512,6 @@ static ssize_t group_tokens_reserved_store(struct device *dev,
 	if (idxd->state == IDXD_DEV_ENABLED)
 		return -EPERM;
 
-	if (idxd->token_limit == 0)
-		return -EPERM;
-
 	if (val > idxd->max_tokens)
 		return -EINVAL;
 
@@ -560,8 +557,6 @@ static ssize_t group_tokens_allowed_store(struct device *dev,
 	if (idxd->state == IDXD_DEV_ENABLED)
 		return -EPERM;
 
-	if (idxd->token_limit == 0)
-		return -EPERM;
 	if (val < 4 * group->num_engines ||
 	    val > group->tokens_reserved + idxd->nr_tokens)
 		return -EINVAL;

