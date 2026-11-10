Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316652;
	b=u5qI/ZxMrc3uh2xsBdoQoR/Fv/vebl3aAmhU0jJh5RwD9YdQpRx5UK3H9MXH+1Y91ctk
	 YvA94eOiSVuJ4ksaPnNsdsLDohqQmRtnqs+rZ0l+ZvA+LBNQZ5jJYw4rEj7hl53oPA2qm
	 Y+kd410C6XD/qq4AKVu05k4Kc3/HfgYbdYPtaxP8JFe1hlGIoVOsr5e6+H5sEmiftGO84
	 EoJWyLczwKSz5L8FzXLGrNhWfNb45V0ezzVExNwvwZa0VUk/F7nwrDDQVF2ohqIQng17T
	 p1bmO9/EBktOzXhcZVPr3rVvOiqulZp6VCmiinCIIH4warFVDkAcRWog4rchB1tY5pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=By/i7sgcs2TsgsHSYJ6msNCbQEDAMlEmmU84bw7WV0o=;
	b=UO0rzPBHwhfBXiszBA4fBKcmSumim5GvkkNCz9UYqDeNmJUTUjxfDOuZoG3Q3wMTy8qw
	 1ymNVyfHPpa7N7klsuP/xlJPaTtCwrxPr0HmAOr+f8lx7TJUfmbxkbxe/UlR5VaXz8vch
	 h+LBzxJjZPPmkdUayq6PelSD640+idRPX7HGd9kvjqQCDBKClP3GcB6O+Cmp9F4iB9aBh
	 1eZ7sxjMLuRp+GrmnU+fu3WeKQ5n1PAf9nKZgxgIrSUCJO3IXCPMWmrOyfbTdG+mWGpL6
	 B3U6zFJtF0JPV0ncwp/Tea9qwUAime6oetooWlWnYBoea71aJRdkj4wv26Qf6mHbObg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hwqZ+l7P;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4526E6072A11
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 13:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4526E6072A11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hwqZ+l7P
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdb9d5c1c8eso999762a12.0
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 05:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316651; x=1794921451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=By/i7sgcs2TsgsHSYJ6msNCbQEDAMlEmmU84bw7WV0o=;
        b=hwqZ+l7Ps+KRYUGIvP07EumEH2t42cEuZ/4Sqch3YflI2QnBexnmBFTxioaM2IPW9Z
         0FIeg8IctMBQm+pDLaHrEjl218GqSmEfRQIMnlWEMLrB5/A0+iXR+YK4xqVKiY5POVjT
         FDG6xBNKaEN90oUvA2We854jVaTt9SJNxEenG8gxVShYMYgkvdemDMqD+WDjUGIIdXJq
         6MWabFFizpwUQf8qIqT1hXuGmkMOes0m82ft4vZDYC7/doPc1he44EX6xMhR7rB1Hj81
         t2cEc9jJkOjyX+hNBGOBrqHEs7qfmoHYgmSTpydLQIiFh2FeJO3NMjswyZJG0VQ8pkBD
         jpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316651; x=1794921451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=By/i7sgcs2TsgsHSYJ6msNCbQEDAMlEmmU84bw7WV0o=;
        b=oMJgwyWZSXcsK9ge+2x89uFo8jjpdoxF2lU4svFXWuqXmveCN4yoxPcHPKW0G8kfJq
         +7pGksZFgupQ8F52Po6J5BcHy9NaAJxhEFAOQuVHuQHxxy4D6rUI8O4Fry9EZWkHZePF
         GAUVvLOZHc/q2ez/REs1vvzaY+AaxAG+zhVZfCtSYxnTkO8PjE5eZRfAedOyacB1+DDy
         QBQEWycLwNbGmB+UyfNsuIfjebyZmS3UoNVSzmY0D578yfkXNhMnOcFoXE8FjWH4z7u/
         69C/Lh2yv9HkabEwaujujs7xFbebz7dvdnXtdE/covACe8C9WexpClcdbr9bdzy5qH7/
         zMIw==
X-Forwarded-Encrypted: i=1; AL+hErFQY3x1mded9yM5Js9CMDcwiFk2cI4WNBQSQiZTWqB5N0A2hDXjbKaOsDu+br0ryKIf3dzIBNwj/QA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Zc36up8P2Ig/h8/ry8q4JH8Gb27r1eyhua9b/2pdzWJ3kSfI3
	UZz77AEmDr7rGERUGZEZR0IdVJK22jrJiafN3rz5S0PNc60oDDxHhxk/
X-Gm-Gg: AYBFou388lIX9HEiKtaRRSUzJ7kT2cBoSv24iIbnFMwZelVPGBpAfG4lCDL60mELGsp
	32354VRbWM2GI3mU8l0JhkvwEEklefHzTCnAhN+87Dx4i7S/2s1y5lK/GSlo610dAbPi12ynZKf
	5eVqJ4O3w/6Vbc/CeAb8Iu+acz2SgUA/AJ92IhCpyjnmNzwco3ldoZSooOzybNydu3GRDWs3tUn
	/N0/fFDDNobLc9ZJRJ7gGB+CaqjpONRIQ16+08wTBYpMT1kpq/0rYZCWEael4Z1SaMcgONX5ZTt
	qvPX0h8k13Gb6unOacwvi4IY0qXVPCjH/5kpogvJhfwpsMTD/uA2hwaN9zN2IyCP+24iQU7uLuO
	WznY2xk4TrnXrWy3gbXxa22BJmPdxcbxza7bdItwXgJEOH2LTXzLO6qfi4yh3JZOVmMCTmYVa2u
	GlCm43bQ8VGWb9qpe8TtPKgwptR+37JatzimQvTPbgi9hMIvcieAkvVtdj/9uvPJjOzk92+TA7s
	FtVtQJ/ViL6QW6PN+rUfmEu7mO0wZxyA35XVNUjeHhxC4Vbc/LcgfRgzqW/QjHlJjsLXdw30foH
	PTkZ2Eo1zd/2AmkzAesKT8Gwtx/kG+5S
