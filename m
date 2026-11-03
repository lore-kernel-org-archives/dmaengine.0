Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793734691;
	b=m3COhQfZali2e6ZebLvC5skJjnczrzDtwGUHbXhd/IEtz46b2DpVDfrAVGorQ2IelSVM
	 l55/4M81kOIujSzkW3uJegrX/c2Aci2KW7kILUfQXEVURT6HRH8Tyn5pOlhDO9bLe6CYW
	 NxTTRAURj6Us8zLv6czkWOSWFIGid1I5J6LY6neUoCg2nWhi0YmXxkNn4BthcAp7H9Xw+
	 cfhAdYYIlnjvNT0PX97bhTjS7/XR4gHeYpugqELdCpbrdOBTyGjwY2tXYQV8TkYnclSh+
	 elaTo5GagAioLgg9Rr8JwVFW9raVswhjvFlNS9T50ORLxVAqDPxmO9E/W+urTri992Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=NWn56ujqJNytV1vPtoqL3CvdGqy200m0NoH7JljBi/k=;
	b=MPFJpDHv4gsMysmgBK+cemDQTtHUcNpMzODpIMPrrwl9mGdqasDv2vEdJTr1RiM7HqJs
	 0hrLj1RfaXdUvAMhH3F0Fp5+1lniInirktzyZ3PwZpQ19iUCD1JNY+j+9kVC+T4FOjZzX
	 fCtNfQ0XKhgv0S9aLiHDHcUTddbkAjxVw29fQH2bcHQtPKO55npxiJE2yMYhLOX+BjQrK
	 reKjxO59akAdww8rih7wrlkY/39mPqsiEggl84MtzsTgu+xLRCqSUA5YpII/SOttNDD/3
	 7HxJFFxjJobRc68Zbvtd2bVaQy3zJx3W/9QGceJuf0Bb4WAH/WmISqD0Yrxtee8KaCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pOPsALAh;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F9E606A336
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 19:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39F9E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pOPsALAh
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so29229855e9.3
        for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 11:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793734690; x=1794339490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NWn56ujqJNytV1vPtoqL3CvdGqy200m0NoH7JljBi/k=;
        b=pOPsALAhm9jkkyGAFY5NGarqG2OF44tDjpDFElBHy9wA3fNmrymkDIxuqrOl3BE3oo
         fCld77gct4VQwVy+Gph4HBex+k9dsndFcjGShF+ekEQcGHVJEnW1Xdpr3Qjkno3x28Aq
         FKgFa1+G2Ht7z6Mgl+mdBNPkw6p2X/fUQB/rdARfZd4A9QkLk4TsVchYZ7FQ+YaVKxxb
         ENdrj7Vsjd3ScoH2IZ3TNEhhstxeu72xuSE958q9C1kI//83JSbD7AI4ehaAuHC2sbXw
         0rUYEWBNGB2b3zLmSPIGEPI7JKMfi6bcbxf9zmfvxrFJDZRlH0kpmvrNTSywnclD3ztE
         lzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793734690; x=1794339490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NWn56ujqJNytV1vPtoqL3CvdGqy200m0NoH7JljBi/k=;
        b=R+3uWz2X1mQhtJlFJY4wW/Nq2hyV5YBzneP3BL7nh5YwoPqdAr0fd8vIalAotwWkc+
         pkLQLbmxeT8/mr3M7/26QVTSZQbYLCtNp6DPMTHHCO0CcXhO+K+4hcFpvc0QZKr7Sw9Y
         tWTe3oPzifNhhUApbo4FgmOoAGdqEKIlSTUQElJoZm5Awl0h+Ck97+7gNT2GEVCLp+RO
         tuT/PzRJIri/GmlMbj7vGPh9OUeQpIVyy1UjmgSR1w2dwrg/gu2x5yr4b3sqD03wyhEF
         hEAD7pWgdcG6scHFjOJkwSdZEajJuVAkjkYmRVJj2QUjjHwfMxj8VrqtB1kmX1uEROUU
         XNGw==
X-Gm-Message-State: APuU4Z+YsS8SdpXryiJlFJcMriuBL8plCjvcUAoZspJLARFupkXWqHp1
	7oA01WpznYsqnth1A+CbvTwui+RvUFWT5ttbo/VB20D6Fs/0Orr1AMcrNCmwnrrfFD8=
X-Gm-Gg: AYBFou1DQUYxEcf7lMudz/t6NGnd7Wn97hGqLXhCW9lEXCSGjUesIKkC1wZhd5TP5Bf
	ZCP9VWgf+w9rNlO2t1AkwnnCW5j+lQOIzu1yaJwjjr9YKuau4aHwd7GC+A+My/hTji0UVgF1VyB
	Q5zxfjZXE1h0YzamKZXwi/S/asSUt1w+CEddMlaTsKkVl6gYbEy/B0fxb+agVMnaInDHZTw01Gs
	nv73aWmORhhnIhhKuPnlb9bjMM0jkoNPDhNT9cT6EM/utPtATDgaFStVIFgt6khZz0jbupjH85F
	vlUFYAq7c3ApmWSPBdZIcaT5JP6HZi4xJj4JrT5Kd7/AuMEaLU7MMl31pOOhVFS0ZKmLDxOQBqs
	zvmxDL3GEHCFwy99+ucGtUSyHYWcJOSQqwMGy0+Ez1Q9vV1nZaRwqDowgCvsK9D5zJHCyuLNFSV
	S46nivmhipTuFR74U0FoHmK9HPFhHSfQYBQTDwl/BF3545KezKch+qMoF723QqrvqSobg9H518X
	pVsDmgzDzxxzkoV5gBdHFIU47MUE7nJ0JPmExT88HGEmkOaiwF7owADFXDc16pZVKv5fJJdROsV
	IBLXA/sYqEmE5foIXPOMsW3Uuw==
