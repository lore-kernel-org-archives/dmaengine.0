Return-Path: <SRS0=3niW=43=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 480B8C10F27
	for <dmaengine@archiver.kernel.org>; Tue, 10 Mar 2020 17:50:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 165E32146E
	for <dmaengine@archiver.kernel.org>; Tue, 10 Mar 2020 17:50:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbgCJRub (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 10 Mar 2020 13:50:31 -0400
Received: from mga04.intel.com ([192.55.52.120]:5713 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726283AbgCJRub (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 10 Mar 2020 13:50:31 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Mar 2020 10:50:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,537,1574150400"; 
   d="scan'208";a="415277398"
Received: from djiang5-desk3.ch.intel.com ([143.182.136.137])
  by orsmga005.jf.intel.com with ESMTP; 10 Mar 2020 10:50:30 -0700
Subject: [PATCH] dmaengine: idxd: reflect shadow copy of traffic class
 programming
From:   Dave Jiang <dave.jiang@intel.com>
To:     vkoul@kernel.org
Cc:     dmaengine@vger.kernel.org
Date:   Tue, 10 Mar 2020 10:50:30 -0700
Message-ID: <158386263076.10898.4586509576813094559.stgit@djiang5-desk3.ch.intel.com>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

The traffic class are set to -1 at initialization until the user programs
them. If the user choose not to, the driver will program appropriate
defaults. The driver also needs to update the shadowed copies of the values
after doing the programming.

Fixes: c52ca478233c ("dmaengine: idxd: add configuration component of driver")
Reported-by: Yixin Zhang <yixin.zhang@intel.com>
Signed-off-by: Dave Jiang <dave.jiang@intel.com>
---
 drivers/dma/idxd/device.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/idxd/device.c b/drivers/dma/idxd/device.c
index ada69e722f84..f6f49f0f6fae 100644
--- a/drivers/dma/idxd/device.c
+++ b/drivers/dma/idxd/device.c
@@ -584,11 +584,11 @@ static void idxd_group_flags_setup(struct idxd_device *idxd)
 		struct idxd_group *group = &idxd->groups[i];
 
 		if (group->tc_a == -1)
-			group->grpcfg.flags.tc_a = 0;
+			group->tc_a = group->grpcfg.flags.tc_a = 0;
 		else
 			group->grpcfg.flags.tc_a = group->tc_a;
 		if (group->tc_b == -1)
-			group->grpcfg.flags.tc_b = 1;
+			group->tc_b = group->grpcfg.flags.tc_b = 1;
 		else
 			group->grpcfg.flags.tc_b = group->tc_b;
 		group->grpcfg.flags.use_token_limit = group->use_token_limit;

