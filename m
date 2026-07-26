Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C44D1F942;
	Sun, 26 Jul 2026 10:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785061477; cv=none; b=AMdhDcl/Qz0J6loXbqukOQeDcueMLM6fNZu53RGQp6JHLzH8JNQLgoeeMtiLAVRgv7c0smgmn4KMWkzL0ic5U7FjbWNCKUVn+dTwzjpTcMUb0Svm97IJBmeFRJ5h8q31Dc8cl72eMtjEh+c0qagnlHt1Xqa+T8/D+YtQIYiOZyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785061477; c=relaxed/simple;
	bh=Crxxw4/GSwCNyTq34E01tsviTw0QDNlGzau3632Qfjg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dxFmO6J+8Hl8ynvKzga0rhiOEK7djcB7Yktkzmp0um+dHg5RZGMmjyUjzBuD5jT/ViAGc5W9Gqu75Ms3hPxGIlgs3/drGg09yZW1zx8uxR+L+/0wXc2L60mQ0PPbnnnCWHN34u0+lfFt9uNh2j/AFngkKyMymJFzesF8qOnnbwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GJdhuH47; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GJdhuH47"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35F731F000E9;
	Sun, 26 Jul 2026 10:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785061476;
	bh=w7ezX4C/wGAqydZ3rjVOYg1UaOyU792jCLsACA+4PUc=;
	h=From:To:Cc:Subject:Date;
	b=GJdhuH4777ig2dUVqgkkTaSZmAquwy6SyvZlDbTvX5ZDSi87gQM0tEivm+/GYbBqf
	 OlzgptwuvyFwbfwbQqielJKoGbpsVCcn4RS9BLbIB+opHZPgSMRynnN4+PFTM/fRE7
	 PHKm3dSdgfimer4DhxzQANVAnHcFeH+41q1RA1hrk85X/zByYXCsFIHfjEnRd94tg4
	 mJT8dAcGrw24+LE8Ue9lPRYnIJaXzC6lDK6MQ1WFGOUqOOUAJKt2SXBmjVFVxfaMND
	 gnHvRbFCOlV7zJOYyZjAcGkDIMxqwfbWk2qsaEYlUKdTSz5jXHH2/ACxu4ZD4jnSTG
	 nd48MB4VXr+/Q==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	dmaengine@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dmaengine: imx-sdma: Remove unused imx_dma_is_ipu() inline function
Date: Sun, 26 Jul 2026 13:24:24 +0300
Message-ID: <20260726102424.547951-1-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The last user of the inline helper function imx_dma_is_ipu() was removed
by commit bfac19e239a7 ("fbdev: mx3fb: Remove the driver") a few years
ago, and this helper also can be safely removed.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 include/linux/dma/imx-dma.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/linux/dma/imx-dma.h b/include/linux/dma/imx-dma.h
index 76a8de9ae151..16e491f63883 100644
--- a/include/linux/dma/imx-dma.h
+++ b/include/linux/dma/imx-dma.h
@@ -57,11 +57,6 @@ struct imx_dma_data {
 	int priority;
 };
 
-static inline int imx_dma_is_ipu(struct dma_chan *chan)
-{
-	return !strcmp(dev_name(chan->device->dev), "ipu-core");
-}
-
 static inline int imx_dma_is_general_purpose(struct dma_chan *chan)
 {
 	return !strcmp(chan->device->dev->driver->name, "imx-sdma") ||
-- 
2.51.0

