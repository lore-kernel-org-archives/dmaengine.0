Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191303064AE
	for <dmaengine@vger.kernel.org>; Fri, 19 Jun 2026 04:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781844870; cv=none; b=b59LF4naVZKXfSxcBqKlDfHxJKEUgaR1SA3OXfkaJidW3Tx67IlNKLf98CWBZkgM6zrOpBSRiOVqNbUHjm/1bRZ13X4AYkatSXOW/cP1HGzI0YFE42nz5IGoORIpJwnh2Qbipb9UAT5NtqcxjObeFokIE3nLnyyP1fjFpXvk/hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781844870; c=relaxed/simple;
	bh=mIHJ9HoTX3sn1912y382u8EeVqWYJrR0tLkSaCIQVi4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UD0Nwl1/N2UV0l14DaR2TapYI8xUlyaDE/nRLIGRqByXCD6gKtkXzLTnWN8sgA79ZsCNy8tLC+s6gVzMY6JeN2GNmSEqx4ynJu+pr6/M5S5U5VNcxeDmnhe0rnfE8O6APT9CQkfsQVkY+zpSE2d7xBIX0vgcXGYQgpcikU0gM0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPtQHlFt; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPtQHlFt"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-915aa0a9293so300638385a.1
        for <dmaengine@vger.kernel.org>; Thu, 18 Jun 2026 21:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781844868; x=1782449668; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mGt6y5IA37sjEJinxGUW8DV1fePrVRHX/t0SjqpgRkI=;
        b=KPtQHlFthxYmireVWcUGvLA/VuuuawW/phC3Q8dZNrvQoBRppZ84WcZ34Du7xcfZH5
         HBtDoCeFAzffYUQIiGyvsvGrG9EC5Rzsuwm4WlsGi+WO581Ig+O6e3waYu0tqQnT3qjK
         iHNoh8KbmdpQQIalvmbZejT7/IXLjcaqYQ2JlwoZV8DbiU3Qgkm3jFeeW8zxdDvMafe2
         0tZflxHoEmGk58c0Sbh0d+nN1lg2GTGP5tvNbbUdIjFUkd9VfXF8Fbzi1AOY3Hqk1nUs
         xZU0WpkXkx718d7JNdZcKVdL5QDPKG+rEIRxFc0OaKkayfUmUXBBOGF/H8Sjocq5iaZd
         0ebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781844868; x=1782449668;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGt6y5IA37sjEJinxGUW8DV1fePrVRHX/t0SjqpgRkI=;
        b=TQ+ZmNr3vH1NTPxsFSjEO7CyoxgfTMx3c3lA4kktbszpLz1QjKcfqazmwyGUajpxfe
         Qs9Ls3P3mQ7hmfKVALpN7BYbzmanepas/7K+cB8Yc0vvqhv6+J1JLmoc5GFJif51s828
         BhvDPHTUtZG3ckZO+PjR8LA8ZCoRTNuMBlbv+U8Z+8EG6Vqw7QMfG5AVlUeOkFRxNS6K
         5771JdmFIsak63PJFvvlj4fVdOCugYkqAefBezrqtlO/IbTyE3/gnCmqmzefZWRx/v7h
         hA31C8cXLPJqxdMGlVfyQo8jX8PRQPpJ74P5QdTB5vYli1IGHCDw0fJQMuMFM8GpAwD4
         /eKA==
X-Gm-Message-State: AOJu0YxijN6SZp01QB2kPINugAZWFHn8eFf1qDfE9b0mXLa1ufy59fST
	SfuXqCqUAxBHwFEWxo6dvi6koHxRijdtlvBGMXz60oWoQwbxFdT96rhj
