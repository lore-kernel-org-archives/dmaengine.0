Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202042;
	b=bYzuckH3jqh7W9H6mbMOtE+/RuPuK5VUOk3q1vFoRHPNGkd2TAw5iEXfayueID4cCW3/
	 7DHONMiywza0XwsaO21Qt0+BfUyC/hxyDmJi5MilU1CydX8+HqbjG4apJR4R0HINmy/e0
	 gcO0perSl+snN5ohLa9aFNViM1Kk4kIS/0EUycMMs7LsWeb1mutbZTYVWKZW95mcTjAVa
	 bv/bEMhmIwxoC11ffYPyQzPNm7OGAhKiINpMMIBIRVFN6HX7mCONvuRDt02N5Y/9ayosC
	 Qr2UutQrnk65eADp0ZHD93jon/Yf0C8JDzZ/DnOHHhwcyjHD5Wv/Ij0D439JeZV82/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=LoQMn/9Y5qB5mSNO/rsTN7S4E4JEirHOJTwPZqzofps=;
	b=Z4/+1jKxfzBFTGevqH4IO8OLk82HlCyLeTTCkPNLLsKfuf+SsGeOYyWycemjohhIXiVs
	 AvjKPloJgGw4pki+PBl0txHqyim8vT9x2JRUvdEHPMFVYG4Mo9TTJj1tpmwPFJ+qYI7Dn
	 mCpfIk+c8rVHa1vT8s5Dos9zl1kF4BZtrdYC8cXDv5Y1E7/QkaU0wx0NZMMm9damP9ywB
	 WB9a+pmdFW8eB8aMwsaVzkinSORCfGlpeTPWywm8YFRSKUy5QKBgjrGZSgBOTn4PiwU5b
	 q2Rg0r4qP9tTPOt2mNXBSm86wrZz+QqV+sgRExTtU0SflcbhM3ViUtU3gQFYMO1x2wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P9obOE4E;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4130260A2625
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 19:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4130260A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P9obOE4E
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-702fd86d674so871809eaf.2
        for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 11:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202040; x=1795806840; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LoQMn/9Y5qB5mSNO/rsTN7S4E4JEirHOJTwPZqzofps=;
        b=P9obOE4EwZGB+Z5GYnLyAEu7WPXJoHZOPxSa4HZtbpC4GCQy9MNT6oB3R9f8V7L+2A
         X0FM6Jfhv7XADXRHNUi++wmWBTbozrnl1YZcg/mm3NrW8f3pz0VP3zV4I73ooVQJT5Jl
         mzRtXySQZZqHmGHsmkf/D45Hi8iWUxFUz0OJQk19RkjC1LP6pktrRWNUh/URJSlovZ09
         dW9RNoEnmPmcnQfS33gzEuhNWOfjCuP1xI4x35SzyV3EkxrSSzhwjD1R/h8f9yu8CMos
         RbXQLoj4YPYjwV42RCIiZEsdg/nkHuBJ43VDu+ZNVYP3VKPgwcURLnoC3WsRemIez4aP
         1m5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202040; x=1795806840;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LoQMn/9Y5qB5mSNO/rsTN7S4E4JEirHOJTwPZqzofps=;
        b=F9tHbT3oXftBuNvT2UyApMebKNT1R3PCUL5GUO7TIRduT38Y4aLpT1W1gxN37FTucI
         /W7dRi2FfxGrCKRMT4YVH73OJp+gtJ/8Vc3s3G/4iPtbgUa86N1wMyP4vP68nApqNHBI
         O/UpndwJeSXtQBde+hMeLjSkVZoPIc/29Q6hXojGnE+IPfhYOIzi0ueHORWVUsny96DG
         AZuYrAnh3YOhV8vGBY8gzz0J5pPqLXkUpfImRImE02k4vnhW61/k9rjmJ0oxEr0xj9e+
         /7eZTLuvwz96hmw06Y+HbBAtgiqjj4mYvcroojUNjXTm+lA/wvuv9hp4FxqGlTos9V5c
         2tKw==
X-Forwarded-Encrypted: i=1; AL+hErFAlHvBL07cXp4fx/FS4YjrLpq1aaO/9uxHBqcl5pTH4k16jlra9hCdYkS+pcgUuEl77WxF/JELKEE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cBPwqvbpo3YSKQpmfKyj7Xf4aaokTkTRKdWtsqljr4KODAxK5
	LxfQwkWrMaraT3BeuWtzIgvZm4j1ESGr4+kYkCY/1IaIaAn7elBMDXKJ
