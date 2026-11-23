Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445628;
	b=kHDUH6AuFdXbHf8Gy5HWI2Z0HzaJcjlkWZ2TtC9Vbp7GH5gtxVfB10PUMJgF2IJXtfob
	 2OFnE7iNcM6kMqzTQ/+GVcQfaCwygal2StziAjXTpAA2WYQlafJQVIJhI/rDbf+zO7IPC
	 bQGvMobrg/pJxW1mluGq8CBy4LmqRA1/0rUAVEtUo1wLxoJv9vUQPN12L/9mWT7ADZxfU
	 MIz/ApAjKekaYURu0r4Fb2+wxxM54I6eyMgRVNO/LdT8uh5ebgZ8ge9z6n8bPd5Dziaio
	 9Nj/ZXOkfnAc70ZQVigfrAh7SPQo1Pi5gwFRmPzr9yKttmb8jnKP1DWlULf5+JORA/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tVq/cXwfFrUYTvVPC8LWfCG8earbmrGADPgjnQonGc8=;
	b=IHeoRwoJIj149k+3foAGoi/z0QpXddS1gwC3CGKapBawqmI+gejf5qJKUPQGRCSJ1AX9
	 K/oE6LGe7K6mqkqciuPZt3zbBZM6/c0wtYWUhFJsSD+w7xQyKnK9LduyfiPs+VN4Tx9uJ
	 Y7byZrHoyUVxII9VqP1zCnO8VC7+22nB71U0D2HEvbcPcZXQQAQjJDEZ5as6B161Xkuc5
	 B39GzZd8E4N2sav6qA240B33KVZxue9OIwU3oWro98Ni2vXW2hBT83GcZViEMKFIcN+HS
	 tKNO39AfTBhYF8O6wuvK3cPDLEke/LzPc4H6PtC7bqYNud1NFQ2/PKa7f3toLgHFJgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=euNGAZ4K;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B81060A3815
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 14:53:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B81060A3815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=euNGAZ4K
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso41614295e9.1
        for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 06:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445627; x=1796050427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tVq/cXwfFrUYTvVPC8LWfCG8earbmrGADPgjnQonGc8=;
        b=euNGAZ4K+o2frNtFCLSaoc+w1MzWYRrC2DJ9LD03fOP+T3gQoBvowcTrX/72ennQDm
         iEBv6VXUYfx2YhE2Sx136lkwo3vVp3HZoVB9p+uerGtN29cyH7apJ+JuzoDOQbYL0e23
         TyCKEHzMIpKR72r+56Wn8b0QqErByHwrqMaQU6qXN7J+3KOL8CHjrdqXy0eFl/o1TRbb
         xKNmJRHDxhR0oZCHhDERJtn/K7DyeNMVI35IvrxROrRhcaGGDnVFkLW57QfqLBjqbmDh
         0J0aznUTlcp33hv51SPkPHpnDd0NeDkfeq3J1VU2ZUU5HWBkB3yknS90YNhsg+31TjbB
         Ly1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445627; x=1796050427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tVq/cXwfFrUYTvVPC8LWfCG8earbmrGADPgjnQonGc8=;
        b=NzbzhC6WMkwokHqdYLmm3XP+Sr5LFMR5vpEcn8+dMXLz5spcc3ZZN+JXLUt0YBq3j2
         61sDeBlhX6mCNOm7D2neRS22f8/fpcxxPI0zvs7Qr6lvNIYArDz8abdIHNgR/We+g7CB
         dUCKpC7RKfRIR7zQEIxDsha6uLXjf1mgcHONAf9qWvGkVzTdxVnfUJYMZR3G6CYfk44M
         pi3DNj4ukEcTQVE+8j1qqBs8Fu1b+NwsBh23we3mn8ATpZb3xa8HP+FZgA/w1QbLn1Mr
         HwXpWQY+F4d1269U66RKrYQATg1I+Crm1k1tp3XMJ4ImGTtlY+pbVKj+EYd2K3MTWKfQ
         K+0g==
X-Forwarded-Encrypted: i=1; AL+hErFP2pZD8kWcvmq+3P9j6/H3H0o2+E5i6jFM9feIPt3C+g1TqV40B3dw/KuI1+aNw7EFopAUxJVeC8c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mZduhfV1m8vF4d+8Lm42FWn8c5/+Mb1digQRifDYQELvmZ5mT
	w32iYNyaSYmvoagXv1QFl4Ess9paI8fuLrfBnUfQKSSKTukyBGSlrFjAfaFwLeNT+DM=
