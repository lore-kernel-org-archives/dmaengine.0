Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B262E7BAC;
	Sat, 23 Aug 2025 15:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755964672; cv=none; b=Gfd1Cs2LwMPUXTclfBkWwsiAFVvMG1q7esIiwIYvWrM7xJ0jjl9L4xy/zo1SmR7wfEp7+r5PAbD0rN6VsqiLUhxdUfP+Na9FacwR8u1lIx+3s9iEx1IMJRGomf6oFLn9AS/YwQQkfEbnUmJC+941ss/Y/Yp9/0oA6wuvUJWNu68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755964672; c=relaxed/simple;
	bh=9tnT3V8EMcpHOzCuSJMK/RG61d+XRxnJ3mZs8oaJHDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eCOBSY+Z+DFsXySkB/TfsWVOebpqrs1OGrtQ1kr65gdevavB4fg9ybshUgYzVLLca53hSO1IBr+lirusVijbSd5UmUmoqKXO61Fz/q2d7l0HzWMorqiu3h3Nf6EVSABk8k4Qw1oJZFB5ZrnAkarD5nTT+kv4TjBoy61YTWjXk2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rOFxm+c/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rOFxm+c/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BF90C113CF;
	Sat, 23 Aug 2025 15:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755964671;
	bh=9tnT3V8EMcpHOzCuSJMK/RG61d+XRxnJ3mZs8oaJHDE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rOFxm+c/6i/liATaMDBVIBhL8IELGHv+jqCsZrmJCA/HM6ZxX4WbHJpHmk1GGyGVQ
	 Q0PVlJrL8W6rJcZheVVzDIknqphzQk5DxZKT34WKt0D2QeTR1+Rw/1czG7+owmLqUg
	 DT4NtwEr7iVsqHu6KIsk1rPIPAX3I7udvfEUtOx642H2HUYvEeFZm65hgEVoqQUnqI
	 rHBzq3wOrwaQeQ+UH4IGl5sAGS+yabcOVWkiOHod0Cos7+915Q9FaqjWvaz9MwvyK3
	 7+KDRBC8o9Lno72xbpmVR6uCAOA6FSev48qUu3YVQJQBw4P4X+SnRO8Dg+etHyA9hO
	 QbJLXNVP85+qw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/14] dmaengine: dma350: Remove redundant err msg if platform_get_irq() fails
Date: Sat, 23 Aug 2025 23:40:02 +0800
Message-ID: <20250823154009.25992-8-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250823154009.25992-1-jszhang@kernel.org>
References: <20250823154009.25992-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The platform_get_irq() prints an error message if finding the IRQ
fails.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/dma/arm-dma350.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index 36c8bfa67d70..6a6d1c2a3ee6 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -604,8 +604,7 @@ static int d350_probe(struct platform_device *pdev)
 		}
 		dch->irq = platform_get_irq(pdev, i);
 		if (dch->irq < 0)
-			return dev_err_probe(dev, dch->irq,
-					     "Failed to get IRQ for channel %d\n", i);
+			return dch->irq;
 
 		dch->has_wrap = FIELD_GET(CH_CFG_HAS_WRAP, reg);
 		dch->has_trig = FIELD_GET(CH_CFG_HAS_TRIGIN, reg) &
-- 
2.50.0

