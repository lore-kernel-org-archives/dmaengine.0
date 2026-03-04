Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC37391509;
	Wed,  4 Mar 2026 21:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772660689; cv=none; b=t6sF6xvT4Wand7Oa5SsG2FHfMLZkI6cgEOPxlHwN5eLF9mLGdeOpyIj8LlnGWhWganFTjvwzquTHBqvTR4WGOja6vCWW73WaVSk/img6GvHWM6bZ0qoH7Fi7owSt11Vb2IBeR70DxspOS/MXnt+NL9S0aDWT3WUbWL0A3pQhj5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772660689; c=relaxed/simple;
	bh=0UDMDkjb8WJZMULKSnbYf1ZtZnInuZDplfeZj4cMVHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K2MhHB+dHPE07lhv9CynxBvRUQ37fJGPq/6kppgYRIDFc+gG3c7kn3Ol9cLwu54+vq9croJFYXup1cohQD6JSlbgpT/h/BbC6Z6eC5Q14eJ1Lrk0lPwHQjizy/0wxnOaGDuA/Ns0MwYvKakpz8bc6M+p6UYfa2qa/21g10aOlZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=SdckAATa; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="SdckAATa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1772660680;
	bh=0UDMDkjb8WJZMULKSnbYf1ZtZnInuZDplfeZj4cMVHI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SdckAATaaM+GFlu9CQuoIwHUYwHWbFC5a4LKAx0eW22B2syaDw33fu/q8IN8KDIkq
	 P3+GhIA8ZUuyNlWTktMk0jVgQUsnHnqH1KqFXcczbs40NDX94ML1GNZbgyAp7ev+Ps
	 tmuqkCS5hYdkn+9rI9igMoguGZkuqgxOglGPROXI=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 04 Mar 2026 22:44:37 +0100
Subject: [PATCH v2 1/4] dmaengine: ioatdma: make some sysfs structures
 static
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260304-sysfs-const-ioat-v2-1-b9b82651219b@weissschuh.net>
References: <20260304-sysfs-const-ioat-v2-0-b9b82651219b@weissschuh.net>
In-Reply-To: <20260304-sysfs-const-ioat-v2-0-b9b82651219b@weissschuh.net>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Jiang <dave.jiang@intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772660679; l=2113;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=0UDMDkjb8WJZMULKSnbYf1ZtZnInuZDplfeZj4cMVHI=;
 b=FWxr734bTV6PkJ8vhahxJmV/D+Zq737jUY1VxZso72vv8sBxIKOZsjxTUbwMPNC8Gx+lssu9n
 uiVF2oklLTfCRWKe3FZRDO/7on4b0j4LUWIbUm8IxzJWa2Bm+nupJT4
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

These structures are only used in sysfs.c, where are defined.

Make them static and remove them from the header.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Dave Jiang <dave.jiang@intel.com>
---
 drivers/dma/ioat/dma.h   | 3 ---
 drivers/dma/ioat/sysfs.c | 6 +++---
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/ioat/dma.h b/drivers/dma/ioat/dma.h
index 12a4a4860a74..27d2b411853f 100644
--- a/drivers/dma/ioat/dma.h
+++ b/drivers/dma/ioat/dma.h
@@ -195,9 +195,6 @@ struct ioat_ring_ent {
 	struct ioat_sed_ent *sed;
 };
 
-extern const struct sysfs_ops ioat_sysfs_ops;
-extern struct ioat_sysfs_entry ioat_version_attr;
-extern struct ioat_sysfs_entry ioat_cap_attr;
 extern int ioat_pending_level;
 extern struct kobj_type ioat_ktype;
 extern struct kmem_cache *ioat_cache;
diff --git a/drivers/dma/ioat/sysfs.c b/drivers/dma/ioat/sysfs.c
index 168adf28c5b1..5da9b0a7b2bb 100644
--- a/drivers/dma/ioat/sysfs.c
+++ b/drivers/dma/ioat/sysfs.c
@@ -26,7 +26,7 @@ static ssize_t cap_show(struct dma_chan *c, char *page)
 		       dma_has_cap(DMA_INTERRUPT, dma->cap_mask) ? " intr" : "");
 
 }
-struct ioat_sysfs_entry ioat_cap_attr = __ATTR_RO(cap);
+static struct ioat_sysfs_entry ioat_cap_attr = __ATTR_RO(cap);
 
 static ssize_t version_show(struct dma_chan *c, char *page)
 {
@@ -36,7 +36,7 @@ static ssize_t version_show(struct dma_chan *c, char *page)
 	return sprintf(page, "%d.%d\n",
 		       ioat_dma->version >> 4, ioat_dma->version & 0xf);
 }
-struct ioat_sysfs_entry ioat_version_attr = __ATTR_RO(version);
+static struct ioat_sysfs_entry ioat_version_attr = __ATTR_RO(version);
 
 static ssize_t
 ioat_attr_show(struct kobject *kobj, struct attribute *attr, char *page)
@@ -67,7 +67,7 @@ const char *page, size_t count)
 	return entry->store(&ioat_chan->dma_chan, page, count);
 }
 
-const struct sysfs_ops ioat_sysfs_ops = {
+static const struct sysfs_ops ioat_sysfs_ops = {
 	.show	= ioat_attr_show,
 	.store  = ioat_attr_store,
 };

-- 
2.53.0

