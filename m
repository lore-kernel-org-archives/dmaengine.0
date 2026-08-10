Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95477435529
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385578; cv=none; b=e/kUWCJPleiHt38qvvfGopuQJ9g0W1s9o5Sh+HGzlGmhDqLQ1G2AYZuJJlKe5t9AmoMIMqvAAUt1I4CNVq/nGl94ga1Dg7UA5HgzP3d020sA8n6Y0R0uBymLUFVVjyCg41DNrD8Ct3Xo2Tr5OelPmSCo+PCr+b6uZC7R3mVXr3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385578; c=relaxed/simple;
	bh=umUHF9rOXtQ8ecpvqrgfStmkI7x93dZzPqwKnFRIKpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NU6dQQ630aixoZv3UsOQKvU7qF1MWbI+SxFelnDn12YZwhVLIUGVHBZucuVBGFmP0wbXWzydXGQiCQZunYIAw746XaeLO5O3bqPzJZ3anRusmx1BxENhsepG9WcfKyg2fCxwBfNV6olNWpA1HMHzLMRa+3fu+C6YQvCiExYY51g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9JZeWk4; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9JZeWk4"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38101f85591so198771a91.1
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385576; x=1786990376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LamTcANYadoWUGaG2LRUytAWANVCX7wDn1ku3HxunHQ=;
        b=T9JZeWk4IpD4iTPx0CR23q8iFJy8F/Vad4RtdKzpTq5ar3eK8bptSs/tOo93zOoSfG
         mw2gAclcswR3eawCKAt5PqO7puuvSioex+tQ7X6RucLkdkEG2a7X1mtIXTgIV/NRTumj
         qP23nXd5CEa89JPvVII9FXXFC3/ZOFF5y8bNkVHoxQq4SiF4qwlty0dxbLCD40vhWckV
         lv6wRjwEFkno7DxaB085x5Y8CeKq7ZQMMyS2/mDCQ9q5hsq3meApTfAI0nC1iDyio2k8
         q3pqYty7tGuEDmwUZ1CFKUw2DUnmG9IERYH0IpB0IPCZpUYOH6cBOf52FONXs49x2uh2
         mbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385576; x=1786990376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LamTcANYadoWUGaG2LRUytAWANVCX7wDn1ku3HxunHQ=;
        b=O6T5Vmta12tbMrW/yQaR8yAbjN6xXI2xnyZ7TngGysHkwmFJDOniVGAjm/kU644krq
         HJNNZwkp1Of4ahtXhxmkVvALPtgJVQ1Q62inspNLIZQ54pAETfVXLGUHYkFncTdhhasv
         WellZwvWEemF8k0gWV2/k557ocBi6nMUSWz+bP2q9J4Tm+3Zg/f1SJfzVadf0xyjg8Fe
         iiHYHIms/CGQYhbXDgmG2b6bGL+q1T55/mMwO9k/CEIIlVi/WoLUPU/l+vinAOaDnWyB
         QsRa59i9EQkDWnzauou0CnhgRd0OTZ0SPwTas9+jfjAxVBJ14iuPvOK/QLnEHOsItm8N
         HHTA==
X-Forwarded-Encrypted: i=1; AHgh+RquUZYrEfow8CQYC3qAZ+bloaR2FmyOaZzhP+yTTYuxO+Xu/sU41fRBU2vb974iiSniTd3lqU2r32M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGi0E8hB8MUqVGj2vuiwIG4ll46N0cM+trTKoQ93w1XCsKwx5I
	TC71R7WyIPlIkzbAbZIQCgoPmtDW2xokKNMbLovyDoq3E9mhIbZqwyUP
X-Gm-Gg: AR+sD13xOVDgFw/DBr0NpjBU5wfuccfOH9uGw7xqjXaWVshMweVGQzvwyxEGTTS3ve5
	2snCf++fQoZiYXS9E3a73biU8B+DGNDkcPMfzkingsxdBi9Kuj2WvuqiVdFvHzYnLRmHW8LC/ZA
	6JgACqOxIZUPCXw+pxDC204oE4BQmC3CYeAnBAG9/czXRvy/XoRCzX5ze6XG2np5uOnBKeTGRcX
	qbKxtOBljy9K6tVfif5T5e+x9fADiRekFX/r+SBFx8YEsM60IRyNPnWL0/d+jJcSYIBPmUQi4YO
	XUhg5laXmomAW/DeFEIo8oIo4o7A4XuSalD9JDWb+JUovF14r74lllAbiILrgfUqMoNfScSc91B
	ZGZHg2AQUkaRHbdqFPOBwDAW+9ibsW3To/jRtbgvwkKsl2bXlr6tdxFvalqjteADb9qZalvRBFh
	gm/m8VcobLpMCtPrXQ3hHjODMtwu4g+1de/cbanuHhRBHdLkNaK15RgixUU3gUaB8=
