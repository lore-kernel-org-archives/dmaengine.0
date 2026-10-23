Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725298;
	b=RcWUEFtDj8EQA+De23yp7Aoa/9pWX3LAuYtX/BAQgfbWAi71ynjx6qlXy8pd3XJ48uBm
	 5VZQDDAh2WEjPosgieMBR1C6GRMmytlTAwgR5NXc74OHF3Y2M6o0/ffIjmocxR11Bx/Tf
	 IqIytlPHCGmoS4SqDJGuht+CNs4HCIxZ6O4r5qXH6J65gv4JRIWpQbym8tfh2yxAPvy/F
	 J62iWgJWPPBXS3Xqbml9tlci4nN6guXox5KNLW9nVbiRVrl+I8M6H1jh9lrKsu09usWVz
	 ejENZKEIC+tkSAQrlFZ9Ruv0mda04LQA5yBgfp4rYMVd2vdV19H0qmKH6C+CAUgxQ0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=pm5LxVvpIboHfA4NG+PJUVszg46D0jGE/bRr+E4n5SU=;
	b=kKu8JDv9y/scTDjYK3Fxcw+1rCn0ywTfAsgarmm6Evo6uLLK0owaUR6INimR8X+JmK/L
	 D81u3RoYV+30nNGsTTnYVupRzN2154EO2CYQD5nB1PeQbwG0YP1EOztGNM4qrrbmz+eE6
	 XyoQHCr3NPuJC+9IY2QkPt7K7O3CGHZD9ngnwDtnUG74E14LCvaBG3E6upfZSSRPM+oxm
	 H/eo7Y9/8yZVjm8Ne38QxV1rK287vkOj3qqSQy/JZ03K/vzb4VJD1uHrw5Avle6oZIcsW
	 MDMNk9Axu2B9HAcpkkWNdUdzh8d4X6txtA217nJQiPXmF3MuXaIC9a7YRdi9b+qBi1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CRVuB6t8;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F2C606A31F
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 03:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55F2C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CRVuB6t8
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-82109f51565so170284a34.2
        for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 20:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792725297; x=1793330097; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pm5LxVvpIboHfA4NG+PJUVszg46D0jGE/bRr+E4n5SU=;
        b=CRVuB6t842ohZa4yXpdvYfpQQB+JZ8vtj27hDtwFjjfsa5UNrk86UJADeCMRsIjxqa
         w3B0jVWLPBZUayQWGSrcT2aVnDgXTItnaxgoVlpFR0TkgL78lUqWRpOcvw636S8Q09BG
         yR4yZSeT1NkERpWwOviqLHXzV3/8WJ67nFc+NIOzQ9INUQHzivATserbBlCItdspp0t9
         nYl1KBzbtHGGlRvN5XPXIpomcPCI9a2tQ9/MXBWOYl1Dwfw62iIR875KX9VjUuKyvNoY
         OiHfKDksxaJAduJszJFW28kswLh+IGB637b2ztelcdgk89wOHROuaxIiA5NcCXkKEzX5
         RhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725297; x=1793330097;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pm5LxVvpIboHfA4NG+PJUVszg46D0jGE/bRr+E4n5SU=;
        b=Ik5uwqvmUfq+Um6w8iGM5pZlSU0Sp8j+xkkoyPFkZj0kTY99W8jTtvyLdMXGmJk8nS
         IZSi9fU21gfaycKGehlYSIc+bAxtuJ3f2KMwup6A5/liXi7w79pHPwMOgj3g1akVYBsF
         uDYXTzNeQSpGElUi+HOpTutxi5B4L9dHMjLWi7661NaAhHQeXPNUt8wJmfp8uLqzGQlj
         7CENsNNNmMuZUSVM/mcU4WeAIepevefHUlgStEVTZdWXnW3Qy6MVdMFt9WFxhCFeFw5n
         YpxinOhVK5CJ3bp/OZjO2rfp4hAPjEiznsQTjXa3h2rgUwtzjz+c2BdWVCI0rVvfSinP
         xPng==
X-Forwarded-Encrypted: i=1; AKwUvBw+50Y4xJgHkZda+QWmqMsXIxj4VUI0Yo+id1NYK+iVIt3L/qyFsgGJTkddOqdfIW7qR4b4Dsrs58o=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/rwXtFtUcSP6RO10wFjPEeCRwNOOmVBqb9j+GImAKaMuf2mMl
	6SeJlik4aJhUjifyPN09yqI/jFGhddyHuiurclmEziJOQHdK+Q1bRxYe+R/P8dzj
