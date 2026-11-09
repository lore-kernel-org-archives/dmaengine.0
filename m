Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794202147;
	b=22D4AUQ8QUlM90RKj7/OpPt1X1STHxcrY10IHM4fy77QQGhvgzwNcvl9qqNMX+BHsMlX
	 ypSy8tGOYgDVUyIySf8fwCwN40mmcy/XKjsmpkQD+zhjvSHVbxrAdaL9uYA+yxpCoY++1
	 9ls1YsV6gzj2KGjw8oemgDq5eXaJY9RnInFypf3Kvpm+791Tc+l4kBoqgmGIbF1k9Klgg
	 E21+n3O+sQIE/BzrYc6nPvmmRZxuTsZWXCT/wduqaLlWtvFzlECFc918pN24aq55KMQ6E
	 zF7ESrsCcwg8vaDodUEuzj1CYX1NHRWEsqLbQzsu6cPcl/dDLkl+ErU1kSC8XKTT9hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v/+iqzE3D85GzraKFwMggPSN+1bOaRD1qrvalwGxknE=;
	b=d+0JuwhWAbs5yV31MYO+tJl44NWFYQEILUgALLLL86I0HgJB36b1hhJ4/RDhBLOQhWlu
	 DrHkO8bD5qB5zvR8oF8KTFIfqietFYJOA9w+hPY0hRZlgeC70a0NORCvqeLN/54H6iOBq
	 dh5mFJjv/Ogsor6mhRA96UncjhamOHim/FSVoMjllYZL5C8rl1rC83ywNUZ/e0poGmdGN
	 pMNjGkX0PpXjtGQvpg9FaFjHE3KysRRuaEbLVg5o1mJsZpaXR4qo6rTTOMkjZyprYeeu0
	 622n2DW+AI7UIuwy8lK475hA1HXUHlIj7UgK1ZAcBdyORYLfC0BaRKKuHwXzzhrv/fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="mAO8/BpX";
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724DD606A325
	for <dmaengine@vger.kernel.org>; Mon,  9 Nov 2026 05:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 724DD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mAO8/BpX
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso314891a91.2
        for <dmaengine@vger.kernel.org>; Sun, 08 Nov 2026 21:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794202147; x=1794806947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v/+iqzE3D85GzraKFwMggPSN+1bOaRD1qrvalwGxknE=;
        b=mAO8/BpXwOeqG2k5o2qTSWD87qR0fy8I2rHRO/KQL7ZsrY/kMN7Pa3BjGSLFr9pF5X
         nHF1LMETZjVkNH6LfnvUoOJ+lDKgSFkThlp4XrZgWj8vdoykCiCx58M4agfvf2kx2OBF
         MczxltN5kEnxYvkbsgMHeC3Cxd0JV8KBo/YOe1kFBVv1zXLoqT4GKQlbiBDcnRcdNsun
         ZNiCdw4je4YmffE/A1yUJEdeVTvmNJgMr7pqzoJkeUwfP7sxUZ0Sft5x6uZruQ9eE/aJ
         xM3flX4ZdsA3hVk0dAXD3HW82CrwQAEG/MZCcMg+/dxnwIfeIiYM+wWlSfPGDdqm+yzo
         8fCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794202147; x=1794806947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/+iqzE3D85GzraKFwMggPSN+1bOaRD1qrvalwGxknE=;
        b=rchKKIkMmXRzK18Pxe1KEIViIjPuexqOMo0GJPC78KpmBVKh0cAJU9a/mwXgCxJeLo
         gduF/lgjoVYyEVje4U732mDyM1XKe8mfV5JYsvk0dW0dsAaLnMvH94GPoETVq4dzjYVZ
         wgztLK3PAU/rgayCUDdZOlm4iAEdrQdpTEeOZCX/ooTs4oeyjtD5sKze0QhNBg87PH9y
         yps+z1lJQ9AHmYkUMdcmnNrEOs0u5CWHaHborw9YwsnFFS0auifnKaGMYzVpYFBJmKsz
         RwpUL2b+OmYS4/q89/0Imt/gJ6nUsrkcJ5j/bBG8KnkRuSv7GuusDP186o/lCul3kVnS
         fS9A==
