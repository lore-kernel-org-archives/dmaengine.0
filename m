Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316640;
	b=27xmVrNM+hnjvxuAacUhLw5TYJ7Jd2YDcvsqzDUUlC085YC2xhzjQQD+TdiNYAKl5qWN
	 Wl2doCeK2AW61mVy+2NZ5LeZfShbwgXHxH3OA8sLlMd4qWpO7L9u8bgHxCsiT1Ei1u1s5
	 nOhm25ZV/E2QUwe3usjhxMR248yBZa+tmw0AfXV/wC6oUvtii2JLVcpkJ5XJ1LRdi+EGO
	 RvLz36mgWTywu4fJrQ4Lya5/jqiW2TnWT+GRiijb8uscDqXDeSwwwDZR7AyGzfQ6ud9Ww
	 AOjQsWRCcNanby+RHSvLJtvq6U6uDygc+H15Dh5JYkl9cbobFKyk4lrXwayNMerDIWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tzsWFUVnlVTKWO65URSlr8hhMmNwegmKs5HUULFUgi0=;
	b=UCNBfPAmXJXL+RARKlSQ1qheXzdEUhXtwY1u1GeKG1I9oVIg9tVf3afEGr5sl3WFeCt3
	 gm3qPF3SNl/6eQ6jpGyLxo8aZPwz5aGW8j1pWTimYFZeumOQImWz0aJtnDhwVdw6Ap6gu
	 +0VXZ5hQrjoOMYYVl5xkORVm+WJ0t7V3B60V4JE98VESA3wXJHe83DUCXCd7ioDOLC04L
	 gWpELH+sy3YWPgUVXcLUSdrNkqmO7lWgyBaqjcmle5Xfi6x9qMoHvs7Slw3ahpdMO3Vj+
	 Vbg5rMWizsvFnkXvn01hTt9v4WT8Sd/PCBWpL7FHywB5cB9EKs4LnYxa9vKDBDxV0Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ws9P6B0t;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF8D606ACE2
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 13:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FF8D606ACE2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ws9P6B0t
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso994871a91.2
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 05:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316640; x=1794921440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tzsWFUVnlVTKWO65URSlr8hhMmNwegmKs5HUULFUgi0=;
        b=Ws9P6B0tanhf8knyV2bk0DEpG4Le0vDjqeQLuhrlET9FL01cOu5qLx7s9pWy2EQCEa
         mfBVYdbVdUiUqxTL05Woie3qnXuLqTuvYtBfAaQXvP82LWcdnmKUAqsNEteFkUAy2DSP
         2wHl/+NQndeEBL9Ag/mhD8e/J/uJSf5wVjWFJBDroBbcChGwo/RvLfmKAvyNUc58DRle
         qLAdPdHgPr9K+Xa9oHYTPkIGKkwCV20ThugaMPPmtPUTHPGs5gg6ulZ/htZ6VNFOdG08
         BA7VIlaPS3CBwFBDHVuBl0E/S5n2CLiPE/UKucHwxG7tNm952YD88MmWRDnBNaojqfxh
         I4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316640; x=1794921440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tzsWFUVnlVTKWO65URSlr8hhMmNwegmKs5HUULFUgi0=;
        b=0Do5AdAAY/A2FzvTeqV0F/VVpwQHO8XiOdrROPLMp6Q5zUSg0yUA6d9YeFt8j426vs
         E4IIGr3m2Of7UqRqAMRw7yU6KhcUoiY+canpYZqef3jccRdTSmkfH9j1XeaYeiWIG9fU
         +9dYVoV+uB2ktgA/c0TPOZerSpF5KpsHVbnKaxgSBuoPlkJIez982vAM/rE8a6J3GgUF
         DpnJ/xTWdtpTuu/CHpiCMbcrwYdj/BohCEYYZy0GLNHMAi5cTgDWnMzdWym8T5JPdqYi
         wjGPZGAdVcWK/gdNrvb9r/qV0Btc4rDdrGDgi2FHa2+dwSbFK+nrv18OW3K3HK8/K92Y
         cI0w==
X-Forwarded-Encrypted: i=1; AL+hErHbEyUCJ3rNEfzF3szYTcWYAhWFNS5ueldMj1s3XRKV84ZECNyRkvm89QrWohnpColfQqgA6NvIUas=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GQLZzxEzdIufXP/Z3tNbso7DjjAKINSk6dxBOSnv+E/N3apJc
	ko1Zl+ouAq7T3Aw/7+BCqdGUYTQLFyo/T0AaTVlHjv9Az2FqD8+uVX8q
