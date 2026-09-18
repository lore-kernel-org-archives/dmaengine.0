Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF594FD79C;
	Fri, 18 Sep 2026 16:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748672; cv=none; b=VOYLLQKNvoZz0GniTYekYn5NtLOxnPcW2Wysmk4lPB/xFzIqJOxlcFvwl/PtWhBdeqJCdYODm2YpEzFnbsYXowh8AgGwtDbUiI2ZsmjlnMSm84OFPA3vE+z7H38C3x733ZOD0KO86XWKlEtQc8T0HyyB611P5TEwPs6NZ0RubPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748672; c=relaxed/simple;
	bh=6Ew79j6hMvJCjmqap1EEUitXbIbL7CxWBT0atyFYuBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N8Zzlk7jspMAdHKD9EIThINVIYv/QT1zZglruW1dHyQGaULxK115JRBWPf/JLU9em+UNsSoYLOIw9YLU4OlAr5AVmSWfHZOoTn4/QYlNvdMkfvRJavc56d99DR9/b2b2hgGGal1a3R4VH14qKXeGBZzkgdzgdvunHdQulJQG/gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KpxNmfjQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KpxNmfjQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB941F000FF;
	Fri, 18 Sep 2026 16:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748670;
	bh=/09QadBHomxpcxK74miqEkVw76R4Y2u+0IXs891ae5Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KpxNmfjQsGnh0zays9O5ZI0uYKsUhz6a+lnjlsAQhe4fguzxU6CKsx3NKFxKXOL3G
	 XXrkekThGh11NY4kknNVyw24p1PjVEUCz8WMrFzCacxBl8MB9n8F5RU/1ZvkZU1yCp
	 weGIC8aCWbif/xU2KjMyXY6biCqNFuKWNR/O5r6NcOZQx/KubYtBG849xLiz0PpZ4c
	 KBczekV7DpsqRM00OPRMQsbwydfE3RvxTmdcITV7OoEjVNpMrlh31ZWJNmYIEr2K0r
	 jhcIZrX4XB2AuecL11kBN4zrwJPhxO+o0uS1xkyu98TAuNmjGxKqVEnB0+io7snsA5
	 wmtMufGjfE93Q==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 18:24:20 +0200
Subject: [PATCH v3 01/22] dmaengine: ste_dma40: Fix physical cyclic
 capability
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-dma40-fixes-v3-1-8dd8450669e8@kernel.org>
References: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
In-Reply-To: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

d40_dmaengine_init() configures dma_both for physical channels that can
handle both slave and memcpy transfers. Physical DMA40 channel setup has
supported cyclic LLIs since cyclic transfer support was added, but the
DMA_CYCLIC capability is set on dma_slave a second time instead of
dma_both.

Set DMA_CYCLIC on dma_both so d40_ops_init() installs
device_prep_dma_cyclic and physical channels advertise cyclic support.

Fixes: 0c842b551063 ("dma40: cyclic xfer support")
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

