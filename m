Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535509;
	b=T3gX+y2wRLIeitHqEIbW2kEkLCoYZXyJBnU1i00aVu7qXdTHRMS3Lz3U0/Zo1MgR1Imi
	 ojUWVCfBFxYnNRLWrwgButBELfWbmT19415kA/KhFwdbr6wtFYLdzPRQv1HIAn+b+3Trr
	 JEX9lJe1ZHkZKYC+sTZ7xcfQJ25MO5bUqcwteGil+VKiFsRoxZae5+FebZhFePs3OxHef
	 /4n1FbhpvrgKt9vXCg4589qwiWE7z1lVB/JNety6jmMmoBpVbISsttjLBd+QXGphoUWen
	 SDzCIMLunICWKqa8nO0NdkngW92x08VR2+GoRbAhIfPIeErJtaz+WvRq+mIOiShHKLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535509;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:
	 Subject:X-SA-Exim-Version:X-SA-Exim-Scanned;
	bh=ZZ3AWBMzcsyPyfazEH9VwvOs04SwA0rovJJZR5L4LMo=;
	b=m2CjrIeobvT42rRpvJyOzrkIVo4rMiUOYshMjNZ3F92UPOLcmc+n6cH6z5BfWXYVEIGP
	 QiFezWJnKobJO41u3gHWOSJPWyPD3Rzf1rnkA60KqvG4Muuaaa4Xi9bD+OLn0pKjpuY91
	 lSoxzSZN3sTA+p+ZbLFXZ1ljRFqW22/jeVUuUYacnb6Vfc6fYMJ2tBvFDj5Rp8fs8B4uZ
	 XhTPpNbeJCVP9VfVLOuVMCNRx7hSZM+VJ6EOc0fFfEC7Noc5IhII0YNLOmIWbvhmuvjCq
	 RREIycrMAu7+eQC1wUkZrV5KgJe8vDRPL8B9BUOoY+CnbFHOX+boezzlZI3sg7MLZ/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=NSrRFGBh;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E424B606A331;
	Tue, 24 Nov 2026 15:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E424B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=NSrRFGBh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:content-disposition;
	bh=ZZ3AWBMzcsyPyfazEH9VwvOs04SwA0rovJJZR5L4LMo=; b=NSrRFGBhmn25V8HwPJIiwDUQov
	CWhvywC1QRobv1lt8t4RfMooxkTpDscASfD+F7hx6YDLQe5aa9/w7hofGgqtWa8elTdMmfij00KUP
	0jbU+nU7+sH3e5cKoMxLA74WuZ7MrkEs0S1QmrCi+jab9QPK0inRNdlQUMFmQ7R51M4Jeak9da/Ay
	OA6SPRWJns6lveyzvyP7YBNkoKj15uSwxNG+AVMfgVOBBMqHbWCO7ayTW+2asNt7tXYlZjut+Kj15
	ZdrH45njqbMl8hspSLKSI3DVVvdZQ9TeG3+iEivkAF53w5p3j4SnzzyJhWXeZmSc8wui2EJiAgkaA
	kixgQrKA==;
Received: from donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xVso0-00000000mbW-1Dsc;
	Tue, 24 Nov 2026 09:51:41 -0600
Received: from logang by donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xVsmn-00000003rRb-3DAg;
	Tue, 24 Nov 2026 09:50:25 -0600
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
	Logan Gunthorpe <logang@deltatee.com>,
	Frank Li <Frank.Li@nxp.com>
Date: Tue, 24 Nov 2026 09:50:20 -0600
Message-ID: <20261124155024.920403-2-logang@deltatee.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124155024.920403-1-logang@deltatee.com>
References: <20261124155024.920403-1-logang@deltatee.com>
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
X-SA-Exim-Rcpt-To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, vkoul@kernel.org, hch@infradead.org, christophe.jaillet@wanadoo.fr, dave.jiang@intel.com, linux@weissschuh.net, kelvin.cao@microchip.com, logang@deltatee.com, Frank.li@nxp.com, Frank.Li@nxp.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: [PATCH v5 1/4] dmaengine: add per-channel sysfs attribute groups via chan_groups
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

Reviewed-by: Frank Li <Frank.Li@nxp.com>
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