X-Forwarded-Encrypted: i=1; AL+hErEhYxEA69m78DyZLvxPv0SuR+qFo6UXhbq4ahL+AF4ABF8pqCfIEgRuuzBQqwQ7pcvLF0i/GcApgBc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9z1IQFtw20ZRkROFGKWCIrnYa9TktcnxY5RWyYcumSEri1sHgR
	dzTplZD0qjITxFAqJILUmjLLWu4HOBeTw9CpaCK5swJ/qRJuRVW9QmDd
X-Gm-Gg: AYBFou2c6bE5qNMIR/bu9ZPCL1aOmnQ6gqNXhM06JV9fhSUt8Knoux3EbDzewOcZ4OV
	p0XzV6mZ9hiRQ9Y5WcUAwoiKrw+KOqfSGZGgduMlP2szUQn/ZHsDtE5b2wnrGqcmj6i6XW4E9qY
	CjsGci7g/X7s/b/scM6sX/lP3apb0GjuWYM6qQADFqXSWvh7xVTu+3fsw4qHQFJNEsEqNH66d6W
	NGMeMfqHrj6hpmNZ78K/eAx42pMGyD4ZppH4NJ3ZEsrxayLxAVmhKYNOUWGKF41R3dSTizHsaWQ
	pEX1haYRi0prW6mymE7dOTZsvLWTaEoEjSRD2mmzSvQPuHoG6dBZe2E4XoP4XmP9mMFWMtjIaM4
	XvYI1pW1mOPQsXMvrtbk8BbEWRNONoqIXmXx89jarnHaRc+uHcHdiX7HM21h75qGZRBNZStw76g
	fP5k/ZvAc90MKxWgOUaPPa+pO9n4lqGzyGWtv9W9h3iRqxWNKwPCwcrw3JGHnKAJ+F//Yf4Paof
	yrznpQ+ppIcjEOGbQcKlaLkfNWrJBEDWH9MpejTo+M+tY5O9eIZCfVOFkjr/DM0GKVvqOv6sla1
	5DjFP5Z798ePs2nSrEMsAuZOgB2yi5KoOBWyYLLZ+hNWynN1g+2OsmhOz0ztpn6aMveiFeocONx
	3/Nqmiqqc8fCGKFZFvJv86nDeIN9Ydl0EaIBb
X-Received: by 2002:a17:90b:4c88:b0:39e:6d82:dca with SMTP id 98e67ed59e1d1-3b12d442907mr2821498a91.30.1794202146776;
        Sun, 08 Nov 2026 21:29:06 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb9681385fsm1180899a12.6.2026.11.08.21.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:29:06 -0800 (PST)
From: Shan-Chun Hung <shanchun1218@gmail.com>
To: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Shan-Chun Hung <shanchun1218@gmail.com>
Subject: [PATCH v2 0/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
Date: Mon,  9 Nov 2026 13:28:58 +0800
Message-Id: <20261109052900.2960473-1-shanchun1218@gmail.com>
X-Mailer: git-send-email 2.25.1
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

This series adds the PDMA controller driver and DT binding for the
Nuvoton MA35D1 SoC.

The driver supports memory-to-memory, slave scatter-gather and cyclic
transfers.

Tested on the MA35D1 SOM board with Linux v7.4-rc1:
 - memory-to-memory with dmatest (2000 iterations of 1MB buffers, no failures)
 - slave scatter-gather with a local (not yet submitted) QSPI patch
 - cyclic slave with a local (not yet submitted) I2S patch

Changes in v2:
 - Address issues identified by Sashiko AI review:
   - Program registers on descriptor start instead of prep.
   - Fix interrupt completion handling and return IRQ_NONE when idle.
   - Set PDMA_TBINTDIS on intermediate memcpy chunks.
   - Validate scatter-gather lengths and bus width alignment.
   - Fix channel request assignment in of_xlate().
   - Safe controller teardown order in remove().
   - Drop peripheral timeout support to simplify driver.
 - binding: describe the hardware in the description, and drop
   dma-channels and the dt-bindings header.
 - Use a fixed number of 10 channels and trim the includes.

Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>

Shan-Chun Hung (2):
  dt-bindings: dma: nuvoton,ma35d1-pdma: Document MA35D1 PDMA controller
  dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver

 .../bindings/dma/nuvoton,ma35d1-pdma.yaml     |  71 ++
 drivers/dma/Kconfig                           |  12 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/ma35d1-pdma.c                     | 672 ++++++++++++++++++
 4 files changed, 756 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
 create mode 100644 drivers/dma/ma35d1-pdma.c

-- 
2.25.1

