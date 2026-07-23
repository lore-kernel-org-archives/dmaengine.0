Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7879D345ED4
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 05:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784783046; cv=none; b=orDVlOklwEcaK1wwU/KVrAAkgexHqOjVKmpHnBXD7WftlzH4uMYa4sTlWxjeE9AS15a/j6GrkBUjY8Z1t2fjZ1AYeDDucjI5II06CIvN/1R889gZtkvWKlPwrRwR4BdivJpGlk9wKMBSWtQs/z48WeJhrbE8YrGCdOYz9VC/1iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784783046; c=relaxed/simple;
	bh=6WdGWqHupwSPRTLKUpNbq6MPj8JiMPkxocAzxRvOEN4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bA3R7cerpScbgja/6dCtcACImlkwFy5bfZp1rNDUrM2MbuEEFetPYMoXgyCxnYR/TIx7ndWipTDib+OIb7426mgHn2KV2VM0zsArHQBKK2Jajb60almFd5v/5fSRjTPmFPZfyDNaihYIRNt4BlY6O0omAK3j7IXXbDAy421Dvc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kBQhteHq; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kBQhteHq"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cad4170e8eso3868245ad.3
        for <dmaengine@vger.kernel.org>; Wed, 22 Jul 2026 22:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784783045; x=1785387845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7+cCcM6CiilxYn20d+2/sNJaaaPBtgLi+l7OMsmE4UA=;
        b=kBQhteHq481ayEGvjdbZm3szHkXlgOWZlBgdjPWar6hBTsqKKl6SY3Kv7jGVBCuFwv
         ZyzB+p7rl+IJlz1H+PnhgZ2qPOiA7FDJWY+icDJHusEReQYrrN+E8fGRMNK0URLV46w5
         J12G8tplCtOr30HDY+KBJgQFpmS+qd/Rsc1hIuTk3p4Gv4nSuTKuVWiCW9umy+XPvFke
         JleNujXq4dsaqagVwij0LaYE3DUfgtSstjiTSXkCwjVxUwg2qgjgMraRgLYF/asmk1VF
         NVST99DHLdiLD/dn5ILhHO980/3pHNzefzErWrMlvomtifEZDhWBQJ1qI7XRE2yjRUhQ
         paIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784783045; x=1785387845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7+cCcM6CiilxYn20d+2/sNJaaaPBtgLi+l7OMsmE4UA=;
        b=egg1+GaR2WHTpRk65ecPeY8Po4QnkZylk7FK31hFWff+ef1K5FYp/LqIRfmqPpf+C3
         MdPR3sUFzZhVWhQxfEvzYAs7gk04JMbKf0lKhTP4+VcGWrgPmis3JaBDA+eHbTEjgjBn
         nJxG1mFJEp5cNc0LjHOQU7ArbXEAAihVv6X/pDgUX8sg8YOC8xC1oZ5xk7hLzOGfW+Be
         pVA/mftWcEese+XpRYPS1m35OHbAcxuHniijnSXPKgZUgITN42vO6MSieImrw2FdQdgz
         P7gYo8F/GL2G4+HumvupAVJXITWJeiu7H2c4b5tY5Rkm2K+mTnYE6r8aTJKpd9s1a6xW
         6TKA==
X-Gm-Message-State: AOJu0YxyqoUxRANqWQ7pdinXQp8OkWCuRJqGx1YkLdOCIiXo5sKSQmBb
	JBdboWg5SQO4Xl8fRg4AGRJaJv8EUocYbHf2/GPZwKNMhgE9B1f9uVlfndSeEg==
X-Gm-Gg: AR+sD11Xmx9SNNSh50Q8AI6LQU1xXrb6JDIU+3YXawv9brVbd2EE40kBdxvhcNzpHAx
	RHnO4GF1bSV/AZkhDAg7mxYqw1aE+feaVcAQZIxohQDO7Txgqd4nNWRAUEXoHMu5XTIHuvNUqI8
	X1QDLUcy2aNKKiCUKU/5Z6SGAXvL6w4jCyaGiJYvOv68GnU97OkQ682O9nDbn7Zh1SOAdFnGZ0W
	JiIR0qX2SLgwBGIIGml/uwTp9s0v6acqM6o8Dxl/FCSN5wOWpvxM5Xo7pXg4x16I6R0GhaDiNtX
	7u0iBB6HkxOlEO3c6T9o470jS0x1JbEJ4LkmwXVjSJwx5gy/ANTiEHArFIFYCurrUOG9fmtW4u9
	LJx8JwhMr7B1lw+qdhUyxNUC8/vwhRuNT/xTQiA76EF6sV0dTvDCaHfKvd7bFubD0YfjNUsnzU/
	ScPE85W8d1XaFL2/ldT4QWa12baVMNO+sG+TF7G7nzcNXxcyCqiyfuVle6sTCSBoFKobXQeUEdM
	nc5whjPD6e7nXHd4NARHl6l6VtYyhTOqNVOeOnIgYxYtIShtiCChR4=
X-Received: by 2002:a17:902:ea06:b0:2cc:85a7:36ee with SMTP id d9443c01a7336-2cfa6c71839mr19269585ad.32.1784783044719;
        Wed, 22 Jul 2026 22:04:04 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f3b46absm25394675ad.80.2026.07.22.22.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 22:04:04 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Dan Williams <djbw@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:MICROCHIP AT91 DMA DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: at_hdmac: fix memory leak in atc_prep_slave_sg
Date: Wed, 22 Jul 2026 22:04:02 -0700
Message-ID: <20260723050402.272606-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The default case in the direction switch returns NULL without freeing
the descriptor allocated earlier via kzalloc_flex(). Add the missing
kfree(desc) before returning.

Fixes: 808347f6a317 ("dmaengine: at_hdmac: add DMA slave transfers")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/at_hdmac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index f9c336630fa2..c06f70dbc4c5 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -1381,6 +1381,7 @@ atc_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 		}
 		break;
 	default:
+		kfree(desc);
 		return NULL;
 	}
 
-- 
2.55.0

