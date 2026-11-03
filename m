Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793672534;
	b=Y6Lcw4fgaI01zNhd6aciEZW6zIeyP71QiiFRcYru0iTMoQ6ms8kPzuKp81lbrxU7zn7D
	 nkuYpvlDT63LH33qfIuI3UkjEDuReusL0D7Wjr9cWz0zyMaQE9eUnJQUSNYIq+hPfM+4Z
	 KxKGsrF46rpNxGOCdSaRQelwULBW+p4MM3DecnhooTNAZ2F/Knt4iyDrtr+i3blzNyPGM
	 /nPOwiM0hbkhK7o5XFtd6eNPCC12DrtKkxJCrdKNqUPehirdq8QOVxjH8BAeRJko+b2/q
	 5B7HxTSvqEZX6v597FlvlBAk0AxHWnqj3b5XA09dVG+55ZjZNM+U6XfpFsikexa4epQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793672534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r7CZHsFtToEeDraAns18SBV26Wozlx1z/SodGdtdGHQ=;
	b=a9MRzGOP7Tls+jiHVDevc/8j6bD7gBSiJy+DI2nAnNv4jtYxKtmFGEiZbffXG8kSzrHT
	 tUyu/n9S3x3u0q/O1NRePJAucVQtgAiDJlmeA6USbtEFQ1sIuI4S3nW0jgmF/wBM28ddg
	 MnHHr4UxaL7unalE4yZ086wzWF82qbG5GhbHnUFKj7oJSeUkoq153shf4R5r1PkMuug1b
	 8wmZlbEmoVwHqpEc8G5ISYt0TIV9ucO4BnNJr2VWqOCmnVZADn9BM+voejdjpaYKcJSzj
	 hYEB7wWRrFV1nvxbcdl95iJb0x7z3vflqLapzRgNhzUQk6ZCbJBaof8ye6kSxanZJ1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pcvJJlQH;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E547606A324
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 02:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E547606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pcvJJlQH
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso144809a91.0
        for <dmaengine@vger.kernel.org>; Mon, 02 Nov 2026 18:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793672534; x=1794277334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r7CZHsFtToEeDraAns18SBV26Wozlx1z/SodGdtdGHQ=;
        b=pcvJJlQHlGOF0cpRM0UZePAnDC0vqeuBRizCxvexJ7QOLkN8zL3s4Cjs3WJ/t5DCBc
         d3lY9QkXohvzSDMe3oJ+hXgdx8im/eKScekNjdD5xWcpzme7sOuLYx170dlJIMYZlszQ
         YPdulHvcX71xyKzwLy00njaxlw1cMOFw8ZeSm+ZVYAdo6Ubhj9QafHmSlaGYXtsJpi2W
         902Ac+nkX/bTmhzQd4fdw5AVucBp3I6xec0Zok7FolDgMaPxy6bDM+qClB4y1BTAm5cU
         lSPpWGTzBUxCl1zoIyC8IwHL59W2TLZTBU/801Ml6a5Zxl0hbtaPi+Hb4VZ3RjnC/o6k
         ytOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672534; x=1794277334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r7CZHsFtToEeDraAns18SBV26Wozlx1z/SodGdtdGHQ=;
        b=wuXXbX08DzeifdZCthHjB3t4dR8FhveMN22qE8sCWxMk/zZotqwUAQ9o0Hy4Lbz2SD
         h8oJVUqF+CfKkolGCnGKQtkd7tfEeSOsChuqUJfw7MNww13PJM3ucCTPs/3AsUSQwIWh
         Oxa9lrC0Lz4JJY17GOCtlRypsEr59AyFYlHmbdEsu4LQfOqYdk3GKTJYYXpH7Vc3AWrF
         4cbfeA0qycSeXsx09LnQdGUT03+HUiJXTE+afcHjHoELpMP2dBwJ37FLfaNhK7vx5O12
         y/87QWJ4LjA+YxVpJQPGH5ekh21vz+AC3afOqYOPseuoK3cROw94AExwjrVeqHi2KZ8h
         2V5A==
