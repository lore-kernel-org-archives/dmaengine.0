Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5905F26F2B9;
	Mon, 27 Jul 2026 08:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785140803; cv=none; b=lip4tV+8FJycIeOs8b3/7vSHIwnwEnTPSGHPqpT3wYH5p8zmlULp74Gs/vwBmC/VV7C85b2DrJ8IwliPVCiQc4rQ9gp4Hq4i7490yIOeNyBsEpqMv0rcwUgS9aZnJXRretpoJDDHvvfJvdnQp7MB/zwG32KsGMTC+BHtlq+DTgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785140803; c=relaxed/simple;
	bh=+oSqKlFKVKGmLb1zJK2OH5TMFrqKaNXk0B6a6IpQ02A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cl6XrLn1VD5vF78ZHyH8zIvZIphPav8pfE1LL9c8V5yQUMOKZJ5ZcEub523uzgF1ccQTOsIYxfHNZ46xg56ym4ot+BtZcphmybeZskYV/9PJicv2UEklPy55/OP3HogJz6Qxbgkg3VjGxNTbCtLcLdV02ZiykaZ2D7Vr7+jpiXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=WGxhiK0M; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="WGxhiK0M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785140792;
	bh=YYXkTcKV3/eTCF09YjQkyMu51mTKVZop32wWW/f5xtk=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=WGxhiK0MOT9YqejgIvcXVtTQwWtLE6Yx+axjN+opIFz+QW3IV02REV1O0AKAWEYxu
	 BOk5WUxRgRgjUHGdb/JFVbr0XomH9PIl/Yk183YLK8TyoXZVscoPBB23zq/BdAqcLi
	 U9xVfVO8eO2nfgQ/fSSYsXZxr7++q3QxwjVC4H8Y=
X-QQ-mid: zesmtpgz6t1785140786t7bebbc01
X-QQ-Originating-IP: xYW3LPiWNtEz4e/dmDCCluOcc7KY6gzIGz8Oy6QMEWk=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Jul 2026 16:26:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11789586640069058678
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 27 Jul 2026 01:26:15 -0700
Subject: [PATCH v2] dmaengine: mmp_pdma: fix wrong extended DRCMR base for
 SpacemiT K3
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-k3-pdma-fix-drcmr-base-v2-1-afba55cba1f3@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0K6dghToARX3sOwKGWQUQukBYIh3
 N2CB3D5kvff34Qnx+TFNdqEo4U9D30AeYmE6XT/IOAmsJCJVInCHF4pjI3V0PIKjTPWQa09QSp
 VnqqiSDJZiDAeHQXjDN+rH/u5fpKZjtphdOynwX3O5wUP7+/JgoBAhLpFmWFZtrc39/Ma+1Ebs
 jzFZrCi2vf9CzMZlsPXAAAA
