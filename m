Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794894107;
	b=FAGCG9GdAhvyQDPWrBHs+BtSULCElnW4FdK8M5snHx5DaLj253LpmXknMfXwTYcBiLmC
	 sEinO9RL3aUoTkVqvA7MIa7YNqJKG4Rvaj5N9Eik/7jc/pHftffD6zCFgxQDsZeDss9yl
	 HusXgrMrBl9FXITLq7XLmrd6mYP1T5w6mUP7gU4EXSJv4+YZ/eXpFj2ViBAzgcSxvuKWX
	 o1QVfNMeZsXtq/EsWY4rsv73pgvroGKiiR7hEQCxYAr+XJlSzmMU6wt5EkkJHKZCxo+HX
	 ISi3zlvg8rd0i2ezyM+3kn6Vt8F6C92xU5fBRRdwCYA1pZPXNgRD8LAVFMevs7W/dYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794894107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dA9ysPynFG5IhwyWvrai64rvuE6c8TdYQjatwRCwrmI=;
	b=S9Mk4F6lFJY9d8TibCDtLoGV667nS4UCt+vMmoCbpACPThSXF5UF4laKfKQ7+MyhxrHg
	 OkdjcvCTzw/6N/QiJzQai4n40XnQ1o5NJkqlwmllvYpvH+ELqaFK9eKQeWrnEvh3cvkMw
	 VqAR3ph5D7t3wx52N0TgO8YEGmVEUco9n6rRg9xuFFpOL3V/2lhPS/lMYd5Zv4JXSdBN9
	 Tog/Cf3s5kbjVp0Hyxx0cmikrZ1WUAg278Djkw67ZUyzjRy7QUTAmkdKsfj8Wz809iRdZ
	 7AN49igsYsZ1jaGJG7GQ/hdrM8hAjCukIyFb4/0q9ZzDvpCu4gIlO1qhVa6SZQgjwsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rwibq2Zx;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2E6606A329
	for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 05:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A2E6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rwibq2Zx
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4910b863b84so293187f8f.0
        for <dmaengine@vger.kernel.org>; Mon, 16 Nov 2026 21:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794894106; x=1795498906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dA9ysPynFG5IhwyWvrai64rvuE6c8TdYQjatwRCwrmI=;
        b=rwibq2ZxDI6aSuHJCyP/adwhBjemoMzjXOwZaySMmv1X+GrMsTBpKAVGtA2y4PEq6S
         7uXFV5ZQeZNemVmdZWRQKEiTZOMkLtLIVnkYYHv7ypjmFUracUOroHs16866G+FoRIay
         F+lRNekHDCvtu17I7oonwomAsXc3OMUterkpRgi2al9q017/HtRRk0eTU3eBCF6CfDIH
         DZzuIcznn3Gwk6zLPPDyci/kTx8iOwQC0V0NbCFpXIk1EBNb3M9QI1SF5rVAGxocOBE+
         B5j4oZlYCuhAgqwz84EmkESEwcK18ifZ7QdlpWGT2RTkCsjnbzVQtoWwoCO8yYhazbHF
         B5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794894106; x=1795498906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dA9ysPynFG5IhwyWvrai64rvuE6c8TdYQjatwRCwrmI=;
        b=DMQxwGdvqaHiCOHSl/kKGqQyh6f/BnFbA0s1jAr0GIcmGB6twM6NvkpvEPM8WhdNjY
         482HpKVy7zNhfbgn6Z5e2ZQPcTh1E7EU7jTAk9p0BZRIIalrHAil6jDy8T6eNGOaX+UF
         0phF840eq7XgOVrmRwjno69qBnPIwLkecJE6V/+MgJVUYGLpkelGJ50ypToX6vFvYGXJ
         edQGfHK+32mom+lXt6xWQhL16Icea3T+vPiCVUU/nuM7CHp2ToV99x19FTzNjoCtC6PS
         kCIkXoTCm1v32FQYBSaDwwkyHnawr5udd6XV3vm6dgetbHBT/AroEmAjCwypNHWu203Y
         6PWA==
X-Gm-Message-State: APuU4Z9P4tZGDF6EiHqpVqS73cWu2k+1sa406TCjKUuk4FzVscfL84a/
	lHAdD38rq3VkB5QIN6sBBA0YXoSsM/+3PI/zfucppNFAmGB5rlGLQIfOaQq6GKHb
