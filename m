Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792617095;
	b=01rrrzgohxXUJSExqr5YieURtfO/btm+ecv2jso14tdYQ9Xwlk+M5kO7iPBAcrQgI2rI
	 onqueTuR9RfB29rQjoBt836UZVh4B4LXuoXGSXBPqmyjNZvrTjopVz1HVLNde2cx4tb2E
	 y+KiKrrn6la7II1P/Z0BKdBwzM2TsOeATQPhchFU1rtEqNySbU90kdY5ZZ1HgVD7H9Lya
	 bfpmmn7AbvL4R0Uo2DW6b5wpmpzPgtP/up1LJDlHsOYXJ8rejSiGim6QMvdg9eSRlFvKd
	 7Fi6VwSpyXhAJp0eSFneVFpS2Znr3D+OQc2GXJuRLdh7u9bhpx37wzJINk1NkaaB+Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=MqdkwnXZrZ+WSeQ8sJhYzDlGNeCAoHXJu9T3vCXsEVQ=;
	b=o1P5eUNf20QIkxl52pzqCnXz4VPe0HDZHynk5q3g6CJHQ2LSXBRriGFoopBlwPuCtNwS
	 aheObtB9g/zLS7zaW6BKO69j1hfEH9+ZDzo1c9l0dD7PK26W7fqQKFhpm27z6K4Uh6BC/
	 v3KpqjMgb/pKADO1ZE1UcAWL1oDRSefzShUTiL/1l2JfUGr/64HKcdn4yWW9CmyUrzs/w
	 lE+cSNkZconoVTV7ai9F1LgGGiJu0FUlNVpIKiPP5Pte91fw/diW+z484qhaYclmlfm5e
	 vY1ybXqidZMJpoMJEH33UAsrX8jxmBuoCHXzWCwm5FE+oc/AQKJYdly1AJTUcx1SGOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="A/qAGEP2";
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B03D606A31B
	for <dmaengine@vger.kernel.org>; Wed, 21 Oct 2026 21:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B03D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A/qAGEP2
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6de1fd5f572so548566eaf.3
        for <dmaengine@vger.kernel.org>; Wed, 21 Oct 2026 14:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792617094; x=1793221894; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MqdkwnXZrZ+WSeQ8sJhYzDlGNeCAoHXJu9T3vCXsEVQ=;
        b=A/qAGEP2xYtqwZwBkxIDqtHEAo1qsn/j/ZnEAfXvv85+H8NdexbcJrJoZ985nhDdEk
         WxrEbcd5coJlgA0qylzImpLj7BXi9+rMJnphf4r6F6j7j9QwbYemAmP7HWvJxhDz1141
         bG18EH3dL+B92c6r6tqfwBqFWJ2XqZMfYSePATAsqnlF9x7R9PBCF+EKIaaC3MSwWypL
         KXdx4ctNpwh84XzXV5ElfTtypmd/fLes62ZtAPipo3TiUQzUmuMVotWA9Pi75BH+VOo8
         p1xrbRR/zDcCdCtuiWOIOWp5trj7PNbSFzfgu0qfPtpfNo8PNsEGanbHOh5Zgf6vVIBN
         ojWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617094; x=1793221894;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MqdkwnXZrZ+WSeQ8sJhYzDlGNeCAoHXJu9T3vCXsEVQ=;
        b=UglpR7rbL29aoSIocXq2+zdeJWbZmSJTJZ+7bKBg3h9UIxGhR85KwVD3dWAzi7fdrc
         jYe1GZ26VSR4icbKVQu5ukjulmxWwiecxG0WAe1vdFxveHgMJMfqFcnwKFb4c9BrjC2z
         sQPn1Kx2zyuoboR8Z+6uh0+QGHW81Cd74CwrPgRbJ8A70M2Bi4SAnx7RtdbY/1PAosGM
         R6T7qMrYKrDnOb48YMjF3w5O9K7sM1lV4ckuuK5Npkto98u5dMb2odsk1wa5k0VwglJW
         lcattzIeTWIJhQd8CFDGIFKZIm66i1vWbVo71NqdcQm5OBYrwUHQ7pxUIdKZoGOA0Dxg
         wg7g==
X-Gm-Message-State: AFq9FYK0ZlIDZ/KUhm2YYh+hQXO5rF7SEQlDUZzuG/49zQXM8jVjv6NE
	xCYNAQVAsWLQ7I/rAJwXQEzUe0GYbbsaL2fvWqnKhYJlHn9WZhLi++J0
