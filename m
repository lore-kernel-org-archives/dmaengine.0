Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202044;
	b=JQ1/lIJXXGer+Humzldu59ILGRMQn366x7o70moHIHgP13p+2PQ3Qyag6ooasvobpX3m
	 5WTLsckR6g1F3KCxMojlxG4qBqi4YVESkwZUwKwPpni0Wwu8Px2MZSmAva/yN+a9w2eGJ
	 WAGRCDnyGfBm8VygjrNlAFuaM3NnTSwuiOpwuPBsftODkML2qrIx+NxWaqQqXjVT9otdq
	 4pyzV1GaB1jINXdafoLt9PA4rnPL09HmWMazB9WO2/mlkv0lEZWC9tEcsp/L04OENThTl
	 h7hphnrBBV9sXfjyCQSgbq2Nw95isfG5EnlzQTvBe3Y29pffPxVPS6x4Nuwkw9W696g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9b6+vzAhRKtQhjqw9swKPNAviMKOXHv6Fk81En8ghXE=;
	b=MgoTGr4FVVULawcq0xH+sC8+qb/Qoia3qOSPTBLIHhsiCvYtUaZsnCe9AfG4ovsOlSbp
	 UY0pxdCj2X4A2RpcxBCn9uLbJfM1l6XZ5sNhGCuIdQ13EIp+FvnXUceKgliwgzqcgPFRi
	 L7TJO7h2Ym9rCmdwR2mT9cnWTqN1KsmJr+Kf4LujHsRNxOBvjxBYEHZuoPRlOmhRXxDTG
	 4MGNqcZFqzF+vd7YUm8NYMh2cMBfSDb1sO0d3BHUbaRDEMu0AaA1opu07oU6xNF1XRw0y
	 Ee7x/ghvLc50Pzs+fPjtW7ul627vmoZEEo33D16iHw0cjdaPM7tAcVgevnnPQ+QxKCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dQt3Sk82;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD7E60A2621
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 19:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBD7E60A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dQt3Sk82
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6e560e00a86so812317eaf.1
        for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 11:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202042; x=1795806842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9b6+vzAhRKtQhjqw9swKPNAviMKOXHv6Fk81En8ghXE=;
        b=dQt3Sk82CrlVQI1D6TBRa7FG1VF7RHeczAxMoicoTfJCU5zL7183TFGDg3HOn9/kqb
         p9/Ro7a5AQAnTU+MvxP0n2PKBdhzSUxHjH0UYSFJjppsaziT/xoFCIUhjFrmk5I8qp9l
         egjvoVQi47XU/cTbu0ULF2sYaLd3ZHyykxwnNTaqU7ViWYsPBnSqIvp5jpIYCZF8Fa2j
         ZkzLkGrXBcO7GN/YEZ1TWHW2lBS8YFoyMtnhC5EEjLsq5gWk5c3gJXBLtmqzW0ZHio3Z
         C98QcPm1njJxh6bhs5Zlwm0TEO+U2tdHRehZkfO01IwgPnlSyEqox+LZtnJhASFpCoWA
         WEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202042; x=1795806842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9b6+vzAhRKtQhjqw9swKPNAviMKOXHv6Fk81En8ghXE=;
        b=Pwbc0mqkJCfQesLqU7TZt/2uaXGgeJLzVMwB5eKyhp0Zzt58kumrXa/6P0DXDrUnNf
         WrEjCQryZ1l9hYGPu+MBiDQxnfkR5QsNtui5Bq2pnieV4eon/VXz/ED2KFl7DHBlExiT
         mbcUKSWD4uA5+7hJbEWThQWdtYmDV5idewfPG04zuvzjsUzUH6wHiTB3XKAIT1SL95el
         VLBa97zNy5mrnrtQTHPIGcul9/bCgFDGH7OxN0bVSorMkyPWs6p+7PC1h1QRcgy7oeGq
         t6lqoL8pyrC8T1xuBYazxKhck/ayebnYcmLTjwChE0KMEJHCxnfMOrm+1F++7ACyq+W4
         HjvQ==
X-Forwarded-Encrypted: i=1; AL+hErGJVdKacJ6EEi2oMcSd4WadZk82HuCJAwvVhlnpHAdOF9KnV4SHyXmCk0OtIqTvXrzVNVKswjqXvrk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9idkejsDMsn3QKV+Sld6BsrVJS47PfX5+GF9O6Gqilr7fYyK31
	r9nHSsdfXAlOLhoO01lLMnOIGsxCK4PUfVbwDAUJhCiPsOUEvFP7nnrY
