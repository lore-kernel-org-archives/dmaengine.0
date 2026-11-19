Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104111;
	b=QSQ2++dbKPxUSXmYNuE/3uKTFcE8PrNv+OJOIaXWnYi2hbO324FyBA2befMfFaBbp4sV
	 i2BLPaUnfmtpYU8XdU/Bds82464efbRSnDTYMTWsepRPNvFM4cL+Zm4EZOZ+xVNFB70Sm
	 a0N9h+HNnP2z7IBoBfv05IPogMUfjmaIRpnc9dyH9BAmz0LhiZJdIhWcAFp0fNJnsLap7
	 zYEe8whUCZvV7yjGuPDifjqdEPCcor36KVDfThKxXJcwVFoVbBXlIUXfZf8Dv82H4aNJ1
	 PwtpYnG02vZ/J48ImbhsPRuvSATCD/aRY12Z0TaHjvUvXaSGPaGnjqeC6zOfP6iJ7RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=aV02K7POjUQdpzVMLX1IIwtAJIBw0/JKJjqJMtm26W8=;
	b=kSVvXNn4w8ODa+PClRTysvONP6EG0aPqraxLWewmrDh0bC7Ys2EkbQJruqajdJRxXRc3
	 Vku4yUhsIVbPTCeGM+UsFYWOpIHzUOZFi5eEwd+v0g5PZgnPKPfnZxcFgbfQ0B3rKtI28
	 TaoKdPj5MIuyyynBH+pHAqwTdCStZLKCnPDgvV2nv2YZXygyZR4VCqvssYMzM0btSZNec
	 TrkvM86T02q2i3sxupY3CahaQk/eBlT29uNJ8/wKIz5jCTKxwwfscAtARnULeIZfh0bes
	 xyXwpQ20IcKIl5VkviZGZ7YExY9Yc8fjcS3AT03A82sNytikLS86DySuC+Hh66FKYvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SHNxJ5Rz;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7429760A2616
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 16:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7429760A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SHNxJ5Rz
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b2d14968c9so23058697b3.0
        for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 08:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104110; x=1795708910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aV02K7POjUQdpzVMLX1IIwtAJIBw0/JKJjqJMtm26W8=;
        b=SHNxJ5Rz6m9M6ibwX1PpoV0iR6Z2biKXg0buZWVV4/dTD3uyanyG0DuwB5KGIHEmbG
         nHCMAoptTfCxeieIrhdGHiqHyUjaWmEju/BXWuOIioCSDeErhylTlkQGJVvrdNTEr6Ue
         BXWeyOC4Mh76Ya8kugMSQyah+DQvSPLsq9lIY5bCjACpEGSBXDSNpiHyPeeG/FPvrZzJ
         K45vJJjG8hJY8XHCSOWW+znRFChP/Auie0w4j+WIkZilCHNSYb/yy/KfT8ULyy9xQGtz
         ED8ROQCy5QlBY+HXlQvM75N640gbDSwCMbKtCuXBxzgNp5HHTAgJUWj3EDOV3PZj/ng8
         oL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104110; x=1795708910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aV02K7POjUQdpzVMLX1IIwtAJIBw0/JKJjqJMtm26W8=;
        b=KprNOeZoMJwwjnv9wrUErJEdePEmdH+GDBnnUeoQipYUjZ6TFuCEiekRf13L2tiag1
         rYmoiO+Kc7XLL8gAO6engG8R2M/yer921D49KkHBYij8yPhK2kM9p8WoEWeYMt011p0V
         NiP+bdGoU+3x3uIMfdK4mwYwW4QwVICF6vwZBtuZQ51ZBL6ixromFpm9npPq0q9OMJ1J
         XIYDbGoiJQEEzTJy/2xcnF0i0UMdbAsjvGIkHtZTBf1+Et7Si30UIJkqtAYzACpw98Od
         owzbtU8M84xelZSZYG1meIpfZt9go+OJ46lWChniVaTrJrN0TZ8srwyOeH9nBhXe6wg3
         FKgA==
X-Forwarded-Encrypted: i=1; AL+hErF9NNNHAFTKo7eK5lrArMT336iaKCFNrZyarS/oLI04O4MxO3+hANmqhYSdizA+zaMF0zvRWumM+RU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8V/PKAAbuTT18Hh0Iiw5x53t5rZgB5EsXTi6H+UKvGdROgcypR
	asrVVhI7EmDnGI+HSAZQ1eeNCosGaIZbjNbOlbvY29qndHEGZu+lyy+W