X-Received: by 2002:a17:90a:e7c8:b0:3ac:da41:ef7e with SMTP id 98e67ed59e1d1-3b166d1a008mr2747340a91.52.1794316650614;
        Tue, 10 Nov 2026 05:17:30 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:30 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sinan Kaya <okaya@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 31/33] dmaengine: hidma: defer callbacks via channel BH
Date: Tue, 10 Nov 2026 05:13:31 -0800
Message-ID: <1654bf0a77be77ccf3a2775a838d1accf604ac4e.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
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

Move descriptor callback processing out of the low-level completion
path and schedule it through per-channel BH work.

Since callbacks no longer run synchronously from hidma_callback(), drain
the BH wherever the driver previously relied on that ordering: provide a
device_synchronize() callback so dmaengine_terminate_sync() waits for
deferred callbacks, drain the BH in hidma_free_chan_resources() before
the descriptors are freed, and drain it in hidma_remove() before
hidma_ll_uninit() tears down the TRE pool that the completion path
reads. Kill the low-level completion tasklet before that drain, since
it is what schedules the BH.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/qcom/hidma.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index 85844965f0d8..2cde0cd08b1f 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -155,6 +155,13 @@ static void hidma_process_completed(struct hidma_chan *mchan)
 	}
 }
 
+static void hidma_chan_bh(struct dma_chan *chan)
+{
+	struct hidma_chan *mchan = to_hidma_chan(chan);
+
+	hidma_process_completed(mchan);
+}
+
 /*
  * Called once for each submitted descriptor.
  * PM is locked once for each descriptor that is currently
@@ -181,7 +188,7 @@ static void hidma_callback(void *data)
 	}
 	spin_unlock_irqrestore(&mchan->lock, irqflags);
 
-	hidma_process_completed(mchan);
+	dmaengine_schedule_bh(&mchan->chan);
 
 	if (queued) {
 		pm_runtime_mark_last_busy(dmadev->ddev.dev);
@@ -203,6 +210,7 @@ static int hidma_chan_init(struct hidma_dev *dmadev, u32 dma_sig)
 	mchan->dmadev = dmadev;
 	mchan->chan.device = ddev;
 	dma_cookie_init(&mchan->chan);
+	dmaengine_init_bh(&mchan->chan, hidma_chan_bh);
 
 	INIT_LIST_HEAD(&mchan->free);
 	INIT_LIST_HEAD(&mchan->prepared);
@@ -529,6 +537,11 @@ static int hidma_terminate_all(struct dma_chan *chan)
 	return rc;
 }
 
+static void hidma_synchronize(struct dma_chan *dmach)
+{
+	dmaengine_kill_bh(dmach);
+}
+
 static void hidma_free_chan_resources(struct dma_chan *dmach)
 {
 	struct hidma_chan *mchan = to_hidma_chan(dmach);
@@ -540,6 +553,9 @@ static void hidma_free_chan_resources(struct dma_chan *dmach)
 	/* terminate running transactions and free descriptors */
 	hidma_terminate_channel(dmach);
 
+	/* drain completion work before the descriptors go away */
+	dmaengine_kill_bh(dmach);
+
 	spin_lock_irqsave(&mchan->lock, irqflags);
 
 	/* Move data */
@@ -813,6 +829,7 @@ static int hidma_probe(struct platform_device *pdev)
 	dmadev->ddev.device_pause = hidma_pause;
 	dmadev->ddev.device_resume = hidma_resume;
 	dmadev->ddev.device_terminate_all = hidma_terminate_all;
+	dmadev->ddev.device_synchronize = hidma_synchronize;
 	dmadev->ddev.copy_align = 8;
 
 	/*
@@ -913,6 +930,7 @@ static void hidma_shutdown(struct platform_device *pdev)
 static void hidma_remove(struct platform_device *pdev)
 {
 	struct hidma_dev *dmadev = platform_get_drvdata(pdev);
+	struct dma_chan *chan;
 
 	pm_runtime_get_sync(dmadev->ddev.dev);
 	dma_async_device_unregister(&dmadev->ddev);
@@ -922,6 +940,10 @@ static void hidma_remove(struct platform_device *pdev)
 		hidma_free_msis(dmadev);
 
 	tasklet_kill(&dmadev->task);
+	/* the low-level completion tasklet schedules the channel BH */
+	tasklet_kill(&dmadev->lldev->task);
+	list_for_each_entry(chan, &dmadev->ddev.channels, device_node)
+		dmaengine_kill_bh(chan);
 	hidma_sysfs_uninit(dmadev);
 	hidma_debug_uninit(dmadev);
 	hidma_ll_uninit(dmadev->lldev);
-- 
2.43.0

