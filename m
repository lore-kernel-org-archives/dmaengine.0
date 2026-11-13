Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794562600;
	b=GwSorWQUOpRP+71smkXukTh1iPbu9sSgWai37PyX7OqygDO1g/L0e+Gd2OBullAlBhL+
	 87Otubf1Awz4KV3Zke90OltL8GdvZlFebH/khrfv6lWmMkw7pDqfMPZsYEbDsZRMKjcBQ
	 lDbs6Y5lViRAPzTMkojVc4wnUCj9q8RCW/7XPPyn0l1pfQv2FONva1pfvykj5V3YjpDRU
	 bAHVS994bZ7Y5305rVxnIQS7GRWRPrgTyOR8lrX0aW4hDoX2OdgUTqQzs97WZbOOaxBI9
	 oLWVx58INpJU4uDFa5nOtj1GdO8+clGmSfKkhWVbcvmvGbeWSeskY11FrgtQMEldFjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=H3sP4UGbcpDrylakHUH6tdQBwksSME2bDR3mbB/dTNE=;
	b=A8gpnPdcPosysmUYL3iEbOSJopG27t1HzCgizlZWZLoQQtVWxjddRXaK18y/IHsEq1+Z
	 FkpchamQ4eOduU4W1sNAcWqKmHUQPJCnurRFoluraIKlk8Mrd7ndL83GWQ3XX+DtFXzZq
	 5hdvHOK/uiyJAOZ44Ce0bwyJ9EEkcNH+kb15vTOLwCOfN5DUJAku/l+3N/XkubLNK71Fm
	 TNbujFx7co4UaK8hn8KwZl0r/0K+I0O4aXTJh/rAql1iLZw3T6qrn1A24qkktVvTwYogH
	 cGMtugsn33CbJ2GAB96c5pfDRPqhIJ7ZJsID78es+CtRsaHvX7RQrg/NFikeJQOOlZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aMeq6EFA;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA45606A33E
	for <dmaengine@vger.kernel.org>; Fri, 13 Nov 2026 09:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AA45606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aMeq6EFA
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-8241a56cd70so941652a34.3
        for <dmaengine@vger.kernel.org>; Fri, 13 Nov 2026 01:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794562599; x=1795167399; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H3sP4UGbcpDrylakHUH6tdQBwksSME2bDR3mbB/dTNE=;
        b=aMeq6EFAXHo35T5yN+yPcc4Ifi5QMO7XBPc6pu4rSr5eC2shJYkyFFc6q017pDd5cY
         HQVzIfexF6S3gOfpVpf0TeQ7h5RwPwoxmeD/3Hw+kNi7A8XpYK4hTOVer8sDqwD+100T
         kNhGNbALJ3nHsPA3Mdn/SByVeReTuhe8kVv5AmNSiGhR8xxsXppT3r3Vg8O29yIQ1CID
         b1M5uryWn/EFxk3EMNERRrJh/jC2j7BKX7eh7VQpuxwtNiEJGlH1tpFkOMCy1q8SYcMb
         ISuGEUJe4W3YoCFtB17tE57F+skSDY5+SXu0XOXap60RC/fpkhvNTtYloySrKNsj2ylX
         S5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562599; x=1795167399;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H3sP4UGbcpDrylakHUH6tdQBwksSME2bDR3mbB/dTNE=;
        b=K9c2Pj9kdLhKsWTA8G2hEqqtSX5gNHa/cXQLE/KJYj7952X6l9kAoT9VCm0ON6CHQ8
         MM+NWzDT44UMHBKsdZ+YfquIJ3dw7xfWGyN5/4eDPwHiIaTSjDnBQ9mCJWaRjkUqiCQN
         3SvWksXPPZzw7iz5oxvPVUCpasZe62iF39vzNbEfnQRTad61O/MMJGVOMjaWF/YRz/Wl
         SD+I6367hwI3ErUL3p33C18xMm3OXhq37NCbcP8K9yE76nF9eior73wRDvLEqfQv9K82
         AJ53Ejaq2ZNdNRyrVoAVoc0AtrznAKhuASRqB+i+lUxTIGIckwkqIyHEbPAk8rHKtZEl
         WTEg==
