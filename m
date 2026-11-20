Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202052;
	b=g4/jNRXLCGPqQNlJ91nUEFFebs/DTcbLzELa654JJIxhF+O7oN/61+XuEGeSjAqr/Kmz
	 n3Re1EjQ1m1Yy67Mx6uHV0mYeSVO7D48nqjLVMoNdSTWJ3Yk17+hAHFdamWHGG6BTFC3R
	 odTbXbGoTRa/p3+W3rY5b3BEcw4bN4mTGr2cKX7TO++meEK1v9RTVu3IK+z92s/6H9OSf
	 KL4zOnWuPhuBq6REq/Q6KL63+4CsvxAol0MFrXHVDQlAs2uDQDXKmNSX2MFECPPaM7LQE
	 R4gUH56bAQspx4om0KaNgz0X+Gu6e4Pcr4HkuOBHtemRUSJMpRf9dFc/9207aY/5bvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=U3pz11HTx3wEJXUIblUFMnPhV1TcN7plqKmtgqFKa5A=;
	b=bfvxkQnOTKvvFb5fOQXlq52T9sZWERp/1Z9OohqmkzjjUAz044eAWkz0LENsN+6Pxoa3
	 y6ZEtkxsoj5IPSTfeV2QXbXGglvojsVonrn3SpJMjP95YR/UQAxpMz7rCOk2jWGV2m6qr
	 ALMlrjZWpGA8dQpuLzvcDnxaYNA2wE4oE16qRrKI6eZ8OYiqQnZf3YibFRwtayzWOxiwr
	 4ZZvmSsjW5socjpKOv11onVt9byGQ5MXDBcTxo5gCChEB2yrtsEh++G/hqO0aNN0tsDUU
	 D9511bw4wwHCY9onXIZRdH/8/XqjZeJ9wDEkF5lkPKl4F+phUG4wWCQvYGPGxKMq6eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LElRle4I;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F9160A2617
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 19:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6F9160A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LElRle4I
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7f84a55e31aso851122a34.2
        for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 11:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202043; x=1795806843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U3pz11HTx3wEJXUIblUFMnPhV1TcN7plqKmtgqFKa5A=;
        b=LElRle4IhO0HGc55HrSqtEHcvQCwYE2NHQGfCXGz+MY370KAJ8SELoCUXp9t7dB2E5
         4+YXTrgtKHQv2pwoKpNJGIKPTCrN4JCazFE8LIehS4ElBJC/NTbiDXiirpfdk4FnC3FS
         sa0cVxCcNtSSBsI5zHqCR+/GNB3GF8x6NayhYxSBK8ISYY0U4AIzxN41nn3DqeS2TG8L
         n9wkH/laAyVMT0FgMkrpnSJ/2R1epbnKjeziIS3abS62vpyPBv8thCG1bgOycD1BfprY
         A5Q6BYHEcbIUwSlP/qKueL6Zv1Tysjg8BDOf457Mp/BhyOhFrWERVJds+GHB2mnAgN+c
         4PDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202043; x=1795806843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U3pz11HTx3wEJXUIblUFMnPhV1TcN7plqKmtgqFKa5A=;
        b=CbftbHJhClBVkzaAOgvJYmRxcEnEweSTNzkdPLTc9YXPnE157ZjhPvwUauKpa2Iy0S
         GKnlqASQ/NJGBxYsqwITawiqXRWAf0WJP80xEfuQaJCj4RvCVHo8VBJ3h++f2ozyht7w
         UGvSkn0aUNq0j6U/8jmd6aBxMiNeMbGr6rnrFcxF6ZGHQVKsXH+OuCAzBUHR+V9DYTBk
         mNQZSiIgXja8K87XTcIwAMVHWdG8H35rjtgSjF7JjosFTDaj8CNJmzSkj1l7p8/oK/Vj
         bByEXh0sLK95dZ94R1NY6Z1AqDI+rJl2yGoG9gYNV7ghP6N1SM9WyFITN+ASe4MC0GDz
         3kXw==
X-Forwarded-Encrypted: i=1; AL+hErFpu7RAxS/QTHjwr/zvf2c3pdMALVuCaE7fMRI34dPXyLKggNfK9MUn1K9le1BKH9WewWChHbG3HjY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tve05zWCINhekdadVVAnPmxo57BaMgAPtTGKbZxY1V4ICHhvE
	jNylfrbvQbrBHEav/dfCzt+qMSwLFqV2hOZf/QpUPG/Qk2SwD9IzOhU4
X-Gm-Gg: AYBFou2oqm9FIQLokaMO6LbZFCL4sFBUaet92R6TEBzC6lKRpuXkVMpNmg1J/3Zvh1B
	3/JkesR6WmV3omtfnAoATtuq3JwEbA8h//bSQIOyp4BNAw+VYqkguwPT/cWU0g0DC4vYByQxplF
	gQaYaU4a1dsQ9hKXDx/t1LIbi+nhbG1LKahk2dEA6hQXggbDJrWSW5rWXA3HD4y08EO9q8CB/hV
	ctWhoNR8dZOz6jukn8MfvBflkkMK0Kk/MQzmr3K0o1/xbDPNsyvDagI49CJc6tJ6TLYeWDWUdpX
	zPFSJZV3eGU6MF4RF5wNRCTZZByk94X8wDizg3+lxWTv3nG7gO6Oh3r4YO4KAzvVHWHfDEBZ8dL
	3+ZmZj9Oq/AvXIQPoAPywNnxL6zoP6d7xbGeKDzSrT1Ue+1Rm6EhA2S3lCLsiDWp2zEOvMLyzoZ
	RauAFhy6A3DSJK329x1G8u4FdHLKU/uFZmk1yDOX1t9S0KETebMXLLUR6GS2ehTMacIF9XFXaG3
	LITc9wzR3xXy+lqkAiHVNhHxERwbFPcsP/mRDeDbkFalNbr7AePkTp0mSY6s0ERdjwqhxpJY80+
	zkbgXaYiM3Mmcpjl3cLzJdckjh5egpyb5xrZ8gagKaKMfTpTlHcn8/Nra0U3s3IibykYLt7UeMB
	LJpRYXBiwOZhIfZpbRGO+knEGJziNJLw/go0G34h34TRpQ0zr33vst/tPwmkemxDJNmbHiJrnaX
	r06sJMSW6w+AiSsaT/+y4dqh5DZwpfA0hnHSws2cN5bH3bqWK3OBwl
X-Received: by 2002:a05:6830:640e:b0:862:c172:769c with SMTP id 46e09a7af769-86315ab1b56mr5230953a34.29.1795202042690;
        Fri, 20 Nov 2026 11:14:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f3964sm2654782a34.14.2026.11.20.11.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:14:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 12:13:53 -0700
Subject: [PATCH v9 3/9] dmaengine: dw-axi-dmac: retain descriptors when
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
Message-Id: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-3-48ab58961d6e@gmail.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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

