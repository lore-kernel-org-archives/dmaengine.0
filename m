Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795395200;
	b=MBe6t89yMWuzPDi9dTcd0V4Ywr9eBY6NvMj2vnVahjcyo2unHYeST9uJMvyJF4eikyX6
	 JaAiTsrMH6EPkYy5SBDcNZp6Tuq5BXf6e4KrDJt7Yi+duo6KbOgLcTW0mbN3Tm+Jq4qx8
	 +ZgD7+CWafxOjJp1tUO3CQIRmLiAdtmiU15t/8SKKRh0iNd/qPlVenkQ6Zc+RjsoS/5x5
	 v82Iz3lPLq9iyBGpWyZ1RJ9SymUrFDmK9c1C7AywSlY9s4P5mlGF78FWlwKCsOWAGO3V/
	 xmb3iKaALaWKM+ahdui67lE6ucx16dp2gtaGNQl0liDomXqCmIMwf62bl76xFl3OLAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795395200;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=eSw5Z0+yIQVkx+BQEpJQ+jfzywFUxYk8ZiC2TGjHOi8=;
	b=42lYeEi5caFwbGhEa/J+wgMtkR66fKbcpYLN+3Yfq8YfXWGDcNal8hebaQ3vq0u/+bqk
	 QUdlJrTWt0jtkExOG4ZnDtECpZEDqnWik+CwR/FFnwty3lsVDZ0EOSyXsinAXhqYU+zAN
	 4uUry2RpHPeuycQrSdSe8Sl6U22dnsfQaPw53ZmNc9MXb8t+3Y3Vbty+mVgWK2VStw19a
	 pVzqkDOofcVdYoWNE4f2e0F1EdKASEi/v0/VtXfKN4ksExkYlQ+zLvbmtsRCrxgl69wUs
	 37Q7OVtdR+SYrvNvFGmyRcQUVDFepyMZfFSeYYsx9w0lVGM6XOqUdlYsNX2GYs2k2AQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QG8sqYzX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D417606A31D;
	Mon, 23 Nov 2026 00:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QG8sqYzX
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795395199;
	b=yQk2EOIwe+qLggSF3BK6BTLM5SWSyseWKxXGC9Eqcg2a8UrEcNWJTuG2Bvawk0RM0ZDY
	 tj7Id4SLZwSHH1OgbdiiZ+nmW7Vx5zduxc3hv18kZj7xqj3PBo1Yv4yLougzmIod5SFzP
	 zaqQq6n1JukoLHxH6DI4ns4jxXC7t2fBLiB2o2y86gMtEkRFG92R98EWA+XzHAeF3McuP
	 SstR/MK6zfl9LCyRcdnWx+vSYSJLM29T7sbYX561tQK4F8PeFiyRvK1pTfpVtnDZqwsiu
	 6/8Q7IQg7GcpshYqZcoCm3SDgJWPMCzmLujLQBkkXPsF7+AeVtd54/Trzdh3Fk4ap0w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795395199;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=eSw5Z0+yIQVkx+BQEpJQ+jfzywFUxYk8ZiC2TGjHOi8=;
	b=zkCYJP4ElasAKtok/fRXP2iezd1eDpKLbrKONLbM9nX3940fLMPAEB6V8eN9u52V+UKd
	 aVqDdP5mtIux+5lf+jAsr/W/VciYw20upCFMkCs9H605df/opJz7k5qmHecY8GwebY9f2
	 1nB337x46kD8n82sEpqHDACcYCC7zcrHF4byABFK4K0xLoQSgdmoNKCMXFTtoAyPS6ptl
	 KSTP4rcXHzkBFgcRo2bKiEOAcZxIpPccUG7tTiPrta//knEREHym3mhmCmQbF7cPjptX9
	 5CPjiYAjE1l3C9hwQrQHxXK6EOhvueQ6R8MrT7CSLYR2Qoz4tjfQlfqauvciOWGirMA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 63E1F1F000CA;
	Mon, 23 Nov 2026 00:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795395199;
	bh=eSw5Z0+yIQVkx+BQEpJQ+jfzywFUxYk8ZiC2TGjHOi8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=QG8sqYzXMNYuO0MnWoa/6VChRBnBK/9UzCES8DUE0HGJDWhr0EdTh/8JIDt/chOJx
	 7UYp4zMThFY/qQlAR7mkJcxwH26srEU8nL9PE4JVBC607EXxeXuf8Lr0ISdaWvNZy3
	 kdI/9eULILb+PvoJmA+X9gjyDxGqeAM8rpKvhaYUdXadid64HLiizlsD1J2MC8+k7O
	 tiTmfXIpEX1R+mv/cu5i5HvBUw6dxMZk37pXGC1DuF/qSLTkKDO1ivN2fZOXzL/crA
	 xH77HBO+lG3fuiuD1soeur4i5NVySVLlKqB4AWs7sZsm3oWInHaFo/7S8uB37YczhV
	 FL9MaE/be5RFg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D8F584C298;
	Mon, 23 Nov 2026 00:53:06 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 00:53:06 +0000
