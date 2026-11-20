Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202960;
	b=Y0oREM6E69PnyQNtZxNOopcgKz3mURyZo69CLhEDiMsjK0dcesGnnNVjCtDpGKrMLS38
	 fQTf+1a8S2YV2TPC+CSDO4taZXtZDL4OqZmaah9mBmYlCt/4JBtsvh+WZSVsfY5F0YsUN
	 D/CWTpzBDk1Ef4iTOUlQf5JLkHO4KzL+4K36ENTANRRlMupDIZSSJvJTNTUV5cXCyCN9+
	 kOy+laNi+28cayT1YotyaXgVEoF6wj3gYMBGSeZv2gQ8wU1uwH44bTj479bIYVSgXFB6d
	 35JoIKFUzSzrlgtoaV0FYBc621lzzHUO2SXdFNk+sgylEmuNk3kE3rTWM5wvkyBUfhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=0gjgUrbIBW0VpAasobxwISh3VC/YeyY4O56ZQRs0+TE=;
	b=RVHHEZ2MT0/TN0HwdOBMB162vkOV/mUpzS+H7Xpu2plBxpFkANoSSer3t/+NwuU5G/F5
	 w6opcPhs7AX8qiBs41k3hwz9CNGmkSV/pZ4H+tJ+oDnv6x1ojfcN+LO5vP0eg0sR9xk57
	 IplzY3YgTzWSN+Y/hc8wLcuzGhX9Oy6YFuH3Z1htcRUQW7h+ZZCMsI2C/0f0mXYJNLEH1
	 rIsZA0Fo2NcCLSLPiXBfmOXeDufiZKw7i2ADK/eXzd+fzV84+Uqh7f0W1FO/W28H8nGqm
	 IgVQR1opI03YebiEaJFKapeHV5+nO2x4vT97NnVIUDVbBjkxzVh5MXML0gZ+5az/1Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="DLd/JlEj";
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86F8606A336
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 19:29:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E86F8606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DLd/JlEj
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-8629ef48703so731724a34.3
        for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 11:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202958; x=1795807758; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0gjgUrbIBW0VpAasobxwISh3VC/YeyY4O56ZQRs0+TE=;
        b=DLd/JlEjcXNw+9ETiOXv0EaW6MqSdaV4Oy480zLiCvrTEaZZhjHG6ACef4OcORewbv
         C2oizLjD+hSJ8JNAZNhrLD0Zb/Wm7FhgatfAF+R0I3GFBTZ+JtBgzzHIwA4mfIgXJU7O
         mx/Dm88JCZv/sH+GCCKbRLjUgWX7a7dDdbXLtQErsKPMI9Nnbpi1GOy9560ubBvmzY/H
         7Gu0t/sf1pkcPNoyDfF+upvfzZFhpHHLq6KNOcoJ1mlrBcl01VC4U++5IFcgBgNsq8J7
         A7NFkF/pGcZl+ChyNFPOisgSQp8HL3J4TZkis+RZ2xDXQkfnW2kPNRTyNDf9gjo4gA7w
         Ydkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202958; x=1795807758;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0gjgUrbIBW0VpAasobxwISh3VC/YeyY4O56ZQRs0+TE=;
        b=QOmURhjFLjBEHof1h5rLfbnSoXZ6I3xaXi5SCkes+S8gxbYWXu6F8xO+aU8F48PH4Q
         YB0SEkv4PC1K7Nf4vWYMh7O4kgm6sFbAy9+peMUP3UaXI5Wlj9BF8cLH1KYVayF7re8s
         NHyJvPbyPPTdCoqaRD2NJa7fsI+F3AyEPeTE/tYo0aTw5X0pqRlSJG0eVtoiLqnShvT9
         pleAAlEsamRNniUJmzcGuuq8gGpTD7dnRasfZXVctQ+AdS83njzTJs4K9Fgzbd5XKQC0
         MNKJEHZPChpeR1zBmN/kMUlXGwWWZkhOE3F1YLE3DMOg392l2vfxLWpjqxurBFvZXM+n
         Pgiw==
X-Forwarded-Encrypted: i=1; AL+hErE8nOZac52ZoncR0JsO+tUxH7oS28/GldBBmukH3FxiV31L+L7L8DXL4uC1WIZ20BL1kC9lR4+kC7E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JfMp1azViWwXty2CodIK6SnwoOg4eQzfELr1tRWIIHEOcOnlf
	QfyRAAOACU5uJ3/vCljv4scJwPwMsq9myODozaaS3eLUNRiVOtsnvWph
