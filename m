Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316619;
	b=A4KQk/nagNlJUeupG7FD1Hv+mSfPOhzeasf0f3JZJSRGMp7gkiT74Nyfp+8/T4MqEyRF
	 giEcy4LJTAgsM7h0c+eVlwfaV+uv+5Anv5++ysRcJGo5S0YUgVonTu6u/l5kOE8udQtPj
	 z4O1PxJ67baukIW2IgoP9muP3YE4DVtiOuQ2xCf4imZPj8EOLAePZh45jCXyghNZji4xq
	 1o78I9ZrgmLfzV5CIVn3P4M7R5+bG4dNmxAovEx4CJHToLBCYlurABzD60IrxPgd/zj+w
	 MfKKTM0Tl/Q3UMhdb0x0u8yZXrVYUSNiurvhTrDHmrvdL/sHMpGQLIXXLt97hfQY8DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BZRtX+IhjKTjKfwch5jHovAc0blotez373I/yEDH7QE=;
	b=RLS9Eo4wmOP8/7rss8I108KuE4LLpmqOv+sBcrfUlOdQnw9cQBDl9K4PxkBXuvxLmSn7
	 MWrFT6Y5mfAZbHKhYoHCSvAfNnKOgL9gS5+GC9GJq3VoaA15UfKGIQMxQcG/8tUrgqny2
	 PAJuHQPCBs6KuW3DzDAq2CN9TfYF1Ppm7dLAY44dL2lcI4ePX1FeWdcCfEEH4NpMdfNWi
	 XXP1mAzmwNLBhrNqOO+Lwa3OqCXcPjvTSVR+lC82zANhCGClgz9Ru7X1qKB7iDpDjWpLp
	 vCq5ezirU/Xk/u6s7aBe8pyenEB5BaXzI0f9z0YCRJILURxD/RLnBM5T/y59GenPJeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WcgP+zqi;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E532606A772
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 13:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E532606A772
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WcgP+zqi
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdb9f760337so986114a12.0
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 05:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316618; x=1794921418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZRtX+IhjKTjKfwch5jHovAc0blotez373I/yEDH7QE=;
        b=WcgP+zqingM3nyFJ+9sfUXEK8gpvM+ZQJ/zr1hPdHTOLJNOS+d7TDuiiX3YW90DJSi
         cR3AXAhjMKZLfOP7zOArHF3+aKuhRoX657Yg2YWIR6s7DK1m2EJte4FLvcRJucsndahr
         SM/9nhw8yhIe7t4QFG5xq9bjnMWJxAqcYa/4OQjsDcBuMRS2GJmwaIebhBPKtGdIde8V
         iWgXFQc/aHCZnqugf6To3toCRf5Lv7FeXv5I7AqPiFPb13D3eipQNrOolGFwkUDWLFyz
         H8F+KGAYHAxEDpujUwEvwfUZbE0nmaQdH7G945Ng2Xc9Z9A6ypY9ezySdh+eJHC3GwnY
         jkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316618; x=1794921418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZRtX+IhjKTjKfwch5jHovAc0blotez373I/yEDH7QE=;
        b=TN/bDbbsGvvvcpQeioRZQUnQG+67nxbrCsXCLlHAOC1m35Lf5KwXMI9Sncv5L+Azao
         0O54tu41TKhf9yMnbohHVO0jgsQ6cNZL7Qu/3TkluNxoakwx80WsHkvqD72t3C6wM4xg
         A0dlemlwXc9W7cjVG7fs97cSCgTny6BHmyhGX1XoUTBgUl8BH6piBW9ab4TnlISGfIHk
         Qbep5lzTm3kO1B7uHFfjNtJkW1mLzknuT3pSQ1ZtSDdTrvTqOLheLACRWblwgDN+4BQV
         ZH3cFOWSQqmTex7dtINxEWKBIYpC/ceDpZdxDAMEAHbht4Wjc/FppIvv5KpK23s13a8C
         68Lg==
X-Forwarded-Encrypted: i=1; AL+hErFsftPPapoj/HTJO0uZTFAQhd1uGD4niUiPSIuNJoPO8X+5rUPBF5QmZb+5kvAYiAfcJLHRJy5a0SA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/truJ0s46zbLGASlV4qG3cF8+VDCr+EvUtEkkke5wdVvLXBV+l
	eLMel003nmEp3crDOS1CmwDj0ZLwOjI9UI8AhforM0vSN8Kza7ypVjTq
X-Gm-Gg: AYBFou11cFJSu97mKienOK6pLwlHtAvW30ICYe20kMe4osj6RgDXyg/0dYrvWA3FK4F
	9ofLda7qSfyCfRnLVIFQPs+2uPpfSPPc3oNh8NVUwTtUul8kH+CD3/tsIpjRvxsg47lWmnM38CE
	XV3gdRTTeHyZx6cemFvKGqYuuqY+/p8VCnQEyC1k8WomL88zICJwOIjvkwHJ3XNIi7im6Imh/z4
	02G5T3DUZPFOucbzL0JLiSA1bjPhb8LE+I9oxdJl9OQa5tFJO6CypoIsum9ftIfyyWY6plpO5cV
	aJhupFXpJ72I1gsX8aqFXNLNoext0mOHQIFjOolK8x9DpNP2Q/HhxdnaBXMZwHLmco7lJtoYyqs
	yreIK9GMHB/Pr0GWOMZTlT+GUzu9gJSs3q9wRLN6USb/RTQGWX2L5ls93O1KkwGZzKcSlJvnlAp
	D3XIBFbZ3cxzhp4EiKZjz1rh9XRzYBy5t7WPG+mbCI45piuRSTyx4FaMf3JrdLEZd01opwUTK2U
	bs8c4q1fYJBA9vsp1LMw9isvWk9ONMBfz2Dnd6vvK+qcRIKEqJKA364XEeyAee8UyPQQZQIcN0I
	9KXguAdMhpxIa/UTLFIgCGsI7hkR7Atr
X-Received: by 2002:a17:90b:564e:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b1678cf0a3mr1858564a91.3.1794316618492;
        Tue, 10 Nov 2026 05:16:58 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:57 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 20/33] dmaengine: xilinx-dpdma: kill vchan BH on remove
Date: Tue, 10 Nov 2026 05:13:20 -0800
Message-ID: <f0db74d4fbe705ad4d50798c20ee38cc5dbc03cc.1794315350.git.allen.lkml@gmail.com>
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

virt-dma now dispatches completion callbacks through per-channel BH
work. Cancel that work when removing a channel, while retaining the
driver's separate error-handling tasklet.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/xilinx/xilinx_dpdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
index 687fc8ef3d8e..219ba9a63050 100644
--- a/drivers/dma/xilinx/xilinx_dpdma.c
+++ b/drivers/dma/xilinx/xilinx_dpdma.c
@@ -1685,6 +1685,7 @@ static void xilinx_dpdma_chan_remove(struct xilinx_dpdma_chan *chan)
 		return;
 
 	tasklet_kill(&chan->err_task);
+	dmaengine_kill_bh(&chan->vchan.chan);
 	list_del(&chan->vchan.chan.device_node);
 }
 
-- 
2.43.0

