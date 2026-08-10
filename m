Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF8F3F58D6
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385530; cv=none; b=BFET4Gl4TJFcWVXwc43gZBCrR3VjNnXLebv69ABoup5plyWxvdKmt9N8Dtb3N/p6MM/BIASz9VjeycAsQA1uJPGWV6y6kbsTs8BXSgH1nM8mvpEZ5Y1o0xUpMCSf0o3ZU+n8bU4tHCBwBVYY1/XYIFBnpWnL+h6qL7IMLjPchjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385530; c=relaxed/simple;
	bh=EcSxs//NX9CKu+93ObJADpDk68KdQCGvlmly0gYzB98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bgif09BXC/fPAPVUMn52M/rUERyv2pfgO2OQVSSwbOHmcTRdsvzCQ7tMjvx0/zOfbLU6r6l+GNRWRrlKwYt8831xgx9aoudtl6hhW2i7CNuKDKyay6SMtRJyY9tbOhKuISAu49eubcitrL3cKjEkYTOrx+s63HEtSU+GNzHo4YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lx/qeSvm; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lx/qeSvm"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d004f135b1so27076285ad.3
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385527; x=1786990327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Izpb3U85IQFL8r+2WgcI27OJDxEjSqNL13Ea+z3kRO8=;
        b=Lx/qeSvmO0xd5m4Vi0ZsY1OWqcguqeh+dy2aXMt7LzFiPnMODDoMmKhX4JpRn6DS0W
         qJ31kKwPjHq35K7rjC5pCrcjX9PaCZ2QyCkVG4trxzIeQUNf3ujHxJQ7MOfDi9TdZgDL
         R+ieXqBPMPl7ar7CWZG37l9G5p/SWUvEjlD6uYGzMvD+KssFbdTog6CHOYF5zp2CDL4s
         tNnaFDg9UC5V80OGXWRlcEuGQjS3mVnpxMWJb1anV/UccwvNGEIQxB+U2LjpSamXz/dN
         9gPUOJCYR8v0JyXhzOCgV0CX6ldjAQ/9IFJmY2t2bQabYdO3GAOJg39/7vGYLFkBDh4S
         RgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385527; x=1786990327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Izpb3U85IQFL8r+2WgcI27OJDxEjSqNL13Ea+z3kRO8=;
        b=FOVUyW9gt7FGJ1z6mc6UryeMsfbdCVmL8tTVoR+Q9m+HC35vG/E9/ubkhaFDkbFKMM
         dmavkFFm70ZASP2Xq43QPD//360Wvv3dDyzB3XUPQHPwh3P/DM9HowFabYiL3xRhJi8d
         05zQ5hovRSGlt1CtWT6cGkQk6y38Ri9ayBE50JViYVLtuCfTOzTH2UwK5PA/EWdrAPLQ
         ovL3I+QB34Tnu5zsXis1n4QB1iDGZOc0ETiZxKF6xYJ8UwbbF9yIEj9zVkikxToDY1+D
         SX6q4x7MqoXcLJDKCq+qgCXNt5BOECMxX4Wn41glcWLdxUaGwCMIDoA18G2I64gyHq3t
         7snA==
X-Forwarded-Encrypted: i=1; AHgh+RrhjOV9lW4LtFEVMXKTYuuawDiaWxHOGhHghMWtr8Yk6pBcWbQfrqFLZEDfCM0lXk1dugdHQc0Cwp0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTlt6rXZ3lYp4E6zYwW8KP5kp82vJe4VKrsO0OtrZSVxCNnDIt
	puOmVegU3nUd+Ndjh1+v79FU9nO1IC2oULyaWMcI9RdS3VcatRUjS2tD
X-Gm-Gg: AR+sD12AP0bX9w+UnIJ5IdrzcSnbQobBosZVk1Bti/hQ2nrDUZlHooJJomofAolkLOl
	0xhw/BbHYIHjE30FUGnNwbO3qZTN5G2FgXIwbxQ3PGRvMoeYA+61uBcpVRqx7TorcNSKq0f1g5/
	luW04q8F/j9mQJBJf9U1SMEoHr7rHzlESybsS+fMTaaSxwzhRwlJDRVrrkMzXsZyx1zm9UWjC7u
	IePrbUKxtQE5jDfV+J1wc/qzNARFBQfY4R9NRv7gA/PpeiTLioqoHzSlLdJ99rPWpsdQ6ennF3x
	JTLTrPEBTFANfj2I5Ml+oZrBTjSYT1/00vuBZzXzOBGj0YLqjoWwe8AZfOAjaw6jFRhdWG1kdyp
	wt1sQ7wre5yw7haSSUeCRZAK8vf9nrQW+d2CuWMrssJ8uvOnROwBttaxzL1vZOYzQNyBagKzACG
	J/uFJpTNN43mnwGxUFCjQVUJovsxfrhfcN7z0O1YoR3caq7R2I7ZQzFVJgjclzh9g=
X-Received: by 2002:a17:90b:3f43:b0:37c:6130:7a5b with SMTP id 98e67ed59e1d1-3903c54302bmr47214837a91.8.1786385527404;
        Mon, 10 Aug 2026 11:12:07 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:12:06 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v3 12/34] dmaengine: mv_xor: convert irq tasklet to dmaengine BH
Date: Mon, 10 Aug 2026 11:09:13 -0700
Message-ID: <75cb0e6cfddfcf5655fae89f58a06cdeca02f831.1786384168.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com> <cover.1786384168.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/mv_xor.c | 12 ++++++------
 drivers/dma/mv_xor.h |  2 --
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
index 25ed61f1b089..752e30ca5fa8 100644
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
@@ -737,7 +737,7 @@ static irqreturn_t mv_xor_interrupt_handler(int irq, void *data)
 	if (intr_cause & XOR_INTR_ERRORS)
 		mv_chan_err_interrupt_handler(chan, intr_cause);
 
-	tasklet_schedule(&chan->irq_tasklet);
+	dmaengine_schedule_bh(&chan->dmachan);
 
 	mv_chan_clear_eoc_cause(chan);
 
@@ -1107,7 +1107,7 @@ mv_xor_channel_add(struct mv_xor_device *xordev,
 
 	mv_chan->mmr_base = xordev->xor_base;
 	mv_chan->mmr_high_base = xordev->xor_high_base;
-	tasklet_setup(&mv_chan->irq_tasklet, mv_xor_tasklet);
+	dmaengine_init_bh(&mv_chan->dmachan, mv_xor_tasklet);
 
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

