Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795650570;
	b=aiJYEyV9vfhSOu5Oy3GhpyP26jP2vBeVYMAl8NbMTPFr53qFNF5T6MGOF6RvsGMyoonE
	 817e6KM1+xrxNuUMr0UKObkcmB6V812CojQPYOgLKbzrTEibVgMDolnnBTVdKLI2tt1x2
	 Pgw1IvkjTv5JLadbitZmT9RW9MKaDpGBuZDXv4lPFzgMMlG/InYrxwhYXm9Z1vELV9EZj
	 gDNErMgCXM9zRhxKHjr2HbDI8ZlS19aicndpEbvDbS3U55w0zw+mDkhLeYBHAK8/RaLIc
	 QzIg6TNLQfIubIfwxIEabirDRhHzIMwQ3ltrNGrokKbVotG5xvRFYVab6MTAMq1Wk1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795650570;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ysImjjVIBxkbVLdQ5E7o9KwLqdFj2fjWLjJD3awS0cE=;
	b=fcALe+A5iiJnpHjsj1Hp4jIlAhxlhEBgVpxXwrYV/0OyGvqDtX50RJkBicXli/DtakAt
	 f1u0uXvLfbkhJdIjbmIB6fD9bqXpodlTRbY7Xnl8ymKQkg8FOvsEo2KPUPIG6MA0k1bLf
	 BGzoEsafZW9+Ek6stcxkdyPeTIWWXH2ZqK6yxxOdCNoPe7oufLfIxENAuuFmuZFlzcaPf
	 bdeZg34RBylbkeApgXsxCNEdEuJkOYr623NF8cm8LEOi4Vpg7cJoPS/JtRdNfvnnW26Gf
	 YXZbcASW5BCzwlDciXyS2Vu0oRiXXGS5vNvaJ9RWSAtuK5ZnJZOe0GRAV7pjcf3s+gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VnzHg82D;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E37606A335;
	Wed, 25 Nov 2026 23:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64E37606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VnzHg82D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795650570; x=1827186570;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=WtcnvyJ+5FVKkzZfiOhMOCl3zph20JT0QiFeHC0v/RE=;
  b=VnzHg82DeCtt8IxbBTa87NO0BR2O5P3FsbCGr3wmpw7gxMdrAJMTyq01
   D4HOWWp5Eq7UW+LEMmFY80o485Atk5RWTx4A65nhaQJI/nvsn+3u3TdsO
   vLGddRUxE9Ra9Mp/xYrWjsK0faPIxsOt7sO4hdBsLN7SHJWbCv1s2bkdQ
   Zj96h04P2oeIhuPLrGO1tkF6DDYONpqXMMC1HvxcQq9YqZRQ+dJ0fl9RO
   vOtvU3DWMSoqa4lyz0RfmUZplNCBe9lehrvEQ/+LGtItt8CpPQ6VBNdag
   WL/8g9vpE4sUjap4DFsECa+IqG2ioTB61mYVfpJYy/eq/f0XThfVg+uKh
   g==;