X-Gm-Gg: AfdE7ckHvIPmltzcieKyO3fveryNyNtEWS7zCES82nbTnptd2YQGxaP9nFbrgWLkTdq
	nUywSB8ZCCbwCjhL8mUIOkRSkhL+atB6nvsjRF1j+aTzGSeaQAgwpCa0MuzGdtZ7F0lcV6wLlmZ
	5VLqIwfwvZ0X4gxqfC965Z2WNceM+gdRGqFFPyinWXo2PpprBaBvAClHZ5MBIfchbB9Fswnme5J
	LqNZ5t8KnKSJ8j9hG6EVfckL9Bw29eLT1sa2NFlXJ/SDDcols4f2FZvNNN5yRlaqDUNR/kU8HlJ
	82IrMHEnhAKr52Zy1wLJC9e9Jm9z92ZaolmyPVtFcPP2W2jgldN8dF1653WVUnJzkUPhSkuedo2
	fzgapSyrF+WVNhmSJj0TdU2NERHIPQXYFIN47yGwzuWfFkMDsrPrKZg5BhtOASOfR55Coc5HmxN
	xpqpn3N/GPXKa/8Q==
X-Received: by 2002:a05:620a:2589:b0:91f:27bd:ded3 with SMTP id af79cd13be357-9208c8133femr270065985a.21.1781844867940;
        Thu, 18 Jun 2026 21:54:27 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-920a425448asm134464485a.23.2026.06.18.21.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 21:54:27 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Subject: [PATCH 0/5] dmaengine: sun6i-dma: Add support for Allwinner A733
 DMA controller
Date: Fri, 19 Jun 2026 04:53:29 +0000
Message-Id: <20260619-sun60i-a733-dma-v1-0-da4b649fc72a@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB1IokmxVxEXMZm2U2haMiqCe
 HejXb7F/xsIZSaBe7VBpoWFv6lA1xWEl09PQo7FYJRxyukOZU5OMfpb02D8eAymtVa3nXY2Qql
 +mR68Xsd++Fvm8U1hOjew7wfgrTu3cwAAAA==
X-Change-ID: 20260619-sun60i-a733-dma-c2455149165d
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>
X-Mailer: b4 0.15.2

Hi everyone,

This patch series introduces support for the Allwinner A733 DMA
controller in the `sun6i-dma` driver.

The A733 DMA controller differs from previous generations in several key
ways:
1. It supports higher address (up to 32G).
2. It uses a different interrupt register layout and mapping.
3. It has a different number of channels per interrupt register.

To support these differences without introducing complex conditional
logic throughout the driver, this series first refactors the
`sun6i_dma_config` structure. By moving interrupt handling, register
dumping, and address configuration into function pointers within the
configuration structure. This allows the driver to support the A733 
and future hardware revisions. It also aligns with the DMA drivers in
Radxa BSP Package[1].

The series is organized as follows:
- Refactors the configuration structure to include function pointers for
  interrupt and register operations.
- Moves address setting logic into the configuration structure to handle
  varying address widths.
- Adds support for variable channels per interrupt register.
- Implements the A733-specific configuration and register mappings.
- Updates the device tree bindings documentation.

Tested on Radxa Cubie A7Z.

[1] https://github.com/radxa/allwinner-bsp/blob/cubie-aiot-v1.4.8/drivers/dma/sunxi-dma.c

Thanks!

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
Yuanshen Cao (5):
      dmaengine: sun6i-dma: Refactor to support A733 interrupt and register handling
      dmaengine: sun6i-dma: Add set_addr function pointer for variable address widths
      dmaengine: sun6i-dma: Add num_channels_per_reg for flexible interrupt mapping
      dmaengine: sun6i-dma: Implement support for Allwinner A733 DMA controller
      dt-bindings: dma: sun50i-a64-dma: Update device tree bindings documentation for A733

 .../bindings/dma/allwinner,sun50i-a64-dma.yaml     |   2 +
 drivers/dma/sun6i-dma.c                            | 223 +++++++++++++++++++--
 2 files changed, 203 insertions(+), 22 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260619-sun60i-a733-dma-c2455149165d

Best regards,
--  
Yuanshen Cao <alex.caoys@gmail.com>

