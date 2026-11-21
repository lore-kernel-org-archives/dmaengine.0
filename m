Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795295105;
	b=jGRc9OHBcIU5p5h9CKR81rvWuA222V7dEeE7WoTCQ9H0Jh74kIawFTtHWf2bq3OZtzeQ
	 yp3OxdMpLcPe8OMsBWUOpt1rDnwDZiqKLeabl9uKwe3fwCf42ro2tbz1ScicoHg6gta4h
	 Q5LX6R9QOmjUI9nHqvXFd+HgTFRZ1irfk8U2zVbWIMNWazSEzR35m9PFwDCJuK3MJNM/0
	 Wf3otjC9cEEdoKvUYJPq/ELVFttAnT41DOyEXsYF7MGkb0OXXEgfhCH1W4m6xV3ZiEKa/
	 cz0qxusUmOx+DXN9T7ihDF5wPEM9NN6vQ5kcKk3+BpYNK++jEhon5Q91gzPQtL09TrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795295105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=9R80EkEnaVnqpqhb4C1kcXOdf2oKspDwr3oTDl/Nwbs=;
	b=O/CdEuk9CHeGIm3yWyJi4OcMgXXgVFLUWEMWjtVLaGjxnFqUrRilxOeTeMPH3zkfJ5Lv
	 a/cV94dNVpybXA/DsXhDhBEoWJLpnndsDD6JFmwzsVgQAE7xnNVUJfodOxMcgDANtKDOO
	 slK5QmnnxgUfvN7HRtnKblxI9wwXkIjiRPz/l9tdzGtgKgnl1Atq/YhFx7hUFKlRgriIe
	 Je29vb7NS42c8UNqsmJRp70sN+Rx56oXLpNSj6FF8OFpwZB8e9MHvjUx9tGBzuqj5bxph
	 DTQYNkItRSuzVumQXQmF7ARRyuTMna3yBKxyGHVPQPUEWe3kDIC9Bxb/a+Dkfnbr7FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MyiKM8aI;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4385E606A320
	for <dmaengine@vger.kernel.org>; Sat, 21 Nov 2026 21:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4385E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MyiKM8aI
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-703be215729so894815eaf.1
        for <dmaengine@vger.kernel.org>; Sat, 21 Nov 2026 13:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795295104; x=1795899904; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9R80EkEnaVnqpqhb4C1kcXOdf2oKspDwr3oTDl/Nwbs=;
        b=MyiKM8aICjcRwpmXUnz1+2FA/Vheq1fuXJWsb+NqMjcT87STxTXq6mN0wCNNhRm/pB
         3hBQqKzXLJgi82/OVJZP2/2ww4Nr9CUVrKIESlWA/hiA/z9LGr+innGcjtzxPQHykkfk
         TimzsrqTkM/cKQ5H9NCYKsECT3Y80emcfJyE9zktqmTSbzM5bO+Xva4ZYJvKnkLb3lfC
         lTUXGTtCnMn3bjaSmd6mPFxl75aGvMT5inCPF2mPCukhXnWsSrWliWtrl/mVh5I56Gi5
         d8U0yQ1NRwtHc/jPn2zyG3PookCWLdmV1edZQ0Owqzw2X9PWCGImlgjk/mnX2Lwfsvtv
         7IIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795295104; x=1795899904;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9R80EkEnaVnqpqhb4C1kcXOdf2oKspDwr3oTDl/Nwbs=;
        b=tMFlaV3apFQtVwussOEnMBcMz0051JJipkKtyfe/z+KwFxRmyt0CVXt61BT/+G5xeu
         myv98h9/dJFWPi4zX8qzkeHYlohgIkpSpijjBY+s4Ae2Z77Ivt0T9YnOv/wxWx/b70gK
         FMQAAP7dzow6KKYxNp6yHSopB5CeHR3TQ72pgEIutIJky5gtqjbLDvwDxQSWLjTmz614
         AwDU8kxLy0i13/BXA1sXglcWLdXt1Kcb6qFDEixe+SWUBFg4WppCSLCCPmQ8owNJyoaF
         9Y7RBa76dwKYKzesO9anUssDngEo2HOpnJQ5tTv/YLNGWxYsw4W7oY9UDsjHEVD5jHva
         9WVg==