X-Gm-Gg: AYBFou1usQ8SBoSSP/t5urnlx7jKvuyt89SdwXdgE+ZTwiIXJmwjXYafjAwTJb/kg9D
	wdnv/aQOtaad4Rh4rRZJKbTeUsQ7zFwLQYy4sOZHv9HAiN0dqtr5FE/39eVFX4s7mF93xw4lMzQ
	N3zfYJZWmiZFeX4b3JJMErqCqONvUjwhfIVydEvl+I2bTfS8pcasHAj/lVfNeR9rBHbOrBXx0kA
	bAyTSVuvJPxsxNgVhleOaS6EmgVpNCHYHWuP9faSIPwqHOaUCvDCCQWgqSJVtEAKmcvBBFdMsAM
	IDsxtVUcvSZnhqXGjZybk8Bg+ylDNrkHqwNOdn0bfiUtdUZ+YHFcyE2Tkz4deaVb+ZyF8vlxpRs
	iy8d1h7q4aHcncZGl9ZF+CGBS7gfpJlXMg8bXa/miLhgl1p4LcPjS4FozgDlYCjZ6Xz1ajidphQ
	kG2eHuxMfdr6W5ZmaTHTvQykVnOPd/86cK19ReXb62XbB1mFaIF78wM3UpjerA3/mZIMu+mKfQW
	ke5+I8rXeifI4LfUG0JUarPJwG9pF71wqW7tXAsqCNXOp5mb8JJ8IJ5vOe76CaVLh/O3eiO+idC
	S1JzwL1n5fBY+SdeYzl09LtwFTnlHYJbiYLm9tv25IyHk9lr5Zg8K6dDVKDgkd5pRDO0XmwlYzy
	YjMJgZVZW3xQGh0JiSVLuAzZRt6Z6jI/DECwz5GVq0/d59hJRo1WtOhVP9pulLLFp6LaQ2/HPAD
	JoZBoM3hfBMRXtGwyUVT2NYh8DXv/zVGDfmDLrDil64sZP6MYwfT7L
X-Received: by 2002:a05:6820:c7d4:b0:71b:563:8a4e with SMTP id 006d021491bc7-71b395a2a4amr2268943eaf.44.1795202040090;
        Fri, 20 Nov 2026 11:14:00 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f3964sm2654782a34.14.2026.11.20.11.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:13:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v9 0/9] dmaengine: dw-axi-dmac: fix termination and pause
 acknowledgment
Date: Fri, 20 Nov 2026 12:13:50 -0700
Message-Id: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-0-48ab58961d6e@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43T20r0MBAA4FdZem38c5wke+V7iBeTZOJG3INtd
 1XEd3e6i1AKPxVCYHL4MpCZr26gvtHQbTdfXU+XNrTjgYN4t+nyDg/PJFrhuNNSg1IyiOGc9m0
 U5V3gRxNlj2IYjydxwvNA4qJEjqYq8uAVxI6VU0+1fVxfeHy6xUy8UB4ndjqRkG+mHg95Ny3xg
 Z7e/v3ngau5a7zUf16TvqhJ/nt+PKTINlBWkSKRfXjeY3u9z8d9N+V30XMvrnuaPbBY2CzVR7P
 0zMxTct0z7BlXS00YEqiy9Ozc0+uenTxKWdukrSlp6bm5Z9Y9x15w2qD2yfkQlh7MPbfuAXspJ
 20Kl43Ucen5uefXPc9ecVUbGbEWr5demHt/+N/AXg3kK4F00ea59333W69n7pzxVuW3guZ9dre
 bYkGi1IgSMySM5ErwNVjQ1bviQ6JglAW69gqOeccNt90QlKw8WGMBwUSjtJSW0KGOSBKBJwsFA
 6fw/QMjgFkOxAMAAA==
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

This series uses the virt-dma helper from patch 1/3 of the sun4i series
[0]. It retires submitted work but leaves descriptors that a client has
prepared and not yet submitted available for later use.

[0] https://lore.kernel.org/r/20261119-submit-sun4i-dma-callback-lifetime-v1-v3-1-3935aef58db9@gmail.com/

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v9:
- Use v3 of the virt-dma prerequisite to preserve prepared descriptors
  across termination, following Frank's review.
- Explain why leaving suspend status pending does not assert the IRQ
  and why runtime PM alone cannot guard the handler during probe.
- Rebase on dmaengine/fixes at d460a02aa0ac.
- Link to v8: https://patch.msgid.link/20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com

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
base-commit: d460a02aa0ac6ba9e5d87f8462f75d78be83146e
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git fixes
change-id: 20261108-submit-dw-axi-dma-stop-pause-v1-c93f1e767169
prerequisite-patch-id: e6dc1764346a639312004ea5a29ae0a6ae046da8

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

