Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744778;
	b=xeanwxrq6/0i4DD5QGFAYJYAaP5qcsA8Wsx0a2YTM7OpwjTTWFmZ7brfMR/fFf+ZWgZm
	 xrYpDedt4p7ckF1avBv7/eCqr/r+23WzqK96lmIBdaN6buxNoUJYIlEmW/Jiz+dBmtQ0I
	 GtenZ6xB9qVVury+a9qMxXvm/oZJGYKXJQW6QSWlRz1eVh1F3EieokSXa6AVJlHwHTdpU
	 ZsArYWPU8sUfZlIY+nI8hwwq/RvOn+1l0Qz6bgKHfY97zqDvmkrXB5pHQ3a5c7idm3FdJ
	 /PRcFs/DgzgzdiftR+oqSsbv8vC6SXPeueDimyGpwPB97DToy5FKiBlAmtIxaflVAPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=Z27hgKYTb2n1VfMFl375pQz709FIUXDNAK7CWpp6XtM=;
	b=qv3uR93o/eIXQY7HbHBMhRg2SfEW4exLadwgOGn4V1S6UmbyTpGJLYiwdCNfl+F7EM1D
	 AyUULcrllUbh7Aujm4ccpbopvVHbIV3HUOhrT1yAnI5KO5R3YeRwWjhthFQFj+LHIlwAH
	 f4bEQh1S1hTMvEbqx+4kIJdZeXb1qjHg4YZQYr4jgMPeA5HJ6S23F0CTJD9pxwrjzrLUo
	 qC4kiqnMQ/OBuKflStcSd9/fzu/zihFbcl3HOd330aZwqNSRnn/8P2dFnnQ5Tw80RA4qT
	 SFgmLfN26kNykYLeoTBjrVnk8+5Obga+cVASWO+MjTfZZcJKjh7qgjtGZUEU72tRerw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=um4iDJHl;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA9E606A328
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 22:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CA9E606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=um4iDJHl
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-53dda625f63so73978b6e.1
        for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 14:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793744776; x=1794349576; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z27hgKYTb2n1VfMFl375pQz709FIUXDNAK7CWpp6XtM=;
        b=um4iDJHlTQS1vMCWE+mHQxM9reo7nYH0ZIojAUj6CCPwE/FUhh8O1xOdfFL/p1yPte
         Cvx5kkQVDbdNhhzYV3cIKoBLsSGOysX+NJFFBCLom2uKAVVSO78/de29jIF0sY27QeIK
         oEtopI3AJoZ97LFszpRZm6sAWFlyOjWBIJJRgQQWZjMWru2OpDHgcyzO/5m+Hd4j76Iz
         oF/wqQhIFCrbPNcqieIqwm4YLsF07Jf1GlKPPA+HDXZL3vGtyvmcY7S8oZFEK08GaUqu
         RwDDGoKB9aHF36nH5bnj7S3EWzJAD4QkmNX3lZGtmvT8rX1dBizFiMo8hB0PdhTa8XdA
         g43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744776; x=1794349576;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z27hgKYTb2n1VfMFl375pQz709FIUXDNAK7CWpp6XtM=;
        b=ORRxpt2tqZy9tbZ3Cn2+GhLTpwjx8cWDBkzKeY4oAhp4qekwMhgF5Wn3jykJBKlDmM
         QN9E0yPi6vWJJ1VyzI+ySQJKTsm9nEQ2KoE9OHX+MwyGR5qbkW0OcdeO6u24GcyQ+YqM
         0oG92GwPkXhELGfAxJeY+qMjiFaTlUDB05PzK9n55dIvNU4y8fCW/PZtjdnV5Ta3KGFt
         lYnTxr/qAUUeCsJKCMuHl25qmPOPcyhH6pZoTpGp7L60Z7kv5+c73VVZNw8M65/aETJd
         MadmUAvaDaXJsAMH2K8XZdiS3MBKtCzOGLgOq2vHWRnV6VHlU4/TEVCKPr5Gwsxp+tEM
         1gNw==
X-Forwarded-Encrypted: i=1; AKwUvBwIvioxDQ1mQbiqvhWumu6NFqx8cwOMOZk+a5oxRxRvoikj1ylJ+CGUPoseKUyyPvUDZhA4VMaNZXU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uLELnurcVBwCsfBCJYzojMUN8ifiXuagmuRKFbtaMQMNzQ5sh
	sda7XdVz596F4v31fvaZPgkiui9Lckz8EFUOPyV9qxFYks4LrFEjRW+O
