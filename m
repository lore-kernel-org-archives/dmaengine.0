Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884595;
	b=WOTXPv/U58mV3fs00e4OVlW6fdn4Cog7buiX+Ka3n8zleFW/V1pWoycAZk+gL9YcgfGA
	 1P11ucQjM0u6qs2ChgLVTWd4gAzp/dbKNlQptX0mZTfjOFbpcGkHalVEKNZKYwCfMyxDG
	 MfqmdRedB78aiGcmvRC5R1/5+jrDU2zAWLUaCpN9/txDzcLNtm0BM5T0uqoMFq29bdIzx
	 LDhkIIxLM91RdgUmIK45n+mT42KJvB7hzKN9LcSq8yhpnmtSBflb/xjJCzdmmtvUI4xDO
	 J3IZJVOIKdKUF+J4e6ouCt5TTVlbAX5/kbzB+TvI50HScuY9Za493FguxOBu6Q2bY9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=6mxWBwIYL2Hy5NVtOCWPPkiruMQvPSnA3ve7z9sZrNE=;
	b=uzQUgFqvY7wdQTzgVYyQ8yXZQxgUAQ8mbV+NAxx9KzkqvdxyDH+o9GZSpQNzk4h6DldR
	 D48c2ELn+ESOC+76Y2SZmuXZNU/Jp2Vci/4vVuid8h4DAbNcjK0RW396WzQecvT8dInEs
	 nQVrRxKxltt3U8LbVHmtEKFVxi9vQDTtjTmmgQTLNwusYJSyII5KTpyr4KFt6RNZ6xO0B
	 DKHdcO7KwvJowYHQur/8l71lvfk2MBSHFoy5AsXUc9XosnAofhEvihGHaPZBQDCrnsLXp
	 WHO7zLUgvZCOit/Ub+f/IlBcUnSfSFRlV2CaelTzC7yagpKydMcH0ePNAqxhJg18//Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="jrlFr/Le";
	arc=none smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C18606A329
	for <dmaengine@vger.kernel.org>; Thu,  5 Nov 2026 13:16:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5C18606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jrlFr/Le
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ac91f5aa89so16527261fa.1
        for <dmaengine@vger.kernel.org>; Thu, 05 Nov 2026 05:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793884593; x=1794489393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6mxWBwIYL2Hy5NVtOCWPPkiruMQvPSnA3ve7z9sZrNE=;
        b=jrlFr/Leg3DRlXDUvgLbN+j+d3+SRiGujKLzOvLaj1hoZrD9uT2CJZ+BETquXeXRdJ
         i/zEkUO5ztSznEUt0iNhxDN8cjyqo9baFfLd/uE0NoMI/qQyaosN9P+frVQZ43EUXT5W
         lk+GRuBk93dOam+HYSe5QLN/XTStYt8CeOXEufsEYlsVrw/D+3g/Tyk51mZvtZ13ZpGy
         sbCdQAZepwTrVohzGmOVqpCJ4ssWgX0+LBc8tjIfc9RtzKnNVQ3iUzjHvZ/soW/W1O9n
         ifB1xReLjgjHaDRdqEeccGY0e+UTbuF5klDozRUh12DC5vfm0MVchW55bMpRtDCgqU9h
         Q5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884593; x=1794489393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6mxWBwIYL2Hy5NVtOCWPPkiruMQvPSnA3ve7z9sZrNE=;
        b=ZZBAkaYdJ9hO58+/kxAsZtfBwQQdPyiD/CXkseuJzXET1pn/m6PEQ9lwIun//Ysw2B
         rr7hKIxTLnqYbyltVSol+8wj/kccWcc3uxR5TZwF4QOKIPGwt/5y+9qfAHeYomqDP6uj
         Xk6joZJFLpony0ZYYBw2zJZUVSvHH/7JmrnfYLcjuNq34IZ3c4r6xUemWbJxBNKCfhGY
         RphYhvKzCCvv9FXHFd8bIPU0+Ny4f8kgvKjnmjZu1hMEvpHgMCLYYj1OS4KwesWrRUnY
         x1EcJNoJmjQ+Gx9noyCWObssfb8CVh4F+sepENE4O0h+qiWADd8Rn+qJrgIoYSsAs6ew
         b4kw==
X-Gm-Message-State: APuU4Z+oZgotOqzYBh9Zopgg+sQsV+12fgJhyVhsR6QsdmaDLncxr0IK
	oyQV+XcBpR1fmSL5Bv8eHfoWThN7vep4Alg81dRc75jC5ZaCCHdzX+j6AiQHkbsW