X-Gm-Gg: AYBFou08KqUOJMKeu/TYqk/kyBWaiqaW+PAbyLeiJjQ81JVvqLzpkbJO8Xc8AvbpCvu
	BOut61vvplVu62czGvvMnsF62tuL2IlhJZ9viQqagIk3ERRMijSLb1uVLlb5cuYjEBNHIvT2aAF
	GvNUTP8cGj/vAoAU7IBBxPOK1o7kZRg/LMb159oiSe+1JVFE5ezpTooPM3ohXYFQK4shC6Z5Z+v
	mqsyEz31i7kSxEAdDeXew2q5MF8wdcQFHFGJuzyD5GbDT0eRRXhVs3v2CXiYunPxRqAg6hwk49N
	tRuPoCb3A3W0EfJuvVPoicHZR5aXm0hVT2tA5JYxrYRmyzZtsiuH/sWi1MmSAmJDCaj54USDQ5J
	QCLkbH1s7vG/10qJd3tnfJzTQKelEh6sC3NVJKbETpHnIgWJ63FBogYnK2Hm/jiR4p16N+kiZKO
	vl+x2SreE0lMFIPhefdfK7TWRHjQdGM+rrKUl4cVew1aiJ/2kBVTblCBzOR4IeSTFPQk8bnuZb4
	6AqZAIev8YRdH0mdZYtl+0VPJarzGKwUPzE53tVNy52fYV+mU5sar7/bGBmTxTqrEUG0U+WUfjX
	fFjL1jFPf7pClwyKKHedvDkwn7RoYRRXoNIXGDarwT+lSfF76QnNOAvd5NEvFzCkmuFHIFw5Hcp
	U+C5guFbTJl6tAmWBboaVSGQtfWxF88iUraeXbxjPmfj8VEEgJGo1Elewv2wC4Ru243jkMT95dS
	rioojlVMm6fv5e5m6TMmoiz8x57+R+MOTLvSQ16jT6+mUs7Gw+TssEBg==
X-Received: by 2002:a05:6809:22df:20b0:574:c5e0:3d1c with SMTP id 5614622812f47-57b88274560mr643010b6e.25.1795202957680;
        Fri, 20 Nov 2026 11:29:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5f7ae7dcsm3434498fac.8.2026.11.20.11.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:29:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v11 0/7] dmaengine: dw: serialize completion and
 termination
Date: Fri, 20 Nov 2026 12:29:06 -0700
Message-Id: <20261120-submit-dw-dma-synchronize-v1-v11-0-9b9166bc2cc7@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43SS07DMBAG4KugrDHYjp+suAdi4XjGrRFJUFICp
 erdmbQLrHRhJG9m5Pn0+3FqZpwyzs3T3amZcMlzHgcqhLi/a+I+DDtkGajRSC6N4FKw+bPr84H
 BF4M+sPk4xP00DvkH2SIYas2TsgkEhIaIjwlT/r74L6/XmubfMB5Wc93RhRlZNwVi1haZOOzyg
 I/XOdqxz/NhnI6XiItYpX+GoSWYCcnpKMEk4593fcjvD3HsmzXMIktMVjDJONNSKfQKYnBxi7U
 l1lawlrBoZJe4cklH3GKqxHwFU4QlDEpZ8Ek6vcX0H0ZaBdOEQSu5tdqlLt3cmSmx2jENYRKRx
 1Y5KRVsMVtgQlcwS5gDStWC8niLuRIzFcwRpoKjf6FSBBG2mC8xW8E8YRYiNwaBdzFtMcFLrfa
 cghPXBtta7W3gIErufD7/AtYOwnO0AwAA
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
 drivers/dma/dw/core.c   | 595 ++++++++++++++++++++++++------------------------
 drivers/dma/dw/dw.c     |   2 +-
 drivers/dma/dw/idma32.c |  18 +-
 drivers/dma/dw/regs.h   |  35 +--
 5 files changed, 333 insertions(+), 318 deletions(-)
---
base-commit: d460a02aa0ac6ba9e5d87f8462f75d78be83146e
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git fixes
change-id: 20261021-submit-dw-dma-synchronize-v1-e550f47fd1da

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

