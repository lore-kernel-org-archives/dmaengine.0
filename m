Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316586;
	b=G12j0rRAvEUfJKUV+1viFV8r+HPl6See3Gs9dCyklpWJZ7JVb8ZlhfCiLQsntpjYJNMH
	 /Ew+joKqxtYm8E930gUSOx8pm/lpRedXAKYDvvLMSXWuiEgLkTOL9+87/JrXoJLlOtPZD
	 iEgYhIM9yfGKXSfH60eqwskIIqoAhHS7GBWU0UYdKrvsfFDPLHaOh88FrkVMOfkrNVGyY
	 L3G9Oi+RoZT7k+FGGMzaIJVIn7qzqY8mgBiGkqWyndnh3cVsuhnsmW036SAXCvctTL4nO
	 nJ8xAedRONMBSL4wRkpxSnFaGkOX1J+WiiNye6Q0haU5qRRdN8AMM+zbyl3EXeahpZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MU3RiOGrSRHx1hu2s1LecvApwkWB3wk5pwMHBRlnI10=;
	b=trzGWg+RcvdSWu25KPl3bJoD5kFDv1qS21bVoQSODJIqnGCmW+kepKK62wYiZc8NKwkE
	 nJMEV7xaYHHb8K3xeYSoOiiTCMcsjPasBhpAtigN8w9JrgUZsQ15fgbdZo7aFJVa5VX58
	 Zug8wBqu/WK3vkJUsV7iXPpmJWjdIozTtrdn3vxke4qBqvTfgAizcx7H829ZWN1/ZHVCO
	 GgupQchDkxfG+Ieaf84g0SlBOpVxf6vGNWESUfOo3sWQ3I3Oa4F+2U4MR0v9BObyjQE1w
	 ofvhwS+PIn81V9hw1rRu87Y+qRIrac9Pljc5E7Fjojyu4LxdYMerpFcUs3fsOVuHibQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="XJHTmY/T";
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58C6606A330
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 13:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E58C6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XJHTmY/T
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so789400a12.1
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 05:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316585; x=1794921385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MU3RiOGrSRHx1hu2s1LecvApwkWB3wk5pwMHBRlnI10=;
        b=XJHTmY/TI0apXAyAu/l41Uzr9Z8Ii1KnkkP1TWQAsMPiAhLKROFgc0JtQhp+MoO7eh
         8jyZxARy3G19I5AH4NgA0NwAT+6omkEQVwOW1rI7iZsSQJLyXFWeyDFMq0oJvvteEje+
         nYD59YTPtK3GotzLQmhkWQErI3j+sL9oJ8n1I1jFad3uvFXtDuWYjOFJ0LVCqzI0QaZ7
         983eyTJP+FIdNbVAKrv7SbB+J+iEPIBBgjog/uFiHpHwPgT/C4uZ68FUb6nmvzJU/iWU
         53ovvOxScwos8EeNBygTxtVOdZNS5FayPcycKwDepAXlFYR0fAcv9ajxAWu6guTZZkgc
         egfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316585; x=1794921385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MU3RiOGrSRHx1hu2s1LecvApwkWB3wk5pwMHBRlnI10=;
        b=jYq0Apxt/l4iooROI9+TiGwevak/lc+LWQpGs03krck+3zop+Zbs/0AL/jmcZHlCgy
         KCZZR69XNqkQryvHofOUCYTzhfEAOwzasXCF+2QdZaN+r2rOIq+b9OrhPyvrUnCGWn8F
         W0Mo5D3ffPFHh/GYHm2VlW6KjLkg5Yd6V0uQCu+9uvPmjGYu2Gnftvqmv8KYZoCvb2/X
         X+fpNB/ljDW2v69UvjSPj1sH4y+sYMBGnXsK6h/QQE3uhoeQjlJzXUsWtlJ1ZckuL5TB
         D8dc7Ihf45tbrQWUHdJ09kk6IfxZihsdsCa4sFmVQbCI0KrF2awa0mL/F774/Yt0s10A
         9q2Q==
X-Forwarded-Encrypted: i=1; AL+hErFuPrB1uyQKu19xQRwczJsckwiBEKUQbdJqxc5AzorTKcUui2TzplnSBvbraqylMWY27IFs5FCRB2Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zbFGUzHBcuodSzf+o9x8coFKVHP6VOOwUHc5fnak5+97ZGl1V
	c6WMReYMaBQ0ZwFNkAOMUf/qCaLbL+Kbgyj8DoNEeW9Y+jYMTmtzUt4R
X-Gm-Gg: AYBFou0UNnSadXkVa8Ff1oUvJBLYAakOlootsqlD0006oFDXjhkv85tYkjnca0y6Avj
	GChnrqf3WLIHvCji1Uqb3t/pV5rGkeCVg3JfbRM26HpKwxYs8uDmdbXd8Ou+pKvFv6OI9HrsHzG
	nVLWK/53bbxDQX7E159WdVimSo3xf/9n9JwH4jTTSCjJkGHvFtKogYdvlknKT23uLqLtc/mKOa+
	0wTjjofy2fN3V1Eh4vjv1VhBG8DytPEaeweSnsobIIQl2zNyF29QLqwI1P/i2QtgeNer3LBD/jb
	pNu4+GNRytspyzVAlDiMpLladNTehMQr711JHl00DfX+ZVF/fZnaqXq1v2QabFaRqHhCGKpLyXz
	RqGuiAoQC163FyErBaaPCp4XnX//XH9oEQ0mWRfT54tRfaz951XXKbqijicTbhoib5Amfv/Zulb
	8nohXbGDEiXdjnl3PoeKCxEIXeuD7jSDbX4S2CeQSkEx86nnIjcSqCz0aI/AIoxDj1J+JTtnGhC
	6oUAQN0JhB1h+Fwsf/0RtUhiz2RajCPGE06EDJ0HIjPg8gXaAX2Z0ZE5E0fsUpIH2P+qjP7J0IZ
	fagQzD1RjbIBJbYKLJqcmUw3+LEfzvQ=