X-Gm-Gg: AYBFou2qAcMCqtEt+nkci+OZtvxPdTtCMO2vQ4SkoJ7V3ezEvYL0yUo7F1wIH/aj3CN
	twxl4mC/zuCOGirRAiI/JuMXsHDiLGA8BjXiGNDDn7nGg3U75b7Kfegl5TGdO3sZKuxw60M3Bf/
	WvE+LPme3uJZQsAIJwOzL+82/jG23VU7rru2ttbK6mGCrFSPNs/xPdgMJN2Raa5/mT6oMI2NENw
	PsuPuz+Td7j5tETzallcGTviQYxpYpPJ3KPnQihoLitZKMof+m8T3Nd7E1SF9nFqRhL2dEExWli
	d0eFRy442EF92uyncrxe2GW2v+jpsi4WBnZp5VJ6/4Fl3kwoVUX9tl/9BPUdGXRHkIawRSWFAZA
	EnvDh/Qjt+6nSMahxSoJj3Z1u44XgqZhZfCKdlHKczIhvalCQw1TjwkyUqBGhP/90KMYkQrlf4c
	ESXeCC/7eXSemEKD8fld3b8c56z0Qf1jDtvzAdpSTPKEMDbejMt3ntEYNaA9Z4iWAkYqtTF/pv/
	rnSxxOyqoFjCWIhq7OemPSfbIuSgk9xBepgxxbj8CY8Oe4sihWvRhmEFh+ruLIcD+xdXF8/UOF7
	84pMCTOEhZxjGMnfWA74FqXU5jbLYXe0f9uuDCEwarCI
X-Received: by 2002:a05:651c:150a:b0:3ab:4458:ba24 with SMTP id 38308e7fff4ca-3acb7b44b89mr54522391fa.21.1793884592626;
        Thu, 05 Nov 2026 05:16:32 -0800 (PST)
Received: from localhost.localdomain ([46.188.59.33])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc37e536sm11313651fa.3.2026.11.05.05.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:16:32 -0800 (PST)
From: Sergey Matsievskiy <matsievskiysv@gmail.com>
To: dmaengine@vger.kernel.org
Cc: lars@metafoo.de,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Matsievskiy <matsievskiysv@gmail.com>
Subject: [PATCH] dmaengine: axi-dmac: fix incorrect segment size calculation
Date: Thu,  5 Nov 2026 16:15:47 +0300
Message-ID: <20261105131547.305510-1-matsievskiysv@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Signed-off-by: Sergey Matsievskiy <matsievskiysv@gmail.com>
---
 drivers/dma/dma-axi-dmac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
index 02acde918117..0a308630e542 100644
--- a/drivers/dma/dma-axi-dmac.c
+++ b/drivers/dma/dma-axi-dmac.c
@@ -707,7 +707,7 @@ static struct axi_dmac_sg *axi_dmac_fill_linear_sg(struct axi_dmac_chan *chan,
 	unsigned int len;
 
 	/* Split into multiple equally sized segments if necessary */
-	num_segments = DIV_ROUND_UP(period_len, chan->max_length);
+	num_segments = DIV_ROUND_UP_ULL(period_len, chan->max_length);
 	segment_size = DIV_ROUND_UP(period_len, num_segments);
 	/* Take care of alignment */
 	segment_size = ((segment_size - 1) | chan->length_align_mask) + 1;
@@ -753,7 +753,7 @@ axi_dmac_prep_peripheral_dma_vec(struct dma_chan *c, const struct dma_vec *vecs,
 		return NULL;
 
 	for (i = 0; i < nb; i++)
-		num_sgs += DIV_ROUND_UP(vecs[i].len, chan->max_length);
+		num_sgs += DIV_ROUND_UP_ULL(vecs[i].len, chan->max_length);
 
 	desc = axi_dmac_alloc_desc(chan, num_sgs);
 	if (!desc)
@@ -840,7 +840,7 @@ static struct dma_async_tx_descriptor *axi_dmac_prep_dma_cyclic(
 		return NULL;
 
 	num_periods = buf_len / period_len;
-	num_segments = DIV_ROUND_UP(period_len, chan->max_length);
+	num_segments = DIV_ROUND_UP_ULL(period_len, chan->max_length);
 	num_sgs = num_periods * num_segments;
 
 	desc = axi_dmac_alloc_desc(chan, num_sgs);
-- 
2.47.3