X-Gm-Gg: AZFdTZcuC/iPNQDcANRMCcuEkdZ0aXWZWQJedYGpLde4Yc78ort8M0Scp4PJkp8vG56
	b6GFRw7+I8UGCgu6eI+wzNnHDcA2vw/MSiA1Ec2ghyY3pjSjCOZLOBpNojokn6ou3g3lbcGE4Gv
	Zc5ejSSMYRz4hsNTOOXks2wV9btNkYGpKJwGYHOZUJjpTdvKOqcYteI/7iJk5Pansh7/EOLjhWx
	gkoNTLF+H22lDIDgVdeY6z9AwLET8A25zG9LQBTEQjXm6sqYKWq5BTIJzCKpq6urU6FE6wABOwJ
	RiXEK7q/AiIVuiAAFmFThxXtcIQ4onSCzL3EEI0N6gAfF6ThzMonLSYCn3BqTqbAU2ZoJsvRaa/
	XrLbedAp3Opsj9M04lnCiLHECEgZk0OJfmnjhSMNdpFOLAUIPIijgIs2oGCazg0SmBMnpLD2TVM
	qOWeXGG/91kFH8alUp2Q4iYmPxuw3HaAdakI/S0Qwe62uPkNDSDl5UVvcw5FGzI89ttuZzcItEX
	EuGJwGKhvP0+9K7otgyBUKcnorhKiWsk3lYcAS4wIpa2aIB3n3rbWDG0rz1IDLFYgl0ZqXzUK4W
	P72dKNmgjr6eTb01+aGEyWQQ+VYRlRg2VwgMHBIa9Tr3rub0ZkB/Dg4VpkUYXwm53SWa1Hep8cn
	pwrMTgfPuKUPBgBRqDPSAsgyj/lVvjNtNhQFoClPeyr7uPRVYrWfT2nTYRfQbPhLT+FuNpSZqoZ
	a+gnlHnLSt32g5qmLA2GynyTqMJWjrBPxVQbE6+RudgmkIaznkiYVcrdaMDHlY5F+xtWY4azmP
X-Received: by 2002:a05:690c:63c8:b0:8b4:cb03:c8ed with SMTP id 00721157ae682-8b5204d5e7bmr651417b3.46.1795104110368;
        Thu, 19 Nov 2026 08:01:50 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52031aa4bsm623267b3.34.2026.11.19.08.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:00:58 -0700
Subject: [PATCH v8 3/9] dmaengine: dw-axi-dmac: retain descriptors when
 termination times out
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
Message-Id: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-3-f8e7fe60594c@gmail.com>
References: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
In-Reply-To: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>, Baruch Siach <baruch@tkos.co.il>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.17-dev

dma_chan_terminate_all() warns when the channel enable bit does not clear,
but then frees the descriptors and returns success. Its synchronize
callback only drains virtual-channel callbacks, so terminate_sync() can
also report success while hardware still accesses the transfer.

Return the polling error before detaching descriptors or changing the
peripheral routing. This keeps the transfer resources available while
the channel remains enabled and lets the caller retry termination without
treating the timeout as a successful stop.

Hold the channel lock across disabling, polling and descriptor detachment
so an interrupt handler cannot restart the channel between the stop check
and cleanup.

Fixes: 1deb96c0fa58 ("dmaegine: dw-axi-dmac: Support device_prep_dma_cyclic()")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 37 ++++++++++++++------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index f17a71183050..def591fc75ce 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -9,6 +9,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dmaengine.h>
@@ -1180,30 +1181,32 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 static int dma_chan_terminate_all(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
-	unsigned long flags;
-	bool enabled;
 	int ret;
 	LIST_HEAD(head);
 
-	axi_chan_disable(chan);
-
-	ret = read_poll_timeout_atomic(axi_chan_is_hw_enable, enabled, !enabled,
-				       1 * USEC_PER_MSEC, 50 * USEC_PER_MSEC,
-				       false, chan);
-	if (ret)
-		dev_warn(dmaengine_chan_dev(dchan),
-			 "%s failed to stop\n", axi_chan_name(chan));
+	scoped_guard(spinlock_irqsave, &chan->vc.lock) {
+		bool enabled;
 
-	if (chan->direction != DMA_MEM_TO_MEM)
-		dw_axi_dma_set_hw_channel(chan, false);
-	if (chan->direction == DMA_MEM_TO_DEV)
-		dw_axi_dma_set_byte_halfword(chan, false);
+		axi_chan_disable(chan);
+		ret = read_poll_timeout_atomic(axi_chan_is_hw_enable, enabled, !enabled,
+					       1 * USEC_PER_MSEC, 50 * USEC_PER_MSEC,
+					       false, chan);
+		if (ret)
+			break;
 
-	spin_lock_irqsave(&chan->vc.lock, flags);
+		if (chan->direction != DMA_MEM_TO_MEM)
+			dw_axi_dma_set_hw_channel(chan, false);
+		if (chan->direction == DMA_MEM_TO_DEV)
+			dw_axi_dma_set_byte_halfword(chan, false);
 
-	vchan_get_all_descriptors(&chan->vc, &head);
+		vchan_get_all_descriptors(&chan->vc, &head);
+	}
 
-	spin_unlock_irqrestore(&chan->vc.lock, flags);
+	if (ret) {
+		dev_warn(dmaengine_chan_dev(dchan),
+			 "%s failed to stop\n", axi_chan_name(chan));
+		return ret;
+	}
 
 	vchan_dma_desc_free_list(&chan->vc, &head);
 

-- 
2.53.0

