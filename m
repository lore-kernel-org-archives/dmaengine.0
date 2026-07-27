Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C0D42A16A
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184336; cv=none; b=h75RY0Vn7/J3AFna/2AWRbZn2AbGPJcle/Rm4inoHC1XoYuF2wmSTIzqKSjF+b06gXyK3twbY9o4QDBg76sJiddAbB6yi6I4XP5//65VFhmLfD1xs7f48Ahh+wubKCwoC9dwU8H9FcFzxYb0CpgzkSWKcCUy/wXSLbPaDPjumBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184336; c=relaxed/simple;
	bh=ECL7TQsMzveiS+1RZ0ouU/UmGSPNvhmXnhNWG5LQo9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MfPVPKjy9gfc+i+d/eno99JxwIY7lUJh4ZAnsAH09pn77yFeIIrHLM5HYToH+ygOpCYtn+/qHier1qhzndy5QzIYSuN5KaWRRl8OnvnVWLoiuqSy4bmlpq6+mVRZM9q1d11bnBkSOPESnMvM8bthWQFrxVpA2xjhmp5n8lSjoqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cRj7+LuE; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cRj7+LuE"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cad8076b01so38751595ad.2
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184334; x=1785789134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74xEo+CE1QfFvSvj5MoWqgDNpT3h+VRY/LZDapbI2A4=;
        b=cRj7+LuE5F5nbApSoKzdOKpI60hNMnJw+NCPIeq/gnSKh2iA+QGw3dJiK0ZvvD9Jdy
         6HwW2jS/7dCYqTf6Kyg8hUeNs58SQ5ToVfOxQuP9NLNgaxVONhZlu+OJSW3uYiYVrtrY
         tJ/lyUohDCIlVNJ2rF2F0HbJ0f4r9MImDfYP1ATVhPOwsNoDgbdtNjPB4GV1+1bWYmXW
         y+uVDDPJitIpFilhe6W8FOAjwbCUlB2E8iMU1qYSmDhV/L6nwHnY5rDsBWU+hQEpMkf/
         vZeSk2D6NXiA+nN4aMMQXGa8UYPAm9cNBGhfqFGXJSvvgRBHIohzScDH6dQDFK7OWGxq
         dwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184334; x=1785789134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=74xEo+CE1QfFvSvj5MoWqgDNpT3h+VRY/LZDapbI2A4=;
        b=oM4iZGn4qAsNs8Wh7H4Rn9AqdhobxH51OUnuNtAdpMA8xkWPQFrNf8azuxhQc5HqpQ
         h8IdiSfTIPqrf64UXCUzZb+cOb/u5tOES3aJkT+xfnnE+G5fSawyxLE6O8unSd5NsAsv
         Mg6BXFkAqZUNF/8tX0W3WXEvqkKJYEKEMUwlxphY3ppNTl8GBbIry3/xXmcZ/QKGqRdb
         LysxNsQ+Ok/1uOKjL++IvugE38U3M60r0lqe+HCiq1fYpM1wQA5TVWu3VLcyErBwG5QR
         21OAFkftP3y5G7v8ffF48mj+svoUbPpSFtQHIIICK0kS+W6ReE0WMS2dGtyAOkGB+6gF
         h28g==
X-Forwarded-Encrypted: i=1; AHgh+RpIVk1Dnb6PkazXUglohLeAvscg+PwW6NvYLKSANpzG+ySF6AH/Kv8qRR1e9XJqK8hPrrIEODPr89s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX17O4syx5h24HYBuOLS/6tF0AUkXa2lLMZJYcMAcHcSHh5iTF
	CbFGrCtkR2hbgNwjq9o71fbHqdjPUUaW3u7/PdvvuPRQErH7MS/gYdNe
