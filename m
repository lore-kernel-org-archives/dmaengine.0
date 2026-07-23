Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CB03BB135
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 21:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784841464; cv=none; b=hldMDFu/Cx2ESlEbRKHxvigbaBbDugaAAW0tYLJ3UfzdFHOp2uH6aZ5qM0ltJubkSfRnLxn7Gi3ulrWGPtFRN6TTso8n0938flmmS3reRfMzLlGBqA+yDwdRHA14EL9N/E0v5zNXUMCMt2VzcQGVondusctYDEHwOhBaHE1G8tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784841464; c=relaxed/simple;
	bh=18ne+24nCHB6GcOz6VwLCUI3eDOmRksox4TTnxqSSSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bA81u7F+t8a/sZhi9PUK8ZI8rzNTowcLjUBqMkwAPi+W1Q8AhLDGsiWCL/c7H+n9zIw3Ln3AQW3XOhdsfCsgUas4VrO4QcThN8Z0+yp8I5T8O+eL6tyjpiO5rTiDtadK0qgkW25+cwHVTMT83U+86ejlJ71RNv+ZVrN1g3jl3CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Poq+hWHp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Poq+hWHp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAECB1F000E9;
	Thu, 23 Jul 2026 21:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784841463;
	bh=kxCbx5j1yUyk4r1OwKCP0CAqKsBn9aiuFMsH8VEJNC4=;
	h=From:To:Cc:Subject:Date;
	b=Poq+hWHpsRO/IHSUSBJNhOU/q5DwyNxFrekBGKtKJcYRlv3P18veeoBHN72KLuL11
	 F08+weZRy3oHjS/oDQE1gP98vHzVcaVrNw23LMLJpCzjTUWGybUT9vftPXHdYN5DtU
	 b5wh42j8tOrnZbWiUaMl073z0ihXTNFX/XmWDWvygWR1iiruMsyQOJ/RqpKLYExX8m
	 ZtX4b5ExCttV3nip/4P2HOwaRCiXE5EMI5NJL3I8IwUow0GHj7Xu56a2UDidomIJT6
	 46kTCvEeMKYUMjK0rRsXgUR2MwnNzFxS/cferELFG23+zUWaGL9bKeUf0dAqbs7YfR
	 H9dZ2wBP1Lrzg==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org
Subject: [PATCH] dmaengine: pl08x: Create debugfs stats file under device folder
Date: Fri, 24 Jul 2026 00:17:39 +0300
Message-ID: <20260723211739.289699-1-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If parent folder for a debug file is not set, then this file is created
right in top debugfs mountpoint directory, which is undesired. However
for every DMA controller device its dedicated folder below 'dmaengine'
is created by dma_async_device_register(), and this particular folder
is expected to store all device specific debug files.

The new name "stats" is selected as the most popular debugfs file name
found in other DMA controller device drivers, and the macro constant
for file mode is replaced by the octal value.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 drivers/dma/amba-pl08x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
index 5e88fd44812d..543c2eb8cfa8 100644
--- a/drivers/dma/amba-pl08x.c
+++ b/drivers/dma/amba-pl08x.c
@@ -2500,8 +2500,8 @@ DEFINE_SHOW_ATTRIBUTE(pl08x_debugfs);
 static void init_pl08x_debugfs(struct pl08x_driver_data *pl08x)
 {
 	/* Expose a simple debugfs interface to view all clocks */
-	debugfs_create_file(dev_name(&pl08x->adev->dev), S_IFREG | S_IRUGO,
-			    NULL, pl08x, &pl08x_debugfs_fops);
+	debugfs_create_file("stats", 0444, pl08x->memcpy.dbg_dev_root,
+			    pl08x, &pl08x_debugfs_fops);
 }
 
 #else
-- 
2.51.0