X-Forwarded-Encrypted: i=1; AKwUvBxyK/ohGMXVTwURYSnmDTN5N5/XwwilTca7oHSvOCFDhPhRy+e9GbLbDmQp0bMAllzQvAMvgvDjODo=@vger.kernel.org
X-Gm-Message-State: APuU4Z98osM+is5UkcRiirTa3ZIQPg5fpaKDjFxHy5nZF2fWqtrz1Lew
	vhj+k0T04a2vytRvP6Dpi/nvM3X3Pkmq5Lp7T1mgnututSk83E1RON8oTC16D9mC
X-Gm-Gg: AYBFou17rFpgDi0B51uuF0SNOBBwVHafA1C+a6y7swpQXTO9Ub4HoNdUMGj5gnsS0EI
	d8IkULnIyZ82k+tVBtLtPTeNMQNibNtR1oLY5QF1SLiSVwQEQ4X+dsCKU5H9SFkKTvKP6Eku8Hg
	4JSwYNOj4kDJGNHNpSQLd9yRYCoRnKaMu1mLU697sSjTy5RNMmZb0Xs209RbdRZpHXd+Ll0YPl0
	HFL3DupDU7gXEhobWjYHAlGEKBxfxA2Ndcr7Fhh6atSaQRF48ZZB6fsa6PziDEXkZDg3QmTaG7O
	cbEkydSUcWAj8tb4ziRKRw4PJANr2zQE3Bh9aie9SpQTqxIidsitBTvxH37k3d6gjNyGsguXlNK
	LfHiTdbvvF9Cznav6oDpAiWd7HGCgSAZz+XV+lLudvtQ3Z1ByJeM90x09Y2a0EW2d2p2FP5AxzY
	ZCH9tPA03qLqLVRTmUb7Mo6a9NXFVuAu9UkWEGIYfidu3D/itsVAEBwWHHY0w+r54g5OK3MC6rm
	WcQ+DINU68SwUsP9ZwOT2gpuJztdCSW8yroMv8lRa1TADm9dc/t3ry53cfaHZDUBksSY8HTAxfw
	DTojWzKOvpbTx6yrMTqrMvtAThKbz76sdopESykHwfaS9oUAgWGbIUAx90phi28nyxiS8KwWF17
	FhvybPGXxv+zDk3Y=
X-Received: by 2002:a17:90b:55ce:b0:3ae:3f20:7058 with SMTP id 98e67ed59e1d1-3ae897bafd5mr6113235a91.36.1793672533832;
        Mon, 02 Nov 2026 18:22:13 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c7dea24sm1570124a91.5.2026.11.02.18.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 18:22:13 -0800 (PST)
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
Subject: [PATCH 0/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
Date: Tue,  3 Nov 2026 10:22:00 +0800
Message-Id: <20261103022202.2139674-1-shanchun1218@gmail.com>
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

The driver supports memcpy, slave scatter-gather and cyclic transfers,
and a per-channel timeout configured through
dma_slave_config.peripheral_config. The timeout is needed by the
MA35D1 UART driver, to be submitted separately.

Tested on the MA35D1 SOM board with Linux v7.4-rc1, using local
(not yet submitted) QSPI and UART patches that use this PDMA driver.

Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>

Shan-Chun Hung (2):
  dt-bindings: dma: nuvoton,ma35d1-pdma: Document MA35D1 PDMA controller
  dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver

 .../bindings/dma/nuvoton,ma35d1-pdma.yaml     |  72 ++
 drivers/dma/Kconfig                           |  12 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/ma35d1-pdma.c                     | 780 ++++++++++++++++++
 include/dt-bindings/dma/ma35d1-pdma.h         | 113 +++
 include/linux/dma/ma35d1-pdma.h               |  24 +
 6 files changed, 1002 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
 create mode 100644 drivers/dma/ma35d1-pdma.c
 create mode 100644 include/dt-bindings/dma/ma35d1-pdma.h
 create mode 100644 include/linux/dma/ma35d1-pdma.h

--
2.25.1

