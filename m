Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798717;
	b=Sdsl4gykVCF/jSwXdIuODyUvmJOCEEBzlLdWyBiP8Iy+1gHpIIyRK7ySGxuqMKit09C7
	 0THfLLn08j1JC5f0RDBGvAtDY3slZfCo0IcBIX4siAYgNCD/I0BQs/65djLvgZlMXGzjm
	 DML9NLDheajylLMDma03syHVkI9zrR6+K2IGbaqckgFVwYm4+tEYT0uK8j+lYWoRXJD+C
	 nSPgVSN131lWKuiK2UKVtpeW+rXYZVv0bO8SHKfD61EqZlxFpmG9/iqVNxvOSg18zrCgY
	 fRd1yRp7QSOoL4+P2puNSeJCW7u724gHRmwPfCOXBWadUlIo8rft9DaA3hxRyKyHoaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=YfW4t08Q03X/zUbnd8o9mtH6qAgwrZpASG2xurECUh0=;
	b=uQRJErmyc2aL/o6pGyUvtnyvlZhz+Ke7ijFmdzBOPhbhpnJs6Sr/R+FbsZ8mxrT0H3Sz
	 5axR5FHIj+owYBVLnGMt5i3Nl3SqU/vxunX0bCysirhCxTVOJQaNAJd18K8/rx+Zg5wym
	 W7mkNrIqoqUqbKVUFRs+rJ+5sbpsDkYKt9+LfYT3/1sFioHOHC6JZUbBpeVMMg5BMejNq
	 6UanRjpaI4xW9LhxB4JYs0veVkxR1SHXfcTOoWXdAUkj3Wk/c2WfPR/uyx80K6sQQ+LKu
	 /cP8tA9KMIhY//hReqNIyZN8YHoKNoDFB+kEHbhFUB1eqiQFrOXdktHNCYvmMWihCaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="MQby8fh/";
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBE9606A336
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 23:38:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FBE9606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MQby8fh/
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-4a75171af39so512234fac.2
        for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 16:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798716; x=1793403516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YfW4t08Q03X/zUbnd8o9mtH6qAgwrZpASG2xurECUh0=;
        b=MQby8fh//diF/BA4o/z2gQ07eeazA+mkmhYUXU+5xY+9MI6k3SDA3YtvItayMDaCUE
         uTdjfVQ2HENu+ogiwlIRtKa747fLdfhcyYOS8rkeMgYxVl+D+AxgJ7BFZvsaUdu9Jimy
         cDz6ZExZcuzurflDXmYwQgq4/8XAp7a9yJ6HphdP+26P7PNDTJIYltFSwh/y9oTfCcQX
         ww/IbBiSZSC9Ig6/ZvaWW+XePAl8tdmOl00NMPEistzfQQWJNqJeAEiMNAjhkPWVxCg4
         FD3fn4A7AuFd7HUOnZMyIAVSlYtExbMkWVv5/MGA2aD/j1VJ9nuoc6ahcJzf267Yhv1l
         5F0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798716; x=1793403516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YfW4t08Q03X/zUbnd8o9mtH6qAgwrZpASG2xurECUh0=;
        b=DAv3TeRpeZbhx6jyX8uK2tyOVmk8RB8pK8RvP+Wn8WokMTjlRy32GBHbPPwRs0Onho
         Ul/dxBj8a026BK6ULgSrF3mqfEizSZ9uP4J9/kSTJ/Qm80BsRZbF/k76mk7PggiEHplm
         kqU4YBKzMgqNj1T+Da9yjU/l+KvKaDmk3eMVF6WcBncSiizPSSMbtUIDHWzd+hGSEa5O
         zdxIPBgIb3HWEBGsN8bQnq29RX+AO2cDnGuHYpMagVgFG4tDYmg3Frm5aXH4WsCVTlI2
         3KPMd39A/S1vmhhB/ehVqF0SV2qsNmx/GuI/S3XOV9yPrDb5me23tXXJ+B6nTcJnZhH2
         p9Zw==
X-Forwarded-Encrypted: i=1; AKwUvByJae9W1pIW3WT7ZbS5CesVQ/BBk/zZ6IlKKNFpAr6k6iOqbmLgMXyqNAzZ3+A/0QYdY+YTidUD3Yw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJy6Nkhjq2e+eP+kKYB+42M+meKN40CD6M2lm+dblRZ9mGl77io
	H++t3Gt7u4OHCLUtvO8OHppagBU0y6EEvV7/uJTmHyYdXpydT5AKjnQo
