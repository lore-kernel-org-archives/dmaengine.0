Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792780963;
	b=gupxNWYoU2+EiKe4phDx4e9npNAAR/dtXAc6l+OcRs3sxzAj+apFm2Os52FhiqFfmr4p
	 +4/VAzljKcRQ+R4NgAARYP8iHpEfOJP56B7BAxyUW/pFRfCYEtlg+OEzxA/ci1FoCZu+U
	 rZfQc+rLqB337kb9OQ7mt/EtJLeUcJWVnDygHyQOcyXLYYgaVz3SJBpGxfOR3mhapzfKt
	 b/pWDQyjSxGysRlGeleHbx/mmzcC3XRI7iuO7+3TY6UPo1Sy/ssTQSzFTWgt+3xwsMsbC
	 4Hqu5tU35j0iAOcTLh3r+a4iRq4bLLmtQqBP7b1sSLP74ZjTgP1bDDupBUuSxHyBKfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792780963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=WsTkc8bAO4KYYktDdouwEoWdlbtwYIQKUFGzzo3SgDw=;
	b=yasdHQ1+f+3/cTVroKLuBdeJDsb45x8eXZIXiQd5OwiCuMOZG3phHlv8gIxRTSTPmJV5
	 rvrT2ZMwf81h+qxdELTc3VBOPR/c4xr2onJu34rEof5yE2n9TSb9KMKkOcXpSDr5IAZ7W
	 DVN72m+xTmrBjCO/x4Tu75tF8GzxSFCd/rdCkdp71FBKqfj3kekYGW+B8v0R+deKkueFd
	 HUnp7IQphnSss40YDn4pK3OcgxfV4ptBPckfEq377KL42t+WRfGTxRdD2GEsyQBNdA+IG
	 KUk+n+/wRVD/c9jKhKJ/8W/akpuB7XEkBtG9Lvd7thgk4xrqKQhPVhrDXqxl6jGnGdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nISgflWl;
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4FB606A320
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 18:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E4FB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nISgflWl
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so890451b6e.0
        for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 11:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780962; x=1793385762; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WsTkc8bAO4KYYktDdouwEoWdlbtwYIQKUFGzzo3SgDw=;
        b=nISgflWlWxkiadYYNA7pD/XkUhHCoxZg+EdApAd1JEEuXE8aNDY5yc4/Mo5/EgRlo2
         gl/AMXb9LY+EmsYxSTzVyG9lXNo9gZehv1LmcCHhlbDfCGRNbF3n0sn6yLjsSWVCe+io
         GU6aapMgNWvDgbfN3VZh9QpbMpUj1x1GwoCJUClnc5tOpsY0HUidZ+Cpn5M9qojyD6IC
         ChCwQMWKF3hWM10Kik9h9/OzWKlif+l7QAqb2+ohj8sYtpMKmOuTTn7rSX+JND5sljuD
         TOZcprzrhQGQDq98aXJZJ5IrDt5V6HKXU53Qr+kJXEjuPDBtfw8PWtkviTtyhYS84zY9
         e06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780962; x=1793385762;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WsTkc8bAO4KYYktDdouwEoWdlbtwYIQKUFGzzo3SgDw=;
        b=pvr8VO4KEbYNbDig86lsSR3a45sl2I10K6+nX0yoBxklhuxjxqFe2es16zVLaiFIFJ
         v18qfltMgLu/ObPJ7oHlBsbEx4oUkVuXgIFIRZfgl5fXAZKiaed9S4KO4CLp4Yw5AtQm
         nTkIdai1j5Fm7kOPRfzC2tKzVrwRqTShlX47kmP7aMdGWn+e0Sb9tMV3iT6QAq50jH4Y
         nf5rQkItAy/PkxX68wkuPosQFnMxn+Kzj2wMiDKbQYoOk+EYpK14puGui/7mVMz1uRW6
         htSZJiIbD/J5vy2D9xLb4y1fR2uw5Lr8/fbWv7Z+MBX8C3ZjX67/1cJkXzaR1+5RkTBx
         SU9g==
X-Forwarded-Encrypted: i=1; AKwUvByC788MkRskMcsthnytbmiwLSyclcNLfmWpuZw0VVZwT1F7BysiOwfRlszLMVyUxyZr/xuIZiKo6Ek=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSjcJ4Jj/SuvcS8g4D3drhW1pMyejXnLHHRuwrfBHFUGi3jVuP
	A7Zs6v39LDJ046XHqYCkoG6I4rPGRhJK+pAbWMSD/q+faUca2M9bn9e4
