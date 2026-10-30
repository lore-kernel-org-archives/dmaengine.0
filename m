Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372372;
	b=LuvAzxoXea17DRlRfsdBR8wIJVmXFIwf/OoTg0dskxlWj3/diFFEVrafHSZIoBzNgaVs
	 z0WKel7vafjQZh+0DzNh7GWRh/1V9ICgNS5fHg20xf9DqNuuQ0eDt7qm5LET5s/HQr08A
	 ou9eMWnYI6uMIm9QBNvDAZNh6US/BlRCOTqweSaywydKJCSGgIDuxDW6SWjKIepMo/diC
	 ysaoB2CDXjF+Ob59SxS0OczzgKJscPHFWgxpg3Ur8cpCdEFkSsjeWD4mnJMJBEBgRrIY3
	 BzA7kUNiap2rgfZhSWUDYcfX619jn3E3aSOFTds3eofwI7yIat+Hrf2L6snsEIk0OVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372372;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Z0QOAQM4fSBIhv7Msh1ZYgn8c+kjmPiD8GbY1XzGggQ=;
	b=360LwpB3uzRRKhYif/wz8oK85jZoha6MtTmYaRBVEJvkwdks5si+fF1DhSl7zY5MryVr
	 HZzsuub5Jv3oA5IR0tDDaRfKRZ3zoX5jfPyYVTFgTzeMohyJEcZAU6HqpuDYCwmKRKUeW
	 d0HDv7+yxThJMhoa71F+lOZxa5U0K7z2CqrqSCadIgPZC1YQhdO5RwEphkx7R9PgFFrX/
	 qS8Pm23kIRIGSy2C6VV2Vuoj6rifqHIlJpv87ZKBSgGXxoi8jMsW3g05uWIZJ2LOrYxtZ
	 WjvKcTJ+n/AP3KZAOHZZKPbt8MCNbcWSDefheYGacYZuvfm3nOEVmUN52fgwkZUqUKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jX4Mooqp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A08606A322;
	Fri, 30 Oct 2026 14:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jX4Mooqp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB1A1F000C1;
	Fri, 30 Oct 2026 14:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793372371;
	bh=Z0QOAQM4fSBIhv7Msh1ZYgn8c+kjmPiD8GbY1XzGggQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jX4Mooqp4xrMb0+1+GC6lE8bgKtlGDh7WWSPENB/JTilTqo2NwrO9MM6aLSOo+y/k
	 zNtEcgN/4VrjbqEWM7nCZIGlwZCBOzBT2JJRcHzs89wNRCp3g6kEWtSKe3uuCqWGXN
	 X0LxkGOhIOc1Swwr2EsMLVErQaydMMWZrDhMGCUwfdTK5UIgh+nBXJs2TLSSW+vQuU
	 S9h4jKsZm6ilDbumKoEz7pSQyclu9YOpd6J2DpTL22vvdVq/0mE09kNqChZXSOFxjs
	 C1eX8MCSxjkYBzaQrNkrrfVDHoVUHiJHEUQ6A0LHL6wS3zPywpRvQoaDxbZZ9aRPbc
	 SxT3rh7RV0+xw==
From: Joshua Crofts <crofts@kernel.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/3] dmaengine: at_xdmac: remove redundant pm_runtime_dont_use_autosuspend() calls
Date: Fri, 30 Oct 2026 14:58:59 +0000
Message-ID: <20261030145901.1393-2-crofts@kernel.org>
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
 drivers/dma/at_xdmac.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index d40a8b40dddc..00a8261248f8 100644
--- a/drivers/dma/at_xdmac.c
+++ b/drivers/dma/at_xdmac.c
@@ -2427,7 +2427,6 @@ static int at_xdmac_probe(struct platform_device *pdev)
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 err_clk_disable:
 	clk_disable_unprepare(atxdmac->clk);
 err_free_irq:
@@ -2445,7 +2444,6 @@ static void at_xdmac_remove(struct platform_device *pdev)
 	dma_async_device_unregister(&atxdmac->dma);
 	pm_runtime_disable(atxdmac->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	clk_disable_unprepare(atxdmac->clk);
 
 	free_irq(atxdmac->irq, atxdmac);
-- 
2.47.3