X-Change-ID: 20260615-k3-pdma-fix-drcmr-base-326536770427
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Yixun Lan <dlan@kernel.org>, Guodong Xu <guodong@riscstar.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3475;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=+oSqKlFKVKGmLb1zJK2OH5TMFrqKaNXk0B6a6IpQ02A=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnpYnpB2xlbj/5IeZXdkndG5vTl3SIGCX3Xwx48TJpcs
 lNs78ndHaUsDGJcDLJiiizdD3i2FfhE2RYIFPrCzGFlAhnCwMUpABO54Mzwz6bIzv5e03mFxou+
 5/k+BOwP6nRuvFR3+gFP1Wb+vwp9CxkZrisnHTrAtXv+7ffmnw7E1z6YuOHI9n9zvl3Z3xVhpWL
 6hB8A
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Of2cEohDBRJBLX9i7Ma60UghAsqdBBxFuiBgglamvZxfThXDCuzB+gkv
	AiaxALPL85ly+m2uTKcDGnY8gMO7F6Db+rWwoQ6Rg6NLvTsxV5wmR0FKIiGKZtNqZxjblcT
	y0QN9NG9cdvayraarpZele0xl3yNNaPHfjEj38g6eAK5t9mGSXtqgvkyzMwY6YdmYqTL+yp
	1SDNiWJwhDyK9NJ0VT1Kn+MDj8aPEUa+Bz+ZnaY2aY5OUQiyV8fHowlpzx7lbqmnQQH4V2h
	qUtWVrqOZ5dpjkNYejWtm4u+IOODTH58U3TL003CbE+/7F2iFa6xft1u/zmFxrdDU1RIExo
	iL8FFKhMBQS6fP6w5VDd63y5WOY3fmm2kCQc78jCqg/n9ZoDPyVc62IDBVNI3JyTNVfrGHj
	xNH9mWzPP4sXD9pBdLY88uXQL+jKq9bcySICquCVd2gjP0ZPw4yHs1ckl5eLeUkNLogcj0I
	PjPfzCU/Ue2XcOGS14u7IVpn5wcJHbShfH/v/J1sG39tKLUXRI5RMS5CPzLxXJLP/Ms4WKD
	9yFLYesSj/NOrQiD6cVtMYTsKJYNcwXook2rhXaGWjiTiOvRlRB93tXUJc+4/8jQsb0oLqp
	nxw0JGPd6PUcB6pno0SJbzRQltsBCxmN8AD/zU7fBMgbuZ0bRW/2cof4hU9LUAytKQxeyKp
	dNvhSRNVR1aF1/248Y1TuueDfoUJTPSh9uwIwTVEBeZvv3ndFmh12aD1SZ8VlfkiRAy2COG
	GHIc4DU8gDmUPtGNWMX1KUnrDJOO6l685/NmzJqSRXyQ9hZkv5/cwu0S8m6GdBucuOB/RzA
	AlmdGamhLBDffPI6HwnpUhL47K5F7Lco44zsGphpUTq8Dkz8FB4ghC0aQVkx7lGfqj0dkv/
	TqXrpkN75FF+jhAEWxUnuM0DnvtPX2/XXNV4FIVYlzkg9pOCaM7KNEXQIBK+Tkx6V+BxhNe
	a6hycUAbxvEwIaAZrTLuyGVhHKV+lPuZcTIEuG3iQprznPIPSUjqzq0hql7wvFjcnV2u0o+
	DL6yH2dZIHhB6bhQrUCOMvyGl+c4lu7L4C1iSlEzj4nSVz8DQF0GMKOhY7OvUpG2kG+3l6j
	dWnart+HG/4yzjlN1z7Jy8=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

The extended DRCMR window on SpacemiT K3 starts at 0x1100. Commit
6587b8661a0b ("dmaengine: mmp_pdma: add SpacemiT K3 support") incorrectly
set it to 0x1000, causing DRCMR accesses for request IDs >= 64 to target
offsets 0x100 too low.

The 0x1100 base has been verified on K3 silicon using real SPI and QSPI
DMA transactions. The K3 DMA documentation [1] was updated on June 24,
2026, to reflect the corrected register addresses.

Drop the bogus DRCMR_EXT_BASE_K3 macro and reuse
DRCMR_EXT_BASE_DEFAULT for the K3 ops.

Fixes: 6587b8661a0b ("dmaengine: mmp_pdma: add SpacemiT K3 support")
Link: https://www.spacemit.com/community/document/info?nodepath=hardware/key_stone/k3/k3_docs/k3_usermanual/16_peripherals/dma.md&lang=en [1]
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
This is a minimal fix for the wrong DRCMR_EXT_BASE_K3 value introduced
by commit 6587b8661a0b ("dmaengine: mmp_pdma: add SpacemiT K3 support").
K3 silicon uses 0x1100 as the extended DRCMR base, so the K3 ops now
reuse DRCMR_EXT_BASE_DEFAULT.

I deliberately kept the per-ops drcmr_ext_base field and the
DRCMR_EXT_BASE_DEFAULT macro to preserve the extensibility that was
introduced together with the helper refactor, in case a future PDMA
variant ends up using a different extended base. If reviewers prefer
to drop this abstraction entirely and collapse it back to a single
constant now that all known users share the same value, I am happy to
send a v3 that removes the drcmr_ext_base ops field as a cleanup.
---
Changes in v2:
- Reword the commit message to remove the inaccurate K1 comparison.
- Mention successful SPI and QSPI DMA tests on K3 silicon in the commit
  message.
- Add a link to the corrected K3 DMA documentation, updated June 24,
  2026.
- Link to v1: https://patch.msgid.link/20260615-k3-pdma-fix-drcmr-base-v1-1-ee1af124199f@linux.spacemit.com

To: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Yixun Lan <dlan@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: spacemit@lists.linux.dev
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

