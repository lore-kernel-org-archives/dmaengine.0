Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA95030D3E5
	for <dmaengine@vger.kernel.org>; Wed,  9 Sep 2026 03:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788925133; cv=none; b=jX7Wuh3QEMbzEjXcNiLL/VNca/NlpwV83ypItDFL/SaMvkazwhSI1/5q6sOuec+FfsTpYtr7mj/GHnfOlwAXD5aRct8lcDEQHhm1nwkOG7VqjqV6kbrx/Im62UgtsWg68T8B8U+arSFPMo+6SdsYpv75/IecrGvpjX6a2iG5O0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788925133; c=relaxed/simple;
	bh=v/nPjsQOCEIKEWJ77rJZFCnUUARPwNEBAmiHhVHNtSw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TRm7CCyrNWiC+1Yq7LCvITeBJ+dnZ+TL4LnAF62vy2Mppu/XraMa2uBlE7cDlP2kpLDrx6mOq0e8I+IOM77WxeQQ0mchpltb7L53GjGTWIeQhOCfaU2da6Kh+b+tmgRC829qpwfMRT9NtMGEb1pH/NxBreWFZORo4Nv2sUAK2Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnUysI1h; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnUysI1h"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccdaea76so717074a91.0
        for <dmaengine@vger.kernel.org>; Tue, 08 Sep 2026 20:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788925132; x=1789529932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CBiLqTkQaNBb/2DBOx2xL3ycZ7GO8eo7KWlmm4z4Kzo=;
        b=jnUysI1hv/orHZPOUyqwAHIiYHu/gy5V3VY9H0e5hu5TOuna+//FDlYKYidFsW1R9m
         auIy0qQY5j7mVwPyMhpUxxB7+/yqgwveNn46UyKs+DcFF+YLhmC8w9p8Hb3Eu7R2KAUu
         YMmfHHahBnSukFzoNJa7kOyo7BXNFVjRR1XLSrnwYmCZ7gqumvr/jtNrl8Ynn9XWvreZ
         RAJ1ZquioSgXsp/W2T1k5yd4piOj0T8LY82+WTDaMqOa8tGTykbJIhLsLFOquBlmSe+G
         +vB/B/dE3BgxjiyIdWSV1CHqCGGK1Khfb/LhjTFvG+ApVs+U4MmExE8JNPm4/rxtr5/U
         rgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788925132; x=1789529932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CBiLqTkQaNBb/2DBOx2xL3ycZ7GO8eo7KWlmm4z4Kzo=;
        b=nFdgT+7c8QhVMjzCq4opBO1ytfnSZt437N9gcwnYf2ThHmz5bIJgb/q/FeR1j3jOYK
         eX7VUBS61xmNTcRhQMxg0qo44SL0vPdVXU7GvVF3rgaTlbi4Oke6UG/5Fv9t7Lepd3T5
         d2vD5GN209f0p1dEiOA6+VLqZ6QIoJWBCl2jIxvxWsM+Lqc9nxNGTgokWcujddQJnni0
         3OVH1Hxtzqb5nfREyPdlLrAuT3yr5ePU8L6o1oPgsWCx7TnuFbYvMqDOfGwiVWsH9jeR
         pkZg2Ls64gQWtMkCBH5KfaPTxPMVYQO/bdMnFELZ5mYgFdNJ7lcF7rw9U0WZM7dvwMur
         qVxw==
X-Forwarded-Encrypted: i=1; AKwUvBxGPCHTWDFjIdF2Pz9AiUO7VNpk7hrqnA4v+mGm5LlR7VAl37M3Ma7VhmRKnLeBYaAbQVcFKBXDLjY=@vger.kernel.org
X-Gm-Message-State: AFuF++nS2f5e3Yc+hUElq+44MDMwnZPz8AkUDtPVR1qq+wYxxaWsCS8+
	5vZjw04aitwpGLG5vnlP3w0e4M+SKZfNNDvr/pikyjGhmFTqMhb8RGdJ
X-Gm-Gg: AYBFou2JvL3Ak/k/8+Vt3KrqgQ05rTOVEAYi3SgcqaqbsatkDXNN6sLgtWEtP557Emy
	jcVYPYpT8RAFGIXusTS6cLV3S6pkv4s6zDLUv9nZeHiPLGMMKzD4kJfRqQ396HborCqAmOg1g2r
	IXsuGny352YNYI/EQ0mJEtMr+usTy8awnTRbcRA6+Iw1aRtVqrni5O7bu6FwaEyJoFV2E1kZGCm
	k95sgUypKwXxpJ74w280vnwENxq+MyOcTgpzdIL/74Y4LzeICLKJK5M16x3J7jyuJqcXGDl8e2V
	b1BNMEB8XqBgQHV0HFW+JijAjte62t/PqTLXqz+xzF4cLVEnbwgigwUZdh3vm04C4GK0HyRvFCw
	rvARfg60o4e29xvvFlVqEquxpq9tTrHGwvSdP4Xoc8yymCDW5hXKu+Imz70pA+lk6dcwG7vwY/4
	i7APVvrxj1SIBU57so3wQrLJcF+ruPnCkxBuxentCfoRCf/GrZtJL9a0nWdtxk6zWwDFYkgQ86g
	dU=
X-Received: by 2002:a17:90b:4405:b0:398:9bd3:d6d4 with SMTP id 98e67ed59e1d1-39b8bf0ce55mr7805843a91.14.1788925131938;
        Tue, 08 Sep 2026 20:38:51 -0700 (PDT)
Received: from baineng-pc.. ([117.133.183.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25f88475sm29419266a91.1.2026.09.08.20.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 20:38:51 -0700 (PDT)
From: Baineng Shou <shoubaineng@gmail.com>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baineng Shou <shoubaineng@gmail.com>
Subject: [PATCH] dmaengine: mmp_pdma: fix wrong sg length in mmp_pdma_prep_slave_sg
Date: Wed,  9 Sep 2026 11:38:41 +0800
Message-Id: <20260909033841.1395793-1-shoubaineng@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In mmp_pdma_prep_slave_sg(), for_each_sg() iterates the scatterlist
putting each entry into 'sg', but the entry length is read from 'sgl'
(the list head) instead of 'sg' (the current entry):

    for_each_sg(sgl, sg, sg_len, i) {
        addr = sg_dma_address(sg);
        avail = sg_dma_len(sgl);   /* should be 'sg' */

Consequently 'avail' is always the length of the first entry. For
multi-sg lists this causes out-of-bounds reads when a later entry is
shorter than the first, and silent data loss when it is longer.
Single-sg or uniformly-sized lists happen to mask the issue.

Fixes: c8acd6aa6bed3 ("dmaengine: mmp-pdma support")
Signed-off-by: Baineng Shou <shoubaineng@gmail.com>
---
 drivers/dma/mmp_pdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index 386e85cd4882..e90fd2023af7 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -713,7 +713,7 @@ mmp_pdma_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
 
 	for_each_sg(sgl, sg, sg_len, i) {
 		addr = sg_dma_address(sg);
-		avail = sg_dma_len(sgl);
+		avail = sg_dma_len(sg);
 
 		do {
 			len = min_t(size_t, avail, PDMA_MAX_DESC_BYTES);
-- 
2.34.1

