Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039264B1473
	for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 18:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789495763; cv=none; b=tcVVMcZYIK9+AHeusf/+albKvMAh/I/eAIW/MIt5HCh0XwY+15eN0tDm1uvxkTWYnno7rOelgm3A3y0TsgHQ45wGdrCNBauC6mi1E/US/O41G1ebLa3n8M+hhBa00Vt0ikuQvbjv7cPWvBS1qvDGgjR7o+89mavg59qAmOSdCDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789495763; c=relaxed/simple;
	bh=KgXXVwU9pR92XVpQim/fuOgXHA/rlbi8m3fd+vyq9Ds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dyp/S2c3GnL/e2TBcXJUg0Z7AgRStec58GT6+xaEe8HeZAf14sLMBCvn/kzRlb1A92V3VkH1f1Zh/sZeuNcTdC1amI9WSAqRWzdbkJuJpvQmWeMFtVdpWYHZrld9+8JqrSsAkELRQfnumeprCXHL3CGBn5wFucH9nGH7XFWJpyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=scM3Z2O2; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="scM3Z2O2"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cebcb8d7so24093a12.0
        for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 11:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789495761; x=1790100561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Hj51GteF59goBzDtNkS3zM+9dfJzPzFWxN8DNMebXM=;
        b=scM3Z2O2+I5t6lppHsQECHEl9RjKgrH9z7HlCquozE88oI0yh34jK/afCU82jCjCEJ
         a7SXMwHQiJ0r0XgbEO19LziKW60FKhZ8hh1UHnoFWjG2AgmBRPCX0aeyCF57S1gWckXD
         Jl+AwpqYhv3kLPdcCuZUDpmZ0BA+dY7asJFYm4bZJkxbJT28wfjy6f13IUvA4dayoavZ
         YQgKhSyYlJFMu6H8VqC2bn1B1Xq09THPCYVBuVNEtY/4VIH4ZHxrwy2v4qKWD78hmjHH
         TtSPHux4XMK+ZrcgI4hZMn1Aqk22PUFN8AN9ZrUZOmeK/pfkroMLZXKGaK4MhD/JLoY0
         HRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789495761; x=1790100561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Hj51GteF59goBzDtNkS3zM+9dfJzPzFWxN8DNMebXM=;
        b=UT+gDYi83lhA3czkbzu+1OyL+S3kU8V2kIwOZdlGMlxOqoOpEBQ9kYPYfHjwrsdnHZ
         Zc6hN/xpcXBUOw6Ib/L69XTzjhJHYFIuszevHfUsdc4AHlrT+JkM4VBbS4Tc2trd1O5S
         unzlmg02UnscW9vslgE1qCQ+48AYBMznxxUeT71uub570Q6ZEcsKCICWsQv2r0N84NZ1
         LvU6RWJrQi+Wth08Mph9G3YwGL0mOqdK/4bwpieJxBRnn5OFiwemQrsiIvtyfRYObKnI
         gpXmTYpsCwC80ZENiwEBNTOdsFS4+ydccW0qnS+dZiZruv0W3jurCOshlQqnUfIZSm4q
         tgYA==
X-Gm-Message-State: AFuF++m92tudiEc8mhTXM2NkCbsG8QdJQmhl+653QMdHThM4yTKnnbQL
	hJpvmCUBKiEcan70sX5MqnUeCaFevUozt4FeaLaqAQWubnPkEmel4NZEIbCpjA==
X-Gm-Gg: AYBFou1KS1/jxp9//N3lNrdVgRJxPSbPPNz8rnJqrs6Lje7ljJJI0bnKH41RVejT9Ld
	+peSAvKdK9y/P3AjEvKenzW4Lkiq+lV8bwSYguixjVpuBZrasnERy3XLn1F983IvXhKepqsSKwS
	XtTWuapjcJv7AUqPL6RbgZINWb9mGuQFLxQ4TIWex3MdcuF+zHAJEKbVTn6zL+V/Tca/0X9i5HH
	L5Sy1cgNAC1P6Yn03Tm/dRsS98omtuYljFhAACMSihOblf1Hv44oPX36ctlheHzmshObjYGajBz
	40WilvAIFJSjmW1mpN8txaeV6MDmiJDp/t/wcYbj4xKsMJY7xX7IePJS1Y1wZ/cFoQO0aGxpkQH
	oUSLxx28/qgAVBFWsRMPZTWuM8PK6BX6Lu3kGJrll/zhHvsJ1TlaKCzaG34RtNaSCTab56rreS4
	alfyBlHraP2VLrTti/1xkcxkwwvJi9Ti86I1FCi6UE1pUM/l+QtXllIACor+yujJYnsCTcI22U4
	jFBWkXWom9iIUAg+YzpWwD1yLgk/hbMujLQDFoQFMIYxk2c6pkq91MuocHG1ZiQ+We7xJ5zI+HT
	7uj043l80Y3O6DNkJezQA9DqlyQjR/uejCD1jATqUcB9Jzzq
X-Received: by 2002:a17:90b:4c4a:b0:398:ba46:1d9f with SMTP id 98e67ed59e1d1-39dfe14719cmr5225790a91.13.1789495761133;
        Tue, 15 Sep 2026 11:09:21 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bba0696sm6688a91.7.2026.09.15.11.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 11:09:20 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: bestcomm: drop unneeded sram exports
Date: Tue, 15 Sep 2026 11:09:19 -0700
Message-ID: <20260915180919.8899-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bcom_sram_init(), bcom_sram_cleanup(), bcom_sram_alloc() and
bcom_sram_free() are only called from bestcomm.c, which is part of
the same bestcomm-core module as sram.c.  Remove the now-pointless
EXPORT_SYMBOL_GPL() statements; the functions stay non-static because
they cross compilation units within the module.  bcom_sram itself
remains exported for the inline helpers in sram.h.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/bestcomm/sram.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/dma/bestcomm/sram.c b/drivers/dma/bestcomm/sram.c
index 09ef5142c26c..d33e0f931682 100644
--- a/drivers/dma/bestcomm/sram.c
+++ b/drivers/dma/bestcomm/sram.c
@@ -119,7 +119,6 @@ int bcom_sram_init(struct device_node *sram_node, char *owner)
 
 	return rv;
 }
-EXPORT_SYMBOL_GPL(bcom_sram_init);
 
 void bcom_sram_cleanup(void)
 {
@@ -132,7 +131,6 @@ void bcom_sram_cleanup(void)
 		bcom_sram = NULL;
 	}
 }
-EXPORT_SYMBOL_GPL(bcom_sram_cleanup);
 
 void* bcom_sram_alloc(int size, int align, phys_addr_t *phys)
 {
@@ -148,7 +146,6 @@ void* bcom_sram_alloc(int size, int align, phys_addr_t *phys)
 	*phys = bcom_sram->base_phys + offset;
 	return bcom_sram->base_virt + offset;
 }
-EXPORT_SYMBOL_GPL(bcom_sram_alloc);
 
 void bcom_sram_free(void *ptr)
 {
@@ -163,4 +160,3 @@ void bcom_sram_free(void *ptr)
 	rh_free(bcom_sram->rh, offset);
 	spin_unlock(&bcom_sram->lock);
 }
-EXPORT_SYMBOL_GPL(bcom_sram_free);
-- 
2.55.0

