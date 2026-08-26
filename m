Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80B12773EC
	for <dmaengine@vger.kernel.org>; Wed, 26 Aug 2026 01:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787707829; cv=none; b=EuO5uz7ksgoM6njtmAuZFFBzApwZdFyeGJKPVOFAz0iPu1vgNfjmfkhRXB5GjEIr++yMUi/e7CVYl5R08wBccUQHkN3CDCznM9/D4XpIYFlAS+XqlERtuOtzwelsq4gG9WLToRrNjUIM7A7m9gXmVxZttN+aBC17ld9lOwsRgik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787707829; c=relaxed/simple;
	bh=myemN6DX3lABoRKkmvbT35GB34tCZcAmQ8zO26JtQqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oI1NejcdGk1Rn5eeiRZ3myWgIcO5OxEf5P4x+tbnoga4/tNID3s56r2rNOQdJPkKn6ivveSpkqySvBBaxEhZUrCRsF1oerSFhgFa3oRn1mF9Yd1igA9BoCVVQM91P7T3hn9YyHSckgGst7y8zxyyYEirHzbTBaE/9ydk/E0xY8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bA8v7SP2; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bA8v7SP2"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93703cc9e2dso19236285a.3
        for <dmaengine@vger.kernel.org>; Tue, 25 Aug 2026 18:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787707826; x=1788312626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8xxhXLXwBvZGQ89s3NtLyGdJ91KtYqy6L+FbcUge9s=;
        b=bA8v7SP2+61+ruME1WHhx39wOqrp/0ewLphGYJFjn8GH1y3mRYQiNFf63t+HDaEfRS
         hY4K/r+qnwJaYYAOnEJv0Lr89PNu6j7Ny6pJ/gckTdEpabnJr2+8eZCcz+p84VY57FhU
         TW9yKHHU2//puOVNFisv9bkTmaKIj9PxY4TlPRRCMr6jcbK3OBLygXgXTNah6c9N9Lcz
         8aKds/KCyK3//FuMvD6JI+6yHAB0txyJnqNrXsBzf5teXJUHMPqZkTb+YtdesdF9UzTi
         isKB+rfBFJeVCB2lSCJHPPGY/JOSR5tIKiq87aOkBtzLGkIBmMMMi5Gpj7yp1q027Rgn
         jiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787707826; x=1788312626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r8xxhXLXwBvZGQ89s3NtLyGdJ91KtYqy6L+FbcUge9s=;
        b=j13ZrGFkxxPwwPbC9pyoq3Uu6Qgb9q6FYkRCz7uJuTP4aFCpt/zuHyg+jhjLcGmuyX
         5ZUrPraGzHLP0pzg78QMVZ2Y/COTmqeBV5GeX286kj0rwW/ESeSMmZp4Q1tIsa44wy7C
         ediA+Bn6Xp1TSJnNkNuGMuB3fPtY43zY7qJWiBkcBxFPrhzGn2Is2azqSaZB+FDA8xXd
         FxibAwe8Uiv2ACiUFzvN0ltdG/vWoXTfJQ2Csa+DMpPnYl4eN35Bttj30+gHHGeLnqP9
         HBbp2eGTKpQmR+VgOgJLUaE+YuKF1Tc4ECVY6UoPBL5rmA+zNi/zlouvOCB+OW03cuXD
         aqlg==
X-Forwarded-Encrypted: i=1; AHgh+RoqnkkzUJ/zv5vrhHVuBEsxX/HU0bFzPyUjDCIRxKWRMgwVK3pxVChUBDQxSxJ+kvu4IY2XQwa2BQU=@vger.kernel.org
X-Gm-Message-State: AFuF++kjRQ0wzLPEf/bNODJv6Re88200RJDNIk9yvNUb1Jxw52OpEVZ2
	ddQKOllpbI+ZlZR42TLh9816UbyX7SBWn+umKkBTQcygowiIVYPb4kWZ
