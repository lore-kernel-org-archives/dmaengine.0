Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471784;
	b=OUtfg6hoz91gRb5Xsk22TwQ37lzWHxGE+H96XPLtiQKRPlLqgAJvDJMg/rabm8U+ay4v
	 KIFcQyqY9MXGIxlWNfHEsdbZpIY9LkLz9kjP1UMBzcDsSH8naYzRmuOxiO/UFY6UcXNwi
	 mpNR9HK3ktTPLPmEbyVZI+OTJWjmD2dPsoIKfLuaVdnTHUzFDGK2isf98XD15nUv5Ag49
	 ouXTFy9amTfn7nEyHbIM8eqrNX3dtnEhpZQWSNLVDQ7wCcBLzKoSwwE45/wvhVwnVSEKm
	 MOzK3o5THGs2PiY+CZj2225TrBmMnyc0EhAcGYz0pb8v9kyR57XmC4hHSZcDlU0VIXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=IMVMSY1N9cWE50jOBa7XB5ola70F+EY/IlZ2ZpXdsZU=;
	b=YpOwlYHB3OhrGxeoW+cQftYtk9eaIlNVYZy+7yV4uCDr8e25D6Qo/Q+0j0OH6mJFq7Wn
	 3TPskGMYnNZkpib8dxeG72qWAvAyycB0InSHV4sVDqY5YbudTecS/EoSqp75Oydu3KO1L
	 ic5WIr4CGSWbS9c72MMpyQgAgx2dIQOrq8i9dAc1dhsxm5ppHlRX822yXrBz4FHxJ6Nj9
	 B+ui3T/MhBn6R+zOHMx3to1koYyc3+zES+cTXmTWeBE+N169GaNNiUbXXeRqs5p5QPOUM
	 esAKWgYjEdiNnQYzoeoMwcHGc1dtksx/0WoG5/nCQEgWhwPBziRdBj2TpGwa4thmwtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uqMmGXbQ;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CAE606A323
	for <dmaengine@vger.kernel.org>; Thu, 12 Nov 2026 08:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92CAE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uqMmGXbQ
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-8241a56cd70so2503612a34.3
        for <dmaengine@vger.kernel.org>; Thu, 12 Nov 2026 00:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794471782; x=1795076582; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IMVMSY1N9cWE50jOBa7XB5ola70F+EY/IlZ2ZpXdsZU=;
        b=uqMmGXbQnJ1MynnAHssFD7u504cZ7mF5/foFaj+J4vVrepxKy8NSjmFf7hWJdu9e+N
         JNh3HJ73kycnQqxXl7OKfBITf9hPqFRo0214onyeG4sZdpIccZ1BcoJuUWwM/3hyLLSt
         sTbCxMnMs5YGANaKsHVdZyZX9Tq0uQybi/EOesprykpNXvTfBfSnWMuAVlFVuMJROqBE
         Fqi3CzLKu8xaSVz4fnMcGC2etk+GX9yfGkaz2/hsFCqwWt8FrXt0TFTlxPqHh/bnaVO4
         vyHBRGr+kRpnDkefiFOM72+fLicMUUYFt8z+WrNuwrdUYzfONU0H22gFFwp4Ru2CBmWR
         038Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794471782; x=1795076582;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IMVMSY1N9cWE50jOBa7XB5ola70F+EY/IlZ2ZpXdsZU=;
        b=BsQRxF4Q9AOc4BH7IImGQgpCxBI4qq04vB4/vzWB53T0e+7GvQS24xl0/FA3dxmS5z
         dn57/iGQgtSW3gHh0KbkALzrW0rR2DoTwVkvmWY7gRz6hT5EIKjYQfu/eFyyLn0VXdOb
         7uSikB9uxJMwAPPSX5QopV85F5lRjDGl1ZD9yEy+j+sV5BAWLvVdU/P8/rwHmTn16ldQ
         Wkpg7Q0Onxzf87N62niAyqNTueKbEUy0fsY/zFk8bKxCxjCvatKcL19IfVJJyGORp7yl
         LecUZjjuVxPmyIMMQuQZ288hPb+RNr/wASDK2i3hmMhdqW/F/dcmWVPvwqzWFlQlIhrO
         9Gmg==
