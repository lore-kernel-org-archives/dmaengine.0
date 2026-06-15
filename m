Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9901339B1;
	Mon, 15 Jun 2026 02:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781492084; cv=none; b=ntAxW2Shrijgk52WFeLhz+0MsclPu+k9rl9KRsmXZYDSMY+u9dzxadSXm7kFgh0JBi4f2EnwGQoBrvm4eD4T6jClAEi31+9nl+ruptkiWic5wFQ8ZDRo3Glm7x2glzD74lkAwwWIve3XSQdIhk+r5E2lqJWa/oxw3HOqWgE6sOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781492084; c=relaxed/simple;
	bh=uRoYSn+03n3qs6PdBupNOOH2WL9aOy5kZqVsqXkmenQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=X6lp9ugmugkE8rT+UJAfn5ETTttDYuaQvYzAWcCxOPeEv7GYC6mcza8+oZ4LnNGB/g3LxZQbe+98xYI6IiMVo+J+ly9dnaw0mogr8HQqSQKE8OjywgJklqezbDm7WQVVyBDTf53kQZ17APdj2anv8XyacV2Z+MIJf5/srAYVIWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=F3Tt9xhh; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="F3Tt9xhh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1781492017;
	bh=9cdgRcyegQxc+GL9OIvqHFBLz+b62Df+DVzvz8Yb1XQ=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=F3Tt9xhh6xwijem4auZV+8lwkF/A1hOeCuFU9njowsApzczwp/yGZiCbXetDFgrV6
	 JbgfCSOhxU/G/YQ0FJY7Gcq7EevHBUjNqG5YmuZRSpGWXQyYz4Yg/AEyq/pcfFpUKe
	 0U65IszWVU+oXlQkF1IVl3dI+iv1DWIqcE4dyW4g=
X-QQ-mid: esmtpgz13t1781492009td124dd22
X-QQ-Originating-IP: sIOKzMB04rbDdG57pAc6E7eAYC2N0k7ypTl2bL5sMnk=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 15 Jun 2026 10:53:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 970519476431799130
EX-QQ-RecipientCnt: 9
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 15 Jun 2026 10:53:25 +0800
Subject: [PATCH] dmaengine: mmp_pdma: fix wrong extended DRCMR base for
 SpacemiT K3
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-k3-pdma-fix-drcmr-base-v1-1-ee1af124199f@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrDsQk5pAr1K6iMm0HUUrMyqCe
 HfTdvnBe/8OSsKkcKt2EFpZ+TMW1JcK0juOL0LOxWCN9cbXDfYOpzxEfPKGWdIg2EYldNY3zod
 grjZAOU9CZfEL3x9/69J2lOZvDY7jBPT3f1V6AAAA
