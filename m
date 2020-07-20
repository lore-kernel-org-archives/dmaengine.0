Return-Path: <SRS0=cHls=A7=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C726AC433E2
	for <dmaengine@archiver.kernel.org>; Mon, 20 Jul 2020 16:37:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1B392176B
	for <dmaengine@archiver.kernel.org>; Mon, 20 Jul 2020 16:37:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731179AbgGTPvA (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 20 Jul 2020 11:51:00 -0400
Received: from mga18.intel.com ([134.134.136.126]:15587 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731172AbgGTPu7 (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 20 Jul 2020 11:50:59 -0400
IronPort-SDR: eA60C773CO9td2lPSQDdkd1Bf9YR/NhxASPGHMJQXntcO2UoiqAt+I/SZisu2NdBbzvRn/1mgh
 sFXgi4OR3KMw==
X-IronPort-AV: E=McAfee;i="6000,8403,9688"; a="137422012"
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; 
   d="scan'208";a="137422012"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2020 08:50:58 -0700
IronPort-SDR: OI/9aKeP+ePuJtuh/0sVddO3NXzYVl4fJ4VniBbUWxRlDr3tYA7tGA0YSiyRuAB84FzwIT4+xg
 oTmnt836+Rqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; 
   d="scan'208";a="301306692"
Received: from djiang5-desk3.ch.intel.com ([143.182.136.137])
  by orsmga002.jf.intel.com with ESMTP; 20 Jul 2020 08:50:58 -0700
Subject: [PATCH] dmaengine: idxd: add missing invalid flags field to
 completion
From:   Dave Jiang <dave.jiang@intel.com>
To:     vkoul@kernel.org
Cc:     Nikhil Rao <nikhil.rao@intel.com>, dmaengine@vger.kernel.org
Date:   Mon, 20 Jul 2020 08:50:58 -0700
Message-ID: <159526025819.49266.13176787210106133664.stgit@djiang5-desk3.ch.intel.com>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Add missing "invalid flags" field to completion record struct.

Reported-by: Nikhil Rao <nikhil.rao@intel.com>
Signed-off-by: Dave Jiang <dave.jiang@intel.com>
---
 include/uapi/linux/idxd.h |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/linux/idxd.h b/include/uapi/linux/idxd.h
index e103c1434e4b..fdcdfe414223 100644
--- a/include/uapi/linux/idxd.h
+++ b/include/uapi/linux/idxd.h
@@ -181,6 +181,12 @@ struct dsa_completion_record {
 	uint32_t		bytes_completed;
 	uint64_t		fault_addr;
 	union {
+		/* common record */
+		struct {
+			uint32_t	invalid_flags:24;
+			uint32_t	rsvd2:8;
+		};
+
 		uint16_t	delta_rec_size;
 		uint16_t	crc_val;
 