X-Gm-Gg: AYBFou37Y+xjH00PDgKCR3VBYGL8FpqMlyaoF+qmc+UTJHHQ7LTZmASBPlTEdEFBg3h
	M3zPxLbUQTEGzVsheM51OXlKjWY/YnGPGi5Hop5mj6nR/tHXjNNRFBdPrIdwpT7sb38U5YXOk+7
	Dy+wvtba+BPnsCxuu+er3oq3dsBHacCFGd2EsFRS5VOofuXrYhaqvpUfg5iX/nMoefOpKZM73tb
	JYKPD4MAplPhjsu2Hv6Fu5TlUAIhBjlpKLbuKy3yE3v6t22CNPEAqePuHq1SVmW1LDRJEM3B8p2
	NRl99KzdwFmAGyPwDSYrqvu/XFL2NayyouAiAb+X1AvNaecjplLmbdeA+5BCGqyHvdfjnc9w3tF
	3Q96xzTzHvqJEXK/SXOf34hAXHXmawJfRQ5WeJd5CmeWW8miTt/AhCpaTkgvai49FSSXrR3MC0i
	Uk5qzSwA3QpxMFd1APGtJus8zl9SsdottMfX0RnMjirPhJEJN3HI+/xe499tbNSKQQWfQPePySy
	gRGFPiVuYkqD+WlM4NTIAd/mCKrds+qtE5AzrRLbUuln5jwvgE025lkji0jdneVF47L5hxu0KqZ
	5wSgNXysxh4QcUeuGb7VE8LwdG1J0h1YlRHkbN2c9soLeUew2sXD6g==
X-Received: by 2002:a17:90b:50cc:b0:3ad:25f6:1dd0 with SMTP id 98e67ed59e1d1-3b166cdeae7mr2955003a91.11.1794316639647;
        Tue, 10 Nov 2026 05:17:19 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:19 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Logan Gunthorpe <logang@deltatee.com>,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 27/33] dmaengine: plx_dma: use channel BH helpers
Date: Tue, 10 Nov 2026 05:13:27 -0800
Message-ID: <01b0cd0d2c1c0a5d866fbc2035f940dd59623c0d.1794315350.git.allen.lkml@gmail.com>
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

Replace the device tasklet with the per-channel BH helper so completion
callbacks run via dmaengine_*_bh.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/plx_dma.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
index 409898e92c32..00187327e86a 100644
--- a/drivers/dma/plx_dma.c
+++ b/drivers/dma/plx_dma.c
@@ -105,7 +105,6 @@ struct plx_dma_dev {
 	struct dma_chan dma_chan;
 	struct pci_dev __rcu *pdev;
 	void __iomem *bar;
-	struct tasklet_struct desc_task;
 
 	spinlock_t ring_lock;
 	bool ring_active;
@@ -241,9 +240,10 @@ static void plx_dma_stop(struct plx_dma_dev *plxdev)
 	rcu_read_unlock();
 }
 
-static void plx_dma_desc_task(struct tasklet_struct *t)
+static void plx_dma_desc_task(struct dma_chan *chan)
 {
-	struct plx_dma_dev *plxdev = from_tasklet(plxdev, t, desc_task);
+	struct plx_dma_dev *plxdev = container_of(chan, struct plx_dma_dev,
+						  dma_chan);
 
 	plx_dma_process_desc(plxdev);
 }
@@ -366,7 +366,7 @@ static irqreturn_t plx_dma_isr(int irq, void *devid)
 		return IRQ_NONE;
 
 	if (status & PLX_REG_INTR_STATUS_DESC_DONE && plxdev->ring_active)
-		tasklet_schedule(&plxdev->desc_task);
+		dmaengine_schedule_bh(&plxdev->dma_chan);
 
 	writew(status, plxdev->bar + PLX_REG_INTR_STATUS);
 
@@ -471,7 +471,7 @@ static void plx_dma_free_chan_resources(struct dma_chan *chan)
 	if (irq > 0)
 		synchronize_irq(irq);
 
-	tasklet_kill(&plxdev->desc_task);
+	dmaengine_kill_bh(&plxdev->dma_chan);
 
 	plx_dma_abort_desc(plxdev);
 
@@ -505,7 +505,7 @@ static int plx_dma_create(struct pci_dev *pdev)
 		return -ENOMEM;
 
 	spin_lock_init(&plxdev->ring_lock);
-	tasklet_setup(&plxdev->desc_task, plx_dma_desc_task);
+	dmaengine_init_bh(&plxdev->dma_chan, plx_dma_desc_task);
 
 	RCU_INIT_POINTER(plxdev->pdev, pdev);
 	plxdev->bar = pcim_iomap_table(pdev)[0];
-- 
2.43.0