X-Gm-Gg: AYBFou0qQsgGUUJhtl5FHprog8CuJee5tKcZQZJHr0TnjDrE484/ZettvA/AWiw2m+4
	NI+TfFqGYbTw6NJZjSr4UEf2MV6WqzpHqgNBR9I2pHsLxbd4WoCVOg1chI6DILL9aE4rF+0VK2d
	r7RvB8SmUXbmoAg5rmS+BDfe5wbh3FRhXfVqVsud1SvQcceVmfl5XzfTVFZfSeqzxBI4yVeG6X/
	slHwFVQJ/deFtJuv48rHNVmjeODRq6Pmynt87t6bdCtFBZ9cVg6Nj3kGvFDuzP3beqOPVZJXD/6
	Cr2bmqpuZwgXURN6nu2RXmZW2wzNgaIyqGy79vpCTEMI1vg4GYGBve3TVxbrHMCXj38m16pn9f8
	Z0pHYLTLb4Rwj1PhZuQDaY0BEfb3A8ZoULcyGWu/Sbc0TFs41d5eCyqDYFiYqvN+zunRcz5p3WL
	0/rjcWiSsYMJWXTe/sWMYTi9xeG02DVUOGVg6oovvC14HKE6abnquBCOgiEb3KqlruqVUEhRt6e
	bSQOWcDtuGsAi5dZaZIhHWOCJEr2UCILroiibhVlETOiW4dea75uSMRGPCo9a0EujqXhd3JRpIQ
	wRHth477cJbGRcjEC/o2curBn8p5LOubXlo//yCUpcKO
X-Received: by 2002:a05:600c:678a:b0:4bb:66fd:ad68 with SMTP id 5b1f17b1804b1-4bb7838dc68mr35404145e9.14.1794894105609;
        Mon, 16 Nov 2026 21:41:45 -0800 (PST)
Received: from localhost.localdomain ([46.188.59.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb68c00b10sm125348055e9.0.2026.11.16.21.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 21:41:45 -0800 (PST)
From: Sergey Matsievskiy <matsievskiysv@gmail.com>
To: dmaengine@vger.kernel.org
Cc: lars@metafoo.de,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Matsievskiy <matsievskiysv@gmail.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 1/1] dmaengine: axi-dmac: fix incorrect segment size calculation
Date: Tue, 17 Nov 2026 08:40:54 +0300
Message-ID: <20261117054054.22409-2-matsievskiysv@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117054054.22409-1-matsievskiysv@gmail.com>
References: <20261117054054.22409-1-matsievskiysv@gmail.com>
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

When chan->max_length has a value of 0xffffffff (which is a possible IP
configuration), DIV_ROUND_UP returns 0, resulting in incorrect number of
segments calculation. Fix this by using DIV_ROUND_UP_ULL division
function.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sergey Matsievskiy <matsievskiysv@gmail.com>
---
 drivers/dma/dma-axi-dmac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
index dbc31b185c4d..30ea905840fe 100644
--- a/drivers/dma/dma-axi-dmac.c
+++ b/drivers/dma/dma-axi-dmac.c
@@ -706,7 +706,7 @@ static struct axi_dmac_sg *axi_dmac_fill_linear_sg(struct axi_dmac_chan *chan,
 	unsigned int len;
 
 	/* Split into multiple equally sized segments if necessary */
-	num_segments = DIV_ROUND_UP(period_len, chan->max_length);
+	num_segments = DIV_ROUND_UP_ULL(period_len, chan->max_length);
 	segment_size = DIV_ROUND_UP(period_len, num_segments);
 	/* Take care of alignment */
 	segment_size = ((segment_size - 1) | chan->length_align_mask) + 1;
@@ -752,7 +752,7 @@ axi_dmac_prep_peripheral_dma_vec(struct dma_chan *c, const struct dma_vec *vecs,
 		return NULL;
 
 	for (i = 0; i < nb; i++)
-		num_sgs += DIV_ROUND_UP(vecs[i].len, chan->max_length);
+		num_sgs += DIV_ROUND_UP_ULL(vecs[i].len, chan->max_length);
 
 	desc = axi_dmac_alloc_desc(chan, num_sgs);
 	if (!desc)
@@ -839,7 +839,7 @@ static struct dma_async_tx_descriptor *axi_dmac_prep_dma_cyclic(
 		return NULL;
 
 	num_periods = buf_len / period_len;
-	num_segments = DIV_ROUND_UP(period_len, chan->max_length);
+	num_segments = DIV_ROUND_UP_ULL(period_len, chan->max_length);
 	num_sgs = num_periods * num_segments;
 
 	desc = axi_dmac_alloc_desc(chan, num_sgs);
-- 
2.47.3

