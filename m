Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794800608;
	b=ueBMAVtcN8d6g0cOfHTGrwS6YGVjxVZNGnLiu+x3BL68ahla8oD+ndxQIrCEa8HwwECr
	 18gfugbhY3hO6hn3c67dCjtCiFbw9eXVcYz50c7RAHLhzEBQNvYHVGW0koSYJHh7cXPRD
	 cF58wKP5gF4gpNjSps1MLyMI5t4QBCM7lS+9Wp5aGqPDNDuDtu2XiZQIOTpJmxn5TeNJb
	 1PXzLiNKvCqw2h3W7XI+kx7cj+NUZqZ4KcSO1sbcfftMC538kMLZIboDHu1vfTWymqmbE
	 fAnsCMoCozwPSuThI5nKgT3f7PftiwYurBrrpQSwDnGEP8PIPjaRg+B3GnBQm1m6lTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794800608;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=diVBD2VkmpnO19+y6uxOj++Hyp7pmtKu+pacPLZU/Cw=;
	b=aMm6gUP9AtBymW0vAz+AODZoTsfHSf/owwEWzMZgz1qWP7mDnNALu2a83x1T7hOoscMw
	 sUXsEZWx580KH44jCDfpgz4KcOQazFG1cGbkTILIxsUsN/K2Gc0j0ztZ2si2/pXfPoLtA
	 KGIWrApsc8YaSeTRFxlSb+MQieN45rnOtdJKWtLn2wkYUyroy6tQCyfmgLyfrkzmLwPHh
	 olZsYnZGKc9MLJUEq6q/N+yNgNWJN3EkegMzcgeQRRZhPnHDUC1ikr1P7WgL49eBiiwcn
	 kXyEIsZoAOiI7V51YhOEzUHefo+gW10WVewvCL5YtXCVhv2aJiAxRBnT7TTOIvoT6PQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=El4XI0+H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD68606A338;
	Mon, 16 Nov 2026 03:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=El4XI0+H
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794800608;
	b=Lj2qjQpicMho/FuicI+td2RWZLNob0pYfmIo23BoH6Ug6RXRxHqZq31VGuV8YGWtBB5L
	 r4ekJZkCUYmmJML3DzcdMkcAkYHyhJtHtQ63RQU8YKOrQjfw9fjoE7SQgSiBwjgzE18By
	 6VDXGGued96Mv893SFzVyBfh/wo3GgBocb6C2uuDyPnyHylhWpN2AOnHkGgYNTVZHnjSU
	 3po/UbVOciu/YB3XHLN4Ni4gaiiOHyhSoW9LBEKsGqO8Od2H2T4rx1EgJCkzXp/KMN6hz
	 Ij0enwUYr69Bwp2itHRiXu3q6jZsj4rrW2BS+EAd7Qy+tLHK5JhPtD9jRqbES05yn+g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794800608;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=diVBD2VkmpnO19+y6uxOj++Hyp7pmtKu+pacPLZU/Cw=;
	b=ASGeUkrXgcW+EdKuzYoc/8QcYQHBgdGMMUG8lcRvkytHdQQ96Ky/PTlXzcxukyG8fwjq
	 m1oXMHLkiioK3MPtC+9tB87a4W+OV0l+n3iQqZHeAqSsk3GZsUp1sfZrUBAzpE2mdTuAz
	 cEMim0BDkpeU4kP3un8QOfta5L1yhsGuJ1htRvXVvixQXJCXGuE6yJ2PkAK8eJBL6zl3+
	 8Oy60ZI+PGCEnd6nUh5LLtNa62mlLgojH6KJjJKPFkK2egHyQFH8q1FozHJVpwnK/dqJt
	 +/Hph9CPO5ZVRRj+vQZm49/r335jTYNYyBkD0Td/lfrb1+Kge0heCoLEWIsdPjN7iMQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DDBE61F000C6;
	Mon, 16 Nov 2026 03:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794800608;
	bh=diVBD2VkmpnO19+y6uxOj++Hyp7pmtKu+pacPLZU/Cw=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=El4XI0+H4/0Z2fOo71sLC1cwiWfp6vvT1EJhuzMaNu/nuxBnCWldn8yuertPCaqc4
	 w1HeWKqEeVr3JtuIIXPKVmxfnUXwsMgdrV4YUPrbSoKz3Ki6E2QWGwBJKuvD+cMst4
	 EFr1N/W+yfXuB+3eMcTfPJZn0NsEAWeHXqFx3ftYhs9vTTVc2+zSXfvwkvsz4z+pfl
	 3H9HUzR9i+626z9To7C6j2/eKg/wwbbT8ICx9aA7ZOmf8r6IIAOQlTWQYZRhGYLzpT
	 NhEc1Ae2rNcO47noegqJL8Wu3SErIEFjIYUh/Cgdx3I/R6mPtkIJEMQjQ+bObffrl7
	 K+DkgRzq+S8qg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3EACE4A2F7;
	Mon, 16 Nov 2026 03:43:26 +0000 (UTC)