Subject: [PATCH 1/2] dmaengine: at_xdmac: Kill the channel tasklets in
 remove again
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-dma-chancnt-v1-1-f0eea0a4bb63@gmail.com>
References: <20261123-dma-chancnt-v1-0-f0eea0a4bb63@gmail.com>
In-Reply-To: <20261123-dma-chancnt-v1-0-f0eea0a4bb63@gmail.com>
To: vkoul@kernel.org, ludovic.desroches@microchip.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank.Li@kernel.org, allen.lkml@gmail.com, dave.jiang@intel.com, 
 dmaengine@vger.kernel.org, andriy.shevchenko@linux.intel.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795395185; l=1963;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=0bu2ZG6YjZNYO8i4NTeIpO5xmk3AyoVwzgyIl6x73y0=;
 b=GN+9Tcxa5FdlvNodTuggieGgo/+wwVABpHuK75TugVN8dd466Y8HGsvRXU0on8ZU1XQA21oCK
 S5A7eaMLqmhBmmnCBans7qbDW/+3QfKLdOgtOHH+EXq4UTwUItjv2Rz
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

at_xdmac_remove() kills the channel tasklets and frees the channel
resources in a loop after free_irq():

	for (i = 0; i < atxdmac->dma.chancnt; i++) {
		...
		tasklet_kill(&atchan->tasklet);
		at_xdmac_free_chan_resources(&atchan->chan);
	}

Since commit e81274cd6b52 ("dmaengine: add support to dynamic
register/unregister of channels"), dma_async_device_unregister()
unregisters each channel and decrements dma.chancnt for it, so the
count is 0 by the time the loop runs and the loop does nothing. A
tasklet scheduled by an interrupt can then run after atxdmac, which is
devm-allocated, has been freed.

Read the channel count before unregistering the device.

Found with a static analysis tool and checked by hand.

Fixes: e81274cd6b52 ("dmaengine: add support to dynamic register/unregister of channels")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
 drivers/dma/at_xdmac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index ef0dfe9d37ba..ef4012c22573 100644
--- a/drivers/dma/at_xdmac.c
+++ b/drivers/dma/at_xdmac.c
@@ -2436,6 +2436,8 @@ static int at_xdmac_probe(struct platform_device *pdev)
 static void at_xdmac_remove(struct platform_device *pdev)
 {
 	struct at_xdmac	*atxdmac = (struct at_xdmac *)platform_get_drvdata(pdev);
+	/* dma_async_device_unregister() decrements dma.chancnt to 0 */
+	int		nr_channels = atxdmac->dma.chancnt;
 	int		i;
 
 	at_xdmac_off(atxdmac, true);
@@ -2448,7 +2450,7 @@ static void at_xdmac_remove(struct platform_device *pdev)
 
 	free_irq(atxdmac->irq, atxdmac);
 
-	for (i = 0; i < atxdmac->dma.chancnt; i++) {
+	for (i = 0; i < nr_channels; i++) {
 		struct at_xdmac_chan *atchan = &atxdmac->chan[i];
 
 		tasklet_kill(&atchan->tasklet);

-- 
2.34.1


