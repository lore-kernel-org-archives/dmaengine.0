Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793345961;
	b=PeReaiKPnta3HfCfJonHkmab3k5XR/DtEZq9DCS7atmEFQjkI57Da2ftpnvg6y9EFN8I
	 IMBwTXD8f8Vn7fzL4k0SLyCNqEfmc4loOjP1I9lku5OxJmaQ8BxkvD3ztjT7IzIlYkMyz
	 vUZDj+MNURSyOVlOMqoo6+8l0ka6u71gkJ2+k5+IzS60RJLPPILVc90oHv9i2Sv4jiXvq
	 Y8xA9WpR0gBX/ANTdgoddlrVcdPYy18ytuss8jr++uoBKsq8N4C2axVrqYYQX6jSCcvE6
	 1ibO/eDYwAzMqHgdjKFSuc4na/hvtyhC2z92/XYum2+pOQj1SzYOUEDauGVAl0uKgPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793345961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=oTDHP5iTI4lQOhbLd0Zj1JOArDqyXgTJiorChKNggjQ=;
	b=Ef45RpnTR3DJqr5UzwL9WpTrcUGYIGNmcybd9XJ/lYUe14lRTCt4L9EQhoeeKw9A8S3G
	 cye+BhOq07jwzk+xnEaxakfFsZzaI5Gaz5PNKSa+w+pX9vfHJ2drvQCOsjEsZEqhWfUds
	 lS7AlAlFKNev8fdhfs3iT60sAvrL1E2r2mH8I2oimsBkAqWuSnuS9NAPCWFnZnG3CDNIN
	 YJ4KH5WuVHXTp9DkRmYdHINDOIV6qnBp7SXbULjTJ1+bxj4XwyWlYZWjA46uaou/Ah5xK
	 ro3p9lUm5WgHtnUj/Q+ETZPZlAjJpn5W1w0H798Lbf7OnKEHJFTH/qwR94/c75nG3pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nT9y3S9B;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7298606A31A
	for <dmaengine@vger.kernel.org>; Fri, 30 Oct 2026 07:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7298606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nT9y3S9B
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c445c95d553so45078866b.1
        for <dmaengine@vger.kernel.org>; Fri, 30 Oct 2026 00:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793345959; x=1793950759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oTDHP5iTI4lQOhbLd0Zj1JOArDqyXgTJiorChKNggjQ=;
        b=nT9y3S9Bq3uKVh22e2x6NQwCZM7bI7duMaS7plSvdcIDoKov+j/xcec1ELDolQZE+e
         c5w0cgWpwDdVmy99sxSDALY6lvfkWY02Mk3WFoH0rfOn+/+ly8IevIYeJjApDQeI92d4
         +cugiSi2F4IgwIZVR43O2CxSrTxZdZBSML/dtY9zj3soDTtT2Y4NwJLofDulwo/WSBXb
         KMlpH5QNgsNkv5ofYBb5J09Dib6NebQNZ2Bg+nSi1ivx+dTB+VAFzjwFrd7FcNvmdPyy
         fx7vEPLLp7TEvFrekBh0XuEFtbfXNh4yaUJK6d2zQSy2vpF4DNB3PCaqP+sWsUorkk9g
         iycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793345959; x=1793950759;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oTDHP5iTI4lQOhbLd0Zj1JOArDqyXgTJiorChKNggjQ=;
        b=ccOQkabxMM1HXlq0bt8WE24lq+rNhpsQGYN2ru+A9Hlm+nwRwFefSTLdUInog1UMkj
         trjfgLQKF2OJcT1OftrlZAXyzAFulMvVcVX2xuEVj69tz3v7DwFfheCLCnHaCmpmlwAS
         kUfT/pu0N5tpBMnNXMdWSb8TX3PLO8mk0XVODmUdstpG8/ioJs9vAUvgvx/Xpw3v/+ym
         LpnP14IZb0YVQsxMWUsnpkcf6hpG2BTKfFjvQa2yAsAZb6Sk7SqCWgy32by231b/E/IY
         NYZbibzyzkS7MpCEKLvbennfgRH2LOdMpgkLwx/ZCzkSlFb7dGiK+/HrkovbYYE9uoee
         oYFw==
