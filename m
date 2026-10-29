Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271582;
	b=joVi93IhUV9HGAsDV9qt2dCYCyHhrEnwUX5hF8ghS/p8uckoMtfEncCJunZdK3Qmvh7Z
	 ACzzatfc/Ndg/QZhdTuxWjRBgbjZ4mho7nlnLl989W8oLBkPTsx2AyjaEQffxXgPsH65Q
	 AonAQAz5mQlZc6YUmHmo0p3Xdf90EHGAwfUd6eWCLu/teJvdm2juhIqYmMBDegtsbZLxh
	 Od5x/dr9vVNH6MHfnEIYJlO7+ktjlTWacgjeSDTt+m6b5kbD5DI6AjBcAz01u1jBBtLu/
	 LCnj2WTriJCjeZjj5pk1AkZfSNgNs3TgPip+BuunkII0Xf/8XSElLWbow0Fv3+MEcAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=21Pr25KW8iRWF16tMS8FhZNBj9jILGnkXcKJJd4L4vg=;
	b=RVsPz6FlGSddOzzTWWR9i8D3uziKVXxYXhDmIJ8xx2uBxyFtDH6ivndtVnDuZsaUJ57I
	 gLQlkbqBFyOx+sDA/ecRZdFKwsyV7Mq1fUo+Jy6NnA3ogY7Pa43/XY2iomJ98RXD8i547
	 yGkDEKcpWM1W6RZ73oj8XwUcmhiLf5xqCtS7CSkiOVgaeQ2wvS2uoLC80adYE+B6aKU4I
	 9UMAaGtwtmP+jYiYphHStZcWM8/K9KNfs1vVJ+khnaXA+OP8f5aCPpi+uJ6GnM86hUZSw
	 GqNt/CKxtJWFjd5OVcz6eBZIpOGsZ7ysyC8s48h7DST2TZ/A8Cik3y1ULGP0SZrhvMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bH2T7UA9;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AC6606A31D
	for <dmaengine@vger.kernel.org>; Thu, 29 Oct 2026 10:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70AC6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bH2T7UA9
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c411e139259so178970966b.2
        for <dmaengine@vger.kernel.org>; Thu, 29 Oct 2026 03:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793271580; x=1793876380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=21Pr25KW8iRWF16tMS8FhZNBj9jILGnkXcKJJd4L4vg=;
        b=bH2T7UA9tLjqiPSC27GHnMZnwzVqlz1naUj9j1xsfLTT6zixCP4NCnKLMIdCwYRtRA
         KTDthIi+SkhmLNmsmOha8rNdJf4bcn3/b0uVa0M61bA0y2njv0BQK2sgR7UFUKgKbiGy
         cRV+vhjsVTSQ/xkQqnQb/8dsqgm6iCa5faIc5jN5vYODZKHdbxruZ8jirfXSmx59xE1e
         WRGjI/TdQg3yDxXL5GbZZuQzkX/yxpYaK805E38ZGSd23gjyZlPhQCZb2wLnFGuNVD5/
         smaxHHml2KL6T24KhYMZNNbOZEDyk01wY1ikv8vYqd0PLEmrRAJOhheMPgwfebqcpTo3
         stmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271580; x=1793876380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=21Pr25KW8iRWF16tMS8FhZNBj9jILGnkXcKJJd4L4vg=;
        b=XkXbNRP4ElWmsyX966qnmxCchj2lMpGOPsqzl39O8iLmc0Q5PMBW0Dzb9RqDEoO5RJ
         LOJJ1Bn8dHfmb0crNZ9NqkDa0iu+eUfJ1DOxFs7lv1BpA7D4J/4VFuw437OqNgy/3Ynk
         Y4RpHkLBjOJmS2dCFYn3vmHot96oF64N5NkMqDU1iraXMxkJVFr/YOgvIWlCpxvUERNQ
         a3bcpdCiH9bzgXJoE01BUCdg/2Nx3G4Axf4D0zbflksT7eAYtGecpQk67DgWsh1NQjwN
         GEy51dIcIpkEg3qtbzbwro4Uw1Ti4cLODSCJDARl+aly2+2UYAWz9SCgwFzeEKm2m/EU
         xp1w==