X-CSE-ConnectionGUID: m6bj8SQWR+6nfXNFtRA9hQ==
X-CSE-MsgGUID: X/EGzfL6RWmy9tFIKhbfGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4597290"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4597290"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 15:49:28 -0800
X-CSE-ConnectionGUID: pLSmKAi/Rr+bUbYyaaKCwg==
X-CSE-MsgGUID: JKNV8GmaSLOCjAe8mHyUgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11873837"
Received: from vcostago-desk.jf.intel.com (HELO [10.241.240.61]) ([10.241.240.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 15:49:28 -0800
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Date: Wed, 25 Nov 2026 15:49:03 -0800
Subject: [PATCH v2 5/8] dmaengine: idxd: Fix error handling in
 idxd_cdev_open()
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-wt-idxd-fixes-v2-5-25a4691dfb9e@intel.com>
References: <20261125-wt-idxd-fixes-v2-0-25a4691dfb9e@intel.com>
In-Reply-To: <20261125-wt-idxd-fixes-v2-0-25a4691dfb9e@intel.com>
To: Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>, 
 Shuai Xue <xueshuai@linux.alibaba.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vinicius Costa Gomes <vinicius.gomes@intel.com>
X-Mailer: b4 0.17-dev-1b309
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795650562; l=2575;
 i=vinicius.gomes@intel.com; s=20230921; h=from:subject:message-id;
 bh=WtcnvyJ+5FVKkzZfiOhMOCl3zph20JT0QiFeHC0v/RE=;
 b=Wjpd8IMEBExsxUxdQa9Bb+XpIWGqSxlaVoUnjHGSzFCCm6FdJoJWRkuxOcZwFVbo6A+BKIzSV
 ZDt6WbwhMECDu0oEujLjwt3rdxjndNILp/hcT4Z5S4XjSTXhxs6K7Cq
X-Developer-Key: i=vinicius.gomes@intel.com; a=ed25519;
 pk=aJkrtgqgT6TZ8iIHSG8/rTPsmlYnjMrUjCsMYvCzntk=

Three error paths of idxd_cdev_open() are wrong:

- An ida_alloc() failure jumps to failed_ida without setting rc. The
  open usually returns 0 after freeing its context, and the release of
  the file then uses the freed filp->private_data.

- xa_insert() errors other than -EBUSY are ignored. The open succeeds
  without the context in the xarray, and the completion records of its
  page faults are dropped.

- On a dedicated WQ, the failed_ida path doesn't undo
  idxd_wq_set_pasid(). The WQ keeps the PASID of an SVA bind that is
  released right after.

Set rc on the ida_alloc() failure. Fail the open on xa_insert() errors
other than -EBUSY, and fix the "exist -> exists" typo in its warning.
Disable the PASID of a dedicated WQ on the failed_ida path, as
idxd_file_dev_release() does.

Fixes: e6fd6d7e5f0f ("dmaengine: idxd: add a device to represent the file opened")
Fixes: b022f59725f0 ("dmaengine: idxd: add idxd_copy_cr() to copy user completion record during page fault handling")
Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
---
 drivers/dma/idxd/cdev.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/idxd/cdev.c b/drivers/dma/idxd/cdev.c
index f1af7f0d25d3..9343deb2e858 100644
--- a/drivers/dma/idxd/cdev.c
+++ b/drivers/dma/idxd/cdev.c
@@ -264,8 +264,12 @@ static int idxd_cdev_open(struct inode *inode, struct file *filp)
 		mutex_lock(&wq->uc_lock);
 		rc = xa_insert(&wq->upasid_xa, pasid, ctx, GFP_KERNEL);
 		mutex_unlock(&wq->uc_lock);
-		if (rc < 0)
-			dev_warn(dev, "PASID entry already exist in xarray.\n");
+		if (rc == -EBUSY) {
+			/* Another open of this WQ by the same mm added it */
+			dev_warn(dev, "PASID entry already exists in xarray.\n");
+		} else if (rc < 0) {
+			goto failed_get_pasid;
+		}
 
 		if (wq_dedicated(wq)) {
 			rc = idxd_wq_set_pasid(wq, pasid);
@@ -279,6 +283,7 @@ static int idxd_cdev_open(struct inode *inode, struct file *filp)
 	idxd_cdev = wq->idxd_cdev;
 	ctx->id = ida_alloc(&file_ida, GFP_KERNEL);
 	if (ctx->id < 0) {
+		rc = ctx->id;
 		dev_warn(dev, "ida alloc failure\n");
 		goto failed_ida;
 	}
@@ -311,6 +316,9 @@ static int idxd_cdev_open(struct inode *inode, struct file *filp)
 	put_device(fdev);
 	return rc;
 failed_ida:
+	if (device_user_pasid_enabled(idxd) && wq_dedicated(wq) &&
+	    idxd_wq_disable_pasid(wq) < 0)
+		dev_err(dev, "wq disable pasid failed.\n");
 failed_set_pasid:
 	if (device_user_pasid_enabled(idxd))
 		idxd_xa_pasid_remove(ctx);

-- 
2.56.1

