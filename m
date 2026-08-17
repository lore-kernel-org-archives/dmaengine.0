Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20121A3029
	for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 01:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786931687; cv=none; b=nXoBrRQTFXhJj7iNSqFBCk/6b9jS6csmfClnhKlbCw+8Uvbr5+mP4Z6YDpjT3IHYdCL90Ig7uCg4Or6+ZvbgaSzEsLPGfVjTCBR4ePuzPbzgPsJTuhIEaN1HzXIkNH66TKa1TfijPRPZ0MadHJ7k9U767mPzQbD0b5Shdt6yRso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786931687; c=relaxed/simple;
	bh=36JFFlxfBXpL6mrHKCopsIrLCMknMDR/uGqKUa4I68U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oV6kUnrafGeD/11x4JOKrg17oQvPOizXf9a+yj4sd7Oo2mZt+Ljfr2pYftUVK0gOL+eVM6Ke96CfvUrTNhfETSZR+GZEzOBnQwoKRK/8OuaoOhCikayqwk94SttWhZ4uKWaVZ/oIWXLtcGOk4sgScylDbAkav/d7SaFtmlXWA1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJJe68pV; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJJe68pV"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so3126349a91.3
        for <dmaengine@vger.kernel.org>; Sun, 16 Aug 2026 18:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786931685; x=1787536485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DE8tCuQ7LoO1kue2S/5nN10COmBlfB5FK5rIj/7OLZ0=;
        b=IJJe68pVQU7B4gYnwcTzm4wn1f8gnO5lW9dnR03vRPezS1Rh9dYQbmlV42tmFy91kS
         uDqjXhmn6nHAdMhtc5f73F65/ATW3S94aLRM3V8nP4LPHrvSzOi2ABGeXNRY7nHisue6
         FG9Cv0+Syge5kWRpQ3zTSrYYyZ9rfpXwpMf5VRJ1vI0RNWGqbmhjLwyKXiXv5Ez3d2SD
         Nd2FWV7cTL39GnDrDxnX8kPikjqN/UnU1I+9fFYmAJNFz7GKYXjNeRQz246u5elO3YU6
         nMVzTwbu6If0RfW1UEUxettF89Uvkz3GutFUEraTXmfd7LbogALWIWm23gfacx38WrKo
         vjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786931685; x=1787536485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DE8tCuQ7LoO1kue2S/5nN10COmBlfB5FK5rIj/7OLZ0=;
        b=IzHijqX/cueW+fUUb7hZwC/JiMiPals6UuKIETh8KMt2B0iPmb2uPPz+lTR9s9p5/1
         2x7fi7APwDl2PAfsZBIqFCbNZfDr55tJo1XDudVoh+M/sdSO0ANJ7XAfN4jKcxfyTIva
         oUVK/EKzy0BWEXMp71NtRiFh0HW7WUCR3DIKlqPy+RIMFTdzZB8R6GF6W0puvb67E7x6
         uFBxYaKmJmvJ5zb+UOXuEAgS3oZM7EwXVYG8/TGOyaQMM2QVr4/3Rmumz+SnAz3AiHZX
         Yg4QR4zz7BdPW/d2HLv52sm3YQNGpc48yL5RMto7ATo9ADHmRu2cDd0cc8F4FXDejzwu
         D7Yw==
X-Gm-Message-State: AOJu0Yx+Dp6ivm9zefWPGNO5MwdEZ0qyIw6NMsWQ7wEBYeqsHq07dgms
	zh1e51cYVXDpX4ydD+YIrCJCEcRBCjVQHhPMqxwbyFr9QUnuM1JdMR38MX6Scg==
X-Gm-Gg: AR+sD12lnpKxGYuGZEuAPRz3aD3hHAZza9Fd8tP4ElohfI2TVtg1SQKnGgEFgj+S3dY
	AEkR27ubZ/EpIiH7lQDjhagJKHCDXcdsRdhT94SD8MF3uacM0dn+J22xnliriSsCzeDrzGz0bo9
	mwj6nsXCJ/DHWTyKTdlbfcQnmsl+ybrz6mEN8zG2n2IxGDZV/ImxK3vcOt5dNgYRQokLTKmUDk+
	KlGdeIlDWDUQtgNS1wwsJzzSlQurBfHY9yM66Td9hO9jO0MYe1u0UTULEkSz6HY9n52+95Wei5E
	EqQGjryK2uLuvwPwv9gnA2uM/LxtAQKOCleCsmuAdirqdNt+HfktXUrMdIkHaAFyvgg5SKw1zyR
	cVsZY0p06MQ9zT1EMDELZOlEzTufvtj3kiZJj335qCyhbawY5mQGXCAcFEZaaDSFQhz9EvMCSys
	QfdSi3A8GFChNXGuAWRkjPFyU2x8IUXWbX0poPk7rUQKLbnby+jsNAgYbOauqOL456QFeYLfxfp
	QvvV6MbwZQRbVbvDUbLMOOhuqsW6qrdYtseEkUrFRBlwX7pxw0nEJqk+pqvkBGgL/WrO4RkSozl
	6N0MZTZNfOpn5VREHTTKNQEz8T6FwYu7I7qTJxCoMB7+CLvY
X-Received: by 2002:a17:90b:2e8f:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-3933cb718fcmr23449061a91.9.1786931685205;
        Sun, 16 Aug 2026 18:54:45 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39339cec8c8sm4405106a91.1.2026.08.16.18.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 18:54:44 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Paul Mackerras <paulus@ozlabs.org>,
	Grant Likely <grant.likely@secretlab.ca>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: bestcomm: set bcom_eng to NULL on probe failure
Date: Sun, 16 Aug 2026 18:54:42 -0700
Message-ID: <20260817015442.136038-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Functions like bcom_task_alloc() use if (!bcom_eng) as a safety readiness
check. If the probe fails and hits this error path, subsequent or concurrent
API calls will bypass the check and dereference the freed memory.

Fixes: 9560aea4e9d1 ("[POWERPC] mpc5200: Fix null dereference if bestcomm fails to initialize")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/bestcomm/bestcomm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestcomm.c
index 432b43520ddc..ec58d2c6573f 100644
--- a/drivers/dma/bestcomm/bestcomm.c
+++ b/drivers/dma/bestcomm/bestcomm.c
@@ -445,6 +445,7 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
 	release_mem_region(res_bcom.start, sizeof(struct mpc52xx_sdma));
 error_sramclean:
 	kfree(bcom_eng);
+	bcom_eng = NULL;
 	bcom_sram_cleanup();
 error_ofput:
 	of_node_put(op->dev.of_node);
-- 
2.55.0