From: "Jeff C. Jensen via B4 Relay" <devnull+kernel.nullptr.com@kernel.org>
Subject: [PATCH v2 0/3] dmaengine: xilinx_dma: Fix AXI DMA descriptor ring
 ordering
Date: Sun, 15 Nov 2026 19:43:03 -0800
Message-Id: <20261115-xilinx-dma-work-v2-0-681ed00c15a1@nullptr.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMd7+moC/3WNwQ6CMBBEf4X0bLXdqBBP/ofhUOgWNkJLtogYw
 r9b8OzxZebNLCIiE0ZxyxbBOFGk4BPAIRN1a3yDkmxiAQquWgHImTrys7S9ke/AT3l24IzNi9z
 qi0jWwOho3hcfZeLKRJQVG1+3205gasiffpUUtxTHwJ/9f9Kb9P9q0lJJUM6gAcxNoe7+1XXDy
 Mc69KJc1/ULbWVOS88AAAA=
To: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
Cc: Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Suraj Gupta <suraj.gupta2@amd.com>, 
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
 Alex Bereza <alex@bereza.email>, 
 Folker Schwesinger <dev@folker-schwesinger.de>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Jeff C. Jensen" <kernel@nullptr.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4922; i=kernel@nullptr.com;
 s=openpgp-2026; h=from:subject:message-id;
 bh=WTb0MFnOjuP6hNkB2z/k2TJHSECjZrXnGDk81ZRc60c=;
 b=owGbwMvMwCV2439B4wpuQQ7G02pJDFm/qu9KRV5e3PbCd0H5Jr1lqsfdtHZF+ZzzSfCYJyx1S
 enIK37pjlIWBjEuBlkxRZbjx6btzLf1ryuqvl8FM4eVCWQIAxenAEzk3keG3ywSPy3Zzx5im7f+
 sT37idld33qebLrUM8my4Hy46ucXdS0MfwWVnl+4FZ26OXLt3DvCtSVnHWbxzjhV22G7cL3T586
 GudwA
X-Developer-Key: i=kernel@nullptr.com; a=openpgp;
 fpr=C7C696B96F3D4F7E727BDF7AD8FF7081A80B1108
X-Endpoint-Received: by B4 Relay for kernel@nullptr.com/openpgp-2026 with
 auth_id=1265
X-Original-From: "Jeff C. Jensen" <kernel@nullptr.com>
Reply-To: kernel@nullptr.com

This series fixes descriptor handling problems in the AXI DMA driver
that I ran into while streaming from programmable logic into a single
S2MM channel on a Zynq-7020.

Patches 1 and 2 are small fixes to the preparation paths. A transfer
whose entries are all zero length built a descriptor with no segments,
and the cyclic period count could be truncated on 64-bit builds.

Patch 3 is the main change. The driver hands out segments from a free
list, while the engine follows the descriptor ring in pool order, so the
two must stay in step. Commit cee9c863ee68 fixed one way they drift
apart. The Sashiko review of that commit [1] pointed out three more, and
patch 3 removes them all by allocating consecutive ring positions
instead of free list entries.

