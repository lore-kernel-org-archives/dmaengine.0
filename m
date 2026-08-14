Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAD3470451
	for <dmaengine@vger.kernel.org>; Fri, 14 Aug 2026 13:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786714184; cv=none; b=NkvigulJpPNhggYTB7eiyRPFyV3E7+54IEXea5Z9nTwYSNOgGJM2fCqFArb71iBQOShbC/1up8uxcpKYb3BC3mKCFikrb3Bnjps1+5DCLTsOAE97gPC6ABLsrTyv7hmbu9hUBcCx4GNqu/anZx0PNbELzp36YQ1WrJj+F048wJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786714184; c=relaxed/simple;
	bh=bAEWJXpWzPUhQYzyuDT8PPZLPevp6bNC7oyuUisHQ4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CJxtT/eDejE3ihhbRgMgjADFjgkkC9+Wg2FcHp9G0hdGYEgxgmRj9L8+BfOKrFEOCtlg5UR289vvp/5Qm2pduAxbMp2q6DcuCfXzZl/YyzTtVQdPMtOKwlLJ4NPbardTRn2FPljFhmB3G6bM0kMJLh8PJwvAGbwjCMcUX4Gep/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io; spf=pass smtp.mailfrom=soundtrack.io; dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b=KdnhGeAk; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b="KdnhGeAk"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a18af264f9so209981a12.0
        for <dmaengine@vger.kernel.org>; Fri, 14 Aug 2026 06:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soundtrack.io; s=google; t=1786714181; x=1787318981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7YukWWHI9wYIN19FTJID+eUyg7sERpWkqr51k3rjwMM=;
        b=KdnhGeAkNTx7+k+h24Eo8EURKnbYW0NimO2PY5sC2V6IJzQYCYb+2nuoolLM81XhGT
         ul3Z0zOxzVMq2JOCXgCjrJbATa6MoAqan2PqzewZ0MTUiFP2hg1T/Be5ZEmEFdqPhxaG
         jUthOK+70LiCok/5/89QsoPnCrVtpffjaerLIB4VemLOhyaBVCpVGgwPJ0GCKkT3hSR5
         5XatUcfnW7toY8WT0+Qr7R1p0HFa9iqYYsRSTUCKFsQNOBdwVu4bI8b78aeU0a01Na72
         SamZnWWcGVnQhWATeWhS2N95M8OFU7tWPA2m84sWGkTU93vwHGX4jjmVlc4pzgiCSEYg
         uv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786714181; x=1787318981;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7YukWWHI9wYIN19FTJID+eUyg7sERpWkqr51k3rjwMM=;
        b=KKvfZjYbSlPCDVnJ5I2cyuofWb7aea7Iud+aQ1K3EsF6Ejh5Go7XS+jEvm12RRedui
         iHBd57rwefzqxAQHq7rRmQuu+Pa+ylTp2HRsNcx+zzt/Fy3ikJqprfUGB4j1VSv5pi2o
         rc+JVIejbAjSOricLhYuYOJJgP46vXFcMk+rAYlrvK44BMhu3cL68W8faPWcOHANF4Tr
         /lJW5mcrGxL0bXsGo2xPB4vPdI4akEwHNOjsP/1IKFQjSUbxYZ/hT4/Ka3oE+ZnmyTq/
         AvNx0aZ4T3uEsCnpMXQi+FGZ8I6q8IcDAY3gbjxVT6N4b6BI+frqgMWhPFSImwKlhTnK
         t+/A==
X-Forwarded-Encrypted: i=1; AHgh+Rr98kA+fH86bidbA4r3LC5wnmJBdWSVyAPmYhoWXrVkgrW7hAVQ2JUhmCJ0cR8FdedWeIWNQio/p1U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWFYkuESay43rziocTNOk2G+rp/lFX/FqXOGcNZny5LEhvuKRP
	0jQhS8btMaW3pcmQqgyBYo+QQ2FhXuB8mkguOXow+9cBGndkCWvEUgvnRSQ2PZDW6E0=
X-Gm-Gg: AR+sD11+Br/ka7mKSux3kvYs4y3erZYS3hkZrnkGB/4cKxugdgsH3IFuseQR7JIBOlS
	xj/l8uh1UmIhs/D4wR544F4PGUQuiU++2ygW7WyknMkQ4oW2CGGUQLzJGgE3We2cEJp+rlG7bf6
	KFT0o5r3JRxKy1msdr/+L7A5TivobjKA3+TeA/P7aAXRdmEFqilZWRyG2n9jR5PFWxzhh9zrggu
	XEAE+0flC9/g5YF6xYD1CvMoFgG25+yqmYkbpSIIHMTmA0OhXh/c2v8Zvx+l89hS4tltBg2KRgM
	ykUkMF7uA4/9MPJUes9xLvGBYf7QQRgIWj8kdWxcXN2VgwnioJEU3R+dl7lnTkjo2VNmF5COMa+
	an9giESPUT4Y+mL6vL5oalOI403QmtPgGZf0IPQ9kdffckyNEzq2VhaDC1Z0N9k/SU7gu1m7PIi
	DavD37AlGmCze0kbT+GKwN88+afErnKr/OXE05i3J8skzECxzGFHXh8e1mOXCJaNRFp0bRKQE+B
	U7rfKRUN07wZU2b9tTD78BE8Jk2l0YpLwonGNnL/cmztVhsARIEsrOoEA==
