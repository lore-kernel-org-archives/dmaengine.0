Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0835A3CCFDB;
	Sun, 27 Sep 2026 09:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499804; cv=none; b=T0f9JIpl9Mwx4OoGWPwzlbaVaVusLl51I7xy4BfVDu4B8IxjKNVYT2o6qA4FerM+LiIlGBEh/YdiHYt3SgqKPoHWz2KzSr7we7W3xo07LFNjZe1P3njWwyssh5dYZINfKtxGemgLwll7Ar2TkHqj/pdvmhY+lQN31r/fOXEq+r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499804; c=relaxed/simple;
	bh=pEMZOuoYbtNnwE1jChLIqcygd0ErOorqEyZ0AwwY11g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BhQrTZugCkDl+ZnMSU3uXp4gJupO27bW0fTg/wfJuwn9HvKsRfv7ozcew9JiZ63Upc4ysFdtT0JllBFsZ2yBessluiKsW2mnuUzuvUUhLslzGyrYrTNvMOnXGQ2AAQdfULK47Tbhe+C5t01oQRHuTNusCUh8vDNP992UZjc524s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jl6m4z6Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jl6m4z6Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE0941F0089B;
	Sun, 27 Sep 2026 09:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790499802;
	bh=LgGCRaBlYpfrjjvoQzcrcjih7Xk+oyJ0welc/w/zt/g=;
	h=From:Subject:Date:To:Cc;
	b=jl6m4z6ZKyKG7SopyfvNGOsJk+OF4+eXiHfg7lHb5f2pi5M+mtUiMptcB47Cbi8Kd
	 BJoI67RKW0RJnDpVG56aepCDKlMBlreO3hSVQ67FmUydDlsZ6noOAc8awmSSfjrCMn
	 BXzoRk4a0MdL3gZWwHMmOat+0P9Id01Qp183WN1jisZjz9YP+/dmc+yzVmtJefZcS4
	 csfCYY392pjt3pP4qwXPDqZf23pRgvHBdnQ8l7UB/ee9Uk0RYmxZMsVKttTlU+9jnu
	 AkTSzPHbfZmCxi2GQ/OBuMLjl5imYackr5VFx/qFxja7dPjvAOUBhCQuKAoxh283CX
	 udwPTkaFu5tUw==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v7 00/24] dmaengine: ste_dma40: Fix numerous accumulated
 bugs
Date: Sun, 27 Sep 2026 11:03:13 +0200
Message-Id: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33Py07DMBAF0F+pvMZoPPb40RX/gVg4frQWkCAbR
 aAq/47TDQ1BXd4ZnTuaC2upltTY8XBhNc2llWnswTwcWDj78ZR4iT0zBNRgEXh89wp4Ll+p8cE
 5n7UGwCGzLj5qui46eH7p+Vza51S/r+WzWKf/98yCA6cklBXko7bu6TXVMb09TvXE1qIZ72DsW
 EuUVkoVDJgdlr/YCbvFsmMbo1UEWrtkd1jd4L+XVcfRkBgwuoAy7zDdwbT+HIhCNNlh3v+sb7H
 aYt1xjoM2RIDgcYOXZfkBgByyatgBAAA=
X-Change-ID: 20260820-dma40-fixes-b99af66002bf
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Frank Li <Frank.li@oss.nxp.com>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

This series fixes many DMA40 bugs.

Roughly half were found while reviewing the Ux500 LCLA SRAM
power-domain conversion.

The cyclic transfer residue bug was exposed by Ux500 audio playback.

The rest were identified during review and hardware-manual audit.

The method taken is: whenever Sashiko complains: fix the bug it complains
about if possible.

This has been boot tested on the Samsung Skomer device: DMA for MMC,
wireless SDIO and UART still works after these patches, and DMA for audio
started working.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
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
Linus Walleij (24):
      dmaengine: ste_dma40: Fix physical cyclic capability
      dmaengine: ste_dma40: Fix cyclic transfer residue
      dmaengine: ste_dma40: Recover coalesced cyclic callbacks
      dmaengine: ste_dma40: Fix failed start cleanup
      dmaengine: ste_dma40: Fix probe runtime PM disable
      dmaengine: ste_dma40: Check runtime PM in IRQ
      dmaengine: ste_dma40: Handle runtime PM resume errors
      dmaengine: ste_dma40: Return IRQ_NONE when no interrupt is pending
      dmaengine: ste_dma40: Init hardware before registration
      dmaengine: ste_dma40: Fix probe IRQ leak
      dmaengine: ste_dma40: Fix DMA registration unwind
      dmaengine: ste_dma40: Fix LCLA allocation order
      dmaengine: ste_dma40: Fix probe LCLA free
      dmaengine: ste_dma40: Put the LCPA SRAM node
      dmaengine: ste_dma40: Fix memcpy channel parsing
      dmaengine: ste_dma40: Validate disabled channel indexes
      dmaengine: ste_dma40: Validate DMA specifier length
      dmaengine: ste_dma40: Reject direction changes after allocation
      dmaengine: ste_dma40: Fix logical channel bounds check
      dmaengine: ste_dma40: Fix event group bounds
      dmaengine: ste_dma40: Fix V4B event group mapping
      dmaengine: ste_dma40: Search all blocks for fixed logical channels
      dmaengine: ste_dma40: Validate fixed physical channel indexes
      dmaengine: ste_dma40: Validate memcpy configuration

 drivers/dma/ste_dma40.c    | 590 ++++++++++++++++++++++++++++++++++-----------
 drivers/dma/ste_dma40_ll.h |   2 -
 2 files changed, 455 insertions(+), 137 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260820-dma40-fixes-b99af66002bf

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

