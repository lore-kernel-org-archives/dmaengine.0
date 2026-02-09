Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE351338F26
	for <dmaengine@vger.kernel.org>; Mon,  9 Feb 2026 09:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770629826; cv=none; b=OY6ascP+xqv9UDtdaiilUflHg6fxlndyWkrHKvLSwn5s27s0cQN+n7n6VKNnzwITMWkS+jmIilbn1DLSI8+9L6TEMRVOdbVXld3nZPbM1TYsbicOZ1+J5AHdfsUavPQsR1iT5cpVVn8G5R2U/6CJTbnVC3UYWEOwx+R0hCNOFhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770629826; c=relaxed/simple;
	bh=wOG+XZyfJ1ECBp3bdpMqJuYFU9m98cCaqUKQHSPHqOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hq5A5+9M7bEK6zYKtD5pY/aKoHAKiqdPeN/HRwRHI/jKkYdW3HJ2DtX20IQL7mmc/tVHETa+K+nMHBQdMeu35QE/ULSV1pBz/ENlH7wifZsG7TwBcJx90vKI+r5/0S2V35AXc0+Xq1r2Os9rzks0cY43sgdVkeW/LZFe9CJwLcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DEeuIrq2; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DEeuIrq2"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-81f4f4d4822so2245233b3a.3
        for <dmaengine@vger.kernel.org>; Mon, 09 Feb 2026 01:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770629826; x=1771234626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5teP0ad/u/RJjO/iZ2u1LHked4QjrPKeg2T8iSxlEY=;
        b=DEeuIrq22pAFomBi8i/oE8lF+pT0U41/zbI6EQpB+O5M57yDlkrthpVA5jje1pZnhm
         qqxTs8ydOV0gRbfYn9vMZmtKzuBJTUs31mYDCWdAEp5N0xjJAxopp1roKYMPD08C0aNs
         lvfumTW8sxyv+Ygy6A3cenyoNiWIl4A5mQD6/A4qUuEyotovMKkQBYycTfQhDtv4+u7n
         YFyJUUnZK1oYI2MQeEFmB+rzlr4YtqDs0he1n4ajp1uA+eWjYm6Z3GGq/GOiHVM4jHEo
         LMFqqSTvZvly2vCsC0+4JNuVgSW0gEBdREI+C9Y9hx8YxZnY9KxnXP8igUTeG2lBepaM
         ysMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770629826; x=1771234626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5teP0ad/u/RJjO/iZ2u1LHked4QjrPKeg2T8iSxlEY=;
        b=OiAHnAXpewrk0pRjc5+udopYQZOidpS1GPO3TvH+WEZyeArQMEiW5/ipLc14ZL1clT
         rCogeZy/PgzWGP3elBZHA0/bpYTEFkwO6FdMuxDOCf1X67VnIkTiy6Rx8Q1kaAhxJFzs
         +lOk8824kzZL2I/PmJXTRQpgDPDl8HeaS0Dr3oMmMYBkN7Gm7CzA1ihf8ua8rBNzGPwo
         p/5tFouVhqXzHrFJ1RUaut4WxhD4W4QxK6GRlvWEA5H3+7eoMQH37l1SS0VamwZly6QR
         Dl7GyZpvEf6iknwTl6hQSRIUjeaTjJlXszRsuygy0FZVlizzMy9yvh4FgRvTGaLHm6bU
         0IQw==
X-Forwarded-Encrypted: i=1; AJvYcCWd4U4IppWknSRrARYIOc/3ghqTcgUsIbxOBk7Qsd2cbj02AVErn0eeId1ozN4LVhuLnLgM9Ouvllo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwniOy98BWL3ReNp4qM3myC8V7N5vaYp92D7AOOhhDV3PXHyeLt
	1pGfN2B0dHazmrVdorRhPxEd+wQcrgDuAyPjgEwHBY41YXQApOzmJtvUsjhlkqDvHOs=
