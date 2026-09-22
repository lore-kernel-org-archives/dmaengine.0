Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F185349CE;
	Tue, 22 Sep 2026 23:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119853; cv=none; b=nTefy50he8g/NtiqFCDhgsB7G9ueQAK44dxZRJ4anqFTU8Cbfg52B9wQL3olqDULVtvqvU5UUgP/mXKM3xw8CgFwMeyPYho37ejk2god3thDzGOJ52kcxgD/FrWZ3QbmX5XqdnTQNfvuT+s06fMy0ge8AzC7w+oAcxJIJRTupsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119853; c=relaxed/simple;
	bh=cHk6t922/0rRKvnFoDGAfSdlLss69jiIf3yufhEtwQk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VIkFYsmlrSCgo0G1x3JrmWGF+xnqs7f3n1Sx5kF3WsHRwYrpjjjjonaBcChqF+S9JRZpvLYOQAjdQAU8HuKGpgP1s8VtAYQH6sXe8NaH5kcG1MRXoJmPwtLeb989p0unl4CmEC+LIg1sFqguLvfhtLAC120GZT9uV8a85dQvHyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nh/1vF+0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nh/1vF+0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71E3F1F000FF;
	Tue, 22 Sep 2026 23:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790119852;
	bh=0wjSXi273t4uQ4dfE7/cxNZhF6lQRIENDmxxsOMlJ3k=;
	h=From:Subject:Date:To:Cc;
	b=Nh/1vF+0GE9jtqkxIcptPIXzSknaGUG6jBo620cvTricv7vxz0o93Y8isilEJh111
	 UYxBOBNKovkO0+fY9jK3coMUinkdA+JBFbRTuIp3EymaPK+5uPhszf+UQLyfY5R7wH
	 5btWH5KrGmoKVmse9rV+JYO1FfAHCJ226KrzjjlXI1/58eF0pVGao4yzfWpF/CUw5c
	 7sq5HdbypTEQ05AATXIqJYi84VY0ApD7X7h2vuxvrAhW/TdY9djZechlfHSlX5v4Gf
	 KFRbs4PZV+KLUY2ELKjpITp55WEGLFdQ9YANNnhvFnR7CSNMvBHwsKJepHtSIZQaRd
	 qqeq7n2MFnfbw==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 00/23] dmaengine: ste_dma40: Fix numerous accumulated
 bugs
Date: Wed, 23 Sep 2026 01:30:45 +0200
Message-Id: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NTQ6CMBAF4KuYrq2ZTn9oXXkP4wLooI0KpjVEQ
 7i71Y0ixuV7k+/NwBLFQImtFwOL1IcUujYHvVyw+lC2e+LB58wQ0IBF4P5cKuBNuFHilXNlYww
 AVg3L4hLpdchgu8v5ENK1i/fXeC+e7e+dXnDgmoSyQpfeWLc5UmzptOrinj2HevyDMWMjUVopV
 V1AMcPyjZ2wUywztt5bpcEYR3aG1Qf+/qwy9oUWFXpXo2wmeBzHB34wYh1eAQAA
X-Change-ID: 20260820-dma40-fixes-b99af66002bf
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Frank Li <Frank.li@oss.nxp.com>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

This series fixes 26 DMA40 bugs.

12 were found while reviewing the Ux500 LCLA SRAM power-domain conversion.

The cyclic transfer residue bug was exposed by Ux500 audio playback.

13 more issues were identified during review and hardware-manual audit.

The method taken is: whenever Sashiko complains: fix the bug it complains
about if possible.

This has been boot tested on the Samsung Skomer device: DMA for MMC,
wireless SDIO and UART still works after these patches, and DMA for audio
started working.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v5:
- Simplify terminate-all runtime PM balancing by releasing its temporary
  reference in the successful resume path. Descriptor cleanup remains
  unconditional because it does not access DMA40 registers.
- Name and document the three-attempt cyclic-residue pointer sampling bound,
  and remove an unrelated whitespace-only change from that patch.
- Resynchronize cyclic callback tracking after failed hardware-pointer samples
  and limit unchanged-pointer interrupts to one callback. DMA40 has only one
  latched terminal-count bit, so extra periods coalesced while the pointer is
  unavailable and exact one-or-more full-buffer laps cannot be recovered
  without risking spurious callbacks.
- Count DMA40 status from channels owned by other SoC cores as handled
  without acknowledging it, so only status-less interrupts return IRQ_NONE
  and foreign DMA traffic cannot trigger spurious-IRQ disabling.
- Credit Frank Li for reporting the cyclic residue interrupt-counting issue.
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
Linus Walleij (23):
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
      dmaengine: ste_dma40: Search all blocks for fixed logical channels
      dmaengine: ste_dma40: Validate fixed physical channel indexes
      dmaengine: ste_dma40: Validate memcpy configuration

 drivers/dma/ste_dma40.c | 551 +++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 433 insertions(+), 118 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260820-dma40-fixes-b99af66002bf

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

