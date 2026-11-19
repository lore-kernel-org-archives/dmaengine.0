Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082548;
	b=vu17YU5mZMJ5pDubSA4Iqz6+aJWBDx1Nmfg/r/NO8tXue/v9cz3pdUW1NkPAr2YsCi8r
	 ddZQhIeJ1UfstLxCxxrt//TtOFtMTDjpHYPfCU5jfc70Et4ZPYDmckdOo1Ecb+YS+GMg4
	 S43KcY5rWfZyqsyZYM/RP2IBbyN4aQMzxz7gd0PGuTWKi8C56CRNj0A/Q+gHMC/m6UyCb
	 gp2zCxe1HiegPGcKo/jios8g5T0S827MjtF1lPEliTlHcUY6cj4p5Dvnoqy7Jt7ZaZ/Yo
	 cddt+AbKxUyV8bDiyTWcst2ZqlVO42Z+mwjseOpoFzSpzjb8hmKJtYUYpk6QzJ5bPWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=D8hYj5tsIjDvKDaCqFJ/7W6N6FqJoCQM/5nsT8oMXek=;
	b=RY+3WKxq9vN2nWId0xuYwjebfUEzvVia0pbFBtmTSRYpgyzaOUqdDU0gCaAps2l/hTsI
	 +8KKPsObBU4cVHxf5yOYaxRtflhExe8HQDkOl5taC3u7ceLBzeNj49PwxLR95AiZaGxRr
	 g3p3owxyYNzitRxg43y+krKZHmvoLsaNcCcmu26uxNB6f8FUYXFyKdhx0PFwX2OaRqoBS
	 0oqGiDkPr21jG27uaJy/jhl+oT3rmLtIXU+4ff18uiFXCCIAWn2tJIbHiFoNIJgdm1zVG
	 vtIwNlOP6VG7F5AwdKjpxFN0RQM5dn9Qf/TuxVfuLaLSY3WRJUgkFoDT4dhbe2Xb/EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v1z+UYgf;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCAC606A320
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 10:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBCAC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v1z+UYgf
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6df5e315bd1so1674783eaf.2
        for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 02:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795082547; x=1795687347; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D8hYj5tsIjDvKDaCqFJ/7W6N6FqJoCQM/5nsT8oMXek=;
        b=v1z+UYgfSKO2IoV1Jj9y9AT29S1N5RHG9j/LdfPYyQgqTcyje3Wrs5U91c8/mh9kbM
         vvbx6sSCgfoB3WB03bIcN47rArblhIa9OyzBwIbbAtG0LmqHxmBn8FFeI0WYSZWFULSZ
         2CWXsWtQFaQ/WadUODw/AMrXl0B1pFM3qfP1WrJie6SEmjFe95EzTtSDZLTRUm23NOLZ
         VM57BlUW2HMywc1qDXXZcfGMCygehgBzFMZOUuTcUVofGHihmw6QqP08o1HJYFe2qciY
         f0EtL5+Ao2PocaAyy6r2kBvr+nEHqcVAGwEaijUCr/tAHmJ3WetcKhWv2/tK3kgd8A2a
         kqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795082547; x=1795687347;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D8hYj5tsIjDvKDaCqFJ/7W6N6FqJoCQM/5nsT8oMXek=;
        b=B7bD03M592UAxPV9rhVbXd7yRfq/+ttGoFw3O4+03cvHwomlJ8s3neBVGhzIr5r6HZ
         59HckVFLadOfUYmtPK8jskVI9fcICF2r/N2luof4Y3tHk+kCAZa5804eqEyV1ChfVOg+
         dZV1YaW9mPA/ngXHqxAM+WeXKrTe/5lnaPz9m8VHdyPMIUWLHpzrni9eOyU3Ekr/FWaV
         CXShPxjlf/cHvGKvOgfXSOoNDRPZ5poMyNN4uSVp/YqXOmQuARPJfokI4TUwiGWg/YeP
         jSlgYVqHz4rLRX00WLjxj9EFStv8DBghO8FB1rVGmxUUAPqTY2rFORVzz3NvZYuMU9w2
         hJgA==
X-Forwarded-Encrypted: i=1; AL+hErEq1EbDe/LKaZ4tUwf/o+OF3BoOEkCl6jISn98hZ6nNYlp1Y8sBURYLx+yFeXOeQogoJOjafYqdWFc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Z/WlK1Cow3yy0L4NRTxwEXJ7jV3zqeKot3YMoNnSSK5r/nknQ
	qq/y8j4yuTo+e1quwYl4+Gb+yYlOefbRwcXQAQAnDoCnCzma7KMEhYnf
