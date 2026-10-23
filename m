Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798712;
	b=zAc3q8Gs/jnpRUGufoZqUSRGz9HIxMX8m6H4g2J00jGN6K9kHjNtHpQnADYGhxmEyhwA
	 N5OKLxeC25I01Do4IegDLq7lD52qkwGw3r5pye4Ok4zw9T+T2fhasXV522IEXllGVNY8b
	 42/qWr0ImfF95OkXY7RNwk9o6Bc/N8G00wOor3uxqXEYQ2ulOkvj6paTMcpQCnjPgfIId
	 UzYlCKx+p4g4WLtCo/gBGLrsULUah1SNKWSbcCV2By7AUcVDKNcj3P2pOwJ5z5GCKZjpq
	 ZGyQMN5BQeQhAt+/xL+ujtRZ1eL43P+4qYO1couGRuB3ne3zYuCAaDIEhSHWmFZIp0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=5TT2qKFHVhSy1i/+TLyLe7Zn0Ot6zl7si4UQtRA1syU=;
	b=ez9BwNcCV+Zr63F3eKcgObXAQbm7KZHkhdzAAMO7rvPtm7aEG0GMalvfZrBCcvhcP4n5
	 saP5r/cdl44o/TRPYJpmqh/NmoF8fBWQ+WQEvTTRs0bJL1YG0td9BlWiIDP+YwwSlT6PS
	 qQgbK8dDndWUsRSJmOZ10zRclr3UyaXK4zuB+fsIoDLLkoqzrzZ2VUNXt7Ti7BZ3RluAI
	 +DIUgHoxhvsKtC0Sk7OTsOl8qPcD/3LOcq/EyIaqoiYoiE59UTVL87lOa80LJYmilMxcb
	 BDLwRN6Xh2bBfEyX6heYb9v8bHFqlsPBdu8r0bTvCXWrcQXfw0qMq8Sm964CVm5dN/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pr78gAlz;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F456606A31A
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 23:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F456606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pr78gAlz
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-486f013db83so622686fac.0
        for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 16:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798711; x=1793403511; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5TT2qKFHVhSy1i/+TLyLe7Zn0Ot6zl7si4UQtRA1syU=;
        b=pr78gAlzIXC2FbL8sNXrCmDIy6hbfD5+knzM2ksncadeYNbBT+mbUxTIsKetSu2pkp
         nm+3OiY2AXnrd1DBeSuwR2KtTDvgbnY/0xOlSdXDYnvi2lw3YQvjbD+lJkrR4s9ILHIS
         F3ZhBMjLk8pMlfASxX2R7+HF8Vhub2/7/x8jQwaREFdoPw0ftZ2ohtdy+72lR81qU6Tq
         lc5GxvxDeUPBFYGMcnNtoijA6+zEL02Y/VmMKokouG48V5/jqSZYKyU0oAOvi1BBgx7z
         AKFCp3yKeiRZcw3k9wHkst5PZ8i7fMbcCqZvfHLTwz51ft+/6MtFjK0X0rAA5FMImT+F
         j9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798711; x=1793403511;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5TT2qKFHVhSy1i/+TLyLe7Zn0Ot6zl7si4UQtRA1syU=;
        b=GsmYsYai2A0h09u00pCruOuH8b6oBnP1nSgYb+lpkCtW+gkPAOiB7gNeneoqxvqQt/
         Yh/ESqVvcM7r99nt3PnzV4XplsLmluxRPh9HrXpVMTmPwZjLHfBbicpaQiGofzkk5RQC
         XKQlkP1RQXeEyUc7QuhrpvgqyDabH+CoyeoM82kwD6aOmxedF8i0tsv4xZsRZYd5gY/S
         bSVC98bV0h0L2cS28+6K2UFyoahtTkPwdmgSq43UUnl8Sg7UkGydkcdpoYd5gCLcRQIQ
         3fYIhalOj/5iJRRGq35vstSwPINjQyvPspZ4NsJtJ1fBv2v9yIESX0Wy65FRFLwRLse2
         ipYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzPpvEx4PLN/5wWgsFwo/2gWG5dcW9eDoBm74S+ZWXEu7gMfP5X+i4pnIuhYv1caaOaTanrn7xbnA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHpqxn6vhg313SytCrAiKE3+YkRB6DpTyiVElE0mHhkwOVtqq3
	syGUynXD+v3WWrnA7L8bieiUrBWYza21RU9Vu8uzBXS4cMztHdIlsC9jHRhc/kFQ
