Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43049435526
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385552; cv=none; b=RGX/z9Re8ZkeXgFXU8a0LINOeZbJdNzmZCoJ/xUB+mI+xR4uvt0Vg8JjwEfs3LcAuagAcjBgIIZLXJf9RxMzbwfN4gKGpmJM2IcElHgsKCsJD+7dG3mg0NffpB0I3GJehwcOFr043wJj7aDGutA6SosgnKhAc9cr8uZlv0i3PqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385552; c=relaxed/simple;
	bh=wwLFXnu6wU+2q9X0yV+5+Pg9Fs+zv91K8/Zj4nee7yE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=akVApk8efoZOeL7Ghny7T36rz87xDMzL4ZEmNn0visySeBcSjhX8i9KEJ8Oia5ZXq4MmFJG1YEu4u+l5ezQl9D5QuhjsW4irxmYsytL2MdwyXpdk57nI3kElvzY6vGHV+z90y1cvFkkHC1VZrlObGPbrj4jC1WfTVy+EEBT4Pms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQWDZTMR; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQWDZTMR"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38e58034d05so2302241a91.2
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385551; x=1786990351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxUXaFX3//5gZlFn4j1A0nGnaMNCEpwg1qcm0FpwvYU=;
        b=eQWDZTMRxit6YRcR+E9FzscKZhSxk+JjnTXHkACryWpjxdFeZ/CbI34GUoDy85MeL7
         KJYIbIkDh89fV0gncK6b3GYLUZyiLCtzKRciz9HSTDIM605KGQUQ4m32xOqRoxsGjv/1
         b6vqjfCkxprJCYR9zt7b8zEm7IyjlekiEonG01g5vYO5L8d0OVg0aYJzy7R6wgILeJA7
         Qlbg70ts9twjvig3itcX9gyyhlHwXhq6IhHhAZDEb7qLCpt24qks30kYvGmV5BF2Jk1P
         5SK0Vec7I0cnuWKSEof4U2FSP9QX//X3SO92/vnQXT/D8Q5JCDWI+T0MHSrvss4dJJYL
         bKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385551; x=1786990351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oxUXaFX3//5gZlFn4j1A0nGnaMNCEpwg1qcm0FpwvYU=;
        b=DR8wRjN0gWLbroloFPifbCTad6Zfe9BEXwy9gR9xJg4FcJalJEzI28k7H528pdZdwt
         rj0tIGHHabu+oaHI8ilQjhav41ur/Ey/UeUZC5iOBjEQ+5Hdt6Z1jFbpPOFje2uP5Zr4
         UcuwuC6xnCLu/KwRUGSb3A/P3ZM1ZlaDwtLJc1pmkGAkyEJbJurE/20zfxq2DtkF/rFb
         xyCqIJAhC2UVZRwNh3hX/iU1GtIjn2ZWX/F4bRXs6JmnqraEdvOvEul+PGHRHLoJN1k+
         3qOx0a3vqxjdEox+3l89P6/bzjkrIvDM5ZeMuloV5AqKLkdMnvXTKUWFq82eCqV4hkL9
         JWKw==
X-Forwarded-Encrypted: i=1; AHgh+Rq8SIEHPLAM0nYqprMKSEAnsj3olY//IMLRQRnYlTzY7vKLHSNV/T71iGhvwm4+1EXsHWToV3++Vb8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEcAKI+qRH6J32ChdxiB/jPaUO7rDP6oIl42jfyEb698GXZXU/
	gvw6vseXckZkS45ThhPBAEkinxYt5lrwpwyxL9Fcw1OTfA7Yzd/HBuG2
X-Gm-Gg: AR+sD11Deqqq8eNARQDaIslJdRdBWGEyRnYdjnFvB938SJr3Pb/6k3a5wBdCoT/4FRE
	r44hUA2mW1zWO8HA1uQxczMAy4dQyy6J6hmaYKqHUF3RGzxG7zHZ9VGfbzObpOiavXYFeembtg3
	yoUhTH12bu4XFSj1vmNKJpqgnl1Vx9f36XUKqBJL/bdWtJexR5A8bDHyH7CkZhjLy9CNaEsC7SF
	T7QUYtcDMiNBFLJ5E5HqQQwzoeSDT8GkXSc0RpSKicHfywQhjO8xfY4MjIaUqIYj+xTIVKAzZuQ
	3wmGJZUHOJhjL7CN//alEUYmZj9MSj4rPwTYUxbg1r0tOGvKVUzRSJIuG6SixvTpx9ZfYJ4Dkug
	5LZEI5U08usy/DvE4dTrDEN3DhD2XQZ8aXyTQsuS3Q+xCXD1/ds6bSEiVF9HIjAJ7KWSIMXhuHZ
	vwucYRodfMyhMA/42/LSQvQoD1NsmXs8KRdOFeXlnOpDOh7cPD6ICMv+xSrtrQwY0=
X-Received: by 2002:a17:90b:28cf:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-3903c5d321dmr44037109a91.14.1786385550593;
        Mon, 10 Aug 2026 11:12:30 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:12:30 -0700 (PDT)
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
Subject: [PATCH v3 17/34] dmaengine: ste_dma40: convert per-channel tasklet to dmaengine BH
Date: Mon, 10 Aug 2026 11:09:18 -0700
Message-ID: <72495a21d3eb7ef735400e1a52deb24f3e70c944.1786384168.git.allen.lkml@gmail.com>
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
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 0d9ffa3e2663..e6dfa1fc5e5a 100644
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
+	dmaengine_schedule_bh(&d40c->chan);
 
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
+		dmaengine_schedule_bh(&d40c->chan);
 
 	spin_unlock_irqrestore(&d40c->lock, flags);
 
@@ -2815,7 +2812,7 @@ static void __init d40_chan_init(struct d40_base *base, struct dma_device *dma,
 		INIT_LIST_HEAD(&d40c->client);
 		INIT_LIST_HEAD(&d40c->prepare_queue);
 
-		tasklet_setup(&d40c->tasklet, dma_tasklet);
+		dmaengine_init_bh(&d40c->chan, dma_tasklet);
 
 		list_add_tail(&d40c->chan.device_node,
 			      &dma->channels);
-- 
2.43.0

