Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CFD27732;
	Thu, 20 Aug 2026 13:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231720; cv=none; b=bUvwLKlZsMc71YRASQXuUZWh+X8ZO+sAuHTSchlozMw4gzOtkYPfQBt/Oa2gys9TYeFsTZdRh/NYRj5sTOGR4CQbNqgApzoFh/Cvn8h2FFhfmVzwHqbUwAiR7v8jnpNqnvJAI2EHOf2xq7h+fQhShZuMOjjWjxRmYB52b+mdXjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231720; c=relaxed/simple;
	bh=rhOL1AY4IcmhF8Kae/21cj+fW2dGjChJDZ7vLC3Yw94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LPN8VbiifwTRxPvTK4umXsNxwbzLMmIZr4dUxit+EN1rd6MTvIi55zXP5aiDlg2bgjRaOcAz6O9Geufq7WPsSfp0PKyMFgXEuVw9NCuPgPd0w8fNpftmSfuKXAK43l5eK75mID0d1gwPvFPfuomaMipxISH4FjZwXSYouZ7QpIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dv6foLNV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dv6foLNV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9577D1F00A3D;
	Thu, 20 Aug 2026 13:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787231719;
	bh=H3xR9fM5wwx0FcB/CFTlp7EZZ649OcTISiEB3mg/BoQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Dv6foLNVukqaTB+p0/LysdLzyWW5YHl7CF+cjAOfvW4r4eBU48hR8850phkYyZLyW
	 KtcMk18x4SaIkR/xlbBg+nT2z5c0qmnJrxpv98E5UpHypKbjwgMVgrEopcnD5Z01BA
	 1LhaZK49cTS15U0knx0UOcvTRzH3pmrlpuBkwDOzgiBZS1Y+wbkqQ3cvwA4yBlrnEm
	 rYisL9U4nbN2CNn85I5DvbXFS0GdP2W6kyAkHq0yZKih1g3Men9CEd9UsonNOEX+/e
	 sJUK7VuhvGvZBbCQwG2VWl+B2NhGBL91ls7QwbcKYRJIYY4ss/lsmWt85HAVlUKSrE
	 YfQbQFYW2D7xA==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 20 Aug 2026 15:15:07 +0200
Subject: [PATCH v2 13/13] dmaengine: Use unique debugfs names
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-dma40-fixes-v2-13-63238334c707@kernel.org>
References: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
In-Reply-To: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

DMA40 registers multiple dma_device instances for the same platform
device. The DMAengine debugfs code uses dev_name(dma_dev->dev) as the
directory name, so the second and third registrations try to create the
same directory and print duplicate-name warnings.

Keep the existing device-name directory for the first registration, but
use a dev_id-suffixed fallback when that name already exists.

Signed-off-by: Linus Walleij <linusw@kernel.org>
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

-- 
2.55.0

