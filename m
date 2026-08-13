Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E508B4503ED
	for <dmaengine@vger.kernel.org>; Thu, 13 Aug 2026 10:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786618476; cv=none; b=OrUlOJa/fGY8NN79iEOWMw/PGaFTAapCsYEhBwYt2MekLR3FWs/BCcpGghtyoCZWZyVyi9loZNiGYuTDToQsChnY8KCroZLWpB4OXAF6GMJLgzWk0YiMGf4FNH3x9hkBBo43j/biomL9JWUUjrBRSN/PVpxYI57qzFAAlO5Zt4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786618476; c=relaxed/simple;
	bh=Gy7scZmeerBSr7PmVaP7q0xEqYZTtW6OqxPH0TsjCig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K8BWsfWB5lDbgwYqXM7rcz8RNyY9Nd+0PRdqNxkW7fTPwon5xWyL0QV20ZcB7CW6nDN+dNINU9zoiRUqOm7GxwBRfhoC7KtJtg+XIhRESZlUYTwqV6FxQqvQ9tfMftQ6Lt7fVCC7v0PTq5h+Eujf2d0nlT1ZNVm5Xkb00SC22YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMQcfpA0; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMQcfpA0"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cbedb88aa34so520631a12.3
        for <dmaengine@vger.kernel.org>; Thu, 13 Aug 2026 03:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786618457; x=1787223257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3TGfFltkMtoPUdIhLUzSLkz57kkTwRQHJDF5g28rmK0=;
        b=WMQcfpA0lDohhHRXM4PyjQo3Pr7KJiLleAom7h/88W+sS7TK9dgeReh7SjbUlOfysP
         ReywFdPUElPkwkmiuFGeKdFTH8sxVw3Cd48L1S2eY+0Fs1nRKK6amXGGuA43pHbNGIYz
         1dXKh0IsqVsKzGyQUM+HSDMaV15hFDJjqvwBX3U5qNVaa5TqxEACEkgrBAmd9BInP/hH
         mTTSZ7rmerY0WcOC83QyonzAe49lupOMuLfRnXgGsw23dDUx6xQ3FkqOfWFa2xUNP0OB
         witH2/qvvBdg3DfWFmRB8+BXHAnx+tjYuQ2mRcEpdKWCkPaDQDF/afpl5OptSo8u8O+/
         SAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786618457; x=1787223257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3TGfFltkMtoPUdIhLUzSLkz57kkTwRQHJDF5g28rmK0=;
        b=OztKrD5mdanE3XjbgLj5lMYIqUENsXDaN+wafEGvEk96sZSd4nNABLSiOQd4/3eQ2u
         F5OOEMDAEmeETcpwF4tI7gOfSMQATD+PqdaAxKTjrjElO/LlaL9GFRJPd96wxUySyTl3
         o41rEYQ/bkxlw3vicTX17guWZT0sVyh0WLCfLe4UxyM6PcpE8Zkp7HzHJYyxIAItWyD5
         Vc6mdTh4qrX6pKQOX3Rrg7pZlNAY9Y3egpgk0hDoB/X+U6TBKu+8jVA9LZpEoIgRmhfk
         d/Q28MGtkH7WVJ3DivTJyW3B274rx85/xJhTlHny12iUX+cJeFLDX4EXpSUcWb1rTXli
         NDRQ==
X-Forwarded-Encrypted: i=1; AHgh+RomSo38ld4mKurXkP1WchtHI/u0A18H8ccBe/Zvv9cZqtdH4WA7N/fVTAHLuLIvQgybWtBxr6wMp9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjKxR5FBWV7PWwwYYd8aWpcVcnuwlRpxUt9aXY7+9+REGi1twi
	S/jk9ThBZrZA4OJDtrbA6S7ZjQZ74Fwj3Nsp9avEiRcgmDQC1aiGElTF
X-Gm-Gg: AR+sD13o5TRY1jO67dhCuNeambptDU65uTD4ISRF7ZW/G3etNgObVb5S8BNyceWGk63
	g/VRwkr7REOdHYrVRIT5nyIZO9gxHJ48TTONHgeP7J3WyA0LAoSV7axXIwUTAwJUZwCYSxxMUMY
	xhLzIL8nVSrJLEf6Y3IPNSXnv3k5P9hvrjlGBGPAQXj/YToEBb06GQ8RhSF9fwnVQkN4feC/SKF
	f848w41cGfSNo7KoYTQIOQW9dBdCPtCTZ7eP8I6SecBcWFbREdIKtsXA1/0E2/O67JdtYCAQEpU
	4mhIK8/37pnnPRaIAznyzFA4ekPy4YSD1B4to9eT2xYiaXDrh9R5S/AdioDrm0iPwC8Xxj49h8Y
	Ynix3Hyp4M3fV/epK+vg28ob6U9HxPpR1gXyqmmhwgpS/LmVocsIeY6ECyZYwp1csvRkGZQcKGs
	idlJoOSwchvya/OmeLulxM50Qmu3LLXvh/BWqTpzzASYKCil3s5Lyl/TwXFNsDeAqIHQxz8+LVp
	J+oQ3xcy7zYYw==
X-Received: by 2002:a05:6a20:729f:b0:3b4:7b3d:179b with SMTP id adf61e73a8af0-3cc5508c813mr6357614637.12.1786618457246;
        Thu, 13 Aug 2026 03:54:17 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1412d8a8eb2sm11623804c88.3.2026.08.13.03.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 03:54:17 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>,
	Chaithanya Lagisetty <nagachaithanya9911@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dmaengine: sprd: fix clock imbalance when enabling ashb_clk fails
Date: Thu, 13 Aug 2026 10:53:54 +0000
Message-ID: <20260813105354.2577040-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sprd_dma_enable() enables sdev->clk and then enables the optional
ashb_clk. If clk_prepare_enable() for ashb_clk fails, the function
returns the error without disabling sdev->clk, which was already
enabled. Both callers (probe and resume) treat a non-zero return as
"nothing was enabled" and bail out, so sdev->clk is leaked.

Disable sdev->clk on the ashb_clk enable failure path.

Fixes: 9b3b8171f7f4 ("dmaengine: sprd: Add Spreadtrum DMA driver")
Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
---
 drivers/dma/sprd-dma.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
index 087fea3af2e4..3ea5c3ba1a8c 100644
--- a/drivers/dma/sprd-dma.c
+++ b/drivers/dma/sprd-dma.c
@@ -270,9 +270,16 @@ static int sprd_dma_enable(struct sprd_dma_dev *sdev)
 	 * The ashb_clk is optional and only for AGCP DMA controller, so we
 	 * need add one condition to check if the ashb_clk need enable.
 	 */
-	if (!IS_ERR(sdev->ashb_clk))
+	if (!IS_ERR(sdev->ashb_clk)) {
 		ret = clk_prepare_enable(sdev->ashb_clk);
+		if (ret)
+			goto disable_clk;
+	}
 
+	return 0;
+
+disable_clk:
+	clk_disable_unprepare(sdev->clk);
 	return ret;
 }
 
-- 
2.43.0

