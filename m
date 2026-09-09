Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD043C9EE0
	for <dmaengine@vger.kernel.org>; Wed,  9 Sep 2026 23:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788997565; cv=none; b=jDGRw5uf6ZQgVgo33F5Gmx4dA/lclTGoppz+bdTMFyWyVGtBroVQ2rHiv76DHWZAzKYvYPwkehAxFkXEKXwsERY2+/n4G8KeEs61R/2t7e5nF6gJvplhU1i6mQxkLw65oP52UeQVD7QftXc7ktO7y2N4ipIn99Ze90I5zpfQZbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788997565; c=relaxed/simple;
	bh=BbGzXwRH1wQ+dRmcbeHv6DcwhPa24RjD3eePzB+787w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tpjpf2I9Bxyob0L69xgzK/rLAaCcySOjyeZb8SrzWHpSU/fzShphGggy/Q4D4B3o5fNnbuGy5gmXQvaxzxjhdj+j0K7dcY7SxYi72YjFZe5uiJrcFV+fyux9EnLYk5NPOGBFdJuDfTvjWStQk/byLqnWfAZ4+tP+uv3iJvwQYMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8vfz+sH; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8vfz+sH"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db1ca06b03so11216425ad.0
        for <dmaengine@vger.kernel.org>; Wed, 09 Sep 2026 16:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788997564; x=1789602364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PFhEZwtuKG+E5Z9325MZIhX6COOpcwqX8hfk4svZURw=;
        b=J8vfz+sHB6bloP/yi4lruQRqXB9epyp0X5CH5p1hlv9XiMINW5mWjxDoZFPxaJQz/G
         4mlwYRdRNCPD2o711Bc+v00iOM8HIXRtLcF3WLRQDpVefRwwucY5FxDExwJsIcgF5PZx
         0ej6JiXlm0GTE0LYS5PHBT/R3N97nEbPscPynF25ft0vhv+0EXeW9hU+GVTMx9HvF5kH
         /FLLWJZExEblpYyjFi0WhNQNhyVHK87/zBG/Z+wk0LCBtuDljoruHhKD0HCJ/pRX8epY
         EaJ2Ed4bvsPlVsMqsN2ilIhAKDPsZ2420qvcdmst75AVgEhQtCc3fGH2kEwpGzxnuadH
         dkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788997564; x=1789602364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PFhEZwtuKG+E5Z9325MZIhX6COOpcwqX8hfk4svZURw=;
        b=AQydloU6XmwKjoR2LQUOF9HTsrUwLw60MzlPaJpC0oBDXcZ+OEZfXnxYySNxtBobek
         zcA3aEOmH9Ef2MD97ss8rqN56FLYASiIPg39gfkYgS1kuF0elHn0YK/66sNhTr7Cs6se
         1aojXR86qqJGTZl0gg6hG4vimRCwgSyTSDfWwlKdzqN9FHAM1CBVdaXsWtkJN32A8Vap
         l03nyTwNvwxD0Mys/HbNdyAbkNGfRbTRZvkJ3H5d4MbVWBMiJdC4q0b1B3NS9U/JeqCu
         kYQZxOacBm2nHmHAixNWzelQztKznxHp5U2w33MdTN9KuVDbp8j47emQckZx9/OlPix8
         Kgrw==
X-Gm-Message-State: AFuF++k/RHv1CKrrSQgOMPTF51cwo7Na9xZCpWXCxiGdNj2rH7dElRXS
	OhUoIk0t6/deJ2M586zrh8QsPxJyS80BDWunwNj1s+4KoZfvYaP7K2GkhWrd8w==
X-Gm-Gg: AYBFou25I7yWuOyNyDwZdsN/oJ8EjkUQX25vlUA5O/DblcDOKuXLqOmiM5ZFKased76
	NCLfol+2LQq0OsKFpMwbRHd6NZu8iVGZUSVaJjwL8ko6pvmYHzWX5dOpanbvgGt0RTG2N+/6x1o
	Q6/GAPI8oR1ZeFb+ZzvfGwOkiZ0hKW4BnPHOuYBbUmmE4DIbxVpSksknCP3tc+RCKILoC7iK5Iz
	wc3NdVbv+xO5L09VHmQzq4eI1edNHbWWM0TAGwEhIokZvFauhtfKru11oD9adPYvphQkzdV4AUb
	DGNQDuxtI16jro1+pKWgZynXtA+No7f6kJA0Xz6JJ0PjhHXtp/GQ7upgPzNUQqjKoXsoLkeb+UZ
	SFxN2prAMT0knAhWm4PBV8B26Sd2LMmcHxHgC0IVZmCNh+hH+PXBsn8cezDdeiiIrKbpqt4uiSE
	h0D/B/K/zopN/RChgGY3Z8PGSr23C5Wd2whLJ8WAQFDPSkPB6hcprvyCIa9umAttl1e+cGkeE38
	517GSAjCaWb0UfXXgDi8VSl71ciIzbxF6TeU7jd1RLHZn15/xJz6RsMzMlCFXDRqxF+y0Ve1yaQ
	mu2y0asy3/1f2n2wLqkissEuBJqbxMira7XrC+QoMszVQTmebT+IRlTiAYk=
X-Received: by 2002:a17:90b:37cf:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-39d77aa1851mr1631597a91.8.1788997563939;
        Wed, 09 Sep 2026 16:46:03 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d77486a1esm1942399a91.12.2026.09.09.16.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 16:46:03 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Saeed Bishara <saeed@marvell.com>,
	Dan Williams <djbw@kernel.org>,
	Maciej Sosnowski <maciej.sosnowski@intel.com>,
	Nicolas Pitre <nico@marvell.com>,
	Lennert Buytenhek <buytenh@marvell.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: mv_xor: kill tasklet on channel add error path
Date: Wed,  9 Sep 2026 16:46:01 -0700
Message-ID: <20260909234601.101883-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If request_irq() succeeds but a later step (self-test or device
registration) fails, the error path at err_free_irq frees the IRQ
but does not kill the tasklet.  A previously scheduled tasklet can
still run after the channel is freed, accessing freed memory.

Add tasklet_kill() after free_irq() on the error path.

Fixes: ff7b04796d98 ("dmaengine: DMA engine driver for Marvell XOR engine")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/mv_xor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
index 25ed61f1b089..24f22db5dfa1 100644
--- a/drivers/dma/mv_xor.c
+++ b/drivers/dma/mv_xor.c
@@ -1162,6 +1162,7 @@ mv_xor_channel_add(struct mv_xor_device *xordev,
 
 err_free_irq:
 	free_irq(mv_chan->irq, mv_chan);
+	tasklet_kill(&mv_chan->irq_tasklet);
 err_free_dma:
 	dma_free_wc(&pdev->dev, MV_XOR_POOL_SIZE,
 			  mv_chan->dma_desc_pool_virt, mv_chan->dma_desc_pool);
-- 
2.55.0

