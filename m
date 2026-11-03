Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721152;
	b=RFdOrljG1Km1PYDQpJlFQde/zi3fsr0DZbUP0Q7sQ199h9IBLbdxWkt/f85FPfRZ0UW8
	 jSBMMLdD8fGEPranAxPOnJsGbB09CmnUimObQjzSul3Ub/mOQKQ9GCUR4bGD95Qs7onxG
	 dBOWnpd7rH0a2FNrjvT66059FOPyjh8zRlHa64RIB4Zn8wAnPGTUVAaWFttBW+T/Mxx0o
	 ZiZxWmJ/RZHtlXRbzSeDbgWO2k2/IM7ysaSkBUr0DEv7z3H0+w1Kk6acyGDGSE7KUhCSY
	 OsSOnB2QLKnv9MW8/aR/X0dJ3oZQJvJpEnh3Tb+KYt0QeYSbDNocqpDpofgVqElN4eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721152;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:
	 Subject:X-SA-Exim-Version:X-SA-Exim-Scanned;
	bh=joBGjlOwEDm5Kzn5UKgcj2+sDwp9tAEOu9FrwGOhQZE=;
	b=x1ICLpa3NzZO0RlhbQ9dSmcDQS1JmvEuBiPhP85wvvlJFN3up26tAtDZJg1dGmjSVtP1
	 MG/G3n6120VrrA4ryvlQ+4oMxp75fWCztQDmwPI+LCkyA0hl5ASdzBEQLjr8tCyANTVdj
	 tO6sUenJtVt7k/TEr5SPFeXSz5zAbVimMtej5QzLtdqokslOYrDLup8e4rr1CePwbAjJZ
	 TIXfBDehUb1lggaIzF2JFzJslGgZIoPeAOXmdizg9XEb4obotcMUoQFrH6JZrUyTKuIx+
	 wZzBbq5LAg3Kup9RTT5nyVjxsCJT5ximT7ZqUzZD+iPcN4GJmZAJVOSOIX4+St1mGIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=qIWA54vc;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A816D606D81A;
	Tue,  3 Nov 2026 15:52:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A816D606D81A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=qIWA54vc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:content-disposition;
	bh=joBGjlOwEDm5Kzn5UKgcj2+sDwp9tAEOu9FrwGOhQZE=; b=qIWA54vc7sNxTfpUWZK1Tkw2tj
	twPgBw9YnQFgl1xwFOR/nIN7l0IqIp1rVTeIwADzQ4z2Rdhz6186sV6oMNhIoifLCSNvoOYXLxZCp
	pm80hNXOYudeEewesOZGFiBZ/JRYRT2o3EO//ORXGv2VoZjxwHaZ2cu/APQKJqgJmeDuwCoCxZKTJ
	0Xx/xp/eyw4RkKtOn3OBevc11MJKimQBgfaLNFg6SGaNBFdNHpGa8SaasBME5L9Gda1Uc7k0TWIKa
	DlysYrKtZfZbki6QDmhIHn/AU3fqLgmfSZ3iQNVCB8ONMRZUZCbtdKA2V0l9rY6zOQIlrFvldPhiv
	wsCNb82w==;
Received: from donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xOGoH-000000091RW-2CG3;
	Tue, 03 Nov 2026 09:52:30 -0600
Received: from logang by donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xOGns-00000001w7h-2jzy;
	Tue, 03 Nov 2026 09:52:04 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Sashiko <sashiko-bot@kernel.org>
Date: Tue,  3 Nov 2026 09:51:59 -0600
Message-ID: <20261103155202.461725-5-logang@deltatee.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103155202.461725-1-logang@deltatee.com>
References: <20261103155202.461725-1-logang@deltatee.com>
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
Subject: [PATCH 4/6] dmaengine: plx_dma: add dma_rmb() after observing write-back status
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

Add a dma_rmb() after the write-back status check so reads of the
transferred data can't be satisfied before the read that showed the
transfer was complete.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/dmaengine/20260717223217.B6FBF1F000E9@smtp.kernel.org
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/dma/plx_dma.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
index 1c995f0c4463..e4243b66f933 100644
--- a/drivers/dma/plx_dma.c
+++ b/drivers/dma/plx_dma.c
@@ -148,6 +148,12 @@ static void plx_dma_process_desc(struct plx_dma_dev *plxdev)
 		if (flags & PLX_DESC_FLAG_VALID)
 			break;
 
+		/*
+		 * Ensure the write-back status is read before the
+		 * completed transfer's payload.
+		 */
+		dma_rmb();
+
 		res.residue = desc->orig_size - (flags & PLX_DESC_SIZE_MASK);
 
 		if (flags & PLX_DESC_WB_SUCCESS)
-- 
2.47.3

