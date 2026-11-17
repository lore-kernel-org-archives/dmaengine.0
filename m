Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794934354;
	b=2xeZUOoBoLyGFqGiqVu+EzaM3FIACcM7uAPKLnIHgcKX/yAQGAJsWZnNUjZ4VV+lQyQZ
	 b7mzH4WXQGb+ZdJg7LlAeefphsiQ1j6AYQyo1UJ3TbcOm8FD8/IGt8dSxlV7ucw9qDG3C
	 WIJ1uaEuXBKNcx1M3pGf1R7nDJRbuq+mp9qTup3jjtMMxhN00kaaTb421lQhFULjJ3O+/
	 XNtBhrP0V5yR7f49LHJL4T7a2yRPIhDmL7GPu4/GJbNgwG9VFzdIPBg9dxvgBQGddKZna
	 GZ6CbX3uHc8Qrs7dNV8Xzu1YNPIjTwXYC7i+3zTP+8Q5y2fN25EQqYNheQ3HBKg13Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934354;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:
	 Subject:X-SA-Exim-Version:X-SA-Exim-Scanned;
	bh=7dLKSAHChIyhMicgLoF8jO08Si95vun/YXMAQqai4g8=;
	b=hg19nxTkVqxwqrpcFETHc9w0oYKDNrwwCnmo7UOuASqy10H7UvthU79zCpkwT0vvWPc6
	 UItxzHF8uPOIQr/d1JWcPSbL11CIurYXlNFrErQvPu2ZTv0CujTjgtTPZJE65vuM4LN1A
	 ClW0tfMkbrwaPsnIbxD72VPa9BqIT8eKDmOzGlErq+HUIHBeQ5zJrGrthabwLT/qDug4R
	 AhC26Zev/cYt6VBxcKWRNxHzHNVzzCbM/TyF2S/OANmUNbII8oTg1LFq1GARN3v3zLvgD
	 Yo/X3sI6Sg6Iqh4f5mfZzdBQ+Fv2D6nzvB+Hr5RALxUvXZ+wgxXtKb8gl2q/rA+Ljfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b="ekL8tE/J";
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FC5606A31C;
	Tue, 17 Nov 2026 16:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76FC5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=ekL8tE/J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:content-disposition;
	bh=7dLKSAHChIyhMicgLoF8jO08Si95vun/YXMAQqai4g8=; b=ekL8tE/J+A5SZht2GJbE1qkv0w
	jVMvYSRM65IgB9TueHGrORvIEIElHeqwyi+VIFumVq3xBvZvGjEqpId+5PiCphcvUrskWWuetKtid
	oQ/SDqs5V7kgrSl2oOQvUbyK/wpCMgSS62k6fi5BD5iMHoQkidCRtuPuPWSIfNldhYIJoNqzDqfjt
	1ykYuhTLgAbhljZTLViC9BGPaaRjh3BULhlmi7tO3vrhCCW5irEGOEtAICW9Cfk5jUZeQXCTDeq1J
	kCG6vt6tzKTMoDDoyK9LJ18ys13d9KcSRwIIgXRl2jQOFxvI/5K3OGhc3AVjhWw76gt/x1HAPjIIV
	xa74sXNg==;
Received: from donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xTMQ4-00000001RA8-31lH;
	Tue, 17 Nov 2026 10:52:33 -0600
Received: from logang by donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xTMPB-0000000388g-3CaD;
	Tue, 17 Nov 2026 10:51:37 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Sashiko <sashiko-bot@kernel.org>
Date: Tue, 17 Nov 2026 10:51:33 -0600
Message-ID: <20261117165135.746241-5-logang@deltatee.com>
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
X-SA-Exim-Rcpt-To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, Frank.li@nxp.com, logang@deltatee.com, vkoul@kernel.org, sashiko-bot@kernel.org
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: [PATCH v3 4/6] dmaengine: plx_dma: add dma_rmb() after observing write-back status
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

Completing a descriptor involves two loads that must be ordered:

1. Reading desc->hw->flags_and_size and checking that VALID is clear.
2. Reading the destination buffer, which may happen in:
   a. dma_unmap_page() via dmaengine_unmap(), when a bounce buffer
      is in use.
   b. The client's callback, or its processing after polling with
      tx_status().

On a weakly ordered CPU like arm64, nothing forces load 2 to happen
after load 1, even though load 2 is only reached when load 1 says the
transfer is done. The CPU can predict that the VALID check won't
break out of the loop and issue load 2 early. If the device hadn't
finished writing at that moment, load 2 returns stale data, and when
load 1 then confirms the prediction nothing is redone, so the stale
data is used. This is the load-load control dependency case described
in Documentation/memory-barriers.txt.

Add a dma_rmb() after the status check so loads after it can't be
satisfied before the status read.

Fixes: 4d3df16840a2 ("dmaengine: plx-dma: Implement descriptor submission")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/dmaengine/20260717223217.B6FBF1F000E9@smtp.kernel.org
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/dma/plx_dma.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
index d3b814933989..7af29b901bd5 100644
--- a/drivers/dma/plx_dma.c
+++ b/drivers/dma/plx_dma.c
@@ -148,6 +148,13 @@ static void plx_dma_process_desc(struct plx_dma_dev *plxdev)
 		if (flags & PLX_DESC_FLAG_VALID)
 			break;
 
+		/*
+		 * Don't allow any read of the data the device wrote to be
+		 * performed before the status read above shows the
+		 * descriptor is complete.
+		 */
+		dma_rmb();
+
 		res.residue = desc->orig_size - (flags & PLX_DESC_SIZE_MASK);
 
 		if (flags & PLX_DESC_WB_SUCCESS)
-- 
2.47.3

