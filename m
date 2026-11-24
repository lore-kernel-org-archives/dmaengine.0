Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543350;
	b=tkAtISonAE8NEmRkmur/vraBQdUjdUr5ZgrIGZ6UH/lI79KfahYo2w6c+ZHZssZt/GmN
	 2DxkeJHOO8+o8A2ItlfyLZ35njzeH4tGR+RUWvOcS58og6hA9KbXNxRjbGnwWzesIG0Ij
	 SEnN8rTB2Fdgb5CLr620yQbJgKrRGwgGKffsMfXgzZ0lE2f168n8U+PDM8qsdmBKPMfJu
	 TfjY7TaZg8PtcG+HO1YEihV3uwuWZgzUC28QMITzTP+MhdChN/xqifQrrIoF3m7OFF7HH
	 hptwHKaAzRkVxFTw6/5HKjQjITVVlBz6owxFCv6W0fZkw+zxEHc59ACY7F0XVjKIkng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543350;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:
	 Subject:X-SA-Exim-Version:X-SA-Exim-Scanned;
	bh=GgCZ3j+eV4egDx025sIfQOmfGJSULDhxM6moOGve6SQ=;
	b=cn6bVPs/GYlO248rhc90Gtjq0WU0HayzNIjfDbGy/CEWJMCMpQLOPlL1U5R+tHKfX//s
	 nydad7x+N0K8He7b1EbwUJEktn31NV/GaFuk81tJLcypwE9XEO+JrWTCSKOuJDlPM28cn
	 pNRhe8IIsqrxg+jHkK+T0pvMQedLT2FcVTtjj8bp/uulwpOOeaT0BOpb6rBvg8tmX07DX
	 5DET6IUYRDBOcJfXsWibe2SKHg2C2tjYr8K0DYNnclYcEinwLJRsGw0oNL2oLT2cKD0+9
	 o9b18w8bFOUQoshKOKBs/ZTWv0YNZthHPsnh+qnnLkAdUdZQNNN5/arTS1IRJZLF0QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=bYz96Vbp;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BF3606A690;
	Tue, 24 Nov 2026 18:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5BF3606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=bYz96Vbp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:content-disposition;
	bh=GgCZ3j+eV4egDx025sIfQOmfGJSULDhxM6moOGve6SQ=; b=bYz96VbpjTdQQn5AZppt4BIp9Y
	RvFx+hORofGhEONsSFcDxOt6Exm+DqZEHP5QSq+Od1mBumZODX45Ecn+gSfJr+fpWM8ihtjqKNsXA
	670YCfBenHXiMhUExx32wEJV/EslL6PtYDOn8ff19BtucBX8qtPjgxEYYTmx3uZjzaY2vT3SS+i3u
	5CNR0MRN5gkkY84D1OARtiIh6/umyVp7ElL5us/Ue/6gH2owrDkNcGXLj+4KNZ1fyqvxSy549mQla
	NAjB9+bqZ1vIjj/sFX0a/gpk/iFxCA6Kdl5N0dRGcrct6seONy+rsOs0YeLw7XuwHPISm7ps3CjkZ
	eVBqwylw==;
Received: from donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xVuqa-00000000oLB-1ClO;
	Tue, 24 Nov 2026 12:02:29 -0600
Received: from logang by donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xVupk-00000003rv2-16dV;
	Tue, 24 Nov 2026 12:01:36 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Sashiko <sashiko-bot@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Date: Tue, 24 Nov 2026 12:01:29 -0600
Message-ID: <20261124180132.922222-4-logang@deltatee.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124180132.922222-1-logang@deltatee.com>
References: <20261124180132.922222-1-logang@deltatee.com>
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
X-SA-Exim-Rcpt-To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, logang@deltatee.com, vkoul@kernel.org, sashiko-bot@kernel.org, Frank.li@nxp.com, Frank.Li@nxp.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: [PATCH v4 3/6] dmaengine: plx_dma: use writel() for the 32-bit PLX_REG_CTRL register
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

plx_dma_issue_pending() writes PLX_REG_CTRL with writew(), but it is a
32-bit register and every other access uses writel()/readl().

Fixes: 4d3df16840a2 ("dmaengine: plx-dma: Implement descriptor submission")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/dmaengine/20260717223217.B6FBF1F000E9@smtp.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/dma/plx_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
index 5b0e32fec79b..d3b814933989 100644
--- a/drivers/dma/plx_dma.c
+++ b/drivers/dma/plx_dma.c
@@ -351,7 +351,7 @@ static void plx_dma_issue_pending(struct dma_chan *chan)
 	 */
 	wmb();
 
-	writew(PLX_REG_CTRL_START_VAL, plxdev->bar + PLX_REG_CTRL);
+	writel(PLX_REG_CTRL_START_VAL, plxdev->bar + PLX_REG_CTRL);
 
 	rcu_read_unlock();
 }
-- 
2.47.3

