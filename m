Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB2C431A39
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184879; cv=none; b=XXyQwmdyc8LZFe8CAslFScp+9d+b8I+IpsdVuaPBXji3wr97Q+PfbkdB8Q0QL1uSj3+kZ86atHaiKlHkSenjR0BF1UtDIsjA4iepACc6+j4YOQ0okoltYBZbmZPy1cDMkfEMZSNu1n0beo5sZ5X6a+1qBW4rr40Lqjf8AOiegpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184879; c=relaxed/simple;
	bh=DGv8360RKLe0iy8L4GVihGIq7u8B0cSRZqF+ko7AYtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aFHxfNL+sYDvxKxujBe4F3YCQOJJtinS5m5mAWTk0IvoA4wrVJViglCR0+YoTwBtT6zyKU+wrQ1ykHOO7dxWzweHE68GxVRs35SFp3McqNTa4xaPDzT7UqiVgIWL3jlcz34WtB3t/QItcVb7x2NKk5S6i3wPpHk4DfMtJ0nM9T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IPqKgwbi; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPqKgwbi"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84864086bfeso3048983b3a.1
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184876; x=1785789676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mp2mFbVCzRgy++K5ki5yOkjeNGsrV0pC4gPH34Oh59g=;
        b=IPqKgwbiUT5VEy2swPddl/DE0Gq0tAjD74SphAEukRZ8zqItsDZqeGEs8Fwyh6dKYK
         doCQhx2KTycvqeExppdg0OAl+LoD0ZXumtW/K8F8E7nHfy/rUbDDRrUh5DVl2NFwRJLN
         Z52AQIuaWmC/QtCoFCU6GFujQi7EAW1/CwbIna8lqQC+5xl/DQ+YKdEjKGWjgF30jxWk
         m9GHAvIo1i1s+bzwUL8rbIWYnPL4ngLB15eeTO61UInZLsgqKafuewNRHdsXhWA/UtGC
         P/7CkjZdLgsneZu1dmZiFtm54AcztsDEY2SVn4Di7JXnZKnf33Mfn/kh7invzBLqzKUG
         aofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184876; x=1785789676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mp2mFbVCzRgy++K5ki5yOkjeNGsrV0pC4gPH34Oh59g=;
        b=iD4BQIWlVFAx3hUCtC/G55JW+ZFYSj0mWv9HIHKTeHGbN65fZliheNtP4Z0jbSom/0
         aAI8LFuvJucbRj+y3J13izCEPJ1KI7qmPH9GwQKZledtl2eVXBppHCOPeGAY3hXS9ErL
         WRuVcYw9/NXk3kzj9Pc2XlV9ZZfLGMZQMOK8uRWnePo35rtVf9zLzUWRzPaY2WAPmYke
         y4/uhhW+E1TztsZfy1Y1bFviMOSM0FZTj6WAZM8DwIYNoHpOCzkDak8FLlvMBFfe9h26
         t823VeHMmHIQCfa2CfAnF/xO00anm9gpf7nPNB1FXH07g8T6cAsaL5xE8ogkjCRj78Qg
         xDWw==
X-Forwarded-Encrypted: i=1; AHgh+Rra13aeCzm6WG98EwgDpO+Iu+OEI5pTDrq3L4uhbrxssoLv7p8a7DC3y6jE3XoqwTdqwTpZ3xmU9/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDJegOuX3VnMbVCYd9XQSwah7IBBkv4qIDj5X0VWO6u8TyG4nP
	iwoaGmq2cir1g/CzFvu0vj4ZGsvjgduQW7dERRSgDgTu4S2JTT/knMw8
X-Gm-Gg: AR+sD13CykCUvJ641YrsyPIyROF/EQdMtC4OcPkwoLz7AcGRsPqHy6gz985V4phH8Rj
	ZI1Ms5QZ4cQQ60+lx/HuwLuPb3rllHfYkv0COXsfGoNYzugYS1vgjmh7xxd50JUtQgYcj4ztE12
	boFC0AynOGBsYa6J/5ZR0Pcto8bgt5p89xPhRZepFxcGhqjF/n9D5c+9GrAs8yybHqS+QiaM5qB
	PTShtqzYcQpIe4Ult6fwhad1noxcbs0oBBpVypOHyJZrhduewUdUAAOUcyimnLr/gsW/2E3FGSN
	eDTl6IOVcXw9msVC02c+Z9hDw9XrbT757cW3koBuyzmd755crOkyfr67YWbFc8JzHItKV1LgZ6K
	tYJM5CTPPLpjU7O5MaiUV6xccUTX02PU51sUxI5Rn1YRmq4b1hqerU+b8wHkV1QfPSZjCtZEGke
	baPcqE
X-Received: by 2002:a05:6a00:4ac8:b0:84e:165:da65 with SMTP id d2e1a72fcca58-84e8d0f92e2mr773910b3a.64.1785184876403;
        Mon, 27 Jul 2026 13:41:16 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:41:15 -0700 (PDT)
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
Subject: [PATCH v2 59/64] dmaengine: tegra186-gpc: use dma_chan_kill_bh
Date: Mon, 27 Jul 2026 13:39:21 -0700
Message-ID: <b37cd91a6f4418b9a352cf9893ca238de9af88bf.1785183549.git.allen.lkml@gmail.com>
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
 drivers/dma/tegra186-gpc-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/tegra186-gpc-dma.c b/drivers/dma/tegra186-gpc-dma.c
index 64cedef1050a..1ba8897ec614 100644
--- a/drivers/dma/tegra186-gpc-dma.c
+++ b/drivers/dma/tegra186-gpc-dma.c
@@ -1284,7 +1284,7 @@ static void tegra_dma_free_chan_resources(struct dma_chan *dc)
 	tegra_dma_terminate_all(dc);
 	synchronize_irq(tdc->irq);
 
-	tasklet_kill(&tdc->vc.task);
+	dma_chan_kill_bh(&tdc->vc.chan);
 	tdc->config_init = false;
 	tdc->slave_id = -1;
 	tdc->sid_dir = DMA_TRANS_NONE;
-- 
2.43.0

