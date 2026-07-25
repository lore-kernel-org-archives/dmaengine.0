Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043122F546D
	for <dmaengine@vger.kernel.org>; Sat, 25 Jul 2026 19:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785008629; cv=none; b=rIz8jcagARJ/Ne+Z4Ys9ZFtP6pVTSZ/hmIEJyFQz+ctjui5w27/tOn+AFUGsT8VeBHxiojA3zFWC9NGHIGTGr1IsnhJzi+xub4HGICoI3RuUwQ/KYkjn68Ju1q2kRvSNIBJCa8oC6Fqy9xqrhy9rfDGmvC8L9lQr4Csy8UXPIHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785008629; c=relaxed/simple;
	bh=+qwrI2xpYruIfMm426+7TsdzhEoc3TunCN7d5QjPkTI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XQhMK4QXDNdOM5HR4KFsmxGA71AIJgIN0GPjJ7idNa10U69ap0+l06vGMzyqJylphCIgPgwZ5/TzBsoKrJ+eJnlSeVu7exSwyAwzpufiP4TQOetyZXf2eGGtVuIVrW6bl1tDE500BBayJseDoihbzsH/jC7bl16sAbN5PlPAgR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FLKiNhIU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FLKiNhIU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 745561F000E9;
	Sat, 25 Jul 2026 19:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785008627;
	bh=KI58gjSe9LjPAnGCmOQgCMyqNY1sP6oWfg6T10xeHC0=;
	h=From:To:Cc:Subject:Date;
	b=FLKiNhIUMon/4onpAOg/PKaPJgTsl6Yi0ZPzmfRswLa2OrtEtnb7VT9FPWNZ7JRil
	 l/rSm7WGWRPB3U3VhUHVXb9dGM9Ok5O1dzg6T41Wdy9cZEIcvuk5QhzVJlDJMnpEme
	 ay9Zb9zkUGlOE1wBinPw6N8wbl1eNNod2d8TOS1YTWODwhzcKdFmNYRYYp3pwEvUlG
	 zrxbNcR/HVtB7phd3lTh9xQrZblCxfP/jJPGWKSu8y2OI6XcV3c8Ycx2vD5j9zwal+
	 3vHr/biY/0r4ug16xvRBspKuUqiMEhMaBF+2kSJZZW2raOl11TcfEJvSqzp6RYrTqX
	 uHOB6los/Ykcg==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org
Subject: [PATCH] dmaengine: pl330: Move device specific debugfs file to its directory
Date: Sat, 25 Jul 2026 22:43:43 +0300
Message-ID: <20260725194343.494973-1-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Under DMA framework every DMA device gets its dedicated directory
dmaengine/$device_name in debugfs to store any supplementary data
accessible from userspace. This change moves a single registered
debugfs file of each PL330 device from debugfs top directory to the
device specific directory, the file is renamed to "stats" to match
the most popular name among all DMA device debugfs files.

The S_IFREG mask is dropped as excessive for debugfs_create_file()
function.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 drivers/dma/pl330.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 25ba84b18704..9736eb24e5ac 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -2952,8 +2952,7 @@ DEFINE_SHOW_ATTRIBUTE(pl330_debugfs);
 
 static inline void init_pl330_debugfs(struct pl330_dmac *pl330)
 {
-	debugfs_create_file(dev_name(pl330->ddma.dev),
-			    S_IFREG | 0444, NULL, pl330,
+	debugfs_create_file("stats", 0444, pl330->ddma.dbg_dev_root, pl330,
 			    &pl330_debugfs_fops);
 }
 #else
-- 
2.51.0