X-Gm-Gg: AR+sD11uXTT1wsbzwWbZlNk6voZND+NAMOkModvO+5ciJdKKo3a80LiqnIgzal/c5Rh
	w9ONWIIHii2i/GzpuvsQqEfoUyzFE/jFwKpfyfmw7bx1Lh30QE4hrC0n3adBs50k84rDoV2tUwY
	apyBQAytmZ7zFNJo//hXuwfktYQVlHr2OMRZgtkd6NhzdsW8WXK2ott+KC0/QejNZDCCgAsW43G
	8NWnBR+k4rpY2eBHddGJU54m1P7LlsT8vbHT656nyB5k9KJVhIIENc90zqvYV7v2sBtDXBLedJh
	MS9jBO7hFvmDsh/emSuznC4Xi+tL+LdIJWy13e+FSVs+i/GYWx+nFSeVaw6BY+hJeWE6D+8e+bY
	tmdBWMiFz7cLNyj7xdqSbwI1JIFm+eosDm9vVUDWpyYUm+3xVz0C545TeRptieTEOUHbnKNeZPk
	GxGX7BQ3A6fShv495H1GlV1/tOD6Too+GJPUPvHhPUnJlJ/5johW4ZSjDbjQPlMw==
X-Received: by 2002:a05:620a:72c1:10b0:936:e71a:db90 with SMTP id af79cd13be357-937803e0e3dmr234920985a.29.1787707825690;
        Tue, 25 Aug 2026 18:30:25 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e67c52csm102398585a.38.2026.08.25.18.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:30:25 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Wed, 26 Aug 2026 01:30:04 +0000
Subject: [PATCH v4 2/5] dmaengine: sun6i-dma: Support variable address
 widths using masks
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-sun60i-a733-dma-v4-2-dc2f745f40dc@gmail.com>
References: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
In-Reply-To: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

The Allwinner A733 DMA controller supports higher addresses (up to
32G) compared to previous generations. The existing `sun6i_dma_set_addr`
function uses hardcoded logic for setting the high-address bits in the
LLI parameters.

Add `src_high_addr_mask` and `dst_high_addr_mask` to `struct
sun6i_dma_config` to handle different high-address bitfield mappings.
Update `sun6i_dma_set_addr` to use these masks via `field_prep()`,
allowing the driver to support variable address widths.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/dma/sun6i-dma.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index f305fbfb3545..53c54161e32a 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -24,6 +24,10 @@
 
 #include "virt-dma.h"
 
+/* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
+#define field_get(_mask, _reg)	(((_reg) & (_mask)) >> (ffs(_mask) - 1))
+#define field_prep(_mask, _val)	(((_val) << (ffs(_mask) - 1)) & (_mask))
+
 /*
  * Common registers
  */
@@ -103,8 +107,8 @@
  * The LLI link physical address is also mangled, but we avoid dealing
  * with that by allocating LLIs from the DMA32 zone.
  */
-#define SRC_HIGH_ADDR(x)		(((x) & 0x3U) << 16)
-#define DST_HIGH_ADDR(x)		(((x) & 0x3U) << 18)
+#define SRC_HIGH_ADDR_MASK	GENMASK(17, 16)
+#define DST_HIGH_ADDR_MASK	GENMASK(19, 18)
 
 /*
  * Various hardware related defines
@@ -147,7 +151,8 @@ struct sun6i_dma_config {
 	u32 dst_burst_lengths;
 	u32 src_addr_widths;
 	u32 dst_addr_widths;
-	bool has_high_addr;
+	u32 src_high_addr_mask;
+	u32 dst_high_addr_mask;
 	bool has_mbus_clk;
 	u32 irq_stride;
 	u32 irq_en_offset;
@@ -687,9 +692,10 @@ static inline void sun6i_dma_set_addr(struct sun6i_dma_dev *sdev,
 	v_lli->src = lower_32_bits(src);
 	v_lli->dst = lower_32_bits(dst);
 
-	if (sdev->cfg->has_high_addr)
-		v_lli->para |= SRC_HIGH_ADDR(upper_32_bits(src)) |
-			       DST_HIGH_ADDR(upper_32_bits(dst));
+	if (sdev->cfg->src_high_addr_mask)
+		v_lli->para |=
+			field_prep(sdev->cfg->src_high_addr_mask, upper_32_bits(src)) |
+			field_prep(sdev->cfg->dst_high_addr_mask, upper_32_bits(dst));
 }
 
 static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_memcpy(
@@ -1283,7 +1289,8 @@ static struct sun6i_dma_config sun50i_a100_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
-	.has_high_addr = true,
+	.src_high_addr_mask = SRC_HIGH_ADDR_MASK,
+	.dst_high_addr_mask = DST_HIGH_ADDR_MASK,
 	.has_mbus_clk = true,
 	SUN6I_DMA_IRQ_A31_COMMON_CFG
 };

-- 
2.55.0