X-Forwarded-Encrypted: i=1; AKwUvBy+KbMBKQGXlvo71SVJRfHbxkbaILgaiyRQmoNeacw5jMT7jJ2vb8owK2GUrJdS85Ub9SCWJvWON3I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTwPvlWdd1Mp3BhM9pD3ck6j80jHzLzaIT41B8XbfDMzzSDz+I
	DwjCjgSH2EydTLA1HTq+nrns/2pDpizA/6NzZbTIGrtn8rJCHfHAcTiX
X-Gm-Gg: AYBFou2UMkD8WQSz0DZL6FY7JX35anDODuGkNhv7Q0M3j4Y56ZRa07TwohFgiLCyhbR
	qS4I1V++l2ZqGKDW3LhJ2tjR/BTYOcOLbJa8aSasSR9JUhPb8VgLOv7rntj28TqhPk8dNLQuxA3
	M4ETdpZ3DHz95kgYXHOpX8vcBok6eXzADS9efNKJ0NjsE278PHmUCqyuTrUUFvk1jpKHq930dRI
	LKfsQSr4rouxtE700V1NtX0BVEjstzycfH1CYyVxv4w8uAwNL64UbCXdrAKW1lzBsa6oYG95XIm
	IoA5Yu/fu0QVHRLxl0Akazn7ZS+TgkShCO0q7aN9ORq592sjrZyPJlah8Q0ARtKs4C2AqT1nq7d
	F9SLd+VeSGrpLr672ZAq7KhQpbR4NaFV4ZAQ2i0ZHj36wMBqF/iLjMmmSg5dVORV0NYM7vxs/wN
	nJuA5DWc5N0HSIro95OUUo7m0MRobzb5nrclzLAsETaB8+UM2BAOK5mQwU7GM3XbnkmpzGoRLKi
	lI6sOXWAAKZJggfB7wdIBu9lB9WZfKHv/ZLluldCni1+v3Rqvhzeqg8bdRT6XcP/uTjCZGsXRZ6
	pN2wX2gG0mdz0w8hemnIy8LFxO2uuiUm9FxzZo0zT53HNgS0QESCRtg0WUmMyex/twCIpWEbuCO
	2mRjeWRCLyuhRODYpvMkZ+PtpN/80lxDUyLCOe2iL6CrGIA==
X-Received: by 2002:a17:907:3f88:b0:c40:9e84:942a with SMTP id a640c23a62f3a-c49be05b0e9mr431771066b.48.1793271579384;
        Thu, 29 Oct 2026 03:59:39 -0700 (PDT)