X-Gm-Message-State: APuU4Z+kL1cdn25dAGfAGsUbTPhahxl3QO2+1TwdbBkwJQI5oS2dHT46
	8NToDRsBhNkFM9LbNZXzCo/Ve38OepeAR5ai/p3Sqpcm2+dkXyBWyGja
X-Gm-Gg: AYBFou3ztU09TueHy3ZfyghmVoEXO1NREsVl1OkeFixTrqfZ0vf0Siprv/UGw+JdrYB
	45Pb+yPdi5GzZad3BySujYmyHVA1nX3GfmJRWLCisWnOvlJss5ULap+aIQdpYviBAYePJXt3QIa
	tEgwUmJ9MdntS6qLxSG67xpuAZP4eT6R2p6KS5BNkzuJKHmSP4jR+8vn3aHHEpnaLNtsXydDq2s
	t8njh/6YbH8J9aqvNyXFm+fKN+umGIEYIY6JBGC3S5xIJVUo0WmtKp46ul1umPT1Q8LPCX9jmHE
	jC3vQ8gnFU8JINQzmTOIfPfINcn+DNaDlt1VwHMgLMklR3yhqXv7ZgmhtzhyogurvEQNUL8ejIj
	OVf2K5aBhmEISWsXRUJU0+Xqv5ppyHXuTY5Ge2JWZ9DwqMuL48ZYbdzlXt6ejYhbs0hcRKRs2xc
	D4EKBTlRn8ffkNwAJTx1PrrOO1wsMkKwe8R8H5vJ4owjTbMvypaxM8iE2djj7eHtTrVM2jEG6Pg
	e31E53v5ES5lQ5WJVI3KaJq75LyXE9CbPhZ33tJ7x++tpl3Ar23t4Bg6bVoMIlNeIhClQOM8ybP
	D1o2jwpmYEChL34yGjN26lG4E6h5gBwYk+oZDombBFNG9nbeyePNwn6GXu8J1Yegl3dbYeI5FoU
	1qrxEMF729iZ9YW962nHujQBDWYSHHSGuEr/AdulYWskdz59JIQh5bivuGi/PVcXF5d8sC89Qy6
	uELLhxIu9g+sypii3prWi+h4iNXhVfrsmR8GgstlfiQqT7lYD4UhQ=
X-Received: by 2002:a05:6808:1645:b0:4e8:721f:2824 with SMTP id 5614622812f47-56b98031f11mr4803302b6e.60.1794471782468;
        Thu, 12 Nov 2026 00:23:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905d3bab2sm7411157b6e.12.2026.11.12.00.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:23:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v4 0/5] dmaengine: dw-axi-dmac: fix termination and pause
 acknowledgment
Date: Thu, 12 Nov 2026 01:22:49 -0700
Message-Id: <20261112-submit-dw-axi-dma-stop-pause-v1-v4-0-3ebc24b243db@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OTW6DMBAF4KtEXndajKnBWfUeVRb+GYOrYpBNS
 KqIu3ecbFA3qeTNs2a+eTeWMQXM7Hi4sYRryGGKFJqXA7ODjj1CcJRZXdWS86qDfDZjWMBdQF8
 DuFFDXqYZZn3OCCsHq4Tn2MqWS8VImRP6cL1f+Dw9MhFfaJfClgmjadMkHe1QvojE2IeIb489m
 hgC3Ug/95IrL9L/+9CrwDYdWq5QITYf/ajD96udRlb6rPXeU8+9mjzZaEem860Sfz2x83j13BP
 kiXfvvNGdkdztvW3bfgHG2N2aogEAAA==
X-Change-ID: 20261108-submit-dw-axi-dma-stop-pause-v1-c93f1e767169
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

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

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
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
James Hilliard (5):
      dmaengine: dw-axi-dmac: keep cyclic mode in the descriptor
      dmaengine: dw-axi-dmac: poll the correct enable bit during termination
      dmaengine: dw-axi-dmac: retain descriptors when termination times out
      dmaengine: dw-axi-dmac: use atomic polling for suspend acknowledgment
      dmaengine: dw-axi-dmac: preserve pending pause requests

 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 149 ++++++++++++++++++-------
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h          |   9 +-
 2 files changed, 115 insertions(+), 43 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-submit-dw-axi-dma-stop-pause-v1-c93f1e767169

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

