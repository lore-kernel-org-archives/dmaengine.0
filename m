Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721154;
	b=3MUcN7Xg4jPacnoUmYzvBEJ+VFTC14v7c95cTICj12X0Ijz6ac/f6de+0tSXqHP3M4oq
	 xjyhxjO5d+QlP+MTm5PM4xfTzbTE1vd/QgaMo1EspLLx0DSB4lX54HohlHhjO/9kGf5ln
	 akaO+zyoWEaw42i8Xnp8Da46fiKxVBFZhUJzrDSpL9dSTVy0C0uAxr26wWI5H1gZZ9zgy
	 EvkifgJ+csR0/tDhMGxbD8VaOKYAstKzxBsAUtIQeAGxETPq1sw5IR3wbb588WtSv9ZeQ
	 bzafk4Ccoo5RI8rMuYMjBqe5eWGVMq9jxECdDcDEyCKGmu4u2pQwqHmlGDjDMfZ8S7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721154;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:
	 Subject:X-SA-Exim-Version:X-SA-Exim-Scanned;
	bh=ctyH8FOq16zHndvDY/4crvhDQmsoz137RlvahGDZjjQ=;
	b=dJOi7NUXLoRC9I/5d6D92Jic67HoXByu8rSx0rSii0qPqyu/M/QoM7w8kYM/NNgQHrE3
	 ZIC+5NFbfQ9IbeN5Ipk7dsMHGHd6knrfX1VUkevpoTcP2bqtFkXgNTnijqZbNZAXx1/3/
	 mcJYjAIAtnwNI/X40Ww6g1w+HGW712LLmaEiagN7IL2ngsRG+vP2Q/61e7cwByqtz7WH6
	 SaUMynI6sLE3PvzLjbvmYfYsv2cpEAogb/TcmHNc4DVsGZkNXRqmnncVUTWNm/3jjepBx
	 HOS3IBD51werCP/mstN8xNItnn2lsvg/OGMPBvjHhYmBbwk/jxp3e7rj1ZjU3doddBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=pgDJnA2m;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C41606D836;
	Tue,  3 Nov 2026 15:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8C41606D836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=pgDJnA2m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:content-disposition;
	bh=ctyH8FOq16zHndvDY/4crvhDQmsoz137RlvahGDZjjQ=; b=pgDJnA2mkoE3YN6w52c0Hdgj3q
	UXETP/yDwTTq3/fZrjE1DW9R/icgkpr126W54ujNtXqhw07ZKwO74jY/HozoWo+PAQiHcO/Ea3xOE
	AlJJWMVckubWNOodja+WWwNSyhL6zcNIfj3zzDLzKWPOXUk+MN7GQMayj/Tt7D9b6HEFlI3aF+hAP
	EKvOcZcna5QLvCxY3zh0z2IeF/varufUmPEV6veO1kpPRPtTmtaHQJkp+UK6w11orofKq9M44GMoh
	64Zi+ctcmQu2XLyCi3g+yGke/C0irYJNGIM788hmnT9JBFy39iXBrQkhwA50x2kcZoXYZN0IZ4qIu
	w6MuWuCQ==;
Received: from donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xOGoK-000000091Rz-04Si;
	Tue, 03 Nov 2026 09:52:32 -0600
Received: from logang by donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xOGns-00000001w7l-44Q0;
	Tue, 03 Nov 2026 09:52:04 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Sashiko <sashiko-bot@kernel.org>
Date: Tue,  3 Nov 2026 09:52:01 -0600
Message-ID: <20261103155202.461725-7-logang@deltatee.com>
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
Subject: [PATCH 6/6] dmaengine: plx_dma: don't invoke client callbacks with ring_lock held
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

plx_dma_process_desc() and plx_dma_abort_desc() invoke the client's
completion callback with ring_lock held. A callback that submits a new
transfer, which is common, deadlocks taking the same lock in
plx_dma_prep_memcpy().

Copy and clear the callback and advance tail under the lock, then drop
the lock to invoke it.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/dmaengine/20260717223217.B6FBF1F000E9@smtp.kernel.org
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/dma/plx_dma.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
index 8c4b19d681ad..17745f7a5658 100644
--- a/drivers/dma/plx_dma.c
+++ b/drivers/dma/plx_dma.c
@@ -134,6 +134,7 @@ static struct plx_dma_desc *plx_dma_get_desc(struct plx_dma_dev *plxdev, int i)
 
 static void plx_dma_process_desc(struct plx_dma_dev *plxdev)
 {
+	struct dmaengine_desc_callback cb;
 	struct dmaengine_result res;
 	struct plx_dma_desc *desc;
 	u32 flags;
@@ -165,11 +166,14 @@ static void plx_dma_process_desc(struct plx_dma_dev *plxdev)
 
 		dma_cookie_complete(&desc->txd);
 		dma_descriptor_unmap(&desc->txd);
-		dmaengine_desc_get_callback_invoke(&desc->txd, &res);
+		dmaengine_desc_get_callback(&desc->txd, &cb);
 		desc->txd.callback = NULL;
 		desc->txd.callback_result = NULL;
-
 		plxdev->tail++;
+
+		spin_unlock_bh(&plxdev->ring_lock);
+		dmaengine_desc_callback_invoke(&cb, &res);
+		spin_lock_bh(&plxdev->ring_lock);
 	}
 
 	spin_unlock_bh(&plxdev->ring_lock);
@@ -177,6 +181,7 @@ static void plx_dma_process_desc(struct plx_dma_dev *plxdev)
 
 static void plx_dma_abort_desc(struct plx_dma_dev *plxdev)
 {
+	struct dmaengine_desc_callback cb;
 	struct dmaengine_result res;
 	struct plx_dma_desc *desc;
 
@@ -192,11 +197,14 @@ static void plx_dma_abort_desc(struct plx_dma_dev *plxdev)
 
 		dma_cookie_complete(&desc->txd);
 		dma_descriptor_unmap(&desc->txd);
-		dmaengine_desc_get_callback_invoke(&desc->txd, &res);
+		dmaengine_desc_get_callback(&desc->txd, &cb);
 		desc->txd.callback = NULL;
 		desc->txd.callback_result = NULL;
-
 		plxdev->tail++;
+
+		spin_unlock_bh(&plxdev->ring_lock);
+		dmaengine_desc_callback_invoke(&cb, &res);
+		spin_lock_bh(&plxdev->ring_lock);
 	}
 
 	spin_unlock_bh(&plxdev->ring_lock);
-- 
2.47.3

