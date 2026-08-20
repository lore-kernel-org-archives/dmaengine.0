Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A0C248896
	for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 03:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787195818; cv=none; b=QA/c96j0Y3yJSdpZL+d4dgRjYRmtj4W2Roz2hFv3cUighjl62XjX0R2lSISCd2z7/a+DTrf1p2hM8wH1q2QiGH+IWZlS4vDt1AnfxZ4rdcMLCicbRppdrVhexCv0zSvgnCAATVLOQdwyNGSh4ZwXUG+m4MtQwDxZ8OksMd0/r6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787195818; c=relaxed/simple;
	bh=pjCz7HHh6XbVA6D8sqtcBOTJ7pG6hrBkEgJ82H0Rfhk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EFKlVtDFohxi9qcIy40Zo0xc95/qvpznVogacz5U72p56IkNnIHu9cENYbqbuLZFTAjf3h6E5gN95Y+1phP022BxNFTG6ys3OWWLRz+EWmeqvyFnRT+nhQrr2T8wQPFoC16ZlbEW3fYlaMbMDahAeYijnApCFHVztXe4QF5XLnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZGS5UF6; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZGS5UF6"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso20081515ad.1
        for <dmaengine@vger.kernel.org>; Wed, 19 Aug 2026 20:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787195816; x=1787800616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lUGyoUQMT++FV9NxhdPbZqYYCYX7x6pMitnI1ewBzQ8=;
        b=gZGS5UF60gZJLWwvv5amVtOG85h+6h94qy9nbKNyzSO14ju3SQ8C2EKHN/e3yBWxu3
         tyVdNu92rUHbN0E/EgL8aRwYSGoauOuXPzNwMNyeCwW+P00lceO34fE/asRzH6YLwrzr
         ZfYXx7poXbCalfRDej+yKou8rumfaQ0HFk9znThVnGjxJVd/7EATUPQ32vE3l4i4XF8K
         TXAfSKs+7vQrUuVrIL5pDXkdQ9pBAfqIAr/Ykg1YLeGMDp97mibX38+LlbRpHB2BuplI
         ObaObOjsRVqVcmHkdvSRQnmvATjkbnXs0DuvHuGzK6mNS1vrITbxQx7xNKRj2bdrJnAN
         k+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787195816; x=1787800616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lUGyoUQMT++FV9NxhdPbZqYYCYX7x6pMitnI1ewBzQ8=;
        b=Ug0kAd7fCGDXCWI2Uoa0wVV4x+h9WWFwwvc9aD+ApVp00WgiTkzcrz43FUGldnWmAb
         XHBU8R0/H8Q3IRf81tnNzvXWaX5mMn3ZzKVS0+W4Io4OObThwNqKJ0fffBhrNh5orrno
         gBhwRFKGXLfGc85878IynmCEEzGavI9Se4GK5OLiXOx5PTwPbnpoHwfBgPMJ1QpA5BDw
         lmP0dteTkzvJlIwq6z2UpTIf/1QFl2F3vKueHQdeXZxs6bpekkqFBHtt+cJNzMEoGOrE
         69yVb8lssAh+rOYr2J6hoFhp7ptT1d1VL7u2sFadeKLZYLs9Ii+1cUZayib48MKaHpkK
         wAqQ==
X-Gm-Message-State: AFuF++nO1r4e9ALkXOkT5Xf8HyeXjYBWbMLRvrj1J4miwQ4NyFKKlxc4
	CXxecUw5cVwsMRCjiUlKzcU8J95/ol1GjuxwNGq/jLef+SyZDGhiVgQCU8runA==
X-Gm-Gg: AR+sD11SpJcyAB4OU7jnQv22jS1XdxAvJJPpg1n9D/1W0X5aAJb4TS294xQK42VEIY2
	GEotYmxwZllEoO6so6ucNv3LZqLCRdL0IVkGo0gDyz+sRgIyuzEB6wxgp+tGpsRGhrQMc0dxPry
	qesztkYMm9gXJh750yu16Plo8F8QXsrjO4n+s/QFGyKw6jdbEqgb0wDZyYoXXejoAz1Zu3v2vQr
	c1de53TCUPAeXytWSPRlfEltHMksOzoQVyJtm80tEUjOBukRW5emg2mE+WNlJEX7TAByFUxrLP5
	k5ddNt3Qila0/griN9geRqQjs4unEMWpolHDTWwnb8S3V8GPABN8WaJdO9mjVCc2Od8DQIpQmEQ
	WM6DmI2RTNCi/2V+/xYsjWKkUzrkwN82HDkn0v4JM/xtzBfZ/2ek148oHkvYQIM+6Ovh5FoV3E8
	DbsLpuK9bCv7ZpV81Ewtsx1AJZVnhn7H1u+vygRq9sgQZ6FpwSsD3btzOiEmMwHAWpOJjzYOYt+
	I8A4E0XBi8aLk+CnMsVM3g8ootPq4Y+oUA68BqkAllfahRxBAuYaO+88gTzKJiWDVmHiDShHV5j
	K8627iq9s9c0a179ijkGUTOEaIPL1voM1O01bg==
X-Received: by 2002:a17:902:ef43:b0:2d5:e9d5:8ae with SMTP id d9443c01a7336-2d5fd62ae4fmr183115805ad.5.1787195815996;
        Wed, 19 Aug 2026 20:16:55 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d5ae494sm1332405ad.34.2026.08.19.20.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 20:16:55 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Harninder Rai <harninder.rai@freescale.com>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: fsl_raid: zero CF descriptor pool allocations
Date: Wed, 19 Aug 2026 20:16:54 -0700
Message-ID: <20260820031654.28450-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The compound frame descriptors and embedded CDBs are allocated from the
cf_desc_pool with dma_pool_alloc(), which does not zero the memory. Only
cdb32, the gfm coefficients and the frame address/length fields are
programmed; the dpi_dest_spec/dpi_src_spec fields in the CDBs and the
rbro32 field of each frame are left uninitialized. The hardware reads
the whole block (frame 0 length is sizeof(struct fsl_re_xor_cdb) or
sizeof(struct fsl_re_pq_cdb)), so uninitialized heap contents are
exposed to the device on each new descriptor.

Use dma_pool_zalloc() in both fsl_re_chan_alloc_desc() and
fsl_re_alloc_chan_resources() so the descriptor and CDB memory is
zeroed before it is handed to the RAID engine.

Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine device.")
Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsl_raid.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 2d86f61105e5..1c316d85cfec 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -295,8 +295,8 @@ static struct fsl_re_desc *fsl_re_chan_alloc_desc(struct fsl_re_chan *re_chan,
 		if (!desc)
 			return NULL;
 
-		cf = dma_pool_alloc(re_chan->re_dev->cf_desc_pool, GFP_NOWAIT,
-				    &paddr);
+		cf = dma_pool_zalloc(re_chan->re_dev->cf_desc_pool, GFP_NOWAIT,
+				     &paddr);
 		if (!cf) {
 			kfree(desc);
 			return NULL;
@@ -584,8 +584,8 @@ static int fsl_re_alloc_chan_resources(struct dma_chan *chan)
 		if (!desc)
 			break;
 
-		cf = dma_pool_alloc(re_chan->re_dev->cf_desc_pool, GFP_KERNEL,
-				    &paddr);
+		cf = dma_pool_zalloc(re_chan->re_dev->cf_desc_pool, GFP_KERNEL,
+				     &paddr);
 		if (!cf) {
 			kfree(desc);
 			break;
-- 
2.55.0

