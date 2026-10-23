Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738762;
	b=iYjMTUeDceUHPx89X/5BbyZnH8dTRD3zV5ZdErYatXFDeUFIyKXW1BF2SdGmXoS2aLhW
	 o1nA9tPWTN4t0uG3nFfpurnB5q9cnAF/qCvPxujAukEyhwsSA9pGoIMLHGa+rOA1NrITZ
	 3rKfOJz2ugmF6wB0Wvv0lFGHlDYg/2vXnmq1wtP2UJYwOmlZAo9zNbsR/DUYLvPFoHiaV
	 xaCmYT2JlfkCySUjHHwbNWXRdNGilAWJbx30s8N2kw0nXmmBJEWexOSPqFaaaW2dtjC/3
	 srwfVftQ1oPhdYcRoApHi8PBMxB7/m3fqbN8jIUUPX88zhyBbq3Iygs/y6RtBNnXIqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BEYeOIBfrzs0WQ5u631SCgZX05KneuJujFgcZvGxaek=;
	b=kqPmWIHiMhylRsO68CdiREap2ee91H5clOAeCbRC6ODvBVTGEd7LFJUF11LnlSXXf4lq
	 eV/GLw6pwGvFgH8VxaK0zDnLOy2ryg4V3CAM6P5JTo6HOBgwdYBnOljNqZ7rB7A4R8pMH
	 8Q9113bU7woQm30Nm9QkpHxU7WCr9YymePMkkOrE3SPqM7WvsP63OrvDTsEoF7p1NPm0f
	 uNH4XgXYPz5eTbwWMQNEFODHlK1x782FDpxzH7R0wP6oqtIG0qM9cJdAPz8tkqps6EwE9
	 iMJP+oW3/87ickYB4mNprAuM3JwviGdCVHChLk3POXaDfXkRXcknCm/UYMgX7D70Zng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aeyWpghY;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF90B606A31B
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 06:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF90B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aeyWpghY
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e987a2ba0cso3815725ad.3
        for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 23:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738761; x=1793343561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BEYeOIBfrzs0WQ5u631SCgZX05KneuJujFgcZvGxaek=;
        b=aeyWpghYRGqI/i0cv6kz09z6ubKjfCDWuEALXzhtWWSGUicGHBB//Z7qwD8JxD7olp
         aR2s60gY7JmgIHjyMVye9O4e3dTXqLC23LLc9RBLXYk9/3AwGefFw4Ov2jEGxl//BpfM
         uAkDadgz1bJhQLPRAP7+1+VwDqxWq0rqPSQCe5D/2hX1iguY5DG08feQaJq7ekuKUtsj
         LYqiATze8i8b4gAxztBijn+KuH656XLXZgWwgXtIjZjH7dSIPkMDz39Ujsh3CTihFwHf
         GFkppTS/TDeijCDOG8Vl7A9rkHEBWioBaiG+6Phv1Ox6Idwg8TQVQnta6jeRqkBQf0c+
         4BMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738761; x=1793343561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BEYeOIBfrzs0WQ5u631SCgZX05KneuJujFgcZvGxaek=;
        b=HZsmQAQr3Ib18NfYevF10GgmkZ4iB7afZIM/+cVCmCznmRO35+l7wqJ85kile8CjHO
         uA0fbbOd0hHMmy3IJZRmgzaqgVAilPigcxW8JqvS5jJ4E92UUO9vJhfPOqvTgyZunviW
         PRtOrEnmFZL/qLXmVT7pqYZddMwID9MjKOvYkUYDy0VnRPbsmNsMekV33QW5iZ3v3/iM
         jetyFi5kaZRClhDcxAAUcvrBULStRJ1b391E0hIixyLyFH2R1LtRt8iABwtaaIZeReJA
         gebuT0pMKSwfd8wAYs8m37ITxAYHy51PG7RSDumNuxviBNfy99JgydAlv0Zf26MLjb3I
         UJzw==
