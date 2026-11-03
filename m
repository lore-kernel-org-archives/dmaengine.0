Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721150;
	b=iuGoZxHcZldnzwX8DQusiGMw0dpSUyKf7Pwa7SX/47Q/h8ttbNCpDI4zzbjhJUucrhdU
	 6vFLmX1t1+zRv8jpgIBEsrd4p+X+GxEVpzpEDkTiB7EB4P5cx6XpbPZ/jpmLE0Ax/Gmjp
	 UZ5JeqPV3rckc6b7l0JcuQtJc+S22o8lR5K90+uRi2ZWfa5MGUt+gf8Ogqzh/f0ZFdPwp
	 NEonsPsChRGCZV77y0WUUHLD0GlL79n2lY8f0HxhA+eq+AtCAm1ixLrksFBKmimwn71SP
	 EI0DakhYmLd9UiJ/UMbSvbg3JSp39tKQ3KOTvOtHfXEmJ8RQocKKyGhJNttvOAT5YOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721150;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:
	 Subject:X-SA-Exim-Version:X-SA-Exim-Scanned;
	bh=8OXzvXjn1l2lkm59C2SlrOnJXqhy34/J01Ztg3EgfJ8=;
	b=biPA2ZflsDLRTwqkUB1mYBD0VbqBL1Rq9vIsngrpQUC2ucotycCd0wQa+PW/+kVXfm5n
	 gXt3M17LZJvrJGQLD/seFF21UMqlaIQkHA3zeaQOUYtfxCobxsEeaisvy5FYfG6k25rlG
	 qsQeMbokJLVagZXHUeuFpCZ4mz2RIJT7Fi0miFZthLrAAAxSwGMG9DvJZGwAc0LFE1+d7
	 HgsB7VgElhBCS0QnyV7Zl+63mRTEQhe1KbVcd41xuhCvjVECIbQDztZ8U2ARVC4hMuEgh
	 SpLf8o1iTxxf9L421b9KhA5/TqlF5DJhkZYhMqk4abnKBJLULed1z6pOpAio/cnJpug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=XmgCK9Cj;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CE8606D80D;
	Tue,  3 Nov 2026 15:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44CE8606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=XmgCK9Cj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:content-disposition;
	bh=8OXzvXjn1l2lkm59C2SlrOnJXqhy34/J01Ztg3EgfJ8=; b=XmgCK9CjhqLSybFiCG+S1/slX7
	zdBVOY4r82zfasvWGeg+PnKQt6ItrgMqwJn8RAFV+oplFrLZFOs8I90DScsoSaP3oPaKRnU1IVoAL
	3lk9zY8rXuHDaKFa6rf1K+8ahyrONOl0aSMmM1Nbo0M3ba9pxHipuL9fNmwLpnIJoNv+i9I3pesNG
	5XQ1IrAVYaz9+9eCAONuK1FXg6b5JqZFSU6lkWhi9sRKGO4h9eKxw+BsjpO61jYsv3yIqkqN2lj1A
	4Ke9/BszkOcBiUg9LWCXwA+uq+yxc5S/nN61IxBdZik0ldmjduDSqrvvbpkB0Ayk2+3TFhaps+KYU
	IADBGSug==;
Received: from donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xOGoG-000000091RJ-1Z8a;
	Tue, 03 Nov 2026 09:52:29 -0600
Received: from logang by donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xOGns-00000001w7f-26nT;
	Tue, 03 Nov 2026 09:52:04 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Sashiko <sashiko-bot@kernel.org>
Date: Tue,  3 Nov 2026 09:51:58 -0600
Message-ID: <20261103155202.461725-4-logang@deltatee.com>
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
Subject: [PATCH 3/6] dmaengine: plx_dma: use writel() for the 32-bit PLX_REG_CTRL register
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

plx_dma_issue_pending() writes PLX_REG_CTRL with writew(), but it is a
32-bit register and every other access uses writel()/readl().

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/dmaengine/20260717223217.B6FBF1F000E9@smtp.kernel.org
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/dma/plx_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
index bfccbb0c70e8..1c995f0c4463 100644
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

