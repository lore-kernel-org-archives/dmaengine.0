Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A8142BC48
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184831; cv=none; b=hsoK8JcrUQTs9PRB7C/2pZZhIOG3u44LLZ4oSfTyZj4hIRDg5R/htPeZUNZqBCHDPOT8B+ykO/Pt3hHnmxflgMDR6KA6H+bS5jPtrcATn4QG45OV2XkL9lW+1s+Kduz7FSN/fi4/8nYdMK7Fu4K0/aE1WBYRil0tjRV5NK98+PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184831; c=relaxed/simple;
	bh=SaoHToYEhq7coeqWENxkTYw9+Df4fMAn33UHzYbLexg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=baEDLFVsfIZlR0W+SSjRyCTP4wMLpsimp2dSbBYxMjWN4aLJ6mMJzAeLCTZszpnvK3tobosL/sMph8HUWL4LcJUcapo0DjVOKlFDcNXmrnKRoDGp+QkfFmrLknZAGquuJ0FS6UNHKaR+YNG/RS135HGUXVKwhC4SSi4cetzaPvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=emcyjJOI; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="emcyjJOI"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8486ac3f347so294318b3a.1
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184829; x=1785789629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lvRh7gEOxJwccvH3DNdGEY4DK+vaLBlyojbNRUKtWDs=;
        b=emcyjJOI5TFzVcVK3HlxoAILQxJMjduCL3f5IUE+ww+Ok0l3t64Ym04pjq2CLQsb5t
         94H3LkBucl6oU6sQpG7p8Bz3OTbCA7cpTwra/Sq7oUsMj2wlU+2weQ7my0BIP4h35O18
         UUKDA/GwWYuf+QvPftO/BcEsn72Uz+4Vi1UNkNrtEiCYnTqCSmEbnC3zJyXkp7wIc64I
         Nl2Tv4YLPaww+9llrdlE5ycjn8Ly6bFnGcr0WJq0f/drv+RnnjhcZJYaqN6bfLCY4KSv
         F1u3hC3iPHnDLP/f68t9phD8Bxt/rHHIWYFqPgknqoDJIRUbyupTQIVZTsX+/xLnxARc
         DJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184829; x=1785789629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lvRh7gEOxJwccvH3DNdGEY4DK+vaLBlyojbNRUKtWDs=;
        b=MqlW/oplY4urLLHmT6sSrDKf7SVzxGFDDEizJl0r6zMJuICy9aqivnG73OXcPtO6tm
         MXZygVzLnsFgorMAbXKchl9Dt9OVKtpLVSTXQDeTXaZhsNCLA7Uub60alzl7y2RartKI
         pvjoEAasRC8TmQZFNRMW9sdH37E11PqLjAQGJtp4g8dUU9iLtLOGDcue/TyLZPmdpDvv
         SHbPCj2Rg4DCvNXspr35ZHBkrS889O1OgwcCf2E/iQMpy11ZbV1oliA48/piq/98Q7PD
         NKLlQYkjhC5R04vdfLnaEaoGH/4fS4d3MEL9JxI/SoAPeE320XwdC9eEXK9Xcr/yIBZh
         vcEg==
X-Forwarded-Encrypted: i=1; AHgh+RqaGykoO1ASH+LprxvVAOOvEUx7qWLw/Qi7rD5o2QdEcTJRCkWRts//AIWgpxs72DmKcseSMch+nLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQt9+CoqZ1jLYjh11tGW2GKqyL8W5sgM5MSA6BjkEmxN7bfrWX
	5ldJ/t59OMzQ0vZVYPJe1SUg5Gu5cVgdZ1LMhE77/3AB5lL5Uu/APtw5
X-Gm-Gg: AR+sD10gsaUjYrLbOm1N1wKaSgb7w54mxo90kyKBUHnO0CH1W/lNzu6of2pZGfQCwgu
	sknZNZqXd+G5vWmgkQI34J+KMTUKi6BUMz4UKeS2TFeAFmXNN/jfRHDP1hr3e6MsUsUQFWy0OaH
	T9GeaSHvg7t0Q/QqAPwLZq4DuswNxfEy4Ctoc9ojAYSd60vnueJoqudsEgNA3rQxRMF/Cyc+BFx
	dnBFyUds0tO2cm9T21FVL/aHJflvT4fnOlONCaCzPfdZPmkftJkcCjXZrqgMhhhe2G4kjnGS/Qx
	Yajj7C6KmP5wO3kL0d9z7KxT/OBJ0zDKrv44snnekvLFTM3Wbvpjjr+qQPl0HyTT5A5dWwGVZvi
	UpCSsmV+waO2peIENv8GhX62XrgKuBvy83ZW5yy/IdnsMTyEaCnSeHTEH40O4CJQxXxjVbPJh/y
	gIgsvV
X-Received: by 2002:a05:6a00:22ca:b0:84a:29af:a0eb with SMTP id d2e1a72fcca58-84e8fc09bafmr184669b3a.9.1785184829248;
        Mon, 27 Jul 2026 13:40:29 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:28 -0700 (PDT)
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
Subject: [PATCH v2 45/64] dmaengine: mtk-uart-apdma: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:39:07 -0700
Message-ID: <dd94300feb7feaa826b8fb75e1f22c82a6f54bf4.1785183549.git.allen.lkml@gmail.com>
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
 drivers/dma/mediatek/mtk-uart-apdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index c269d84d7bd2..4d89927922f5 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -312,7 +312,7 @@ static void mtk_uart_apdma_free_chan_resources(struct dma_chan *chan)
 
 	free_irq(c->irq, chan);
 
-	tasklet_kill(&c->vc.task);
+	dma_chan_kill_bh(&c->vc.chan);
 
 	vchan_free_chan_resources(&c->vc);
 
@@ -463,7 +463,7 @@ static void mtk_uart_apdma_free(struct mtk_uart_apdmadev *mtkd)
 			struct mtk_chan, vc.chan.device_node);
 
 		list_del(&c->vc.chan.device_node);
-		tasklet_kill(&c->vc.task);
+		dma_chan_kill_bh(&c->vc.chan);
 	}
 }
 
-- 
2.43.0

