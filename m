Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76C93BCD38;
	Mon, 27 Jul 2026 19:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=204.191.154.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785178964; cv=none; b=SEDpQXrdgQK2RSXWyhLB7sUy5soxVBihtzsrddNHyxviqpdczwKR09gjSACIXJNUOmGgptIdj0V/Ccza1ssweIJkRxQoll58NV5Cg3xyytGjgTxjO2lDv+yJwwXL8qAG74RbutdRz67qq6pQNzOPKh55MPN0V+40lvhnC0h0RD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785178964; c=relaxed/simple;
	bh=AE1YT2dS4G/gXOz0M5ytecVRcZ/Alw+ozFu+WzeaUZg=;
	h=From:To:Cc:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Subject; b=JAdzxQz1FLTSqxaZw45iBLrIefJL4SUwXGsVCyQWf8tdAOTv0PnTiGu9zi8uEAmVI5wjN+ECbCGwMEEYTqBI2vhIHgLhcgAkYR0SxFrXhcHQygYjxZHtbUn0UzSCOUtfCZ7bYbUdyyI6HPVe23CfwNa+vyI7D2lkK3UkcVkPIgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com; spf=pass smtp.mailfrom=deltatee.com; dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b=DcvTguqA; arc=none smtp.client-ip=204.191.154.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b="DcvTguqA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:content-disposition;
	bh=prjBF1eAhM3+qHUoFFLQIevJO2JOLfgmN9txYCn3QpE=; b=DcvTguqAggmH8fOSs1UJKJb7Lf
	XYVebhl+F1JoM5ZXESiyLtLdG+F5+gD5VgWbSFmL+PZoPG7C9Uv97kBJF2bABRHYeYUx3WVMopFcy
	ofL6Z844nsOmbSVyjaxqVmIuPyxvh7vKF9z1yDVNmrUTl+6BjxljID3xD5OBb+nUarNgjLEWxCBO5
	+zxf4d36NYFmbyceDjdhM4OdZaxI8uYMdwJSgK1DyJlVXiUw4hK7Ar1o6jOyrYrwH0rEC4J2UFbGh
	Xoi8y5DJVzL4Sg/JEYprYstLeKPJEefpoJ5dF/swPeLtqmvdmfjQWIz+YIDwPr0lUs4xDfVr2ISuX
	3P25fb1A==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <gunthorp@deltatee.com>)
	id 1woQb2-000000005VB-2qpd;
	Mon, 27 Jul 2026 13:02:41 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <gunthorp@deltatee.com>)
	id 1woQNb-000000003IR-3EDN;
	Mon, 27 Jul 2026 12:48:47 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Dave Jiang <dave.jiang@intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Kelvin Cao <kelvin.cao@microchip.com>,
	Logan Gunthorpe <logang@deltatee.com>
Date: Mon, 27 Jul 2026 12:48:42 -0600
Message-ID: <20260727184844.12647-3-logang@deltatee.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727184844.12647-1-logang@deltatee.com>
References: <20260727184844.12647-1-logang@deltatee.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, vkoul@kernel.org, Frank.li@nxp.com, hch@infradead.org, christophe.jaillet@wanadoo.fr, dave.jiang@intel.com, linux@weissschuh.net, kelvin.cao@microchip.com, logang@deltatee.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Level: 
Subject: [PATCH v2 2/4] dmaengine: ioatdma: convert per-channel sysfs to chan_groups
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

Use the new dma_device.chan_groups mechanism to add ioat's "quickdata"
per-channel attributes directly to the channel's existing struct
device, instead of a second, separately managed kobject
(ioat_ktype/ioat_kobject_add()/ioat_kobject_del()).

Each show()/store() now recovers the struct dma_chan via
dev_to_dma_chan() under dma_list_mutex, the same safe pattern already
used by the core attributes, returning -ENODEV once the channel has
been unregistered rather than reading it after the fact.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/dma/ioat/dma.h   |   6 +-
 drivers/dma/ioat/init.c  |   5 +-
 drivers/dma/ioat/sysfs.c | 166 +++++++++++++++------------------------
 3 files changed, 67 insertions(+), 110 deletions(-)

