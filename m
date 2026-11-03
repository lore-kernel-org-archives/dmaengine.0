Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720451;
	b=EYffdYLRjzIWn3g2RcdVMGufTMNELx3pFyze/9+wrLkqDuA+4zLDwel1iJk0XnR16b4+
	 GOEr+UpjcstA54w65fzW26QXveiYJGvtMGx7E82NF4KyL3qbxVH3mwugxyXEgEWI/tOzC
	 oZAAzw4/uhJQgR+uFE94+TguZi9oYDET6DZqrzhdxRyNQo46aYigm/d2IKyyDWgv9AgUv
	 kWCAE0RO8vP3bAdFd15IcsEN01zutcLNu/9Tu1RiP+s9Rkck3LjTvcDQoIYAczo66yK6Q
	 fVQtMFYMBP4I7YCBmfIfZPBki12KW5a1VFm97Xd6l1nUDQDqqCngikPj91dHIQGiXRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720451;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:
	 Subject:X-SA-Exim-Version:X-SA-Exim-Scanned;
	bh=fvNynf8htGqBQBzeh500/qpOMKe3Lz0Qq4RAbYLCoo8=;
	b=Z4mCc4qH8zfvo1h/4LHPqIUSc7af7gGXp7ysoGJ5v3DxfLj36MqoQNJGnEjoCI8hWAUA
	 fam7ZHQ225SY1JeiBjBkPi9oUpq0nm4YsPRFYHi0fMU8HqCdsAuTX904UUqB+BZQiIrR7
	 8sSu/cb61pNYNxGsJr05T1yQbOFXjRYxv8VYTS/BFJUuc9wkM9di4MQh8BXkkimwPeD8T
	 /enz8aUGJ/Iuc2KQC9qZvmBtZz/w+51Y2qb4w6hW5idPVFDYhlGC/X8TVbf34tZeO31bq
	 V4b2m0t/xxn4RsU7vKnjCHgYd7OyiZelFv/UScqVzvSFKMw8dxZuhflO3B5hDborKtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b="R/ojr/O/";
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7800D606A333;
	Tue,  3 Nov 2026 15:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7800D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=R/ojr/O/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:content-disposition;
	bh=fvNynf8htGqBQBzeh500/qpOMKe3Lz0Qq4RAbYLCoo8=; b=R/ojr/O/Cd8Ls3WWonsZgl6jdu
	7NiDEnybSK55xQ56GS5ibv9ctVsmldtQmRiM0+4gxnvCu5g+ONR3ZleHRWr92vdDeDg7v3Vrmb2kv
	r4NaJOJ+ABqovfWGkAqRZCCx/Sh2dyaaokso+cz7TITRSXpACJlG3cZ0LkjsxBsqvNv7nTOo7WnUJ
	sH65sxejqFDcCGzfIaLWszgFmDp2rhcQJhVPaAP6YMpGljAG+MEpP0pfnkIfgm6X4WVDCCNVMytNA
	RgzuRQidZlJ2mwoTeS0nAdeRQDAqWbWk+r8HzmFKyRpjhWJV/+UMz58UkieG+cmy6ktNQlBETa6Io
	0GIBlPYA==;
Received: from donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xOGct-000000091Hk-0yKf;
	Tue, 03 Nov 2026 09:40:44 -0600
Received: from logang by donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xOGca-00000001vZa-122B;
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
Date: Tue,  3 Nov 2026 09:40:18 -0600
Message-ID: <20261103154022.459620-2-logang@deltatee.com>
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
Subject: [PATCH v3 1/4] dmaengine: add per-channel sysfs attribute groups via chan_groups
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
itself to drivers, add a small dmaengine_chan_from_dev_lock() /
dmaengine_chan_from_dev_unlock() pair that take / release the lock, and
wrap them in a dmaengine_chan_from_dev CLASS so callers can write:

	CLASS(dmaengine_chan_from_dev, c)(dev);
	if (!c)
		return -ENODEV;

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/dma/dmaengine.c   | 27 +++++++++++++++++++++++++++
 drivers/dma/dmaengine.h   | 19 +++++++++++++++++++
 include/linux/dmaengine.h |  4 ++++
 3 files changed, 50 insertions(+)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index 34be53487a21..38f601bf41e1 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -161,6 +161,32 @@ static struct dma_chan *dev_to_dma_chan(struct device *dev)
 	return chan_dev->chan;
 }
 
