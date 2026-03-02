Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED80282F1F;
	Mon,  2 Mar 2026 22:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772489766; cv=none; b=TTgayw/r+wPGe9gji0VsLR+LyX/evsIUN0ggMOdlnp40MkLgUnAfsBImlFAK6bxeL78qO4hNphhEqIxHt/61xHj2aCJlcfbCJtIPyaX6uKbnkM5jlWuGRjrvAMFCNVGsqcVnmrh8AmWtwxAkhkNIFClSB8/V7XnG70cXiukwhxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772489766; c=relaxed/simple;
	bh=N6pRa7MR4zOTf2tg5PnQq/tYXg/g2RnpUcrfDh85gRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j2op9s4cPDDh3fOYqBs7Y0zOqBlzzYJyDlhmFqIaIe988i6u3QXHd0aZKkqcjdMqZ1QR/GLQYTAEjzykVaH7ohEjtlHbcixHF1bNV1W90gTGfY5EDOztdhsMU4saWczCpuljml7mSs1qQ3lWtUExGOCHFUvRGRJHT8Wv77nJNW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=V/aCj/vh; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="V/aCj/vh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1772489757;
	bh=N6pRa7MR4zOTf2tg5PnQq/tYXg/g2RnpUcrfDh85gRg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=V/aCj/vhj7KxdcVbX0Uzuo05Tttx7LzyeCkRnUtHNPHPs5s4nu930wqk9wl1F1ziD
	 Dj0TZTBV2XFAScmoEGqy9Q9uU/GnPdEsRvWw/PAnRB1PpyateBI9/r26uUveJSvzGt
	 TERmGlUVfavrfDN0CbcCW1Bw8uzfHQhOqghsIdL8=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 02 Mar 2026 23:15:53 +0100
Subject: [PATCH 1/4] dmaengine: ioatdma: make some sysfs structures static
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260302-sysfs-const-ioat-v1-1-1229ee1c83f3@weissschuh.net>
References: <20260302-sysfs-const-ioat-v1-0-1229ee1c83f3@weissschuh.net>
In-Reply-To: <20260302-sysfs-const-ioat-v1-0-1229ee1c83f3@weissschuh.net>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772489756; l=2026;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=N6pRa7MR4zOTf2tg5PnQq/tYXg/g2RnpUcrfDh85gRg=;
 b=8ONKprOIfHXiF7lIUjKwMtjC2RP+3xd55DpTX0KwqCMsZ3d1yiwOtQPy4074tHWY+XiSmzRJz
 N5iV9R+Wy+fArlRY1ms7pBTpNYZONKyx2EwSwgYL82hUVU2Bzf1Vd/M
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

These structures are only used in sysfs.c, where are defined.

Make them static and remove them from the header.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
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

