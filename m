Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238C6394797
	for <dmaengine@vger.kernel.org>; Fri, 18 Sep 2026 09:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722919; cv=none; b=VUz6HQ0O0mo3OtjsxOaZU+VEp1gmjCsM8Md86Xg/V3vJBX7QPLG+lO2Oox7ZArp7Dec0eEvHOf3XEP01KB8PEbbMtio+mBGsP3iM1gbb/DOPHmEV2HjmZ/3sGag+jJCOM7Tf1MjNfQ9CEK997FLMSIw1G0Vf9MJ5fFOUDmjVid4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722919; c=relaxed/simple;
	bh=H4drMY2dwRR5BsLSDXJEWmttC4UHR6IYj/kYxhGK03w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=c7UOyWOrN6xUDzwCJ4m+A6O4z5X91BE5EeX4kCBAO1z8BiMHLHZoRZvXVprlshTJPJPiUE/KtE5bt/csYiRMzWKNF6nPzsmWKgJGo+06B7lisRXNCsI0t4U2ot88+odNjaeA1JZccDatEw/FeIhh3woMHfsAQai2lndKyuxDPMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DfGDEa7V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DfGDEa7V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC5EF1F000FF;
	Fri, 18 Sep 2026 09:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789722917;
	bh=/u3dvbL0zJofAX6GcFhVPki7a7zzqPuxraUszJXCGFs=;
	h=From:Date:Subject:To:Cc;
	b=DfGDEa7VY10KK5VbjiBiMC8C6HJ73iRoGtKhv2XxGUROIp0+oeiYw968Ov6QtYMKj
	 1dXY64apYx+IQXkz9FihhJmi4Tnd3TcXRiLlUnMTVMZzCwz4ztnLfbvcUYaA5jVSSu
	 D24dxFi56s5bWAUib7I0jHbjf9E6EXEWe28Pv31n271+JJGACIMe2/lIfjXbliOKj4
	 8cpVLxl313H3CQ/LzkBlLrViBtxlxZPLgBVRg7r1DHmEW31uefwiUT8CaCUIIzN+7+
	 ORnrugWN9KBf4ReIWxer1P6H8o/vIWWJnlEgLwD3qn7awbIzSn/M3KvcJidBTPXj26
	 3PdXM6QWcIIUA==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 11:15:14 +0200
Subject: [PATCH] dmaengine: Use unique debugfs names
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-dmaengine-fixes-v1-1-7e10da1633c1@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LSwqAIBRG4a3IHSeoPW0r0SD0r+4gC4UIpL0nD
 T8OJ1NCZCQaRaaImxOfoUBXgty+hA2SfTEZZTpl9SD9sSBsHCBXfpBk6wZbO/RaNZbKdUX8oUz
 T/L4fH2jt42EAAAA=
X-Change-ID: 20260918-dmaengine-fixes-5c893ce71049
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

DMA40 registers multiple dma_device instances for the same platform
device. The DMAengine debugfs code uses dev_name(dma_dev->dev) as the
directory name, so the second and third registrations try to create the
same directory and print duplicate-name warnings.

Keep the existing device-name directory for the first registration, but
use a dev_id-suffixed fallback when that name already exists.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Fix duplicate direntry.
---
 drivers/dma/dmaengine.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index 6ffd8bd82154..a1c388def67a 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -33,6 +33,7 @@
 
 #include <linux/acpi.h>
 #include <linux/acpi_dma.h>
+#include <linux/dcache.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
@@ -70,8 +71,24 @@ static struct dentry *rootdir;
 
 static void dmaengine_debug_register(struct dma_device *dma_dev)
 {
-	dma_dev->dbg_dev_root = debugfs_create_dir(dev_name(dma_dev->dev),
-						   rootdir);
+	const char *name = dev_name(dma_dev->dev);
+	struct dentry *dentry;
+	char *uniq;
+
+	dentry = debugfs_lookup(name, rootdir);
+	if (dentry) {
+		dput(dentry);
+
+		uniq = kasprintf(GFP_KERNEL, "%s.%d", name, dma_dev->dev_id);
+		if (!uniq)
+			return;
+
+		dma_dev->dbg_dev_root = debugfs_create_dir(uniq, rootdir);
+		kfree(uniq);
+	} else {
+		dma_dev->dbg_dev_root = debugfs_create_dir(name, rootdir);
+	}
+
 	if (IS_ERR(dma_dev->dbg_dev_root))
 		dma_dev->dbg_dev_root = NULL;
 }

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260918-dmaengine-fixes-5c893ce71049

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

