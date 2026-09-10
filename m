Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F602D24B7
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 19:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789068250; cv=none; b=ixtIqwQOC4+16shb+4Ir3i1ZGflPIoklCAannA4GcVyNF0czH/aDa0vM/NVygdZlMboYd42jCDoQ9VAxF5r3f7OF3D23zLCcqdlK2UuWyHCh8d3X28oTAwZbTUW6JNAQUhiS/2SLQPPWln70vcrEjAHG9PIMYL7yPLR+ugBh2XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789068250; c=relaxed/simple;
	bh=NKnL5odugO4qcrAUyB13tJgKWhjXHbP7quDDpqCNhpU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wyz8GM4dufMUcFI+POQOB+MNVElNXBn1hMERBOfmcbth7OSbpsKANYuJ87Gy9nHUzfc8FwSNjW4G+bjnYUfTKEyWV3FolXR1gNUkq9PuBUsSwDtKSewVljyxFkMsH3BdieCOdFVe+/Nd2XM81WblPMHTUb3FjfNEuttNoThyjpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5zV6qaA; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5zV6qaA"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so82569a91.0
        for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 12:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789068247; x=1789673047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=779dm4C3RwFsXw/+tKlzCJPVlT5xPHDbVbgx5Aw9FdE=;
        b=j5zV6qaAG+Zn3aMt2ks5P0iE3hrmmqoCyRS5PELRsK0xij+pmKjaRButvIKSucZQAK
         qBALGFhRwGgQFlyuIePDKUgBa++eHp1qtyZ3a5Rv9JtHDGbQxNcOXCEc9CCgauBQIX7Z
         n1QBD3PK9xw1+uh6jstXof+VjGCj5YodC5Ja8QNJ9Mkt2t+kg4BQb7F+Njurxcb2JfoY
         7VGnF08gEJqp1DtaCcghJjOLz4fXhtbBRC5+0K0VbVMT2gtOe0xbq0jyK6kUbt9XahCb
         t0wtOXPtCovnsChHemVg5XzJg6vVCOJmNUQgz2EDMlu3rC8H1TUFiO9etVkqdUsBsG8P
         h8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789068247; x=1789673047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=779dm4C3RwFsXw/+tKlzCJPVlT5xPHDbVbgx5Aw9FdE=;
        b=n/QvLIPFxYQxxbBZAP8pssmfWAXfK9+c2NSGWA6BSaMNuYtR2QZ8ekZ7y/Zy6kM/WF
         s7qqVkStkOepoyuEPJZKdvFkbF2Q5uGHUDgNGKPWqtFHSoi+gXPEk0QYT7khWe5JL2oZ
         KLGKyI2JHaSKEeClzGSR4IWqo6qUaWP9GOhr91fERhm12akWJb0I0GCmOsSbbHCfjU+C
         iie8Kcf14bSzOvSO9Ob2IVwEvMOnyq5ELbDQdojR6jhouydOpVD/1OxEOyfkjRmdF/7U
         syYDPPiWZXa5hxfHzKa1Df3AZAqunDFKQkSmBpRweCUEQADplM9BFfnzi/Pmlrm24qDx
         PXxg==
X-Gm-Message-State: AFuF++lIIgADyOu1I/ShOKQkKCZglDeR7rbbEtc31bth/xkydXPT+7dj
	dQXV4PBbyKvVZrmJhaw43uQ6xEEoO+Zr6QyOshjZ7IM/xOHoRYKVNOzNuh2AFQ==
X-Gm-Gg: AYBFou2eufWHZGVO8ONoGClnsrPl8FHnMzBLEvbEYpWs+TmHB6ryKH8gnhh2DJ1CHBw
	B4SUqEwJFOWQMVxpA44GmQmD86KNpig7jIAQ9lV83gPLGcJVYZxJHPwIBlKLDydMIF5P0xc7RzW
	MBz5PKhIiidKEbg2rzyzAm/kqNLvsIkobqhH/MVTB8//182eiuE4VnAgj/1hrsqiFPNJt/h2/ZR
	T6FFAFdpWHPrLdooOlHabyUyEBZ1dcCpRxC4uqVQ7qE2YpjLz06P2cH3mKoQRha4oUj206gyACb
	9I0W01xOm8Yj0CKfiV6zGsOUPxcN1sXg5aqlhH9QrHkhZXSQDFYRaJyVHBMi1p4DNxm0MCT0SoP
	9cOZyfgVylxc5epwAjjy35zyqSygI+uqzfltAXrpUrPbPs9sJWFSL5Bbq+VHZK/uPqKL60d+zAv
	3Wm4v1LzzvG4LhWg+8jGlEKyjjfejldmooqP9r6kBb516T7s3396reku9X4Q4+G7rCHJSaYd+c8
	xqBw0gO/a7ADn/jJD6rihmYIJRW+2D6ECTWdXGA0it4msygsbj4Nh9SujgkWYGjtOjPLr4c5Efl
	ll0gAC0J3fGMpwuu03V2ecyoONSAUuzCS8jmL9JyiIdG56iy
X-Received: by 2002:a17:90b:1d45:b0:39d:6f12:fd47 with SMTP id 98e67ed59e1d1-39d9c215be0mr324523a91.20.1789068246597;
        Thu, 10 Sep 2026 12:24:06 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d994d8af1sm615637a91.11.2026.09.10.12.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 12:24:06 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: bestcomm: gen_bd: fix out-of-bounds access in PSC parameter lookup
Date: Thu, 10 Sep 2026 12:24:04 -0700
Message-ID: <20260910192404.21809-1-rosenp@gmail.com>
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
and read past the array. The tx init function had no bounds check at
all.

A malformed device tree with a large cell-index could therefore trigger
an out-of-bounds read. The garbage initiator and ipr values would then
be used for MMIO writes via out_8(&bcom_eng->regs->ipr[...], ...),
potentially causing out-of-bounds MMIO accesses.

Fix both functions to use ARRAY_SIZE(bcom_psc_params) for the bounds
check.

Also remove a stray unused 'struct psc;' forward declaration in
bcom_psc_gen_bd_tx_init.

Assisted-by: Opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: fix title
 drivers/dma/bestcomm/gen_bd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/bestcomm/gen_bd.c b/drivers/dma/bestcomm/gen_bd.c
index 61b5746e1a97..00dfdc4b8eba 100644
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
@@ -342,7 +342,9 @@ EXPORT_SYMBOL_GPL(bcom_psc_gen_bd_rx_init);
 struct bcom_task *
 bcom_psc_gen_bd_tx_init(unsigned psc_num, int queue_len, phys_addr_t fifo)
 {
-	struct psc;
+	if (psc_num >= ARRAY_SIZE(bcom_psc_params))
+		return NULL;
+
 	return bcom_gen_bd_tx_init(queue_len, fifo,
 				   bcom_psc_params[psc_num].tx_initiator,
 				   bcom_psc_params[psc_num].tx_ipr);
-- 
2.55.0