+/**
+ * dmaengine_chan_from_dev_lock - take dma_list_mutex and convert a channel's
+ *	struct device to its dma_chan
+ * @dev: the channel's struct device, embedded in struct dma_chan_dev
+ *
+ * Returns NULL if the channel has already been unregistered. Pairs with
+ * dmaengine_chan_from_dev_unlock(); see the dmaengine_chan_from_dev CLASS in
+ * drivers/dma/dmaengine.h.
+ */
+struct dma_chan *dmaengine_chan_from_dev_lock(struct device *dev)
+{
+	mutex_lock(&dma_list_mutex);
+	return dev_to_dma_chan(dev);
+}
+EXPORT_SYMBOL_GPL(dmaengine_chan_from_dev_lock);
+
+/**
+ * dmaengine_chan_from_dev_unlock - release the channel lookup lock
+ * @chan: unused; matches the value produced by dmaengine_chan_from_dev_lock()
+ */
+void dmaengine_chan_from_dev_unlock(struct dma_chan *chan)
+{
+	mutex_unlock(&dma_list_mutex);
+}
+EXPORT_SYMBOL_GPL(dmaengine_chan_from_dev_unlock);
+
 static ssize_t memcpy_count_show(struct device *dev,
 				 struct device_attribute *attr, char *buf)
 {
@@ -1117,6 +1143,7 @@ static int __dma_async_device_channel_register(struct dma_device *device,
 
 	dmaengine_chan_dev(chan)->class = &dma_devclass;
 	dmaengine_chan_dev(chan)->parent = device->dev;
+	dmaengine_chan_dev(chan)->groups = device->chan_groups;
 	chan->chan_dev->chan = chan;
 	chan->chan_dev->dev_id = device->dev_id;
 	spin_lock_init(&chan->lock);
diff --git a/drivers/dma/dmaengine.h b/drivers/dma/dmaengine.h
index 42a3cfa7e597..f03248a091df 100644
--- a/drivers/dma/dmaengine.h
+++ b/drivers/dma/dmaengine.h
@@ -214,6 +214,25 @@ int dma_async_device_channel_register(struct dma_device *device,
 void dma_async_device_channel_unregister(struct dma_device *device,
 					 struct dma_chan *chan);
 
+/*
+ * dmaengine_chan_from_dev_lock() / dmaengine_chan_from_dev_unlock() bracket
+ * a critical section across which a channel's struct device can be safely
+ * converted back to its struct dma_chan: dmaengine_chan_from_dev_lock()
+ * returns NULL if the channel has already been unregistered, and the lock
+ * it takes must be held for as long as the returned channel (or anything
+ * derived from it) is accessed.
+ *
+ * Use these through the dmaengine_chan_from_dev CLASS below rather than calling
+ * them directly.
+ */
+struct dma_chan *dmaengine_chan_from_dev_lock(struct device *dev);
+void dmaengine_chan_from_dev_unlock(struct dma_chan *chan);
+
+DEFINE_CLASS(dmaengine_chan_from_dev, struct dma_chan *,
+	     dmaengine_chan_from_dev_unlock(_T),
+	     dmaengine_chan_from_dev_lock(dev),
+	     struct device *dev)
+
 #ifdef CONFIG_DEBUG_FS
 #include <linux/debugfs.h>
 
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 805668fbe437..944c8b0f5848 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -839,6 +839,9 @@ struct dma_filter {
  * @dev: struct device reference for dma mapping api
  * @owner: owner module (automatically set based on the provided dev)
  * @chan_ida: unique channel ID
+ * @chan_groups: optional NULL-terminated array of sysfs attribute groups
+ *	added to each channel's struct device, for driver-specific per-channel
+ *	attributes
  * @src_addr_widths: bit mask of src addr widths the device supports
  *	Width is specified in bytes, e.g. for a device supporting
  *	a width of 4 the mask should have BIT(4) set.
@@ -923,6 +926,7 @@ struct dma_device {
 	struct device *dev;
 	struct module *owner;
 	struct ida chan_ida;
+	const struct attribute_group **chan_groups;
 
 	u32 src_addr_widths;
 	u32 dst_addr_widths;
-- 
2.47.3

