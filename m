Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794366918;
	b=zoox4ncOG4ODq86lp4TDKAf22sCuj9kCQDILeR6Lmv20cOuRAnpFecax0FXrGTP6ov5L
	 tEs0Zckjw/ikds4osRSRGhZumZjNvsNKqbjxUs2cD9tQ6iY3MJZLs+hPleaioc4eq/x08
	 LRP0tSJ1gqkxU88Tui52eszgoh8IURLTV5raYA2PdRc4TPkeZPSfiFiFfZhaKFZNUYYGe
	 vgLbVQ/NXm+hFT6T8n8voD19Rvfj5gQsteXYxUb/P1HMKEr0A+ltA44FnqjUpYHMf2r3+
	 VDuk41epd4cyb6wpktiKFdoLIYg06xI7vytvJ6KCXBUUlaAU5cUmBlgJQVypnPIQcgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=XkFwzz+nsZQuIbU/MoU+CL6VdYaimSfsq/YYqrN+wq8=;
	b=vA9ayHdEc11NfoBrJK1doirkggKYTuc8JMZXcRMkOKu6xCBhoFJzip1+KpPII2LVEUmI
	 LdGCMJUwfuxX8kB+0a1+S1w5XfKgsmCdGiGxSUeWBxVbszKZ9d9p4EpkXJgChhweJ5lS6
	 tchrRLodgd8vCfU+G1jUK5+gbORePIHHLlCzEro7dkcpXBI8Dm/pVxdAjsBvgfQUdNjg6
	 LiYQc+6Lld1x7AwA8GDpnGdDVU1jlaGbPJchxF/DBiMvqqO2wFvlpWds//s3SeDO21PSk
	 taUD2idOxeEfrxiB+7IoqcTb7xhlBwAl2mTXNmvHuIWtWIWPvrp9XX36plZsIdERXRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EcEGLZYW;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8DC606A320
	for <dmaengine@vger.kernel.org>; Wed, 11 Nov 2026 03:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C8DC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EcEGLZYW
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-53a448f86e0so1502770b6e.1
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 19:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794366917; x=1794971717; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XkFwzz+nsZQuIbU/MoU+CL6VdYaimSfsq/YYqrN+wq8=;
        b=EcEGLZYWauf705j2dXemnFq9TPU/u+piYGtJwaMA3dzdnJwpvYiX77mxUKHCry2ip4
         YgGQmAiv8bZ0dP/SiCXDJYqw7eLMZ8dKHx2E8/eFM8s5EqDceStRMAfp9F9PITBksXXU
         stVUyMJ6gvH5z2Ta+kDzRZmJJytE7BtnleejthG3ljI2yaI6fl5XzPPdS+ZA59yXGMLp
         sIJ4Q9f35mxrXxNsPvbtoskibvM5+Jh9EHT8sEdskWilyQLmDoaI43jDIWDVO5qvP1gP
         XyJ6pCFrr0pVeSkOgWjBSHNHT6v66ZHz4S+yeN+1ul0HAkPm8qcGjLhiyfTsjUL4k8GC
         TeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794366917; x=1794971717;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XkFwzz+nsZQuIbU/MoU+CL6VdYaimSfsq/YYqrN+wq8=;
        b=uyCs8Dibklvdc4P8cMcNAUvOSikGE36awH/ndvtEps2H8P/GZGOdS1/rEzFW5yM71/
         4GbpxYXgTnBpQvWqjULlHVSYMdhHBSfFuU/0zCk3nFE1TW+Sh9ieDbVI2Yzq4Sczg06r
         VFPFZIpev1ICRovIfln7H1SmRLp3FYVS4IyW0rifKZXqabwv0Ir2rVa8SZpcgstUYQWR
         AWsoCB0aWUJsijG8FEZsyOSsv75EEWNEZ2IR600ugdxwcl43Eo3qYFeCS5ZFy7rSb+P3
         6moW0cR6ilJcPxbqBBhucNseLU+JB4BxvHFZ+r+D0Q9YxpiEXWrQE/kIvoDdH9JhSHBR
         05Zw==
