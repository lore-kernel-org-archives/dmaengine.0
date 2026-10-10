Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF044A6893
	for <dmaengine@vger.kernel.org>; Sat, 10 Oct 2026 12:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791636324; cv=none; b=L5pgI1FF1krb7Ir+DHh9eMM0M8vO15lOzA3546pSoGjdzjAddMdx3tSKvqlXO7nV8o1olNbpXJz7VUlCL12uzhVWyAhEWCSwAwtjFjuTS/8u3DKmmbWKBjZ5Kor2gsJVenUZh3Pe4Zgkmaf0Bz2p00Gws6fl8DI/mvtRPAoG4II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791636324; c=relaxed/simple;
	bh=UsZ0My6s5AlQ7dilhEK7BZa8cXz5+HJ8MXm7ezNYArA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ioiflNYJZ2u2Twx8eLa1PDopC0GTPMqk8Tl0xXofpfLNr935Ie8IfEouHgU2Jk3ZpA8rUgBM4N1r3ZYzGv+BYsS9RkE58L6+5PxDNcQ0XqpEfLb55Q926HYdZFk6NAUF1ZQW9o+Kxg/Lir/55i5Ay9L9FfZ4EGI0ikduXNc6bPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=O+QhaLve; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="O+QhaLve"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Vk9y1DglIk74GIZcnLMECuerrqShhYBWN4PLVLQPyLQ=; b=O+QhaL
	velQWcRTXoBb0LailcQIQe+09QqQc+JGLDomyQOR+aD02d5lbJeorL3zx2Ial9qb
	1IJUrUfNJ+yQhFHk9LZjurMdFZLq5ImXQFf0/ArfG8xXWbDSGU4TbTVNeCVHALF8
	CPEe63rWq20yCn2Nf11l2aitCk7qRcJQyM3sJ6HSJ4RdTqaQ75ca+fYbu0wmU93/
	7D9bty1kg84edxYgQqF0IpwVGtfBN4lBhIteZVjazf7l/g3NlGRUiAZzCeKeAQUS
	a7qmdf2yKSBo6R2euj5S63CFfAAv8nFoJ5m4EwFNCIlXJH7kLTRxHPbDaTQsyaJw
	YzpNv/wpGSU77Vog==
Received: (qmail 1548815 invoked from network); 10 Oct 2026 14:45:11 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Oct 2026 14:45:11 +0200
X-UD-Smtp-Session: l3s3148p1@0vXl1XtdeoHV64Vz
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: dmaengine@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH 3/8] dmaengine: idxd: unmap descriptor before completing cookie
Date: Sat, 10 Oct 2026 14:43:41 +0200
Message-ID: <20261010124348.19055-4-wsa+renesas@sang-engineering.com>
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
 drivers/dma/idxd/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/idxd/dma.c b/drivers/dma/idxd/dma.c
index 9937b671f637..c3c0db9bdeb3 100644
--- a/drivers/dma/idxd/dma.c
+++ b/drivers/dma/idxd/dma.c
@@ -45,8 +45,8 @@ void idxd_dma_complete_txd(struct idxd_desc *desc,
 
 	tx = &desc->txd;
 	if (complete && tx->cookie) {
-		dma_cookie_complete(tx);
 		dma_descriptor_unmap(tx);
+		dma_cookie_complete(tx);
 		dmaengine_desc_get_callback_invoke(tx, &res);
 		tx->callback = NULL;
 		tx->callback_result = NULL;
-- 
2.53.0

