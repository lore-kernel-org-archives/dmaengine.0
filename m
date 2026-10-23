Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.12.242.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785182;
	b=SLBrS24tgcOEQfN3HCWcujpnZ18AHf4Po1yyXX8wfV1XvkjIqf9ngZjAvVrQGkXAiO9I
	 MzIVBVcglG6bmUMA7Jp2ypK6l/pfpx0Xn16pvYRCJPLHvNsoWq5zWItCGaeq+mlgImZqZ
	 gGQkBNKR8/V6djr7lOtqqXa+mmZ8hSm1YtZk85l+IHWSCUSFBbv0PImQlTfvx//QjOsmn
	 kG3UIgu4GAT2X+Ot6WeoyhRJ4Q8kj7IW0kQN+yOegGaNAJkv0kB2hmYeMEpm2xswne2Tb
	 RObSweQNJK6fNDY9GF0h4E6v3rZSLXGOafG64fbZipSvAK/hA4mgR6HzwZFwuZQTCvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785182;
	h=DMARC-Filter:Received:DKIM-Signature:X-ME-Helo:X-ME-Auth:X-ME-Date:
	 X-ME-IP:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2m4IKtQlnVrJI7NkWlXuPkFhNiQqmS45ouu3Fbw8/CI=;
	b=xR57JeN/v83OyxedG/AL6p3VIaascC+ysEBxD8i1oja5RxcGzC2k+krO3LjBbAGEuKSt
	 7tca91xdgXGDCD0oOCeKXAmIJtWNYNfGWfhgMzAOlgNYvy+d3zVGEYxfonPqUsrrX/bpQ
	 5wP3hIojlI7G2d4n7E95C+ETx7W+pL78KzCfqVCNIDgvko0cn/piFo2LM6i2eW0EykX6W
	 eNrnFCRc4srFSGVWOkE/qr3utM8mFjvYDXnxi5zwNkB6J0cLTFZNmnLIeOGPCUsj9rsqf
	 T5W86PLQURrO5rUBahJUc2jdeNbIMSH6ju+79imA4773wk4V9GQhA13YlPJa+yc26Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wanadoo.fr;
	spf=pass smtp.mailfrom=wanadoo.fr;
	dkim=pass header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=J3ANBp7s;
	arc=none smtp.remote-ip=80.12.242.76
Received: from smtp.smtpout.orange.fr (smtp-76.smtpout.orange.fr [80.12.242.76])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C285C606A31A;
	Fri, 23 Oct 2026 19:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C285C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=J3ANBp7s
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:26fb:aefb:6cd2:db0e])
	by smtp.orange.fr with ESMTPSA
	id KLJtxn1dYYWtEKLJtxZQMp; Fri, 23 Oct 2026 21:52:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1792785174;
	bh=2m4IKtQlnVrJI7NkWlXuPkFhNiQqmS45ouu3Fbw8/CI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=J3ANBp7sl/Dl5dkq6MOWlU6Kns62suUnR3EyqF7/ceWuGlTV/5beUyZ3CHZWT68wR
	 wOj/1I0TAbQ5sbdz65qvjbLvE3OQkF+mAxnjwcCWyMx1VqPMQ01LxQWvyy7W0O9tf5
	 vpgKj/gUidSYfM/4YE54GKamJe72utqoX/husS4YTvK5rPXEiJAfofGwZXqGzr5GxS
	 JMFz8s3ngydirGYFyQ68y/TpFNy3wFWZx68XT/nQNAaf0k0T6l5RVccwJ8+Cwg2mPV
	 WwSTg5IQwUD9o2ryJ4mWIoUqBFfbvG7lQCcBrKMW1S2BAVkIIR5ZTgEVUrYISPqb77
	 ZpoyUSMYgkGHQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 23 Oct 2026 21:52:54 +0200
X-ME-IP: 2a01:cb10:785:b00:26fb:aefb:6cd2:db0e
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-amlogic@lists.infradead.org,
	dmaengine@vger.kernel.org
Subject: [PATCH] dmaengine: amlogic: Fix an error handling path in aml_dma_probe()
Date: Fri, 23 Oct 2026 21:52:50 +0200
Message-ID: <93183551770e260aff993bb4cf1ce5ba8dc1e732.1792785154.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.56.0
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

if an error occurs after the alloc_ordered_workqueue() call, the
corresponding memory is never released.

Use the managed version instead, as already done by most functions in the
probe and simplify the remove function accordingly.

This avoids the leak.

Fixes: b84b5197e344 ("dmaengine: amlogic: Add general DMA driver for A9")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/dma/amlogic-dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/amlogic-dma.c b/drivers/dma/amlogic-dma.c
index 684121d13fca..791bd82743d3 100644
--- a/drivers/dma/amlogic-dma.c
+++ b/drivers/dma/amlogic-dma.c
@@ -620,7 +620,7 @@ static int aml_dma_probe(struct platform_device *pdev)
 	if (!aml_dma)
 		return -ENOMEM;
 
-	aml_dma->free_wq = alloc_ordered_workqueue("aml_dma_free", 0);
+	aml_dma->free_wq = devm_alloc_ordered_workqueue(&pdev->dev, "aml_dma_free", 0);
 	if (!aml_dma->free_wq)
 		return -ENOMEM;
 
@@ -712,7 +712,6 @@ static void aml_dma_remove(struct platform_device *pdev)
 		if (aml_chan)
 			tasklet_kill(&aml_chan->vchan.task);
 	}
-	destroy_workqueue(aml_dma->free_wq);
 }
 
 static const struct of_device_id aml_dma_ids[] = {
-- 
2.56.0

