Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372373;
	b=EJWBetHsZaloUjPCnTOqdWnAh5355VH54ysIxsP5cEw5Jfkt04E+FMgkJqLbq/kahWFx
	 fB5rFe3Ub5xv++krXvXT1b/UWMp5p+G7E1iyBS/DaUcxqSOASmTIsNaTYsRZR/nBs7i5k
	 90axC9BJX+2BoXMb809hZAXFpIJBr2D3XlhEe9r1ppWRop30/PIxyDRUwFTVQ8j2cS2Wh
	 hcXtj9IQTfzgSbpNkIyHSx6fpR03XBlPUmmqqQmHrdAni95a8HwLbKRov2aQxMXmDZD8p
	 skV5DGOW6nrMEVLncjP/4oq54vQZM80jEqn1J42rlGlh/mPf3iuZYi+Ln+cWWa1eHlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372373;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=sdZZuu1KAvuBOeQ7yzKV8wo3W2DFye1M9CG/9y5jafE=;
	b=eC0tIeMOEKWO5t0GkiIYgQWd4wC9T0fmnHhhJZ1054Do01O3juCGR11aYdksVoGIw5G+
	 GoqCf5qxX2KkdBnmisW44ygGB65FrgOnvAXyUWDJ3sHEWvvpkuEb4EJUzeoN9puIUVSvc
	 90zLaQjEAHgEyBTyALZuYWSwBAXajz4J+NYkeJ/dLu5q/lm7XouOeYVfvAOIWv3ypJou3
	 3N4v/bYgT/RBjhMFQnrDRT5Jq51QGIoRS6n4KUnyXTNQCiVV86UDgnmO9h4FBWflm98CM
	 +7ZwIXinYGeSFw3akfbWSzVru6xf3dVtY0+iqDAF1E09SiR7qS6kDhmML5AomyI6LmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hESFBiP7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F826606A320;
	Fri, 30 Oct 2026 14:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hESFBiP7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A551F00A17;
	Fri, 30 Oct 2026 14:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793372372;
	bh=sdZZuu1KAvuBOeQ7yzKV8wo3W2DFye1M9CG/9y5jafE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hESFBiP7NG+yQiT0y9rW63TmFUfhRSwLqcayIrdNdF0ACjMuoKVQlYMlclsgsX5IA
	 pky5XL6XDvY8D8NMtTmdhJ9ZXhpmxo4ivSAEcEoA0wy2bmTTU5r++GCbJwUt159SFw
	 Wkyx7O98wWfwK5fjzgjllFgQgo3Vem5H525X7sbM6jSV2Jz8lUXRnabj4qetopOYfO
	 lwaZgBl8nuVEUQcnkttGkiqPxahYOX3viBYwjHq9hZ/61CkOz/dEpD3IUh13L2ElC/
	 6PGbLPLfRGsFzPsBXM79c83FbMZKPFbSK6UBh83boylf1Il8IuehDOfb6P2p6y3mld
	 mQ+MFji3IfATg==
From: Joshua Crofts <crofts@kernel.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/3] dmaengine: qcom: remove redundant pm_runtime_dont_use_autosuspend() calls
Date: Fri, 30 Oct 2026 14:59:00 +0000
Message-ID: <20261030145901.1393-3-crofts@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030145901.1393-1-crofts@kernel.org>
References: <20261030145901.1393-1-crofts@kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function calls.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
 drivers/dma/qcom/bam_dma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index f67a93a37d48..efc155c61b07 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1403,7 +1403,6 @@ static void bam_dma_remove(struct platform_device *pdev)
 	struct bam_device *bdev = platform_get_drvdata(pdev);
 	u32 i;
 
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_force_suspend(&pdev->dev);
 
 	of_dma_controller_free(pdev->dev.of_node);
-- 
2.47.3

