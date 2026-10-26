Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015482;
	b=h15zjaNlfnwOG/G4u7Vgb3JpB7/KuMVWwrxQSElKYHU6nxw2mSztOja0166Fdk/+fvqH
	 Xt0uSGkHEsAMOAUgere695DKWbZFQurw0qWuimoxGOcxgIopmJj1aQxQ4qqiAYhxvNjrx
	 Dug/72qnA1of43LvgbI6yaMUAvmXC5Fg0OEeIUUJFfaT9V7MuMa68/EOYOkmr3AjvMJjk
	 oS+HKF07p4tG1UsftDvIR4e2V90QEKZ+yKRdSfX26EZBorb8MBjv3IDhJWCO40RK8dl1d
	 qT+65J/iXjn++t2MI4VxLROj3S7DzaGzRY4EHG3/jd3wYba4sGzFrIphwnS4KSfwc+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E0esgy2urAKBegODgpBIrC0VFP99XhOfXo6f3PoumB4=;
	b=RenFRcrx+QlES7sWG4rYGYs0Y+qslK6wPAMeNL7uTRJJFMJW6sjB2afcZoKmP3RqMHNO
	 UceZJd8abJ0F326BWlUSzuSZT2JycgwTogUvL0DKG8VbhVGqgSsLrKNy7wS1CFMWDn6vk
	 VlgcBfVAx+qhg3bSii1Hw3/iLLlwwA18BzQMnqPh8KjSgG3KRKLIaS2396wNRnzw03oNL
	 Ytb2K30J7j9yf94ErTUTfP1Vxd8DhFY758sBLntinu7mtaKaOw/IyY1zx+txRZ6rPDHl3
	 53dtJDSxyXe/aNa/VtUAFH0nLz6ugog0D6ZvhEdfh0iCAdQBh57vMUtC3Vf8+zR8UAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="MTMfG/zS";
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B02606A31B
	for <dmaengine@vger.kernel.org>; Mon, 26 Oct 2026 11:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72B02606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MTMfG/zS
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e9e53d011eso20198265ad.1
        for <dmaengine@vger.kernel.org>; Mon, 26 Oct 2026 04:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793015481; x=1793620281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E0esgy2urAKBegODgpBIrC0VFP99XhOfXo6f3PoumB4=;
        b=MTMfG/zSO17kLWtg0vfDzPd9SeenV6eWXy6nibQcCTOrsg5jSrv/OJ0E9CxXJ/Oaaw
         ElJY41x2nd40gtPnGitdFl7htTsVne+gSi5b3VOZZT00z9DAEBDnWh9ddyw+bWtk6e18
         vqw2LPqTJe3pZoaKzTrq0qtLop5bxyo0WDMvZfcEFZQQqnyTEZbQ7o34YIfZWAnnOU1T
         kJcs7aKgTx1TdMOBeBNpUbMi+side4DyJRTXmujvIQvmlj8/E7nAa56110lERY4w9eJe
         aZA7dV25dcpk6PfEqfKL7pZc2EenyVNZEVntaPOUi8+OH1a2jJI82LfnRRnUqBnvouNC
         LceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015481; x=1793620281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E0esgy2urAKBegODgpBIrC0VFP99XhOfXo6f3PoumB4=;
        b=jGTgTEMhg6eD6jeCwImXKot5D2fFRGCxQXh3cqCLW4t8UKTbymaGbHhor6i5MLJHmA
         ld/qfIH9KdtCeem+5q5NS/ROUtrgd9nVFjhNVqly1sqJ+ZI08019S6eMaH0oCeMCusHR
         C/Cl7VXz71ekYWNqQXMHPd/EQxtsuH3CedRWifw4c9SMC+B6hkRAM3deeKtWlTDN0GrF
         FnkSd+USCcrlxSdz9TYffWLSUSYLbIXBiD6rm+jHQEUmZu4iGAiJrwMnYUlcKuFbdVFh
         z/U9EhFjHrpL/XIBTo7E3xU+5fI9dhDZn9yEXZ59FNP5A+/aUzjbNs+f7zbmtfbY+EFI
         w6gw==
X-Forwarded-Encrypted: i=1; AKwUvBzFRLz/EcbIJzjgeOadIWd+PU6fAfPKoU/PIhjRbVAWfmxUViQShJlwGvkb+z9MwG56y9eXIv74qiI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZSFxeMgYztAiW9ovHIWHZlec0Ktqifyx9Bblhb5qD854Ags4e
	k5rY/Lj8/j0Z0FGsg/wLC6DeQql+PLO5OyW5H36t1iSR/eIoPwm7cYKM