X-Gm-Message-State: APuU4Z9K6h+jBLW9en3h6UyWtwvjjaF9PfzEKP6nuBilLo42qs+pILog
	3vFxnvGjgpnvV/l8cANQERARLJlmUT8xr7fiwG3ImKN4WqwKuqHl5baK
X-Gm-Gg: AYBFou16BpQR5U/Ig4W8H4VoXlXgIwnpgexkY877WJZVc0p54PU40Te2LIMswAbk4Xb
	6BtAnIVFMoi2zJWN1X++/1UrMuDolZnlo5JjejPuff2Xz33Ul6/d3S5J4UzZWPd6ZxpQRrBKkDr
	JV4/8f3K13Ko0N6biZhG+olWS2IFps67ZvZ1SWoU9i8WK6LhvbcyJmp45+ejKalPTdAngPpoRLc
	LZ/szL2J/ytNzKK/gsWZ/lm1YBqaRF5YV0vD/QeelJMofSzmyF3lsay6oFPGshZ9RwV8wUZkPyZ
	ileIREVn7sOSVHtsZ3ynpL6sjTAu3qRS72+ka9ccjmZU8T5/602oLAR6afJ1ON/0ttcsloLRGPd
	jgbOAhnK0YQ8OG0XMbfdoouMJR1esalkzRdmcg7eO/YpsqzvV3RxXzQ3yuThbviWCnKfiQB5iZw
	HWm5/V/27B59pO6TRx5cSsVqz7dFRcnCF/qeL2r/gNWwMSGJD8bN/pcD7K07WN2Lcvgv6QOQV3o
	rKw4oLBGNRGk52c9Y3OvYyKagORSZ16vp/yn8u3S/ToNwZ9R3af5K4o6NgAhMIGyTNqVo/ECu91
	AtRRA/mVPEBpz9eE6B05oXxN2LKDYjeGPB31v2prCpQwo0Yt3cgF5UvbEKv1pbhltgMvxZtnPmL
	J8tOxZ3vBR/ln+SsmV02j090q+4YSAIWnEu5swOuNm9QgqTgwwPFqR4h8s1YzqLeX/dNSlnx2Ok
	UNbeo0F9wv4YGnS+JmnbwstBpUwC+iltgthoKw2+jmJveZQG93sRE=
X-Received: by 2002:a05:6808:3a0c:b0:564:5fe0:dd60 with SMTP id 5614622812f47-56b92843216mr1025863b6e.9.1794366916979;
        Tue, 10 Nov 2026 19:15:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm3999345b6e.3.2026.11.10.19.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:15:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v3 0/4] dmaengine: dw-axi-dmac: fix termination and pause
 acknowledgment
Date: Tue, 10 Nov 2026 20:15:11 -0700
Message-Id: <20261110-submit-dw-axi-dma-stop-pause-v1-v3-0-35fdfba8b61d@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OwQ6CMAwG4FchO1tlQIB58j2Mh7EVqJFBNkSN4
 d3t9OJNk13+pf36P0VATxjEPnkKjwsFGh2HfJMI02vXIZDlLLI0K6VMawjXZqAZ7A30ncAOGsI
 8TjDpa0BYJBiVtxKrspKlEqxMHlu6vy8cT5/MxBnNHNk40WjebLx2po9fTKLryOHus8cTPfEN/
 3iXXGSU/u/DLwVT1GikQoVYHLpB02VrxkHEPkv27anfXsZeWWjLpm0rlX9767q+AEx2aNxSAQA
 A
X-Change-ID: 20261108-submit-dw-axi-dma-stop-pause-v1-c93f1e767169
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

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
James Hilliard (4):
      dmaengine: dw-axi-dmac: poll the correct enable bit during termination
      dmaengine: dw-axi-dmac: retain descriptors when termination times out
      dmaengine: dw-axi-dmac: use atomic polling for suspend acknowledgment
      dmaengine: dw-axi-dmac: preserve pending pause requests

 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 120 ++++++++++++++++++++-----
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h          |   9 +-
 2 files changed, 102 insertions(+), 27 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-submit-dw-axi-dma-stop-pause-v1-c93f1e767169

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

