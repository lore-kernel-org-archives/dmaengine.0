Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2A24E80B4;
	Fri, 18 Sep 2026 16:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748672; cv=none; b=khnlSUwraN2QpMNalvASxY9SJ1CJ9Q7WPMMvkdsEvhzFwH5RB5DhRQ21yy0+/G3AhwpIF/zJmtP+X+7FVUCHC+SRze5kqAWH/5c/HB0KPrBbSFvo0Gk9ge3laf09VXONebL356qK7hR3OCORXj7ZaRsNErsvBbSitxFtfAjcjzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748672; c=relaxed/simple;
	bh=z5X9zCh5IuFuZcvgGxwrAtS1NSjrzMSbCh5e6zRR+KM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZYZHRB78btAkdSd+jB2tBLFaG/ARw6UpfAYiUAoFvlby+SDZWbQTfTYP4H6IydoAQFwyOfA4uPxlCq1Q+s/IsF2qFdV7rzNP+Gimc3ipbEO0tXFAOOFxf0K2W+dOFrPFXuIb+3k/nJfI5Ch38r6u7zMSwxeFDYztOYMPNlwm67w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PmEeUch7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PmEeUch7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 235B81F00898;
	Fri, 18 Sep 2026 16:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748668;
	bh=XFeae9yCxsl9uHzfvyOrz7r4DovEX9FHnVBraiTaw/Q=;
	h=From:Subject:Date:To:Cc;
	b=PmEeUch79xZCBp2RCRv9IBPP43EiA78zOZtMKDZb08VgLH+ddXIdig3ixwdO6lwXq
	 j9pyaP6tKYDCT1NlZoAoP6LRjbDgYkUUcK8hSGrIAIE9dUlk3+E1XORwEJPvDt12S6
	 mhAURh1if5mEANluVhM1Yw2XUAT6fcvduRWrlhpMkh8u9ozWjYbVCy0uBKlDGIRklp
	 ZSujoQPC6+qfY1dSw/u8gdoo+vZJ1izTS/Ip9m8JWRrmzkY7SdFEUGATJ18leIYvIX
	 nxoBe6VcSNJ4fsydcxeOBeGJ8jIRInm2fDNSRR+nTg5PntI/qp/dxuXmOPX1JO9qkY
	 RemOPcUqNPX6Q==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v3 00/22] dmaengine: ste_dma40: Fix numerous accumulated
 bugs
Date: Fri, 18 Sep 2026 18:24:19 +0200
Message-Id: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32MQQ6CMBBFr0Jmbc10CqWw8h7GRYEBGhVMaxoN4
 e4WdibG5fs/7y0Q2DsOUGcLeI4uuHlKoA4ZtKOdBhauSwyEpNEQiu5ucxS9e3EQTVXZXmtEanp
 IxsPzfiThfEk8uvCc/XuPR7mtvztRChQFy9zIwnbaVKcr+4lvx9kPsIUi/ZEpyVqRMkrlbYnll
 7yu6wf0/Vu+5AAAAA==
X-Change-ID: 20260820-dma40-fixes-b99af66002bf
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

This series fixes 24 DMA40 bugs.

12 were found while reviewing the Ux500 LCLA SRAM power-domain conversion.

The cyclic transfer residue bug was exposed by Ux500 audio playback.

11 more issues were identified during review.

The method taken is: whenever Sashiko complains: fix the bug it complains
about if possible.

This has been boot tested on the Samsung Skomer device: DMA for MMC, wireless
SDIO and UART still works after these patches, and DMA for audio started
working.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
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
Linus Walleij (22):
      dmaengine: ste_dma40: Fix physical cyclic capability
      dmaengine: ste_dma40: Fix cyclic transfer residue
      dmaengine: ste_dma40: Fix failed start cleanup
      dmaengine: ste_dma40: Fix probe runtime PM disable
      dmaengine: ste_dma40: Check runtime PM in IRQ
      dmaengine: ste_dma40: Handle runtime PM resume errors
      dmaengine: ste_dma40: Return IRQ_NONE without interrupt status
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
      dmaengine: ste_dma40: Search all blocks for fixed logical channels
      dmaengine: ste_dma40: Validate fixed physical channel indexes
      dmaengine: ste_dma40: Validate memcpy configuration

 drivers/dma/ste_dma40.c | 387 ++++++++++++++++++++++++++++++++++--------------
 1 file changed, 277 insertions(+), 110 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260820-dma40-fixes-b99af66002bf

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

