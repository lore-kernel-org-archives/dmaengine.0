Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226F73B0583;
	Fri,  9 Oct 2026 22:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791586739; cv=none; b=qNmK8iPaZAocnT4Y5I3cuC9IpKfsTF0cyEtek+JQv9/JUzGimM+MQtpxu4rfToJxUNIetC3yP5EM41Y0KTC5B1NjIwU9/Qz1NDzP6LiAAX7wLQUKAwdq2HU9eZ8owzh+3ntcUwAqG1btMVzgV51VEd5/hK/6yq7PWFNKm/bI24k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791586739; c=relaxed/simple;
	bh=Qza7pzR6xsoQldkBLVUc2d2cLvcibryUVA8ZUAz8jg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YyVy55eCghHuTBXAXX1pe5Hw/OBdJ/MNYCk2sLgpiX2MkUwUV8JIxRk4xe7N/rDVh8SH+MIjIQEvwqDssAhuyP14PAwchg9wJdJqneRsRRRGVMDdQRwMTgnooJr/se/iLeSXFpUTR8FvhxZ9gEQEoknpL7g8+Ffyl+9asLmDDC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PfkIGjAX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PfkIGjAX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381541F000FF;
	Fri,  9 Oct 2026 22:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791586737;
	bh=u5J7o2GYkUO/dFQUqbI5ARsZScfQnssHo0UuBiZGwkE=;
	h=From:Date:Subject:To:Cc;
	b=PfkIGjAXO/DTj9eXqxy9aMrYVHkohKxKGu89T4bc6MXRKx4sFpx8nRnQ01m3cjGWX
	 MhxvTrHiF7xUt+G8HuVPM1Uik46ipBhM9absMdzh6PG8fseqcLO1Rnh8mHTD0lnrSH
	 TDLqxdz4AQg7espYlAP0PJqjtnSPjIpjpmzghZKHPW63XZb4gFEi6U8Nc9EuwvIdpA
	 Xu+B9jE634nk8gVLFVil2KFTG92wPRS/WN0Gxp1TRerkKqyGyARJOZ4gfvzC1Optn/
	 XNzJsur77uo/xNzwgWf0KEXGqRnlgbBoE0CqDQilFDuJ6brkwnLIFIa+zmXcSIlmCh
	 PIaEbiXn+2oIQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 10 Oct 2026 00:58:53 +0200
Subject: [PATCH] dmaengine: ste_dma40: Preserve the LCPA I/O address space
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-dma40-smatch-fix-v1-1-26ca10043957@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MMQqAMAwAvyKZDaShOvgVcShtqhlapRURxL9bH
 O/g7oEqRaXC1D1Q5NKqe25g+g785vIqqKExMPFoyBCG5CxhTe70G0a90XL0QmOwkQdo2VGk6X8
 5L+/7Abs+G6diAAAA
X-Change-ID: 20261010-dma40-smatch-fix-42fce06d4f25
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The LCPA area is mapped with devm_ioremap(), but lcpa_base and the
per-channel lcpa pointer lack __iomem annotations. This loses the I/O
address space and makes sparse warn when d40_current_addr() assigns
LCPA register addresses to its __iomem pointers.

Annotate both pointers and the LCPA argument of d40_log_lli_lcpa_write()
to preserve the I/O address space from the mapping to the register
accessors. This also fixes the existing LCPA read and write warnings
without changing the generated code.

Fixes: c80edceff29e ("dmaengine: ste_dma40: Fix cyclic transfer residue")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610090216.pjMRxhRL-lkp@intel.com/
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c    | 4 ++--
 drivers/dma/ste_dma40_ll.c | 8 ++++----
 drivers/dma/ste_dma40_ll.h | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index d3cc2c512ccf..74dd4cbdc3c0 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -509,7 +509,7 @@ struct d40_chan {
 	u32				 src_def_cfg;
 	u32				 dst_def_cfg;
 	struct d40_def_lcsp		 log_def;
-	struct d40_log_lli_full		*lcpa;
+	struct d40_log_lli_full __iomem	*lcpa;
 	/* Runtime reconfiguration */
 	dma_addr_t			runtime_addr;
 	enum dma_transfer_direction	runtime_direction;
@@ -617,7 +617,7 @@ struct d40_base {
 	/* Physical half channels */
 	struct d40_phy_res		 *phy_res;
 	struct d40_lcla_pool		  lcla_pool;
-	void				 *lcpa_base;
+	void __iomem			 *lcpa_base;
 	dma_addr_t			  phy_lcpa;
 	resource_size_t			  lcpa_size;
 	struct kmem_cache		 *desc_slab;
diff --git a/drivers/dma/ste_dma40_ll.c b/drivers/dma/ste_dma40_ll.c
index 4c489b126cb2..3be7f5b1abb0 100644
--- a/drivers/dma/ste_dma40_ll.c
+++ b/drivers/dma/ste_dma40_ll.c
@@ -333,10 +333,10 @@ static void d40_log_lli_link(struct d40_log_lli *lli_dst,
 		(dlos << D40_MEM_LCSP1_SLOS_POS);
 }
 
-void d40_log_lli_lcpa_write(struct d40_log_lli_full *lcpa,
-			   struct d40_log_lli *lli_dst,
-			   struct d40_log_lli *lli_src,
-			   int next, unsigned int flags)
+void d40_log_lli_lcpa_write(struct d40_log_lli_full __iomem *lcpa,
+			    struct d40_log_lli *lli_dst,
+			    struct d40_log_lli *lli_src,
+			    int next, unsigned int flags)
 {
 	d40_log_lli_link(lli_dst, lli_src, next, flags);
 
diff --git a/drivers/dma/ste_dma40_ll.h b/drivers/dma/ste_dma40_ll.h
index 55090cb31057..ca9d07649361 100644
--- a/drivers/dma/ste_dma40_ll.h
+++ b/drivers/dma/ste_dma40_ll.h
@@ -455,7 +455,7 @@ int d40_log_sg_to_lli(struct scatterlist *sg,
 		      u32 lcsp13, /* src or dst*/
 		      u32 data_width1, u32 data_width2);
 
-void d40_log_lli_lcpa_write(struct d40_log_lli_full *lcpa,
+void d40_log_lli_lcpa_write(struct d40_log_lli_full __iomem *lcpa,
 			    struct d40_log_lli *lli_dst,
 			    struct d40_log_lli *lli_src,
 			    int next, unsigned int flags);

---
base-commit: 511afae96d89847f753fcab6b3a597f0281be9d5
change-id: 20261010-dma40-smatch-fix-42fce06d4f25

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

