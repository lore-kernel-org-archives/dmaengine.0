Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A331F368D5E
	for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 07:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789457173; cv=none; b=nsKgaACq9WyhKtpqx5Gwa9VyIC+8RkKo2LXDZeStVzyzUDOgUAF+qIIIrik2v+xa+e3is723kcWFUyGm+zROsbQ4vGsni8a3LAQlUSlmFZfXNC6OurSw3NwZbgYHZDKKxmFG19EXQot44zEbPyBBMLruaOgwAgmrsCL5qJWiI4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789457173; c=relaxed/simple;
	bh=EITwAMi94+L/rAtKaV6SFtQcSSqz9GoIdJNwb5xLs7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XQ99iIRChhSN5KFmQPP/dv97FJTPyEOK+FFW7JvNCLqU97ROthySaP8BYKUIawX8abpsKsRYrcqWVN5m/fWGT0r0Dsl7JBzsJxPnhy3jDUBsQUw/OUt8zRtO3jki2MMGxgdk8NRMV9lbxk9YJSxU/2LulOQWrph1Sco6hOR51UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8V6xl6y; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8V6xl6y"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db18fe433fso19888775ad.2
        for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 00:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789457172; x=1790061972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c5/n9buj4EljOW9mw9PWRJPUglpJ6jbEEIafd9TEaCs=;
        b=H8V6xl6ydoQRNGb8BY7JJ/943mLRjLOdGfsMzo941VL76sKa1gVCELR7urQB48a/Ng
         KMNwBOJOj19fAn+/IzuIthPb7OSyxWqzb3HxIgYxS09CYieK9UyHGdWGkVrxZvUJkzr6
         NIVuPIf2u6rmoTH0NaX3Pyq4pGrd9Hb2sMijR4eCH9FGTppToYALY114OmwGlgktB0rA
         CjZLxblflPTlpW/4MxgYvtFcrvdWsi1R+MsDCRTxX92Clf6F27WV0jYWfVG8eSgiB6V3
         sQQcGYdxe3MGj1JfzurSEVaNZV0imaAxlhLijpFt5rLoGzGM8cRiyivvpOsVs5w6m14w
         cd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789457172; x=1790061972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c5/n9buj4EljOW9mw9PWRJPUglpJ6jbEEIafd9TEaCs=;
        b=qCL1S092tPgV8ZJhjAZIRwNRkYnfgRrHjlJJPbvbp+1SLaUDB4xnp5Oh1B05OABOqN
         FrXK7sh1HBqJLSmr1ph0RlaK8XlejxGG5fwfisXIB7tZDwAxlF1teO9RF+JHiBpwbjQ2
         bm0o6fOxLCz5fn7aO6HpzVOgHkbJUEfNLo41VaTbIDgzrCdu69T1hbotb4ZH1UNnnjtj
         vB8HCgIjjpFpU4zREQxr6gBTlm7/Nnh9Cc4GWeXCHvUg4n2Eg9YpqcbcJQNvYn0scjEK
         uqD98/bRPI9FOZaawQugfS4r3GrYm5dD9iOrWfpWjW3yh8ey/f0x+8jYZ+COaxiyvvCO
         /y0Q==
X-Gm-Message-State: AFuF++mmzRAct91lMCXAyBqc8BJfqTcIxr1EgnmCWQ4IO0Lr+b8/8FtM
	DFJKDnTOlF+l19fHdANaQp1IrtQcju0pXtTppF8e3ROJGKXO9B/G2HJ1n3q2ZA==
X-Gm-Gg: AYBFou1WPGGTcr1ios3MzZ62iicCJTVAWfptM0VjWXhbWKUuuE8lO9DnXTpkxBASyB2
	Vc3xs8ioS7tlJm3CMJoPx4oUH4cPN9SlJtJCkb0X0QvzPerPkLQrWu3npWaXnDxyuKKcopwLNnp
	Dhdk49mlG0uhaQWB+0R44zI68akJvnVSmCn9jERTZlq1mBqarhvi30iFhjIh04InOZmhtjL70iM
	MSX1UQGAQ4fpThDI+e5WVsKvLVuUCQAbAtAa6ChniCj7uTuQc9LW94khls980pemAbMvIY9cJ2w
	CzK45fclJYNO0g10gYZI7Gel38eT5xlKMpog4YHkAdpki7MU+SCz310EbP9+Rti7LOIB5R78AEQ
	TQ3Atax9BGKNGN1wp9XBWhSkaNV50M0NqyWi6wa3J9yWBn24XiFqUvPbKwuL5USMjD9+LweGvX+
	aSnec12TtoXnC53GC7miKsNQBtI5FBAe9YOpZK5/lwfT0TryCrSXwv/qOIHF/6r9KrkNZUZnRHi
	4z2XLAAagw8asK4L9FmouiIWOrykm5g12iWru/fA8grxgVKSRn42vSnswofRx8RYwdCnxyEIMSp
	ytfrBYVQily0avofMkFtcNlFSFsfLt83gwsb3x9K98qGtOiw
X-Received: by 2002:a17:903:32cb:b0:2db:39dc:48af with SMTP id d9443c01a7336-2dd6c757b6bmr116752735ad.17.1789457170179;
        Tue, 15 Sep 2026 00:26:10 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ccadb4fsm61248325ad.2.2026.09.15.00.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:26:09 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv4] dmaengine: bestcomm: gen_bd: fix out-of-bounds access in PSC parameter lookup
Date: Tue, 15 Sep 2026 00:26:08 -0700
Message-ID: <20260915072608.57887-1-rosenp@gmail.com>
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

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v4: actually bcom_psc_gen_bd_tx_init is still needed.
 v3: reduce bounds check to single function. It's not used anywhere anyway.
 v2: fix title
 drivers/dma/bestcomm/gen_bd.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/bestcomm/gen_bd.c b/drivers/dma/bestcomm/gen_bd.c
index 61b5746e1a97..7bbe9cd7b39c 100644
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
@@ -342,6 +342,9 @@ EXPORT_SYMBOL_GPL(bcom_psc_gen_bd_rx_init);
 struct bcom_task *
 bcom_psc_gen_bd_tx_init(unsigned psc_num, int queue_len, phys_addr_t fifo)
 {
+	if (psc_num >= ARRAY_SIZE(bcom_psc_params))
+		return NULL;
+
 	struct psc;
 	return bcom_gen_bd_tx_init(queue_len, fifo,
 				   bcom_psc_params[psc_num].tx_initiator,
-- 
2.55.0

