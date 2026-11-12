Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794486248;
	b=uQPrD/j5HrbCeFgAkw8Edk32SrwV9DD8brFwnPZdq4KAUUjI7jFG6cXxbE0lyhC30k0X
	 PzMrYhhXTgJot9BOWaj2SDQEArUKH8hZ6W2jZEs5Y2GpzhB08nI01l3e4Lnfa+Br7dvRx
	 UNmh3nAsUpzt9IWU/yH0I03EYB4i71ZaagHFIrUOnZ5digwX+mIjdVKabjtMLgGAOyaW/
	 6CPcmljqRbOXTyjhvoGopZOfslFnJQh+MfSLkmI7ezLElmn0iF0t6p+kYo2t8uFRt2GgN
	 9fpoDiprMWS/c1PeBjD0OpQqRAVbVfywQzlbC0XFlFS2w8nhpLwyFjkllf+isVRaELQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=6jjbM3FM0vEh41D6tTAiBxzcbzcUKnDu2QUW56tX9Ug=;
	b=iu4YvzFBuoSBUAPNxVeWT30DWzP7pUPNhR7goL975q5eJLRkmQiRExZmGgiG/75ymNLA
	 K1/luE3Zm2tfscwhZdRUZf2mpKwtIbPku8Pq835F/dxlE1LkQhVhaWN90YgbkWT0SRTzH
	 ETIPehYtC5nTGJ/VCLFvkuaTtcaIotA5sBQXYBEIkhJTeM0OZ9uynG0g+aMgaS6l5c4S/
	 sgjdvaIv476limgPdZulLVKonwdSbs0Jj2EoddFeq20JKAv0Rax+Q22BUdTBNlZb6y4br
	 MGjwvL+hPcLlnXFYQyoogTZWMtH0llJY728V9MnkzhUcM0mV+z36FoZ7XirckiVzkHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=02Ee+baK;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD1B606A321
	for <dmaengine@vger.kernel.org>; Thu, 12 Nov 2026 12:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AD1B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=02Ee+baK
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so6587492a12.0
        for <dmaengine@vger.kernel.org>; Thu, 12 Nov 2026 04:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794486247; x=1795091047; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6jjbM3FM0vEh41D6tTAiBxzcbzcUKnDu2QUW56tX9Ug=;
        b=02Ee+baK1h1XUD6WO/nascEjWrwiuWrZ9E9j2MFQcrZI5K14rA7YSabQFZqCFSvC3N
         ikyw7KKQgOI1ld3nNdFDTDd5OmzNRUttM1oIZghE0ToKxHlOE17aLobyJRitiIoejqNG
         SX3XX8oHBl/GOFBVpjPgVTxjDbSle/WjdqOh3U8OGGI/2vZzio5/iVz5eAVVsJpDRnvM
         eyx92Iw2Ybw9Da1/5/WmCEY9yES7r+L+75EybPosobSiFFqEC9MOqcLtX8lqUVwiDxVi
         4V//JpLYWXeWE0e02nucAt510hEbI43eS7S3Xlwp/s0W1fjuv1UYI6ioe2Sj6ehZ70DD
         nZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794486247; x=1795091047;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6jjbM3FM0vEh41D6tTAiBxzcbzcUKnDu2QUW56tX9Ug=;
        b=AJOCscqLtoslPJdg8kYvFtueuDdW2S1qnLTblgvOJvawlaTNZa6HGa1qRYGpEDX1+h
         /8YEXFA6cgAmf3/+3r7wu0Z++Ic5ztGe593c4zmliwKcoTB+6mRCIRtJRuqK+rfp8nLq
         l6FGLSRayNZSfGtb5Uzuq6wWPYGOnVKX6qCEM11R00xwuc802/qS57iCBbJH0evdHT+u
         wdn+cEssxVa1flPo/wwG9bIWeNKNW/1eNAm+SB+FA7Plpw9JthKz7J/P1bN3ZPUNDUsx
         i/aAB9cNSEkg+9XIms8efrtsE6m6lg2Mh0PK5O0ha+GmWocPvNLKexZOgCUNtRpum1bR
         m8lA==