X-Received: by 2002:a17:90b:4f84:b0:38e:5828:a446 with SMTP id 98e67ed59e1d1-392d620beb5mr122845a91.19.1786385575553;
        Mon, 10 Aug 2026 11:12:55 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:12:55 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	linux-tegra@vger.kernel.org
Subject: [PATCH v3 22/34] dmaengine: tegra20-apb: use channel BH helpers
Date: Mon, 10 Aug 2026 11:09:23 -0700
Message-ID: <6d720011ba5a41fa48cf1926cd9060da22f89444.1786384169.git.allen.lkml@gmail.com>
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

Switch the per-channel tasklet to dmaengine_*_bh so completion handling
runs through the shared per-channel deferral mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/tegra20-apb-dma.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 640b8a218c9a..45995b82a133 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -194,9 +194,8 @@ struct tegra_dma_channel {
 	struct list_head	free_dma_desc;
 	struct list_head	cb_desc;
 
-	/* ISR handler and tasklet for bottom half of isr handling */
+	/* ISR handler for bottom-half processing */
 	dma_isr_handler		isr_handler;
-	struct tasklet_struct	tasklet;
 
 	/* Channel-slave specific configuration */
 	unsigned int slave_id;
@@ -632,9 +631,10 @@ static void handle_cont_sngl_cycle_dma_done(struct tegra_dma_channel *tdc,
 	}
 }
 
-static void tegra_dma_tasklet(struct tasklet_struct *t)
+static void tegra_dma_tasklet(struct dma_chan *chan)
 {
-	struct tegra_dma_channel *tdc = from_tasklet(tdc, t, tasklet);
+	struct tegra_dma_channel *tdc = container_of(chan, struct tegra_dma_channel,
+						     dma_chan);
 	struct dmaengine_desc_callback cb;
 	struct tegra_dma_desc *dma_desc;
 	unsigned int cb_count;
@@ -670,7 +670,7 @@ static irqreturn_t tegra_dma_isr(int irq, void *dev_id)
 	if (status & TEGRA_APBDMA_STATUS_ISE_EOC) {
 		tdc_write(tdc, TEGRA_APBDMA_CHAN_STATUS, status);
 		tdc->isr_handler(tdc, false);
-		tasklet_schedule(&tdc->tasklet);
+		dmaengine_schedule_bh(&tdc->dma_chan);
 		wake_up_all(&tdc->wq);
 		spin_unlock(&tdc->lock);
 		return IRQ_HANDLED;
@@ -819,7 +819,7 @@ static void tegra_dma_synchronize(struct dma_chan *dc)
 	 */
 	wait_event(tdc->wq, tegra_dma_eoc_interrupt_deasserted(tdc));
 
-	tasklet_kill(&tdc->tasklet);
+	dmaengine_kill_bh(&tdc->dma_chan);
 
 	pm_runtime_put(tdc->tdma->dev);
 }
@@ -1317,7 +1317,7 @@ static void tegra_dma_free_chan_resources(struct dma_chan *dc)
 	dev_dbg(tdc2dev(tdc), "Freeing channel %d\n", tdc->id);
 
 	tegra_dma_terminate_all(dc);
-	tasklet_kill(&tdc->tasklet);
+	dmaengine_kill_bh(&tdc->dma_chan);
 
 	list_splice_init(&tdc->pending_sg_req, &sg_req_list);
 	list_splice_init(&tdc->free_sg_req, &sg_req_list);
@@ -1511,7 +1511,7 @@ static int tegra_dma_probe(struct platform_device *pdev)
 		tdc->id = i;
 		tdc->slave_id = TEGRA_APBDMA_SLAVE_ID_INVALID;
 
-		tasklet_setup(&tdc->tasklet, tegra_dma_tasklet);
+		dmaengine_init_bh(&tdc->dma_chan, tegra_dma_tasklet);
 		spin_lock_init(&tdc->lock);
 		init_waitqueue_head(&tdc->wq);
 
@@ -1617,7 +1617,7 @@ static int __maybe_unused tegra_dma_dev_suspend(struct device *dev)
 	for (i = 0; i < tdma->chip_data->nr_channels; i++) {
 		struct tegra_dma_channel *tdc = &tdma->channels[i];
 
-		tasklet_kill(&tdc->tasklet);
+		dmaengine_kill_bh(&tdc->dma_chan);
 
 		spin_lock_irqsave(&tdc->lock, flags);
 		busy = tdc->busy;
-- 
2.43.0

