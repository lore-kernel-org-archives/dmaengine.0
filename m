Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5A33BED7A
	for <dmaengine@vger.kernel.org>; Wed,  9 Sep 2026 19:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982650; cv=none; b=SGOqhzFfx3uUx//VYcUF1hZITHoYEguiBfYGNSfA4e+UiUsd4mmiBTCEVTGEiEmUtJ7TSsi/y8PmdnUXIVCYt32ob8plMG1Kw5dfNVCs8uMZlLz3rKLfrRO4Fxll8MdhASvqGW3TIew3CAtHs2ECOCKdHEILI5/0+1IWEL3SIVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982650; c=relaxed/simple;
	bh=W6elITVW+fgqHlsz574xVSedWEx1ljCkHQGGPON+6dA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=boxsEbIfuYpYfaqRqHFsq4oeTdsoYyzu46ksji8vGpL2l3UH3SiIVwgxhxnFUDMjAgHnE/fG+1Cr/mPfKPK7ZfP7nL4pNeVFyRsPk7ySZVP5vDLW4urQ03gWKDZugI9wWZeT9/RREfR9ocDblCRZP1xQxwY3Ldux4FaVEmjTcz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jSlz83Sg; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSlz83Sg"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd6185db7so15413635e9.1
        for <dmaengine@vger.kernel.org>; Wed, 09 Sep 2026 12:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788982646; x=1789587446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0uOGw37DdE82nU6QUlJPa/gKDAK3HdlyhewoX5a9k8=;
        b=jSlz83SgvXKlNYn4ZYygcu7NmKRFIOgCuVePzFHygumIc/S8jbGEBt5lvcx0hAvpgS
         /jvZtd+dqslGSngyZjjecXrtbZmiHOCzMB+o88eq6uOVLl4w03HVnx2KqQtEpv0WfNzq
         Onuuzq5IBssGT2J7Bw8teZcafDYuvvEHwxWFegwUapd4fVJI+4yKIs0YdM5Jbprd/iDU
         LvuNqRYnldwSRI0/3j2nXBFvghgsFzTT6Gp6IAUirswqjb3cbhtcPpxkVj/S9Tji1UJ+
         VjR6UanDcRPGcqmIkdEl3s6AuHMyrw5SsK8hH7MYconpLR8ArIU7IGty2lXdRCT0fC+Q
         P/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982646; x=1789587446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0uOGw37DdE82nU6QUlJPa/gKDAK3HdlyhewoX5a9k8=;
        b=m/CW7eJYXz8+iOpPZLt3XrGDqxSRA2qS12Y8RCl0XiomCZOCUajrVdRhuS+CL8Yi9Z
         UjkE0AX1/cJAu63OCtd2ht7puZlR+mid/iXFuF2wjMdGfvw+oQuAF+OMWVxTZefB90jJ
         b7atCkiJarxlo604mQwrdtdg4N+cBDjceQVGlo6uq2baCKVi/tElp0Ib4Cz5KJEHuV6Z
         m5NUaYgE4Xd+UhSr43kEcVU5vE/CbklWjXCQjpUURkIub9LKfrbA1vD1UwxqoOLVfUb/
         yJC1luGqI6fjHBEPXG5RngxsxTkMLQ9eTYyV/2ghQJtc012rOgt52luweloh94bPGFwa
         So0w==
X-Forwarded-Encrypted: i=1; AKwUvBwZYPJvsFk1CvCVVFa0Uwi5g3lJE+1M2UwnIWJJjUUt03Omm67d5JKWJV/RN6jpYRhFAf2RP9YZM9U=@vger.kernel.org
X-Gm-Message-State: AFuF++nUv7YKuqi9xp8YYC5IoQxYqGK4ixMbiZrogHvjTFvnlOVvrERu
	OcooOzStn9AXYtiHiwCzqrQh2ny9hPhUBPzX1dc5w4dh67dSGHNM6UVF