X-Forwarded-Encrypted: i=1; AL+hErG7tVsAJLJA9NgbsrVaIDPBu3pEwWz32+G+IkT4e5SZ1sEP/IZj03k521PG+rwq2KOeyADu8hnsyo0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8g7K5Xgn+G8tLI+hEpqsCIMhkhw757U1mv+XCifYKoHP84SMBK
	ia2HhdNRh/XwVCXz3cUXjl9cRe//v71Nkob0+6b5kVcGLH0uJRcMQ713
X-Gm-Gg: AZFdTZem0NhaRoB6ce3PRE1Sh4JZTfCQ3A8Sawfjx5Nxo+a4XagFQrOM0P+62jZUk/X
	BN1j27DGhl0qnTfgSSDErFY3bTeO/JpGjOsdqEVQO1NkZkIJiEq5WpS8JexMDGTKsJFcf91WrgI
	wb5TqmWSRQ5xpklgjj5L6uQejFwFA7sZhySgYpBugW3dzsgttQQ5zNHRjTy/hj0rX5atkzaWjFp
	xsYL5RDOiqHwsPyFsVLPMpsbxZlaJ80nVeYyo4GSnDy6qyJ4YxYRksV+oCIA+t1UqdfLoKCzfFs
	anZpxmSDiPGkpHIl2dc/8GusiCoiIb4zjjVclFSa4f6gPRU4IonocBdHP1y+QtlGBZu87l14N8q
	CXGxGywoQ3lnf1sR/eqjyXaT5JyEdYgYZSuOPXnS4XefvAypsWDkdbb6+6rJtdKWGoJzRY71TKX
	1zsCLH1n96M37THNdmxmta+azx4SzCvtM7qOK98uPoF27Fj8J+kn/E//jo8+QwVdVXSB+vYIL9k
	S4VQFr98IEZfWE25BA2pYxKn5N3A0VTeZ39fwZXVu4c2lXXHgeVjISRP75K41ALT0vXtHGMvLwO
	yXDH/Plz4+rUKU90jVQCHfEeF6ETkWlNcC0brhO8A9TQyxCOm+rcHWnjqbv0ii67X3XXHn7IEda
	XlXYCPiytFvLW2u0gL93koORT5QYoVfAgTKZS1gNNogvfZDHZGIaftDI6GoTlrdIcineZ4TG0u8
	75TvSmgaKbVLBBU0spHOcJ1uXYb24wgibHQa0CA61EQqN5TmJXT8Om
X-Received: by 2002:a05:6820:1387:b0:71b:1d8c:af83 with SMTP id 006d021491bc7-71b39038c51mr5618931eaf.0.1795295104007;
        Sat, 21 Nov 2026 13:05:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm4635728eaf.13.2026.11.21.13.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:05:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v12 0/7] dmaengine: dw: serialize completion and
 termination
Date: Sat, 21 Nov 2026 14:03:15 -0700
Message-Id: <20261121-submit-dw-dma-synchronize-v1-v12-0-f51eb635209d@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43TzU7DMAwA4FdBPRNI3Pxy4j0QhzRxtiDaonYUx
 rR3x90ORN0hSLnYsj85f6dmxinj3DzdnZoJlzzncaBAwP1dE/Z+2CHLkRINcNCCg2DzZ9fnA4t
 fLPaezcch7KdxyD/IFsFQKZ6kSVFE3xDxMWHK3xf/5fUaU/8bhsNqrhWdn5F1kydmTZGJwy4P+
 Hjto4p9ng/jdLyMuIhV+ucwtATTPlkVIOqk3fOu9/n9IYx9sw6zQIlBBQPGmQIp0ckYvA1brC2
 xtoK1hAUNXeLSJhVwi8kScxVMEpbQS2miS2DVFlN/GGkVTBEWW+DGKJu6dHNmusRq29SEASIPr
 bQAMm4xU2BCVTBDmI00VRulw1vMlpiuYJYw6S29C5lCFH6LuRIzFcwRZmLgWmPkXUhbTPBSq12
 n4MS13rRGOeN5FDdc8QkE8BoniHOdE1p3AUIwJXc+n38BRE2EmwMEAAA=
X-Change-ID: 20261021-submit-dw-dma-synchronize-v1-e550f47fd1da
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.17-dev

Use virt-dma for transaction ownership, deferred client callbacks and
per-channel synchronization. Keep DW hardware event processing under the
same channel lock, including polled completion and software-LLP progress.

The first two patches serialize completion and error recovery with
termination. Patch 3 moves the DMAengine channel and its lock into an
embedded virt_dma_chan. Patch 4 switches the descriptor queues, cookie
accounting and callback delivery to virt-dma. The last three patches
extract hardware-LLP residue calculation, move it into the status getter
and report residue for queued transfers.

