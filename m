Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83013CDBC0
	for <dmaengine@vger.kernel.org>; Fri, 14 Aug 2026 14:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786717666; cv=none; b=gssvcUE75jjeRRNE6ita4kqyVz2No0LcvrLbqdXf9dl+tA99vfAdj7kCxdXNlJrFvUM2SEb4iFjBnVBzqudYaKA1axsU3tSWMZEYUOV34Guy8qHCz+BZmzP96+taaDtUb2RDZCN8C8y/fzlICZYGO6MmyqXOQMIBk/57kvEVeN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786717666; c=relaxed/simple;
	bh=bAEWJXpWzPUhQYzyuDT8PPZLPevp6bNC7oyuUisHQ4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LOs7ZoQVNh6BtcLhOZXeZ3qb+fttQRvF3kd63dPI0TS7FmGistJyQNsRBF84WLNnOhd1biqqRanGjzzvUtNw/ljiWmvXp+pLG6qjAtr6UMpdtaur/ER7ueXHTNdTZd4AHjH2qegQ53CzfV28hzZggNyHeIN1WGWsWMi45PupOy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io; spf=pass smtp.mailfrom=soundtrack.io; dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b=BjkR7nZw; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b="BjkR7nZw"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a1541ea780so149826a12.1
        for <dmaengine@vger.kernel.org>; Fri, 14 Aug 2026 07:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soundtrack.io; s=google; t=1786717654; x=1787322454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7YukWWHI9wYIN19FTJID+eUyg7sERpWkqr51k3rjwMM=;
        b=BjkR7nZwLzXESdZi0USnXcTvckh8r9CTK4Sx9G1jf8OQ4+4Hp/UUYtO8Yfn0GEipG/
         FvmVtPwWUjvVzyw5tDn83Qq/Qzi1ejt6qmTIvhYZyYMP9Hmx+bYDaQwNn2Bl7jTMNBet
         qEjAadwlzMISuT6dLh9zHch1/FlLC8n7v9ksRH60b2nbmwAC8qbG4IBoAC4fzlHKf1Vt
         KTAcpJOd6R/pbwZIOWNGUrONnDNIuiB5zjOSRA8/I/drG2WMQM3te1h1/kCSaBaHtd9x
         VrqyHDlrRq9Zv5/ULUuiYQ1gT2+QVp9J9UbSKtvzRWGiU86t9/WvaF/J4kcpqZXMAy0j
         spgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786717654; x=1787322454;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7YukWWHI9wYIN19FTJID+eUyg7sERpWkqr51k3rjwMM=;
        b=NfZwPP9hb55RRsATnt1aoLTmGKDYLAW3zeo16qQ1bTQYAqsKh1spYRjf47X44MHt6M
         jeu1eSKrYpOoKrFqqg83mjgDnvSqTG/P0z3LlYxVXTw4OgMV32p39nw8uxaHDIyV7Y/O
         ueD0dDtihdlPPlC2QQ5cRz5RdjbLz5Gc6xnE9NriP7XY+C8PWtM8CmG4sSQmUpxXWA88
         NpQ7irtp8ah/6LJikQ+hs+rZtWPFQY4wlU+fpvbrISs0DjIhG3K/tPtbn/oA7wznNhb7
         1WKi66RTE7sawMjYHlOxlYmPXj1u/2oLdeUQaCgliu2Vr66nYXaB87rJMiSa8wFmD1u5
         hRTw==
X-Forwarded-Encrypted: i=1; AHgh+RqDl/mZaK9PYznfXCbbekngDW3lujQC+bzYkvb2lSYNLW0hiq6uo+T2fCr0lI6GeYfynrYqC81OIq8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9DwrlbXRG7phnjMKMfj4uWHVVwGjV2NczhHPI9+jkcOI8xAGx
	7esRF4JitVKiIOBhm8pEK8eKs8cvzWlj05XVogBxUe9bAGzHlYc8J5vnvcMvbXBCi30=
X-Gm-Gg: AR+sD12zQ6SpcsdzzshVBg7ImCLhI+PN31Qrfk1iCbgdTh1k+7ubLKSs8IQ1eIsdLOh
	WS6E3gs16H9BX1xiQmZUCIuKJZYjMjVRyS2AvDmFIP+lw7CxGIJmyIjKg6r/lEcpwYBrR5jbOsJ
	lrhOPoTF5qpHUF2sNDiITNi3ilcIohNlr0cpNTxZGT9PXx9Kg8zrqSsG9sCXQ8WJh75JPHVvc02
	5BG7IU7idKHsm86Uod494yI7mFbJYrJqFgEZNFQwnEba8xjcaCk5sjN565igGBR7EGwDvOvGxji
	V4qF72eu+lQwELCgYoa8XWol54vtNzlvyWDDGQUFZ5ymVtePguA4Z/QVjUPTFFKTdl47HrXLMG7
	VZhCzO2DczBpQWJ6GiP9eNRXwCLSuQbncjm724xyy/9bDW1QSdfwSBz2J90wsZZpxPWqotghj1F
	ew8NX7xg6Mymc6ziYT4IxF/08s0sMnNYiFqf55uKlyiXF1SNRJzOGmww+5qMlwxkBGC/igfu5Yu
	B9GqQwSLczK0Wl5VqKWfKCUQcfdKLWZP8i/ZWvDSBB2p/ZAWlSFmyoimg==
X-Received: by 2002:a05:6402:548d:b0:6a0:f1d5:deb8 with SMTP id 4fb4d7f45d1cf-6a38a83c619mr1585118a12.0.1786717653700;
        Fri, 14 Aug 2026 07:27:33 -0700 (PDT)
Received: from Christians-MBP (31-209-40-223.cust.bredband2.com. [31.209.40.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21234c45ffsm106308866b.19.2026.08.14.07.27.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 07:27:33 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dmaengine: sun6i: fix non-atomic read of DMA position registers
Date: Fri, 14 Aug 2026 16:21:10 +0200
Message-ID: <20260814142708.79120-2-christian.lugnberg@soundtrack.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814142708.79120-1-christian.lugnberg@soundtrack.io>
References: <20260814142708.79120-1-christian.lugnberg@soundtrack.io>
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

