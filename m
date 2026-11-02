Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610442;
	b=hstJyIHqPusrBUkFq5xkSKKueUlyLKZbtI3B33wuraMNBhTNguJ518a+lW1UipCddW/7
	 VTEZ/gF/lziVKpMMviMBWdY1uuXFDAUq7ZPCVViPa/blg9mCmLi9p6rDYkr3tu7bz/xig
	 yVrSYvhOLmJxptG4aeFI5T0pAWTHlxkRyedN/zyI6iEqThPhmrzUDVUcmI2zYRLTHFVlz
	 64oYFR1+Kz5+yk+Jx4upV+JJ2vZCxWPqZMkSrzMO5GjjI1KGebfCyjUQq5lXkMNQcyoRs
	 dmhn6EwDLbHwQ1nAskpvghUvlgtQHcu5391JYcs59WASLl229AePZfY2/vdxPDIXBWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0psKvGpXEPVjkMgITcxJRsy+QYOsKaV08NZl4OmSHNM=;
	b=FITq3HEsP6k24lofWA3tlm21QpS0S2CZFhKXRF6qIlQqmmu/eZW5TrPmRtYiSDybcfI2
	 amVFkh52R2TDsSxmQTk/B1ekRw/22aTg8BnIe58sl7o1GdGFIFXSlyaIeqA5Ck0iXs4Rx
	 /e8X1xp8p+Wkg5cY7jj8s2pTAWFNpUYretLe2UPmbGZP7dBTf5pDhSxXg4H1H+ri0bLd9
	 vGGZ2neihIZ43PEWToWvi8+4b6wC8M49KgosaHHq30CAhQPzE8SjQ3Rvx3ySCf1nQnNEQ
	 UL2ziXRzCzRclk8RzKioHktydDE7/FvPo2yI5ZdBBv/G4UwB4X4CcW34FfB8t7/scIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GB+m30p9;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F09606A32F
	for <dmaengine@vger.kernel.org>; Mon,  2 Nov 2026 09:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19F09606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GB+m30p9
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so16759875e9.3
        for <dmaengine@vger.kernel.org>; Mon, 02 Nov 2026 01:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610440; x=1794215240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0psKvGpXEPVjkMgITcxJRsy+QYOsKaV08NZl4OmSHNM=;
        b=GB+m30p96zaoLLUhCVQVQwRMVqd2MHv1F+TOUvPM2VnbGWdRVJ7uLFKQ9fBLvAtR02
         k8S5eAGIqffL3cRcmXbWBHjeElNoQeM46fpBus83My0MyqslxbQ4qBwKvPoufPnqWLOF
         rDDy7nLtNJH16oKAHlkLQoBWVh/cEfSv4bzzB3o4+GenUl5CA+UgbxRdsc/T5CmahkhM
         uEwOVLCRgejcygLSj8hVBU5nmE2ilD0A96C/il9Rzbk0pMQSL8JjZ5RoBLdCD8mTx5lS
         JNSudX9WGJMj6Axab+pCIw1W/CTn78f2DttOjIniMaH8O4oH/MRWh4HC1VT0cUZj/oVr
         vvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610440; x=1794215240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0psKvGpXEPVjkMgITcxJRsy+QYOsKaV08NZl4OmSHNM=;
        b=gszSU29uSdEj6FYuv6ACpHiYSzxbRDj8YxvX28jG3+mxo678H3PBTsiTg+RTbfbl7N
         df5X92nTwMYarDG5RnxfOBoXd+CG9sQb1cy8KLO97yafipGcyfxB+9eRyNuNnhU3kuDv
         5xOkiBecbd5t8wDydWUnlnAeJKELdsch5NLTigwZ5eScDFrcTqYFYmWAwLFCqt5CBmf5
         O/hxxnjHmagrYV4tw/mjQOUlqcWUeNtyBWSj5yWuQ+udJ7Waslm8iW9clxBHlc64mHyK
         9YBh3Ste/3irxu5BzTxm0REovTla88+ZRjlP4nnf5WTrAc4jvK06IfutvvL0yIyJTiT6
         17Bw==
X-Forwarded-Encrypted: i=1; AKwUvBzWFTtfFOeFtsjHkKy0aQqwHgILujwb9g8w6u5HGFZKlqotPPsvQHTz0QVz23nOKXKzZK2GNaqUUCU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5IhAxZycdEscvuVjk4+xepjoxCFQYhtgmKqILhvxVnD/lkAsU
	ToZHQgZ04FNQWsu6jK3kg2EqnzTYORGvLFQhnNfW99GomE6JUo2DiHhF
