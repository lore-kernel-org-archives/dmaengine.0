Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E492D3CAE7F;
	Sun, 27 Sep 2026 09:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499806; cv=none; b=VXxnZnkrpB1SWkbLuB0ohuXqsTiJg/GWG/dv3Kp4L44kY2s78Gc7OKyb/MUVeIHVkiNOMZxCJwy3k69McDq9t6j5chJVgwG51mQfTAJs77bs/1roGF1Is96OGPdQGpupOUirOlVce6CGcMxZ6HcYlax0VmkSpbNL36+N0YCnlUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499806; c=relaxed/simple;
	bh=8RGtbZ0xG5upIHpS3YgEItHjDa6d2pB7po4AAIGReqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A+PlWHWzsAYClZLtpdKzK2qVXicyFl+w1FJxHaHB9K4dVoXnkxzs63AGGO4DAUuXRmKY4SxyYCBw1VL/85oTR46+ap4MJhcmu4YyGbQSckTEd+vjgJLNK+BAjnFKrZOKvxey8D1zYn0jj0cUSRRN3tAaueVncrBt3riiY3P0B3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QxVqFY7K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QxVqFY7K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 151861F000FF;
	Sun, 27 Sep 2026 09:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790499804;
	bh=VVyLVOKGDjPy6u3ZdT92MM0ODZ0X9BOS+Z+wPjGxHd4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QxVqFY7K/Cvs7/djNa7uKrphNKJNGgpXKQJmqHjubvRXOlFZIrqrNkcOpvbiCjwdg
	 eRPpjmsfQTu0suutsO2M4b310FHG8FuyBk3bQ+Z7GUcBiXryVoRDZ+WD8o2Kcnyd1w
	 lX1i+W1Umew25Qj42Rk4aSb2i7It/L6iwkyc8hCueJjrziag64fRUKgk3ECyZfQOTM
	 veyDE7rwjfHbqJKS0+pBmlB3UYmc1lHKsi/ZthcMNJuwtYtAhxiycE2C1qmiRo0uxa
	 Vb3ktr9GBWmpaGmGasH1qrlyNhoLc7M811vVIMTr4zyGT8WU7qWxhBqqnB+SFQy1VW
	 MdyQJKgMn3jbw==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 27 Sep 2026 11:03:14 +0200
Subject: [PATCH v7 01/24] dmaengine: ste_dma40: Fix physical cyclic
 capability
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-dma40-fixes-v7-1-89f595e8851d@kernel.org>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
In-Reply-To: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
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

