Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6354C3BFE4C;
	Mon, 27 Jul 2026 19:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=204.191.154.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785178964; cv=none; b=dvgntJBUxWed3ZSgUkzFD/Qfc/zSfUYtujXiLp0d8XdkGTngLpTn2Mq6qV0a7QQ69/Rv9IarLVBqNRkitjTpDOX6zSkObI5ASt8fizWvJVbiHWyB7luvTObhYz/mBLqthJVOCY+PLEjJSlJQ6EcBxQMa83n/aA0tC/tSg74ndMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785178964; c=relaxed/simple;
	bh=tA/b3pdwSQoGbTTW+rVyD6nEMhbLOiCMMCN+xqLbt+0=;
	h=From:To:Cc:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Subject; b=KXMc/TsYZg3780jcKgSmK81ivswNhypzSM0x30EchvvCoEwK6AgeD9/1zRInu2EFpBDpqMq8SyYo0D2m3YJ15aBanUB+nthl+3YWXp4gR38CHa7taHmeVkAuSCVtv8mwhl/MfkWgIUX63Far2wD86qIEqx4oKoXQeP24L+Zw2+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com; spf=pass smtp.mailfrom=deltatee.com; dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b=LphC9E5d; arc=none smtp.client-ip=204.191.154.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b="LphC9E5d"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:content-disposition;
	bh=iF21S30XHIGLA2G6uwZx+zNOIRs0It4XERKwvjPTM4Y=; b=LphC9E5dpqBXdeNhCXkT5aGArV
	iCH9RPdRke6jJkkhZ5t+RZQjhbJhOtI/tn+oZwAYhCKHw4qToEbRMy2ltJcGKIrxvz3YSxAN3hzSH
	CS7H6qzFHzaFDuYkLV4LXMdWTAreFnvBjmdKBXgPLFrz5Wt/q+Kj77cYeF9rPM0DvdykynJFwZAXo
	zdLAvQ1TfwDNour9ZRIRT7RXHcCPrq9rcF5mWrvNpUuFClQAoXM7DkoIbOPKA/ancffhEHmEuSzGr
	vpSzyVbzrmuvMOPO/NCJ5QTEKUNOgdpvB05HxH2At1qN/79xWvpZKF6ejdYA0/TBHu4GkjQttVaEi
	bFsAsCxA==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <gunthorp@deltatee.com>)
	id 1woQb3-000000005VB-3lzr;
	Mon, 27 Jul 2026 13:02:42 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <gunthorp@deltatee.com>)
	id 1woQNb-000000003IN-2dsH;
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
Date: Mon, 27 Jul 2026 12:48:41 -0600
Message-ID: <20260727184844.12647-2-logang@deltatee.com>
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
Subject: [PATCH v2 1/4] dmaengine: add per-channel sysfs attribute groups via chan_groups
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

Each channel already gets its own struct device (dma_chan_dev),
registered with device_register()/device_unregister() and torn down
correctly by chan_dev_release(). Let drivers add their own sysfs
attributes to that device directly, via a new dma_device.chan_groups
field.

This avoids drivers needing a second, separately-managed kobject to
expose driver-specific attributes. That's a use-after-free issue:
kobject_put() can invoke the ktype's release() and free the structure
embedding dma_chan while the core (or the driver) still expects to
reference it afterward, so avoiding it requires careful ordering and
bookkeeping that's easy to get wrong. The channel's struct device
already has the correct lifetime, and sysfs_create_group() supports
the same named-subdirectory layout (attribute_group.name) that a bare
kobject would provide.

To let show()/store() callbacks safely recover the struct dma_chan from
the struct device they're attached to without exposing dma_list_mutex
itself to drivers, add a small dma_chan_from_dev_lock() /
dma_chan_from_dev_unlock() pair that take / release the lock, and
wrap them in a dma_chan_from_dev CLASS so callers can write:

	CLASS(dma_chan_from_dev, c)(dev);
	if (!c)
		return -ENODEV;

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/dma/dmaengine.c   | 27 +++++++++++++++++++++++++++
 drivers/dma/dmaengine.h   | 19 +++++++++++++++++++
 include/linux/dmaengine.h |  4 ++++
 3 files changed, 50 insertions(+)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index 9049171df857..060a0a482eb3 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -161,6 +161,32 @@ static struct dma_chan *dev_to_dma_chan(struct device *dev)
 	return chan_dev->chan;
 }
 