X-Gm-Gg: AYBFou19lQEokmhYQ3ctbbppTIAypm83FrjXe5eT5AF4IP+dvMiP9yQCD/O0QIiu/fg
	vCAFwKFz/MFjUvK1pxjAfo14qpFjvsjgm1xyq+IHxEUGzX0fxDWG+NoFbRUhFEaLjNfo6TnFF1H
	Z2TUclBc8Bm+/dpqgmOG9Api6+wf1XbBwtTxdRusEzgUcwrDne6900RsBaKp221oyTz0ZVWdtNK
	e+/PaE+Y3N/bVInR5IJ/WHjtYHG4eY+K8CJWgLWr9r8jzVfTuEgAtOo64a6Nj6GFV3lUh8+MDrP
	AGXG2bBSEpmlMhzgdoh2ADknFvIvBCBBBDF7sjpWzzWdSPSsZQhyqkubEWxSL4pbitGwLZ3/tD6
	bsIX05LgH3aHdA6kBRDBqkkgSfH7igfk4kq0Pm0PrlNCh4hSHrP8SvAydvpRKERZueOjr/wC/PC
	4T9JpK56kY4s7ncL9U8ckhRsCLXXt//M0EuPuEnRngY7Hv4TFZx5w56/HJ82xQccf7WGIYpUEoi
	Rq1hm9DHBGZTRG8+0La1SM952pygCz0w2v/2lL+PRGRlHIjOAu0ZIwqdZRYv2uHIfDMAORb2fq/
	zjbu66QOeZVKljy+dbJOUOgGCFrCu2B/yCBU2FZo/xe37x7k+0upn6t32UqaUJiMhP2dOxxJPjr
	X4YPL8r8L5Md6TmE0lrQeByWsfxvJ6qe/xxm08wcO2/zAcNLhBY76kaIyYm7QWkSKH9EdLgrMzd
	SGfE1zawD4GcX+fetI0C9eDHX8GCTF9rPnpUdXWlRKDujXMP+GUws=
X-Received: by 2002:a05:6808:1925:b0:4c3:4e34:c69e with SMTP id 5614622812f47-5640d919f60mr12985788b6e.8.1793744776144;
        Tue, 03 Nov 2026 14:26:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9ef58b1sm128435b6e.3.2026.11.03.14.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:26:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v6 00/10] dmaengine: dw: serialize completion and
 termination
Date: Tue, 03 Nov 2026 15:26:02 -0700
Message-Id: <20261103-submit-dw-dma-synchronize-v1-v6-0-2ee0c348224d@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43Qz07EIBAG8FfZcBYFCrT15HsYD/wZWoylBmp13
 fTdne4erL3UhMtHZn75MhdSIEco5PF0IRnmWOKYMOi7E3G9SR3Q6DETwYTmTHBaPuwQJ+o/qR8
 MLefk+jym+A105hSUYkHWwXNvCBLvGUL8uvLPL7eM+6/gptVcJ6wpQG02yKxfaELqYoKH2x5O9
 LFMYz5fG858lf5ZBh+n2oRGOeF10O1TN5j4du/GgaxlZrHFxAEmKKNKSAmt9M40bo9VW6w6wCr
 EnBY2MNkE5WCPyS3WHmASsQBGytq3QTRqj6lfDLUDTCHmK8HqWjXBhj83W5blBwTT5+QwAgAA
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
X-Mailer: b4 0.15.2

Keep client callbacks in the controller tasklet while preserving polled
completion. Serialize descriptor ownership across completion, error
recovery and termination, and wait for callbacks before a client reuses
its resources.

The series first serializes completion, error recovery and cookie
accounting with termination. Separate patches extract hardware-LLP
residue calculation, calculate it in the status getter, simplify completion
handling and report queued residue. Channel release and
device_synchronize then gain tasklet draining before the final patch
adds deferred notifications and shared completed-descriptor cleanup.

The series adapts Serge Semin's channel-restart and callback fixes [0-2].
Polling continues to advance cookies and software-LLP blocks, while client
notifications run from the controller tasklet. Synchronization preserves
pending tasklet runs from other channels.

Based on dmaengine/fixes at 6628e7d4c6b2.

[0] https://lore.kernel.org/r/20240911184710.4207-1-fancer.lancer@gmail.com
[1] https://lore.kernel.org/r/20240911184710.4207-2-fancer.lancer@gmail.com
[2] https://lore.kernel.org/r/20240911184710.4207-3-fancer.lancer@gmail.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
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
James Hilliard (6):
      dmaengine: dw: serialize error recovery with channel termination
      dmaengine: dw: complete cookies before releasing the channel lock
      dmaengine: dw: simplify transfer-complete handling
      dmaengine: dw: report residue for queued transfers
      dmaengine: dw: drain the tasklet before releasing channel resources
      dmaengine: dw: synchronize completion callbacks

Serge Semin (4):
      dmaengine: dw: Fix XFER bit set, but channel not idle error
      dmaengine: dw: extract hardware-LLP residue calculation
      dmaengine: dw: calculate residue in the status getter
      dmaengine: dw: Prevent tx-status calling DMA-desc callback

 drivers/dma/dw/core.c | 287 +++++++++++++++++++++++++-------------------------
 drivers/dma/dw/regs.h |   1 +
 2 files changed, 147 insertions(+), 141 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261021-submit-dw-dma-synchronize-v1-e550f47fd1da

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

