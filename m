Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B5F440627
	for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 00:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787185701; cv=none; b=F8GbzCzJZXB/NaTvVZDsSVvV9m6Yjl+9kfM2FmvgykSGPbBG0UAMiObpnVQKZOP0pA7+8UAxpvvyo4TfkW3xU3e20UsKaJD7fPMz0/fGfFDRbHwlbCEMX4tJiYaKoYHehIvyDtn+ESz+H67LugemUW9OYYZuQVsKcpRNBaqb254=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787185701; c=relaxed/simple;
	bh=aXImnRNEanOSby5D4g43kkq+kAhJKHJFuqgpGn5ZCKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PGur4dHC2nom2wCcA0uB5R9SrtYp9008ZIYIJ9WmMz3CwtIwRRM3EGfmGrL0aacWFJIY6y9hqRODtgneircw8rhWAN+fb9g6FhPLeQqbIOdFkZUgsYL/VbsiTijImNF6vRlGXtKXMz1IUWOeLAfuBcw7j1g2YDOPFJtms0Rv7pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=loQsxCrX; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="loQsxCrX"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so324407a91.0
        for <dmaengine@vger.kernel.org>; Wed, 19 Aug 2026 17:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787185699; x=1787790499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5HQYWAXtdCk2LUoPEcjMMCWw2jIYXO72SQJOQcNPqA=;
        b=loQsxCrXMZal/jFDupa1MDlekM9FYgNU1AAAaw67yiHIA5nPZB1ez4GYhi3/tHLxCM
         lDg3DCX9nyCg3QdcSM4o/Kp+euq7B7auQZC/pIYs5Uv6NERrCX5ZZGHiRpAHcUDSD2Ld
         6NWmmYOxhMqdp4RxvSUuOpE7ddS6gt+VyUdWbUWV0edclL3DPqbpDQley5j01MtoWxyF
         nvhnT0w9z3qDfhXP25hLjsie37MzEJ0CjNZu7Wdch1nKD2igWUYFFo4r5NKZy8fWwPd7
         X4EvEBZha2rdYHaPcmk9FaQ18KAdMku5Zs9FRvz/LclClab7O3UOeRvEJv7VfTyHH8fy
         S+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787185699; x=1787790499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5HQYWAXtdCk2LUoPEcjMMCWw2jIYXO72SQJOQcNPqA=;
        b=IHG2KfLP2mab/cMs3h61yVWtmXAqQ+LVdz6wmrNN+ck9k7+1OKPgpDtf120y7JIKaD
         iPnol5i72oIOsH2p1v2pPHsGxHjAcdEXaQLS13J/Dot3YpuBaKBTrEG09j8S3ptMTW/Z
         Bra0sN4INAPGOwAW8Jh9lOAfS3SE2c24b7oFUUiYO1afQMUyVfLYjGLGyVteCnY10paw
         NxEX3ozrz/Tt34+wQJ2gyQH8ONsog1HKCVWdTx4Oy9ivRkiqkk4vnPUhi4/aV38mbbOi
         /cqO9OkV3nrB01/X4OmdhtJvEfjvM6Hkjtivb+EMXTqrC69Pg4hxb6X7xfCQxRZwnss0
         vYYA==
X-Gm-Message-State: AFuF++k4NttxuQPqM/tvDS9wmD4alsU+/Gx0FuHdDdEYbE4jdcXHFD/d
	+LCRBIonEOFJOF8LfJ05rzpW8ir3ZkkzIYfYWecf5I9ZIrnkFN7bwRYCNsBoww==
X-Gm-Gg: AR+sD10wDxsTo5MicQ5FxJs8qCFJHv91EUs2g6LWy8vHnvNOs+9PcDKj7AFReU/i1o0
	sQNhA3hVKQa/lrF0bBm8d2nJaak8+qqpPNsCny3dDXer7NCyTJ9F4jDaugA6pU9F0s53x+IvVWa
	XaaMvLHPqIZwcfaEZ6rvM2YHo0IRhoUKAcTPTsvRueCbNL5Ot6khcLIDGDGFg3JLbMwg6nZG0Cq
	BfDRbA6KH10M1VRfRpTXYbUpM7Mz/H/F9z38LnOE1/8br7S5ZAO33Ku6agk42q05YPWbE0BDtDS
	0rHOpfwAhaIyzK/OYzsdLSzodgTNcusQHnrkG/7OV3k/NAvJq6Zc5zWG8SxiwBFK/T+vbi/fFOP
	GnxA/PohjMhDsufKlhu51xMjPpAbURece15O5r1YBFQb8JYMV0yE5MRsUCw675fgjV3c95+ZCjV
	Dy6cMaMxtMew9VD9PtgzHUBqnRdYs/r9Fi5yR5HBRkyTgS61Wpn0ygOcPlI3YXmEmH6pnGRqDS9
	1rR71j0e/atDIVdoOngPzRUZhzydFTVeRHk+OyYAm9uC9jKWUbbX7Sr55L4lqBq6zPVcbz0q853
	loYhwOzVt8pOoc+Yfx4sqO6slczxMwQFbbLKpw==
