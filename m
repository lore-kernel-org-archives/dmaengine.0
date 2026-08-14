Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614FD471437
	for <dmaengine@vger.kernel.org>; Fri, 14 Aug 2026 13:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786714188; cv=none; b=T1M2cIcihRJ5LMqPijr6zBYnUpcPiFPFkwE5XWBCnbawd3zbnA1VYrTIO3k/Y3n2b/WpVGN3a1hmktP05miMe7TSIdlpG60iOty3CgWTu1a7amvNcMma4Wwm/bmXn9PbeSL/C3OkiIBRT/1InT3PO2iPfdFX4KicUmWJjODcn5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786714188; c=relaxed/simple;
	bh=Z0VrxfrQOACZu83EOUXJrOYZAwJOj58+oO60WgCClXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NKUXGUtl+yqReQQuNa2sI2FdmuUa2lgLCocqT3DU/Q3CuId7uhP34eM9sv3ilOra41XR4XBIm5v2woIKVyC01u+WRmthw9wlVJA2aEr0tLyjfIxgAEai568ssikdHOqk/Vehvdm0ReO9AFECmeG7LYGI4CCvhrDLjZqbPKtL6/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io; spf=pass smtp.mailfrom=soundtrack.io; dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b=mkkNGFOR; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b="mkkNGFOR"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a18af264f9so209993a12.0
        for <dmaengine@vger.kernel.org>; Fri, 14 Aug 2026 06:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soundtrack.io; s=google; t=1786714185; x=1787318985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ctx57rLzTDeEjtgOib9aUyoQxqr6yVBe4ltDl2pGqk0=;
        b=mkkNGFOREuXai3iI7Q06uuOc15j2r4vG61uOPFAIYtI8yZB2T47KxbOcw4FDz6pTAF
         TaOdLVTF4M3XBR/FxDvITpIrIvbxrSjddeJTjUi0SmGKBxzeFmkJWiGyQC2QCD+DcqHK
         plsneJVBV5sS2+i/0lQc4HpVp0+qxwDDVFNb34/0mcCIhR7xfFroabVmxsdC+qHPRZpR
         N0+6UxoS3E1XgXZbo2NqUrcirUo7X9kcUB8SSkYiB4INVDDqvpnHJYXekpiHfcZ/iYqK
         zPcfBP3otkr1deRzp7sUuaIVly6D0J3xSuRU3MjYc5yAL4c6p2otrJ7jhtZ6kbV/2jOL
         Bd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786714185; x=1787318985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ctx57rLzTDeEjtgOib9aUyoQxqr6yVBe4ltDl2pGqk0=;
        b=Pf+00OoukP8XaC/lE4IbItnAAfdPUfaqY8IEwCy87wLDovi1M598y6K6smRbqfr2vw
         2NE0mwTXrz1jWTN6d2K5Qj5cCbbdOJyFBiB7mh9dMcQwEWEaznzwvncbmCPP8ZkJl8HI
         uqMG/fYKNSwnAYsQDBianfbs8NXMrpJz95642SnudetvdkhAu110+bkEFb5euaLSLZG3
         er3yuXKqX10zyidyH76Vr+zsO7ANVx5B/Xdeeqa2i1JKr+UlE1Dc/Kt0Q2YJDz56fFrm
         Ruus5DP/UK6JyNCcTzDnbbXevLq0cXfqm4zq7hAYrAAdQoiGQTT3XKXcSwrE+BaFM/Bn
         Pk0w==
X-Forwarded-Encrypted: i=1; AHgh+RoQbUnqUCWZJ0/FPMpCuM7Q3/LXwBPGxYKJAa1CjUnLWFbEo3PDxi+YQC92WmFrQIQOTRjzE3M4gr8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsXruqi3RB9H/nGfwfWPMHF1TEKBWLdJKzg+6Xce5a7juzlpHo
	7FJAlCF5VbeGacTCnwMYFLkBAJoCBKuG2qBFoRcMK/LuOiMYD16p8Ntd7dnGbLiqN3U=
