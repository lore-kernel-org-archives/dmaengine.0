Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804C84EB866;
	Fri, 18 Sep 2026 16:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748680; cv=none; b=UE5uz2WGQyWpp2n8Ujwvl4M/7LCQ3i5McCjnzoJfLwcqcaf7hrVTWCYWnW4bS1ZPwP11m0VYGQuzbhWa9BOE6QohwRcuMF3gp1qBTIWfBGqIaxdWyiCVAD1c3VFA95QbObASk6tzbpZtLZz3iRrNk/tHl1em2ejzYh++9FuPhqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748680; c=relaxed/simple;
	bh=GO5Req7p15S08SEn7cEE2HfR60XSBe09wXooIddPFEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tE0b3usShQ7z/DSFc8ohpvSrFk89yDxMHENRUavx8ePVByHWomAuf8c/2ujkC1kytfupXuwyMPc4NHPhlr5um+UwbG8W1sLE5eLfLhm08UM7hqMDr/BM/0V8BwqOUY3rvDXrohrXcS6VH1hz4iFuEkjF5JxIKehF2li2fH8utAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hFjkHL5p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hFjkHL5p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506231F00899;
	Fri, 18 Sep 2026 16:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748678;
	bh=DRQaxXPBhH8b+yYC9mGTgQrAcEDnOl9+AhQAxqjooQg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hFjkHL5pReqDbS7TTo4BrPNaosA156mqfy4ABSjVxlTkDG/fMPZgOu9vI5zZlekvf
	 NtmqFV811BAlfMEmibMTlJTewNrbChouan/x5bBufPW3EZtziSdu+bZ/hJ8ARrZBvF
	 XsiGKZCwaHiE1EPl56ffgDXEtb4BUelre2LF76GawJr4FZYR33owvSshqtVtK3XCaR
	 ghLQ4VQ355w+tw0ZwkEV7Ja9/CNeGD2kJBjVeBz4xzcbgZn/SFFDu2hK86UeQm7YnU
	 VOHGRHv5yfuVTBBqoBmWD/qDsSN4XyuT3xs2IqRJrzTHAs712rGqxjDVoHOeDU6Ehd
	 UdU6r+Mmnnryg==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 18:24:25 +0200
Subject: [PATCH v3 06/22] dmaengine: ste_dma40: Handle runtime PM resume
 errors
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-dma40-fixes-v3-6-8dd8450669e8@kernel.org>
References: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
In-Reply-To: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

Several channel operations use pm_runtime_get_sync() and access DMA40
registers without checking whether runtime resume succeeded. If resume
fails, the registers may be inaccessible. pm_runtime_get_sync() also
increments the usage counter on failure, making error unwinding easy to
unbalance.

Use pm_runtime_resume_and_get() and abort each operation before accessing
hardware when resume fails. Acquire the runtime PM reference before
allocating a channel so failure needs no channel-allocation rollback, and
leave a queued descriptor pending when the controller cannot be resumed.

Fixes: 7fb3e75e1833 ("dmaengine/ste_dma40: support pm in dma40")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 45 +++++++++++++++++++++++++++++++++------------
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 1baee6f4d919..c6f633353f3e 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1454,11 +1454,14 @@ static int d40_pause(struct dma_chan *chan)
 		return 0;
 
 	spin_lock_irqsave(&d40c->lock, flags);
-	pm_runtime_get_sync(d40c->base->dev);
+	res = pm_runtime_resume_and_get(d40c->base->dev);
+	if (res < 0)
+		goto unlock;
 
 	res = d40_channel_execute_command(d40c, D40_DMA_SUSPEND_REQ);
 
 	pm_runtime_put_autosuspend(d40c->base->dev);
+ unlock:
 	spin_unlock_irqrestore(&d40c->lock, flags);
 	return res;
 }
@@ -1478,13 +1481,16 @@ static int d40_resume(struct dma_chan *chan)
 		return 0;
 
 	spin_lock_irqsave(&d40c->lock, flags);