X-Gm-Gg: AYBFou2C9oaUKJ9ScUIKCVgE6vtrb8uew413zDruONZc+PKWXQAzfPxdrj2YCSozBXo
	XXcXiAXHaprFIPTas4Urxf7OOSmGUP5SKidfNSHxwzXdUGaVHe7Zrnx+UydOg/LrES5XJhTMwmA
	NC+sISKoKkzs2dKvDGzrCjqW4re4t+J1KT3BHlSj7PWwPCtEHT6QP/X63t9RBufUYWb9/o1EeOR
	2k5JJqTPayBqHKDjPY+OtH31vTxO00n+W7xp61JQ26Xe8+kS9xRt/a6u3FqzKVLHzICYia2+y3F
	QByI93Sce+GWcqJSV7O3b83p/MS3JKevvhHlhiRkF2sZm8nzTo2MKU1pz+WcCQGq7pU1HCDZ9Xx
	3EtAPIFPX+me6CyyfxxxGBo9qaQyPnYkt7kzEj0VWtNFTTDobOS07/bYCd0FFs2+P723P2egRMV
	Z+s71euMv4X/q6i/rf12iNzjcfo2O0oaVmR62xvZq7yfidWh5omY1KVFkcqTPXGZRfIH1RJC03d
	y0poxCL6oiyEh+L1lcO7A6t5D2j1RIHdinfByoiXBMSbP69RXmOrO6g4epDPXKKWvwlG8iWeOix
	E1iATvvOnhhruebHIzpy3HCKrX5BceGbYNDsYaKQJrIPd07emZXQz6O3bYLSSDBdYkRXN4hXGA/
	i7Go6ivOIrGOfooRE/WkWcTtPrd09jc34aiaVXypZJMGEjtBkhEPIBR7DiLJDF9YF8G/RDSmJLO
	kb2A==
X-Received: by 2002:a05:6808:138c:b0:4d6:92b3:5c8d with SMTP id 5614622812f47-55c00426714mr42788b6e.67.1792780962175;
        Fri, 23 Oct 2026 11:42:42 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55bfe199544sm336682b6e.13.2026.10.23.11.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:42:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 0/6] dmaengine: sun6i: fix interrupt routing and channel
 lifetime
Date: Fri, 23 Oct 2026 12:42:34 -0600
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WQy24CMQxFf2WUdVPl4TgJq/5HxSIPG1J1hnZmQ
 FSIf2+AblhWsmRdyT7Xvhex0NxoEZvhImY6taUdpi7MyyDKPk07kq12LYwyqJUxcjnmsa29Tdh
 kHZP8bExrG0lOdF7lSUtni9UuMATQonO+ZuJ2vnu8bx+6Qz6orDfw38RM38duvj7GRE4LyXIYu
 9VmSMyOMHnPBWPyBaIygIAugqo6gDHVF7QPs7SWfb95M1S0MQB4BJ+Sqjkr5XLn1II5RSQEQ5w
 CPm8x+qI51FAjKQ2loFNs2HZMQDRgVbHZ+/y8FZwxwYfKQKUCdytfuNoembYuElJ2IWlicft/3
 5b1MP/cIz/p+7v/SLeXkkqr4BgDlMhvuzG1z9celther9dfuW0aOdIBAAA=
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
Changes in v2:
- Clear the active descriptor pointer before handing finite completion to
  virt-dma, replacing the completed-descriptor pointer.
- Release completed physical channels while their virtual channels remain
  paused, and clear the hardware pause request before reassignment.
- Keep the ownership changes in patch 3 and the pause policy in patch 4.
- Link to v1: https://lore.kernel.org/r/20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com

---
Hongling Zeng (1):
      dmaengine: sun6i: fix physical channel index in interrupt handler

James Hilliard (5):
      dmaengine: sun6i: handle the last partial interrupt bank
      dmaengine: sun6i: serialize channel reassignment with interrupt handling
      dmaengine: sun6i: track paused virtual channels
      dmaengine: sun6i: synchronize callbacks before releasing channel resources
      dmaengine: sun6i: keep cyclic state with the prepared descriptor

 drivers/dma/sun6i-dma.c | 180 +++++++++++++++++++++++++++---------------------
 1 file changed, 103 insertions(+), 77 deletions(-)
---
base-commit: aff5e6a77fc69a7c490246465940d18422d7c631
change-id: 20261022-submit-sun6i-dma-lifetime-next-v1-53c3158f4841
prerequisite-patch-id: d6398447647aa0dbb005b5e6dc6ba96e642efa86
prerequisite-patch-id: f67c1f8d8d9e014cc650f2f37648662430c3b77b
prerequisite-patch-id: 8522878df4ecd4fb007cfd32611359e6eb58a1ef

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