Status polling can complete transfers without invoking client callbacks in
the polling context, while synchronization waits for callbacks already
running on the selected channel. Both status polling and result callbacks
report a bus error with the number of bytes not confirmed at the
destination.

Each whole transaction has one virt-dma descriptor. Its child hardware LLIs
remain owned by the driver and are freed together after the callback.
The controller tasklet continues to process hardware events; virt-dma
handles client notifications. Submitted transactions become eligible to
start at issue_pending(), and residue lookup covers both submitted and
issued queues.

The series builds on Serge Semin's channel-restart and callback work
[0-2], using virt-dma following Andy's review [3].

Based on dmaengine/fixes at d460a02aa0ac.

[0] https://lore.kernel.org/r/20240911184710.4207-1-fancer.lancer@gmail.com
[1] https://lore.kernel.org/r/20240911184710.4207-2-fancer.lancer@gmail.com
[2] https://lore.kernel.org/r/20240911184710.4207-3-fancer.lancer@gmail.com
[3] https://lore.kernel.org/r/avrHOJ-fVZOO32bI@ashevche-desk.local

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes in v12:
- Skip channels without pending transfer or error status before taking
  their lock in the controller tasklet, following Sashiko's review.
- Link to v11: https://patch.msgid.link/20261120-submit-dw-dma-synchronize-v1-v11-0-9b9166bc2cc7@gmail.com

Changes in v11:
- Credit Frank Li for suggesting the preparatory channel and lock split.
- Cite Serge Semin's callback fix and explain why status polling still
  processes completions, following Andy Shevchenko's review.
- Rebase onto dmaengine/fixes at d460a02aa0ac. No code changes.
- Link to v10: https://patch.msgid.link/20261119-submit-dw-dma-synchronize-v1-v10-0-3a737597a0d1@gmail.com

Changes in v10:
- Split the channel and lock member changes from the virt-dma descriptor
  and callback conversion, following Frank Li's review.
- Preserve the bus error and unconfirmed byte count for both the status
  getter and the result callback. Reserve error storage during preparation
  so submitting a prepared transfer cannot fail.
- Use the DMA core's existing callback drain on channel release.
- Link to v9: https://patch.msgid.link/20261117-submit-dw-dma-synchronize-v1-v9-0-7dc066ed0bcf@gmail.com

Changes in v9:
- Simplify the software-LLP residue calculation and remove unnecessary
  braces, following Andy's review.
- Link to v8: https://patch.msgid.link/20261116-submit-dw-dma-synchronize-v1-v8-0-4a82d64fcd1a@gmail.com

Changes in v8:
- Replace the private callback-deferral and synchronization patches with
  a virt-dma conversion, following Andy's review.
- Place the conversion after the completion and error-recovery fixes,
  incorporating cookie ordering, completion-list cleanup and channel-release
  draining in the same patch.
- Keep residue extraction, status calculation and queued-residue reporting
  separate, adapting them to virt-dma's active, issued and submitted state.
- Use per-channel virt-dma callback draining while preserving polled
  completion, software-LLP advancement and controller-tasklet exclusion
  during resource release.
- Keep child hardware LLIs under a single transaction descriptor and
  distinguish submitted transactions from issued work.
- Correct the residue-calculation and queued-residue Fixes tags to identify
  the commits that introduced the affected paths, following Sashiko's review.
- Attribute the cookie-completion and channel-release fixes included in the
  conversion to the lock-splitting change, following Andy's tag review.
- Link to v7: https://patch.msgid.link/20261115-submit-dw-dma-synchronize-v1-v7-0-8d58f3d49e4d@gmail.com

Changes in v7:
- Use a scoped channel-lock guard in dwc_tx_status(), following Frank's
  review, keeping polled completion and residue lookup in the same scope.
- Collect Frank's Reviewed-by tags for the residue and completion patches.
- Link to v6: https://patch.msgid.link/20261103-submit-dw-dma-synchronize-v1-v6-0-2ee0c348224d@gmail.com

Changes in v6:
- Keep dwc_get_hard_llp_desc_residue() next to dwc_get_sent() when
  converting it to return residue, following Frank's review.
- Remove inherited RFC notes from the individual patches, retaining
  the revision history in this cover letter.
- Link to v5: https://patch.msgid.link/20261102-submit-dw-dma-synchronize-v1-v5-0-d3207758fbf9@gmail.com