X-Received: by 2002:a17:90b:2584:b0:38f:de94:bf34 with SMTP id 98e67ed59e1d1-395a074aab8mr2845125a91.10.1787185698797;
        Wed, 19 Aug 2026 17:28:18 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb14bbfsm4352913a91.1.2026.08.19.17.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 17:28:18 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: fsl_raid: fix sparse warnings
Date: Wed, 19 Aug 2026 17:28:16 -0700
Message-ID: <20260820002816.17382-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The register maps in fsl_raid.h annotate every field as __be32, but
they are accessed only through ioread32be()/iowrite32be(), which
already perform the byte swap and take plain u32 __iomem pointers.
The __be32 annotation therefore makes sparse reject each access:

  drivers/dma/fsl_raid.c:116:17: sparse: incorrect type in argument 1
      (different base types) ... got restricted __be32 [noderef] __iomem *

Drop __be32 from struct fsl_re_ctrl and struct fsl_re_chan_cfg; the
descriptor/CDB structures written via cpu_to_be32() keep their
annotations.

Also fix the remaining sparse warnings in fsl_raid.c:

  - compare the desc pointer with !desc instead of desc <= 0 in the
    three prep functions,
  - byte swap cdb32 with cpu_to_be32() when programming the XOR, PQ
    and MOVE command descriptor blocks; the plain u32 assignment is
    broken on little-endian hosts.

No warnings remain.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608200637.ro1CqMxi-lkp@intel.com/
Fixes: 68b7fbc23529 ("dma: fsl_raid: keep MMIO bases as void __iomem and cast at access")
Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsl_raid.c | 12 +++++-----
 drivers/dma/fsl_raid.h | 54 +++++++++++++++++++++---------------------
 2 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index a35ddc1297ce..524a7329c3c4 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -350,7 +350,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_genq(
 	}
 
 	desc = fsl_re_chan_alloc_desc(re_chan, flags);
