Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087356;
	b=tyItQSBGjcpXwKoAlrE0+l1kR74hUuN7PsCxkpxER8+Lqx4OPwgdWCmJ98+D1yBhU0g9
	 gMnLwkspnhbNYqZxShgIfsuXzoAtxDLux+auKvBGo9iaO+Dl0FtWAmQvoN8GwzVnLEdD/
	 lpgbHVgwD+PknKmh0IHzRAcxukMcT1ccTPg223zF3K2EiDQ+VyOUQ0YNY78t3XLvEdOd+
	 4QeQzbGit6oDrpXrbCVL+hT3oWCAoC3lJOwiPVpCHg1R/e2PVBL5Y8LxTs3lCcNURKbER
	 RXhE3wA3Lufk1a9QvXJt5Z+EUXs44QdNPfsVNAt5hGYQuTFQe1jAiv6pnO+88Iy3sjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087356;
	h=DMARC-Filter:DKIM-Signature:X-Lms-Return-Path:X-Mailer:To:From:
	 Subject:Mime-Version:X-Original-From:Message-Id:
	 Content-Transfer-Encoding:Cc:Date:Content-Type;
	bh=MlCLrDqrSeighfhjWv2DVS6iyNrp+yoODMT7KhOE6ys=;
	b=X0E3vYVmwOmb2cadPCNGm3dMtyvWLYQEojBiBQOLh64kRqPYIrY6nDIdJ88hVU0Sr/lC
	 0QLusUXguKgel3WHfYSXnx1YA6eTKBrS/WMI+K6C1yNwZhdXrDkkEAmvdFZ976SWd7JV3
	 45wySfn7DX/Px4nVActzGHijUO0LYxMamLVZQ5nrq+Y2uoEPupedb4rob9dAXObFDaHgB
	 GaCeDtX3MExgFGfqHHyZ5EZ08rsYLpEuezFei0UrRE5/5opB9nWccYGuXBwwrJPKp6anm
	 An9CO0shoYGsnNX/Z+qk2MhEzEOmJvoe/nLN+2vu8/j57WfdaKvRqOOquhTnlZOVXCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b="iAPcuc0/";
	arc=none smtp.remote-ip=209.127.231.115
Received: from va-2-115.ptr.blmpb.com (va-2-115.ptr.blmpb.com [209.127.231.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D27606A325
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 11:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99D27606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=iAPcuc0/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1795087351; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=MlCLrDqrSeighfhjWv2DVS6iyNrp+yoODMT7KhOE6ys=;
 b=iAPcuc0/JrAUWLHy4WgUJAT29FXj06PRkR23OeNyXIrfX5/vY8+NOUG/wigajhPysAMAKi
 tA7QV3kLjqJ2FHIgAr5qQwUsu4TepIMvNcjo2cyPMUgHuxqy5QPzYTLuGWIOWAw3pVLvMh
 smSae0+QgSsSD/fiedUD2PXpa8nAhlzmPqqgEyMP0EXbPanciaCwyt4RklICj1be4dzGxE
 gc7+DuCSFXC3klOOCax47ceDB8PQBdf52NkcLx9Dr13yxQixID8naBpFNQO8KMn64wiAgY
 kyU/poGDX3ZN4zWz2Oss3mfusRBMJk1pYxDwYKMAMNtS+xj3F2UDK3blTNiBCg==
X-Lms-Return-Path: <lba+26afedbf5+85e03d+vger.kernel.org+weiguixiong@bytedance.com>
X-Mailer: git-send-email 2.55.0
To: "Vinicius Costa Gomes" <vinicius.gomes@intel.com>, 
	<dmaengine@vger.kernel.org>
From: "Guixiong Wei" <weiguixiong@bytedance.com>
Subject: [PATCH] dmaengine: idxd: Restrict DSACAP reads to DSA devices
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Original-From: Guixiong Wei <weiguixiong@bytedance.com>
Message-Id: <20261119112212.92663-2-weiguixiong@bytedance.com>
Content-Transfer-Encoding: 7bit
Cc: "Guixiong Wei" <weiguixiong@bytedance.com>, 
	"Dave Jiang" <dave.jiang@intel.com>, "Vinod Koul" <vkoul@kernel.org>, 
	"Frank Li" <Frank.Li@kernel.org>, <linux-kernel@vger.kernel.org>, 
	"Yi Sun" <yi.sun@intel.com>
Date: Thu, 19 Nov 2026 19:22:07 +0800
Content-Type: text/plain; charset=UTF-8

idxd_read_caps() reads DSACAP0-2 whenever the hardware version is 3 or
later, regardless of the accelerator type. On IAA devices, offset 0x180
is IAACAP, which is already read by the separate IAA capability path.
The additional reads populate DSA capability fields that are not used
by IAA devices.

Restrict DSACAP reads to DSA devices, matching the device type check used
for dsacaps sysfs visibility and SGL support.

Signed-off-by: Guixiong Wei <weiguixiong@bytedance.com>
---
 drivers/dma/idxd/init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
index 4b827a3297564..1a8638adf8c7d 100644
--- a/drivers/dma/idxd/init.c
+++ b/drivers/dma/idxd/init.c
@@ -560,7 +560,8 @@ static void idxd_read_caps(struct idxd_device *idxd)
 	}
 	multi_u64_to_bmap(idxd->opcap_bmap, &idxd->hw.opcap.bits[0], 4);
 
-	if (idxd->hw.version >= DEVICE_VERSION_3) {
+	if (idxd->data->type == IDXD_TYPE_DSA &&
+	    idxd->hw.version >= DEVICE_VERSION_3) {
 		idxd->hw.dsacap0.bits = ioread64(idxd->reg_base + IDXD_DSACAP0_OFFSET);
 		idxd->hw.dsacap1.bits = ioread64(idxd->reg_base + IDXD_DSACAP1_OFFSET);
 		idxd->hw.dsacap2.bits = ioread64(idxd->reg_base + IDXD_DSACAP2_OFFSET);

base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
-- 
2.55.0
