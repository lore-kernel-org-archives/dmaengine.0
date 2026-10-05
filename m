Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF71B43B49D;
	Mon,  5 Oct 2026 22:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791240026; cv=none; b=LU8/Wt4lD8ObnEFk/ywtM9xG1sPgc0ja/e76JL3zg6ybRZEzpcykF4QWcryfadkA+RNHvwcq4TSya18B0hidy8DcffH4TZ5WgMvP5q25MhaxyY3uHmldSgiR4teyeoq+zhn+yJnhSsgyifYSNZqUL5Gha6Xx8ljAt6VebbONrvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791240026; c=relaxed/simple;
	bh=iOAh2uk2u9Wu51iqB8cHOoQBTdakoKSXG3cDeB8dht4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qoc5/Omis8u2WoFe8i/z8hzKD8WioanFhNWL6VfvkV6roqmG+Xl9vkkR0jCEHglctgCZNUVe37psSU5kRqFu+57HtZHwwIyMGiQaXtoe7QILl2+hb81AMyjzJL7CNRn8LlbGgizISQ4dVsAcBml21LIIea0DVrv9tH/Dr6oehGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=On/GE2Rz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="On/GE2Rz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C06DB1F00893;
	Mon,  5 Oct 2026 22:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791240021;
	bh=y6/HT/HR0rctj0aPK77xtfuij0mRtCADUgwWoZELAkc=;
	h=From:Date:Subject:To:Cc;
	b=On/GE2RzYYELQJ+DYkvDGNlMOV3nD5Fq2R98VJnnyLMV60NVqi7dDC71Am9L1NKOt
	 SGoWFumUHIgjFVOqU913j1Zqb93OyNlJeThPGuU/qL14hViwd+XbCtdcLuBHVBXnK6
	 T1G1tnISCjyQnpAs1iYjkaqR/h0FaHFPJ/ghNKiBjKwKQckSqfgM/GekhHA9y8IdS7
	 MtgfxzROANqZEgjWiFU9vLIGxO88GedUD3XG2il5fHGkSTdVEr1oTsVMjxTlobg/Zv
	 6SFhM2l+paDffINDfk5Cn0qMTCLPEc06ahTktpDRnzLA3WYNK0zZ/FnHcLOcFtgsU0
	 mBXv4EOYH3IKQ==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 06 Oct 2026 00:40:17 +0200
Subject: [PATCH v8] dmaengine: ste_dma40: Search all blocks for fixed
 logical channels
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-dma40-fixes-v8-1-b0aadf804793@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33PQW7DIBAF0KtErEs1DAwMWfUeVRa2gQS1tStcW
 aki3704m9p1leUf9D76NzHGkuMojoebKHHKYx76GvjpILpL05+jzKFmgYAWGEGGj8aATPkaR9l
 63yRrAbBNoorPEu8PFbyear7k8Wso3/fySS3X/3smJUFSVIYVNcGyf3mLpY/vz0M5i6VowgcYK
 7YaNWttOgduh/Uv9oq3WFfMIbAhsNZH3mGzwn9/NhUHR6rF4DvUaYfpAaZlc0fUBZc8pv1mu8Z
 mi23FKbTWEQFCgzvs1thtsVs2+0SeIjOpsMHzPP8AGV9yWBUCAAA=
X-Change-ID: 20260820-dma40-fixes-b99af66002bf
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 sashiko-bot@kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

Fixed logical channel allocation scans physical channels in blocks
determined by the event-group layout. When the requested physical channel
does not belong to the first block, d40_allocate_channel() returns -EINVAL
instead of checking later blocks.

Skip nonmatching blocks so controllers with multiple physical-channel
blocks can allocate fixed logical channels from the later blocks.

Fixes: 5cd326fd27da ("dmaengine/ste_dma40: allow fixed physical channel")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260819225008.5F9651F000E9@smtp.kernel.org/
Assisted-by: LLM
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
The DMA40 fixes from v7 have been applied to dmaengine-next except for the
fixed logical channel allocation fix.

The remaining patch makes allocation continue past nonmatching physical
channel blocks instead of failing at the first block.
---
Changes in v8:
- Rebase onto dmaengine-next.
- Drop 23 patches already applied to the dmaengine maintainer tree.
- Keep the fixed logical channel allocation fix as the sole patch.
- Link to v7: https://lore.kernel.org/r/20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org

Changes in v7:
- This is getting tedious, should I move the reviewed and non-complained
  patches to the front of the series so Vinod can start applying
  them?
- Use modulo arithmetic for cyclic callback pointer displacement.
- Request the IRQ after DMA40 initialization clears pending status.
- Replace probe IRQ bookkeeping with explicit cleanup labels.
- Use non-resetting devres actions for unpublished channel tasklets.
- Derive V4B physical-channel allocation and GCC clock groups from its
  five-event-group layout.
- Link to v6: https://lore.kernel.org/r/20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org

Changes in v6:
- Simplify termination and channel-release runtime PM balancing by releasing
  temporary references in the successful resume paths. Descriptor cleanup
  remains unconditional because it does not access DMA40 registers.
- Name and document the three-attempt cyclic-residue pointer sampling bound,
  and remove an unrelated whitespace-only change from that patch.
- Replace probe-local runtime PM bookkeeping with
  devm_pm_runtime_set_active_enabled(), keeping IRQ registration after
  runtime PM is enabled.