-	if (desc <= 0)
+	if (!desc)
 		return NULL;
 
 	if (scf && (flags & DMA_PREP_CONTINUE)) {
@@ -365,7 +365,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_genq(
 	cdb |= FSL_RE_INTR_ON_ERROR << FSL_RE_CDB_ERROR_SHIFT;
 	cdb |= FSL_RE_DATA_DEP << FSL_RE_CDB_DEPEND_SHIFT;
 	xor = desc->cdb_addr;
-	xor->cdb32 = cdb;
+	xor->cdb32 = cpu_to_be32(cdb);
 
 	if (scf) {
 		/* compute q = src0*coef0^src1*coef1^..., * is GF(8) mult */
@@ -474,7 +474,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_pq(
 		src_cnt += 3;
 
 	desc = fsl_re_chan_alloc_desc(re_chan, flags);
-	if (desc <= 0)
+	if (!desc)
 		return NULL;
 
 	/* Filling GenQQ CDB */
@@ -485,7 +485,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_pq(
 	cdb |= FSL_RE_DATA_DEP << FSL_RE_CDB_DEPEND_SHIFT;
 
 	pq = desc->cdb_addr;
-	pq->cdb32 = cdb;
+	pq->cdb32 = cpu_to_be32(cdb);
 
 	p = pq->gfm_q1;
 	/* Init gfm_q1[] */
@@ -558,7 +558,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_memcpy(
 	}
 
 	desc = fsl_re_chan_alloc_desc(re_chan, flags);
-	if (desc <= 0)
+	if (!desc)
 		return NULL;
 
 	/* Filling move CDB */
@@ -568,7 +568,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_memcpy(
 	cdb |= FSL_RE_DATA_DEP << FSL_RE_CDB_DEPEND_SHIFT;
 
 	move = desc->cdb_addr;
-	move->cdb32 = cdb;
+	move->cdb32 = cpu_to_be32(cdb);
 
 	/* Filling frame 0 of CFD with move CDB */
 	cf = desc->cf_addr;
diff --git a/drivers/dma/fsl_raid.h b/drivers/dma/fsl_raid.h
index 748047996bbc..1b6f6b82c7d3 100644
--- a/drivers/dma/fsl_raid.h
+++ b/drivers/dma/fsl_raid.h
@@ -109,59 +109,59 @@
 
 struct fsl_re_ctrl {
 	/* General Configuration Registers */
-	__be32 global_config;	/* Global Configuration Register */
+	u32 global_config;	/* Global Configuration Register */
 	u8     rsvd1[4];
-	__be32 galois_field_config; /* Galois Field Configuration Register */
+	u32 galois_field_config; /* Galois Field Configuration Register */
 	u8     rsvd2[4];
-	__be32 jq_wrr_config;   /* WRR Configuration register */
+	u32 jq_wrr_config;	/* WRR Configuration register */
 	u8     rsvd3[4];
-	__be32 crc_config;	/* CRC Configuration register */
+	u32 crc_config;		/* CRC Configuration register */
 	u8     rsvd4[228];
-	__be32 system_reset;	/* System Reset Register */
+	u32 system_reset;	/* System Reset Register */
 	u8     rsvd5[252];
-	__be32 global_status;	/* Global Status Register */
+	u32 global_status;	/* Global Status Register */
 	u8     rsvd6[832];
-	__be32 re_liodn_base;	/* LIODN Base Register */
+	u32 re_liodn_base;	/* LIODN Base Register */
 	u8     rsvd7[1712];
-	__be32 re_version_id;	/* Version ID register of RE */
-	__be32 re_version_id_2; /* Version ID 2 register of RE */
+	u32 re_version_id;	/* Version ID register of RE */
+	u32 re_version_id_2;	/* Version ID 2 register of RE */
 	u8     rsvd8[512];
-	__be32 host_config;	/* Host I/F Configuration Register */
+	u32 host_config;	/* Host I/F Configuration Register */
 };
 
 struct fsl_re_chan_cfg {
 	/* Registers for JR interface */
-	__be32 jr_config_0;	/* Job Queue Configuration 0 Register */
-	__be32 jr_config_1;	/* Job Queue Configuration 1 Register */
-	__be32 jr_interrupt_status; /* Job Queue Interrupt Status Register */
+	u32 jr_config_0;	/* Job Queue Configuration 0 Register */
+	u32 jr_config_1;	/* Job Queue Configuration 1 Register */
+	u32 jr_interrupt_status; /* Job Queue Interrupt Status Register */
 	u8     rsvd1[4];
-	__be32 jr_command;	/* Job Queue Command Register */
+	u32 jr_command;		/* Job Queue Command Register */
 	u8     rsvd2[4];
-	__be32 jr_status;	/* Job Queue Status Register */
+	u32 jr_status;		/* Job Queue Status Register */
 	u8     rsvd3[228];
 
 	/* Input Ring */
-	__be32 inbring_base_h;	/* Inbound Ring Base Address Register - High */
-	__be32 inbring_base_l;	/* Inbound Ring Base Address Register - Low */
-	__be32 inbring_size;	/* Inbound Ring Size Register */
+	u32 inbring_base_h;	/* Inbound Ring Base Address Register - High */
+	u32 inbring_base_l;	/* Inbound Ring Base Address Register - Low */
+	u32 inbring_size;	/* Inbound Ring Size Register */
 	u8     rsvd4[4];
-	__be32 inbring_slot_avail; /* Inbound Ring Slot Available Register */
+	u32 inbring_slot_avail; /* Inbound Ring Slot Available Register */
 	u8     rsvd5[4];
-	__be32 inbring_add_job;	/* Inbound Ring Add Job Register */
+	u32 inbring_add_job;	/* Inbound Ring Add Job Register */
 	u8     rsvd6[4];
-	__be32 inbring_cnsmr_indx; /* Inbound Ring Consumer Index Register */
+	u32 inbring_cnsmr_indx; /* Inbound Ring Consumer Index Register */
 	u8     rsvd7[220];
 
 	/* Output Ring */
-	__be32 oubring_base_h;	/* Outbound Ring Base Address Register - High */
-	__be32 oubring_base_l;	/* Outbound Ring Base Address Register - Low */
-	__be32 oubring_size;	/* Outbound Ring Size Register */
+	u32 oubring_base_h;	/* Outbound Ring Base Address Register - High */
+	u32 oubring_base_l;	/* Outbound Ring Base Address Register - Low */
+	u32 oubring_size;	/* Outbound Ring Size Register */
 	u8     rsvd8[4];
-	__be32 oubring_job_rmvd; /* Outbound Ring Job Removed Register */
+	u32 oubring_job_rmvd;	/* Outbound Ring Job Removed Register */
 	u8     rsvd9[4];
-	__be32 oubring_slot_full; /* Outbound Ring Slot Full Register */
+	u32 oubring_slot_full;	/* Outbound Ring Slot Full Register */
 	u8     rsvd10[4];
-	__be32 oubring_prdcr_indx; /* Outbound Ring Producer Index */
+	u32 oubring_prdcr_indx;	/* Outbound Ring Producer Index */
 };
 
 /*
-- 
2.55.0