X-Gm-Gg: AZuq6aKxGD1K4++Y1KQ6CpX/5gRHCJ+Xly2c8PT5kScEY2mEeDp8ypDigmKu156vJG3
	iYXXBYNOl+dunOdR0C0ON1jvebSswMz15IvPpCgII0X9F6nU8VHvWiiWskGl34ognOdlrnhcllR
	bzNqQJW/wlZ5hI1NYPy68fxT/jM1+Fc5XRsPUHqFNAuox2fubglLVDbUYHcGPUJQxxQPH/SR7ML
	w9wyzlP2H9fNCxcKVC12rxidT4JQ1IVdtDXit998BBT2oPA7E3BM4TjZjT+nAPJRuk9nj6j9w9W
	wJWdGEo+VEvg8nKi5XisdZ4A65ZQL+MvWNnC94bQzuNU55GzT6tAtZPOBcrbIO6zgaZORoATfYk
	kH5yek9n8ZLOCD+bB8NguhEUPZ7fDEmSEr6VUXhC3gpoULT+nbm3PERM04M/i4S2YMoXTsxCClj
	YASvT1+7HsZwWFNAYZo3zWcn+W97oKU2Ye8fM=
X-Received: by 2002:a05:6a00:908b:b0:823:3078:f684 with SMTP id d2e1a72fcca58-824416f2555mr10247075b3a.32.1770629825991;
        Mon, 09 Feb 2026 01:37:05 -0800 (PST)
Received: from localhost.localdomain ([171.88.165.217])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824418b60easm9917610b3a.55.2026.02.09.01.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:37:05 -0800 (PST)
From: Shi-Shenghui <ssh.mediatek@gmail.com>
X-Google-Original-From: Shi-Shenghui <brody.shi@m2semi.com>
To: Frank.Li@nxp.com,
	vkoul@kernel.org
Cc: manivannan.sadhasivam@linaro.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	brody.shi@m2semi.com,
	kevin.song@m2semi.com,
	qixiang.zhong@m2semi.com,
	tom.hu@m2semi.com,
	richard.yang@m2semi.com
Subject: [PATCH v6] dmaengine: dw-edma: fix MSI data programming for multi-IRQ case
Date: Mon,  9 Feb 2026 17:36:42 +0800
Message-ID: <20260209093642.273-1-brody.shi@m2semi.com>
X-Mailer: git-send-email 2.49.0.windows.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shenghui Shi <brody.shi@m2semi.com>

When using MSI (not MSI-X) with multiple IRQs, the MSI data value
must be unique per vector to ensure correct interrupt delivery.
Currently, the driver fails to increment the MSI data per vector,
causing interrupts to be misrouted.

Fix this by caching the base MSI data and adjusting each vector's
data accordingly during IRQ setup.

Fixes: e63d79d1ff04 ("dmaengine: dw-edma: Add Synopsys DesignWare eDMA IP core driver")

Signed-off-by: Shenghui Shi <brody.shi@m2semi.com>
---
 drivers/dma/dw-edma/dw-edma-core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 8e5f7defa6b6..dccc686b7a3e 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -844,6 +844,7 @@ static int dw_edma_irq_request(struct dw_edma *dw,
 {
 	struct dw_edma_chip *chip = dw->chip;
 	struct device *dev = dw->chip->dev;
+	struct msi_desc *msi_desc;
 	u32 wr_mask = 1;
 	u32 rd_mask = 1;
 	int i, err = 0;
@@ -895,9 +896,15 @@ static int dw_edma_irq_request(struct dw_edma *dw,
 					  &dw->irq[i]);
 			if (err)
 				goto err_irq_free;
+			msi_desc = irq_get_msi_desc(irq);
+			if (msi_desc) {
+				bool is_msi;
 
-			if (irq_get_msi_desc(irq))
 				get_cached_msi_msg(irq, &dw->irq[i].msi);
+				is_msi = msi_desc && !msi_desc->pci.msi_attrib.is_msix;
+				if (is_msi)
+					dw->irq[i].msi.data = dw->irq[0].msi.data + i;
+			}
 		}
 
 		dw->nr_irqs = i;
-- 
2.49.0.windows.1