X-Gm-Gg: AYBFou0/ph3j8dBJ1o4xO9Nv8bX7CLUzQTPMZKBf+hBZGD39+o6yiwnLkXV7WdYNF6k
	MWPBfMD4Tsv30i9nuPuIwbLtC6qMn0+MVKdLUCYAVpy/21Aamiqm89tzGJbhAK0KDTDZ437xIGO
	Ffg5lvXCVHN2Axpu7Tvdzgpsm0AvWx9stEIDYkDI2VHjctZoIY/cotfqf9Ktu4+4iNwXEyy5iVS
	aUXaVraDM+YNEVddMxMhhscCYJdlRdS17V6PzAr7abkih8Gp3OkPmjBqMZTgwkVRzOD9hZJ+gaL
	GqrowbwMru8U3xySmEJQm3M1Lx+LpMDjefAC21fnBniNAOfAdcM95fhXAAbpPulsz55zPITvTUE
	9FJ7bXd2DhFSvoX9u0GDKVnesDhPraph6RVRyfAeE0dfq42neE216tI/A8wt6EumiI/08tsXTkk
	kkMrSnuFU6o2BmODJTtfiPsFEeNB+VgY+bN16lqCZeV3gu9w9tKiL9Vno8DeynULgFa3ytqNeCf
	EC6XNPkAaoJIJLvVB1elF6m30jM6eisC5Y9G7d1l/qc7UEey5ByF0jouxdFKeD0hf4NuRz5TqbM
	8WitSf89n3ig9g6Z0IBDAKg/c1DGiVlame072Y2gLqC8gIKXVaQLclsJQPJB/UbyGpDQ0apC9F8
	q7T3hYT3g3VJLJa908Ih6YisIbiAqX7RP+/J5wMtGdvQ5fTg07cAYLeVpE/vDFkLn2/Jt6FwQF8
	c/RiV9
X-Received: by 2002:a05:6871:878b:b0:4a7:443a:e6cd with SMTP id 586e51a60fabf-4a83f1d782amr611734fac.6.1792798716050;
        Fri, 23 Oct 2026 16:38:36 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:22 -0600
Subject: [PATCH v3 3/9] dmaengine: sun6i: take the device lock before the
 virtual channel lock
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-3-ef1acb0be768@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The pending queue is protected by sdev->lock, while virt-dma uses vc.lock
for descriptor lists and cookies. issue_pending() and resume() currently
take the device lock inside the virtual-channel lock when queueing work.

Take sdev->lock first in both paths, and inspect the physical-channel
assignment after acquiring the locks. This establishes the nesting order
needed to keep allocation and descriptor startup in one critical section.
virt-dma preparation, submission and callback processing continue to use
vc.lock independently.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 3a6525dd3d32..435d7daa1c0f 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -952,23 +952,24 @@ static int sun6i_dma_resume(struct dma_chan *chan)
 {
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	struct sun6i_pchan *pchan = vchan->phy;
+	struct sun6i_pchan *pchan;
 	unsigned long flags;
 
 	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: resume\n", &vchan->vc);
 
-	spin_lock_irqsave(&vchan->vc.lock, flags);
+	spin_lock_irqsave(&sdev->lock, flags);
+	spin_lock(&vchan->vc.lock);
+	pchan = vchan->phy;
 
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_RESUME,
 		       pchan->base + DMA_CHAN_PAUSE);
 	} else if (!list_empty(&vchan->vc.desc_issued)) {
-		spin_lock(&sdev->lock);
 		list_add_tail(&vchan->node, &sdev->pending);
-		spin_unlock(&sdev->lock);
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	return 0;
 }
@@ -1057,25 +1058,23 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
 	unsigned long flags;
 
-	spin_lock_irqsave(&vchan->vc.lock, flags);
+	spin_lock_irqsave(&sdev->lock, flags);
+	spin_lock(&vchan->vc.lock);
 
 	if (vchan_issue_pending(&vchan->vc)) {
-		spin_lock(&sdev->lock);
-
 		if (!vchan->phy && list_empty(&vchan->node)) {
 			list_add_tail(&vchan->node, &sdev->pending);
 			tasklet_schedule(&sdev->task);
 			dev_dbg(dmaengine_chan_dev(chan), "vchan %p: issued\n",
 				&vchan->vc);
 		}
-
-		spin_unlock(&sdev->lock);
 	} else {
 		dev_dbg(dmaengine_chan_dev(chan), "vchan %p: nothing to issue\n",
 			&vchan->vc);
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 }
 
 static void sun6i_dma_free_chan_resources(struct dma_chan *chan)

-- 
2.53.0