X-Gm-Gg: AYBFou31mZsKPNPcDofnT8ZITeFKWELxP3mUF4jjjzdGHLgvpBVraU2tHYAue0+UaIT
	6ZbdJcvcHNILKACSWhVDC0CZvhVRXLibUCudiyG1YAWBERZkqStNZcwGd6ed5yWtTu8pMvKGmtE
	1W0SPBHWoQOCAjLGISMRZPr/oU+JErMRZytAJPsGD4zMnTRbYVKISCr8cQGYn7WH54UiZhh1NRm
	to5nDJI7f/ub0/TQFt3MI3WMKLAHccmkmycq12FVY5oEYOq9J2SLDKKfHXtoDa8l/6nWi15OsLf
	BdyzMoXg7F0zO5fUoqy+g5WKkdcbt09nCBnheIu7neCEP9AxrDpJmv1dQGv3/vPPzjqV9po23gQ
	7lZGKla6PA9t7w8HYARS/e5O8lw46QS3bhLQ7TWLS5Y+Tq4UtKSv+gJHLBKK0w72ntkE6f+aGxr
	nWIjuxMCxA2TZy96E5M82L6186FFsfc/lVfWu9u32eanGyP4YChXAn9b8z1CIYmMm4Q3Wqb3K5R
	HVEbfJnOancTVd256oQFwHduGWkxHPOaqt+rylWQ1rEHtki+FoHbgByjjTLYlMNfUoq25MGWQlf
	ZvS8hdqRouS/rW1Fkk0cXA3VLiPSdTSFJC7bWGw7yvmeSzgy4ZPDRRpif67TwW+mEIuDnJCQ3T6
	mLDfWID1ghaowyrKg1vJaGxuUUD/pl3Fr7pkAa7umfNzu/X4H0fF7HZvBYQAowOsqH1xQbzBCU8
	rc+XM=
X-Received: by 2002:a05:6830:412a:b0:821:94d2:83cd with SMTP id 46e09a7af769-84fafc689dfmr760717a34.9.1792725297222;
        Thu, 22 Oct 2026 20:14:57 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbda584d9sm938638a34.13.2026.10.22.20.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:14:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/6] dmaengine: sun6i: fix interrupt routing and channel
 lifetime
Date: Thu, 22 Oct 2026 21:14:51 -0600
Message-Id: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WQy2oDMQxFf2XwugY/ZNnOr5QsbFlqXDrTdmYSA
 iH/XrfpJitxQfccoZvaeO28qcN0Uytf+tY/lxHsy6ToVJY31r2NrJxxaI1zejvXue9jLNh1m4v
 +6MJ7n1kvfN31xergyduQBBJYNThfK0u//jlej488IO9M+y/4f2Pl7/OQ7481VcvGmj7noTpMR
 SQwlhiFMJdIkI0DBAwZTLMJnGuR0D9kZafTuPkwNfQ5AUSEWIpptRoT6uA0wloyMoJjKQmfW4K
 RrKSWWmZjgQiDESd+YBKiA2/I1xjrcysF51JMTYCpgQxVJGl+vMz6kBm5hlQsizre7z+Uy8BEc
 wEAAA==
X-Change-ID: 20261022-submit-sun6i-dma-lifetime-next-v1-53c3158f4841
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

Correct interrupt routing and serialize physical-channel ownership across
allocation, completion, pause and termination. Keep paused virtual channels
off the allocator, drain completion callbacks before releasing resources,
and associate cyclic state with the descriptor that owns it.

The first patch carries Hongling Zeng's physical-channel indexing fix [0],
adapted to the configurable interrupt-bank size introduced for A733. The
second handles partially populated banks, including H3's twelve channels.
The remaining patches establish the ownership locking, pause bookkeeping,
callback retirement and per-descriptor cyclic state in that order.

Based on DMAengine next at aff5e6a77fc6, which includes A733 support, with
the posted IRQ-safe locking fix [1], channel pause-bit fix [2], and the
virt-dma synchronization helper from [3] applied first. The synchronization
patch uses that shared helper for the sun6i device_synchronize callback.

[0] https://lore.kernel.org/r/20260706064123.66035-1-zenghongling@kylinos.cn
[1] https://lore.kernel.org/r/20260926171049.841335-1-tien.nguyenminh@embeddedlinux.blog
[2] https://lore.kernel.org/r/20261021-submit-sun6i-dma-pause-bit-v1-v1-1-38d286b69dab@gmail.com
[3] https://lore.kernel.org/r/20261022-submit-mtk-uart-dma-synchronize-v1-v2-1-fdaef0e2edd6@gmail.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Hongling Zeng (1):
      dmaengine: sun6i: fix physical channel index in interrupt handler

James Hilliard (5):
      dmaengine: sun6i: handle the last partial interrupt bank
      dmaengine: sun6i: serialize channel reassignment with interrupt handling
      dmaengine: sun6i: track paused virtual channels
      dmaengine: sun6i: synchronize callbacks before releasing channel resources
      dmaengine: sun6i: keep cyclic state with the prepared descriptor

 drivers/dma/sun6i-dma.c | 153 ++++++++++++++++++++++++++++--------------------
 1 file changed, 89 insertions(+), 64 deletions(-)
---
base-commit: aff5e6a77fc69a7c490246465940d18422d7c631
change-id: 20261022-submit-sun6i-dma-lifetime-next-v1-53c3158f4841
prerequisite-patch-id: d6398447647aa0dbb005b5e6dc6ba96e642efa86
prerequisite-patch-id: f67c1f8d8d9e014cc650f2f37648662430c3b77b
prerequisite-patch-id: 8522878df4ecd4fb007cfd32611359e6eb58a1ef

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