+/**
+ * dma_chan_from_dev_lock - take dma_list_mutex and convert a channel's
+ *	struct device to its dma_chan
+ * @dev: the channel's struct device, embedded in struct dma_chan_dev
+ *
+ * Returns NULL if the channel has already been unregistered. Pairs with
+ * dma_chan_from_dev_unlock(); see the dma_chan_from_dev CLASS in
+ * drivers/dma/dmaengine.h.
+ */
+struct dma_chan *dma_chan_from_dev_lock(struct device *dev)
+{
+	mutex_lock(&dma_list_mutex);
+	return dev_to_dma_chan(dev);
+}
+EXPORT_SYMBOL_GPL(dma_chan_from_dev_lock);
+
+/**
+ * dma_chan_from_dev_unlock - release the lock taken by dma_chan_from_dev_lock()
+ * @chan: unused; matches the value produced by dma_chan_from_dev_lock()
+ */
+void dma_chan_from_dev_unlock(struct dma_chan *chan)
+{
+	mutex_unlock(&dma_list_mutex);
+}
+EXPORT_SYMBOL_GPL(dma_chan_from_dev_unlock);
+
 static ssize_t memcpy_count_show(struct device *dev,
 				 struct device_attribute *attr, char *buf)
 {
@@ -1098,6 +1124,7 @@ static int __dma_async_device_channel_register(struct dma_device *device,
 
 	chan->dev->device.class = &dma_devclass;
 	chan->dev->device.parent = device->dev;
+	chan->dev->device.groups = device->chan_groups;
 	chan->dev->chan = chan;
 	chan->dev->dev_id = device->dev_id;
 	if (!name)
diff --git a/drivers/dma/dmaengine.h b/drivers/dma/dmaengine.h
index 53f16d3f0029..224126e64d54 100644
--- a/drivers/dma/dmaengine.h
+++ b/drivers/dma/dmaengine.h
@@ -182,6 +182,25 @@ dmaengine_desc_callback_valid(struct dmaengine_desc_callback *cb)
 struct dma_chan *dma_get_slave_channel(struct dma_chan *chan);
 struct dma_chan *dma_get_any_slave_channel(struct dma_device *device);
 
+/*
+ * dma_chan_from_dev_lock() / dma_chan_from_dev_unlock() bracket a critical
+ * section across which a channel's struct device can be safely converted
+ * back to its struct dma_chan: dma_chan_from_dev_lock() returns NULL if the
+ * channel has already been unregistered, and the lock it takes must be held
+ * for as long as the returned channel (or anything derived from it) is
+ * accessed.
+ *
+ * Use these through the dma_chan_from_dev CLASS below rather than calling
+ * them directly.
+ */
+struct dma_chan *dma_chan_from_dev_lock(struct device *dev);
+void dma_chan_from_dev_unlock(struct dma_chan *chan);
+
+DEFINE_CLASS(dma_chan_from_dev, struct dma_chan *,
+	     dma_chan_from_dev_unlock(_T),
+	     dma_chan_from_dev_lock(dev),
+	     struct device *dev)
+
 #ifdef CONFIG_DEBUG_FS
 #include <linux/debugfs.h>
 
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index b3d251c9734e..f4e7861b2507 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -803,6 +803,9 @@ struct dma_filter {
  * @dev: struct device reference for dma mapping api
  * @owner: owner module (automatically set based on the provided dev)
  * @chan_ida: unique channel ID
+ * @chan_groups: optional NULL-terminated array of sysfs attribute groups
+ *	added to each channel's struct device, for driver-specific per-channel
+ *	attributes
  * @src_addr_widths: bit mask of src addr widths the device supports
  *	Width is specified in bytes, e.g. for a device supporting
  *	a width of 4 the mask should have BIT(4) set.
@@ -886,6 +889,7 @@ struct dma_device {
 	struct device *dev;
 	struct module *owner;
 	struct ida chan_ida;
+	const struct attribute_group **chan_groups;
 
 	u32 src_addr_widths;
 	u32 dst_addr_widths;
-- 
2.47.3