X-Gm-Gg: AYBFou3EutDUbIy/LHpSe4LzzGQDTKpXCzqS3Sj0k4CAbqRx1WbTnRDPte9jmw3EIXL
	h+2wlwjUq2PjRQDGfWZ9r/HKH8eItEyTNz0QpRImsmngnGkLd9VrlBDX6LZI2fXeAch5rnvs41E
	wJIjfEFLGdGqTVAZqd4Z/kP9VQMDZh+7agYGstMZ46UjmqcwXgWBvoSmT0JfBh2OBqjgHre9oib
	sLcNoz0idl4katu1N5rUGN424Lu3bC3Gob03HIEdqnpK5XCjHVZeLGvEPPxUmXHANMe+6mMaOqC
	tzsU0VKYFfZoi/N/ZcSpx6nRga0zzJ4pd05nDtD6SD/lWeuIxVWw1Twjs0uypVmtouVzoOma6O7
	4XTyagngWJ+j5uxHdYhgnQx1ye7sq7tcJyZZUD7b0n02sL9oMdzGeUaDJm9RsaFXrC15vvzGHEi
	6DIfmZyDvOWfVdenR3QO1MK3J6HXokTXYurFOubXVPbATLPHAVN1P31wJuLXhuXFpav/OB4c5lV
	rb9ASHCupwsM0c3Y1y2GXTvh1jbp1EjQ+KmQ0n8ow1pOtJ8uEtVmI5DKwyRo9d1nGVFwTjdM7Sc
	/jx8+9esNaFGc4WVLCw9cuoO2tkEYFR3TAPRXwdBVJfoKuKXHJbUEAq3KTWx3sKSBo+J3hadBEh
	uhScxAxuAJ/vDFLzqp3ryDrCdM/YolCBCskgPITd+BS+tjM38MAzI9rQ1rk0OEyWZ5eC3mbvjuu
	S4vIC1jfxpIGus2NqbE6CGyw7XDdb8BUVVG+uwlucbSa17Rll6yRkM
X-Received: by 2002:a05:6820:f021:b0:6d8:bba5:658a with SMTP id 006d021491bc7-71b39566733mr3401867eaf.43.1795202041829;
        Fri, 20 Nov 2026 11:14:01 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f3964sm2654782a34.14.2026.11.20.11.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:14:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 12:13:52 -0700
Subject: [PATCH v9 2/9] dmaengine: dw-axi-dmac: poll the correct enable bit
 during termination
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
Message-Id: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-2-48ab58961d6e@gmail.com>
References: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-0-48ab58961d6e@gmail.com>
In-Reply-To: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-0-48ab58961d6e@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>, Baruch Siach <baruch@tkos.co.il>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.17-dev

For channels 16 through 31, the channel enable bits occupy bits 32 through
47 of the extended DMAC_CHEN register. dma_chan_terminate_all() only reads
the low word and tests BIT(chan->id), so it can conclude that an upper-bank
channel has stopped while its actual enable bit remains set. Descriptors
can then be freed while hardware still owns them.

Poll axi_chan_is_hw_enable(), which already handles both register banks
and the smaller channel layouts, instead of constructing another mask.

Fixes: 495e18b16e3d ("dmaengine: dw-axi-dmac: Add support DMAX_NUM_CHANNELS > 16")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 6dae63024721..f17a71183050 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -28,6 +28,7 @@
 #include <linux/property.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/time64.h>
 #include <linux/types.h>
 
 #include "dw-axi-dmac.h"
@@ -1179,17 +1180,17 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 static int dma_chan_terminate_all(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
-	u32 chan_active = BIT(chan->id) << DMAC_CHAN_EN_SHIFT;
 	unsigned long flags;
-	u32 val;
+	bool enabled;
 	int ret;
 	LIST_HEAD(head);
 
 	axi_chan_disable(chan);
 
-	ret = readl_poll_timeout_atomic(chan->chip->regs + DMAC_CHEN, val,
-					!(val & chan_active), 1000, 50000);
-	if (ret == -ETIMEDOUT)
+	ret = read_poll_timeout_atomic(axi_chan_is_hw_enable, enabled, !enabled,
+				       1 * USEC_PER_MSEC, 50 * USEC_PER_MSEC,
+				       false, chan);
+	if (ret)
 		dev_warn(dmaengine_chan_dev(dchan),
 			 "%s failed to stop\n", axi_chan_name(chan));
 

-- 
2.53.0