The series is based on v7.4-rc1, the dmaengine fixes branch at
6628e7d4c6b2, and builds on cee9c863ee68 and 7ed1e3070c9b.

Testing
=======

Every patch builds for arm (multi_v7_defconfig) and arm64 (defconfig),
with the driver built in and as a module, with W=1 and sparse, and
passes checkpatch --strict. I tested the series on hardware as a
backport to the AMD vendor kernel, described below; the patches as
posted, against v7.4-rc1, are build-tested only.

The backport ran on the AMD 6.12.40 vendor kernel together with
aa99c4d1d63b, cee9c863ee68 and 7ed1e3070c9b, and with 38433a6fdfb7 so
that the patches apply as posted, on a Zynq-7020 with one AXI DMA v7.1
S2MM channel: scatter-gather, 32-bit, no DRE and the 512-segment pool.
No client in these tests uses the dma_vec path, and the vendor kernel
lacks 607869003479, so the dma_vec path and the transfer chaining that
commit adds are build-tested only with these changes.

 - A test client streamed 640128-byte packets at 80 per second from a
   pattern generator, refilled the channel from the completion callback
   and from a thread on the other CPU, and checked every sample. Two 60
   s runs passed, each running out of segments about 15000 times. Cases
   for pool capacity, a zero-length scatterlist, the buffer-length
   boundary and cyclic followed by slave-sg also passed.

 - Our production client streamed nine sessions, more than 160000
   packets, with every sample checked on the receiving host.

To reproduce what patch 3 fixes: without the series, the test client ran
for 10 minutes without an error, both on the vendor kernel with the
three backports and on the vendor kernel with aa99c4d1d63b alone. The
windows are small, so I added a test-only 500 us busy-wait between the
completion callback and the free in xilinx_dma_chan_desc_cleanup(). The
test client terminates the channel once at the start of each run while
packets keep arriving. On the vendor kernel with the backports, all
three 20 s runs failed, one with a DMA internal error and two with the
channel stalled. With patches 1-3 added, the same three runs passed, and
so did one with a 2000 us busy-wait. I could not reproduce the
partial-preparation case: the test client serializes its preparations
against its own callback, which leaves that window open only between the
callback and the free.

Not tested: MM2S, two-channel controllers, CDMA, VDMA and MCDMA.

Known limitations
=================

 - The AXI MCDMA pool keeps its free list, so the terminate and
   partial-preparation problems remain there. My design does not use AXI
   MCDMA, and I did not test it. Extending the reservation to MCDMA
   would be possible future work.

 - The other two issues in the Sashiko review, the chan->terminating
   race with submit and dma_run_dependencies() under chan->lock, are not
   addressed here.

This series was developed with the help of Claude Code, an LLM coding
assistant; I reviewed all of the code and text.

[1] https://lore.kernel.org/all/20260817094004.A74621F000E9@smtp.kernel.org/

---
Changes in v2:
- Drop patch 4, which withheld an engine whose reset did not complete,
  and RFC patch 5, which recovered it: a reset timeout most likely
  means a hardware fault (Frank Li)
- Rebase onto v7.4-rc1 and collect Reviewed-by tags; patches 1-3 are
  otherwise unchanged
- Drop the Assisted-by tags after 1e035297ffda ("docs: remove
  Assisted-by references"); the cover letter states the tool use
- Link to v1: https://lore.kernel.org/r/20261022-xilinx-dma-work-v1-0-20faea2e7a80@nullptr.com

---
Jeff C. Jensen (3):
      dmaengine: xilinx_dma: Reject transfers that map no data
      dmaengine: xilinx_dma: Fix cyclic period count truncation
      dmaengine: xilinx_dma: Allocate AXI DMA segments in ring order

 drivers/dma/xilinx/xilinx_dma.c | 285 ++++++++++++++++++++++++++++++++--------
 1 file changed, 232 insertions(+), 53 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261022-xilinx-dma-work-4f2fad787d15

Best regards,
-- 
Jeff C. Jensen <kernel@nullptr.com>