X-Gm-Gg: AYBFou3cymiTtAsiLmzxEWZIQ3TCFSbhQ8LSnPo3JWNigP88fdkSi1kze4Na6V/T4BF
	36sc1jI7IB+XbEY5OnTu1eUeGtBaNtD0H+RbMl/5N093mx7pMT2IUHpqN/+KV9ZJQCss2Fs8qKQ
	FFnNb2W8rxW4VW4GKWjM4EHFrnjCM3To+KKNR/5WJNSa4oPbH/ZW20yADl3akSuKwgsCQX0kD15
	gnT+nWr1xe5CQhM3CsF83mYpLEnZN4XiTX2o+6T6hlwy8aUcUM5zIlxLKgrLIcy23AFCdz8Nokz
	Q7N/jMmfncz/9eRohiL5bXzOuLH3zbPlebAf8gbGVZTx8P+RXDUkzixQuieQl+Zxp0/12yAmWo0
	SpAYPlXJBiNrEEkmByQSSy58uDLJHFyXMr9qFatR2L07dB+URRAuSkrjtvSDw2HpXQOQ33sY6qq
	sM/vgUmsA+PPbjX3PDGcS5FXIMhH8bqSMyOs5Jf8nAX9hlseQsJcIHLaKcgTh2UP4R7N1H2sU+4
	RgZg/vvucKURSSHjpg6m6u9hJsmC7U5lCgPIytBsU9XRo7afCPoD/4IDq2Tv5NTGPkjZR/E7Kab
	zS4uHw+VhKqS/eHIbY4oCChf06hNNiiSvSPxBzXPpxUukg11MZRZ52lrrf8EyO8cKJDBIWB52cE
	UntsXkzyb8R9faKbiX2VCULzixs6GHr4+bSPG1HAru4o2pVYEbRVOUWmom25ZywfdNxd6j9ulf7
	1Ay1ggdE2+QVanuVVj11d99KocG1Gv2MMVRUB/u6XaxDh82LkjhgZQkVFEuGJbM2xf5JazjlcVl
	Q==
X-Received: by 2002:a05:6820:a289:20b0:71a:e5a4:1881 with SMTP id 006d021491bc7-71b1861967dmr3072296eaf.77.1795082546496;
        Thu, 19 Nov 2026 02:02:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b18fbb9a8sm3906194eaf.0.2026.11.19.02.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:02:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v10 0/7] dmaengine: dw: serialize completion and
 termination
Date: Thu, 19 Nov 2026 03:01:34 -0700
Message-Id: <20261119-submit-dw-dma-synchronize-v1-v10-0-3a737597a0d1@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43SzU7DMAwH8FdBPRNI0nxy4j0QhzR2tiDaonYUx
 rR3x90ORN0hSLnYsn/6J8qpmXHKODdPd6dmwiXPeRyoEPz+ron7MOyQZaBGI7k0gkvB5s+uzwc
 GXwz6wObjEPfTOOQfZItgqDVPyiYQEBoiPiZM+fviv7xea9p/w3hYzXWiCzOybgrErC0ycdjlA
 R+vezSxz/NhnI6XiItYpX+GoSOYCcnpKMEk4593fcjvD3HsmzXMIktMVjDJONNSKfQKYnBxi7U
 l1lawlrBoZJe4cklH3GKqxHwFU4QlDEpZ8Ek6vcX0H0ZaBdOEQSu5tdqlLt28mSmx2jUNYRKRx
 1Y5KRVsMVtgQlcwS5gDStWC8niLuRIzFcwRpoKjf6FSBBG2mC8xW8E8YRYiNwaBdzGV2Pl8/gW
 v/YQVZQMAAA==
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

Based on dmaengine/fixes at 6628e7d4c6b2.

[0] https://lore.kernel.org/r/20240911184710.4207-1-fancer.lancer@gmail.com
[1] https://lore.kernel.org/r/20240911184710.4207-2-fancer.lancer@gmail.com
[2] https://lore.kernel.org/r/20240911184710.4207-3-fancer.lancer@gmail.com
[3] https://lore.kernel.org/r/avrHOJ-fVZOO32bI@ashevche-desk.local

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
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
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git fixes
change-id: 20261021-submit-dw-dma-synchronize-v1-e550f47fd1da

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

