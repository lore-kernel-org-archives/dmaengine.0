Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205D62D592C
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 10:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786357269; cv=none; b=MGfdhpG7AbL4b2F4tevTXNCwvRZ0RDfNOlpwYOGues/iTDxarS+9sBNLvy37cVhdDxlaSCD6yYI61Imz1EPGKLY4/sHiWbO6pJeWkkPooPC7f7k5UhFFXhM27zg7DUDg/S+EghB+SsLgzeWT78qVJbXTGw6fs2kB1hNC9/tCnPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786357269; c=relaxed/simple;
	bh=jluzJusjx8HFXTzca86JgoRcy38vgjw9MxDZ6gYe/IU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZppJiQ/RQGb8WnTCJf3p55D5L8/SvRC/Yids+Kb5WfnqTTOEHBGhURUD+DnPNMOjkg5gQiZ55DbKc8RDTSnKwNdAVtkJFhVo4LRllLoEe2d7NV/DhufMIyqUM8zyk91Q0XoUGhvSuasV8hHkiMczOEmCIp9UffYV+GleqvVZpys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+HmNpaA; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+HmNpaA"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbb973e6749so1997163a12.1
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 03:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786357267; x=1786962067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FVhnTJBrATFNd+yhmpURH5NgNQs7Wgyvv9zxL1wJeP4=;
        b=j+HmNpaARsiK5Ee9saYOLe/40P7/nCrn1HK2ebQ5vbqRGyQZ6hhZdkvlOMtf/Ot6oY
         TdkWZIyaL5qChjlIBlOlAuN2YZs9aM1g6ptvnihox1poFyMtckO7Xbf779HBMSsCCHtM
         GjVeTIO4nuRRffg2TgPnF11s+hemfQaQjaZv89PrRrmuU56Pblp3hxYubYQ7TY3la0Fd
         k5MTnW+b2SDZZHY00dikPwDOCCqlBWZWhk8uIg/stq5cyVwgWzf9Ecpt6/PTGrzZDr2L
         aNt9a75RrqfyP8BIPkYplBYI6vvUf3fVst+MmFocZ//dcH68VKZ9KaTZhZwwo6D207IX
         sezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786357267; x=1786962067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FVhnTJBrATFNd+yhmpURH5NgNQs7Wgyvv9zxL1wJeP4=;
        b=jji6l4lDR/B62wlIyXfgOdBE/KTczsU7cViFS1U1oGnMQBH1JSHiNLd1tJkfJR+YwQ
         tpmwbsSrrNtd0XhtEB+uYPeC7woqkHEUOdNJHFvn85wUnWD5W5HRHaNMaqPTiQO38p9S
         W09kzaVDM2Zj/jAzLiTbj3PklRrCxUxq9lMwC3vN5RS0QlA1cb/9VJ9O24yIGs/IFhig
         hO7OBP5Fn467hTpTpeBY0HECe4pZIpReE9EOaakdZgzZKgMIFujyc8jfAooedGb4gWYF
         dB3ylmtT4tPLt9qAtKGjd4Ai51x/FFX7wDGl/J+nBbqO6kr29U86yuWvmz4bs+anj5o8
         hcIw==
X-Forwarded-Encrypted: i=1; AHgh+Rqf95VWbur1oWjOsKoYmPpr3ayhG99LIBKIhczjnlJ2X6ERsYRKk8abiBqO4ijDVyE/RrfAoma0AQI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/SWd9N0h/NXRIIcADyk/fmeHJgLWYAbrlPFhgVAxxZ/iVwZgX
	uDNsBeqg2DmWrZmL7kLipnwTVOmtiIO/TpzhGOz+togyGBLROcVRAaEM9NZmT3qP