-	pm_runtime_get_sync(d40c->base->dev);
+	res = pm_runtime_resume_and_get(d40c->base->dev);
+	if (res < 0)
+		goto unlock;
 
 	/* If bytes left to transfer or linked tx resume job */
 	if (d40_residue(d40c) || d40_tx_is_linked(d40c))
 		res = d40_channel_execute_command(d40c, D40_DMA_RUN);
 
 	pm_runtime_put_autosuspend(d40c->base->dev);
+ unlock:
 	spin_unlock_irqrestore(&d40c->lock, flags);
 	return res;
 }
@@ -1521,8 +1527,13 @@ static struct d40_desc *d40_queue_start(struct d40_chan *d40c)
 
 	if (d40d != NULL) {
 		if (!d40c->busy) {
+			err = pm_runtime_resume_and_get(d40c->base->dev);
+			if (err < 0) {
+				chan_err(d40c, "Failed to resume DMA: %d\n",
+					 err);
+				return ERR_PTR(err);
+			}
 			d40c->busy = true;
-			pm_runtime_get_sync(d40c->base->dev);
 		}
 
 		/* Remove from queue */
@@ -2042,9 +2053,6 @@ static int d40_free_dma(struct d40_chan *d40c)
 	struct d40_phy_res *phy = d40c->phy_chan;
 	bool is_src;
 
-	/* Terminate all queued and active transfers */
-	d40_term_all(d40c);
-
 	if (phy == NULL) {
 		chan_err(d40c, "phy == null\n");
 		return -EINVAL;
@@ -2066,7 +2074,13 @@ static int d40_free_dma(struct d40_chan *d40c)
 		return -EINVAL;
 	}
 
-	pm_runtime_get_sync(d40c->base->dev);
+	res = pm_runtime_resume_and_get(d40c->base->dev);
+	if (res < 0)
+		return res;
+
+	/* Terminate all queued and active transfers */
+	d40_term_all(d40c);
+
 	res = d40_channel_execute_command(d40c, D40_DMA_STOP);
 	if (res) {
 		chan_err(d40c, "stop failed\n");
@@ -2458,10 +2472,14 @@ static int d40_alloc_chan_resources(struct dma_chan *chan)
 		err = d40_config_memcpy(d40c);
 		if (err) {
 			chan_err(d40c, "Failed to configure memcpy channel\n");
-			goto mark_last_busy;
+			goto unlock;
 		}
 	}
 
+	err = pm_runtime_resume_and_get(d40c->base->dev);
+	if (err < 0)
+		goto unlock;
+
 	err = d40_allocate_channel(d40c, &is_free_phy);
 	if (err) {
 		chan_err(d40c, "Failed to allocate channel\n");
@@ -2469,8 +2487,6 @@ static int d40_alloc_chan_resources(struct dma_chan *chan)
 		goto mark_last_busy;
 	}
 
-	pm_runtime_get_sync(d40c->base->dev);
-
 	d40_set_prio_realtime(d40c);
 
 	if (chan_is_logical(d40c)) {
@@ -2502,6 +2518,7 @@ static int d40_alloc_chan_resources(struct dma_chan *chan)
 		d40_config_write(d40c);
  mark_last_busy:
 	pm_runtime_put_autosuspend(d40c->base->dev);
+ unlock:
 	spin_unlock_irqrestore(&d40c->lock, flags);
 	return err;
 }
@@ -2658,7 +2675,10 @@ static int d40_terminate_all(struct dma_chan *chan)
 
 	spin_lock_irqsave(&d40c->lock, flags);
 
-	pm_runtime_get_sync(d40c->base->dev);
+	ret = pm_runtime_resume_and_get(d40c->base->dev);
+	if (ret < 0)
+		goto unlock;
+
 	ret = d40_channel_execute_command(d40c, D40_DMA_STOP);
 	if (ret)
 		chan_err(d40c, "Failed to stop channel\n");
@@ -2669,8 +2689,9 @@ static int d40_terminate_all(struct dma_chan *chan)
 		pm_runtime_put_autosuspend(d40c->base->dev);
 	d40c->busy = false;
 
+ unlock:
 	spin_unlock_irqrestore(&d40c->lock, flags);
-	return 0;
+	return ret;
 }
 
 static int

-- 
2.55.0

