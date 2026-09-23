Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B58331EA8
	for <dmaengine@vger.kernel.org>; Wed, 23 Sep 2026 09:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156676; cv=none; b=Yv2y7FLRt79gLV/17YwZ8XX4nG1FYt/L3MKbYYlDAo3kbj+8vQx1PSw+G3k5dragPhO9H2j7uvi+j4GhFddPIu+jzlMB4fRBjxM+5doZ0D/YM9RI5nTXpRhyIVkC5Zh7rnXe49MDcZUHHymWLtUaWl6NIZMksvEil0cF5Agp4gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156676; c=relaxed/simple;
	bh=dU9hy7OQjqEoRycQvnYqwAL+gjlFdfNRteBCt/LfeHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B4ZJGAAMRMjU6q8gtL5vawoM91ShU07+BUHcM+dlcOO5csKkSq+idfMqHkyrIoxG3uKu6jTXvkpe0dd6JA4UwPM3H64rJ9W/WFNm22iEgGvJMTK15dMCaTCkVF6UlQaSovn/lk2ZnJpHfxYpDOIX2Fpy0eRc0jSSdacd5iM/u4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEQJZ9el; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEQJZ9el"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396cccbba91so396665a91.1
        for <dmaengine@vger.kernel.org>; Wed, 23 Sep 2026 02:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790156675; x=1790761475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cwEzXtz3NNCFqU3FWhb/zI4kz8S9UO05RDNlkWDHdYw=;
        b=jEQJZ9elEHS7e6O2hgLR+q5QdgP2InP34z84U1LkOagDOzTmmW5Q9O7yjfOhSoR77c
         J7FFz/LHLPz0de6vDNN6wtFWrQNIgmydwcIO+P/ZHYTnWwKk9pczXu5RVgQx8JqV+7c/
         hKdKRLUsffv/pJ/84ufCYJ92hEW/s3S2eXpIrPzBI3zgFcVfjQy+ysuY9PDjQQLJQifT
         EYP2nkVGbtWROhwDKxfiv+Tn0fphbH6k9l0FrwHqSDLoQ/uPWtekJMq92r68cVZhOOeJ
         44Rg0B5fYjOOOtwJtHgdUbCbrakZVaYkjBzvCHNzxZNnZJTu1Oy2k+cFDF5bJpOIB03J
         dmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790156675; x=1790761475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwEzXtz3NNCFqU3FWhb/zI4kz8S9UO05RDNlkWDHdYw=;
        b=XnG19RKThwjk7a7K4vBAReGmdYCYI5tWhVwz3CgljHm46ImihFfwovTrq7HpdBuQqS
         5oc92x0bc54LmhCUVNpSuCMWXKVcYzM2ck0Dcew2z0KBvFMItyNNrGSuhxarwG3MudZ3
         7AjcPJV2o2Njf5MNX8lr4Hzk+y5VoQlofWxJeCMigxO1cpNqumFVmY20lp5OqZNlRSaJ
         n2A3Di07KX5+l3p8fO2GkdlFpH2W3ivnnfA3Sf2JvtQVzM5phESnbyJ0iRq6Q4yFqnpr
         aZ1U7Ce6V0WPRVNR4xA7pLfAeZ4ZMsvsC1o3mJ16LJ89TMw/etkhAa0btPGytBb9aiDB
         lDZg==
X-Forwarded-Encrypted: i=1; AKwUvBz0NmU7C5KDd8wSKwhWdzFh+wVb3o/ZN7/1Gzx0WAsWNTEhrbWrlDX5HCQQSdiAzAHrlKJ7gZ6boHM=@vger.kernel.org
X-Gm-Message-State: AFuF++nwvU3qZkYvphqf9FPr8dpoTfWEnsm1g1EhxIhiwJN8nfeJREYv
	XGIgsikznhLU/cLtU43YXc4dRtr4kh5RlfOvgrxDmKLqNK08JH4g1NhJ
X-Gm-Gg: AYBFou3Mha7zW3+wXBI1kS7ytNA9CQ6OUwXm+xmu0zX4vcsL/l/xrK4q7hWAQgXtJ0q
	AOgFDAj/6O/Yngg7w1oEbhQnJmi/AZFXXY3x1X1tTE79M9o/i6qixTg2nhOjvYfu77VjomHvuCr
	IvQyB91V94Vd6URnCiqPnW3qWVIKdGtmvYPAiBIAaSSs8M7LqTzYpPPOCdjHrkcPbbTiSEl5fla
	oodudCY+R++Q34jAvAWDAkPqmouLeV8F0pHqfayvNGznnd22cIeBZsI6RghSbkJY92CwjYj19Qt
	9rl3yDGsR6dljsEJnpIcOHYNFmqxAE/+lRjTS5PWKhgfVhGOrJdtTlEMLXaCKnRDnBQtNIVzRAl
	c6Cn5OtODaOfLwknpf8tPIre2iLMmqKb+NoLeYoOWL/YBK5SKNiPG4BXNVPBFHaFvRefhuNDdv2
	gPphvNLTuJlwi6vPh8XzZnoZ0u6cQgP4mUF5JKSD/dQXK4lqjUiHbsAbPjWXc5FuKVTYdpjrvCj
	fvzzaLQX/6HE3AtLw==
