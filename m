Return-Path: <SRS0=3niW=43=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB63BC18E5A
	for <dmaengine@archiver.kernel.org>; Tue, 10 Mar 2020 22:18:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 80BCA222C3
	for <dmaengine@archiver.kernel.org>; Tue, 10 Mar 2020 22:18:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727752AbgCJWSD (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 10 Mar 2020 18:18:03 -0400
Received: from mga09.intel.com ([134.134.136.24]:6925 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727311AbgCJWSD (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 10 Mar 2020 18:18:03 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Mar 2020 15:18:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,518,1574150400"; 
   d="scan'208";a="321949215"
Received: from djiang5-desk3.ch.intel.com ([143.182.136.137])
  by orsmga001.jf.intel.com with ESMTP; 10 Mar 2020 15:18:02 -0700
Subject: [PATCH] dmaengine: idxd: Merge definition of dsa_batch_desc into
 dsa_hw_desc
From:   Dave Jiang <dave.jiang@intel.com>
To:     vkoul@kernel.org
Cc:     dmaengine@vger.kernel.org, tony.luck@intel.com
Date:   Tue, 10 Mar 2020 15:18:02 -0700
Message-ID: <158387868208.35922.5895104426944263789.stgit@djiang5-desk3.ch.intel.com>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

From: Tony Luck <tony.luck@intel.com>

We don't need a special structure just for batch descriptors. The
layout matches the general form for other descriptors.

Merge the desc_list_addr field into the union of other aliases for
the the third quadword in the structure.

Create a union to alias "xfer_size" with "desc_count".

Signed-off-by: Tony Luck <tony.luck@intel.com>
Acked-by: Dave Jiang <dave.jiang@intel.com>
---
 include/uapi/linux/idxd.h |   21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/include/uapi/linux/idxd.h b/include/uapi/linux/idxd.h
index 849ef1515d04..1f412fbf561b 100644
--- a/include/uapi/linux/idxd.h
+++ b/include/uapi/linux/idxd.h
@@ -83,21 +83,6 @@ enum dsa_completion_status {
 #define DSA_COMP_STATUS_MASK		0x7f
 #define DSA_COMP_STATUS_WRITE		0x80
 
-struct dsa_batch_desc {
-	uint32_t	pasid:20;
-	uint32_t	rsvd:11;
-	uint32_t	priv:1;
-	uint32_t	flags:24;
-	uint32_t	opcode:8;
-	uint64_t	completion_addr;
-	uint64_t	desc_list_addr;
-	uint64_t	rsvd1;
-	uint32_t	desc_count;
-	uint16_t	interrupt_handle;
-	uint16_t	rsvd2;
-	uint8_t		rsvd3[24];
-} __attribute__((packed));
-
 struct dsa_hw_desc {
 	uint32_t	pasid:20;
 	uint32_t	rsvd:11;
@@ -109,6 +94,7 @@ struct dsa_hw_desc {
 		uint64_t	src_addr;
 		uint64_t	rdback_addr;
 		uint64_t	pattern;
+		uint64_t	desc_list_addr;
 	};
 	union {
 		uint64_t	dst_addr;
@@ -116,7 +102,10 @@ struct dsa_hw_desc {
 		uint64_t	src2_addr;
 		uint64_t	comp_pattern;
 	};
-	uint32_t	xfer_size;
+	union {
+		uint32_t	xfer_size;
+		uint32_t	desc_count;
+	};
 	uint16_t	int_handle;
 	uint16_t	rsvd1;
 	union {

