Return-Path: <SRS0=bLat=3M=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955F3C33CB8
	for <dmaengine@archiver.kernel.org>; Thu, 23 Jan 2020 02:30:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 69ED02467A
	for <dmaengine@archiver.kernel.org>; Thu, 23 Jan 2020 02:30:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iUi1N9US"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgAWCaD (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 22 Jan 2020 21:30:03 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:59070 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgAWCaD (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Wed, 22 Jan 2020 21:30:03 -0500
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C58801219;
        Thu, 23 Jan 2020 03:30:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1579746601;
        bh=rSa5auWNfNmTORl9aRSBcdkULJQm5KD5n6LxiFwQ9/0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iUi1N9USlq8oAyzI5BmzGkgPSyIapK8Q9m/1fKtbPIhKcHVik3JRpwBTjtPzg2aaN
         OdIi4P8gkBYPTTaaty0yISifvcaOKm1E3rhwjPPne+BfMo3XjoB7gGwPhv7W9Yudgk
         AcNDyj5W4aIIPDgpck0dEr5MwiJnGCOhZYf+0ens=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     dmaengine@vger.kernel.org
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Tejas Upadhyay <tejasu@xilinx.com>,
        Satish Kumar Nagireddy <SATISHNA@xilinx.com>
Subject: [PATCH v3 3/6] dmaengine: virt-dma: Use lockdep to check locking requirements
Date:   Thu, 23 Jan 2020 04:29:36 +0200
Message-Id: <20200123022939.9739-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123022939.9739-1-laurent.pinchart@ideasonboard.com>
References: <20200123022939.9739-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

A few virt-dma functions are documented as requiring the vc.lock to be
held by the caller. Check this with lockdep.

The vchan_vdesc_fini() and vchan_find_desc() functions gain a lockdep
check as well, because, even though they are not documented with this
requirement (and not documented at all for the latter), they touch
fields documented as protected by vc.lock. All callers have been
manually inspected to verify they call the functions with the lock held.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/dma/virt-dma.c |  2 ++
 drivers/dma/virt-dma.h | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/dma/virt-dma.c b/drivers/dma/virt-dma.c
index ec4adf4260a0..9b59bc1c6a55 100644
--- a/drivers/dma/virt-dma.c
+++ b/drivers/dma/virt-dma.c
@@ -68,6 +68,8 @@ struct virt_dma_desc *vchan_find_desc(struct virt_dma_chan *vc,
 {
 	struct virt_dma_desc *vd;
 
+	lockdep_assert_held(&vc->lock);
+
 	list_for_each_entry(vd, &vc->desc_issued, node)
 		if (vd->tx.cookie == cookie)
 			return vd;
diff --git a/drivers/dma/virt-dma.h b/drivers/dma/virt-dma.h
index ab158bac03a7..942493e36666 100644
--- a/drivers/dma/virt-dma.h
+++ b/drivers/dma/virt-dma.h
@@ -81,6 +81,8 @@ static inline struct dma_async_tx_descriptor *vchan_tx_prep(struct virt_dma_chan
  */
 static inline bool vchan_issue_pending(struct virt_dma_chan *vc)
 {
+	lockdep_assert_held(&vc->lock);
+
 	list_splice_tail_init(&vc->desc_submitted, &vc->desc_issued);
 	return !list_empty(&vc->desc_issued);
 }
@@ -96,6 +98,8 @@ static inline void vchan_cookie_complete(struct virt_dma_desc *vd)
 	struct virt_dma_chan *vc = to_virt_chan(vd->tx.chan);
 	dma_cookie_t cookie;
 
+	lockdep_assert_held(&vc->lock);
+
 	cookie = vd->tx.cookie;
 	dma_cookie_complete(&vd->tx);
 	dev_vdbg(vc->chan.device->dev, "txd %p[%x]: marked complete\n",
@@ -108,11 +112,15 @@ static inline void vchan_cookie_complete(struct virt_dma_desc *vd)
 /**
  * vchan_vdesc_fini - Free or reuse a descriptor
  * @vd: virtual descriptor to free/reuse
+ *
+ * vc.lock must be held by caller
  */
 static inline void vchan_vdesc_fini(struct virt_dma_desc *vd)
 {
 	struct virt_dma_chan *vc = to_virt_chan(vd->tx.chan);
 
+	lockdep_assert_held(&vc->lock);
+
 	if (dmaengine_desc_test_reuse(&vd->tx))
 		list_add(&vd->node, &vc->desc_allocated);
 	else
@@ -141,6 +149,8 @@ static inline void vchan_terminate_vdesc(struct virt_dma_desc *vd)
 {
 	struct virt_dma_chan *vc = to_virt_chan(vd->tx.chan);
 
+	lockdep_assert_held(&vc->lock);
+
 	/* free up stuck descriptor */
 	if (vc->vd_terminated)
 		vchan_vdesc_fini(vc->vd_terminated);
@@ -158,6 +168,8 @@ static inline void vchan_terminate_vdesc(struct virt_dma_desc *vd)
  */
 static inline struct virt_dma_desc *vchan_next_desc(struct virt_dma_chan *vc)
 {
+	lockdep_assert_held(&vc->lock);
+
 	return list_first_entry_or_null(&vc->desc_issued,
 					struct virt_dma_desc, node);
 }
@@ -175,6 +187,8 @@ static inline struct virt_dma_desc *vchan_next_desc(struct virt_dma_chan *vc)
 static inline void vchan_get_all_descriptors(struct virt_dma_chan *vc,
 	struct list_head *head)
 {
+	lockdep_assert_held(&vc->lock);
+
 	list_splice_tail_init(&vc->desc_allocated, head);
 	list_splice_tail_init(&vc->desc_submitted, head);
 	list_splice_tail_init(&vc->desc_issued, head);
-- 
Regards,

Laurent Pinchart