X-Received: by 2002:a17:90b:4c88:b0:3a0:3d1c:2dc2 with SMTP id 98e67ed59e1d1-3a07e6df035mr1828489a91.66.1790156674636;
        Wed, 23 Sep 2026 02:44:34 -0700 (PDT)
Received: from localhost.localdomain ([2406:da14:10b4:9b00:211e:3d68:8776:5ca0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a60c741sm7874725ad.80.2026.09.23.02.44.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 23 Sep 2026 02:44:34 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: sean.wang@mediatek.com
Cc: vkoul@kernel.org,
	Frank.Li@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dmaengine: milbeaut-hdmac: Fix deadlock with the channel IRQ handler
Date: Wed, 23 Sep 2026 17:44:26 +0800
Message-ID: <20260923094426.67872-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

milbeaut_hdmac_interrupt() is a hardirq handler and takes mc->vc.lock with a
plain spin_lock() for the whole time it runs.  interrupts are disabled locally
in that context, so the handler itself is fine.

milbeaut_hdmac_chan_config(), milbeaut_hdmac_chan_pause() and
milbeaut_hdmac_chan_resume() are called from process context and take the same
lock with a plain spin_lock() as well, so interrupts stay enabled while the
lock is held.

If a channel interrupt is delivered on the CPU that is inside one of those
critical sections, milbeaut_hdmac_interrupt() spins on a lock that the
interrupted code is holding and can never release, and the CPU hangs.

Take mc->vc.lock with spin_lock_irqsave() in those three functions, as
milbeaut_hdmac_issue_pending() and the other process context users of this
lock already do.

Fixes: 6c3214e698e4 ("dmaengine: milbeaut-hdmac: Add HDMAC driver for Milbeaut platforms")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
 drivers/dma/milbeaut-hdmac.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/milbeaut-hdmac.c b/drivers/dma/milbeaut-hdmac.c
--- a/drivers/dma/milbeaut-hdmac.c
+++ b/drivers/dma/milbeaut-hdmac.c
@@ -214,10 +214,11 @@ milbeaut_hdmac_chan_config(struct dma_chan *chan, stru
 {
 	struct virt_dma_chan *vc = to_virt_chan(chan);
 	struct milbeaut_hdmac_chan *mc = to_milbeaut_hdmac_chan(vc);
+	unsigned long flags;
 
-	spin_lock(&mc->vc.lock);
+	spin_lock_irqsave(&mc->vc.lock, flags);
 	mc->cfg = *cfg;
-	spin_unlock(&mc->vc.lock);
+	spin_unlock_irqrestore(&mc->vc.lock, flags);
 
 	return 0;
 }
@@ -226,13 +227,14 @@ static int milbeaut_hdmac_chan_pause(struct dma_chan *
 {
 	struct virt_dma_chan *vc = to_virt_chan(chan);
 	struct milbeaut_hdmac_chan *mc = to_milbeaut_hdmac_chan(vc);
+	unsigned long flags;
 	u32 val;
 
-	spin_lock(&mc->vc.lock);
+	spin_lock_irqsave(&mc->vc.lock, flags);
 	val = readl_relaxed(mc->reg_ch_base + MLB_HDMAC_DMACA);
 	val |= MLB_HDMAC_PB;
 	writel_relaxed(val, mc->reg_ch_base + MLB_HDMAC_DMACA);
-	spin_unlock(&mc->vc.lock);
+	spin_unlock_irqrestore(&mc->vc.lock, flags);
 
 	return 0;
 }
@@ -241,13 +243,14 @@ static int milbeaut_hdmac_chan_resume(struct dma_chan 
 {
 	struct virt_dma_chan *vc = to_virt_chan(chan);
 	struct milbeaut_hdmac_chan *mc = to_milbeaut_hdmac_chan(vc);
+	unsigned long flags;
 	u32 val;
 
-	spin_lock(&mc->vc.lock);
+	spin_lock_irqsave(&mc->vc.lock, flags);
 	val = readl_relaxed(mc->reg_ch_base + MLB_HDMAC_DMACA);
 	val &= ~MLB_HDMAC_PB;
 	writel_relaxed(val, mc->reg_ch_base + MLB_HDMAC_DMACA);
-	spin_unlock(&mc->vc.lock);
+	spin_unlock_irqrestore(&mc->vc.lock, flags);
 
 	return 0;
 }
-- 
2.43.0