X-Received: by 2002:a05:600c:5249:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4ac1228b5bfmr320484655e9.0.1793734689818;
        Tue, 03 Nov 2026 11:38:09 -0800 (PST)
Received: from localhost ([2001:4090:a244:81d0:2c16:1c4d:8a04:e0bf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebdbsm88269195e9.3.2026.11.03.11.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:38:09 -0800 (PST)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 03 Nov 2026 20:37:29 +0100
Subject: [PATCH 2/4] dmaengine: ti: cppi41: Fix register access in
 suspend_late
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
Message-Id: <20261103-v7-3-topic-am335lpm-cppi41-v1-2-d7213446c5f5@baylibre.com>
References: <20261103-v7-3-topic-am335lpm-cppi41-v1-0-d7213446c5f5@baylibre.com>
In-Reply-To: <20261103-v7-3-topic-am335lpm-cppi41-v1-0-d7213446c5f5@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Daniel Mack <zonque@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Julien Panis <jpanis@baylibre.com>, "Mendez, Judith" <jm@ti.com>, 
 "Francis, Sebin" <sebin.francis@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>, stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2344; i=msp@baylibre.com;
 h=from:subject:message-id; bh=lXiRL/4EGMomZ+sZe31WR8MZI18NdjhygEMgW/x7zpM=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqxXFvwTW/VP1Fd4LtTT6LlT6KO8YWJuuhuD2p5OfpNJ3
 lZT7jp2lLIwiHExyIopsnQmhqb9l995LHnRss0wc1iZQIYwcHEKwEQKvzEyvIqxnuv47/Dz1Hz+
 gq+3e5+ffuU++ZVen4kIQ8q2acLLljAyTL6j8ujp/PlLm6qEV+x+uH51THjW49/eaYqlgZb7pj4
 05QQA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

cppi41_suspend() and cppi41_resume() access registers. However the
device may be runtime suspended in which case it is not allowed to
access the registers.

On suspend do not run disable_sched() when it is runtime suspended. This
avoids accessing the registers and crashing the kernel during suspend.

Resume when runtime suspended is delayed until cppi41_runtime_resume()
is called using the variable ctx_lost. This keeps any access while the
device is runtime suspended.

Fixes: fdea2d09b997 ("dmaengine: cppi41: Add basic PM runtime support")
Cc: stable@vger.kernel.org
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 drivers/dma/ti/cppi41.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ti/cppi41.c b/drivers/dma/ti/cppi41.c
index 458d20b12462..f5a824418fe7 100644
--- a/drivers/dma/ti/cppi41.c
+++ b/drivers/dma/ti/cppi41.c
@@ -146,6 +146,9 @@ struct cppi41_dd {
 	struct list_head pending;	/* Pending queued transfers */
 	spinlock_t lock;		/* Lock for pending list */
 
+	/* Register context may have been lost during system suspend */
+	bool ctx_lost;
+
 	bool is_suspended;
 };
 
@@ -1171,7 +1174,10 @@ static int __maybe_unused cppi41_suspend(struct device *dev)
 {
 	struct cppi41_dd *cdd = dev_get_drvdata(dev);
 
-	disable_sched(cdd);
+	if (!pm_runtime_status_suspended(dev))
+		disable_sched(cdd);
+
+	cdd->ctx_lost = true;
 
 	return 0;
 }
@@ -1182,6 +1188,9 @@ static int __maybe_unused cppi41_resume(struct device *dev)
 	struct cppi41_channel *c;
 	int i;
 
+	if (pm_runtime_status_suspended(dev))
+		return 0;
+
 	for (i = 0; i < DESCS_AREAS; i++)
 		cppi_writel(cdd->descs_phys, cdd->qmgr_mem + QMGR_MEMBASE(i));
 
@@ -1196,6 +1205,8 @@ static int __maybe_unused cppi41_resume(struct device *dev)
 	cppi_writel(QMGR_SCRATCH_SIZE, cdd->qmgr_mem + QMGR_LRAM_SIZE);
 	cppi_writel(0, cdd->qmgr_mem + QMGR_LRAM1_BASE);
 
+	cdd->ctx_lost = false;
+
 	return 0;
 }
 
@@ -1217,6 +1228,9 @@ static int __maybe_unused cppi41_runtime_resume(struct device *dev)
 	struct cppi41_dd *cdd = dev_get_drvdata(dev);
 	unsigned long flags;
 
+	if (cdd->ctx_lost)
+		cppi41_resume(dev);
+
 	spin_lock_irqsave(&cdd->lock, flags);
 	cdd->is_suspended = false;
 	cppi41_run_queue(cdd);

-- 
2.55.0

