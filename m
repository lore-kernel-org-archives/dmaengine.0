Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EF642FCBB
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184826; cv=none; b=aQCBu2Dd6UZA9V3jSNj/Bqk9TUJnUQPxG3JNCPG1zSsicID/XDi1thq+GfkPLGXVdf+R0Jm/THhSkq5y44GjkRXeoEhsyC+15IMu55nbPIdDyGipitmn+3QI+RQH9k6GukBHAWWSSXZzVMIrrdzLRKIG22fyl7pTkYN8kMURrPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184826; c=relaxed/simple;
	bh=qyQob2KjLZau3St6EB5hBy5lU7MXiFrOAdn7CT1T5pY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ps8h7CBx3c6LUkSC/nkK7EwNsSzPanimfmcobtSRgKNloxlfW9GV4Bk7lzAr1I6QjwsSII1HioQGzGjua+pxZVjWM6RzgQREJcpxCHmnGChjP6xDFETQUilRCUkAwf7o37ZIeGRQ5tzOpJhuwfh2jFQ1CUVM3NG+soLvGRXPQ5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XG1y4Ey2; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XG1y4Ey2"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso267696b3a.1
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184824; x=1785789624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5dHqZOwqovbAeLR2/0Aan5+Wo99rOiSA3eO44o9fS8g=;
        b=XG1y4Ey2FwdCgTaU0x0wqqhppuhK1c6o7Fx28dvU2/1fRYniadTIH1T+gvGjE262rF
         p8aw187OUCy7/bNS7Hp3znyFLtzYyj/FTaVX8eG827qEBSKKpttDlXcG2VmaCSB/DiQp
         1ivvXJxxtibDmx8ZvD6dEb3WlA/wt1dBoAp/Elpial7bD3Jszhs8WZXjIgUyJjAeJEvP
         uIBzkRvniT4NzHHo61kxHfXwCopGlszVS4ql97m8UxtRjeHQqCiYSoTDupxxLUlfjgtZ
         czXNxaYqZnQEdlcT3nZAV06zpT/HWR0qm5mlJPxPDrLOfJyWerNFwm3yotj9XUzjrnoP
         GsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184824; x=1785789624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5dHqZOwqovbAeLR2/0Aan5+Wo99rOiSA3eO44o9fS8g=;
        b=b95ACmXZHHTQj2f9Pl/uwR+HgHAcflRrchMnxdusXghSmxHGnnNMwa9mz2fnscKBYd
         ZF808gjCVEn8WNx/AHB1ZgBeo8QaEbrV3hWiZenL/fK772R3AkvMUHsDd47rP2XIQSSI
         +O08SO8d5ofxi3xeB4P/KgzDooL7TNWWa9lvYhfcjmQMdo8vL9N+hmtzEWV8UZuR9Kck
         ZroNzUBNW4LyMzNwraURWyUUIoXbKB5feLU4sRc0rtH8bzLAiVD5hgugJZUChrVPo19f
         Z9GrYw1CRSKa4pT/e+a432R18wKFInGgl235ESq4M8OZ35t/v0iNCH2sehc5ddtBxWEM
         4ljQ==
X-Forwarded-Encrypted: i=1; AHgh+RqtROXuBJ6H7fuqZvbZibcd/HVRit3U1LKr+l5Pr2IFHMrLKANmcvzQD1gTHmltflmiSSJg/QBI4OM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2Uejk+Oa3/5YW/ZVOnZ6w4km/aucSlw3COD9S2w3yGpes4fB+
	LDz7uYMq2J0oXnFBzVMKSpjNEjReM5w1HGt8vsmHwXGTAhnyJovzp3rU
X-Gm-Gg: AR+sD107zeFQh7FOSJHRbzaApxpYiCWScxmt8aC1FIJWav0fN08u4+rodOA0+JuhXGN
	8JA+IJwofRJLIkwxs2lQWhPVgWXlJe5ji3aH8hFm9sGrSkUjkYPVWOXIYBItfraN54+MWkPpEIy
	xAfani8O8HOZaSwfcW0+fEdoCpTpiP9tHTuV+iLL6gC6sn0aeOzefayPcBm/oVkfqY3ywJFvi6X
	0/VNOa5Lvhb8TBW9lOxoEiAb2SmCW8uVDjEZRyd0Zva+8q07uuyot0AO1eZrjBPAYjDUDoFOf+P
	g7+xHosZBi0E5ydl04FJ5uiPSKeWX7gX/my9cJYDghajAXxWMyv4e5dYyjEqUl1SVeAM/pk/pvf
	s8iNvAQNhkB8j97jHbKvP+CuKeZB4nl1Z1w5GFevkmO3+2kJRpaIocXUUpDmMKsLeZhgCTgtaon
	lvx91c
X-Received: by 2002:a05:6a00:440e:b0:848:2ef5:50d8 with SMTP id d2e1a72fcca58-84e8fcc10c5mr202785b3a.32.1785184824280;
        Mon, 27 Jul 2026 13:40:24 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:23 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 44/64] dmaengine: mtk-hsdma: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:39:06 -0700
Message-ID: <0bfe8c4b14ebc7446d0424bbe811c310e86bef51.1785183549.git.allen.lkml@gmail.com>
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
 drivers/dma/mediatek/mtk-hsdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mediatek/mtk-hsdma.c b/drivers/dma/mediatek/mtk-hsdma.c
index a43412ff5edd..1c98fcedf3ac 100644
--- a/drivers/dma/mediatek/mtk-hsdma.c
+++ b/drivers/dma/mediatek/mtk-hsdma.c
@@ -1020,7 +1020,7 @@ static void mtk_hsdma_remove(struct platform_device *pdev)
 		vc = &hsdma->vc[i];
 
 		list_del(&vc->vc.chan.device_node);
-		tasklet_kill(&vc->vc.task);
+		dma_chan_kill_bh(&vc->vc.chan);
 	}
 
 	/* Disable DMA interrupt */
-- 
2.43.0