- Link to v5: https://lore.kernel.org/r/20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org

Changes in v5:
- Respin to fix some further corner cases found by Sashiko as well
  as can be done.
- Resynchronize cyclic callback tracking after failed hardware-pointer samples
  and limit unchanged-pointer interrupts to one callback. DMA40 has only one
  latched terminal-count bit, so extra periods coalesced while the pointer is
  unavailable and exact one-or-more full-buffer laps cannot be recovered
  without risking spurious callbacks.
- Count DMA40 status from channels owned by other SoC cores as handled
  without acknowledging it, so only status-less interrupts return IRQ_NONE
  and foreign DMA traffic cannot trigger spurious-IRQ disabling.
  This is REALLY FRINGE but let's do our best anyway!
- Link to v4: https://lore.kernel.org/r/20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org

Changes in v4:
- Rework cyclic-transfer residue reporting to use the current memory-side
  hardware pointer and reject periods that need more than one LLI.
- Add cyclic callback recovery when terminal-count interrupts coalesce.
- Retire all issued descriptors and release software channel state when a
  runtime PM resume fails, while avoiding inaccessible hardware registers.
- Validate physical event IDs against the variant event-group limit rather
  than the physical channel count, as confirmed by the DB8500 manual.
- Link to v3: https://lore.kernel.org/r/20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org

Changes in v3:
- Add a fix so physical channels advertise their existing cyclic support.
- Add a cyclic-transfer residue fix so DMAengine PCM reports the correct
  hardware pointer and Ux500 audio playback does not stop with -EIO.
- In patch 3, preserve cookie completion order when the next queued
  transfer fails to start and retire failed cyclic descriptors.
- In patch 4, enable runtime PM before requesting the IRQ so pending
  interrupts can be acknowledged during probe.
- In patch 5, keep valid interrupt handling with CONFIG_PM disabled and
  only drop a runtime PM reference when one was acquired.
- Add checked runtime PM resume handling to channel operations.
- Add an IRQ status patch returning IRQ_NONE when no DMA40 interrupt was
  acknowledged.
- In patch 8, keep the IRQ disabled until hardware initialization has
  configured and cleared the DMA40 interrupt state.
- In the DMA registration unwind patch, free the IRQ before unregistering
  the DMA devices and drain initialized tasklets before releasing storage.
- Add a fix releasing the LCPA SRAM node reference after reading it.
- Move the disabled-channels binding restoration to its own series.
- Store memcpy channel mappings per controller and check the property read.
- Add validation for disabled physical channel indexes.
- Reject DMA specifiers that do not contain exactly three cells.
- Reject transfer direction changes after channel allocation so logical
  channel resource masks are released correctly.
- In the event-group bounds patch, use variant-specific limits so DB8540
  event group 4 remains available.
- Add fixed-channel fixes that search later physical blocks and validate
  configured physical channel indexes.
- Move the generic DMAengine debugfs naming fix to its own series.
- Use `Assisted-by: LLM` for the existing assistance trailers.
- Rebase onto v7.3-rc1.
- Link to v2: https://lore.kernel.org/r/20260820-dma40-fixes-v2-0-63238334c707@kernel.org

Changes in v2:
- In patch 1, complete the failed-start descriptor through the normal
  tasklet path and drop the runtime PM reference instead of freeing the
  submitted descriptor directly.
- Add an IRQ fix to avoid register access when DMA40 is runtime suspended.
- Add a probe ordering fix so DMA40 hardware is initialized before
  DMAengine devices are registered.
- Add a probe unwind fix so DMAengine registrations are released before
  freeing IRQ and LCLA resources.
- Add an LCLA allocation fix so __get_free_pages() and free_pages() use an
  allocation order instead of a raw page count.
- Add a probe unwind fix so ESRAM LCLA mappings are not released with
  free_pages().
- Add a device tree parsing fix so memcpy-channels cannot overflow the
  memcpy channel array.
- Add a dev_type bounds fix so derived event groups cannot overflow
  phy_res or the priority/realtime register window.
- Add validation for fallback memcpy configurations so memcpy-channels
  entries cannot bypass the dev_type bounds checks.
- Add a DMAengine debugfs naming fix so drivers registering several
  DMAengine devices for one parent device do not trigger duplicate-name
  warnings.
- Link to v1: https://lore.kernel.org/r/20260820-dma40-fixes-v1-0-5e14815ad689@kernel.org
---
 drivers/dma/ste_dma40.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 0ffdfd9a1c9d..d3cc2c512ccf 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -2128,11 +2128,8 @@ static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
 		if (d40c->dma_cfg.use_fixed_channel) {
 			i = d40c->dma_cfg.phy_channel;
 
-			if ((i != phy_num) && (i != phy_num + 1)) {
-				dev_err(dmaengine_chan_dev(&d40c->chan),
-					"invalid fixed phy channel %d\n", i);
-				return -EINVAL;
-			}
+			if (i != phy_num && i != phy_num + 1)
+				continue;
 
 			if (d40_alloc_mask_set(&phys[i], is_src, event_line,
 					       is_log, first_phy_user))

---
base-commit: 0ac4a90c4805b41013044fdefff051ae59a54302
change-id: 20260820-dma40-fixes-b99af66002bf

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

