Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB7A390217;
	Wed,  4 Mar 2026 21:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772660691; cv=none; b=nEhqCI1fwjnycXXUJGrwC0Eo1K2HiNwTkOrdp/H+AAn6NptMGnkCU7cHi7pxywFqlEE3p7lf3kxnmwu2HZApm1WCemOnZfyB/4GB9GL6easPsQgyksvm6o2ftf/Pibg5oukINclrkPF7Zgs+h66fqOsYZnRN4d6rSbUnuhjWqH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772660691; c=relaxed/simple;
	bh=2FdnGFzqnWpzV8ZyzR2XFjyDCkUhaUkEmqYLduGNUsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wno/qySQo9MI3afyY50xR1b3oFn0D3AYHuLR2eEBFckV2xpsVa3qJa+gaJycvqrMHKjF0pFxReC1xYy2dO56H/GwdiLn1zrXVfhfPyB5Jkrb3D5k/4QOWANZNNPGqjCcT2SlW85oEXrqkK3NHRFn2eymV9trBP8L6KG6j8WcB94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Oaf578yf; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Oaf578yf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1772660680;
	bh=2FdnGFzqnWpzV8ZyzR2XFjyDCkUhaUkEmqYLduGNUsQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Oaf578yfokBrfEm08oghzR85cRfndXg5jVo3/LKZ0s7jWrcCmZv9nx61KIX7hO7iV
	 Br+lb3DCi5ZCKaGzUEpYqy7skCG1LgOuW5HXI//iUVCPBE+zAjubHMc3x8kisl9SzW
	 O28rhbxn0uzPvxqSKmxsgNWh+S+co9VW9yZh2TaQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 04 Mar 2026 22:44:39 +0100
Subject: [PATCH v2 3/4] dmaengine: ioatdma: make ioat_ktype const
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260304-sysfs-const-ioat-v2-3-b9b82651219b@weissschuh.net>
References: <20260304-sysfs-const-ioat-v2-0-b9b82651219b@weissschuh.net>
In-Reply-To: <20260304-sysfs-const-ioat-v2-0-b9b82651219b@weissschuh.net>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Jiang <dave.jiang@intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772660679; l=2043;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=2FdnGFzqnWpzV8ZyzR2XFjyDCkUhaUkEmqYLduGNUsQ=;
 b=BBVWmQRTOugoALdhYAZSFgCTvgSc7VlBvawmr1XtSlCTLOqoMkJXScSKMvosL6Q+EfBfSBP19
 rpPlDc4+uE6DbscSx0dmVesB1TFnoYquEhmuqE9PPACuE7wPSV5n7De
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

ioat_ktype is never modified, so make it const.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Acked-by: Dave Jiang <dave.jiang@intel.com>
---
 drivers/dma/ioat/dma.h   | 4 ++--
 drivers/dma/ioat/sysfs.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/ioat/dma.h b/drivers/dma/ioat/dma.h
index e187f3a7e968..e8a880f338c6 100644
--- a/drivers/dma/ioat/dma.h
+++ b/drivers/dma/ioat/dma.h
@@ -190,7 +190,7 @@ struct ioat_ring_ent {
 };
 
 extern int ioat_pending_level;
-extern struct kobj_type ioat_ktype;
+extern const struct kobj_type ioat_ktype;
 extern struct kmem_cache *ioat_cache;
 extern struct kmem_cache *ioat_sed_cache;
 
@@ -393,7 +393,7 @@ void ioat_issue_pending(struct dma_chan *chan);
 /* IOAT Init functions */
 bool is_bwd_ioat(struct pci_dev *pdev);
 struct dca_provider *ioat_dca_init(struct pci_dev *pdev, void __iomem *iobase);
-void ioat_kobject_add(struct ioatdma_device *ioat_dma, struct kobj_type *type);
+void ioat_kobject_add(struct ioatdma_device *ioat_dma, const struct kobj_type *type);
 void ioat_kobject_del(struct ioatdma_device *ioat_dma);
 int ioat_dma_setup_interrupts(struct ioatdma_device *ioat_dma);
 void ioat_stop(struct ioatdma_chan *ioat_chan);
diff --git a/drivers/dma/ioat/sysfs.c b/drivers/dma/ioat/sysfs.c
index 709d672bae51..da616365fef5 100644
--- a/drivers/dma/ioat/sysfs.c
+++ b/drivers/dma/ioat/sysfs.c
@@ -78,7 +78,7 @@ static const struct sysfs_ops ioat_sysfs_ops = {
 	.store  = ioat_attr_store,
 };
 
-void ioat_kobject_add(struct ioatdma_device *ioat_dma, struct kobj_type *type)
+void ioat_kobject_add(struct ioatdma_device *ioat_dma, const struct kobj_type *type)
 {
 	struct dma_device *dma = &ioat_dma->dma_dev;
 	struct dma_chan *c;
@@ -166,7 +166,7 @@ static struct attribute *ioat_attrs[] = {
 };
 ATTRIBUTE_GROUPS(ioat);
 
-struct kobj_type ioat_ktype = {
+const struct kobj_type ioat_ktype = {
 	.sysfs_ops = &ioat_sysfs_ops,
 	.default_groups = ioat_groups,
 };

-- 
2.53.0