X-Gm-Gg: AYBFou00eiPw2JMVtvkG0TVj48RnXuSNeIYAmPcHI9lg4GsmJJ6oXvH8ldadWcfez6s
	gJZqScFuzam4AJ/FWRne7C+QRZGGrk2Gnu7kiOherfoNvg/QrnablJ3b2bJ7kVMCNW3DSnsGFPq
	uynOvDaugHJAibF/SVmvx/AThxNpI2otVyN8kS8U+a/27+YajMRzDHZwxoJ2QbtrfAO5eALeFvm
	FqIWsiD3I0NM/Der8+Klule416yVqEjL0aGsoKzP+CmS3Glo5itBR1X67XxR0ZPlrRXh561JfQK
	3tIyo+1CULm0f7rpE33Jyk66eQVt6LEtuLSecHap3urCy5/kqPv2TTn98Kiwqyf4OsbBlioh6n9
	KpdNiSMA2vXWHR/3qwxj5jKCcAI17rDvSEF5KtME4shXK4pvMe5C1Jx+WVzGF+8+qti34nPqlhS
	Q4dqhE9XQNnf0sg8VdnWjCMTdcM2QHfzsSX1JgJezXTjNOIwBailiQQb5U0/iPU7o4C09HLKU3d
	neMQ1/pK1WuoE3RZbSpeJKBWT4WzMZOBR8ecKVNwvqye5jxTn+BlJujRLdigQSOg3z4po7TP5++
	kddAhDcW/hbO+74hPs9oTZ5cmIs51i0FVKM4803lg3eO3gJsQoFNYXFRhZjn/tclmKMbIBBv4UA
	Epcj6IT2zaT3GUSwc5yWMuHxLIX716mqY5Swk7IyvXQVCxpNy98hAp1COv2E8hFlWfxqh6JLUdv
	T6yr4EU5aBGnaN
X-Received: by 2002:a05:600c:3547:b0:4a5:cfc:1e95 with SMTP id 5b1f17b1804b1-4ac182dbb5emr203556405e9.33.1793610440331;
        Mon, 02 Nov 2026 01:07:20 -0800 (PST)
Received: from cypher.home.roving-it.com ([2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm417879945e9.3.2026.11.02.01.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:07:19 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 0/9] dma: Add BCM2711 and BCM2712 support to bcm2835-dma
Date: Mon,  2 Nov 2026 09:06:50 +0000
Message-ID: <20261102090713.896324-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The upstream bcm2835-dma driver only handles the older BCM2835 SoCs
up to the Raspberry Pi 3. The later BCM2711/BCM2712 add extra channels
that support 40-bit DMA4 channels so add support so this works upstream.

The first patch updates the bindings, them patches 2-5 do some
refactoring and add the support for the newer SoCs.

Finally patches 6 and 7 add the nodes to the base device tree and
patches 8 and 9 enable it and configure HDMI audio to use them as
per the down stream device trees.

The series was assisted considerably by Claude Opus 5.5 based on the
various downstream Raspberry Pi patches and tested on a number of
RPi5B revC/D, RPi4B and a RPi3B+ all running Fedora 45. Checkpatch
and dtbs_check pass clean.

Peter Robinson (9):
  dt-bindings: dma: brcm,bcm2835-dma: Add BCM2711 and BCM2712
  dmaengine: bcm2835: Refactor control block handling
  dmaengine: bcm2835: Support controllers split across several nodes
  dmaengine: bcm2835: Add BCM2711 40-bit channel support
  dmaengine: bcm2835: Add BCM2712 support
  ARM: dts: bcm2711: Add 40-bit DMA controller
  ARM: dts: bcm2711-rpi: Use 40-bit DMA for HDMI audio
  arm64: dts: broadcom: bcm2712: Add DMA controllers
  arm64: dts: broadcom: bcm2712-rpi-5-b: Enable HDMI audio

 .../bindings/dma/brcm,bcm2835-dma.yaml        |  31 +-
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi   |   8 +
 arch/arm/boot/dts/broadcom/bcm2711.dtsi       |  16 +
 .../boot/dts/broadcom/bcm2712-d-rpi-5-b.dts   |   8 +
 .../dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  10 +
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     |  40 ++
 drivers/dma/bcm2835-dma.c                     | 496 +++++++++++++++---
 7 files changed, 534 insertions(+), 75 deletions(-)

-- 
2.56.0