X-Forwarded-Encrypted: i=1; AKwUvByDwNWr8BsXuMLWN2E3cFxCNlpnoZbJJfGuEOzixQBhDJ/Us5xf1ErKX/8ZA/gWuXeR0CpiPpxxt3Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtOwhYeHapc1m5iAJlpQbUEupYMrR2vy4lKGozt5OcUex4++Ef
	9i7RcjV4UtTb0asZglcTsoVLALL+ejbbTFXU+Ig2LGXjukbqYQoVvlkT
X-Gm-Gg: AYBFou1YDJVWQOQyvl1UmlUnCZL+OjisdZBS4qg0oKxeGaTo+aTSFZgwS7k2n+68kXz
	OHblqNcgmN92eiT49d197trQjMTjVAv3sxrod87cPm2hLgcX9TsY65rhGOsDM9lehKuCUGgudue
	rg34Kxs06Sj18HHDmXS+W40GCE4ODwDWe+fy2+Lzpyd5rWUdBXRxBEqzkvr4uLocGsi9dimq3y1
	LMbxdaQjGmhkYa0NNuYqDte8Ro3V2VPfe1I+Jm1Y7L96jGI3QEjO3AnsaxocZnXqJ2h/ja8SMCi
	DeClRppB6lzAKbG3kL6CQzdm9X6fT3X+fmKm68VC9e4Ax0/VAJGBUBQlGdmChBl0qdgzal2hIAG
	AVXhr00TrF4otokVHTgyo/oY0bhS4Yt0xf0KGyW+M8Tn6r3CqcBZzfOej85Xd1N2ShszTSGPASf
	zyoypTnzCbGUPNCsmGDiNMz7eP/88TTchfeee/DIcbr93xxROb7WnNmg5Iy+tsBccSMR3drsdlg
	b6EnExRL9yJlhvKhwcKiAqqoUE4AVTVfkhbQyydxxN027f+4F0IJt6T/XSIcllKSi9MqBNaUe0z
	gJhXgA8V6Z/EMrqJjKxCc2LIKMfvN+jcVGUbyxkzkLfMia3rRTogRAETXTWwhaXH6kCJmQr4J8l
	/zrOHew8/L+XYcr/Ovh24gLqEacOgbB5idJ7fCBxX00AIyQ==
X-Received: by 2002:a17:907:3d8f:b0:c3e:d18c:1d7d with SMTP id a640c23a62f3a-c4ca7a88815mr126486566b.22.1793345958962;
        Fri, 30 Oct 2026 00:39:18 -0700 (PDT)
Received: from nixos-macbook.taile68cd7.ts.net (20-144-89-188.ftth.glasoperator.nl. [188.89.144.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe0f389sm34050966b.32.2026.10.30.00.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:39:18 -0700 (PDT)
From: Jacob Procee <sn125164@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jacob Procee <sn125164@gmail.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2] dmaengine: apple-admac: Fix position one period ahead at period boundary
Date: Fri, 30 Oct 2026 08:39:09 +0100
Message-ID: <20261030073909.21966-1-sn125164@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: Jacob Procee <sn125164@gmail.com>
---
Thanks Frank, Sasha and Martin for the reviews.

Changes in v2:
- Drop the code comment, the explanation is in the commit message
  (Sasha Finkelstein).
- Add Frank's Reviewed-by and Martin's Acked-by.
- v1: https://lore.kernel.org/r/20261029105908.22809-1-sn125164@gmail.com

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

 drivers/dma/apple-admac.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index 9a1c79c12..a505975a5 100644
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
@@ -358,11 +364,14 @@ static u32 admac_cyclic_read_residue(struct admac_data *ad, int channo,
 	u32 residue1, residue2;
 	int nreports;
 	size_t pos;
-
-	ring1 =    readl_relaxed(ad->base + REG_REPORT_RING(channo));
-	residue1 = readl_relaxed(ad->base + REG_RESIDUE(channo));
-	ring2 =    readl_relaxed(ad->base + REG_REPORT_RING(channo));
-	residue2 = readl_relaxed(ad->base + REG_RESIDUE(channo));
+	int tries = 0;
+
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

