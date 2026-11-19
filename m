Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104108;
	b=2fzF1omNjLGThwiUXfzkcS0rMOZsrZMrXRbFCaQvz2e4Jb8l/GVHxiZRcfHQdcm7uYTa
	 m0x42FJC34K3tdACB7Y61EsZNSM/CWdJp1iQJY7nOflkSAIP/ySHoCTJPi64Fsi+lAUSG
	 t7JQxPTIwDZH5+sjG1joXxery409BaDyxSuqBlk3ssyp77Nmsn4H7fUkNBJf09SGHSgsW
	 vAZWiz7EySJKd18Xmn8XdepTEIaPPoO+4rvQlW6N22KvSQqQsUw3RKXvWbNzOs2yQfpmz
	 VCW8BdU4+pt7g7jVyAZwCvcaA25NN+iIqK7RVROKUeGwjPBltMwRLng7r3c2g5Vu0jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=/ZxPIuLt+/kiepGNuwG64GaZNG5kVNJvtdcH3UsJ5V8=;
	b=W1ND3DedOcmSdLQL8WE+gvj+8AR+bozZAs6yCWO3PEe8ByUmA7F6lr2v2g/zYzD/7ld7
	 cwzZQRXhomPKzP93mQ80DCAvBwCV1XZ5EJX3ovguYxB6AbzMmmFU9v+2dbAXrm6ol/gQ7
	 oEkObSv+a3dTzB3TJiCFmYKSlu7BQsK03uRgqLD0fh2xVYDfPAkN5Zmr+2i3DmflIyYVt
	 KRBKFRLrOzH5IROX8ap89JO20YB1Q23zuJ+gMFrzMsjNlwgW7doPSkDTmBSsUGeehR4rC
	 oJaLQGrCgxFeSoVeAiZqH7MmqdqyNNN0a5i7XTAs/xoDugaiSOmO7IGTu9yH9grgu7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tl+HGnHa;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC5B606A320
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 16:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EC5B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tl+HGnHa
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b4c685c751so20796197b3.1
        for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 08:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104107; x=1795708907; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/ZxPIuLt+/kiepGNuwG64GaZNG5kVNJvtdcH3UsJ5V8=;
        b=Tl+HGnHaqVMQ8e83+0+G/PBH9EvpKLU+LRYt+fR2tmuIj5npjpUgDWN0uMm1iEGTur
         jtu3qMfDFHWS/WM0IanTtuo/GppWeWMfJj09pvaQJnm+uBeDpRVk2P+HGsLl6ZfhAd/h
         P0KccTU1rj/57isj+90nFFBY1T61sGV2KEBc1Ok6weaEafrMsNyUrvBBPwU2Bab5STmX
         51ozJWMnx6yHZwAY9PRMAO8jne2OFys70hzmlTCjIANDFg3Jz2i4y3agLUAvi5nfQ7L5
         XT+5Ei+npXDCcCoG7psJ854BWoIijw2SekT/jcGKm94LaVvopkzv67HPbiqkMskeIiEt
         XZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104107; x=1795708907;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/ZxPIuLt+/kiepGNuwG64GaZNG5kVNJvtdcH3UsJ5V8=;
        b=OTmF7uzapfAtJQQJ8TituQfVRFNd6nlfuigJWohQwM+bsLlsnHu/DXWYKSveJaX/c/
         lfaAxYmPl55IVP0oqsbNQf+wks9E8PKDNvYqLynayMmLY0eRG6zjQNX74qDiIGPRbgMC
         iun+YiGcSFlM5XY2uhhy08nSnLC/cJX8nmv/m8RYVLqTG3inGro7bLgBdA99zs5gG0+U
         wiosJczJfMEPi9FYll13EVhAv+gxdhvM5umX8RgLAS/0hkB/dHsUR02+UF4RNwvL2T/V
         jsdYShHTCs+PQ4MLaKHS7XhIaaLfoiS4I909KYNAf/EfWBHiEb/vSVKXFXI7eVFkgkrQ
         0KUQ==
X-Forwarded-Encrypted: i=1; AL+hErG3uEwIKvQC2BP7O4Wn9dc1ywTYm2ptUrEjQ/vHOqfGRJ1z385FU7/Zr55O+D4qjLi0tGkpMdwr/+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LeC7fz8TSMBk6aJee7BJlmozVfwvRcTJhFD4A89jGZguLZFCC
	VP8ICnHIlHxwI5KKWxh285IX4LeQKVy4s616pk8zHqZq4QCiwl4tBXQZ