X-Gm-Gg: AZFdTZcYDdRbW6IrAIqEAsFWGaSy7lvIALHLmli277cn0hL3+DNB+1S+yDAjkYqpEHI
	QomObO+x7VjsR9WSdTDDsvKYcapWpCYFA/x31k9gZ75wGwU5dbtOgW9VgAJgwjnXvvFAAeSSBdk
	z50iHQB35L48E3evUW7/Tm/HVIgzggm/hw9P6vU49hZ4bDVF9JuPUk1hHKrcudQlqxGfY/ZczcB
	xMfVPyCFIqwUzDcsoF+Nx67k5yXIjswnsNiXDGkHwp0bPW0r/6DS1I3Wx7h1k0SidqOxPkMkzPj
	L/wLj4xJ8FsAxEItxUpFe7Xt7iA4/vfUmIn5Xke+QeEtCuvb2pCx7kOnOzv7i6fxNCf+vTdpwPk
	bduCRsqHNVWIprPuqlpDg0s3sjMM1OzUQRnoIlMT+f0dhRK8ykZz5pPKub5htIcG328Qnqpf2zG
	tk2E3lFYGhxi1zZiKZsBjQflV6ZZJrED/tOnTTsKA8NEESU1ZWMHkpMh/pE7d8nydQD0iRi0tt6
	FaNX9inpomMeDkjYAsqN1i9H68bX2GM4ZYW1jsz9XRCZjl/DrHn0ISUuwS3wsN6qejDn6709kcE
	h9DDbQH29lS5rvkYQWhdUaLFj0M=
X-Received: by 2002:a05:600c:820c:b0:4bb:7987:fbbc with SMTP id 5b1f17b1804b1-4bb887c29b4mr212865605e9.1.1795445626921;
        Mon, 23 Nov 2026 06:53:46 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm663237455e9.4.2026.11.23.06.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:46 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v3 10/28] dmaengine: bcm2835: make address increment platform independent
Date: Mon, 23 Nov 2026 15:56:48 +0100
Message-ID: <20261123145728.29082-11-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
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

Actually the criteria to increment source & destination address isn't
based on platform specific bits. It's just the DMA transfer direction which
is translated into the info bits. So introduce two new helper functions
and get the rid of these platform specifics.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 77b3e2f58ac5..6180a2737e07 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -273,6 +273,24 @@ static u32 bcm2835_dma_prepare_cb_extra(struct bcm2835_chan *c,
 	return result;
 }
 
+static inline bool need_src_incr(enum dma_transfer_direction direction)
+{
+	return direction != DMA_DEV_TO_MEM;
+}
+
+static inline bool need_dst_incr(enum dma_transfer_direction direction)
+{
+	switch (direction) {
+	case DMA_MEM_TO_MEM:
+	case DMA_DEV_TO_MEM:
+		return true;
+	default:
+		break;
+	}
+
+	return false;
+}
+
 static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
 {
 	size_t i;
@@ -338,10 +356,8 @@ static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
  * @cyclic:         it is a cyclic transfer
  * @info:           the default info bits to apply per controlblock
  * @frames:         number of controlblocks to allocate
- * @src:            the src address to assign (if the S_INC bit is set
- *                  in @info, then it gets incremented)
- * @dst:            the dst address to assign (if the D_INC bit is set
- *                  in @info, then it gets incremented)
+ * @src:            the src address to assign
+ * @dst:            the dst address to assign
  * @buf_len:        the full buffer length (may also be 0)
  * @period_len:     the period length when to apply @finalextrainfo
  *                  in addition to the last transfer
@@ -413,9 +429,9 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 			d->cb_list[frame - 1].cb->next = cb_entry->paddr;
 
 		/* update src and dst and length */
-		if (src && (info & BCM2835_DMA_S_INC))
+		if (src && need_src_incr(direction))
 			src += control_block->length;
-		if (dst && (info & BCM2835_DMA_D_INC))
+		if (dst && need_dst_incr(direction))
 			dst += control_block->length;
 
 		/* Length of total transfer */
-- 
2.51.0