X-Gm-Gg: AYBFou1uxenCMVpB88s1jBlYZY0ZobDqolrJK98d7dfKQpYtRtJPoPiZzKUAfe+9L9t
	Gbudc+xsNa15tWLuWv0yCmfN/gFqrFTvXwO0bHVK0jh37dsNON837oZc4udQ6y+rNI1S8eexLhQ
	YSrK5XhKuQ3SzaTpDwmZUNByM4LwvqrPkax+esiN4nNex4WMXu013IV6WNqCtXKcEm2qtU2kx8n
	Cou4+GbE7mlbIOTJWmV8tvzhG67uL/4p1nFKhH0TmVy1ZJdbPlPs41JcxwepbzWEhkj/i0YoWy3
	52Qj4u8d1574Ow6/QJdWWVwXegCbp9Qv7ZosZaVTdKRQqeBh3//WYG2v/fl8uHJb7Y0XnTKwnm5
	aDfH1dyFpWreiH1lPhDN7LMT7zziw1Bhsid+sOPXbC6ZQHBO2SylHNB1Ilgc8tIvwiquctzASub
	wBwbC+TUkkmu1MftVmQRr705Xf2Ybarux01xvSgXYej0/urZ54UrkmUw2e7VhT0IW6OMOv5hxeG
	pZ/9MXa5fXxWKJy6Ok7Dimbyt3DaL34SqzKCx10eg27gh11BV/V0/i1H+uj43oZbqpFDXOHQNdc
	lIT8vKvAS/95eAMhWq+4BzHv+X2AiJmPki6CUSKcx8efMeYLBklWxyVpYrAQZj1rTrJLTk6avBJ
	JjBKAuoPGQMaTwpotkCRZ9EVg6UTe4QGRpbokukZqDXdK5iyyuPaZGNhaahLEyOiBuXZ+Ab60R6
	HM4CZK
X-Received: by 2002:a05:6870:71c5:b0:494:a88e:3ec7 with SMTP id 586e51a60fabf-4a83f5ecc73mr613357fac.39.1792798711052;
        Fri, 23 Oct 2026 16:38:31 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v3 0/9] dmaengine: sun6i: fix interrupt routing and channel
 lifetime
Date: Fri, 23 Oct 2026 17:38:19 -0600
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WQzW4CMQyEXwXtuany4zhZTn2PqofEsSFVd2l3F
 0SFePcG6AFurRQpGsn+xjOnbuap8tytV6du4kOd625swj2tOtqmccOqlqY7qy0aba2a93moS/t
 GrKoMSX1U4aUOrEY+LupglHfkjI8CEUzXOJ8TSz1ePV7fbrpB3pmWC/h3YuKvfTNfbmNdTjMr2
 g3Nar1KIp4xhSCEfQoEvbaAgL4HXUwEa0sgdDeztNC23bxeFXR9BAgIISVdctba58YphDn1yAi
 WJUV83BIMZCSWWHrWBojQa7HiGiYiWnCaXA4hP25Fb20MsQgwFZBmFUiKa5UZ53tGzj4mw9Jd8
 m/rvOym72vlB3ON+49229NKGx29YATq5WUzpPrx3Mq60g/2nuj+QrSNSC1uIALIEu+J5/P5ByH
 21fMkAgAA
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
The ownership work is split into lock ordering, physical-channel locking,
completed-descriptor retirement and interrupt cleanup. Pause bookkeeping,
callback synchronization and per-descriptor cyclic state follow separately.

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
Changes in v3:
- Split the ownership patch into four commits covering lock ordering,
  physical-channel locking, completed-descriptor retirement and interrupt
  cleanup, following Frank Li's review.
- Document why virt-dma still takes vc.lock independently of sdev->lock.
- Check pending interrupt status first in the per-bank loop condition.
- Link to v2: https://lore.kernel.org/r/20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com

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

James Hilliard (8):
      dmaengine: sun6i: handle the last partial interrupt bank
      dmaengine: sun6i: take the device lock before the virtual channel lock
      dmaengine: sun6i: serialize physical channel ownership
      dmaengine: sun6i: detach completed descriptors before invoking callbacks
      dmaengine: sun6i: retire interrupt state before reusing physical channels
      dmaengine: sun6i: track paused virtual channels
      dmaengine: sun6i: synchronize callbacks before releasing channel resources
      dmaengine: sun6i: keep cyclic state with the prepared descriptor

 drivers/dma/sun6i-dma.c | 183 ++++++++++++++++++++++++++++--------------------
 1 file changed, 106 insertions(+), 77 deletions(-)
---
base-commit: aff5e6a77fc69a7c490246465940d18422d7c631
change-id: 20261022-submit-sun6i-dma-lifetime-next-v1-53c3158f4841
prerequisite-patch-id: d6398447647aa0dbb005b5e6dc6ba96e642efa86
prerequisite-patch-id: f67c1f8d8d9e014cc650f2f37648662430c3b77b
prerequisite-patch-id: 8522878df4ecd4fb007cfd32611359e6eb58a1ef

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

