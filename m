Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918711F5842
	for <dmaengine@vger.kernel.org>; Sat, 19 Sep 2026 08:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789807672; cv=none; b=Ogflckl9faYCPADOiuGXnKR3VOBQ+nWsoO8cSmJsIrUxtPP6UcN6ZaufLPellhMIk83Zkq5SWLlFdeREGtiInxY0NM+OSyO0qWZXs8QAJMcxQICXo2xRV0op2weoaJF0iDLLndvMd7Yw6DhApmZqXSjbjhCsXE3Sy5AmJZONxzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789807672; c=relaxed/simple;
	bh=DYAShckXomVDJr3XAdzG+ca5X7Lx2QNQjGhHsqoCEaI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H//Y6Giuq3wRHLWQqlwfpQjRBSHzmXTh9ImDTsniU2YRaxnvh98i3d9aMxAqnKjIulg6jCUvDtvEg8OsbEJOr4hhzfyEE7LYaeDzCQqCQNcrmfOFG8zneY5f+3mbOHXJFWkm2N7HsD+e8JW1aySdLOb3E1SZjtwksJd3xobDoWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nT9aGyZ7; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nT9aGyZ7"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469b355ffso961030b3a.1
        for <dmaengine@vger.kernel.org>; Sat, 19 Sep 2026 01:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789807670; x=1790412470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HgdoQnywZtJ2LcW7ra2+q0vZEMEzGxqganpX19bHuVg=;
        b=nT9aGyZ7mLzLt4zAdQXFH9vdGQ+qW+rvoxcLUtfMvUycBvW84mBjowkk5Qv/gb54pf
         mmu2rBkDdTB3elTiivIvmQfzPYbFe+mR44xa6rhMzgU1EyEp0yJYMB1ytAiXJOCvDyBk
         RSTedzdoCyLF3li7YyJxMIKg4MLx05jsH0ueGLDyMYedtt7o4DpGNAvNCI0rcpPgp9oZ
         Rb6+D+c6+oMYmoBumupfn/aw1TffPEi69Qas8mRycSOFvNUXAgVH+woGO2oj+cwoU2Z6
         8b7IgGK4/3Zwfistzwb7kf++uZUxHGLdGdmQ3Ia+2zaH2DjEw3FJ79DNSlUDetr1kOuu
         E91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789807670; x=1790412470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HgdoQnywZtJ2LcW7ra2+q0vZEMEzGxqganpX19bHuVg=;
        b=1GB0HmPsuHctQA/jVL7DyHnfJq5T8MXhaooa8RRkGzuaTRx/H7Hi9agbQFo1OcAoAO
         PakXBh9Ld/4bI0Stm15qZqQ83LfOP3nX1o/yEsV8bJkAoNiLpcp74XX2GXW24DuljMtp
         5PUVoNxIC8L1heeuM8wMLtCVnuj+RX0qXroslbZGEtOdjYyqHNvy3Bp7BS82CxUwgZL5
         5GH88juDfgAcxTSxtWBF/eLTDN8ERYBTgs0kMbaaQCh2ysONMqj00tnRiVlNedyTnF/+
         z12vuq4e5XG3xr2cQ8qJt+NE6GwZWHUjuB3vZIxPGnM/QH34uA++VntSSKCq5Frbt+vZ
         IfUg==
X-Forwarded-Encrypted: i=1; AKwUvByGftZdCHUtcpg1SvdTqeRO2goBh+VczC2WtT7nIR5lVP4nQPdZ0zAzVIwkN42JSqLGCDHje7eDh0A=@vger.kernel.org
X-Gm-Message-State: AFuF++m03YC2dfW3mMv683qjHMWEuqHKBVe3MDlkTHyMBookNt72I3HH
	+IX5eamx8vTwqelkDgoV7RJ+LwV1TUVcPO8h64ApyxZd+VduYkjU5Jmj
X-Gm-Gg: AYBFou01EyVE6rEYMTgqsfU7wHRE5oDo2qnm8U2byXBSymLcAzs6UrNdSCiRDWNwLhP
	L8hOdhgw/o2jJAwb84zwKNsW6DJRBDHddKwNqdA6R5Q0rnCXI9Jpvi5c8y4VopfNBpdMjF5ZJKL
	3z6J/a94K5mhHxBHGQOnuMPQ9lkXV+ABbObv/lEsaRk5jPEpzzEEhqRWlkV4L0+vSAl8GRpyJeu
	9ZPNOk1A0sypTCj9oy09Sjxy0G4lLXjbRFhe+5lKA1U0TBAL5nCJnm9MoESNTrzmJm8oufxPL1v
	0Cnlhu4aI0Uaasebcb+WOw3CAXqaBqfVRHHKZCNwJobEJwcB9b84ID7QYS4Jfa/EWv7TM07XgGp
	+OdfRLUBzQVUwspCfHnTSY0E2hg14NOTDX152IalSci16Cku3arY/PBKoS2DOuDZdH3xKRCsuZa
	MfOQLhluXDOwLsDSumIVz+lGjTR7lejkZqsZ3TNMP0iLivFUXCtrRlOBxGnJmQcCPZW32qEGhp+
	tVm6MQKAJ+3TyajxA==