X-Change-ID: 20260615-k3-pdma-fix-drcmr-base-326536770427
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Yixun Lan <dlan@kernel.org>, Guodong Xu <guodong@riscstar.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781492007; l=2337;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=uRoYSn+03n3qs6PdBupNOOH2WL9aOy5kZqVsqXkmenQ=;
 b=ux9M+5feWTDQomVUCVzKjSoFiHXzhLBoATaX+eIavhiJsHTBs1lfzTwR+TmZ5vf4H9BEkkKtj
 hD/W0feCtqtCMA4F+dVPHPWyZAm49u7X4SJxiIxDSktW+T+fgpPyRsJ
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NR3PJyWXADsZWGvmJ/fAsL/uDbMsCRFrmSwjvVqGUmClnk5DmbMU5tBu
	ykVyK1n085TPp8HCHvzTT4zIbfUX015g0/5wk3VCPGm9wrSiBihs5CQG4DiKxjzfwqGoIO+
	utimX5PR6oKp9j8EHN7pOCrXvunriq8wWYLwVTr3vKHq/kZM/q1yocphcJ24WcrOaiI9jd1
	iMkNyK9xfPlLSusf+0EJ0bvKw8WScQ2373ippOAe5Qxum5DEK6BQJES1SDb5d5tP3rxqazD
	kzqulePwY7f1Wcd1g1oO1o8ifryGbsIAXFuzj8BkOxQ12LVDI2TnudMx5ppb9U11aKzteRA
	ZQ0yYV1G0HYTCRtxT97J69aQo4syKqBwd7uM0kEyGxUcXLCSgIL1rPR8vx/4P3rno12QqBM
	Ngx381FgHAyznX5QmAmxsR7h7j1fw0fMZdsLoWo6+vNhMiDMU3UkncoTULstaCyPRaTsjau
	KAveYVa8lfSRYyUImri6SoMFnnmb3BApLBwWsFRFBXnwKkyi2gaCCGys8xdV5/8lTVuGvNQ
	4nd9RHxdFH+lCqX3olkSKeojOZxWWJukPElybi3H63njUhXpC/QQL7s/JdOOxGJD2hZOxSK
	pQb+dK/XEdVIn4HSjX6C4Fth/giSpKwxKkc7IFWt6OTUHCBKZkLi52eLMliQzOzopXUcCLL
	aHgiTU98rl33aO9SA93gMX01LPRf+CaGPdwWC9CcWZ+AODWFS9GcYIudZy2/TRmAmLNfkPj
	NkFCeezh21RRr/RQM9pc6QJK/OwlLlziElaENlh1UbazZnzTSCBUfVEuFqo9X3+dCr8Ws4p
	bo7BKWHyJNFkgJnrm6dss4HoLIUyhl9tpgVhHEB/agl1SA76cGuShVKNAdLqfXRIzsjih76
	bgh0O5VmQXvQWCafRijsr/wSJi7IcY8zdjd8saR7cHN4EYzQDl0dZq+FMQ5+7ifZQ8yFdEF
	njgEnhODey/ykibLN7Y5CYCgnOrJX6MlKUBvdrsu9MqoDc7iR1sEdhppupoNZYHuekqH7Qt
	eLbyrigxk/tHuafUu9PhSp+2uh4B7bWlTQVxs6U+XlOz9ApNQueRlcOGuVhFfS8NLj3ZuoS
	bhLhGMioQQ5KDXknMUPeN0NPoXc8lmzKOaK4zy4jfQpP4rhBJco0Tk4Z6B2Yja5Ng==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

K3 PDMA shares the same DRCMR layout as K1, where the extended DRCMR
base address is 0x1100. Commit 6587b8661a0b ("dmaengine: mmp_pdma: add
SpacemiT K3 support") incorrectly defined DRCMR_EXT_BASE_K3 as 0x1000,
causing all DRCMR accesses for channels >= 64 to be off by 0x100.

Drop the bogus DRCMR_EXT_BASE_K3 macro and reuse DRCMR_EXT_BASE_DEFAULT
for the K3 ops.

Fixes: 6587b8661a0b ("dmaengine: mmp_pdma: add SpacemiT K3 support")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
This is a minimal fix for the wrong DRCMR_EXT_BASE_K3 value introduced
by commit 6587b8661a0b ("dmaengine: mmp_pdma: add SpacemiT K3 support").
K3 PDMA shares the same extended DRCMR base (0x1100) as K1, so the K3
ops now reuses DRCMR_EXT_BASE_DEFAULT.

I deliberately kept the per-ops drcmr_ext_base field and the
DRCMR_EXT_BASE_DEFAULT macro to preserve the extensibility that was
introduced together with the helper refactor, in case a future PDMA
variant ends up using a different extended base. If reviewers prefer
to drop this abstraction entirely and collapse it back to a single
constant now that all known users share the same value, I am happy to
send a v2 that removes the drcmr_ext_base ops field as a cleanup.
---
 drivers/dma/mmp_pdma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index 386e85cd4882..78e3e07e681d 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -52,7 +52,6 @@
 #define DCSR_EORINTR	BIT(9)	/* The end of Receive */
 
 #define DRCMR_BASE		0x0100
-#define DRCMR_EXT_BASE_K3	0x1000
 #define DRCMR_EXT_BASE_DEFAULT	0x1100
 #define DRCMR_REQ_LIMIT		64
 #define DRCMR_MAPVLD	BIT(7)	/* Map Valid (read / write) */
@@ -1219,7 +1218,7 @@ static const struct mmp_pdma_ops spacemit_k3_pdma_ops = {
 	.get_desc_dst_addr = get_desc_dst_addr_64,
 	.run_bits = (DCSR_RUN | DCSR_LPAEEN | DCSR_EORIRQEN | DCSR_EORSTOPEN),
 	.dma_width = 64,
-	.drcmr_ext_base = DRCMR_EXT_BASE_K3,
+	.drcmr_ext_base = DRCMR_EXT_BASE_DEFAULT,
 };
 
 static const struct of_device_id mmp_pdma_dt_ids[] = {

---
base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
change-id: 20260615-k3-pdma-fix-drcmr-base-326536770427

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>

