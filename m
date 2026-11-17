Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794934359;
	b=DBhRYYtDRqYYO8tGHocTl6dHR0agKUSe0czHNVq1UXxjIv+lpVJ17cz0gnTzArLAUQGB
	 S1gNPFtM9ocdwT6Bq2SFag/d7Dm2Eyf+lA5IR+ScoA7Tqgz/6Z3WqG4OzbrSMhCaaY3kv
	 zREUhMdZ68P/k8ru3JcNd5mbtttH/dYp7oXGafuVByKQTfmuM++iOEsB2oOn1REiY8U3G
	 +28gNu6y8M9oQpbsOVRLnenI9sGfCsEKrlV4kKVI8DTQL7ExkyOv9yPKSyd6HE9Ux9A8A
	 pyLXl/gHkz5AtAAC+Nvg9HD6PbhywTo6OxxSTPYrUwjUtneXka65M1Gr1HjrNIDp8Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934359;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:
	 Subject:X-SA-Exim-Version:X-SA-Exim-Scanned;
	bh=GgCZ3j+eV4egDx025sIfQOmfGJSULDhxM6moOGve6SQ=;
	b=t22bgIkHv4DvLYHA7WY1gXS1SHZK1Zhl8baAiSNWpeY7Rqac3oe2dlXIlUvyyoUSJSrY
	 umjtezo3J1jEdEYrgN8h+iolq+a79BkiZJxsZPPZLya0ia1JmPYKAh2BvMsPKxnDpY95p
	 SrURv+Oze+mdvpYUa0Nu6Dbg2az8z/D9xEKqKCIPjx2BjdbUiYsLxoFOTEsjzoZxa1pMF
	 FJlBRQRMjOoLHnpIEvkKrKG9XLBSMos9pZJci91+98KuKqO2AGSflVte9ko0P8xi0Xyu+
	 eR2PPSrgs8sDkn0VCCv8AXNlW8gOs4D16bbCdNe6UmbEKBVzw2sgHanAOAw0QL6I/YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=Q8YdSIFK;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A82360A260F;
	Tue, 17 Nov 2026 16:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A82360A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=Q8YdSIFK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:content-disposition;
	bh=GgCZ3j+eV4egDx025sIfQOmfGJSULDhxM6moOGve6SQ=; b=Q8YdSIFKTsDoH1gxswdeLMRLAw
	shdA9zCHwItqc0LqEgXoiGbFF7CXM0sUz/axY+iDnjREabenlL654uwWnyhDZpxswv5sjsUV5hKpe
	+dnMc9N5fpBay77OTlLEsd++VV/DzIPTxwyb8Pf5Ubjy5MiNHE3gPLCLbTQqInSfTm3keQHTl2AHr
	x+kLyJMF30WCFcATAn0Kx8/GxWuN+Oyg46nSYHq0jrghIvV7KmLUfgxEic+sACt4lGSJrKvC959EA
	gIqoD/HdzYCL4bYg5aCw+Po+CU24DnsfFiUoJyPNpbIBjMc0V8SMsIGV5/cSKsDkPcNpCGjlcqbrG
	OTFvTT2A==;
Received: from donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xTMQ3-00000001R9u-1rxZ;
	Tue, 17 Nov 2026 10:52:32 -0600
Received: from logang by donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xTMPB-0000000388e-2b5h;
	Tue, 17 Nov 2026 10:51:37 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Sashiko <sashiko-bot@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Date: Tue, 17 Nov 2026 10:51:32 -0600
Message-ID: <20261117165135.746241-4-logang@deltatee.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117165135.746241-1-logang@deltatee.com>
References: <20261117165135.746241-1-logang@deltatee.com>
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
Subject: [PATCH v3 3/6] dmaengine: plx_dma: use writel() for the 32-bit PLX_REG_CTRL register
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