diff --git a/drivers/dma/ioat/dma.h b/drivers/dma/ioat/dma.h
index e8a880f338c6..d36cc2df74ea 100644
--- a/drivers/dma/ioat/dma.h
+++ b/drivers/dma/ioat/dma.h
@@ -103,7 +103,6 @@ struct ioatdma_chan {
 	#define IOAT_CHAN_DOWN 0
 	#define IOAT_COMPLETION_ACK 1
 	#define IOAT_RESET_PENDING 2
-	#define IOAT_KOBJ_INIT_FAIL 3
 	#define IOAT_RUN 5
 	#define IOAT_CHAN_ACTIVE 6
 	struct timer_list timer;
@@ -112,7 +111,6 @@ struct ioatdma_chan {
 	dma_addr_t completion_dma;
 	u64 *completion;
 	struct tasklet_struct cleanup_task;
-	struct kobject kobj;
 
 /* ioat v2 / v3 channel attributes
  * @xfercap_log; log2 of channel max transfer length (for fast division)
@@ -190,7 +188,7 @@ struct ioat_ring_ent {
 };
 
 extern int ioat_pending_level;
-extern const struct kobj_type ioat_ktype;
+extern const struct attribute_group *ioat_groups[];
 extern struct kmem_cache *ioat_cache;
 extern struct kmem_cache *ioat_sed_cache;
 
@@ -393,8 +391,6 @@ void ioat_issue_pending(struct dma_chan *chan);
 /* IOAT Init functions */
 bool is_bwd_ioat(struct pci_dev *pdev);
 struct dca_provider *ioat_dca_init(struct pci_dev *pdev, void __iomem *iobase);
-void ioat_kobject_add(struct ioatdma_device *ioat_dma, const struct kobj_type *type);
-void ioat_kobject_del(struct ioatdma_device *ioat_dma);
 int ioat_dma_setup_interrupts(struct ioatdma_device *ioat_dma);
 void ioat_stop(struct ioatdma_chan *ioat_chan);
 #endif /* IOATDMA_H */
diff --git a/drivers/dma/ioat/init.c b/drivers/dma/ioat/init.c
index a57024c4b066..984078920c2b 100644
--- a/drivers/dma/ioat/init.c
+++ b/drivers/dma/ioat/init.c
@@ -541,8 +541,6 @@ static void ioat_dma_remove(struct ioatdma_device *ioat_dma)
 
 	ioat_disable_interrupts(ioat_dma);
 
-	ioat_kobject_del(ioat_dma);
-
 	dma_async_device_unregister(dma);
 }
 
@@ -1185,12 +1183,11 @@ static int ioat3_dma_probe(struct ioatdma_device *ioat_dma, int dca)
 		goto err_disable_interrupts;
 	}
 
+	dma->chan_groups = ioat_groups;
 	err = dma_async_device_register(&ioat_dma->dma_dev);
 	if (err)
 		goto err_disable_interrupts;
 
-	ioat_kobject_add(ioat_dma, &ioat_ktype);
-
 	if (dca)
 		ioat_dma->dca = ioat_dca_init(pdev, ioat_dma->reg_base);
 
diff --git a/drivers/dma/ioat/sysfs.c b/drivers/dma/ioat/sysfs.c
index 976134df8108..c24cf12f1ab3 100644
--- a/drivers/dma/ioat/sysfs.c
+++ b/drivers/dma/ioat/sysfs.c
@@ -14,134 +14,95 @@
 
 #include "../dmaengine.h"
 
