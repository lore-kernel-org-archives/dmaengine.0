Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316557;
	b=klnkwQ61frV0LJKX1fqRjuCNe4l2GvupT5wnZ2ucZqEEs557/O8n/CpeEf+H59XYkfbU
	 pvdOxduoCBcxpQJKxWBH32tUFIK5S/bz6vsBEDzxBn3tUAAJgnvVPKonHBVjR5cCfHvWb
	 TCugHw+cL8ItFF5ViQzO6C5I3YTvE9EMIUW7pCKXgZilRXjBvU4KZKQoX8CHwXZTP6jH+
	 tJsHteRk+6cIQfWRyQJU3LZMj6XkbyFHperZ7xZsudFrsJIYQS8AgeRh0sV/nHMCy7GbB
	 yrjLjX5sm3mEF2QyqAJIBB5+Plq0sc9zq7geExmTqqvORT9+1WjBJTaFlVigsxUxifA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5J6MwDWOHWjl7QywHmcoK9CGF6kb9+LR3zZN5cslCcw=;
	b=xso0vh1B0GWChrGYkXqOx7QjLTFlLLTTYpxkzQQSCb+hWMCs23fBGTXxNBkSSWTmLoXT
	 X72lsHKNKkpkwtxQrl3Ys+9Fg1lO7m/dOtQJOxTs6YDI7pgKJHoLA4xsgbfz6j+8drJjE
	 Nl6exh8LlEoBOFwKuN1TeI1Qjz5uFCmVpMqmwUIxcF2aOFCBe+3BiJa73WLUhJvh86lz3
	 46XB5/q9ZCZjOk0KhDIHRzbuIrJkHTkX1mEgEJagJOJ6p5JO2V8M7LDpstoDE5gf+eXEE
	 gxhkoDmJSdQFX2db4CBm0hlEck19UJhwnGhq/EZhMUKEm7ui1ip9Q3CkGBTIgIvx+rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mGWDsgvk;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CA760A2623
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 13:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34CA760A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mGWDsgvk
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b094e649d3so1241099a91.0
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 05:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316556; x=1794921356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5J6MwDWOHWjl7QywHmcoK9CGF6kb9+LR3zZN5cslCcw=;
        b=mGWDsgvkZ9BVtWthrqf+GCKg5Iom3nAsBmf513svhEgHMn9quedRdd3D3FvNbQ669P
         SOWpYfDpsOeQ0JgMiX7Z5ZDwyF1Ll8S23SS4OKDJ8lAWcSagdR0S6ieEMxS3mDioSLX/
         xyMTorN4v4zIfGb2rRIRW4lTLDj4oXnaYNN57e597vzv+mt2dEZWNFlA4a6MfkppHXYh
         mHX5W7+MbCT5uGGe4zDwMhRE7XJK/vIAQOvqDkV6My873jPIjeiIdSJkMVQjokCAaoKt
         FR+VndYcyQmIt3VytEJEmb65RI1MZSL0E2oucAOAwUR2dEY27WY3UCfOSyDUgSD/l/pf
         KPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316556; x=1794921356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5J6MwDWOHWjl7QywHmcoK9CGF6kb9+LR3zZN5cslCcw=;
        b=BVUwjLHsZe/YUt8dby8jV9WkUCgSi556dL7/h6QDPptMjogMQ0eQgpH1iMI17A6UnX
         eBaTnqDmmRePfCE9nRCwmyreuHCK2NDSmiBTlZz6RyF3nmEZgvr8ewXqFFeJ9weaXjFy
         E5manKV+CUV1/yq2d9wnlqIkcNB4bwPnuCGwPeMrkFx9UQ3QhLLeQ3I1ksjdJmmPGlLM
         mwWqSUPiJzUyJ7oCopAPH5DPcfoRhmQXWlZKej+rm3VJISywegjs1esRk12pHS7RJZ0J
         XFDbX/RJlnG4oakTZmdZERGn+AqR3dEUIgl2CXxuQE0p8jH/jkQ7QM19+O6K77S0cRBa
         H5KQ==
X-Forwarded-Encrypted: i=1; AL+hErGeASjNxyIuojBaKlA4DvNfzkrDe15hQW7XuO1/UCeDqXcBKpDS867hgXPCl+34UAg/FoXvN4DjAqw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jx2R7Lru99BswTszWKkum18xrqOujMYqcwNg3FkseOlGPVE26
	8RyfA1eh51hABFQyIgSJdYZvVLc1YVGLOK9APP8ofPlrh1Z68yLz+kkG
