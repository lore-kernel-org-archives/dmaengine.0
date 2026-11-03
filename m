Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720483;
	b=CLs2uUCzko+hVRSHWhngwqDryhQNCm28eCHQ9VIEh2LnTKYIe3fkbEEOwYfsxeR+fBTj
	 9biwgtB9mppJNcHUtePczKuRiHuLSo2o4fioDvv0Hav8roRSFsYeTEYr9kcaO1hsWIJcQ
	 4YZ1LPW0BaUL6zjBR9Jz1dq6KXe0/AmhCL4Nj3yCbaSjXmBHwV/y+LTOIeMdgNQdsae4w
	 f+o5MFbubWMbJUNUkb7MeliE7DKOEREJSumt5K7HGiJVLC2H6f72zUIT/c9iqCUg3VeBP
	 5k4Ypg+aHPq0MKX8CzArKDxU+EZOEEkhI89mfcxh/x954C7Ewkc+Y/zwtc4ZnsNkOoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720483;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:
	 Subject:X-SA-Exim-Version:X-SA-Exim-Scanned;
	bh=70r+0GOEc21NYB9X5oe2FmJrwISnpHCzb5aTYYyffN8=;
	b=KyaYKDtWZIehX01jHDAfZjV55BUVpPf30ec3JQ2f61mao0E1bTtkbQaA+rbeSk8fRrQm
	 yZTGM2UNGcoIyZtQQEqmpNkEnhNf++5Hs7qTQgz38w1wLvJ7umnTe78t0eU8pdIiIb52T
	 scUvIF6Lf+vBbfc55TVJrQLIITk5SDnMRoZdLHE6+BJKGI1GWbII+MvTrw57cLa0rTk6s
	 Y89Qyu/x/NRi5LeGHtDNzoYJcVIzypjypXgPuH9fW0BvCjrLP+OpWetgwIn3T9HsCi3zl
	 Uo8fWIl2/Rwzedyh0ovoFeM5P3tYIkn+GIqb5+TzbLRSNaOkQhdm5l/If84wvcV6l8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=GVhOs6R9;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859E8606D824;
	Tue,  3 Nov 2026 15:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 859E8606D824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=GVhOs6R9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:content-disposition;
	bh=70r+0GOEc21NYB9X5oe2FmJrwISnpHCzb5aTYYyffN8=; b=GVhOs6R9ILk9O+jXFa/u4W6VTf
	nZV1jvEC2slg17cqlD0pJetFLWjuYFEsRS60/x9ybCy/l/NHkdj1LzlT7v9unjcrCHYFBCV/IO9a6
	pTCcwdX457KB5yv3K4DVe1Ou15kKa87RZAjnllKdV9gHuhfrM7kw5wiSfLWOa6kRQLpEgpVj9cANi
	HcQmuiO5ygkM/W7Vib3oZwgHvjNzujn5QCG25wju9+F6eEvl3/C0+ERrnjmkz5jTj4lKr9xWXbEe2
	Gu7YQbpEavUdXrJhBZu4ZMEPkHHVDUan1/+HqhiRDiDztAR3aDHvrEDgFLzFiXD7SRL8jc/YBCuuR
	fhnwI+MQ==;
Received: from donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xOGdU-000000091IW-09mB;
	Tue, 03 Nov 2026 09:41:21 -0600
Received: from logang by donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xOGca-00000001vZe-1cUz;
	Tue, 03 Nov 2026 09:40:24 -0600
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
Date: Tue,  3 Nov 2026 09:40:19 -0600
Message-ID: <20261103154022.459620-3-logang@deltatee.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103154022.459620-1-logang@deltatee.com>
References: <20261103154022.459620-1-logang@deltatee.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, vkoul@kernel.org, Frank.li@nxp.com, hch@infradead.org, christophe.jaillet@wanadoo.fr, dave.jiang@intel.com, linux@weissschuh.net, kelvin.cao@microchip.com, logang@deltatee.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: [PATCH v3 2/4] dmaengine: ioatdma: convert per-channel sysfs to chan_groups
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
index 976134df8108..9bdc0fbf7696 100644
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
 
+	CLASS(dmaengine_chan_from_dev, c)(dev);
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
 
+	CLASS(dmaengine_chan_from_dev, c)(dev);
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
+	CLASS(dmaengine_chan_from_dev, c)(dev);
 
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
+	CLASS(dmaengine_chan_from_dev, c)(dev);
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
+	CLASS(dmaengine_chan_from_dev, c)(dev);
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
+	CLASS(dmaengine_chan_from_dev, c)(dev);
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

