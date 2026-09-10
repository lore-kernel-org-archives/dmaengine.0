Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B0D583ABE
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 19:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789069588; cv=none; b=dYr7rZxABYe7Uf6wxgqjo6Fx3bduLfqwyAEjnp5gBbft8qGpmTizUR4Yzf4N2yanH82KRSpIQsebC1GA2JWPMIoP/gUKjHQ82+KRwv7+x2VCsfKb2O4TjyEH7emBWpW5a0JtGVC0j6X1wipxCy69k2Dwi1lLfhvFQh5sXJN76m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789069588; c=relaxed/simple;
	bh=nzNtocB+3tL6bfmY7+uDsAetxYXocuFeoxUiOCBkU4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s4Iit7a4NaqChogRdb+oj83/unrXvdXiqCKhV7vTA2DEe1IR44M4XUHnL5W5EJuaA9d2RDEMqorQaMHs+zQEYYWYN0D66sZxIQ7+6ya8bDcuXdJS/DO0AakIke+EFvYFWujJ/erTSyk+xltW6mLa1th55lr11byFRnhqgsamO4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fmWZeeiK; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fmWZeeiK"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-53091987029so2218071cf.3
        for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 12:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789069583; x=1789674383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vg8Qli77O1R5GWc9/5RodbMpVM7POzgBfYCRgn9i5to=;
        b=fmWZeeiK6gBB5VHRY1CcoWpI/k0jjhzkP1nOdUwS7r5TjK0LS0MZPDfDaXZOUZS66/
         VNAGOrxCk66QADY8V773//1LCPY7PHv5mKt6S00UNDMCoZawC3uAXPVI1y+biDX/VF+F
         /wO8ricrvsvCpI/O7x5XtwCXOpS5nWzZsDUpPYBaYikXg4gOqDNxAxzMypOCTajCZ4gV
         SPpYe2zWpq/dztSUVbwCNXvbbqj/ejlgngrSwpvRfxynIExeEmku35ApbMNcAaud8DKp
         1aU1NCuxuxtK00a7kqcOEcYD6NIFBaeMvp0DI4J02p16Dqb2Y3jWnL6C2BXGC3Actve2
         4ViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789069583; x=1789674383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vg8Qli77O1R5GWc9/5RodbMpVM7POzgBfYCRgn9i5to=;
        b=dCWgYK34ksgOAOQGkwwup2b92MIvlpPSaxNl+EGWxpsRCEw+C/wFOmZUt3fQnmY1kO
         PCeM6WWMJSBMjk1sLHMYiKHzbVZUmLrHfPPCRBb7QOr0lIig5+YzwXpWP/eHc20Vc/jH
         U/QXDPS6vnVr5/iTyIjCShSKeCDO1SrLjkOHDlPVhcvWi9B6mBhpq4D3IMV17t9Kbir5
         CAeAQeExkJ7Q2VliUt6Azx393Vwk9wINVn2oL+acoE2Xarh7My47LCgqe8qUee9L8wXH
         ZoWfREETDMxxBIpS6gHVYjYJk75cVi9Eth2P+PaaGvw+rpN3xARZJib9GkQMpsW+DUXP
         aK0g==
X-Gm-Message-State: AFuF++mX8CZFDbb2mDsydGbdzEx0fKjuMcyH/325I01oDu0hJ/CrY0lc
	iGy572CXqo4wUhKZdOaVAvK0BJDP3BaocIZJE2We9Thh1eOP4GyRJe+vV7S9SQ==
X-Gm-Gg: AYBFou3j3+06TOYzmkSmz5jtKW5owUtpM0KLz+9HJdY6m5buPKBQxbVrUsRaKvZ56kU
	3jVwou811OaVhqrM8zhc+ZDg7fh2nIiMCyk28fsYqrnb9bNMpL6kaRuMyqQ7ela1smreNn0NhLV
	ka6iPEzvyHFsIPkBfTzTHRmA4fp/rMc9x7pURTNPnmyR7wcxXeHc4cxBFDqs8EcXwmpbMrXk/Oh
	Hi86HQ50EzJLb+8iprGfZ8bkA32C4K5M8GrRi1KKt/xQ1qocLnDtHCxoVy9KdMoTJcqMEJIktjx
	Zn78UszSi7YA5/er/zUuGTGx+u1uu4hLuX2zd6TWFgoO33HWhk/7bWySWjsdzLshuTLYMAkNHqV
	tBpand4RxFPphemz5FTy5wP8701sEPWQmqcTkv5jmweAAysbrCK4SgxdKlvQyEqld1Tee8CxmR9
	6VjDc2YVSIk7PzLO8o4qv303QkkpzbMjiVL5XBEKZMrOSeoy3SPkjeI5Pgr4nYAwJkHfEG+dBBd
	45Inv3LvYXnYFx/TsypeMwsLFFFSJybFivOK+izgGNXde1opVV5wmavljVj8jrSjPy9NaHTTUYT
	Rzdbc1/42Ph5NRxuPvQGrqOryQynnuPq8f6HASjErv6DY3CI
X-Received: by 2002:a05:622a:1389:b0:530:b2e4:d5a2 with SMTP id d75a77b69052e-530c87a548amr14474691cf.61.1789069578795;
        Thu, 10 Sep 2026 12:46:18 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca50cd05sm1174131cf.29.2026.09.10.12.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 12:46:18 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: fsl_raid: switch __b32 to u32
Date: Thu, 10 Sep 2026 12:46:16 -0700
Message-ID: <20260910194616.34760-1-rosenp@gmail.com>
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

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608200637.ro1CqMxi-lkp@intel.com/
Fixes: 68b7fbc23529 ("dma: fsl_raid: keep MMIO bases as void __iomem and cast at access")
Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 v2: split patch up.
 drivers/dma/fsl_raid.h | 54 +++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/dma/fsl_raid.h b/drivers/dma/fsl_raid.h
index adbfede330a7..6fde5192ab77 100644
--- a/drivers/dma/fsl_raid.h
+++ b/drivers/dma/fsl_raid.h
@@ -110,59 +110,59 @@
 
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

