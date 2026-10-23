Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792745473;
	b=qK9LxyxxvN25giqHlaN1wnZx37onBumN8QnB/QDhKj2kKA5fckJUYi5QUOtX19qnMPdh
	 FWIw1jgCYKLQDAieQPOOMT4OstzjbaFSnRlprCkafBI7SHGJq1EKSTrAkqMfx0Izy2D64
	 ezE5GrF4e2Ek89edSLL8Ek4UHNPLzJVXliFQG3qZrXTi+8F8ftbGVcHAFGgnZVGqPU8Jp
	 9GNACSuo/LGFU/ZpToIA2zZPtpq5wXAI4hikeX1ZS+z1j9EDODL1EFKvPu/hzPwYp1Xbh
	 +t0QcKGPeBesllRC+QFLCGoGSyf9N3SNfmPEgE26dqzqRRv1B0UFcEIWxfmZUrHrIRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792745473;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=88wzN4diUU9+UTf3Daw4rfPfjSRtk2wAWuM00ZkEaww=;
	b=yyJ/nKMRzFaq3N5e6zxZqH+38meZgb7qajgrkxhRL+OnXEOotfDOEdCP6KfVnsHKpykg
	 TbiHVPKG4ihvyc+hU/rxhJLcN6VeyFoXLDGaU6pES4eFotvqvVXtgrsw6oP2pNxP8mflY
	 U1jaxb2hMOKYiwqEKKfBhYpJV7ndeWjl7/VOhyh+pGrj8vAMcThwMY5aaeC9y5S/I2NEF
	 dFdFdxnPqIFsYMZuoKMsDLGDzI9IX2+CQ50Li6OVmE4XH7WTJudkuR6sQvjoNc/sjfx+X
	 En9qsM/Wg+YVK3EEHuJ0BS28w+OytoqYV61QD3ePU4LKgvPq3ET6zJxkZ2DkeMQBOLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pcy4XlWQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9070F606A31B;
	Fri, 23 Oct 2026 08:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pcy4XlWQ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792745473;
	b=X8qT3qMWzBSXoCPvLHx3p7Gh79wgvrnWn7wg6RqbjW7JnMcs9xAskFAKmdzMDFArc0nR
	 VUVNrkq5qsJrdmGGjj4+fRK4sIdnXIWTGfGaDAXsObQESvb+jD/qu9DJWX8OGoLkZNgNC
	 CCOEppo4qM9HkbSJMTZeM9ajc+hZZlP3pm3Tm4iskdM+h7wwNpFplm8sCcLh7PCjY0hYT
	 GxL7/FRyJ0LCcVkWIeRMkKIAdbgPLiP9cc4oGVn63P+1peK5E0IFhuKCCAaC/OC2vg9oG
	 ecX0clCNBVTY2bfPwvhljztwwRrCdQHOWRvXNxDn3ZxIQqFlB5/cAcAPiA44Ie87uKQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792745473;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=88wzN4diUU9+UTf3Daw4rfPfjSRtk2wAWuM00ZkEaww=;
	b=qWTyQCV+W0mHeXS5oNP1TIJ90ANYuUPTHiO2Pc45t3eySAyXOa9AXF7l5lL18mDQwGGE
	 5DTMnBalLL17LRyCdZWKHbpORhlktg6hiueZQFcsbCcjS4idFBDUitze+mMcBS2EkPHYr
	 7qnr4DVUrD5uqzjrZgG0rddr132QVAOUm8wkD8VXUwYnmemZH2as4lnYCmFg5QlL/pLoR
	 nlfrEw/PUvk2249E8me9xd5lv99cb3Pken1zFrov3m3IO9HP/yJJI2vxwdIx6wMAKWIG0
	 FPDJI4UX1nqwEnm6XOtLN/CK7slsXI5tiO8ctSoegFDzYSysACGlcTlQ8e7B0MKHa5Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B6D811F01825;
	Fri, 23 Oct 2026 08:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792745473;
	bh=88wzN4diUU9+UTf3Daw4rfPfjSRtk2wAWuM00ZkEaww=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Pcy4XlWQAGsp+WDc8z5oHK9mxyj0A7D1ORuhLlDZLvk0oHlOHylP/7YfJbpd1s/zS
	 0x0Rmg3OETlXv6dEGnDz0ZxYd8XCrCsbXm86jnfj1150Hm3tw4z4LlDcy4ofhtyfKf
	 CoZrws9zST1FpV0TqaMXKOJuUB2iT2YN3jsM4igmFAA/PIx7s+W+e5mlUx0nwqj3SU
	 +Ac7pcgl1EtKKZjaiR5CVaO6S0bm900OarcEItB7o7WlJ2uP0d3MTLcLyjNsT6naQD
	 ko9jUkwgrEb8atACOBLdJLouGFhS3aakaU6x3ZHy1nNHV5v9ZkrCSelR5q/TY4Vjv7
	 oBco+BflWDAKQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D41284442F;
	Fri, 23 Oct 2026 08:51:11 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 23 Oct 2026 08:50:56 +0000
Subject: [PATCH] dmaengine: amlogic: fix workqueque not free when probe
 failed
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
Message-Id: <20261023-fix-a9-dma-wq-v1-1-b414de837e6e@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAO8f22oC/x2MQQqAIBAAvxJ7bkGNivpKdLDcrT1kpVBB+Pek4
 8DMvBApCEXoixcCXRJl9xl0WcC8Wr8QissMRplGK1Mhy4O2Q7dZvE9sNRPXyjF3E+TmCJSF/ze
 MKX0oPnP1XwAAAA==
X-Change-ID: 20261023-fix-a9-dma-wq-71fef50dff9b
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792745469; l=1430;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=a34YHjJv3kRrPIxLkFWemJns1CaLpsW5MhyikgyybBs=;
 b=QCRqlQC2+0xlvnJkgx367+S7w90kOB7yOCm56pMEQxvQD0+gfGwAahN9MRoK2W7IlDKsEWWX/
 ZlkU+oToRVLB0nm+c2c/Or5rM4MP6aHEyzjfg3I8WJVozpPRuDZLaE/
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com
Content-Transfer-Encoding: 7bit

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

when probe failed, workqueue not free. Convert the driver to use
devm_alloc_ordered_workqueue() for allocating the workqueue. This
ties the workqueue lifetime to the device and removes the need for
explicitly destroying it in the remove callback.

Fixes: b84b5197e344 ("dmaengine: amlogic: Add general DMA driver for A9")
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Fix workqueque not free when probe failed.
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

---
base-commit: aff5e6a77fc69a7c490246465940d18422d7c631
change-id: 20261023-fix-a9-dma-wq-71fef50dff9b

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>


