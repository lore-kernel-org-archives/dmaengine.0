Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D318566C5B
	for <dmaengine@vger.kernel.org>; Tue, 29 Sep 2026 19:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790711094; cv=none; b=LNFYbhd+b33CGhvz2ZK8Gr4xIL4BOO9yHZauRu+3Pxw1pcqFeEoe9PmfOhOIyYsjDe7W326iZ2rnvDx58qUX8lC2Z/ztU3jAOBM6BibRO2zNkVaicdtXm6x9JZoAHJ8Fdec7zoOyqUqoSmUbuVJaJrp5HkAE7ZQoFTYJsxvqiVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790711094; c=relaxed/simple;
	bh=hPRoakWCFNkBhMs2RbAhu48KvrLhveA9lMJ+VhoTSvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QnIpHbNFFDMvcyPV8ExqEfLiX6HLiVzVt0k6/7nRocQCE97UXmW46k3Z/ZPJ1utnwfhapH9qYGYOcfSRsWKrqORrJgoDYQUaTD+fYXiHIxgIhLAoFK4BPpVyyCxGt857XW/Ph5zeN8MpnVYgsh0euhe4Wq9251wjAybLMRO+mag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W2RrGCuz; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2RrGCuz"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so27286655e9.0
        for <dmaengine@vger.kernel.org>; Tue, 29 Sep 2026 12:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790711090; x=1791315890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1xPmHroPUS9i0jXfxLubKHHis3db3+ArB5MF0c1e2XM=;
        b=W2RrGCuzyiUo486ZWweqmInm0hRPG5G0t6Cg1EgLa+tV+YpF5jOgrIQAsiZ7GdCo8b
         +Z2i5tSLY9pTrw21j+6FI17GnWAa4EIm9tJrMVMZ9Z1vnpzXz611kdDp+6HNIelFY0oo
         TtbeinbHNapMT5yYJfeazHt7UBGQ/V8jmd/pgm6dv3CNe35VTRyYL5plK3MhlvPse4zv
         gMSPjzext4OLWDJPNODcfU0O598DYsWt1MZlx/OqP3qao6hobl0jjIKGtZwTsDJPPdx3
         edZ4Efp1RLcnRufEOYWxzMP9nMT5Txns3bCTDb4ulqmbids+dUcP2vE66WiiNbb96QIa
         D7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790711090; x=1791315890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1xPmHroPUS9i0jXfxLubKHHis3db3+ArB5MF0c1e2XM=;
        b=ECbbQKFErCCbTjotJeCJsHvrAkGCsZ7SWDmxLvz+yOPWKfwWvAOklomkyTftjKj2gz
         1AOOcOQGGjYVkZihxlTS5iBxvqnY+jmrJ1CbObj52kWJF40ZC6JPRIEMC3EY9vFNUsjc
         EVYfk0co3aCvTz5OsMezHR8r1UHon5kpSkxQ3JzTJZhl4+LUabJlruRHepzaErS38Pte
         AnQNHiMFypotBRmi5Dep2o7h8mAjFBzgHm9BgIDkHPmRvXAaDktzEi1CTDTUuLnwwOeq
         KPpCPwZCIy+bIJWlBWbTmc7RMD7kOQJD0WN8deru/jXu03+aKBSBAiu31pNzVaopm9xL
         Rsng==
X-Forwarded-Encrypted: i=1; AKwUvBzLBdr2faeXO/DLvnxiYmO7lsvUBvmqqb6a/brQv48qwZ04EiOe8UJomt1UB9PSZybqw6brPAth2zc=@vger.kernel.org
X-Gm-Message-State: AFuF++mfw83mPlhYnWKknVs1j0p7G6FKmrQvrAAqrA67uGWW9cxekzJQ
	1l63fv5UnbvDlCVU8u0qetop59hiqb4enW8yFKNS1H65CnkySyxx+DDx
