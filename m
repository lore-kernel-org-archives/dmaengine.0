Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794808880;
	b=CRDi0HRWtlrGS7QFrtDw6Kcx5bXKJfxZDzva4d4e6Cy2FSHtvHF16aQNBffFKRaAXmsr
	 WpzXErxZV4P6QJ/exqJ4mGGj7+7qgRBVMxyvYfNmsbcWipJwmqFwM0eoWR9WHctRK6wvv
	 GnZVykLfaE8nQg+tDPwXpGrBf1h21rcJ+qyQy0NrUTE3/NVFe6OG/YU7HNdC4LDTM97KB
	 SD9UdwuaqKgSYmiNVrJKZRfktS1dSzuVo6DVfwpEp51BsK8Nvl375S445Rj9Tje5Q5fLw
	 +nsLBLcVbwAUpxrq3MNLG0zz8Br29+fD344i6lyn6y2iI+uBwFv5Ue747eM9qr+9wuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794808880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=nePOsiSE38oIpTj8kEKJWPw4XmKgSjPcHWo82NxSsVk=;
	b=UrRD02D3f1FRCVG5kFhQjVBTf7Di//dsK0CuhWoYiU3mxNJoqqc/T+yiIAnuZqY8gwil
	 3kPAzDqzlX7tuGsZ8anjylNjqUbZg41TQ35HXD4Xrdczg2MY/MnfQ4xcw4jHcSJwOwp8n
	 +V79plEhDkFZeKqZ6cbceqNn+57O/TMsW+fyHg+hy9PzAz7Aaly4U3+SRBP+Udyrj9Zsi
	 J64u9CeK6B00s6ps3L5sT3GPvzQF/p5XwY3FI+tGn8IKlKDXjF1XKAUwlkWPZTJHW3plT
	 LomEh1/y3aSI/hn1ZYowlfSbPzdwEPpO3k/frqJIarSoWLZHESj+rQ9gBr2Sosm2d+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j89hqomv;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AE3606A31C
	for <dmaengine@vger.kernel.org>; Mon, 16 Nov 2026 06:01:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9AE3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j89hqomv
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-86103aaac12so2739792a34.0
        for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 22:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808879; x=1795413679; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nePOsiSE38oIpTj8kEKJWPw4XmKgSjPcHWo82NxSsVk=;
        b=j89hqomvuimomVSu1CF3ItRhsmN5PYi9J+k35y7awl+izbLhdkQg395cbWoGtk2n9L
         YONflXRLAiEHubmjtDiAjVPf9G6EXs1rophJKA8ahTBa8UMoDB6LXRPokSgLTUOPACOF
         CFBALFog2JulqHIEdgiJJM0gJP2fOABJ8xbJ8pYuf0H3WQDalLm28dHLkSDEcru6lN4c
         t4y40b6WvXzxkGKa5YkqP5ngpJSVywwHzWu24OF7y4xXXCAmiqvb8zc5MH9o3qDV/yDH
         /Jk1/kcP+QhY/oQCRV37WesmNBuWyVPJDqBfC6TG7d3ci1sNNOKwDAY9Qn4i9luxGKJh
         NX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808879; x=1795413679;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nePOsiSE38oIpTj8kEKJWPw4XmKgSjPcHWo82NxSsVk=;
        b=wxC28GWTSBYpUjOxlnTxUhNlz7Fwt65r7AKCHhYXoytzKWTjXAHdAKQ66uOEn7uUmz
         S5g5mIie4njxll1+o2d++9mVFGvTKrh3FODyFyYALe+fV7Mv5kkBhGyZs58R8TsfNAGh
         VI1/VHYzkwCt2pL1CohsYF4m/WB3I0C+mwz1mq7PSpNIpUyVsjjpPABMaEaqr5zxCKut
         n4nqiLVleDS8iUlVMmPjTGjsh37TYG/Q7YQOysH15ikyDCY8lXCztN2FuGuXLrzOgmYg
         n0k3/nT3C+bfR4SL8VOGZuitZz7GUyhW/N6XRe1+Lt7WzhS8/ZWdnk/iyQrkBP01sJRD
         Xjvg==
X-Forwarded-Encrypted: i=1; AL+hErHO+lEieIfZ7lxZ0nOK3k7gWcCfXmmpWa7gsIiRqJizaEtLsPeqN/pK5uU2VJFx0MKkY909Ybnn4kA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Wp7LbH18UOkk8Txe9qV3dN4yQg6MVQuq21Vyp9CGcF7r8JxXt
	x6kig26isvhQGSvnJ9L80z6qloCufe09XEJLi2Mx+mjbDCuFQXZwsoPW
