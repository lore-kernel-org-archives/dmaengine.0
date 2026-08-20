Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F40448397;
	Thu, 20 Aug 2026 13:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231700; cv=none; b=i2Gt52801p6RvLvaaT9W05W9dT9k6ctw6FK3ZvvhJy9O2oHiq6ThhBlnr0PjnZu4AFeF8EpU8PDqzsm0JM1pqUhz/A7EzYciFRmWQoRzC+CNy86FjSux1pCOpgLyG8SOFW7WnJ1rRUxvJcs70zIV1PqGZTu5RkdWcapXm4O8gYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231700; c=relaxed/simple;
	bh=UwNKrZ/NINybqH//tQUfvkiuK4v6FePmZcogfM3sirs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YmLLkqduPv4FUolXTAKkHk3cGl5yDnG4lJJAfvcKEEcJtcMFnKVvrx3m4CPQShX/t64ajx9H21o6r0KRpP+C25XG6RM0Dp39E0SB9jjSPCy7LSgxCmgMhbyDrwnqdEoxFYE5wA6kZBx9HxHVZxf9kPeI7ok68uE2Lu3tVFY49no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n80aRJtu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n80aRJtu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E391F000E9;
	Thu, 20 Aug 2026 13:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787231699;
	bh=8bCUUpURRD2cHOqJA50RI0LDNDCW9e6kh4Ki66UWegs=;
	h=From:Subject:Date:To:Cc;
	b=n80aRJtunObaK3018dQ3DbEGa/1TNSUQzGKhgyr2UV+ZQg17FzrUHKC2AsQTP+VBM
	 BMIDXsm/wrTyswfJKztAbidcQN00vW7Ze0BA5t/0s/oKq3kqFjmOAXbwpX3GymNPBM
	 d+RaGMlK+lasEmz/eOI1CFLbDnxKqpDRGSfcdCUFs5WMgSbDMKXkjH4oz9HdvH2UcO
	 jUIgPhhaLMwarCR6v1QfuB19+wi8I9yuQEYh5WvLSNvyDPSdgQsKwha6DydMVNYT1J
	 ucJ+tr7ylLKN2lNT2WLvq00szQX0/UPwDVj1ZlpFGg+/mzHIeSvF9Du5bv1l4YCZIp
	 zDPvjdfcqJZ9Q==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v2 00/13] dmaengine: ste_dma40: Fix probe and allocation
 bugs
Date: Thu, 20 Aug 2026 15:14:54 +0200
Message-Id: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22MQQ7CIBBFr9LMWsxAWgKuvIfpgsrQTlRqwBBNw
 93Frl2+//PeBpkSU4ZTt0GiwpnX2EAdOrguLs4k2DcGhUqjUSj8w/UoAr8pi8laF7RGVFOAZjw
 T7UcTLmPjhfNrTZ89XuRv/d8pUqAYSPZGDs5rY883SpHuxzXNMNZav+osWYmnAAAA
X-Change-ID: 20260820-dma40-fixes-b99af66002bf
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

This series fixes thirteen pre-existing DMA40 bugs found while reviewing the
Ux500 LCLA SRAM power-domain conversion.

The fixes cover failed hardware-start cleanup, IRQ handling while runtime
suspended, hardware initialization before DMAengine registration,
DMAengine registration unwinding, LCLA allocation and probe error
unwinding, runtime PM and IRQ registration, device tree memcpy channel
parsing and validation, validation of logical channel and event-group
indexes derived from dev_type before writing into lookup_log_chans or
touching phy_res, and duplicate DMAengine debugfs names when several
DMAengine devices share the same parent device.

The method taken is: whenever Sashiko complains: fix the bug it complains
about if possible.

This has been boot tested on the Samsung Skomer device.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v2:
- In patch 1, complete the failed-start descriptor through the normal
  tasklet path and drop the runtime PM reference instead of freeing the
  submitted descriptor directly.
- Add an IRQ fix to avoid register access when DMA40 is runtime suspended.
- Add a probe ordering fix so DMA40 hardware is initialized before DMAengine
  devices are registered.
- Add a probe unwind fix so DMAengine registrations are released before
  freeing IRQ and LCLA resources.
- Add an LCLA allocation fix so __get_free_pages() and free_pages() use an
  allocation order instead of a raw page count.
- Add a probe unwind fix so ESRAM LCLA mappings are not released with
  free_pages().
- Add a device tree parsing fix so memcpy-channels cannot overflow the
  memcpy channel array.
- Add a dev_type bounds fix so derived event groups cannot overflow phy_res
  or the priority/realtime register window.
- Add validation for fallback memcpy configurations so memcpy-channels
  entries cannot bypass the dev_type bounds checks.
- Add a DMAengine debugfs naming fix so drivers registering several
  DMAengine devices for one parent device do not trigger duplicate-name
  warnings.
- Link to v1: https://lore.kernel.org/r/20260820-dma40-fixes-v1-0-5e14815ad689@kernel.org

---
Linus Walleij (13):
      dmaengine: ste_dma40: Fix failed start cleanup
      dmaengine: ste_dma40: Check runtime PM in IRQ
      dmaengine: ste_dma40: Init hardware before registration
      dmaengine: ste_dma40: Fix DMA registration unwind
      dmaengine: ste_dma40: Fix LCLA allocation order
      dmaengine: ste_dma40: Fix probe LCLA free
      dmaengine: ste_dma40: Fix probe runtime PM disable
      dmaengine: ste_dma40: Fix probe IRQ leak
      dmaengine: ste_dma40: Fix memcpy channel parsing
      dmaengine: ste_dma40: Fix logical channel bounds check
      dmaengine: ste_dma40: Fix event group bounds
      dmaengine: ste_dma40: Validate memcpy configuration
      dmaengine: Use unique debugfs names

 drivers/dma/dmaengine.c |  21 +++++++-
 drivers/dma/ste_dma40.c | 126 ++++++++++++++++++++++++++++++++++++------------
 2 files changed, 113 insertions(+), 34 deletions(-)
---
base-commit: 0d995da5fb97e8c312834575604d4423eb6225b7
change-id: 20260820-dma40-fixes-b99af66002bf

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