X-Received: by 2002:a05:6a20:6f90:b0:3dd:a195:dd5b with SMTP id adf61e73a8af0-3dda195e52dmr2980024637.61.1789807669769;
        Sat, 19 Sep 2026 01:47:49 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a00:1a32:5e90:b876:a980:6e09:6daf])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72ae8eae3sm737021a12.14.2026.09.19.01.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 01:47:49 -0700 (PDT)
From: Baineng Shou <shoubaineng@gmail.com>
To: Eugeniy.Paltsev@synopsys.com,
	vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Baineng Shou <shoubaineng@gmail.com>
Subject: [PATCH] dmaengine: dw-axi-dmac: restart the next queued transfer after completion
Date: Sat, 19 Sep 2026 16:47:32 +0800
Message-Id: <20260919084732.502247-1-shoubaineng@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 333e11bf47fa ("Avoid hw_desc array overrun in dw-axi-dmac") removed
the axi_chan_start_first_queued() call from the non-cyclic completion path,
after observing that a descriptor started there could be dropped by the
non-idle check in axi_chan_block_xfer_start() because the channel has not
fully stopped yet when the transfer-complete interrupt arrives.

That removes more than the race: with more than one descriptor issued on
a channel, the first completion now leaves the remaining descriptors
queued forever - nothing starts them and no further interrupt arrives,
so their callbacks never run.

Fix it by waiting for the channel to actually go idle after the
completion and error paths disable it, restore the start of the next
queued descriptor in the non-cyclic completion path, and skip the start
attempt from issue_pending() while the channel is still busy.

Fixes: 333e11bf47fa ("Avoid hw_desc array overrun in dw-axi-dmac")
Cc: stable@vger.kernel.org
Signed-off-by: Baineng Shou <shoubaineng@gmail.com>
---
 .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 31 ++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index eebed2474210..f3d89f5cc12a 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -263,6 +263,26 @@ static inline bool axi_chan_is_hw_enable(struct axi_dma_chan *chan)
 		return !!(val & (BIT(chan->id) << DMAC_CHAN_EN_SHIFT));
 }
 
+static int axi_chan_wait_idle(struct axi_dma_chan *chan)
+{
+	unsigned int timeout = 50; /* 50 x 2us = 100us */
+
+	/*
+	 * Writing the channel-disable bit is asynchronous: the hardware
+	 * finishes the current burst, flushes the FIFO and only then
+	 * clears the enable bit. Wait until the channel is really idle
+	 * before (re)starting a transfer, otherwise the non-idle check
+	 * in axi_chan_block_xfer_start() would silently drop it.
+	 */
+	while (axi_chan_is_hw_enable(chan)) {
+		if (!--timeout)
+			return -ETIMEDOUT;
+		udelay(2);
+	}
+
+	return 0;
+}
+
 static void axi_dma_hw_init(struct axi_dma_chip *chip)
 {
 	int ret;
@@ -501,7 +521,7 @@ static void dma_chan_issue_pending(struct dma_chan *dchan)
 	unsigned long flags;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
-	if (vchan_issue_pending(&chan->vc))
+	if (vchan_issue_pending(&chan->vc) && !axi_chan_is_hw_enable(chan))
 		axi_chan_start_first_queued(chan);
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
@@ -1067,6 +1087,9 @@ static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
 	spin_lock_irqsave(&chan->vc.lock, flags);
 
 	axi_chan_disable(chan);
+	if (axi_chan_wait_idle(chan))
+		dev_warn(chan2dev(chan), "%s failed to go idle\n",
+			 axi_chan_name(chan));
 
 	/* The bad descriptor currently is in the head of vc list */
 	vd = vchan_next_desc(&chan->vc);
@@ -1108,6 +1131,9 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 		dev_err(chan2dev(chan), "BUG: %s caught DWAXIDMAC_IRQ_DMA_TRF, but channel not idle!\n",
 			axi_chan_name(chan));
 		axi_chan_disable(chan);
+		if (axi_chan_wait_idle(chan))
+			dev_warn(chan2dev(chan), "%s failed to go idle\n",
+				 axi_chan_name(chan));
 	}
 
 	/* The completed descriptor currently is in the head of vc list */
@@ -1141,6 +1167,9 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 		/* Remove the completed descriptor from issued list before completing */
 		list_del(&vd->node);
 		vchan_cookie_complete(vd);
+
+		/* Restart the next queued descriptor, if any */
+		axi_chan_start_first_queued(chan);
 	}
 
 out:
-- 
2.34.1

