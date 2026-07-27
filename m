Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8260342B329
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184313; cv=none; b=SrJFNkbYeucGWs6uRO0yewXR3+gkJA7uFjlfY1rIjZWfNgZZzRgBMlhRAx5nj72Fp9eq9Eno6xWX1MWPffpk08Zwp1NYyxQrVLuJa1bKN/h53Gau9i+y8F+eEKn47zCvDjZ0s1QBjVetTqmK/W4Z2okBLqUOU3rDWIDZ/qNQdHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184313; c=relaxed/simple;
	bh=duDM4l4STmzwZUivRMYvIgSVP2fYUl7eykzlBZJQdJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QUFFDdm91NtMYFgTF7gn9uFo+03sP6f2UBC8NqMPYikrh92h6cX2ny2PgQ3vOT3q8viUymUS0oINjEIGNZL5yz78VHya+Nw6YVIc9rxQJMqB6fI3QGc+aKlgrvSLYR324XsYYwgCsA4XBWH+YVbU8BV/K+2NyRBUcVIh2VuMSzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qMEx1blT; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qMEx1blT"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso29142615ad.3
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184311; x=1785789111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PewZc442YOBRpzHHh++ihf4kR0KJ2eroXSNN0Y1Eb/I=;
        b=qMEx1blTLAPae/FAKIT1Iq2e03Wg/2I/cHJ5poQnIeo1uXHtbGYFLSAIIwmGGh6Wg0
         UaWOMlcJ7B233Wdy83zZBOImgoEAMT4KsGdoa5mpQksjQbVS2XQPv5TqX5R5+deEYSdj
         LcBM6eWv8tJjhTPVGYJtYfHLcXUg4jGTdqoZyqW9TYFMbdETVKW80+KUMF2uQC6RtLtA
         I3NoDKBTf+eHGx/nj01dK5QSCxAaCc3ldi53DdUJej1oLXAxs/+oFTB9rGmgnRvlUlLB
         OKAlyxMfEeW+0US2IiL3pnAVBPVrdDe2DGmPFRfrYY6uALUOICbAfpwwJzGdat3MafAN
         6VQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184311; x=1785789111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PewZc442YOBRpzHHh++ihf4kR0KJ2eroXSNN0Y1Eb/I=;
        b=G1SQk/Qsn9cjpWarMRKRsItaqJh7kyvtzvUvUOczEIULkxqWxTzbN6TNYtexpV9sjB
         g/F3ao4JbuhH2tjRFioYyzoRtiJvIXkeABU9vwOchyeyHgW1FfI9nGFNdRToK40qILv/
         NPgfOevQQ3wY/C9fRPOFIm267tHcKvvNyWm3wXGCWLS95OjBri72TGRRYOHFRIH9aocz
         ctGzEmDA4Z2qxAYGvYfb+wxOJHIWtuVfNI3KBR9ulgPdzYclDcX09/Du0vWEdvamzs+c
         efkim7rIOe68l9hCwAPHSAuZw3l44r7ax5vTFvcjAUfjiq4CwZImxjxK3rvRrGDM6N0f
         BuBw==
X-Forwarded-Encrypted: i=1; AHgh+Rpj/5Dk5b7m+Z6KmdFMKdw2/1Yw9I8wf9M7nTYlPsNeTTSa/yQCfc/w9pmYSul8R+t37OSYsLSaUUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDRYBia2KZi76b4iamr+scZcrhpwZrIgxnuvwWoaEfpqsAB6MO
	8RlV63fKKRQn7av7+zrbEuBXmkGW9slVgDxmZfJyCwG9Yl6BkdE/UdgF
X-Gm-Gg: AR+sD13Ib2ztzxNHyLAGhCuDk5Lml2UM6xh73mE92of//VI6wM/iqKqUhHCIY3rD3+i
	v2VL4uR6gDvrICSKh5xPJDmxrbfF8wpO3EwQQzM5T3+Hpz3mnSyjlrPP5QilDMX9FkXyIHc9MSr
	lrFqgwhb2eWZ+xCpRCVKcEu48+Nol/QkdCvDM8p6qmhNuxNYZbikvoT0fRCRUx1kdIeYN0GLt8b
	VSTJSjLS0b4fGcIeBSIL3NyXJ/9brTkKvkSUEDGZ238CG/cYN9MRPNOLsC8qkODNxczRy+uKQUy
	ERN8MYhAdMzE8JAjgeM4AKu0ips6Fhd4r8UpqjgpuBVeSVMJAoCXN7FfUClnlsiU9TOJyOa7ll6
	zOX20l3UDT3NtaGMcsSDR0jZWHZirQUkcV14ngP6nDLcNAhpHr96fQIE2SzP7NALOYlH995Yp8U
	5Zg/HZ
X-Received: by 2002:a17:903:440c:b0:2ca:ce92:6e44 with SMTP id d9443c01a7336-2cfde687ed5mr95686095ad.8.1785184310625;
        Mon, 27 Jul 2026 13:31:50 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:31:47 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v2 12/64] dmaengine: mv_xor: convert irq tasklet to dma_chan BH
Date: Mon, 27 Jul 2026 13:28:40 -0700
Message-ID: <f558c55dfee41aa28bf47f32c15e7c56be003c39.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the per-channel tasklet with the shared dma_chan BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/mv_xor.c | 12 ++++++------
 drivers/dma/mv_xor.h |  2 --
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
index 25ed61f1b089..3a70d565e1ef 100644
--- a/drivers/dma/mv_xor.c
+++ b/drivers/dma/mv_xor.c
@@ -327,7 +327,7 @@ static void mv_chan_slot_cleanup(struct mv_xor_chan *mv_chan)
 				 * some descriptors are still waiting
 				 * to be cleaned
 				 */
-				tasklet_schedule(&mv_chan->irq_tasklet);
+				dma_chan_schedule_bh(&mv_chan->dmachan);
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
+	dma_chan_schedule_bh(&mv_chan->dmachan);
 
 	return NULL;
 }
@@ -737,7 +737,7 @@ static irqreturn_t mv_xor_interrupt_handler(int irq, void *data)
 	if (intr_cause & XOR_INTR_ERRORS)
 		mv_chan_err_interrupt_handler(chan, intr_cause);
 
-	tasklet_schedule(&chan->irq_tasklet);
+	dma_chan_schedule_bh(&chan->dmachan);
 
 	mv_chan_clear_eoc_cause(chan);
 
@@ -1107,7 +1107,7 @@ mv_xor_channel_add(struct mv_xor_device *xordev,
 
 	mv_chan->mmr_base = xordev->xor_base;
 	mv_chan->mmr_high_base = xordev->xor_high_base;
-	tasklet_setup(&mv_chan->irq_tasklet, mv_xor_tasklet);
+	dma_chan_init_bh(&mv_chan->dmachan, mv_xor_tasklet);
 
 	/* clear errors before enabling interrupts */
 	mv_chan_clear_err_status(mv_chan);
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

