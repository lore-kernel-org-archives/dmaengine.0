Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C2E375F9E
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184887; cv=none; b=PJPPaNfEeC7L4B5whEHcrk353ij5rcjSK3m0K6Sor2+sVpketTTYEwy97jSnJNM98fUEkbSYyQhbGtSS2znMiGICLo4TTgrmd5A2WX7jTdzJ442MWOiy66BEy3NsluGSO53UBC5+9XtxelU8sS9ZLXbpRhg+yIONBO35zbnl6YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184887; c=relaxed/simple;
	bh=1+RjEKy/8bef6J9AgL5WU4GH6Mh/0Ws3rnJl/ZvqY7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kJG639hHdmeVE9QWWb0/4ulLVL01gpqejIEHhdWABV45g6L4XxScJTfH0me0u2CY7FiAe+k2JFSj9ll2nQtoCnH9WjSLTU20/+E8zuMDPVVA7zb7STBxucoFh0ZkYcRDILWZ1sBgNCjUvK+qSpDczK68JscvtYUOhfjrA6ADrm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9B9tcxQ; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9B9tcxQ"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8485b358552so3309860b3a.2
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184884; x=1785789684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unmJIhiFh80mB2cfi/xAL5DrDya+ekG2bWj53vn2wK8=;
        b=f9B9tcxQw5H74uduiDilmoGZutbErowi4mV2gbeeLCrPZB52fz3DMGoC6T4QUiEhN6
         vPytHPxMRuA7vAF+I9zBrPIhn9dBuyPYD4fJHE72MxMvV3MT9+H8zuiNubgbhd8cQDBB
         Z1kPXCjP2Qnl6E20QgCMtbPyXHrgtpi0PigB8NFF5qYxpKTcr55PCmjXPpdd9NlxPpNc
         UwppG0olkT0Bilw1YtUsDi04moEZD6TKzOqUtufzFcq6kY+gAWnk3e2kcPT/BwcKXUyl
         TZ4MQQWRS87DoK2od8aylBbFTrPNn3CYxoJTIja/OluLns/AYxgcj5Zq+kQWXgyFa1WT
         xd1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184884; x=1785789684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unmJIhiFh80mB2cfi/xAL5DrDya+ekG2bWj53vn2wK8=;
        b=jBMzf23G6FgotiLc4sdKYkoYdPls/SLNsgbuGXjz2YO1q4Xju5QJumDiGYasmwILJf
         mLo3uIUFk0qI49Qs4AFO0xpHVq4a4i2k5aZto4rdRFzpR6Wuj7KESDTGk/jQ/LlI0n0b
         Nwf2Jjfp/3cAGB4qftTRZ2hrBgUuXg04QnINwFStUgIv5w4n0nzWZneP213fImuQDYeD
         MeWx+KzGL+oQeiLsy3atFKz2pb8iZNTde8y4qOCEJCziskzY8MVEKBIll/G3NYlbWnkx
         WeT9iJwR9guFGcbPpRN5guibXMl1kbHGRLR8R7AEBXSKJ+jYqsD9g5WrMXU8steN1oky
         A9qQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFl4Z0z6MsFcf6lyzPSCDxfsbeAma0E7TYMLXsQ6+oCKaNBQTIGjPnLvYMvEF5gMBHj8HvLrik2v8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYSgyCh6lnQ5ddNscdqFJa4KZ/bil3sy7kkV0dw8egza9OtSLH
	gkl2/So0DMfUanpm/npDcGC13t6sBQR+zqkjJxUVsOldtqIe0wzYjsgp
X-Gm-Gg: AR+sD10pLWT/wqZ37vBw2xX2ds5RJUP1l4MPB0J1EcFRQPVVOJ5AB3FQzIhPcCnVjYw
	oGI6VLeX+Riukz38jaYmSyJvdtDd5AO4GfDCjQsctNMg2djBRs3t6D6Jp5AxVAzCjoSKrbQq8S+
	V9UehsiSUt5z0CiOn6TxSw1UE0xqCherSnZ++tdReU8gmc4tBUiCI6mjt9wcoBDa/0pVHjHY8rM
	HMnck2sXhY1jRam+7uCq/P3RsHQtH6he5GSTQqQ1HBnNJfzme241aCgz/bTmkd26U3LnY2MsJwA
	4REBoeC2bz8TSiQAj1RSzSCrdPgm1i0zbuxvz6j+edAoaAwZ/Z42Cz4w6sMUcpd+6yTQzcTjCJ/
	4eiNou8eVsEeC/vUa2j6xd1HbIIhtk2SB6bp5q99QLsFvXAoRLovBFp4QCHrkXTcP5u3WejAyca
	GT/wBk1/wMf723Wow=
X-Received: by 2002:a05:6a00:e8a:b0:848:731a:fa47 with SMTP id d2e1a72fcca58-84e8d0fc273mr831213b3a.59.1785184884453;
        Mon, 27 Jul 2026 13:41:24 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:41:23 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 60/64] dmaengine: bam-dma: use dma_chan_kill_bh
Date: Mon, 27 Jul 2026 13:39:22 -0700
Message-ID: <b4d1a1d4b56f548e157a4d9d8bed785f507dc157.1785183549.git.allen.lkml@gmail.com>
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

virt-dma now dispatches completion callbacks through per-channel BH
work instead of its tasklet. Cancel that work during teardown before
channel storage is released.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/qcom/bam_dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 1bb26af0405f..74bc2fe445b3 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1387,7 +1387,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	dma_async_device_unregister(&bdev->common);
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
-		tasklet_kill(&bdev->channels[i].vc.task);
+		dma_chan_kill_bh(&bdev->channels[i].vc.chan);
 err_tasklet_kill:
 	tasklet_kill(&bdev->task);
 err_disable_clk:
@@ -1413,7 +1413,7 @@ static void bam_dma_remove(struct platform_device *pdev)
 
 	for (i = 0; i < bdev->num_channels; i++) {
 		bam_dma_terminate_all(&bdev->channels[i].vc.chan);
-		tasklet_kill(&bdev->channels[i].vc.task);
+		dma_chan_kill_bh(&bdev->channels[i].vc.chan);
 
 		if (!bdev->channels[i].fifo_virt)
 			continue;
-- 
2.43.0

