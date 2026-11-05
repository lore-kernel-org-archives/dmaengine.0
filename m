Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886067;
	b=sogFWqNvYU+jUhGvR9C6WvtmfTlEkxNECSkv+AUQvlfGum7W0XlGRjJKUuzENWcclSDZ
	 PscIiP1pZUbojHHXyCwTM8qHReXfmPjPkRmcP/F996fByb6sz2nNTFmpqs14fg7nzb0Iz
	 3z4hWsD+BmskJPn5faquKNc/MpxQsYieP22c/083l9U34QFlYxeKmQFj1SeY7lWQNaufY
	 15sokT4JwsWJKyww90nFiR23nBMKROsj8161HWNclf4XJeSoe6Y+QC+DqqZJKf+2IlenD
	 JqHDKTFv6hLhXIvTKpRNFd6rHlzUriG58oFarKyqZs8doFAD43R/esq0eKiu5V/LOZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hp6UnAz42BYtWNNKJvUUuqRoOotKOANhhbOdLXq6OJQ=;
	b=dZ90YcPWerkUAgjIoYgFrIyynpvaatHij3JlCMY+CotoDONlclOzBVFpIsK60RvQDHQZ
	 v9Sa6ceLss0tMUt8d44NcIWKAsgJX2d0y2l1LwKrIiOyMeXsMcLmH5iQ1lOR8H51xGUiv
	 Pzo/fIsFOLtVH24E1LsWS66Zb9AI1Ebf3AjsfqBmrWug6qNuGE/DyHkvSq9p4+10V29Kl
	 hAHQjdM9z2s3EhvodJH0koxrejjq2m7r3KJSKfHcjo61VTx22secJkhLBEYzrc+VTN/px
	 FenhAEMR5FQo16pLKzO/kwToV3SS5a7jyUbRE03oIoXHSfAUZsJB1RyzSjr0PaAiaDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ok3bum+k;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE82D606A329
	for <dmaengine@vger.kernel.org>; Thu,  5 Nov 2026 13:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE82D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ok3bum+k
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so17117605e9.3
        for <dmaengine@vger.kernel.org>; Thu, 05 Nov 2026 05:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793886065; x=1794490865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hp6UnAz42BYtWNNKJvUUuqRoOotKOANhhbOdLXq6OJQ=;
        b=Ok3bum+kYvQiNNVPVy7x8MhzFunyBfvADRAhnTB7+cwO6+tugOJ5xnDLLZ00Z/OrAv
         x2Ov0Z3BIhC+y54oNNHHdjxPDHGTaOu0dDuCLDwwRYlpAbhrAcq6dFE3gf6mL5fUDg8k
         8ealx2J5YgdeV2VsojZOo50+pz4krGWNKLR2i8ZJ1t+CJdU8D2sec5z6MSsy+vSnWbiO
         V3sU+/tkhsBax7Yn2j58u3JPx12C37ybV16YgzMQk4wg3LgtWX4DKieZmDdRI3s2S+xQ
         9FtVVf0ZRrb653tAUV7bkLTGC/H+5Pu62VBqeY6peUn03Qk2O1/huQUJNsj6tyB8399H
         WFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793886065; x=1794490865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hp6UnAz42BYtWNNKJvUUuqRoOotKOANhhbOdLXq6OJQ=;
        b=ds6sUV3ANtHfIk5GaGGKUzKdyzj+fJ8D+z9ry8PlWEs1FWJiVUB36DjZMXZyP2vNXl
         8B90meMiXYPGDkNAREhvBuHlsv+nYukhThEPZ+98Tpkpm2ObWzRNOll6obbrPKHsEDm1
         nuAvcD9q1Wl9WRbjncyrs59VFjK7HDNVwIRx6vAqliPqua9Gj0vrXA8zuc0UMYjmJ4Nu
         TZfITjt+LZwf30vV3yO/X+PvfWfRv8wNNrzfOTHo/vbUlw3UvPLtJ4edneN8Fga+DajG
         ZLEYkYb7WyLBqIn3Nd5A+RbJUBqo8SfnHpRGLKewCCJMaj3U0Ly32TUAcR2DS0vlkTSx
         C6xQ==
