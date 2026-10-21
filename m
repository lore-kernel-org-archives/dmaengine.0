Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616541;
	b=kMDKcFBxH5cUcHXKGBKAB7DPF3zzeMVT3aSVHCND/tbPC2F0ZbFpkDkThN0Zg7LbGoSK
	 jEvqZG573N7cd8Fsp0oHHJ8G3GlcRQVWOnZLRTLWjgq5k/U7kJ1/FK2TJmLNfQqNwrHhI
	 eAVQ4BLU+guYRkGh1MoaR8PNQmRcSh+MBxG3T7PPRDQbR2N2ViCjYRXLtRjbeZTfrt3rr
	 mJ7a1rbpsSC97Tg+JABbz+MhGPN9nDHuyQLSPTaqVAb1i1xVw72AkpcQjc7mbhRpmkrMq
	 xYmP635vJkUDnF5rVEY6kLHQ+5l9JVYz4Pl4O8eA3HMKwbNsA0ct/zVFt4epJBSp+Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=9DKdX40sfVlGrn1f1rpsI16luuxZgM7QgTjRWQCsXog=;
	b=B1PGPjx8Bw3/uhoTkPiPxt64ULDZ8deimbLvkxe5LD05t6TonpZ07DkixTfuf6xOqPfj
	 Y0NIWsY4VTNuAofXywBshyGevosmgt4KN7K8hq2iYmcnpNuWfNeg55EiH/RnNFgAMtoJx
	 KDfLIXEr5wK4L9K2E0iC2+pN7Hd50r+EBAdSMfdjuPcPVz72vVGzhkEjCmAr7G5ar/H62
	 JDs8XWXBdDtlzVxR7s+u3EP0XJf7DApuBG+VP1Nj1s5hqpi0i073AE7sK5ShbTB8zDdGY
	 EcIdL8wWvqu+wYvxuZzPvH4J66HzpOWDb2vvXLfAJU4+/HHT+SWL5+gAsBfhK5OT0uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nGr9rruy;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6000C606A319
	for <dmaengine@vger.kernel.org>; Wed, 21 Oct 2026 21:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6000C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nGr9rruy
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6de1ca1b05aso778530eaf.0
        for <dmaengine@vger.kernel.org>; Wed, 21 Oct 2026 14:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792616540; x=1793221340; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9DKdX40sfVlGrn1f1rpsI16luuxZgM7QgTjRWQCsXog=;
        b=nGr9rruy71G3na/fGIbhHloOneRMl5hpbXWRjZNowxE4fRXwHDVRJg2Ui9jX/hY6bC
         BIzxvyoMCjOia5FTqQGECBSZ7kVfwXQrz8ZWpN53whKYAPKuIYo4oTs40yVWcM9NvgsA
         5+DDb8brDY5rCtxqj9gtSAbkJNuSb1EmjJBLpnb4M4whRokTOttY6m1q6KEEMibRmnC6
         Ec5VCvGdTpVhd8TZRnhqcz8CASOc/NalYC6rxJ8c6d7DVwNOegc/7i2gwPimToHtyUXf
         Et4XPP+rvPaHK9xIBR5K92q1IoPATnV/Gm0R7ZbC474mfCcx++sZYslpW0EPc5QEWJnk
         OmaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792616540; x=1793221340;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9DKdX40sfVlGrn1f1rpsI16luuxZgM7QgTjRWQCsXog=;
        b=I77jC+dnMlR5ps4/QwJOncqWjp0sknTXDTEcbazReBsA4IYVcEmky6MT9MjP2Gy36l
         0AvgPhGI7WgURqCCGPSfk/MBw2ZUZSaNVKSrcd/f1hHNQFFmsd0kve55YVIY/HQcfXuf
         vvOGgJ9T5rn4L3xcGUm2C48LLrxqZE/MxxmZPAgBvaUqPPDz4VYsOo4xbY8IkKrmCR5j
         e0rni+CSFe2T5qVcYAy7JiORflZCwoTtGP7iOAK9+NrZuHprEN/YBm83wsVRO7x303ep
         rZ+T9sybu3OrTvb3otstkicjPgw2NDBZ9+EWGuzxA7bgFd3oQcEbViEyH+soeOnaNHki
         1XDQ==