X-Gm-Gg: AYBFou11zUiR1vghfTqVJ432ykkMHytJxfKxLrbPgr9uNec1lvS9U2svaHKJspMzkhh
	Qr+dQbSfAumeYNj1ErA8kT+yI6vd5n8NXX5SXl28qIuzWVHvLFMOAXLof/axrwNw1uVFx4QlINh
	N/wXp8RLto/XuzoGcZfGgBoDljfFHtSFqlxfba0dNTo9itZpWawwxHRKM0PV+ywAXBlyeE91QpT
	nuta5Kr2D3zH3jXn1WaJOL+pWhOlhrZeBfFY9ib1J8QvCHzj6CYNc/oXZKAWb0JFB67bwJBilbq
	K+5ZKSkFSQuKWsJ7S/28U4Z9zagzeVvONz8niufDtNlSy8sdKkMgFjAPith+iYPZYOftbwU12p0
	VFV0+XaYideNM6JvOYSeWSSBMmQ/5aJEuc15TQsv7PEJOPKZBucSei8D1GQgY08y8vorOOHw3Bt
	3rrhWeKyA3D2wTYkzw3WvNof+4ocvhiFOb5mU7KgiQO9vkhAg4HYSjs0gCxOXK7Gc8LIuQhXz7u
	86rX9wT+aixbQIkwqM5vj99HANczDNDVcI0r0wesYazRt3NscVjlIXrhgXt7bzrWouyKGoWuJWw
	auFG2Ga/3w==
X-Received: by 2002:a05:600c:c4b8:b0:49c:f13e:e52 with SMTP id 5b1f17b1804b1-49d26dcbc5emr9770855e9.15.1788982645812;
        Wed, 09 Sep 2026 12:37:25 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:d357:e592:d56c:d3b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be64a5sm13123995e9.6.2026.09.09.12.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:37:25 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 0/3] soc: renesas: Add address extension support for RZ/V2H
Date: Wed,  9 Sep 2026 20:36:36 +0100
Message-ID: <20260909193640.8069-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series adds support for the SYS_AOF (Address Offset Function)
address extension mechanism on RZ/V2H, and enables it for the SDHI
internal DMAC so SD/eMMC DMA buffers are no longer confined to the
low 4 GiB of physical memory.

Background
==========

RZ/V2H contains bus masters (SDHI, USB, GBETH, VCD, DSI, LCDC, ISP,
DMAC, ...) that can only generate a 32-bit address on their own
bus. The SYS controller's SYS_AOFn registers let bits [31:30] of the
address such a master issues select one of four independently
configurable 6-bit fields; the selected field supplies the
corresponding upper bits ([34:30] or [35:30]) actually driven onto
the AXI interconnect, with bits [29:0] passed straight through. This
splits each master's native 4 GiB space into four relocatable 1 GiB
windows, letting it reach a 35-bit (DDR0/DDR1) or 36-bit (+PCIe0/
PCIe1) physical address space. See RZ/V2H Group Hardware User's
Manual, Figure 1.7-2 and Sections 1.7.3.2 and 4.3.3.2.88-90,
reproduced here in text form:

                     +--------------------+
                     |       Master       |
                     |  32-bit address    |
                     |      [31:0]        |
                     +----------+---------+
                                |
              +-----------------+-------------------+
              | bits [31:30]                        | bits [29:0]
              | select field                        | passed through
              v                                     |
    +---------------------------------+             |
    |         SYS_AOFn register       |             |
    |  +------+------+------+------+  |             |
    |  | Reg3 | Reg2 | Reg1 | Reg0 |  |             |
    |  |  11  |  10  |  01  |  00  |  |             |
    |  +--+---+--+---+--+---+--+---+  |             |
    +-----|------|------|------|------+             |
          +------+------+------+ supplies           |
                     |    [35:30] or [34:30]        |
                     v                              v
              +-------------------------------------+
              |          AXI interconnect           |
              |        35- or 36-bit address        |
              +--------------------+----------------+
                                   |
                                   v
     +-----------------------------------------------------+
     |               Physical address space                |
     |  F_FFFF_FFFFh +-----------------------------------+ |
     |               |          PCIe1 - 23 GiB           | |
     |  A_4000_0000h +-----------------------------------+ |
     |               |          PCIe0 - 24 GiB           | |
     |  4_4000_0000h +-----------------------------------+ |
     |               |           DDR1 - 8 GiB            | |
     |  2_4000_0000h +-----------------------------------+ |
     |               |           DDR0 - 8 GiB            | |
     |  0_4000_0000h +-----------------------------------+ |
     |               |  SRAM, peripheral, xSPI - 1 GiB   | |
     |  0_0000_0000h +-----------------------------------+ |
     +-----------------------------------------------------+

     Four 1 GiB windows, each independently redirectable to
     any 1 GiB-aligned target above; 35-bit-limited masters
     must keep bit [5] of every field clear (1.7.3.2.1).