X-Gm-Gg: AZFdTZdgo5LyYlfFmdNjczFaBCcIsRFtlvMLbQFcFeMkgjMbgTmQg3e/3RHb5Idcq5h
	5Ys3W+KBaFW7Jm0dxmsG7gsbfXahai5jaxOpPG3k6cB3c8bhIlvaPDQpp08PgoOkxlJuvQk5F9D
	3gFvcOoTK6r6rEhIT070hINBoR261SHSecg5OgvR4Vr015Ag/75bxomj6q7hPDJMZ548IrwAZwG
	O7MBN5E8fD4WIaeTAUN9JrZ0ZPoZnxvjzRxF/T42IWVZil1VS9X/wTdz0aKWWmtkgU2ZGRfjjh5
	Vs7fyik6yQJfYpDPCl2BUFEbgiObojhsOHo9WgLK//63SLugJpLUT9bRz4TlTLp6nYlEoCMWsDV
	E71a3QHG5Mq2ruxPFbcYPQJdXFWpOE2FXTOT8qi6nNERVrBqj9Qr9euSB6b+zRTKBMlu2Qm/7Yn
	5o7LwFYZpuxX6+JZ5z/v76XAlD7RBZvtL3DtY7HFR+DOW2ZhXy7nA3UU7pFBOwKzsR5dEeGuObm
	kTQZakDskVAONj5+q9g1tKasMO2Ul3u0wSc2dEUx0rRlhtCrqJfRRjFJj4uhvSzTxIZCJ0MyOPL
	A97c53NNZfSU9dvLiDoRaCSQTVZmI/SCJmiSC0b1fANg+LFsFlXQUupDjm4SZyqjlAPX15PeNEe
	uJf9LmX8hIeqyqm1KzUiRCRwfQCHJ/kdlTTmqnScMc0m8fp8WT6FxUqCgkTNkXp3MgwgMWUjEvg
	RPYtpq+QCBUeGP3Nz98AK5gWZZUCxqmSHRo7kTNs4OGZkM7ZrR+oI=
X-Received: by 2002:a05:690c:370a:b0:8a9:693a:324 with SMTP id 00721157ae682-8b520524d38mr523527b3.109.1795104106234;
        Thu, 19 Nov 2026 08:01:46 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52031aa4bsm623267b3.34.2026.11.19.08.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v8 0/9] dmaengine: dw-axi-dmac: fix termination and pause
 acknowledgment
Date: Thu, 19 Nov 2026 09:00:55 -0700
Message-Id: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43T22rjMBAG4FcJvq5aaXQYKVd9j2UvdBg1Ks2ht
 pPNUvruHScUjKG44JvR4dMI/f7oBuobDd1289H1dGlDOx648A+bLu/i4YVEK1x3IMEpJb0Yzmn
 fRlH+iXhtouyjGMbjSZzieSBxUSIHXRWhQ+VCx8qpp9qutxP+/L3XTLxSHid2WpEi70x9POTdN
 MQLenp/+uEAN+3YNR7q/9+avqhJ/n1//EmRjaesAgUi8/yyj+3tMR/33dTfBeZeWPeAPWdiYbN
 UDHrp6Zmn5Lqn2dO2lpqiT06VpWfmHqx7ZvIoZTAJjC5p6dm5p9c9y563oCNgsuj90nNzz657j
 r2UE+jCsZEQlh7OPVz3kL1iK2gZYi0Ic+/z4TtfZ076eE/lPYA8z+524xx4wmKyS2CzL8pXpY0
 lvq8soDyEGAnJ3LIdx7zjH2S7qVkbbbzUWpZoaw2WLKAKAWtEfnYMiBmS5xY+vwCBwHycdAMAA
 A==
X-Change-ID: 20261108-submit-dw-axi-dma-stop-pause-v1-c93f1e767169
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>, Baruch Siach <baruch@tkos.co.il>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Wang YuWei <1973615295@qq.com>
X-Mailer: b4 0.17-dev

Keep cyclic mode in each descriptor so failed preparation and queued
work cannot change the completion handling of another transfer.

Use the layout-aware channel enable check during termination and retain
transfer resources when the channel does not stop. Preserve suspension
status for the pause and resume paths, including acknowledgments that
arrive after a polling timeout or during another channel's interrupt.

Keep a pending pause across cyclic segment completion and resume the
segment only after the client releases the pause. Track the active
descriptor until completion so queued work cannot reissue it while its
interrupt is pending.

Retain terminated descriptors until their callbacks have drained, including
cyclic descriptors that error handling has moved to the completed list.
Serialize interrupt status collection with channel reuse so an old event
cannot complete a replacement transfer.

Require at least one IRQ before registering the controller. Keep shared
IRQ handlers out of uninitialized or suspended hardware, and drain them
before disabling clocks or removing channel devices.

This series uses the shared virt-dma descriptor-retirement helper [0].