X-Gm-Gg: AYBFou1bmGpqPkQkviWnoVMtCTkdBkRpj63ykQhdqC9qyNfELuuOJt/OyY7gRRAUvqW
	ybllrCcdlcDg/tbdroBwXz9Fl/8y/KfPFWBb2IVv7FizlTolpSzHR1T+K3W1Kc66oCGV5RhwSSk
	KzhYnMy9g1UZgTs15wWmJl8AG9SfD6dfORUfkRt9eNF672TctQN2w2yrDSd9WoT3Q9MG0qtZs+O
	dqmfjZ4+eDnOD5Kz7YnOKUqEUo/9b9wsHtXJNYfAtvHa1XZ1Sx9xAIhxIRslVn0aa6VhwqGVnpw
	DVWE8wOZ5lb1/4FN4dCIhnovhumigcCvx9r83SwAjY+hp/tPpaQt7Rk5bTpyib0ah4VCWhOcV6s
	UPxlV78CkGTYua0GsatNPku49OYixc2RafFSLAINQdN4ZUmYr0NAMSblDY+zjc1MGLsgRWhFdq0
	7KwjlcugrFgCcGbFDe/8dD3RYSvkDjAQPOH11/+hO8XQgoaEAXGKbevidBo0swJOPj2b7WRJDBh
	JKJuqZd/vYUtkcxFXZfA3OqP2tXhRsPfUZNuR/b8vn++VkogSj7vqdx+AuWlAyoQ+t5UZC65fM=
X-Received: by 2002:a17:903:fa8:b0:2e9:740c:371 with SMTP id d9443c01a7336-2ea9c6c4eacmr54260345ad.38.1793015480745;
        Mon, 26 Oct 2026 04:51:20 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9af32271sm15443585ad.9.2026.10.26.04.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:51:20 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: Keguang Zhang <keguang.zhang@gmail.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	linux-mips@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH] dmaengine: loongson1: fix list_first_entry on possibly empty lli_list
Date: Mon, 26 Oct 2026 19:51:13 +0800
Message-Id: <20261026115113.3359939-1-lixicaicai@gmail.com>
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

ls1x_dma_issue_pending() calls list_first_entry(&desc->lli_list, ...)
without checking whether the list is empty. list_first_entry() does not
return NULL for an empty list; it returns the container_of() of the list
head pointer, i.e. a wild pointer that points backwards into the
enclosing struct ls1x_dma_desc/virt_dma_desc area. The bogus &lli->phys
is then passed to ls1x_dma_start(), which dereferences it (out-of-bounds
read) and programs the DMA controller with the garbage address.

The list can indeed be empty: dmaengine_prep_slave_sg() forwards an
sg_len of 0 to the driver unmodified, ls1x_dma_prep_slave_sg() does not
reject it, and ls1x_dma_prep_lli() then builds no LLIs (the for_each_sg
loop body never executes) yet still returns success. The resulting
descriptor with an empty lli_list is queued as a valid transfer and the
problem only blows up later in issue_pending. This was found by code
audit; we do not have Loongson1 hardware to reproduce it at runtime.

Fix it in two places, following defense in depth: reject sg_len == 0
requests early in ls1x_dma_prep_slave_sg() (a zero-length transfer is
meaningless anyway), and switch ls1x_dma_issue_pending() to
list_first_entry_or_null() with a NULL check so an empty lli_list can
never reach the hardware programming path. Neither change affects the
normal non-empty path.

One related pre-existing issue is deliberately not addressed here:
ls1x_dma_prep_dma_cyclic() derives sg_len as buf_len / period_len, so a
caller passing buf_len < period_len gets sg_len == 0 and crashes even
earlier (sg_init_table() on a zero-entry table), before issue_pending
is ever reached. That is a separate bug in the cyclic prep path and is
left for a follow-up patch.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
 drivers/dma/loongson/loongson1-apb-dma.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loongson/loongson1-apb-dma.c
index 89786cbd2..e7eb40584 100644
--- a/drivers/dma/loongson/loongson1-apb-dma.c
+++ b/drivers/dma/loongson/loongson1-apb-dma.c
@@ -302,6 +302,9 @@ ls1x_dma_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
 	dev_dbg(chan2dev(dchan), "sg_len=%u flags=0x%lx dir=%s\n",
 		sg_len, flags, dmaengine_get_direction_text(dir));
 
+	if (!sg_len)
+		return NULL;
+
 	desc = ls1x_dma_alloc_desc();
 	if (!desc)
 		return NULL;
@@ -478,8 +481,11 @@ static void ls1x_dma_issue_pending(struct dma_chan *dchan)
 			struct ls1x_dma_desc *desc = to_ls1x_dma_desc(vd);
 			struct ls1x_dma_lli *lli;
 
-			lli = list_first_entry(&desc->lli_list,
-					       struct ls1x_dma_lli, node);
+			lli = list_first_entry_or_null(&desc->lli_list,
+						       struct ls1x_dma_lli, node);
+			if (!lli)
+				return;
+
 			ls1x_dma_start(chan, &lli->phys);
 		}
 	}
-- 
2.30.2

