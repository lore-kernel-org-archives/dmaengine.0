Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792520354;
	b=p2gjMjMqEW0Tq9ANodzdXAi6fpGeNyatmnd1QgROtF/A85RkCBBu4AlHF1f23MMUV8Kq
	 ubvKr56JaAjHRMTSQQBdJzwZQJ4NKvheyr4OlpLhhltuePt6arLg4VKSVx6Gp5UzBFJHT
	 I5e6P9RjkpK5tqMSYfUTCFTKvThsdwrH08bFAQSMQqIXO0/Cotww2+Eb9hDFOThsuFKpF
	 KOXr1ZAvHMdkVaBD0HQl+AEiC+VuhUv0YkBtQx8+OLvIbCvEC5IcIRZDLj0vFNtvo4fsy
	 Umw9BnQSANz5J5WymsHDvoeSzgGI63icYbXxjm/K3eSnCAHX0mkwy1KymoEEPcCChXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=8ImmY1A1gNWSeQw3sHZE62qy/18d4XJL1KnxNgP6u2k=;
	b=pL6fXFnRKb//TWeuMR4Nr6ENGBa1gAmVzXcAQGdpzMGwkkaNU6jecjBq8onGVc6/Z4d9
	 ayEKiqV8O2+emObgr0Cgck1JTDRAi8sAcOyIu+TYt2nFMr0M+wOqMyHRc+IX/HbFbCoZQ
	 ZleOYbckLYPAwu8IDmZWwfZr0i5u9LBaNRy5tmVwcOOTrRmWPMak0YF1si0nw6uB75Gx2
	 88cEhkwL8Q+fU4geEZvwf5UkkUJIc/xs5wxeqSqZeEHVCHn+N4RsX2MbsulqSw8tY4Xx9
	 3vyYvrsNdNq5QUKeB8+9FyyNjLTDEoevCiBOzeNS9NUk+pLVrANgplRCIceVnRIjG4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="Jl/ktade";
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC94860A2621
	for <dmaengine@vger.kernel.org>; Tue, 20 Oct 2026 18:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC94860A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Jl/ktade
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1d7c3b38eso27808985e9.2
        for <dmaengine@vger.kernel.org>; Tue, 20 Oct 2026 11:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792520352; x=1793125152; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ImmY1A1gNWSeQw3sHZE62qy/18d4XJL1KnxNgP6u2k=;
        b=Jl/ktadec/H3O9gByQZ1sspJMj09kc09nFjExTNa/XMy0Wtn56UC2pHBeov8wUdBbr
         /3AFhZSPyEquwX3TC49ypzEDjRkfQ6T1gBDXfwFk3aKSFNFhOSk8qL4TQugDRY7xpRgX
         h2VULTIHp/qFM7/u/F0Bk2p4PCngsuaZAqjMua44bwWJakYkx8JJ8TWQywl45PD3sifB
         9F6ouwV+saw+lwb0lf+slIdddT2QGnqG8sYg54YzJsmURaDZqB1BvQvt4yi4TW3KkKjy
         0POaLQinsg2rC1R9AOZ7DkgYbV2Np5zcuQk/cj84AQA2i67IFK7yXS4d2/ymj112Y3Pv
         1KKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520352; x=1793125152;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ImmY1A1gNWSeQw3sHZE62qy/18d4XJL1KnxNgP6u2k=;
        b=sjYAYxeu5qh5Z9rhnPxHw6RJ53rwiovu3ZFiU0vNoyU7fPWHaql/11/uhww09YgrRd
         eGrdt+G/NKo9M/Iyomy1bO1+bcCOJcHUFpI065mhiwPBsBCWwbmcylL7MMKDo5uigW8h
         mHiyMFGBQBeT1zqHFA56ZtjrlsWwr9fSEbWOQX04MzCkNSJ4KC96Br8SQHvD3oEoVA26
         +k8g829aSItAWg+mgujKlgrjf1kBbUBI3hIHMQ49V5JVdvV1S9ecFvxLiBYpx/25ttQ/
         WA6TTisd3VRCKdQVrZ2kOf5FM7dKFStlcQn1VD/hOwKqMRr62YevqKuiuclZ2ZUISOi8
         Usog==
X-Forwarded-Encrypted: i=1; AKwUvBy0GOC8M66n3NJ9X7276UFRp6opK37INQuwCKyZvK3pbVNgX4T4/vI59azY0vsglC1LRMwzePMhhPA=@vger.kernel.org
X-Gm-Message-State: AFq9FYITnLZq1p9Q0htja4iuPFQcqQu0GCz6wYaYHSOFqfpY2qdwiopG
	i/6Qyn7qQb7RhsYMI9KKCxZub/y/MMo+X0PDkiAofa0UEO8+tSRx46p/ygnKKMrVG3nPi7++oKT
	ow3CwgnDEp8FgpA==
X-Received: from wmc24.prod.google.com ([2002:a05:600c:6018:b0:4a1:e348:29f1])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:820e:b0:4a0:174:579e with SMTP id 5b1f17b1804b1-4a1d761637amr244812425e9.28.1792520352280;
 Tue, 20 Oct 2026 11:19:12 -0700 (PDT)
Date: Tue, 20 Oct 2026 18:08:03 +0000
In-Reply-To: <20261020180804.140766-1-smostafa@google.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020180804.140766-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020180804.140766-3-smostafa@google.com>
Subject: [PATCH 2/2] dmaengine: qcom: bam_dma: Do not touch remote BAM in remove()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, 
	bartosz.golaszewski@oss.qualcomm.com, pramod.gurav@linaro.org, 
	andy.gross@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

Unbinding the crypto BAM through sysfs on X1P42100 resets the board.
bam_dma_remove() clears BAM_IRQ_SRCS_MSK_EE unconditionally. For a BAM
that is controlled or powered remotely the register may not be
accessible: the clock and power of the block belong to the remote side
or to the consumer of the BAM, which is why bam_init() already avoids
every register access for such a BAM when the DT provides num-channels
and qcom,num-ees.

The write is also unnecessary. On a remotely controlled BAM the driver
only ever sets per channel bits in the EE mask, in bam_chan_init_hw(),
and bam_free_chan() clears them again. Both run on behalf of a
consumer, which keeps the block clocked while they do.

Skip the write for both kinds of remotely managed BAM, using the same
condition as bam_init().

Fixes: 5172c9eb89d4 ("dmaengine: qcom: bam_dma: add controlled-remotely dt property")
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/dma/qcom/bam_dma.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index bd583f78e0c1..d818fa1dba57 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1407,8 +1407,15 @@ static void bam_dma_remove(struct platform_device *pdev)
 	dma_async_device_unregister(&bdev->common);
 
 	pm_runtime_get_sync(&pdev->dev);
-	/* mask all interrupts for this execution environment */
-	writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
+
+	/*
+	 * Mask all interrupts for this execution environment. A remotely
+	 * controlled or powered BAM is left alone: it may be unclocked, and
+	 * the only bits this driver sets in its mask are the per channel
+	 * ones that bam_free_chan() cleared.
+	 */
+	if (!bdev->controlled_remotely && !bdev->powered_remotely)
+		writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
 
 	free_irq(bdev->irq, bdev);
 
-- 
2.56.0.212.g129ede20d9-goog

