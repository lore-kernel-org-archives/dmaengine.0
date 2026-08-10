Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E1943552D
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385518; cv=none; b=H3/vdGeAyIwWK7Kq6jThGMLrhki+VgWAEQ5/Ezd3mBgqhdNuYKscoISkiixlAWVBQDBqZN4popsKnKDwP6SoKjy2CGiMl4DqP1AM/73D/3HEuEWSAYFtNiEedEu/KJI7mt7KRNWE/ucKDmchn/7xms0ADuLlmFZi2FWTU2qaS5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385518; c=relaxed/simple;
	bh=Z6aHSn9/shJEJCFIZp3kbMKlw0y+VH/BXUaNgVp99Pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YE5Ls3Lb8SaAQ4E4azcKUGD5TRr6KIZcLFXyWMD8SJKp/0ciOm2thzqmRuC5lIw4Dlix0nOfbxCjScoRl9X2nz1/FD7/EKcDReRM2dQbnoZGw7beQe37iQo30pp1It4eA+Oey8zsTvzayk6VFp4HmsMXgT7hYOrmO8uDu1YG1K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dd3FKD4n; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dd3FKD4n"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38f0f132f56so170140a91.0
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385516; x=1786990316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58obnPPYteuUQx4U+Rlg5+ZCM5vWRX2xfuOQL5uhRvk=;
        b=Dd3FKD4nipvpYVnnxKXOqEUBLF5BWsso04UnOWTGUBh/5t9xeQJ07e6BwJXvxhL8rT
         86QPrZi+o4hU8PM3qhHIBcCgW/PHMDGUEZbyl/hsxp/G68VhXBKuJtF8osEEuu99t+5I
         d0gc5JdTteLpj4jRBGeokJsYiaBPUfTPzzPWayYNTa3eDiWAbo0hxCAD1eoppR3WGAaH
         Iq84amsRk18OP4znl34n2G1EA+PcXJvoUvVEsx80Vh+Rex6c3sdLswW2Ck4a13MvbTWj
         yCsuyhUSZWEqWqndQ9IGuRxJHkaG2Ak+I+SXc5PagMMldUwbPVEOGDJJj1wgu9/jzTuj
         0XqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385516; x=1786990316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=58obnPPYteuUQx4U+Rlg5+ZCM5vWRX2xfuOQL5uhRvk=;
        b=S1ltf7A+wQkA3cYdoDoZXOOMlQ3LiuSpTtfrCnG4M7HR8a66ELiacn7EJHCOIWx+Lg
         RT8FNGH1Ari3LP3yzJyp9rv4OBDmdEm2BODF7AnMmxPxS0uSPu7/d2O+V3PI0XItTCz3
         KZavQ9kwi7Gb8+XDmvwd6iM/tMTLIIgBKnbQ3XvGRLfQH8Oht4zSldP1EEJUfJ0EJrv9
         +qsPE3zKbQhg3PYY3ZuAJqbuC2711pBGCVmIEt3b6GJO7vxQZAH3weNWkxqJfl2SQ64F
         amV+hVJ3dGmkJgvBh9mCRB6PFROuIDNP0XjZlL41YOu2NPQhLeP82+10OdBFb+H5GvhQ
         0xxA==
X-Forwarded-Encrypted: i=1; AHgh+RqOUqPUWMyzmjbvm5ONOoqkLg5ITHdZPN1irlER8JmF7H2SeSKOgavYtPn3vBzBf1MvM1alFngFOlU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4r6M46XuJajM27NaEnk1IPc+LvPaHaVE5vvZSpHyxay/9Jyvz
	mKAWu82+EmO3HNrGf1hF30dbb+qDj6Cj62wA51TUwALf+g2C01hvclhk
X-Gm-Gg: AR+sD113CTRMciVVRknirrOXB1QSoSJCKyWs4tYbJNJk0I+dLb+bexhp1rpkSWa2En5
	Lwwb9BB6ke706shpxqUOzRwGaPE0Bay3dbzvqA8rpgp2SXZL0pyB6x+loZKoOnP2NpSo5LYv3xr
	2PpHoQUIQk2QOvQkIWAoZpLrRMbfGyRYUhMyb+2cnfxpjT5MRRfNCT/oSGKXUvNu+b6QY4RQe2h
	1z0wK80oxaxJ88HlC+Nih/gJzXjI5g2a7wHL5bJ++Qon+E/CmflBLJF0zT7iQMbZ7wUIvq0jCFW
	p7HYx93DN+/qTmGinh01Bgc4amQkluKEAA3F6OkehlZ57LqODeCy4V4WsLPBc0rGfKZ1aIeWKKm
	nRXmzec9eCQeMXYvnDeA0Kx6sS36IbNttgJNdGUWIgCOJcpXlG95YopZvaZ5V9lOIC0vYMCJV7O
	6bENEwi53PpHsZhboFRPRadAaTvH2L4sg50PNtVA13BV2DGbtFMuRfGaxyOYJoayQ=
X-Received: by 2002:a17:90b:1e0d:b0:385:3ab:fecb with SMTP id 98e67ed59e1d1-392d610c22fmr145266a91.4.1786385516113;
        Mon, 10 Aug 2026 11:11:56 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:11:55 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v3 10/34] dmaengine: mmp_pdma: replace per-chan tasklet with dmaengine BH
Date: Mon, 10 Aug 2026 11:09:11 -0700
Message-ID: <f55f26921b9c0bedb7353399f4284003ad5279f3.1786384168.git.allen.lkml@gmail.com>
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
 drivers/dma/mmp_pdma.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index 386e85cd4882..4f7d3193d7a3 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -116,7 +116,6 @@ struct mmp_pdma_chan {
 						 * is in cyclic mode */
 
 	/* channel's basic info */
-	struct tasklet_struct tasklet;
 	u32 dcmd;
 	u32 drcmr;
 	u32 dev_addr;
@@ -374,7 +373,7 @@ static irqreturn_t mmp_pdma_chan_handler(int irq, void *dev_id)
 	if (clear_chan_irq(phy) != 0)
 		return IRQ_NONE;
 
-	tasklet_schedule(&phy->vchan->tasklet);
+	dmaengine_schedule_bh(&phy->vchan->chan);
 	return IRQ_HANDLED;
 }
 
@@ -1047,13 +1046,11 @@ static void mmp_pdma_issue_pending(struct dma_chan *dchan)
 }
 
 /*
- * dma_do_tasklet
- * Do call back
- * Start pending list
+ * dma_do_tasklet - BH worker to process completions and kick pending work
  */
-static void dma_do_tasklet(struct tasklet_struct *t)
+static void dma_do_tasklet(struct dma_chan *c)
 {
-	struct mmp_pdma_chan *chan = from_tasklet(chan, t, tasklet);
+	struct mmp_pdma_chan *chan = container_of(c, struct mmp_pdma_chan, chan);
 	struct mmp_pdma_desc_sw *desc, *_desc;
 	LIST_HEAD(chain_cleanup);
 	unsigned long flags;
@@ -1170,7 +1167,7 @@ static int mmp_pdma_chan_init(struct mmp_pdma_device *pdev, int idx, int irq)
 	spin_lock_init(&chan->desc_lock);
 	chan->dev = pdev->dev;
 	chan->chan.device = &pdev->device;
-	tasklet_setup(&chan->tasklet, dma_do_tasklet);
+	dmaengine_init_bh(&chan->chan, dma_do_tasklet);
 	INIT_LIST_HEAD(&chan->chain_pending);
 	INIT_LIST_HEAD(&chan->chain_running);
 
-- 
2.43.0