X-Gm-Message-State: AFq9FYLbQ9U/lNiRzp6jHTldI+7Zkxtmw95BbO1+0wPdJIAgR7bVk7QO
	YDPfS81JDfubp7PSRkCX/2Xp5i9gvqwR5q2IBMlW0vFsuyxT4/yr10CN
X-Gm-Gg: AYBFou1qzBWEPT41uQSAl1BWqGBATzh/bpCLZmUTGv3Um6KZVokaDQYbeIyq0eYjwZ4
	muM6d00Df7e4GxMMrHOlKukaqGDPvy0MaoSXlzKi/lDLP/Pc+HWIOGxEI3L3B/hIeFsV3kAougq
	dy24Rz9+IeGzHD+RZKTwxvQOP73B5Sjfzmit/ANn+404DKj4DOv/BXBF0sQWbMHay8WL878ZxhO
	IUZuYIWbsQYkyUZ6zF8j1eOMy69tkIGrhNOGvuvYxtfuv6VefiSJS4SQaw83vjLjuFweepul+FB
	qaeObTk6ur+un9/Cnne8O1Spk9bD+sCpI5hjGWUcfexY6miqIz/tZikJqRyVqV7nyitT1cjSYpl
	Ask8FN70jVM/bZMqcBwfqByWZtx984qBnScyPnuaogz9RMeSm6c+fOhnaTzWGeqrehbPDbr+R+4
	14iw4+gtvV/6zP8A0yIDuMq9JHaXsePp4EXHlGsTozobTJHT7LDMlpsKohbnzStpYXms/+rq4q9
	XbLiiCr7r8XcYHTQEIZELDGfGkRQwU0EHrDL3cZ/Xv4VxxrhsZwSsyRGI0o2RGb1x3oKIv1ne0v
	hrIsU91CefvBMiUqICCfNPYTJwS0H31JntgQ0lNUw0SgGwebMwA5+p7WZ2l+iAPTG+qHnzIAeKL
	KdTTgcRPVqaq8WhJYS0mHXEwGQlxv95a+rBDcC4oFfLyXrGi/vZ0ldM7QgLmpEK1xpWfJNou9ke
	gVQjo=
X-Received: by 2002:a05:6820:83c4:20b0:70a:6888:2274 with SMTP id 006d021491bc7-70a68883cb7mr438594eaf.45.1792616540307;
        Wed, 21 Oct 2026 14:02:20 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a7d61ce790sm2885699fac.11.2026.10.21.14.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:02:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 15:02:13 -0600
Subject: [PATCH] dmaengine: sun6i: use the channel pause enable bit
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
Message-Id: <20261021-submit-sun6i-dma-pause-bit-v1-v1-1-38d286b69dab@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM2wqDMBBEf0X2uUtNChr6K6UPuWx1C24lUSmI/
 95NfRrOMHN2KJSZCtybHTJtXPgjCubSQBy9DISclMG2tjOtNVjWMPGiIR1jmjzOfi2EQbvNYGd
 cNPHm+j45UMec6cXfv//xPFkFb4pLldZF8PWdvcSxVmokGVjoev6O4wcRv+NjowAAAA==
X-Change-ID: 20261021-submit-sun6i-dma-pause-bit-v1-618c1c3877d8
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The channel pause register uses bit 0 to suspend DMA requests. Bit 1 is
reserved, but sun6i_dma_pause() writes only that bit and returns success.
An active peripheral transfer can therefore continue while its client
expects it to be paused, for example while the 8250 driver reads RX
residue and copies a partially filled receive buffer.

Use bit 0, as specified by the H616 DMA channel pause register.
This fixes the pause request itself; it does not add paused-state
reporting or change the handling of transactions already on the bus.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 7704b016aed8..204b0b812431 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -60,7 +60,7 @@
 #define DMA_CHAN_ENABLE_STOP		0
 
 #define DMA_CHAN_PAUSE		0x04
-#define DMA_CHAN_PAUSE_PAUSE		BIT(1)
+#define DMA_CHAN_PAUSE_PAUSE		BIT(0)
 #define DMA_CHAN_PAUSE_RESUME		0
 
 #define DMA_CHAN_LLI_ADDR	0x08

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261021-submit-sun6i-dma-pause-bit-v1-618c1c3877d8

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

