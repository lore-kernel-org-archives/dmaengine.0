Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793126617;
	b=PBSWAUxSuQ6QoLPUvE89Wh16rrWli0qVM6BVPiIxNU3fUq1xfy4tP3eJhLZ+l53qsDaY
	 alvu3Lj7/oJa4Alt8qTGlBnG+/5tHry8wJWJB8VzLyVz5VGvSZBYUm//tTSYEMBP5A7Vh
	 E5TI/Ns1/2enLqA00iMNm9MeeF8/sQwjsZ8LmZfBb/nOz/qDl3qVGUbT8tvKRbAA1rEDj
	 u/K/TXRt4xY1MHChgynhnJ7ofg04NsWVKg6cdoGTV7O0/89FBe9Jey53v6Gip1XOkNqE8
	 /W4euxcZSeYACV9JoWcMUf4nuNznsUrAvk9rJ8mn5C1iiGGAfUZcsV3/Pp6SeP4ypPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=9axz0yVX2giw2uFg+BgambTLl5XOFya7eXMeUfHcrMc=;
	b=wNdFwbDwNsdEIfV4svAjBQc0MLHzt38WCLhS434u2M+nOWJ9BBVe0r7SUMS0JlbNmyWK
	 MXGoUjK/UT6ExTIthMXhko/RXhy9Irsthp9az74+TGoTa724n6roTCndYI+0c8uR+aXxJ
	 aqF9Sd1aVryYrnDKlwAvu/AvTJa1S5KXO5VICbAZtzszLWuccY230TrOqJFDXBHr97vJ1
	 /rSbR9bOd8wSGi2K3CqhuF1CszOJJSM7pTfETMfO2iI8QzBKgu48jCecDanNHvRJPlPpj
	 LllQhs2xTA2yD+FI9njgL7N8kfttVWu7DA4xN/WsTklgPuFpsmNnLuSmCwrlqZMHeLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nEzEdYSR;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8691606A320
	for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 18:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8691606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nEzEdYSR
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-8253bc5a613so122982a34.0
        for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 11:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793126616; x=1793731416; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9axz0yVX2giw2uFg+BgambTLl5XOFya7eXMeUfHcrMc=;
        b=nEzEdYSRqizAr6UfE1w1r7/oF4eXh3fRPB5gthej+S7YpcqWPtHfHENZUmJfaOJ4CY
         sa+cFlKqcS5FUvSFB8M0PsrjJ1FQCC2YVksNH1IPCSq8jH1lYx4YXiQJ4AJIEDcCmfON
         Fv/lGfOCe+HI3wqusDJ9Dc/NFXvYexgUYGy1whARxiB6Lh6t/ln+GO4ukWS59ZghUo6c
         fZZO5gnFL7XagqPJHgHbN7S6xZYjBZxV7rzRUcDkXOt1WwnvoiclcDvWz9xL8Ld01Nre
         YO8mNIIeLh9B+s0RzzZbG3PNLdZvLzkADrseTPhTas/rtJLZ/DzMXaFzqHyUwH+F1OSP
         X5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793126616; x=1793731416;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9axz0yVX2giw2uFg+BgambTLl5XOFya7eXMeUfHcrMc=;
        b=ULlIZ0I+/7x6uuXjSs+0bxPtgIl3lPpwcmCPDmgjwno3153H3RjBWWjhuotT30vemo
         OYtGy7XKbPwA7g3uOAE5XoHodoPZRxhaZq4/rc/Q9/68nLm1jv2mQe+1cQVNrM9XdbTt
         SDW7tfXQj5o0oyN1UGbS9k6pt48BFDX7WsEFHM4YwdX5yyNVOllLQktAJIzCl2nWv20/
         owGGJSCauT7iZrQLv1Atj0WqX3DNymIZHCFodwVrepXeA/uWHjV5AIf/Nhv2JL8LoXON
         pCQzZWUanI8Z/TupmkQDauNP368lPH23Fz6il50VVdeqXLYAMNvZfeUUvC5eunYgRCJK
         GQFQ==
X-Gm-Message-State: AFq9FYJy0y/44CAERuzvPkAym1InO4mr8rNi2jXAcls9jcaJqHm1VXoc
	W4wMbjL1dAquEDuayNFlaOaA962Xld6xEorqaq9yhhJGW2oWcNSgjy0j
X-Gm-Gg: AYBFou0d3utJ3qS8ABu1PMPvCneCQJFd9g9Km7yo3mRLjd5XAylCNuQn3Pn6zljFsWZ
	iAEyVdIJ80pHuZKAiV9erOwXlvTnXMDDT7c+lhqPC6Cu+KcNMtYIDR71V60sF9zkr3Nh9G/zBps
	B9JCwScj7zf1GCzSywvyyAwyIgJ9I98RNbRmxpSwm3IfB07ZeIzh8oj/vm1jcsDeq88ftU8mDMU
	JzhZULyOZCJWYagpPkjucII6URAvvYgXewGCUuyY1teGUq8y9DmFed6M18lJIIQXpJKoIbIgLNo
	c3uixV7/YHRyTatu8H/tQK6lkGEEAepPFF3t/3IH1YlY0cAyWBw2RpLjvBgYaa5MS3womR/ygcS
	S/IlWhuz6ypNN0hYh+ysAjZBIQx7EfcCiMMQr34kBPPDg1p6i3/DY/fBIV3+i+w+S2DWosqaEj2
	QQ1H3SYv646k3YSzuz5nnwECapMyN+xYVHf7ShzeMBCO8oQgeizitd7nZOvh4oC7S5hWEoqcDGS
	mzknXyvro4yrFo9ShPiiwQ/M6DfBs701jKorb/HO2Tygy77P9mgBmfu8q5l14gysrLeTJ2OMkDB
	qCwmzPjIFR+YGKy46XDtQKIQqqv+YcLRtRQVbA1SnsMo4eN/jnRzVqu9aFxGN4vRF2P0uBtEm6x
	WXHkli7FXZFaeo8THVABbhfu1meKC7/CZHcyOnshiQyyanp3Cmj/Eqw58M+odkhqq0hftpJ7BPP
	lio+dP
