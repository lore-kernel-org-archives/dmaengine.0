Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DDC4A8FD3
	for <dmaengine@vger.kernel.org>; Sat, 10 Oct 2026 12:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791636658; cv=none; b=KbkE4unA96fNJ4jKJLchFutx1H422ylTdt8crm9z+LkAlK1w3qkOBz9L8KgQA/0RZTuyenCi2XIfiiWl/PsyS7d6khy90ArfRmZY3FappusXYo9FwBd8Ub48NPUoLfkT8ZKVlqtMSbb0Y2cAw4iHP4Ov7WE6NEFzDc649S3TWMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791636658; c=relaxed/simple;
	bh=L8eU05k+LkdwweMtEzzbgsPT0mkFYcSIawRvqYOwXp8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V9/VbmfmdENOIiXFbni85l4BkGkRC/zqVmnqz8KZw2KTdem+OUaYEbIffTemww2ykhFsfKMLTGjvboENE6ajEYP2pB7TXw3DHE3N7nTamAV7cxMjamfq3db7PYgjXPBrQ9p41S9CnrZJ3TBrTFFSJX/PZPeI5WzL9uSR5q4dEyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Yvi1tk03; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Yvi1tk03"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=ZR7qimMTHdEovL
	FlS53MOjtO64pw/vgn3nCP44WsBWA=; b=Yvi1tk03M9bs4KM54+ysIMxTQrwPBv
	kXIQ92AeopHjo6x5SpvmdQgkueIi5iWE5z0Q01SjidhX2nQLcfP0DT+fpiP43RX5
	4FxkDYeIDaJU4oIZ4OCyLnm+6WhE8dQkt1RVj3xyzL6pW87OSkdxyZawFHPZXiW3
	uJGqxnhK3gXUrFruFYM1o2Ek9OtpAt3qxY3LH6tWb0qxUNt3Yqybf5HgUVAv9XMg
	5R5TGqpXTAdLzyLIKTz2BxW7Nye1nJgZC/ZvdoUGXgMSDRFSO76IhSOgJwy/yo5E
	RViLyWxiesiAoo/45tn+Q015c8c+T9YBR7teZ8/jDsa2wOuCRznHeXUg==
Received: (qmail 1550070 invoked from network); 10 Oct 2026 14:50:52 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Oct 2026 14:50:52 +0200
X-UD-Smtp-Session: l3s3148p1@KVot6ntdCNzV64Vz
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: dmaengine@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	John Allen <john.allen@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org
Subject: [PATCH] crypto: ccp - unmap descriptor before completing cookie
Date: Sat, 10 Oct 2026 14:50:03 +0200
Message-ID: <20261010125001.19300-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.53.0
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

Build tested only.

 drivers/crypto/ccp/ccp-dmaengine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/ccp/ccp-dmaengine.c b/drivers/crypto/ccp/ccp-dmaengine.c
index b386a7063818..02c6c5fc7db1 100644
--- a/drivers/crypto/ccp/ccp-dmaengine.c
+++ b/drivers/crypto/ccp/ccp-dmaengine.c
@@ -224,8 +224,8 @@ static struct ccp_dma_desc *ccp_handle_active_desc(struct ccp_dma_chan *chan,
 				"%s - tx %d complete, status=%u\n", __func__,
 				desc->tx_desc.cookie, desc->status);
 
-			dma_cookie_complete(tx_desc);
 			dma_descriptor_unmap(tx_desc);
+			dma_cookie_complete(tx_desc);
 		}
 
 		desc = __ccp_next_dma_desc(chan, desc);
-- 
2.53.0