Received: from nixos-macbook.taile68cd7.ts.net (20-144-89-188.ftth.glasoperator.nl. [188.89.144.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7b5d54sm704604266b.86.2026.10.29.03.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:59:38 -0700 (PDT)
From: Jacob Procee <sn125164@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jacob Procee <sn125164@gmail.com>
Subject: [PATCH] dmaengine: apple-admac: Fix position one period ahead at period boundary
Date: Thu, 29 Oct 2026 11:59:08 +0100
Message-ID: <20261029105908.22809-1-sn125164@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Speaker playback on a MacBook Pro 14" (M1 Pro, J314s) underruns at
irregular intervals, audible as a tick: 8 times in 3.7 hours of
playback. Where an underrun was caught (4 of 8), the ALSA hw_ptr had
jumped by one buffer size while about 70 ms of audio was still queued,
and a kernel trace showed the DMA position stepping back by exactly one
period at each of the 6 underruns it covered.

admac_cyclic_read_residue() derives the position from the report ring
(periods finished but not yet reclaimed) and REG_RESIDUE (bytes left in
the current descriptor). When a descriptor finishes, the residue first
drops to zero, then the report is posted and the next descriptor is
loaded. Usually the last two happen together, but occasionally the
report comes first. A read in that window counts the finished period
twice:

 - residue2 == 0 with the report already in ring2: the period is
   counted in nreports and again as the fully consumed current
   descriptor;
 - residue1 == 0 with the report already in ring1, and the next
   descriptor loaded by the time residue2 is read: the
   residue2 > residue1 branch adds one to a ring1 that already holds
   the report.

Either way the position is one period ahead. The next read is behind
it, snd_pcm_update_hw_ptr0() takes the backwards step for a wrap of the
whole buffer, and the stream underruns.

While the channel runs, a zero residue only occurs between descriptors,
so read the registers again while either residue is zero. The retries
are bounded, as the residue also stays zero on a stopped channel or one
that ran out of descriptors; after the last retry the position is
computed as before.

With a debug build counting retries, one hour of playback needed a
retry for 2210 of 3.39 million reads, at most three retries (3.5 us),
also across pause and stream restart. Both states above showed up in
the logged register values. There were no underruns in three hours of
playback with the fix.

Fixes: b127315d9a78 ("dmaengine: apple-admac: Add Apple ADMAC driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Jacob Procee <sn125164@gmail.com>
---
How this was found and tested:
- The underruns were traced with bpftrace on snd_dmaengine_pcm_pointer():
  a position read 19-37 us before the period interrupt was exactly one
  period ahead of the interrupt's own read. The register states were then
  confirmed with a debug build of this driver that logged the raw report
  ring and residue values on every retry.
- There is no hardware documentation for the ordering; all of this is
  measured. In the 1906 logged retries the next read always showed both
  the report and the new descriptor, or neither, never the new descriptor
  with the old report count.
- The reverse order (next descriptor loaded before the report is posted)
  would put the position one period behind and is not handled here. The
  bpftrace probe checked every position read for a backward step, so it
  would have caught that too: none occurred in the three hours with the
  fix, roughly 10 million reads.
- RESIDUE_RETRIES is empirical as well: of the logged retries, 1189 needed
  one, 621 two and 96 three, none more; the longest complete retry
  sequence took 3.5 us. A round takes about 1 us, so the limit keeps the
  additional polling time, with interrupts off, to roughly 10 us in the
  observed environment. If the limit is reached, the position is computed
  using the existing calculation, so the original error can still occur
  in that case.
- Tested on a MacBook Pro 14" (M1 Pro, J314s) as an out-of-tree module on
  the Asahi 7.2.12 kernel, whose apple-admac.c matches this tree apart from
  the unrelated admac_hw rework. The three hours above used a limit of 100
  retries; the code as posted here (limit 10) ran for another 30 minutes.
  On this tree the driver builds cleanly with W=1 and C=1 (arm64
  defconfig), but I have not run it here, nor on other Apple SoCs.

AI assistance: the tracing, analysis, the code change and a first draft of
this changelog were done with an LLM (Claude) in a session with me. I have
reviewed and tested the result and can answer for it.

 drivers/dma/apple-admac.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index 9a1c79c12..9b284c658 100644
--- a/drivers/dma/apple-admac.c
+++ b/drivers/dma/apple-admac.c
@@ -28,6 +28,12 @@
  */
 #define SRAM_BLOCK	2048
 
+/*
+ * How often to re-read the residue while a descriptor boundary is in
+ * progress, see admac_cyclic_read_residue().
+ */
+#define RESIDUE_RETRIES	10
+
 #define RING_WRITE_SLOT		GENMASK(1, 0)
 #define RING_READ_SLOT		GENMASK(5, 4)
 #define RING_FULL		BIT(9)
@@ -358,11 +364,24 @@ static u32 admac_cyclic_read_residue(struct admac_data *ad, int channo,
 	u32 residue1, residue2;
 	int nreports;
 	size_t pos;
+	int tries = 0;
 
-	ring1 =    readl_relaxed(ad->base + REG_REPORT_RING(channo));
-	residue1 = readl_relaxed(ad->base + REG_RESIDUE(channo));
-	ring2 =    readl_relaxed(ad->base + REG_REPORT_RING(channo));
-	residue2 = readl_relaxed(ad->base + REG_RESIDUE(channo));
+	/*
+	 * The residue drops to zero when a descriptor finishes, before the
+	 * next one is loaded. If the finished descriptor's report is already
+	 * in the ring at that point, the position below comes out one period
+	 * ahead: with residue2 == 0 directly, with residue1 == 0 through the
+	 * residue2 > residue1 branch. The next read is then behind it, which
+	 * ALSA takes for a wrap of the whole buffer. Re-read until the next
+	 * descriptor is loaded; the limit covers a stopped or starved channel,
+	 * whose residue stays zero.
+	 */
+	do {
+		ring1 =    readl_relaxed(ad->base + REG_REPORT_RING(channo));
+		residue1 = readl_relaxed(ad->base + REG_RESIDUE(channo));
+		ring2 =    readl_relaxed(ad->base + REG_REPORT_RING(channo));
+		residue2 = readl_relaxed(ad->base + REG_RESIDUE(channo));
+	} while ((!residue1 || !residue2) && ++tries < RESIDUE_RETRIES);
 
 	if (residue2 > residue1) {
 		/*

base-commit: aff5e6a77fc69a7c490246465940d18422d7c631
-- 
2.56.0