-struct ioat_sysfs_entry {
-	struct attribute attr;
-	ssize_t (*show)(struct dma_chan *, char *);
-	ssize_t (*store)(struct dma_chan *, const char *, size_t);
-};
-
-static ssize_t cap_show(struct dma_chan *c, char *page)
+static ssize_t cap_show(struct device *dev, struct device_attribute *attr,
+			char *page)
 {
-	struct dma_device *dma = c->device;
+	struct dma_device *dma;
 
+	CLASS(dma_chan_from_dev, c)(dev);
+
+	if (!c)
+		return -ENODEV;
+
+	dma = c->device;
 	return sysfs_emit(page, "copy%s%s%s%s%s\n",
 		dma_has_cap(DMA_PQ, dma->cap_mask) ? " pq" : "",
 		dma_has_cap(DMA_PQ_VAL, dma->cap_mask) ? " pq_val" : "",
 		dma_has_cap(DMA_XOR, dma->cap_mask) ? " xor" : "",
 		dma_has_cap(DMA_XOR_VAL, dma->cap_mask) ? " xor_val" : "",
 		dma_has_cap(DMA_INTERRUPT, dma->cap_mask) ? " intr" : "");
-
 }
-static const struct ioat_sysfs_entry ioat_cap_attr = __ATTR_RO(cap);
+static DEVICE_ATTR_RO(cap);
 
-static ssize_t version_show(struct dma_chan *c, char *page)
+static ssize_t version_show(struct device *dev, struct device_attribute *attr,
+			    char *page)
 {
-	struct dma_device *dma = c->device;
-	struct ioatdma_device *ioat_dma = to_ioatdma_device(dma);
+	struct ioatdma_device *ioat_dma;
 
+	CLASS(dma_chan_from_dev, c)(dev);
+
+	if (!c)
+		return -ENODEV;
+
+	ioat_dma = to_ioatdma_device(c->device);
 	return sysfs_emit(page, "%d.%d\n",
 			   ioat_dma->version >> 4, ioat_dma->version & 0xf);
 }
-static const struct ioat_sysfs_entry ioat_version_attr = __ATTR_RO(version);
+static DEVICE_ATTR_RO(version);
 
-static ssize_t
-ioat_attr_show(struct kobject *kobj, struct attribute *attr, char *page)
+static ssize_t ring_size_show(struct device *dev, struct device_attribute *attr,
+			      char *page)
 {
-	const struct ioat_sysfs_entry *entry;
-	struct ioatdma_chan *ioat_chan;
+	CLASS(dma_chan_from_dev, c)(dev);
 
-	entry = container_of_const(attr, struct ioat_sysfs_entry, attr);
-	ioat_chan = container_of(kobj, struct ioatdma_chan, kobj);
+	if (!c)
+		return -ENODEV;
 
-	if (!entry->show)
-		return -EIO;
-	return entry->show(&ioat_chan->dma_chan, page);
-}
-
-static ssize_t
-ioat_attr_store(struct kobject *kobj, struct attribute *attr,
-const char *page, size_t count)
-{
-	const struct ioat_sysfs_entry *entry;
-	struct ioatdma_chan *ioat_chan;
-
-	entry = container_of_const(attr, struct ioat_sysfs_entry, attr);
-	ioat_chan = container_of(kobj, struct ioatdma_chan, kobj);
-
-	if (!entry->store)
-		return -EIO;
-	return entry->store(&ioat_chan->dma_chan, page, count);
-}
-
-static const struct sysfs_ops ioat_sysfs_ops = {
-	.show	= ioat_attr_show,
-	.store  = ioat_attr_store,
-};
-
-void ioat_kobject_add(struct ioatdma_device *ioat_dma, const struct kobj_type *type)
-{
-	struct dma_device *dma = &ioat_dma->dma_dev;
-	struct dma_chan *c;
-
-	list_for_each_entry(c, &dma->channels, device_node) {
-		struct ioatdma_chan *ioat_chan = to_ioat_chan(c);
-		struct kobject *parent = &c->dev->device.kobj;
-		int err;
-
-		err = kobject_init_and_add(&ioat_chan->kobj, type,
-					   parent, "quickdata");
-		if (err) {
-			dev_warn(to_dev(ioat_chan),
-				 "sysfs init error (%d), continuing...\n", err);
-			kobject_put(&ioat_chan->kobj);
-			set_bit(IOAT_KOBJ_INIT_FAIL, &ioat_chan->state);
-		}
-	}
-}
-
-void ioat_kobject_del(struct ioatdma_device *ioat_dma)
-{
-	struct dma_device *dma = &ioat_dma->dma_dev;
-	struct dma_chan *c;
-
-	list_for_each_entry(c, &dma->channels, device_node) {
-		struct ioatdma_chan *ioat_chan = to_ioat_chan(c);
-
-		if (!test_bit(IOAT_KOBJ_INIT_FAIL, &ioat_chan->state)) {
-			kobject_del(&ioat_chan->kobj);
-			kobject_put(&ioat_chan->kobj);
-		}
-	}
-}
-
-static ssize_t ring_size_show(struct dma_chan *c, char *page)
-{
 	struct ioatdma_chan *ioat_chan = to_ioat_chan(c);
 
 	return sysfs_emit(page, "%d\n", (1 << ioat_chan->alloc_order) & ~1);
 }
