Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A49E4BA1D6
	for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 21:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789162670; cv=none; b=iEjeSfUyEELFjnFii1wuzlof3j3bKK4+9lq8mHkikNFkN5K2sQWN8fn+MMwcEzRZm3FixICovzzAPibAHyaw/Hnq7aBbiDqopmHofLEz/zDUuQnZr3talL9kEtCB7RLDyGsdls/o66bOdw6wqAaWjPrY0yc39Z0j2LDXzyAwhC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789162670; c=relaxed/simple;
	bh=ZNfztZEU2//GyAOqq8S1u26/zwtbl0TRO3BJboKeccc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pI4NQG0tWpUOikpaw8bUJsNAG5iMls/K3TJjc1WrmifT8NVRPizLcsZ30+7ZDmGjb2AV0ulg5oQXWo9MtgMxEeuPebfX2+GwdXiuSbyq/EkOYqsEgUCUUMjD+CYd7qAM63J6o2q4BaZn4papiQLv6wgQU7uyLkihjW1NTmv6yaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qKBIxxjr; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qKBIxxjr"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd4b678f3aso298175ad.0
        for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 14:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789162669; x=1789767469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JDhrzRcwD2NTK4SBVgRtYy5vlPhq+NtyxLlDZpytljs=;
        b=qKBIxxjrCQvcLcYjd/oX1N6htNLGuWU9Bz1jDtNAfvNVDYK2KGz/GI4fZvJNqsntf8
         nzWFPTijDA82Q7Rz4kx0CRjhNzSa0sDUxUnmb4zZAYRqCztHaVAZFIovyN1f63la9XKv
         o5ESCAIMOv+4Hu96bMaW2icdXfXJuItWjVeGiYZidUhqNl3PbGJSPjdJ4hZvaM85ZIM6
         Qz3t5kMLaBmk7LgAxNHLcoNCAZiwLofjW56yWr3pgwwdnimPtrcPX1bCWc3/bT/TE1jk
         Fo0plTBkOP6Ibag7jAItdahoaR0ZikTS7akN6/p+sPw2ChdsU2x3DmHb2+VYrrMJzg+X
         enIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789162669; x=1789767469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDhrzRcwD2NTK4SBVgRtYy5vlPhq+NtyxLlDZpytljs=;
        b=B2Ya+DmH6hpzdyhB8Ot/jVfMMdTl+J1SnSShLX23KtV5hvcXBgNb8Qd+dzjx3DbTtf
         dRKlnxA4Oy9TvYbGKKUX6GLZ4OfQ1aeCz4AfQu1WGyHQvFDSr9yNeAKl0+k/FGLoCYlX
         8i0tuvNPFOvUBowbhWeatbWngPc0Fw/vpPGXte3H+zrikPUCAwkrOS7mMYhc/0eI4F2X
         EFlIIJh8fVN//UoFbfQQoj3+tHNL76Ac2oxWLU+YcCNz7KV+sc421XgiVlSTmaTlYsbs
         8074VNHzz0VdEPzMEq9fESg69hdArkS8YVD+COGs+3ytqWVTOP8plnUN3XplHlTmO2EZ
         Vf5Q==
X-Gm-Message-State: AFuF++nBAP3oA5yZPerfho+2sxdq1mA7t9YX7kyBzOltLjHSf0CCON10
	BdmMKkT/gnb3n85dbaSdD3ZH2p7g7xE9eyy5KGR16TsaOWeEPiyBBq6+pm8Q6g==
X-Gm-Gg: AYBFou2RJu35UNOAXNfC4oCnjSV7BzzAUYAYxMw3K6CdNKiPQZ+USRO7y8hcCPxdBNB
	NxSjLlsIPoojz0FCVglLoR8nUr/TyTyT4WMh4mmeZT8TL69j2VNbmPT1eUUX2MieWbcVcRP7nj4
	1/P7HQOmhmBkJ6m2K7XAiHV1F9Dcizg+0xSxI61JTtLTw1wA1/60BoI8voFlnVIvqJ2toCnwoOG
	Q7OSAT2wezANbgjSGX1x2+ezDR8WxnYWHN6BXENhYbeZr7GrTNlX8zRUoqEB7oHqRQsVQCb5m3x
	u3T1espqg82cOGRzkdrxMUZ5tJpuMrjbxaVWuCDzxphEi3ZUMgGEvrIu4R15vx2kKWt/p2U3jag
	RxCySZuq2U1GwEh4v6dl+dyvPnd1h08vMnXQuB94WA7JuFK+fnAPIGtwj9Wcv2Q1ZP325tFfV6W
	tYTzVwDl6Uti3HIbRJqZdYOl5O/Sr5qjI4Ickw/P8SU2mxZakBTmRYhoOIELTg4TzKnK+ErmoY4
	fqWqh+lqWzyRoZlO1qwWP2so7BcxLbM0wZ/bCmNBV848IEyPI6HoPmOOI72gZ+QwCs+9nqoHmbj
	+vfRCQRjTMnLA2/dIp24S+eYqL/uJKEMYyUXVQZM0+Ec8orw
X-Received: by 2002:a17:90b:2588:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-39dbbe87b09mr238752a91.2.1789162668775;
        Fri, 11 Sep 2026 14:37:48 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95864b4fsm7194468a91.15.2026.09.11.14.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:37:48 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3] dmaengine: bestcomm: gen_bd: fix out-of-bounds access in PSC parameter lookup
Date: Fri, 11 Sep 2026 14:37:47 -0700
Message-ID: <20260911213747.132694-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bcom_psc_params[] array has 6 entries (indices 0-5), but
bcom_psc_gen_bd_rx_init() checked against MPC52xx_PSC_MAXNUM which can
be 12 when CONFIG_PPC_MPC512x is set, allowing indices 6-11 to pass
and read past the array.

A malformed device tree with a large cell-index could therefore trigger
an out-of-bounds read. The garbage initiator and ipr values would then
be used for MMIO writes via out_8(&bcom_eng->regs->ipr[...], ...),
potentially causing out-of-bounds MMIO accesses.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: reduce bounds check to single function. It's not used anywhere anyway.
 v2: fix title
 drivers/dma/bestcomm/gen_bd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/bestcomm/gen_bd.c b/drivers/dma/bestcomm/gen_bd.c
index 61b5746e1a97..208340ecd2b7 100644
--- a/drivers/dma/bestcomm/gen_bd.c
+++ b/drivers/dma/bestcomm/gen_bd.c
@@ -321,7 +321,7 @@ static const struct bcom_psc_params bcom_psc_params[] = {
 struct bcom_task * bcom_psc_gen_bd_rx_init(unsigned psc_num, int queue_len,
 					   phys_addr_t fifo, int maxbufsize)
 {
-	if (psc_num >= MPC52xx_PSC_MAXNUM)
+	if (psc_num >= ARRAY_SIZE(bcom_psc_params))
 		return NULL;
 
 	return bcom_gen_bd_rx_init(queue_len, fifo,
-- 
2.55.0