[0] https://lore.kernel.org/r/20261115-submit-sun4i-dma-callback-lifetime-v1-v2-1-fb7d258702f8@gmail.com/

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v8:
- Use read_poll_timeout_atomic() for stop and suspend polling and a
  scoped IRQ-save guard during termination, following Frank's review.
- Propagate deferred IRQ discovery and reject controllers without IRQs
  before registering their DMA channels.
- Keep controller interrupts masked until DMA registration completes.
  Serialize the hardware mask with handler admission and rearming across
  power transitions, following Sashiko's review of v7 patch 8.
- Leave a suspended controller powered down on removal.
- Link to v7: https://patch.msgid.link/20261117-submit-dw-axi-dma-stop-pause-v1-v7-0-d5f2309afd72@gmail.com

Changes in v7:
- Guard shared interrupts until hardware and channel registration are ready,
  following Sashiko's review, and hold an active runtime PM reference while
  handling them.
- Balance probe/removal power references and drain handlers before clock
  shutdown, including forced system suspend.
- Link to v6: https://patch.msgid.link/20261115-submit-dw-axi-dma-stop-pause-v1-v6-0-bcb23d1e7029@gmail.com

Changes in v6:
- Retain descriptors through callback synchronization using the posted
  virt-dma helper, covering pending, executing and error-completed cyclic
  callbacks raised in Mitch's follow-up.
- Serialize interrupt status collection with channel reuse and clear old
  completion and error status after successful termination.
- Link to v5: https://patch.msgid.link/20261113-submit-dw-axi-dma-stop-pause-v1-v5-0-8523a27b5788@gmail.com

Changes in v5:
- Use a positive enabled-channel condition in the suspend-status helper,
  following Andy's review.
- Initialize the resume result immediately before its first use.
- Separate the lock-protected channel bitfields from the preceding fields.
- Link to v4: https://patch.msgid.link/20261112-submit-dw-axi-dma-stop-pause-v1-v4-0-3ebc24b243db@gmail.com

Changes in v4:
- Add a preparatory fix for cyclic mode leaking between transfers,
  following Sashiko's review. Store the mode in each descriptor so
  failed preparation, error recovery and queued work cannot change
  another transfer's completion handling.
- Link to v3: https://patch.msgid.link/20261110-submit-dw-axi-dma-stop-pause-v1-v3-0-35fdfba8b61d@gmail.com

Changes in v3:
- Wrap the atomic polling calls by argument group and correct their
  continuation indentation, following Andy's review.
- Move the termination return-value check simplification into the
  channel-enable polling patch.
- Separate the pause-loop conversion to atomic polling from the
  pending-request and cyclic-restart changes.
- Annotate the suspend-wait helper with its channel-lock requirement.
- Pack the lock-protected flags into existing padding while keeping
  cyclic separately writable, following Andy's review.
- Link to v2: https://patch.msgid.link/20261109-submit-dw-axi-dma-stop-pause-v1-v2-0-64adc48df793@gmail.com

Changes in v2:
- Use readx_poll_timeout_atomic() for the single-argument status helpers
  and express the termination polling interval and timeout in milliseconds,
  following Andy's review.
- Track pending suspend requests separately from confirmed suspension so
  resume can handle acknowledgments received after a pause timeout.
- Use the atomic polling helper, including its final status check, and
  report -EAGAIN if resume cannot yet cancel a pending suspend request.
- Defer cyclic restart while paused and track the active descriptor until
  completion, preventing resume or issue_pending from reissuing it.
- Reset pause state on successful termination and channel allocation;
  clear stale status when starting a new descriptor.
- Link to v1: https://patch.msgid.link/20261108-submit-dw-axi-dma-stop-pause-v1-v1-0-c48ec19e9ee4@gmail.com

To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Sergey Khimich <serghox@gmail.com>
To: Sia Jee Heng <jee.heng.sia@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
James Hilliard (9):
      dmaengine: dw-axi-dmac: keep cyclic mode in the descriptor
      dmaengine: dw-axi-dmac: poll the correct enable bit during termination
      dmaengine: dw-axi-dmac: retain descriptors when termination times out
      dmaengine: dw-axi-dmac: use atomic polling for suspend acknowledgment
      dmaengine: dw-axi-dmac: preserve pending pause requests
      dmaengine: dw-axi-dmac: retain descriptors until callbacks drain
      dmaengine: dw-axi-dmac: serialize interrupt status with channel reuse
      dmaengine: dw-axi-dmac: require an IRQ before registering the controller
      dmaengine: dw-axi-dmac: guard shared IRQs across the controller lifetime

 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 311 +++++++++++++++++--------
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h          |  13 +-
 2 files changed, 218 insertions(+), 106 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git fixes
change-id: 20261108-submit-dw-axi-dma-stop-pause-v1-c93f1e767169
prerequisite-patch-id: fc343480330da5ff95e5271997fa71107977c2b8

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

