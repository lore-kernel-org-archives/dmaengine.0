Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD4A3BBFD8
	for <dmaengine@vger.kernel.org>; Wed,  9 Sep 2026 23:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788997768; cv=none; b=BWfZbSlk3h5ogau/ugWXo256PzTrfJ4CXRTobv+z/BOindPizMYd9+w1JcMBVtL/78tb82FL80x5bde0adHXAwbSXQdUnQXcgwYUtIMAw9TOdLRyglcwn+4nfTIO8m6nfT2OhBAbyim82susRH8dO2JrRhVAAy7sYcaGfN/yJog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788997768; c=relaxed/simple;
	bh=b3B8qTwazD/WqjAEKg6c/DeHJmjZWB1dq6RUMXStfec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OYpA6Uwoc7j+dpo2PPwCQvjKYwUqtZprT8FqnK9/0rv3KIDCZ4wGjow+8y0dlKhC8mn9QuO+iqSwSN/VQFGyy02/f7X2mR6I4Wg9vA/LWKsW/cN0yLFtcnboWDz7mX5Nnr0pc7m3XB/43sNnJiIhn8x3hLYgij5WEDM+A6wAxLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=boHUNPqi; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="boHUNPqi"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3964e480f76so7567848a91.1
        for <dmaengine@vger.kernel.org>; Wed, 09 Sep 2026 16:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788997766; x=1789602566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mBdqkn+MZjqTmKgHL9Xc2cmRqSPJ6h7jxkX6xeYpsAs=;
        b=boHUNPqiavlH/DZ+kb+TP++WKWlZi1DFWNgbuSDgzgE2FXtx/CPJ1qttEJby61v6XE
         8+5DvJckSkq22YQkGYE+cQWDrrw4G18USCcrjYxHuNqfZYPEiPOksmGGWSOvDrWrphn+
         5LdtmHMoTXfIVX2Hx3+F4xn8scMLQ7PZMFRJHu8VvlYODJ/W6/W0/hb+wAn2ddOyPgzw
         vZvOBRDtbL4BWtgQxXF854AIDOM1TlV0i+MpnuVabIibdeFeigh92h0ZdL6dk1a6Hs4M
         TZxYJZfs7mZTeqpXY1o0GZrnpWA+Xw2nAnbjPt539MGsIJBWhUD03olqmgswwEe3RDih
         c/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788997766; x=1789602566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mBdqkn+MZjqTmKgHL9Xc2cmRqSPJ6h7jxkX6xeYpsAs=;
        b=qNoFk4TyzKk2igM2ToggibpqIL0Aiu7q0wjdIPrrhmIhauDaBBGaLvvW74/kapPZAn
         qUxXWotlV/z5sqR43/VUeHEKmHShYLDwStze7nYU3bQ/Cjs2cBgSYk41Aat9XAHIUBOG
         FRUk7BJvr9nzbmFVISEV40XD2y7ceRibmjthLC014pVkASEDC22GYp9/6Yp2umEqTs3p
         hqBSUXn/uUeGTtQlsZqk+URqVd4EiMmAeXNQltzIEFTmM4UDyJnTHRpUBRlMiRXgi+om
         fWdBtmihLVAMm3KC8D1XP8NsN6dvXR5iV+vLkk+aLRml8tBMAXzRt4dTCE/usMK62XLw
         hnmw==
X-Gm-Message-State: AFuF++m9Kgdsi7JueKx28EunQkFzLrBYZk/GNCsxJQMgFwzpOWH1JC+K
	uWUvEp44EiQPzogPQKA4x1wo1cnacAlA7NQq0vs5D/r2lPA3RsEr1wugXkPr2g==
X-Gm-Gg: AYBFou1sr1LVbRrSRrsxYdxN11TjyuRefnvslYrVe/CbqO2gNRctEsoMPx56DR9o036
	BDMtmkQe3r3LzPM3EpA+2c+haxvP5VmEARNPZlcBQasJbLZwbpcn2a08kaAjo2XusIYsMkExvwq
	kGI7kbJry0rUReiaGshpS/rPZpJ0nshtruEiIQ5X6/Y8ZlSXPu2rotnYn7FTsBG5+Zh3Z1bbR6T
	u80LRR5g4DTGUMKyXg2G+qeRAx8/gEUd9Pqspqhz5zp7/bBOkF4p9cIC6q5vwVEfdwTNyC49vl8
	mq3KEJjm7xQC6iRIOeTmvmcWug15gkAAYwgAZeZUePqLviqiLCKjWbC/MkU+LIf0FvBATdj1f+l
	I5trmsNmKmhGfCUlL8YSGZCnmiIYixY62Yc0f2K5hGewXSnJMeBDPkCsyb5AUcA8tw9Byo/Sq1z
	9de10fBX5YRpx9e1FII46dz2xIBd23V7dubMJhDAtbUt+Ks+IlV8oHk2MF4O2ZDbIKg5gCecEdb
	kOkLY+SWnUloof8NxtdfQ12RxqnW5ITRIcLLxE7jVXxKkiHh6vpiU6Q8kDF57/U78X9PEMsoE6t
	Vd/6jvQ2A9x+V8sP2cVUugG5ca4RcHYVKU55YCFIKqjGBwOP
X-Received: by 2002:a17:90a:c106:b0:398:e1f4:bda1 with SMTP id 98e67ed59e1d1-39b2624cf3fmr58816699a91.21.1788997766466;
        Wed, 09 Sep 2026 16:49:26 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e3f5f1esm581449a91.1.2026.09.09.16.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 16:49:25 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Stefan Roese <sr@denx.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: mv_xor: return descriptor to free pool on io_win failure
Date: Wed,  9 Sep 2026 16:49:24 -0700
Message-ID: <20260909234924.103418-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When mv_xor_prep_dma_xor() allocates a descriptor slot and then
mv_xor_add_io_win() fails in the source-address loop, the slot
stays on the allocated list and is never reclaimed, leaking a
descriptor resource.

Return the slot to the free pool under the channel lock before
returning NULL on failure.

Fixes: 77ff7a706f01 ("mv_xor: Add support for IO (PCIe) src/dst areas")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/mv_xor.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
index 25ed61f1b089..dd4f150d5fb1 100644
--- a/drivers/dma/mv_xor.c
+++ b/drivers/dma/mv_xor.c
@@ -583,8 +583,13 @@ mv_xor_prep_dma_xor(struct dma_chan *chan, dma_addr_t dest, dma_addr_t *src,
 		while (src_cnt--) {
 			/* Check if a new window needs to get added for 'src' */
 			ret = mv_xor_add_io_win(mv_chan, src[src_cnt]);
-			if (ret)
+			if (ret) {
+				spin_lock_bh(&mv_chan->lock);
+				list_move_tail(&sw_desc->node,
+					       &mv_chan->free_slots);
+				spin_unlock_bh(&mv_chan->lock);
 				return NULL;
+			}
 			mv_desc_set_src_addr(sw_desc, src_cnt, src[src_cnt]);
 		}
 	}
-- 
2.55.0