X-Gm-Gg: AYBFou0o+VM3YumSlV997JhYhusMkwOSnOHwhulT0ysio8CtU0gHNTg+JC7PEtXddhW
	d7OdCXRwy8Dk9DLysXHaNHms7jS42y/6yY1fKI+IzyolNX+SaIjXtrgbqPtpmhQJA2oajNSoXbr
	xxEhGC6t39/0arviG394sy4i3Ibb2coWXy/d80DyGZRSSqIQ8Mg34MDpqxp8widMiJI5/bls2JU
	7arCFP7afKdvQ+4wd1WBp9h35dhU6Eq8C8d1+yzAiYCGq6VZ6M3z7WthIj0x1SFyZHB/KoH/edz
	F4QEwYqfGrshrkYkx0irDCcZz8yREFxGhZnCw1XZ9bWCeL0y1Wtb0IFnf7DwzaexiHjSW5aTMHu
	RyVXdYHec6mdLAMNT9CfKn1jAxczKfD7Y4tfhP8SyOfLcQS+MFbXIuYm45hsUP7Qr7uZAedsCH9
	5MfuZjU97VRZJXdhiaDk/AVgHvmDxZNzE+J4nYedK1YHo6Pf2zBbv5Hia0ooPg9qxw/cGD71u92
	D5x9Gg5xMKrV0gLEocWKs94
X-Received: by 2002:a05:600c:1546:b0:49f:e4ca:e09 with SMTP id 5b1f17b1804b1-4a014fd1e9cmr2899905e9.3.1790711089450;
        Tue, 29 Sep 2026 12:44:49 -0700 (PDT)
Received: from localhost.localdomain ([82.142.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a014895428sm5265825e9.0.2026.09.29.12.44.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 29 Sep 2026 12:44:48 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: Markus.Elfring@web.de,
	dmaengine@vger.kernel.org,
	linux-tegra@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	jonathanh@nvidia.com,
	ldewangan@nvidia.com,
	vkoul@kernel.org
Subject: [PATCH v2] dmaengine: tegra186-gpc-dma: Read channel state under the lock
Date: Tue, 29 Sep 2026 21:44:34 +0200
Message-ID: <20260929194434.29937-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260922072233.19592-1-ginger.jzllee@gmail.com>
References: <20260922072233.19592-1-ginger.jzllee@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_dma_tx_status() reads tdc->status before taking tdc->vc.lock, and
tegra_dma_isr() snapshots tdc->dma_desc before taking the same lock.  All
writers of these fields (tegra_dma_start(), tegra_dma_xfer_complete(),
tegra_dma_pause(), tegra_dma_resume() and tegra_dma_terminate_all()) update
them under tdc->vc.lock.

The unlocked read in tegra_dma_tx_status() can therefore report DMA_PAUSED
for a transfer that has already completed, and the unlocked read in
tegra_dma_isr() can pick up a tdc->dma_desc which is being cleared
concurrently, in which case the handler keeps using a stale descriptor
pointer.

Read both fields while holding tdc->vc.lock.

Fixes: ee17028009d4 ("dmaengine: tegra: Add tegra gpcdma driver")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
v2:
 - Fixes: expanded to 12 hex digits.
---
 drivers/dma/tegra186-gpc-dma.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/tegra186-gpc-dma.c b/drivers/dma/tegra186-gpc-dma.c
--- a/drivers/dma/tegra186-gpc-dma.c
+++ b/drivers/dma/tegra186-gpc-dma.c
@@ -606,7 +606,7 @@ static irqreturn_t tegra_dma_isr(int irq, void *dev_id
 static irqreturn_t tegra_dma_isr(int irq, void *dev_id)
 {
 	struct tegra_dma_channel *tdc = dev_id;
-	struct tegra_dma_desc *dma_desc = tdc->dma_desc;
+	struct tegra_dma_desc *dma_desc;
 	struct tegra_dma_sg_req *sg_req;
 	u32 status;
 
@@ -619,6 +619,7 @@ static irqreturn_t tegra_dma_isr(int irq, void *dev_id
 	}
 
 	spin_lock(&tdc->vc.lock);
+	dma_desc = tdc->dma_desc;
 	status = tdc_read(tdc, tdc->regs->status);
 	if (!(status & TEGRA_GPCDMA_STATUS_ISE_EOC))
 		goto irq_done;
@@ -786,10 +787,10 @@ static enum dma_status tegra_dma_tx_status(struct dma_
 	if (ret == DMA_COMPLETE)
 		return ret;
 
+	spin_lock_irqsave(&tdc->vc.lock, flags);
 	if (tdc->status == DMA_PAUSED)
 		ret = DMA_PAUSED;
 
-	spin_lock_irqsave(&tdc->vc.lock, flags);
 	vd = vchan_find_desc(&tdc->vc, cookie);
 	if (vd) {
 		dma_desc = vd_to_tegra_dma_desc(vd);
-- 
2.43.0

