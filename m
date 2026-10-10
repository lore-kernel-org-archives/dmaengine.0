Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADD34A4EF4
	for <dmaengine@vger.kernel.org>; Sat, 10 Oct 2026 12:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791636324; cv=none; b=WD3beZQl/svcxGn/vzf1SABCqE4zFb/ufcyMT72h26tATe3qRil1ljydzSKQ+Kl0qUi1po9n7l2FNzbD1HTQQWNh2jJTMEQbiq3DOJLjTHnPWZUnSzJ7/zY63ycVbbL+Qs7r1aXc8xw/nG87dLb8VMF2OWBU0oWab0dKQ9dFXuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791636324; c=relaxed/simple;
	bh=uPjr0bMB2E7+AU3y0dyWiX4DuHGErq6/Bb2DMvKeQeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PghaJCxErmSrIr6I/OHR6/sFsEm78ofbB0X6+17PQGgD935Iw/ia5C/G4RmbYhK6ENX1nYsuUVoQgDVYMyh+IcxXrkMohOk6/bqiCBvt0Ges+oMurzprmzIZTygDYHhXgTPn2xuelDkVrl7KSfg8eMR1FsGi8C/ywcY09purVKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=X7e1Fsn1; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="X7e1Fsn1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Y/fsYd3S46y30v83ef8p7Df/GMEBf4R3/dU4JWRQz9E=; b=X7e1Fs
	n1PTYm5BWEsILsD2BhJxA5LSBXunb7CH1/1M69ZKEpPkFZBLZUve7oW63KtbFTk/
	2+ckNbVTDWnPG6NSZ7RKu8U6HCWlWndcu8iJpQqT2jhsfi2kBZFjyS9l5fcNBSKG
	YdfCrAhtFrU9E1/cxDQ2dNg4uuVSuU3jqA5Rc2SX1OAh41e613PuGuQoL3k3vVxl
	7w0+CVFCdsPQ6GmLdoB6HX5B3/NurUPnumRlL8taac1KFAc71DQUwLotl1CtZfn5
	yrGvefwvDjtgBS1Tv1ShRiBtsEIv5SOvAvidlCWxGQ+r/W7ThozzZEB5poLAH3e7
	zr7GAgkpNT5zh4Jg==
Received: (qmail 1548848 invoked from network); 10 Oct 2026 14:45:12 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Oct 2026 14:45:12 +0200
X-UD-Smtp-Session: l3s3148p1@ASz41XtdgoHV64Vz
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: dmaengine@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH 4/8] dmaengine: ioat: unmap descriptor before completing cookie
Date: Sat, 10 Oct 2026 14:43:42 +0200
Message-ID: <20261010124348.19055-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261010124348.19055-1-wsa+renesas@sang-engineering.com>
References: <20261010124348.19055-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To ensure that buffers are flushed, make sure that the descriptor gets
unmapped before completing the cookie.

Link: https://lore.kernel.org/r/20261009093745.539924-1-vkoul@kernel.org
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/dma/ioat/dma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ioat/dma.c b/drivers/dma/ioat/dma.c
index ee93b029f9e3..1b61a7371156 100644
--- a/drivers/dma/ioat/dma.c
+++ b/drivers/dma/ioat/dma.c
@@ -623,8 +623,8 @@ static void __ioat_cleanup(struct ioatdma_chan *ioat_chan, dma_addr_t phys_compl
 
 		tx = &desc->txd;
 		if (tx->cookie) {
-			dma_cookie_complete(tx);
 			dma_descriptor_unmap(tx);
+			dma_cookie_complete(tx);
 			dmaengine_desc_get_callback_invoke(tx, NULL);
 			tx->callback = NULL;
 			tx->callback_result = NULL;
@@ -743,8 +743,8 @@ static void ioat_abort_descs(struct ioatdma_chan *ioat_chan)
 		if (tx->cookie) {
 			struct dmaengine_result res;
 
-			dma_cookie_complete(tx);
 			dma_descriptor_unmap(tx);
+			dma_cookie_complete(tx);
 			res.result = DMA_TRANS_ABORTED;
 			dmaengine_desc_get_callback_invoke(tx, &res);
 			tx->callback = NULL;
@@ -846,8 +846,8 @@ static void ioat_eh(struct ioatdma_chan *ioat_chan)
 	/* cleanup the faulty descriptor since we are continuing */
 	tx = &desc->txd;
 	if (tx->cookie) {
-		dma_cookie_complete(tx);
 		dma_descriptor_unmap(tx);
+		dma_cookie_complete(tx);
 		dmaengine_desc_get_callback_invoke(tx, &res);
 		tx->callback = NULL;
 		tx->callback_result = NULL;
-- 
2.53.0

