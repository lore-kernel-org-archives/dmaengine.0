Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE020253B58;
	Thu, 24 Sep 2026 08:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238920; cv=none; b=aogpFjCKhEKfBr+lPDmH1tQT11SejFyeiOUy6zo+CWDxpjn39mkCK4n7J5m4n6Dz9Isn4ADsLiSKpxKF08QwUgTd80YeKfp59EKyko/zaHJE/JcyrTE4Bymk6HB8Pgv76e1O69AdrZZz9JRVO/ExqedfAXnqPVmqBjR3Ks2YSnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238920; c=relaxed/simple;
	bh=8RGtbZ0xG5upIHpS3YgEItHjDa6d2pB7po4AAIGReqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YIKnusN48W1dia0slj+8DiuKKUZyPnwRctVpgag1BoNydzHnNVhNqIdK244dpHQ/WH7n7PLm894Awr8KLJgnrQn6iZBTNxR2TGg8v7pxVgNXMUX3T7Xqk41cTMCKfkGWrdOsb8gTD+UiaPthHitOozxS28pLuFxIWUerM7SoI8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j3ARXIsm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j3ARXIsm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100A61F00893;
	Thu, 24 Sep 2026 08:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790238919;
	bh=VVyLVOKGDjPy6u3ZdT92MM0ODZ0X9BOS+Z+wPjGxHd4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=j3ARXIsm6APB5khiGNU0FGyu8EsBFeS44qw3HwLpCTh66V+BvSFcTyBMEWLODwX9j
	 MlVpyT5QHwTH8oKOvlXgoZQngvdas/QnxvI5v7j/cOduKswQhJ+d9nvL8D8Q/YAFws
	 hpXFmKGyctQLHo/Y8ImZA7YtDuZaG1H3l9V+dZIj/0RsxC8JxqJUC6dq0giUPEl64Y
	 mQSLQuTn0YfmneqOxxwWGfvaDjXpljSGaxnlCVRRDozj7md1FM7ZVF4kvqmm+M9VEB
	 Xul33BAAIvydahOs694ziPqDcx9otEnnKwMM6jAAwNdk85Scw2FA8mbkdjvnoY23/O
	 a99DofbcEtfkw==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 24 Sep 2026 10:35:13 +0200
Subject: [PATCH v6 01/23] dmaengine: ste_dma40: Fix physical cyclic
 capability
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-dma40-fixes-v6-1-fdb6755020a2@kernel.org>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
In-Reply-To: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.3

d40_dmaengine_init() configures dma_both for physical channels that can
handle both slave and memcpy transfers. Physical DMA40 channel setup has
supported cyclic LLIs since cyclic transfer support was added, but the
DMA_CYCLIC capability is set on dma_slave a second time instead of
dma_both.

Set DMA_CYCLIC on dma_both so d40_ops_init() installs
device_prep_dma_cyclic and physical channels advertise cyclic support.

Fixes: 0c842b551063 ("dma40: cyclic xfer support")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 0d9ffa3e2663..e4d689c9eba8 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -2897,7 +2897,7 @@ static int __init d40_dmaengine_init(struct d40_base *base,
 	dma_cap_zero(base->dma_both.cap_mask);
 	dma_cap_set(DMA_SLAVE, base->dma_both.cap_mask);
 	dma_cap_set(DMA_MEMCPY, base->dma_both.cap_mask);
-	dma_cap_set(DMA_CYCLIC, base->dma_slave.cap_mask);
+	dma_cap_set(DMA_CYCLIC, base->dma_both.cap_mask);
 
 	d40_ops_init(base, &base->dma_both);
 	err = dmaenginem_async_device_register(&base->dma_both);

-- 
2.55.0