X-Received: by 2002:a05:6402:1cc4:b0:6a1:d68:338a with SMTP id 4fb4d7f45d1cf-6a38a83ce95mr1450030a12.0.1786714180850;
        Fri, 14 Aug 2026 06:29:40 -0700 (PDT)
Received: from Christians-MBP (31-209-40-223.cust.bredband2.com. [31.209.40.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a38c9d5eb2sm841941a12.5.2026.08.14.06.29.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 06:29:40 -0700 (PDT)
From: Christian Lugnberg <christian.lugnberg@soundtrack.io>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Christian Lugnberg <christian.lugnberg@soundtrack.io>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] dmaengine: sun6i: fix non-atomic read of DMA position registers
Date: Fri, 14 Aug 2026 15:28:29 +0200
Message-ID: <20260814132906.70322-2-christian.lugnberg@soundtrack.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814132906.70322-1-christian.lugnberg@soundtrack.io>
References: <20260814132906.70322-1-christian.lugnberg@soundtrack.io>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

sun6i_get_chan_size() reads DMA_CHAN_LLI_ADDR and DMA_CHAN_CUR_CNT in two
separate readl() calls with no synchronisation between them:

    pos   = readl(pchan->base + DMA_CHAN_LLI_ADDR);
    bytes = readl(pchan->base + DMA_CHAN_CUR_CNT);

DMA_CHAN_LLI_ADDR holds the physical address of the *next* descriptor the
engine will load once the current one completes. DMA_CHAN_CUR_CNT holds the
remaining byte count for the *current* descriptor. If the DMA engine
advances to the next LLI entry between the two reads, pos becomes stale: it
still points to what was the next descriptor at the time of the first read,
but that descriptor is now the current one and CUR_CNT reflects its initial
(full) byte count. The subsequent virtual-chain walk starts one entry too
early and accumulates an extra full period's worth of bytes into the
residue estimate.

For ALSA cyclic buffers the over-counted residue can reach the full buffer
size, causing the computed playback position to appear to jump backward to
near zero. The ALSA PCM core treats such a backward discontinuity in hw_ptr
as evidence that the buffer has underrun and declares an xrun.

On the Barix IPAM400 (Allwinner H3, kernel 6.12) this manifests as audible
glitches accompanied by spurious xrun log entries, confirmed by two
independent observations:

First, the ALSA buffer in the affected configuration is 2 seconds deep with
a 500 ms refill period (the interval at which the player software wakes up
to top up the buffer). For a real underrun to occur the player would have
to stall for the full 2 seconds without writing any audio — effectively
impossible under normal scheduling conditions. Yet xruns are observed
regularly.

Second, the underrun duration reported by the kernel at xrun time is
~30 µs, roughly one audio sample at 44100 Hz. A genuine drain of a 2
second buffer cannot resolve in 30 µs; only a phantom position jump
caused by a register read race can produce such a number.

Observed on a 44100 Hz stereo S16_LE stream:

  $ cat /proc/asound/Codec/pcm0p/sub0/status
  state: XRUN
  delay: 0
  avail: 88200
  avail_max: 22514

The avail_max of 22514 frames (511 ms) matches exactly one ALSA period —
the amount added by starting the LLI chain walk one entry too early.

The race window itself is narrow. Each DMA descriptor covers approximately
88 samples (~2 ms at 44100 Hz), so the engine advances to a new descriptor
roughly every 2 ms. The two readl() calls must straddle that exact boundary
for the corruption to occur, which explains why the bug is intermittent.

The bug is further confirmed by the xrun_debug bit 2 toggle (jiffies
position validation). With it enabled xruns cease immediately and do not
return; clearing it causes xruns to reappear within minutes. This on/off
reproducibility isolates the fault to the hw_ptr position reporting path;
the DMA engine itself is functioning correctly, as evidenced by hw_ptr
advancing at a steady 44100 frames/sec between events:

  $ echo 4 > /proc/asound/Codec/pcm0p/xrun_debug  # xruns stop
  $ echo 0 > /proc/asound/Codec/pcm0p/xrun_debug  # xruns return

Fix this by re-reading DMA_CHAN_LLI_ADDR after DMA_CHAN_CUR_CNT and
retrying if the value changed. This double-read pattern guarantees that
both registers were sampled during the same descriptor interval. The cost
is at most one extra readl() pair per call in the racy case, which occurs
only at descriptor boundaries (~every 2 ms) and is negligible.

Fixes: a90e173f3faf ("dmaengine: sun6i: Add cyclic capability")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Christian Lugnberg <christian.lugnberg@soundtrack.io>
---
 drivers/dma/sun6i-dma.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index f47a326dd7ff..04fe1f5042e9 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -354,8 +354,10 @@ static size_t sun6i_get_chan_size(struct sun6i_pchan *pchan)
 	size_t bytes;
 	dma_addr_t pos;
 
-	pos = readl(pchan->base + DMA_CHAN_LLI_ADDR);
-	bytes = readl(pchan->base + DMA_CHAN_CUR_CNT);
+	do {
+		pos = readl(pchan->base + DMA_CHAN_LLI_ADDR);
+		bytes = readl(pchan->base + DMA_CHAN_CUR_CNT);
+	} while (pos != readl(pchan->base + DMA_CHAN_LLI_ADDR));
 
 	if (pos == LLI_LAST_ITEM)
 		return bytes;
-- 
2.54.0 (Apple Git-156)

