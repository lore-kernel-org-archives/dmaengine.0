Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A88D335562
	for <dmaengine@vger.kernel.org>; Thu, 11 Jun 2026 03:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781150000; cv=none; b=E0iDG0UzbNgiLlYYBgz4krasKxrTEx/n0Vj78we3xhoWC92evogQOsY0cbhGzrN9MBEIk9S8ZRwWNl74ShsBjQnqio0cUWKG7POethgkTW5HIS2EvbH7aTtKloO5RXFPfUUJi804QLGcXJg5ulWAMl6VmnKoWZP1r97NPLD6nbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781150000; c=relaxed/simple;
	bh=lyTXMgabiZFV1r5MchNd6Qy8eKJqo3LxCHLLSTQ8EzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=st77fKdAqY8Xgo5Wk+KuB6Rq8EixfsRYSOOorSGmE7AGO47aXBPlFMWonrYLzzAeLqEwaYE+dT66lLQPG9HQKHlG77OlUfmlHiRCfcc6UzSUMWBqcyI2hFJy7vUrcYWlp9sHbYXZpYrmdB/Bj9TUy9Rvhsg8xPaBweDJX9p/Cgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jVvaEUrT; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVvaEUrT"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36d630c0e35so7976756a91.3
        for <dmaengine@vger.kernel.org>; Wed, 10 Jun 2026 20:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781149991; x=1781754791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Axf2i08FEMNQcDQLuzX7KUZnp7l0NF95o4nFAH7q5yc=;
        b=jVvaEUrTKFzbDua+hHIl5BIeZqwDCBr47Xu0QKig5P35vB3jwKG9D1HKUTaqCFRg57
         t9xP+DBlfFFJ7yo3PXwPyXGygtYZ5idjxOPaiDGWPIQ1WGLrb82gCl//mlFW1nsYguLm
         8I3K/7N0Uytim3xotB3DH75knqrf/ORzdJv0tn9yn2DsNF9A8Gt6Lm9suQQkipYrkw49
         +V+YWYY6hQuscxPOpR6yKDIWOJNKcF4z8XWUnKHCJi7e8X2+Az63/qXuuuebVvzggaoW
         /B9TP52fSG6n6bSJXTRiMyuHeLBg+1mcCZBmxjWx7wDNgQRvQIURaRJC0jX/R/uofB7D
         2E9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781149991; x=1781754791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Axf2i08FEMNQcDQLuzX7KUZnp7l0NF95o4nFAH7q5yc=;
        b=lEgs53BkKyzbA7YUhLQP2riionFmyjcnOYu4I3hy0iHz6ACOHdV/BjCkoGiUkPM6/g
         jQ1t+Z8B+mxqlQ8RVPZmRJvBslPtMeYhlF8IsVTtGvVB46zs2STsUFrTJi1bRy8TUakN
         MlyA8A0ffgbulWi7QoaAzZYlu2BEIaXtfC9tROmkadJIyJglWsDIogRdSsXmZkq1yYgb
         bPjkb7hkWmo1B16lBA8rYrIqaQCEVAr9b9qwnYFILqRsMqe7lCVGEE+uyq/FlxyEQqkR
         SS2Xb6ixgVVzrswIwbHcZyk0ePDXi7ZiBVdOtmpBgWFNyW0pRt1Io0sHu0NNkHePX/AE
         UesA==
X-Gm-Message-State: AOJu0YwNRI5R91r4QHLKLBFDmEs/M6uwIFyWO8Sb59+vWR8NKbmV/Ql2
	fz4DA30F7RCewk01PC8e4LymFzuvC38JKsVILwFByB8HgxUXhewkoTImotABOQ==
X-Gm-Gg: Acq92OGOvn0cgJkFnt9ht0xlsVQlSypxqF5Owv6Xs/Metn/xl+aMYicwp+q5PkqjPIB
	kAT2GnnEr46BvVdSWVJUgy0Xap0H3RWjFxyGwM6u/frfCOsuvCg89lV8tTx+QJ4R0y2QNg+owKl
	rA7zdjJuo97du9EQmJ+lYGkcmGS95mAvAQS2HFOVOmA9tiVZpTt1pSZ/4PkPzOZkMiHb1ATEzx9
	eQilMRB/U9KQxKLTYFDddWzFLaRbCQWDjNZv5hHFprrvDZkv4zo+DHhTqixwRHc8/5Z6uygjROz
	yNljJCE3mB5bqakATtmAWUmNYcNwt5OcGVa6rh63+80sx+9rN1qYCya3Y7/U2ZEQU1zrUFLDxD7
	mv6mRr5pwU/KJFatAhAg11EbFJ4WSjXCMQfx46fdz4jUFVEZ4yCEQI0tKR0Mt17yW0cvv1B9Gol
	Smirqqrdl6otIsOwmlfP79kAmSJDB/tQc4eNXjqJ4xzZs4VlOemtIIy14zXelv8kldoo4DU70hw
	7qZyBaWy1oijqJosIyYptefLvm4OZGc6iOVsqYzkfkGTw==
X-Received: by 2002:a17:90b:2dc8:b0:366:10f1:3d86 with SMTP id 98e67ed59e1d1-377aa799f69mr1529495a91.22.1781149991227;
        Wed, 10 Jun 2026 20:53:11 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-377522a188asm910131a91.3.2026.06.10.20.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:53:10 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Zhang Wei <zw@zh-kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE DMA DRIVER),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv4 05/15] dmaengine: fsldma: check dma_async_device_register() return value
Date: Wed, 10 Jun 2026 20:52:35 -0700
Message-ID: <20260611035245.13439-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611035245.13439-1-rosenp@gmail.com>
References: <20260611035245.13439-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check the return value of dma_async_device_register() in the probe
path and propagate errors instead of silently returning success.
Previously, a registration failure would cause a NULL pointer
dereference in list_del_rcu() during remove when
dma_async_device_unregister() tried to remove the device's
global_node from a list it was never added to.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 43d817f6ded1..3009e1531292 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1303,7 +1303,11 @@ static int fsldma_of_probe(struct platform_device *op)
 		goto out_free_fdev;
 	}
 
-	dma_async_device_register(&fdev->common);
+	err = dma_async_device_register(&fdev->common);
+	if (err) {
+		dev_err(fdev->dev, "unable to register DMA device\n");
+		goto out_free_fdev;
+	}
 	return 0;
 
 out_free_fdev:
-- 
2.54.0