-static const struct ioat_sysfs_entry ring_size_attr = __ATTR_RO(ring_size);
+static DEVICE_ATTR_RO(ring_size);
 
-static ssize_t ring_active_show(struct dma_chan *c, char *page)
+static ssize_t ring_active_show(struct device *dev,
+				struct device_attribute *attr, char *page)
 {
+	CLASS(dma_chan_from_dev, c)(dev);
+
+	if (!c)
+		return -ENODEV;
+
 	struct ioatdma_chan *ioat_chan = to_ioat_chan(c);
 
 	/* ...taken outside the lock, no need to be precise */
 	return sysfs_emit(page, "%d\n", ioat_ring_active(ioat_chan));
 }
-static const struct ioat_sysfs_entry ring_active_attr = __ATTR_RO(ring_active);
+static DEVICE_ATTR_RO(ring_active);
 
-static ssize_t intr_coalesce_show(struct dma_chan *c, char *page)
+static ssize_t intr_coalesce_show(struct device *dev,
+				  struct device_attribute *attr, char *page)
 {
+	CLASS(dma_chan_from_dev, c)(dev);
+
+	if (!c)
+		return -ENODEV;
+
 	struct ioatdma_chan *ioat_chan = to_ioat_chan(c);
 
 	return sysfs_emit(page, "%d\n", ioat_chan->intr_coalesce);
 }
 
-static ssize_t intr_coalesce_store(struct dma_chan *c, const char *page,
-size_t count)
+static ssize_t intr_coalesce_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *page, size_t count)
 {
 	int intr_coalesce = 0;
+
+	CLASS(dma_chan_from_dev, c)(dev);
+
+	if (!c)
+		return -ENODEV;
+
 	struct ioatdma_chan *ioat_chan = to_ioat_chan(c);
 
 	if (sscanf(page, "%du", &intr_coalesce) != -1) {
@@ -153,20 +114,23 @@ size_t count)
 
 	return count;
 }
+static DEVICE_ATTR_RW(intr_coalesce);
 
-static const struct ioat_sysfs_entry intr_coalesce_attr = __ATTR_RW(intr_coalesce);
-
-static const struct attribute *const ioat_attrs[] = {
-	&ring_size_attr.attr,
-	&ring_active_attr.attr,
-	&ioat_cap_attr.attr,
-	&ioat_version_attr.attr,
-	&intr_coalesce_attr.attr,
+static struct attribute *ioat_attrs[] = {
+	&dev_attr_ring_size.attr,
+	&dev_attr_ring_active.attr,
+	&dev_attr_cap.attr,
+	&dev_attr_version.attr,
+	&dev_attr_intr_coalesce.attr,
 	NULL,
 };
-ATTRIBUTE_GROUPS(ioat);
 
-const struct kobj_type ioat_ktype = {
-	.sysfs_ops = &ioat_sysfs_ops,
-	.default_groups = ioat_groups,
+static const struct attribute_group ioat_attr_group = {
+	.name = "quickdata",
+	.attrs = ioat_attrs,
+};
+
+const struct attribute_group *ioat_groups[] = {
+	&ioat_attr_group,
+	NULL,
 };
-- 
2.47.3

