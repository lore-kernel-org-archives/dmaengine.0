Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EC7384CF0
	for <dmaengine@vger.kernel.org>; Sun, 13 Sep 2026 19:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789328888; cv=none; b=qrlXPDYcfSj4Y0WYnRa5uNCiAs/CfmGRcYZbd8ZDB130DFgCx1zMX+717N+Cr1p4HdmCnjR8QdKQVQCC+HJ6ma20Ir7OQy0wBxq/3w+zGCeQCJykq9Fcq/0lmHEpWVgrBiRztoT/pFk48SkIansLcuya6ysRkSR2lNIty+wGWGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789328888; c=relaxed/simple;
	bh=uHJDsq/wBjwWq41YLq/2UUe4aRKRnQW+SBgOa+O8/xU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=myeheZhKZIwaoPJRgPspTaes/LMTEiAkC2MgYqWR4iY7L2uuBOT+Pc6yQGK5QXl82cKuB3w9qr5u5rLCUmtcmfC/AE90reE9Kipzl+W+5CipSKGhycKFi6aUGFVprJMD8IX6qs8Prju4FM+SdwOjzPo9EkdU5FgfVCT4cqt5QsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1BtDy79; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1BtDy79"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-381b831d535so4962229a91.0
        for <dmaengine@vger.kernel.org>; Sun, 13 Sep 2026 12:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789328886; x=1789933686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8sFKNO7az1ksH2fsKhgDozSxLoIS44WxW5mHIfc4ieo=;
        b=V1BtDy79m4fRHgCAppGcsGyf3fGyIKGU7n70XcUA75u/CXagiM9sj1vEPdmDrFLa5X
         oi7bqQP5CJg7/7XB4NzZB/MSjeYJCgcH1sjnAAi0X6Sw6Wyr0i+p3sacgGhafmeUXtqh
         1JPEOm8OBOINU/bJTatQt1peAo7E3KgnHktRLvrDLljF/2F9p0L06fWT0mdrDev6CBRd
         jLIv7x6VSJKgpQqRxGXYIP3cZJTIrZuL5O3aNNORkydyGMMfM0j2yBrmbNB7GPweBCeB
         6X/02qQK6N5+3t7Is7Pse7nHb5pK8e+bKoiSGc6+ROgLBftqjGwi+9+2ckIxEjyIV9lt
         I6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789328886; x=1789933686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8sFKNO7az1ksH2fsKhgDozSxLoIS44WxW5mHIfc4ieo=;
        b=ptPPNoZEDKUn7Mvh5UE1wT7/TqXPVLgfbzHnuZxPP6M2uXn5GLLwJdbep6E98pH1Eb
         AjcisqKOcN8U5RosoPKAwddv6Sr5//ZTGOHM3XvHUCtrK2GL1dfcVy1sUD5GQfLs4tpR
         hmB5+/6twne104kV1LW4dH3OeboKGvwgRbaVQxpIPB4xFdbJIhFFM6UtYLXgaYM5QR8c
         P9alcb9JaWok8kFFuHGuE7kUEzk/YIZaN7aAInPufbyA3t9BHgli1jGwtvHXWI+Fk7Sj
         lvvlb6Od1fUZRn2REP53eBorKugxPi9JZnzMDIFQWMVE4mMoscU+FBndb3FTHjbCAtLf
         UUCg==
X-Gm-Message-State: AFuF++mOmGE9TRZzl7A1v5Elt8g6uLSOV1MplVm8baYxEYJlpZoyhhMr
	xpS3EslFhWaCMsBwJB2J9TNr9WA9eRqREYbimAN6WrmEQf9fgX2Tw3Xg2SBBZQ==
X-Gm-Gg: AYBFou2FJQjqOrtFLNpsMVfUPEnwBXVUl9E+/ruioFoVUQdECGr3CRq7ovoB1vPL+YV
	MG2lxitAsMm+K/NB+SEw2whoudW0DPuTNIw6H0iQlUU6ggaXE20fmOZ7u8LGRiL/xKw7tWU0hgq
	R2fO3GdBkdznQWQBBALsk78Av2o2lDE+zoBEEKpBgZiv566bm7McYaVXmVQ6Fd+Vcli11P6+WUR
	N40jwVHj1pRivAaEcp9xqJgDGdnqC5tLto8eCFQ/mz4bSZ9VdPw0cwVKWmj2iGGUYSut9hrUIr2
	v5CbIWsNKYO4MVNo/iMaSwQXbwzbfiWV40Tn8t+/lWfuvtpWNyidwZ8suOHmuJaJRhYBniipBhg
	amc0Bj4TrWx+Mh0jWYVkuelh23zOH4dTqrmtwQA872dNaXnEuVQWD9iuDys+2VywZeZ5SSKjkOC
	AQb6wgqL8b9HrdGwrgYF0WPw0vudF52m3kDYTXnzLtHnoTUncRocCkGk0cbUfyLzeDDZ1hCL0BZ
	6woZx6mZXNUvzzzFWL2R/JQgR4WEX/9TfFgu6u5jDCJh5JKTiVgmj9ZXBF/0jtmHpSH2XkZGViq
	fSy1Sy1sbWn4ir+Jb3FBrpu3u3+WRXpvQmCX7ViNCpJr1VWD