X-Gm-Message-State: APuU4Z+uH+rCgAU9WIgQjOoEg8SyfTbge0aT6QI/6AcFwc+Gr8SP9xOW
	gK/PfOFP1NogzOiy5Ibhgi3FsFFkdfDh5GCJDxuV79CgbYD9oiELr54o2X3jMyMw
X-Gm-Gg: AYBFou302JlG7t4eWeY/ryApcKV+UjgP77eqpTePgxDw+F2AuRHJ725+XH7kbfKcpLn
	DSUEqOHAcV7NEQdkSNTraJD/sYmkoDHcAktSRKHPOROxuue14CuyyvrwinMwhg+iyRkjECPXAjG
	GkhXJ9S7O/Wfqil3axDKC09/GL3RpFmGHTUWxKNWHgcxKXh0CJKFTCsaVJkqGztNA2c9/zqsYGy
	J4BFYLW5b0VcdURIn0T8j2MfkuE6DYE6nRQmboO8e99lPRbwHWDiwuTQdsoCHu1Ve52VcEz7n3p
	B7S14PX3bY+rTxGTdwBJKW+Uhq4+T8PKjjKOPPxv7RiCkJ3IHanF27EG3DG/EByertcEqTnD11Z
	ADQY9QcUEyLAYNP91+fX3YNNUhE3Zqc64AFIbWMwDs7xrw/LjvWQ10T7qHOTm/agWY2oKWkmcaY
	AvRBGsRBcqMhzcdZrht5blGvVQlYK5fXSp///xz53aYsGSKcUA8OIuMbdKW89TlZFy3JZ6cAYTQ
	6rg0CvcZp3oIPxJUe2T2CyZdMMJL5UlGYAqdE7uR6o9mNybp3lVY0nuXmQ++wnbh0LcF+TBdPBK
	jPX9Lb/x+sZKGaJPSPY/rLjSZXOcCcUMpGE/dKkb7AzP
X-Received: by 2002:a05:600c:6095:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4ac182dc30fmr374890485e9.22.1793886064798;
        Thu, 05 Nov 2026 05:41:04 -0800 (PST)
Received: from localhost.localdomain ([46.188.59.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b64809c39csm13472965e9.4.2026.11.05.05.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:41:04 -0800 (PST)
From: Sergey Matsievskiy <matsievskiysv@gmail.com>
X-Google-Original-From: Sergey Matsievskiy <s.matsievskiy@yadro.com>
To: dmaengine@vger.kernel.org
Cc: lars@metafoo.de,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Matsievskiy <matsievskiysv@gmail.com>
Subject: [PATCH] dmaengine: axi-dmac: add reset deassert logic
Date: Thu,  5 Nov 2026 16:40:40 +0300
Message-ID: <20261105134040.315317-1-s.matsievskiy@yadro.com>
X-Mailer: git-send-email 2.47.3
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

From: Sergey Matsievskiy <matsievskiysv@gmail.com>

Add optional shared reset deassert logic, sometimes required for
communication with the device.

Signed-off-by: Sergey Matsievskiy <matsievskiysv@gmail.com>
---
 drivers/dma/dma-axi-dmac.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
index d47ff27e1408..98aaccd26a26 100644
--- a/drivers/dma/dma-axi-dmac.c
+++ b/drivers/dma/dma-axi-dmac.c
@@ -24,6 +24,7 @@
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 
 #include <dt-bindings/dma/axi-dmac.h>
@@ -1211,10 +1212,16 @@ static int axi_dmac_probe(struct platform_device *pdev)
 	struct axi_dmac *dmac;
 	struct clk *clk;
 	struct regmap *regmap;
+	struct reset_control *rstc;
 	unsigned int version;
 	u32 irq_mask = 0;
 	int ret;
 
+	rstc = devm_reset_control_get_optional_shared_deasserted(&pdev->dev, NULL);
+	if (IS_ERR(rstc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rstc),
+				     "failed to deassert reset\n");
+
 	dmac = devm_kzalloc(&pdev->dev, sizeof(*dmac), GFP_KERNEL);
 	if (!dmac)
 		return -ENOMEM;
-- 
2.47.3