X-Received: by 2002:a05:6830:2b2a:b0:829:9992:20e7 with SMTP id 46e09a7af769-85ab88cd029mr404051a34.30.1793126615647;
        Tue, 27 Oct 2026 11:43:35 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb074fb6sm12488338a34.12.2026.10.27.11.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:43:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v3 0/2] dmaengine: share virt-dma synchronization and use
 it for UART APDMA
Date: Tue, 27 Oct 2026 12:22:25 -0600
Message-Id: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-0-aad7a6b3c62e@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XOTRLCIAwF4Ks4rI0WWm3HlfdwXFAIbVSoA7Tjz
 /Tugm5c6vJlki/vyQJ6wsB2iyfzOFGgwaVQLhdM9dJ1CKRTZqIQW14IDmFsLUWw8Qyj9BG0lRD
 uTvV+cPRAmDjwTaOasijbTV2xBF09Grq9nxyOn5yUE6qY5bzRyoDQepmYPEomuo4crj93aaOnE
 Ad/f/eceJb+qpRbQWXqmjfKoKn4vrOSLis1WJYrTeKbFD+RIpFGSzQFCtR6+03O8/wC5PmkD1s
 BAAA=
X-Change-ID: 20261021-submit-mtk-uart-dma-synchronize-v1-158c8303b574
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Zhou Wang <wangzhou1@hisilicon.com>, Longfang Liu <liulongfang@huawei.com>, 
 Andy Shevchenko <andy@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, 
 =?utf-8?q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, Frank Li <Frank.li@oss.nxp.com>
X-Mailer: b4 0.15.2

Provide a virt-dma synchronization helper with the DMAengine callback
signature and use it in drivers whose synchronization callbacks only
convert the channel and call vchan_synchronize().

Use the shared callback for MediaTek UART APDMA so clients can wait for
completion callbacks before reusing callback state or freeing DMA
buffers. The shared helper and existing-driver conversions form the
preparatory patch, followed by the UART APDMA fix.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Changes in v3:
- Split the shared helper and existing-driver conversions into a separate
  preparatory patch, leaving the UART APDMA callback assignment in the
  second patch, as requested by Frank Li [1].
- Replace 26 equivalent driver-local synchronization wrappers with the
  shared helper in the preparatory patch.
- Link to v2: https://patch.msgid.link/20261022-submit-mtk-uart-dma-synchronize-v1-v2-1-fdaef0e2edd6@gmail.com

Changes in v2:
- Add a documented vchan_dma_synchronize(struct dma_chan *) helper in
  virt-dma.h and use it directly as the UART APDMA device_synchronize
  callback, following Frank Li's review [0].
- Link to v1: https://patch.msgid.link/20261021-submit-mtk-uart-dma-synchronize-v1-v1-1-4f7718cfef41@gmail.com

[0] https://lore.kernel.org/r/atoz6M7RHU14_a3J@SMW015318/
[1] https://lore.kernel.org/r/auDOqLln9_ra__hY@lizhi-Precision-Tower-5810/

---
James Hilliard (2):
      dmaengine: virt-dma: share the DMAengine synchronization callback
      dmaengine: mediatek: uart: synchronize completion callbacks

 drivers/dma/amba-pl08x.c                       | 11 ++---------
 drivers/dma/amd/ptdma/ptdma-dmaengine.c        |  9 +--------
 drivers/dma/arm-dma350.c                       |  9 +--------
 drivers/dma/bcm2835-dma.c                      |  9 +--------
 drivers/dma/dma-axi-dmac.c                     |  9 +--------
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c |  9 +--------
 drivers/dma/fsl-edma-main.c                    |  9 +--------
 drivers/dma/fsl-qdma.c                         |  9 +--------
 drivers/dma/hisi_dma.c                         |  9 +--------
 drivers/dma/hsu/hsu.c                          |  9 +--------
 drivers/dma/idma64.c                           |  9 +--------
 drivers/dma/img-mdc-dma.c                      |  9 +--------
 drivers/dma/k3dma.c                            |  9 +--------
 drivers/dma/loongson/loongson1-apb-dma.c       |  7 +------
 drivers/dma/loongson/loongson2-apb-cmc-dma.c   |  9 +--------
 drivers/dma/loongson/loongson2-apb-dma.c       | 14 +-------------
 drivers/dma/mediatek/mtk-uart-apdma.c          |  1 +
 drivers/dma/milbeaut-hdmac.c                   |  7 +------
 drivers/dma/milbeaut-xdmac.c                   |  7 +------
 drivers/dma/stm32/stm32-dma.c                  |  9 +--------
 drivers/dma/stm32/stm32-dma3.c                 |  9 +--------
 drivers/dma/stm32/stm32-mdma.c                 |  9 +--------
 drivers/dma/tegra210-adma.c                    |  9 +--------
 drivers/dma/ti/edma.c                          | 11 ++---------
 drivers/dma/ti/omap-dma.c                      |  9 +--------
 drivers/dma/uniphier-mdmac.c                   |  7 +------
 drivers/dma/uniphier-xdmac.c                   |  7 +------
 drivers/dma/virt-dma.h                         | 15 +++++++++++++++
 28 files changed, 44 insertions(+), 205 deletions(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261021-submit-mtk-uart-dma-synchronize-v1-158c8303b574

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