X-Received: by 2002:a17:90b:390d:b0:39b:370e:c807 with SMTP id 98e67ed59e1d1-39d9c1fcb7cmr24523582a91.17.1789328886230;
        Sun, 13 Sep 2026 12:48:06 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39db996bde4sm10689651a91.7.2026.09.13.12.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 12:48:05 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:FREESCALE SOC DRIVERS)
Subject: [PATCHv2] dmaengine: bestcomm: make gen_bd init helpers static
Date: Sun, 13 Sep 2026 12:48:04 -0700
Message-ID: <20260913194804.39939-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bcom_gen_bd_rx_init() and bcom_gen_bd_tx_init() are only called from
the PSC wrapper functions in gen_bd.c, so make them static, drop
their now-unneeded exports, and remove the corresponding header
declarations.

These had use before commit 7d3ee229ea51
("powerpc: Drop MPC5200 LocalPlus bus FIFO driver")

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: mention driver removal that made them unused.
 drivers/dma/bestcomm/gen_bd.c       | 6 ++----
 include/linux/fsl/bestcomm/gen_bd.h | 8 --------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/bestcomm/gen_bd.c b/drivers/dma/bestcomm/gen_bd.c
index 61b5746e1a97..b5093f7445cb 100644
--- a/drivers/dma/bestcomm/gen_bd.c
+++ b/drivers/dma/bestcomm/gen_bd.c
@@ -81,7 +81,7 @@ struct bcom_gen_bd_priv {
 /* Task support code                                                        */
 /* ======================================================================== */
 
-struct bcom_task *
+static struct bcom_task *
 bcom_gen_bd_rx_init(int queue_len, phys_addr_t fifo,
 			int initiator, int ipr, int maxbufsize)
 {
@@ -108,7 +108,6 @@ bcom_gen_bd_rx_init(int queue_len, phys_addr_t fifo,
 
 	return tsk;
 }
-EXPORT_SYMBOL_GPL(bcom_gen_bd_rx_init);
 
 int
 bcom_gen_bd_rx_reset(struct bcom_task *tsk)
@@ -166,7 +165,7 @@ bcom_gen_bd_rx_release(struct bcom_task *tsk)
 EXPORT_SYMBOL_GPL(bcom_gen_bd_rx_release);
 
 
-extern struct bcom_task *
+static struct bcom_task *
 bcom_gen_bd_tx_init(int queue_len, phys_addr_t fifo,
 			int initiator, int ipr)
 {
@@ -192,7 +191,6 @@ bcom_gen_bd_tx_init(int queue_len, phys_addr_t fifo,
 
 	return tsk;
 }
-EXPORT_SYMBOL_GPL(bcom_gen_bd_tx_init);
 
 int
 bcom_gen_bd_tx_reset(struct bcom_task *tsk)
diff --git a/include/linux/fsl/bestcomm/gen_bd.h b/include/linux/fsl/bestcomm/gen_bd.h
index aeb312a1cd00..7253d308d77a 100644
--- a/include/linux/fsl/bestcomm/gen_bd.h
+++ b/include/linux/fsl/bestcomm/gen_bd.h
@@ -16,10 +16,6 @@ struct bcom_gen_bd {
 };
 
 
-extern struct bcom_task *
-bcom_gen_bd_rx_init(int queue_len, phys_addr_t fifo,
-			int initiator, int ipr, int maxbufsize);
-
 extern int
 bcom_gen_bd_rx_reset(struct bcom_task *tsk);
 
@@ -27,10 +23,6 @@ extern void
 bcom_gen_bd_rx_release(struct bcom_task *tsk);
 
 
-extern struct bcom_task *
-bcom_gen_bd_tx_init(int queue_len, phys_addr_t fifo,
-			int initiator, int ipr);
-
 extern int
 bcom_gen_bd_tx_reset(struct bcom_task *tsk);
 
-- 
2.55.0

