Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAF138654B;
	Wed,  4 Mar 2026 21:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772660689; cv=none; b=CYYsyoXyP/lH/ywqN8fleoi5gLKJ4K47F5TAohGqMjPZ/Ko4/7+6xIDXGxXtYjlSsharNBjRMfaD7vEx+29U4nf+aC3he177Wz2THBnd3D9NNlEVrqqkfzO3YO61Pn6mr4lK5PBXI1qYFIGeG7RApL3/XKWZawCcG9uYenzrVd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772660689; c=relaxed/simple;
	bh=TOXRp74+x+/yWvNgf1Ny0A5lDlWUPBA5uza0wqVRIFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nShttqEn55wVnVF4bZV0rzo3FgTDR/0kS9YDbvA5Eelprnvnr0sERjXba7sJdwRxhyS6WzFrp58wJtNmiq1Xxb9aoQ2GycgnZ9v1ayWebBK0nkgEzU/KKnIGqCrklyKwRaAbvxhMag7dhhr+Z3lUG02c4Nas6kn7cYEdflzo5cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=GwK0aRrt; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="GwK0aRrt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1772660680;
	bh=TOXRp74+x+/yWvNgf1Ny0A5lDlWUPBA5uza0wqVRIFg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GwK0aRrt+hnxIeZOdZkXS2tL5Qz9PagpWqa5Skwu/akdKmGPq7TX9DBLQMV7Lcmn8
	 5DmWIvBu7OEYkY1LEzz6y6qxE2S149k410aJ8MrA7USV1akQYk2yHbwydd4moB9OF2
	 HVktU987am5ET1QQxHblqmwAA3TYrMAg2VZWTM/A=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 04 Mar 2026 22:44:38 +0100
Subject: [PATCH v2 2/4] dmaengine: ioatdma: move sysfs entry definition out
 of header
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260304-sysfs-const-ioat-v2-2-b9b82651219b@weissschuh.net>
References: <20260304-sysfs-const-ioat-v2-0-b9b82651219b@weissschuh.net>
In-Reply-To: <20260304-sysfs-const-ioat-v2-0-b9b82651219b@weissschuh.net>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Jiang <dave.jiang@intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772660679; l=1298;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=TOXRp74+x+/yWvNgf1Ny0A5lDlWUPBA5uza0wqVRIFg=;
 b=CHQCaKvX35Z1k3FgBg5VqYQx1Nq71cCbr9dqaCsJPOPIZ+KSte+vT1Hf6YqOTmyz6hbsfpWov
 yjMS/3BhRrRDVkYem1GF/PQJORHWblD5ummZwS3jctLOI8U0BkIcyR5
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Move struct ioat_sysfs_entry into sysfs.c because it is only used in it.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/dma/ioat/dma.h   | 6 ------
 drivers/dma/ioat/sysfs.c | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/ioat/dma.h b/drivers/dma/ioat/dma.h
index 27d2b411853f..e187f3a7e968 100644
--- a/drivers/dma/ioat/dma.h
+++ b/drivers/dma/ioat/dma.h
@@ -140,12 +140,6 @@ struct ioatdma_chan {
 	int prev_intr_coalesce;
 };
 
-struct ioat_sysfs_entry {
-	struct attribute attr;
-	ssize_t (*show)(struct dma_chan *, char *);
-	ssize_t (*store)(struct dma_chan *, const char *, size_t);
-};
-
 /**
  * struct ioat_sed_ent - wrapper around super extended hardware descriptor
  * @hw: hardware SED
diff --git a/drivers/dma/ioat/sysfs.c b/drivers/dma/ioat/sysfs.c
index 5da9b0a7b2bb..709d672bae51 100644
--- a/drivers/dma/ioat/sysfs.c
+++ b/drivers/dma/ioat/sysfs.c
@@ -14,6 +14,12 @@
 
 #include "../dmaengine.h"
 
+struct ioat_sysfs_entry {
+	struct attribute attr;
+	ssize_t (*show)(struct dma_chan *, char *);
+	ssize_t (*store)(struct dma_chan *, const char *, size_t);
+};
+
 static ssize_t cap_show(struct dma_chan *c, char *page)
 {
 	struct dma_device *dma = c->device;

-- 
2.53.0