X-Gm-Gg: AR+sD109AYKqfMN/BSXuKAeLbTV/Qm45so12SBA0JOQhzwzKXfJxC9wOs8akXshTXQt
	vc2Jnz+s4FmnjpQZhnxgMImMqJyA8pYNdLLM7/GddpcHClcy5HJi+dQZW6OaFNVgwi8+1sxLe2Q
	MZHLBMN5/aoI3pl2R8r4zyiuB0mvjlrdY11iBXc2M2UCxxcQ5EJVPCNbti2CxXDRexm+RI6OD+U
	1j5AAupyPS+KspUb6ho4EeWd5bSUrkd38zP6+zZnrU/A+fWN0bKUFavT4wvGcUd73ECmljtYUxN
	A+dpsoa2ctpGPAjCnxO79akJBgYwuBMaX+f20Rgy4zkW9Bjz/ZO9DZBFMXhQFKhdyRZbB/0OY4F
	J9ff87/eIzXirnLq9+7Wjkc54IvDIvDXzN1BVEv2OxcJ0v/F9kLH/4FwxG2+tvLtQY+k2nVqI9x
	xnPYOJt782tNmgH3BG6J1zwTcwPT12ZYrirRNLRtt8vh6DX22XxKxfsxlseOLOxqL0ges8MHdHS
	GAVj44grhQ75yQm8DlvrmUePgkKQcthCJBAysEJ2Wenz8QIYoJBOoV7ZYk/z5jLQsca
X-Received: by 2002:a05:6402:3881:b0:6a1:faeb:c519 with SMTP id 4fb4d7f45d1cf-6a38a97752amr1392217a12.3.1786714184680;
        Fri, 14 Aug 2026 06:29:44 -0700 (PDT)
Received: from Christians-MBP (31-209-40-223.cust.bredband2.com. [31.209.40.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a38c9d5eb2sm841941a12.5.2026.08.14.06.29.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 06:29:44 -0700 (PDT)
From: Christian Lugnberg <christian.lugnberg@soundtrack.io>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Christian Lugnberg <christian.lugnberg@soundtrack.io>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] dmaengine: sun6i: fix null pointer dereference in sun6i_dma_tx_status
Date: Fri, 14 Aug 2026 15:28:30 +0200
Message-ID: <20260814132906.70322-3-christian.lugnberg@soundtrack.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814132906.70322-1-christian.lugnberg@soundtrack.io>
References: <20260814132906.70322-1-christian.lugnberg@soundtrack.io>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sun6i_dma_tx_status() calls vchan_find_desc() to look up the virtual
descriptor for a given cookie, then unconditionally dereferences the
result via to_sun6i_desc() before checking whether the pointer is NULL:

    vd = vchan_find_desc(&vchan->vc, cookie);
    txd = to_sun6i_desc(&vd->tx);   /* vd may be NULL here */

    if (vd) {
        for (lli = txd->v_lli; ...)

vchan_find_desc() returns NULL when the descriptor has already been
completed or is in-flight on a physical channel and no longer present
in the virtual channel's descriptor list. Dereferencing NULL via
to_sun6i_desc() in that case is undefined behaviour and will oops on
any architecture that faults on NULL pointer access.

Move the to_sun6i_desc() call inside the if (vd) block so it is only
reached when vd is known to be non-NULL:

    vd = vchan_find_desc(&vchan->vc, cookie);
    if (vd) {
        struct sun6i_desc *txd = to_sun6i_desc(&vd->tx);
        for (lli = txd->v_lli; ...)

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Christian Lugnberg <christian.lugnberg@soundtrack.io>
---
 drivers/dma/sun6i-dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 04fe1f5042e9..7704b016aed8 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -981,7 +981,6 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 	struct sun6i_pchan *pchan = vchan->phy;
 	struct sun6i_dma_lli *lli;
 	struct virt_dma_desc *vd;
-	struct sun6i_desc *txd;
 	enum dma_status ret;
 	unsigned long flags;
 	size_t bytes = 0;
@@ -993,9 +992,9 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 	spin_lock_irqsave(&vchan->vc.lock, flags);
 
 	vd = vchan_find_desc(&vchan->vc, cookie);
-	txd = to_sun6i_desc(&vd->tx);
 
 	if (vd) {
+		struct sun6i_desc *txd = to_sun6i_desc(&vd->tx);
 		for (lli = txd->v_lli; lli != NULL; lli = lli->v_lli_next)
 			bytes += lli->len;
 	} else if (!pchan || !pchan->desc) {
-- 
2.54.0 (Apple Git-156)