X-Forwarded-Encrypted: i=1; AKwUvBwsdoQM9lLWw2J7MZrKyeS4/3UKi353kGtS8i5A9pMlxs4ifM44SuU8r9jmXgcH/KoMcGALjNBSTmg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRRzmtQ3mgP7IgSxyzttnrXiG3taT6ShQZ8qLPwBO48b2CoSnU
	AoL6a1+jy3+oTKfp21ndq6qy2UKMQvsy6185WW1+vdE+8HbzKHf3PQnSTWAOY7Xz
X-Gm-Gg: AYBFou3b640oCZ2JFFGZ86JpmPHfQ2KnBNVsabh5TiNEIzKKxi2ZR3N3BNF3yTEH46o
	lNDX6HUHOj1nO7makVs60H2ofWfW9Wu67Ee0I4EtWs8x0X40kNuFj27yShSEKHLnsURrMoOhtVQ
	0ViGi2L+/sGse3O3Go62bPEuQ/Qca1Si2Q7CuN+26SFdwOm4WA2U4+QNnjA2VQO0l6WWMWiu//t
	o3zZy3oIfMJ8lqNfJn1mUE2VZ0O7pTyzbpX7aZd9C1Vi6so+sszJOQyYPRFb/Ia3azo4B+p8Mk/
	FI1l2jIbVjYLSKuRa+tBH440bYIJg/0lKn8nvSGNfAD2TUQjvmEQGzrAY+gddwLuQYa/OjOz1Uh
	k1j81FQ3uha7MNfQRQKo4v4JY6Y28Nfgok91T0YfwwhCdBonksqXKZzqHwmjGXUNolPc15WC+kn
	Xk6e9883vnEiJiyJu36LnDkwEo+RHb6ue6FMkdQc8X3yWImVWF49HDGjQbqAyvFV1KQQa+1MHGA
	5xXX1Gpe7YafRDOJaObG5MWNSjkIAHc/STkaD1g3XzYu/YIhhLWy1ZnTopu2nP2TuoauR8R7OM=
X-Received: by 2002:a17:902:f603:b0:2e6:2868:e576 with SMTP id d9443c01a7336-2ea7d100b32mr16154985ad.31.1792738761066;
        Thu, 22 Oct 2026 23:59:21 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7af6eb44sm6395195ad.11.2026.10.22.23.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:59:20 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH] dmaengine: xilinx: dpdma: Fix crash on zero-length cyclic transfer
Date: Fri, 23 Oct 2026 14:59:00 +0800
Message-Id: <20261023065900.3455414-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Wang Haoran <haoranwangsec@gmail.com>

list_first_entry() does not return NULL when the list is empty; it
returns the result of container_of() on the list head, i.e. a wild
pointer rather than a valid entry. This was found by code audit.

In xilinx_dpdma_chan_prep_cyclic(), periods is computed as
buf_len / period_len. When buf_len is 0, the wrapper
xilinx_dpdma_prep_dma_cyclic() does not reject the request: it only
checks buf_len % period_len, and 0 % period_len == 0 passes. The
build loop then never executes, leaving tx_desc->descriptors empty
and 'last' still NULL. The unconditional list_first_entry() on the
empty list returns a wild pointer, and the immediately following
last->hw.next_desc write dereferences NULL, so a zero-length cyclic
request leads to a near-guaranteed kernel oops (plus an out-of-bounds
read of sw_desc->dma_addr through the wild pointer).

Bail out through the existing error path (freeing the tx descriptor
and returning NULL) when the descriptor list is still empty after the
build loop. A non-empty list also implies that the loop ran at least
once, so 'last' is guaranteed to be valid as well.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
 drivers/dma/xilinx/xilinx_dpdma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
index d9a3542c4..bdfa85b80 100644
--- a/drivers/dma/xilinx/xilinx_dpdma.c
+++ b/drivers/dma/xilinx/xilinx_dpdma.c
@@ -730,6 +730,9 @@ xilinx_dpdma_chan_prep_cyclic(struct xilinx_dpdma_chan *chan,
 		last = sw_desc;
 	}
 
+	if (list_empty(&tx_desc->descriptors))
+		goto error;
+
 	sw_desc = list_first_entry(&tx_desc->descriptors,
 				   struct xilinx_dpdma_sw_desc, node);
 	last->hw.next_desc = lower_32_bits(sw_desc->dma_addr);
-- 
2.30.2

