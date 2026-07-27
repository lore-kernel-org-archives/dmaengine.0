Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB283B6C0E
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184815; cv=none; b=uJJsQ1lOTnzbPqwrWo+GpTx9MoPDCfOQHRM7x0GWw3KOKlYn89QO7vtTI5NFmu9huMedmKX5sOHEWM6hltLg+qR0AedNDCYv6ctTWyeHg2G1wgqlyUm7YkzwbyhySwh5qE3lD4wmK/nAt1cHvkmZY6GiBfgvmEX6Xr1a4naiQ0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184815; c=relaxed/simple;
	bh=uHZVnb30wIsgc6Kt8pDaUrv7PQ26TF16B0EOiDXHym4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bM0Vnnk/MRAMibi5KH+GNBecNoRB9O8hGBXU5njIn79FodIGn2Wr1RlNvzhoPZ/4IbN9nPUzydexlsQf097TG43lE4la5p960fUzWmcN3x+5Uf+7qqhEF2UhI0dVBHQC9OVTRznwfjhxCvuIN+QHPL6V/+nN6n7ZiJYQ/7tEDyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xe90j9FS; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xe90j9FS"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8486672f03cso3097330b3a.0
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184813; x=1785789613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9jR98ezuxelrj43+jWKGUk+7Aon5+dlt1K9aM/WkanU=;
        b=Xe90j9FSW2YbolwgR+HFFmPny24cnJXRglUDrWz7GI+6po0uIohsKqQLmLRukIWaji
         aZnw9xaD+IifK3JsbHyXXIqS78E+qDRFr5tiLD+o0wyRcSkehUpAaPfk7Qj+hmTinK5p
         G/Xcvd6KN4MCpuIdqfnBhNQlKi4uufOT4m2wQd+gsTS/O5vaKtn7Nig1Wkxp4hRUlvlW
         4rHkZT9KNwb/CAFvfGOHKkMbP3CpBL5wQ6AzSsHoSsnBq3yV2yYmG2y4l4nt8QUak7OL
         74XDJ6nyww9l/XKrKhjw1P7+Emx5lsludslH3ndBfeKru05raBGkKzxeGoqo0jNXhigL
         De5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184813; x=1785789613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9jR98ezuxelrj43+jWKGUk+7Aon5+dlt1K9aM/WkanU=;
        b=PaVPmQ9F9nV8D3HUazUqKF1jxPv8zFtP52q765YAcXvQ87eB0PiacdAVXxpApPIbfN
         bxquicweUPnOcYI9OyRZZwbtJ9tlIWvfrb8YViD3WQQahnftGeMswRFJbAiZvTP6vuae
         8Q5m6do3mtrKoI8YY4RuFgDEA8kJ6p6NrGaRcomkn4X6hfYMw6JsD0D+gz5k1YGYB8zM
         JLdAqIM1F19WqSdXdflw5aR5uqQw2eSpcGiihFdht3EelGmDQQx8XSArgT/eqtEJ65KG
         ER7umanW2hSE+TDShUvDKq3DOVmjCKqS7ijdrH3+K5MxpHJ/9vLAEVt2zH0+uCjQ7/3p
         ZH4g==
X-Forwarded-Encrypted: i=1; AHgh+RrmHis8ENXZ2hdIJ9/pBbcZt944eCEZ/aEVYUI4eD9zegCcEN42hndgyuFwmQQYalWVroIl0bcDuhM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3BIy2qKBC61VuPnQrFR6hpqaIhd2lcwULflmvj/4DBTWcwKYD
	+QGirCyEbCZcPnuFiVEY7l+Nb7uEEuZQ0WIUDx9nfKripFzxprOI3RkC
X-Gm-Gg: AR+sD12POxX4g7/J+lTHTTd8tsxKsWo+Qlf5VxLl7tm7zUBHbhZDYCTgaRYr167w+gL
	qPOVTk1fkbO2PF+mpNRG1M51Xabv3GUFsd8kOEFhzTrxd3TG70kYuASWCbRC5TCzGWzZPd2iMLA
	+r4/Z6faVaepyZWm4q5cXw5HxrqxkenExBYTKrqq/UbGBDRJGbjOxdJ/d0ddhbKkwWhljtSWDEO
	3HLQuwre60W3/iRC6fm0dnHwX2Sg5iTm2cDzXUrj+rcXPl22nfGq8VW8Db3MpuMzglmrKgR8Mwv
	e/bPY51GS2I82jh7wzdnW4UxGTtXgx4VRoKNeLMPeaai5JmgY38cCril11ITqpmzIL15Tpbyhwg
	J5IoBvY+ZJmY6GjhqukK/STApUTG/0COb8dgb/sdFEs3W8Ykm0o33wllhyHoBOnAebxu1wEhF0s
	pZNbqm5OffCDeJGiI=
X-Received: by 2002:a05:6a00:32c3:b0:848:55a6:fce with SMTP id d2e1a72fcca58-84e595718b0mr7412619b3a.62.1785184813229;
        Mon, 27 Jul 2026 13:40:13 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:12 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH v2 40/64] dmaengine: dw-axi-dmac: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:39:02 -0700
Message-ID: <fccc3e3233ac3232c17b41a6a67dd51c1bde18e2.1785183549.git.allen.lkml@gmail.com>
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

Use dma_chan_kill_bh() for virt-dma cleanup.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index bcefaff03b5c..5a5d569b188d 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1663,7 +1663,7 @@ static void dw_remove(struct platform_device *pdev)
 	list_for_each_entry_safe(chan, _chan, &dw->dma.channels,
 				 vc.chan.device_node) {
 		list_del(&chan->vc.chan.device_node);
-		tasklet_kill(&chan->vc.task);
+		dma_chan_kill_bh(&chan->vc.chan);
 	}
 }
 
-- 
2.43.0

