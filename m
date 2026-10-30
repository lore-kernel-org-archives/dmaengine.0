Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372374;
	b=ajMe6+va0ncFQQIQh5THZ78/b+zNQ5UnuCramZZ6/zbYD1xfdFZ6xjNEv8Ksf8X2AWmQ
	 AlDPrPyR+iP92xSSrSDTKBYcs9OVe0zpVgr4QsUmgPfrpW4zXzS/PfeF5BBwvi2OOp7Yz
	 +fw3MV8R/dF7+Idc1Rwj1t77TnVtieGr92Xt5zylkd3mxAYSUepU277dFJjojbHB+MInO
	 pqYiN+DE/dakPVUUEgtbiFy6wz+Qa0gkyT95kMf6d4GIiv2La6vRT5C2RvsZUo36hrYPX
	 xCxmyFC4lzL8bIEQhWuBYD4xL/DZhryl8CQvM30X0VVbHppPvtwBD79bW+5D5hF2kOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372374;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=e4HnHpVnYB1WGb4ZDGkaUo9loDMHiMw/RxGXhrKxTd8=;
	b=aSS/Mr+WAP0qwMbw3aEAcyRRHp0A4BTGXErXLn45LcMwCYiNDg7uiISd0dSPltcUta3K
	 ltVSl7H+ZRsh01H6Y+0mMave5YP05Z3U1OnVmlelDrtXXh3nnokA7VsXU2uq1ykckofcH
	 XgKNSZcYkUsKKzSCPeqtDJqoW6mpmERE3iAj0QMH0LkRo9YRI2w71vXvwAEim34U5DZjl
	 zWc+W68s/1BhdvPySy4Oo6Sc7HLrQ+SccnKDZNr3bHDS+Sh9XGiAPQuUrRrSEmIRCnLfi
	 qSw5GKlb1UMXsC2s0BsQUT1l4BKJC3d7TRB/AGWBrpRerfGL96yxh4uNOrjcChZQu7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U1bvSaVR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39AE606A32C;
	Fri, 30 Oct 2026 14:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U1bvSaVR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466021F00A16;
	Fri, 30 Oct 2026 14:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793372374;
	bh=e4HnHpVnYB1WGb4ZDGkaUo9loDMHiMw/RxGXhrKxTd8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U1bvSaVR9FQzuTJzGirkRuF+7UkThFwFOJeerdBNiQBB3Psne2dsjP5ueaynKDS/l
	 AWjHulgf2/iOL8giLKoSoRhqPGxRb+/J9u+R/391Sz8zu1akwhBhoyb7UER38MoQz1
	 cY0mlmtPRN3Frzy5uv0EZDpscGHzp+a7hQdIxfGuNINfpTO+9ofpAIC5HnP3M8157m
	 S1H11Tmo6RrDjkHt9Dbbk1liID+DmpFt3Q9lWbNcWlX7QWV/wmURjIOZb3aIEmsiNa
	 f8nSMLQI0KHm0+kjkxV1tdwg6g+ZOLzhFETNGwXTgVAsnPM0czbZoVWl+1D2L+KlPy
	 wz3+iOA607bqg==
From: Joshua Crofts <crofts@kernel.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/3] dmaengine: ti: remove redundant pm_runtime_dont_use_autosuspend() calls
Date: Fri, 30 Oct 2026 14:59:01 +0000
Message-ID: <20261030145901.1393-4-crofts@kernel.org>
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

Remove the redundant function calls. Additionally, remove an unneeded
label as a consequence.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
 drivers/dma/ti/cppi41.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/dma/ti/cppi41.c b/drivers/dma/ti/cppi41.c
index 88756dccd62c..e1132e330fad 100644
--- a/drivers/dma/ti/cppi41.c
+++ b/drivers/dma/ti/cppi41.c
@@ -1108,7 +1108,7 @@ static int cppi41_dma_probe(struct platform_device *pdev)
 
 	ret = init_cppi41(dev, cdd);
 	if (ret)
-		goto err_init_cppi;
+		goto err_get_n_chans;
 
 	ret = cppi41_add_chans(dev, cdd);
 	if (ret)
@@ -1142,8 +1142,6 @@ static int cppi41_dma_probe(struct platform_device *pdev)
 	dma_async_device_unregister(&cdd->ddev);
 err_chans:
 	deinit_cppi41(dev, cdd);
-err_init_cppi:
-	pm_runtime_dont_use_autosuspend(dev);
 err_get_n_chans:
 err_get_sync:
 	pm_runtime_put_sync(dev);
@@ -1165,7 +1163,6 @@ static void cppi41_dma_remove(struct platform_device *pdev)
 
 	devm_free_irq(&pdev->dev, cdd->irq, cdd);
 	deinit_cppi41(&pdev->dev, cdd);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.47.3