X-Received: by 2002:a17:90b:534c:b0:3ac:9176:e82b with SMTP id 98e67ed59e1d1-3b166ce5259mr2804698a91.54.1794316585052;
        Tue, 10 Nov 2026 05:16:25 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:24 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 12/33] dmaengine: mv_xor: convert irq tasklet to dmaengine BH
Date: Tue, 10 Nov 2026 05:13:12 -0800
Message-ID: <36805c4397b387b8323c00190aa015d5cab3feb9.1794315350.git.allen.lkml@gmail.com>
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
 drivers/dma/mv_xor.c | 14 +++++++-------
 drivers/dma/mv_xor.h |  2 --
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
index 92fb996f5b3f..41fe35b3aab0 100644
--- a/drivers/dma/mv_xor.c
+++ b/drivers/dma/mv_xor.c
@@ -327,7 +327,7 @@ static void mv_chan_slot_cleanup(struct mv_xor_chan *mv_chan)
 				 * some descriptors are still waiting
 				 * to be cleaned
 				 */
-				tasklet_schedule(&mv_chan->irq_tasklet);
+				dmaengine_schedule_bh(&mv_chan->dmachan);
 			}
 		}
 	}
@@ -336,9 +336,9 @@ static void mv_chan_slot_cleanup(struct mv_xor_chan *mv_chan)
 		mv_chan->dmachan.completed_cookie = cookie;
 }
 
-static void mv_xor_tasklet(struct tasklet_struct *t)
+static void mv_xor_tasklet(struct dma_chan *c)
 {
-	struct mv_xor_chan *chan = from_tasklet(chan, t, irq_tasklet);
+	struct mv_xor_chan *chan = to_mv_xor_chan(c);
 
 	spin_lock(&chan->lock);
 	mv_chan_slot_cleanup(chan);
@@ -372,7 +372,7 @@ mv_chan_alloc_slot(struct mv_xor_chan *mv_chan)
 	spin_unlock_bh(&mv_chan->lock);
 
 	/* try to free some slots if the allocation fails */
-	tasklet_schedule(&mv_chan->irq_tasklet);
+	dmaengine_schedule_bh(&mv_chan->dmachan);
 
 	return NULL;
 }
@@ -742,7 +742,7 @@ static irqreturn_t mv_xor_interrupt_handler(int irq, void *data)
 	if (intr_cause & XOR_INTR_ERRORS)
 		mv_chan_err_interrupt_handler(chan, intr_cause);
 
-	tasklet_schedule(&chan->irq_tasklet);
+	dmaengine_schedule_bh(&chan->dmachan);
 
 	mv_chan_clear_eoc_cause(chan);
 
@@ -1112,7 +1112,7 @@ mv_xor_channel_add(struct mv_xor_device *xordev,
 
 	mv_chan->mmr_base = xordev->xor_base;
 	mv_chan->mmr_high_base = xordev->xor_high_base;
-	tasklet_setup(&mv_chan->irq_tasklet, mv_xor_tasklet);
+	dmaengine_init_bh(&mv_chan->dmachan, mv_xor_tasklet);
 
 	/* clear errors before enabling interrupts */
 	mv_chan_clear_err_status(mv_chan);
@@ -1167,7 +1167,7 @@ mv_xor_channel_add(struct mv_xor_device *xordev,
 
 err_free_irq:
 	free_irq(mv_chan->irq, mv_chan);
-	tasklet_kill(&mv_chan->irq_tasklet);
+	dmaengine_kill_bh(&mv_chan->dmachan);
 err_free_dma:
 	dma_free_wc(&pdev->dev, MV_XOR_POOL_SIZE,
 			  mv_chan->dma_desc_pool_virt, mv_chan->dma_desc_pool);
diff --git a/drivers/dma/mv_xor.h b/drivers/dma/mv_xor.h
index c87cefd38a07..27774abe34a6 100644
--- a/drivers/dma/mv_xor.h
+++ b/drivers/dma/mv_xor.h
@@ -98,7 +98,6 @@ struct mv_xor_device {
  * @device: parent device
  * @common: common dmaengine channel object members
  * @slots_allocated: records the actual size of the descriptor slot pool
- * @irq_tasklet: bottom half where mv_xor_slot_cleanup runs
  * @op_in_desc: new mode of driver, each op is written to descriptor.
  */
 struct mv_xor_chan {
@@ -118,7 +117,6 @@ struct mv_xor_chan {
 	struct dma_device	dmadev;
 	struct dma_chan		dmachan;
 	int			slots_allocated;
-	struct tasklet_struct	irq_tasklet;
 	int                     op_in_desc;
 	char			dummy_src[MV_XOR_MIN_BYTE_COUNT];
 	char			dummy_dst[MV_XOR_MIN_BYTE_COUNT];
-- 
2.43.0