X-Gm-Gg: AR+sD12/sA9gkC+lgHiuYfuhQZ+LFKHZ3+EDERvXwYvS7x+f3vMIT8Z2esi5pwJYQ2N
	KjuYSDVIJPc3PmjIAUNs4F1AbZjE6k0Hx8J4Bee6OaObJS44A1VmPxWxoosP0fsg1NkTLgaHtpy
	fbZVt6luKTN8HpX0KkWWkJ8wyRkU6Tph1j6IhyzT4GyqXDn2V22krcE297MbpmdiHcy7nXtpA0R
	LmbLk1kRzg/nEJOKvKcBPwfuxzVJwjjFpPHR0JZe3K+DsbTOZS+JjzqkldO0bgwOu0Dlf204bUc
	eb40LkZAfqpqtFFWZuHEQAI7zi81BhmAwmMHXhCBzjtubKtrYEKBhTupO1xDoD6MPnUBoWDFwyJ
	BuJp89j9STqY/01GaZUzEls/wInXYeeEGBLbIOmn7XINTM+wDiiHXc9tIoxa9PebWOXeEqQYe1f
	/swk3X
X-Received: by 2002:a17:902:c401:b0:2cf:bf3e:4812 with SMTP id d9443c01a7336-2d00f3d7f32mr6986165ad.2.1785184334272;
        Mon, 27 Jul 2026 13:32:14 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:32:12 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 17/64] dmaengine: ste_dma40: convert per-channel tasklet to dma_chan BH
Date: Mon, 27 Jul 2026 13:28:45 -0700
Message-ID: <119d257968c0a337b7e439fe71b59636e7fb37c3.1785183549.git.allen.lkml@gmail.com>
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
 drivers/dma/ste_dma40.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 0d9ffa3e2663..f279a093a81f 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -461,8 +461,6 @@ struct d40_base;
  * @phy_chan: Pointer to physical channel which this instance runs on. If this
  * point is NULL, then the channel is not allocated.
  * @chan: DMA engine handle.
- * @tasklet: Tasklet that gets scheduled from interrupt context to complete a
- * transfer and call client callback.
  * @client: Cliented owned descriptor list.
  * @pending_queue: Submitted jobs, to be issued by issue_pending()
  * @active: Active descriptor.
@@ -489,7 +487,6 @@ struct d40_chan {
 	bool				 busy;
 	struct d40_phy_res		*phy_chan;
 	struct dma_chan			 chan;
-	struct tasklet_struct		 tasklet;
 	struct list_head		 client;
 	struct list_head		 pending_queue;
 	struct list_head		 active;
@@ -1587,13 +1584,13 @@ static void dma_tc_handle(struct d40_chan *d40c)
 	}
 
 	d40c->pending_tx++;
-	tasklet_schedule(&d40c->tasklet);
+	dma_chan_schedule_bh(&d40c->chan);
 
 }
 
-static void dma_tasklet(struct tasklet_struct *t)
+static void dma_tasklet(struct dma_chan *chan)
 {
-	struct d40_chan *d40c = from_tasklet(d40c, t, tasklet);
+	struct d40_chan *d40c = container_of(chan, struct d40_chan, chan);
 	struct d40_desc *d40d;
 	unsigned long flags;
 	bool callback_active;
@@ -1641,7 +1638,7 @@ static void dma_tasklet(struct tasklet_struct *t)
 	d40c->pending_tx--;
 
 	if (d40c->pending_tx)
-		tasklet_schedule(&d40c->tasklet);
+		dma_chan_schedule_bh(&d40c->chan);
 
 	spin_unlock_irqrestore(&d40c->lock, flags);
 
@@ -2815,7 +2812,7 @@ static void __init d40_chan_init(struct d40_base *base, struct dma_device *dma,
 		INIT_LIST_HEAD(&d40c->client);
 		INIT_LIST_HEAD(&d40c->prepare_queue);
 
-		tasklet_setup(&d40c->tasklet, dma_tasklet);
+		dma_chan_init_bh(&d40c->chan, dma_tasklet);
 
 		list_add_tail(&d40c->chan.device_node,
 			      &dma->channels);
-- 
2.43.0