In case the image isnt formatted correctly please refer the link
https://raw.githubusercontent.com/prabhakarlad/img/refs/heads/main/Screenshot%202026-08-12%20162004.png

Without this, SDHI (and other masters in the same category) are
limited to buffers in the low 4 GiB.

Approach
========

Rather than hardcoding SYS_AOFn programming per board, this series
derives it from the devicetree dma-ranges property already used to
describe DMA address translation:

 - Patch 1 adds generic AOF parsing/programming infrastructure to
   the rz-sysc driver. Each SoC lists its AOF-capable masters as
   (MMIO base, SYS_AOFn index, address width) tuples; at probe time,
   the driver walks "simple-bus" wrapper nodes carrying a dma-ranges
   property, matches the wrapped device against that table by MMIO
   base, and programs the corresponding SYS_AOFn fields directly
   from the dma-ranges translation. Devices with status = "disabled"
   are skipped. Malformed or out-of-range entries (misaligned,
   exceeding the master's own 4 GiB space, or requiring bit [5] on a
   35-bit-limited master) are rejected.

 - Patch 2 moves the SDHI nodes in r9a09g057.dtsi into per-instance
   simple-bus wrapper nodes with a default, no-op (DDR0-targeting)
   dma-ranges -- no functional change for boards that don't further
   override it.

 - Patch 3 demonstrates a non-default window on the RZ/V2H EVK:
   SDHI1's dma-ranges is pointed at an 8-12 GiB DDR1 window, backed
   by a restricted-dma-pool reserved-memory region so buffers handed
   to SDHI1 are guaranteed to physically land inside the range the
   programmed SYS_AOF17 fields can actually reach.

Boards that do not override an SDHI instance's dma-ranges see no
functional change: the default wrapper mapping added in patch 3 is
an identity remap onto DDR0's native address.

Trade-offs
==========

- Attaching a restricted-dma-pool to a device makes every DMA transfer
for that device bounce unconditionally (is_swiotlb_force_bounce()),
regardless of whether the buffer's physical address would otherwise
have been directly usable.
- Each master will require a restricted-dma-pool.

Testing
=======

Tested on the RZ/V2H EVK (r9a09g057h44-rzv2h-evk) with SDHI1 remapped
to an 8-12 GiB DDR1 window, running repeated large-file dd read/write
and mmc_test against an SD card, with no functional errors observed.
While running mmc_test a loss of ~4% was seen for read/write tests as
the mmc_test module allocated the memory using GFP_DMA flag.

This series does not yet cover the remaining AOF-capable masters
(USB, GBETH, VCD/DSI/LCDC/ISP, DMAC channels).

Request for feedback
=====================
The ~4% loss above comes from restricted-dma-pool's unconditional
bounce policy (is_swiotlb_force_bounce()): every SDHI transfer is
copied through the pool, even when the source buffer's physical
address would already have been usable without any copy at all.
This is a direct consequence of using restricted-dma-pool as the
correctness mechanism for a device whose real addressing constraint
doesn't map onto the flat dma_mask/dma-ranges model the generic DMA
layer otherwise assumes.

Before optimizing this further, I'd like inputs on whether
restricted-dma-pool is the right tool here. Suggestions and pointers
to prior art for similar SoC address-extension/aperture hardware would
be very welcome.

Thanks for reviewing.

Cheers,
Prabhakar

Lad Prabhakar (3):
  soc: renesas: rz-sysc: Configure AOF registers from dma-ranges
  arm64: dts: renesas: r9a09g057: Move SDHI nodes into bus nodes
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Move SDHI1 dma range from
    8-12 GiB

 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    | 123 +++++++++++-------
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  16 +++
 drivers/soc/renesas/r9a09g057-sys.c           |   9 ++
 drivers/soc/renesas/rz-sysc.c                 | 118 +++++++++++++++++
 drivers/soc/renesas/rz-sysc.h                 |  22 ++++
 5 files changed, 240 insertions(+), 48 deletions(-)

-- 
2.55.0

