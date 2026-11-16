Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794808882;
	b=XMsL4r222OBjgU5ihwmecG3eRxFODPx54/wvUJI0bcpkt7ugbIDELfb96Hyljd7BhJyr
	 Pns/MTic7N2XZ0W9/d3K2X8aHRXZCk+O69PPTW1pthz7qLdEZDwjAol+eg+a9VlTmH+YD
	 uPxpfSoCE/ahr8hg91ulZa/Ug1YKqMtzeJF1foQGRC8MG6/LlbqslKmxLinRXMZlT37vK
	 YteDx4GZISqsym/ZrjOxAd4QkRg+ltn5AYWI/jW/xhL2LGYsuxpx5QkVE7putKWMywVbY
	 4O2liMNZQ1rUzO6qlqb4JXMT9uqUz01ALxfGZ13PL2gpV732r7q2DrDlrW/jZv1A2eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794808882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=AOVjVYWiGu1+2CTZWPQd/l37VMMlzCbF4uz2qUZJc8U=;
	b=HOJf0n0NFy6Y6VqrApvJCJvpZNnGYXjLJn1BeRqWsCOzEMPfgGFjbnYRXAfgfyQaSJXf
	 Y+PQJ+u9IkNPlHJbFwqWDj2DRdWN8Hpghgc59IxkqeBt/8Gy3M3CGQlCqg0jc0e6Fvl92
	 FFaNlBQLGyHn/D2S9PyQQtuZ5dAL7y+EcqsCPcMRzIj7g4QvIzk55Q5m/E+KtQt9eFady
	 hrlo9luF4cnqnW2zBGzHHU+4WA6tNt5CDUJ+Geyon52JQ5LBEtbTBrbH50Nv9f41RBoAQ
	 vVs/8yuBa05veGki0zp6F1Qp5VZYHGYq8mUM97cBW4QsmhoGvKVvobywG75kRYpw4Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="P/En0gAp";
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD667606A883
	for <dmaengine@vger.kernel.org>; Mon, 16 Nov 2026 06:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD667606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P/En0gAp
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6b1afdf5196so1041460eaf.2
        for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 22:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808880; x=1795413680; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOVjVYWiGu1+2CTZWPQd/l37VMMlzCbF4uz2qUZJc8U=;
        b=P/En0gApUmL5JhFwKBSaELY/MyPtlTG9oUUc0wNQR7tScXvNx5NPcpZYtaPjCOuY0V
         EDAz5K6zAy2NyvfeADsaEc5U5TRNrQKw5LykSnWVojGoqySha/TLWQ9yUcgS7LPZelzh
         TgIbcvM1useOztFvhRS1oqywlg13+TWdsFy7hAfeheFrync0py+c1+JGBnPVmDgxyVsD
         w/HQU5KEtHMNBziDhQihNh239boXBdQU6tyXnETicm1aPtN3DDrMNtPOaj/C2zy+QVt5
         QgJeiC2GK1XEbVc70GGDVYZAN6xFmjP76YEqi6eRNEPlocHD6UhOMKgKU6iunGsYg2Q3
         bRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808880; x=1795413680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOVjVYWiGu1+2CTZWPQd/l37VMMlzCbF4uz2qUZJc8U=;
        b=YapatZxVQjn6Q4bQmWpqlIX+soa9puayseCa7faPe6f0DUf4/2p06vpMWR1yVgp8q+
         Ho0eYTArqiwhYnCmxjod2EwMd+ZnSwC7MnNhmIuaWCkiIMYQ6sUbogdBqol4sdIWTBTC
         R5zet619hxwZi5RdmHOtND/teFHIj2y7tYXluIjMXdeqYPh027usWlzdai/I0JUk9X3h
         6Bj4Cvcx6QT4BUJDRL8IfzmcNCtKqrGTDZy4b6nZwYwtHoHbMngpWkeKF2qD69y1MUBS
         KD7LO7vozp5+K/vzgXCIOWDxLGpbHmsfYTQ9n06dljVO7tmiizQtQ5gMLRK60SeWtSwO
         iqYw==
X-Forwarded-Encrypted: i=1; AL+hErF00hPHZGxL9IYDEBjUfrph2P3Os+1oakO6N96snPOa8rw6UV8QFsBfjZPkpAIPvnz7qcZPDQL+Q7A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mBEv3E9Ou1LM+4xvW/xBvP5o2DCiGs6kO6edwdmYOBP1U9sYN
	E0Jomtd+FhLrE/zu/0MEJqRqiKJ52co6R81TY+bJ3TmZfCR8VTBHOyW6
X-Gm-Gg: AYBFou2ixKg3iriIqpzE/5A77tDPwYLeGVT0qtftdbucVouGydFWaep7fnfsnfIayI7
	83c4t/0Htx63V45+ABLE5quFNoLypYvOm5+MHDAQUXCl6MNxnb/qIUBttIclO6IHLR0jABhizD/
	ynmzOBoSq0FkPrtvo38b3SDwHubo6BZP8pYk9qvxOtf8P8PwFU8/cFAsFANVvb3d+a1d4ElqWGK
	4RjNnD0A+XptZKjrHCiFxTJsLrMcqpXIGb1TityOEWvI6nNWeelYehkYh3Pt6FUfBGxRI624X96
	2MY6lvmeMRl18qmgeroi5/E8IifKTA+rD/vzL5hAEG6xcvpOFs4/LXdHtqenBcU7/ogqFFdW2ys
	tCinNoZL/ukUcVVZvQJ5LrtDB6mAeOwyhCstKWVKDK7WG0Yr5pHCTmngekzsCmAW0KRJCq100mL
	CVvDZSGZu0hNneXbg6qNffsTesFVueMOCE60FWWcVO/yX2Q+3ldIS5wf9vhjwn3W0YuDS2e72V9
	7SL5v0xXJJYxb22z3vvqpzIFf0j39nWb7ojjryE6BlmxjAgd2A60rsSq+t1DzhQCxv09hq/4uB4
	qSJPHanLGvQ5sCTsquptkYdQw+h4xWmuFJbzkEOCz3Fcikrb6+H8J5nulZaw/T64OiYyieIT1g8
	fVXIjnEbVhGox1wTxaETmhrpeDYdp/KgLmTrSsTaUaNfVrluMrBgF3GsCB+cwlQxDHczHlF/yM9
	588GPPPRcBM9kuDeewont9afY0eM165fcYNsadCz3t1W8eYc403X0=
X-Received: by 2002:a05:6820:c5ca:10b0:6dc:8f59:6ba7 with SMTP id 006d021491bc7-71ab522206fmr3884129eaf.73.1794808880626;
        Sun, 15 Nov 2026 22:01:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862881a965esm9375160a34.25.2026.11.15.22.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:01:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:00:43 -0700
Subject: [PATCH v6 2/7] dmaengine: dw-axi-dmac: poll the correct enable bit
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
Message-Id: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-2-bcb23d1e7029@gmail.com>
References: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-0-bcb23d1e7029@gmail.com>
In-Reply-To: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-0-bcb23d1e7029@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
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
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 6dae63024721..405ab9a78955 100644
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
+	ret = readx_poll_timeout_atomic(axi_chan_is_hw_enable, chan,
+					enabled, !enabled,
+					1 * USEC_PER_MSEC, 50 * USEC_PER_MSEC);
+	if (ret)
 		dev_warn(dmaengine_chan_dev(dchan),
 			 "%s failed to stop\n", axi_chan_name(chan));
 

-- 
2.53.0