X-Gm-Gg: AR+sD11ZDxBufNj4Ztl9gK69tVgS6dJdJYUAmlfReFGiI7hRXxAImoWqFShw6v5dM84
	K+FG4TFMzVXftE5urYRH/GuiN8x40pOOpV3wRdji/HMbMOFlHoVjqYLeEJinkHJR/28JcVfqP8v
	Smi7gPsKf+OYPU63nRkk++224Dudjjj9HE3Y1A5VguHmc4zTceLd2ZZwpTosYrNDluHkUbnNo83
	7QwKpoUOTKN32CzL6K102+1iNLCbmew5QD9OoVxo2pe3Dtx5ok+PXetYRZ1XreCyDmTnyzqQI9u
	u2Mvpe9oWi0/UlqIV/ZBkm7B+i3CmrnKEQqyup3ktKG2Cb3nGNWjEvObi/TTIGlYDJ7LiNflH3k
	ZWZrx+mLLxJ8mvUkWuxqwejgDTopVf9zmk3xY3GLikt1qdIch7AUwF1OpIqF8LcZ/eHERy54naO
	bQSidJJI8x1+fx6HsvmT325QBD9gf9yIuhEuRzlVRramNFMJzXcXENj1VrC3DRBZyDydDziyx42
	w==
X-Received: by 2002:a05:6a20:728c:b0:3c0:b4f8:bbfb with SMTP id adf61e73a8af0-3cbc03b5531mr22783805637.22.1786357267350;
        Mon, 10 Aug 2026 03:21:07 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec68468sm44276912eec.31.2026.08.10.03.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 03:21:06 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	dmaengine@vger.kernel.org
Cc: Frank Li <Frank.Li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Subject: [PATCH] dmaengine: sun6i: fix use-after-free in descriptor error path
Date: Mon, 10 Aug 2026 10:20:44 +0000
Message-ID: <20260810102044.1725649-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The err_lli_free cleanup loops in sun6i_dma_prep_slave_sg() and
sun6i_dma_prep_dma_cyclic() free each LLI node with dma_pool_free()
and then dereference the freed node to obtain v_lli_next and
p_lli_next for the next loop iteration.

Save the next pointers before freeing, matching the pattern already used
in sun6i_dma_free_desc().

Fixes: 9aa48806edb8 ("dmaengine: sun6i: Do not use virt_to_phys")
Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
---
 drivers/dma/sun6i-dma.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index f47a326dd7ff..2439fa6564f2 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -720,10 +720,10 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
 	struct dma_slave_config *sconfig = &vchan->cfg;
-	struct sun6i_dma_lli *v_lli, *prev = NULL;
+	struct sun6i_dma_lli *v_lli, *v_next, *prev = NULL;
 	struct sun6i_desc *txd;
 	struct scatterlist *sg;
-	dma_addr_t p_lli;
+	dma_addr_t p_lli, p_next;
 	u32 lli_cfg;
 	int i, ret;
 
@@ -789,8 +789,11 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
 
 err_lli_free:
 	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
-	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
+	     p_lli = p_next, v_lli = v_next) {
+		v_next = v_lli->v_lli_next;
+		p_next = v_lli->p_lli_next;
 		dma_pool_free(sdev->pool, v_lli, p_lli);
+	}
 	kfree(txd);
 	return NULL;
 }
@@ -806,9 +809,9 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
 	struct dma_slave_config *sconfig = &vchan->cfg;
-	struct sun6i_dma_lli *v_lli, *prev = NULL;
+	struct sun6i_dma_lli *v_lli, *v_next, *prev = NULL;
 	struct sun6i_desc *txd;
-	dma_addr_t p_lli;
+	dma_addr_t p_lli, p_next;
 	u32 lli_cfg;
 	unsigned int i, periods = buf_len / period_len;
 	int ret;
@@ -870,8 +873,11 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 
 err_lli_free:
 	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
-	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
+	     p_lli = p_next, v_lli = v_next) {
+		v_next = v_lli->v_lli_next;
+		p_next = v_lli->p_lli_next;
 		dma_pool_free(sdev->pool, v_lli, p_lli);
+	}
 	kfree(txd);
 	return NULL;
 }
-- 
2.43.0