X-Gm-Gg: AYBFou2nE/mIO0n8L0JjRBzSRRDMDoY/eOaPzCYU3DBt1t/iYXTHTXBF3RfgJ8Va9LL
	TZD9NpFb/UM/vufXl3/TcDaI0Z7c+MBEd6UX+9MIT03j9Cyyv3uVpmE8syee14XC7arXip3NK8N
	fq1AwmINLQFU62c4fY+nLyde5yHIyTsEboDxhw23c7gj1dr9w38RaufWZUWl/khscdk7IceGNHP
	smpW5tnmQjXprX4tIMd5/BzzzFTWCWznGyDB2itBIhGgOMQlRTn9fpIazpJHEZtZGl54dPjeXAK
	6HtozjovC3mtCVEHFQIM9DND3HrefYYHML20lmNzQRqXNtlY23VWIz5GBB7FekiccVqTeywN2Nr
	4QdVbrYcIW60pXh4KfzoQMnocO+eoaaMcLshQuLqahPdNuqlitySlnyaGdl1+pcJ5+XGVmXquRq
	XqsTvupgbevM82lrtjUi6Z11YqQ7uZMD2mW8vrFN/7OYdZP0PdpGZp10vV1URiEBMDzwC5Zzi4/
	AMvcmFxxtsu6LKE4TL0MXuyzqpEGpm5w/a7O7HXUNdkJwHDL37cyT36kjcYZ5MPsqxBjlMbTvmt
	AHz+EP5ufMEDiQfxdqlHvjo0vEBPk+A=
X-Received: by 2002:a17:90b:4484:b0:3ab:2d46:1dd6 with SMTP id 98e67ed59e1d1-3b166ad1edamr2975506a91.4.1794316556474;
        Tue, 10 Nov 2026 05:15:56 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:15:56 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Wei <zw@zh-kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 06/33] dmaengine: fsldma: migrate tasklet to dmaengine BH
Date: Tue, 10 Nov 2026 05:13:06 -0800
Message-ID: <351fd16a4ad121e2f2a423898480b449c5778480.1794315350.git.allen.lkml@gmail.com>
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

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/fsldma.c | 12 ++++++------
 drivers/dma/fsldma.h |  1 -
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 99a878ed1444..f069d1bbff17 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -970,18 +970,18 @@ static irqreturn_t fsldma_chan_irq(int irq, void *data)
 		chan_err(chan, "irq: unhandled sr 0x%08x\n", stat);
 
 	/*
-	 * Schedule the tasklet to handle all cleanup of the current
+	 * Queue the BH worker to handle all cleanup of the current
 	 * transaction. It will start a new transaction if there is
 	 * one pending.
 	 */
-	tasklet_schedule(&chan->tasklet);
+	dmaengine_schedule_bh(&chan->common);
 	chan_dbg(chan, "irq: Exit\n");
 	return IRQ_HANDLED;
 }
 
-static void dma_do_tasklet(struct tasklet_struct *t)
+static void dma_do_tasklet(struct dma_chan *c)
 {
-	struct fsldma_chan *chan = from_tasklet(chan, t, tasklet);
+	struct fsldma_chan *chan = to_fsl_chan(c);
 
 	chan_dbg(chan, "tasklet entry\n");
 
@@ -1154,7 +1154,7 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 	}
 
 	fdev->chan[chan->id] = chan;
-	tasklet_setup(&chan->tasklet, dma_do_tasklet);
+	dmaengine_init_bh(&chan->common, dma_do_tasklet);
 	snprintf(chan->name, sizeof(chan->name), "chan%d", chan->id);
 
 	/* Initialize the channel */
@@ -1207,7 +1207,7 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 
 static void fsl_dma_chan_remove(struct fsldma_chan *chan)
 {
-	tasklet_kill(&chan->tasklet);
+	dmaengine_kill_bh(&chan->common);
 	irq_dispose_mapping(chan->irq);
 	list_del(&chan->common.device_node);
 	iounmap(chan->regs);
diff --git a/drivers/dma/fsldma.h b/drivers/dma/fsldma.h
index d7b7a3138b85..cab33d010d51 100644
--- a/drivers/dma/fsldma.h
+++ b/drivers/dma/fsldma.h
@@ -173,7 +173,6 @@ struct fsldma_chan {
 	struct device *dev;		/* Channel device */
 	int irq;			/* Channel IRQ */
 	int id;				/* Raw id of this channel */
-	struct tasklet_struct tasklet;
 	u32 feature;
 	bool idle;			/* DMA controller is idle */
 #ifdef CONFIG_PM
-- 
2.43.0