X-Gm-Message-State: APuU4Z8CXxgJy3T7QCmdQfxwHZZ1O7VGDNVPejc6u3n7hex4HwZ5enoY
	CvLiMXae/M8SkuOiGXf6YuGivgGHubo0pB+HixDC7koAwPSsP8fRhTx9
X-Gm-Gg: AYBFou38WyxFVlS6KH+Y5wDn1Yz+Z4a9aoc+nJdJEduCqBf6E2pUorG2kftKsvT3Jm0
	bU7zGn++ki1H2rEcF4/UUY25/+1vNz8gOENJ6jSECDbi40XsCMAuyTpdDwAr4nxIZf6B2UutwT3
	AF/s8gx0NFdZubRHc5gfx4ambOhr7NuVpSGw9US26sUejDFNbv8Zr0xEiMLp43GCBEHFMrTmVFF
	W0SxLiDFW3G4y6MqM0nbHXZuFoPGMjOwQ6AjHc0jxRH9l9qQL2lIeqjHEcrGmmuVo7tDjwKtTvg
	QRg1mpJ7hh3eMoYqOhstF5Cxf2Bc9pt8dXI6RyMYBaMfTCk4AsSV8yZoPYkCrggwCvcZu//qhNn
	+0yI3aRG70tPzCz33VxZOa+cT9yKn+U9/sP6yyhWbonx/FSnfI+pqWEXIG0P0LCBiTBvlp30yvR
	tzHckrHnHM7jOkq0ywYHszWgeruBZarLvNW0xMTZxQGjZS4cPcxV1bxR3rEGbJbuK1w3QvSvacx
	8dS7rc6OuJbVHmLhNM3s679Gd+SfD3z5aPS7NLd4ARc7AocVqHua/6P6wIl9u3suskVVONNSOc8
	h9oeBAqbwmH0Sp926PB+P3G9B2OogGqy0gmyNNyGW+vbTbYaUfhMH+Ai7e8MZmyV4yFY2g3+smY
	3CN9lf0u/HHXfeZQAaScCSPAm/OSEoU7l2TwlTP0ZhOSmX8idvw1a2AAgrXxXpN0D45wKFTyd+X
	V+hZbJv+ZWUD3VbFJqOvNkgq9DSiU1+OlT3Xmbv3+AGA1APAh9W4aY
X-Received: by 2002:a05:6808:1983:b0:4d6:90f3:74a1 with SMTP id 5614622812f47-56e645e19e3mr1879498b6e.44.1794562599227;
        Fri, 13 Nov 2026 01:36:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e6fc42a8asm1627607b6e.3.2026.11.13.01.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:36:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v5 0/5] dmaengine: dw-axi-dmac: fix termination and pause
 acknowledgment
Date: Fri, 13 Nov 2026 02:36:33 -0700
Message-Id: <20261113-submit-dw-axi-dma-stop-pause-v1-v5-0-8523a27b5788@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43Oy26DMBAF0F+JvK5b/AjgrPofVRZ+jMFVMcgmJ
 FXEv3ecbFA2VPLmWjNn7p1kSAEyOR3uJMESchgjhuPbgdhexw5ocJgJr3jNWNXSfDFDmKm7Un0
 L1A2a5nmc6KQvGejCqFXCM2jqhtWKoDIl8OH2uPB1fmYkvsHOhS0TRuOmSTravnwhCbELET6ee
 zjRB7yRfh8lF1ak//fBV1ErW7BMgQKQn92gw8+7HQdS+ix866l9j6NXS+3QdL5R4tUTG49V+55
 ATxy980a3pmbu1ZNbj+97snhgLJeGS+HM1lvX9Q+okhJC8gEAAA==
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
James Hilliard (5):
      dmaengine: dw-axi-dmac: keep cyclic mode in the descriptor
      dmaengine: dw-axi-dmac: poll the correct enable bit during termination
      dmaengine: dw-axi-dmac: retain descriptors when termination times out
      dmaengine: dw-axi-dmac: use atomic polling for suspend acknowledgment
      dmaengine: dw-axi-dmac: preserve pending pause requests

 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 149 ++++++++++++++++++-------
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h          |  10 +-
 2 files changed, 116 insertions(+), 43 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-submit-dw-axi-dma-stop-pause-v1-c93f1e767169

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