X-Gm-Gg: AYBFou04L4hfZ+yNMQSfZS1lMx6lfoyVd8b6L3ay7F0t7IGMEtXbSjIoaDx7vm3Bvp7
	fYlHY4lkuuI9bllWbUox6MXNYwqkNREdqq0agmkPeh21ZIwkfumLYa4R2b8PX+payP9BoG2OrKx
	LFxo+lJmKAymnN/NfoAMpit53fm5ONO4yLiFORG0kcR0Zr4eP8a37dMUYeu56grM76megOIfOky
	VvQZ95xRnCrrdsSc3b1ezmEdhs0XD4rdEPgB5hmrgoLE8zFwXaevH+cvNASdYSaH+5IfRMpKme7
	nE8TOxgfDeqB396vYolVEa5WJaGhJQbcvuFR1aOG8Dlw05S/a4gcoI4HO8fXQJkYQFesqYnBBkE
	FU0pLVfuxR1/vwm5QQ5U3OwWsanRw2tr2XE90aViPYdh4ax+Rrg0TqVpPKoPFqfD9i4Gwh6PsrS
	w7T/nGOJcjhXWoftz/Pwguw3OBLJgR+ccwpDKQnkluFRuFChRWrxsQzfNrU5RziWY6+uYLo8L7k
	6n9vtgYpc0qwnXJabzbXjbl519LjV2QZnnh6UvALa1sxmeefi8HRXmBhsMQFUN3DHGFBBAGkXO6
	vhhbwi0OYJoLRCEWd6l+U45mXpNMLfikPBwJZGR9kW9pQIrhiHHN0Z2+YvLFyxcbrckMdkH3kCH
	iZIiW5SLXYqpISllis8t/RAulAKe+/Nnp8PPua5mmwIgF5FBEoMnodLFj3BPbzhgsjlhLk4HSGr
	F+JcyFNYrhU6fn+7gBrboxWa3PpnyN4XUATi/epEE1fMfubL34iyA=
X-Received: by 2002:a05:6830:448e:b0:862:bb95:4148 with SMTP id 46e09a7af769-862bb954527mr1954757a34.33.1794808878766;
        Sun, 15 Nov 2026 22:01:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862881a965esm9375160a34.25.2026.11.15.22.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:01:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v6 0/7] dmaengine: dw-axi-dmac: fix termination and pause
 acknowledgment
Date: Sun, 15 Nov 2026 23:00:41 -0700
Message-Id: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-0-bcb23d1e7029@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43SzWrDMAwA4FcpOddb/G/3tPcYO8i23HgsaZekW
 Ufpu09pGYTCyMAX+eeTsHSpBuwLDtVuc6l6nMpQDh0FZrupYgPdHllJFFeiFobz2rHhFNoysvT
 F4FxYaoEN4+HIjnAakE2cRS8zR2ssN74i5dhjLudbhte3e0zEO8ZxZucbAehl6KGLzbxFF3r8f
 P4jgZlfNIW2+u9b0ROf5f/XR6tmUTmM3KNHVC/7FsrHUzy01VzfJJaeX/cEeUZBIjNl6+WjJxc
 er9c9SZ7UOeUALhieHj219MS6p2YPQxQqCCVTePT00pPrnibPaSFB2KCtc0vvuv3t34kmabx3/
 d5gOieXJssIhzapaILQ0SXuMpdKI3l1EtwJD4AW1W12YIwNDeBuk6NUUrlayjqBztlr1MJy720
 GS99qvbVRBEclXH8AgQsj6dQCAAA=
X-Change-ID: 20261108-submit-dw-axi-dma-stop-pause-v1-c93f1e767169
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org, Wang YuWei <1973615295@qq.com>
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

This series uses the shared virt-dma descriptor-retirement helper [0].

[0] https://lore.kernel.org/r/20261115-submit-sun4i-dma-callback-lifetime-v1-v2-1-fb7d258702f8@gmail.com/

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
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
James Hilliard (7):
      dmaengine: dw-axi-dmac: keep cyclic mode in the descriptor
      dmaengine: dw-axi-dmac: poll the correct enable bit during termination
      dmaengine: dw-axi-dmac: retain descriptors when termination times out
      dmaengine: dw-axi-dmac: use atomic polling for suspend acknowledgment
      dmaengine: dw-axi-dmac: preserve pending pause requests
      dmaengine: dw-axi-dmac: retain descriptors until callbacks drain
      dmaengine: dw-axi-dmac: serialize interrupt status with channel reuse

 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 183 +++++++++++++++++--------
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h          |  10 +-
 2 files changed, 130 insertions(+), 63 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git fixes
change-id: 20261108-submit-dw-axi-dma-stop-pause-v1-c93f1e767169
prerequisite-patch-id: fc343480330da5ff95e5271997fa71107977c2b8

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

