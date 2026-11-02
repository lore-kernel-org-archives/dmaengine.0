Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611422;
	b=efMhld6KzmWVjVC3keKrFJ1A6QxXeruBZa/d4TBBBQuGrlxt+/SbRByx5LAHJOkjgKyn
	 8/9yQ+z7Ci3Bfda1X6jgxVN7FHE6JCYVGZo45rWPNaPOJjzQNUARYLfidASIDvkhOGgep
	 jins5jxdVMcGt0hyAAEydDFOSPSfZ7jPletPVD90ICkSAf1hhfhAYESp3ct6tgbecIoQh
	 fn1HrCWXvOGFYwryY8BtQ3OoxmAK/TLGd8u/vG6qIe2jlv2NsSbK7FxE7u8rVIrE0ivDI
	 21DEWGXmkIUdEdhXsy3HKDrvIFtETQQtcZQFRgr0WjZ4fuUUL9IEVBk3oUIzbODgewg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611422;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer;
	bh=OfSp5pDgZeuv6733BH1Z0rZ13Ku/TdBMwwQpkidKZ3s=;
	b=ouQAiShVB3X6Yoq9pnt4TNcnnUeFRtjaqJ8RTSgT5mIHKxzM5mX7uW7hCyyiDnZIyGla
	 MHk7orI4mCKFsV6Z6+9whxQdGxHRfSHbS2wufQn2AnI7jeP7KvR++UHKJhRnK5n1DQgYD
	 p1nUhReKh7TSsnCdXrA9WfLZAVRu25YrAy+Iy5Saiji7ClRdJbIQ6izPjVhlLCNXWruVp
	 BGBoaiyiG0KlMMxrw2IfR9jGpVT2VlQJV98F7M/R+SPY/CZ6X09ajbucpCbj7fPa4BDTk
	 JeZNlfCeG85tJSkQTlSDcUu6e3ILMlC3A666iDyeo0kqC8/V9AJDC9/E0SD0sRRqq8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WXMbOo2R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B85606A32C
	for <dmaengine@vger.kernel.org>; Mon,  2 Nov 2026 09:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WXMbOo2R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C056F1F00919;
	Mon,  2 Nov 2026 09:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793611421;
	bh=OfSp5pDgZeuv6733BH1Z0rZ13Ku/TdBMwwQpkidKZ3s=;
	h=From:Date:Subject:To:Cc;
	b=WXMbOo2R8OapSvhSibLC44uchtI8Ji5jPTsPqMPtQsdWV1N21KJi5kaEm86ZpbTIm
	 E7u65PvbahavsN8WRA1U5mundUoRiGFZq0W+1nIBAC7cNsSMROSCDRkrN+/vkZbzDH
	 o5omdR8uB+EqVanBPWHOiBKrWBiNispudnNPSS2fgjDYeSSsl3hIyRiFytvLqHMvo5
	 6AEw35gdGruIV8ZVYybGerkuEkR7RZz+bPMM5Ib4xNxmfphIc27MGSqBH/F/sp50S2
	 CjIhIu4n2gh1uDk4rH0ZTQQ/Kh2E99a5fd0g9zwocJxt7de/IIFRv/1/UMtf8MqJCV
	 CIRuT/zs9WZsw==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 02 Nov 2026 10:23:39 +0100
Subject: [PATCH v2] dmaengine: Use unique debugfs names
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
Message-Id: <20261102-dmaengine-fixes-v2-1-d0473b3a0ed5@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNSw4CIRBErzLptRgadD6uvIeZBYGW6ahgwBDNh
 LuLs3f5qvKqVsiUmDKcuhUSFc4cQwO168AuJngS7BqDkqqXE47CPQwFz4HEld+UxdGOk7Y0oDx
 M0Kxnoq1o0mVuvHB+xfTZDgr+0v9bBQWKgVA6g73WFs83SoHu+5g8zLXWL+XYAfqvAAAA
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

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Fix duplicate direntry.
---
Changes in v2:
- Rebased on v7.4-rc1
- Link to v1: https://lore.kernel.org/r/20260918-dmaengine-fixes-v1-1-7e10da1633c1@kernel.org
---
 drivers/dma/dmaengine.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index 34be53487a21..7eb8d53b4863 100644
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
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260918-dmaengine-fixes-5c893ce71049

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