X-Forwarded-Encrypted: i=1; AL+hErEqs0Qeu2mmKlOwdd3MRGzVPrhNrifd0HdqGnL4aLyATVgNxlOBhdOinfIK8CqJHK0MioIegffApo0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lLG+AMXLhxe73Bex2V+PHW1ZY2XX3SDTiDcWArv6msZ406+mE
	57t+Q9/bc+W9xv8MoqXTWgJTMNhIW4W7Pf/WdWE9VDeLN+PMqapxYYnc
X-Gm-Gg: AYBFou1QR4VU36TogKARhbQH0rRIV2AQ3hznrrW2cxFRY6f3Ic+mPDrnMCQQkKnzLGp
	/VuMqTICZKyR39Dh24OtjUg7mhHrMahXpddr9usyTxiKTNotKoy2tGfERpbyKG2XpjM9D59GB4D
	B4JyR2oql0Lj5WrgjCMjUizLffb0bzDOHjZpwKDqPHfsRiaWHY+Vsn2Fl8F4GguOEkh5/5JCWCW
	PBXZ9zKoWgo9wRhpWZiZPE4D+EMPu/l6lfZh4UqepLr8URIaNBTwVhcCApZRMdrTuC4U0FvLPcK
	peR+QqdwfOuK7JpE7zqb7HvAXhlhY50ZcpQ5FngJL5I8lOzfYKeWUQpUdkVrinXT5+JcVDF1sUc
	a/F1KGQ8zx15m1CeWAf2b78r+DNRrfJDCxH3/TMvRV3zZm9r7VlwO8XIoP3uY7lQGeS04XlGwsC
	ZmfldX8MNBy1fdJZW1nApvWBAMFOhNZ0u7V9X14IAsvcSLdhzXsuGR+qHOnnQ46ux9mh4NXSZEn
	DlBa3y+ci75s4aEJowi5Rqah/3v5dRH/rtzHnu+yTFouMns2ri8CIJkSMcPs4ZkJPzn2eNDIuo9
	YUwoBgUKpJMg4KtyUQ2BIriFvXjwvq4+v8dh5iF0
X-Received: by 2002:aa7:da59:0:b0:6b3:b10c:40f9 with SMTP id 4fb4d7f45d1cf-6b77770232emr3279335a12.31.1794486246730;
        Thu, 12 Nov 2026 04:24:06 -0800 (PST)
Received: from crispy-cucumber.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b77918d094sm1835931a12.26.2026.11.12.04.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:24:06 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH 0/2] arm64: dts: qcom: sc7180: enable GPI DMA
Date: Thu, 12 Nov 2026 14:23:21 +0200
Message-Id: <20261112-sc7180-gpi-dma-v1-0-2a8eceb49563@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5EQBCF4atIrVWiSTSuIhatulCTDNLFZBJxd
 423+xbvP0A5CCs0yQGBf6KyzBEmTYAmN4+M4qMhz/LSxKGSNVWG4yrovw6dtXVZ+JoNEcTTGni
 Q/xNsu9e69x+m7a7AeV78i3zncgAAAA==
X-Change-ID: 20261111-sc7180-gpi-dma-a77963d9e1cc
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Erikas Bitovtas <xerikasxx@gmail.com>, Vitalii Skorkin <nikroksm@mail.ru>
X-Mailer: b4 0.15.2

Enable GPI DMA controller for SC7180 SoC. This can be used to
make access to I2C, SPI and UART peripherals faster.

Tested on Samsung Galaxy A72 on an I2C peripheral, in particular the
Samsung S3NRN4V NFC module located in i2c0 0x27. The peripheral driver
is not upstream yet, submission can be found here:
https://lore.kernel.org/all/20260811220135.472380-1-jorijnvdgraaf@catcrafts.net/

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Erikas Bitovtas (1):
      dt-bindings: dma: qcom-gpi: add SC7180 GPI DMA

Vitalii Skorkin (1):
      arm64: dts: qcom: sc7180: Add GPI DMA

 .../devicetree/bindings/dma/qcom,gpi.yaml          |   1 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi               | 101 +++++++++++++++++++++
 2 files changed, 102 insertions(+)
---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261111-sc7180-gpi-dma-a77963d9e1cc

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>

