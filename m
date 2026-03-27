Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D033E3644A2;
	Fri, 27 Mar 2026 16:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774630672; cv=none; b=cKYwS1/O7jk70N2HeDLJw2wUebWgykuadYPWghJDssyJUINejjhWCLmuycTka7KQt8v8/XCzMO+5uctkwanqdwtQLAqm+ah5kU61PXPHjva9euTK6qN3ivo+XHStRO1dhNZ2B7g0mIeYqxWWduquML5Gvj20t3VhPc+8m2DTD9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774630672; c=relaxed/simple;
	bh=09nJSRlAd6N1UqTYdtf9KSCV6nHMp6BK6/gYyYC5J8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nDcrff3Xw9SygUEwiygmKgf9NLFHxrWRaRbAEaNIGwF+AML3hq7dXPNgCI4dGW2ePmdkQJoH0pAmfrJ0uCf1cg0+KF6DCwXuKzuopEAX3Bk0KZQVTewho4rKAo2Vl2yH+AenqSmgp+qwrN4JSrslboS+k05LMdF3aVxGS+Ydl5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qc8IR/7o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qc8IR/7o"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90485C2BCB0;
	Fri, 27 Mar 2026 16:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774630672;
	bh=09nJSRlAd6N1UqTYdtf9KSCV6nHMp6BK6/gYyYC5J8k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Qc8IR/7ojbMRvTud0Zmou41XjGx1QBfdiQAZv087Gqq8dAd1XP54cnGJ7xaA0P5uW
	 V1BUYs8sVVlmWvtNK6GDIuNlYI6ov6Ht6bxWjgqF/YYLNOL5KxUM5vWzRCf6aNJgPv
	 adtlka7S2dyAA9hCS9vsX4J79ffzMlgrT7Tn/vBQdpUsWqMUfJy5c+YV9X7TJs0XWh
	 RFCcAPRKr63Hl38YRRjjSjWdDRnmCQyDNkS7M1pxZhfYS1Ecs6LAo2E9jNk64015z0
	 QH+2dqb+iUjzsXAO5wh7GEUl6iUSBZ9fVYcjN2KtPPQcycwTw69lr/KTY2AW9yQn8r
	 VJ7iVNxiGncEA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 797C810F285A;
	Fri, 27 Mar 2026 16:57:52 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Fri, 27 Mar 2026 16:58:39 +0000
Subject: [PATCH v2 2/4] dmaengine: dma-axi-dmac: Properly free struct
 axi_dmac_desc
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260327-dma-dmac-handle-vunmap-v2-2-021f95f0e87b@analog.com>
References: <20260327-dma-dmac-handle-vunmap-v2-0-021f95f0e87b@analog.com>
In-Reply-To: <20260327-dma-dmac-handle-vunmap-v2-0-021f95f0e87b@analog.com>
To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774630718; l=889;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=FiW+zvQ0Vg5geNpbllXV8K8Pu2uQGa6K1A0veJRrIZI=;
 b=ZqTnBw5uXCp7pFYSt/5bMscZVq8LUTat+TLk9lcl/HYXupAduoZ+/etCrHJx2iu/Lrrppym8+
 XVRcBW4z8eGC+jBms4+uT94JNNhP/WrH/N4bIcVGvwrHSZdfVinVc5E
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sá <nuno.sa@analog.com>

In axi_dmac_prep_peripheral_dma_vec() if we fail after calling
axi_dmac_alloc_desc(), we need to use axi_dmac_free_desc() to fully free
the descriptor.

Fixes: 74609e568670 ("dmaengine: dma-axi-dmac: Implement device_prep_peripheral_dma_vec")
Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/dma/dma-axi-dmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
index 45c2c8e4bc45..127c3cf80a0e 100644
--- a/drivers/dma/dma-axi-dmac.c
+++ b/drivers/dma/dma-axi-dmac.c
@@ -769,7 +769,7 @@ axi_dmac_prep_peripheral_dma_vec(struct dma_chan *c, const struct dma_vec *vecs,
 	for (i = 0; i < nb; i++) {
 		if (!axi_dmac_check_addr(chan, vecs[i].addr) ||
 		    !axi_dmac_check_len(chan, vecs[i].len)) {
-			kfree(desc);
+			axi_dmac_free_desc(desc);
 			return NULL;
 		}
 

-- 
2.53.0