Changes in v5:
- Rebase onto dmaengine/fixes at 6628e7d4c6b2, using the shared
  dmaengine_chan_dev() helper for channel logging.
- Split residue handling into a behavior-preserving extraction, status
  calculation, scanner simplification and queued-residue reporting,
  following Frank's review.
- Share completed-descriptor freeing between the tasklet and channel
  release, retaining callbacks for normal completion and suppressing
  them during teardown. Name the helper dwc_free_completed().
- Carry Frank's additional review tags and put the submitter sign-off
  after the review tags.
- Link to v4: https://patch.msgid.link/20261029-submit-dw-dma-synchronize-v1-v4-0-fea447d9f285@gmail.com

Changes in v4:
- Split v3's callback-deferral patch into cookie accounting, residue
  calculation, channel-release draining and callback-deferral patches,
  following Frank's review. The resulting seven-patch series preserves
  v3's final implementation.
- Place device_synchronize before callback deferral so clients can drain
  deferred notifications when the completion list is introduced.
- Carry Frank's Reviewed-by tags on the unchanged channel-completion,
  error-recovery and device_synchronize patches.
- Link to v3: https://patch.msgid.link/20261023-submit-dw-dma-synchronize-v1-v3-0-c62bf048f5ce@gmail.com

Changes in v3:
- Order channel-completion and error-recovery locking before callback
  deferral, retaining four patches.
- Require a locked RAW.XFER event before retiring a transfer; zero source
  residue alone cannot establish destination completion.
- Preserve polled completion and software-LLP progress in tx_status(),
  queuing client notifications for the controller tasklet.
- Serialize cookie updates with termination and report queued residue.
- Drain deferred notifications on channel release and let a pending
  tasklet return without MMIO after the last channel is released.
- Adapt Serge's two patches and retain his authorship and revision notes.
  Drop the Tested-by tags that covered their earlier implementations.
- Identify the introduction of the synchronization API in the final
  patch's Fixes tag.
- Link to v2: https://patch.msgid.link/20261022-submit-dw-dma-synchronize-v1-v2-0-5244e94dca8c@gmail.com

Changes in v2:
- Carry Serge Semin's two posted fixes before the synchronization change,
  preserving his authorship and revision notes. Add the requested stable
  Cc trailers and Andy Shevchenko's Tested-by tags to those unchanged fixes.
- Add a separate error-recovery fix for stale error status, empty channel
  lists and software-LLP state when terminating or restarting a channel.
- Use tasklet_disable()/tasklet_enable() instead of tasklet_kill() so
  synchronization preserves scheduling requests from other channels.
- Explain descriptor ownership during termination and acknowledge the
  shared-tasklet scheduling race reported by Sashiko.
- Link to v1: https://patch.msgid.link/20261021-submit-dw-dma-synchronize-v1-v1-1-6af85c2d6f69@gmail.com

Revision history from Serge's series:

Link: https://lore.kernel.org/dmaengine/20240802080756.7415-1-fancer.lancer@gmail.com/
Changelog RFC:
- Add a new patch:
  [PATCH 2/2] dmaengine: dw: Fix XFER bit set, but channel not idle error
  fixing the "XFER bit set, but channel not idle" error.
- Instead of just dropping the dwc_scan_descriptors() method invocation
  calculate the residue in the Tx-status getter.

---
James Hilliard (4):
      dmaengine: dw: serialize error recovery with channel termination
      dmaengine: dw: embed a virt-dma channel
      dmaengine: dw: use virt-dma for descriptor and callback ownership
      dmaengine: dw: report residue for queued transfers

Serge Semin (3):
      dmaengine: dw: Fix XFER bit set, but channel not idle error
      dmaengine: dw: extract hardware-LLP residue calculation
      dmaengine: dw: calculate residue in the status getter

 drivers/dma/dw/Kconfig  |   1 +
 drivers/dma/dw/core.c   | 597 ++++++++++++++++++++++++------------------------
 drivers/dma/dw/dw.c     |   2 +-
 drivers/dma/dw/idma32.c |  18 +-
 drivers/dma/dw/regs.h   |  35 +--
 5 files changed, 335 insertions(+), 318 deletions(-)
---
base-commit: d460a02aa0ac6ba9e5d87f8462f75d78be83146e
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git fixes
change-id: 20261021-submit-dw-dma-synchronize-v1-e550f47fd1da

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