X-Gm-Gg: AYBFou18/a3NNfFfsMSGaEvZIoNvHnKBIP87r8UbRlN73oHE5CNi8WqjpP3wJEXYWYB
	ICF34pA/cPc4TbrCy8na5sqq+Fseeua8XmFexyH5etNrHQPu20tn1LDXdL+NALUsOvIKRfc7vXG
	XtJACf/vV6W2ZSnULgRt8M4W+jl41l+7HYfZ6dUrEW2lYVVPjV/jl0GZEe/X8e1t2cf7axIiodO
	VkO5BFFMNthd0bCoSyYr0uWG9v50NH6cnm7uxQTYiIzZUuta7EsDmOdOHIksq2HHkrKhI/W7bQ4
	ot2UIkl99nKw6rF1i2PrAv6l3/a9IgwyQej+t2QDjCviHs3d7Oc0CmH6k12NL1YDNc9lwIyqftc
	gl9wbJjqNFLsqo/bh6RHMwGon6hnYFN3x+fJQJ6nZ6i+c/fTI9vBCWixgpzDJKsMO1gLlQx76gT
	9SP5TBWsL+Estb86XspmVPgdjWzjCXF16xuZfjlCLpEbyNN2Q0lGc1XzBThJ8moD9lhvcUNky8O
	qqUNX3KYrPtDxMXPDpI2k4AFlmiedvNHK5gHo+C98XP1ihjSw8ELWdo2AWbV4cBDYW/rhXsvkZd
	wXcYedLYkrPW1CxmaBsEpJZC6Uyp3NTAkmj6/O8j5W4Du2bpRFS9ZrcDPgXhuHW5BuWnS6Xazy/
	pxEakrv/LKRW4/JMt9/V3TYXwKFsuPD55IUj1DNFQh7u8CADIlWU+r079HjYYO7x9o+8vWWutDm
	0ZLmY=
X-Received: by 2002:a05:6808:1645:b0:4f7:a3f2:d8b4 with SMTP id 5614622812f47-5536055db95mr2302438b6e.65.1792617094073;
        Wed, 21 Oct 2026 14:11:34 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552b583fd57sm2806628b6e.8.2026.10.21.14.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:11:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 15:11:29 -0600
Subject: [PATCH] dmaengine: sun6i: constrain descriptor addresses through
 the DMA mask
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
Message-Id: <20261021-submit-sun6i-dma-descriptor-mask-v1-v1-1-76e72bd52e57@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN3Q6CMAyFX4Xs2kY2IlFfxXCxnwrVrJB1EhPCu
 7vJVfOdnPN1U4KJUNS92VTClYRmLqBPjfKT5RGBQmFlWtPr1miQj4uUy+GeIEQLAcUnWvKcIFp
 5w6qhuzjXXbW7dcaqYloSPun7//IYDi6aF/pc1bXhrCC4ZNlPNSpe5JEYz8du33+vDdddqQAAA
 A==
X-Change-ID: 20261021-submit-sun6i-dma-descriptor-mask-v1-35bb381b932a
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Descriptor allocations pass GFP_DMA32 to dma_pool_alloc(). The DMA API
chooses the memory zone from the device address mask, rather than accepting
zone-selection flags from the driver. These flags can also reach the pool
metadata allocation and trigger a slab allocator warning, as observed on
H616 when preparing the first UART receive-DMA chain.

Set a 32-bit coherent DMA mask before creating the descriptor pool and
remove GFP_DMA32 from its allocations. The driver does not encode the
extra descriptor-address bits supported by some variants, so descriptor
links must remain below 4 GiB. Keep the streaming mask unchanged for
variants with wider source and destination addresses.

Fixes: ec31c5c59492 ("dmaengine: sun6i: Add support for 34-bit physical addresses")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 7704b016aed8..0ef6ed1f936e 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -684,7 +684,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_memcpy(
 	if (!txd)
 		return NULL;
 
-	v_lli = dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWAIT, &p_lli);
+	v_lli = dma_pool_alloc(sdev->pool, GFP_NOWAIT, &p_lli);
 	if (!v_lli) {
 		dev_err(sdev->slave.dev, "Failed to alloc lli memory\n");
 		goto err_txd_free;
@@ -743,7 +743,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
 		return NULL;
 
 	for_each_sg(sgl, sg, sg_len, i) {
-		v_lli = dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWAIT, &p_lli);
+		v_lli = dma_pool_alloc(sdev->pool, GFP_NOWAIT, &p_lli);
 		if (!v_lli)
 			goto err_lli_free;
 
@@ -826,7 +826,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 		return NULL;
 
 	for (i = 0; i < periods; i++) {
-		v_lli = dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWAIT, &p_lli);
+		v_lli = dma_pool_alloc(sdev->pool, GFP_NOWAIT, &p_lli);
 		if (!v_lli) {
 			dev_err(sdev->slave.dev, "Failed to alloc lli memory\n");
 			goto err_lli_free;
@@ -1345,6 +1345,11 @@ static int sun6i_dma_probe(struct platform_device *pdev)
 		return PTR_ERR(sdc->rstc);
 	}
 
+	/* This driver uses unextended 32-bit addresses for descriptor links. */
+	ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret)
+		return ret;
+
 	sdc->pool = dmam_pool_create(dev_name(&pdev->dev), &pdev->dev,
 				     sizeof(struct sun6i_dma_lli), 4, 0);
 	if (!sdc->pool) {

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261021-submit-sun6i-dma-descriptor-mask-v1-35bb381b932a

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

